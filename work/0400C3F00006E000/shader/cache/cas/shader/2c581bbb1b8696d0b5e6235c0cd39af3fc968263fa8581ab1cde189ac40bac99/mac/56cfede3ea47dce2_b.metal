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
    texture2d<float> fp_t_tcb_12 [[id(5)]];
    sampler fp_t_tcb_12Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_A [[id(7)]];
    sampler fp_t_tcb_ASmplr [[id(8)]];
    texture2d<float> fp_t_tcb_18 [[id(9)]];
    sampler fp_t_tcb_18Smplr [[id(10)]];
    texture2d<float> fp_t_tcb_1A [[id(11)]];
    sampler fp_t_tcb_1ASmplr [[id(12)]];
    texture2d_array<float> fp_t_tcb_C [[id(13)]];
    sampler fp_t_tcb_CSmplr [[id(14)]];
    texture2d<float> fp_t_tcb_10 [[id(15)]];
    sampler fp_t_tcb_10Smplr [[id(16)]];
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
    float2 _1390 = float2(_91, _93);
    float _97 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1390, float2(0.0), isnan(_1390))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1390, float2(0.0), isnan(_1390))).x;
    float _99 = _93 + (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float2 _1405 = float2(_95, _93);
    float _101 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1405, float2(0.0), isnan(_1405))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1405, float2(0.0), isnan(_1405))).x;
    float2 _1413 = float2(_91, _99);
    float _103 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1413, float2(0.0), isnan(_1413))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1413, float2(0.0), isnan(_1413))).x;
    float _105 = in.m_59.y;
    float _107 = gl_FragCoord.w;
    float _109 = _105 * _107;
    float _111 = in.m_61.x;
    float _113 = gl_FragCoord.w;
    float _115 = _111 * _113;
    float _117 = in.m_59.x;
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
    float _159 = -_103;
    float _161 = fma(_159, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _163 = -_101;
    float _165 = fma(_163, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _167 = 1.0 / _165;
    float _169 = 1.0 / _161;
    float _171 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _173 = _157 * _171;
    float _175 = _173 * _141;
    float _177 = _173 * _145;
    float _179 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _181 = _167 * _179;
    float _183 = _175 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _185 = _175 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _187 = -_177;
    float _189 = fma(_181, _143, _187);
    float _191 = fma(_177, (*spvDescriptorSet0.fp_c3)._m0[32].x, _183);
    float _193 = fma(_177, (*spvDescriptorSet0.fp_c3)._m0[30].x, _185);
    float _195 = -_173;
    float _197 = _195 + _181;
    float _199 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _201 = _169 * _199;
    float _203 = fma(_173, (*spvDescriptorSet0.fp_c3)._m0[32].z, _191);
    float _205 = -_175;
    float _207 = fma(_181, _147, _205);
    float _209 = fma(_173, (*spvDescriptorSet0.fp_c3)._m0[30].z, _193);
    float _211 = -_177;
    float _213 = fma(_201, _149, _211);
    float _215 = _203 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
    float _217 = -_175;
    float _219 = fma(_201, _151, _217);
    float _221 = _209 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _223 = -_173;
    float _225 = _223 + _201;
    float _227 = -(*spvDescriptorSet0.fp_c3)._m0[33].z;
    float _229 = _215 + _227;
    float _231 = _197 * _213;
    float _233 = -(*spvDescriptorSet0.fp_c3)._m0[33].x;
    float _235 = _221 + _233;
    float _237 = _207 * _225;
    float _239 = _229 * _229;
    float _241 = -_231;
    float _243 = fma(_189, _225, _241);
    float _245 = _189 * _219;
    float _247 = -_237;
    float _249 = fma(_197, _219, _247);
    float _251 = fma(_235, _235, _239);
    float _253 = _243 * _243;
    float _255 = -_245;
    float _257 = fma(_207, _213, _255);
    float _259 = _175 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _261 = sqrt(_251);
    float _263 = fma(_249, _249, _253);
    float _265 = fma(_177, (*spvDescriptorSet0.fp_c3)._m0[31].x, _259);
    float _267 = fma(_257, _257, _263);
    float _269 = fma(_173, (*spvDescriptorSet0.fp_c3)._m0[31].z, _265);
    float _271 = rsqrt(_267);
    float _273 = _269 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
    bool _277 = _261 > (*spvDescriptorSet0.fp_c3)._m0[41].z;
    float _279 = _249 * _271;
    float _281 = _243 * _271;
    float _283 = _257 * _271;
    float _285 = _269;
    float _287 = _249;
    float _289 = _215;
    if (!_277)
    {
        _285 = _221;
    }
    float _291 = _285;
    float _293 = _291;
    if (!_277)
    {
        _287 = _273;
    }
    float _295 = _287;
    bool _297 = !_277;
    float _299 = _295;
    if (!_297)
    {
        float _301 = -(*spvDescriptorSet0.fp_c3)._m0[41].z;
        float _303 = _261 + _301;
        float _305 = _273 + (*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _307 = rsqrt(_251);
        float _309 = abs(_305);
        float _311 = abs(_303);
        float _313 = precise::max(_309, _311);
        bool _315 = _313 >= 16.0;
        float _317 = -_273;
        float _319 = -(*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _321 = _317 + _319;
        float _323 = _321 * _321;
        float _325 = _235 * _307;
        float _327 = _229 * _307;
        float _329 = -_235;
        float _331 = fma(_325, (*spvDescriptorSet0.fp_c3)._m0[41].z, _329);
        float _333 = _303;
        float _335 = _305;
        if (_315)
        {
            float _337 = _303 * 0.0625;
            _333 = _337;
        }
        float _339 = _333;
        if (_315)
        {
            float _341 = _305 * 0.0625;
            _335 = _341;
        }
        float _343 = _335;
        float _345 = -_229;
        float _347 = fma(_327, (*spvDescriptorSet0.fp_c3)._m0[41].z, _345);
        float _349 = fma(_331, _331, _323);
        float _351 = abs(_339);
        bool _353 = _351 != 0.0;
        bool _355 = isnan(_351);
        bool _357 = _353 || _355;
        bool _359 = isnan(0.0);
        bool _361 = _357 || _359;
        float _363 = fma(_347, _347, _349);
        float _365 = abs(_343);
        bool _367 = _365 == 0.0;
        float _369 = abs(_343);
        bool _371 = _369 == 0.0;
        bool _373 = !_361;
        bool _375 = _371 && _373;
        float _377 = sqrt(_363);
        bool _379 = false;
        int _382 = as_type<int>(_347);
        if (_375)
        {
            bool _384 = as_type<int>(_343) >= 0;
            _379 = _384;
        }
        bool _386 = _379;
        int _388 = _386 ? (-1) : 0;
        if (_375)
        {
            int _390 = _386 ? 0 : 1078530011;
            _382 = _390;
        }
        int _392 = _382;
        int _394 = _392;
        if (_375)
        {
            int _396 = int(0x80000000) & as_type<int>(_339);
            int _398 = _392 | _396;
            _394 = _398;
        }
        int _400 = _394;
        bool _402 = !_361;
        bool _404 = _402 && _367;
        int _406 = _400;
        float _408 = as_type<float>(_400);
        if (!_404)
        {
            float _410 = abs(_339);
            bool _412 = _410 != as_type<float>(0x7f800000u /* inf */);
            bool _414 = isnan(_410);
            bool _416 = _412 || _414;
            bool _418 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _420 = _416 || _418;
            float _422 = abs(_343);
            bool _424 = _422 == as_type<float>(0x7f800000u /* inf */);
            float _426 = abs(_343);
            bool _428 = _426 == as_type<float>(0x7f800000u /* inf */);
            bool _430 = !_420;
            bool _432 = _428 && _430;
            if (_432)
            {
                bool _434 = as_type<int>(_343) >= 0;
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
                int _450 = int(0x80000000) & as_type<int>(_339);
                int _452 = _446 | _450;
                _448 = as_type<float>(_452);
            }
            float _454 = _448;
            bool _456 = !_420;
            bool _458 = _456 && _424;
            _408 = _454;
            if (!_458)
            {
                float _460 = abs(_339);
                float _462 = abs(_343);
                float _464 = precise::max(_460, _462);
                float _466 = abs(_339);
                float _468 = abs(_343);
                float _470 = precise::min(_466, _468);
                float _472 = 1.0 / _464;
                float _474 = abs(_339);
                float _476 = abs(_343);
                bool _478 = _474 > _476;
                bool _480 = as_type<int>(_343) >= 0;
                float _482 = _470 * _472;
                float _484 = abs(_339);
                float _486 = abs(_343);
                float _488 = _484 + _486;
                int _490 = as_type<int>(_339) & int(0x80000000);
                float _492 = _482 * _482;
                bool _494 = _488 > as_type<float>(0x7f800000u /* inf */);
                bool _496 = isnan(_488);
                bool _498 = _494 || _496;
                bool _500 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _502 = _498 || _500;
                float _504 = _492 + 11.33538818359375;
                float _506 = fma(_492, _504, 28.84246826171875);
                float _508 = fma(_492, _506, 19.6966705322265625);
                float _510 = fma(_492, -0.82336294651031494140625, -5.674867153167724609375);
                float _512 = fma(_492, _510, -6.565555095672607421875);
                float _514 = 1.0 / _508;
                float _516 = _492 * _512;
                float _518 = _482 * _516;
                float _520 = fma(_518, _514, _482);
                float _522 = _520;
                _408 = _488;
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
                if (!_502)
                {
                    int _538 = _490 | _536;
                    _408 = as_type<float>(_538);
                }
            }
        }
        float _540 = _408;
        float _542 = fma(_540, (*spvDescriptorSet0.fp_c3)._m0[41].w, (*spvDescriptorSet0.fp_c3)._m0[41].z);
        float _544 = -(*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _546 = _377 + _544;
        float _548 = fma(_325, _542, (*spvDescriptorSet0.fp_c3)._m0[33].x);
        float _550 = fma(_327, _542, (*spvDescriptorSet0.fp_c3)._m0[33].z);
        _293 = _548;
        _289 = _550;
        _299 = _546;
    }
    float _552 = _293;
    float _554 = _289;
    float _556 = _299;
    float _558 = fma(0.5, (*spvDescriptorSet0.fp_c4)._m0[1].x, _91);
    float _560 = fma(0.5, (*spvDescriptorSet0.fp_c4)._m0[1].y, _93);
    float _562 = fma(_552, 6.2500002968590706586837768554688e-05, 0.5);
    float _564 = fma(_554, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _2115 = float2(_558, _560);
    float4 _567 = spvDescriptorSet0.fp_t_tcb_12.gather(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_2115, float2(0.0), isnan(_2115)), int2(0), component::x).xyzw;
    float _569 = _567.x;
    float _571 = _567.y;
    float _573 = _567.z;
    float _575 = _567.w;
    float2 _2131 = float2(_91, _93);
    float2 _579 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2131, float2(0.0), isnan(_2131))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2131, float2(0.0), isnan(_2131))).xy;
    float _581 = _579.x;
    float _583 = _579.y;
    float2 _2143 = float2(_562, _564);
    float _585 = dm_bs(spvDescriptorSet0.fp_t_tcb_18.sample(spvDescriptorSet0.fp_t_tcb_18Smplr, select(_2143, float2(0.0), isnan(_2143))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_18, spvDescriptorSet0.fp_t_tcb_18Smplr_w, select(_2143, float2(0.0), isnan(_2143))).x;
    float _587 = _281 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _589 = _93 * (*spvDescriptorSet0.fp_c4)._m0[0].w;
    float _591 = fma(_279, (*spvDescriptorSet0.fp_c3)._m0[35].x, _587);
    float _593 = fma(_283, (*spvDescriptorSet0.fp_c3)._m0[35].z, _591);
    float _595 = -_593;
    float _597 = fma(_595, _593, 1.0);
    float _599 = -_593;
    float _601 = fma(_599, (*spvDescriptorSet0.fp_c3)._m0[35].z, _283);
    float _603 = -_593;
    float _605 = fma(_603, (*spvDescriptorSet0.fp_c3)._m0[35].y, _281);
    float _607 = -_593;
    float _609 = fma(_607, (*spvDescriptorSet0.fp_c3)._m0[35].x, _279);
    float _611 = _597 * (*spvDescriptorSet0.fp_c3)._m0[35].w;
    float _613 = fma(_601, _611, _173);
    float _615 = fma(_605, _611, _175);
    float _617 = fma(_609, _611, _177);
    float _619 = _91 * (*spvDescriptorSet0.fp_c4)._m0[0].z;
    float _621 = -_613;
    bool _623 = _621 > (*spvDescriptorSet0.fp_c3)._m0[34].x;
    float _625 = float(_623);
    float _627 = -_613;
    bool _629 = _627 > (*spvDescriptorSet0.fp_c3)._m0[34].y;
    float _631 = float(_629);
    float _633 = floor(_619);
    float _635 = _625 + _631;
    float _637 = precise::min(_635, (*spvDescriptorSet0.fp_c3)._m0[33].w);
    float _639 = trunc(_637);
    int _641 = int(_639);
    int _643 = _641 << 6;
    int _645 = _643 + 16;
    uint _648 = uint(int(uint(_645) >> uint(2)));
    uint _650 = uint(int(uint(int(_648)) >> uint(2)));
    int _652 = int(_648) & 3;
    float _654 = (*spvDescriptorSet0.fp_c3)._m0[int(_650)][_652];
    int _656 = int(_648) + 1;
    uint _658 = uint(int(uint(_656) >> uint(2)));
    int _660 = _656 & 3;
    float _662 = (*spvDescriptorSet0.fp_c3)._m0[int(_658)][_660];
    int _664 = _643 + 48;
    uint _666 = uint(int(uint(_664) >> uint(2)));
    uint _668 = uint(int(uint(int(_666)) >> uint(2)));
    int _670 = int(_666) & 3;
    float _672 = (*spvDescriptorSet0.fp_c3)._m0[int(_668)][_670];
    int _674 = int(_666) + 1;
    uint _676 = uint(int(uint(_674) >> uint(2)));
    int _678 = _674 & 3;
    float _680 = (*spvDescriptorSet0.fp_c3)._m0[int(_676)][_678];
    uint _682 = uint(int(uint(_643) >> uint(2)));
    uint _684 = uint(int(uint(int(_682)) >> uint(2)));
    int _686 = int(_682) & 3;
    float _688 = (*spvDescriptorSet0.fp_c3)._m0[int(_684)][_686];
    int _690 = int(_682) + 1;
    uint _692 = uint(int(uint(_690) >> uint(2)));
    int _694 = _690 & 3;
    float _696 = (*spvDescriptorSet0.fp_c3)._m0[int(_692)][_694];
    int _698 = _643 + 32;
    uint _700 = uint(int(uint(_698) >> uint(2)));
    uint _702 = uint(int(uint(int(_700)) >> uint(2)));
    int _704 = int(_700) & 3;
    float _706 = (*spvDescriptorSet0.fp_c3)._m0[int(_702)][_704];
    int _708 = int(_700) + 1;
    uint _710 = uint(int(uint(_708) >> uint(2)));
    int _712 = _708 & 3;
    float _714 = (*spvDescriptorSet0.fp_c3)._m0[int(_710)][_712];
    float _716 = _615 * _662;
    float _718 = fma(_617, _654, _716);
    int _720 = _643 + 40;
    uint _722 = uint(int(uint(_720) >> uint(2)));
    uint _724 = uint(int(uint(int(_722)) >> uint(2)));
    int _726 = int(_722) & 3;
    float _728 = (*spvDescriptorSet0.fp_c3)._m0[int(_724)][_726];
    int _730 = int(_722) + 1;
    uint _732 = uint(int(uint(_730) >> uint(2)));
    int _734 = _730 & 3;
    float _736 = (*spvDescriptorSet0.fp_c3)._m0[int(_732)][_734];
    float _738 = _615 * _680;
    float _740 = fma(_617, _672, _738);
    int _742 = _643 + 56;
    uint _744 = uint(int(uint(_742) >> uint(2)));
    uint _746 = uint(int(uint(int(_744)) >> uint(2)));
    int _748 = int(_744) & 3;
    float _750 = (*spvDescriptorSet0.fp_c3)._m0[int(_746)][_748];
    int _752 = int(_744) + 1;
    uint _754 = uint(int(uint(_752) >> uint(2)));
    int _756 = _752 & 3;
    float _758 = (*spvDescriptorSet0.fp_c3)._m0[int(_754)][_756];
    float _760 = _615 * _696;
    float _762 = fma(_617, _688, _760);
    int _764 = _643 + 24;
    uint _766 = uint(int(uint(_764) >> uint(2)));
    uint _768 = uint(int(uint(int(_766)) >> uint(2)));
    int _770 = int(_766) & 3;
    float _772 = (*spvDescriptorSet0.fp_c3)._m0[int(_768)][_770];
    int _774 = int(_766) + 1;
    uint _776 = uint(int(uint(_774) >> uint(2)));
    int _778 = _774 & 3;
    float _780 = (*spvDescriptorSet0.fp_c3)._m0[int(_776)][_778];
    float _782 = _615 * _714;
    float _784 = fma(_617, _706, _782);
    float _786 = -_633;
    float _788 = _619 + _786;
    int _790 = _643 + 8;
    uint _792 = uint(int(uint(_790) >> uint(2)));
    uint _794 = uint(int(uint(int(_792)) >> uint(2)));
    int _796 = int(_792) & 3;
    float _798 = (*spvDescriptorSet0.fp_c3)._m0[int(_794)][_796];
    int _800 = int(_792) + 1;
    uint _802 = uint(int(uint(_800) >> uint(2)));
    int _804 = _800 & 3;
    float _806 = (*spvDescriptorSet0.fp_c3)._m0[int(_802)][_804];
    float _808 = floor(_589);
    float _810 = -(*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _812 = _788 + _810;
    float _814 = -_808;
    float _816 = _589 + _814;
    float _818 = fma(_613, _728, _784);
    float _820 = -(*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _822 = _816 + _820;
    float _824 = fma(_613, _750, _740);
    float _826 = -_822;
    float _828 = _826 + 1.0;
    float _830 = _824 + _758;
    float _832 = fma(_613, _772, _718);
    float _834 = -_812;
    float _836 = _834 + 1.0;
    float _838 = precise::min(_173, -1.0000000116860974230803549289703e-07);
    float _840 = _832 + _780;
    float _842 = _822 * _836;
    float _844 = rint(_637);
    float _846 = precise::max(_844, 0.0);
    uint _848 = uint(_846);
    uint _850 = clamp(_848, 0u, 65535u);
    float _852 = fma(_613, _798, _762);
    float _854 = _812 * _828;
    float _856 = _836 * _828;
    float _858 = _812 * _822;
    float _860 = _818 + _736;
    float _862 = _852 + _806;
    float _864 = 1.0 / _830;
    float _866 = 1.0 / _838;
    float _868 = fma(_552, (*spvDescriptorSet0.fp_c3)._m0[42].x, (*spvDescriptorSet0.fp_c3)._m0[42].z);
    float _870 = _862 * _864;
    float _872 = _866 * (*spvDescriptorSet0.fp_c4)._m0[1].w;
    float _874 = -_569;
    float _876 = fma(_874, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _878 = -_571;
    float _880 = fma(_878, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _882 = -_573;
    float _884 = fma(_882, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _886 = -_575;
    float _888 = fma(_886, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _890 = _840 * _864;
    float _892 = 1.0 / _876;
    float _894 = _860 * _864;
    float _896 = precise::clamp(_894, 0.0, 1.0);
    float _898 = 1.0 / _880;
    float _900 = 1.0 / _884;
    float _902 = 1.0 / _888;
    float _904 = fma(_581, 2.0, -1.0);
    float _906 = fma(_583, 2.0, -1.0);
    float _908 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _910 = -_173;
    float _912 = fma(_892, _908, _910);
    float _914 = fma(_554, (*spvDescriptorSet0.fp_c3)._m0[42].y, (*spvDescriptorSet0.fp_c3)._m0[42].w);
    float _916 = _904 * (*spvDescriptorSet0.fp_c4)._m0[0].x;
    float _918 = _906 * (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float _920 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _922 = -_173;
    float _924 = fma(_898, _920, _922);
    float _926 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _928 = -_173;
    float _930 = fma(_900, _926, _928);
    float _932 = abs(_912);
    float _934 = _932 * _872;
    float _936 = fma(_916, 2.0, _91);
    float _938 = fma(_918, 2.0, _93);
    float _940 = abs(_924);
    float _942 = _940 * _872;
    float _944 = abs(_930);
    float _946 = _944 * _872;
    float _948 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _950 = -_173;
    float _952 = fma(_902, _948, _950);
    float2 _2741 = float2(_868, _914);
    float _954 = dm_bs(spvDescriptorSet0.fp_t_tcb_1A.sample(spvDescriptorSet0.fp_t_tcb_1ASmplr, select(_2741, float2(0.0), isnan(_2741))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_1A, spvDescriptorSet0.fp_t_tcb_1ASmplr_w, select(_2741, float2(0.0), isnan(_2741))).x;
    float3 _2753 = float3(_870, _890, float(int(_850)));
    float3 _2757 = select(_2753, float3(0.0), isnan(_2753));
    float _956 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2757.xy, uint(rint(_2757.z)), _896);
    float _958 = abs(_952);
    float _960 = _958 * _872;
    float2 _2768 = float2(_558, _560);
    float4 _962 = spvDescriptorSet0.fp_t_tcb_10.gather(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_2768, float2(0.0), isnan(_2768)), int2(0), component::x).xyzw;
    float _964 = _962.x;
    float _966 = _962.y;
    float _968 = _962.z;
    float _970 = _962.w;
    float2 _2784 = float2(_558, _560);
    float4 _972 = spvDescriptorSet0.fp_t_tcb_10.gather(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_2784, float2(0.0), isnan(_2784)), int2(0), component::w).xyzw;
    float _974 = _972.x;
    float _976 = _972.y;
    float _978 = _972.z;
    float _980 = _972.w;
    float2 _2800 = float2(_936, _938);
    float2 _982 = dm_bs(spvDescriptorSet0.fp_t_tcb_14.sample(spvDescriptorSet0.fp_t_tcb_14Smplr, select(_2800, float2(0.0), isnan(_2800))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_14, spvDescriptorSet0.fp_t_tcb_14Smplr_w, select(_2800, float2(0.0), isnan(_2800))).yz;
    float _984 = _982.x;
    float _986 = _982.y;
    float2 _2812 = float2(_562, _564);
    float _988 = dm_bs(spvDescriptorSet0.fp_t_tcb_16.sample(spvDescriptorSet0.fp_t_tcb_16Smplr, select(_2812, float2(0.0), isnan(_2812)), level(_585)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_16, spvDescriptorSet0.fp_t_tcb_16Smplr_w, select(_2812, float2(0.0), isnan(_2812)), level(_585)).x;
    float _990 = exp2(_934);
    float _992 = _556 * (*spvDescriptorSet0.fp_c5)._m0[101].y;
    float _994 = _556 * (*spvDescriptorSet0.fp_c5)._m0[102].y;
    float _996 = exp2(_942);
    float _998 = fma(_552, (*spvDescriptorSet0.fp_c5)._m0[101].x, _992);
    float _1000 = fma(_552, (*spvDescriptorSet0.fp_c5)._m0[102].x, _994);
    float _1002 = fma(_554, (*spvDescriptorSet0.fp_c5)._m0[101].z, _998);
    float _1004 = abs(_842);
    float _1006 = _1004 * _990;
    float _1008 = fma(_554, (*spvDescriptorSet0.fp_c5)._m0[102].z, _1000);
    float _1010 = abs(_173);
    float _1012 = log2(_1010);
    float _1014 = _1002 + (*spvDescriptorSet0.fp_c5)._m0[101].w;
    float _1016 = _1008 + (*spvDescriptorSet0.fp_c5)._m0[102].w;
    float _1018 = abs(_858);
    float _1020 = _1018 * _996;
    float _1022 = exp2(_960);
    float _1024 = _1012 * (*spvDescriptorSet0.fp_c3)._m0[44].z;
    float _1026 = trunc(_1014);
    int _1028 = int(_1026);
    float _1030 = abs(_856);
    float _1032 = _1030 * _1022;
    float _1034 = exp2(_1024);
    float _1036 = exp2(_946);
    int _1038 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].y);
    int _1040 = _1028 + _1038;
    int _1042 = _1040 + 1;
    bool _1044 = _1042 >= 0;
    float _1046 = trunc(_1016);
    int _1048 = int(_1046);
    float _1050 = fma(_1034, (*spvDescriptorSet0.fp_c3)._m0[44].x, (*spvDescriptorSet0.fp_c3)._m0[44].y);
    float _1052 = precise::clamp(_1050, 0.0, 1.0);
    bool _1054 = _1042 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _1056 = !_1044;
    bool _1058 = _1054 || _1056;
    float _1060 = fma(_1052, -2.0, 3.0);
    float _1062 = _1052 * _1052;
    float _1064 = _1062 * _1060;
    float _1066 = abs(_854);
    float _1068 = _1066 * _1036;
    float _1070 = _1006 + _1020;
    int _1072 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].z);
    int _1074 = _1048 + _1072;
    int _1076 = _1074 + 1;
    float _1078 = _1068 + _1070;
    float _1080 = fma(_173, (*spvDescriptorSet0.fp_c3)._m0[43].w, 1.0);
    float _1082 = -_1064;
    float _1084 = _1082 + 1.0;
    bool _1086 = _1076 < 0;
    bool _1088 = _1086 || _1058;
    float _1090 = _1032 + _1078;
    float _1092 = precise::max(0.0, _1080);
    float _1094 = fma(_1084, (*spvDescriptorSet0.fp_c3)._m0[44].w, _1064);
    bool _1096 = _1076 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _1098 = _1096 || _1088;
    float _1100 = 1.0 / _1090;
    float _1102 = _1094 * _1092;
    float _1104 = _1092;
    if (_1098)
    {
        _1104 = 1.0;
    }
    float _1106 = _1104;
    float _1108 = _1106;
    if (!_1098)
    {
        int _1110 = _1076 * as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
        int _1112 = _1110 + _1042;
        float _1114 = floor(_1016);
        int _1116 = _1112 << 2;
        int _1118 = _1112 >> 2;
        int _1120 = 12 & _1116;
        int _1122 = _1118 << 4;
        int _1124 = _1122 + _1120;
        float _1126 = floor(_1014);
        uint _1128 = uint(int(uint(_1124) >> uint(2)));
        uint _1130 = uint(int(uint(int(_1128)) >> uint(2)));
        int _1132 = int(_1128) & 3;
        float _1134 = (*spvDescriptorSet0.fp_c5)._m0[int(_1130)][_1132];
        float _1136 = -_1114;
        float _1138 = _1016 + _1136;
        float _1140 = -_1126;
        float _1142 = _1014 + _1140;
        float _1144 = rint(_1134);
        float _1146 = precise::max(_1144, 0.0);
        uint _1148 = uint(_1146);
        uint _1150 = clamp(_1148, 0u, 65535u);
        float3 _3068 = float3(_1142, _1138, float(int(_1150)));
        float3 _3070 = select(_3068, float3(0.0), isnan(_3068));
        float _1152 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, _3070.xy, uint(rint(_3070.z)), level(0.0)), spvDescriptorSet0.dm_border, 6u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, _3070.xy, uint(rint(_3070.z)), level(0.0)).x;
        int _1154 = _1112 << 4;
        int _1156 = _1154 + 1648;
        int _1158 = _1124 + 8048;
        uint _1160 = uint(int(uint(_1158) >> uint(2)));
        uint _1162 = uint(int(uint(int(_1160)) >> uint(2)));
        int _1164 = int(_1160) & 3;
        float _1166 = (*spvDescriptorSet0.fp_c5)._m0[int(_1162)][_1164];
        uint _1168 = uint(int(uint(_1156) >> uint(2)));
        uint _1170 = uint(int(uint(int(_1168)) >> uint(2)));
        int _1172 = int(_1168) & 3;
        float _1174 = (*spvDescriptorSet0.fp_c5)._m0[int(_1170)][_1172];
        int _1176 = int(_1168) + 1;
        uint _1178 = uint(int(uint(_1176) >> uint(2)));
        int _1180 = _1176 & 3;
        float _1182 = (*spvDescriptorSet0.fp_c5)._m0[int(_1178)][_1180];
        int _1184 = _1156 + 8;
        uint _1186 = uint(int(uint(_1184) >> uint(2)));
        uint _1188 = uint(int(uint(int(_1186)) >> uint(2)));
        int _1190 = int(_1186) & 3;
        float _1192 = (*spvDescriptorSet0.fp_c5)._m0[int(_1188)][_1190];
        int _1194 = int(_1186) + 1;
        uint _1196 = uint(int(uint(_1194) >> uint(2)));
        int _1198 = _1194 & 3;
        float _1200 = (*spvDescriptorSet0.fp_c5)._m0[int(_1196)][_1198];
        float _1202 = _556 * _1182;
        float _1204 = fma(_552, _1174, _1202);
        float _1206 = _1166 * (*spvDescriptorSet0.fp_c3)._m0[39].x;
        float _1208 = 1.0 / _1166;
        float _1210 = fma(_554, _1192, _1204);
        float _1212 = _1210 + _1200;
        float _1214 = precise::clamp(_1212, 0.0, 1.0);
        float _1216 = -_1214;
        float _1218 = _1216 + _1152;
        float _1220 = fma(_1208, (*spvDescriptorSet0.fp_c3)._m0[39].y, _1218);
        float _1222 = _1206 * _1220;
        float _1224 = exp2(_1222);
        float _1226 = 0.0 + _1224;
        float _1228 = precise::clamp(_1226, 0.0, 1.0);
        _1108 = _1228;
    }
    float _1230 = _1108;
    float _1232 = _1020 * _1100;
    float _1234 = -_1032;
    bool _1236 = _1078 != _1234;
    bool _1238 = isnan(_1078);
    bool _1240 = _1236 || _1238;
    bool _1242 = isnan(_1234);
    bool _1244 = _1240 || _1242;
    float _1246 = -_173;
    float _1248 = -(*spvDescriptorSet0.fp_c3)._m0[38].z;
    float _1250 = _1246 + _1248;
    float _1252 = precise::min(_1230, (*spvDescriptorSet0.fp_c3)._m0[34].w);
    float _1254 = _1006 * _1100;
    bool _1256 = _173 >= (-8000.0);
    bool _1258 = isnan(_173);
    bool _1260 = _1256 || _1258;
    bool _1262 = isnan(-8000.0);
    bool _1264 = _1260 || _1262;
    float _1266 = float(_1264);
    float _1268 = _1250 * (*spvDescriptorSet0.fp_c3)._m0[38].w;
    float _1270 = precise::clamp(_1268, 0.0, 1.0);
    float _1272 = _1244 ? _1232 : 0.25;
    float _1274 = -_1252;
    float _1276 = _1274 + 1.0;
    float _1278 = _1068 * _1100;
    float _1280 = _1266 * _1102;
    float _1282 = _1244 ? _1254 : 0.25;
    float _1284 = _1272 * _966;
    float _1286 = fma(_1270, _1276, _1252);
    float _1288 = _1272 * _976;
    float _1290 = _1280 * (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _1292 = abs(_988);
    float _1294 = _1292 * (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _1296 = -_954;
    float _1298 = _1296 + 1.0;
    float _1300 = _1032 * _1100;
    float _1302 = _1244 ? _1278 : 0.25;
    float _1304 = fma(_1282, _964, _1284);
    float _1306 = fma(_1282, _974, _1288);
    float _1308 = -_1294;
    float _1310 = fma(_1266, _1308, 1.0);
    float _1312 = _1298 * _1290;
    float _1314 = precise::clamp(_1312, 0.0, 1.0);
    float _1316 = -_173;
    float _1318 = -(*spvDescriptorSet0.fp_c3)._m0[38].x;
    float _1320 = _1316 + _1318;
    float _1322 = fma(_1302, _968, _1304);
    float _1324 = fma(_1302, _978, _1306);
    float _1326 = _1244 ? _1300 : 0.25;
    float _1328 = -_1314;
    float _1330 = fma(_1328, (*spvDescriptorSet0.fp_c3)._m0[43].y, 1.0);
    float _1332 = _1320 * (*spvDescriptorSet0.fp_c3)._m0[38].y;
    float _1334 = precise::clamp(_1332, 0.0, 1.0);
    float _1336 = precise::min(_1310, 1.0);
    float _1338 = -_956;
    float _1340 = _1338 + 1.0;
    float _1342 = fma(_1326, _970, _1322);
    float _1344 = fma(_1326, _980, _1324);
    float _1346 = precise::min(_1336, _1330);
    float _1348 = fma(_1334, _1340, _956);
    float _1350 = precise::min(_1342, 1.0);
    float _1352 = precise::min(_1344, 1.0);
    out.m_66.x = _1348;
    out.m_66.y = _1286;
    out.m_66.z = _1352;
    out.m_66.w = _1346;
    out.m_68.x = _1350;
    out.m_68.y = _984;
    out.m_68.z = _986;
    out.m_68.w = 1.0;
    return out;
}

