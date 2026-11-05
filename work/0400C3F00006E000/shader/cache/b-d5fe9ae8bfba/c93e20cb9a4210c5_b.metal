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
    constant _16* vp_c15 [[id(0)]];
    constant _16* vp_c8 [[id(1)]];
    constant _16* vp_c10 [[id(2)]];
    constant _16* vp_c9 [[id(3)]];
    constant _16* vp_c16 [[id(4)]];
    constant _16* vp_c13 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    texture2d<float> vp_t_tcb_24 [[id(7)]];
    sampler vp_t_tcb_24Smplr [[id(8)]];
    texture2d_array<float> vp_t_tcb_16 [[id(9)]];
    sampler vp_t_tcb_16Smplr [[id(10)]];
    texture3d<float> vp_t_tcb_32 [[id(11)]];
    sampler vp_t_tcb_32Smplr [[id(12)]];
    texture3d<float> vp_t_tcb_30 [[id(13)]];
    sampler vp_t_tcb_30Smplr [[id(14)]];
    texture2d<float> vp_t_tcb_1C [[id(15)]];
    sampler vp_t_tcb_1CSmplr [[id(16)]];
    texture2d_array<float> vp_t_tcb_14 [[id(17)]];
    sampler vp_t_tcb_14Smplr [[id(18)]];
    sampler vp_t_tcb_24Smplr_w [[id(19)]];
    sampler vp_t_tcb_32Smplr_w [[id(20)]];
    sampler vp_t_tcb_30Smplr_w [[id(21)]];
    sampler vp_t_tcb_1CSmplr_w [[id(22)]];
    sampler vp_t_tcb_14Smplr_w [[id(23)]];
    constant dm_border_t* dm_border [[id(24)]];
};

