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
    bool _2610 = false;
    bool _1452 = false;
    bool _630 = false;
    bool _480 = false;
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
        float _2895 = as_type<float>(_122);
        out.gl_Position.z = _2895;
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
        float _2966 = as_type<float>(_162);
        out.gl_Position.z = _2966;
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
    float _412 = fma(_390, (*spvDescriptorSet0.vp_c10)._m0[4].z, _402);
    float _414 = sqrt(_400);
    float _416 = fma(_390, (*spvDescriptorSet0.vp_c10)._m0[5].z, _398);
    float _418 = fma(_390, (*spvDescriptorSet0.vp_c10)._m0[6].z, _410);
    bool _420 = _414 >= 9.9999999747524270787835121154785e-07;
    bool _422 = isnan(_414);
    bool _424 = _420 || _422;
    bool _426 = isnan(9.9999999747524270787835121154785e-07);
    bool _428 = _424 || _426;
    float _430 = fma(_362, _384, _404);
    float _432 = fma(_356, _384, _406);
    float _434 = fma(_380, _384, _408);
    float _436 = _416;
    float _438 = _412;
    float _440 = _418;
    if (!_428)
    {
        bool _442 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _444 = !_442;
        if (!_444)
        {
            float _446 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _448 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _450 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _452 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _446);
            float _454 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _448);
            float _456 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _450);
            float _458 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _452);
            float _460 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _454);
            float _462 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _456);
            float _464 = _458 * _458;
            float _466 = fma(_460, _460, _464);
            float _468 = fma(_462, _462, _466);
            float _470 = rsqrt(_468);
            float _472 = _470 * 9.9999999747524270787835121154785e-07;
            float _474 = _460 * _472;
            float _476 = _458 * _472;
            float _478 = _462 * _472;
            _436 = _476;
            _438 = _474;
            _440 = _478;
            _480 = true;
        }
        else
        {
            float _482 = _168 * _168;
            float _484 = fma(_166, _166, _482);
            float _486 = fma(_170, _170, _484);
            float _488 = sqrt(_486);
            bool _490 = _488 >= 9.9999999747524270787835121154785e-07;
            bool _492 = isnan(_488);
            bool _494 = _490 || _492;
            bool _496 = isnan(9.9999999747524270787835121154785e-07);
            bool _498 = _494 || _496;
            if (!_498)
            {
                float _500 = _406 * _406;
                float _502 = fma(_404, _404, _500);
                float _504 = fma(_408, _408, _502);
                float _506 = sqrt(_504);
                bool _508 = _506 >= 9.9999999747524270787835121154785e-07;
                bool _510 = isnan(_506);
                bool _512 = _508 || _510;
                bool _514 = isnan(9.9999999747524270787835121154785e-07);
                bool _516 = _512 || _514;
                if (!_516)
                {
                    float _518 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _520 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _518);
                    float _522 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _520);
                    float _524 = rsqrt(_522);
                    float _526 = _524 * 9.9999999747524270787835121154785e-07;
                    float _528 = _526 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _530 = _526 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _532 = _526 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _436 = _530;
                    _438 = _528;
                    _440 = _532;
                    _480 = true;
                }
                else
                {
                    float _534 = _406 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _536 = _406 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _538 = _406 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _540 = fma(_404, (*spvDescriptorSet0.vp_c10)._m0[5].x, _534);
                    float _542 = fma(_404, (*spvDescriptorSet0.vp_c10)._m0[4].x, _536);
                    float _544 = fma(_404, (*spvDescriptorSet0.vp_c10)._m0[6].x, _538);
                    float _546 = fma(_408, (*spvDescriptorSet0.vp_c10)._m0[5].z, _540);
                    float _548 = fma(_408, (*spvDescriptorSet0.vp_c10)._m0[4].z, _542);
                    float _550 = fma(_408, (*spvDescriptorSet0.vp_c10)._m0[6].z, _544);
                    float _552 = _546 * _546;
                    float _554 = fma(_548, _548, _552);
                    float _556 = fma(_550, _550, _554);
                    float _558 = rsqrt(_556);
                    float _560 = _558 * 9.9999999747524270787835121154785e-07;
                    float _562 = _548 * _560;
                    float _564 = _546 * _560;
                    float _566 = _550 * _560;
                    _436 = _564;
                    _438 = _562;
                    _440 = _566;
                    _480 = true;
                }
            }
            else
            {
                float _568 = _168 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _570 = _168 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _572 = _168 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _574 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[5].x, _568);
                float _576 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[4].x, _570);
                float _578 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[6].x, _572);
                float _580 = fma(_170, (*spvDescriptorSet0.vp_c10)._m0[5].z, _574);
                float _582 = fma(_170, (*spvDescriptorSet0.vp_c10)._m0[4].z, _576);
                float _584 = fma(_170, (*spvDescriptorSet0.vp_c10)._m0[6].z, _578);
                float _586 = _580 * _580;
                float _588 = fma(_582, _582, _586);
                float _590 = fma(_584, _584, _588);
                float _592 = rsqrt(_590);
                float _594 = _592 * 9.9999999747524270787835121154785e-07;
                float _596 = _582 * _594;
                float _598 = _580 * _594;
                float _600 = _584 * _594;
                _436 = _598;
                _438 = _596;
                _440 = _600;
            }
        }
    }
    _480 = false;
    float _602 = _436;
    float _604 = _438;
    float _606 = _440;
    bool _608 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _610 = !_608;
    float _628;
    if (!_610)
    {
        float _612 = in.m_67.x;
        float _614 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _616 = _612 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _618 = fma(_616, (*spvDescriptorSet0.vp_c9)._m0[12].x, _140);
        float _620 = _618 * _614;
        float _622 = floor(_620);
        float _624 = -_622;
        float _626 = _620 + _624;
        _628 = _626;
        _630 = true;
    }
    else
    {
        float _632 = float(_106);
        float _634 = 1.0 / _632;
        float _636 = _140 * _634;
        _628 = _636;
    }
    _630 = false;
    float _638 = _628;
    float _640 = _432 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _642 = _432 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _644 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _646 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _644;
    float _648 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _650 = _648 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _652 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _654 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _652;
    float _656 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _658 = _656 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _660 = 1.0 / _646;
    float _662 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _664 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _662;
    float _666 = _432 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _668 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _670 = _638 + _668;
    float _672 = fma(_430, (*spvDescriptorSet0.vp_c10)._m0[4].x, _640);
    float _674 = fma(_430, (*spvDescriptorSet0.vp_c10)._m0[5].x, _642);
    float _676 = fma(_430, (*spvDescriptorSet0.vp_c10)._m0[6].x, _666);
    float _678 = 1.0 / _650;
    float _680 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _682 = _638 + _680;
    float _684 = fma(_434, (*spvDescriptorSet0.vp_c10)._m0[4].z, _672);
    float _686 = fma(_434, (*spvDescriptorSet0.vp_c10)._m0[5].z, _674);
    float _688 = fma(_434, (*spvDescriptorSet0.vp_c10)._m0[6].z, _676);
    bool _690 = _638 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _692 = isnan(_638);
    bool _694 = _690 || _692;
    bool _696 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _698 = _694 || _696;
    float _700 = float(_698);
    bool _702 = _638 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _704 = isnan(_638);
    bool _706 = _702 || _704;
    bool _708 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _710 = _706 || _708;
    float _712 = float(_710);
    float _714 = 1.0 / _658;
    float _716 = _682 * _660;
    float _718 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _720 = _638 + _718;
    float _722 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _724 = _638 + _722;
    float _726 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _728 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _726;
    float _730 = _686 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _732 = 1.0 / _654;
    float _734 = _720 * _678;
    float _736 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _738 = _638 + _736;
    float _740 = fma(_728, _716, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _742 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _744 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _742;
    float _746 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _748 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _746;
    float _750 = 1.0 / _664;
    float _752 = _670 * _714;
    float _754 = _688 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _756 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _758 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _756;
    float _760 = _724 * _732;
    bool _762 = _638 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _764 = isnan(_638);
    bool _766 = _762 || _764;
    bool _768 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _770 = _766 || _768;
    float _772 = float(_770);
    float _774 = fma(_748, _716, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _776 = fma(_758, _716, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _778 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _780 = _778 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _782 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _784 = _782 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _786 = -_772;
    float _788 = _786 + 1.0;
    float _790 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _792 = _790 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _794 = _738 * _750;
    bool _796 = _638 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _798 = isnan(_638);
    bool _800 = _796 || _798;
    bool _802 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _804 = _800 || _802;
    float _806 = float(_804);
    float _808 = _700 * _788;
    float _810 = -_700;
    float _812 = _810 + 1.0;
    float _814 = fma(_784, _734, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _816 = fma(_792, _734, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _818 = fma(_744, _760, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _820 = _806 * _812;
    float _822 = -_806;
    float _824 = _822 + 1.0;
    float _826 = fma(_780, _734, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _828 = _638 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _830 = isnan(_638);
    bool _832 = _828 || _830;
    bool _834 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _836 = _832 || _834;
    float _838 = float(_836);
    float _840 = _602 * _602;
    float _842 = _712 * _824;
    float _844 = -_712;
    float _846 = _844 + 1.0;
    bool _848 = _638 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _850 = isnan(_638);
    bool _852 = _848 || _850;
    bool _854 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _856 = _852 || _854;
    float _858 = float(_856);
    float _860 = -_838;
    float _862 = _860 + 1.0;
    float _864 = fma(_604, _604, _840);
    float _866 = _838 * _846;
    float _868 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _870 = _868 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _872 = _858 * _862;
    float _874 = fma(_606, _606, _864);
    float _876 = -_858;
    float _878 = _876 + 1.0;
    float _880 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _882 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _880;
    float _884 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _886 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _884;
    float _888 = _774 * _872;
    float _890 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _892 = _890 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _894 = rsqrt(_874);
    float _896 = fma(_882, _760, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _898 = fma(_886, _760, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _900 = fma(_878, (*spvDescriptorSet0.vp_c9)._m0[143].x, _888);
    float _902 = fma(_870, _752, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _904 = fma(_892, _752, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _906 = fma(_826, _866, _900);
    float _908 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _910 = _908 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _912 = _740 * _872;
    float _914 = fma(_896, _842, _906);
    float _916 = fma(_910, _752, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _918 = fma(_878, (*spvDescriptorSet0.vp_c9)._m0[143].z, _912);
    float _920 = fma(_902, _820, _914);
    float _922 = _894 * _604;
    float _924 = in.m_65.x;
    float _926 = in.m_65.y;
    float _928 = in.m_65.z;
    float _930 = _684 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _932 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _934 = _730 + _932;
    float _936 = _894 * _602;
    float _938 = _894 * _606;
    float _940 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _942 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _940;
    float _944 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _946 = _930 + _944;
    float _948 = _934 * _934;
    float _950 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _952 = _754 + _950;
    float _954 = fma(_942, _794, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _956 = _936 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _958 = fma(_946, _946, _948);
    float _960 = _776 * _872;
    float _962 = fma(_954, _808, _920);
    float _964 = fma(_922, (*spvDescriptorSet0.vp_c10)._m0[8].y, _956);
    float _966 = fma(_952, _952, _958);
    float _968 = fma(_878, (*spvDescriptorSet0.vp_c9)._m0[143].y, _960);
    float _970 = fma(_772, (*spvDescriptorSet0.vp_c9)._m0[148].x, _962);
    float _972 = fma(_938, (*spvDescriptorSet0.vp_c10)._m0[10].y, _964);
    float _974 = fma(_814, _866, _968);
    float _976 = rsqrt(_966);
    float _978 = fma(_816, _866, _918);
    float _980 = abs(_972);
    bool _982 = _980 > 0.99989998340606689453125;
    float _984 = _970 * _924;
    float _986 = fma(_818, _842, _974);
    float _988 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _990 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _988;
    float _992 = _984 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _994 = fma(_898, _842, _978);
    float _996 = fma(_990, _794, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _998 = fma(_904, _820, _986);
    float _1000 = _992 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _1002 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _1004 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _1002;
    float _1006 = fma(_916, _820, _994);
    float _1008 = _818;
    float _1010 = _816;
    float _1012 = _842;
    float _1014 = _990;
    if (_982)
    {
        _1008 = 0.001000000047497451305389404296875;
    }
    float _1016 = _1008;
    float _1018 = _1000 * _976;
    if (!_982)
    {
        _1010 = (*spvDescriptorSet0.vp_c10)._m0[8].y;
    }
    float _1020 = _1010;
    float _1022 = fma(_1004, _794, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _1024 = _1020;
    if (!_982)
    {
        _1012 = (*spvDescriptorSet0.vp_c10)._m0[10].y;
    }
    float _1026 = _1012;
    float _1028 = _934 * _1018;
    float _1030 = _1026;
    if (_982)
    {
        float _1032 = fma(_1016, (*spvDescriptorSet0.vp_c10)._m0[8].z, (*spvDescriptorSet0.vp_c10)._m0[8].y);
        _1024 = _1032;
    }
    float _1034 = _1024;
    float _1036 = _946 * _1018;
    float _1038 = -_1028;
    float _1040 = _934 + _1038;
    if (!_982)
    {
        _1014 = (*spvDescriptorSet0.vp_c10)._m0[9].y;
    }
    float _1042 = _1014;
    float _1044 = -_1036;
    float _1046 = _946 + _1044;
    float _1048 = _952 * _1018;
    float _1050 = _1040 * _1040;
    float _1052 = _1042;
    float _1054 = _1048;
    if (_982)
    {
        float _1056 = fma(_1016, (*spvDescriptorSet0.vp_c10)._m0[10].z, (*spvDescriptorSet0.vp_c10)._m0[10].y);
        _1030 = _1056;
    }
    float _1058 = _1030;
    float _1060 = -_1034;
    float _1062 = _938 * _1060;
    if (_982)
    {
        float _1064 = fma(_1016, (*spvDescriptorSet0.vp_c10)._m0[9].z, (*spvDescriptorSet0.vp_c10)._m0[9].y);
        _1052 = _1064;
    }
    float _1066 = _1052;
    float _1068 = fma(_1046, _1046, _1050);
    float _1070 = -_1058;
    float _1072 = _936 * _1070;
    float _1074 = -_1058;
    float _1076 = -_1062;
    float _1078 = fma(_922, _1074, _1076);
    float _1080 = -_1048;
    float _1082 = _952 + _1080;
    float _1084 = fma(_996, _808, _998);
    float _1086 = -_1066;
    float _1088 = -_1072;
    float _1090 = fma(_938, _1086, _1088);
    float _1092 = -_1066;
    float _1094 = _922 * _1092;
    float _1096 = _1078 * _1078;
    float _1098 = fma(_1082, _1082, _1068);
    float _1100 = fma(_1022, _808, _1006);
    float _1102 = in.m_69.x;
    float _1104 = in.m_69.y;
    float _1106 = in.m_69.z;
    float _1108 = -_1034;
    float _1110 = -_1094;
    float _1112 = fma(_936, _1108, _1110);
    float _1114 = fma(_1090, _1090, _1096);
    float _1116 = sqrt(_1098);
    float _1118 = fma(_772, (*spvDescriptorSet0.vp_c9)._m0[148].y, _1084);
    float _1120 = fma(_772, (*spvDescriptorSet0.vp_c9)._m0[148].z, _1100);
    float _1122 = fma(_1112, _1112, _1114);
    float _1124 = _1118 * _926;
    float _1126 = _1120 * _928;
    float _1128 = rsqrt(_1122);
    float _1130 = _1124 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1132 = _1126 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1134 = _976 * _1116;
    float _1136 = _1130 * _1134;
    float _1138 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1104);
    float _1140 = _992 * _1134;
    float _1142 = _1132 * _1134;
    float _1144 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1102);
    float _1146 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1106);
    float _1148 = _1090 * _1128;
    float _1150 = _1078 * _1128;
    float _1152 = _1112 * _1128;
    float _1154 = _1136 * _1138;
    float _1156 = _1140 * _1144;
    float _1158 = _1142 * _1146;
    float _1160 = _922 * _1150;
    float _1162 = _936 * _1152;
    float _1164 = _1154 * _922;
    float _1166 = _1154 * _938;
    float _1168 = -_1160;
    float _1170 = fma(_936, _1148, _1168);
    float _1172 = -_1162;
    float _1174 = fma(_938, _1150, _1172);
    float _1176 = fma(_1156, _1148, _1164);
    float _1178 = fma(_1156, _1152, _1166);
    bool _1180 = _1104 != 0.0;
    bool _1182 = isnan(_1104);
    bool _1184 = _1180 || _1182;
    bool _1186 = isnan(0.0);
    bool _1188 = _1184 || _1186;
    float _1190 = _938 * _1148;
    float _1192 = fma(_1158, _1174, _1176);
    float _1194 = fma(_1158, _1170, _1178);
    bool _1196 = _1102 == 0.0;
    bool _1198 = !_1188;
    bool _1200 = _1196 && _1198;
    float _1202 = _1154 * _936;
    float _1204 = _930 + _1192;
    float _1206 = _754 + _1194;
    bool _1208 = _1106 == 0.0;
    bool _1210 = _1208 && _1200;
    float _1212 = in.m_71.x;
    float _1214 = in.m_71.y;
    float _1216 = in.m_71.z;
    float _1218 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1220 = _1204 + _1218;
    float _1222 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1224 = _1206 + _1222;
    float _1226 = fma(_1156, _1150, _1202);
    float _1228 = -_1190;
    float _1230 = fma(_922, _1152, _1228);
    float _1232 = _1220 * _1220;
    float _1234 = _1224 * _1224;
    float _1236 = fma(_1158, _1230, _1226);
    float _1238 = _1232 + _1234;
    float _1240 = _730 + _1236;
    float _1242 = sqrt(_1238);
    float _1244 = _1212;
    float _1246 = _1214;
    float _1248 = _1216;
    float _1250 = _1158;
    float _1252 = _1104;
    float _1254 = _1102;
    float _1256 = _1156;
    float _1258 = _1204;
    if (!_1210)
    {
        float _1260 = fma(_1102, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1212);
        _1244 = _1260;
    }
    float _1262 = _1244;
    if (!_1210)
    {
        float _1264 = fma(_1104, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1214);
        _1246 = _1264;
    }
    float _1266 = _1246;
    if (!_1210)
    {
        float _1268 = fma(_1106, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1216);
        _1248 = _1268;
    }
    float _1270 = _1248;
    bool _1272 = _1242 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    if (!_1272)
    {
        _1250 = _1204;
    }
    float _1274 = _1250;
    float _1276 = _1274;
    if (!_1272)
    {
        _1252 = _1234;
    }
    float _1278 = _1252;
    float _1280 = _1278;
    if (!_1272)
    {
        _1254 = _1232;
    }
    float _1282 = _1254;
    float _1284 = _1282;
    if (!_1272)
    {
        _1256 = _1206;
    }
    float _1286 = _1256;
    float _1288 = _1286;
    if (!_1272)
    {
        _1258 = _1240;
    }
    float _1290 = _1258;
    bool _1292 = !_1272;
    float _1294 = _1290;
    if (!_1292)
    {
        float _1296 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1298 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1300 = _1242 + _1298;
        float _1302 = rsqrt(_1238);
        float _1304 = _1300 * _1296;
        float _1306 = _1240 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1308 = _1304 * 0.15915493667125701904296875;
        float _1310 = _1308 * 6.283185482025146484375;
        float _1312 = sin(_1310);
        float _1314 = _1308 * 6.283185482025146484375;
        float _1316 = cos(_1314);
        float _1318 = fma(_1312, _1306, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1320 = _1302 * _1318;
        float _1322 = _1316 + (-1.0);
        float _1324 = fma(_1220, _1320, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1326 = fma(_1224, _1320, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1328 = _1322 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1330 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1332 = _1324 + _1330;
        float _1334 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1336 = _1326 + _1334;
        float _1338 = fma(_1240, _1316, _1328);
        float _1340 = _1332 * _1332;
        float _1342 = _1336 * _1336;
        _1294 = _1338;
        _1284 = _1340;
        _1280 = _1342;
        _1276 = _1324;
        _1288 = _1326;
    }
    float _1344 = _1294;
    float _1346 = _1284;
    float _1348 = _1280;
    float _1350 = _1276;
    float _1352 = _1288;
    float _1354 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1356 = _1344 + _1354;
    float _1358 = _922 * _1266;
    float _1360 = _936 * _1266;
    float _1362 = _938 * _1266;
    float _1364 = fma(_1356, _1356, _1346);
    float _1366 = fma(_1148, _1262, _1358);
    float _1368 = fma(_1150, _1262, _1360);
    float _1370 = fma(_1152, _1262, _1362);
    float _1372 = _1364 + _1348;
    float _1374 = fma(_1174, _1270, _1366);
    float _1376 = fma(_1230, _1270, _1368);
    float _1378 = fma(_1170, _1270, _1370);
    float _1380 = sqrt(_1372);
    float _1382 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1384 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1386 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1388 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1390 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1392 = _1382 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1394 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1396 = _1384 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1398 = _1386 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1400 = _1388 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1402 = _1390 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1404 = _1394 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_73.x = _1374;
    out.m_73.y = _1376;
    out.m_73.z = _1378;
    bool _1406 = _1380 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1408 = isnan(_1380);
    bool _1410 = _1406 || _1408;
    bool _1412 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1414 = _1410 || _1412;
    out.m_75.x = _1392;
    out.m_75.y = _1396;
    out.m_75.z = _1398;
    out.m_77.x = _1400;
    out.m_77.y = _1402;
    out.m_77.z = _1404;
    float _1416 = _1368;
    if (!_1414)
    {
        _1416 = 1.0;
    }
    float _1418 = _1416;
    bool _1420 = !_1414;
    float _1422 = _1418;
    if (!_1420)
    {
        bool _1424 = _1380 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1426 = isnan(_1380);
        bool _1428 = _1424 || _1426;
        bool _1430 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1432 = _1428 || _1430;
        if (!_1432)
        {
            float _1434 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1436 = _1380 + _1434;
            float _1438 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1440 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1438;
            float _1442 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1444 = _1442 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1446 = 1.0 / _1440;
            float _1448 = _1436 * _1446;
            float _1450 = fma(_1448, _1444, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1422 = _1450;
            _1452 = true;
        }
        else
        {
            bool _1454 = _1380 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1456 = isnan(_1380);
            bool _1458 = _1454 || _1456;
            bool _1460 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1462 = _1458 || _1460;
            if (!_1462)
            {
                float _1464 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1466 = _1380 + _1464;
                float _1468 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1470 = _1468 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1472 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1474 = _1472 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1476 = 1.0 / _1470;
                float _1478 = _1466 * _1476;
                float _1480 = fma(_1478, _1474, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1422 = _1480;
                _1452 = true;
            }
            else
            {
                _1422 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1452 = false;
    float _1482 = _1422;
    float _1484 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1486 = _1344 + _1484;
    float _1488 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1490 = _1350 + _1488;
    float _1492 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1494 = _1352 + _1492;
    float _1496 = -_1028;
    float _1498 = _730 + _1496;
    float _1500 = fma(_1486, _1482, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1502 = fma(_1490, _1482, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1504 = fma(_1494, _1482, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1506 = -_1036;
    float _1508 = _930 + _1506;
    float _1510 = -_1028;
    float _1512 = _1510 + _1500;
    float _1514 = -_1036;
    float _1516 = _1514 + _1502;
    float _1518 = -_1048;
    float _1520 = _1518 + _1504;
    float _1522 = _1498 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1524 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1526 = _1512 + _1524;
    float _1528 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1530 = _1516 + _1528;
    float _1532 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1534 = _1520 + _1532;
    float _1536 = -_1048;
    float _1538 = _754 + _1536;
    float _1540 = _1526 * _1526;
    float _1542 = fma(_1508, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1522);
    float _1544 = _1512 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1546 = fma(_1530, _1530, _1540);
    float _1548 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1542);
    float _1550 = fma(_1534, _1534, _1546);
    float _1552 = _1548 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1554 = _1498 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1556 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _1558 = rsqrt(_1550);
    float _1560 = fma(_1508, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1554);
    float _1562 = _1498 + _1556;
    float _1564 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1560);
    float _1566 = _1562 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1568 = 1.0 / _1552;
    float _1570 = fma(_1538, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1572 = _1564 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1574 = fma(_1508, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1566);
    float _1576 = _1572 + _1552;
    float _1578 = fma(_1538, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1574);
    float _1580 = _1558 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1582 = floor(_1570);
    float _1584 = _1578 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1586 = _1530 * _1580;
    float _1588 = _1534 * _1580;
    float _1590 = _1562 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1592 = _1586 * _1586;
    float _1594 = _1588 * _1588;
    float _1596 = _1576 * _1568;
    float _1598 = _1596 * 0.5;
    float _1600 = fma(_1508, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1590);
    float _1602 = trunc(_1584);
    int _1604 = int(_1602);
    float _1606 = _1592 + _1594;
    float _1608 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1610 = fma(_1598, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1608);
    float _1612 = fma(_1538, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1600);
    float _1614 = _1612 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1616 = sqrt(_1606);
    float _1618 = fma(_1508, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1620 = 1.0 / _1610;
    int _1622 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1624 = _1604 + _1622;
    int _1626 = _1624 + 1;
    bool _1628 = _1616 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1630 = trunc(_1614);
    int _1632 = int(_1630);
    float _1634 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1636 = _1620 * _1634;
    float _1638 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1640 = _1616 + _1638;
    float _1642 = floor(_1618);
    bool _1644 = _1636 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1646 = _1636 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    int _1648 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1650 = _1632 + _1648;
    int _1652 = _1650 + 1;
    float _1654 = _1552;
    int _1656 = 2;
    float _1658 = _1640;
    float _1660 = _1526;
    float _1662 = _1544;
    int _1664 = _1652;
    float _1666 = _1586;
    int _1668 = as_type<int>(_1582);
    float _1670 = _1592;
    float _1672 = _1508;
    if (_1628)
    {
        float _1674 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1654 = _1674;
    }
    float _1676 = _1654;
    if (!_1644)
    {
        _1656 = 1;
    }
    int _1678 = _1656;
    float _1680 = -_1642;
    float _1682 = _1618 + _1680;
    float _1684 = 0.0;
    int _1686 = _1678;
    if (_1628)
    {
        float _1688 = rsqrt(_1606);
        _1684 = _1688;
    }
    float _1690 = _1684;
    float _1692 = _1690;
    if (_1628)
    {
        float _1694 = _1640 * _1676;
        _1658 = _1694;
    }
    float _1696 = _1658;
    float _1698 = sqrt(_1550);
    if (_1628)
    {
        float _1700 = _1696 * 0.15915493667125701904296875;
        _1054 = _1700;
    }
    float _1702 = _1054;
    bool _1704 = !_1644;
    int _1706 = _1704 ? 0 : 1;
    float _1708 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    if (!_1646)
    {
        _1686 = _1706;
    }
    int _1710 = _1686;
    float _1712 = _1578;
    if (_1628)
    {
        float _1714 = _1702 * 6.283185482025146484375;
        float _1716 = cos(_1714);
        _1712 = _1716;
    }
    float _1718 = _1712;
    float _1720 = precise::max(0.0, _1708);
    int _1722 = _1710 << 6;
    bool _1724 = _1652 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1726 = -_1580;
    float _1728 = -_1720;
    float _1730 = fma(_1526, _1726, _1728);
    int _1732 = _1722 + 48;
    uint _1735 = uint(int(uint(_1732) >> uint(2)));
    uint _1737 = uint(int(uint(int(_1735)) >> uint(2)));
    int _1739 = int(_1735) & 3;
    float _1741 = (*spvDescriptorSet0.vp_c15)._m0[int(_1737)][_1739];
    int _1743 = int(_1735) + 1;
    uint _1745 = uint(int(uint(_1743) >> uint(2)));
    int _1747 = _1743 & 3;
    float _1749 = (*spvDescriptorSet0.vp_c15)._m0[int(_1745)][_1747];
    float _1751 = _1616;
    float _1753 = _1730;
    if (_1628)
    {
        float _1755 = _1702 * 6.283185482025146484375;
        float _1757 = sin(_1755);
        _1751 = _1757;
    }
    float _1759 = _1751;
    int _1761 = _1652 | _1626;
    if (_1628)
    {
        float _1763 = _1730 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1660 = _1763;
    }
    float _1765 = _1660;
    bool _1767 = _1761 < 0;
    bool _1769 = _1767 || _1724;
    int _1771 = _1722 + 64;
    uint _1773 = uint(int(uint(_1771) >> uint(2)));
    uint _1775 = uint(int(uint(int(_1773)) >> uint(2)));
    int _1777 = int(_1773) & 3;
    float _1779 = (*spvDescriptorSet0.vp_c15)._m0[int(_1775)][_1777];
    int _1781 = int(_1773) + 1;
    uint _1783 = uint(int(uint(_1781) >> uint(2)));
    int _1785 = _1781 & 3;
    float _1787 = (*spvDescriptorSet0.vp_c15)._m0[int(_1783)][_1785];
    float _1789 = 0.0;
    if (_1628)
    {
        float _1791 = _1718 + (-1.0);
        _1789 = _1791;
    }
    float _1793 = _1789;
    bool _1795 = _1626 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1797 = _1795 || _1769;
    float _1799 = 0.0;
    if (_1628)
    {
        float _1801 = _1793 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1799 = _1801;
    }
    float _1803 = _1799;
    float _1805 = fma(_1516, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1544);
    if (!_1628)
    {
        _1662 = _1588;
    }
    float _1807 = _1662;
    int _1809 = _1722 + 96;
    uint _1811 = uint(int(uint(_1809) >> uint(2)));
    uint _1813 = uint(int(uint(int(_1811)) >> uint(2)));
    int _1815 = int(_1811) & 3;
    float _1817 = (*spvDescriptorSet0.vp_c15)._m0[int(_1813)][_1815];
    int _1819 = int(_1811) + 1;
    uint _1821 = uint(int(uint(_1819) >> uint(2)));
    int _1823 = _1819 & 3;
    float _1825 = (*spvDescriptorSet0.vp_c15)._m0[int(_1821)][_1823];
    float _1827 = 0.0;
    float _1829 = _1807;
    if (_1628)
    {
        float _1831 = fma(_1759, _1765, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1827 = _1831;
    }
    float _1833 = _1827;
    if (_1628)
    {
        float _1835 = fma(_1730, _1718, _1803);
        _1753 = _1835;
    }
    float _1837 = _1753;
    float _1839 = fma(_1520, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1805);
    float _1841 = _1839;
    if (_1628)
    {
        float _1843 = _1690 * _1833;
        _1692 = _1843;
    }
    float _1845 = _1692;
    float _1847 = _1803;
    if (!_1797)
    {
        float _1849 = floor(_1584);
        _1847 = _1849;
    }
    float _1851 = _1847;
    int _1853 = _1722 + 80;
    uint _1855 = uint(int(uint(_1853) >> uint(2)));
    uint _1857 = uint(int(uint(int(_1855)) >> uint(2)));
    int _1859 = int(_1855) & 3;
    float _1861 = (*spvDescriptorSet0.vp_c15)._m0[int(_1857)][_1859];
    int _1863 = int(_1855) + 1;
    uint _1865 = uint(int(uint(_1863) >> uint(2)));
    int _1867 = _1863 & 3;
    float _1869 = (*spvDescriptorSet0.vp_c15)._m0[int(_1865)][_1867];
    if (_1628)
    {
        float _1871 = _1588 * _1845;
        _1829 = _1871;
    }
    float _1873 = _1829;
    if (!_1797)
    {
        int _1875 = _1626 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1877 = _1875 + _1652;
        _1664 = _1877;
    }
    int _1879 = _1664;
    float _1881 = _1839 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    if (_1628)
    {
        float _1883 = _1586 * _1845;
        _1666 = _1883;
    }
    float _1885 = _1666;
    if (!_1628)
    {
        _1841 = _1594;
    }
    float _1887 = _1841;
    float _1889 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1891 = _1881 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    int _1893 = _1722 + 104;
    uint _1895 = uint(int(uint(_1893) >> uint(2)));
    uint _1897 = uint(int(uint(int(_1895)) >> uint(2)));
    int _1899 = int(_1895) & 3;
    float _1901 = (*spvDescriptorSet0.vp_c15)._m0[int(_1897)][_1899];
    int _1903 = int(_1895) + 1;
    uint _1905 = uint(int(uint(_1903) >> uint(2)));
    int _1907 = _1903 & 3;
    float _1909 = (*spvDescriptorSet0.vp_c15)._m0[int(_1905)][_1907];
    float _1911 = -_1582;
    float _1913 = _1570 + _1911;
    float _1915 = _1887;
    int _1917 = as_type<int>(_1891);
    if (!_1797)
    {
        int _1919 = _1879 << 2;
        _1668 = _1919;
    }
    int _1921 = _1668;
    float _1923 = -_1891;
    float _1925 = fma(_1923, _1889, 1.0);
    if (_1628)
    {
        float _1927 = _1885 * _1885;
        _1670 = _1927;
    }
    float _1929 = _1670;
    int _1931 = as_type<int>(_1929);
    if (_1628)
    {
        float _1933 = _1873 * _1873;
        _1915 = _1933;
    }
    float _1935 = _1915;
    if (!_1797)
    {
        int _1937 = 12 & _1921;
        _1917 = _1937;
    }
    int _1939 = _1917;
    int _1941 = _1722 + 56;
    uint _1943 = uint(int(uint(_1941) >> uint(2)));
    uint _1945 = uint(int(uint(int(_1943)) >> uint(2)));
    int _1947 = int(_1943) & 3;
    float _1949 = (*spvDescriptorSet0.vp_c15)._m0[int(_1945)][_1947];
    int _1951 = int(_1943) + 1;
    uint _1953 = uint(int(uint(_1951) >> uint(2)));
    int _1955 = _1951 & 3;
    float _1957 = (*spvDescriptorSet0.vp_c15)._m0[int(_1953)][_1955];
    float _1959 = fma(_1837, _1837, _1929);
    if (!_1797)
    {
        uint _1961 = uint(int(uint(_1879) >> uint(2)));
        _1931 = int(_1961);
    }
    int _1963 = _1931;
    float _1965 = log2(_1925);
    float _1967 = _1959 + _1935;
    int _1969 = _1722 + 72;
    uint _1971 = uint(int(uint(_1969) >> uint(2)));
    uint _1973 = uint(int(uint(int(_1971)) >> uint(2)));
    int _1975 = int(_1971) & 3;
    float _1977 = (*spvDescriptorSet0.vp_c15)._m0[int(_1973)][_1975];
    int _1979 = int(_1971) + 1;
    uint _1981 = uint(int(uint(_1979) >> uint(2)));
    int _1983 = _1979 & 3;
    float _1985 = (*spvDescriptorSet0.vp_c15)._m0[int(_1981)][_1983];
    float _1987 = _1562 * _1749;
    float _1989 = _1749;
    int _1991 = _1963;
    if (!_1797)
    {
        float _1993 = -_1851;
        float _1995 = _1584 + _1993;
        _1989 = _1995;
    }
    float _1997 = _1989;
    float _1999 = rsqrt(_1967);
    if (!_1797)
    {
        int _2001 = _1963 << 4;
        int _2003 = _2001 + _1939;
        _1991 = _2003;
    }
    int _2005 = _1991;
    float _2007 = fma(_1508, _1741, _1987);
    float _2009 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2011 = fma(_1698, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2009);
    float _2013 = precise::clamp(_2011, 0.0, 1.0);
    int _2015 = _1722 + 88;
    uint _2017 = uint(int(uint(_2015) >> uint(2)));
    uint _2019 = uint(int(uint(int(_2017)) >> uint(2)));
    int _2021 = int(_2017) & 3;
    float _2023 = (*spvDescriptorSet0.vp_c15)._m0[int(_2019)][_2021];
    int _2025 = int(_2017) + 1;
    uint _2027 = uint(int(uint(_2025) >> uint(2)));
    int _2029 = _2025 & 3;
    float _2031 = (*spvDescriptorSet0.vp_c15)._m0[int(_2027)][_2029];
    float _2033 = _1562 * _1787;
    float _2035 = _1965 * 0.693147182464599609375;
    float2 _6081 = float2(_1682, _1913);
    float _2037 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6081, float2(0.0), isnan(_6081)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6081, float2(0.0), isnan(_6081)), level(0.0)).x;
    float _2039 = _2035 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2041 = _1562 * _1825;
    float _2043 = _1999 * _1885;
    float _2045 = fma(_1508, _1817, _2041);
    float _2047 = -_2013;
    float _2049 = _2047 + 1.0;
    float _2051 = _1999 * _1837;
    float _2053 = _2043 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2055 = _1562 * _1869;
    float _2057 = fma(_1508, _1779, _2033);
    float _2059 = _1999 * _1873;
    float _2061 = abs(_2049);
    float _2063 = log2(_2061);
    float _2065 = fma(_1508, _1861, _2055);
    float _2067 = -_2053;
    float _2069 = fma(_2051, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2067);
    float _2071 = _1999;
    float _2073 = _2045;
    if (!_1797)
    {
        int _2075 = _2005 + 400;
        uint _2077 = uint(int(uint(_2075) >> uint(2)));
        uint _2079 = uint(int(uint(int(_2077)) >> uint(2)));
        int _2081 = int(_2077) & 3;
        float _2083 = (*spvDescriptorSet0.vp_c15)._m0[int(_2079)][_2081];
        _2071 = _2083;
    }
    float _2085 = _2071;
    float _2087 = fma(_1538, _1901, _2045);
    float _2089 = -_2059;
    float _2091 = fma(_2089, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2069);
    if (!_1797)
    {
        float _2093 = floor(_1614);
        _2073 = _2093;
    }
    float _2095 = _2073;
    float _2097 = _2087 + _1909;
    float _2099 = fma(_1538, _1949, _2007);
    float _2101 = fma(_2091, -0.5, 0.5);
    float _2103 = fma(_2091, 0.5, 0.5);
    float _2105 = 1.0 / _2097;
    float _2107 = fma(_1538, _1977, _2057);
    float _2109 = sqrt(_2101);
    float _2111 = _2107 + _1985;
    float _2113 = _1512 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2115 = fma(_1538, _2023, _2065);
    float _2117 = _2099 + _1957;
    float _2119 = _1512 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2121 = _1512 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2123 = fma(_1516, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2113);
    float _2125 = _2117 * _2105;
    float _2127 = fma(_1516, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2119);
    float _2129 = fma(_1516, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2121);
    float _2131 = _2111 * _2105;
    float _2133 = fma(_1520, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2123);
    bool _2135 = _2125 >= 0.0;
    float _2137 = fma(_1520, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2127);
    float _2139 = fma(_1520, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2129);
    float _2141 = _2063 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    bool _2143 = _2125 <= 1.0;
    bool _2145 = _2143 && _2135;
    float _2147 = _2137 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2149 = _2139 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2151 = exp2(_2141);
    bool _2153 = _2131 >= 0.0;
    bool _2155 = _2153 && _2145;
    float _2157 = _2147 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2159 = _2133 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2161 = _2115 + _2031;
    bool _2163 = _2131 <= 1.0;
    bool _2165 = _2163 && _2155;
    float _2167 = fma(_2149, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2157);
    float _2169 = _2147 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2171 = _2051 + 1.0;
    float _2173 = fma(_1881, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2167);
    float _2175 = fma(_2149, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2169);
    float _2177 = _2109 * 0.636619746685028076171875;
    float _2179 = _2161 * _2105;
    float _2181 = fma(_2103, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2183 = fma(_2159, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2173);
    float _2185 = -_2051;
    float _2187 = fma(_2151, _2171, _2185);
    float _2189 = fma(_1881, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2175);
    float _2191 = fma(_2103, _2181, -0.212114393711090087890625);
    float _2193 = 1.0 / _2183;
    float _2195 = _2147 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2197 = _2173;
    if (_2165)
    {
        float _2199 = float(_1710);
        _2197 = _2199;
    }
    float _2201 = _2197;
    float _2203 = fma(_2159, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2189);
    float _2205 = fma(_2103, _2191, 1.570728778839111328125);
    float _2207 = fma(_2149, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2195);
    float _2209 = fma(_2187, 0.5, 0.5);
    float _2211 = _2201;
    float _2213 = _2207;
    if (_2165)
    {
        float _2215 = rint(_2201);
        float _2217 = precise::max(_2215, 0.0);
        uint _2219 = uint(_2217);
        uint _2221 = clamp(_2219, 0u, 65535u);
        _2211 = as_type<float>(_2221);
    }
    float _2223 = _2211;
    float _2225 = fma(_1881, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2207);
    float _2227 = -_2205;
    float _2229 = fma(_2177, _2227, 1.0);
    if (!_1797)
    {
        float _2231 = -_2095;
        float _2233 = _1614 + _2231;
        _2213 = _2233;
    }
    float _2235 = _2213;
    float _2237 = fma(_2159, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2225);
    float _2239 = _2203 * _2193;
    float _2241 = _2237 * _2193;
    float _2243 = fma(_2239, 0.5, 0.5);
    float _2245 = fma(_2241, -0.5, 0.5);
    float _2247 = _2241;
    float _2249 = _2235;
    float _2251 = _2237;
    if (!_1797)
    {
        float _2253 = rint(_2085);
        float _2255 = precise::max(_2253, 0.0);
        uint _2257 = uint(_2255);
        uint _2259 = clamp(_2257, 0u, 65535u);
        _2247 = as_type<float>(_2259);
    }
    float _2261 = _2247;
    float _2263 = _2223;
    if (_2165)
    {
        float3 _6467 = float3(_2125, _2131, float(as_type<int>(_2223)));
        float3 _6471 = select(_6467, float3(0.0), isnan(_6467));
        float _2265 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6471.xy, uint(rint(_6471.z)), _2179, level(0.0));
        _2263 = _2265;
    }
    float _2267 = _2263;
    float3 _6481 = float3(_2243, _2245, _2039);
    float _2269 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6481, float3(0.0), isnan(_6481)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6481, float3(0.0), isnan(_6481)), level(0.0)).x;
    float3 _6490 = float3(_2243, _2245, _2039);
    float4 _2272 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6490, float3(0.0), isnan(_6490)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6490, float3(0.0), isnan(_6490)), level(0.0)).xyzw;
    float _2274 = _2272.x;
    float _2276 = _2272.y;
    float _2278 = _2272.z;
    float _2280 = _2272.w;
    float2 _6506 = float2(_2229, _2209);
    float3 _2284 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6506, float2(0.0), isnan(_6506)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6506, float2(0.0), isnan(_6506)), level(0.0)).xyz;
    float _2286 = _2284.x;
    float _2288 = _2284.y;
    float _2290 = _2284.z;
    float _2292 = _2261;
    if (!_1797)
    {
        float3 _6527 = float3(_2235, _1997, float(as_type<int>(_2261)));
        float3 _6529 = select(_6527, float3(0.0), isnan(_6527));
        float _2294 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6529.xy, uint(rint(_6529.z)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6529.xy, uint(rint(_6529.z)), level(0.0)).x;
        _2292 = _2294;
    }
    float _2296 = _2292;
    float _2298 = abs(_1636);
    float _2300 = log2(_2298);
    float _2302 = _2147 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2304 = fma(_2149, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2302);
    float _2306 = fma(_1881, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2304);
    float _2308 = _2063 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2310 = fma(_2159, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2306);
    float _2312 = _2300 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2314 = _2310 + _2183;
    float _2316 = exp2(_2308);
    bool _2318 = _1636 <= 8000.0;
    bool _2320 = isnan(_1636);
    bool _2322 = _2318 || _2320;
    bool _2324 = isnan(8000.0);
    bool _2326 = _2322 || _2324;
    float _2328 = float(_2326);
    float _2330 = _2314 * 0.5;
    if (!_2165)
    {
        _2249 = 1.0;
    }
    float _2332 = _2249;
    float _2334 = exp2(_2312);
    out.m_79.z = _2330;
    out.m_79.w = _2183;
    float _2336 = fma(_2334, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2338 = precise::clamp(_2336, 0.0, 1.0);
    float _2340 = fma(_2338, -2.0, 3.0);
    float _2342 = _2338 * _2338;
    float _2344 = _2342 * _2340;
    float _2346 = -_2344;
    float _2348 = _2346 + 1.0;
    out.gl_Position.x = _2203;
    out.gl_Position.y = _2237;
    out.gl_Position.z = _2310;
    out.gl_Position.w = _2183;
    float _2350 = fma(_2348, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2344);
    float _2352 = -_2316;
    float _2354 = _2352 + 1.0;
    float _2356 = _2328 * _2350;
    float _2358 = _2356 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2360 = _2354 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2362 = _2203;
    float _2364 = _2332;
    float _2366 = _2354;
    float _2368 = _2360;
    if (_1797)
    {
        _2362 = 1.0;
    }
    float _2370 = _2362;
    float _2372 = -_2037;
    float _2374 = _2372 + 1.0;
    float _2376 = _2374 * _2358;
    float _2378 = precise::clamp(_2376, 0.0, 1.0);
    float _2380 = _2370;
    if (_2165)
    {
        bool _2382 = _2267 >= _2179;
        bool _2384 = isnan(_2267);
        bool _2386 = _2382 || _2384;
        bool _2388 = isnan(_2179);
        bool _2390 = _2386 || _2388;
        float _2392 = float(_2390);
        _2364 = _2392;
    }
    float _2394 = _2364;
    if (!_1797)
    {
        int _2396 = _1879 << 4;
        int _2398 = _2396 + 2048;
        uint _2400 = uint(int(uint(_2398) >> uint(2)));
        uint _2402 = uint(int(uint(int(_2400)) >> uint(2)));
        int _2404 = int(_2400) & 3;
        float _2406 = (*spvDescriptorSet0.vp_c15)._m0[int(_2402)][_2404];
        int _2408 = int(_2400) + 1;
        uint _2410 = uint(int(uint(_2408) >> uint(2)));
        int _2412 = _2408 & 3;
        float _2414 = (*spvDescriptorSet0.vp_c15)._m0[int(_2410)][_2412];
        int _2416 = _2398 + 8;
        uint _2418 = uint(int(uint(_2416) >> uint(2)));
        uint _2420 = uint(int(uint(int(_2418)) >> uint(2)));
        int _2422 = int(_2418) & 3;
        float _2424 = (*spvDescriptorSet0.vp_c15)._m0[int(_2420)][_2422];
        int _2426 = int(_2418) + 1;
        uint _2428 = uint(int(uint(_2426) >> uint(2)));
        int _2430 = _2426 & 3;
        float _2432 = (*spvDescriptorSet0.vp_c15)._m0[int(_2428)][_2430];
        float _2434 = _1562 * _2414;
        float _2436 = fma(_1508, _2406, _2434);
        float _2438 = fma(_1538, _2424, _2436);
        float _2440 = _2438 + _2432;
        float _2442 = precise::clamp(_2440, 0.0, 1.0);
        float _2444 = -_2442;
        float _2446 = _2444 + _2296;
        float _2448 = fma(_2446, 500.0, 1.5);
        float _2450 = exp2(_2448);
        float _2452 = 0.0 + _2450;
        float _2454 = precise::clamp(_2452, 0.0, 1.0);
        _2380 = _2454;
        _2366 = _2424;
        _2251 = _2450;
    }
    float _2456 = _2380;
    float _2458 = _2366;
    float _2460 = _2251;
    float _2462 = _2360 * _2269;
    float _2464 = _2394 * _2456;
    float _2466 = -_2378;
    float _2468 = fma(_2466, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2470 = -_2360;
    float _2472 = _2470 + 1.0;
    float _2474 = _2280 * _2462;
    float _2476 = _2290 * _2462;
    float _2478 = -_2464;
    float _2480 = fma(_2478, _2468, 1.0);
    float _2482 = precise::clamp(_2480, 0.0, 1.0);
    bool _2484 = _1698 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2486 = isnan(_1698);
    bool _2488 = _2484 || _2486;
    bool _2490 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2492 = _2488 || _2490;
    float _2494 = fma(_2286, _2474, _2274);
    float _2496 = fma(_2288, _2474, _2276);
    float _2498 = _2482 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2500 = _2280 * _2472;
    float _2502 = fma(_2280, _2476, _2278);
    out.m_81.x = _2498;
    out.m_83.x = _2494;
    out.m_83.y = _2496;
    out.m_83.z = _2502;
    out.m_83.w = _2500;
    float _2504 = _2458;
    float _2506 = _2472;
    float _2508 = _2460;
    float _2510 = _2482;
    if (!_2492)
    {
        _1672 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2512 = _1672;
    float _2514 = _2512;
    float _2516 = _2512;
    if (!_2492)
    {
        _2504 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2518 = _2504;
    float _2520 = _2518;
    float _2522 = _2518;
    if (!_2492)
    {
        _2368 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2524 = _2368;
    float _2526 = _2524;
    float _2528 = _2524;
    if (!_2492)
    {
        _2506 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2530 = _2506;
    float _2532 = _2530;
    float _2534 = _2530;
    if (!_2492)
    {
        _2508 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2536 = _2508;
    float _2538 = _2536;
    float _2540 = _2536;
    if (!_2492)
    {
        _2510 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2542 = _2510;
    bool _2544 = !_2492;
    float _2546 = _2542;
    float _2548 = _2542;
    if (!_2544)
    {
        bool _2550 = _1698 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2552 = isnan(_1698);
        bool _2554 = _2550 || _2552;
        bool _2556 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2558 = _2554 || _2556;
        if (!_2558)
        {
            float _2560 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2562 = _1698 + _2560;
            float _2564 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2566 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2564;
            float _2568 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2570 = _2568 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2572 = 1.0 / _2566;
            float _2574 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2576 = _2574 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2578 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2580 = _2578 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2582 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2584 = _2582 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2586 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2588 = _2586 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2590 = _2562 * _2572;
            float _2592 = precise::clamp(_2590, 0.0, 1.0);
            float _2594 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2596 = _2594 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2598 = fma(_2592, _2570, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2600 = fma(_2592, _2596, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2602 = fma(_2592, _2576, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2604 = fma(_2592, _2580, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2606 = fma(_2592, _2584, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2608 = fma(_2592, _2588, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2522 = _2602;
            _2540 = _2606;
            _2516 = _2598;
            _2534 = _2604;
            _2528 = _2600;
            _2548 = _2608;
            _2610 = true;
        }
        else
        {
            bool _2612 = _1698 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2614 = isnan(_1698);
            bool _2616 = _2612 || _2614;
            bool _2618 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2620 = _2616 || _2618;
            if (!_2620)
            {
                _2514 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2622 = _2514;
            _2516 = _2622;
            if (!_2620)
            {
                _2520 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2624 = _2520;
            _2522 = _2624;
            if (!_2620)
            {
                _2526 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2626 = _2526;
            _2528 = _2626;
            if (!_2620)
            {
                _2532 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2628 = _2532;
            _2534 = _2628;
            if (!_2620)
            {
                _2538 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2630 = _2538;
            _2540 = _2630;
            if (!_2620)
            {
                _2546 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2632 = _2546;
            bool _2634 = !_2620;
            _2548 = _2632;
            if (!_2634)
            {
                bool _2636 = _1698 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2638 = isnan(_1698);
                bool _2640 = _2636 || _2638;
                bool _2642 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2644 = _2640 || _2642;
                if (!_2644)
                {
                    float _2646 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2648 = _1698 + _2646;
                    float _2650 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2652 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2650;
                    float _2654 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2656 = _2654 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2658 = 1.0 / _2652;
                    float _2660 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2662 = _2660 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2664 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2666 = _2664 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2668 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2670 = _2668 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2672 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2674 = _2672 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2676 = _2648 * _2658;
                    float _2678 = precise::clamp(_2676, 0.0, 1.0);
                    float _2680 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2682 = _2680 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2684 = fma(_2678, _2656, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2686 = fma(_2678, _2682, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2688 = fma(_2678, _2662, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2690 = fma(_2678, _2666, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2692 = fma(_2678, _2670, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2694 = fma(_2678, _2674, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2522 = _2688;
                    _2540 = _2692;
                    _2516 = _2684;
                    _2534 = _2690;
                    _2528 = _2686;
                    _2548 = _2694;
                    _2610 = true;
                }
                else
                {
                    _2522 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2540 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2516 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2534 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2528 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2548 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2610 = false;
    float _2696 = _2522;
    float _2698 = _2540;
    float _2700 = _2516;
    float _2702 = _2534;
    float _2704 = _2528;
    float _2706 = _2548;
    float _2708 = fma(_1376, -0.5, 0.5);
    float _2710 = precise::clamp(_2708, 0.0, 1.0);
    float _2712 = -_2696;
    float _2714 = _2712 + _2698;
    float _2716 = -_2700;
    float _2718 = _2716 + _2702;
    float _2720 = -_2704;
    float _2722 = _2720 + _2706;
    bool _2724 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2726 = fma(_2710, _2714, _2696);
    float _2728 = fma(_2710, _2718, _2700);
    float _2730 = fma(_2710, _2722, _2704);
    float _2732 = _2726 * 0.586610972881317138671875;
    out.m_61.x = 1.0;
    float _2734 = fma(_2728, 0.298911988735198974609375, _2732);
    float _2736 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2738 = fma(_2730, 0.114477999508380889892578125, _2734);
    out.m_81.w = _2736;
    float _2740 = -_2738;
    float _2742 = _2728 + _2740;
    float _2744 = -_2738;
    float _2746 = _2726 + _2744;
    float _2748 = -_2738;
    float _2750 = _2730 + _2748;
    out.m_85.x = 0.0;
    float _2752 = fma(_2742, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2738);
    float _2754 = fma(_2746, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2738);
    float _2756 = fma(_2750, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2738);
    out.m_87.x = _2752;
    out.m_87.y = _2754;
    out.m_87.z = _2756;
    if (!_2724)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2758 = -_1512;
    float _2760 = _2758 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2762 = -_1516;
    float _2764 = _2762 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2766 = -_1520;
    float _2768 = _2766 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2770 = _2760 * _2760;
    float _2772 = fma(_2764, _2764, _2770);
    float _2774 = fma(_2768, _2768, _2772);
    float _2776 = sqrt(_2774);
    float _2778 = rsqrt(_2774);
    float _2780 = -_2776;
    float _2782 = _2780 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2784 = _2782 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2786 = precise::clamp(_2784, 0.0, 1.0);
    float _2788 = _2764 * _2778;
    float _2790 = _2760 * _2778;
    float _2792 = abs(_2786);
    float _2794 = log2(_2792);
    float _2796 = _2768 * _2778;
    float _2798 = _2788 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2800 = _1376 * _2790;
    float _2802 = -_2790;
    float _2804 = -_2798;
    float _2806 = fma(_2802, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2804);
    float _2808 = fma(_1374, _2788, _2800);
    float _2810 = -_2796;
    float _2812 = fma(_2810, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2806);
    float _2814 = fma(_1378, _2796, _2808);
    float _2816 = precise::clamp(_2814, 0.0, 1.0);
    float _2818 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2820 = _2812 + _2818;
    float _2822 = _2794 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2824 = _2820 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2826 = precise::clamp(_2824, 0.0, 1.0);
    float _2828 = exp2(_2822);
    float _2830 = _2828 * _2826;
    float _2832 = _2816 * _2830;
    float _2834 = _2832 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2836 = _2832 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2838 = _2832 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_85.x = _2834;
    out.m_85.y = _2836;
    out.m_85.z = _2838;
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
    bool _2610 = false;
    bool _1452 = false;
    bool _630 = false;
    bool _480 = false;
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
        float _2895 = as_type<float>(_122);
        out.gl_Position.z = _2895;
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
        float _2966 = as_type<float>(_162);
        out.gl_Position.z = _2966;
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
    float _412 = fma(_390, (*spvDescriptorSet0.vp_c10)._m0[4].z, _402);
    float _414 = sqrt(_400);
    float _416 = fma(_390, (*spvDescriptorSet0.vp_c10)._m0[5].z, _398);
    float _418 = fma(_390, (*spvDescriptorSet0.vp_c10)._m0[6].z, _410);
    bool _420 = _414 >= 9.9999999747524270787835121154785e-07;
    bool _422 = isnan(_414);
    bool _424 = _420 || _422;
    bool _426 = isnan(9.9999999747524270787835121154785e-07);
    bool _428 = _424 || _426;
    float _430 = fma(_362, _384, _404);
    float _432 = fma(_356, _384, _406);
    float _434 = fma(_380, _384, _408);
    float _436 = _416;
    float _438 = _412;
    float _440 = _418;
    if (!_428)
    {
        bool _442 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _444 = !_442;
        if (!_444)
        {
            float _446 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _448 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _450 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _452 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _446);
            float _454 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _448);
            float _456 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _450);
            float _458 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _452);
            float _460 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _454);
            float _462 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _456);
            float _464 = _458 * _458;
            float _466 = fma(_460, _460, _464);
            float _468 = fma(_462, _462, _466);
            float _470 = rsqrt(_468);
            float _472 = _470 * 9.9999999747524270787835121154785e-07;
            float _474 = _460 * _472;
            float _476 = _458 * _472;
            float _478 = _462 * _472;
            _436 = _476;
            _438 = _474;
            _440 = _478;
            _480 = true;
        }
        else
        {
            float _482 = _168 * _168;
            float _484 = fma(_166, _166, _482);
            float _486 = fma(_170, _170, _484);
            float _488 = sqrt(_486);
            bool _490 = _488 >= 9.9999999747524270787835121154785e-07;
            bool _492 = isnan(_488);
            bool _494 = _490 || _492;
            bool _496 = isnan(9.9999999747524270787835121154785e-07);
            bool _498 = _494 || _496;
            if (!_498)
            {
                float _500 = _406 * _406;
                float _502 = fma(_404, _404, _500);
                float _504 = fma(_408, _408, _502);
                float _506 = sqrt(_504);
                bool _508 = _506 >= 9.9999999747524270787835121154785e-07;
                bool _510 = isnan(_506);
                bool _512 = _508 || _510;
                bool _514 = isnan(9.9999999747524270787835121154785e-07);
                bool _516 = _512 || _514;
                if (!_516)
                {
                    float _518 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _520 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _518);
                    float _522 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _520);
                    float _524 = rsqrt(_522);
                    float _526 = _524 * 9.9999999747524270787835121154785e-07;
                    float _528 = _526 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _530 = _526 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _532 = _526 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _436 = _530;
                    _438 = _528;
                    _440 = _532;
                    _480 = true;
                }
                else
                {
                    float _534 = _406 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _536 = _406 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _538 = _406 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _540 = fma(_404, (*spvDescriptorSet0.vp_c10)._m0[5].x, _534);
                    float _542 = fma(_404, (*spvDescriptorSet0.vp_c10)._m0[4].x, _536);
                    float _544 = fma(_404, (*spvDescriptorSet0.vp_c10)._m0[6].x, _538);
                    float _546 = fma(_408, (*spvDescriptorSet0.vp_c10)._m0[5].z, _540);
                    float _548 = fma(_408, (*spvDescriptorSet0.vp_c10)._m0[4].z, _542);
                    float _550 = fma(_408, (*spvDescriptorSet0.vp_c10)._m0[6].z, _544);
                    float _552 = _546 * _546;
                    float _554 = fma(_548, _548, _552);
                    float _556 = fma(_550, _550, _554);
                    float _558 = rsqrt(_556);
                    float _560 = _558 * 9.9999999747524270787835121154785e-07;
                    float _562 = _548 * _560;
                    float _564 = _546 * _560;
                    float _566 = _550 * _560;
                    _436 = _564;
                    _438 = _562;
                    _440 = _566;
                    _480 = true;
                }
            }
            else
            {
                float _568 = _168 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _570 = _168 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _572 = _168 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _574 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[5].x, _568);
                float _576 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[4].x, _570);
                float _578 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[6].x, _572);
                float _580 = fma(_170, (*spvDescriptorSet0.vp_c10)._m0[5].z, _574);
                float _582 = fma(_170, (*spvDescriptorSet0.vp_c10)._m0[4].z, _576);
                float _584 = fma(_170, (*spvDescriptorSet0.vp_c10)._m0[6].z, _578);
                float _586 = _580 * _580;
                float _588 = fma(_582, _582, _586);
                float _590 = fma(_584, _584, _588);
                float _592 = rsqrt(_590);
                float _594 = _592 * 9.9999999747524270787835121154785e-07;
                float _596 = _582 * _594;
                float _598 = _580 * _594;
                float _600 = _584 * _594;
                _436 = _598;
                _438 = _596;
                _440 = _600;
            }
        }
    }
    _480 = false;
    float _602 = _436;
    float _604 = _438;
    float _606 = _440;
    bool _608 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _610 = !_608;
    float _628;
    if (!_610)
    {
        float _612 = in.m_67.x;
        float _614 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _616 = _612 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _618 = fma(_616, (*spvDescriptorSet0.vp_c9)._m0[12].x, _140);
        float _620 = _618 * _614;
        float _622 = floor(_620);
        float _624 = -_622;
        float _626 = _620 + _624;
        _628 = _626;
        _630 = true;
    }
    else
    {
        float _632 = float(_106);
        float _634 = 1.0 / _632;
        float _636 = _140 * _634;
        _628 = _636;
    }
    _630 = false;
    float _638 = _628;
    float _640 = _432 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _642 = _432 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _644 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _646 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _644;
    float _648 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _650 = _648 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _652 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _654 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _652;
    float _656 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _658 = _656 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _660 = 1.0 / _646;
    float _662 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _664 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _662;
    float _666 = _432 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _668 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _670 = _638 + _668;
    float _672 = fma(_430, (*spvDescriptorSet0.vp_c10)._m0[4].x, _640);
    float _674 = fma(_430, (*spvDescriptorSet0.vp_c10)._m0[5].x, _642);
    float _676 = fma(_430, (*spvDescriptorSet0.vp_c10)._m0[6].x, _666);
    float _678 = 1.0 / _650;
    float _680 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _682 = _638 + _680;
    float _684 = fma(_434, (*spvDescriptorSet0.vp_c10)._m0[4].z, _672);
    float _686 = fma(_434, (*spvDescriptorSet0.vp_c10)._m0[5].z, _674);
    float _688 = fma(_434, (*spvDescriptorSet0.vp_c10)._m0[6].z, _676);
    bool _690 = _638 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _692 = isnan(_638);
    bool _694 = _690 || _692;
    bool _696 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _698 = _694 || _696;
    float _700 = float(_698);
    bool _702 = _638 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _704 = isnan(_638);
    bool _706 = _702 || _704;
    bool _708 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _710 = _706 || _708;
    float _712 = float(_710);
    float _714 = 1.0 / _658;
    float _716 = _682 * _660;
    float _718 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _720 = _638 + _718;
    float _722 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _724 = _638 + _722;
    float _726 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _728 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _726;
    float _730 = _686 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _732 = 1.0 / _654;
    float _734 = _720 * _678;
    float _736 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _738 = _638 + _736;
    float _740 = fma(_728, _716, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _742 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _744 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _742;
    float _746 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _748 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _746;
    float _750 = 1.0 / _664;
    float _752 = _670 * _714;
    float _754 = _688 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _756 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _758 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _756;
    float _760 = _724 * _732;
    bool _762 = _638 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _764 = isnan(_638);
    bool _766 = _762 || _764;
    bool _768 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _770 = _766 || _768;
    float _772 = float(_770);
    float _774 = fma(_748, _716, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _776 = fma(_758, _716, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _778 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _780 = _778 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _782 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _784 = _782 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _786 = -_772;
    float _788 = _786 + 1.0;
    float _790 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _792 = _790 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _794 = _738 * _750;
    bool _796 = _638 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _798 = isnan(_638);
    bool _800 = _796 || _798;
    bool _802 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _804 = _800 || _802;
    float _806 = float(_804);
    float _808 = _700 * _788;
    float _810 = -_700;
    float _812 = _810 + 1.0;
    float _814 = fma(_784, _734, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _816 = fma(_792, _734, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _818 = fma(_744, _760, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _820 = _806 * _812;
    float _822 = -_806;
    float _824 = _822 + 1.0;
    float _826 = fma(_780, _734, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _828 = _638 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _830 = isnan(_638);
    bool _832 = _828 || _830;
    bool _834 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _836 = _832 || _834;
    float _838 = float(_836);
    float _840 = _602 * _602;
    float _842 = _712 * _824;
    float _844 = -_712;
    float _846 = _844 + 1.0;
    bool _848 = _638 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _850 = isnan(_638);
    bool _852 = _848 || _850;
    bool _854 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _856 = _852 || _854;
    float _858 = float(_856);
    float _860 = -_838;
    float _862 = _860 + 1.0;
    float _864 = fma(_604, _604, _840);
    float _866 = _838 * _846;
    float _868 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _870 = _868 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _872 = _858 * _862;
    float _874 = fma(_606, _606, _864);
    float _876 = -_858;
    float _878 = _876 + 1.0;
    float _880 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _882 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _880;
    float _884 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _886 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _884;
    float _888 = _774 * _872;
    float _890 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _892 = _890 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _894 = rsqrt(_874);
    float _896 = fma(_882, _760, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _898 = fma(_886, _760, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _900 = fma(_878, (*spvDescriptorSet0.vp_c9)._m0[143].x, _888);
    float _902 = fma(_870, _752, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _904 = fma(_892, _752, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _906 = fma(_826, _866, _900);
    float _908 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _910 = _908 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _912 = _740 * _872;
    float _914 = fma(_896, _842, _906);
    float _916 = fma(_910, _752, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _918 = fma(_878, (*spvDescriptorSet0.vp_c9)._m0[143].z, _912);
    float _920 = fma(_902, _820, _914);
    float _922 = _894 * _604;
    float _924 = in.m_65.x;
    float _926 = in.m_65.y;
    float _928 = in.m_65.z;
    float _930 = _684 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _932 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _934 = _730 + _932;
    float _936 = _894 * _602;
    float _938 = _894 * _606;
    float _940 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _942 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _940;
    float _944 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _946 = _930 + _944;
    float _948 = _934 * _934;
    float _950 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _952 = _754 + _950;
    float _954 = fma(_942, _794, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _956 = _936 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _958 = fma(_946, _946, _948);
    float _960 = _776 * _872;
    float _962 = fma(_954, _808, _920);
    float _964 = fma(_922, (*spvDescriptorSet0.vp_c10)._m0[8].y, _956);
    float _966 = fma(_952, _952, _958);
    float _968 = fma(_878, (*spvDescriptorSet0.vp_c9)._m0[143].y, _960);
    float _970 = fma(_772, (*spvDescriptorSet0.vp_c9)._m0[148].x, _962);
    float _972 = fma(_938, (*spvDescriptorSet0.vp_c10)._m0[10].y, _964);
    float _974 = fma(_814, _866, _968);
    float _976 = rsqrt(_966);
    float _978 = fma(_816, _866, _918);
    float _980 = abs(_972);
    bool _982 = _980 > 0.99989998340606689453125;
    float _984 = _970 * _924;
    float _986 = fma(_818, _842, _974);
    float _988 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _990 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _988;
    float _992 = _984 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _994 = fma(_898, _842, _978);
    float _996 = fma(_990, _794, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _998 = fma(_904, _820, _986);
    float _1000 = _992 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _1002 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _1004 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _1002;
    float _1006 = fma(_916, _820, _994);
    float _1008 = _818;
    float _1010 = _816;
    float _1012 = _842;
    float _1014 = _990;
    if (_982)
    {
        _1008 = 0.001000000047497451305389404296875;
    }
    float _1016 = _1008;
    float _1018 = _1000 * _976;
    if (!_982)
    {
        _1010 = (*spvDescriptorSet0.vp_c10)._m0[8].y;
    }
    float _1020 = _1010;
    float _1022 = fma(_1004, _794, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _1024 = _1020;
    if (!_982)
    {
        _1012 = (*spvDescriptorSet0.vp_c10)._m0[10].y;
    }
    float _1026 = _1012;
    float _1028 = _934 * _1018;
    float _1030 = _1026;
    if (_982)
    {
        float _1032 = fma(_1016, (*spvDescriptorSet0.vp_c10)._m0[8].z, (*spvDescriptorSet0.vp_c10)._m0[8].y);
        _1024 = _1032;
    }
    float _1034 = _1024;
    float _1036 = _946 * _1018;
    float _1038 = -_1028;
    float _1040 = _934 + _1038;
    if (!_982)
    {
        _1014 = (*spvDescriptorSet0.vp_c10)._m0[9].y;
    }
    float _1042 = _1014;
    float _1044 = -_1036;
    float _1046 = _946 + _1044;
    float _1048 = _952 * _1018;
    float _1050 = _1040 * _1040;
    float _1052 = _1042;
    float _1054 = _1048;
    if (_982)
    {
        float _1056 = fma(_1016, (*spvDescriptorSet0.vp_c10)._m0[10].z, (*spvDescriptorSet0.vp_c10)._m0[10].y);
        _1030 = _1056;
    }
    float _1058 = _1030;
    float _1060 = -_1034;
    float _1062 = _938 * _1060;
    if (_982)
    {
        float _1064 = fma(_1016, (*spvDescriptorSet0.vp_c10)._m0[9].z, (*spvDescriptorSet0.vp_c10)._m0[9].y);
        _1052 = _1064;
    }
    float _1066 = _1052;
    float _1068 = fma(_1046, _1046, _1050);
    float _1070 = -_1058;
    float _1072 = _936 * _1070;
    float _1074 = -_1058;
    float _1076 = -_1062;
    float _1078 = fma(_922, _1074, _1076);
    float _1080 = -_1048;
    float _1082 = _952 + _1080;
    float _1084 = fma(_996, _808, _998);
    float _1086 = -_1066;
    float _1088 = -_1072;
    float _1090 = fma(_938, _1086, _1088);
    float _1092 = -_1066;
    float _1094 = _922 * _1092;
    float _1096 = _1078 * _1078;
    float _1098 = fma(_1082, _1082, _1068);
    float _1100 = fma(_1022, _808, _1006);
    float _1102 = in.m_69.x;
    float _1104 = in.m_69.y;
    float _1106 = in.m_69.z;
    float _1108 = -_1034;
    float _1110 = -_1094;
    float _1112 = fma(_936, _1108, _1110);
    float _1114 = fma(_1090, _1090, _1096);
    float _1116 = sqrt(_1098);
    float _1118 = fma(_772, (*spvDescriptorSet0.vp_c9)._m0[148].y, _1084);
    float _1120 = fma(_772, (*spvDescriptorSet0.vp_c9)._m0[148].z, _1100);
    float _1122 = fma(_1112, _1112, _1114);
    float _1124 = _1118 * _926;
    float _1126 = _1120 * _928;
    float _1128 = rsqrt(_1122);
    float _1130 = _1124 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1132 = _1126 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1134 = _976 * _1116;
    float _1136 = _1130 * _1134;
    float _1138 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1104);
    float _1140 = _992 * _1134;
    float _1142 = _1132 * _1134;
    float _1144 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1102);
    float _1146 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1106);
    float _1148 = _1090 * _1128;
    float _1150 = _1078 * _1128;
    float _1152 = _1112 * _1128;
    float _1154 = _1136 * _1138;
    float _1156 = _1140 * _1144;
    float _1158 = _1142 * _1146;
    float _1160 = _922 * _1150;
    float _1162 = _936 * _1152;
    float _1164 = _1154 * _922;
    float _1166 = _1154 * _938;
    float _1168 = -_1160;
    float _1170 = fma(_936, _1148, _1168);
    float _1172 = -_1162;
    float _1174 = fma(_938, _1150, _1172);
    float _1176 = fma(_1156, _1148, _1164);
    float _1178 = fma(_1156, _1152, _1166);
    bool _1180 = _1104 != 0.0;
    bool _1182 = isnan(_1104);
    bool _1184 = _1180 || _1182;
    bool _1186 = isnan(0.0);
    bool _1188 = _1184 || _1186;
    float _1190 = _938 * _1148;
    float _1192 = fma(_1158, _1174, _1176);
    float _1194 = fma(_1158, _1170, _1178);
    bool _1196 = _1102 == 0.0;
    bool _1198 = !_1188;
    bool _1200 = _1196 && _1198;
    float _1202 = _1154 * _936;
    float _1204 = _930 + _1192;
    float _1206 = _754 + _1194;
    bool _1208 = _1106 == 0.0;
    bool _1210 = _1208 && _1200;
    float _1212 = in.m_71.x;
    float _1214 = in.m_71.y;
    float _1216 = in.m_71.z;
    float _1218 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1220 = _1204 + _1218;
    float _1222 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1224 = _1206 + _1222;
    float _1226 = fma(_1156, _1150, _1202);
    float _1228 = -_1190;
    float _1230 = fma(_922, _1152, _1228);
    float _1232 = _1220 * _1220;
    float _1234 = _1224 * _1224;
    float _1236 = fma(_1158, _1230, _1226);
    float _1238 = _1232 + _1234;
    float _1240 = _730 + _1236;
    float _1242 = sqrt(_1238);
    float _1244 = _1212;
    float _1246 = _1214;
    float _1248 = _1216;
    float _1250 = _1158;
    float _1252 = _1104;
    float _1254 = _1102;
    float _1256 = _1156;
    float _1258 = _1204;
    if (!_1210)
    {
        float _1260 = fma(_1102, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1212);
        _1244 = _1260;
    }
    float _1262 = _1244;
    if (!_1210)
    {
        float _1264 = fma(_1104, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1214);
        _1246 = _1264;
    }
    float _1266 = _1246;
    if (!_1210)
    {
        float _1268 = fma(_1106, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1216);
        _1248 = _1268;
    }
    float _1270 = _1248;
    bool _1272 = _1242 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    if (!_1272)
    {
        _1250 = _1204;
    }
    float _1274 = _1250;
    float _1276 = _1274;
    if (!_1272)
    {
        _1252 = _1234;
    }
    float _1278 = _1252;
    float _1280 = _1278;
    if (!_1272)
    {
        _1254 = _1232;
    }
    float _1282 = _1254;
    float _1284 = _1282;
    if (!_1272)
    {
        _1256 = _1206;
    }
    float _1286 = _1256;
    float _1288 = _1286;
    if (!_1272)
    {
        _1258 = _1240;
    }
    float _1290 = _1258;
    bool _1292 = !_1272;
    float _1294 = _1290;
    if (!_1292)
    {
        float _1296 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1298 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1300 = _1242 + _1298;
        float _1302 = rsqrt(_1238);
        float _1304 = _1300 * _1296;
        float _1306 = _1240 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1308 = _1304 * 0.15915493667125701904296875;
        float _1310 = _1308 * 6.283185482025146484375;
        float _1312 = sin(_1310);
        float _1314 = _1308 * 6.283185482025146484375;
        float _1316 = cos(_1314);
        float _1318 = fma(_1312, _1306, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1320 = _1302 * _1318;
        float _1322 = _1316 + (-1.0);
        float _1324 = fma(_1220, _1320, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1326 = fma(_1224, _1320, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1328 = _1322 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1330 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1332 = _1324 + _1330;
        float _1334 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1336 = _1326 + _1334;
        float _1338 = fma(_1240, _1316, _1328);
        float _1340 = _1332 * _1332;
        float _1342 = _1336 * _1336;
        _1294 = _1338;
        _1284 = _1340;
        _1280 = _1342;
        _1276 = _1324;
        _1288 = _1326;
    }
    float _1344 = _1294;
    float _1346 = _1284;
    float _1348 = _1280;
    float _1350 = _1276;
    float _1352 = _1288;
    float _1354 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1356 = _1344 + _1354;
    float _1358 = _922 * _1266;
    float _1360 = _936 * _1266;
    float _1362 = _938 * _1266;
    float _1364 = fma(_1356, _1356, _1346);
    float _1366 = fma(_1148, _1262, _1358);
    float _1368 = fma(_1150, _1262, _1360);
    float _1370 = fma(_1152, _1262, _1362);
    float _1372 = _1364 + _1348;
    float _1374 = fma(_1174, _1270, _1366);
    float _1376 = fma(_1230, _1270, _1368);
    float _1378 = fma(_1170, _1270, _1370);
    float _1380 = sqrt(_1372);
    float _1382 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1384 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1386 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1388 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1390 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1392 = _1382 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1394 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1396 = _1384 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1398 = _1386 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1400 = _1388 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1402 = _1390 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1404 = _1394 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_73.x = _1374;
    out.m_73.y = _1376;
    out.m_73.z = _1378;
    bool _1406 = _1380 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1408 = isnan(_1380);
    bool _1410 = _1406 || _1408;
    bool _1412 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1414 = _1410 || _1412;
    out.m_75.x = _1392;
    out.m_75.y = _1396;
    out.m_75.z = _1398;
    out.m_77.x = _1400;
    out.m_77.y = _1402;
    out.m_77.z = _1404;
    float _1416 = _1368;
    if (!_1414)
    {
        _1416 = 1.0;
    }
    float _1418 = _1416;
    bool _1420 = !_1414;
    float _1422 = _1418;
    if (!_1420)
    {
        bool _1424 = _1380 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1426 = isnan(_1380);
        bool _1428 = _1424 || _1426;
        bool _1430 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1432 = _1428 || _1430;
        if (!_1432)
        {
            float _1434 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1436 = _1380 + _1434;
            float _1438 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1440 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1438;
            float _1442 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1444 = _1442 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1446 = 1.0 / _1440;
            float _1448 = _1436 * _1446;
            float _1450 = fma(_1448, _1444, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1422 = _1450;
            _1452 = true;
        }
        else
        {
            bool _1454 = _1380 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1456 = isnan(_1380);
            bool _1458 = _1454 || _1456;
            bool _1460 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1462 = _1458 || _1460;
            if (!_1462)
            {
                float _1464 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1466 = _1380 + _1464;
                float _1468 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1470 = _1468 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1472 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1474 = _1472 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1476 = 1.0 / _1470;
                float _1478 = _1466 * _1476;
                float _1480 = fma(_1478, _1474, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1422 = _1480;
                _1452 = true;
            }
            else
            {
                _1422 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1452 = false;
    float _1482 = _1422;
    float _1484 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1486 = _1344 + _1484;
    float _1488 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1490 = _1350 + _1488;
    float _1492 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1494 = _1352 + _1492;
    float _1496 = -_1028;
    float _1498 = _730 + _1496;
    float _1500 = fma(_1486, _1482, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1502 = fma(_1490, _1482, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1504 = fma(_1494, _1482, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1506 = -_1036;
    float _1508 = _930 + _1506;
    float _1510 = -_1028;
    float _1512 = _1510 + _1500;
    float _1514 = -_1036;
    float _1516 = _1514 + _1502;
    float _1518 = -_1048;
    float _1520 = _1518 + _1504;
    float _1522 = _1498 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1524 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1526 = _1512 + _1524;
    float _1528 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1530 = _1516 + _1528;
    float _1532 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1534 = _1520 + _1532;
    float _1536 = -_1048;
    float _1538 = _754 + _1536;
    float _1540 = _1526 * _1526;
    float _1542 = fma(_1508, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1522);
    float _1544 = _1512 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1546 = fma(_1530, _1530, _1540);
    float _1548 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1542);
    float _1550 = fma(_1534, _1534, _1546);
    float _1552 = _1548 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1554 = _1498 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1556 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _1558 = rsqrt(_1550);
    float _1560 = fma(_1508, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1554);
    float _1562 = _1498 + _1556;
    float _1564 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1560);
    float _1566 = _1562 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1568 = 1.0 / _1552;
    float _1570 = fma(_1538, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1572 = _1564 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1574 = fma(_1508, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1566);
    float _1576 = _1572 + _1552;
    float _1578 = fma(_1538, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1574);
    float _1580 = _1558 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1582 = floor(_1570);
    float _1584 = _1578 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1586 = _1530 * _1580;
    float _1588 = _1534 * _1580;
    float _1590 = _1562 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1592 = _1586 * _1586;
    float _1594 = _1588 * _1588;
    float _1596 = _1576 * _1568;
    float _1598 = _1596 * 0.5;
    float _1600 = fma(_1508, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1590);
    float _1602 = trunc(_1584);
    int _1604 = int(_1602);
    float _1606 = _1592 + _1594;
    float _1608 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1610 = fma(_1598, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1608);
    float _1612 = fma(_1538, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1600);
    float _1614 = _1612 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1616 = sqrt(_1606);
    float _1618 = fma(_1508, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1620 = 1.0 / _1610;
    int _1622 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1624 = _1604 + _1622;
    int _1626 = _1624 + 1;
    bool _1628 = _1616 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1630 = trunc(_1614);
    int _1632 = int(_1630);
    float _1634 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1636 = _1620 * _1634;
    float _1638 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1640 = _1616 + _1638;
    float _1642 = floor(_1618);
    bool _1644 = _1636 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1646 = _1636 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    int _1648 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1650 = _1632 + _1648;
    int _1652 = _1650 + 1;
    float _1654 = _1552;
    int _1656 = 2;
    float _1658 = _1640;
    float _1660 = _1526;
    float _1662 = _1544;
    int _1664 = _1652;
    float _1666 = _1586;
    int _1668 = as_type<int>(_1582);
    float _1670 = _1592;
    float _1672 = _1508;
    if (_1628)
    {
        float _1674 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1654 = _1674;
    }
    float _1676 = _1654;
    if (!_1644)
    {
        _1656 = 1;
    }
    int _1678 = _1656;
    float _1680 = -_1642;
    float _1682 = _1618 + _1680;
    float _1684 = 0.0;
    int _1686 = _1678;
    if (_1628)
    {
        float _1688 = rsqrt(_1606);
        _1684 = _1688;
    }
    float _1690 = _1684;
    float _1692 = _1690;
    if (_1628)
    {
        float _1694 = _1640 * _1676;
        _1658 = _1694;
    }
    float _1696 = _1658;
    float _1698 = sqrt(_1550);
    if (_1628)
    {
        float _1700 = _1696 * 0.15915493667125701904296875;
        _1054 = _1700;
    }
    float _1702 = _1054;
    bool _1704 = !_1644;
    int _1706 = _1704 ? 0 : 1;
    float _1708 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    if (!_1646)
    {
        _1686 = _1706;
    }
    int _1710 = _1686;
    float _1712 = _1578;
    if (_1628)
    {
        float _1714 = _1702 * 6.283185482025146484375;
        float _1716 = cos(_1714);
        _1712 = _1716;
    }
    float _1718 = _1712;
    float _1720 = precise::max(0.0, _1708);
    int _1722 = _1710 << 6;
    bool _1724 = _1652 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1726 = -_1580;
    float _1728 = -_1720;
    float _1730 = fma(_1526, _1726, _1728);
    int _1732 = _1722 + 48;
    uint _1735 = uint(int(uint(_1732) >> uint(2)));
    uint _1737 = uint(int(uint(int(_1735)) >> uint(2)));
    int _1739 = int(_1735) & 3;
    float _1741 = (*spvDescriptorSet0.vp_c15)._m0[int(_1737)][_1739];
    int _1743 = int(_1735) + 1;
    uint _1745 = uint(int(uint(_1743) >> uint(2)));
    int _1747 = _1743 & 3;
    float _1749 = (*spvDescriptorSet0.vp_c15)._m0[int(_1745)][_1747];
    float _1751 = _1616;
    float _1753 = _1730;
    if (_1628)
    {
        float _1755 = _1702 * 6.283185482025146484375;
        float _1757 = sin(_1755);
        _1751 = _1757;
    }
    float _1759 = _1751;
    int _1761 = _1652 | _1626;
    if (_1628)
    {
        float _1763 = _1730 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1660 = _1763;
    }
    float _1765 = _1660;
    bool _1767 = _1761 < 0;
    bool _1769 = _1767 || _1724;
    int _1771 = _1722 + 64;
    uint _1773 = uint(int(uint(_1771) >> uint(2)));
    uint _1775 = uint(int(uint(int(_1773)) >> uint(2)));
    int _1777 = int(_1773) & 3;
    float _1779 = (*spvDescriptorSet0.vp_c15)._m0[int(_1775)][_1777];
    int _1781 = int(_1773) + 1;
    uint _1783 = uint(int(uint(_1781) >> uint(2)));
    int _1785 = _1781 & 3;
    float _1787 = (*spvDescriptorSet0.vp_c15)._m0[int(_1783)][_1785];
    float _1789 = 0.0;
    if (_1628)
    {
        float _1791 = _1718 + (-1.0);
        _1789 = _1791;
    }
    float _1793 = _1789;
    bool _1795 = _1626 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1797 = _1795 || _1769;
    float _1799 = 0.0;
    if (_1628)
    {
        float _1801 = _1793 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1799 = _1801;
    }
    float _1803 = _1799;
    float _1805 = fma(_1516, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1544);
    if (!_1628)
    {
        _1662 = _1588;
    }
    float _1807 = _1662;
    int _1809 = _1722 + 96;
    uint _1811 = uint(int(uint(_1809) >> uint(2)));
    uint _1813 = uint(int(uint(int(_1811)) >> uint(2)));
    int _1815 = int(_1811) & 3;
    float _1817 = (*spvDescriptorSet0.vp_c15)._m0[int(_1813)][_1815];
    int _1819 = int(_1811) + 1;
    uint _1821 = uint(int(uint(_1819) >> uint(2)));
    int _1823 = _1819 & 3;
    float _1825 = (*spvDescriptorSet0.vp_c15)._m0[int(_1821)][_1823];
    float _1827 = 0.0;
    float _1829 = _1807;
    if (_1628)
    {
        float _1831 = fma(_1759, _1765, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1827 = _1831;
    }
    float _1833 = _1827;
    if (_1628)
    {
        float _1835 = fma(_1730, _1718, _1803);
        _1753 = _1835;
    }
    float _1837 = _1753;
    float _1839 = fma(_1520, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1805);
    float _1841 = _1839;
    if (_1628)
    {
        float _1843 = _1690 * _1833;
        _1692 = _1843;
    }
    float _1845 = _1692;
    float _1847 = _1803;
    if (!_1797)
    {
        float _1849 = floor(_1584);
        _1847 = _1849;
    }
    float _1851 = _1847;
    int _1853 = _1722 + 80;
    uint _1855 = uint(int(uint(_1853) >> uint(2)));
    uint _1857 = uint(int(uint(int(_1855)) >> uint(2)));
    int _1859 = int(_1855) & 3;
    float _1861 = (*spvDescriptorSet0.vp_c15)._m0[int(_1857)][_1859];
    int _1863 = int(_1855) + 1;
    uint _1865 = uint(int(uint(_1863) >> uint(2)));
    int _1867 = _1863 & 3;
    float _1869 = (*spvDescriptorSet0.vp_c15)._m0[int(_1865)][_1867];
    if (_1628)
    {
        float _1871 = _1588 * _1845;
        _1829 = _1871;
    }
    float _1873 = _1829;
    if (!_1797)
    {
        int _1875 = _1626 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1877 = _1875 + _1652;
        _1664 = _1877;
    }
    int _1879 = _1664;
    float _1881 = _1839 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    if (_1628)
    {
        float _1883 = _1586 * _1845;
        _1666 = _1883;
    }
    float _1885 = _1666;
    if (!_1628)
    {
        _1841 = _1594;
    }
    float _1887 = _1841;
    float _1889 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1891 = _1881 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    int _1893 = _1722 + 104;
    uint _1895 = uint(int(uint(_1893) >> uint(2)));
    uint _1897 = uint(int(uint(int(_1895)) >> uint(2)));
    int _1899 = int(_1895) & 3;
    float _1901 = (*spvDescriptorSet0.vp_c15)._m0[int(_1897)][_1899];
    int _1903 = int(_1895) + 1;
    uint _1905 = uint(int(uint(_1903) >> uint(2)));
    int _1907 = _1903 & 3;
    float _1909 = (*spvDescriptorSet0.vp_c15)._m0[int(_1905)][_1907];
    float _1911 = -_1582;
    float _1913 = _1570 + _1911;
    float _1915 = _1887;
    int _1917 = as_type<int>(_1891);
    if (!_1797)
    {
        int _1919 = _1879 << 2;
        _1668 = _1919;
    }
    int _1921 = _1668;
    float _1923 = -_1891;
    float _1925 = fma(_1923, _1889, 1.0);
    if (_1628)
    {
        float _1927 = _1885 * _1885;
        _1670 = _1927;
    }
    float _1929 = _1670;
    int _1931 = as_type<int>(_1929);
    if (_1628)
    {
        float _1933 = _1873 * _1873;
        _1915 = _1933;
    }
    float _1935 = _1915;
    if (!_1797)
    {
        int _1937 = 12 & _1921;
        _1917 = _1937;
    }
    int _1939 = _1917;
    int _1941 = _1722 + 56;
    uint _1943 = uint(int(uint(_1941) >> uint(2)));
    uint _1945 = uint(int(uint(int(_1943)) >> uint(2)));
    int _1947 = int(_1943) & 3;
    float _1949 = (*spvDescriptorSet0.vp_c15)._m0[int(_1945)][_1947];
    int _1951 = int(_1943) + 1;
    uint _1953 = uint(int(uint(_1951) >> uint(2)));
    int _1955 = _1951 & 3;
    float _1957 = (*spvDescriptorSet0.vp_c15)._m0[int(_1953)][_1955];
    float _1959 = fma(_1837, _1837, _1929);
    if (!_1797)
    {
        uint _1961 = uint(int(uint(_1879) >> uint(2)));
        _1931 = int(_1961);
    }
    int _1963 = _1931;
    float _1965 = log2(_1925);
    float _1967 = _1959 + _1935;
    int _1969 = _1722 + 72;
    uint _1971 = uint(int(uint(_1969) >> uint(2)));
    uint _1973 = uint(int(uint(int(_1971)) >> uint(2)));
    int _1975 = int(_1971) & 3;
    float _1977 = (*spvDescriptorSet0.vp_c15)._m0[int(_1973)][_1975];
    int _1979 = int(_1971) + 1;
    uint _1981 = uint(int(uint(_1979) >> uint(2)));
    int _1983 = _1979 & 3;
    float _1985 = (*spvDescriptorSet0.vp_c15)._m0[int(_1981)][_1983];
    float _1987 = _1562 * _1749;
    float _1989 = _1749;
    int _1991 = _1963;
    if (!_1797)
    {
        float _1993 = -_1851;
        float _1995 = _1584 + _1993;
        _1989 = _1995;
    }
    float _1997 = _1989;
    float _1999 = rsqrt(_1967);
    if (!_1797)
    {
        int _2001 = _1963 << 4;
        int _2003 = _2001 + _1939;
        _1991 = _2003;
    }
    int _2005 = _1991;
    float _2007 = fma(_1508, _1741, _1987);
    float _2009 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2011 = fma(_1698, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2009);
    float _2013 = precise::clamp(_2011, 0.0, 1.0);
    int _2015 = _1722 + 88;
    uint _2017 = uint(int(uint(_2015) >> uint(2)));
    uint _2019 = uint(int(uint(int(_2017)) >> uint(2)));
    int _2021 = int(_2017) & 3;
    float _2023 = (*spvDescriptorSet0.vp_c15)._m0[int(_2019)][_2021];
    int _2025 = int(_2017) + 1;
    uint _2027 = uint(int(uint(_2025) >> uint(2)));
    int _2029 = _2025 & 3;
    float _2031 = (*spvDescriptorSet0.vp_c15)._m0[int(_2027)][_2029];
    float _2033 = _1562 * _1787;
    float _2035 = _1965 * 0.693147182464599609375;
    float2 _6081 = float2(_1682, _1913);
    float _2037 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6081, float2(0.0), isnan(_6081)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6081, float2(0.0), isnan(_6081)), level(0.0)).x;
    float _2039 = _2035 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2041 = _1562 * _1825;
    float _2043 = _1999 * _1885;
    float _2045 = fma(_1508, _1817, _2041);
    float _2047 = -_2013;
    float _2049 = _2047 + 1.0;
    float _2051 = _1999 * _1837;
    float _2053 = _2043 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2055 = _1562 * _1869;
    float _2057 = fma(_1508, _1779, _2033);
    float _2059 = _1999 * _1873;
    float _2061 = abs(_2049);
    float _2063 = log2(_2061);
    float _2065 = fma(_1508, _1861, _2055);
    float _2067 = -_2053;
    float _2069 = fma(_2051, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2067);
    float _2071 = _1999;
    float _2073 = _2045;
    if (!_1797)
    {
        int _2075 = _2005 + 400;
        uint _2077 = uint(int(uint(_2075) >> uint(2)));
        uint _2079 = uint(int(uint(int(_2077)) >> uint(2)));
        int _2081 = int(_2077) & 3;
        float _2083 = (*spvDescriptorSet0.vp_c15)._m0[int(_2079)][_2081];
        _2071 = _2083;
    }
    float _2085 = _2071;
    float _2087 = fma(_1538, _1901, _2045);
    float _2089 = -_2059;
    float _2091 = fma(_2089, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2069);
    if (!_1797)
    {
        float _2093 = floor(_1614);
        _2073 = _2093;
    }
    float _2095 = _2073;
    float _2097 = _2087 + _1909;
    float _2099 = fma(_1538, _1949, _2007);
    float _2101 = fma(_2091, -0.5, 0.5);
    float _2103 = fma(_2091, 0.5, 0.5);
    float _2105 = 1.0 / _2097;
    float _2107 = fma(_1538, _1977, _2057);
    float _2109 = sqrt(_2101);
    float _2111 = _2107 + _1985;
    float _2113 = _1512 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2115 = fma(_1538, _2023, _2065);
    float _2117 = _2099 + _1957;
    float _2119 = _1512 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2121 = _1512 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2123 = fma(_1516, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2113);
    float _2125 = _2117 * _2105;
    float _2127 = fma(_1516, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2119);
    float _2129 = fma(_1516, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2121);
    float _2131 = _2111 * _2105;
    float _2133 = fma(_1520, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2123);
    bool _2135 = _2125 >= 0.0;
    float _2137 = fma(_1520, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2127);
    float _2139 = fma(_1520, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2129);
    float _2141 = _2063 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    bool _2143 = _2125 <= 1.0;
    bool _2145 = _2143 && _2135;
    float _2147 = _2137 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2149 = _2139 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2151 = exp2(_2141);
    bool _2153 = _2131 >= 0.0;
    bool _2155 = _2153 && _2145;
    float _2157 = _2147 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2159 = _2133 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2161 = _2115 + _2031;
    bool _2163 = _2131 <= 1.0;
    bool _2165 = _2163 && _2155;
    float _2167 = fma(_2149, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2157);
    float _2169 = _2147 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2171 = _2051 + 1.0;
    float _2173 = fma(_1881, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2167);
    float _2175 = fma(_2149, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2169);
    float _2177 = _2109 * 0.636619746685028076171875;
    float _2179 = _2161 * _2105;
    float _2181 = fma(_2103, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2183 = fma(_2159, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2173);
    float _2185 = -_2051;
    float _2187 = fma(_2151, _2171, _2185);
    float _2189 = fma(_1881, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2175);
    float _2191 = fma(_2103, _2181, -0.212114393711090087890625);
    float _2193 = 1.0 / _2183;
    float _2195 = _2147 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2197 = _2173;
    if (_2165)
    {
        float _2199 = float(_1710);
        _2197 = _2199;
    }
    float _2201 = _2197;
    float _2203 = fma(_2159, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2189);
    float _2205 = fma(_2103, _2191, 1.570728778839111328125);
    float _2207 = fma(_2149, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2195);
    float _2209 = fma(_2187, 0.5, 0.5);
    float _2211 = _2201;
    float _2213 = _2207;
    if (_2165)
    {
        float _2215 = rint(_2201);
        float _2217 = precise::max(_2215, 0.0);
        uint _2219 = uint(_2217);
        uint _2221 = clamp(_2219, 0u, 65535u);
        _2211 = as_type<float>(_2221);
    }
    float _2223 = _2211;
    float _2225 = fma(_1881, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2207);
    float _2227 = -_2205;
    float _2229 = fma(_2177, _2227, 1.0);
    if (!_1797)
    {
        float _2231 = -_2095;
        float _2233 = _1614 + _2231;
        _2213 = _2233;
    }
    float _2235 = _2213;
    float _2237 = fma(_2159, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2225);
    float _2239 = _2203 * _2193;
    float _2241 = _2237 * _2193;
    float _2243 = fma(_2239, 0.5, 0.5);
    float _2245 = fma(_2241, -0.5, 0.5);
    float _2247 = _2241;
    float _2249 = _2235;
    float _2251 = _2237;
    if (!_1797)
    {
        float _2253 = rint(_2085);
        float _2255 = precise::max(_2253, 0.0);
        uint _2257 = uint(_2255);
        uint _2259 = clamp(_2257, 0u, 65535u);
        _2247 = as_type<float>(_2259);
    }
    float _2261 = _2247;
    float _2263 = _2223;
    if (_2165)
    {
        float3 _6467 = float3(_2125, _2131, float(as_type<int>(_2223)));
        float3 _6471 = select(_6467, float3(0.0), isnan(_6467));
        float _2265 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6471.xy, uint(rint(_6471.z)), _2179, level(0.0));
        _2263 = _2265;
    }
    float _2267 = _2263;
    float3 _6481 = float3(_2243, _2245, _2039);
    float _2269 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6481, float3(0.0), isnan(_6481)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6481, float3(0.0), isnan(_6481)), level(0.0)).x;
    float3 _6490 = float3(_2243, _2245, _2039);
    float4 _2272 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6490, float3(0.0), isnan(_6490)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6490, float3(0.0), isnan(_6490)), level(0.0)).xyzw;
    float _2274 = _2272.x;
    float _2276 = _2272.y;
    float _2278 = _2272.z;
    float _2280 = _2272.w;
    float2 _6506 = float2(_2229, _2209);
    float3 _2284 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6506, float2(0.0), isnan(_6506)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6506, float2(0.0), isnan(_6506)), level(0.0)).xyz;
    float _2286 = _2284.x;
    float _2288 = _2284.y;
    float _2290 = _2284.z;
    float _2292 = _2261;
    if (!_1797)
    {
        float3 _6527 = float3(_2235, _1997, float(as_type<int>(_2261)));
        float3 _6529 = select(_6527, float3(0.0), isnan(_6527));
        float _2294 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6529.xy, uint(rint(_6529.z)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6529.xy, uint(rint(_6529.z)), level(0.0)).x;
        _2292 = _2294;
    }
    float _2296 = _2292;
    float _2298 = abs(_1636);
    float _2300 = log2(_2298);
    float _2302 = _2147 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2304 = fma(_2149, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2302);
    float _2306 = fma(_1881, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2304);
    float _2308 = _2063 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2310 = fma(_2159, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2306);
    float _2312 = _2300 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2314 = _2310 + _2183;
    float _2316 = exp2(_2308);
    bool _2318 = _1636 <= 8000.0;
    bool _2320 = isnan(_1636);
    bool _2322 = _2318 || _2320;
    bool _2324 = isnan(8000.0);
    bool _2326 = _2322 || _2324;
    float _2328 = float(_2326);
    float _2330 = _2314 * 0.5;
    if (!_2165)
    {
        _2249 = 1.0;
    }
    float _2332 = _2249;
    float _2334 = exp2(_2312);
    out.m_79.z = _2330;
    out.m_79.w = _2183;
    float _2336 = fma(_2334, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2338 = precise::clamp(_2336, 0.0, 1.0);
    float _2340 = fma(_2338, -2.0, 3.0);
    float _2342 = _2338 * _2338;
    float _2344 = _2342 * _2340;
    float _2346 = -_2344;
    float _2348 = _2346 + 1.0;
    out.gl_Position.x = _2203;
    out.gl_Position.y = _2237;
    out.gl_Position.z = _2310;
    out.gl_Position.w = _2183;
    float _2350 = fma(_2348, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2344);
    float _2352 = -_2316;
    float _2354 = _2352 + 1.0;
    float _2356 = _2328 * _2350;
    float _2358 = _2356 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2360 = _2354 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2362 = _2203;
    float _2364 = _2332;
    float _2366 = _2354;
    float _2368 = _2360;
    if (_1797)
    {
        _2362 = 1.0;
    }
    float _2370 = _2362;
    float _2372 = -_2037;
    float _2374 = _2372 + 1.0;
    float _2376 = _2374 * _2358;
    float _2378 = precise::clamp(_2376, 0.0, 1.0);
    float _2380 = _2370;
    if (_2165)
    {
        bool _2382 = _2267 >= _2179;
        bool _2384 = isnan(_2267);
        bool _2386 = _2382 || _2384;
        bool _2388 = isnan(_2179);
        bool _2390 = _2386 || _2388;
        float _2392 = float(_2390);
        _2364 = _2392;
    }
    float _2394 = _2364;
    if (!_1797)
    {
        int _2396 = _1879 << 4;
        int _2398 = _2396 + 2048;
        uint _2400 = uint(int(uint(_2398) >> uint(2)));
        uint _2402 = uint(int(uint(int(_2400)) >> uint(2)));
        int _2404 = int(_2400) & 3;
        float _2406 = (*spvDescriptorSet0.vp_c15)._m0[int(_2402)][_2404];
        int _2408 = int(_2400) + 1;
        uint _2410 = uint(int(uint(_2408) >> uint(2)));
        int _2412 = _2408 & 3;
        float _2414 = (*spvDescriptorSet0.vp_c15)._m0[int(_2410)][_2412];
        int _2416 = _2398 + 8;
        uint _2418 = uint(int(uint(_2416) >> uint(2)));
        uint _2420 = uint(int(uint(int(_2418)) >> uint(2)));
        int _2422 = int(_2418) & 3;
        float _2424 = (*spvDescriptorSet0.vp_c15)._m0[int(_2420)][_2422];
        int _2426 = int(_2418) + 1;
        uint _2428 = uint(int(uint(_2426) >> uint(2)));
        int _2430 = _2426 & 3;
        float _2432 = (*spvDescriptorSet0.vp_c15)._m0[int(_2428)][_2430];
        float _2434 = _1562 * _2414;
        float _2436 = fma(_1508, _2406, _2434);
        float _2438 = fma(_1538, _2424, _2436);
        float _2440 = _2438 + _2432;
        float _2442 = precise::clamp(_2440, 0.0, 1.0);
        float _2444 = -_2442;
        float _2446 = _2444 + _2296;
        float _2448 = fma(_2446, 500.0, 1.5);
        float _2450 = exp2(_2448);
        float _2452 = 0.0 + _2450;
        float _2454 = precise::clamp(_2452, 0.0, 1.0);
        _2380 = _2454;
        _2366 = _2424;
        _2251 = _2450;
    }
    float _2456 = _2380;
    float _2458 = _2366;
    float _2460 = _2251;
    float _2462 = _2360 * _2269;
    float _2464 = _2394 * _2456;
    float _2466 = -_2378;
    float _2468 = fma(_2466, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2470 = -_2360;
    float _2472 = _2470 + 1.0;
    float _2474 = _2280 * _2462;
    float _2476 = _2290 * _2462;
    float _2478 = -_2464;
    float _2480 = fma(_2478, _2468, 1.0);
    float _2482 = precise::clamp(_2480, 0.0, 1.0);
    bool _2484 = _1698 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2486 = isnan(_1698);
    bool _2488 = _2484 || _2486;
    bool _2490 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2492 = _2488 || _2490;
    float _2494 = fma(_2286, _2474, _2274);
    float _2496 = fma(_2288, _2474, _2276);
    float _2498 = _2482 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2500 = _2280 * _2472;
    float _2502 = fma(_2280, _2476, _2278);
    out.m_81.x = _2498;
    out.m_83.x = _2494;
    out.m_83.y = _2496;
    out.m_83.z = _2502;
    out.m_83.w = _2500;
    float _2504 = _2458;
    float _2506 = _2472;
    float _2508 = _2460;
    float _2510 = _2482;
    if (!_2492)
    {
        _1672 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2512 = _1672;
    float _2514 = _2512;
    float _2516 = _2512;
    if (!_2492)
    {
        _2504 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2518 = _2504;
    float _2520 = _2518;
    float _2522 = _2518;
    if (!_2492)
    {
        _2368 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2524 = _2368;
    float _2526 = _2524;
    float _2528 = _2524;
    if (!_2492)
    {
        _2506 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2530 = _2506;
    float _2532 = _2530;
    float _2534 = _2530;
    if (!_2492)
    {
        _2508 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2536 = _2508;
    float _2538 = _2536;
    float _2540 = _2536;
    if (!_2492)
    {
        _2510 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2542 = _2510;
    bool _2544 = !_2492;
    float _2546 = _2542;
    float _2548 = _2542;
    if (!_2544)
    {
        bool _2550 = _1698 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2552 = isnan(_1698);
        bool _2554 = _2550 || _2552;
        bool _2556 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2558 = _2554 || _2556;
        if (!_2558)
        {
            float _2560 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2562 = _1698 + _2560;
            float _2564 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2566 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2564;
            float _2568 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2570 = _2568 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2572 = 1.0 / _2566;
            float _2574 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2576 = _2574 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2578 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2580 = _2578 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2582 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2584 = _2582 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2586 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2588 = _2586 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2590 = _2562 * _2572;
            float _2592 = precise::clamp(_2590, 0.0, 1.0);
            float _2594 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2596 = _2594 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2598 = fma(_2592, _2570, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2600 = fma(_2592, _2596, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2602 = fma(_2592, _2576, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2604 = fma(_2592, _2580, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2606 = fma(_2592, _2584, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2608 = fma(_2592, _2588, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2522 = _2602;
            _2540 = _2606;
            _2516 = _2598;
            _2534 = _2604;
            _2528 = _2600;
            _2548 = _2608;
            _2610 = true;
        }
        else
        {
            bool _2612 = _1698 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2614 = isnan(_1698);
            bool _2616 = _2612 || _2614;
            bool _2618 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2620 = _2616 || _2618;
            if (!_2620)
            {
                _2514 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2622 = _2514;
            _2516 = _2622;
            if (!_2620)
            {
                _2520 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2624 = _2520;
            _2522 = _2624;
            if (!_2620)
            {
                _2526 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2626 = _2526;
            _2528 = _2626;
            if (!_2620)
            {
                _2532 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2628 = _2532;
            _2534 = _2628;
            if (!_2620)
            {
                _2538 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2630 = _2538;
            _2540 = _2630;
            if (!_2620)
            {
                _2546 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2632 = _2546;
            bool _2634 = !_2620;
            _2548 = _2632;
            if (!_2634)
            {
                bool _2636 = _1698 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2638 = isnan(_1698);
                bool _2640 = _2636 || _2638;
                bool _2642 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2644 = _2640 || _2642;
                if (!_2644)
                {
                    float _2646 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2648 = _1698 + _2646;
                    float _2650 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2652 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2650;
                    float _2654 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2656 = _2654 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2658 = 1.0 / _2652;
                    float _2660 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2662 = _2660 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2664 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2666 = _2664 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2668 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2670 = _2668 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2672 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2674 = _2672 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2676 = _2648 * _2658;
                    float _2678 = precise::clamp(_2676, 0.0, 1.0);
                    float _2680 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2682 = _2680 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2684 = fma(_2678, _2656, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2686 = fma(_2678, _2682, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2688 = fma(_2678, _2662, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2690 = fma(_2678, _2666, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2692 = fma(_2678, _2670, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2694 = fma(_2678, _2674, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2522 = _2688;
                    _2540 = _2692;
                    _2516 = _2684;
                    _2534 = _2690;
                    _2528 = _2686;
                    _2548 = _2694;
                    _2610 = true;
                }
                else
                {
                    _2522 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2540 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2516 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2534 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2528 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2548 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2610 = false;
    float _2696 = _2522;
    float _2698 = _2540;
    float _2700 = _2516;
    float _2702 = _2534;
    float _2704 = _2528;
    float _2706 = _2548;
    float _2708 = fma(_1376, -0.5, 0.5);
    float _2710 = precise::clamp(_2708, 0.0, 1.0);
    float _2712 = -_2696;
    float _2714 = _2712 + _2698;
    float _2716 = -_2700;
    float _2718 = _2716 + _2702;
    float _2720 = -_2704;
    float _2722 = _2720 + _2706;
    bool _2724 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2726 = fma(_2710, _2714, _2696);
    float _2728 = fma(_2710, _2718, _2700);
    float _2730 = fma(_2710, _2722, _2704);
    float _2732 = _2726 * 0.586610972881317138671875;
    out.m_61.x = 1.0;
    float _2734 = fma(_2728, 0.298911988735198974609375, _2732);
    float _2736 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2738 = fma(_2730, 0.114477999508380889892578125, _2734);
    out.m_81.w = _2736;
    float _2740 = -_2738;
    float _2742 = _2728 + _2740;
    float _2744 = -_2738;
    float _2746 = _2726 + _2744;
    float _2748 = -_2738;
    float _2750 = _2730 + _2748;
    out.m_85.x = 0.0;
    float _2752 = fma(_2742, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2738);
    float _2754 = fma(_2746, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2738);
    float _2756 = fma(_2750, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2738);
    out.m_87.x = _2752;
    out.m_87.y = _2754;
    out.m_87.z = _2756;
    if (!_2724)
    {
        return out;
    }
    float _2758 = -_1512;
    float _2760 = _2758 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2762 = -_1516;
    float _2764 = _2762 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2766 = -_1520;
    float _2768 = _2766 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2770 = _2760 * _2760;
    float _2772 = fma(_2764, _2764, _2770);
    float _2774 = fma(_2768, _2768, _2772);
    float _2776 = sqrt(_2774);
    float _2778 = rsqrt(_2774);
    float _2780 = -_2776;
    float _2782 = _2780 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2784 = _2782 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2786 = precise::clamp(_2784, 0.0, 1.0);
    float _2788 = _2764 * _2778;
    float _2790 = _2760 * _2778;
    float _2792 = abs(_2786);
    float _2794 = log2(_2792);
    float _2796 = _2768 * _2778;
    float _2798 = _2788 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2800 = _1376 * _2790;
    float _2802 = -_2790;
    float _2804 = -_2798;
    float _2806 = fma(_2802, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2804);
    float _2808 = fma(_1374, _2788, _2800);
    float _2810 = -_2796;
    float _2812 = fma(_2810, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2806);
    float _2814 = fma(_1378, _2796, _2808);
    float _2816 = precise::clamp(_2814, 0.0, 1.0);
    float _2818 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2820 = _2812 + _2818;
    float _2822 = _2794 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2824 = _2820 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2826 = precise::clamp(_2824, 0.0, 1.0);
    float _2828 = exp2(_2822);
    float _2830 = _2828 * _2826;
    float _2832 = _2816 * _2830;
    float _2834 = _2832 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2836 = _2832 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2838 = _2832 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_85.x = _2834;
    out.m_85.y = _2836;
    out.m_85.z = _2838;
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
    bool _2610 = false;
    bool _1452 = false;
    bool _630 = false;
    bool _480 = false;
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
        float _2895 = as_type<float>(_122);
        out.gl_Position.z = _2895;
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
        float _2966 = as_type<float>(_162);
        out.gl_Position.z = _2966;
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
    float _412 = fma(_390, (*spvDescriptorSet0.vp_c10)._m0[4].z, _402);
    float _414 = sqrt(_400);
    float _416 = fma(_390, (*spvDescriptorSet0.vp_c10)._m0[5].z, _398);
    float _418 = fma(_390, (*spvDescriptorSet0.vp_c10)._m0[6].z, _410);
    bool _420 = _414 >= 9.9999999747524270787835121154785e-07;
    bool _422 = isnan(_414);
    bool _424 = _420 || _422;
    bool _426 = isnan(9.9999999747524270787835121154785e-07);
    bool _428 = _424 || _426;
    float _430 = fma(_362, _384, _404);
    float _432 = fma(_356, _384, _406);
    float _434 = fma(_380, _384, _408);
    float _436 = _416;
    float _438 = _412;
    float _440 = _418;
    if (!_428)
    {
        bool _442 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _444 = !_442;
        if (!_444)
        {
            float _446 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _448 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _450 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _452 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _446);
            float _454 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _448);
            float _456 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _450);
            float _458 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _452);
            float _460 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _454);
            float _462 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _456);
            float _464 = _458 * _458;
            float _466 = fma(_460, _460, _464);
            float _468 = fma(_462, _462, _466);
            float _470 = rsqrt(_468);
            float _472 = _470 * 9.9999999747524270787835121154785e-07;
            float _474 = _460 * _472;
            float _476 = _458 * _472;
            float _478 = _462 * _472;
            _436 = _476;
            _438 = _474;
            _440 = _478;
            _480 = true;
        }
        else
        {
            float _482 = _168 * _168;
            float _484 = fma(_166, _166, _482);
            float _486 = fma(_170, _170, _484);
            float _488 = sqrt(_486);
            bool _490 = _488 >= 9.9999999747524270787835121154785e-07;
            bool _492 = isnan(_488);
            bool _494 = _490 || _492;
            bool _496 = isnan(9.9999999747524270787835121154785e-07);
            bool _498 = _494 || _496;
            if (!_498)
            {
                float _500 = _406 * _406;
                float _502 = fma(_404, _404, _500);
                float _504 = fma(_408, _408, _502);
                float _506 = sqrt(_504);
                bool _508 = _506 >= 9.9999999747524270787835121154785e-07;
                bool _510 = isnan(_506);
                bool _512 = _508 || _510;
                bool _514 = isnan(9.9999999747524270787835121154785e-07);
                bool _516 = _512 || _514;
                if (!_516)
                {
                    float _518 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _520 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _518);
                    float _522 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _520);
                    float _524 = rsqrt(_522);
                    float _526 = _524 * 9.9999999747524270787835121154785e-07;
                    float _528 = _526 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _530 = _526 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _532 = _526 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _436 = _530;
                    _438 = _528;
                    _440 = _532;
                    _480 = true;
                }
                else
                {
                    float _534 = _406 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _536 = _406 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _538 = _406 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _540 = fma(_404, (*spvDescriptorSet0.vp_c10)._m0[5].x, _534);
                    float _542 = fma(_404, (*spvDescriptorSet0.vp_c10)._m0[4].x, _536);
                    float _544 = fma(_404, (*spvDescriptorSet0.vp_c10)._m0[6].x, _538);
                    float _546 = fma(_408, (*spvDescriptorSet0.vp_c10)._m0[5].z, _540);
                    float _548 = fma(_408, (*spvDescriptorSet0.vp_c10)._m0[4].z, _542);
                    float _550 = fma(_408, (*spvDescriptorSet0.vp_c10)._m0[6].z, _544);
                    float _552 = _546 * _546;
                    float _554 = fma(_548, _548, _552);
                    float _556 = fma(_550, _550, _554);
                    float _558 = rsqrt(_556);
                    float _560 = _558 * 9.9999999747524270787835121154785e-07;
                    float _562 = _548 * _560;
                    float _564 = _546 * _560;
                    float _566 = _550 * _560;
                    _436 = _564;
                    _438 = _562;
                    _440 = _566;
                    _480 = true;
                }
            }
            else
            {
                float _568 = _168 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _570 = _168 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _572 = _168 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _574 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[5].x, _568);
                float _576 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[4].x, _570);
                float _578 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[6].x, _572);
                float _580 = fma(_170, (*spvDescriptorSet0.vp_c10)._m0[5].z, _574);
                float _582 = fma(_170, (*spvDescriptorSet0.vp_c10)._m0[4].z, _576);
                float _584 = fma(_170, (*spvDescriptorSet0.vp_c10)._m0[6].z, _578);
                float _586 = _580 * _580;
                float _588 = fma(_582, _582, _586);
                float _590 = fma(_584, _584, _588);
                float _592 = rsqrt(_590);
                float _594 = _592 * 9.9999999747524270787835121154785e-07;
                float _596 = _582 * _594;
                float _598 = _580 * _594;
                float _600 = _584 * _594;
                _436 = _598;
                _438 = _596;
                _440 = _600;
            }
        }
    }
    _480 = false;
    float _602 = _436;
    float _604 = _438;
    float _606 = _440;
    bool _608 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _610 = !_608;
    float _628;
    if (!_610)
    {
        float _612 = in.m_67.x;
        float _614 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _616 = _612 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _618 = fma(_616, (*spvDescriptorSet0.vp_c9)._m0[12].x, _140);
        float _620 = _618 * _614;
        float _622 = floor(_620);
        float _624 = -_622;
        float _626 = _620 + _624;
        _628 = _626;
        _630 = true;
    }
    else
    {
        float _632 = float(_106);
        float _634 = 1.0 / _632;
        float _636 = _140 * _634;
        _628 = _636;
    }
    _630 = false;
    float _638 = _628;
    float _640 = _432 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _642 = _432 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _644 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _646 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _644;
    float _648 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _650 = _648 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _652 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _654 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _652;
    float _656 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _658 = _656 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _660 = 1.0 / _646;
    float _662 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _664 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _662;
    float _666 = _432 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _668 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _670 = _638 + _668;
    float _672 = fma(_430, (*spvDescriptorSet0.vp_c10)._m0[4].x, _640);
    float _674 = fma(_430, (*spvDescriptorSet0.vp_c10)._m0[5].x, _642);
    float _676 = fma(_430, (*spvDescriptorSet0.vp_c10)._m0[6].x, _666);
    float _678 = 1.0 / _650;
    float _680 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _682 = _638 + _680;
    float _684 = fma(_434, (*spvDescriptorSet0.vp_c10)._m0[4].z, _672);
    float _686 = fma(_434, (*spvDescriptorSet0.vp_c10)._m0[5].z, _674);
    float _688 = fma(_434, (*spvDescriptorSet0.vp_c10)._m0[6].z, _676);
    bool _690 = _638 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _692 = isnan(_638);
    bool _694 = _690 || _692;
    bool _696 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _698 = _694 || _696;
    float _700 = float(_698);
    bool _702 = _638 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _704 = isnan(_638);
    bool _706 = _702 || _704;
    bool _708 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _710 = _706 || _708;
    float _712 = float(_710);
    float _714 = 1.0 / _658;
    float _716 = _682 * _660;
    float _718 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _720 = _638 + _718;
    float _722 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _724 = _638 + _722;
    float _726 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _728 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _726;
    float _730 = _686 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _732 = 1.0 / _654;
    float _734 = _720 * _678;
    float _736 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _738 = _638 + _736;
    float _740 = fma(_728, _716, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _742 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _744 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _742;
    float _746 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _748 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _746;
    float _750 = 1.0 / _664;
    float _752 = _670 * _714;
    float _754 = _688 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _756 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _758 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _756;
    float _760 = _724 * _732;
    bool _762 = _638 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _764 = isnan(_638);
    bool _766 = _762 || _764;
    bool _768 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _770 = _766 || _768;
    float _772 = float(_770);
    float _774 = fma(_748, _716, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _776 = fma(_758, _716, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _778 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _780 = _778 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _782 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _784 = _782 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _786 = -_772;
    float _788 = _786 + 1.0;
    float _790 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _792 = _790 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _794 = _738 * _750;
    bool _796 = _638 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _798 = isnan(_638);
    bool _800 = _796 || _798;
    bool _802 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _804 = _800 || _802;
    float _806 = float(_804);
    float _808 = _700 * _788;
    float _810 = -_700;
    float _812 = _810 + 1.0;
    float _814 = fma(_784, _734, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _816 = fma(_792, _734, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _818 = fma(_744, _760, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _820 = _806 * _812;
    float _822 = -_806;
    float _824 = _822 + 1.0;
    float _826 = fma(_780, _734, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _828 = _638 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _830 = isnan(_638);
    bool _832 = _828 || _830;
    bool _834 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _836 = _832 || _834;
    float _838 = float(_836);
    float _840 = _602 * _602;
    float _842 = _712 * _824;
    float _844 = -_712;
    float _846 = _844 + 1.0;
    bool _848 = _638 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _850 = isnan(_638);
    bool _852 = _848 || _850;
    bool _854 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _856 = _852 || _854;
    float _858 = float(_856);
    float _860 = -_838;
    float _862 = _860 + 1.0;
    float _864 = fma(_604, _604, _840);
    float _866 = _838 * _846;
    float _868 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _870 = _868 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _872 = _858 * _862;
    float _874 = fma(_606, _606, _864);
    float _876 = -_858;
    float _878 = _876 + 1.0;
    float _880 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _882 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _880;
    float _884 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _886 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _884;
    float _888 = _774 * _872;
    float _890 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _892 = _890 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _894 = rsqrt(_874);
    float _896 = fma(_882, _760, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _898 = fma(_886, _760, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _900 = fma(_878, (*spvDescriptorSet0.vp_c9)._m0[143].x, _888);
    float _902 = fma(_870, _752, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _904 = fma(_892, _752, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _906 = fma(_826, _866, _900);
    float _908 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _910 = _908 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _912 = _740 * _872;
    float _914 = fma(_896, _842, _906);
    float _916 = fma(_910, _752, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _918 = fma(_878, (*spvDescriptorSet0.vp_c9)._m0[143].z, _912);
    float _920 = fma(_902, _820, _914);
    float _922 = _894 * _604;
    float _924 = in.m_65.x;
    float _926 = in.m_65.y;
    float _928 = in.m_65.z;
    float _930 = _684 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _932 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _934 = _730 + _932;
    float _936 = _894 * _602;
    float _938 = _894 * _606;
    float _940 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _942 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _940;
    float _944 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _946 = _930 + _944;
    float _948 = _934 * _934;
    float _950 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _952 = _754 + _950;
    float _954 = fma(_942, _794, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _956 = _936 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _958 = fma(_946, _946, _948);
    float _960 = _776 * _872;
    float _962 = fma(_954, _808, _920);
    float _964 = fma(_922, (*spvDescriptorSet0.vp_c10)._m0[8].y, _956);
    float _966 = fma(_952, _952, _958);
    float _968 = fma(_878, (*spvDescriptorSet0.vp_c9)._m0[143].y, _960);
    float _970 = fma(_772, (*spvDescriptorSet0.vp_c9)._m0[148].x, _962);
    float _972 = fma(_938, (*spvDescriptorSet0.vp_c10)._m0[10].y, _964);
    float _974 = fma(_814, _866, _968);
    float _976 = rsqrt(_966);
    float _978 = fma(_816, _866, _918);
    float _980 = abs(_972);
    bool _982 = _980 > 0.99989998340606689453125;
    float _984 = _970 * _924;
    float _986 = fma(_818, _842, _974);
    float _988 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _990 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _988;
    float _992 = _984 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _994 = fma(_898, _842, _978);
    float _996 = fma(_990, _794, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _998 = fma(_904, _820, _986);
    float _1000 = _992 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _1002 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _1004 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _1002;
    float _1006 = fma(_916, _820, _994);
    float _1008 = _818;
    float _1010 = _816;
    float _1012 = _842;
    float _1014 = _990;
    if (_982)
    {
        _1008 = 0.001000000047497451305389404296875;
    }
    float _1016 = _1008;
    float _1018 = _1000 * _976;
    if (!_982)
    {
        _1010 = (*spvDescriptorSet0.vp_c10)._m0[8].y;
    }
    float _1020 = _1010;
    float _1022 = fma(_1004, _794, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _1024 = _1020;
    if (!_982)
    {
        _1012 = (*spvDescriptorSet0.vp_c10)._m0[10].y;
    }
    float _1026 = _1012;
    float _1028 = _934 * _1018;
    float _1030 = _1026;
    if (_982)
    {
        float _1032 = fma(_1016, (*spvDescriptorSet0.vp_c10)._m0[8].z, (*spvDescriptorSet0.vp_c10)._m0[8].y);
        _1024 = _1032;
    }
    float _1034 = _1024;
    float _1036 = _946 * _1018;
    float _1038 = -_1028;
    float _1040 = _934 + _1038;
    if (!_982)
    {
        _1014 = (*spvDescriptorSet0.vp_c10)._m0[9].y;
    }
    float _1042 = _1014;
    float _1044 = -_1036;
    float _1046 = _946 + _1044;
    float _1048 = _952 * _1018;
    float _1050 = _1040 * _1040;
    float _1052 = _1042;
    float _1054 = _1048;
    if (_982)
    {
        float _1056 = fma(_1016, (*spvDescriptorSet0.vp_c10)._m0[10].z, (*spvDescriptorSet0.vp_c10)._m0[10].y);
        _1030 = _1056;
    }
    float _1058 = _1030;
    float _1060 = -_1034;
    float _1062 = _938 * _1060;
    if (_982)
    {
        float _1064 = fma(_1016, (*spvDescriptorSet0.vp_c10)._m0[9].z, (*spvDescriptorSet0.vp_c10)._m0[9].y);
        _1052 = _1064;
    }
    float _1066 = _1052;
    float _1068 = fma(_1046, _1046, _1050);
    float _1070 = -_1058;
    float _1072 = _936 * _1070;
    float _1074 = -_1058;
    float _1076 = -_1062;
    float _1078 = fma(_922, _1074, _1076);
    float _1080 = -_1048;
    float _1082 = _952 + _1080;
    float _1084 = fma(_996, _808, _998);
    float _1086 = -_1066;
    float _1088 = -_1072;
    float _1090 = fma(_938, _1086, _1088);
    float _1092 = -_1066;
    float _1094 = _922 * _1092;
    float _1096 = _1078 * _1078;
    float _1098 = fma(_1082, _1082, _1068);
    float _1100 = fma(_1022, _808, _1006);
    float _1102 = in.m_69.x;
    float _1104 = in.m_69.y;
    float _1106 = in.m_69.z;
    float _1108 = -_1034;
    float _1110 = -_1094;
    float _1112 = fma(_936, _1108, _1110);
    float _1114 = fma(_1090, _1090, _1096);
    float _1116 = sqrt(_1098);
    float _1118 = fma(_772, (*spvDescriptorSet0.vp_c9)._m0[148].y, _1084);
    float _1120 = fma(_772, (*spvDescriptorSet0.vp_c9)._m0[148].z, _1100);
    float _1122 = fma(_1112, _1112, _1114);
    float _1124 = _1118 * _926;
    float _1126 = _1120 * _928;
    float _1128 = rsqrt(_1122);
    float _1130 = _1124 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1132 = _1126 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1134 = _976 * _1116;
    float _1136 = _1130 * _1134;
    float _1138 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1104);
    float _1140 = _992 * _1134;
    float _1142 = _1132 * _1134;
    float _1144 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1102);
    float _1146 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1106);
    float _1148 = _1090 * _1128;
    float _1150 = _1078 * _1128;
    float _1152 = _1112 * _1128;
    float _1154 = _1136 * _1138;
    float _1156 = _1140 * _1144;
    float _1158 = _1142 * _1146;
    float _1160 = _922 * _1150;
    float _1162 = _936 * _1152;
    float _1164 = _1154 * _922;
    float _1166 = _1154 * _938;
    float _1168 = -_1160;
    float _1170 = fma(_936, _1148, _1168);
    float _1172 = -_1162;
    float _1174 = fma(_938, _1150, _1172);
    float _1176 = fma(_1156, _1148, _1164);
    float _1178 = fma(_1156, _1152, _1166);
    bool _1180 = _1104 != 0.0;
    bool _1182 = isnan(_1104);
    bool _1184 = _1180 || _1182;
    bool _1186 = isnan(0.0);
    bool _1188 = _1184 || _1186;
    float _1190 = _938 * _1148;
    float _1192 = fma(_1158, _1174, _1176);
    float _1194 = fma(_1158, _1170, _1178);
    bool _1196 = _1102 == 0.0;
    bool _1198 = !_1188;
    bool _1200 = _1196 && _1198;
    float _1202 = _1154 * _936;
    float _1204 = _930 + _1192;
    float _1206 = _754 + _1194;
    bool _1208 = _1106 == 0.0;
    bool _1210 = _1208 && _1200;
    float _1212 = in.m_71.x;
    float _1214 = in.m_71.y;
    float _1216 = in.m_71.z;
    float _1218 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1220 = _1204 + _1218;
    float _1222 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1224 = _1206 + _1222;
    float _1226 = fma(_1156, _1150, _1202);
    float _1228 = -_1190;
    float _1230 = fma(_922, _1152, _1228);
    float _1232 = _1220 * _1220;
    float _1234 = _1224 * _1224;
    float _1236 = fma(_1158, _1230, _1226);
    float _1238 = _1232 + _1234;
    float _1240 = _730 + _1236;
    float _1242 = sqrt(_1238);
    float _1244 = _1212;
    float _1246 = _1214;
    float _1248 = _1216;
    float _1250 = _1158;
    float _1252 = _1104;
    float _1254 = _1102;
    float _1256 = _1156;
    float _1258 = _1204;
    if (!_1210)
    {
        float _1260 = fma(_1102, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1212);
        _1244 = _1260;
    }
    float _1262 = _1244;
    if (!_1210)
    {
        float _1264 = fma(_1104, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1214);
        _1246 = _1264;
    }
    float _1266 = _1246;
    if (!_1210)
    {
        float _1268 = fma(_1106, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1216);
        _1248 = _1268;
    }
    float _1270 = _1248;
    bool _1272 = _1242 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    if (!_1272)
    {
        _1250 = _1204;
    }
    float _1274 = _1250;
    float _1276 = _1274;
    if (!_1272)
    {
        _1252 = _1234;
    }
    float _1278 = _1252;
    float _1280 = _1278;
    if (!_1272)
    {
        _1254 = _1232;
    }
    float _1282 = _1254;
    float _1284 = _1282;
    if (!_1272)
    {
        _1256 = _1206;
    }
    float _1286 = _1256;
    float _1288 = _1286;
    if (!_1272)
    {
        _1258 = _1240;
    }
    float _1290 = _1258;
    bool _1292 = !_1272;
    float _1294 = _1290;
    if (!_1292)
    {
        float _1296 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1298 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1300 = _1242 + _1298;
        float _1302 = rsqrt(_1238);
        float _1304 = _1300 * _1296;
        float _1306 = _1240 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1308 = _1304 * 0.15915493667125701904296875;
        float _1310 = _1308 * 6.283185482025146484375;
        float _1312 = sin(_1310);
        float _1314 = _1308 * 6.283185482025146484375;
        float _1316 = cos(_1314);
        float _1318 = fma(_1312, _1306, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1320 = _1302 * _1318;
        float _1322 = _1316 + (-1.0);
        float _1324 = fma(_1220, _1320, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1326 = fma(_1224, _1320, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1328 = _1322 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1330 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1332 = _1324 + _1330;
        float _1334 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1336 = _1326 + _1334;
        float _1338 = fma(_1240, _1316, _1328);
        float _1340 = _1332 * _1332;
        float _1342 = _1336 * _1336;
        _1294 = _1338;
        _1284 = _1340;
        _1280 = _1342;
        _1276 = _1324;
        _1288 = _1326;
    }
    float _1344 = _1294;
    float _1346 = _1284;
    float _1348 = _1280;
    float _1350 = _1276;
    float _1352 = _1288;
    float _1354 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1356 = _1344 + _1354;
    float _1358 = _922 * _1266;
    float _1360 = _936 * _1266;
    float _1362 = _938 * _1266;
    float _1364 = fma(_1356, _1356, _1346);
    float _1366 = fma(_1148, _1262, _1358);
    float _1368 = fma(_1150, _1262, _1360);
    float _1370 = fma(_1152, _1262, _1362);
    float _1372 = _1364 + _1348;
    float _1374 = fma(_1174, _1270, _1366);
    float _1376 = fma(_1230, _1270, _1368);
    float _1378 = fma(_1170, _1270, _1370);
    float _1380 = sqrt(_1372);
    float _1382 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1384 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1386 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1388 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1390 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1392 = _1382 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1394 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1396 = _1384 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1398 = _1386 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1400 = _1388 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1402 = _1390 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1404 = _1394 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_73.x = _1374;
    out.m_73.y = _1376;
    out.m_73.z = _1378;
    bool _1406 = _1380 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1408 = isnan(_1380);
    bool _1410 = _1406 || _1408;
    bool _1412 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1414 = _1410 || _1412;
    out.m_75.x = _1392;
    out.m_75.y = _1396;
    out.m_75.z = _1398;
    out.m_77.x = _1400;
    out.m_77.y = _1402;
    out.m_77.z = _1404;
    float _1416 = _1368;
    if (!_1414)
    {
        _1416 = 1.0;
    }
    float _1418 = _1416;
    bool _1420 = !_1414;
    float _1422 = _1418;
    if (!_1420)
    {
        bool _1424 = _1380 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1426 = isnan(_1380);
        bool _1428 = _1424 || _1426;
        bool _1430 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1432 = _1428 || _1430;
        if (!_1432)
        {
            float _1434 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1436 = _1380 + _1434;
            float _1438 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1440 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1438;
            float _1442 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1444 = _1442 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1446 = 1.0 / _1440;
            float _1448 = _1436 * _1446;
            float _1450 = fma(_1448, _1444, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1422 = _1450;
            _1452 = true;
        }
        else
        {
            bool _1454 = _1380 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1456 = isnan(_1380);
            bool _1458 = _1454 || _1456;
            bool _1460 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1462 = _1458 || _1460;
            if (!_1462)
            {
                float _1464 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1466 = _1380 + _1464;
                float _1468 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1470 = _1468 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1472 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1474 = _1472 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1476 = 1.0 / _1470;
                float _1478 = _1466 * _1476;
                float _1480 = fma(_1478, _1474, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1422 = _1480;
                _1452 = true;
            }
            else
            {
                _1422 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1452 = false;
    float _1482 = _1422;
    float _1484 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1486 = _1344 + _1484;
    float _1488 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1490 = _1350 + _1488;
    float _1492 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1494 = _1352 + _1492;
    float _1496 = -_1028;
    float _1498 = _730 + _1496;
    float _1500 = fma(_1486, _1482, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1502 = fma(_1490, _1482, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1504 = fma(_1494, _1482, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1506 = -_1036;
    float _1508 = _930 + _1506;
    float _1510 = -_1028;
    float _1512 = _1510 + _1500;
    float _1514 = -_1036;
    float _1516 = _1514 + _1502;
    float _1518 = -_1048;
    float _1520 = _1518 + _1504;
    float _1522 = _1498 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1524 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1526 = _1512 + _1524;
    float _1528 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1530 = _1516 + _1528;
    float _1532 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1534 = _1520 + _1532;
    float _1536 = -_1048;
    float _1538 = _754 + _1536;
    float _1540 = _1526 * _1526;
    float _1542 = fma(_1508, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1522);
    float _1544 = _1512 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1546 = fma(_1530, _1530, _1540);
    float _1548 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1542);
    float _1550 = fma(_1534, _1534, _1546);
    float _1552 = _1548 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1554 = _1498 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1556 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _1558 = rsqrt(_1550);
    float _1560 = fma(_1508, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1554);
    float _1562 = _1498 + _1556;
    float _1564 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1560);
    float _1566 = _1562 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1568 = 1.0 / _1552;
    float _1570 = fma(_1538, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1572 = _1564 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1574 = fma(_1508, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1566);
    float _1576 = _1572 + _1552;
    float _1578 = fma(_1538, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1574);
    float _1580 = _1558 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1582 = floor(_1570);
    float _1584 = _1578 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1586 = _1530 * _1580;
    float _1588 = _1534 * _1580;
    float _1590 = _1562 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1592 = _1586 * _1586;
    float _1594 = _1588 * _1588;
    float _1596 = _1576 * _1568;
    float _1598 = _1596 * 0.5;
    float _1600 = fma(_1508, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1590);
    float _1602 = trunc(_1584);
    int _1604 = int(_1602);
    float _1606 = _1592 + _1594;
    float _1608 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1610 = fma(_1598, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1608);
    float _1612 = fma(_1538, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1600);
    float _1614 = _1612 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1616 = sqrt(_1606);
    float _1618 = fma(_1508, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1620 = 1.0 / _1610;
    int _1622 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1624 = _1604 + _1622;
    int _1626 = _1624 + 1;
    bool _1628 = _1616 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1630 = trunc(_1614);
    int _1632 = int(_1630);
    float _1634 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1636 = _1620 * _1634;
    float _1638 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1640 = _1616 + _1638;
    float _1642 = floor(_1618);
    bool _1644 = _1636 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1646 = _1636 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    int _1648 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1650 = _1632 + _1648;
    int _1652 = _1650 + 1;
    float _1654 = _1552;
    int _1656 = 2;
    float _1658 = _1640;
    float _1660 = _1526;
    float _1662 = _1544;
    int _1664 = _1652;
    float _1666 = _1586;
    int _1668 = as_type<int>(_1582);
    float _1670 = _1592;
    float _1672 = _1508;
    if (_1628)
    {
        float _1674 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1654 = _1674;
    }
    float _1676 = _1654;
    if (!_1644)
    {
        _1656 = 1;
    }
    int _1678 = _1656;
    float _1680 = -_1642;
    float _1682 = _1618 + _1680;
    float _1684 = 0.0;
    int _1686 = _1678;
    if (_1628)
    {
        float _1688 = rsqrt(_1606);
        _1684 = _1688;
    }
    float _1690 = _1684;
    float _1692 = _1690;
    if (_1628)
    {
        float _1694 = _1640 * _1676;
        _1658 = _1694;
    }
    float _1696 = _1658;
    float _1698 = sqrt(_1550);
    if (_1628)
    {
        float _1700 = _1696 * 0.15915493667125701904296875;
        _1054 = _1700;
    }
    float _1702 = _1054;
    bool _1704 = !_1644;
    int _1706 = _1704 ? 0 : 1;
    float _1708 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    if (!_1646)
    {
        _1686 = _1706;
    }
    int _1710 = _1686;
    float _1712 = _1578;
    if (_1628)
    {
        float _1714 = _1702 * 6.283185482025146484375;
        float _1716 = cos(_1714);
        _1712 = _1716;
    }
    float _1718 = _1712;
    float _1720 = precise::max(0.0, _1708);
    int _1722 = _1710 << 6;
    bool _1724 = _1652 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1726 = -_1580;
    float _1728 = -_1720;
    float _1730 = fma(_1526, _1726, _1728);
    int _1732 = _1722 + 48;
    uint _1735 = uint(int(uint(_1732) >> uint(2)));
    uint _1737 = uint(int(uint(int(_1735)) >> uint(2)));
    int _1739 = int(_1735) & 3;
    float _1741 = (*spvDescriptorSet0.vp_c15)._m0[int(_1737)][_1739];
    int _1743 = int(_1735) + 1;
    uint _1745 = uint(int(uint(_1743) >> uint(2)));
    int _1747 = _1743 & 3;
    float _1749 = (*spvDescriptorSet0.vp_c15)._m0[int(_1745)][_1747];
    float _1751 = _1616;
    float _1753 = _1730;
    if (_1628)
    {
        float _1755 = _1702 * 6.283185482025146484375;
        float _1757 = sin(_1755);
        _1751 = _1757;
    }
    float _1759 = _1751;
    int _1761 = _1652 | _1626;
    if (_1628)
    {
        float _1763 = _1730 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1660 = _1763;
    }
    float _1765 = _1660;
    bool _1767 = _1761 < 0;
    bool _1769 = _1767 || _1724;
    int _1771 = _1722 + 64;
    uint _1773 = uint(int(uint(_1771) >> uint(2)));
    uint _1775 = uint(int(uint(int(_1773)) >> uint(2)));
    int _1777 = int(_1773) & 3;
    float _1779 = (*spvDescriptorSet0.vp_c15)._m0[int(_1775)][_1777];
    int _1781 = int(_1773) + 1;
    uint _1783 = uint(int(uint(_1781) >> uint(2)));
    int _1785 = _1781 & 3;
    float _1787 = (*spvDescriptorSet0.vp_c15)._m0[int(_1783)][_1785];
    float _1789 = 0.0;
    if (_1628)
    {
        float _1791 = _1718 + (-1.0);
        _1789 = _1791;
    }
    float _1793 = _1789;
    bool _1795 = _1626 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1797 = _1795 || _1769;
    float _1799 = 0.0;
    if (_1628)
    {
        float _1801 = _1793 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1799 = _1801;
    }
    float _1803 = _1799;
    float _1805 = fma(_1516, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1544);
    if (!_1628)
    {
        _1662 = _1588;
    }
    float _1807 = _1662;
    int _1809 = _1722 + 96;
    uint _1811 = uint(int(uint(_1809) >> uint(2)));
    uint _1813 = uint(int(uint(int(_1811)) >> uint(2)));
    int _1815 = int(_1811) & 3;
    float _1817 = (*spvDescriptorSet0.vp_c15)._m0[int(_1813)][_1815];
    int _1819 = int(_1811) + 1;
    uint _1821 = uint(int(uint(_1819) >> uint(2)));
    int _1823 = _1819 & 3;
    float _1825 = (*spvDescriptorSet0.vp_c15)._m0[int(_1821)][_1823];
    float _1827 = 0.0;
    float _1829 = _1807;
    if (_1628)
    {
        float _1831 = fma(_1759, _1765, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1827 = _1831;
    }
    float _1833 = _1827;
    if (_1628)
    {
        float _1835 = fma(_1730, _1718, _1803);
        _1753 = _1835;
    }
    float _1837 = _1753;
    float _1839 = fma(_1520, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1805);
    float _1841 = _1839;
    if (_1628)
    {
        float _1843 = _1690 * _1833;
        _1692 = _1843;
    }
    float _1845 = _1692;
    float _1847 = _1803;
    if (!_1797)
    {
        float _1849 = floor(_1584);
        _1847 = _1849;
    }
    float _1851 = _1847;
    int _1853 = _1722 + 80;
    uint _1855 = uint(int(uint(_1853) >> uint(2)));
    uint _1857 = uint(int(uint(int(_1855)) >> uint(2)));
    int _1859 = int(_1855) & 3;
    float _1861 = (*spvDescriptorSet0.vp_c15)._m0[int(_1857)][_1859];
    int _1863 = int(_1855) + 1;
    uint _1865 = uint(int(uint(_1863) >> uint(2)));
    int _1867 = _1863 & 3;
    float _1869 = (*spvDescriptorSet0.vp_c15)._m0[int(_1865)][_1867];
    if (_1628)
    {
        float _1871 = _1588 * _1845;
        _1829 = _1871;
    }
    float _1873 = _1829;
    if (!_1797)
    {
        int _1875 = _1626 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1877 = _1875 + _1652;
        _1664 = _1877;
    }
    int _1879 = _1664;
    float _1881 = _1839 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    if (_1628)
    {
        float _1883 = _1586 * _1845;
        _1666 = _1883;
    }
    float _1885 = _1666;
    if (!_1628)
    {
        _1841 = _1594;
    }
    float _1887 = _1841;
    float _1889 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1891 = _1881 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    int _1893 = _1722 + 104;
    uint _1895 = uint(int(uint(_1893) >> uint(2)));
    uint _1897 = uint(int(uint(int(_1895)) >> uint(2)));
    int _1899 = int(_1895) & 3;
    float _1901 = (*spvDescriptorSet0.vp_c15)._m0[int(_1897)][_1899];
    int _1903 = int(_1895) + 1;
    uint _1905 = uint(int(uint(_1903) >> uint(2)));
    int _1907 = _1903 & 3;
    float _1909 = (*spvDescriptorSet0.vp_c15)._m0[int(_1905)][_1907];
    float _1911 = -_1582;
    float _1913 = _1570 + _1911;
    float _1915 = _1887;
    int _1917 = as_type<int>(_1891);
    if (!_1797)
    {
        int _1919 = _1879 << 2;
        _1668 = _1919;
    }
    int _1921 = _1668;
    float _1923 = -_1891;
    float _1925 = fma(_1923, _1889, 1.0);
    if (_1628)
    {
        float _1927 = _1885 * _1885;
        _1670 = _1927;
    }
    float _1929 = _1670;
    int _1931 = as_type<int>(_1929);
    if (_1628)
    {
        float _1933 = _1873 * _1873;
        _1915 = _1933;
    }
    float _1935 = _1915;
    if (!_1797)
    {
        int _1937 = 12 & _1921;
        _1917 = _1937;
    }
    int _1939 = _1917;
    int _1941 = _1722 + 56;
    uint _1943 = uint(int(uint(_1941) >> uint(2)));
    uint _1945 = uint(int(uint(int(_1943)) >> uint(2)));
    int _1947 = int(_1943) & 3;
    float _1949 = (*spvDescriptorSet0.vp_c15)._m0[int(_1945)][_1947];
    int _1951 = int(_1943) + 1;
    uint _1953 = uint(int(uint(_1951) >> uint(2)));
    int _1955 = _1951 & 3;
    float _1957 = (*spvDescriptorSet0.vp_c15)._m0[int(_1953)][_1955];
    float _1959 = fma(_1837, _1837, _1929);
    if (!_1797)
    {
        uint _1961 = uint(int(uint(_1879) >> uint(2)));
        _1931 = int(_1961);
    }
    int _1963 = _1931;
    float _1965 = log2(_1925);
    float _1967 = _1959 + _1935;
    int _1969 = _1722 + 72;
    uint _1971 = uint(int(uint(_1969) >> uint(2)));
    uint _1973 = uint(int(uint(int(_1971)) >> uint(2)));
    int _1975 = int(_1971) & 3;
    float _1977 = (*spvDescriptorSet0.vp_c15)._m0[int(_1973)][_1975];
    int _1979 = int(_1971) + 1;
    uint _1981 = uint(int(uint(_1979) >> uint(2)));
    int _1983 = _1979 & 3;
    float _1985 = (*spvDescriptorSet0.vp_c15)._m0[int(_1981)][_1983];
    float _1987 = _1562 * _1749;
    float _1989 = _1749;
    int _1991 = _1963;
    if (!_1797)
    {
        float _1993 = -_1851;
        float _1995 = _1584 + _1993;
        _1989 = _1995;
    }
    float _1997 = _1989;
    float _1999 = rsqrt(_1967);
    if (!_1797)
    {
        int _2001 = _1963 << 4;
        int _2003 = _2001 + _1939;
        _1991 = _2003;
    }
    int _2005 = _1991;
    float _2007 = fma(_1508, _1741, _1987);
    float _2009 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2011 = fma(_1698, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2009);
    float _2013 = precise::clamp(_2011, 0.0, 1.0);
    int _2015 = _1722 + 88;
    uint _2017 = uint(int(uint(_2015) >> uint(2)));
    uint _2019 = uint(int(uint(int(_2017)) >> uint(2)));
    int _2021 = int(_2017) & 3;
    float _2023 = (*spvDescriptorSet0.vp_c15)._m0[int(_2019)][_2021];
    int _2025 = int(_2017) + 1;
    uint _2027 = uint(int(uint(_2025) >> uint(2)));
    int _2029 = _2025 & 3;
    float _2031 = (*spvDescriptorSet0.vp_c15)._m0[int(_2027)][_2029];
    float _2033 = _1562 * _1787;
    float _2035 = _1965 * 0.693147182464599609375;
    float2 _6081 = float2(_1682, _1913);
    float _2037 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6081, float2(0.0), isnan(_6081)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6081, float2(0.0), isnan(_6081)), level(0.0)).x;
    float _2039 = _2035 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2041 = _1562 * _1825;
    float _2043 = _1999 * _1885;
    float _2045 = fma(_1508, _1817, _2041);
    float _2047 = -_2013;
    float _2049 = _2047 + 1.0;
    float _2051 = _1999 * _1837;
    float _2053 = _2043 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2055 = _1562 * _1869;
    float _2057 = fma(_1508, _1779, _2033);
    float _2059 = _1999 * _1873;
    float _2061 = abs(_2049);
    float _2063 = log2(_2061);
    float _2065 = fma(_1508, _1861, _2055);
    float _2067 = -_2053;
    float _2069 = fma(_2051, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2067);
    float _2071 = _1999;
    float _2073 = _2045;
    if (!_1797)
    {
        int _2075 = _2005 + 400;
        uint _2077 = uint(int(uint(_2075) >> uint(2)));
        uint _2079 = uint(int(uint(int(_2077)) >> uint(2)));
        int _2081 = int(_2077) & 3;
        float _2083 = (*spvDescriptorSet0.vp_c15)._m0[int(_2079)][_2081];
        _2071 = _2083;
    }
    float _2085 = _2071;
    float _2087 = fma(_1538, _1901, _2045);
    float _2089 = -_2059;
    float _2091 = fma(_2089, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2069);
    if (!_1797)
    {
        float _2093 = floor(_1614);
        _2073 = _2093;
    }
    float _2095 = _2073;
    float _2097 = _2087 + _1909;
    float _2099 = fma(_1538, _1949, _2007);
    float _2101 = fma(_2091, -0.5, 0.5);
    float _2103 = fma(_2091, 0.5, 0.5);
    float _2105 = 1.0 / _2097;
    float _2107 = fma(_1538, _1977, _2057);
    float _2109 = sqrt(_2101);
    float _2111 = _2107 + _1985;
    float _2113 = _1512 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2115 = fma(_1538, _2023, _2065);
    float _2117 = _2099 + _1957;
    float _2119 = _1512 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2121 = _1512 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2123 = fma(_1516, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2113);
    float _2125 = _2117 * _2105;
    float _2127 = fma(_1516, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2119);
    float _2129 = fma(_1516, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2121);
    float _2131 = _2111 * _2105;
    float _2133 = fma(_1520, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2123);
    bool _2135 = _2125 >= 0.0;
    float _2137 = fma(_1520, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2127);
    float _2139 = fma(_1520, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2129);
    float _2141 = _2063 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    bool _2143 = _2125 <= 1.0;
    bool _2145 = _2143 && _2135;
    float _2147 = _2137 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2149 = _2139 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2151 = exp2(_2141);
    bool _2153 = _2131 >= 0.0;
    bool _2155 = _2153 && _2145;
    float _2157 = _2147 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2159 = _2133 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2161 = _2115 + _2031;
    bool _2163 = _2131 <= 1.0;
    bool _2165 = _2163 && _2155;
    float _2167 = fma(_2149, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2157);
    float _2169 = _2147 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2171 = _2051 + 1.0;
    float _2173 = fma(_1881, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2167);
    float _2175 = fma(_2149, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2169);
    float _2177 = _2109 * 0.636619746685028076171875;
    float _2179 = _2161 * _2105;
    float _2181 = fma(_2103, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2183 = fma(_2159, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2173);
    float _2185 = -_2051;
    float _2187 = fma(_2151, _2171, _2185);
    float _2189 = fma(_1881, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2175);
    float _2191 = fma(_2103, _2181, -0.212114393711090087890625);
    float _2193 = 1.0 / _2183;
    float _2195 = _2147 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2197 = _2173;
    if (_2165)
    {
        float _2199 = float(_1710);
        _2197 = _2199;
    }
    float _2201 = _2197;
    float _2203 = fma(_2159, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2189);
    float _2205 = fma(_2103, _2191, 1.570728778839111328125);
    float _2207 = fma(_2149, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2195);
    float _2209 = fma(_2187, 0.5, 0.5);
    float _2211 = _2201;
    float _2213 = _2207;
    if (_2165)
    {
        float _2215 = rint(_2201);
        float _2217 = precise::max(_2215, 0.0);
        uint _2219 = uint(_2217);
        uint _2221 = clamp(_2219, 0u, 65535u);
        _2211 = as_type<float>(_2221);
    }
    float _2223 = _2211;
    float _2225 = fma(_1881, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2207);
    float _2227 = -_2205;
    float _2229 = fma(_2177, _2227, 1.0);
    if (!_1797)
    {
        float _2231 = -_2095;
        float _2233 = _1614 + _2231;
        _2213 = _2233;
    }
    float _2235 = _2213;
    float _2237 = fma(_2159, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2225);
    float _2239 = _2203 * _2193;
    float _2241 = _2237 * _2193;
    float _2243 = fma(_2239, 0.5, 0.5);
    float _2245 = fma(_2241, -0.5, 0.5);
    float _2247 = _2241;
    float _2249 = _2235;
    float _2251 = _2237;
    if (!_1797)
    {
        float _2253 = rint(_2085);
        float _2255 = precise::max(_2253, 0.0);
        uint _2257 = uint(_2255);
        uint _2259 = clamp(_2257, 0u, 65535u);
        _2247 = as_type<float>(_2259);
    }
    float _2261 = _2247;
    float _2263 = _2223;
    if (_2165)
    {
        float3 _6467 = float3(_2125, _2131, float(as_type<int>(_2223)));
        float3 _6471 = select(_6467, float3(0.0), isnan(_6467));
        float _2265 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6471.xy, uint(rint(_6471.z)), _2179, level(0.0));
        _2263 = _2265;
    }
    float _2267 = _2263;
    float3 _6481 = float3(_2243, _2245, _2039);
    float _2269 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6481, float3(0.0), isnan(_6481)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6481, float3(0.0), isnan(_6481)), level(0.0)).x;
    float3 _6490 = float3(_2243, _2245, _2039);
    float4 _2272 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6490, float3(0.0), isnan(_6490)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6490, float3(0.0), isnan(_6490)), level(0.0)).xyzw;
    float _2274 = _2272.x;
    float _2276 = _2272.y;
    float _2278 = _2272.z;
    float _2280 = _2272.w;
    float2 _6506 = float2(_2229, _2209);
    float3 _2284 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6506, float2(0.0), isnan(_6506)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6506, float2(0.0), isnan(_6506)), level(0.0)).xyz;
    float _2286 = _2284.x;
    float _2288 = _2284.y;
    float _2290 = _2284.z;
    float _2292 = _2261;
    if (!_1797)
    {
        float3 _6527 = float3(_2235, _1997, float(as_type<int>(_2261)));
        float3 _6529 = select(_6527, float3(0.0), isnan(_6527));
        float _2294 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6529.xy, uint(rint(_6529.z)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6529.xy, uint(rint(_6529.z)), level(0.0)).x;
        _2292 = _2294;
    }
    float _2296 = _2292;
    float _2298 = abs(_1636);
    float _2300 = log2(_2298);
    float _2302 = _2147 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2304 = fma(_2149, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2302);
    float _2306 = fma(_1881, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2304);
    float _2308 = _2063 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2310 = fma(_2159, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2306);
    float _2312 = _2300 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2314 = _2310 + _2183;
    float _2316 = exp2(_2308);
    bool _2318 = _1636 <= 8000.0;
    bool _2320 = isnan(_1636);
    bool _2322 = _2318 || _2320;
    bool _2324 = isnan(8000.0);
    bool _2326 = _2322 || _2324;
    float _2328 = float(_2326);
    float _2330 = _2314 * 0.5;
    if (!_2165)
    {
        _2249 = 1.0;
    }
    float _2332 = _2249;
    float _2334 = exp2(_2312);
    out.m_79.z = _2330;
    out.m_79.w = _2183;
    float _2336 = fma(_2334, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2338 = precise::clamp(_2336, 0.0, 1.0);
    float _2340 = fma(_2338, -2.0, 3.0);
    float _2342 = _2338 * _2338;
    float _2344 = _2342 * _2340;
    float _2346 = -_2344;
    float _2348 = _2346 + 1.0;
    out.gl_Position.x = _2203;
    out.gl_Position.y = _2237;
    out.gl_Position.z = _2310;
    out.gl_Position.w = _2183;
    float _2350 = fma(_2348, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2344);
    float _2352 = -_2316;
    float _2354 = _2352 + 1.0;
    float _2356 = _2328 * _2350;
    float _2358 = _2356 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2360 = _2354 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2362 = _2203;
    float _2364 = _2332;
    float _2366 = _2354;
    float _2368 = _2360;
    if (_1797)
    {
        _2362 = 1.0;
    }
    float _2370 = _2362;
    float _2372 = -_2037;
    float _2374 = _2372 + 1.0;
    float _2376 = _2374 * _2358;
    float _2378 = precise::clamp(_2376, 0.0, 1.0);
    float _2380 = _2370;
    if (_2165)
    {
        bool _2382 = _2267 >= _2179;
        bool _2384 = isnan(_2267);
        bool _2386 = _2382 || _2384;
        bool _2388 = isnan(_2179);
        bool _2390 = _2386 || _2388;
        float _2392 = float(_2390);
        _2364 = _2392;
    }
    float _2394 = _2364;
    if (!_1797)
    {
        int _2396 = _1879 << 4;
        int _2398 = _2396 + 2048;
        uint _2400 = uint(int(uint(_2398) >> uint(2)));
        uint _2402 = uint(int(uint(int(_2400)) >> uint(2)));
        int _2404 = int(_2400) & 3;
        float _2406 = (*spvDescriptorSet0.vp_c15)._m0[int(_2402)][_2404];
        int _2408 = int(_2400) + 1;
        uint _2410 = uint(int(uint(_2408) >> uint(2)));
        int _2412 = _2408 & 3;
        float _2414 = (*spvDescriptorSet0.vp_c15)._m0[int(_2410)][_2412];
        int _2416 = _2398 + 8;
        uint _2418 = uint(int(uint(_2416) >> uint(2)));
        uint _2420 = uint(int(uint(int(_2418)) >> uint(2)));
        int _2422 = int(_2418) & 3;
        float _2424 = (*spvDescriptorSet0.vp_c15)._m0[int(_2420)][_2422];
        int _2426 = int(_2418) + 1;
        uint _2428 = uint(int(uint(_2426) >> uint(2)));
        int _2430 = _2426 & 3;
        float _2432 = (*spvDescriptorSet0.vp_c15)._m0[int(_2428)][_2430];
        float _2434 = _1562 * _2414;
        float _2436 = fma(_1508, _2406, _2434);
        float _2438 = fma(_1538, _2424, _2436);
        float _2440 = _2438 + _2432;
        float _2442 = precise::clamp(_2440, 0.0, 1.0);
        float _2444 = -_2442;
        float _2446 = _2444 + _2296;
        float _2448 = fma(_2446, 500.0, 1.5);
        float _2450 = exp2(_2448);
        float _2452 = 0.0 + _2450;
        float _2454 = precise::clamp(_2452, 0.0, 1.0);
        _2380 = _2454;
        _2366 = _2424;
        _2251 = _2450;
    }
    float _2456 = _2380;
    float _2458 = _2366;
    float _2460 = _2251;
    float _2462 = _2360 * _2269;
    float _2464 = _2394 * _2456;
    float _2466 = -_2378;
    float _2468 = fma(_2466, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2470 = -_2360;
    float _2472 = _2470 + 1.0;
    float _2474 = _2280 * _2462;
    float _2476 = _2290 * _2462;
    float _2478 = -_2464;
    float _2480 = fma(_2478, _2468, 1.0);
    float _2482 = precise::clamp(_2480, 0.0, 1.0);
    bool _2484 = _1698 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2486 = isnan(_1698);
    bool _2488 = _2484 || _2486;
    bool _2490 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2492 = _2488 || _2490;
    float _2494 = fma(_2286, _2474, _2274);
    float _2496 = fma(_2288, _2474, _2276);
    float _2498 = _2482 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2500 = _2280 * _2472;
    float _2502 = fma(_2280, _2476, _2278);
    out.m_81.x = _2498;
    out.m_83.x = _2494;
    out.m_83.y = _2496;
    out.m_83.z = _2502;
    out.m_83.w = _2500;
    float _2504 = _2458;
    float _2506 = _2472;
    float _2508 = _2460;
    float _2510 = _2482;
    if (!_2492)
    {
        _1672 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2512 = _1672;
    float _2514 = _2512;
    float _2516 = _2512;
    if (!_2492)
    {
        _2504 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2518 = _2504;
    float _2520 = _2518;
    float _2522 = _2518;
    if (!_2492)
    {
        _2368 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2524 = _2368;
    float _2526 = _2524;
    float _2528 = _2524;
    if (!_2492)
    {
        _2506 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2530 = _2506;
    float _2532 = _2530;
    float _2534 = _2530;
    if (!_2492)
    {
        _2508 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2536 = _2508;
    float _2538 = _2536;
    float _2540 = _2536;
    if (!_2492)
    {
        _2510 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2542 = _2510;
    bool _2544 = !_2492;
    float _2546 = _2542;
    float _2548 = _2542;
    if (!_2544)
    {
        bool _2550 = _1698 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2552 = isnan(_1698);
        bool _2554 = _2550 || _2552;
        bool _2556 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2558 = _2554 || _2556;
        if (!_2558)
        {
            float _2560 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2562 = _1698 + _2560;
            float _2564 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2566 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2564;
            float _2568 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2570 = _2568 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2572 = 1.0 / _2566;
            float _2574 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2576 = _2574 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2578 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2580 = _2578 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2582 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2584 = _2582 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2586 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2588 = _2586 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2590 = _2562 * _2572;
            float _2592 = precise::clamp(_2590, 0.0, 1.0);
            float _2594 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2596 = _2594 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2598 = fma(_2592, _2570, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2600 = fma(_2592, _2596, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2602 = fma(_2592, _2576, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2604 = fma(_2592, _2580, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2606 = fma(_2592, _2584, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2608 = fma(_2592, _2588, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2522 = _2602;
            _2540 = _2606;
            _2516 = _2598;
            _2534 = _2604;
            _2528 = _2600;
            _2548 = _2608;
            _2610 = true;
        }
        else
        {
            bool _2612 = _1698 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2614 = isnan(_1698);
            bool _2616 = _2612 || _2614;
            bool _2618 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2620 = _2616 || _2618;
            if (!_2620)
            {
                _2514 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2622 = _2514;
            _2516 = _2622;
            if (!_2620)
            {
                _2520 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2624 = _2520;
            _2522 = _2624;
            if (!_2620)
            {
                _2526 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2626 = _2526;
            _2528 = _2626;
            if (!_2620)
            {
                _2532 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2628 = _2532;
            _2534 = _2628;
            if (!_2620)
            {
                _2538 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2630 = _2538;
            _2540 = _2630;
            if (!_2620)
            {
                _2546 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2632 = _2546;
            bool _2634 = !_2620;
            _2548 = _2632;
            if (!_2634)
            {
                bool _2636 = _1698 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2638 = isnan(_1698);
                bool _2640 = _2636 || _2638;
                bool _2642 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2644 = _2640 || _2642;
                if (!_2644)
                {
                    float _2646 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2648 = _1698 + _2646;
                    float _2650 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2652 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2650;
                    float _2654 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2656 = _2654 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2658 = 1.0 / _2652;
                    float _2660 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2662 = _2660 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2664 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2666 = _2664 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2668 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2670 = _2668 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2672 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2674 = _2672 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2676 = _2648 * _2658;
                    float _2678 = precise::clamp(_2676, 0.0, 1.0);
                    float _2680 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2682 = _2680 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2684 = fma(_2678, _2656, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2686 = fma(_2678, _2682, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2688 = fma(_2678, _2662, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2690 = fma(_2678, _2666, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2692 = fma(_2678, _2670, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2694 = fma(_2678, _2674, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2522 = _2688;
                    _2540 = _2692;
                    _2516 = _2684;
                    _2534 = _2690;
                    _2528 = _2686;
                    _2548 = _2694;
                    _2610 = true;
                }
                else
                {
                    _2522 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2540 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2516 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2534 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2528 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2548 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2610 = false;
    float _2696 = _2522;
    float _2698 = _2540;
    float _2700 = _2516;
    float _2702 = _2534;
    float _2704 = _2528;
    float _2706 = _2548;
    float _2708 = fma(_1376, -0.5, 0.5);
    float _2710 = precise::clamp(_2708, 0.0, 1.0);
    float _2712 = -_2696;
    float _2714 = _2712 + _2698;
    float _2716 = -_2700;
    float _2718 = _2716 + _2702;
    float _2720 = -_2704;
    float _2722 = _2720 + _2706;
    bool _2724 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2726 = fma(_2710, _2714, _2696);
    float _2728 = fma(_2710, _2718, _2700);
    float _2730 = fma(_2710, _2722, _2704);
    float _2732 = _2726 * 0.586610972881317138671875;
    out.m_61.x = 1.0;
    float _2734 = fma(_2728, 0.298911988735198974609375, _2732);
    float _2736 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2738 = fma(_2730, 0.114477999508380889892578125, _2734);
    out.m_81.w = _2736;
    float _2740 = -_2738;
    float _2742 = _2728 + _2740;
    float _2744 = -_2738;
    float _2746 = _2726 + _2744;
    float _2748 = -_2738;
    float _2750 = _2730 + _2748;
    out.m_85.x = 0.0;
    float _2752 = fma(_2742, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2738);
    float _2754 = fma(_2746, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2738);
    float _2756 = fma(_2750, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2738);
    out.m_87.x = _2752;
    out.m_87.y = _2754;
    out.m_87.z = _2756;
    if (!_2724)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2758 = -_1512;
    float _2760 = _2758 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2762 = -_1516;
    float _2764 = _2762 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2766 = -_1520;
    float _2768 = _2766 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2770 = _2760 * _2760;
    float _2772 = fma(_2764, _2764, _2770);
    float _2774 = fma(_2768, _2768, _2772);
    float _2776 = sqrt(_2774);
    float _2778 = rsqrt(_2774);
    float _2780 = -_2776;
    float _2782 = _2780 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2784 = _2782 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2786 = precise::clamp(_2784, 0.0, 1.0);
    float _2788 = _2764 * _2778;
    float _2790 = _2760 * _2778;
    float _2792 = abs(_2786);
    float _2794 = log2(_2792);
    float _2796 = _2768 * _2778;
    float _2798 = _2788 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2800 = _1376 * _2790;
    float _2802 = -_2790;
    float _2804 = -_2798;
    float _2806 = fma(_2802, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2804);
    float _2808 = fma(_1374, _2788, _2800);
    float _2810 = -_2796;
    float _2812 = fma(_2810, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2806);
    float _2814 = fma(_1378, _2796, _2808);
    float _2816 = precise::clamp(_2814, 0.0, 1.0);
    float _2818 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2820 = _2812 + _2818;
    float _2822 = _2794 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2824 = _2820 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2826 = precise::clamp(_2824, 0.0, 1.0);
    float _2828 = exp2(_2822);
    float _2830 = _2828 * _2826;
    float _2832 = _2816 * _2830;
    float _2834 = _2832 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2836 = _2832 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2838 = _2832 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_85.x = _2834;
    out.m_85.y = _2836;
    out.m_85.z = _2838;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

