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
    texture2d_array<float> vp_t_tcb_14 [[id(9)]];
    sampler vp_t_tcb_14Smplr [[id(10)]];
    texture2d_array<float> vp_t_tcb_16 [[id(11)]];
    sampler vp_t_tcb_16Smplr [[id(12)]];
    texture3d<float> vp_t_tcb_32 [[id(13)]];
    sampler vp_t_tcb_32Smplr [[id(14)]];
    texture3d<float> vp_t_tcb_30 [[id(15)]];
    sampler vp_t_tcb_30Smplr [[id(16)]];
    texture2d<float> vp_t_tcb_1C [[id(17)]];
    sampler vp_t_tcb_1CSmplr [[id(18)]];
    sampler vp_t_tcb_24Smplr_w [[id(19)]];
    sampler vp_t_tcb_14Smplr_w [[id(20)]];
    sampler vp_t_tcb_32Smplr_w [[id(21)]];
    sampler vp_t_tcb_30Smplr_w [[id(22)]];
    sampler vp_t_tcb_1CSmplr_w [[id(23)]];
    constant dm_border_t* dm_border [[id(24)]];
};

struct main0_out
{
    float4 m_83 [[user(locn0)]];
    float4 m_77 [[user(locn1)]];
    float4 m_81 [[user(locn2)]];
    float4 m_91 [[user(locn3)]];
    float4 m_99 [[user(locn4)]];
    float4 m_61 [[user(locn5)]];
    float4 m_87 [[user(locn6)]];
    float4 m_89 [[user(locn7)]];
    float4 m_85 [[user(locn8)]];
    float4 m_97 [[user(locn9)]];
    float4 m_93 [[user(locn10)]];
    float4 m_95 [[user(locn11)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_75 [[attribute(1)]];
    float4 m_58 [[attribute(2)]];
    float4 m_63 [[attribute(3)]];
    float4 m_71 [[attribute(4)]];
    float4 m_69 [[attribute(5)]];
    float4 m_67 [[attribute(6)]];
    float4 m_65 [[attribute(7)]];
    float4 m_79 [[attribute(8)]];
    float4 m_73 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3364 = false;
    bool _2038 = false;
    bool _878 = false;
    bool _652 = false;
    bool _502 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _113 = in.m_58.w;
    float _115 = trunc(_113);
    int _118 = int(_115);
    bool _122 = _118 >= 1;
    float _124 = 0.0;
    if (!_122)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _126 = _124;
    float _128 = _126;
    if (!_122)
    {
        out.m_61.x = 0.0;
    }
    int _130 = 0;
    if (!_122)
    {
        float _132 = _126 * 5.0;
        _130 = as_type<int>(_132);
    }
    int _134 = _130;
    int _136 = _134;
    if (!_122)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3663 = as_type<float>(_134);
        out.gl_Position.z = _3663;
    }
    if (!_122)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _138 = in.m_63.w;
    bool _140 = _138 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _142 = isnan(_138);
    bool _144 = _140 || _142;
    bool _146 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _148 = _144 || _146;
    float _150 = -_138;
    float _152 = _150 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _154 = 0.0;
    float _156 = 0.0;
    float _158 = _152;
    if (_148)
    {
        float _160 = float(_118);
        _128 = _160;
    }
    float _162 = _128;
    bool _164 = _152 >= _162;
    bool _166 = !_148;
    bool _168 = _164 || _166;
    float _170 = _162;
    if (_168)
    {
        _170 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _172 = _170;
    if (_168)
    {
        out.m_61.x = 0.0;
    }
    if (_168)
    {
        float _174 = _172 * 5.0;
        _136 = as_type<int>(_174);
    }
    int _176 = _136;
    float _178 = as_type<float>(_176);
    if (_168)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3735 = as_type<float>(_176);
        out.gl_Position.z = _3735;
    }
    if (_168)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _180 = in.m_63.x;
    float _182 = in.m_63.y;
    float _184 = in.m_63.z;
    float _186 = _152 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _188 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _190 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _192 = _188 || _190;
    bool _194 = isnan(1.0);
    bool _196 = _192 || _194;
    float _198 = _186;
    if (!_196)
    {
        float _200 = _186 * _186;
        float _202 = _200 * 0.5;
        _178 = _202;
    }
    float _204 = _178;
    float _206 = 0.0;
    float _208 = _204;
    if (!_196)
    {
        float _210 = _152 * _152;
        float _212 = _210 * 0.5;
        _206 = _212;
    }
    float _214 = _206;
    if (!_196)
    {
        float _216 = _204 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _208 = _216;
    }
    float _218 = _208;
    bool _220 = !_196;
    float _222 = _218;
    if (!_220)
    {
        float _224 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _226 = log2(_224);
        float _228 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _230 = _228 + 1.0;
        float _232 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _234 = _186 * _226;
        float _236 = 1.0 / _230;
        float _238 = _232 * 0.693147182464599609375;
        float _240 = exp2(_234);
        float _242 = 1.0 / _238;
        float _244 = _240 + (-1.0);
        float _246 = -_244;
        float _248 = fma(_246, _242, _186);
        float _250 = _248 * _236;
        float _252 = _250 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _154 = _238;
        _222 = _252;
        _156 = _240;
    }
    float _254 = _154;
    float _256 = _222;
    float _258 = _156;
    bool _260 = !_196;
    float _262 = _254;
    float _264 = _258;
    if (!_260)
    {
        float _266 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _268 = log2(_266);
        float _270 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _272 = _270 + 1.0;
        float _274 = 1.0 / _272;
        float _276 = _186 * _268;
        float _278 = exp2(_276);
        float _280 = -_278;
        float _282 = _280 + 1.0;
        float _284 = _282 * _274;
        _262 = _278;
        _264 = _272;
        _198 = _284;
    }
    float _286 = _262;
    float _288 = _264;
    float _290 = _198;
    float _292 = _288;
    float _294 = _286;
    if (!_196)
    {
        _292 = _152;
    }
    float _296 = _292;
    float _298 = _256 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _300 = _296;
    if (!_196)
    {
        float _302 = _214 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _294 = _302;
    }
    float _304 = _294;
    bool _306 = !_196;
    float _308 = _304;
    if (!_306)
    {
        float _310 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _312 = log2(_310);
        float _314 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _316 = _152 * _312;
        float _318 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _320 = _318 + 1.0;
        float _322 = 1.0 / _320;
        float _324 = _314 * 0.693147182464599609375;
        float _326 = exp2(_316);
        float _328 = 1.0 / _324;
        float _330 = _326 + (-1.0);
        float _332 = -_330;
        float _334 = fma(_332, _328, _152);
        float _336 = _334 * _322;
        float _338 = _336 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _308 = _338;
    }
    float _340 = _308;
    bool _342 = !_196;
    if (!_342)
    {
        float _344 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _346 = log2(_344);
        float _348 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _350 = _348 + 1.0;
        float _352 = 1.0 / _350;
        float _354 = _152 * _346;
        float _356 = exp2(_354);
        float _358 = -_356;
        float _360 = _358 + 1.0;
        float _362 = _360 * _352;
        _300 = _362;
    }
    float _364 = _300;
    float _366 = _340 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _368 = fma(_290, _182, _298);
    float _370 = _256 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _372 = _340 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _374 = fma(_364, _182, _366);
    float _376 = _256 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _378 = _340 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _380 = fma(_290, _180, _370);
    float _382 = fma(_364, _180, _372);
    float _384 = -_374;
    float _386 = _368 + _384;
    float _388 = fma(_290, _184, _376);
    float _390 = fma(_364, _184, _378);
    float _392 = -_382;
    float _394 = _380 + _392;
    float _396 = _386 * _386;
    float _398 = in.m_65.w;
    float _400 = -_390;
    float _402 = _388 + _400;
    float _404 = _386 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _406 = fma(_394, _394, _396);
    float _408 = _386 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _410 = _386 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _412 = fma(_394, (*spvDescriptorSet0.vp_c10)._m0[4].x, _404);
    float _414 = fma(_402, _402, _406);
    float _416 = fma(_394, (*spvDescriptorSet0.vp_c10)._m0[5].x, _408);
    float _418 = in.m_58.x;
    float _420 = in.m_58.y;
    float _422 = in.m_58.z;
    float _424 = fma(_394, (*spvDescriptorSet0.vp_c10)._m0[6].x, _410);
    float _426 = fma(_402, (*spvDescriptorSet0.vp_c10)._m0[4].z, _412);
    float _428 = sqrt(_414);
    float _430 = fma(_402, (*spvDescriptorSet0.vp_c10)._m0[6].z, _424);
    float _432 = fma(_402, (*spvDescriptorSet0.vp_c10)._m0[5].z, _416);
    bool _434 = _428 >= 9.9999999747524270787835121154785e-07;
    bool _436 = isnan(_428);
    bool _438 = _434 || _436;
    bool _440 = isnan(9.9999999747524270787835121154785e-07);
    bool _442 = _438 || _440;
    float _444 = fma(_380, _398, _418);
    float _446 = fma(_388, _398, _422);
    float _448 = fma(_368, _398, _420);
    float _450 = _380;
    float _452 = _388;
    float _454 = _432;
    if (_442)
    {
        _450 = _426;
    }
    float _456 = _450;
    float _458 = _456;
    if (_442)
    {
        _452 = _430;
    }
    float _460 = _452;
    float _462 = _460;
    if (!_442)
    {
        bool _464 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _466 = !_464;
        if (!_466)
        {
            float _468 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _470 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _472 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _474 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _468);
            float _476 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _470);
            float _478 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _472);
            float _480 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _474);
            float _482 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _476);
            float _484 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _478);
            float _486 = _480 * _480;
            float _488 = fma(_482, _482, _486);
            float _490 = fma(_484, _484, _488);
            float _492 = rsqrt(_490);
            float _494 = _492 * 9.9999999747524270787835121154785e-07;
            float _496 = _482 * _494;
            float _498 = _480 * _494;
            float _500 = _484 * _494;
            _454 = _498;
            _458 = _496;
            _462 = _500;
            _502 = true;
        }
        else
        {
            float _504 = _182 * _182;
            float _506 = fma(_180, _180, _504);
            float _508 = fma(_184, _184, _506);
            float _510 = sqrt(_508);
            bool _512 = _510 >= 9.9999999747524270787835121154785e-07;
            bool _514 = isnan(_510);
            bool _516 = _512 || _514;
            bool _518 = isnan(9.9999999747524270787835121154785e-07);
            bool _520 = _516 || _518;
            if (!_520)
            {
                float _522 = _420 * _420;
                float _524 = fma(_418, _418, _522);
                float _526 = fma(_422, _422, _524);
                float _528 = sqrt(_526);
                bool _530 = _528 >= 9.9999999747524270787835121154785e-07;
                bool _532 = isnan(_528);
                bool _534 = _530 || _532;
                bool _536 = isnan(9.9999999747524270787835121154785e-07);
                bool _538 = _534 || _536;
                if (!_538)
                {
                    float _540 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _542 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _540);
                    float _544 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _542);
                    float _546 = rsqrt(_544);
                    float _548 = _546 * 9.9999999747524270787835121154785e-07;
                    float _550 = _548 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _552 = _548 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _554 = _548 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _454 = _552;
                    _458 = _550;
                    _462 = _554;
                    _502 = true;
                }
                else
                {
                    float _556 = _420 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _558 = _420 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _560 = _420 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _562 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[5].x, _556);
                    float _564 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[4].x, _558);
                    float _566 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[6].x, _560);
                    float _568 = fma(_422, (*spvDescriptorSet0.vp_c10)._m0[5].z, _562);
                    float _570 = fma(_422, (*spvDescriptorSet0.vp_c10)._m0[4].z, _564);
                    float _572 = fma(_422, (*spvDescriptorSet0.vp_c10)._m0[6].z, _566);
                    float _574 = _568 * _568;
                    float _576 = fma(_570, _570, _574);
                    float _578 = fma(_572, _572, _576);
                    float _580 = rsqrt(_578);
                    float _582 = _580 * 9.9999999747524270787835121154785e-07;
                    float _584 = _570 * _582;
                    float _586 = _568 * _582;
                    float _588 = _572 * _582;
                    _454 = _586;
                    _458 = _584;
                    _462 = _588;
                    _502 = true;
                }
            }
            else
            {
                float _590 = _182 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _592 = _182 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _594 = _182 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _596 = fma(_180, (*spvDescriptorSet0.vp_c10)._m0[5].x, _590);
                float _598 = fma(_180, (*spvDescriptorSet0.vp_c10)._m0[4].x, _592);
                float _600 = fma(_180, (*spvDescriptorSet0.vp_c10)._m0[6].x, _594);
                float _602 = fma(_184, (*spvDescriptorSet0.vp_c10)._m0[5].z, _596);
                float _604 = fma(_184, (*spvDescriptorSet0.vp_c10)._m0[4].z, _598);
                float _606 = fma(_184, (*spvDescriptorSet0.vp_c10)._m0[6].z, _600);
                float _608 = _602 * _602;
                float _610 = fma(_604, _604, _608);
                float _612 = fma(_606, _606, _610);
                float _614 = rsqrt(_612);
                float _616 = _614 * 9.9999999747524270787835121154785e-07;
                float _618 = _604 * _616;
                float _620 = _602 * _616;
                float _622 = _606 * _616;
                _454 = _620;
                _458 = _618;
                _462 = _622;
            }
        }
    }
    _502 = false;
    float _624 = _454;
    float _626 = _458;
    float _628 = _462;
    bool _630 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _632 = !_630;
    float _650;
    if (!_632)
    {
        float _634 = in.m_67.x;
        float _636 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _638 = _634 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _640 = fma(_638, (*spvDescriptorSet0.vp_c9)._m0[12].x, _152);
        float _642 = _640 * _636;
        float _644 = floor(_642);
        float _646 = -_644;
        float _648 = _642 + _646;
        _650 = _648;
        _652 = true;
    }
    else
    {
        float _654 = float(_118);
        float _656 = 1.0 / _654;
        float _658 = _152 * _656;
        _650 = _658;
    }
    _652 = false;
    float _660 = _650;
    float _662 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _664 = _660 + _662;
    float _666 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _668 = _660 + _666;
    bool _670 = _660 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _672 = isnan(_660);
    bool _674 = _670 || _672;
    bool _676 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _678 = _674 || _676;
    float _680 = float(_678);
    float _682 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _684 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _682;
    float _686 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _688 = _660 + _686;
    float _690 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _692 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _690;
    float _694 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _696 = _694 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _698 = 1.0 / _684;
    bool _700 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _702 = 1.0 / _696;
    float _704 = 1.0 / _692;
    float _706 = _664 * _698;
    bool _708 = _660 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _710 = isnan(_660);
    bool _712 = _708 || _710;
    bool _714 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _716 = _712 || _714;
    float _718 = float(_716);
    float _720 = -_680;
    float _722 = _720 + 1.0;
    float _724 = _718 * _722;
    float _726 = _668 * _702;
    bool _728 = _660 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _730 = isnan(_660);
    bool _732 = _728 || _730;
    bool _734 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _736 = _732 || _734;
    float _738 = float(_736);
    float _740 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _742 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _740;
    bool _744 = _660 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _746 = isnan(_660);
    bool _748 = _744 || _746;
    bool _750 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _752 = _748 || _750;
    float _754 = float(_752);
    float _756 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _758 = _756 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _760 = -_718;
    float _762 = _760 + 1.0;
    float _764 = -_738;
    float _766 = _764 + 1.0;
    float _768 = _688 * _704;
    float _770 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _772 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _770;
    float _774 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _776 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _774;
    float _778 = _754 * _766;
    float _780 = fma(_742, _768, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _782 = fma(_772, _768, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _784 = fma(_776, _768, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _786 = _738 * _762;
    float _788 = -_754;
    float _790 = _788 + 1.0;
    float _792 = _782 * _778;
    float _794 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _796 = _794 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _798 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _800 = _798 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _802 = _784 * _778;
    float _804 = _780 * _778;
    float _806 = fma(_790, (*spvDescriptorSet0.vp_c9)._m0[143].x, _792);
    float _808 = fma(_790, (*spvDescriptorSet0.vp_c9)._m0[143].y, _802);
    float _810 = fma(_790, (*spvDescriptorSet0.vp_c9)._m0[143].z, _804);
    float _812 = fma(_758, _726, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _814 = fma(_796, _726, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _816 = fma(_800, _726, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _818 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _820 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _818;
    float _822 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _824 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _822;
    float _826 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _828 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _826;
    float _830 = fma(_812, _786, _806);
    float _832 = fma(_820, _706, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _834 = fma(_824, _706, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _836 = fma(_828, _706, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _838 = fma(_814, _786, _808);
    float _840 = fma(_816, _786, _810);
    float _842 = fma(_832, _724, _830);
    float _844 = fma(_834, _724, _838);
    float _846 = fma(_836, _724, _840);
    float _848 = fma(_680, (*spvDescriptorSet0.vp_c9)._m0[146].x, _842);
    float _850 = fma(_680, (*spvDescriptorSet0.vp_c9)._m0[146].y, _844);
    float _852 = fma(_680, (*spvDescriptorSet0.vp_c9)._m0[146].z, _846);
    bool _854 = !_700;
    float _856 = _852;
    float _858 = _850;
    float _876;
    if (!_854)
    {
        float _860 = in.m_67.x;
        float _862 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _864 = _860 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _866 = fma(_864, (*spvDescriptorSet0.vp_c9)._m0[11].y, _152);
        float _868 = _866 * _862;
        float _870 = floor(_868);
        float _872 = -_870;
        float _874 = _868 + _872;
        _876 = _874;
        _878 = true;
    }
    else
    {
        float _880 = float(_118);
        float _882 = 1.0 / _880;
        float _884 = _152 * _882;
        _876 = _884;
    }
    _878 = false;
    float _886 = _876;
    float _888 = in.m_69.x;
    float _890 = in.m_69.y;
    float _892 = in.m_69.z;
    float _894 = _448 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _896 = _448 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _898 = _448 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _900 = in.m_65.x;
    float _902 = in.m_65.y;
    float _904 = in.m_65.z;
    float _906 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _908 = log2(_906);
    float _910 = fma(_444, (*spvDescriptorSet0.vp_c10)._m0[5].x, _896);
    float _912 = fma(_444, (*spvDescriptorSet0.vp_c10)._m0[6].x, _898);
    float _914 = in.m_71.x;
    float _916 = in.m_71.y;
    float _918 = in.m_71.z;
    float _920 = fma(_444, (*spvDescriptorSet0.vp_c10)._m0[4].x, _894);
    float _922 = in.m_73.y;
    int _924 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _926 = _924 != 0;
    float _928 = fma(_446, (*spvDescriptorSet0.vp_c10)._m0[5].z, _910);
    int _930 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _932 = _930 != 0;
    float _934 = in.m_67.y;
    float _936 = fma(_446, (*spvDescriptorSet0.vp_c10)._m0[4].z, _920);
    float _938 = fma(_446, (*spvDescriptorSet0.vp_c10)._m0[6].z, _912);
    float _940 = in.m_67.x;
    float _942 = _928 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _944 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _888);
    bool _946 = _890 != 0.0;
    bool _948 = isnan(_890);
    bool _950 = _946 || _948;
    bool _952 = isnan(0.0);
    bool _954 = _950 || _952;
    float _956 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _890);
    float _958 = _848 * _900;
    bool _960 = _888 == 0.0;
    bool _962 = !_954;
    bool _964 = _960 && _962;
    float _966 = _850 * _902;
    float _968 = _936 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _970 = _892 == 0.0;
    bool _972 = _970 && _964;
    float _974 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _976 = _974 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _978 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _980 = _978 != 0;
    int _982 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _984 = _982 != 0;
    int _986 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _988 = _986 != 0;
    float _990 = _852 * _904;
    float _992 = 1.0 / _976;
    bool _994 = _934 > 0.5;
    float _996 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _998 = _996 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1000 = !_984;
    int _1002 = _1000 ? 0 : 1;
    float _1004 = _900;
    float _1006 = _894;
    float _1008 = _922;
    if (_972)
    {
        _1004 = _916;
    }
    float _1010 = _1004;
    float _1012 = 1.0 / _998;
    float _1014 = 0.0;
    float _1016 = _1010;
    if (_972)
    {
        _1014 = _918;
    }
    float _1018 = _1014;
    float _1020 = _1018;
    if (_972)
    {
        _1006 = _1010;
    }
    float _1022 = _1006;
    float _1024 = _1022;
    if (!_972)
    {
        _1016 = _916;
    }
    float _1026 = _1016;
    float _1028 = in.m_67.z;
    if (_972)
    {
        _856 = _914;
    }
    float _1030 = _856;
    float _1032 = _1030;
    if (!_972)
    {
        float _1034 = fma(_888, (*spvDescriptorSet0.vp_c9)._m0[17].y, _914);
        _1032 = _1034;
    }
    float _1036 = _1032;
    if (_972)
    {
        _858 = _1018;
    }
    float _1038 = _858;
    float _1040 = _1038;
    if (!_972)
    {
        float _1042 = fma(_890, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1026);
        _1024 = _1042;
    }
    float _1044 = _1024;
    if (!_972)
    {
        _1020 = _918;
    }
    float _1046 = _1020;
    float _1048 = _908 * _152;
    float _1050 = -_922;
    float _1052 = _1050 + 1.0;
    float _1054 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _892);
    float _1056 = exp2(_1048);
    if (!_972)
    {
        float _1058 = fma(_892, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1046);
        _1040 = _1058;
    }
    float _1060 = _1040;
    if (_932)
    {
        float _1062 = _994 ? _1052 : _922;
        _1008 = _1062;
    }
    float _1064 = _1008;
    float _1066 = _940 * 2.0;
    float _1068 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1070 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1068;
    bool _1072 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1074 = isnan(0.0);
    bool _1076 = _1072 || _1074;
    bool _1078 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1080 = _1076 || _1078;
    float _1082 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1084 = _1082 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1086 = floor(_1066);
    float _1088 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1090 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1092 = 1.0 + _1090;
    float _1094 = _1070 * _992;
    bool _1096 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1098 = isnan(1.0);
    bool _1100 = _1096 || _1098;
    bool _1102 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1104 = _1100 || _1102;
    float _1106 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1088);
    float _1108 = _1028 * 2.0;
    float _1110 = 1.0 / _1092;
    float _1112 = _934 + _1028;
    float _1114 = -_1056;
    float _1116 = _1114 + 1.0;
    float _1118 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1106);
    float _1120 = _1084 * _1012;
    float _1122 = _1112 + (-1.0);
    int _1124 = abs(_1002);
    float _1126 = _1080 ? _1116 : 0.0;
    float _1128 = _940 + _1028;
    bool _1130 = _1086 > 0.0;
    float _1132 = floor(_1108);
    bool _1134 = _1086 >= 0.0;
    bool _1136 = isnan(_1086);
    bool _1138 = _1134 || _1136;
    bool _1140 = isnan(0.0);
    bool _1142 = _1138 || _1140;
    float _1144 = _1128 + (-1.0);
    float _1146 = fma(_1122, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1148 = _934 * 2.0;
    int _1150 = _1142 ? 0 : 1;
    float _1152 = fma(_1144, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1154 = _624 * _624;
    float _1156 = _1146;
    if (_1104)
    {
        float _1158 = _1126 * _1110;
        _158 = _1158;
    }
    float _1160 = _158;
    int _1162 = ~_1150;
    int _1164 = _1162 + 1;
    int _1166 = _1164 + 1;
    float _1168 = rsqrt(_1118);
    float _1170 = fma(_626, _626, _1154);
    bool _1172 = _886 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1174 = isnan(_886);
    bool _1176 = _1172 || _1174;
    bool _1178 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1180 = _1176 || _1178;
    float _1182 = float(_1180);
    float _1184 = _1028 + (-0.5);
    int _1186 = _1166;
    if (!_1130)
    {
        int _1188 = ~_1150;
        int _1190 = _1188 + 1;
        _1186 = _1190;
    }
    int _1192 = _1186;
    float _1194 = fma(_628, _628, _1170);
    float _1196 = _940 + _934;
    bool _1198 = _886 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1200 = isnan(_886);
    bool _1202 = _1198 || _1200;
    bool _1204 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1206 = _1202 || _1204;
    float _1208 = float(_1206);
    float _1210 = floor(_1148);
    bool _1212 = _1132 > 0.0;
    float _1214 = _1196 + (-1.0);
    bool _1216 = _1132 >= 0.0;
    bool _1218 = isnan(_1132);
    bool _1220 = _1216 || _1218;
    bool _1222 = isnan(0.0);
    bool _1224 = _1220 || _1222;
    float _1226 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1228 = _886 + _1226;
    bool _1230 = _886 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1232 = isnan(_886);
    bool _1234 = _1230 || _1232;
    bool _1236 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1238 = _1234 || _1236;
    float _1240 = float(_1238);
    float _1242 = -_1208;
    float _1244 = _1242 + 1.0;
    float _1246 = rsqrt(_1194);
    float _1248 = -_1182;
    float _1250 = _1248 + 1.0;
    float _1252 = fma(_1094, _1228, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1254 = _1240 * _1244;
    int _1256 = _1224 ? 0 : 1;
    float _1258 = _1208 * _1250;
    float _1260 = fma(_1214, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1262 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1264 = _886 + _1262;
    bool _1266 = _1210 > 0.0;
    float _1268 = _934 + (-0.5);
    bool _1270 = _1210 >= 0.0;
    bool _1272 = isnan(_1210);
    bool _1274 = _1270 || _1272;
    bool _1276 = isnan(0.0);
    bool _1278 = _1274 || _1276;
    float _1280 = fma(_1120, _1264, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1282 = _1168 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1284 = _1252 * _1254;
    float _1286 = -_1240;
    float _1288 = _1286 + 1.0;
    int _1290 = _1278 ? 0 : 1;
    float _1292 = _1246 * _626;
    float _1294 = _1168 * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1296 = _1282 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1298 = _1246 * _624;
    float _1300 = fma(_1288, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1284);
    float _1302 = _1246 * _628;
    float _1304 = fma(_1294, (*spvDescriptorSet0.vp_c10)._m0[8].y, _1296);
    float _1306 = _1298 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1308 = _1168 * (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1310 = float(_1192);
    float _1312 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1314 = _942 + _1312;
    float _1316 = float(_1124);
    float _1318 = fma(_1292, (*spvDescriptorSet0.vp_c10)._m0[8].y, _1306);
    int _1320 = ~_1256;
    int _1322 = _1320 + 1;
    int _1324 = _1322 + 1;
    float _1326 = _1314 * _1314;
    int _1328 = _1324;
    float _1330 = _1260;
    if (!_1212)
    {
        int _1332 = ~_1256;
        int _1334 = _1332 + 1;
        _1328 = _1334;
    }
    int _1336 = _1328;
    float _1338 = fma(_1302, (*spvDescriptorSet0.vp_c10)._m0[10].y, _1318);
    float _1340 = _1316 * _1310;
    bool _1342 = !_980;
    int _1344 = _1342 ? 0 : 1;
    float _1346 = in.m_75.z;
    int _1348 = ~_1290;
    int _1350 = _1348 + 1;
    int _1352 = _1350 + 1;
    float _1354 = fma(_1308, (*spvDescriptorSet0.vp_c10)._m0[10].y, _1304);
    float _1356 = abs(_1338);
    bool _1358 = _1356 > 0.99989998340606689453125;
    float _1360 = _938 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1362 = !_988;
    int _1364 = _1362 ? 0 : 1;
    float _1366 = in.m_75.x;
    int _1368 = abs(_1344);
    float _1370 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1372 = _968 + _1370;
    int _1374 = _1352;
    if (!_1266)
    {
        int _1376 = ~_1290;
        int _1378 = _1376 + 1;
        _1374 = _1378;
    }
    int _1380 = _1374;
    float _1382 = _1340 * (-2.0);
    float _1384 = in.m_75.y;
    int _1386 = abs(_1364);
    float _1388 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1390 = _1360 + _1388;
    float _1392 = fma(_1372, _1372, _1326);
    float _1394 = float(_1380);
    float _1396 = fma(_1354, 1.57079637050628662109375, -1.57079637050628662109375);
    float _1398 = fma(_1390, _1390, _1392);
    float _1400 = float(_1368);
    float _1402 = float(_1386);
    float _1404 = float(_1336);
    float _1406 = rsqrt(_1398);
    bool _1408 = _940 > 0.5;
    bool _1410 = _1408 && _926;
    float _1412 = _1402 * _1394;
    float _1414 = _1400 * _1404;
    float _1416 = _940 + (-0.5);
    float _1418 = _1412 * (-2.0);
    float _1420 = _1396 + _1366;
    float _1422 = _1396;
    if (!_1358)
    {
        _1422 = (*spvDescriptorSet0.vp_c10)._m0[8].y;
    }
    float _1424 = _1422;
    float _1426 = fma(_1152, _1418, _1152);
    float _1428 = fma(_1382, _1384, _1384);
    float _1430 = fma(_1146, _1382, _1146);
    float _1432 = fma(_1418, _1346, _1346);
    float _1434 = _1424;
    if (_1358)
    {
        _1156 = 0.001000000047497451305389404296875;
    }
    float _1436 = _1156;
    float _1438 = fma(_1268, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1428);
    float _1440 = _1314 * _1406;
    float _1442 = _1372 * _1406;
    float _1444 = fma(_1184, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1432);
    float _1446 = fma(_1430, _1160, _1438);
    float _1448 = -_1440;
    float _1450 = fma(_1448, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1314);
    float _1452 = _1440;
    if (_1358)
    {
        float _1454 = fma(_1436, (*spvDescriptorSet0.vp_c10)._m0[8].z, (*spvDescriptorSet0.vp_c10)._m0[8].y);
        _1434 = _1454;
    }
    float _1456 = _1434;
    float _1458 = -_1442;
    float _1460 = fma(_1458, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1372);
    float _1462 = _1446 * 0.15915493667125701904296875;
    float _1464 = _1450 * _1450;
    float _1466 = _1414 * (-2.0);
    float _1468 = _1390 * _1406;
    float _1470 = fma(_1426, _1160, _1444);
    float _1472 = fma(_1260, _1466, _1260);
    float _1474 = fma(_1420, _1466, _1420);
    float _1476 = fma(_1460, _1460, _1464);
    float _1478 = in.m_73.x;
    float _1480 = _1462 * 6.283185482025146484375;
    float _1482 = sin(_1480);
    float _1484 = fma(_1416, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1474);
    float _1486 = -_1468;
    float _1488 = fma(_1486, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1390);
    float _1490 = _1464;
    float _1492 = _1456;
    if (!_1358)
    {
        _1330 = (*spvDescriptorSet0.vp_c10)._m0[10].y;
    }
    float _1494 = _1330;
    float _1496 = _1494;
    if (_1358)
    {
        float _1498 = fma(_1436, (*spvDescriptorSet0.vp_c10)._m0[10].z, (*spvDescriptorSet0.vp_c10)._m0[10].y);
        _1496 = _1498;
    }
    float _1500 = _1496;
    float _1502 = fma(_1472, _1160, _1484);
    if (!_1358)
    {
        _1490 = (*spvDescriptorSet0.vp_c10)._m0[9].y;
    }
    float _1504 = _1490;
    float _1506 = -_1456;
    float _1508 = _1302 * _1506;
    float _1510 = _1462 * 6.283185482025146484375;
    float _1512 = cos(_1510);
    float _1514 = fma(_1488, _1488, _1476);
    float _1516 = _1502 * 0.15915493667125701904296875;
    float _1518 = -_1500;
    float _1520 = _1298 * _1518;
    float _1522 = -_1500;
    float _1524 = -_1508;
    float _1526 = fma(_1292, _1522, _1524);
    float _1528 = _1470 * 0.15915493667125701904296875;
    float _1530 = sqrt(_1514);
    float _1532 = _1504;
    if (_1358)
    {
        float _1534 = fma(_1436, (*spvDescriptorSet0.vp_c10)._m0[9].z, (*spvDescriptorSet0.vp_c10)._m0[9].y);
        _1532 = _1534;
    }
    float _1536 = _1532;
    float _1538 = _1516 * 6.283185482025146484375;
    float _1540 = sin(_1538);
    float _1542 = -_1536;
    float _1544 = _1292 * _1542;
    float _1546 = -_1536;
    float _1548 = -_1520;
    float _1550 = fma(_1302, _1546, _1548);
    float _1552 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1554 = _1526 * _1526;
    float _1556 = -_1456;
    float _1558 = -_1544;
    float _1560 = fma(_1298, _1556, _1558);
    float _1562 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1564 = _1516 * 6.283185482025146484375;
    float _1566 = cos(_1564);
    float _1568 = fma(_1550, _1550, _1554);
    float _1570 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1572 = _1478;
    if (_926)
    {
        _1492 = _1478;
    }
    float _1574 = _1492;
    float _1576 = _1562 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1578 = fma(_1560, _1560, _1568);
    float _1580 = _1552 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1582 = _1570 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1584 = _1528 * 6.283185482025146484375;
    float _1586 = cos(_1584);
    float _1588 = _1574;
    if (_1410)
    {
        float _1590 = -_1574;
        float _1592 = _1590 + 1.0;
        _1588 = _1592;
    }
    float _1594 = _1588;
    float _1596 = fma(_1280, _1258, _1300);
    float _1598 = _1406 * _1530;
    out.m_77.x = _1576;
    out.m_77.y = _1580;
    out.m_77.z = _1582;
    if (_926)
    {
        _1572 = _1594;
    }
    float _1600 = _1572;
    float _1602 = _1540 * _1482;
    float _1604 = _1528 * 6.283185482025146484375;
    float _1606 = sin(_1604);
    float _1608 = _1566 * _1512;
    float _1610 = _1566 * _1482;
    float _1612 = fma(_1182, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1596);
    float _1614 = rsqrt(_1578);
    float _1616 = _958 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1618 = _1512 * _1586;
    float _1620 = _1540 * _1512;
    float _1622 = _1482 * _1586;
    float _1624 = _1566 * _1586;
    float _1626 = _1540 * _1586;
    float _1628 = _1598 * _1616;
    float _1630 = fma(_1606, _1608, _1602);
    float _1632 = fma(_1606, _1602, _1608);
    float _1634 = _966 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1636 = _990 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1638 = -_1610;
    float _1640 = fma(_1606, _1620, _1638);
    float _1642 = -_1620;
    float _1644 = fma(_1606, _1610, _1642);
    float _1646 = _1598 * _1634;
    float _1648 = _1292 * _1624;
    float _1650 = _1550 * _1614;
    float _1652 = _944 * _1628;
    float _1654 = _1598 * _1636;
    float _1656 = _1526 * _1614;
    float _1658 = _1560 * _1614;
    float _1660 = _956 * _1646;
    float _1662 = _1054 * _1654;
    float _1664 = _1302 * _1624;
    float _1666 = in.m_79.x;
    float _1668 = in.m_79.y;
    float _1670 = in.m_79.z;
    float _1672 = in.m_79.w;
    float _1674 = -_1606;
    float _1676 = fma(_1674, _1650, _1648);
    float _1678 = _1630 * _1292;
    float _1680 = -_1606;
    float _1682 = fma(_1680, _1658, _1664);
    float _1684 = _1630 * _1302;
    float _1686 = _1298 * _1658;
    float _1688 = _1292 * _1656;
    float _1690 = _1292 * _1644;
    float _1692 = fma(_1618, _1650, _1678);
    float _1694 = fma(_1618, _1658, _1684);
    float _1696 = -_1686;
    float _1698 = fma(_1302, _1656, _1696);
    float _1700 = -_1688;
    float _1702 = fma(_1298, _1650, _1700);
    float _1704 = _1302 * _1644;
    float _1706 = fma(_1622, _1650, _1690);
    float _1708 = fma(_1626, _1698, _1676);
    float _1710 = fma(_1626, _1702, _1682);
    float _1712 = fma(_1622, _1658, _1704);
    float _1714 = fma(_1640, _1698, _1692);
    float _1716 = _1660 * _1708;
    float _1718 = fma(_1640, _1702, _1694);
    float _1720 = _1660 * _1710;
    float _1722 = fma(_1632, _1698, _1706);
    float _1724 = fma(_1632, _1702, _1712);
    float _1726 = fma(_1652, _1714, _1716);
    float _1728 = fma(_1652, _1718, _1720);
    float _1730 = _1670 * _914;
    float _1732 = _1666 * _1026;
    float _1734 = fma(_1662, _1722, _1726);
    float _1736 = fma(_1662, _1724, _1728);
    float _1738 = -_1730;
    float _1740 = fma(_1666, _1046, _1738);
    float _1742 = _1668 * _1046;
    float _1744 = _968 + _1734;
    float _1746 = _1360 + _1736;
    float _1748 = -_1732;
    float _1750 = fma(_1668, _914, _1748);
    float _1752 = -_1742;
    float _1754 = fma(_1670, _1026, _1752);
    float _1756 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1758 = _1744 + _1756;
    float _1760 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1762 = _1746 + _1760;
    float _1764 = _1298 * _1624;
    float _1766 = _1302 * _1650;
    float _1768 = _1758 * _1758;
    float _1770 = _1762 * _1762;
    float _1772 = -_1606;
    float _1774 = fma(_1772, _1656, _1764);
    float _1776 = _1630 * _1298;
    float _1778 = -_1766;
    float _1780 = fma(_1292, _1658, _1778);
    float _1782 = _1768 + _1770;
    float _1784 = _1298 * _1644;
    float _1786 = fma(_1618, _1656, _1776);
    float _1788 = fma(_1626, _1780, _1774);
    float _1790 = sqrt(_1782);
    float _1792 = fma(_1622, _1656, _1784);
    float _1794 = fma(_1640, _1780, _1786);
    float _1796 = _1660 * _1788;
    float _1798 = _1740 * _1672;
    float _1800 = _1754 * _1672;
    float _1802 = _1750 * _1672;
    float _1804 = fma(_1632, _1780, _1792);
    float _1806 = fma(_1652, _1794, _1796);
    float _1808 = _1708 * _1668;
    float _1810 = _1788 * _1668;
    float _1812 = _1710 * _1668;
    float _1814 = _1708 * _1044;
    float _1816 = _1788 * _1044;
    float _1818 = _1710 * _1044;
    float _1820 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1822 = _1790 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1824 = _1708 * _1798;
    float _1826 = _1788 * _1798;
    float _1828 = fma(_1662, _1804, _1806);
    float _1830 = _1710 * _1798;
    float _1832 = fma(_1714, _1666, _1808);
    float _1834 = fma(_1714, _1036, _1814);
    float _1836 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1838 = fma(_1714, _1800, _1824);
    float _1840 = _942 + _1828;
    float _1842 = fma(_1794, _1666, _1810);
    float _1844 = fma(_1718, _1666, _1812);
    float _1846 = _1808;
    float _1848 = _1828;
    float _1850 = _1814;
    float _1852 = _1768;
    float _1854 = _1770;
    float _1856 = _1806;
    float _1858 = _1832;
    if (!_1822)
    {
        _1846 = _1744;
    }
    float _1860 = _1846;
    float _1862 = _1860;
    if (!_1822)
    {
        _1848 = _1746;
    }
    float _1864 = _1848;
    float _1866 = _1864;
    if (!_1822)
    {
        _1850 = _1840;
    }
    float _1868 = _1850;
    bool _1870 = !_1822;
    float _1872 = _1868;
    if (!_1870)
    {
        float _1874 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1876 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1878 = _1790 + _1876;
        float _1880 = _1840 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1882 = rsqrt(_1782);
        float _1884 = _1878 * _1874;
        float _1886 = _1884 * 0.15915493667125701904296875;
        float _1888 = _1886 * 6.283185482025146484375;
        float _1890 = sin(_1888);
        float _1892 = _1886 * 6.283185482025146484375;
        float _1894 = cos(_1892);
        float _1896 = fma(_1890, _1880, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1898 = _1882 * _1896;
        float _1900 = fma(_1758, _1898, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1902 = _1894 + (-1.0);
        float _1904 = fma(_1762, _1898, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1906 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1908 = _1900 + _1906;
        float _1910 = _1902 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1912 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1914 = _1904 + _1912;
        float _1916 = _1908 * _1908;
        float _1918 = fma(_1840, _1894, _1910);
        float _1920 = _1914 * _1914;
        _1872 = _1918;
        _1852 = _1916;
        _1854 = _1920;
        _1862 = _1900;
        _1866 = _1904;
        _1856 = _1886;
    }
    float _1922 = _1872;
    float _1924 = _1852;
    float _1926 = _1854;
    float _1928 = _1862;
    float _1930 = _1866;
    float _1932 = _1856;
    float _1934 = fma(_1794, _1036, _1816);
    float _1936 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1938 = _1922 + _1936;
    float _1940 = fma(_1718, _1036, _1818);
    float _1942 = fma(_1938, _1938, _1924);
    float _1944 = _1064 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1946 = fma(_1794, _1800, _1826);
    float _1948 = _1942 + _1926;
    float _1950 = fma(_1718, _1800, _1830);
    float _1952 = _1600 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1954 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1956 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1958 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1960 = sqrt(_1948);
    float _1962 = _1944 * _1836;
    float _1964 = fma(_1722, _1670, _1832);
    float _1966 = fma(_1804, _1670, _1842);
    float _1968 = _1952 * _1820;
    float _1970 = fma(_1722, _1802, _1838);
    float _1972 = fma(_1804, _1802, _1946);
    float _1974 = fma(_1724, _1802, _1950);
    float _1976 = fma(_1724, _1670, _1844);
    float _1978 = fma(_1722, _1060, _1834);
    float _1980 = _1954 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1982 = _1956 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1984 = _1958 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1986 = _1612 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1988 = fma(_1804, _1060, _1934);
    float _1990 = fma(_1724, _1060, _1940);
    out.m_81.x = _1968;
    out.m_81.y = _1962;
    bool _1992 = _1960 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1994 = isnan(_1960);
    bool _1996 = _1992 || _1994;
    bool _1998 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2000 = _1996 || _1998;
    out.m_83.x = _1980;
    out.m_83.y = _1982;
    out.m_83.z = _1984;
    out.m_83.w = _1986;
    out.m_85.x = _1964;
    out.m_85.y = _1966;
    out.m_85.z = _1976;
    out.m_87.x = _1970;
    out.m_87.y = _1972;
    out.m_87.z = _1974;
    float _2002 = _1932;
    if (!_2000)
    {
        _2002 = 1.0;
    }
    float _2004 = _2002;
    out.m_89.x = _1978;
    out.m_89.y = _1988;
    out.m_89.z = _1990;
    bool _2006 = !_2000;
    float _2008 = _2004;
    if (!_2006)
    {
        bool _2010 = _1960 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2012 = isnan(_1960);
        bool _2014 = _2010 || _2012;
        bool _2016 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2018 = _2014 || _2016;
        if (!_2018)
        {
            float _2020 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2022 = _1960 + _2020;
            float _2024 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2026 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2024;
            float _2028 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2030 = _2028 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2032 = 1.0 / _2026;
            float _2034 = _2022 * _2032;
            float _2036 = fma(_2034, _2030, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2008 = _2036;
            _2038 = true;
        }
        else
        {
            bool _2040 = _1960 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2042 = isnan(_1960);
            bool _2044 = _2040 || _2042;
            bool _2046 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2048 = _2044 || _2046;
            if (!_2048)
            {
                float _2050 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2052 = _1960 + _2050;
                float _2054 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2056 = _2054 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2058 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2060 = _2058 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2062 = 1.0 / _2056;
                float _2064 = _2052 * _2062;
                float _2066 = fma(_2064, _2060, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2008 = _2066;
                _2038 = true;
            }
            else
            {
                _2008 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2038 = false;
    float _2068 = _2008;
    float _2070 = -_1442;
    float _2072 = fma(_2070, (*spvDescriptorSet0.vp_c9)._m0[18].w, _968);
    float _2074 = -_1468;
    float _2076 = fma(_2074, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1360);
    float _2078 = fma(_2072, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2080 = fma(_2076, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2082 = floor(_2078);
    float _2084 = floor(_2080);
    float _2086 = -_2082;
    float _2088 = _2078 + _2086;
    float _2090 = -_2084;
    float _2092 = _2080 + _2090;
    float2 _6829 = float2(_2088, _2092);
    float _2094 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6829, float2(0.0), isnan(_6829)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6829, float2(0.0), isnan(_6829)), level(0.0)).x;
    float _2096 = -_1440;
    float _2098 = fma(_2096, (*spvDescriptorSet0.vp_c9)._m0[18].w, _942);
    float _2100 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _2102 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2104 = _1928 + _2102;
    float _2106 = _2098 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2108 = _2098 + _2100;
    float _2110 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2112 = _1922 + _2110;
    float _2114 = fma(_2072, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2106);
    float _2116 = _2108 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _2118 = _2108 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _2120 = fma(_2076, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2114);
    float _2122 = _2098 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2124 = fma(_2072, (*spvDescriptorSet0.vp_c15)._m0[126].x, _2116);
    float _2126 = fma(_2072, (*spvDescriptorSet0.vp_c15)._m0[127].x, _2118);
    float _2128 = _2120 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2130 = fma(_2072, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2122);
    float _2132 = fma(_2076, (*spvDescriptorSet0.vp_c15)._m0[126].z, _2124);
    float _2134 = fma(_2076, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2126);
    float _2136 = 1.0 / _2128;
    float _2138 = fma(_2076, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2130);
    float _2140 = _2132 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _2142 = _2134 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _2144 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2146 = _1930 + _2144;
    float _2148 = _2138 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2150 = fma(_2104, _2068, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2152 = fma(_2112, _2068, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2154 = trunc(_2142);
    int _2156 = int(_2154);
    float _2158 = _2148 + _2128;
    float _2160 = -_1442;
    float _2162 = fma(_2160, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2150);
    float _2164 = fma(_2146, _2068, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2166 = -_1468;
    float _2168 = fma(_2166, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2164);
    float _2170 = _2158 * _2136;
    float _2172 = _2170 * 0.5;
    float _2174 = trunc(_2140);
    int _2176 = int(_2174);
    float _2178 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2180 = fma(_2172, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2178);
    int _2182 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _2184 = _2156 + _2182;
    int _2186 = _2184 + 1;
    float _2188 = 1.0 / _2180;
    int _2190 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2192 = _2176 + _2190;
    int _2194 = _2192 + 1;
    bool _2196 = _2194 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _2198 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2200 = _2188 * _2198;
    int _2202 = _2194 | _2186;
    bool _2204 = _2200 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _2206 = _2202 < 0;
    bool _2208 = _2206 || _2196;
    bool _2210 = _2200 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _2212 = _2186 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _2214 = _2212 || _2208;
    bool _2216 = !_2204;
    int _2218 = _2216 ? 0 : 1;
    int _2220 = 2;
    int _2222 = _2186;
    int _2224 = _2194;
    int _2226 = _2218;
    float _2228 = _2162;
    float _2230 = _2168;
    float _2232 = _2142;
    float _2234 = _2140;
    float _2236 = _2072;
    float _2238 = _2098;
    if (!_2204)
    {
        _2220 = 1;
    }
    int _2240 = _2220;
    int _2242 = _2240;
    if (!_2210)
    {
        _2242 = _2218;
    }
    int _2244 = _2242;
    float _2246 = as_type<float>(_2244);
    if (!_2214)
    {
        int _2248 = _2186 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _2250 = _2248 + _2194;
        _2222 = _2250;
    }
    int _2252 = _2222;
    bool _2254 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2256 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2258 = _2254 || _2256;
    bool _2260 = isnan(0.5);
    bool _2262 = _2258 || _2260;
    int _2264 = _2244 << 6;
    float _2266 = as_type<float>(_2264);
    if (!_2214)
    {
        int _2268 = _2252 << 2;
        _2224 = _2268;
    }
    int _2270 = _2224;
    int _2272 = _2264 + 96;
    uint _2275 = uint(int(uint(_2272) >> uint(2)));
    uint _2277 = uint(int(uint(int(_2275)) >> uint(2)));
    int _2279 = int(_2275) & 3;
    float _2281 = (*spvDescriptorSet0.vp_c15)._m0[int(_2277)][_2279];
    int _2283 = int(_2275) + 1;
    uint _2285 = uint(int(uint(_2283) >> uint(2)));
    int _2287 = _2283 & 3;
    float _2289 = (*spvDescriptorSet0.vp_c15)._m0[int(_2285)][_2287];
    int _2291 = _2270;
    if (!_2214)
    {
        uint _2293 = uint(int(uint(_2252) >> uint(2)));
        _2226 = int(_2293);
    }
    int _2295 = _2226;
    if (!_2214)
    {
        int _2297 = 12 & _2270;
        _2291 = _2297;
    }
    int _2299 = _2291;
    if (!_2214)
    {
        int _2301 = _2295 << 4;
        int _2303 = _2301 + _2299;
        _1858 = as_type<float>(_2303);
    }
    float _2305 = _1858;
    int _2307 = _2264 + 48;
    uint _2309 = uint(int(uint(_2307) >> uint(2)));
    uint _2311 = uint(int(uint(int(_2309)) >> uint(2)));
    int _2313 = int(_2309) & 3;
    float _2315 = (*spvDescriptorSet0.vp_c15)._m0[int(_2311)][_2313];
    int _2317 = int(_2309) + 1;
    uint _2319 = uint(int(uint(_2317) >> uint(2)));
    int _2321 = _2317 & 3;
    float _2323 = (*spvDescriptorSet0.vp_c15)._m0[int(_2319)][_2321];
    int _2325 = _2264 + 64;
    uint _2327 = uint(int(uint(_2325) >> uint(2)));
    uint _2329 = uint(int(uint(int(_2327)) >> uint(2)));
    int _2331 = int(_2327) & 3;
    float _2333 = (*spvDescriptorSet0.vp_c15)._m0[int(_2329)][_2331];
    int _2335 = int(_2327) + 1;
    uint _2337 = uint(int(uint(_2335) >> uint(2)));
    int _2339 = _2335 & 3;
    float _2341 = (*spvDescriptorSet0.vp_c15)._m0[int(_2337)][_2339];
    int _2343 = _2264 + 104;
    uint _2345 = uint(int(uint(_2343) >> uint(2)));
    uint _2347 = uint(int(uint(int(_2345)) >> uint(2)));
    int _2349 = int(_2345) & 3;
    float _2351 = (*spvDescriptorSet0.vp_c15)._m0[int(_2347)][_2349];
    int _2353 = int(_2345) + 1;
    uint _2355 = uint(int(uint(_2353) >> uint(2)));
    int _2357 = _2353 & 3;
    float _2359 = (*spvDescriptorSet0.vp_c15)._m0[int(_2355)][_2357];
    int _2361 = _2264 + 56;
    uint _2363 = uint(int(uint(_2361) >> uint(2)));
    uint _2365 = uint(int(uint(int(_2363)) >> uint(2)));
    int _2367 = int(_2363) & 3;
    float _2369 = (*spvDescriptorSet0.vp_c15)._m0[int(_2365)][_2367];
    int _2371 = int(_2363) + 1;
    uint _2373 = uint(int(uint(_2371) >> uint(2)));
    int _2375 = _2371 & 3;
    float _2377 = (*spvDescriptorSet0.vp_c15)._m0[int(_2373)][_2375];
    int _2379 = _2264 + 72;
    uint _2381 = uint(int(uint(_2379) >> uint(2)));
    uint _2383 = uint(int(uint(int(_2381)) >> uint(2)));
    int _2385 = int(_2381) & 3;
    float _2387 = (*spvDescriptorSet0.vp_c15)._m0[int(_2383)][_2385];
    int _2389 = int(_2381) + 1;
    uint _2391 = uint(int(uint(_2389) >> uint(2)));
    int _2393 = _2389 & 3;
    float _2395 = (*spvDescriptorSet0.vp_c15)._m0[int(_2391)][_2393];
    int _2397 = _2264 + 80;
    uint _2399 = uint(int(uint(_2397) >> uint(2)));
    uint _2401 = uint(int(uint(int(_2399)) >> uint(2)));
    int _2403 = int(_2399) & 3;
    float _2405 = (*spvDescriptorSet0.vp_c15)._m0[int(_2401)][_2403];
    int _2407 = int(_2399) + 1;
    uint _2409 = uint(int(uint(_2407) >> uint(2)));
    int _2411 = _2407 & 3;
    float _2413 = (*spvDescriptorSet0.vp_c15)._m0[int(_2409)][_2411];
    float _2415 = _2108 * _2289;
    float _2417 = fma(_2072, _2281, _2415);
    float _2419 = -_1440;
    float _2421 = fma(_2419, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2152);
    if (_2262)
    {
        _1452 = _2162;
    }
    float _2423 = _1452;
    float _2425 = _2305;
    float _2427 = _2423;
    if (!_2214)
    {
        int _2429 = as_type<int>(_2305) + 400;
        uint _2431 = uint(int(uint(_2429) >> uint(2)));
        uint _2433 = uint(int(uint(int(_2431)) >> uint(2)));
        int _2435 = int(_2431) & 3;
        float _2437 = (*spvDescriptorSet0.vp_c15)._m0[int(_2433)][_2435];
        _2425 = _2437;
    }
    float _2439 = _2425;
    float _2441 = _2108 * _2323;
    if (_2262)
    {
        _2228 = _2421;
    }
    float _2443 = _2228;
    float _2445 = fma(_2072, _2315, _2441);
    float _2447 = _2108 * _2341;
    float _2449 = fma(_2072, _2333, _2447);
    float _2451 = fma(_2076, _2351, _2417);
    float _2453 = _2443;
    float _2455 = _2341;
    if (!_2262)
    {
        float _2457 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2459 = _2098 + _2457;
        float _2461 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2463 = _2072 + _2461;
        float _2465 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2467 = -_1360;
        float _2469 = _2467 + _2164;
        float _2471 = _2459 * _2459;
        float _2473 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2475 = _2076 + _2473;
        float _2477 = -_942;
        float _2479 = _2477 + _2152;
        float _2481 = -_968;
        float _2483 = _2481 + _2150;
        float _2485 = fma(_2463, _2463, _2471);
        float _2487 = 1.0 / _1598;
        float _2489 = fma(_2475, _2475, _2485);
        float _2491 = sqrt(_2489);
        float _2493 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2495 = precise::min(_2491, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2497 = _2495 * _2465;
        float _2499 = _2493 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2501 = _2497 * _2487;
        float _2503 = _2499 * _2501;
        float _2505 = _2469 * _2501;
        float _2507 = fma(_2479, _2503, _2098);
        float _2509 = fma(_2483, _2503, _2072);
        float _2511 = fma(_2499, _2505, _2076);
        _2453 = _2507;
        _2427 = _2509;
        _2230 = _2511;
    }
    float _2513 = _2453;
    float _2515 = _2427;
    float _2517 = _2230;
    float _2519 = _2451 + _2359;
    float _2521 = fma(_2076, _2387, _2449);
    int _2523 = _2264 + 88;
    uint _2525 = uint(int(uint(_2523) >> uint(2)));
    uint _2527 = uint(int(uint(int(_2525)) >> uint(2)));
    int _2529 = int(_2525) & 3;
    float _2531 = (*spvDescriptorSet0.vp_c15)._m0[int(_2527)][_2529];
    int _2533 = int(_2525) + 1;
    uint _2535 = uint(int(uint(_2533) >> uint(2)));
    int _2537 = _2533 & 3;
    float _2539 = (*spvDescriptorSet0.vp_c15)._m0[int(_2535)][_2537];
    float _2541 = fma(_2076, _2369, _2445);
    float _2543 = _2513 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2545 = _2521 + _2395;
    float _2547 = 1.0 / _2519;
    float _2549 = _2513 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2551 = _2541 + _2377;
    float _2553 = _2513 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2555 = fma(_2515, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2543);
    float _2557 = fma(_2515, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2549);
    float _2559 = _2513 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2561 = fma(_2515, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2553);
    float _2563 = fma(_2517, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2555);
    float _2565 = fma(_2517, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2557);
    float _2567 = fma(_2515, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2559);
    float _2569 = fma(_2517, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2561);
    float _2571 = _2563 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2573 = _2565 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2575 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2577 = _2569 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2579 = _2551 * _2547;
    float _2581 = _2545 * _2547;
    float _2583 = _2573 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2585 = _2577 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2587 = fma(_2517, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2567);
    bool _2589 = _2579 >= 0.0;
    float _2591 = -_2583;
    float _2593 = fma(_2591, _2575, 1.0);
    float _2595 = fma(_2571, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2585);
    float _2597 = _2587 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    bool _2599 = _2579 <= 1.0;
    bool _2601 = _2599 && _2589;
    float _2603 = _2445;
    if (!_2214)
    {
        float _2605 = floor(_2140);
        _2603 = _2605;
    }
    float _2607 = _2603;
    float _2609 = fma(_2573, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2595);
    float _2611 = _2108 * _2413;
    bool _2613 = _2581 >= 0.0;
    bool _2615 = _2613 && _2601;
    float _2617 = _2577 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2619 = fma(_2597, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2609);
    float _2621 = _2577 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    bool _2623 = _2581 <= 1.0;
    bool _2625 = _2623 && _2615;
    float _2627 = log2(_2593);
    float _2629 = fma(_2072, _2405, _2611);
    float _2631 = fma(_2571, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2617);
    float _2633 = fma(_2573, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2631);
    float _2635 = 1.0 / _2619;
    float _2637 = fma(_2571, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2621);
    float _2639 = fma(_2076, _2531, _2629);
    float _2641 = fma(_2597, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2633);
    float _2643 = _2641;
    if (_2625)
    {
        float _2645 = float(_2244);
        _2246 = _2645;
    }
    float _2647 = _2246;
    float _2649 = fma(_2573, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2637);
    float _2651 = _2639 + _2539;
    if (!_2214)
    {
        float _2653 = -_2607;
        float _2655 = _2140 + _2653;
        _2266 = _2655;
    }
    float _2657 = _2266;
    float _2659 = _2551;
    if (!_2214)
    {
        float _2661 = floor(_2142);
        _2659 = _2661;
    }
    float _2663 = _2659;
    float _2665 = fma(_2597, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2649);
    float _2667 = _2627 * 0.693147182464599609375;
    float _2669 = _2651 * _2547;
    float _2671 = _2667 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2673 = _2439;
    float _2675 = _2669;
    if (!_2214)
    {
        float _2677 = rint(_2439);
        float _2679 = precise::max(_2677, 0.0);
        uint _2681 = uint(_2679);
        uint _2683 = clamp(_2681, 0u, 65535u);
        _2673 = as_type<float>(_2683);
    }
    float _2685 = _2673;
    float _2687 = _2641 * _2635;
    float _2689 = _2665 * _2635;
    float _2691 = fma(_2687, 0.5, 0.5);
    float _2693 = fma(_2689, -0.5, 0.5);
    float _2695 = _2629;
    float _2697 = _2691;
    if (_2625)
    {
        float _2699 = rint(_2647);
        float _2701 = precise::max(_2699, 0.0);
        uint _2703 = uint(_2701);
        uint _2705 = clamp(_2703, 0u, 65535u);
        _2695 = as_type<float>(_2705);
    }
    float _2707 = _2695;
    if (!_2214)
    {
        float _2709 = -_2663;
        float _2711 = _2142 + _2709;
        _2232 = _2711;
    }
    float _2713 = _2232;
    float _2715 = _2685;
    if (!_2214)
    {
        float3 _7882 = float3(_2657, _2713, float(as_type<int>(_2685)));
        float3 _7886 = select(_7882, float3(0.0), isnan(_7882));
        float _2717 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _7886.xy, uint(rint(_7886.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _7886.xy, uint(rint(_7886.z)), level(0.0)).x;
        _2715 = _2717;
    }
    float _2719 = _2715;
    float _2721 = _2581;
    if (_2625)
    {
        float3 _7901 = float3(_2579, _2581, float(as_type<int>(_2707)));
        float3 _7903 = select(_7901, float3(0.0), isnan(_7901));
        float _2723 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _7903.xy, uint(rint(_7903.z)), _2669, level(0.0));
        _2721 = _2723;
    }
    float _2725 = _2721;
    float3 _7913 = float3(_2691, _2693, _2671);
    float _2727 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7913, float3(0.0), isnan(_7913)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7913, float3(0.0), isnan(_7913)), level(0.0)).x;
    float3 _7922 = float3(_2691, _2693, _2671);
    float4 _2730 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7922, float3(0.0), isnan(_7922)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7922, float3(0.0), isnan(_7922)), level(0.0)).xyzw;
    float _2732 = _2730.x;
    float _2734 = _2730.y;
    float _2736 = _2730.z;
    float _2738 = _2730.w;
    bool _2740 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2742 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2744 = _2740 || _2742;
    bool _2746 = isnan(0.5);
    bool _2748 = _2744 || _2746;
    if (_2748)
    {
        _2455 = 1.0;
    }
    float _2750 = _2455;
    float _2752 = _2750;
    float _2754 = _2725;
    if (!_2748)
    {
        float _2756 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2758 = _2756 * 0.15915493667125701904296875;
        float _2760 = _2758 * 6.283185482025146484375;
        float _2762 = cos(_2760);
        float _2764 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2766 = _2764 * 0.15915493667125701904296875;
        float _2768 = _2758 * 6.283185482025146484375;
        float _2770 = sin(_2768);
        float _2772 = 1.0 / _2762;
        float _2774 = _2766 * 6.283185482025146484375;
        float _2776 = cos(_2774);
        float _2778 = _2770 * _2772;
        float _2780 = _2766 * 6.283185482025146484375;
        float _2782 = sin(_2780);
        float _2784 = _2776 * _2778;
        float _2786 = 1.0 / _2784;
        float _2788 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2790 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2788;
        float _2792 = 1.0 / _2790;
        float _2794 = _2782 * _2786;
        float _2796 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2798 = fma(_2200, _2794, _2796);
        float _2800 = _2798 * _2792;
        float _2802 = precise::clamp(_2800, 0.0, 1.0);
        _2697 = _2766;
        _2752 = _2802;
    }
    float _2804 = _2697;
    float _2806 = _2752;
    float _2808 = _2804;
    if (_2214)
    {
        _2234 = 1.0;
    }
    float _2810 = _2234;
    float _2812 = _2810;
    if (!_2214)
    {
        int _2814 = _2252 << 4;
        int _2816 = _2814 + 2048;
        uint _2818 = uint(int(uint(_2816) >> uint(2)));
        uint _2820 = uint(int(uint(int(_2818)) >> uint(2)));
        int _2822 = int(_2818) & 3;
        float _2824 = (*spvDescriptorSet0.vp_c15)._m0[int(_2820)][_2822];
        int _2826 = int(_2818) + 1;
        uint _2828 = uint(int(uint(_2826) >> uint(2)));
        int _2830 = _2826 & 3;
        float _2832 = (*spvDescriptorSet0.vp_c15)._m0[int(_2828)][_2830];
        int _2834 = _2816 + 8;
        uint _2836 = uint(int(uint(_2834) >> uint(2)));
        uint _2838 = uint(int(uint(int(_2836)) >> uint(2)));
        int _2840 = int(_2836) & 3;
        float _2842 = (*spvDescriptorSet0.vp_c15)._m0[int(_2838)][_2840];
        int _2844 = int(_2836) + 1;
        uint _2846 = uint(int(uint(_2844) >> uint(2)));
        int _2848 = _2844 & 3;
        float _2850 = (*spvDescriptorSet0.vp_c15)._m0[int(_2846)][_2848];
        float _2852 = _2108 * _2832;
        float _2854 = fma(_2072, _2824, _2852);
        float _2856 = fma(_2076, _2842, _2854);
        float _2858 = _2856 + _2850;
        float _2860 = precise::clamp(_2858, 0.0, 1.0);
        float _2862 = -_2860;
        float _2864 = _2862 + _2719;
        float _2866 = fma(_2864, 500.0, 1.5);
        float _2868 = exp2(_2866);
        float _2870 = 0.0 + _2868;
        float _2872 = precise::clamp(_2870, 0.0, 1.0);
        _2812 = _2872;
    }
    float _2874 = _2812;
    float _2876 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2878 = _2513 + _2876;
    float _2880 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2882 = _2515 + _2880;
    float _2884 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2886 = _2517 + _2884;
    float _2888 = _2878 * _2878;
    float _2890 = fma(_2882, _2882, _2888);
    float _2892 = fma(_2886, _2886, _2890);
    float _2894 = rsqrt(_2892);
    float _2896 = sqrt(_2892);
    float _2898 = _2894 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2900 = _2882 * _2898;
    float _2902 = _2886 * _2898;
    float _2904 = _2900 * _2900;
    float _2906 = _2902 * _2902;
    float _2908 = _2904 + _2906;
    float _2910 = sqrt(_2908);
    bool _2912 = _2910 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2914 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2916 = _2910 + _2914;
    float _2918 = _2886;
    float _2920 = _2916;
    float _2922 = _2878;
    if (_2912)
    {
        float _2924 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2918 = _2924;
    }
    float _2926 = _2918;
    if (_2912)
    {
        float _2928 = rsqrt(_2908);
        _2236 = _2928;
    }
    float _2930 = _2236;
    float _2932 = _2930;
    if (_2912)
    {
        float _2934 = _2916 * _2926;
        _2920 = _2934;
    }
    float _2936 = _2920;
    if (_2912)
    {
        float _2938 = _2936 * 0.15915493667125701904296875;
        _2808 = _2938;
    }
    float _2940 = _2808;
    float _2942 = _2888;
    if (_2912)
    {
        float _2944 = _2940 * 6.283185482025146484375;
        float _2946 = sin(_2944);
        _2942 = _2946;
    }
    float _2948 = _2942;
    float _2950 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2952 = precise::max(0.0, _2950);
    float _2954 = _2894;
    float _2956 = _2952;
    float _2958 = _2950;
    if (_2912)
    {
        float _2960 = _2940 * 6.283185482025146484375;
        float _2962 = cos(_2960);
        _2954 = _2962;
    }
    float _2964 = _2954;
    float _2966 = -_2898;
    float _2968 = -_2952;
    float _2970 = fma(_2878, _2966, _2968);
    if (!_2912)
    {
        _2956 = _2900;
    }
    float _2972 = _2956;
    float _2974 = _2972;
    if (_2912)
    {
        float _2976 = _2970 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2958 = _2976;
    }
    float _2978 = _2958;
    float _2980 = _2948;
    float _2982 = _2978;
    if (_2912)
    {
        float _2984 = fma(_2948, _2978, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2922 = _2984;
    }
    float _2986 = _2922;
    float _2988 = _2986;
    if (!_2912)
    {
        _2980 = _2904;
    }
    float _2990 = _2980;
    float _2992 = _2990;
    float _2994 = _2964;
    if (_2912)
    {
        float _2996 = _2964 + (-1.0);
        _2982 = _2996;
    }
    float _2998 = _2982;
    float _3000 = _2998;
    if (_2912)
    {
        float _3002 = _2930 * _2986;
        _2238 = _3002;
    }
    float _3004 = _2238;
    if (!_2912)
    {
        _2988 = _2970;
    }
    float _3006 = _2988;
    float _3008 = _3006;
    if (_2912)
    {
        float _3010 = _2998 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2932 = _3010;
    }
    float _3012 = _2932;
    if (_2912)
    {
        float _3014 = _2900 * _3004;
        _2974 = _3014;
    }
    float _3016 = _2974;
    if (!_2912)
    {
        _3000 = _2902;
    }
    float _3018 = _3000;
    float _3020 = _3018;
    if (_2912)
    {
        float _3022 = _2902 * _3004;
        _3020 = _3022;
    }
    float _3024 = _3020;
    if (_2912)
    {
        float _3026 = fma(_2970, _2964, _3012);
        _3008 = _3026;
    }
    float _3028 = _3008;
    if (_2912)
    {
        float _3030 = _3016 * _3016;
        _2992 = _3030;
    }
    float _3032 = _2992;
    if (!_2912)
    {
        _2994 = _2906;
    }
    float _3034 = _2994;
    float _3036 = _3034;
    if (_2912)
    {
        float _3038 = _3024 * _3024;
        _3036 = _3038;
    }
    float _3040 = _3036;
    float _3042 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3044 = fma(_2896, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3042);
    float _3046 = precise::clamp(_3044, 0.0, 1.0);
    float _3048 = fma(_3028, _3028, _3032);
    float _3050 = -_3046;
    float _3052 = _3050 + 1.0;
    float _3054 = _3048 + _3040;
    float _3056 = rsqrt(_3054);
    float _3058 = abs(_3052);
    float _3060 = log2(_3058);
    float _3062 = _3056 * _3016;
    float _3064 = _3056 * _3028;
    float _3066 = _3056 * _3024;
    float _3068 = _3062 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3070 = -_3068;
    float _3072 = fma(_3064, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3070);
    float _3074 = -_3066;
    float _3076 = fma(_3074, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3072);
    float _3078 = _3060 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3080 = fma(_3076, -0.5, 0.5);
    float _3082 = fma(_3076, 0.5, 0.5);
    float _3084 = _3064 + 1.0;
    float _3086 = exp2(_3078);
    float _3088 = fma(_3082, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3090 = fma(_3082, _3088, -0.212114393711090087890625);
    float _3092 = sqrt(_3080);
    float _3094 = fma(_3082, _3090, 1.570728778839111328125);
    float _3096 = -_3064;
    float _3098 = fma(_3086, _3084, _3096);
    float _3100 = fma(_3098, 0.5, 0.5);
    float _3102 = _3092 * 0.636619746685028076171875;
    float _3104 = -_3094;
    float _3106 = fma(_3102, _3104, 1.0);
    float2 _8490 = float2(_3106, _3100);
    float3 _3110 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8490, float2(0.0), isnan(_8490)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8490, float2(0.0), isnan(_8490)), level(0.0)).xyz;
    float _3112 = _3110.x;
    float _3114 = _3110.y;
    float _3116 = _3110.z;
    float _3118 = abs(_2200);
    float _3120 = log2(_3118);
    float _3122 = _2577 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3124 = _3060 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3126 = -_2094;
    float _3128 = _3126 + 1.0;
    float _3130 = _2641 + _2619;
    float _3132 = fma(_2571, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3122);
    float _3134 = exp2(_3124);
    float _3136 = fma(_2573, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3132);
    float _3138 = _2619 * 0.5;
    bool _3140 = _2200 <= 8000.0;
    bool _3142 = isnan(_2200);
    bool _3144 = _3140 || _3142;
    bool _3146 = isnan(8000.0);
    bool _3148 = _3144 || _3146;
    float _3150 = float(_3148);
    float _3152 = _3130 * 0.5;
    bool _3154 = _2896 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3156 = isnan(_2896);
    bool _3158 = _3154 || _3156;
    bool _3160 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3162 = _3158 || _3160;
    float _3164 = fma(_2665, -0.5, _3138);
    float _3166 = _3120 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3168 = fma(_2597, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3136);
    float _3170 = _3168 + _2619;
    float _3172 = exp2(_3166);
    out.gl_Position.x = _2641;
    out.gl_Position.y = _2665;
    out.gl_Position.z = _3168;
    out.gl_Position.w = _2619;
    float _3174 = _3170 * 0.5;
    out.m_91.x = _3152;
    out.m_91.y = _3164;
    out.m_91.z = _3174;
    out.m_91.w = _2619;
    float _3176 = -_3134;
    float _3178 = _3176 + 1.0;
    float _3180 = fma(_3172, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3182 = precise::clamp(_3180, 0.0, 1.0);
    if (!_2625)
    {
        _2643 = 1.0;
    }
    float _3184 = _2643;
    float _3186 = _3184;
    if (_2625)
    {
        bool _3188 = _2725 >= _2669;
        bool _3190 = isnan(_2725);
        bool _3192 = _3188 || _3190;
        bool _3194 = isnan(_2669);
        bool _3196 = _3192 || _3194;
        float _3198 = float(_3196);
        _3186 = _3198;
    }
    float _3200 = _3186;
    float _3202 = fma(_3182, -2.0, 3.0);
    float _3204 = _3182 * _3182;
    float _3206 = _3178 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3208 = _3206;
    if (!_3162)
    {
        _2675 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3210 = _2675;
    float _3212 = _3200 * _2874;
    float _3214 = _3204 * _3202;
    float _3216 = _3206 * _2727;
    float _3218 = -_3206;
    float _3220 = _3218 + 1.0;
    float _3222 = _3220;
    float _3224 = _3210;
    float _3226 = _3210;
    if (!_3162)
    {
        _2754 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3228 = _2754;
    float _3230 = -_3214;
    float _3232 = _3230 + 1.0;
    float _3234 = _3228;
    float _3236 = _3228;
    if (!_3162)
    {
        _3208 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3238 = _3208;
    float _3240 = _2738 * _3220;
    float _3242 = _3238;
    float _3244 = _3238;
    if (!_3162)
    {
        _3222 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3246 = _3222;
    float _3248 = fma(_3232, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3214);
    float _3250 = _3150 * _3248;
    float _3252 = _3250 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3254 = _3128 * _3252;
    float _3256 = precise::clamp(_3254, 0.0, 1.0);
    float _3258 = _2738 * _3216;
    float _3260 = -_3256;
    float _3262 = fma(_3260, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3264 = -_3212;
    float _3266 = fma(_3264, _3262, 1.0);
    float _3268 = precise::clamp(_3266, 0.0, 1.0);
    float _3270 = _2806 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3272 = _3268 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3274 = _3268;
    float _3276 = _3258;
    float _3278 = _3246;
    float _3280 = _3246;
    if (!_3162)
    {
        _3274 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3282 = _3274;
    out.m_93.x = _3272;
    float _3284 = _3116 * _3216;
    float _3286 = fma(_3112, _3258, _2732);
    float _3288 = fma(_3114, _3258, _2734);
    float _3290 = _3282;
    float _3292 = _3282;
    if (!_3162)
    {
        _3276 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3294 = _3276;
    float _3296 = fma(_2738, _3284, _2736);
    out.m_95.x = _3286;
    out.m_95.y = _3288;
    out.m_95.z = _3296;
    out.m_95.w = _3240;
    bool _3298 = !_3162;
    float _3300 = _3294;
    float _3302 = _3294;
    if (!_3298)
    {
        bool _3304 = _2896 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3306 = isnan(_2896);
        bool _3308 = _3304 || _3306;
        bool _3310 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3312 = _3308 || _3310;
        if (!_3312)
        {
            float _3314 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3316 = _2896 + _3314;
            float _3318 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3320 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3318;
            float _3322 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3324 = _3322 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3326 = 1.0 / _3320;
            float _3328 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3330 = _3328 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3332 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3334 = _3332 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3336 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3338 = _3336 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3340 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3342 = _3340 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3344 = _3316 * _3326;
            float _3346 = precise::clamp(_3344, 0.0, 1.0);
            float _3348 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3350 = _3348 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3352 = fma(_3346, _3324, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3354 = fma(_3346, _3350, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3356 = fma(_3346, _3330, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3358 = fma(_3346, _3334, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3360 = fma(_3346, _3338, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3362 = fma(_3346, _3342, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3236 = _3356;
            _3302 = _3360;
            _3226 = _3352;
            _3280 = _3358;
            _3244 = _3354;
            _3292 = _3362;
            _3364 = true;
        }
        else
        {
            bool _3366 = _2896 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3368 = isnan(_2896);
            bool _3370 = _3366 || _3368;
            bool _3372 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3374 = _3370 || _3372;
            if (!_3374)
            {
                _3224 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3376 = _3224;
            _3226 = _3376;
            if (!_3374)
            {
                _3234 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3378 = _3234;
            _3236 = _3378;
            if (!_3374)
            {
                _3242 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3380 = _3242;
            _3244 = _3380;
            if (!_3374)
            {
                _3278 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3382 = _3278;
            _3280 = _3382;
            if (!_3374)
            {
                _3300 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3384 = _3300;
            _3302 = _3384;
            if (!_3374)
            {
                _3290 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3386 = _3290;
            bool _3388 = !_3374;
            _3292 = _3386;
            if (!_3388)
            {
                bool _3390 = _2896 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3392 = isnan(_2896);
                bool _3394 = _3390 || _3392;
                bool _3396 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3398 = _3394 || _3396;
                if (!_3398)
                {
                    float _3400 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3402 = _2896 + _3400;
                    float _3404 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3406 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3404;
                    float _3408 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3410 = _3408 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3412 = 1.0 / _3406;
                    float _3414 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3416 = _3414 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3418 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3420 = _3418 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3422 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3424 = _3422 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3426 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3428 = _3426 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3430 = _3402 * _3412;
                    float _3432 = precise::clamp(_3430, 0.0, 1.0);
                    float _3434 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3436 = _3434 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3438 = fma(_3432, _3410, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3440 = fma(_3432, _3436, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3442 = fma(_3432, _3416, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3444 = fma(_3432, _3420, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3446 = fma(_3432, _3424, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3448 = fma(_3432, _3428, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3236 = _3442;
                    _3302 = _3446;
                    _3226 = _3438;
                    _3280 = _3444;
                    _3244 = _3440;
                    _3292 = _3448;
                    _3364 = true;
                }
                else
                {
                    _3236 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3302 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3226 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3280 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3244 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3292 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3364 = false;
    float _3450 = _3236;
    float _3452 = _3302;
    float _3454 = _3226;
    float _3456 = _3280;
    float _3458 = _3244;
    float _3460 = _3292;
    float _3462 = fma(_1988, -0.5, 0.5);
    float _3464 = precise::clamp(_3462, 0.0, 1.0);
    float _3466 = -_3450;
    float _3468 = _3466 + _3452;
    float _3470 = _3270 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3472 = -_3454;
    float _3474 = _3472 + _3456;
    float _3476 = fma(_3464, _3468, _3450);
    out.m_97.x = 0.0;
    float _3478 = -_3458;
    float _3480 = _3478 + _3460;
    float _3482 = fma(_3464, _3474, _3454);
    float _3484 = _3476 * 0.586610972881317138671875;
    out.m_61.x = _3470;
    bool _3486 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3488 = fma(_3464, _3480, _3458);
    float _3490 = fma(_3482, 0.298911988735198974609375, _3484);
    bool _3492 = _2806 > 0.0;
    bool _3494 = isnan(_2806);
    bool _3496 = _3492 || _3494;
    bool _3498 = isnan(0.0);
    bool _3500 = _3496 || _3498;
    float _3502 = fma(_3488, 0.114477999508380889892578125, _3490);
    float _3504 = -_3502;
    float _3506 = _3482 + _3504;
    float _3508 = -_3502;
    float _3510 = _3476 + _3508;
    float _3512 = -_3502;
    float _3514 = _3488 + _3512;
    float _3516 = fma(_3506, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3502);
    float _3518 = fma(_3510, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3502);
    float _3520 = fma(_3514, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3502);
    bool _3522 = !_3486;
    if (!_3522)
    {
        float _3524 = -_2513;
        float _3526 = _3524 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3528 = -_2515;
        float _3530 = _3528 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3532 = -_2517;
        float _3534 = _3532 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3536 = _3526 * _3526;
        float _3538 = fma(_3530, _3530, _3536);
        float _3540 = fma(_3534, _3534, _3538);
        float _3542 = sqrt(_3540);
        float _3544 = rsqrt(_3540);
        float _3546 = -_3542;
        float _3548 = _3546 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3550 = _3548 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3552 = precise::clamp(_3550, 0.0, 1.0);
        float _3554 = _3530 * _3544;
        float _3556 = _3526 * _3544;
        float _3558 = abs(_3552);
        float _3560 = log2(_3558);
        float _3562 = _3534 * _3544;
        float _3564 = _3554 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3566 = _1988 * _3556;
        float _3568 = -_3556;
        float _3570 = -_3564;
        float _3572 = fma(_3568, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3570);
        float _3574 = fma(_1978, _3554, _3566);
        float _3576 = -_3562;
        float _3578 = fma(_3576, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3572);
        float _3580 = fma(_1990, _3562, _3574);
        float _3582 = precise::clamp(_3580, 0.0, 1.0);
        float _3584 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3586 = _3578 + _3584;
        float _3588 = _3560 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3590 = _3586 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3592 = precise::clamp(_3590, 0.0, 1.0);
        float _3594 = exp2(_3588);
        float _3596 = _3594 * _3592;
        float _3598 = _3582 * _3596;
        float _3600 = _3598 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3602 = _3598 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3604 = _3598 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_97.x = _3600;
        out.m_97.y = _3602;
        out.m_97.z = _3604;
    }
    out.m_99.x = _3516;
    out.m_99.y = _3518;
    out.m_99.z = _3520;
    if (_3500)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_61.x = 0.0;
    float _3606 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3606;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3364 = false;
    bool _2038 = false;
    bool _878 = false;
    bool _652 = false;
    bool _502 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _113 = in.m_58.w;
    float _115 = trunc(_113);
    int _118 = int(_115);
    bool _122 = _118 >= 1;
    float _124 = 0.0;
    if (!_122)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _126 = _124;
    float _128 = _126;
    if (!_122)
    {
        out.m_61.x = 0.0;
    }
    int _130 = 0;
    if (!_122)
    {
        float _132 = _126 * 5.0;
        _130 = as_type<int>(_132);
    }
    int _134 = _130;
    int _136 = _134;
    if (!_122)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3663 = as_type<float>(_134);
        out.gl_Position.z = _3663;
    }
    if (!_122)
    {
        return out;
    }
    float _138 = in.m_63.w;
    bool _140 = _138 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _142 = isnan(_138);
    bool _144 = _140 || _142;
    bool _146 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _148 = _144 || _146;
    float _150 = -_138;
    float _152 = _150 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _154 = 0.0;
    float _156 = 0.0;
    float _158 = _152;
    if (_148)
    {
        float _160 = float(_118);
        _128 = _160;
    }
    float _162 = _128;
    bool _164 = _152 >= _162;
    bool _166 = !_148;
    bool _168 = _164 || _166;
    float _170 = _162;
    if (_168)
    {
        _170 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _172 = _170;
    if (_168)
    {
        out.m_61.x = 0.0;
    }
    if (_168)
    {
        float _174 = _172 * 5.0;
        _136 = as_type<int>(_174);
    }
    int _176 = _136;
    float _178 = as_type<float>(_176);
    if (_168)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3735 = as_type<float>(_176);
        out.gl_Position.z = _3735;
    }
    if (_168)
    {
        return out;
    }
    float _180 = in.m_63.x;
    float _182 = in.m_63.y;
    float _184 = in.m_63.z;
    float _186 = _152 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _188 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _190 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _192 = _188 || _190;
    bool _194 = isnan(1.0);
    bool _196 = _192 || _194;
    float _198 = _186;
    if (!_196)
    {
        float _200 = _186 * _186;
        float _202 = _200 * 0.5;
        _178 = _202;
    }
    float _204 = _178;
    float _206 = 0.0;
    float _208 = _204;
    if (!_196)
    {
        float _210 = _152 * _152;
        float _212 = _210 * 0.5;
        _206 = _212;
    }
    float _214 = _206;
    if (!_196)
    {
        float _216 = _204 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _208 = _216;
    }
    float _218 = _208;
    bool _220 = !_196;
    float _222 = _218;
    if (!_220)
    {
        float _224 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _226 = log2(_224);
        float _228 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _230 = _228 + 1.0;
        float _232 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _234 = _186 * _226;
        float _236 = 1.0 / _230;
        float _238 = _232 * 0.693147182464599609375;
        float _240 = exp2(_234);
        float _242 = 1.0 / _238;
        float _244 = _240 + (-1.0);
        float _246 = -_244;
        float _248 = fma(_246, _242, _186);
        float _250 = _248 * _236;
        float _252 = _250 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _154 = _238;
        _222 = _252;
        _156 = _240;
    }
    float _254 = _154;
    float _256 = _222;
    float _258 = _156;
    bool _260 = !_196;
    float _262 = _254;
    float _264 = _258;
    if (!_260)
    {
        float _266 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _268 = log2(_266);
        float _270 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _272 = _270 + 1.0;
        float _274 = 1.0 / _272;
        float _276 = _186 * _268;
        float _278 = exp2(_276);
        float _280 = -_278;
        float _282 = _280 + 1.0;
        float _284 = _282 * _274;
        _262 = _278;
        _264 = _272;
        _198 = _284;
    }
    float _286 = _262;
    float _288 = _264;
    float _290 = _198;
    float _292 = _288;
    float _294 = _286;
    if (!_196)
    {
        _292 = _152;
    }
    float _296 = _292;
    float _298 = _256 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _300 = _296;
    if (!_196)
    {
        float _302 = _214 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _294 = _302;
    }
    float _304 = _294;
    bool _306 = !_196;
    float _308 = _304;
    if (!_306)
    {
        float _310 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _312 = log2(_310);
        float _314 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _316 = _152 * _312;
        float _318 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _320 = _318 + 1.0;
        float _322 = 1.0 / _320;
        float _324 = _314 * 0.693147182464599609375;
        float _326 = exp2(_316);
        float _328 = 1.0 / _324;
        float _330 = _326 + (-1.0);
        float _332 = -_330;
        float _334 = fma(_332, _328, _152);
        float _336 = _334 * _322;
        float _338 = _336 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _308 = _338;
    }
    float _340 = _308;
    bool _342 = !_196;
    if (!_342)
    {
        float _344 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _346 = log2(_344);
        float _348 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _350 = _348 + 1.0;
        float _352 = 1.0 / _350;
        float _354 = _152 * _346;
        float _356 = exp2(_354);
        float _358 = -_356;
        float _360 = _358 + 1.0;
        float _362 = _360 * _352;
        _300 = _362;
    }
    float _364 = _300;
    float _366 = _340 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _368 = fma(_290, _182, _298);
    float _370 = _256 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _372 = _340 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _374 = fma(_364, _182, _366);
    float _376 = _256 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _378 = _340 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _380 = fma(_290, _180, _370);
    float _382 = fma(_364, _180, _372);
    float _384 = -_374;
    float _386 = _368 + _384;
    float _388 = fma(_290, _184, _376);
    float _390 = fma(_364, _184, _378);
    float _392 = -_382;
    float _394 = _380 + _392;
    float _396 = _386 * _386;
    float _398 = in.m_65.w;
    float _400 = -_390;
    float _402 = _388 + _400;
    float _404 = _386 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _406 = fma(_394, _394, _396);
    float _408 = _386 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _410 = _386 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _412 = fma(_394, (*spvDescriptorSet0.vp_c10)._m0[4].x, _404);
    float _414 = fma(_402, _402, _406);
    float _416 = fma(_394, (*spvDescriptorSet0.vp_c10)._m0[5].x, _408);
    float _418 = in.m_58.x;
    float _420 = in.m_58.y;
    float _422 = in.m_58.z;
    float _424 = fma(_394, (*spvDescriptorSet0.vp_c10)._m0[6].x, _410);
    float _426 = fma(_402, (*spvDescriptorSet0.vp_c10)._m0[4].z, _412);
    float _428 = sqrt(_414);
    float _430 = fma(_402, (*spvDescriptorSet0.vp_c10)._m0[6].z, _424);
    float _432 = fma(_402, (*spvDescriptorSet0.vp_c10)._m0[5].z, _416);
    bool _434 = _428 >= 9.9999999747524270787835121154785e-07;
    bool _436 = isnan(_428);
    bool _438 = _434 || _436;
    bool _440 = isnan(9.9999999747524270787835121154785e-07);
    bool _442 = _438 || _440;
    float _444 = fma(_380, _398, _418);
    float _446 = fma(_388, _398, _422);
    float _448 = fma(_368, _398, _420);
    float _450 = _380;
    float _452 = _388;
    float _454 = _432;
    if (_442)
    {
        _450 = _426;
    }
    float _456 = _450;
    float _458 = _456;
    if (_442)
    {
        _452 = _430;
    }
    float _460 = _452;
    float _462 = _460;
    if (!_442)
    {
        bool _464 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _466 = !_464;
        if (!_466)
        {
            float _468 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _470 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _472 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _474 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _468);
            float _476 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _470);
            float _478 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _472);
            float _480 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _474);
            float _482 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _476);
            float _484 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _478);
            float _486 = _480 * _480;
            float _488 = fma(_482, _482, _486);
            float _490 = fma(_484, _484, _488);
            float _492 = rsqrt(_490);
            float _494 = _492 * 9.9999999747524270787835121154785e-07;
            float _496 = _482 * _494;
            float _498 = _480 * _494;
            float _500 = _484 * _494;
            _454 = _498;
            _458 = _496;
            _462 = _500;
            _502 = true;
        }
        else
        {
            float _504 = _182 * _182;
            float _506 = fma(_180, _180, _504);
            float _508 = fma(_184, _184, _506);
            float _510 = sqrt(_508);
            bool _512 = _510 >= 9.9999999747524270787835121154785e-07;
            bool _514 = isnan(_510);
            bool _516 = _512 || _514;
            bool _518 = isnan(9.9999999747524270787835121154785e-07);
            bool _520 = _516 || _518;
            if (!_520)
            {
                float _522 = _420 * _420;
                float _524 = fma(_418, _418, _522);
                float _526 = fma(_422, _422, _524);
                float _528 = sqrt(_526);
                bool _530 = _528 >= 9.9999999747524270787835121154785e-07;
                bool _532 = isnan(_528);
                bool _534 = _530 || _532;
                bool _536 = isnan(9.9999999747524270787835121154785e-07);
                bool _538 = _534 || _536;
                if (!_538)
                {
                    float _540 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _542 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _540);
                    float _544 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _542);
                    float _546 = rsqrt(_544);
                    float _548 = _546 * 9.9999999747524270787835121154785e-07;
                    float _550 = _548 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _552 = _548 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _554 = _548 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _454 = _552;
                    _458 = _550;
                    _462 = _554;
                    _502 = true;
                }
                else
                {
                    float _556 = _420 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _558 = _420 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _560 = _420 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _562 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[5].x, _556);
                    float _564 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[4].x, _558);
                    float _566 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[6].x, _560);
                    float _568 = fma(_422, (*spvDescriptorSet0.vp_c10)._m0[5].z, _562);
                    float _570 = fma(_422, (*spvDescriptorSet0.vp_c10)._m0[4].z, _564);
                    float _572 = fma(_422, (*spvDescriptorSet0.vp_c10)._m0[6].z, _566);
                    float _574 = _568 * _568;
                    float _576 = fma(_570, _570, _574);
                    float _578 = fma(_572, _572, _576);
                    float _580 = rsqrt(_578);
                    float _582 = _580 * 9.9999999747524270787835121154785e-07;
                    float _584 = _570 * _582;
                    float _586 = _568 * _582;
                    float _588 = _572 * _582;
                    _454 = _586;
                    _458 = _584;
                    _462 = _588;
                    _502 = true;
                }
            }
            else
            {
                float _590 = _182 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _592 = _182 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _594 = _182 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _596 = fma(_180, (*spvDescriptorSet0.vp_c10)._m0[5].x, _590);
                float _598 = fma(_180, (*spvDescriptorSet0.vp_c10)._m0[4].x, _592);
                float _600 = fma(_180, (*spvDescriptorSet0.vp_c10)._m0[6].x, _594);
                float _602 = fma(_184, (*spvDescriptorSet0.vp_c10)._m0[5].z, _596);
                float _604 = fma(_184, (*spvDescriptorSet0.vp_c10)._m0[4].z, _598);
                float _606 = fma(_184, (*spvDescriptorSet0.vp_c10)._m0[6].z, _600);
                float _608 = _602 * _602;
                float _610 = fma(_604, _604, _608);
                float _612 = fma(_606, _606, _610);
                float _614 = rsqrt(_612);
                float _616 = _614 * 9.9999999747524270787835121154785e-07;
                float _618 = _604 * _616;
                float _620 = _602 * _616;
                float _622 = _606 * _616;
                _454 = _620;
                _458 = _618;
                _462 = _622;
            }
        }
    }
    _502 = false;
    float _624 = _454;
    float _626 = _458;
    float _628 = _462;
    bool _630 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _632 = !_630;
    float _650;
    if (!_632)
    {
        float _634 = in.m_67.x;
        float _636 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _638 = _634 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _640 = fma(_638, (*spvDescriptorSet0.vp_c9)._m0[12].x, _152);
        float _642 = _640 * _636;
        float _644 = floor(_642);
        float _646 = -_644;
        float _648 = _642 + _646;
        _650 = _648;
        _652 = true;
    }
    else
    {
        float _654 = float(_118);
        float _656 = 1.0 / _654;
        float _658 = _152 * _656;
        _650 = _658;
    }
    _652 = false;
    float _660 = _650;
    float _662 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _664 = _660 + _662;
    float _666 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _668 = _660 + _666;
    bool _670 = _660 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _672 = isnan(_660);
    bool _674 = _670 || _672;
    bool _676 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _678 = _674 || _676;
    float _680 = float(_678);
    float _682 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _684 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _682;
    float _686 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _688 = _660 + _686;
    float _690 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _692 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _690;
    float _694 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _696 = _694 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _698 = 1.0 / _684;
    bool _700 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _702 = 1.0 / _696;
    float _704 = 1.0 / _692;
    float _706 = _664 * _698;
    bool _708 = _660 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _710 = isnan(_660);
    bool _712 = _708 || _710;
    bool _714 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _716 = _712 || _714;
    float _718 = float(_716);
    float _720 = -_680;
    float _722 = _720 + 1.0;
    float _724 = _718 * _722;
    float _726 = _668 * _702;
    bool _728 = _660 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _730 = isnan(_660);
    bool _732 = _728 || _730;
    bool _734 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _736 = _732 || _734;
    float _738 = float(_736);
    float _740 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _742 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _740;
    bool _744 = _660 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _746 = isnan(_660);
    bool _748 = _744 || _746;
    bool _750 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _752 = _748 || _750;
    float _754 = float(_752);
    float _756 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _758 = _756 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _760 = -_718;
    float _762 = _760 + 1.0;
    float _764 = -_738;
    float _766 = _764 + 1.0;
    float _768 = _688 * _704;
    float _770 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _772 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _770;
    float _774 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _776 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _774;
    float _778 = _754 * _766;
    float _780 = fma(_742, _768, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _782 = fma(_772, _768, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _784 = fma(_776, _768, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _786 = _738 * _762;
    float _788 = -_754;
    float _790 = _788 + 1.0;
    float _792 = _782 * _778;
    float _794 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _796 = _794 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _798 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _800 = _798 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _802 = _784 * _778;
    float _804 = _780 * _778;
    float _806 = fma(_790, (*spvDescriptorSet0.vp_c9)._m0[143].x, _792);
    float _808 = fma(_790, (*spvDescriptorSet0.vp_c9)._m0[143].y, _802);
    float _810 = fma(_790, (*spvDescriptorSet0.vp_c9)._m0[143].z, _804);
    float _812 = fma(_758, _726, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _814 = fma(_796, _726, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _816 = fma(_800, _726, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _818 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _820 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _818;
    float _822 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _824 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _822;
    float _826 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _828 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _826;
    float _830 = fma(_812, _786, _806);
    float _832 = fma(_820, _706, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _834 = fma(_824, _706, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _836 = fma(_828, _706, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _838 = fma(_814, _786, _808);
    float _840 = fma(_816, _786, _810);
    float _842 = fma(_832, _724, _830);
    float _844 = fma(_834, _724, _838);
    float _846 = fma(_836, _724, _840);
    float _848 = fma(_680, (*spvDescriptorSet0.vp_c9)._m0[146].x, _842);
    float _850 = fma(_680, (*spvDescriptorSet0.vp_c9)._m0[146].y, _844);
    float _852 = fma(_680, (*spvDescriptorSet0.vp_c9)._m0[146].z, _846);
    bool _854 = !_700;
    float _856 = _852;
    float _858 = _850;
    float _876;
    if (!_854)
    {
        float _860 = in.m_67.x;
        float _862 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _864 = _860 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _866 = fma(_864, (*spvDescriptorSet0.vp_c9)._m0[11].y, _152);
        float _868 = _866 * _862;
        float _870 = floor(_868);
        float _872 = -_870;
        float _874 = _868 + _872;
        _876 = _874;
        _878 = true;
    }
    else
    {
        float _880 = float(_118);
        float _882 = 1.0 / _880;
        float _884 = _152 * _882;
        _876 = _884;
    }
    _878 = false;
    float _886 = _876;
    float _888 = in.m_69.x;
    float _890 = in.m_69.y;
    float _892 = in.m_69.z;
    float _894 = _448 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _896 = _448 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _898 = _448 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _900 = in.m_65.x;
    float _902 = in.m_65.y;
    float _904 = in.m_65.z;
    float _906 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _908 = log2(_906);
    float _910 = fma(_444, (*spvDescriptorSet0.vp_c10)._m0[5].x, _896);
    float _912 = fma(_444, (*spvDescriptorSet0.vp_c10)._m0[6].x, _898);
    float _914 = in.m_71.x;
    float _916 = in.m_71.y;
    float _918 = in.m_71.z;
    float _920 = fma(_444, (*spvDescriptorSet0.vp_c10)._m0[4].x, _894);
    float _922 = in.m_73.y;
    int _924 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _926 = _924 != 0;
    float _928 = fma(_446, (*spvDescriptorSet0.vp_c10)._m0[5].z, _910);
    int _930 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _932 = _930 != 0;
    float _934 = in.m_67.y;
    float _936 = fma(_446, (*spvDescriptorSet0.vp_c10)._m0[4].z, _920);
    float _938 = fma(_446, (*spvDescriptorSet0.vp_c10)._m0[6].z, _912);
    float _940 = in.m_67.x;
    float _942 = _928 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _944 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _888);
    bool _946 = _890 != 0.0;
    bool _948 = isnan(_890);
    bool _950 = _946 || _948;
    bool _952 = isnan(0.0);
    bool _954 = _950 || _952;
    float _956 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _890);
    float _958 = _848 * _900;
    bool _960 = _888 == 0.0;
    bool _962 = !_954;
    bool _964 = _960 && _962;
    float _966 = _850 * _902;
    float _968 = _936 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _970 = _892 == 0.0;
    bool _972 = _970 && _964;
    float _974 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _976 = _974 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _978 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _980 = _978 != 0;
    int _982 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _984 = _982 != 0;
    int _986 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _988 = _986 != 0;
    float _990 = _852 * _904;
    float _992 = 1.0 / _976;
    bool _994 = _934 > 0.5;
    float _996 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _998 = _996 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1000 = !_984;
    int _1002 = _1000 ? 0 : 1;
    float _1004 = _900;
    float _1006 = _894;
    float _1008 = _922;
    if (_972)
    {
        _1004 = _916;
    }
    float _1010 = _1004;
    float _1012 = 1.0 / _998;
    float _1014 = 0.0;
    float _1016 = _1010;
    if (_972)
    {
        _1014 = _918;
    }
    float _1018 = _1014;
    float _1020 = _1018;
    if (_972)
    {
        _1006 = _1010;
    }
    float _1022 = _1006;
    float _1024 = _1022;
    if (!_972)
    {
        _1016 = _916;
    }
    float _1026 = _1016;
    float _1028 = in.m_67.z;
    if (_972)
    {
        _856 = _914;
    }
    float _1030 = _856;
    float _1032 = _1030;
    if (!_972)
    {
        float _1034 = fma(_888, (*spvDescriptorSet0.vp_c9)._m0[17].y, _914);
        _1032 = _1034;
    }
    float _1036 = _1032;
    if (_972)
    {
        _858 = _1018;
    }
    float _1038 = _858;
    float _1040 = _1038;
    if (!_972)
    {
        float _1042 = fma(_890, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1026);
        _1024 = _1042;
    }
    float _1044 = _1024;
    if (!_972)
    {
        _1020 = _918;
    }
    float _1046 = _1020;
    float _1048 = _908 * _152;
    float _1050 = -_922;
    float _1052 = _1050 + 1.0;
    float _1054 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _892);
    float _1056 = exp2(_1048);
    if (!_972)
    {
        float _1058 = fma(_892, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1046);
        _1040 = _1058;
    }
    float _1060 = _1040;
    if (_932)
    {
        float _1062 = _994 ? _1052 : _922;
        _1008 = _1062;
    }
    float _1064 = _1008;
    float _1066 = _940 * 2.0;
    float _1068 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1070 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1068;
    bool _1072 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1074 = isnan(0.0);
    bool _1076 = _1072 || _1074;
    bool _1078 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1080 = _1076 || _1078;
    float _1082 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1084 = _1082 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1086 = floor(_1066);
    float _1088 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1090 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1092 = 1.0 + _1090;
    float _1094 = _1070 * _992;
    bool _1096 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1098 = isnan(1.0);
    bool _1100 = _1096 || _1098;
    bool _1102 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1104 = _1100 || _1102;
    float _1106 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1088);
    float _1108 = _1028 * 2.0;
    float _1110 = 1.0 / _1092;
    float _1112 = _934 + _1028;
    float _1114 = -_1056;
    float _1116 = _1114 + 1.0;
    float _1118 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1106);
    float _1120 = _1084 * _1012;
    float _1122 = _1112 + (-1.0);
    int _1124 = abs(_1002);
    float _1126 = _1080 ? _1116 : 0.0;
    float _1128 = _940 + _1028;
    bool _1130 = _1086 > 0.0;
    float _1132 = floor(_1108);
    bool _1134 = _1086 >= 0.0;
    bool _1136 = isnan(_1086);
    bool _1138 = _1134 || _1136;
    bool _1140 = isnan(0.0);
    bool _1142 = _1138 || _1140;
    float _1144 = _1128 + (-1.0);
    float _1146 = fma(_1122, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1148 = _934 * 2.0;
    int _1150 = _1142 ? 0 : 1;
    float _1152 = fma(_1144, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1154 = _624 * _624;
    float _1156 = _1146;
    if (_1104)
    {
        float _1158 = _1126 * _1110;
        _158 = _1158;
    }
    float _1160 = _158;
    int _1162 = ~_1150;
    int _1164 = _1162 + 1;
    int _1166 = _1164 + 1;
    float _1168 = rsqrt(_1118);
    float _1170 = fma(_626, _626, _1154);
    bool _1172 = _886 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1174 = isnan(_886);
    bool _1176 = _1172 || _1174;
    bool _1178 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1180 = _1176 || _1178;
    float _1182 = float(_1180);
    float _1184 = _1028 + (-0.5);
    int _1186 = _1166;
    if (!_1130)
    {
        int _1188 = ~_1150;
        int _1190 = _1188 + 1;
        _1186 = _1190;
    }
    int _1192 = _1186;
    float _1194 = fma(_628, _628, _1170);
    float _1196 = _940 + _934;
    bool _1198 = _886 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1200 = isnan(_886);
    bool _1202 = _1198 || _1200;
    bool _1204 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1206 = _1202 || _1204;
    float _1208 = float(_1206);
    float _1210 = floor(_1148);
    bool _1212 = _1132 > 0.0;
    float _1214 = _1196 + (-1.0);
    bool _1216 = _1132 >= 0.0;
    bool _1218 = isnan(_1132);
    bool _1220 = _1216 || _1218;
    bool _1222 = isnan(0.0);
    bool _1224 = _1220 || _1222;
    float _1226 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1228 = _886 + _1226;
    bool _1230 = _886 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1232 = isnan(_886);
    bool _1234 = _1230 || _1232;
    bool _1236 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1238 = _1234 || _1236;
    float _1240 = float(_1238);
    float _1242 = -_1208;
    float _1244 = _1242 + 1.0;
    float _1246 = rsqrt(_1194);
    float _1248 = -_1182;
    float _1250 = _1248 + 1.0;
    float _1252 = fma(_1094, _1228, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1254 = _1240 * _1244;
    int _1256 = _1224 ? 0 : 1;
    float _1258 = _1208 * _1250;
    float _1260 = fma(_1214, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1262 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1264 = _886 + _1262;
    bool _1266 = _1210 > 0.0;
    float _1268 = _934 + (-0.5);
    bool _1270 = _1210 >= 0.0;
    bool _1272 = isnan(_1210);
    bool _1274 = _1270 || _1272;
    bool _1276 = isnan(0.0);
    bool _1278 = _1274 || _1276;
    float _1280 = fma(_1120, _1264, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1282 = _1168 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1284 = _1252 * _1254;
    float _1286 = -_1240;
    float _1288 = _1286 + 1.0;
    int _1290 = _1278 ? 0 : 1;
    float _1292 = _1246 * _626;
    float _1294 = _1168 * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1296 = _1282 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1298 = _1246 * _624;
    float _1300 = fma(_1288, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1284);
    float _1302 = _1246 * _628;
    float _1304 = fma(_1294, (*spvDescriptorSet0.vp_c10)._m0[8].y, _1296);
    float _1306 = _1298 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1308 = _1168 * (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1310 = float(_1192);
    float _1312 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1314 = _942 + _1312;
    float _1316 = float(_1124);
    float _1318 = fma(_1292, (*spvDescriptorSet0.vp_c10)._m0[8].y, _1306);
    int _1320 = ~_1256;
    int _1322 = _1320 + 1;
    int _1324 = _1322 + 1;
    float _1326 = _1314 * _1314;
    int _1328 = _1324;
    float _1330 = _1260;
    if (!_1212)
    {
        int _1332 = ~_1256;
        int _1334 = _1332 + 1;
        _1328 = _1334;
    }
    int _1336 = _1328;
    float _1338 = fma(_1302, (*spvDescriptorSet0.vp_c10)._m0[10].y, _1318);
    float _1340 = _1316 * _1310;
    bool _1342 = !_980;
    int _1344 = _1342 ? 0 : 1;
    float _1346 = in.m_75.z;
    int _1348 = ~_1290;
    int _1350 = _1348 + 1;
    int _1352 = _1350 + 1;
    float _1354 = fma(_1308, (*spvDescriptorSet0.vp_c10)._m0[10].y, _1304);
    float _1356 = abs(_1338);
    bool _1358 = _1356 > 0.99989998340606689453125;
    float _1360 = _938 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1362 = !_988;
    int _1364 = _1362 ? 0 : 1;
    float _1366 = in.m_75.x;
    int _1368 = abs(_1344);
    float _1370 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1372 = _968 + _1370;
    int _1374 = _1352;
    if (!_1266)
    {
        int _1376 = ~_1290;
        int _1378 = _1376 + 1;
        _1374 = _1378;
    }
    int _1380 = _1374;
    float _1382 = _1340 * (-2.0);
    float _1384 = in.m_75.y;
    int _1386 = abs(_1364);
    float _1388 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1390 = _1360 + _1388;
    float _1392 = fma(_1372, _1372, _1326);
    float _1394 = float(_1380);
    float _1396 = fma(_1354, 1.57079637050628662109375, -1.57079637050628662109375);
    float _1398 = fma(_1390, _1390, _1392);
    float _1400 = float(_1368);
    float _1402 = float(_1386);
    float _1404 = float(_1336);
    float _1406 = rsqrt(_1398);
    bool _1408 = _940 > 0.5;
    bool _1410 = _1408 && _926;
    float _1412 = _1402 * _1394;
    float _1414 = _1400 * _1404;
    float _1416 = _940 + (-0.5);
    float _1418 = _1412 * (-2.0);
    float _1420 = _1396 + _1366;
    float _1422 = _1396;
    if (!_1358)
    {
        _1422 = (*spvDescriptorSet0.vp_c10)._m0[8].y;
    }
    float _1424 = _1422;
    float _1426 = fma(_1152, _1418, _1152);
    float _1428 = fma(_1382, _1384, _1384);
    float _1430 = fma(_1146, _1382, _1146);
    float _1432 = fma(_1418, _1346, _1346);
    float _1434 = _1424;
    if (_1358)
    {
        _1156 = 0.001000000047497451305389404296875;
    }
    float _1436 = _1156;
    float _1438 = fma(_1268, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1428);
    float _1440 = _1314 * _1406;
    float _1442 = _1372 * _1406;
    float _1444 = fma(_1184, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1432);
    float _1446 = fma(_1430, _1160, _1438);
    float _1448 = -_1440;
    float _1450 = fma(_1448, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1314);
    float _1452 = _1440;
    if (_1358)
    {
        float _1454 = fma(_1436, (*spvDescriptorSet0.vp_c10)._m0[8].z, (*spvDescriptorSet0.vp_c10)._m0[8].y);
        _1434 = _1454;
    }
    float _1456 = _1434;
    float _1458 = -_1442;
    float _1460 = fma(_1458, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1372);
    float _1462 = _1446 * 0.15915493667125701904296875;
    float _1464 = _1450 * _1450;
    float _1466 = _1414 * (-2.0);
    float _1468 = _1390 * _1406;
    float _1470 = fma(_1426, _1160, _1444);
    float _1472 = fma(_1260, _1466, _1260);
    float _1474 = fma(_1420, _1466, _1420);
    float _1476 = fma(_1460, _1460, _1464);
    float _1478 = in.m_73.x;
    float _1480 = _1462 * 6.283185482025146484375;
    float _1482 = sin(_1480);
    float _1484 = fma(_1416, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1474);
    float _1486 = -_1468;
    float _1488 = fma(_1486, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1390);
    float _1490 = _1464;
    float _1492 = _1456;
    if (!_1358)
    {
        _1330 = (*spvDescriptorSet0.vp_c10)._m0[10].y;
    }
    float _1494 = _1330;
    float _1496 = _1494;
    if (_1358)
    {
        float _1498 = fma(_1436, (*spvDescriptorSet0.vp_c10)._m0[10].z, (*spvDescriptorSet0.vp_c10)._m0[10].y);
        _1496 = _1498;
    }
    float _1500 = _1496;
    float _1502 = fma(_1472, _1160, _1484);
    if (!_1358)
    {
        _1490 = (*spvDescriptorSet0.vp_c10)._m0[9].y;
    }
    float _1504 = _1490;
    float _1506 = -_1456;
    float _1508 = _1302 * _1506;
    float _1510 = _1462 * 6.283185482025146484375;
    float _1512 = cos(_1510);
    float _1514 = fma(_1488, _1488, _1476);
    float _1516 = _1502 * 0.15915493667125701904296875;
    float _1518 = -_1500;
    float _1520 = _1298 * _1518;
    float _1522 = -_1500;
    float _1524 = -_1508;
    float _1526 = fma(_1292, _1522, _1524);
    float _1528 = _1470 * 0.15915493667125701904296875;
    float _1530 = sqrt(_1514);
    float _1532 = _1504;
    if (_1358)
    {
        float _1534 = fma(_1436, (*spvDescriptorSet0.vp_c10)._m0[9].z, (*spvDescriptorSet0.vp_c10)._m0[9].y);
        _1532 = _1534;
    }
    float _1536 = _1532;
    float _1538 = _1516 * 6.283185482025146484375;
    float _1540 = sin(_1538);
    float _1542 = -_1536;
    float _1544 = _1292 * _1542;
    float _1546 = -_1536;
    float _1548 = -_1520;
    float _1550 = fma(_1302, _1546, _1548);
    float _1552 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1554 = _1526 * _1526;
    float _1556 = -_1456;
    float _1558 = -_1544;
    float _1560 = fma(_1298, _1556, _1558);
    float _1562 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1564 = _1516 * 6.283185482025146484375;
    float _1566 = cos(_1564);
    float _1568 = fma(_1550, _1550, _1554);
    float _1570 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1572 = _1478;
    if (_926)
    {
        _1492 = _1478;
    }
    float _1574 = _1492;
    float _1576 = _1562 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1578 = fma(_1560, _1560, _1568);
    float _1580 = _1552 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1582 = _1570 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1584 = _1528 * 6.283185482025146484375;
    float _1586 = cos(_1584);
    float _1588 = _1574;
    if (_1410)
    {
        float _1590 = -_1574;
        float _1592 = _1590 + 1.0;
        _1588 = _1592;
    }
    float _1594 = _1588;
    float _1596 = fma(_1280, _1258, _1300);
    float _1598 = _1406 * _1530;
    out.m_77.x = _1576;
    out.m_77.y = _1580;
    out.m_77.z = _1582;
    if (_926)
    {
        _1572 = _1594;
    }
    float _1600 = _1572;
    float _1602 = _1540 * _1482;
    float _1604 = _1528 * 6.283185482025146484375;
    float _1606 = sin(_1604);
    float _1608 = _1566 * _1512;
    float _1610 = _1566 * _1482;
    float _1612 = fma(_1182, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1596);
    float _1614 = rsqrt(_1578);
    float _1616 = _958 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1618 = _1512 * _1586;
    float _1620 = _1540 * _1512;
    float _1622 = _1482 * _1586;
    float _1624 = _1566 * _1586;
    float _1626 = _1540 * _1586;
    float _1628 = _1598 * _1616;
    float _1630 = fma(_1606, _1608, _1602);
    float _1632 = fma(_1606, _1602, _1608);
    float _1634 = _966 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1636 = _990 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1638 = -_1610;
    float _1640 = fma(_1606, _1620, _1638);
    float _1642 = -_1620;
    float _1644 = fma(_1606, _1610, _1642);
    float _1646 = _1598 * _1634;
    float _1648 = _1292 * _1624;
    float _1650 = _1550 * _1614;
    float _1652 = _944 * _1628;
    float _1654 = _1598 * _1636;
    float _1656 = _1526 * _1614;
    float _1658 = _1560 * _1614;
    float _1660 = _956 * _1646;
    float _1662 = _1054 * _1654;
    float _1664 = _1302 * _1624;
    float _1666 = in.m_79.x;
    float _1668 = in.m_79.y;
    float _1670 = in.m_79.z;
    float _1672 = in.m_79.w;
    float _1674 = -_1606;
    float _1676 = fma(_1674, _1650, _1648);
    float _1678 = _1630 * _1292;
    float _1680 = -_1606;
    float _1682 = fma(_1680, _1658, _1664);
    float _1684 = _1630 * _1302;
    float _1686 = _1298 * _1658;
    float _1688 = _1292 * _1656;
    float _1690 = _1292 * _1644;
    float _1692 = fma(_1618, _1650, _1678);
    float _1694 = fma(_1618, _1658, _1684);
    float _1696 = -_1686;
    float _1698 = fma(_1302, _1656, _1696);
    float _1700 = -_1688;
    float _1702 = fma(_1298, _1650, _1700);
    float _1704 = _1302 * _1644;
    float _1706 = fma(_1622, _1650, _1690);
    float _1708 = fma(_1626, _1698, _1676);
    float _1710 = fma(_1626, _1702, _1682);
    float _1712 = fma(_1622, _1658, _1704);
    float _1714 = fma(_1640, _1698, _1692);
    float _1716 = _1660 * _1708;
    float _1718 = fma(_1640, _1702, _1694);
    float _1720 = _1660 * _1710;
    float _1722 = fma(_1632, _1698, _1706);
    float _1724 = fma(_1632, _1702, _1712);
    float _1726 = fma(_1652, _1714, _1716);
    float _1728 = fma(_1652, _1718, _1720);
    float _1730 = _1670 * _914;
    float _1732 = _1666 * _1026;
    float _1734 = fma(_1662, _1722, _1726);
    float _1736 = fma(_1662, _1724, _1728);
    float _1738 = -_1730;
    float _1740 = fma(_1666, _1046, _1738);
    float _1742 = _1668 * _1046;
    float _1744 = _968 + _1734;
    float _1746 = _1360 + _1736;
    float _1748 = -_1732;
    float _1750 = fma(_1668, _914, _1748);
    float _1752 = -_1742;
    float _1754 = fma(_1670, _1026, _1752);
    float _1756 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1758 = _1744 + _1756;
    float _1760 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1762 = _1746 + _1760;
    float _1764 = _1298 * _1624;
    float _1766 = _1302 * _1650;
    float _1768 = _1758 * _1758;
    float _1770 = _1762 * _1762;
    float _1772 = -_1606;
    float _1774 = fma(_1772, _1656, _1764);
    float _1776 = _1630 * _1298;
    float _1778 = -_1766;
    float _1780 = fma(_1292, _1658, _1778);
    float _1782 = _1768 + _1770;
    float _1784 = _1298 * _1644;
    float _1786 = fma(_1618, _1656, _1776);
    float _1788 = fma(_1626, _1780, _1774);
    float _1790 = sqrt(_1782);
    float _1792 = fma(_1622, _1656, _1784);
    float _1794 = fma(_1640, _1780, _1786);
    float _1796 = _1660 * _1788;
    float _1798 = _1740 * _1672;
    float _1800 = _1754 * _1672;
    float _1802 = _1750 * _1672;
    float _1804 = fma(_1632, _1780, _1792);
    float _1806 = fma(_1652, _1794, _1796);
    float _1808 = _1708 * _1668;
    float _1810 = _1788 * _1668;
    float _1812 = _1710 * _1668;
    float _1814 = _1708 * _1044;
    float _1816 = _1788 * _1044;
    float _1818 = _1710 * _1044;
    float _1820 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1822 = _1790 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1824 = _1708 * _1798;
    float _1826 = _1788 * _1798;
    float _1828 = fma(_1662, _1804, _1806);
    float _1830 = _1710 * _1798;
    float _1832 = fma(_1714, _1666, _1808);
    float _1834 = fma(_1714, _1036, _1814);
    float _1836 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1838 = fma(_1714, _1800, _1824);
    float _1840 = _942 + _1828;
    float _1842 = fma(_1794, _1666, _1810);
    float _1844 = fma(_1718, _1666, _1812);
    float _1846 = _1808;
    float _1848 = _1828;
    float _1850 = _1814;
    float _1852 = _1768;
    float _1854 = _1770;
    float _1856 = _1806;
    float _1858 = _1832;
    if (!_1822)
    {
        _1846 = _1744;
    }
    float _1860 = _1846;
    float _1862 = _1860;
    if (!_1822)
    {
        _1848 = _1746;
    }
    float _1864 = _1848;
    float _1866 = _1864;
    if (!_1822)
    {
        _1850 = _1840;
    }
    float _1868 = _1850;
    bool _1870 = !_1822;
    float _1872 = _1868;
    if (!_1870)
    {
        float _1874 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1876 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1878 = _1790 + _1876;
        float _1880 = _1840 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1882 = rsqrt(_1782);
        float _1884 = _1878 * _1874;
        float _1886 = _1884 * 0.15915493667125701904296875;
        float _1888 = _1886 * 6.283185482025146484375;
        float _1890 = sin(_1888);
        float _1892 = _1886 * 6.283185482025146484375;
        float _1894 = cos(_1892);
        float _1896 = fma(_1890, _1880, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1898 = _1882 * _1896;
        float _1900 = fma(_1758, _1898, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1902 = _1894 + (-1.0);
        float _1904 = fma(_1762, _1898, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1906 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1908 = _1900 + _1906;
        float _1910 = _1902 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1912 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1914 = _1904 + _1912;
        float _1916 = _1908 * _1908;
        float _1918 = fma(_1840, _1894, _1910);
        float _1920 = _1914 * _1914;
        _1872 = _1918;
        _1852 = _1916;
        _1854 = _1920;
        _1862 = _1900;
        _1866 = _1904;
        _1856 = _1886;
    }
    float _1922 = _1872;
    float _1924 = _1852;
    float _1926 = _1854;
    float _1928 = _1862;
    float _1930 = _1866;
    float _1932 = _1856;
    float _1934 = fma(_1794, _1036, _1816);
    float _1936 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1938 = _1922 + _1936;
    float _1940 = fma(_1718, _1036, _1818);
    float _1942 = fma(_1938, _1938, _1924);
    float _1944 = _1064 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1946 = fma(_1794, _1800, _1826);
    float _1948 = _1942 + _1926;
    float _1950 = fma(_1718, _1800, _1830);
    float _1952 = _1600 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1954 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1956 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1958 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1960 = sqrt(_1948);
    float _1962 = _1944 * _1836;
    float _1964 = fma(_1722, _1670, _1832);
    float _1966 = fma(_1804, _1670, _1842);
    float _1968 = _1952 * _1820;
    float _1970 = fma(_1722, _1802, _1838);
    float _1972 = fma(_1804, _1802, _1946);
    float _1974 = fma(_1724, _1802, _1950);
    float _1976 = fma(_1724, _1670, _1844);
    float _1978 = fma(_1722, _1060, _1834);
    float _1980 = _1954 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1982 = _1956 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1984 = _1958 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1986 = _1612 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1988 = fma(_1804, _1060, _1934);
    float _1990 = fma(_1724, _1060, _1940);
    out.m_81.x = _1968;
    out.m_81.y = _1962;
    bool _1992 = _1960 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1994 = isnan(_1960);
    bool _1996 = _1992 || _1994;
    bool _1998 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2000 = _1996 || _1998;
    out.m_83.x = _1980;
    out.m_83.y = _1982;
    out.m_83.z = _1984;
    out.m_83.w = _1986;
    out.m_85.x = _1964;
    out.m_85.y = _1966;
    out.m_85.z = _1976;
    out.m_87.x = _1970;
    out.m_87.y = _1972;
    out.m_87.z = _1974;
    float _2002 = _1932;
    if (!_2000)
    {
        _2002 = 1.0;
    }
    float _2004 = _2002;
    out.m_89.x = _1978;
    out.m_89.y = _1988;
    out.m_89.z = _1990;
    bool _2006 = !_2000;
    float _2008 = _2004;
    if (!_2006)
    {
        bool _2010 = _1960 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2012 = isnan(_1960);
        bool _2014 = _2010 || _2012;
        bool _2016 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2018 = _2014 || _2016;
        if (!_2018)
        {
            float _2020 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2022 = _1960 + _2020;
            float _2024 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2026 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2024;
            float _2028 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2030 = _2028 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2032 = 1.0 / _2026;
            float _2034 = _2022 * _2032;
            float _2036 = fma(_2034, _2030, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2008 = _2036;
            _2038 = true;
        }
        else
        {
            bool _2040 = _1960 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2042 = isnan(_1960);
            bool _2044 = _2040 || _2042;
            bool _2046 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2048 = _2044 || _2046;
            if (!_2048)
            {
                float _2050 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2052 = _1960 + _2050;
                float _2054 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2056 = _2054 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2058 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2060 = _2058 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2062 = 1.0 / _2056;
                float _2064 = _2052 * _2062;
                float _2066 = fma(_2064, _2060, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2008 = _2066;
                _2038 = true;
            }
            else
            {
                _2008 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2038 = false;
    float _2068 = _2008;
    float _2070 = -_1442;
    float _2072 = fma(_2070, (*spvDescriptorSet0.vp_c9)._m0[18].w, _968);
    float _2074 = -_1468;
    float _2076 = fma(_2074, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1360);
    float _2078 = fma(_2072, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2080 = fma(_2076, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2082 = floor(_2078);
    float _2084 = floor(_2080);
    float _2086 = -_2082;
    float _2088 = _2078 + _2086;
    float _2090 = -_2084;
    float _2092 = _2080 + _2090;
    float2 _6829 = float2(_2088, _2092);
    float _2094 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6829, float2(0.0), isnan(_6829)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6829, float2(0.0), isnan(_6829)), level(0.0)).x;
    float _2096 = -_1440;
    float _2098 = fma(_2096, (*spvDescriptorSet0.vp_c9)._m0[18].w, _942);
    float _2100 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _2102 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2104 = _1928 + _2102;
    float _2106 = _2098 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2108 = _2098 + _2100;
    float _2110 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2112 = _1922 + _2110;
    float _2114 = fma(_2072, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2106);
    float _2116 = _2108 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _2118 = _2108 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _2120 = fma(_2076, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2114);
    float _2122 = _2098 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2124 = fma(_2072, (*spvDescriptorSet0.vp_c15)._m0[126].x, _2116);
    float _2126 = fma(_2072, (*spvDescriptorSet0.vp_c15)._m0[127].x, _2118);
    float _2128 = _2120 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2130 = fma(_2072, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2122);
    float _2132 = fma(_2076, (*spvDescriptorSet0.vp_c15)._m0[126].z, _2124);
    float _2134 = fma(_2076, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2126);
    float _2136 = 1.0 / _2128;
    float _2138 = fma(_2076, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2130);
    float _2140 = _2132 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _2142 = _2134 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _2144 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2146 = _1930 + _2144;
    float _2148 = _2138 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2150 = fma(_2104, _2068, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2152 = fma(_2112, _2068, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2154 = trunc(_2142);
    int _2156 = int(_2154);
    float _2158 = _2148 + _2128;
    float _2160 = -_1442;
    float _2162 = fma(_2160, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2150);
    float _2164 = fma(_2146, _2068, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2166 = -_1468;
    float _2168 = fma(_2166, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2164);
    float _2170 = _2158 * _2136;
    float _2172 = _2170 * 0.5;
    float _2174 = trunc(_2140);
    int _2176 = int(_2174);
    float _2178 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2180 = fma(_2172, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2178);
    int _2182 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _2184 = _2156 + _2182;
    int _2186 = _2184 + 1;
    float _2188 = 1.0 / _2180;
    int _2190 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2192 = _2176 + _2190;
    int _2194 = _2192 + 1;
    bool _2196 = _2194 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _2198 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2200 = _2188 * _2198;
    int _2202 = _2194 | _2186;
    bool _2204 = _2200 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _2206 = _2202 < 0;
    bool _2208 = _2206 || _2196;
    bool _2210 = _2200 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _2212 = _2186 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _2214 = _2212 || _2208;
    bool _2216 = !_2204;
    int _2218 = _2216 ? 0 : 1;
    int _2220 = 2;
    int _2222 = _2186;
    int _2224 = _2194;
    int _2226 = _2218;
    float _2228 = _2162;
    float _2230 = _2168;
    float _2232 = _2142;
    float _2234 = _2140;
    float _2236 = _2072;
    float _2238 = _2098;
    if (!_2204)
    {
        _2220 = 1;
    }
    int _2240 = _2220;
    int _2242 = _2240;
    if (!_2210)
    {
        _2242 = _2218;
    }
    int _2244 = _2242;
    float _2246 = as_type<float>(_2244);
    if (!_2214)
    {
        int _2248 = _2186 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _2250 = _2248 + _2194;
        _2222 = _2250;
    }
    int _2252 = _2222;
    bool _2254 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2256 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2258 = _2254 || _2256;
    bool _2260 = isnan(0.5);
    bool _2262 = _2258 || _2260;
    int _2264 = _2244 << 6;
    float _2266 = as_type<float>(_2264);
    if (!_2214)
    {
        int _2268 = _2252 << 2;
        _2224 = _2268;
    }
    int _2270 = _2224;
    int _2272 = _2264 + 96;
    uint _2275 = uint(int(uint(_2272) >> uint(2)));
    uint _2277 = uint(int(uint(int(_2275)) >> uint(2)));
    int _2279 = int(_2275) & 3;
    float _2281 = (*spvDescriptorSet0.vp_c15)._m0[int(_2277)][_2279];
    int _2283 = int(_2275) + 1;
    uint _2285 = uint(int(uint(_2283) >> uint(2)));
    int _2287 = _2283 & 3;
    float _2289 = (*spvDescriptorSet0.vp_c15)._m0[int(_2285)][_2287];
    int _2291 = _2270;
    if (!_2214)
    {
        uint _2293 = uint(int(uint(_2252) >> uint(2)));
        _2226 = int(_2293);
    }
    int _2295 = _2226;
    if (!_2214)
    {
        int _2297 = 12 & _2270;
        _2291 = _2297;
    }
    int _2299 = _2291;
    if (!_2214)
    {
        int _2301 = _2295 << 4;
        int _2303 = _2301 + _2299;
        _1858 = as_type<float>(_2303);
    }
    float _2305 = _1858;
    int _2307 = _2264 + 48;
    uint _2309 = uint(int(uint(_2307) >> uint(2)));
    uint _2311 = uint(int(uint(int(_2309)) >> uint(2)));
    int _2313 = int(_2309) & 3;
    float _2315 = (*spvDescriptorSet0.vp_c15)._m0[int(_2311)][_2313];
    int _2317 = int(_2309) + 1;
    uint _2319 = uint(int(uint(_2317) >> uint(2)));
    int _2321 = _2317 & 3;
    float _2323 = (*spvDescriptorSet0.vp_c15)._m0[int(_2319)][_2321];
    int _2325 = _2264 + 64;
    uint _2327 = uint(int(uint(_2325) >> uint(2)));
    uint _2329 = uint(int(uint(int(_2327)) >> uint(2)));
    int _2331 = int(_2327) & 3;
    float _2333 = (*spvDescriptorSet0.vp_c15)._m0[int(_2329)][_2331];
    int _2335 = int(_2327) + 1;
    uint _2337 = uint(int(uint(_2335) >> uint(2)));
    int _2339 = _2335 & 3;
    float _2341 = (*spvDescriptorSet0.vp_c15)._m0[int(_2337)][_2339];
    int _2343 = _2264 + 104;
    uint _2345 = uint(int(uint(_2343) >> uint(2)));
    uint _2347 = uint(int(uint(int(_2345)) >> uint(2)));
    int _2349 = int(_2345) & 3;
    float _2351 = (*spvDescriptorSet0.vp_c15)._m0[int(_2347)][_2349];
    int _2353 = int(_2345) + 1;
    uint _2355 = uint(int(uint(_2353) >> uint(2)));
    int _2357 = _2353 & 3;
    float _2359 = (*spvDescriptorSet0.vp_c15)._m0[int(_2355)][_2357];
    int _2361 = _2264 + 56;
    uint _2363 = uint(int(uint(_2361) >> uint(2)));
    uint _2365 = uint(int(uint(int(_2363)) >> uint(2)));
    int _2367 = int(_2363) & 3;
    float _2369 = (*spvDescriptorSet0.vp_c15)._m0[int(_2365)][_2367];
    int _2371 = int(_2363) + 1;
    uint _2373 = uint(int(uint(_2371) >> uint(2)));
    int _2375 = _2371 & 3;
    float _2377 = (*spvDescriptorSet0.vp_c15)._m0[int(_2373)][_2375];
    int _2379 = _2264 + 72;
    uint _2381 = uint(int(uint(_2379) >> uint(2)));
    uint _2383 = uint(int(uint(int(_2381)) >> uint(2)));
    int _2385 = int(_2381) & 3;
    float _2387 = (*spvDescriptorSet0.vp_c15)._m0[int(_2383)][_2385];
    int _2389 = int(_2381) + 1;
    uint _2391 = uint(int(uint(_2389) >> uint(2)));
    int _2393 = _2389 & 3;
    float _2395 = (*spvDescriptorSet0.vp_c15)._m0[int(_2391)][_2393];
    int _2397 = _2264 + 80;
    uint _2399 = uint(int(uint(_2397) >> uint(2)));
    uint _2401 = uint(int(uint(int(_2399)) >> uint(2)));
    int _2403 = int(_2399) & 3;
    float _2405 = (*spvDescriptorSet0.vp_c15)._m0[int(_2401)][_2403];
    int _2407 = int(_2399) + 1;
    uint _2409 = uint(int(uint(_2407) >> uint(2)));
    int _2411 = _2407 & 3;
    float _2413 = (*spvDescriptorSet0.vp_c15)._m0[int(_2409)][_2411];
    float _2415 = _2108 * _2289;
    float _2417 = fma(_2072, _2281, _2415);
    float _2419 = -_1440;
    float _2421 = fma(_2419, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2152);
    if (_2262)
    {
        _1452 = _2162;
    }
    float _2423 = _1452;
    float _2425 = _2305;
    float _2427 = _2423;
    if (!_2214)
    {
        int _2429 = as_type<int>(_2305) + 400;
        uint _2431 = uint(int(uint(_2429) >> uint(2)));
        uint _2433 = uint(int(uint(int(_2431)) >> uint(2)));
        int _2435 = int(_2431) & 3;
        float _2437 = (*spvDescriptorSet0.vp_c15)._m0[int(_2433)][_2435];
        _2425 = _2437;
    }
    float _2439 = _2425;
    float _2441 = _2108 * _2323;
    if (_2262)
    {
        _2228 = _2421;
    }
    float _2443 = _2228;
    float _2445 = fma(_2072, _2315, _2441);
    float _2447 = _2108 * _2341;
    float _2449 = fma(_2072, _2333, _2447);
    float _2451 = fma(_2076, _2351, _2417);
    float _2453 = _2443;
    float _2455 = _2341;
    if (!_2262)
    {
        float _2457 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2459 = _2098 + _2457;
        float _2461 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2463 = _2072 + _2461;
        float _2465 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2467 = -_1360;
        float _2469 = _2467 + _2164;
        float _2471 = _2459 * _2459;
        float _2473 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2475 = _2076 + _2473;
        float _2477 = -_942;
        float _2479 = _2477 + _2152;
        float _2481 = -_968;
        float _2483 = _2481 + _2150;
        float _2485 = fma(_2463, _2463, _2471);
        float _2487 = 1.0 / _1598;
        float _2489 = fma(_2475, _2475, _2485);
        float _2491 = sqrt(_2489);
        float _2493 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2495 = precise::min(_2491, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2497 = _2495 * _2465;
        float _2499 = _2493 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2501 = _2497 * _2487;
        float _2503 = _2499 * _2501;
        float _2505 = _2469 * _2501;
        float _2507 = fma(_2479, _2503, _2098);
        float _2509 = fma(_2483, _2503, _2072);
        float _2511 = fma(_2499, _2505, _2076);
        _2453 = _2507;
        _2427 = _2509;
        _2230 = _2511;
    }
    float _2513 = _2453;
    float _2515 = _2427;
    float _2517 = _2230;
    float _2519 = _2451 + _2359;
    float _2521 = fma(_2076, _2387, _2449);
    int _2523 = _2264 + 88;
    uint _2525 = uint(int(uint(_2523) >> uint(2)));
    uint _2527 = uint(int(uint(int(_2525)) >> uint(2)));
    int _2529 = int(_2525) & 3;
    float _2531 = (*spvDescriptorSet0.vp_c15)._m0[int(_2527)][_2529];
    int _2533 = int(_2525) + 1;
    uint _2535 = uint(int(uint(_2533) >> uint(2)));
    int _2537 = _2533 & 3;
    float _2539 = (*spvDescriptorSet0.vp_c15)._m0[int(_2535)][_2537];
    float _2541 = fma(_2076, _2369, _2445);
    float _2543 = _2513 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2545 = _2521 + _2395;
    float _2547 = 1.0 / _2519;
    float _2549 = _2513 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2551 = _2541 + _2377;
    float _2553 = _2513 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2555 = fma(_2515, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2543);
    float _2557 = fma(_2515, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2549);
    float _2559 = _2513 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2561 = fma(_2515, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2553);
    float _2563 = fma(_2517, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2555);
    float _2565 = fma(_2517, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2557);
    float _2567 = fma(_2515, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2559);
    float _2569 = fma(_2517, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2561);
    float _2571 = _2563 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2573 = _2565 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2575 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2577 = _2569 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2579 = _2551 * _2547;
    float _2581 = _2545 * _2547;
    float _2583 = _2573 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2585 = _2577 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2587 = fma(_2517, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2567);
    bool _2589 = _2579 >= 0.0;
    float _2591 = -_2583;
    float _2593 = fma(_2591, _2575, 1.0);
    float _2595 = fma(_2571, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2585);
    float _2597 = _2587 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    bool _2599 = _2579 <= 1.0;
    bool _2601 = _2599 && _2589;
    float _2603 = _2445;
    if (!_2214)
    {
        float _2605 = floor(_2140);
        _2603 = _2605;
    }
    float _2607 = _2603;
    float _2609 = fma(_2573, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2595);
    float _2611 = _2108 * _2413;
    bool _2613 = _2581 >= 0.0;
    bool _2615 = _2613 && _2601;
    float _2617 = _2577 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2619 = fma(_2597, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2609);
    float _2621 = _2577 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    bool _2623 = _2581 <= 1.0;
    bool _2625 = _2623 && _2615;
    float _2627 = log2(_2593);
    float _2629 = fma(_2072, _2405, _2611);
    float _2631 = fma(_2571, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2617);
    float _2633 = fma(_2573, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2631);
    float _2635 = 1.0 / _2619;
    float _2637 = fma(_2571, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2621);
    float _2639 = fma(_2076, _2531, _2629);
    float _2641 = fma(_2597, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2633);
    float _2643 = _2641;
    if (_2625)
    {
        float _2645 = float(_2244);
        _2246 = _2645;
    }
    float _2647 = _2246;
    float _2649 = fma(_2573, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2637);
    float _2651 = _2639 + _2539;
    if (!_2214)
    {
        float _2653 = -_2607;
        float _2655 = _2140 + _2653;
        _2266 = _2655;
    }
    float _2657 = _2266;
    float _2659 = _2551;
    if (!_2214)
    {
        float _2661 = floor(_2142);
        _2659 = _2661;
    }
    float _2663 = _2659;
    float _2665 = fma(_2597, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2649);
    float _2667 = _2627 * 0.693147182464599609375;
    float _2669 = _2651 * _2547;
    float _2671 = _2667 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2673 = _2439;
    float _2675 = _2669;
    if (!_2214)
    {
        float _2677 = rint(_2439);
        float _2679 = precise::max(_2677, 0.0);
        uint _2681 = uint(_2679);
        uint _2683 = clamp(_2681, 0u, 65535u);
        _2673 = as_type<float>(_2683);
    }
    float _2685 = _2673;
    float _2687 = _2641 * _2635;
    float _2689 = _2665 * _2635;
    float _2691 = fma(_2687, 0.5, 0.5);
    float _2693 = fma(_2689, -0.5, 0.5);
    float _2695 = _2629;
    float _2697 = _2691;
    if (_2625)
    {
        float _2699 = rint(_2647);
        float _2701 = precise::max(_2699, 0.0);
        uint _2703 = uint(_2701);
        uint _2705 = clamp(_2703, 0u, 65535u);
        _2695 = as_type<float>(_2705);
    }
    float _2707 = _2695;
    if (!_2214)
    {
        float _2709 = -_2663;
        float _2711 = _2142 + _2709;
        _2232 = _2711;
    }
    float _2713 = _2232;
    float _2715 = _2685;
    if (!_2214)
    {
        float3 _7882 = float3(_2657, _2713, float(as_type<int>(_2685)));
        float3 _7886 = select(_7882, float3(0.0), isnan(_7882));
        float _2717 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _7886.xy, uint(rint(_7886.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _7886.xy, uint(rint(_7886.z)), level(0.0)).x;
        _2715 = _2717;
    }
    float _2719 = _2715;
    float _2721 = _2581;
    if (_2625)
    {
        float3 _7901 = float3(_2579, _2581, float(as_type<int>(_2707)));
        float3 _7903 = select(_7901, float3(0.0), isnan(_7901));
        float _2723 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _7903.xy, uint(rint(_7903.z)), _2669, level(0.0));
        _2721 = _2723;
    }
    float _2725 = _2721;
    float3 _7913 = float3(_2691, _2693, _2671);
    float _2727 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7913, float3(0.0), isnan(_7913)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7913, float3(0.0), isnan(_7913)), level(0.0)).x;
    float3 _7922 = float3(_2691, _2693, _2671);
    float4 _2730 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7922, float3(0.0), isnan(_7922)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7922, float3(0.0), isnan(_7922)), level(0.0)).xyzw;
    float _2732 = _2730.x;
    float _2734 = _2730.y;
    float _2736 = _2730.z;
    float _2738 = _2730.w;
    bool _2740 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2742 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2744 = _2740 || _2742;
    bool _2746 = isnan(0.5);
    bool _2748 = _2744 || _2746;
    if (_2748)
    {
        _2455 = 1.0;
    }
    float _2750 = _2455;
    float _2752 = _2750;
    float _2754 = _2725;
    if (!_2748)
    {
        float _2756 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2758 = _2756 * 0.15915493667125701904296875;
        float _2760 = _2758 * 6.283185482025146484375;
        float _2762 = cos(_2760);
        float _2764 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2766 = _2764 * 0.15915493667125701904296875;
        float _2768 = _2758 * 6.283185482025146484375;
        float _2770 = sin(_2768);
        float _2772 = 1.0 / _2762;
        float _2774 = _2766 * 6.283185482025146484375;
        float _2776 = cos(_2774);
        float _2778 = _2770 * _2772;
        float _2780 = _2766 * 6.283185482025146484375;
        float _2782 = sin(_2780);
        float _2784 = _2776 * _2778;
        float _2786 = 1.0 / _2784;
        float _2788 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2790 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2788;
        float _2792 = 1.0 / _2790;
        float _2794 = _2782 * _2786;
        float _2796 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2798 = fma(_2200, _2794, _2796);
        float _2800 = _2798 * _2792;
        float _2802 = precise::clamp(_2800, 0.0, 1.0);
        _2697 = _2766;
        _2752 = _2802;
    }
    float _2804 = _2697;
    float _2806 = _2752;
    float _2808 = _2804;
    if (_2214)
    {
        _2234 = 1.0;
    }
    float _2810 = _2234;
    float _2812 = _2810;
    if (!_2214)
    {
        int _2814 = _2252 << 4;
        int _2816 = _2814 + 2048;
        uint _2818 = uint(int(uint(_2816) >> uint(2)));
        uint _2820 = uint(int(uint(int(_2818)) >> uint(2)));
        int _2822 = int(_2818) & 3;
        float _2824 = (*spvDescriptorSet0.vp_c15)._m0[int(_2820)][_2822];
        int _2826 = int(_2818) + 1;
        uint _2828 = uint(int(uint(_2826) >> uint(2)));
        int _2830 = _2826 & 3;
        float _2832 = (*spvDescriptorSet0.vp_c15)._m0[int(_2828)][_2830];
        int _2834 = _2816 + 8;
        uint _2836 = uint(int(uint(_2834) >> uint(2)));
        uint _2838 = uint(int(uint(int(_2836)) >> uint(2)));
        int _2840 = int(_2836) & 3;
        float _2842 = (*spvDescriptorSet0.vp_c15)._m0[int(_2838)][_2840];
        int _2844 = int(_2836) + 1;
        uint _2846 = uint(int(uint(_2844) >> uint(2)));
        int _2848 = _2844 & 3;
        float _2850 = (*spvDescriptorSet0.vp_c15)._m0[int(_2846)][_2848];
        float _2852 = _2108 * _2832;
        float _2854 = fma(_2072, _2824, _2852);
        float _2856 = fma(_2076, _2842, _2854);
        float _2858 = _2856 + _2850;
        float _2860 = precise::clamp(_2858, 0.0, 1.0);
        float _2862 = -_2860;
        float _2864 = _2862 + _2719;
        float _2866 = fma(_2864, 500.0, 1.5);
        float _2868 = exp2(_2866);
        float _2870 = 0.0 + _2868;
        float _2872 = precise::clamp(_2870, 0.0, 1.0);
        _2812 = _2872;
    }
    float _2874 = _2812;
    float _2876 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2878 = _2513 + _2876;
    float _2880 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2882 = _2515 + _2880;
    float _2884 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2886 = _2517 + _2884;
    float _2888 = _2878 * _2878;
    float _2890 = fma(_2882, _2882, _2888);
    float _2892 = fma(_2886, _2886, _2890);
    float _2894 = rsqrt(_2892);
    float _2896 = sqrt(_2892);
    float _2898 = _2894 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2900 = _2882 * _2898;
    float _2902 = _2886 * _2898;
    float _2904 = _2900 * _2900;
    float _2906 = _2902 * _2902;
    float _2908 = _2904 + _2906;
    float _2910 = sqrt(_2908);
    bool _2912 = _2910 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2914 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2916 = _2910 + _2914;
    float _2918 = _2886;
    float _2920 = _2916;
    float _2922 = _2878;
    if (_2912)
    {
        float _2924 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2918 = _2924;
    }
    float _2926 = _2918;
    if (_2912)
    {
        float _2928 = rsqrt(_2908);
        _2236 = _2928;
    }
    float _2930 = _2236;
    float _2932 = _2930;
    if (_2912)
    {
        float _2934 = _2916 * _2926;
        _2920 = _2934;
    }
    float _2936 = _2920;
    if (_2912)
    {
        float _2938 = _2936 * 0.15915493667125701904296875;
        _2808 = _2938;
    }
    float _2940 = _2808;
    float _2942 = _2888;
    if (_2912)
    {
        float _2944 = _2940 * 6.283185482025146484375;
        float _2946 = sin(_2944);
        _2942 = _2946;
    }
    float _2948 = _2942;
    float _2950 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2952 = precise::max(0.0, _2950);
    float _2954 = _2894;
    float _2956 = _2952;
    float _2958 = _2950;
    if (_2912)
    {
        float _2960 = _2940 * 6.283185482025146484375;
        float _2962 = cos(_2960);
        _2954 = _2962;
    }
    float _2964 = _2954;
    float _2966 = -_2898;
    float _2968 = -_2952;
    float _2970 = fma(_2878, _2966, _2968);
    if (!_2912)
    {
        _2956 = _2900;
    }
    float _2972 = _2956;
    float _2974 = _2972;
    if (_2912)
    {
        float _2976 = _2970 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2958 = _2976;
    }
    float _2978 = _2958;
    float _2980 = _2948;
    float _2982 = _2978;
    if (_2912)
    {
        float _2984 = fma(_2948, _2978, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2922 = _2984;
    }
    float _2986 = _2922;
    float _2988 = _2986;
    if (!_2912)
    {
        _2980 = _2904;
    }
    float _2990 = _2980;
    float _2992 = _2990;
    float _2994 = _2964;
    if (_2912)
    {
        float _2996 = _2964 + (-1.0);
        _2982 = _2996;
    }
    float _2998 = _2982;
    float _3000 = _2998;
    if (_2912)
    {
        float _3002 = _2930 * _2986;
        _2238 = _3002;
    }
    float _3004 = _2238;
    if (!_2912)
    {
        _2988 = _2970;
    }
    float _3006 = _2988;
    float _3008 = _3006;
    if (_2912)
    {
        float _3010 = _2998 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2932 = _3010;
    }
    float _3012 = _2932;
    if (_2912)
    {
        float _3014 = _2900 * _3004;
        _2974 = _3014;
    }
    float _3016 = _2974;
    if (!_2912)
    {
        _3000 = _2902;
    }
    float _3018 = _3000;
    float _3020 = _3018;
    if (_2912)
    {
        float _3022 = _2902 * _3004;
        _3020 = _3022;
    }
    float _3024 = _3020;
    if (_2912)
    {
        float _3026 = fma(_2970, _2964, _3012);
        _3008 = _3026;
    }
    float _3028 = _3008;
    if (_2912)
    {
        float _3030 = _3016 * _3016;
        _2992 = _3030;
    }
    float _3032 = _2992;
    if (!_2912)
    {
        _2994 = _2906;
    }
    float _3034 = _2994;
    float _3036 = _3034;
    if (_2912)
    {
        float _3038 = _3024 * _3024;
        _3036 = _3038;
    }
    float _3040 = _3036;
    float _3042 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3044 = fma(_2896, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3042);
    float _3046 = precise::clamp(_3044, 0.0, 1.0);
    float _3048 = fma(_3028, _3028, _3032);
    float _3050 = -_3046;
    float _3052 = _3050 + 1.0;
    float _3054 = _3048 + _3040;
    float _3056 = rsqrt(_3054);
    float _3058 = abs(_3052);
    float _3060 = log2(_3058);
    float _3062 = _3056 * _3016;
    float _3064 = _3056 * _3028;
    float _3066 = _3056 * _3024;
    float _3068 = _3062 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3070 = -_3068;
    float _3072 = fma(_3064, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3070);
    float _3074 = -_3066;
    float _3076 = fma(_3074, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3072);
    float _3078 = _3060 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3080 = fma(_3076, -0.5, 0.5);
    float _3082 = fma(_3076, 0.5, 0.5);
    float _3084 = _3064 + 1.0;
    float _3086 = exp2(_3078);
    float _3088 = fma(_3082, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3090 = fma(_3082, _3088, -0.212114393711090087890625);
    float _3092 = sqrt(_3080);
    float _3094 = fma(_3082, _3090, 1.570728778839111328125);
    float _3096 = -_3064;
    float _3098 = fma(_3086, _3084, _3096);
    float _3100 = fma(_3098, 0.5, 0.5);
    float _3102 = _3092 * 0.636619746685028076171875;
    float _3104 = -_3094;
    float _3106 = fma(_3102, _3104, 1.0);
    float2 _8490 = float2(_3106, _3100);
    float3 _3110 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8490, float2(0.0), isnan(_8490)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8490, float2(0.0), isnan(_8490)), level(0.0)).xyz;
    float _3112 = _3110.x;
    float _3114 = _3110.y;
    float _3116 = _3110.z;
    float _3118 = abs(_2200);
    float _3120 = log2(_3118);
    float _3122 = _2577 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3124 = _3060 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3126 = -_2094;
    float _3128 = _3126 + 1.0;
    float _3130 = _2641 + _2619;
    float _3132 = fma(_2571, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3122);
    float _3134 = exp2(_3124);
    float _3136 = fma(_2573, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3132);
    float _3138 = _2619 * 0.5;
    bool _3140 = _2200 <= 8000.0;
    bool _3142 = isnan(_2200);
    bool _3144 = _3140 || _3142;
    bool _3146 = isnan(8000.0);
    bool _3148 = _3144 || _3146;
    float _3150 = float(_3148);
    float _3152 = _3130 * 0.5;
    bool _3154 = _2896 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3156 = isnan(_2896);
    bool _3158 = _3154 || _3156;
    bool _3160 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3162 = _3158 || _3160;
    float _3164 = fma(_2665, -0.5, _3138);
    float _3166 = _3120 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3168 = fma(_2597, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3136);
    float _3170 = _3168 + _2619;
    float _3172 = exp2(_3166);
    out.gl_Position.x = _2641;
    out.gl_Position.y = _2665;
    out.gl_Position.z = _3168;
    out.gl_Position.w = _2619;
    float _3174 = _3170 * 0.5;
    out.m_91.x = _3152;
    out.m_91.y = _3164;
    out.m_91.z = _3174;
    out.m_91.w = _2619;
    float _3176 = -_3134;
    float _3178 = _3176 + 1.0;
    float _3180 = fma(_3172, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3182 = precise::clamp(_3180, 0.0, 1.0);
    if (!_2625)
    {
        _2643 = 1.0;
    }
    float _3184 = _2643;
    float _3186 = _3184;
    if (_2625)
    {
        bool _3188 = _2725 >= _2669;
        bool _3190 = isnan(_2725);
        bool _3192 = _3188 || _3190;
        bool _3194 = isnan(_2669);
        bool _3196 = _3192 || _3194;
        float _3198 = float(_3196);
        _3186 = _3198;
    }
    float _3200 = _3186;
    float _3202 = fma(_3182, -2.0, 3.0);
    float _3204 = _3182 * _3182;
    float _3206 = _3178 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3208 = _3206;
    if (!_3162)
    {
        _2675 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3210 = _2675;
    float _3212 = _3200 * _2874;
    float _3214 = _3204 * _3202;
    float _3216 = _3206 * _2727;
    float _3218 = -_3206;
    float _3220 = _3218 + 1.0;
    float _3222 = _3220;
    float _3224 = _3210;
    float _3226 = _3210;
    if (!_3162)
    {
        _2754 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3228 = _2754;
    float _3230 = -_3214;
    float _3232 = _3230 + 1.0;
    float _3234 = _3228;
    float _3236 = _3228;
    if (!_3162)
    {
        _3208 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3238 = _3208;
    float _3240 = _2738 * _3220;
    float _3242 = _3238;
    float _3244 = _3238;
    if (!_3162)
    {
        _3222 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3246 = _3222;
    float _3248 = fma(_3232, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3214);
    float _3250 = _3150 * _3248;
    float _3252 = _3250 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3254 = _3128 * _3252;
    float _3256 = precise::clamp(_3254, 0.0, 1.0);
    float _3258 = _2738 * _3216;
    float _3260 = -_3256;
    float _3262 = fma(_3260, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3264 = -_3212;
    float _3266 = fma(_3264, _3262, 1.0);
    float _3268 = precise::clamp(_3266, 0.0, 1.0);
    float _3270 = _2806 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3272 = _3268 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3274 = _3268;
    float _3276 = _3258;
    float _3278 = _3246;
    float _3280 = _3246;
    if (!_3162)
    {
        _3274 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3282 = _3274;
    out.m_93.x = _3272;
    float _3284 = _3116 * _3216;
    float _3286 = fma(_3112, _3258, _2732);
    float _3288 = fma(_3114, _3258, _2734);
    float _3290 = _3282;
    float _3292 = _3282;
    if (!_3162)
    {
        _3276 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3294 = _3276;
    float _3296 = fma(_2738, _3284, _2736);
    out.m_95.x = _3286;
    out.m_95.y = _3288;
    out.m_95.z = _3296;
    out.m_95.w = _3240;
    bool _3298 = !_3162;
    float _3300 = _3294;
    float _3302 = _3294;
    if (!_3298)
    {
        bool _3304 = _2896 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3306 = isnan(_2896);
        bool _3308 = _3304 || _3306;
        bool _3310 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3312 = _3308 || _3310;
        if (!_3312)
        {
            float _3314 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3316 = _2896 + _3314;
            float _3318 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3320 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3318;
            float _3322 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3324 = _3322 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3326 = 1.0 / _3320;
            float _3328 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3330 = _3328 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3332 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3334 = _3332 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3336 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3338 = _3336 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3340 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3342 = _3340 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3344 = _3316 * _3326;
            float _3346 = precise::clamp(_3344, 0.0, 1.0);
            float _3348 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3350 = _3348 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3352 = fma(_3346, _3324, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3354 = fma(_3346, _3350, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3356 = fma(_3346, _3330, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3358 = fma(_3346, _3334, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3360 = fma(_3346, _3338, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3362 = fma(_3346, _3342, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3236 = _3356;
            _3302 = _3360;
            _3226 = _3352;
            _3280 = _3358;
            _3244 = _3354;
            _3292 = _3362;
            _3364 = true;
        }
        else
        {
            bool _3366 = _2896 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3368 = isnan(_2896);
            bool _3370 = _3366 || _3368;
            bool _3372 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3374 = _3370 || _3372;
            if (!_3374)
            {
                _3224 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3376 = _3224;
            _3226 = _3376;
            if (!_3374)
            {
                _3234 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3378 = _3234;
            _3236 = _3378;
            if (!_3374)
            {
                _3242 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3380 = _3242;
            _3244 = _3380;
            if (!_3374)
            {
                _3278 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3382 = _3278;
            _3280 = _3382;
            if (!_3374)
            {
                _3300 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3384 = _3300;
            _3302 = _3384;
            if (!_3374)
            {
                _3290 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3386 = _3290;
            bool _3388 = !_3374;
            _3292 = _3386;
            if (!_3388)
            {
                bool _3390 = _2896 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3392 = isnan(_2896);
                bool _3394 = _3390 || _3392;
                bool _3396 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3398 = _3394 || _3396;
                if (!_3398)
                {
                    float _3400 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3402 = _2896 + _3400;
                    float _3404 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3406 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3404;
                    float _3408 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3410 = _3408 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3412 = 1.0 / _3406;
                    float _3414 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3416 = _3414 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3418 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3420 = _3418 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3422 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3424 = _3422 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3426 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3428 = _3426 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3430 = _3402 * _3412;
                    float _3432 = precise::clamp(_3430, 0.0, 1.0);
                    float _3434 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3436 = _3434 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3438 = fma(_3432, _3410, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3440 = fma(_3432, _3436, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3442 = fma(_3432, _3416, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3444 = fma(_3432, _3420, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3446 = fma(_3432, _3424, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3448 = fma(_3432, _3428, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3236 = _3442;
                    _3302 = _3446;
                    _3226 = _3438;
                    _3280 = _3444;
                    _3244 = _3440;
                    _3292 = _3448;
                    _3364 = true;
                }
                else
                {
                    _3236 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3302 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3226 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3280 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3244 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3292 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3364 = false;
    float _3450 = _3236;
    float _3452 = _3302;
    float _3454 = _3226;
    float _3456 = _3280;
    float _3458 = _3244;
    float _3460 = _3292;
    float _3462 = fma(_1988, -0.5, 0.5);
    float _3464 = precise::clamp(_3462, 0.0, 1.0);
    float _3466 = -_3450;
    float _3468 = _3466 + _3452;
    float _3470 = _3270 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3472 = -_3454;
    float _3474 = _3472 + _3456;
    float _3476 = fma(_3464, _3468, _3450);
    out.m_97.x = 0.0;
    float _3478 = -_3458;
    float _3480 = _3478 + _3460;
    float _3482 = fma(_3464, _3474, _3454);
    float _3484 = _3476 * 0.586610972881317138671875;
    out.m_61.x = _3470;
    bool _3486 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3488 = fma(_3464, _3480, _3458);
    float _3490 = fma(_3482, 0.298911988735198974609375, _3484);
    bool _3492 = _2806 > 0.0;
    bool _3494 = isnan(_2806);
    bool _3496 = _3492 || _3494;
    bool _3498 = isnan(0.0);
    bool _3500 = _3496 || _3498;
    float _3502 = fma(_3488, 0.114477999508380889892578125, _3490);
    float _3504 = -_3502;
    float _3506 = _3482 + _3504;
    float _3508 = -_3502;
    float _3510 = _3476 + _3508;
    float _3512 = -_3502;
    float _3514 = _3488 + _3512;
    float _3516 = fma(_3506, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3502);
    float _3518 = fma(_3510, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3502);
    float _3520 = fma(_3514, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3502);
    bool _3522 = !_3486;
    if (!_3522)
    {
        float _3524 = -_2513;
        float _3526 = _3524 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3528 = -_2515;
        float _3530 = _3528 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3532 = -_2517;
        float _3534 = _3532 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3536 = _3526 * _3526;
        float _3538 = fma(_3530, _3530, _3536);
        float _3540 = fma(_3534, _3534, _3538);
        float _3542 = sqrt(_3540);
        float _3544 = rsqrt(_3540);
        float _3546 = -_3542;
        float _3548 = _3546 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3550 = _3548 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3552 = precise::clamp(_3550, 0.0, 1.0);
        float _3554 = _3530 * _3544;
        float _3556 = _3526 * _3544;
        float _3558 = abs(_3552);
        float _3560 = log2(_3558);
        float _3562 = _3534 * _3544;
        float _3564 = _3554 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3566 = _1988 * _3556;
        float _3568 = -_3556;
        float _3570 = -_3564;
        float _3572 = fma(_3568, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3570);
        float _3574 = fma(_1978, _3554, _3566);
        float _3576 = -_3562;
        float _3578 = fma(_3576, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3572);
        float _3580 = fma(_1990, _3562, _3574);
        float _3582 = precise::clamp(_3580, 0.0, 1.0);
        float _3584 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3586 = _3578 + _3584;
        float _3588 = _3560 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3590 = _3586 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3592 = precise::clamp(_3590, 0.0, 1.0);
        float _3594 = exp2(_3588);
        float _3596 = _3594 * _3592;
        float _3598 = _3582 * _3596;
        float _3600 = _3598 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3602 = _3598 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3604 = _3598 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_97.x = _3600;
        out.m_97.y = _3602;
        out.m_97.z = _3604;
    }
    out.m_99.x = _3516;
    out.m_99.y = _3518;
    out.m_99.z = _3520;
    if (_3500)
    {
        return out;
    }
    out.m_61.x = 0.0;
    float _3606 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3606;
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
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3364 = false;
    bool _2038 = false;
    bool _878 = false;
    bool _652 = false;
    bool _502 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _113 = in.m_58.w;
    float _115 = trunc(_113);
    int _118 = int(_115);
    bool _122 = _118 >= 1;
    float _124 = 0.0;
    if (!_122)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _126 = _124;
    float _128 = _126;
    if (!_122)
    {
        out.m_61.x = 0.0;
    }
    int _130 = 0;
    if (!_122)
    {
        float _132 = _126 * 5.0;
        _130 = as_type<int>(_132);
    }
    int _134 = _130;
    int _136 = _134;
    if (!_122)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3663 = as_type<float>(_134);
        out.gl_Position.z = _3663;
    }
    if (!_122)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _138 = in.m_63.w;
    bool _140 = _138 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _142 = isnan(_138);
    bool _144 = _140 || _142;
    bool _146 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _148 = _144 || _146;
    float _150 = -_138;
    float _152 = _150 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _154 = 0.0;
    float _156 = 0.0;
    float _158 = _152;
    if (_148)
    {
        float _160 = float(_118);
        _128 = _160;
    }
    float _162 = _128;
    bool _164 = _152 >= _162;
    bool _166 = !_148;
    bool _168 = _164 || _166;
    float _170 = _162;
    if (_168)
    {
        _170 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _172 = _170;
    if (_168)
    {
        out.m_61.x = 0.0;
    }
    if (_168)
    {
        float _174 = _172 * 5.0;
        _136 = as_type<int>(_174);
    }
    int _176 = _136;
    float _178 = as_type<float>(_176);
    if (_168)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3735 = as_type<float>(_176);
        out.gl_Position.z = _3735;
    }
    if (_168)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _180 = in.m_63.x;
    float _182 = in.m_63.y;
    float _184 = in.m_63.z;
    float _186 = _152 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _188 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _190 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _192 = _188 || _190;
    bool _194 = isnan(1.0);
    bool _196 = _192 || _194;
    float _198 = _186;
    if (!_196)
    {
        float _200 = _186 * _186;
        float _202 = _200 * 0.5;
        _178 = _202;
    }
    float _204 = _178;
    float _206 = 0.0;
    float _208 = _204;
    if (!_196)
    {
        float _210 = _152 * _152;
        float _212 = _210 * 0.5;
        _206 = _212;
    }
    float _214 = _206;
    if (!_196)
    {
        float _216 = _204 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _208 = _216;
    }
    float _218 = _208;
    bool _220 = !_196;
    float _222 = _218;
    if (!_220)
    {
        float _224 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _226 = log2(_224);
        float _228 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _230 = _228 + 1.0;
        float _232 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _234 = _186 * _226;
        float _236 = 1.0 / _230;
        float _238 = _232 * 0.693147182464599609375;
        float _240 = exp2(_234);
        float _242 = 1.0 / _238;
        float _244 = _240 + (-1.0);
        float _246 = -_244;
        float _248 = fma(_246, _242, _186);
        float _250 = _248 * _236;
        float _252 = _250 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _154 = _238;
        _222 = _252;
        _156 = _240;
    }
    float _254 = _154;
    float _256 = _222;
    float _258 = _156;
    bool _260 = !_196;
    float _262 = _254;
    float _264 = _258;
    if (!_260)
    {
        float _266 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _268 = log2(_266);
        float _270 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _272 = _270 + 1.0;
        float _274 = 1.0 / _272;
        float _276 = _186 * _268;
        float _278 = exp2(_276);
        float _280 = -_278;
        float _282 = _280 + 1.0;
        float _284 = _282 * _274;
        _262 = _278;
        _264 = _272;
        _198 = _284;
    }
    float _286 = _262;
    float _288 = _264;
    float _290 = _198;
    float _292 = _288;
    float _294 = _286;
    if (!_196)
    {
        _292 = _152;
    }
    float _296 = _292;
    float _298 = _256 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _300 = _296;
    if (!_196)
    {
        float _302 = _214 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _294 = _302;
    }
    float _304 = _294;
    bool _306 = !_196;
    float _308 = _304;
    if (!_306)
    {
        float _310 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _312 = log2(_310);
        float _314 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _316 = _152 * _312;
        float _318 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _320 = _318 + 1.0;
        float _322 = 1.0 / _320;
        float _324 = _314 * 0.693147182464599609375;
        float _326 = exp2(_316);
        float _328 = 1.0 / _324;
        float _330 = _326 + (-1.0);
        float _332 = -_330;
        float _334 = fma(_332, _328, _152);
        float _336 = _334 * _322;
        float _338 = _336 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _308 = _338;
    }
    float _340 = _308;
    bool _342 = !_196;
    if (!_342)
    {
        float _344 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _346 = log2(_344);
        float _348 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _350 = _348 + 1.0;
        float _352 = 1.0 / _350;
        float _354 = _152 * _346;
        float _356 = exp2(_354);
        float _358 = -_356;
        float _360 = _358 + 1.0;
        float _362 = _360 * _352;
        _300 = _362;
    }
    float _364 = _300;
    float _366 = _340 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _368 = fma(_290, _182, _298);
    float _370 = _256 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _372 = _340 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _374 = fma(_364, _182, _366);
    float _376 = _256 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _378 = _340 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _380 = fma(_290, _180, _370);
    float _382 = fma(_364, _180, _372);
    float _384 = -_374;
    float _386 = _368 + _384;
    float _388 = fma(_290, _184, _376);
    float _390 = fma(_364, _184, _378);
    float _392 = -_382;
    float _394 = _380 + _392;
    float _396 = _386 * _386;
    float _398 = in.m_65.w;
    float _400 = -_390;
    float _402 = _388 + _400;
    float _404 = _386 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _406 = fma(_394, _394, _396);
    float _408 = _386 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _410 = _386 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _412 = fma(_394, (*spvDescriptorSet0.vp_c10)._m0[4].x, _404);
    float _414 = fma(_402, _402, _406);
    float _416 = fma(_394, (*spvDescriptorSet0.vp_c10)._m0[5].x, _408);
    float _418 = in.m_58.x;
    float _420 = in.m_58.y;
    float _422 = in.m_58.z;
    float _424 = fma(_394, (*spvDescriptorSet0.vp_c10)._m0[6].x, _410);
    float _426 = fma(_402, (*spvDescriptorSet0.vp_c10)._m0[4].z, _412);
    float _428 = sqrt(_414);
    float _430 = fma(_402, (*spvDescriptorSet0.vp_c10)._m0[6].z, _424);
    float _432 = fma(_402, (*spvDescriptorSet0.vp_c10)._m0[5].z, _416);
    bool _434 = _428 >= 9.9999999747524270787835121154785e-07;
    bool _436 = isnan(_428);
    bool _438 = _434 || _436;
    bool _440 = isnan(9.9999999747524270787835121154785e-07);
    bool _442 = _438 || _440;
    float _444 = fma(_380, _398, _418);
    float _446 = fma(_388, _398, _422);
    float _448 = fma(_368, _398, _420);
    float _450 = _380;
    float _452 = _388;
    float _454 = _432;
    if (_442)
    {
        _450 = _426;
    }
    float _456 = _450;
    float _458 = _456;
    if (_442)
    {
        _452 = _430;
    }
    float _460 = _452;
    float _462 = _460;
    if (!_442)
    {
        bool _464 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _466 = !_464;
        if (!_466)
        {
            float _468 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _470 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _472 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _474 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _468);
            float _476 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _470);
            float _478 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _472);
            float _480 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _474);
            float _482 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _476);
            float _484 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _478);
            float _486 = _480 * _480;
            float _488 = fma(_482, _482, _486);
            float _490 = fma(_484, _484, _488);
            float _492 = rsqrt(_490);
            float _494 = _492 * 9.9999999747524270787835121154785e-07;
            float _496 = _482 * _494;
            float _498 = _480 * _494;
            float _500 = _484 * _494;
            _454 = _498;
            _458 = _496;
            _462 = _500;
            _502 = true;
        }
        else
        {
            float _504 = _182 * _182;
            float _506 = fma(_180, _180, _504);
            float _508 = fma(_184, _184, _506);
            float _510 = sqrt(_508);
            bool _512 = _510 >= 9.9999999747524270787835121154785e-07;
            bool _514 = isnan(_510);
            bool _516 = _512 || _514;
            bool _518 = isnan(9.9999999747524270787835121154785e-07);
            bool _520 = _516 || _518;
            if (!_520)
            {
                float _522 = _420 * _420;
                float _524 = fma(_418, _418, _522);
                float _526 = fma(_422, _422, _524);
                float _528 = sqrt(_526);
                bool _530 = _528 >= 9.9999999747524270787835121154785e-07;
                bool _532 = isnan(_528);
                bool _534 = _530 || _532;
                bool _536 = isnan(9.9999999747524270787835121154785e-07);
                bool _538 = _534 || _536;
                if (!_538)
                {
                    float _540 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _542 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _540);
                    float _544 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _542);
                    float _546 = rsqrt(_544);
                    float _548 = _546 * 9.9999999747524270787835121154785e-07;
                    float _550 = _548 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _552 = _548 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _554 = _548 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _454 = _552;
                    _458 = _550;
                    _462 = _554;
                    _502 = true;
                }
                else
                {
                    float _556 = _420 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _558 = _420 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _560 = _420 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _562 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[5].x, _556);
                    float _564 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[4].x, _558);
                    float _566 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[6].x, _560);
                    float _568 = fma(_422, (*spvDescriptorSet0.vp_c10)._m0[5].z, _562);
                    float _570 = fma(_422, (*spvDescriptorSet0.vp_c10)._m0[4].z, _564);
                    float _572 = fma(_422, (*spvDescriptorSet0.vp_c10)._m0[6].z, _566);
                    float _574 = _568 * _568;
                    float _576 = fma(_570, _570, _574);
                    float _578 = fma(_572, _572, _576);
                    float _580 = rsqrt(_578);
                    float _582 = _580 * 9.9999999747524270787835121154785e-07;
                    float _584 = _570 * _582;
                    float _586 = _568 * _582;
                    float _588 = _572 * _582;
                    _454 = _586;
                    _458 = _584;
                    _462 = _588;
                    _502 = true;
                }
            }
            else
            {
                float _590 = _182 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _592 = _182 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _594 = _182 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _596 = fma(_180, (*spvDescriptorSet0.vp_c10)._m0[5].x, _590);
                float _598 = fma(_180, (*spvDescriptorSet0.vp_c10)._m0[4].x, _592);
                float _600 = fma(_180, (*spvDescriptorSet0.vp_c10)._m0[6].x, _594);
                float _602 = fma(_184, (*spvDescriptorSet0.vp_c10)._m0[5].z, _596);
                float _604 = fma(_184, (*spvDescriptorSet0.vp_c10)._m0[4].z, _598);
                float _606 = fma(_184, (*spvDescriptorSet0.vp_c10)._m0[6].z, _600);
                float _608 = _602 * _602;
                float _610 = fma(_604, _604, _608);
                float _612 = fma(_606, _606, _610);
                float _614 = rsqrt(_612);
                float _616 = _614 * 9.9999999747524270787835121154785e-07;
                float _618 = _604 * _616;
                float _620 = _602 * _616;
                float _622 = _606 * _616;
                _454 = _620;
                _458 = _618;
                _462 = _622;
            }
        }
    }
    _502 = false;
    float _624 = _454;
    float _626 = _458;
    float _628 = _462;
    bool _630 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _632 = !_630;
    float _650;
    if (!_632)
    {
        float _634 = in.m_67.x;
        float _636 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _638 = _634 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _640 = fma(_638, (*spvDescriptorSet0.vp_c9)._m0[12].x, _152);
        float _642 = _640 * _636;
        float _644 = floor(_642);
        float _646 = -_644;
        float _648 = _642 + _646;
        _650 = _648;
        _652 = true;
    }
    else
    {
        float _654 = float(_118);
        float _656 = 1.0 / _654;
        float _658 = _152 * _656;
        _650 = _658;
    }
    _652 = false;
    float _660 = _650;
    float _662 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _664 = _660 + _662;
    float _666 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _668 = _660 + _666;
    bool _670 = _660 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _672 = isnan(_660);
    bool _674 = _670 || _672;
    bool _676 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _678 = _674 || _676;
    float _680 = float(_678);
    float _682 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _684 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _682;
    float _686 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _688 = _660 + _686;
    float _690 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _692 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _690;
    float _694 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _696 = _694 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _698 = 1.0 / _684;
    bool _700 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _702 = 1.0 / _696;
    float _704 = 1.0 / _692;
    float _706 = _664 * _698;
    bool _708 = _660 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _710 = isnan(_660);
    bool _712 = _708 || _710;
    bool _714 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _716 = _712 || _714;
    float _718 = float(_716);
    float _720 = -_680;
    float _722 = _720 + 1.0;
    float _724 = _718 * _722;
    float _726 = _668 * _702;
    bool _728 = _660 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _730 = isnan(_660);
    bool _732 = _728 || _730;
    bool _734 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _736 = _732 || _734;
    float _738 = float(_736);
    float _740 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _742 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _740;
    bool _744 = _660 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _746 = isnan(_660);
    bool _748 = _744 || _746;
    bool _750 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _752 = _748 || _750;
    float _754 = float(_752);
    float _756 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _758 = _756 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _760 = -_718;
    float _762 = _760 + 1.0;
    float _764 = -_738;
    float _766 = _764 + 1.0;
    float _768 = _688 * _704;
    float _770 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _772 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _770;
    float _774 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _776 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _774;
    float _778 = _754 * _766;
    float _780 = fma(_742, _768, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _782 = fma(_772, _768, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _784 = fma(_776, _768, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _786 = _738 * _762;
    float _788 = -_754;
    float _790 = _788 + 1.0;
    float _792 = _782 * _778;
    float _794 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _796 = _794 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _798 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _800 = _798 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _802 = _784 * _778;
    float _804 = _780 * _778;
    float _806 = fma(_790, (*spvDescriptorSet0.vp_c9)._m0[143].x, _792);
    float _808 = fma(_790, (*spvDescriptorSet0.vp_c9)._m0[143].y, _802);
    float _810 = fma(_790, (*spvDescriptorSet0.vp_c9)._m0[143].z, _804);
    float _812 = fma(_758, _726, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _814 = fma(_796, _726, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _816 = fma(_800, _726, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _818 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _820 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _818;
    float _822 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _824 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _822;
    float _826 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _828 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _826;
    float _830 = fma(_812, _786, _806);
    float _832 = fma(_820, _706, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _834 = fma(_824, _706, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _836 = fma(_828, _706, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _838 = fma(_814, _786, _808);
    float _840 = fma(_816, _786, _810);
    float _842 = fma(_832, _724, _830);
    float _844 = fma(_834, _724, _838);
    float _846 = fma(_836, _724, _840);
    float _848 = fma(_680, (*spvDescriptorSet0.vp_c9)._m0[146].x, _842);
    float _850 = fma(_680, (*spvDescriptorSet0.vp_c9)._m0[146].y, _844);
    float _852 = fma(_680, (*spvDescriptorSet0.vp_c9)._m0[146].z, _846);
    bool _854 = !_700;
    float _856 = _852;
    float _858 = _850;
    float _876;
    if (!_854)
    {
        float _860 = in.m_67.x;
        float _862 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _864 = _860 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _866 = fma(_864, (*spvDescriptorSet0.vp_c9)._m0[11].y, _152);
        float _868 = _866 * _862;
        float _870 = floor(_868);
        float _872 = -_870;
        float _874 = _868 + _872;
        _876 = _874;
        _878 = true;
    }
    else
    {
        float _880 = float(_118);
        float _882 = 1.0 / _880;
        float _884 = _152 * _882;
        _876 = _884;
    }
    _878 = false;
    float _886 = _876;
    float _888 = in.m_69.x;
    float _890 = in.m_69.y;
    float _892 = in.m_69.z;
    float _894 = _448 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _896 = _448 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _898 = _448 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _900 = in.m_65.x;
    float _902 = in.m_65.y;
    float _904 = in.m_65.z;
    float _906 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _908 = log2(_906);
    float _910 = fma(_444, (*spvDescriptorSet0.vp_c10)._m0[5].x, _896);
    float _912 = fma(_444, (*spvDescriptorSet0.vp_c10)._m0[6].x, _898);
    float _914 = in.m_71.x;
    float _916 = in.m_71.y;
    float _918 = in.m_71.z;
    float _920 = fma(_444, (*spvDescriptorSet0.vp_c10)._m0[4].x, _894);
    float _922 = in.m_73.y;
    int _924 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _926 = _924 != 0;
    float _928 = fma(_446, (*spvDescriptorSet0.vp_c10)._m0[5].z, _910);
    int _930 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _932 = _930 != 0;
    float _934 = in.m_67.y;
    float _936 = fma(_446, (*spvDescriptorSet0.vp_c10)._m0[4].z, _920);
    float _938 = fma(_446, (*spvDescriptorSet0.vp_c10)._m0[6].z, _912);
    float _940 = in.m_67.x;
    float _942 = _928 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _944 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _888);
    bool _946 = _890 != 0.0;
    bool _948 = isnan(_890);
    bool _950 = _946 || _948;
    bool _952 = isnan(0.0);
    bool _954 = _950 || _952;
    float _956 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _890);
    float _958 = _848 * _900;
    bool _960 = _888 == 0.0;
    bool _962 = !_954;
    bool _964 = _960 && _962;
    float _966 = _850 * _902;
    float _968 = _936 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _970 = _892 == 0.0;
    bool _972 = _970 && _964;
    float _974 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _976 = _974 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _978 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _980 = _978 != 0;
    int _982 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _984 = _982 != 0;
    int _986 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _988 = _986 != 0;
    float _990 = _852 * _904;
    float _992 = 1.0 / _976;
    bool _994 = _934 > 0.5;
    float _996 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _998 = _996 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1000 = !_984;
    int _1002 = _1000 ? 0 : 1;
    float _1004 = _900;
    float _1006 = _894;
    float _1008 = _922;
    if (_972)
    {
        _1004 = _916;
    }
    float _1010 = _1004;
    float _1012 = 1.0 / _998;
    float _1014 = 0.0;
    float _1016 = _1010;
    if (_972)
    {
        _1014 = _918;
    }
    float _1018 = _1014;
    float _1020 = _1018;
    if (_972)
    {
        _1006 = _1010;
    }
    float _1022 = _1006;
    float _1024 = _1022;
    if (!_972)
    {
        _1016 = _916;
    }
    float _1026 = _1016;
    float _1028 = in.m_67.z;
    if (_972)
    {
        _856 = _914;
    }
    float _1030 = _856;
    float _1032 = _1030;
    if (!_972)
    {
        float _1034 = fma(_888, (*spvDescriptorSet0.vp_c9)._m0[17].y, _914);
        _1032 = _1034;
    }
    float _1036 = _1032;
    if (_972)
    {
        _858 = _1018;
    }
    float _1038 = _858;
    float _1040 = _1038;
    if (!_972)
    {
        float _1042 = fma(_890, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1026);
        _1024 = _1042;
    }
    float _1044 = _1024;
    if (!_972)
    {
        _1020 = _918;
    }
    float _1046 = _1020;
    float _1048 = _908 * _152;
    float _1050 = -_922;
    float _1052 = _1050 + 1.0;
    float _1054 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _892);
    float _1056 = exp2(_1048);
    if (!_972)
    {
        float _1058 = fma(_892, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1046);
        _1040 = _1058;
    }
    float _1060 = _1040;
    if (_932)
    {
        float _1062 = _994 ? _1052 : _922;
        _1008 = _1062;
    }
    float _1064 = _1008;
    float _1066 = _940 * 2.0;
    float _1068 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1070 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1068;
    bool _1072 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1074 = isnan(0.0);
    bool _1076 = _1072 || _1074;
    bool _1078 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1080 = _1076 || _1078;
    float _1082 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1084 = _1082 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1086 = floor(_1066);
    float _1088 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1090 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1092 = 1.0 + _1090;
    float _1094 = _1070 * _992;
    bool _1096 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1098 = isnan(1.0);
    bool _1100 = _1096 || _1098;
    bool _1102 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1104 = _1100 || _1102;
    float _1106 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1088);
    float _1108 = _1028 * 2.0;
    float _1110 = 1.0 / _1092;
    float _1112 = _934 + _1028;
    float _1114 = -_1056;
    float _1116 = _1114 + 1.0;
    float _1118 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1106);
    float _1120 = _1084 * _1012;
    float _1122 = _1112 + (-1.0);
    int _1124 = abs(_1002);
    float _1126 = _1080 ? _1116 : 0.0;
    float _1128 = _940 + _1028;
    bool _1130 = _1086 > 0.0;
    float _1132 = floor(_1108);
    bool _1134 = _1086 >= 0.0;
    bool _1136 = isnan(_1086);
    bool _1138 = _1134 || _1136;
    bool _1140 = isnan(0.0);
    bool _1142 = _1138 || _1140;
    float _1144 = _1128 + (-1.0);
    float _1146 = fma(_1122, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1148 = _934 * 2.0;
    int _1150 = _1142 ? 0 : 1;
    float _1152 = fma(_1144, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1154 = _624 * _624;
    float _1156 = _1146;
    if (_1104)
    {
        float _1158 = _1126 * _1110;
        _158 = _1158;
    }
    float _1160 = _158;
    int _1162 = ~_1150;
    int _1164 = _1162 + 1;
    int _1166 = _1164 + 1;
    float _1168 = rsqrt(_1118);
    float _1170 = fma(_626, _626, _1154);
    bool _1172 = _886 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1174 = isnan(_886);
    bool _1176 = _1172 || _1174;
    bool _1178 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1180 = _1176 || _1178;
    float _1182 = float(_1180);
    float _1184 = _1028 + (-0.5);
    int _1186 = _1166;
    if (!_1130)
    {
        int _1188 = ~_1150;
        int _1190 = _1188 + 1;
        _1186 = _1190;
    }
    int _1192 = _1186;
    float _1194 = fma(_628, _628, _1170);
    float _1196 = _940 + _934;
    bool _1198 = _886 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1200 = isnan(_886);
    bool _1202 = _1198 || _1200;
    bool _1204 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1206 = _1202 || _1204;
    float _1208 = float(_1206);
    float _1210 = floor(_1148);
    bool _1212 = _1132 > 0.0;
    float _1214 = _1196 + (-1.0);
    bool _1216 = _1132 >= 0.0;
    bool _1218 = isnan(_1132);
    bool _1220 = _1216 || _1218;
    bool _1222 = isnan(0.0);
    bool _1224 = _1220 || _1222;
    float _1226 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1228 = _886 + _1226;
    bool _1230 = _886 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1232 = isnan(_886);
    bool _1234 = _1230 || _1232;
    bool _1236 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1238 = _1234 || _1236;
    float _1240 = float(_1238);
    float _1242 = -_1208;
    float _1244 = _1242 + 1.0;
    float _1246 = rsqrt(_1194);
    float _1248 = -_1182;
    float _1250 = _1248 + 1.0;
    float _1252 = fma(_1094, _1228, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1254 = _1240 * _1244;
    int _1256 = _1224 ? 0 : 1;
    float _1258 = _1208 * _1250;
    float _1260 = fma(_1214, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1262 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1264 = _886 + _1262;
    bool _1266 = _1210 > 0.0;
    float _1268 = _934 + (-0.5);
    bool _1270 = _1210 >= 0.0;
    bool _1272 = isnan(_1210);
    bool _1274 = _1270 || _1272;
    bool _1276 = isnan(0.0);
    bool _1278 = _1274 || _1276;
    float _1280 = fma(_1120, _1264, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1282 = _1168 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1284 = _1252 * _1254;
    float _1286 = -_1240;
    float _1288 = _1286 + 1.0;
    int _1290 = _1278 ? 0 : 1;
    float _1292 = _1246 * _626;
    float _1294 = _1168 * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1296 = _1282 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1298 = _1246 * _624;
    float _1300 = fma(_1288, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1284);
    float _1302 = _1246 * _628;
    float _1304 = fma(_1294, (*spvDescriptorSet0.vp_c10)._m0[8].y, _1296);
    float _1306 = _1298 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1308 = _1168 * (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1310 = float(_1192);
    float _1312 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1314 = _942 + _1312;
    float _1316 = float(_1124);
    float _1318 = fma(_1292, (*spvDescriptorSet0.vp_c10)._m0[8].y, _1306);
    int _1320 = ~_1256;
    int _1322 = _1320 + 1;
    int _1324 = _1322 + 1;
    float _1326 = _1314 * _1314;
    int _1328 = _1324;
    float _1330 = _1260;
    if (!_1212)
    {
        int _1332 = ~_1256;
        int _1334 = _1332 + 1;
        _1328 = _1334;
    }
    int _1336 = _1328;
    float _1338 = fma(_1302, (*spvDescriptorSet0.vp_c10)._m0[10].y, _1318);
    float _1340 = _1316 * _1310;
    bool _1342 = !_980;
    int _1344 = _1342 ? 0 : 1;
    float _1346 = in.m_75.z;
    int _1348 = ~_1290;
    int _1350 = _1348 + 1;
    int _1352 = _1350 + 1;
    float _1354 = fma(_1308, (*spvDescriptorSet0.vp_c10)._m0[10].y, _1304);
    float _1356 = abs(_1338);
    bool _1358 = _1356 > 0.99989998340606689453125;
    float _1360 = _938 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1362 = !_988;
    int _1364 = _1362 ? 0 : 1;
    float _1366 = in.m_75.x;
    int _1368 = abs(_1344);
    float _1370 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1372 = _968 + _1370;
    int _1374 = _1352;
    if (!_1266)
    {
        int _1376 = ~_1290;
        int _1378 = _1376 + 1;
        _1374 = _1378;
    }
    int _1380 = _1374;
    float _1382 = _1340 * (-2.0);
    float _1384 = in.m_75.y;
    int _1386 = abs(_1364);
    float _1388 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1390 = _1360 + _1388;
    float _1392 = fma(_1372, _1372, _1326);
    float _1394 = float(_1380);
    float _1396 = fma(_1354, 1.57079637050628662109375, -1.57079637050628662109375);
    float _1398 = fma(_1390, _1390, _1392);
    float _1400 = float(_1368);
    float _1402 = float(_1386);
    float _1404 = float(_1336);
    float _1406 = rsqrt(_1398);
    bool _1408 = _940 > 0.5;
    bool _1410 = _1408 && _926;
    float _1412 = _1402 * _1394;
    float _1414 = _1400 * _1404;
    float _1416 = _940 + (-0.5);
    float _1418 = _1412 * (-2.0);
    float _1420 = _1396 + _1366;
    float _1422 = _1396;
    if (!_1358)
    {
        _1422 = (*spvDescriptorSet0.vp_c10)._m0[8].y;
    }
    float _1424 = _1422;
    float _1426 = fma(_1152, _1418, _1152);
    float _1428 = fma(_1382, _1384, _1384);
    float _1430 = fma(_1146, _1382, _1146);
    float _1432 = fma(_1418, _1346, _1346);
    float _1434 = _1424;
    if (_1358)
    {
        _1156 = 0.001000000047497451305389404296875;
    }
    float _1436 = _1156;
    float _1438 = fma(_1268, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1428);
    float _1440 = _1314 * _1406;
    float _1442 = _1372 * _1406;
    float _1444 = fma(_1184, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1432);
    float _1446 = fma(_1430, _1160, _1438);
    float _1448 = -_1440;
    float _1450 = fma(_1448, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1314);
    float _1452 = _1440;
    if (_1358)
    {
        float _1454 = fma(_1436, (*spvDescriptorSet0.vp_c10)._m0[8].z, (*spvDescriptorSet0.vp_c10)._m0[8].y);
        _1434 = _1454;
    }
    float _1456 = _1434;
    float _1458 = -_1442;
    float _1460 = fma(_1458, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1372);
    float _1462 = _1446 * 0.15915493667125701904296875;
    float _1464 = _1450 * _1450;
    float _1466 = _1414 * (-2.0);
    float _1468 = _1390 * _1406;
    float _1470 = fma(_1426, _1160, _1444);
    float _1472 = fma(_1260, _1466, _1260);
    float _1474 = fma(_1420, _1466, _1420);
    float _1476 = fma(_1460, _1460, _1464);
    float _1478 = in.m_73.x;
    float _1480 = _1462 * 6.283185482025146484375;
    float _1482 = sin(_1480);
    float _1484 = fma(_1416, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1474);
    float _1486 = -_1468;
    float _1488 = fma(_1486, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1390);
    float _1490 = _1464;
    float _1492 = _1456;
    if (!_1358)
    {
        _1330 = (*spvDescriptorSet0.vp_c10)._m0[10].y;
    }
    float _1494 = _1330;
    float _1496 = _1494;
    if (_1358)
    {
        float _1498 = fma(_1436, (*spvDescriptorSet0.vp_c10)._m0[10].z, (*spvDescriptorSet0.vp_c10)._m0[10].y);
        _1496 = _1498;
    }
    float _1500 = _1496;
    float _1502 = fma(_1472, _1160, _1484);
    if (!_1358)
    {
        _1490 = (*spvDescriptorSet0.vp_c10)._m0[9].y;
    }
    float _1504 = _1490;
    float _1506 = -_1456;
    float _1508 = _1302 * _1506;
    float _1510 = _1462 * 6.283185482025146484375;
    float _1512 = cos(_1510);
    float _1514 = fma(_1488, _1488, _1476);
    float _1516 = _1502 * 0.15915493667125701904296875;
    float _1518 = -_1500;
    float _1520 = _1298 * _1518;
    float _1522 = -_1500;
    float _1524 = -_1508;
    float _1526 = fma(_1292, _1522, _1524);
    float _1528 = _1470 * 0.15915493667125701904296875;
    float _1530 = sqrt(_1514);
    float _1532 = _1504;
    if (_1358)
    {
        float _1534 = fma(_1436, (*spvDescriptorSet0.vp_c10)._m0[9].z, (*spvDescriptorSet0.vp_c10)._m0[9].y);
        _1532 = _1534;
    }
    float _1536 = _1532;
    float _1538 = _1516 * 6.283185482025146484375;
    float _1540 = sin(_1538);
    float _1542 = -_1536;
    float _1544 = _1292 * _1542;
    float _1546 = -_1536;
    float _1548 = -_1520;
    float _1550 = fma(_1302, _1546, _1548);
    float _1552 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1554 = _1526 * _1526;
    float _1556 = -_1456;
    float _1558 = -_1544;
    float _1560 = fma(_1298, _1556, _1558);
    float _1562 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1564 = _1516 * 6.283185482025146484375;
    float _1566 = cos(_1564);
    float _1568 = fma(_1550, _1550, _1554);
    float _1570 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1572 = _1478;
    if (_926)
    {
        _1492 = _1478;
    }
    float _1574 = _1492;
    float _1576 = _1562 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1578 = fma(_1560, _1560, _1568);
    float _1580 = _1552 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1582 = _1570 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1584 = _1528 * 6.283185482025146484375;
    float _1586 = cos(_1584);
    float _1588 = _1574;
    if (_1410)
    {
        float _1590 = -_1574;
        float _1592 = _1590 + 1.0;
        _1588 = _1592;
    }
    float _1594 = _1588;
    float _1596 = fma(_1280, _1258, _1300);
    float _1598 = _1406 * _1530;
    out.m_77.x = _1576;
    out.m_77.y = _1580;
    out.m_77.z = _1582;
    if (_926)
    {
        _1572 = _1594;
    }
    float _1600 = _1572;
    float _1602 = _1540 * _1482;
    float _1604 = _1528 * 6.283185482025146484375;
    float _1606 = sin(_1604);
    float _1608 = _1566 * _1512;
    float _1610 = _1566 * _1482;
    float _1612 = fma(_1182, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1596);
    float _1614 = rsqrt(_1578);
    float _1616 = _958 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1618 = _1512 * _1586;
    float _1620 = _1540 * _1512;
    float _1622 = _1482 * _1586;
    float _1624 = _1566 * _1586;
    float _1626 = _1540 * _1586;
    float _1628 = _1598 * _1616;
    float _1630 = fma(_1606, _1608, _1602);
    float _1632 = fma(_1606, _1602, _1608);
    float _1634 = _966 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1636 = _990 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1638 = -_1610;
    float _1640 = fma(_1606, _1620, _1638);
    float _1642 = -_1620;
    float _1644 = fma(_1606, _1610, _1642);
    float _1646 = _1598 * _1634;
    float _1648 = _1292 * _1624;
    float _1650 = _1550 * _1614;
    float _1652 = _944 * _1628;
    float _1654 = _1598 * _1636;
    float _1656 = _1526 * _1614;
    float _1658 = _1560 * _1614;
    float _1660 = _956 * _1646;
    float _1662 = _1054 * _1654;
    float _1664 = _1302 * _1624;
    float _1666 = in.m_79.x;
    float _1668 = in.m_79.y;
    float _1670 = in.m_79.z;
    float _1672 = in.m_79.w;
    float _1674 = -_1606;
    float _1676 = fma(_1674, _1650, _1648);
    float _1678 = _1630 * _1292;
    float _1680 = -_1606;
    float _1682 = fma(_1680, _1658, _1664);
    float _1684 = _1630 * _1302;
    float _1686 = _1298 * _1658;
    float _1688 = _1292 * _1656;
    float _1690 = _1292 * _1644;
    float _1692 = fma(_1618, _1650, _1678);
    float _1694 = fma(_1618, _1658, _1684);
    float _1696 = -_1686;
    float _1698 = fma(_1302, _1656, _1696);
    float _1700 = -_1688;
    float _1702 = fma(_1298, _1650, _1700);
    float _1704 = _1302 * _1644;
    float _1706 = fma(_1622, _1650, _1690);
    float _1708 = fma(_1626, _1698, _1676);
    float _1710 = fma(_1626, _1702, _1682);
    float _1712 = fma(_1622, _1658, _1704);
    float _1714 = fma(_1640, _1698, _1692);
    float _1716 = _1660 * _1708;
    float _1718 = fma(_1640, _1702, _1694);
    float _1720 = _1660 * _1710;
    float _1722 = fma(_1632, _1698, _1706);
    float _1724 = fma(_1632, _1702, _1712);
    float _1726 = fma(_1652, _1714, _1716);
    float _1728 = fma(_1652, _1718, _1720);
    float _1730 = _1670 * _914;
    float _1732 = _1666 * _1026;
    float _1734 = fma(_1662, _1722, _1726);
    float _1736 = fma(_1662, _1724, _1728);
    float _1738 = -_1730;
    float _1740 = fma(_1666, _1046, _1738);
    float _1742 = _1668 * _1046;
    float _1744 = _968 + _1734;
    float _1746 = _1360 + _1736;
    float _1748 = -_1732;
    float _1750 = fma(_1668, _914, _1748);
    float _1752 = -_1742;
    float _1754 = fma(_1670, _1026, _1752);
    float _1756 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1758 = _1744 + _1756;
    float _1760 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1762 = _1746 + _1760;
    float _1764 = _1298 * _1624;
    float _1766 = _1302 * _1650;
    float _1768 = _1758 * _1758;
    float _1770 = _1762 * _1762;
    float _1772 = -_1606;
    float _1774 = fma(_1772, _1656, _1764);
    float _1776 = _1630 * _1298;
    float _1778 = -_1766;
    float _1780 = fma(_1292, _1658, _1778);
    float _1782 = _1768 + _1770;
    float _1784 = _1298 * _1644;
    float _1786 = fma(_1618, _1656, _1776);
    float _1788 = fma(_1626, _1780, _1774);
    float _1790 = sqrt(_1782);
    float _1792 = fma(_1622, _1656, _1784);
    float _1794 = fma(_1640, _1780, _1786);
    float _1796 = _1660 * _1788;
    float _1798 = _1740 * _1672;
    float _1800 = _1754 * _1672;
    float _1802 = _1750 * _1672;
    float _1804 = fma(_1632, _1780, _1792);
    float _1806 = fma(_1652, _1794, _1796);
    float _1808 = _1708 * _1668;
    float _1810 = _1788 * _1668;
    float _1812 = _1710 * _1668;
    float _1814 = _1708 * _1044;
    float _1816 = _1788 * _1044;
    float _1818 = _1710 * _1044;
    float _1820 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1822 = _1790 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1824 = _1708 * _1798;
    float _1826 = _1788 * _1798;
    float _1828 = fma(_1662, _1804, _1806);
    float _1830 = _1710 * _1798;
    float _1832 = fma(_1714, _1666, _1808);
    float _1834 = fma(_1714, _1036, _1814);
    float _1836 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1838 = fma(_1714, _1800, _1824);
    float _1840 = _942 + _1828;
    float _1842 = fma(_1794, _1666, _1810);
    float _1844 = fma(_1718, _1666, _1812);
    float _1846 = _1808;
    float _1848 = _1828;
    float _1850 = _1814;
    float _1852 = _1768;
    float _1854 = _1770;
    float _1856 = _1806;
    float _1858 = _1832;
    if (!_1822)
    {
        _1846 = _1744;
    }
    float _1860 = _1846;
    float _1862 = _1860;
    if (!_1822)
    {
        _1848 = _1746;
    }
    float _1864 = _1848;
    float _1866 = _1864;
    if (!_1822)
    {
        _1850 = _1840;
    }
    float _1868 = _1850;
    bool _1870 = !_1822;
    float _1872 = _1868;
    if (!_1870)
    {
        float _1874 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1876 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1878 = _1790 + _1876;
        float _1880 = _1840 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1882 = rsqrt(_1782);
        float _1884 = _1878 * _1874;
        float _1886 = _1884 * 0.15915493667125701904296875;
        float _1888 = _1886 * 6.283185482025146484375;
        float _1890 = sin(_1888);
        float _1892 = _1886 * 6.283185482025146484375;
        float _1894 = cos(_1892);
        float _1896 = fma(_1890, _1880, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1898 = _1882 * _1896;
        float _1900 = fma(_1758, _1898, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1902 = _1894 + (-1.0);
        float _1904 = fma(_1762, _1898, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1906 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1908 = _1900 + _1906;
        float _1910 = _1902 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1912 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1914 = _1904 + _1912;
        float _1916 = _1908 * _1908;
        float _1918 = fma(_1840, _1894, _1910);
        float _1920 = _1914 * _1914;
        _1872 = _1918;
        _1852 = _1916;
        _1854 = _1920;
        _1862 = _1900;
        _1866 = _1904;
        _1856 = _1886;
    }
    float _1922 = _1872;
    float _1924 = _1852;
    float _1926 = _1854;
    float _1928 = _1862;
    float _1930 = _1866;
    float _1932 = _1856;
    float _1934 = fma(_1794, _1036, _1816);
    float _1936 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1938 = _1922 + _1936;
    float _1940 = fma(_1718, _1036, _1818);
    float _1942 = fma(_1938, _1938, _1924);
    float _1944 = _1064 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1946 = fma(_1794, _1800, _1826);
    float _1948 = _1942 + _1926;
    float _1950 = fma(_1718, _1800, _1830);
    float _1952 = _1600 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1954 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1956 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1958 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1960 = sqrt(_1948);
    float _1962 = _1944 * _1836;
    float _1964 = fma(_1722, _1670, _1832);
    float _1966 = fma(_1804, _1670, _1842);
    float _1968 = _1952 * _1820;
    float _1970 = fma(_1722, _1802, _1838);
    float _1972 = fma(_1804, _1802, _1946);
    float _1974 = fma(_1724, _1802, _1950);
    float _1976 = fma(_1724, _1670, _1844);
    float _1978 = fma(_1722, _1060, _1834);
    float _1980 = _1954 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1982 = _1956 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1984 = _1958 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1986 = _1612 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1988 = fma(_1804, _1060, _1934);
    float _1990 = fma(_1724, _1060, _1940);
    out.m_81.x = _1968;
    out.m_81.y = _1962;
    bool _1992 = _1960 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1994 = isnan(_1960);
    bool _1996 = _1992 || _1994;
    bool _1998 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2000 = _1996 || _1998;
    out.m_83.x = _1980;
    out.m_83.y = _1982;
    out.m_83.z = _1984;
    out.m_83.w = _1986;
    out.m_85.x = _1964;
    out.m_85.y = _1966;
    out.m_85.z = _1976;
    out.m_87.x = _1970;
    out.m_87.y = _1972;
    out.m_87.z = _1974;
    float _2002 = _1932;
    if (!_2000)
    {
        _2002 = 1.0;
    }
    float _2004 = _2002;
    out.m_89.x = _1978;
    out.m_89.y = _1988;
    out.m_89.z = _1990;
    bool _2006 = !_2000;
    float _2008 = _2004;
    if (!_2006)
    {
        bool _2010 = _1960 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2012 = isnan(_1960);
        bool _2014 = _2010 || _2012;
        bool _2016 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2018 = _2014 || _2016;
        if (!_2018)
        {
            float _2020 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2022 = _1960 + _2020;
            float _2024 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2026 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2024;
            float _2028 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2030 = _2028 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2032 = 1.0 / _2026;
            float _2034 = _2022 * _2032;
            float _2036 = fma(_2034, _2030, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2008 = _2036;
            _2038 = true;
        }
        else
        {
            bool _2040 = _1960 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2042 = isnan(_1960);
            bool _2044 = _2040 || _2042;
            bool _2046 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2048 = _2044 || _2046;
            if (!_2048)
            {
                float _2050 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2052 = _1960 + _2050;
                float _2054 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2056 = _2054 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2058 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2060 = _2058 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2062 = 1.0 / _2056;
                float _2064 = _2052 * _2062;
                float _2066 = fma(_2064, _2060, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2008 = _2066;
                _2038 = true;
            }
            else
            {
                _2008 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2038 = false;
    float _2068 = _2008;
    float _2070 = -_1442;
    float _2072 = fma(_2070, (*spvDescriptorSet0.vp_c9)._m0[18].w, _968);
    float _2074 = -_1468;
    float _2076 = fma(_2074, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1360);
    float _2078 = fma(_2072, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2080 = fma(_2076, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2082 = floor(_2078);
    float _2084 = floor(_2080);
    float _2086 = -_2082;
    float _2088 = _2078 + _2086;
    float _2090 = -_2084;
    float _2092 = _2080 + _2090;
    float2 _6829 = float2(_2088, _2092);
    float _2094 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6829, float2(0.0), isnan(_6829)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6829, float2(0.0), isnan(_6829)), level(0.0)).x;
    float _2096 = -_1440;
    float _2098 = fma(_2096, (*spvDescriptorSet0.vp_c9)._m0[18].w, _942);
    float _2100 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _2102 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2104 = _1928 + _2102;
    float _2106 = _2098 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2108 = _2098 + _2100;
    float _2110 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2112 = _1922 + _2110;
    float _2114 = fma(_2072, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2106);
    float _2116 = _2108 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _2118 = _2108 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _2120 = fma(_2076, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2114);
    float _2122 = _2098 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2124 = fma(_2072, (*spvDescriptorSet0.vp_c15)._m0[126].x, _2116);
    float _2126 = fma(_2072, (*spvDescriptorSet0.vp_c15)._m0[127].x, _2118);
    float _2128 = _2120 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2130 = fma(_2072, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2122);
    float _2132 = fma(_2076, (*spvDescriptorSet0.vp_c15)._m0[126].z, _2124);
    float _2134 = fma(_2076, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2126);
    float _2136 = 1.0 / _2128;
    float _2138 = fma(_2076, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2130);
    float _2140 = _2132 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _2142 = _2134 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _2144 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2146 = _1930 + _2144;
    float _2148 = _2138 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2150 = fma(_2104, _2068, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2152 = fma(_2112, _2068, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2154 = trunc(_2142);
    int _2156 = int(_2154);
    float _2158 = _2148 + _2128;
    float _2160 = -_1442;
    float _2162 = fma(_2160, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2150);
    float _2164 = fma(_2146, _2068, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2166 = -_1468;
    float _2168 = fma(_2166, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2164);
    float _2170 = _2158 * _2136;
    float _2172 = _2170 * 0.5;
    float _2174 = trunc(_2140);
    int _2176 = int(_2174);
    float _2178 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2180 = fma(_2172, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2178);
    int _2182 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _2184 = _2156 + _2182;
    int _2186 = _2184 + 1;
    float _2188 = 1.0 / _2180;
    int _2190 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2192 = _2176 + _2190;
    int _2194 = _2192 + 1;
    bool _2196 = _2194 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _2198 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2200 = _2188 * _2198;
    int _2202 = _2194 | _2186;
    bool _2204 = _2200 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _2206 = _2202 < 0;
    bool _2208 = _2206 || _2196;
    bool _2210 = _2200 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _2212 = _2186 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _2214 = _2212 || _2208;
    bool _2216 = !_2204;
    int _2218 = _2216 ? 0 : 1;
    int _2220 = 2;
    int _2222 = _2186;
    int _2224 = _2194;
    int _2226 = _2218;
    float _2228 = _2162;
    float _2230 = _2168;
    float _2232 = _2142;
    float _2234 = _2140;
    float _2236 = _2072;
    float _2238 = _2098;
    if (!_2204)
    {
        _2220 = 1;
    }
    int _2240 = _2220;
    int _2242 = _2240;
    if (!_2210)
    {
        _2242 = _2218;
    }
    int _2244 = _2242;
    float _2246 = as_type<float>(_2244);
    if (!_2214)
    {
        int _2248 = _2186 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _2250 = _2248 + _2194;
        _2222 = _2250;
    }
    int _2252 = _2222;
    bool _2254 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2256 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2258 = _2254 || _2256;
    bool _2260 = isnan(0.5);
    bool _2262 = _2258 || _2260;
    int _2264 = _2244 << 6;
    float _2266 = as_type<float>(_2264);
    if (!_2214)
    {
        int _2268 = _2252 << 2;
        _2224 = _2268;
    }
    int _2270 = _2224;
    int _2272 = _2264 + 96;
    uint _2275 = uint(int(uint(_2272) >> uint(2)));
    uint _2277 = uint(int(uint(int(_2275)) >> uint(2)));
    int _2279 = int(_2275) & 3;
    float _2281 = (*spvDescriptorSet0.vp_c15)._m0[int(_2277)][_2279];
    int _2283 = int(_2275) + 1;
    uint _2285 = uint(int(uint(_2283) >> uint(2)));
    int _2287 = _2283 & 3;
    float _2289 = (*spvDescriptorSet0.vp_c15)._m0[int(_2285)][_2287];
    int _2291 = _2270;
    if (!_2214)
    {
        uint _2293 = uint(int(uint(_2252) >> uint(2)));
        _2226 = int(_2293);
    }
    int _2295 = _2226;
    if (!_2214)
    {
        int _2297 = 12 & _2270;
        _2291 = _2297;
    }
    int _2299 = _2291;
    if (!_2214)
    {
        int _2301 = _2295 << 4;
        int _2303 = _2301 + _2299;
        _1858 = as_type<float>(_2303);
    }
    float _2305 = _1858;
    int _2307 = _2264 + 48;
    uint _2309 = uint(int(uint(_2307) >> uint(2)));
    uint _2311 = uint(int(uint(int(_2309)) >> uint(2)));
    int _2313 = int(_2309) & 3;
    float _2315 = (*spvDescriptorSet0.vp_c15)._m0[int(_2311)][_2313];
    int _2317 = int(_2309) + 1;
    uint _2319 = uint(int(uint(_2317) >> uint(2)));
    int _2321 = _2317 & 3;
    float _2323 = (*spvDescriptorSet0.vp_c15)._m0[int(_2319)][_2321];
    int _2325 = _2264 + 64;
    uint _2327 = uint(int(uint(_2325) >> uint(2)));
    uint _2329 = uint(int(uint(int(_2327)) >> uint(2)));
    int _2331 = int(_2327) & 3;
    float _2333 = (*spvDescriptorSet0.vp_c15)._m0[int(_2329)][_2331];
    int _2335 = int(_2327) + 1;
    uint _2337 = uint(int(uint(_2335) >> uint(2)));
    int _2339 = _2335 & 3;
    float _2341 = (*spvDescriptorSet0.vp_c15)._m0[int(_2337)][_2339];
    int _2343 = _2264 + 104;
    uint _2345 = uint(int(uint(_2343) >> uint(2)));
    uint _2347 = uint(int(uint(int(_2345)) >> uint(2)));
    int _2349 = int(_2345) & 3;
    float _2351 = (*spvDescriptorSet0.vp_c15)._m0[int(_2347)][_2349];
    int _2353 = int(_2345) + 1;
    uint _2355 = uint(int(uint(_2353) >> uint(2)));
    int _2357 = _2353 & 3;
    float _2359 = (*spvDescriptorSet0.vp_c15)._m0[int(_2355)][_2357];
    int _2361 = _2264 + 56;
    uint _2363 = uint(int(uint(_2361) >> uint(2)));
    uint _2365 = uint(int(uint(int(_2363)) >> uint(2)));
    int _2367 = int(_2363) & 3;
    float _2369 = (*spvDescriptorSet0.vp_c15)._m0[int(_2365)][_2367];
    int _2371 = int(_2363) + 1;
    uint _2373 = uint(int(uint(_2371) >> uint(2)));
    int _2375 = _2371 & 3;
    float _2377 = (*spvDescriptorSet0.vp_c15)._m0[int(_2373)][_2375];
    int _2379 = _2264 + 72;
    uint _2381 = uint(int(uint(_2379) >> uint(2)));
    uint _2383 = uint(int(uint(int(_2381)) >> uint(2)));
    int _2385 = int(_2381) & 3;
    float _2387 = (*spvDescriptorSet0.vp_c15)._m0[int(_2383)][_2385];
    int _2389 = int(_2381) + 1;
    uint _2391 = uint(int(uint(_2389) >> uint(2)));
    int _2393 = _2389 & 3;
    float _2395 = (*spvDescriptorSet0.vp_c15)._m0[int(_2391)][_2393];
    int _2397 = _2264 + 80;
    uint _2399 = uint(int(uint(_2397) >> uint(2)));
    uint _2401 = uint(int(uint(int(_2399)) >> uint(2)));
    int _2403 = int(_2399) & 3;
    float _2405 = (*spvDescriptorSet0.vp_c15)._m0[int(_2401)][_2403];
    int _2407 = int(_2399) + 1;
    uint _2409 = uint(int(uint(_2407) >> uint(2)));
    int _2411 = _2407 & 3;
    float _2413 = (*spvDescriptorSet0.vp_c15)._m0[int(_2409)][_2411];
    float _2415 = _2108 * _2289;
    float _2417 = fma(_2072, _2281, _2415);
    float _2419 = -_1440;
    float _2421 = fma(_2419, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2152);
    if (_2262)
    {
        _1452 = _2162;
    }
    float _2423 = _1452;
    float _2425 = _2305;
    float _2427 = _2423;
    if (!_2214)
    {
        int _2429 = as_type<int>(_2305) + 400;
        uint _2431 = uint(int(uint(_2429) >> uint(2)));
        uint _2433 = uint(int(uint(int(_2431)) >> uint(2)));
        int _2435 = int(_2431) & 3;
        float _2437 = (*spvDescriptorSet0.vp_c15)._m0[int(_2433)][_2435];
        _2425 = _2437;
    }
    float _2439 = _2425;
    float _2441 = _2108 * _2323;
    if (_2262)
    {
        _2228 = _2421;
    }
    float _2443 = _2228;
    float _2445 = fma(_2072, _2315, _2441);
    float _2447 = _2108 * _2341;
    float _2449 = fma(_2072, _2333, _2447);
    float _2451 = fma(_2076, _2351, _2417);
    float _2453 = _2443;
    float _2455 = _2341;
    if (!_2262)
    {
        float _2457 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2459 = _2098 + _2457;
        float _2461 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2463 = _2072 + _2461;
        float _2465 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2467 = -_1360;
        float _2469 = _2467 + _2164;
        float _2471 = _2459 * _2459;
        float _2473 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2475 = _2076 + _2473;
        float _2477 = -_942;
        float _2479 = _2477 + _2152;
        float _2481 = -_968;
        float _2483 = _2481 + _2150;
        float _2485 = fma(_2463, _2463, _2471);
        float _2487 = 1.0 / _1598;
        float _2489 = fma(_2475, _2475, _2485);
        float _2491 = sqrt(_2489);
        float _2493 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2495 = precise::min(_2491, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2497 = _2495 * _2465;
        float _2499 = _2493 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2501 = _2497 * _2487;
        float _2503 = _2499 * _2501;
        float _2505 = _2469 * _2501;
        float _2507 = fma(_2479, _2503, _2098);
        float _2509 = fma(_2483, _2503, _2072);
        float _2511 = fma(_2499, _2505, _2076);
        _2453 = _2507;
        _2427 = _2509;
        _2230 = _2511;
    }
    float _2513 = _2453;
    float _2515 = _2427;
    float _2517 = _2230;
    float _2519 = _2451 + _2359;
    float _2521 = fma(_2076, _2387, _2449);
    int _2523 = _2264 + 88;
    uint _2525 = uint(int(uint(_2523) >> uint(2)));
    uint _2527 = uint(int(uint(int(_2525)) >> uint(2)));
    int _2529 = int(_2525) & 3;
    float _2531 = (*spvDescriptorSet0.vp_c15)._m0[int(_2527)][_2529];
    int _2533 = int(_2525) + 1;
    uint _2535 = uint(int(uint(_2533) >> uint(2)));
    int _2537 = _2533 & 3;
    float _2539 = (*spvDescriptorSet0.vp_c15)._m0[int(_2535)][_2537];
    float _2541 = fma(_2076, _2369, _2445);
    float _2543 = _2513 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2545 = _2521 + _2395;
    float _2547 = 1.0 / _2519;
    float _2549 = _2513 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2551 = _2541 + _2377;
    float _2553 = _2513 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2555 = fma(_2515, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2543);
    float _2557 = fma(_2515, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2549);
    float _2559 = _2513 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2561 = fma(_2515, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2553);
    float _2563 = fma(_2517, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2555);
    float _2565 = fma(_2517, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2557);
    float _2567 = fma(_2515, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2559);
    float _2569 = fma(_2517, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2561);
    float _2571 = _2563 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2573 = _2565 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2575 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2577 = _2569 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2579 = _2551 * _2547;
    float _2581 = _2545 * _2547;
    float _2583 = _2573 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2585 = _2577 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2587 = fma(_2517, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2567);
    bool _2589 = _2579 >= 0.0;
    float _2591 = -_2583;
    float _2593 = fma(_2591, _2575, 1.0);
    float _2595 = fma(_2571, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2585);
    float _2597 = _2587 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    bool _2599 = _2579 <= 1.0;
    bool _2601 = _2599 && _2589;
    float _2603 = _2445;
    if (!_2214)
    {
        float _2605 = floor(_2140);
        _2603 = _2605;
    }
    float _2607 = _2603;
    float _2609 = fma(_2573, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2595);
    float _2611 = _2108 * _2413;
    bool _2613 = _2581 >= 0.0;
    bool _2615 = _2613 && _2601;
    float _2617 = _2577 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2619 = fma(_2597, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2609);
    float _2621 = _2577 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    bool _2623 = _2581 <= 1.0;
    bool _2625 = _2623 && _2615;
    float _2627 = log2(_2593);
    float _2629 = fma(_2072, _2405, _2611);
    float _2631 = fma(_2571, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2617);
    float _2633 = fma(_2573, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2631);
    float _2635 = 1.0 / _2619;
    float _2637 = fma(_2571, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2621);
    float _2639 = fma(_2076, _2531, _2629);
    float _2641 = fma(_2597, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2633);
    float _2643 = _2641;
    if (_2625)
    {
        float _2645 = float(_2244);
        _2246 = _2645;
    }
    float _2647 = _2246;
    float _2649 = fma(_2573, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2637);
    float _2651 = _2639 + _2539;
    if (!_2214)
    {
        float _2653 = -_2607;
        float _2655 = _2140 + _2653;
        _2266 = _2655;
    }
    float _2657 = _2266;
    float _2659 = _2551;
    if (!_2214)
    {
        float _2661 = floor(_2142);
        _2659 = _2661;
    }
    float _2663 = _2659;
    float _2665 = fma(_2597, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2649);
    float _2667 = _2627 * 0.693147182464599609375;
    float _2669 = _2651 * _2547;
    float _2671 = _2667 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2673 = _2439;
    float _2675 = _2669;
    if (!_2214)
    {
        float _2677 = rint(_2439);
        float _2679 = precise::max(_2677, 0.0);
        uint _2681 = uint(_2679);
        uint _2683 = clamp(_2681, 0u, 65535u);
        _2673 = as_type<float>(_2683);
    }
    float _2685 = _2673;
    float _2687 = _2641 * _2635;
    float _2689 = _2665 * _2635;
    float _2691 = fma(_2687, 0.5, 0.5);
    float _2693 = fma(_2689, -0.5, 0.5);
    float _2695 = _2629;
    float _2697 = _2691;
    if (_2625)
    {
        float _2699 = rint(_2647);
        float _2701 = precise::max(_2699, 0.0);
        uint _2703 = uint(_2701);
        uint _2705 = clamp(_2703, 0u, 65535u);
        _2695 = as_type<float>(_2705);
    }
    float _2707 = _2695;
    if (!_2214)
    {
        float _2709 = -_2663;
        float _2711 = _2142 + _2709;
        _2232 = _2711;
    }
    float _2713 = _2232;
    float _2715 = _2685;
    if (!_2214)
    {
        float3 _7882 = float3(_2657, _2713, float(as_type<int>(_2685)));
        float3 _7886 = select(_7882, float3(0.0), isnan(_7882));
        float _2717 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _7886.xy, uint(rint(_7886.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _7886.xy, uint(rint(_7886.z)), level(0.0)).x;
        _2715 = _2717;
    }
    float _2719 = _2715;
    float _2721 = _2581;
    if (_2625)
    {
        float3 _7901 = float3(_2579, _2581, float(as_type<int>(_2707)));
        float3 _7903 = select(_7901, float3(0.0), isnan(_7901));
        float _2723 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _7903.xy, uint(rint(_7903.z)), _2669, level(0.0));
        _2721 = _2723;
    }
    float _2725 = _2721;
    float3 _7913 = float3(_2691, _2693, _2671);
    float _2727 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7913, float3(0.0), isnan(_7913)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7913, float3(0.0), isnan(_7913)), level(0.0)).x;
    float3 _7922 = float3(_2691, _2693, _2671);
    float4 _2730 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7922, float3(0.0), isnan(_7922)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7922, float3(0.0), isnan(_7922)), level(0.0)).xyzw;
    float _2732 = _2730.x;
    float _2734 = _2730.y;
    float _2736 = _2730.z;
    float _2738 = _2730.w;
    bool _2740 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2742 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2744 = _2740 || _2742;
    bool _2746 = isnan(0.5);
    bool _2748 = _2744 || _2746;
    if (_2748)
    {
        _2455 = 1.0;
    }
    float _2750 = _2455;
    float _2752 = _2750;
    float _2754 = _2725;
    if (!_2748)
    {
        float _2756 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2758 = _2756 * 0.15915493667125701904296875;
        float _2760 = _2758 * 6.283185482025146484375;
        float _2762 = cos(_2760);
        float _2764 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2766 = _2764 * 0.15915493667125701904296875;
        float _2768 = _2758 * 6.283185482025146484375;
        float _2770 = sin(_2768);
        float _2772 = 1.0 / _2762;
        float _2774 = _2766 * 6.283185482025146484375;
        float _2776 = cos(_2774);
        float _2778 = _2770 * _2772;
        float _2780 = _2766 * 6.283185482025146484375;
        float _2782 = sin(_2780);
        float _2784 = _2776 * _2778;
        float _2786 = 1.0 / _2784;
        float _2788 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2790 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2788;
        float _2792 = 1.0 / _2790;
        float _2794 = _2782 * _2786;
        float _2796 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2798 = fma(_2200, _2794, _2796);
        float _2800 = _2798 * _2792;
        float _2802 = precise::clamp(_2800, 0.0, 1.0);
        _2697 = _2766;
        _2752 = _2802;
    }
    float _2804 = _2697;
    float _2806 = _2752;
    float _2808 = _2804;
    if (_2214)
    {
        _2234 = 1.0;
    }
    float _2810 = _2234;
    float _2812 = _2810;
    if (!_2214)
    {
        int _2814 = _2252 << 4;
        int _2816 = _2814 + 2048;
        uint _2818 = uint(int(uint(_2816) >> uint(2)));
        uint _2820 = uint(int(uint(int(_2818)) >> uint(2)));
        int _2822 = int(_2818) & 3;
        float _2824 = (*spvDescriptorSet0.vp_c15)._m0[int(_2820)][_2822];
        int _2826 = int(_2818) + 1;
        uint _2828 = uint(int(uint(_2826) >> uint(2)));
        int _2830 = _2826 & 3;
        float _2832 = (*spvDescriptorSet0.vp_c15)._m0[int(_2828)][_2830];
        int _2834 = _2816 + 8;
        uint _2836 = uint(int(uint(_2834) >> uint(2)));
        uint _2838 = uint(int(uint(int(_2836)) >> uint(2)));
        int _2840 = int(_2836) & 3;
        float _2842 = (*spvDescriptorSet0.vp_c15)._m0[int(_2838)][_2840];
        int _2844 = int(_2836) + 1;
        uint _2846 = uint(int(uint(_2844) >> uint(2)));
        int _2848 = _2844 & 3;
        float _2850 = (*spvDescriptorSet0.vp_c15)._m0[int(_2846)][_2848];
        float _2852 = _2108 * _2832;
        float _2854 = fma(_2072, _2824, _2852);
        float _2856 = fma(_2076, _2842, _2854);
        float _2858 = _2856 + _2850;
        float _2860 = precise::clamp(_2858, 0.0, 1.0);
        float _2862 = -_2860;
        float _2864 = _2862 + _2719;
        float _2866 = fma(_2864, 500.0, 1.5);
        float _2868 = exp2(_2866);
        float _2870 = 0.0 + _2868;
        float _2872 = precise::clamp(_2870, 0.0, 1.0);
        _2812 = _2872;
    }
    float _2874 = _2812;
    float _2876 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2878 = _2513 + _2876;
    float _2880 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2882 = _2515 + _2880;
    float _2884 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2886 = _2517 + _2884;
    float _2888 = _2878 * _2878;
    float _2890 = fma(_2882, _2882, _2888);
    float _2892 = fma(_2886, _2886, _2890);
    float _2894 = rsqrt(_2892);
    float _2896 = sqrt(_2892);
    float _2898 = _2894 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2900 = _2882 * _2898;
    float _2902 = _2886 * _2898;
    float _2904 = _2900 * _2900;
    float _2906 = _2902 * _2902;
    float _2908 = _2904 + _2906;
    float _2910 = sqrt(_2908);
    bool _2912 = _2910 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2914 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2916 = _2910 + _2914;
    float _2918 = _2886;
    float _2920 = _2916;
    float _2922 = _2878;
    if (_2912)
    {
        float _2924 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2918 = _2924;
    }
    float _2926 = _2918;
    if (_2912)
    {
        float _2928 = rsqrt(_2908);
        _2236 = _2928;
    }
    float _2930 = _2236;
    float _2932 = _2930;
    if (_2912)
    {
        float _2934 = _2916 * _2926;
        _2920 = _2934;
    }
    float _2936 = _2920;
    if (_2912)
    {
        float _2938 = _2936 * 0.15915493667125701904296875;
        _2808 = _2938;
    }
    float _2940 = _2808;
    float _2942 = _2888;
    if (_2912)
    {
        float _2944 = _2940 * 6.283185482025146484375;
        float _2946 = sin(_2944);
        _2942 = _2946;
    }
    float _2948 = _2942;
    float _2950 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2952 = precise::max(0.0, _2950);
    float _2954 = _2894;
    float _2956 = _2952;
    float _2958 = _2950;
    if (_2912)
    {
        float _2960 = _2940 * 6.283185482025146484375;
        float _2962 = cos(_2960);
        _2954 = _2962;
    }
    float _2964 = _2954;
    float _2966 = -_2898;
    float _2968 = -_2952;
    float _2970 = fma(_2878, _2966, _2968);
    if (!_2912)
    {
        _2956 = _2900;
    }
    float _2972 = _2956;
    float _2974 = _2972;
    if (_2912)
    {
        float _2976 = _2970 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2958 = _2976;
    }
    float _2978 = _2958;
    float _2980 = _2948;
    float _2982 = _2978;
    if (_2912)
    {
        float _2984 = fma(_2948, _2978, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2922 = _2984;
    }
    float _2986 = _2922;
    float _2988 = _2986;
    if (!_2912)
    {
        _2980 = _2904;
    }
    float _2990 = _2980;
    float _2992 = _2990;
    float _2994 = _2964;
    if (_2912)
    {
        float _2996 = _2964 + (-1.0);
        _2982 = _2996;
    }
    float _2998 = _2982;
    float _3000 = _2998;
    if (_2912)
    {
        float _3002 = _2930 * _2986;
        _2238 = _3002;
    }
    float _3004 = _2238;
    if (!_2912)
    {
        _2988 = _2970;
    }
    float _3006 = _2988;
    float _3008 = _3006;
    if (_2912)
    {
        float _3010 = _2998 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2932 = _3010;
    }
    float _3012 = _2932;
    if (_2912)
    {
        float _3014 = _2900 * _3004;
        _2974 = _3014;
    }
    float _3016 = _2974;
    if (!_2912)
    {
        _3000 = _2902;
    }
    float _3018 = _3000;
    float _3020 = _3018;
    if (_2912)
    {
        float _3022 = _2902 * _3004;
        _3020 = _3022;
    }
    float _3024 = _3020;
    if (_2912)
    {
        float _3026 = fma(_2970, _2964, _3012);
        _3008 = _3026;
    }
    float _3028 = _3008;
    if (_2912)
    {
        float _3030 = _3016 * _3016;
        _2992 = _3030;
    }
    float _3032 = _2992;
    if (!_2912)
    {
        _2994 = _2906;
    }
    float _3034 = _2994;
    float _3036 = _3034;
    if (_2912)
    {
        float _3038 = _3024 * _3024;
        _3036 = _3038;
    }
    float _3040 = _3036;
    float _3042 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3044 = fma(_2896, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3042);
    float _3046 = precise::clamp(_3044, 0.0, 1.0);
    float _3048 = fma(_3028, _3028, _3032);
    float _3050 = -_3046;
    float _3052 = _3050 + 1.0;
    float _3054 = _3048 + _3040;
    float _3056 = rsqrt(_3054);
    float _3058 = abs(_3052);
    float _3060 = log2(_3058);
    float _3062 = _3056 * _3016;
    float _3064 = _3056 * _3028;
    float _3066 = _3056 * _3024;
    float _3068 = _3062 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3070 = -_3068;
    float _3072 = fma(_3064, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3070);
    float _3074 = -_3066;
    float _3076 = fma(_3074, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3072);
    float _3078 = _3060 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3080 = fma(_3076, -0.5, 0.5);
    float _3082 = fma(_3076, 0.5, 0.5);
    float _3084 = _3064 + 1.0;
    float _3086 = exp2(_3078);
    float _3088 = fma(_3082, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3090 = fma(_3082, _3088, -0.212114393711090087890625);
    float _3092 = sqrt(_3080);
    float _3094 = fma(_3082, _3090, 1.570728778839111328125);
    float _3096 = -_3064;
    float _3098 = fma(_3086, _3084, _3096);
    float _3100 = fma(_3098, 0.5, 0.5);
    float _3102 = _3092 * 0.636619746685028076171875;
    float _3104 = -_3094;
    float _3106 = fma(_3102, _3104, 1.0);
    float2 _8490 = float2(_3106, _3100);
    float3 _3110 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8490, float2(0.0), isnan(_8490)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8490, float2(0.0), isnan(_8490)), level(0.0)).xyz;
    float _3112 = _3110.x;
    float _3114 = _3110.y;
    float _3116 = _3110.z;
    float _3118 = abs(_2200);
    float _3120 = log2(_3118);
    float _3122 = _2577 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3124 = _3060 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3126 = -_2094;
    float _3128 = _3126 + 1.0;
    float _3130 = _2641 + _2619;
    float _3132 = fma(_2571, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3122);
    float _3134 = exp2(_3124);
    float _3136 = fma(_2573, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3132);
    float _3138 = _2619 * 0.5;
    bool _3140 = _2200 <= 8000.0;
    bool _3142 = isnan(_2200);
    bool _3144 = _3140 || _3142;
    bool _3146 = isnan(8000.0);
    bool _3148 = _3144 || _3146;
    float _3150 = float(_3148);
    float _3152 = _3130 * 0.5;
    bool _3154 = _2896 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3156 = isnan(_2896);
    bool _3158 = _3154 || _3156;
    bool _3160 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3162 = _3158 || _3160;
    float _3164 = fma(_2665, -0.5, _3138);
    float _3166 = _3120 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3168 = fma(_2597, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3136);
    float _3170 = _3168 + _2619;
    float _3172 = exp2(_3166);
    out.gl_Position.x = _2641;
    out.gl_Position.y = _2665;
    out.gl_Position.z = _3168;
    out.gl_Position.w = _2619;
    float _3174 = _3170 * 0.5;
    out.m_91.x = _3152;
    out.m_91.y = _3164;
    out.m_91.z = _3174;
    out.m_91.w = _2619;
    float _3176 = -_3134;
    float _3178 = _3176 + 1.0;
    float _3180 = fma(_3172, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3182 = precise::clamp(_3180, 0.0, 1.0);
    if (!_2625)
    {
        _2643 = 1.0;
    }
    float _3184 = _2643;
    float _3186 = _3184;
    if (_2625)
    {
        bool _3188 = _2725 >= _2669;
        bool _3190 = isnan(_2725);
        bool _3192 = _3188 || _3190;
        bool _3194 = isnan(_2669);
        bool _3196 = _3192 || _3194;
        float _3198 = float(_3196);
        _3186 = _3198;
    }
    float _3200 = _3186;
    float _3202 = fma(_3182, -2.0, 3.0);
    float _3204 = _3182 * _3182;
    float _3206 = _3178 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3208 = _3206;
    if (!_3162)
    {
        _2675 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3210 = _2675;
    float _3212 = _3200 * _2874;
    float _3214 = _3204 * _3202;
    float _3216 = _3206 * _2727;
    float _3218 = -_3206;
    float _3220 = _3218 + 1.0;
    float _3222 = _3220;
    float _3224 = _3210;
    float _3226 = _3210;
    if (!_3162)
    {
        _2754 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3228 = _2754;
    float _3230 = -_3214;
    float _3232 = _3230 + 1.0;
    float _3234 = _3228;
    float _3236 = _3228;
    if (!_3162)
    {
        _3208 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3238 = _3208;
    float _3240 = _2738 * _3220;
    float _3242 = _3238;
    float _3244 = _3238;
    if (!_3162)
    {
        _3222 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3246 = _3222;
    float _3248 = fma(_3232, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3214);
    float _3250 = _3150 * _3248;
    float _3252 = _3250 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3254 = _3128 * _3252;
    float _3256 = precise::clamp(_3254, 0.0, 1.0);
    float _3258 = _2738 * _3216;
    float _3260 = -_3256;
    float _3262 = fma(_3260, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3264 = -_3212;
    float _3266 = fma(_3264, _3262, 1.0);
    float _3268 = precise::clamp(_3266, 0.0, 1.0);
    float _3270 = _2806 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3272 = _3268 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3274 = _3268;
    float _3276 = _3258;
    float _3278 = _3246;
    float _3280 = _3246;
    if (!_3162)
    {
        _3274 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3282 = _3274;
    out.m_93.x = _3272;
    float _3284 = _3116 * _3216;
    float _3286 = fma(_3112, _3258, _2732);
    float _3288 = fma(_3114, _3258, _2734);
    float _3290 = _3282;
    float _3292 = _3282;
    if (!_3162)
    {
        _3276 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3294 = _3276;
    float _3296 = fma(_2738, _3284, _2736);
    out.m_95.x = _3286;
    out.m_95.y = _3288;
    out.m_95.z = _3296;
    out.m_95.w = _3240;
    bool _3298 = !_3162;
    float _3300 = _3294;
    float _3302 = _3294;
    if (!_3298)
    {
        bool _3304 = _2896 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3306 = isnan(_2896);
        bool _3308 = _3304 || _3306;
        bool _3310 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3312 = _3308 || _3310;
        if (!_3312)
        {
            float _3314 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3316 = _2896 + _3314;
            float _3318 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3320 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3318;
            float _3322 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3324 = _3322 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3326 = 1.0 / _3320;
            float _3328 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3330 = _3328 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3332 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3334 = _3332 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3336 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3338 = _3336 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3340 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3342 = _3340 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3344 = _3316 * _3326;
            float _3346 = precise::clamp(_3344, 0.0, 1.0);
            float _3348 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3350 = _3348 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3352 = fma(_3346, _3324, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3354 = fma(_3346, _3350, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3356 = fma(_3346, _3330, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3358 = fma(_3346, _3334, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3360 = fma(_3346, _3338, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3362 = fma(_3346, _3342, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3236 = _3356;
            _3302 = _3360;
            _3226 = _3352;
            _3280 = _3358;
            _3244 = _3354;
            _3292 = _3362;
            _3364 = true;
        }
        else
        {
            bool _3366 = _2896 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3368 = isnan(_2896);
            bool _3370 = _3366 || _3368;
            bool _3372 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3374 = _3370 || _3372;
            if (!_3374)
            {
                _3224 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3376 = _3224;
            _3226 = _3376;
            if (!_3374)
            {
                _3234 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3378 = _3234;
            _3236 = _3378;
            if (!_3374)
            {
                _3242 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3380 = _3242;
            _3244 = _3380;
            if (!_3374)
            {
                _3278 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3382 = _3278;
            _3280 = _3382;
            if (!_3374)
            {
                _3300 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3384 = _3300;
            _3302 = _3384;
            if (!_3374)
            {
                _3290 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3386 = _3290;
            bool _3388 = !_3374;
            _3292 = _3386;
            if (!_3388)
            {
                bool _3390 = _2896 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3392 = isnan(_2896);
                bool _3394 = _3390 || _3392;
                bool _3396 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3398 = _3394 || _3396;
                if (!_3398)
                {
                    float _3400 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3402 = _2896 + _3400;
                    float _3404 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3406 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3404;
                    float _3408 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3410 = _3408 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3412 = 1.0 / _3406;
                    float _3414 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3416 = _3414 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3418 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3420 = _3418 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3422 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3424 = _3422 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3426 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3428 = _3426 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3430 = _3402 * _3412;
                    float _3432 = precise::clamp(_3430, 0.0, 1.0);
                    float _3434 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3436 = _3434 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3438 = fma(_3432, _3410, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3440 = fma(_3432, _3436, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3442 = fma(_3432, _3416, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3444 = fma(_3432, _3420, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3446 = fma(_3432, _3424, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3448 = fma(_3432, _3428, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3236 = _3442;
                    _3302 = _3446;
                    _3226 = _3438;
                    _3280 = _3444;
                    _3244 = _3440;
                    _3292 = _3448;
                    _3364 = true;
                }
                else
                {
                    _3236 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3302 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3226 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3280 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3244 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3292 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3364 = false;
    float _3450 = _3236;
    float _3452 = _3302;
    float _3454 = _3226;
    float _3456 = _3280;
    float _3458 = _3244;
    float _3460 = _3292;
    float _3462 = fma(_1988, -0.5, 0.5);
    float _3464 = precise::clamp(_3462, 0.0, 1.0);
    float _3466 = -_3450;
    float _3468 = _3466 + _3452;
    float _3470 = _3270 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3472 = -_3454;
    float _3474 = _3472 + _3456;
    float _3476 = fma(_3464, _3468, _3450);
    out.m_97.x = 0.0;
    float _3478 = -_3458;
    float _3480 = _3478 + _3460;
    float _3482 = fma(_3464, _3474, _3454);
    float _3484 = _3476 * 0.586610972881317138671875;
    out.m_61.x = _3470;
    bool _3486 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3488 = fma(_3464, _3480, _3458);
    float _3490 = fma(_3482, 0.298911988735198974609375, _3484);
    bool _3492 = _2806 > 0.0;
    bool _3494 = isnan(_2806);
    bool _3496 = _3492 || _3494;
    bool _3498 = isnan(0.0);
    bool _3500 = _3496 || _3498;
    float _3502 = fma(_3488, 0.114477999508380889892578125, _3490);
    float _3504 = -_3502;
    float _3506 = _3482 + _3504;
    float _3508 = -_3502;
    float _3510 = _3476 + _3508;
    float _3512 = -_3502;
    float _3514 = _3488 + _3512;
    float _3516 = fma(_3506, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3502);
    float _3518 = fma(_3510, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3502);
    float _3520 = fma(_3514, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3502);
    bool _3522 = !_3486;
    if (!_3522)
    {
        float _3524 = -_2513;
        float _3526 = _3524 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3528 = -_2515;
        float _3530 = _3528 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3532 = -_2517;
        float _3534 = _3532 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3536 = _3526 * _3526;
        float _3538 = fma(_3530, _3530, _3536);
        float _3540 = fma(_3534, _3534, _3538);
        float _3542 = sqrt(_3540);
        float _3544 = rsqrt(_3540);
        float _3546 = -_3542;
        float _3548 = _3546 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3550 = _3548 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3552 = precise::clamp(_3550, 0.0, 1.0);
        float _3554 = _3530 * _3544;
        float _3556 = _3526 * _3544;
        float _3558 = abs(_3552);
        float _3560 = log2(_3558);
        float _3562 = _3534 * _3544;
        float _3564 = _3554 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3566 = _1988 * _3556;
        float _3568 = -_3556;
        float _3570 = -_3564;
        float _3572 = fma(_3568, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3570);
        float _3574 = fma(_1978, _3554, _3566);
        float _3576 = -_3562;
        float _3578 = fma(_3576, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3572);
        float _3580 = fma(_1990, _3562, _3574);
        float _3582 = precise::clamp(_3580, 0.0, 1.0);
        float _3584 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3586 = _3578 + _3584;
        float _3588 = _3560 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3590 = _3586 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3592 = precise::clamp(_3590, 0.0, 1.0);
        float _3594 = exp2(_3588);
        float _3596 = _3594 * _3592;
        float _3598 = _3582 * _3596;
        float _3600 = _3598 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3602 = _3598 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3604 = _3598 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_97.x = _3600;
        out.m_97.y = _3602;
        out.m_97.z = _3604;
    }
    out.m_99.x = _3516;
    out.m_99.y = _3518;
    out.m_99.z = _3520;
    if (_3500)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_61.x = 0.0;
    float _3606 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3606;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