struct main0_out
{
    float4 m_75 [[user(locn0)]];
    float4 m_77 [[user(locn1)]];
    float4 m_87 [[user(locn2)]];
    float4 m_79 [[user(locn3)]];
    float4 m_61 [[user(locn4)]];
    float4 m_73 [[user(locn5)]];
    float4 m_85 [[user(locn6)]];
    float4 m_81 [[user(locn7)]];
    float4 m_83 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_58 [[attribute(2)]];
    float4 m_63 [[attribute(3)]];
    float4 m_71 [[attribute(4)]];
    float4 m_69 [[attribute(5)]];
    float4 m_67 [[attribute(6)]];
    float4 m_65 [[attribute(7)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2520 = false;
    bool _1400 = false;
    bool _636 = false;
    bool _486 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _101 = in.m_58.w;
    float _103 = trunc(_101);
    int _106 = int(_103);
    bool _110 = _106 >= 1;
    float _112 = 0.0;
    if (!_110)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _114 = _112;
    float _116 = _114;
    if (!_110)
    {
        out.m_61.x = 0.0;
    }
    int _118 = 0;
    if (!_110)
    {
        float _120 = _114 * 5.0;
        _118 = as_type<int>(_120);
    }
    int _122 = _118;
    int _124 = _122;
    if (!_110)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2805 = as_type<float>(_122);
        out.gl_Position.z = _2805;
    }
    if (!_110)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _126 = in.m_63.w;
    bool _128 = _126 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _130 = isnan(_126);
    bool _132 = _128 || _130;
    bool _134 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _136 = _132 || _134;
    float _138 = -_126;
    float _140 = _138 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _142 = 0.0;
    float _144 = 0.0;
    if (_136)
    {
        float _146 = float(_106);
        _116 = _146;
    }
    float _148 = _116;
    bool _150 = _140 >= _148;
    bool _152 = !_136;
    bool _154 = _150 || _152;
    float _156 = _148;
    if (_154)
    {
        _156 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _158 = _156;
    if (_154)
    {
        out.m_61.x = 0.0;
    }
    if (_154)
    {
        float _160 = _158 * 5.0;
        _124 = as_type<int>(_160);
    }
    int _162 = _124;
    float _164 = as_type<float>(_162);
    if (_154)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2876 = as_type<float>(_162);
        out.gl_Position.z = _2876;
    }
    if (_154)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _166 = in.m_63.x;
    float _168 = in.m_63.y;
    float _170 = in.m_63.z;
    float _172 = _140 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _174 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _176 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _178 = _174 || _176;
    bool _180 = isnan(1.0);
    bool _182 = _178 || _180;
    float _184 = _172;
    if (!_182)
    {
        float _186 = _172 * _172;
        float _188 = _186 * 0.5;
        _164 = _188;
    }
    float _190 = _164;
    float _192 = 0.0;
    float _194 = _190;
    if (!_182)
    {
        float _196 = _140 * _140;
        float _198 = _196 * 0.5;
        _192 = _198;
    }
    float _200 = _192;
    if (!_182)
    {
        float _202 = _190 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _194 = _202;
    }
    float _204 = _194;
    bool _206 = !_182;
    float _208 = _204;
    if (!_206)
    {
        float _210 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _212 = log2(_210);
        float _214 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _216 = _214 + 1.0;
        float _218 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _220 = _172 * _212;
        float _222 = 1.0 / _216;
        float _224 = _218 * 0.693147182464599609375;
        float _226 = exp2(_220);
        float _228 = 1.0 / _224;
        float _230 = _226 + (-1.0);
        float _232 = -_230;
        float _234 = fma(_232, _228, _172);
        float _236 = _234 * _222;
        float _238 = _236 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _142 = _228;
        _208 = _238;
        _144 = _226;
    }
    float _240 = _142;
    float _242 = _208;
    float _244 = _144;
    bool _246 = !_182;
    float _248 = _240;
    float _250 = _244;
    if (!_246)
    {
        float _252 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _254 = log2(_252);
        float _256 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _258 = _256 + 1.0;
        float _260 = 1.0 / _258;
        float _262 = _172 * _254;
        float _264 = exp2(_262);
        float _266 = -_264;
        float _268 = _266 + 1.0;
        float _270 = _268 * _260;
        _248 = _264;
        _250 = _258;
        _184 = _270;
    }
    float _272 = _248;
    float _274 = _250;
    float _276 = _184;
    float _278 = _274;
    float _280 = _272;
    if (!_182)
    {
        _278 = _140;
    }
    float _282 = _278;
    float _284 = _242 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _286 = _282;
    if (!_182)
    {
        float _288 = _200 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _280 = _288;
    }
    float _290 = _280;
    bool _292 = !_182;
    float _294 = _290;
    if (!_292)
    {
        float _296 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _298 = log2(_296);
        float _300 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _302 = _300 + 1.0;
        float _304 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _306 = _140 * _298;
        float _308 = 1.0 / _302;
        float _310 = _304 * 0.693147182464599609375;
        float _312 = exp2(_306);
        float _314 = 1.0 / _310;
        float _316 = _312 + (-1.0);
        float _318 = -_316;
        float _320 = fma(_318, _314, _140);
        float _322 = _320 * _308;
        float _324 = _322 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _294 = _324;
    }
    float _326 = _294;
    bool _328 = !_182;
    if (!_328)
    {
        float _330 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _332 = log2(_330);
        float _334 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _336 = _334 + 1.0;
        float _338 = 1.0 / _336;
        float _340 = _140 * _332;
        float _342 = exp2(_340);
        float _344 = -_342;
        float _346 = _344 + 1.0;
        float _348 = _346 * _338;
        _286 = _348;
    }
    float _350 = _286;
    float _352 = _326 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _354 = _242 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _356 = fma(_276, _168, _284);
    float _358 = _326 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _360 = fma(_350, _168, _352);
    float _362 = fma(_276, _166, _354);
    float _364 = _326 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _366 = fma(_350, _166, _358);
    float _368 = _242 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _370 = -_360;
    float _372 = _356 + _370;
    float _374 = fma(_350, _170, _364);
    float _376 = -_366;
    float _378 = _362 + _376;
    float _380 = fma(_276, _170, _368);
    float _382 = _372 * _372;
    float _384 = in.m_65.w;
    float _386 = _372 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _388 = -_374;
    float _390 = _380 + _388;
    float _392 = fma(_378, _378, _382);
    float _394 = _372 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _396 = _372 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _398 = fma(_378, (*spvDescriptorSet0.vp_c10)._m0[5].x, _386);
    float _400 = fma(_390, _390, _392);
    float _402 = fma(_378, (*spvDescriptorSet0.vp_c10)._m0[4].x, _394);
    float _404 = in.m_58.x;
    float _406 = in.m_58.y;
    float _408 = in.m_58.z;
    float _410 = fma(_378, (*spvDescriptorSet0.vp_c10)._m0[6].x, _396);
    float _412 = fma(_390, (*spvDescriptorSet0.vp_c10)._m0[5].z, _398);
    float _414 = sqrt(_400);
    float _416 = fma(_390, (*spvDescriptorSet0.vp_c10)._m0[6].z, _410);
    bool _418 = _414 >= 9.9999999747524270787835121154785e-07;
    bool _420 = isnan(_414);
    bool _422 = _418 || _420;
    bool _424 = isnan(9.9999999747524270787835121154785e-07);
    bool _426 = _422 || _424;
    float _428 = fma(_390, (*spvDescriptorSet0.vp_c10)._m0[4].z, _402);
    float _430 = fma(_356, _384, _406);
    float _432 = fma(_362, _384, _404);
    float _434 = fma(_380, _384, _408);
    float _436 = _356;
    float _438 = _428;
    float _440 = _416;
    float _442 = _434;
    if (_426)
    {
        _436 = _412;
    }
    float _444 = _436;
    float _446 = _444;
    if (!_426)
    {
        bool _448 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _450 = !_448;
        if (!_450)
        {
            float _452 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _454 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _456 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _458 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _452);
            float _460 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _454);
            float _462 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _456);
            float _464 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _458);
            float _466 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _460);
            float _468 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _462);
            float _470 = _464 * _464;
            float _472 = fma(_466, _466, _470);
            float _474 = fma(_468, _468, _472);
            float _476 = rsqrt(_474);
            float _478 = _476 * 9.9999999747524270787835121154785e-07;
            float _480 = _466 * _478;
            float _482 = _464 * _478;
            float _484 = _468 * _478;
            _446 = _482;
            _438 = _480;
            _440 = _484;
            _486 = true;
        }
        else
        {
            float _488 = _168 * _168;
            float _490 = fma(_166, _166, _488);
            float _492 = fma(_170, _170, _490);
            float _494 = sqrt(_492);
            bool _496 = _494 >= 9.9999999747524270787835121154785e-07;
            bool _498 = isnan(_494);
            bool _500 = _496 || _498;
            bool _502 = isnan(9.9999999747524270787835121154785e-07);
            bool _504 = _500 || _502;
            if (!_504)
            {
                float _506 = _406 * _406;
                float _508 = fma(_404, _404, _506);
                float _510 = fma(_408, _408, _508);
                float _512 = sqrt(_510);
                bool _514 = _512 >= 9.9999999747524270787835121154785e-07;
                bool _516 = isnan(_512);
                bool _518 = _514 || _516;
                bool _520 = isnan(9.9999999747524270787835121154785e-07);
                bool _522 = _518 || _520;
                if (!_522)
                {
                    float _524 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _526 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _524);
                    float _528 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _526);
                    float _530 = rsqrt(_528);
                    float _532 = _530 * 9.9999999747524270787835121154785e-07;
                    float _534 = _532 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _536 = _532 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _538 = _532 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _446 = _536;
                    _438 = _534;
                    _440 = _538;
                    _486 = true;
                }
                else
                {
                    float _540 = _406 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _542 = _406 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _544 = _406 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _546 = fma(_404, (*spvDescriptorSet0.vp_c10)._m0[5].x, _540);
                    float _548 = fma(_404, (*spvDescriptorSet0.vp_c10)._m0[4].x, _542);
                    float _550 = fma(_404, (*spvDescriptorSet0.vp_c10)._m0[6].x, _544);
                    float _552 = fma(_408, (*spvDescriptorSet0.vp_c10)._m0[5].z, _546);
                    float _554 = fma(_408, (*spvDescriptorSet0.vp_c10)._m0[4].z, _548);
                    float _556 = fma(_408, (*spvDescriptorSet0.vp_c10)._m0[6].z, _550);
                    float _558 = _552 * _552;
                    float _560 = fma(_554, _554, _558);
                    float _562 = fma(_556, _556, _560);
                    float _564 = rsqrt(_562);
                    float _566 = _564 * 9.9999999747524270787835121154785e-07;
                    float _568 = _554 * _566;
                    float _570 = _552 * _566;
                    float _572 = _556 * _566;
                    _446 = _570;
                    _438 = _568;
                    _440 = _572;
                    _486 = true;
                }
            }
            else
            {
                float _574 = _168 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _576 = _168 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _578 = _168 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _580 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[5].x, _574);
                float _582 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[4].x, _576);
                float _584 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[6].x, _578);
                float _586 = fma(_170, (*spvDescriptorSet0.vp_c10)._m0[5].z, _580);
                float _588 = fma(_170, (*spvDescriptorSet0.vp_c10)._m0[4].z, _582);
                float _590 = fma(_170, (*spvDescriptorSet0.vp_c10)._m0[6].z, _584);
                float _592 = _586 * _586;
                float _594 = fma(_588, _588, _592);
                float _596 = fma(_590, _590, _594);
                float _598 = rsqrt(_596);
                float _600 = _598 * 9.9999999747524270787835121154785e-07;
                float _602 = _588 * _600;
                float _604 = _586 * _600;
                float _606 = _590 * _600;
                _446 = _604;
                _438 = _602;
                _440 = _606;
            }
        }
    }
    _486 = false;
    float _608 = _446;
    float _610 = _438;
    float _612 = _440;
    bool _614 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _616 = !_614;
    float _634;
    if (!_616)
    {
        float _618 = in.m_67.x;
        float _620 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _622 = _618 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _624 = fma(_622, (*spvDescriptorSet0.vp_c9)._m0[12].x, _140);
        float _626 = _624 * _620;
        float _628 = floor(_626);
        float _630 = -_628;
        float _632 = _626 + _630;
        _634 = _632;
        _636 = true;
    }
    else
    {
        float _638 = float(_106);
        float _640 = 1.0 / _638;
        float _642 = _140 * _640;
        _634 = _642;
    }
    _636 = false;
    float _644 = _634;
    float _646 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _648 = _644 + _646;
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _652 = _644 + _650;
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _656 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _654;
    float _658 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _660 = _658 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _662 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _664 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _662;
    float _666 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _668 = _666 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _670 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _672 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _670;
    float _674 = 1.0 / _660;
    bool _676 = _644 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _678 = isnan(_644);
    bool _680 = _676 || _678;
    bool _682 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _684 = _680 || _682;
    float _686 = float(_684);
    bool _688 = _644 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _690 = isnan(_644);
    bool _692 = _688 || _690;
    bool _694 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _696 = _692 || _694;
    float _698 = float(_696);
    float _700 = 1.0 / _656;
    float _702 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _704 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _702;
    float _706 = 1.0 / _664;
    float _708 = 1.0 / _668;
    float _710 = _648 * _700;
    float _712 = _608 * _608;
    float _714 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _716 = _644 + _714;
    float _718 = fma(_704, _710, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _720 = fma(_610, _610, _712);
    float _722 = 1.0 / _672;
    float _724 = _652 * _706;
    float _726 = fma(_612, _612, _720);
    float _728 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _730 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _728;
    float _732 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _734 = _732 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _736 = _716 * _708;
    float _738 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _740 = _644 + _738;
    float _742 = rsqrt(_726);
    float _744 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _746 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _744;
    float _748 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _750 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _748;
    float _752 = _740 * _674;
    float _754 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _756 = _644 + _754;
    float _758 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _760 = _758 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _762 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _764 = _762 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _766 = fma(_734, _736, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _768 = _756 * _722;
    float _770 = fma(_760, _736, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _772 = fma(_764, _736, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    bool _774 = _644 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _776 = isnan(_644);
    bool _778 = _774 || _776;
    bool _780 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _782 = _778 || _780;
    float _784 = float(_782);
    float _786 = fma(_730, _724, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _788 = _644 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _790 = isnan(_644);
    bool _792 = _788 || _790;
    bool _794 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _796 = _792 || _794;
    float _798 = float(_796);
    float _800 = fma(_746, _724, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _802 = fma(_750, _724, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _804 = -_784;
    float _806 = _804 + 1.0;
    float _808 = _742 * _608;
    float _810 = -_798;
    float _812 = _810 + 1.0;
    float _814 = -_698;
    float _816 = _814 + 1.0;
    float _818 = _798 * _806;
    float _820 = _742 * _610;
    float _822 = _686 * _812;
    float _824 = -_686;
    float _826 = _824 + 1.0;
    bool _828 = _644 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _830 = isnan(_644);
    bool _832 = _828 || _830;
    bool _834 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _836 = _832 || _834;
    float _838 = float(_836);
    float _840 = _808 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _842 = _742 * _612;
    bool _844 = _644 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _846 = isnan(_644);
    bool _848 = _844 || _846;
    bool _850 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _852 = _848 || _850;
    float _854 = float(_852);
    float _856 = _698 * _826;
    float _858 = _838 * _816;
    float _860 = fma(_820, (*spvDescriptorSet0.vp_c10)._m0[8].y, _840);
    float _862 = -_838;
    float _864 = _862 + 1.0;
    float _866 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _868 = _866 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _870 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _872 = _870 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _874 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _876 = _874 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _878 = fma(_842, (*spvDescriptorSet0.vp_c10)._m0[10].y, _860);
    float _880 = _854 * _864;
    float _882 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _884 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _882;
    float _886 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _888 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _886;
    float _890 = fma(_868, _752, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _892 = fma(_872, _752, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _894 = fma(_876, _752, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _896 = _786 * _880;
    float _898 = abs(_878);
    bool _900 = _898 > 0.99989998340606689453125;
    float _902 = -_854;
    float _904 = _902 + 1.0;
    float _906 = fma(_884, _710, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _908 = fma(_888, _710, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _910 = _800 * _880;
    float _912 = _802 * _880;
    float _914 = fma(_904, (*spvDescriptorSet0.vp_c9)._m0[143].x, _896);
    float _916 = fma(_904, (*spvDescriptorSet0.vp_c9)._m0[143].y, _910);
    float _918 = fma(_766, _858, _914);
    float _920 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _922 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _920;
    float _924 = fma(_770, _858, _916);
    float _926 = fma(_906, _856, _918);
    float _928 = fma(_904, (*spvDescriptorSet0.vp_c9)._m0[143].z, _912);
    float _930 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _932 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _930;
    float _934 = _906;
    float _936 = _922;
    float _938 = _908;
    float _940 = _718;
    if (_900)
    {
        _934 = 0.001000000047497451305389404296875;
    }
    float _942 = _934;
    float _944 = fma(_922, _768, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _946 = fma(_772, _858, _928);
    if (!_900)
    {
        _936 = (*spvDescriptorSet0.vp_c10)._m0[8].y;
    }
    float _948 = _936;
    float _950 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _952 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _950;
    float _954 = fma(_932, _768, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _956 = _948;
    if (_900)
    {
        float _958 = fma(_942, (*spvDescriptorSet0.vp_c10)._m0[8].z, (*spvDescriptorSet0.vp_c10)._m0[8].y);
        _956 = _958;
    }
    float _960 = _956;
    float _962 = fma(_908, _856, _924);
    if (!_900)
    {
        _938 = (*spvDescriptorSet0.vp_c10)._m0[10].y;
    }
    float _964 = _938;
    float _966 = fma(_718, _856, _946);
    float _968 = _964;
    if (_900)
    {
        float _970 = fma(_942, (*spvDescriptorSet0.vp_c10)._m0[10].z, (*spvDescriptorSet0.vp_c10)._m0[10].y);
        _968 = _970;
    }
    float _972 = _968;
    float _974 = -_960;
    float _976 = _842 * _974;
    float _978 = fma(_952, _768, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    if (!_900)
    {
        _940 = (*spvDescriptorSet0.vp_c10)._m0[9].y;
    }
    float _980 = _940;
    float _982 = in.m_65.x;
    float _984 = in.m_65.y;
    float _986 = in.m_65.z;
    float _988 = fma(_890, _822, _926);
    float _990 = fma(_892, _822, _962);
    float _992 = fma(_894, _822, _966);
    float _994 = _980;
    if (_900)
    {
        float _996 = fma(_942, (*spvDescriptorSet0.vp_c10)._m0[9].z, (*spvDescriptorSet0.vp_c10)._m0[9].y);
        _994 = _996;
    }
    float _998 = _994;
    float _1000 = -_972;
    float _1002 = _808 * _1000;
    float _1004 = -_972;
    float _1006 = -_976;
    float _1008 = fma(_820, _1004, _1006);
    float _1010 = in.m_69.x;
    float _1012 = in.m_69.y;
    float _1014 = in.m_69.z;
    float _1016 = -_998;
    float _1018 = _820 * _1016;
    float _1020 = -_998;
    float _1022 = -_1002;
    float _1024 = fma(_842, _1020, _1022);
    float _1026 = _1008 * _1008;
    float _1028 = fma(_978, _818, _988);
    float _1030 = -_960;
    float _1032 = -_1018;
    float _1034 = fma(_808, _1030, _1032);
    float _1036 = fma(_944, _818, _990);
    float _1038 = fma(_1024, _1024, _1026);
    float _1040 = fma(_784, (*spvDescriptorSet0.vp_c9)._m0[148].x, _1028);
    float _1042 = fma(_954, _818, _992);
    float _1044 = fma(_1034, _1034, _1038);
    float _1046 = fma(_784, (*spvDescriptorSet0.vp_c9)._m0[148].y, _1036);
    float _1048 = fma(_784, (*spvDescriptorSet0.vp_c9)._m0[148].z, _1042);
    float _1050 = rsqrt(_1044);
    float _1052 = _1040 * _982;
    float _1054 = _1046 * _984;
    float _1056 = _1048 * _986;
    float _1058 = _430 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1060 = _1052 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1062 = _1054 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1064 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1010);
    float _1066 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1014);
    float _1068 = _1056 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1070 = fma(_432, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1058);
    float _1072 = _1060 * _1064;
    float _1074 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1012);
    float _1076 = _430 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1078 = _1068 * _1066;
    bool _1080 = _1012 != 0.0;
    bool _1082 = isnan(_1012);
    bool _1084 = _1080 || _1082;
    bool _1086 = isnan(0.0);
    bool _1088 = _1084 || _1086;
    float _1090 = _1024 * _1050;
    float _1092 = _1062 * _1074;
    float _1094 = _1008 * _1050;
    float _1096 = _1034 * _1050;
    float _1098 = fma(_432, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1076);
    float _1100 = fma(_434, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1070);
    float _1102 = _1092 * _820;
    float _1104 = _1092 * _842;
    float _1106 = _808 * _1096;
    float _1108 = _820 * _1094;
    float _1110 = fma(_434, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1098);
    float _1112 = fma(_1072, _1090, _1102);
    float _1114 = fma(_1072, _1096, _1104);
    float _1116 = -_1106;
    float _1118 = fma(_842, _1094, _1116);
    float _1120 = -_1108;
    float _1122 = fma(_808, _1090, _1120);
    float _1124 = _1100 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1126 = _1110 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1128 = fma(_1078, _1118, _1112);
    float _1130 = fma(_1078, _1122, _1114);
    float _1132 = _430 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _1134 = _1010 == 0.0;
    bool _1136 = !_1088;
    bool _1138 = _1134 && _1136;
    float _1140 = _1124 + _1128;
    float _1142 = _1126 + _1130;
    float _1144 = fma(_432, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1132);
    float _1146 = in.m_71.x;
    float _1148 = in.m_71.y;
    float _1150 = in.m_71.z;
    float _1152 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1154 = _1140 + _1152;
    float _1156 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1158 = _1142 + _1156;
    float _1160 = _1092 * _808;
    float _1162 = _842 * _1090;
    float _1164 = _1154 * _1154;
    float _1166 = _1158 * _1158;
    bool _1168 = _1014 == 0.0;
    bool _1170 = _1168 && _1138;
    float _1172 = fma(_1072, _1094, _1160);
    float _1174 = -_1162;
    float _1176 = fma(_820, _1096, _1174);
    float _1178 = _1164 + _1166;
    float _1180 = fma(_434, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1144);
    float _1182 = fma(_1078, _1176, _1172);
    float _1184 = sqrt(_1178);
    float _1186 = _1180 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1188 = _1186 + _1182;
    float _1190 = _1146;
    float _1192 = _1148;
    float _1194 = _1150;
    float _1196 = _1012;
    float _1198 = _1010;
    float _1200 = _1182;
    float _1202 = _1140;
    float _1204 = _1158;
    float _1206 = _1124;
    if (!_1170)
    {
        float _1208 = fma(_1010, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1146);
        _1190 = _1208;
    }
    float _1210 = _1190;
    if (!_1170)
    {
        float _1212 = fma(_1012, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1148);
        _1192 = _1212;
    }
    float _1214 = _1192;
    float _1216 = _1214;
    if (!_1170)
    {
        float _1218 = fma(_1014, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1150);
        _1194 = _1218;
    }
    float _1220 = _1194;
    bool _1222 = _1184 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    if (!_1222)
    {
        _442 = _1140;
    }
    float _1224 = _442;
    float _1226 = _1224;
    if (!_1222)
    {
        _1196 = _1166;
    }
    float _1228 = _1196;
    float _1230 = _1228;
    if (!_1222)
    {
        _1198 = _1164;
    }
    float _1232 = _1198;
    float _1234 = _1232;
    if (!_1222)
    {
        _1200 = _1142;
    }
    float _1236 = _1200;
    float _1238 = _1236;
    if (!_1222)
    {
        _1202 = _1188;
    }
    float _1240 = _1202;
    bool _1242 = !_1222;
    float _1244 = _1240;
    if (!_1242)
    {
        float _1246 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1248 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1250 = _1184 + _1248;
        float _1252 = rsqrt(_1178);
        float _1254 = _1250 * _1246;
        float _1256 = _1188 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1258 = _1254 * 0.15915493667125701904296875;
        float _1260 = _1258 * 6.283185482025146484375;
        float _1262 = sin(_1260);
        float _1264 = _1258 * 6.283185482025146484375;
        float _1266 = cos(_1264);
        float _1268 = fma(_1262, _1256, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1270 = _1252 * _1268;
        float _1272 = _1266 + (-1.0);
        float _1274 = fma(_1154, _1270, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1276 = fma(_1158, _1270, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1278 = _1272 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1280 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1282 = _1274 + _1280;
        float _1284 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1286 = _1276 + _1284;
        float _1288 = fma(_1188, _1266, _1278);
        float _1290 = _1282 * _1282;
        float _1292 = _1286 * _1286;
        _1244 = _1288;
        _1234 = _1290;
        _1230 = _1292;
        _1226 = _1274;
        _1238 = _1276;
    }
    float _1294 = _1244;
    float _1296 = _1234;
    float _1298 = _1230;
    float _1300 = _1226;
    float _1302 = _1238;
    float _1304 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1306 = _1294 + _1304;
    float _1308 = _808 * _1214;
    float _1310 = _820 * _1214;
    float _1312 = _842 * _1214;
    float _1314 = fma(_1306, _1306, _1296);
    float _1316 = fma(_1094, _1210, _1308);
    float _1318 = fma(_1090, _1210, _1310);
    float _1320 = fma(_1096, _1210, _1312);
    float _1322 = _1314 + _1298;
    float _1324 = fma(_1176, _1220, _1316);
    float _1326 = fma(_1118, _1220, _1318);
    float _1328 = fma(_1122, _1220, _1320);
    float _1330 = sqrt(_1322);
    float _1332 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1334 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1336 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1338 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1340 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1342 = _1332 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1344 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1346 = _1334 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1348 = _1336 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1350 = _1338 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1352 = _1340 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1354 = _1344 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_73.x = _1326;
    out.m_73.y = _1324;
    out.m_73.z = _1328;
    bool _1356 = _1330 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1358 = isnan(_1330);
    bool _1360 = _1356 || _1358;
    bool _1362 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1364 = _1360 || _1362;
    out.m_75.x = _1342;
    out.m_75.y = _1346;
    out.m_75.z = _1348;
    out.m_77.x = _1350;
    out.m_77.y = _1352;
    out.m_77.z = _1354;
    if (!_1364)
    {
        _1216 = 1.0;
    }
    float _1366 = _1216;
    bool _1368 = !_1364;
    float _1370 = _1366;
    if (!_1368)
    {
        bool _1372 = _1330 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1374 = isnan(_1330);
        bool _1376 = _1372 || _1374;
        bool _1378 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1380 = _1376 || _1378;
        if (!_1380)
        {
            float _1382 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1384 = _1330 + _1382;
            float _1386 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1388 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1386;
            float _1390 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1392 = _1390 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1394 = 1.0 / _1388;
            float _1396 = _1384 * _1394;
            float _1398 = fma(_1396, _1392, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1370 = _1398;
            _1400 = true;
        }
        else
        {
            bool _1402 = _1330 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1404 = isnan(_1330);
            bool _1406 = _1402 || _1404;
            bool _1408 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1410 = _1406 || _1408;
            if (!_1410)
            {
                float _1412 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1414 = _1330 + _1412;
                float _1416 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1418 = _1416 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1420 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1422 = _1420 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1424 = 1.0 / _1418;
                float _1426 = _1414 * _1424;
                float _1428 = fma(_1426, _1422, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1370 = _1428;
                _1400 = true;
            }
            else
            {
                _1370 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1400 = false;
    float _1430 = _1370;
    float _1432 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1434 = _1294 + _1432;
    float _1436 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1438 = _1300 + _1436;
    float _1440 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1442 = _1302 + _1440;
    float _1444 = fma(_1434, _1430, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1446 = fma(_1438, _1430, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1448 = fma(_1442, _1430, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1450 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1452 = _1444 + _1450;
    float _1454 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1456 = _1446 + _1454;
    float _1458 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1460 = _1448 + _1458;
    float _1462 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _1464 = _1452 * _1452;
    float _1466 = _1186 + _1462;
    float _1468 = fma(_1456, _1456, _1464);
    float _1470 = _1466 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1472 = fma(_1460, _1460, _1468);
    float _1474 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1476 = _1466 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1478 = fma(_1124, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1470);
    float _1480 = rsqrt(_1472);
    float _1482 = fma(_1124, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1474);
    float _1484 = fma(_1124, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1476);
    float _1486 = fma(_1126, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1478);
    float _1488 = fma(_1126, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1490 = fma(_1126, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1482);
    float _1492 = fma(_1126, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1484);
    float _1494 = _1486 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1496 = sqrt(_1472);
    float _1498 = _1492 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1500 = _1480 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1502 = _1490 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1504 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1506 = trunc(_1494);
    int _1508 = int(_1506);
    float _1510 = _1456 * _1500;
    float _1512 = _1460 * _1500;
    float _1514 = fma(_1124, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1504);
    float _1516 = _1444 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1518 = _1510 * _1510;
    float _1520 = _1512 * _1512;
    float _1522 = fma(_1126, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1514);
    float _1524 = 1.0 / _1502;
    float _1526 = fma(_1446, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1516);
    float _1528 = _1518 + _1520;
    float _1530 = _1522 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1532 = _1530 + _1502;
    float _1534 = sqrt(_1528);
    int _1536 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1538 = _1508 + _1536;
    int _1540 = _1538 + 1;
    float _1542 = _1532 * _1524;
    float _1544 = _1542 * 0.5;
    float _1546 = trunc(_1498);
    int _1548 = int(_1546);
    float _1550 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1552 = fma(_1544, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1550);
    bool _1554 = _1534 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1556 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1558 = _1534 + _1556;
    float _1560 = 1.0 / _1552;
    int _1562 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1564 = _1548 + _1562;
    int _1566 = _1564 + 1;
    float _1568 = floor(_1488);
    float _1570 = _1184;
    float _1572 = _1558;
    int _1574 = 2;
    float _1576 = _1510;
    float _1578 = _1512;
    float _1580 = _1518;
    if (_1554)
    {
        float _1582 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1570 = _1582;
    }
    float _1584 = _1570;
    float _1586 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1588 = _1560 * _1586;
    bool _1590 = _1588 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1592 = fma(_1124, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    bool _1594 = _1588 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1596 = -_1568;
    float _1598 = _1488 + _1596;
    float _1600 = floor(_1592);
    if (_1554)
    {
        float _1602 = _1558 * _1584;
        _1572 = _1602;
    }
    float _1604 = _1572;
    if (!_1590)
    {
        _1574 = 1;
    }
    int _1606 = _1574;
    float _1608 = 0.0;
    int _1610 = _1606;
    if (_1554)
    {
        float _1612 = _1604 * 0.15915493667125701904296875;
        _1608 = _1612;
    }
    float _1614 = _1608;
    float _1616 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1618 = _1486;
    if (_1554)
    {
        float _1620 = _1614 * 6.283185482025146484375;
        float _1622 = sin(_1620);
        _1618 = _1622;
    }
    float _1624 = _1618;
    float _1626 = precise::max(0.0, _1616);
    float _1628 = -_1600;
    float _1630 = _1592 + _1628;
    bool _1632 = !_1590;
    int _1634 = _1632 ? 0 : 1;
    float _1636 = -_1500;
    float _1638 = -_1626;
    float _1640 = fma(_1452, _1636, _1638);
    float _1642 = as_type<float>(_1634);
    float _1644 = _1640;
    if (!_1594)
    {
        _1610 = _1634;
    }
    int _1646 = _1610;
    float _1648 = _1626;
    if (_1554)
    {
        float _1650 = rsqrt(_1528);
        _1648 = _1650;
    }
    float _1652 = _1648;
    int _1654 = _1540 | _1566;
    if (_1554)
    {
        float _1656 = _1640 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1642 = _1656;
    }
    float _1658 = _1642;
    int _1660 = _1646 << 6;
    bool _1662 = _1540 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1664 = _1660 + 96;
    uint _1667 = uint(int(uint(_1664) >> uint(2)));
    uint _1669 = uint(int(uint(int(_1667)) >> uint(2)));
    int _1671 = int(_1667) & 3;
    float _1673 = (*spvDescriptorSet0.vp_c15)._m0[int(_1669)][_1671];
    int _1675 = int(_1667) + 1;
    uint _1677 = uint(int(uint(_1675) >> uint(2)));
    int _1679 = _1675 & 3;
    float _1681 = (*spvDescriptorSet0.vp_c15)._m0[int(_1677)][_1679];
    float _1683 = _1624;
    if (_1554)
    {
        float _1685 = fma(_1624, _1658, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1683 = _1685;
    }
    float _1687 = _1683;
    float _1689 = _1614;
    if (_1554)
    {
        float _1691 = _1614 * 6.283185482025146484375;
        float _1693 = cos(_1691);
        _1689 = _1693;
    }
    float _1695 = _1689;
    bool _1697 = _1654 < 0;
    bool _1699 = _1697 || _1662;
    bool _1701 = _1566 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1703 = _1701 || _1699;
    int _1705 = _1660 + 104;
    uint _1707 = uint(int(uint(_1705) >> uint(2)));
    uint _1709 = uint(int(uint(int(_1707)) >> uint(2)));
    int _1711 = int(_1707) & 3;
    float _1713 = (*spvDescriptorSet0.vp_c15)._m0[int(_1709)][_1711];
    int _1715 = int(_1707) + 1;
    uint _1717 = uint(int(uint(_1715) >> uint(2)));
    int _1719 = _1715 & 3;
    float _1721 = (*spvDescriptorSet0.vp_c15)._m0[int(_1717)][_1719];
    float _1723 = 0.0;
    if (_1554)
    {
        float _1725 = _1652 * _1687;
        _1723 = _1725;
    }
    float _1727 = _1723;
    float _1729 = _1727;
    if (_1554)
    {
        float _1731 = _1510 * _1727;
        _1576 = _1731;
    }
    float _1733 = _1576;
    if (_1554)
    {
        float _1735 = _1512 * _1727;
        _1578 = _1735;
    }
    float _1737 = _1578;
    if (!_1554)
    {
        _1729 = _1520;
    }
    float _1739 = _1729;
    int _1741 = _1660 + 48;
    uint _1743 = uint(int(uint(_1741) >> uint(2)));
    uint _1745 = uint(int(uint(int(_1743)) >> uint(2)));
    int _1747 = int(_1743) & 3;
    float _1749 = (*spvDescriptorSet0.vp_c15)._m0[int(_1745)][_1747];
    int _1751 = int(_1743) + 1;
    uint _1753 = uint(int(uint(_1751) >> uint(2)));
    int _1755 = _1751 & 3;
    float _1757 = (*spvDescriptorSet0.vp_c15)._m0[int(_1753)][_1755];
    float _1759 = _1739;
    if (_1554)
    {
        float _1761 = _1733 * _1733;
        _1580 = _1761;
    }
    float _1763 = _1580;
    if (_1554)
    {
        float _1765 = _1695 + (-1.0);
        _1204 = _1765;
    }
    float _1767 = _1204;
    if (_1554)
    {
        float _1769 = _1737 * _1737;
        _1759 = _1769;
    }
    float _1771 = _1759;
    float _1773 = 0.0;
    if (!_1703)
    {
        float _1775 = floor(_1498);
        _1773 = _1775;
    }
    float _1777 = _1773;
    float _1779 = 0.0;
    if (_1554)
    {
        float _1781 = _1767 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1779 = _1781;
    }
    float _1783 = _1779;
    float _1785 = fma(_1448, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1526);
    int _1787 = _1660 + 64;
    uint _1789 = uint(int(uint(_1787) >> uint(2)));
    uint _1791 = uint(int(uint(int(_1789)) >> uint(2)));
    int _1793 = int(_1789) & 3;
    float _1795 = (*spvDescriptorSet0.vp_c15)._m0[int(_1791)][_1793];
    int _1797 = int(_1789) + 1;
    uint _1799 = uint(int(uint(_1797) >> uint(2)));
    int _1801 = _1797 & 3;
    float _1803 = (*spvDescriptorSet0.vp_c15)._m0[int(_1799)][_1801];
    if (_1554)
    {
        float _1805 = fma(_1640, _1695, _1783);
        _1644 = _1805;
    }
    float _1807 = _1644;
    float _1809 = _1785 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1811 = fma(_1807, _1807, _1763);
    float _1813 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    int _1815 = _1660 + 56;
    uint _1817 = uint(int(uint(_1815) >> uint(2)));
    uint _1819 = uint(int(uint(int(_1817)) >> uint(2)));
    int _1821 = int(_1817) & 3;
    float _1823 = (*spvDescriptorSet0.vp_c15)._m0[int(_1819)][_1821];
    int _1825 = int(_1817) + 1;
    uint _1827 = uint(int(uint(_1825) >> uint(2)));
    int _1829 = _1825 & 3;
    float _1831 = (*spvDescriptorSet0.vp_c15)._m0[int(_1827)][_1829];
    float _1833 = _1809 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1835 = _1811 + _1771;
    float _1837 = -_1833;
    float _1839 = fma(_1837, _1813, 1.0);
    int _1841 = as_type<int>(_1833);
    if (!_1703)
    {
        int _1843 = _1566 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1845 = _1843 + _1540;
        _1841 = _1845;
    }
    int _1847 = _1841;
    int _1849 = _1660 + 80;
    uint _1851 = uint(int(uint(_1849) >> uint(2)));
    uint _1853 = uint(int(uint(int(_1851)) >> uint(2)));
    int _1855 = int(_1851) & 3;
    float _1857 = (*spvDescriptorSet0.vp_c15)._m0[int(_1853)][_1855];
    int _1859 = int(_1851) + 1;
    uint _1861 = uint(int(uint(_1859) >> uint(2)));
    int _1863 = _1859 & 3;
    float _1865 = (*spvDescriptorSet0.vp_c15)._m0[int(_1861)][_1863];
    float _1867 = log2(_1839);
    int _1869 = _1660 + 72;
    uint _1871 = uint(int(uint(_1869) >> uint(2)));
    uint _1873 = uint(int(uint(int(_1871)) >> uint(2)));
    int _1875 = int(_1871) & 3;
    float _1877 = (*spvDescriptorSet0.vp_c15)._m0[int(_1873)][_1875];
    int _1879 = int(_1871) + 1;
    uint _1881 = uint(int(uint(_1879) >> uint(2)));
    int _1883 = _1879 & 3;
    float _1885 = (*spvDescriptorSet0.vp_c15)._m0[int(_1881)][_1883];
    float _1887 = _1466 * _1681;
    float _1889 = fma(_1124, _1673, _1887);
    int _1891 = _1660 + 88;
    uint _1893 = uint(int(uint(_1891) >> uint(2)));
    uint _1895 = uint(int(uint(int(_1893)) >> uint(2)));
    int _1897 = int(_1893) & 3;
    float _1899 = (*spvDescriptorSet0.vp_c15)._m0[int(_1895)][_1897];
    int _1901 = int(_1893) + 1;
    uint _1903 = uint(int(uint(_1901) >> uint(2)));
    int _1905 = _1901 & 3;
    float _1907 = (*spvDescriptorSet0.vp_c15)._m0[int(_1903)][_1905];
    float _1909 = fma(_1126, _1713, _1889);
    float _1911 = _1867 * 0.693147182464599609375;
    float _1913 = _1909 + _1721;
    float _1915 = _1466 * _1757;
    float _1917 = rsqrt(_1835);
    float _1919 = fma(_1124, _1749, _1915);
    int _1921 = as_type<int>(_1915);
    int _1923 = as_type<int>(_1673);
    if (!_1703)
    {
        int _1925 = _1847 << 2;
        _1921 = _1925;
    }
    int _1927 = _1921;
    float _1929 = _1466 * _1803;
    int _1931 = _1927;
    float _1933 = _1803;
    if (!_1703)
    {
        int _1935 = 12 & _1927;
        _1931 = _1935;
    }
    int _1937 = _1931;
    float _1939 = 1.0 / _1913;
    if (!_1703)
    {
        float _1941 = -_1777;
        float _1943 = _1498 + _1941;
        _1933 = _1943;
    }
    float _1945 = _1933;
    float _1947 = fma(_1124, _1795, _1929);
    float _1949 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1951 = fma(_1496, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1949);
    float _1953 = precise::clamp(_1951, 0.0, 1.0);
    float _1955 = _1911 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1957 = fma(_1126, _1823, _1919);
    float _1959 = _1917 * _1733;
    float _1961 = _1917 * _1807;
    float _1963 = _1957 + _1831;
    float _1965 = _1444 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1967 = _1959 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1969 = _1917 * _1737;
    float _1971 = _1466 * _1865;
    int _1973 = as_type<int>(_1865);
    if (!_1703)
    {
        uint _1975 = uint(int(uint(_1847) >> uint(2)));
        _1973 = int(_1975);
    }
    int _1977 = _1973;
    float _1979 = _1963 * _1939;
    float _1981 = fma(_1446, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1965);
    float _1983 = fma(_1124, _1857, _1971);
    if (!_1703)
    {
        int _1985 = _1977 << 4;
        int _1987 = _1985 + _1937;
        _1923 = _1987;
    }
    int _1989 = _1923;
    float _1991 = -_1953;
    float _1993 = _1991 + 1.0;
    bool _1995 = _1979 >= 0.0;
    float _1997 = fma(_1126, _1877, _1947);
    float _1999 = _1947;
    if (!_1703)
    {
        int _2001 = _1989 + 400;
        uint _2003 = uint(int(uint(_2001) >> uint(2)));
        uint _2005 = uint(int(uint(int(_2003)) >> uint(2)));
        int _2007 = int(_2003) & 3;
        float _2009 = (*spvDescriptorSet0.vp_c15)._m0[int(_2005)][_2007];
        _1999 = _2009;
    }
    float _2011 = _1999;
    bool _2013 = _1979 <= 1.0;
    bool _2015 = _2013 && _1995;
    float _2017 = _1997 + _1885;
    float _2019 = _1444 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2021 = fma(_1448, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1981);
    float _2023 = abs(_1993);
    float _2025 = log2(_2023);
    float _2027 = fma(_1126, _1899, _1983);
    float _2029 = -_1967;
    float _2031 = fma(_1961, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2029);
    float _2033 = fma(_1446, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2019);
    float _2035 = _2017 * _1939;
    float _2037 = _1444 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2039 = -_1969;
    float _2041 = fma(_2039, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2031);
    float _2043 = fma(_1448, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2033);
    float _2045 = _2021 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2047 = fma(_1446, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2037);
    bool _2049 = _2035 >= 0.0;
    bool _2051 = _2049 && _2015;
    float _2053 = _2043 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2055 = _2045 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2057 = fma(_1448, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2047);
    float _2059 = fma(_2041, 0.5, 0.5);
    bool _2061 = _2035 <= 1.0;
    bool _2063 = _2061 && _2051;
    float _2065 = fma(_2053, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2055);
    float _2067 = fma(_2041, -0.5, 0.5);
    float _2069 = _2057 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2071 = fma(_2059, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2073 = fma(_1809, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2065);
    float _2075 = _2025 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2077 = _2027 + _1907;
    float _2079 = sqrt(_2067);
    float _2081 = fma(_2069, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2073);
    float _2083 = fma(_2059, _2071, -0.212114393711090087890625);
    float _2085 = _2045 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2087 = _1961 + 1.0;
    float _2089 = fma(_2059, _2083, 1.570728778839111328125);
    float _2091 = _2083;
    float _2093 = _2087;
    if (_2063)
    {
        float _2095 = float(_1646);
        _2091 = _2095;
    }
    float _2097 = _2091;
    float _2099 = exp2(_2075);
    float _2101 = fma(_2053, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2085);
    float _2103 = fma(_1809, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2101);
    float _2105 = 1.0 / _2081;
    float _2107 = _2045 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2109 = _2079 * 0.636619746685028076171875;
    float _2111 = fma(_2069, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2103);
    float _2113 = fma(_2053, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2107);
    float _2115 = -_2089;
    float _2117 = fma(_2109, _2115, 1.0);
    float _2119 = _2097;
    if (_2063)
    {
        float _2121 = rint(_2097);
        float _2123 = precise::max(_2121, 0.0);
        uint _2125 = uint(_2123);
        uint _2127 = clamp(_2125, 0u, 65535u);
        _2119 = as_type<float>(_2127);
    }
    float _2129 = _2119;
    float _2131 = fma(_1809, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2113);
    float _2133 = -_1961;
    float _2135 = fma(_2099, _2087, _2133);
    float _2137 = fma(_2069, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2131);
    float _2139 = _2077 * _1939;
    float _2141 = _2041;
    if (!_1703)
    {
        float _2143 = floor(_1494);
        _2141 = _2143;
    }
    float _2145 = _2141;
    float _2147 = _2137 * _2105;
    float _2149 = _2111 * _2105;
    float2 _6210 = float2(_1630, _1598);
    float _2151 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6210, float2(0.0), isnan(_6210)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6210, float2(0.0), isnan(_6210)), level(0.0)).x;
    float _2153 = fma(_2147, -0.5, 0.5);
    float _2155 = fma(_2149, 0.5, 0.5);
    float _2157 = fma(_2135, 0.5, 0.5);
    float _2159 = _2129;
    if (_2063)
    {
        float3 _6232 = float3(_1979, _2035, float(as_type<int>(_2129)));
        float3 _6236 = select(_6232, float3(0.0), isnan(_6232));
        float _2161 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6236.xy, uint(rint(_6236.z)), _2139, level(0.0));
        _2159 = _2161;
    }
    float _2163 = _2159;
    float _2165 = _1939;
    if (!_1703)
    {
        float _2167 = rint(_2011);
        float _2169 = precise::max(_2167, 0.0);
        uint _2171 = uint(_2169);
        uint _2173 = clamp(_2171, 0u, 65535u);
        _2165 = as_type<float>(_2173);
    }
    float _2175 = _2165;
    if (!_1703)
    {
        float _2177 = -_2145;
        float _2179 = _1494 + _2177;
        _2093 = _2179;
    }
    float _2181 = _2093;
    float3 _6273 = float3(_2155, _2153, _1955);
    float _2183 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6273, float3(0.0), isnan(_6273)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6273, float3(0.0), isnan(_6273)), level(0.0)).x;
    float3 _6282 = float3(_2155, _2153, _1955);
    float4 _2186 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6282, float3(0.0), isnan(_6282)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6282, float3(0.0), isnan(_6282)), level(0.0)).xyzw;
    float _2188 = _2186.x;
    float _2190 = _2186.y;
    float _2192 = _2186.z;
    float _2194 = _2186.w;
    float2 _6298 = float2(_2117, _2157);
    float3 _2198 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6298, float2(0.0), isnan(_6298)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6298, float2(0.0), isnan(_6298)), level(0.0)).xyz;
    float _2200 = _2198.x;
    float _2202 = _2198.y;
    float _2204 = _2198.z;
    float _2206 = _2175;
    if (!_1703)
    {
        float3 _6319 = float3(_2181, _1945, float(as_type<int>(_2175)));
        float3 _6321 = select(_6319, float3(0.0), isnan(_6319));
        float _2208 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6321.xy, uint(rint(_6321.z)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6321.xy, uint(rint(_6321.z)), level(0.0)).x;
        _2206 = _2208;
    }
    float _2210 = _2206;
    float _2212 = abs(_1588);
    float _2214 = log2(_2212);
    float _2216 = _2045 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2218 = fma(_2053, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2216);
    float _2220 = fma(_1809, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2218);
    float _2222 = _2025 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2224 = fma(_2069, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2220);
    float _2226 = _2214 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2228 = _2224 + _2081;
    float _2230 = exp2(_2222);
    bool _2232 = _1588 <= 8000.0;
    bool _2234 = isnan(_1588);
    bool _2236 = _2232 || _2234;
    bool _2238 = isnan(8000.0);
    bool _2240 = _2236 || _2238;
    float _2242 = float(_2240);
    float _2244 = _2228 * 0.5;
    float _2246 = exp2(_2226);
    out.m_79.z = _2244;
    out.m_79.w = _2081;
    float _2248 = fma(_2246, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2250 = precise::clamp(_2248, 0.0, 1.0);
    float _2252 = fma(_2250, -2.0, 3.0);
    float _2254 = _2250 * _2250;
    float _2256 = _2254 * _2252;
    float _2258 = -_2256;
    float _2260 = _2258 + 1.0;
    out.gl_Position.x = _2111;
    out.gl_Position.y = _2137;
    out.gl_Position.z = _2224;
    out.gl_Position.w = _2081;
    float _2262 = fma(_2260, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2256);
    float _2264 = -_2230;
    float _2266 = _2264 + 1.0;
    float _2268 = _2242 * _2262;
    float _2270 = _2242;
    float _2272 = _2111;
    if (!_2063)
    {
        _2270 = 1.0;
    }
    float _2274 = _2270;
    float _2276 = _2268 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2278 = _2266 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2280 = _2274;
    if (_1703)
    {
        _2272 = 1.0;
    }
    float _2282 = _2272;
    float _2284 = -_2151;
    float _2286 = _2284 + 1.0;
    float _2288 = _2286 * _2276;
    float _2290 = precise::clamp(_2288, 0.0, 1.0);
    float _2292 = _2282;
    float _2294 = _2290;
    if (_2063)
    {
        bool _2296 = _2163 >= _2139;
        bool _2298 = isnan(_2163);
        bool _2300 = _2296 || _2298;
        bool _2302 = isnan(_2139);
        bool _2304 = _2300 || _2302;
        float _2306 = float(_2304);
        _2280 = _2306;
    }
    float _2308 = _2280;
    if (!_1703)
    {
        int _2310 = _1847 << 4;
        int _2312 = _2310 + 2048;
        uint _2314 = uint(int(uint(_2312) >> uint(2)));
        uint _2316 = uint(int(uint(int(_2314)) >> uint(2)));
        int _2318 = int(_2314) & 3;
        float _2320 = (*spvDescriptorSet0.vp_c15)._m0[int(_2316)][_2318];
        int _2322 = int(_2314) + 1;
        uint _2324 = uint(int(uint(_2322) >> uint(2)));
        int _2326 = _2322 & 3;
        float _2328 = (*spvDescriptorSet0.vp_c15)._m0[int(_2324)][_2326];
        int _2330 = _2312 + 8;
        uint _2332 = uint(int(uint(_2330) >> uint(2)));
        uint _2334 = uint(int(uint(int(_2332)) >> uint(2)));
        int _2336 = int(_2332) & 3;
        float _2338 = (*spvDescriptorSet0.vp_c15)._m0[int(_2334)][_2336];
        int _2340 = int(_2332) + 1;
        uint _2342 = uint(int(uint(_2340) >> uint(2)));
        int _2344 = _2340 & 3;
        float _2346 = (*spvDescriptorSet0.vp_c15)._m0[int(_2342)][_2344];
        float _2348 = _1466 * _2328;
        float _2350 = fma(_1124, _2320, _2348);
        float _2352 = fma(_1126, _2338, _2350);
        float _2354 = _2352 + _2346;
        float _2356 = precise::clamp(_2354, 0.0, 1.0);
        float _2358 = -_2356;
        float _2360 = _2358 + _2210;
        float _2362 = fma(_2360, 500.0, 1.5);
        float _2364 = exp2(_2362);
        float _2366 = 0.0 + _2364;
        float _2368 = precise::clamp(_2366, 0.0, 1.0);
        _2292 = _2368;
    }
    float _2370 = _2292;
    float _2372 = _2308 * _2370;
    float _2374 = _2278 * _2183;
    float _2376 = -_2290;
    float _2378 = fma(_2376, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2380 = -_2278;
    float _2382 = _2380 + 1.0;
    bool _2384 = _1496 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2386 = isnan(_1496);
    bool _2388 = _2384 || _2386;
    bool _2390 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2392 = _2388 || _2390;
    float _2394 = _2194 * _2374;
    float _2396 = -_2372;
    float _2398 = fma(_2396, _2378, 1.0);
    float _2400 = precise::clamp(_2398, 0.0, 1.0);
    float _2402 = _2204 * _2374;
    float _2404 = _2194 * _2382;
    float _2406 = fma(_2200, _2394, _2188);
    float _2408 = fma(_2202, _2394, _2190);
    float _2410 = _2400 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2412 = fma(_2194, _2402, _2192);
    out.m_81.x = _2410;
    float _2414 = _2394;
    float _2416 = _2382;
    float _2418 = _2378;
    float _2420 = _2400;
    if (!_2392)
    {
        _1206 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2422 = _1206;
    float _2424 = _2422;
    float _2426 = _2422;
    if (!_2392)
    {
        _2294 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2428 = _2294;
    out.m_83.x = _2406;
    out.m_83.y = _2408;
    out.m_83.z = _2412;
    out.m_83.w = _2404;
    float _2430 = _2428;
    float _2432 = _2428;
    if (!_2392)
    {
        _2414 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2434 = _2414;
    float _2436 = _2434;
    float _2438 = _2434;
    if (!_2392)
    {
        _2416 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2440 = _2416;
    float _2442 = _2440;
    float _2444 = _2440;
    if (!_2392)
    {
        _2418 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2446 = _2418;
    float _2448 = _2446;
    float _2450 = _2446;
    if (!_2392)
    {
        _2420 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2452 = _2420;
    bool _2454 = !_2392;
    float _2456 = _2452;
    float _2458 = _2452;
    if (!_2454)
    {
        bool _2460 = _1496 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2462 = isnan(_1496);
        bool _2464 = _2460 || _2462;
        bool _2466 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2468 = _2464 || _2466;
        if (!_2468)
        {
            float _2470 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2472 = _1496 + _2470;
            float _2474 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2476 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2474;
            float _2478 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2480 = _2478 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2482 = 1.0 / _2476;
            float _2484 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2486 = _2484 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2488 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2490 = _2488 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2492 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2494 = _2492 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2496 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2498 = _2496 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2500 = _2472 * _2482;
            float _2502 = precise::clamp(_2500, 0.0, 1.0);
            float _2504 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2506 = _2504 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2508 = fma(_2502, _2480, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2510 = fma(_2502, _2506, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2512 = fma(_2502, _2486, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2514 = fma(_2502, _2490, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2516 = fma(_2502, _2494, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2518 = fma(_2502, _2498, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2432 = _2512;
            _2450 = _2516;
            _2426 = _2508;
            _2444 = _2514;
            _2438 = _2510;
            _2458 = _2518;
            _2520 = true;
        }
        else
        {
            bool _2522 = _1496 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2524 = isnan(_1496);
            bool _2526 = _2522 || _2524;
            bool _2528 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2530 = _2526 || _2528;
            if (!_2530)
            {
                _2424 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2532 = _2424;
            _2426 = _2532;
            if (!_2530)
            {
                _2430 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2534 = _2430;
            _2432 = _2534;
            if (!_2530)
            {
                _2436 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2536 = _2436;
            _2438 = _2536;
            if (!_2530)
            {
                _2442 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2538 = _2442;
            _2444 = _2538;
            if (!_2530)
            {
                _2448 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2540 = _2448;
            _2450 = _2540;
            if (!_2530)
            {
                _2456 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2542 = _2456;
            bool _2544 = !_2530;
            _2458 = _2542;
            if (!_2544)
            {
                bool _2546 = _1496 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2548 = isnan(_1496);
                bool _2550 = _2546 || _2548;
                bool _2552 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2554 = _2550 || _2552;
                if (!_2554)
                {
                    float _2556 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2558 = _1496 + _2556;
                    float _2560 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2562 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2560;
                    float _2564 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2566 = _2564 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2568 = 1.0 / _2562;
                    float _2570 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2572 = _2570 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2574 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2576 = _2574 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2578 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2580 = _2578 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2582 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2584 = _2582 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2586 = _2558 * _2568;
                    float _2588 = precise::clamp(_2586, 0.0, 1.0);
                    float _2590 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2592 = _2590 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2594 = fma(_2588, _2566, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2596 = fma(_2588, _2592, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2598 = fma(_2588, _2572, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2600 = fma(_2588, _2576, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2602 = fma(_2588, _2580, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2604 = fma(_2588, _2584, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2432 = _2598;
                    _2450 = _2602;
                    _2426 = _2594;
                    _2444 = _2600;
                    _2438 = _2596;
                    _2458 = _2604;
                    _2520 = true;
                }
                else
                {
                    _2432 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2450 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2426 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2444 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2438 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2458 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2520 = false;
    float _2606 = _2432;
    float _2608 = _2450;
    float _2610 = _2426;
    float _2612 = _2444;
    float _2614 = _2438;
    float _2616 = _2458;
    float _2618 = fma(_1324, -0.5, 0.5);
    float _2620 = precise::clamp(_2618, 0.0, 1.0);
    float _2622 = -_2606;
    float _2624 = _2622 + _2608;
    float _2626 = -_2610;
    float _2628 = _2626 + _2612;
    float _2630 = -_2614;
    float _2632 = _2630 + _2616;
    bool _2634 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2636 = fma(_2620, _2624, _2606);
    float _2638 = fma(_2620, _2628, _2610);
    float _2640 = fma(_2620, _2632, _2614);
    float _2642 = _2636 * 0.586610972881317138671875;
    out.m_61.x = 1.0;
    float _2644 = fma(_2638, 0.298911988735198974609375, _2642);
    float _2646 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2648 = fma(_2640, 0.114477999508380889892578125, _2644);
    out.m_81.w = _2646;
    float _2650 = -_2648;
    float _2652 = _2638 + _2650;
    float _2654 = -_2648;
    float _2656 = _2636 + _2654;
    float _2658 = -_2648;
    float _2660 = _2640 + _2658;
    out.m_85.x = 0.0;
    float _2662 = fma(_2652, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2648);
    float _2664 = fma(_2656, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2648);
    float _2666 = fma(_2660, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2648);
    out.m_87.x = _2662;
    out.m_87.y = _2664;
    out.m_87.z = _2666;
    if (!_2634)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2668 = -_1444;
    float _2670 = _2668 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2672 = -_1446;
    float _2674 = _2672 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2676 = -_1448;
    float _2678 = _2676 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2680 = _2670 * _2670;
    float _2682 = fma(_2674, _2674, _2680);
    float _2684 = fma(_2678, _2678, _2682);
    float _2686 = sqrt(_2684);
    float _2688 = rsqrt(_2684);
    float _2690 = -_2686;
    float _2692 = _2690 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2694 = _2692 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2696 = precise::clamp(_2694, 0.0, 1.0);
    float _2698 = _2674 * _2688;
    float _2700 = _2670 * _2688;
    float _2702 = abs(_2696);
    float _2704 = log2(_2702);
    float _2706 = _2678 * _2688;
    float _2708 = _2698 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2710 = _1324 * _2700;
    float _2712 = -_2700;
    float _2714 = -_2708;
    float _2716 = fma(_2712, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2714);
    float _2718 = fma(_1326, _2698, _2710);
    float _2720 = -_2706;
    float _2722 = fma(_2720, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2716);
    float _2724 = fma(_1328, _2706, _2718);
    float _2726 = precise::clamp(_2724, 0.0, 1.0);
    float _2728 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2730 = _2722 + _2728;
    float _2732 = _2704 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2734 = _2730 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2736 = precise::clamp(_2734, 0.0, 1.0);
    float _2738 = exp2(_2732);
    float _2740 = _2738 * _2736;
    float _2742 = _2726 * _2740;
    float _2744 = _2742 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2746 = _2742 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2748 = _2742 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_85.x = _2744;
    out.m_85.y = _2746;
    out.m_85.z = _2748;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2520 = false;
    bool _1400 = false;
    bool _636 = false;
    bool _486 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _101 = in.m_58.w;
    float _103 = trunc(_101);
    int _106 = int(_103);
    bool _110 = _106 >= 1;
    float _112 = 0.0;
    if (!_110)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _114 = _112;
    float _116 = _114;
    if (!_110)
    {
        out.m_61.x = 0.0;
    }
    int _118 = 0;
    if (!_110)
    {
        float _120 = _114 * 5.0;
        _118 = as_type<int>(_120);
    }
    int _122 = _118;
    int _124 = _122;
    if (!_110)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2805 = as_type<float>(_122);
        out.gl_Position.z = _2805;
    }
    if (!_110)
    {
        return out;
    }
    float _126 = in.m_63.w;
    bool _128 = _126 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _130 = isnan(_126);
    bool _132 = _128 || _130;
    bool _134 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _136 = _132 || _134;
    float _138 = -_126;
    float _140 = _138 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _142 = 0.0;
    float _144 = 0.0;
    if (_136)
    {
        float _146 = float(_106);
        _116 = _146;
    }
    float _148 = _116;
    bool _150 = _140 >= _148;
    bool _152 = !_136;
    bool _154 = _150 || _152;
    float _156 = _148;
    if (_154)
    {
        _156 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _158 = _156;
    if (_154)
    {
        out.m_61.x = 0.0;
    }
    if (_154)
    {
        float _160 = _158 * 5.0;
        _124 = as_type<int>(_160);
    }
    int _162 = _124;
    float _164 = as_type<float>(_162);
    if (_154)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2876 = as_type<float>(_162);
        out.gl_Position.z = _2876;
    }
    if (_154)
    {
        return out;
    }
    float _166 = in.m_63.x;
    float _168 = in.m_63.y;
    float _170 = in.m_63.z;
    float _172 = _140 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _174 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _176 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _178 = _174 || _176;
    bool _180 = isnan(1.0);
    bool _182 = _178 || _180;
    float _184 = _172;
    if (!_182)
    {
        float _186 = _172 * _172;
        float _188 = _186 * 0.5;
        _164 = _188;
    }
    float _190 = _164;
    float _192 = 0.0;
    float _194 = _190;
    if (!_182)
    {
        float _196 = _140 * _140;
        float _198 = _196 * 0.5;
        _192 = _198;
    }
    float _200 = _192;
    if (!_182)
    {
        float _202 = _190 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _194 = _202;
    }
    float _204 = _194;
    bool _206 = !_182;
    float _208 = _204;
    if (!_206)
    {
        float _210 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _212 = log2(_210);
        float _214 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _216 = _214 + 1.0;
        float _218 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _220 = _172 * _212;
        float _222 = 1.0 / _216;
        float _224 = _218 * 0.693147182464599609375;
        float _226 = exp2(_220);
        float _228 = 1.0 / _224;
        float _230 = _226 + (-1.0);
        float _232 = -_230;
        float _234 = fma(_232, _228, _172);
        float _236 = _234 * _222;
        float _238 = _236 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _142 = _228;
        _208 = _238;
        _144 = _226;
    }
    float _240 = _142;
    float _242 = _208;
    float _244 = _144;
    bool _246 = !_182;
    float _248 = _240;
    float _250 = _244;
    if (!_246)
    {
        float _252 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _254 = log2(_252);
        float _256 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _258 = _256 + 1.0;
        float _260 = 1.0 / _258;
        float _262 = _172 * _254;
        float _264 = exp2(_262);
        float _266 = -_264;
        float _268 = _266 + 1.0;
        float _270 = _268 * _260;
        _248 = _264;
        _250 = _258;
        _184 = _270;
    }
    float _272 = _248;
    float _274 = _250;
    float _276 = _184;
    float _278 = _274;
    float _280 = _272;
    if (!_182)
    {
        _278 = _140;
    }
    float _282 = _278;
    float _284 = _242 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _286 = _282;
    if (!_182)
    {
        float _288 = _200 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _280 = _288;
    }
    float _290 = _280;
    bool _292 = !_182;
    float _294 = _290;
    if (!_292)
    {
        float _296 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _298 = log2(_296);
        float _300 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _302 = _300 + 1.0;
        float _304 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _306 = _140 * _298;
        float _308 = 1.0 / _302;
        float _310 = _304 * 0.693147182464599609375;
        float _312 = exp2(_306);
        float _314 = 1.0 / _310;
        float _316 = _312 + (-1.0);
        float _318 = -_316;
        float _320 = fma(_318, _314, _140);
        float _322 = _320 * _308;
        float _324 = _322 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _294 = _324;
    }
    float _326 = _294;
    bool _328 = !_182;
    if (!_328)
    {
        float _330 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _332 = log2(_330);
        float _334 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _336 = _334 + 1.0;
        float _338 = 1.0 / _336;
        float _340 = _140 * _332;
        float _342 = exp2(_340);
        float _344 = -_342;
        float _346 = _344 + 1.0;
        float _348 = _346 * _338;
        _286 = _348;
    }
    float _350 = _286;
    float _352 = _326 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _354 = _242 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _356 = fma(_276, _168, _284);
    float _358 = _326 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _360 = fma(_350, _168, _352);
    float _362 = fma(_276, _166, _354);
    float _364 = _326 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _366 = fma(_350, _166, _358);
    float _368 = _242 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _370 = -_360;
    float _372 = _356 + _370;
    float _374 = fma(_350, _170, _364);
    float _376 = -_366;
    float _378 = _362 + _376;
    float _380 = fma(_276, _170, _368);
    float _382 = _372 * _372;
    float _384 = in.m_65.w;
    float _386 = _372 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _388 = -_374;
    float _390 = _380 + _388;
    float _392 = fma(_378, _378, _382);
    float _394 = _372 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _396 = _372 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _398 = fma(_378, (*spvDescriptorSet0.vp_c10)._m0[5].x, _386);
    float _400 = fma(_390, _390, _392);
    float _402 = fma(_378, (*spvDescriptorSet0.vp_c10)._m0[4].x, _394);
    float _404 = in.m_58.x;
    float _406 = in.m_58.y;
    float _408 = in.m_58.z;
    float _410 = fma(_378, (*spvDescriptorSet0.vp_c10)._m0[6].x, _396);
    float _412 = fma(_390, (*spvDescriptorSet0.vp_c10)._m0[5].z, _398);
    float _414 = sqrt(_400);
    float _416 = fma(_390, (*spvDescriptorSet0.vp_c10)._m0[6].z, _410);
    bool _418 = _414 >= 9.9999999747524270787835121154785e-07;
    bool _420 = isnan(_414);
    bool _422 = _418 || _420;
    bool _424 = isnan(9.9999999747524270787835121154785e-07);
    bool _426 = _422 || _424;
    float _428 = fma(_390, (*spvDescriptorSet0.vp_c10)._m0[4].z, _402);
    float _430 = fma(_356, _384, _406);
    float _432 = fma(_362, _384, _404);
    float _434 = fma(_380, _384, _408);
    float _436 = _356;
    float _438 = _428;
    float _440 = _416;
    float _442 = _434;
    if (_426)
    {
        _436 = _412;
    }
    float _444 = _436;
    float _446 = _444;
    if (!_426)
    {
        bool _448 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _450 = !_448;
        if (!_450)
        {
            float _452 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _454 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _456 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _458 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _452);
            float _460 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _454);
            float _462 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _456);
            float _464 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _458);
            float _466 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _460);
            float _468 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _462);
            float _470 = _464 * _464;
            float _472 = fma(_466, _466, _470);
            float _474 = fma(_468, _468, _472);
            float _476 = rsqrt(_474);
            float _478 = _476 * 9.9999999747524270787835121154785e-07;
            float _480 = _466 * _478;
            float _482 = _464 * _478;
            float _484 = _468 * _478;
            _446 = _482;
            _438 = _480;
            _440 = _484;
            _486 = true;
        }
        else
        {
            float _488 = _168 * _168;
            float _490 = fma(_166, _166, _488);
            float _492 = fma(_170, _170, _490);
            float _494 = sqrt(_492);
            bool _496 = _494 >= 9.9999999747524270787835121154785e-07;
            bool _498 = isnan(_494);
            bool _500 = _496 || _498;
            bool _502 = isnan(9.9999999747524270787835121154785e-07);
            bool _504 = _500 || _502;
            if (!_504)
            {
                float _506 = _406 * _406;
                float _508 = fma(_404, _404, _506);
                float _510 = fma(_408, _408, _508);
                float _512 = sqrt(_510);
                bool _514 = _512 >= 9.9999999747524270787835121154785e-07;
                bool _516 = isnan(_512);
                bool _518 = _514 || _516;
                bool _520 = isnan(9.9999999747524270787835121154785e-07);
                bool _522 = _518 || _520;
                if (!_522)
                {
                    float _524 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _526 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _524);
                    float _528 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _526);
                    float _530 = rsqrt(_528);
                    float _532 = _530 * 9.9999999747524270787835121154785e-07;
                    float _534 = _532 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _536 = _532 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _538 = _532 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _446 = _536;
                    _438 = _534;
                    _440 = _538;
                    _486 = true;
                }
                else
                {
                    float _540 = _406 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _542 = _406 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _544 = _406 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _546 = fma(_404, (*spvDescriptorSet0.vp_c10)._m0[5].x, _540);
                    float _548 = fma(_404, (*spvDescriptorSet0.vp_c10)._m0[4].x, _542);
                    float _550 = fma(_404, (*spvDescriptorSet0.vp_c10)._m0[6].x, _544);
                    float _552 = fma(_408, (*spvDescriptorSet0.vp_c10)._m0[5].z, _546);
                    float _554 = fma(_408, (*spvDescriptorSet0.vp_c10)._m0[4].z, _548);
                    float _556 = fma(_408, (*spvDescriptorSet0.vp_c10)._m0[6].z, _550);
                    float _558 = _552 * _552;
                    float _560 = fma(_554, _554, _558);
                    float _562 = fma(_556, _556, _560);
                    float _564 = rsqrt(_562);
                    float _566 = _564 * 9.9999999747524270787835121154785e-07;
                    float _568 = _554 * _566;
                    float _570 = _552 * _566;
                    float _572 = _556 * _566;
                    _446 = _570;
                    _438 = _568;
                    _440 = _572;
                    _486 = true;
                }
            }
            else
            {
                float _574 = _168 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _576 = _168 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _578 = _168 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _580 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[5].x, _574);
                float _582 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[4].x, _576);
                float _584 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[6].x, _578);
                float _586 = fma(_170, (*spvDescriptorSet0.vp_c10)._m0[5].z, _580);
                float _588 = fma(_170, (*spvDescriptorSet0.vp_c10)._m0[4].z, _582);
                float _590 = fma(_170, (*spvDescriptorSet0.vp_c10)._m0[6].z, _584);
                float _592 = _586 * _586;
                float _594 = fma(_588, _588, _592);
                float _596 = fma(_590, _590, _594);
                float _598 = rsqrt(_596);
                float _600 = _598 * 9.9999999747524270787835121154785e-07;
                float _602 = _588 * _600;
                float _604 = _586 * _600;
                float _606 = _590 * _600;
                _446 = _604;
                _438 = _602;
                _440 = _606;
            }
        }
    }
    _486 = false;
    float _608 = _446;
    float _610 = _438;
    float _612 = _440;
    bool _614 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _616 = !_614;
    float _634;
    if (!_616)
    {
        float _618 = in.m_67.x;
        float _620 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _622 = _618 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _624 = fma(_622, (*spvDescriptorSet0.vp_c9)._m0[12].x, _140);
        float _626 = _624 * _620;
        float _628 = floor(_626);
        float _630 = -_628;
        float _632 = _626 + _630;
        _634 = _632;
        _636 = true;
    }
    else
    {
        float _638 = float(_106);
        float _640 = 1.0 / _638;
        float _642 = _140 * _640;
        _634 = _642;
    }
    _636 = false;
    float _644 = _634;
    float _646 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _648 = _644 + _646;
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _652 = _644 + _650;
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _656 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _654;
    float _658 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _660 = _658 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _662 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _664 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _662;
    float _666 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _668 = _666 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _670 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _672 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _670;
    float _674 = 1.0 / _660;
    bool _676 = _644 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _678 = isnan(_644);
    bool _680 = _676 || _678;
    bool _682 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _684 = _680 || _682;
    float _686 = float(_684);
    bool _688 = _644 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _690 = isnan(_644);
    bool _692 = _688 || _690;
    bool _694 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _696 = _692 || _694;
    float _698 = float(_696);
    float _700 = 1.0 / _656;
    float _702 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _704 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _702;
    float _706 = 1.0 / _664;
    float _708 = 1.0 / _668;
    float _710 = _648 * _700;
    float _712 = _608 * _608;
    float _714 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _716 = _644 + _714;
    float _718 = fma(_704, _710, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _720 = fma(_610, _610, _712);
    float _722 = 1.0 / _672;
    float _724 = _652 * _706;
    float _726 = fma(_612, _612, _720);
    float _728 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _730 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _728;
    float _732 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _734 = _732 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _736 = _716 * _708;
    float _738 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _740 = _644 + _738;
    float _742 = rsqrt(_726);
    float _744 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _746 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _744;
    float _748 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _750 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _748;
    float _752 = _740 * _674;
    float _754 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _756 = _644 + _754;
    float _758 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _760 = _758 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _762 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _764 = _762 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _766 = fma(_734, _736, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _768 = _756 * _722;
    float _770 = fma(_760, _736, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _772 = fma(_764, _736, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    bool _774 = _644 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _776 = isnan(_644);
    bool _778 = _774 || _776;
    bool _780 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _782 = _778 || _780;
    float _784 = float(_782);
    float _786 = fma(_730, _724, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _788 = _644 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _790 = isnan(_644);
    bool _792 = _788 || _790;
    bool _794 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _796 = _792 || _794;
    float _798 = float(_796);
    float _800 = fma(_746, _724, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _802 = fma(_750, _724, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _804 = -_784;
    float _806 = _804 + 1.0;
    float _808 = _742 * _608;
    float _810 = -_798;
    float _812 = _810 + 1.0;
    float _814 = -_698;
    float _816 = _814 + 1.0;
    float _818 = _798 * _806;
    float _820 = _742 * _610;
    float _822 = _686 * _812;
    float _824 = -_686;
    float _826 = _824 + 1.0;
    bool _828 = _644 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _830 = isnan(_644);
    bool _832 = _828 || _830;
    bool _834 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _836 = _832 || _834;
    float _838 = float(_836);
    float _840 = _808 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _842 = _742 * _612;
    bool _844 = _644 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _846 = isnan(_644);
    bool _848 = _844 || _846;
    bool _850 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _852 = _848 || _850;
    float _854 = float(_852);
    float _856 = _698 * _826;
    float _858 = _838 * _816;
    float _860 = fma(_820, (*spvDescriptorSet0.vp_c10)._m0[8].y, _840);
    float _862 = -_838;
    float _864 = _862 + 1.0;
    float _866 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _868 = _866 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _870 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _872 = _870 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _874 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _876 = _874 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _878 = fma(_842, (*spvDescriptorSet0.vp_c10)._m0[10].y, _860);
    float _880 = _854 * _864;
    float _882 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _884 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _882;
    float _886 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _888 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _886;
    float _890 = fma(_868, _752, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _892 = fma(_872, _752, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _894 = fma(_876, _752, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _896 = _786 * _880;
    float _898 = abs(_878);
    bool _900 = _898 > 0.99989998340606689453125;
    float _902 = -_854;
    float _904 = _902 + 1.0;
    float _906 = fma(_884, _710, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _908 = fma(_888, _710, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _910 = _800 * _880;
    float _912 = _802 * _880;
    float _914 = fma(_904, (*spvDescriptorSet0.vp_c9)._m0[143].x, _896);
    float _916 = fma(_904, (*spvDescriptorSet0.vp_c9)._m0[143].y, _910);
    float _918 = fma(_766, _858, _914);
    float _920 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _922 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _920;
    float _924 = fma(_770, _858, _916);
    float _926 = fma(_906, _856, _918);
    float _928 = fma(_904, (*spvDescriptorSet0.vp_c9)._m0[143].z, _912);
    float _930 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _932 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _930;
    float _934 = _906;
    float _936 = _922;
    float _938 = _908;
    float _940 = _718;
    if (_900)
    {
        _934 = 0.001000000047497451305389404296875;
    }
    float _942 = _934;
    float _944 = fma(_922, _768, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _946 = fma(_772, _858, _928);
    if (!_900)
    {
        _936 = (*spvDescriptorSet0.vp_c10)._m0[8].y;
    }
    float _948 = _936;
    float _950 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _952 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _950;
    float _954 = fma(_932, _768, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _956 = _948;
    if (_900)
    {
        float _958 = fma(_942, (*spvDescriptorSet0.vp_c10)._m0[8].z, (*spvDescriptorSet0.vp_c10)._m0[8].y);
        _956 = _958;
    }
    float _960 = _956;
    float _962 = fma(_908, _856, _924);
    if (!_900)
    {
        _938 = (*spvDescriptorSet0.vp_c10)._m0[10].y;
    }
    float _964 = _938;
    float _966 = fma(_718, _856, _946);
    float _968 = _964;
    if (_900)
    {
        float _970 = fma(_942, (*spvDescriptorSet0.vp_c10)._m0[10].z, (*spvDescriptorSet0.vp_c10)._m0[10].y);
        _968 = _970;
    }
    float _972 = _968;
    float _974 = -_960;
    float _976 = _842 * _974;
    float _978 = fma(_952, _768, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    if (!_900)
    {
        _940 = (*spvDescriptorSet0.vp_c10)._m0[9].y;
    }
    float _980 = _940;
    float _982 = in.m_65.x;
    float _984 = in.m_65.y;
    float _986 = in.m_65.z;
    float _988 = fma(_890, _822, _926);
    float _990 = fma(_892, _822, _962);
    float _992 = fma(_894, _822, _966);
    float _994 = _980;
    if (_900)
    {
        float _996 = fma(_942, (*spvDescriptorSet0.vp_c10)._m0[9].z, (*spvDescriptorSet0.vp_c10)._m0[9].y);
        _994 = _996;
    }
    float _998 = _994;
    float _1000 = -_972;
    float _1002 = _808 * _1000;
    float _1004 = -_972;
    float _1006 = -_976;
    float _1008 = fma(_820, _1004, _1006);
    float _1010 = in.m_69.x;
    float _1012 = in.m_69.y;
    float _1014 = in.m_69.z;
    float _1016 = -_998;
    float _1018 = _820 * _1016;
    float _1020 = -_998;
    float _1022 = -_1002;
    float _1024 = fma(_842, _1020, _1022);
    float _1026 = _1008 * _1008;
    float _1028 = fma(_978, _818, _988);
    float _1030 = -_960;
    float _1032 = -_1018;
    float _1034 = fma(_808, _1030, _1032);
    float _1036 = fma(_944, _818, _990);
    float _1038 = fma(_1024, _1024, _1026);
    float _1040 = fma(_784, (*spvDescriptorSet0.vp_c9)._m0[148].x, _1028);
    float _1042 = fma(_954, _818, _992);
    float _1044 = fma(_1034, _1034, _1038);
    float _1046 = fma(_784, (*spvDescriptorSet0.vp_c9)._m0[148].y, _1036);
    float _1048 = fma(_784, (*spvDescriptorSet0.vp_c9)._m0[148].z, _1042);
    float _1050 = rsqrt(_1044);
    float _1052 = _1040 * _982;
    float _1054 = _1046 * _984;
    float _1056 = _1048 * _986;
    float _1058 = _430 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1060 = _1052 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1062 = _1054 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1064 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1010);
    float _1066 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1014);
    float _1068 = _1056 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1070 = fma(_432, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1058);
    float _1072 = _1060 * _1064;
    float _1074 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1012);
    float _1076 = _430 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1078 = _1068 * _1066;
    bool _1080 = _1012 != 0.0;
    bool _1082 = isnan(_1012);
    bool _1084 = _1080 || _1082;
    bool _1086 = isnan(0.0);
    bool _1088 = _1084 || _1086;
    float _1090 = _1024 * _1050;
    float _1092 = _1062 * _1074;
    float _1094 = _1008 * _1050;
    float _1096 = _1034 * _1050;
    float _1098 = fma(_432, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1076);
    float _1100 = fma(_434, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1070);
    float _1102 = _1092 * _820;
    float _1104 = _1092 * _842;
    float _1106 = _808 * _1096;
    float _1108 = _820 * _1094;
    float _1110 = fma(_434, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1098);
    float _1112 = fma(_1072, _1090, _1102);
    float _1114 = fma(_1072, _1096, _1104);
    float _1116 = -_1106;
    float _1118 = fma(_842, _1094, _1116);
    float _1120 = -_1108;
    float _1122 = fma(_808, _1090, _1120);
    float _1124 = _1100 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1126 = _1110 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1128 = fma(_1078, _1118, _1112);
    float _1130 = fma(_1078, _1122, _1114);
    float _1132 = _430 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _1134 = _1010 == 0.0;
    bool _1136 = !_1088;
    bool _1138 = _1134 && _1136;
    float _1140 = _1124 + _1128;
    float _1142 = _1126 + _1130;
    float _1144 = fma(_432, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1132);
    float _1146 = in.m_71.x;
    float _1148 = in.m_71.y;
    float _1150 = in.m_71.z;
    float _1152 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1154 = _1140 + _1152;
    float _1156 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1158 = _1142 + _1156;
    float _1160 = _1092 * _808;
    float _1162 = _842 * _1090;
    float _1164 = _1154 * _1154;
    float _1166 = _1158 * _1158;
    bool _1168 = _1014 == 0.0;
    bool _1170 = _1168 && _1138;
    float _1172 = fma(_1072, _1094, _1160);
    float _1174 = -_1162;
    float _1176 = fma(_820, _1096, _1174);
    float _1178 = _1164 + _1166;
    float _1180 = fma(_434, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1144);
    float _1182 = fma(_1078, _1176, _1172);
    float _1184 = sqrt(_1178);
    float _1186 = _1180 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1188 = _1186 + _1182;
    float _1190 = _1146;
    float _1192 = _1148;
    float _1194 = _1150;
    float _1196 = _1012;
    float _1198 = _1010;
    float _1200 = _1182;
    float _1202 = _1140;
    float _1204 = _1158;
    float _1206 = _1124;
    if (!_1170)
    {
        float _1208 = fma(_1010, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1146);
        _1190 = _1208;
    }
    float _1210 = _1190;
    if (!_1170)
    {
        float _1212 = fma(_1012, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1148);
        _1192 = _1212;
    }
    float _1214 = _1192;
    float _1216 = _1214;
    if (!_1170)
    {
        float _1218 = fma(_1014, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1150);
        _1194 = _1218;
    }
    float _1220 = _1194;
    bool _1222 = _1184 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    if (!_1222)
    {
        _442 = _1140;
    }
    float _1224 = _442;
    float _1226 = _1224;
    if (!_1222)
    {
        _1196 = _1166;
    }
    float _1228 = _1196;
    float _1230 = _1228;
    if (!_1222)
    {
        _1198 = _1164;
    }
    float _1232 = _1198;
    float _1234 = _1232;
    if (!_1222)
    {
        _1200 = _1142;
    }
    float _1236 = _1200;
    float _1238 = _1236;
    if (!_1222)
    {
        _1202 = _1188;
    }
    float _1240 = _1202;
    bool _1242 = !_1222;
    float _1244 = _1240;
    if (!_1242)
    {
        float _1246 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1248 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1250 = _1184 + _1248;
        float _1252 = rsqrt(_1178);
        float _1254 = _1250 * _1246;
        float _1256 = _1188 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1258 = _1254 * 0.15915493667125701904296875;
        float _1260 = _1258 * 6.283185482025146484375;
        float _1262 = sin(_1260);
        float _1264 = _1258 * 6.283185482025146484375;
        float _1266 = cos(_1264);
        float _1268 = fma(_1262, _1256, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1270 = _1252 * _1268;
        float _1272 = _1266 + (-1.0);
        float _1274 = fma(_1154, _1270, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1276 = fma(_1158, _1270, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1278 = _1272 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1280 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1282 = _1274 + _1280;
        float _1284 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1286 = _1276 + _1284;
        float _1288 = fma(_1188, _1266, _1278);
        float _1290 = _1282 * _1282;
        float _1292 = _1286 * _1286;
        _1244 = _1288;
        _1234 = _1290;
        _1230 = _1292;
        _1226 = _1274;
        _1238 = _1276;
    }
    float _1294 = _1244;
    float _1296 = _1234;
    float _1298 = _1230;
    float _1300 = _1226;
    float _1302 = _1238;
    float _1304 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1306 = _1294 + _1304;
    float _1308 = _808 * _1214;
    float _1310 = _820 * _1214;
    float _1312 = _842 * _1214;
    float _1314 = fma(_1306, _1306, _1296);
    float _1316 = fma(_1094, _1210, _1308);
    float _1318 = fma(_1090, _1210, _1310);
    float _1320 = fma(_1096, _1210, _1312);
    float _1322 = _1314 + _1298;
    float _1324 = fma(_1176, _1220, _1316);
    float _1326 = fma(_1118, _1220, _1318);
    float _1328 = fma(_1122, _1220, _1320);
    float _1330 = sqrt(_1322);
    float _1332 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1334 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1336 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1338 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1340 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1342 = _1332 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1344 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1346 = _1334 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1348 = _1336 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1350 = _1338 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1352 = _1340 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1354 = _1344 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_73.x = _1326;
    out.m_73.y = _1324;
    out.m_73.z = _1328;
    bool _1356 = _1330 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1358 = isnan(_1330);
    bool _1360 = _1356 || _1358;
    bool _1362 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1364 = _1360 || _1362;
    out.m_75.x = _1342;
    out.m_75.y = _1346;
    out.m_75.z = _1348;
    out.m_77.x = _1350;
    out.m_77.y = _1352;
    out.m_77.z = _1354;
    if (!_1364)
    {
        _1216 = 1.0;
    }
    float _1366 = _1216;
    bool _1368 = !_1364;
    float _1370 = _1366;
    if (!_1368)
    {
        bool _1372 = _1330 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1374 = isnan(_1330);
        bool _1376 = _1372 || _1374;
        bool _1378 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1380 = _1376 || _1378;
        if (!_1380)
        {
            float _1382 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1384 = _1330 + _1382;
            float _1386 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1388 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1386;
            float _1390 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1392 = _1390 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1394 = 1.0 / _1388;
            float _1396 = _1384 * _1394;
            float _1398 = fma(_1396, _1392, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1370 = _1398;
            _1400 = true;
        }
        else
        {
            bool _1402 = _1330 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1404 = isnan(_1330);
            bool _1406 = _1402 || _1404;
            bool _1408 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1410 = _1406 || _1408;
            if (!_1410)
            {
                float _1412 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1414 = _1330 + _1412;
                float _1416 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1418 = _1416 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1420 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1422 = _1420 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1424 = 1.0 / _1418;
                float _1426 = _1414 * _1424;
                float _1428 = fma(_1426, _1422, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1370 = _1428;
                _1400 = true;
            }
            else
            {
                _1370 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1400 = false;
    float _1430 = _1370;
    float _1432 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1434 = _1294 + _1432;
    float _1436 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1438 = _1300 + _1436;
    float _1440 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1442 = _1302 + _1440;
    float _1444 = fma(_1434, _1430, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1446 = fma(_1438, _1430, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1448 = fma(_1442, _1430, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1450 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1452 = _1444 + _1450;
    float _1454 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1456 = _1446 + _1454;
    float _1458 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1460 = _1448 + _1458;
    float _1462 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _1464 = _1452 * _1452;
    float _1466 = _1186 + _1462;
    float _1468 = fma(_1456, _1456, _1464);
    float _1470 = _1466 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1472 = fma(_1460, _1460, _1468);
    float _1474 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1476 = _1466 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1478 = fma(_1124, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1470);
    float _1480 = rsqrt(_1472);
    float _1482 = fma(_1124, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1474);
    float _1484 = fma(_1124, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1476);
    float _1486 = fma(_1126, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1478);
    float _1488 = fma(_1126, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1490 = fma(_1126, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1482);
    float _1492 = fma(_1126, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1484);
    float _1494 = _1486 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1496 = sqrt(_1472);
    float _1498 = _1492 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1500 = _1480 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1502 = _1490 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1504 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1506 = trunc(_1494);
    int _1508 = int(_1506);
    float _1510 = _1456 * _1500;
    float _1512 = _1460 * _1500;
    float _1514 = fma(_1124, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1504);
    float _1516 = _1444 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1518 = _1510 * _1510;
    float _1520 = _1512 * _1512;
    float _1522 = fma(_1126, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1514);
    float _1524 = 1.0 / _1502;
    float _1526 = fma(_1446, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1516);
    float _1528 = _1518 + _1520;
    float _1530 = _1522 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1532 = _1530 + _1502;
    float _1534 = sqrt(_1528);
    int _1536 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1538 = _1508 + _1536;
    int _1540 = _1538 + 1;
    float _1542 = _1532 * _1524;
    float _1544 = _1542 * 0.5;
    float _1546 = trunc(_1498);
    int _1548 = int(_1546);
    float _1550 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1552 = fma(_1544, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1550);
    bool _1554 = _1534 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1556 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1558 = _1534 + _1556;
    float _1560 = 1.0 / _1552;
    int _1562 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1564 = _1548 + _1562;
    int _1566 = _1564 + 1;
    float _1568 = floor(_1488);
    float _1570 = _1184;
    float _1572 = _1558;
    int _1574 = 2;
    float _1576 = _1510;
    float _1578 = _1512;
    float _1580 = _1518;
    if (_1554)
    {
        float _1582 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1570 = _1582;
    }
    float _1584 = _1570;
    float _1586 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1588 = _1560 * _1586;
    bool _1590 = _1588 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1592 = fma(_1124, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    bool _1594 = _1588 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1596 = -_1568;
    float _1598 = _1488 + _1596;
    float _1600 = floor(_1592);
    if (_1554)
    {
        float _1602 = _1558 * _1584;
        _1572 = _1602;
    }
    float _1604 = _1572;
    if (!_1590)
    {
        _1574 = 1;
    }
    int _1606 = _1574;
    float _1608 = 0.0;
    int _1610 = _1606;
    if (_1554)
    {
        float _1612 = _1604 * 0.15915493667125701904296875;
        _1608 = _1612;
    }
    float _1614 = _1608;
    float _1616 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1618 = _1486;
    if (_1554)
    {
        float _1620 = _1614 * 6.283185482025146484375;
        float _1622 = sin(_1620);
        _1618 = _1622;
    }
    float _1624 = _1618;
    float _1626 = precise::max(0.0, _1616);
    float _1628 = -_1600;
    float _1630 = _1592 + _1628;
    bool _1632 = !_1590;
    int _1634 = _1632 ? 0 : 1;
    float _1636 = -_1500;
    float _1638 = -_1626;
    float _1640 = fma(_1452, _1636, _1638);
    float _1642 = as_type<float>(_1634);
    float _1644 = _1640;
    if (!_1594)
    {
        _1610 = _1634;
    }
    int _1646 = _1610;
    float _1648 = _1626;
    if (_1554)
    {
        float _1650 = rsqrt(_1528);
        _1648 = _1650;
    }
    float _1652 = _1648;
    int _1654 = _1540 | _1566;
    if (_1554)
    {
        float _1656 = _1640 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1642 = _1656;
    }
    float _1658 = _1642;
    int _1660 = _1646 << 6;
    bool _1662 = _1540 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1664 = _1660 + 96;
    uint _1667 = uint(int(uint(_1664) >> uint(2)));
    uint _1669 = uint(int(uint(int(_1667)) >> uint(2)));
    int _1671 = int(_1667) & 3;
    float _1673 = (*spvDescriptorSet0.vp_c15)._m0[int(_1669)][_1671];
    int _1675 = int(_1667) + 1;
    uint _1677 = uint(int(uint(_1675) >> uint(2)));
    int _1679 = _1675 & 3;
    float _1681 = (*spvDescriptorSet0.vp_c15)._m0[int(_1677)][_1679];
    float _1683 = _1624;
    if (_1554)
    {
        float _1685 = fma(_1624, _1658, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1683 = _1685;
    }
    float _1687 = _1683;
    float _1689 = _1614;
    if (_1554)
    {
        float _1691 = _1614 * 6.283185482025146484375;
        float _1693 = cos(_1691);
        _1689 = _1693;
    }
    float _1695 = _1689;
    bool _1697 = _1654 < 0;
    bool _1699 = _1697 || _1662;
    bool _1701 = _1566 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1703 = _1701 || _1699;
    int _1705 = _1660 + 104;
    uint _1707 = uint(int(uint(_1705) >> uint(2)));
    uint _1709 = uint(int(uint(int(_1707)) >> uint(2)));
    int _1711 = int(_1707) & 3;
    float _1713 = (*spvDescriptorSet0.vp_c15)._m0[int(_1709)][_1711];
    int _1715 = int(_1707) + 1;
    uint _1717 = uint(int(uint(_1715) >> uint(2)));
    int _1719 = _1715 & 3;
    float _1721 = (*spvDescriptorSet0.vp_c15)._m0[int(_1717)][_1719];
    float _1723 = 0.0;
    if (_1554)
    {
        float _1725 = _1652 * _1687;
        _1723 = _1725;
    }
    float _1727 = _1723;
    float _1729 = _1727;
    if (_1554)
    {
        float _1731 = _1510 * _1727;
        _1576 = _1731;
    }
    float _1733 = _1576;
    if (_1554)
    {
        float _1735 = _1512 * _1727;
        _1578 = _1735;
    }
    float _1737 = _1578;
    if (!_1554)
    {
        _1729 = _1520;
    }
    float _1739 = _1729;
    int _1741 = _1660 + 48;
    uint _1743 = uint(int(uint(_1741) >> uint(2)));
    uint _1745 = uint(int(uint(int(_1743)) >> uint(2)));
    int _1747 = int(_1743) & 3;
    float _1749 = (*spvDescriptorSet0.vp_c15)._m0[int(_1745)][_1747];
    int _1751 = int(_1743) + 1;
    uint _1753 = uint(int(uint(_1751) >> uint(2)));
    int _1755 = _1751 & 3;
    float _1757 = (*spvDescriptorSet0.vp_c15)._m0[int(_1753)][_1755];
    float _1759 = _1739;
    if (_1554)
    {
        float _1761 = _1733 * _1733;
        _1580 = _1761;
    }
    float _1763 = _1580;
    if (_1554)
    {
        float _1765 = _1695 + (-1.0);
        _1204 = _1765;
    }
    float _1767 = _1204;
    if (_1554)
    {
        float _1769 = _1737 * _1737;
        _1759 = _1769;
    }
    float _1771 = _1759;
    float _1773 = 0.0;
    if (!_1703)
    {
        float _1775 = floor(_1498);
        _1773 = _1775;
    }
    float _1777 = _1773;
    float _1779 = 0.0;
    if (_1554)
    {
        float _1781 = _1767 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1779 = _1781;
    }
    float _1783 = _1779;
    float _1785 = fma(_1448, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1526);
    int _1787 = _1660 + 64;
    uint _1789 = uint(int(uint(_1787) >> uint(2)));
    uint _1791 = uint(int(uint(int(_1789)) >> uint(2)));
    int _1793 = int(_1789) & 3;
    float _1795 = (*spvDescriptorSet0.vp_c15)._m0[int(_1791)][_1793];
    int _1797 = int(_1789) + 1;
    uint _1799 = uint(int(uint(_1797) >> uint(2)));
    int _1801 = _1797 & 3;
    float _1803 = (*spvDescriptorSet0.vp_c15)._m0[int(_1799)][_1801];
    if (_1554)
    {
        float _1805 = fma(_1640, _1695, _1783);
        _1644 = _1805;
    }
    float _1807 = _1644;
    float _1809 = _1785 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1811 = fma(_1807, _1807, _1763);
    float _1813 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    int _1815 = _1660 + 56;
    uint _1817 = uint(int(uint(_1815) >> uint(2)));
    uint _1819 = uint(int(uint(int(_1817)) >> uint(2)));
    int _1821 = int(_1817) & 3;
    float _1823 = (*spvDescriptorSet0.vp_c15)._m0[int(_1819)][_1821];
    int _1825 = int(_1817) + 1;
    uint _1827 = uint(int(uint(_1825) >> uint(2)));
    int _1829 = _1825 & 3;
    float _1831 = (*spvDescriptorSet0.vp_c15)._m0[int(_1827)][_1829];
    float _1833 = _1809 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1835 = _1811 + _1771;
    float _1837 = -_1833;
    float _1839 = fma(_1837, _1813, 1.0);
    int _1841 = as_type<int>(_1833);
    if (!_1703)
    {
        int _1843 = _1566 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1845 = _1843 + _1540;
        _1841 = _1845;
    }
    int _1847 = _1841;
    int _1849 = _1660 + 80;
    uint _1851 = uint(int(uint(_1849) >> uint(2)));
    uint _1853 = uint(int(uint(int(_1851)) >> uint(2)));
    int _1855 = int(_1851) & 3;
    float _1857 = (*spvDescriptorSet0.vp_c15)._m0[int(_1853)][_1855];
    int _1859 = int(_1851) + 1;
    uint _1861 = uint(int(uint(_1859) >> uint(2)));
    int _1863 = _1859 & 3;
    float _1865 = (*spvDescriptorSet0.vp_c15)._m0[int(_1861)][_1863];
    float _1867 = log2(_1839);
    int _1869 = _1660 + 72;
    uint _1871 = uint(int(uint(_1869) >> uint(2)));
    uint _1873 = uint(int(uint(int(_1871)) >> uint(2)));
    int _1875 = int(_1871) & 3;
    float _1877 = (*spvDescriptorSet0.vp_c15)._m0[int(_1873)][_1875];
    int _1879 = int(_1871) + 1;
    uint _1881 = uint(int(uint(_1879) >> uint(2)));
    int _1883 = _1879 & 3;
    float _1885 = (*spvDescriptorSet0.vp_c15)._m0[int(_1881)][_1883];
    float _1887 = _1466 * _1681;
    float _1889 = fma(_1124, _1673, _1887);
    int _1891 = _1660 + 88;
    uint _1893 = uint(int(uint(_1891) >> uint(2)));
    uint _1895 = uint(int(uint(int(_1893)) >> uint(2)));
    int _1897 = int(_1893) & 3;
    float _1899 = (*spvDescriptorSet0.vp_c15)._m0[int(_1895)][_1897];
    int _1901 = int(_1893) + 1;
    uint _1903 = uint(int(uint(_1901) >> uint(2)));
    int _1905 = _1901 & 3;
    float _1907 = (*spvDescriptorSet0.vp_c15)._m0[int(_1903)][_1905];
    float _1909 = fma(_1126, _1713, _1889);
    float _1911 = _1867 * 0.693147182464599609375;
    float _1913 = _1909 + _1721;
    float _1915 = _1466 * _1757;
    float _1917 = rsqrt(_1835);
    float _1919 = fma(_1124, _1749, _1915);
    int _1921 = as_type<int>(_1915);
    int _1923 = as_type<int>(_1673);
    if (!_1703)
    {
        int _1925 = _1847 << 2;
        _1921 = _1925;
    }
    int _1927 = _1921;
    float _1929 = _1466 * _1803;
    int _1931 = _1927;
    float _1933 = _1803;
    if (!_1703)
    {
        int _1935 = 12 & _1927;
        _1931 = _1935;
    }
    int _1937 = _1931;
    float _1939 = 1.0 / _1913;
    if (!_1703)
    {
        float _1941 = -_1777;
        float _1943 = _1498 + _1941;
        _1933 = _1943;
    }
    float _1945 = _1933;
    float _1947 = fma(_1124, _1795, _1929);
    float _1949 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1951 = fma(_1496, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1949);
    float _1953 = precise::clamp(_1951, 0.0, 1.0);
    float _1955 = _1911 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1957 = fma(_1126, _1823, _1919);
    float _1959 = _1917 * _1733;
    float _1961 = _1917 * _1807;
    float _1963 = _1957 + _1831;
    float _1965 = _1444 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1967 = _1959 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1969 = _1917 * _1737;
    float _1971 = _1466 * _1865;
    int _1973 = as_type<int>(_1865);
    if (!_1703)
    {
        uint _1975 = uint(int(uint(_1847) >> uint(2)));
        _1973 = int(_1975);
    }
    int _1977 = _1973;
    float _1979 = _1963 * _1939;
    float _1981 = fma(_1446, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1965);
    float _1983 = fma(_1124, _1857, _1971);
    if (!_1703)
    {
        int _1985 = _1977 << 4;
        int _1987 = _1985 + _1937;
        _1923 = _1987;
    }
    int _1989 = _1923;
    float _1991 = -_1953;
    float _1993 = _1991 + 1.0;
    bool _1995 = _1979 >= 0.0;
    float _1997 = fma(_1126, _1877, _1947);
    float _1999 = _1947;
    if (!_1703)
    {
        int _2001 = _1989 + 400;
        uint _2003 = uint(int(uint(_2001) >> uint(2)));
        uint _2005 = uint(int(uint(int(_2003)) >> uint(2)));
        int _2007 = int(_2003) & 3;
        float _2009 = (*spvDescriptorSet0.vp_c15)._m0[int(_2005)][_2007];
        _1999 = _2009;
    }
    float _2011 = _1999;
    bool _2013 = _1979 <= 1.0;
    bool _2015 = _2013 && _1995;
    float _2017 = _1997 + _1885;
    float _2019 = _1444 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2021 = fma(_1448, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1981);
    float _2023 = abs(_1993);
    float _2025 = log2(_2023);
    float _2027 = fma(_1126, _1899, _1983);
    float _2029 = -_1967;
    float _2031 = fma(_1961, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2029);
    float _2033 = fma(_1446, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2019);
    float _2035 = _2017 * _1939;
    float _2037 = _1444 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2039 = -_1969;
    float _2041 = fma(_2039, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2031);
    float _2043 = fma(_1448, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2033);
    float _2045 = _2021 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2047 = fma(_1446, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2037);
    bool _2049 = _2035 >= 0.0;
    bool _2051 = _2049 && _2015;
    float _2053 = _2043 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2055 = _2045 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2057 = fma(_1448, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2047);
    float _2059 = fma(_2041, 0.5, 0.5);
    bool _2061 = _2035 <= 1.0;
    bool _2063 = _2061 && _2051;
    float _2065 = fma(_2053, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2055);
    float _2067 = fma(_2041, -0.5, 0.5);
    float _2069 = _2057 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2071 = fma(_2059, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2073 = fma(_1809, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2065);
    float _2075 = _2025 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2077 = _2027 + _1907;
    float _2079 = sqrt(_2067);
    float _2081 = fma(_2069, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2073);
    float _2083 = fma(_2059, _2071, -0.212114393711090087890625);
    float _2085 = _2045 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2087 = _1961 + 1.0;
    float _2089 = fma(_2059, _2083, 1.570728778839111328125);
    float _2091 = _2083;
    float _2093 = _2087;
    if (_2063)
    {
        float _2095 = float(_1646);
        _2091 = _2095;
    }
    float _2097 = _2091;
    float _2099 = exp2(_2075);
    float _2101 = fma(_2053, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2085);
    float _2103 = fma(_1809, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2101);
    float _2105 = 1.0 / _2081;
    float _2107 = _2045 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2109 = _2079 * 0.636619746685028076171875;
    float _2111 = fma(_2069, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2103);
    float _2113 = fma(_2053, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2107);
    float _2115 = -_2089;
    float _2117 = fma(_2109, _2115, 1.0);
    float _2119 = _2097;
    if (_2063)
    {
        float _2121 = rint(_2097);
        float _2123 = precise::max(_2121, 0.0);
        uint _2125 = uint(_2123);
        uint _2127 = clamp(_2125, 0u, 65535u);
        _2119 = as_type<float>(_2127);
    }
    float _2129 = _2119;
    float _2131 = fma(_1809, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2113);
    float _2133 = -_1961;
    float _2135 = fma(_2099, _2087, _2133);
    float _2137 = fma(_2069, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2131);
    float _2139 = _2077 * _1939;
    float _2141 = _2041;
    if (!_1703)
    {
        float _2143 = floor(_1494);
        _2141 = _2143;
    }
    float _2145 = _2141;
    float _2147 = _2137 * _2105;
    float _2149 = _2111 * _2105;
    float2 _6210 = float2(_1630, _1598);
    float _2151 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6210, float2(0.0), isnan(_6210)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6210, float2(0.0), isnan(_6210)), level(0.0)).x;
    float _2153 = fma(_2147, -0.5, 0.5);
    float _2155 = fma(_2149, 0.5, 0.5);
    float _2157 = fma(_2135, 0.5, 0.5);
    float _2159 = _2129;
    if (_2063)
    {
        float3 _6232 = float3(_1979, _2035, float(as_type<int>(_2129)));
        float3 _6236 = select(_6232, float3(0.0), isnan(_6232));
        float _2161 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6236.xy, uint(rint(_6236.z)), _2139, level(0.0));
        _2159 = _2161;
    }
    float _2163 = _2159;
    float _2165 = _1939;
    if (!_1703)
    {
        float _2167 = rint(_2011);
        float _2169 = precise::max(_2167, 0.0);
        uint _2171 = uint(_2169);
        uint _2173 = clamp(_2171, 0u, 65535u);
        _2165 = as_type<float>(_2173);
    }
    float _2175 = _2165;
    if (!_1703)
    {
        float _2177 = -_2145;
        float _2179 = _1494 + _2177;
        _2093 = _2179;
    }
    float _2181 = _2093;
    float3 _6273 = float3(_2155, _2153, _1955);
    float _2183 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6273, float3(0.0), isnan(_6273)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6273, float3(0.0), isnan(_6273)), level(0.0)).x;
    float3 _6282 = float3(_2155, _2153, _1955);
    float4 _2186 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6282, float3(0.0), isnan(_6282)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6282, float3(0.0), isnan(_6282)), level(0.0)).xyzw;
    float _2188 = _2186.x;
    float _2190 = _2186.y;
    float _2192 = _2186.z;
    float _2194 = _2186.w;
    float2 _6298 = float2(_2117, _2157);
    float3 _2198 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6298, float2(0.0), isnan(_6298)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6298, float2(0.0), isnan(_6298)), level(0.0)).xyz;
    float _2200 = _2198.x;
    float _2202 = _2198.y;
    float _2204 = _2198.z;
    float _2206 = _2175;
    if (!_1703)
    {
        float3 _6319 = float3(_2181, _1945, float(as_type<int>(_2175)));
        float3 _6321 = select(_6319, float3(0.0), isnan(_6319));
        float _2208 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6321.xy, uint(rint(_6321.z)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6321.xy, uint(rint(_6321.z)), level(0.0)).x;
        _2206 = _2208;
    }
    float _2210 = _2206;
    float _2212 = abs(_1588);
    float _2214 = log2(_2212);
    float _2216 = _2045 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2218 = fma(_2053, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2216);
    float _2220 = fma(_1809, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2218);
    float _2222 = _2025 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2224 = fma(_2069, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2220);
    float _2226 = _2214 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2228 = _2224 + _2081;
    float _2230 = exp2(_2222);
    bool _2232 = _1588 <= 8000.0;
    bool _2234 = isnan(_1588);
    bool _2236 = _2232 || _2234;
    bool _2238 = isnan(8000.0);
    bool _2240 = _2236 || _2238;
    float _2242 = float(_2240);
    float _2244 = _2228 * 0.5;
    float _2246 = exp2(_2226);
    out.m_79.z = _2244;
    out.m_79.w = _2081;
    float _2248 = fma(_2246, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2250 = precise::clamp(_2248, 0.0, 1.0);
    float _2252 = fma(_2250, -2.0, 3.0);
    float _2254 = _2250 * _2250;
    float _2256 = _2254 * _2252;
    float _2258 = -_2256;
    float _2260 = _2258 + 1.0;
    out.gl_Position.x = _2111;
    out.gl_Position.y = _2137;
    out.gl_Position.z = _2224;
    out.gl_Position.w = _2081;
    float _2262 = fma(_2260, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2256);
    float _2264 = -_2230;
    float _2266 = _2264 + 1.0;
    float _2268 = _2242 * _2262;
    float _2270 = _2242;
    float _2272 = _2111;
    if (!_2063)
    {
        _2270 = 1.0;
    }
    float _2274 = _2270;
    float _2276 = _2268 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2278 = _2266 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2280 = _2274;
    if (_1703)
    {
        _2272 = 1.0;
    }
    float _2282 = _2272;
    float _2284 = -_2151;
    float _2286 = _2284 + 1.0;
    float _2288 = _2286 * _2276;
    float _2290 = precise::clamp(_2288, 0.0, 1.0);
    float _2292 = _2282;
    float _2294 = _2290;
    if (_2063)
    {
        bool _2296 = _2163 >= _2139;
        bool _2298 = isnan(_2163);
        bool _2300 = _2296 || _2298;
        bool _2302 = isnan(_2139);
        bool _2304 = _2300 || _2302;
        float _2306 = float(_2304);
        _2280 = _2306;
    }
    float _2308 = _2280;
    if (!_1703)
    {
        int _2310 = _1847 << 4;
        int _2312 = _2310 + 2048;
        uint _2314 = uint(int(uint(_2312) >> uint(2)));
        uint _2316 = uint(int(uint(int(_2314)) >> uint(2)));
        int _2318 = int(_2314) & 3;
        float _2320 = (*spvDescriptorSet0.vp_c15)._m0[int(_2316)][_2318];
        int _2322 = int(_2314) + 1;
        uint _2324 = uint(int(uint(_2322) >> uint(2)));
        int _2326 = _2322 & 3;
        float _2328 = (*spvDescriptorSet0.vp_c15)._m0[int(_2324)][_2326];
        int _2330 = _2312 + 8;
        uint _2332 = uint(int(uint(_2330) >> uint(2)));
        uint _2334 = uint(int(uint(int(_2332)) >> uint(2)));
        int _2336 = int(_2332) & 3;
        float _2338 = (*spvDescriptorSet0.vp_c15)._m0[int(_2334)][_2336];
        int _2340 = int(_2332) + 1;
        uint _2342 = uint(int(uint(_2340) >> uint(2)));
        int _2344 = _2340 & 3;
        float _2346 = (*spvDescriptorSet0.vp_c15)._m0[int(_2342)][_2344];
        float _2348 = _1466 * _2328;
        float _2350 = fma(_1124, _2320, _2348);
        float _2352 = fma(_1126, _2338, _2350);
        float _2354 = _2352 + _2346;
        float _2356 = precise::clamp(_2354, 0.0, 1.0);
        float _2358 = -_2356;
        float _2360 = _2358 + _2210;
        float _2362 = fma(_2360, 500.0, 1.5);
        float _2364 = exp2(_2362);
        float _2366 = 0.0 + _2364;
        float _2368 = precise::clamp(_2366, 0.0, 1.0);
        _2292 = _2368;
    }
    float _2370 = _2292;
    float _2372 = _2308 * _2370;
    float _2374 = _2278 * _2183;
    float _2376 = -_2290;
    float _2378 = fma(_2376, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2380 = -_2278;
    float _2382 = _2380 + 1.0;
    bool _2384 = _1496 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2386 = isnan(_1496);
    bool _2388 = _2384 || _2386;
    bool _2390 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2392 = _2388 || _2390;
    float _2394 = _2194 * _2374;
    float _2396 = -_2372;
    float _2398 = fma(_2396, _2378, 1.0);
    float _2400 = precise::clamp(_2398, 0.0, 1.0);
    float _2402 = _2204 * _2374;
    float _2404 = _2194 * _2382;
    float _2406 = fma(_2200, _2394, _2188);
    float _2408 = fma(_2202, _2394, _2190);
    float _2410 = _2400 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2412 = fma(_2194, _2402, _2192);
    out.m_81.x = _2410;
    float _2414 = _2394;
    float _2416 = _2382;
    float _2418 = _2378;
    float _2420 = _2400;
    if (!_2392)
    {
        _1206 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2422 = _1206;
    float _2424 = _2422;
    float _2426 = _2422;
    if (!_2392)
    {
        _2294 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2428 = _2294;
    out.m_83.x = _2406;
    out.m_83.y = _2408;
    out.m_83.z = _2412;
    out.m_83.w = _2404;
    float _2430 = _2428;
    float _2432 = _2428;
    if (!_2392)
    {
        _2414 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2434 = _2414;
    float _2436 = _2434;
    float _2438 = _2434;
    if (!_2392)
    {
        _2416 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2440 = _2416;
    float _2442 = _2440;
    float _2444 = _2440;
    if (!_2392)
    {
        _2418 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2446 = _2418;
    float _2448 = _2446;
    float _2450 = _2446;
    if (!_2392)
    {
        _2420 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2452 = _2420;
    bool _2454 = !_2392;
    float _2456 = _2452;
    float _2458 = _2452;
    if (!_2454)
    {
        bool _2460 = _1496 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2462 = isnan(_1496);
        bool _2464 = _2460 || _2462;
        bool _2466 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2468 = _2464 || _2466;
        if (!_2468)
        {
            float _2470 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2472 = _1496 + _2470;
            float _2474 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2476 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2474;
            float _2478 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2480 = _2478 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2482 = 1.0 / _2476;
            float _2484 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2486 = _2484 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2488 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2490 = _2488 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2492 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2494 = _2492 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2496 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2498 = _2496 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2500 = _2472 * _2482;
            float _2502 = precise::clamp(_2500, 0.0, 1.0);
            float _2504 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2506 = _2504 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2508 = fma(_2502, _2480, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2510 = fma(_2502, _2506, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2512 = fma(_2502, _2486, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2514 = fma(_2502, _2490, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2516 = fma(_2502, _2494, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2518 = fma(_2502, _2498, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2432 = _2512;
            _2450 = _2516;
            _2426 = _2508;
            _2444 = _2514;
            _2438 = _2510;
            _2458 = _2518;
            _2520 = true;
        }
        else
        {
            bool _2522 = _1496 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2524 = isnan(_1496);
            bool _2526 = _2522 || _2524;
            bool _2528 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2530 = _2526 || _2528;
            if (!_2530)
            {
                _2424 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2532 = _2424;
            _2426 = _2532;
            if (!_2530)
            {
                _2430 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2534 = _2430;
            _2432 = _2534;
            if (!_2530)
            {
                _2436 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2536 = _2436;
            _2438 = _2536;
            if (!_2530)
            {
                _2442 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2538 = _2442;
            _2444 = _2538;
            if (!_2530)
            {
                _2448 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2540 = _2448;
            _2450 = _2540;
            if (!_2530)
            {
                _2456 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2542 = _2456;
            bool _2544 = !_2530;
            _2458 = _2542;
            if (!_2544)
            {
                bool _2546 = _1496 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2548 = isnan(_1496);
                bool _2550 = _2546 || _2548;
                bool _2552 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2554 = _2550 || _2552;
                if (!_2554)
                {
                    float _2556 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2558 = _1496 + _2556;
                    float _2560 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2562 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2560;
                    float _2564 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2566 = _2564 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2568 = 1.0 / _2562;
                    float _2570 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2572 = _2570 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2574 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2576 = _2574 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2578 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2580 = _2578 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2582 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2584 = _2582 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2586 = _2558 * _2568;
                    float _2588 = precise::clamp(_2586, 0.0, 1.0);
                    float _2590 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2592 = _2590 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2594 = fma(_2588, _2566, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2596 = fma(_2588, _2592, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2598 = fma(_2588, _2572, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2600 = fma(_2588, _2576, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2602 = fma(_2588, _2580, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2604 = fma(_2588, _2584, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2432 = _2598;
                    _2450 = _2602;
                    _2426 = _2594;
                    _2444 = _2600;
                    _2438 = _2596;
                    _2458 = _2604;
                    _2520 = true;
                }
                else
                {
                    _2432 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2450 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2426 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2444 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2438 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2458 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2520 = false;
    float _2606 = _2432;
    float _2608 = _2450;
    float _2610 = _2426;
    float _2612 = _2444;
    float _2614 = _2438;
    float _2616 = _2458;
    float _2618 = fma(_1324, -0.5, 0.5);
    float _2620 = precise::clamp(_2618, 0.0, 1.0);
    float _2622 = -_2606;
    float _2624 = _2622 + _2608;
    float _2626 = -_2610;
    float _2628 = _2626 + _2612;
    float _2630 = -_2614;
    float _2632 = _2630 + _2616;
    bool _2634 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2636 = fma(_2620, _2624, _2606);
    float _2638 = fma(_2620, _2628, _2610);
    float _2640 = fma(_2620, _2632, _2614);
    float _2642 = _2636 * 0.586610972881317138671875;
    out.m_61.x = 1.0;
    float _2644 = fma(_2638, 0.298911988735198974609375, _2642);
    float _2646 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2648 = fma(_2640, 0.114477999508380889892578125, _2644);
    out.m_81.w = _2646;
    float _2650 = -_2648;
    float _2652 = _2638 + _2650;
    float _2654 = -_2648;
    float _2656 = _2636 + _2654;
    float _2658 = -_2648;
    float _2660 = _2640 + _2658;
    out.m_85.x = 0.0;
    float _2662 = fma(_2652, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2648);
    float _2664 = fma(_2656, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2648);
    float _2666 = fma(_2660, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2648);
    out.m_87.x = _2662;
    out.m_87.y = _2664;
    out.m_87.z = _2666;
    if (!_2634)
    {
        return out;
    }
    float _2668 = -_1444;
    float _2670 = _2668 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2672 = -_1446;
    float _2674 = _2672 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2676 = -_1448;
    float _2678 = _2676 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2680 = _2670 * _2670;
    float _2682 = fma(_2674, _2674, _2680);
    float _2684 = fma(_2678, _2678, _2682);
    float _2686 = sqrt(_2684);
    float _2688 = rsqrt(_2684);
    float _2690 = -_2686;
    float _2692 = _2690 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2694 = _2692 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2696 = precise::clamp(_2694, 0.0, 1.0);
    float _2698 = _2674 * _2688;
    float _2700 = _2670 * _2688;
    float _2702 = abs(_2696);
    float _2704 = log2(_2702);
    float _2706 = _2678 * _2688;
    float _2708 = _2698 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2710 = _1324 * _2700;
    float _2712 = -_2700;
    float _2714 = -_2708;
    float _2716 = fma(_2712, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2714);
    float _2718 = fma(_1326, _2698, _2710);
    float _2720 = -_2706;
    float _2722 = fma(_2720, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2716);
    float _2724 = fma(_1328, _2706, _2718);
    float _2726 = precise::clamp(_2724, 0.0, 1.0);
    float _2728 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2730 = _2722 + _2728;
    float _2732 = _2704 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2734 = _2730 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2736 = precise::clamp(_2734, 0.0, 1.0);
    float _2738 = exp2(_2732);
    float _2740 = _2738 * _2736;
    float _2742 = _2726 * _2740;
    float _2744 = _2742 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2746 = _2742 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2748 = _2742 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_85.x = _2744;
    out.m_85.y = _2746;
    out.m_85.z = _2748;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint dm_vid [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2520 = false;
    bool _1400 = false;
    bool _636 = false;
    bool _486 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _101 = in.m_58.w;
    float _103 = trunc(_101);
    int _106 = int(_103);
    bool _110 = _106 >= 1;
    float _112 = 0.0;
    if (!_110)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _114 = _112;
    float _116 = _114;
    if (!_110)
    {
        out.m_61.x = 0.0;
    }
    int _118 = 0;
    if (!_110)
    {
        float _120 = _114 * 5.0;
        _118 = as_type<int>(_120);
    }
    int _122 = _118;
    int _124 = _122;
    if (!_110)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2805 = as_type<float>(_122);
        out.gl_Position.z = _2805;
    }
    if (!_110)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _126 = in.m_63.w;
    bool _128 = _126 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _130 = isnan(_126);
    bool _132 = _128 || _130;
    bool _134 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _136 = _132 || _134;
    float _138 = -_126;
    float _140 = _138 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _142 = 0.0;
    float _144 = 0.0;
    if (_136)
    {
        float _146 = float(_106);
        _116 = _146;
    }
    float _148 = _116;
    bool _150 = _140 >= _148;
    bool _152 = !_136;
    bool _154 = _150 || _152;
    float _156 = _148;
    if (_154)
    {
        _156 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _158 = _156;
    if (_154)
    {
        out.m_61.x = 0.0;
    }
    if (_154)
    {
        float _160 = _158 * 5.0;
        _124 = as_type<int>(_160);
    }
    int _162 = _124;
    float _164 = as_type<float>(_162);
    if (_154)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2876 = as_type<float>(_162);
        out.gl_Position.z = _2876;
    }
    if (_154)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _166 = in.m_63.x;
    float _168 = in.m_63.y;
    float _170 = in.m_63.z;
    float _172 = _140 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _174 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _176 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _178 = _174 || _176;
    bool _180 = isnan(1.0);
    bool _182 = _178 || _180;
    float _184 = _172;
    if (!_182)
    {
        float _186 = _172 * _172;
        float _188 = _186 * 0.5;
        _164 = _188;
    }
    float _190 = _164;
    float _192 = 0.0;
    float _194 = _190;
    if (!_182)
    {
        float _196 = _140 * _140;
        float _198 = _196 * 0.5;
        _192 = _198;
    }
    float _200 = _192;
    if (!_182)
    {
        float _202 = _190 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _194 = _202;
    }
    float _204 = _194;
    bool _206 = !_182;
    float _208 = _204;
    if (!_206)
    {
        float _210 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _212 = log2(_210);
        float _214 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _216 = _214 + 1.0;
        float _218 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _220 = _172 * _212;
        float _222 = 1.0 / _216;
        float _224 = _218 * 0.693147182464599609375;
        float _226 = exp2(_220);
        float _228 = 1.0 / _224;
        float _230 = _226 + (-1.0);
        float _232 = -_230;
        float _234 = fma(_232, _228, _172);
        float _236 = _234 * _222;
        float _238 = _236 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _142 = _228;
        _208 = _238;
        _144 = _226;
    }
    float _240 = _142;
    float _242 = _208;
    float _244 = _144;
    bool _246 = !_182;
    float _248 = _240;
    float _250 = _244;
    if (!_246)
    {
        float _252 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _254 = log2(_252);
        float _256 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _258 = _256 + 1.0;
        float _260 = 1.0 / _258;
        float _262 = _172 * _254;
        float _264 = exp2(_262);
        float _266 = -_264;
        float _268 = _266 + 1.0;
        float _270 = _268 * _260;
        _248 = _264;
        _250 = _258;
        _184 = _270;
    }
    float _272 = _248;
    float _274 = _250;
    float _276 = _184;
    float _278 = _274;
    float _280 = _272;
    if (!_182)
    {
        _278 = _140;
    }
    float _282 = _278;
    float _284 = _242 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _286 = _282;
    if (!_182)
    {
        float _288 = _200 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _280 = _288;
    }
    float _290 = _280;
    bool _292 = !_182;
    float _294 = _290;
    if (!_292)
    {
        float _296 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _298 = log2(_296);
        float _300 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _302 = _300 + 1.0;
        float _304 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _306 = _140 * _298;
        float _308 = 1.0 / _302;
        float _310 = _304 * 0.693147182464599609375;
        float _312 = exp2(_306);
        float _314 = 1.0 / _310;
        float _316 = _312 + (-1.0);
        float _318 = -_316;
        float _320 = fma(_318, _314, _140);
        float _322 = _320 * _308;
        float _324 = _322 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _294 = _324;
    }
    float _326 = _294;
    bool _328 = !_182;
    if (!_328)
    {
        float _330 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _332 = log2(_330);
        float _334 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _336 = _334 + 1.0;
        float _338 = 1.0 / _336;
        float _340 = _140 * _332;
        float _342 = exp2(_340);
        float _344 = -_342;
        float _346 = _344 + 1.0;
        float _348 = _346 * _338;
        _286 = _348;
    }
    float _350 = _286;
    float _352 = _326 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _354 = _242 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _356 = fma(_276, _168, _284);
    float _358 = _326 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _360 = fma(_350, _168, _352);
    float _362 = fma(_276, _166, _354);
    float _364 = _326 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _366 = fma(_350, _166, _358);
    float _368 = _242 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _370 = -_360;
    float _372 = _356 + _370;
    float _374 = fma(_350, _170, _364);
    float _376 = -_366;
    float _378 = _362 + _376;
    float _380 = fma(_276, _170, _368);
    float _382 = _372 * _372;
    float _384 = in.m_65.w;
    float _386 = _372 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _388 = -_374;
    float _390 = _380 + _388;
    float _392 = fma(_378, _378, _382);
    float _394 = _372 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _396 = _372 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _398 = fma(_378, (*spvDescriptorSet0.vp_c10)._m0[5].x, _386);
    float _400 = fma(_390, _390, _392);
    float _402 = fma(_378, (*spvDescriptorSet0.vp_c10)._m0[4].x, _394);
    float _404 = in.m_58.x;
    float _406 = in.m_58.y;
    float _408 = in.m_58.z;
    float _410 = fma(_378, (*spvDescriptorSet0.vp_c10)._m0[6].x, _396);
    float _412 = fma(_390, (*spvDescriptorSet0.vp_c10)._m0[5].z, _398);
    float _414 = sqrt(_400);
    float _416 = fma(_390, (*spvDescriptorSet0.vp_c10)._m0[6].z, _410);
    bool _418 = _414 >= 9.9999999747524270787835121154785e-07;
    bool _420 = isnan(_414);
    bool _422 = _418 || _420;
    bool _424 = isnan(9.9999999747524270787835121154785e-07);
    bool _426 = _422 || _424;
    float _428 = fma(_390, (*spvDescriptorSet0.vp_c10)._m0[4].z, _402);
    float _430 = fma(_356, _384, _406);
    float _432 = fma(_362, _384, _404);
    float _434 = fma(_380, _384, _408);
    float _436 = _356;
    float _438 = _428;
    float _440 = _416;
    float _442 = _434;
    if (_426)
    {
        _436 = _412;
    }
    float _444 = _436;
    float _446 = _444;
    if (!_426)
    {
        bool _448 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _450 = !_448;
        if (!_450)
        {
            float _452 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _454 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _456 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _458 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _452);
            float _460 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _454);
            float _462 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _456);
            float _464 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _458);
            float _466 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _460);
            float _468 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _462);
            float _470 = _464 * _464;
            float _472 = fma(_466, _466, _470);
            float _474 = fma(_468, _468, _472);
            float _476 = rsqrt(_474);
            float _478 = _476 * 9.9999999747524270787835121154785e-07;
            float _480 = _466 * _478;
            float _482 = _464 * _478;
            float _484 = _468 * _478;
            _446 = _482;
            _438 = _480;
            _440 = _484;
            _486 = true;
        }
        else
        {
            float _488 = _168 * _168;
            float _490 = fma(_166, _166, _488);
            float _492 = fma(_170, _170, _490);
            float _494 = sqrt(_492);
            bool _496 = _494 >= 9.9999999747524270787835121154785e-07;
            bool _498 = isnan(_494);
            bool _500 = _496 || _498;
            bool _502 = isnan(9.9999999747524270787835121154785e-07);
            bool _504 = _500 || _502;
            if (!_504)
            {
                float _506 = _406 * _406;
                float _508 = fma(_404, _404, _506);
                float _510 = fma(_408, _408, _508);
                float _512 = sqrt(_510);
                bool _514 = _512 >= 9.9999999747524270787835121154785e-07;
                bool _516 = isnan(_512);
                bool _518 = _514 || _516;
                bool _520 = isnan(9.9999999747524270787835121154785e-07);
                bool _522 = _518 || _520;
                if (!_522)
                {
                    float _524 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _526 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _524);
                    float _528 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _526);
                    float _530 = rsqrt(_528);
                    float _532 = _530 * 9.9999999747524270787835121154785e-07;
                    float _534 = _532 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _536 = _532 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _538 = _532 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _446 = _536;
                    _438 = _534;
                    _440 = _538;
                    _486 = true;
                }
                else
                {
                    float _540 = _406 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _542 = _406 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _544 = _406 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _546 = fma(_404, (*spvDescriptorSet0.vp_c10)._m0[5].x, _540);
                    float _548 = fma(_404, (*spvDescriptorSet0.vp_c10)._m0[4].x, _542);
                    float _550 = fma(_404, (*spvDescriptorSet0.vp_c10)._m0[6].x, _544);
                    float _552 = fma(_408, (*spvDescriptorSet0.vp_c10)._m0[5].z, _546);
                    float _554 = fma(_408, (*spvDescriptorSet0.vp_c10)._m0[4].z, _548);
                    float _556 = fma(_408, (*spvDescriptorSet0.vp_c10)._m0[6].z, _550);
                    float _558 = _552 * _552;
                    float _560 = fma(_554, _554, _558);
                    float _562 = fma(_556, _556, _560);
                    float _564 = rsqrt(_562);
                    float _566 = _564 * 9.9999999747524270787835121154785e-07;
                    float _568 = _554 * _566;
                    float _570 = _552 * _566;
                    float _572 = _556 * _566;
                    _446 = _570;
                    _438 = _568;
                    _440 = _572;
                    _486 = true;
                }
            }
            else
            {
                float _574 = _168 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _576 = _168 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _578 = _168 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _580 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[5].x, _574);
                float _582 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[4].x, _576);
                float _584 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[6].x, _578);
                float _586 = fma(_170, (*spvDescriptorSet0.vp_c10)._m0[5].z, _580);
                float _588 = fma(_170, (*spvDescriptorSet0.vp_c10)._m0[4].z, _582);
                float _590 = fma(_170, (*spvDescriptorSet0.vp_c10)._m0[6].z, _584);
                float _592 = _586 * _586;
                float _594 = fma(_588, _588, _592);
                float _596 = fma(_590, _590, _594);
                float _598 = rsqrt(_596);
                float _600 = _598 * 9.9999999747524270787835121154785e-07;
                float _602 = _588 * _600;
                float _604 = _586 * _600;
                float _606 = _590 * _600;
                _446 = _604;
                _438 = _602;
                _440 = _606;
            }
        }
    }
    _486 = false;
    float _608 = _446;
    float _610 = _438;
    float _612 = _440;
    bool _614 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _616 = !_614;
    float _634;
    if (!_616)
    {
        float _618 = in.m_67.x;
        float _620 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _622 = _618 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _624 = fma(_622, (*spvDescriptorSet0.vp_c9)._m0[12].x, _140);
        float _626 = _624 * _620;
        float _628 = floor(_626);
        float _630 = -_628;
        float _632 = _626 + _630;
        _634 = _632;
        _636 = true;
    }
    else
    {
        float _638 = float(_106);
        float _640 = 1.0 / _638;
        float _642 = _140 * _640;
        _634 = _642;
    }
    _636 = false;
    float _644 = _634;
    float _646 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _648 = _644 + _646;
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _652 = _644 + _650;
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _656 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _654;
    float _658 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _660 = _658 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _662 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _664 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _662;
    float _666 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _668 = _666 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _670 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _672 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _670;
    float _674 = 1.0 / _660;
    bool _676 = _644 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _678 = isnan(_644);
    bool _680 = _676 || _678;
    bool _682 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _684 = _680 || _682;
    float _686 = float(_684);
    bool _688 = _644 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _690 = isnan(_644);
    bool _692 = _688 || _690;
    bool _694 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _696 = _692 || _694;
    float _698 = float(_696);
    float _700 = 1.0 / _656;
    float _702 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _704 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _702;
    float _706 = 1.0 / _664;
    float _708 = 1.0 / _668;
    float _710 = _648 * _700;
    float _712 = _608 * _608;
    float _714 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _716 = _644 + _714;
    float _718 = fma(_704, _710, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _720 = fma(_610, _610, _712);
    float _722 = 1.0 / _672;
    float _724 = _652 * _706;
    float _726 = fma(_612, _612, _720);
    float _728 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _730 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _728;
    float _732 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _734 = _732 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _736 = _716 * _708;
    float _738 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _740 = _644 + _738;
    float _742 = rsqrt(_726);
    float _744 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _746 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _744;
    float _748 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _750 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _748;
    float _752 = _740 * _674;
    float _754 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _756 = _644 + _754;
    float _758 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _760 = _758 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _762 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _764 = _762 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _766 = fma(_734, _736, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _768 = _756 * _722;
    float _770 = fma(_760, _736, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _772 = fma(_764, _736, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    bool _774 = _644 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _776 = isnan(_644);
    bool _778 = _774 || _776;
    bool _780 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _782 = _778 || _780;
    float _784 = float(_782);
    float _786 = fma(_730, _724, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _788 = _644 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _790 = isnan(_644);
    bool _792 = _788 || _790;
    bool _794 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _796 = _792 || _794;
    float _798 = float(_796);
    float _800 = fma(_746, _724, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _802 = fma(_750, _724, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _804 = -_784;
    float _806 = _804 + 1.0;
    float _808 = _742 * _608;
    float _810 = -_798;
    float _812 = _810 + 1.0;
    float _814 = -_698;
    float _816 = _814 + 1.0;
    float _818 = _798 * _806;
    float _820 = _742 * _610;
    float _822 = _686 * _812;
    float _824 = -_686;
    float _826 = _824 + 1.0;
    bool _828 = _644 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _830 = isnan(_644);
    bool _832 = _828 || _830;
    bool _834 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _836 = _832 || _834;
    float _838 = float(_836);
    float _840 = _808 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _842 = _742 * _612;
    bool _844 = _644 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _846 = isnan(_644);
    bool _848 = _844 || _846;
    bool _850 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _852 = _848 || _850;
    float _854 = float(_852);
    float _856 = _698 * _826;
    float _858 = _838 * _816;
    float _860 = fma(_820, (*spvDescriptorSet0.vp_c10)._m0[8].y, _840);
    float _862 = -_838;
    float _864 = _862 + 1.0;
    float _866 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _868 = _866 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _870 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _872 = _870 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _874 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _876 = _874 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _878 = fma(_842, (*spvDescriptorSet0.vp_c10)._m0[10].y, _860);
    float _880 = _854 * _864;
    float _882 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _884 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _882;
    float _886 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _888 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _886;
    float _890 = fma(_868, _752, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _892 = fma(_872, _752, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _894 = fma(_876, _752, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _896 = _786 * _880;
    float _898 = abs(_878);
    bool _900 = _898 > 0.99989998340606689453125;
    float _902 = -_854;
    float _904 = _902 + 1.0;
    float _906 = fma(_884, _710, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _908 = fma(_888, _710, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _910 = _800 * _880;
    float _912 = _802 * _880;
    float _914 = fma(_904, (*spvDescriptorSet0.vp_c9)._m0[143].x, _896);
    float _916 = fma(_904, (*spvDescriptorSet0.vp_c9)._m0[143].y, _910);
    float _918 = fma(_766, _858, _914);
    float _920 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _922 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _920;
    float _924 = fma(_770, _858, _916);
    float _926 = fma(_906, _856, _918);
    float _928 = fma(_904, (*spvDescriptorSet0.vp_c9)._m0[143].z, _912);
    float _930 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _932 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _930;
    float _934 = _906;
    float _936 = _922;
    float _938 = _908;
    float _940 = _718;
    if (_900)
    {
        _934 = 0.001000000047497451305389404296875;
    }
    float _942 = _934;
    float _944 = fma(_922, _768, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _946 = fma(_772, _858, _928);
    if (!_900)
    {
        _936 = (*spvDescriptorSet0.vp_c10)._m0[8].y;
    }
    float _948 = _936;
    float _950 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _952 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _950;
    float _954 = fma(_932, _768, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _956 = _948;
    if (_900)
    {
        float _958 = fma(_942, (*spvDescriptorSet0.vp_c10)._m0[8].z, (*spvDescriptorSet0.vp_c10)._m0[8].y);
        _956 = _958;
    }
    float _960 = _956;
    float _962 = fma(_908, _856, _924);
    if (!_900)
    {
        _938 = (*spvDescriptorSet0.vp_c10)._m0[10].y;
    }
    float _964 = _938;
    float _966 = fma(_718, _856, _946);
    float _968 = _964;
    if (_900)
    {
        float _970 = fma(_942, (*spvDescriptorSet0.vp_c10)._m0[10].z, (*spvDescriptorSet0.vp_c10)._m0[10].y);
        _968 = _970;
    }
    float _972 = _968;
    float _974 = -_960;
    float _976 = _842 * _974;
    float _978 = fma(_952, _768, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    if (!_900)
    {
        _940 = (*spvDescriptorSet0.vp_c10)._m0[9].y;
    }
    float _980 = _940;
    float _982 = in.m_65.x;
    float _984 = in.m_65.y;
    float _986 = in.m_65.z;
    float _988 = fma(_890, _822, _926);
    float _990 = fma(_892, _822, _962);
    float _992 = fma(_894, _822, _966);
    float _994 = _980;
    if (_900)
    {
        float _996 = fma(_942, (*spvDescriptorSet0.vp_c10)._m0[9].z, (*spvDescriptorSet0.vp_c10)._m0[9].y);
        _994 = _996;
    }
    float _998 = _994;
    float _1000 = -_972;
    float _1002 = _808 * _1000;
    float _1004 = -_972;
    float _1006 = -_976;
    float _1008 = fma(_820, _1004, _1006);
    float _1010 = in.m_69.x;
    float _1012 = in.m_69.y;
    float _1014 = in.m_69.z;
    float _1016 = -_998;
    float _1018 = _820 * _1016;
    float _1020 = -_998;
    float _1022 = -_1002;
    float _1024 = fma(_842, _1020, _1022);
    float _1026 = _1008 * _1008;
    float _1028 = fma(_978, _818, _988);
    float _1030 = -_960;
    float _1032 = -_1018;
    float _1034 = fma(_808, _1030, _1032);
    float _1036 = fma(_944, _818, _990);
    float _1038 = fma(_1024, _1024, _1026);
    float _1040 = fma(_784, (*spvDescriptorSet0.vp_c9)._m0[148].x, _1028);
    float _1042 = fma(_954, _818, _992);
    float _1044 = fma(_1034, _1034, _1038);
    float _1046 = fma(_784, (*spvDescriptorSet0.vp_c9)._m0[148].y, _1036);
    float _1048 = fma(_784, (*spvDescriptorSet0.vp_c9)._m0[148].z, _1042);
    float _1050 = rsqrt(_1044);
    float _1052 = _1040 * _982;
    float _1054 = _1046 * _984;
    float _1056 = _1048 * _986;
    float _1058 = _430 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1060 = _1052 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1062 = _1054 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1064 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1010);
    float _1066 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1014);
    float _1068 = _1056 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1070 = fma(_432, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1058);
    float _1072 = _1060 * _1064;
    float _1074 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1012);
    float _1076 = _430 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1078 = _1068 * _1066;
    bool _1080 = _1012 != 0.0;
    bool _1082 = isnan(_1012);
    bool _1084 = _1080 || _1082;
    bool _1086 = isnan(0.0);
    bool _1088 = _1084 || _1086;
    float _1090 = _1024 * _1050;
    float _1092 = _1062 * _1074;
    float _1094 = _1008 * _1050;
    float _1096 = _1034 * _1050;
    float _1098 = fma(_432, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1076);
    float _1100 = fma(_434, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1070);
    float _1102 = _1092 * _820;
    float _1104 = _1092 * _842;
    float _1106 = _808 * _1096;
    float _1108 = _820 * _1094;
    float _1110 = fma(_434, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1098);
    float _1112 = fma(_1072, _1090, _1102);
    float _1114 = fma(_1072, _1096, _1104);
    float _1116 = -_1106;
    float _1118 = fma(_842, _1094, _1116);
    float _1120 = -_1108;
    float _1122 = fma(_808, _1090, _1120);
    float _1124 = _1100 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1126 = _1110 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1128 = fma(_1078, _1118, _1112);
    float _1130 = fma(_1078, _1122, _1114);
    float _1132 = _430 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _1134 = _1010 == 0.0;
    bool _1136 = !_1088;
    bool _1138 = _1134 && _1136;
    float _1140 = _1124 + _1128;
    float _1142 = _1126 + _1130;
    float _1144 = fma(_432, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1132);
    float _1146 = in.m_71.x;
    float _1148 = in.m_71.y;
    float _1150 = in.m_71.z;
    float _1152 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1154 = _1140 + _1152;
    float _1156 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1158 = _1142 + _1156;
    float _1160 = _1092 * _808;
    float _1162 = _842 * _1090;
    float _1164 = _1154 * _1154;
    float _1166 = _1158 * _1158;
    bool _1168 = _1014 == 0.0;
    bool _1170 = _1168 && _1138;
    float _1172 = fma(_1072, _1094, _1160);
    float _1174 = -_1162;
    float _1176 = fma(_820, _1096, _1174);
    float _1178 = _1164 + _1166;
    float _1180 = fma(_434, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1144);
    float _1182 = fma(_1078, _1176, _1172);
    float _1184 = sqrt(_1178);
    float _1186 = _1180 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1188 = _1186 + _1182;
    float _1190 = _1146;
    float _1192 = _1148;
    float _1194 = _1150;
    float _1196 = _1012;
    float _1198 = _1010;
    float _1200 = _1182;
    float _1202 = _1140;
    float _1204 = _1158;
    float _1206 = _1124;
    if (!_1170)
    {
        float _1208 = fma(_1010, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1146);
        _1190 = _1208;
    }
    float _1210 = _1190;
    if (!_1170)
    {
        float _1212 = fma(_1012, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1148);
        _1192 = _1212;
    }
    float _1214 = _1192;
    float _1216 = _1214;
    if (!_1170)
    {
        float _1218 = fma(_1014, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1150);
        _1194 = _1218;
    }
    float _1220 = _1194;
    bool _1222 = _1184 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    if (!_1222)
    {
        _442 = _1140;
    }
    float _1224 = _442;
    float _1226 = _1224;
    if (!_1222)
    {
        _1196 = _1166;
    }
    float _1228 = _1196;
    float _1230 = _1228;
    if (!_1222)
    {
        _1198 = _1164;
    }
    float _1232 = _1198;
    float _1234 = _1232;
    if (!_1222)
    {
        _1200 = _1142;
    }
    float _1236 = _1200;
    float _1238 = _1236;
    if (!_1222)
    {
        _1202 = _1188;
    }
    float _1240 = _1202;
    bool _1242 = !_1222;
    float _1244 = _1240;
    if (!_1242)
    {
        float _1246 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1248 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1250 = _1184 + _1248;
        float _1252 = rsqrt(_1178);
        float _1254 = _1250 * _1246;
        float _1256 = _1188 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1258 = _1254 * 0.15915493667125701904296875;
        float _1260 = _1258 * 6.283185482025146484375;
        float _1262 = sin(_1260);
        float _1264 = _1258 * 6.283185482025146484375;
        float _1266 = cos(_1264);
        float _1268 = fma(_1262, _1256, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1270 = _1252 * _1268;
        float _1272 = _1266 + (-1.0);
        float _1274 = fma(_1154, _1270, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1276 = fma(_1158, _1270, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1278 = _1272 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1280 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1282 = _1274 + _1280;
        float _1284 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1286 = _1276 + _1284;
        float _1288 = fma(_1188, _1266, _1278);
        float _1290 = _1282 * _1282;
        float _1292 = _1286 * _1286;
        _1244 = _1288;
        _1234 = _1290;
        _1230 = _1292;
        _1226 = _1274;
        _1238 = _1276;
    }
    float _1294 = _1244;
    float _1296 = _1234;
    float _1298 = _1230;
    float _1300 = _1226;
    float _1302 = _1238;
    float _1304 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1306 = _1294 + _1304;
    float _1308 = _808 * _1214;
    float _1310 = _820 * _1214;
    float _1312 = _842 * _1214;
    float _1314 = fma(_1306, _1306, _1296);
    float _1316 = fma(_1094, _1210, _1308);
    float _1318 = fma(_1090, _1210, _1310);
    float _1320 = fma(_1096, _1210, _1312);
    float _1322 = _1314 + _1298;
    float _1324 = fma(_1176, _1220, _1316);
    float _1326 = fma(_1118, _1220, _1318);
    float _1328 = fma(_1122, _1220, _1320);
    float _1330 = sqrt(_1322);
    float _1332 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1334 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1336 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1338 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1340 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1342 = _1332 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1344 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1346 = _1334 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1348 = _1336 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1350 = _1338 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1352 = _1340 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1354 = _1344 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_73.x = _1326;
    out.m_73.y = _1324;
    out.m_73.z = _1328;
    bool _1356 = _1330 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1358 = isnan(_1330);
    bool _1360 = _1356 || _1358;
    bool _1362 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1364 = _1360 || _1362;
    out.m_75.x = _1342;
    out.m_75.y = _1346;
    out.m_75.z = _1348;
    out.m_77.x = _1350;
    out.m_77.y = _1352;
    out.m_77.z = _1354;
    if (!_1364)
    {
        _1216 = 1.0;
    }
    float _1366 = _1216;
    bool _1368 = !_1364;
    float _1370 = _1366;
    if (!_1368)
    {
        bool _1372 = _1330 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1374 = isnan(_1330);
        bool _1376 = _1372 || _1374;
        bool _1378 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1380 = _1376 || _1378;
        if (!_1380)
        {
            float _1382 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1384 = _1330 + _1382;
            float _1386 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1388 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1386;
            float _1390 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1392 = _1390 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1394 = 1.0 / _1388;
            float _1396 = _1384 * _1394;
            float _1398 = fma(_1396, _1392, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1370 = _1398;
            _1400 = true;
        }
        else
        {
            bool _1402 = _1330 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1404 = isnan(_1330);
            bool _1406 = _1402 || _1404;
            bool _1408 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1410 = _1406 || _1408;
            if (!_1410)
            {
                float _1412 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1414 = _1330 + _1412;
                float _1416 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1418 = _1416 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1420 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1422 = _1420 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1424 = 1.0 / _1418;
                float _1426 = _1414 * _1424;
                float _1428 = fma(_1426, _1422, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1370 = _1428;
                _1400 = true;
            }
            else
            {
                _1370 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1400 = false;
    float _1430 = _1370;
    float _1432 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1434 = _1294 + _1432;
    float _1436 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1438 = _1300 + _1436;
    float _1440 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1442 = _1302 + _1440;
    float _1444 = fma(_1434, _1430, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1446 = fma(_1438, _1430, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1448 = fma(_1442, _1430, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1450 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1452 = _1444 + _1450;
    float _1454 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1456 = _1446 + _1454;
    float _1458 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1460 = _1448 + _1458;
    float _1462 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _1464 = _1452 * _1452;
    float _1466 = _1186 + _1462;
    float _1468 = fma(_1456, _1456, _1464);
    float _1470 = _1466 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1472 = fma(_1460, _1460, _1468);
    float _1474 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1476 = _1466 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1478 = fma(_1124, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1470);
    float _1480 = rsqrt(_1472);
    float _1482 = fma(_1124, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1474);
    float _1484 = fma(_1124, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1476);
    float _1486 = fma(_1126, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1478);
    float _1488 = fma(_1126, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1490 = fma(_1126, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1482);
    float _1492 = fma(_1126, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1484);
    float _1494 = _1486 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1496 = sqrt(_1472);
    float _1498 = _1492 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1500 = _1480 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1502 = _1490 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1504 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1506 = trunc(_1494);
    int _1508 = int(_1506);
    float _1510 = _1456 * _1500;
    float _1512 = _1460 * _1500;
    float _1514 = fma(_1124, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1504);
    float _1516 = _1444 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1518 = _1510 * _1510;
    float _1520 = _1512 * _1512;
    float _1522 = fma(_1126, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1514);
    float _1524 = 1.0 / _1502;
    float _1526 = fma(_1446, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1516);
    float _1528 = _1518 + _1520;
    float _1530 = _1522 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1532 = _1530 + _1502;
    float _1534 = sqrt(_1528);
    int _1536 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1538 = _1508 + _1536;
    int _1540 = _1538 + 1;
    float _1542 = _1532 * _1524;
    float _1544 = _1542 * 0.5;
    float _1546 = trunc(_1498);
    int _1548 = int(_1546);
    float _1550 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1552 = fma(_1544, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1550);
    bool _1554 = _1534 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1556 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1558 = _1534 + _1556;
    float _1560 = 1.0 / _1552;
    int _1562 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1564 = _1548 + _1562;
    int _1566 = _1564 + 1;
    float _1568 = floor(_1488);
    float _1570 = _1184;
    float _1572 = _1558;
    int _1574 = 2;
    float _1576 = _1510;
    float _1578 = _1512;
    float _1580 = _1518;
    if (_1554)
    {
        float _1582 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1570 = _1582;
    }
    float _1584 = _1570;
    float _1586 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1588 = _1560 * _1586;
    bool _1590 = _1588 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1592 = fma(_1124, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    bool _1594 = _1588 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1596 = -_1568;
    float _1598 = _1488 + _1596;
    float _1600 = floor(_1592);
    if (_1554)
    {
        float _1602 = _1558 * _1584;
        _1572 = _1602;
    }
    float _1604 = _1572;
    if (!_1590)
    {
        _1574 = 1;
    }
    int _1606 = _1574;
    float _1608 = 0.0;
    int _1610 = _1606;
    if (_1554)
    {
        float _1612 = _1604 * 0.15915493667125701904296875;
        _1608 = _1612;
    }
    float _1614 = _1608;
    float _1616 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1618 = _1486;
    if (_1554)
    {
        float _1620 = _1614 * 6.283185482025146484375;
        float _1622 = sin(_1620);
        _1618 = _1622;
    }
    float _1624 = _1618;
    float _1626 = precise::max(0.0, _1616);
    float _1628 = -_1600;
    float _1630 = _1592 + _1628;
    bool _1632 = !_1590;
    int _1634 = _1632 ? 0 : 1;
    float _1636 = -_1500;
    float _1638 = -_1626;
    float _1640 = fma(_1452, _1636, _1638);
    float _1642 = as_type<float>(_1634);
    float _1644 = _1640;
    if (!_1594)
    {
        _1610 = _1634;
    }
    int _1646 = _1610;
    float _1648 = _1626;
    if (_1554)
    {
        float _1650 = rsqrt(_1528);
        _1648 = _1650;
    }
    float _1652 = _1648;
    int _1654 = _1540 | _1566;
    if (_1554)
    {
        float _1656 = _1640 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1642 = _1656;
    }
    float _1658 = _1642;
    int _1660 = _1646 << 6;
    bool _1662 = _1540 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1664 = _1660 + 96;
    uint _1667 = uint(int(uint(_1664) >> uint(2)));
    uint _1669 = uint(int(uint(int(_1667)) >> uint(2)));
    int _1671 = int(_1667) & 3;
    float _1673 = (*spvDescriptorSet0.vp_c15)._m0[int(_1669)][_1671];
    int _1675 = int(_1667) + 1;
    uint _1677 = uint(int(uint(_1675) >> uint(2)));
    int _1679 = _1675 & 3;
    float _1681 = (*spvDescriptorSet0.vp_c15)._m0[int(_1677)][_1679];
    float _1683 = _1624;
    if (_1554)
    {
        float _1685 = fma(_1624, _1658, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1683 = _1685;
    }
    float _1687 = _1683;
    float _1689 = _1614;
    if (_1554)
    {
        float _1691 = _1614 * 6.283185482025146484375;
        float _1693 = cos(_1691);
        _1689 = _1693;
    }
    float _1695 = _1689;
    bool _1697 = _1654 < 0;
    bool _1699 = _1697 || _1662;
    bool _1701 = _1566 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1703 = _1701 || _1699;
    int _1705 = _1660 + 104;
    uint _1707 = uint(int(uint(_1705) >> uint(2)));
    uint _1709 = uint(int(uint(int(_1707)) >> uint(2)));
    int _1711 = int(_1707) & 3;
    float _1713 = (*spvDescriptorSet0.vp_c15)._m0[int(_1709)][_1711];
    int _1715 = int(_1707) + 1;
    uint _1717 = uint(int(uint(_1715) >> uint(2)));
    int _1719 = _1715 & 3;
    float _1721 = (*spvDescriptorSet0.vp_c15)._m0[int(_1717)][_1719];
    float _1723 = 0.0;
    if (_1554)
    {
        float _1725 = _1652 * _1687;
        _1723 = _1725;
    }
    float _1727 = _1723;
    float _1729 = _1727;
    if (_1554)
    {
        float _1731 = _1510 * _1727;
        _1576 = _1731;
    }
    float _1733 = _1576;
    if (_1554)
    {
        float _1735 = _1512 * _1727;
        _1578 = _1735;
    }
    float _1737 = _1578;
    if (!_1554)
    {
        _1729 = _1520;
    }
    float _1739 = _1729;
    int _1741 = _1660 + 48;
    uint _1743 = uint(int(uint(_1741) >> uint(2)));
    uint _1745 = uint(int(uint(int(_1743)) >> uint(2)));
    int _1747 = int(_1743) & 3;
    float _1749 = (*spvDescriptorSet0.vp_c15)._m0[int(_1745)][_1747];
    int _1751 = int(_1743) + 1;
    uint _1753 = uint(int(uint(_1751) >> uint(2)));
    int _1755 = _1751 & 3;
    float _1757 = (*spvDescriptorSet0.vp_c15)._m0[int(_1753)][_1755];
    float _1759 = _1739;
    if (_1554)
    {
        float _1761 = _1733 * _1733;
        _1580 = _1761;
    }
    float _1763 = _1580;
    if (_1554)
    {
        float _1765 = _1695 + (-1.0);
        _1204 = _1765;
    }
    float _1767 = _1204;
    if (_1554)
    {
        float _1769 = _1737 * _1737;
        _1759 = _1769;
    }
    float _1771 = _1759;
    float _1773 = 0.0;
    if (!_1703)
    {
        float _1775 = floor(_1498);
        _1773 = _1775;
    }
    float _1777 = _1773;
    float _1779 = 0.0;
    if (_1554)
    {
        float _1781 = _1767 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1779 = _1781;
    }
    float _1783 = _1779;
    float _1785 = fma(_1448, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1526);
    int _1787 = _1660 + 64;
    uint _1789 = uint(int(uint(_1787) >> uint(2)));
    uint _1791 = uint(int(uint(int(_1789)) >> uint(2)));
    int _1793 = int(_1789) & 3;
    float _1795 = (*spvDescriptorSet0.vp_c15)._m0[int(_1791)][_1793];
    int _1797 = int(_1789) + 1;
    uint _1799 = uint(int(uint(_1797) >> uint(2)));
    int _1801 = _1797 & 3;
    float _1803 = (*spvDescriptorSet0.vp_c15)._m0[int(_1799)][_1801];
    if (_1554)
    {
        float _1805 = fma(_1640, _1695, _1783);
        _1644 = _1805;
    }
    float _1807 = _1644;
    float _1809 = _1785 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1811 = fma(_1807, _1807, _1763);
    float _1813 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    int _1815 = _1660 + 56;
    uint _1817 = uint(int(uint(_1815) >> uint(2)));
    uint _1819 = uint(int(uint(int(_1817)) >> uint(2)));
    int _1821 = int(_1817) & 3;
    float _1823 = (*spvDescriptorSet0.vp_c15)._m0[int(_1819)][_1821];
    int _1825 = int(_1817) + 1;
    uint _1827 = uint(int(uint(_1825) >> uint(2)));
    int _1829 = _1825 & 3;
    float _1831 = (*spvDescriptorSet0.vp_c15)._m0[int(_1827)][_1829];
    float _1833 = _1809 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1835 = _1811 + _1771;
    float _1837 = -_1833;
    float _1839 = fma(_1837, _1813, 1.0);
    int _1841 = as_type<int>(_1833);
    if (!_1703)
    {
        int _1843 = _1566 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1845 = _1843 + _1540;
        _1841 = _1845;
    }
    int _1847 = _1841;
    int _1849 = _1660 + 80;
    uint _1851 = uint(int(uint(_1849) >> uint(2)));
    uint _1853 = uint(int(uint(int(_1851)) >> uint(2)));
    int _1855 = int(_1851) & 3;
    float _1857 = (*spvDescriptorSet0.vp_c15)._m0[int(_1853)][_1855];
    int _1859 = int(_1851) + 1;
    uint _1861 = uint(int(uint(_1859) >> uint(2)));
    int _1863 = _1859 & 3;
    float _1865 = (*spvDescriptorSet0.vp_c15)._m0[int(_1861)][_1863];
    float _1867 = log2(_1839);
    int _1869 = _1660 + 72;
    uint _1871 = uint(int(uint(_1869) >> uint(2)));
    uint _1873 = uint(int(uint(int(_1871)) >> uint(2)));
    int _1875 = int(_1871) & 3;
    float _1877 = (*spvDescriptorSet0.vp_c15)._m0[int(_1873)][_1875];
    int _1879 = int(_1871) + 1;
    uint _1881 = uint(int(uint(_1879) >> uint(2)));
    int _1883 = _1879 & 3;
    float _1885 = (*spvDescriptorSet0.vp_c15)._m0[int(_1881)][_1883];
    float _1887 = _1466 * _1681;
    float _1889 = fma(_1124, _1673, _1887);
    int _1891 = _1660 + 88;
    uint _1893 = uint(int(uint(_1891) >> uint(2)));
    uint _1895 = uint(int(uint(int(_1893)) >> uint(2)));
    int _1897 = int(_1893) & 3;
    float _1899 = (*spvDescriptorSet0.vp_c15)._m0[int(_1895)][_1897];
    int _1901 = int(_1893) + 1;
    uint _1903 = uint(int(uint(_1901) >> uint(2)));
    int _1905 = _1901 & 3;
    float _1907 = (*spvDescriptorSet0.vp_c15)._m0[int(_1903)][_1905];
    float _1909 = fma(_1126, _1713, _1889);
    float _1911 = _1867 * 0.693147182464599609375;
    float _1913 = _1909 + _1721;
    float _1915 = _1466 * _1757;
    float _1917 = rsqrt(_1835);
    float _1919 = fma(_1124, _1749, _1915);
    int _1921 = as_type<int>(_1915);
    int _1923 = as_type<int>(_1673);
    if (!_1703)
    {
        int _1925 = _1847 << 2;
        _1921 = _1925;
    }
    int _1927 = _1921;
    float _1929 = _1466 * _1803;
    int _1931 = _1927;
    float _1933 = _1803;
    if (!_1703)
    {
        int _1935 = 12 & _1927;
        _1931 = _1935;
    }
    int _1937 = _1931;
    float _1939 = 1.0 / _1913;
    if (!_1703)
    {
        float _1941 = -_1777;
        float _1943 = _1498 + _1941;
        _1933 = _1943;
    }
    float _1945 = _1933;
    float _1947 = fma(_1124, _1795, _1929);
    float _1949 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1951 = fma(_1496, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1949);
    float _1953 = precise::clamp(_1951, 0.0, 1.0);
    float _1955 = _1911 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1957 = fma(_1126, _1823, _1919);
    float _1959 = _1917 * _1733;
    float _1961 = _1917 * _1807;
    float _1963 = _1957 + _1831;
    float _1965 = _1444 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1967 = _1959 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1969 = _1917 * _1737;
    float _1971 = _1466 * _1865;
    int _1973 = as_type<int>(_1865);
    if (!_1703)
    {
        uint _1975 = uint(int(uint(_1847) >> uint(2)));
        _1973 = int(_1975);
    }
    int _1977 = _1973;
    float _1979 = _1963 * _1939;
    float _1981 = fma(_1446, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1965);
    float _1983 = fma(_1124, _1857, _1971);
    if (!_1703)
    {
        int _1985 = _1977 << 4;
        int _1987 = _1985 + _1937;
        _1923 = _1987;
    }
    int _1989 = _1923;
    float _1991 = -_1953;
    float _1993 = _1991 + 1.0;
    bool _1995 = _1979 >= 0.0;
    float _1997 = fma(_1126, _1877, _1947);
    float _1999 = _1947;
    if (!_1703)
    {
        int _2001 = _1989 + 400;
        uint _2003 = uint(int(uint(_2001) >> uint(2)));
        uint _2005 = uint(int(uint(int(_2003)) >> uint(2)));
        int _2007 = int(_2003) & 3;
        float _2009 = (*spvDescriptorSet0.vp_c15)._m0[int(_2005)][_2007];
        _1999 = _2009;
    }
    float _2011 = _1999;
    bool _2013 = _1979 <= 1.0;
    bool _2015 = _2013 && _1995;
    float _2017 = _1997 + _1885;
    float _2019 = _1444 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2021 = fma(_1448, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1981);
    float _2023 = abs(_1993);
    float _2025 = log2(_2023);
    float _2027 = fma(_1126, _1899, _1983);
    float _2029 = -_1967;
    float _2031 = fma(_1961, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2029);
    float _2033 = fma(_1446, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2019);
    float _2035 = _2017 * _1939;
    float _2037 = _1444 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2039 = -_1969;
    float _2041 = fma(_2039, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2031);
    float _2043 = fma(_1448, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2033);
    float _2045 = _2021 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2047 = fma(_1446, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2037);
    bool _2049 = _2035 >= 0.0;
    bool _2051 = _2049 && _2015;
    float _2053 = _2043 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2055 = _2045 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2057 = fma(_1448, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2047);
    float _2059 = fma(_2041, 0.5, 0.5);
    bool _2061 = _2035 <= 1.0;
    bool _2063 = _2061 && _2051;
    float _2065 = fma(_2053, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2055);
    float _2067 = fma(_2041, -0.5, 0.5);
    float _2069 = _2057 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2071 = fma(_2059, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2073 = fma(_1809, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2065);
    float _2075 = _2025 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2077 = _2027 + _1907;
    float _2079 = sqrt(_2067);
    float _2081 = fma(_2069, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2073);
    float _2083 = fma(_2059, _2071, -0.212114393711090087890625);
    float _2085 = _2045 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2087 = _1961 + 1.0;
    float _2089 = fma(_2059, _2083, 1.570728778839111328125);
    float _2091 = _2083;
    float _2093 = _2087;
    if (_2063)
    {
        float _2095 = float(_1646);
        _2091 = _2095;
    }
    float _2097 = _2091;
    float _2099 = exp2(_2075);
    float _2101 = fma(_2053, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2085);
    float _2103 = fma(_1809, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2101);
    float _2105 = 1.0 / _2081;
    float _2107 = _2045 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2109 = _2079 * 0.636619746685028076171875;
    float _2111 = fma(_2069, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2103);
    float _2113 = fma(_2053, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2107);
    float _2115 = -_2089;
    float _2117 = fma(_2109, _2115, 1.0);
    float _2119 = _2097;
    if (_2063)
    {
        float _2121 = rint(_2097);
        float _2123 = precise::max(_2121, 0.0);
        uint _2125 = uint(_2123);
        uint _2127 = clamp(_2125, 0u, 65535u);
        _2119 = as_type<float>(_2127);
    }
    float _2129 = _2119;
    float _2131 = fma(_1809, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2113);
    float _2133 = -_1961;
    float _2135 = fma(_2099, _2087, _2133);
    float _2137 = fma(_2069, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2131);
    float _2139 = _2077 * _1939;
    float _2141 = _2041;
    if (!_1703)
    {
        float _2143 = floor(_1494);
        _2141 = _2143;
    }
    float _2145 = _2141;
    float _2147 = _2137 * _2105;
    float _2149 = _2111 * _2105;
    float2 _6210 = float2(_1630, _1598);
    float _2151 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6210, float2(0.0), isnan(_6210)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6210, float2(0.0), isnan(_6210)), level(0.0)).x;
    float _2153 = fma(_2147, -0.5, 0.5);
    float _2155 = fma(_2149, 0.5, 0.5);
    float _2157 = fma(_2135, 0.5, 0.5);
    float _2159 = _2129;
    if (_2063)
    {
        float3 _6232 = float3(_1979, _2035, float(as_type<int>(_2129)));
        float3 _6236 = select(_6232, float3(0.0), isnan(_6232));
        float _2161 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6236.xy, uint(rint(_6236.z)), _2139, level(0.0));
        _2159 = _2161;
    }
    float _2163 = _2159;
    float _2165 = _1939;
    if (!_1703)
    {
        float _2167 = rint(_2011);
        float _2169 = precise::max(_2167, 0.0);
        uint _2171 = uint(_2169);
        uint _2173 = clamp(_2171, 0u, 65535u);
        _2165 = as_type<float>(_2173);
    }
    float _2175 = _2165;
    if (!_1703)
    {
        float _2177 = -_2145;
        float _2179 = _1494 + _2177;
        _2093 = _2179;
    }
    float _2181 = _2093;
    float3 _6273 = float3(_2155, _2153, _1955);
    float _2183 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6273, float3(0.0), isnan(_6273)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6273, float3(0.0), isnan(_6273)), level(0.0)).x;
    float3 _6282 = float3(_2155, _2153, _1955);
    float4 _2186 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6282, float3(0.0), isnan(_6282)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6282, float3(0.0), isnan(_6282)), level(0.0)).xyzw;
    float _2188 = _2186.x;
    float _2190 = _2186.y;
    float _2192 = _2186.z;
    float _2194 = _2186.w;
    float2 _6298 = float2(_2117, _2157);
    float3 _2198 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6298, float2(0.0), isnan(_6298)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6298, float2(0.0), isnan(_6298)), level(0.0)).xyz;
    float _2200 = _2198.x;
    float _2202 = _2198.y;
    float _2204 = _2198.z;
    float _2206 = _2175;
    if (!_1703)
    {
        float3 _6319 = float3(_2181, _1945, float(as_type<int>(_2175)));
        float3 _6321 = select(_6319, float3(0.0), isnan(_6319));
        float _2208 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6321.xy, uint(rint(_6321.z)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6321.xy, uint(rint(_6321.z)), level(0.0)).x;
        _2206 = _2208;
    }
    float _2210 = _2206;
    float _2212 = abs(_1588);
    float _2214 = log2(_2212);
    float _2216 = _2045 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2218 = fma(_2053, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2216);
    float _2220 = fma(_1809, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2218);
    float _2222 = _2025 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2224 = fma(_2069, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2220);
    float _2226 = _2214 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2228 = _2224 + _2081;
    float _2230 = exp2(_2222);
    bool _2232 = _1588 <= 8000.0;
    bool _2234 = isnan(_1588);
    bool _2236 = _2232 || _2234;
    bool _2238 = isnan(8000.0);
    bool _2240 = _2236 || _2238;
    float _2242 = float(_2240);
    float _2244 = _2228 * 0.5;
    float _2246 = exp2(_2226);
    out.m_79.z = _2244;
    out.m_79.w = _2081;
    float _2248 = fma(_2246, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2250 = precise::clamp(_2248, 0.0, 1.0);
    float _2252 = fma(_2250, -2.0, 3.0);
    float _2254 = _2250 * _2250;
    float _2256 = _2254 * _2252;
    float _2258 = -_2256;
    float _2260 = _2258 + 1.0;
    out.gl_Position.x = _2111;
    out.gl_Position.y = _2137;
    out.gl_Position.z = _2224;
    out.gl_Position.w = _2081;
    float _2262 = fma(_2260, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2256);
    float _2264 = -_2230;
    float _2266 = _2264 + 1.0;
    float _2268 = _2242 * _2262;
    float _2270 = _2242;
    float _2272 = _2111;
    if (!_2063)
    {
        _2270 = 1.0;
    }
    float _2274 = _2270;
    float _2276 = _2268 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2278 = _2266 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2280 = _2274;
    if (_1703)
    {
        _2272 = 1.0;
    }
    float _2282 = _2272;
    float _2284 = -_2151;
    float _2286 = _2284 + 1.0;
    float _2288 = _2286 * _2276;
    float _2290 = precise::clamp(_2288, 0.0, 1.0);
    float _2292 = _2282;
    float _2294 = _2290;
    if (_2063)
    {
        bool _2296 = _2163 >= _2139;
        bool _2298 = isnan(_2163);
        bool _2300 = _2296 || _2298;
        bool _2302 = isnan(_2139);
        bool _2304 = _2300 || _2302;
        float _2306 = float(_2304);
        _2280 = _2306;
    }
    float _2308 = _2280;
    if (!_1703)
    {
        int _2310 = _1847 << 4;
        int _2312 = _2310 + 2048;
        uint _2314 = uint(int(uint(_2312) >> uint(2)));
        uint _2316 = uint(int(uint(int(_2314)) >> uint(2)));
        int _2318 = int(_2314) & 3;
        float _2320 = (*spvDescriptorSet0.vp_c15)._m0[int(_2316)][_2318];
        int _2322 = int(_2314) + 1;
        uint _2324 = uint(int(uint(_2322) >> uint(2)));
        int _2326 = _2322 & 3;
        float _2328 = (*spvDescriptorSet0.vp_c15)._m0[int(_2324)][_2326];
        int _2330 = _2312 + 8;
        uint _2332 = uint(int(uint(_2330) >> uint(2)));
        uint _2334 = uint(int(uint(int(_2332)) >> uint(2)));
        int _2336 = int(_2332) & 3;
        float _2338 = (*spvDescriptorSet0.vp_c15)._m0[int(_2334)][_2336];
        int _2340 = int(_2332) + 1;
        uint _2342 = uint(int(uint(_2340) >> uint(2)));
        int _2344 = _2340 & 3;
        float _2346 = (*spvDescriptorSet0.vp_c15)._m0[int(_2342)][_2344];
        float _2348 = _1466 * _2328;
        float _2350 = fma(_1124, _2320, _2348);
        float _2352 = fma(_1126, _2338, _2350);
        float _2354 = _2352 + _2346;
        float _2356 = precise::clamp(_2354, 0.0, 1.0);
        float _2358 = -_2356;
        float _2360 = _2358 + _2210;
        float _2362 = fma(_2360, 500.0, 1.5);
        float _2364 = exp2(_2362);
        float _2366 = 0.0 + _2364;
        float _2368 = precise::clamp(_2366, 0.0, 1.0);
        _2292 = _2368;
    }
    float _2370 = _2292;
    float _2372 = _2308 * _2370;
    float _2374 = _2278 * _2183;
    float _2376 = -_2290;
    float _2378 = fma(_2376, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2380 = -_2278;
    float _2382 = _2380 + 1.0;
    bool _2384 = _1496 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2386 = isnan(_1496);
    bool _2388 = _2384 || _2386;
    bool _2390 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2392 = _2388 || _2390;
    float _2394 = _2194 * _2374;
    float _2396 = -_2372;
    float _2398 = fma(_2396, _2378, 1.0);
    float _2400 = precise::clamp(_2398, 0.0, 1.0);
    float _2402 = _2204 * _2374;
    float _2404 = _2194 * _2382;
    float _2406 = fma(_2200, _2394, _2188);
    float _2408 = fma(_2202, _2394, _2190);
    float _2410 = _2400 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2412 = fma(_2194, _2402, _2192);
    out.m_81.x = _2410;
    float _2414 = _2394;
    float _2416 = _2382;
    float _2418 = _2378;
    float _2420 = _2400;
    if (!_2392)
    {
        _1206 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2422 = _1206;
    float _2424 = _2422;
    float _2426 = _2422;
    if (!_2392)
    {
        _2294 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2428 = _2294;
    out.m_83.x = _2406;
    out.m_83.y = _2408;
    out.m_83.z = _2412;
    out.m_83.w = _2404;
    float _2430 = _2428;
    float _2432 = _2428;
    if (!_2392)
    {
        _2414 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2434 = _2414;
    float _2436 = _2434;
    float _2438 = _2434;
    if (!_2392)
    {
        _2416 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2440 = _2416;
    float _2442 = _2440;
    float _2444 = _2440;
    if (!_2392)
    {
        _2418 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2446 = _2418;
    float _2448 = _2446;
    float _2450 = _2446;
    if (!_2392)
    {
        _2420 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2452 = _2420;
    bool _2454 = !_2392;
    float _2456 = _2452;
    float _2458 = _2452;
    if (!_2454)
    {
        bool _2460 = _1496 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2462 = isnan(_1496);
        bool _2464 = _2460 || _2462;
        bool _2466 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2468 = _2464 || _2466;
        if (!_2468)
        {
            float _2470 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2472 = _1496 + _2470;
            float _2474 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2476 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2474;
            float _2478 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2480 = _2478 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2482 = 1.0 / _2476;
            float _2484 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2486 = _2484 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2488 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2490 = _2488 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2492 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2494 = _2492 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2496 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2498 = _2496 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2500 = _2472 * _2482;
            float _2502 = precise::clamp(_2500, 0.0, 1.0);
            float _2504 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2506 = _2504 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2508 = fma(_2502, _2480, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2510 = fma(_2502, _2506, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2512 = fma(_2502, _2486, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2514 = fma(_2502, _2490, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2516 = fma(_2502, _2494, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2518 = fma(_2502, _2498, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2432 = _2512;
            _2450 = _2516;
            _2426 = _2508;
            _2444 = _2514;
            _2438 = _2510;
            _2458 = _2518;
            _2520 = true;
        }
        else
        {
            bool _2522 = _1496 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2524 = isnan(_1496);
            bool _2526 = _2522 || _2524;
            bool _2528 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2530 = _2526 || _2528;
            if (!_2530)
            {
                _2424 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2532 = _2424;
            _2426 = _2532;
            if (!_2530)
            {
                _2430 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2534 = _2430;
            _2432 = _2534;
            if (!_2530)
            {
                _2436 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2536 = _2436;
            _2438 = _2536;
            if (!_2530)
            {
                _2442 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2538 = _2442;
            _2444 = _2538;
            if (!_2530)
            {
                _2448 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2540 = _2448;
            _2450 = _2540;
            if (!_2530)
            {
                _2456 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2542 = _2456;
            bool _2544 = !_2530;
            _2458 = _2542;
            if (!_2544)
            {
                bool _2546 = _1496 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2548 = isnan(_1496);
                bool _2550 = _2546 || _2548;
                bool _2552 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2554 = _2550 || _2552;
                if (!_2554)
                {
                    float _2556 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2558 = _1496 + _2556;
                    float _2560 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2562 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2560;
                    float _2564 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2566 = _2564 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2568 = 1.0 / _2562;
                    float _2570 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2572 = _2570 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2574 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2576 = _2574 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2578 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2580 = _2578 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2582 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2584 = _2582 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2586 = _2558 * _2568;
                    float _2588 = precise::clamp(_2586, 0.0, 1.0);
                    float _2590 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2592 = _2590 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2594 = fma(_2588, _2566, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2596 = fma(_2588, _2592, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2598 = fma(_2588, _2572, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2600 = fma(_2588, _2576, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2602 = fma(_2588, _2580, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2604 = fma(_2588, _2584, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2432 = _2598;
                    _2450 = _2602;
                    _2426 = _2594;
                    _2444 = _2600;
                    _2438 = _2596;
                    _2458 = _2604;
                    _2520 = true;
                }
                else
                {
                    _2432 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2450 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2426 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2444 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2438 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2458 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2520 = false;
    float _2606 = _2432;
    float _2608 = _2450;
    float _2610 = _2426;
    float _2612 = _2444;
    float _2614 = _2438;
    float _2616 = _2458;
    float _2618 = fma(_1324, -0.5, 0.5);
    float _2620 = precise::clamp(_2618, 0.0, 1.0);
    float _2622 = -_2606;
    float _2624 = _2622 + _2608;
    float _2626 = -_2610;
    float _2628 = _2626 + _2612;
    float _2630 = -_2614;
    float _2632 = _2630 + _2616;
    bool _2634 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2636 = fma(_2620, _2624, _2606);
    float _2638 = fma(_2620, _2628, _2610);
    float _2640 = fma(_2620, _2632, _2614);
    float _2642 = _2636 * 0.586610972881317138671875;
    out.m_61.x = 1.0;
    float _2644 = fma(_2638, 0.298911988735198974609375, _2642);
    float _2646 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2648 = fma(_2640, 0.114477999508380889892578125, _2644);
    out.m_81.w = _2646;
    float _2650 = -_2648;
    float _2652 = _2638 + _2650;
    float _2654 = -_2648;
    float _2656 = _2636 + _2654;
    float _2658 = -_2648;
    float _2660 = _2640 + _2658;
    out.m_85.x = 0.0;
    float _2662 = fma(_2652, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2648);
    float _2664 = fma(_2656, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2648);
    float _2666 = fma(_2660, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2648);
    out.m_87.x = _2662;
    out.m_87.y = _2664;
    out.m_87.z = _2666;
    if (!_2634)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2668 = -_1444;
    float _2670 = _2668 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2672 = -_1446;
    float _2674 = _2672 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2676 = -_1448;
    float _2678 = _2676 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2680 = _2670 * _2670;
    float _2682 = fma(_2674, _2674, _2680);
    float _2684 = fma(_2678, _2678, _2682);
    float _2686 = sqrt(_2684);
    float _2688 = rsqrt(_2684);
    float _2690 = -_2686;
    float _2692 = _2690 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2694 = _2692 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2696 = precise::clamp(_2694, 0.0, 1.0);
    float _2698 = _2674 * _2688;
    float _2700 = _2670 * _2688;
    float _2702 = abs(_2696);
    float _2704 = log2(_2702);
    float _2706 = _2678 * _2688;
    float _2708 = _2698 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2710 = _1324 * _2700;
    float _2712 = -_2700;
    float _2714 = -_2708;
    float _2716 = fma(_2712, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2714);
    float _2718 = fma(_1326, _2698, _2710);
    float _2720 = -_2706;
    float _2722 = fma(_2720, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2716);
    float _2724 = fma(_1328, _2706, _2718);
    float _2726 = precise::clamp(_2724, 0.0, 1.0);
    float _2728 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2730 = _2722 + _2728;
    float _2732 = _2704 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2734 = _2730 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2736 = precise::clamp(_2734, 0.0, 1.0);
    float _2738 = exp2(_2732);
    float _2740 = _2738 * _2736;
    float _2742 = _2726 * _2740;
    float _2744 = _2742 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2746 = _2742 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2748 = _2742 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_85.x = _2744;
    out.m_85.y = _2746;
    out.m_85.z = _2748;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

