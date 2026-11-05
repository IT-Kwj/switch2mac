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
    constant _16* vp_c13 [[id(4)]];
    constant _16* vp_c16 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    texture2d<float> vp_t_tcb_2C [[id(7)]];
    sampler vp_t_tcb_2CSmplr [[id(8)]];
    texture2d<float> vp_t_tcb_28 [[id(9)]];
    sampler vp_t_tcb_28Smplr [[id(10)]];
    texture2d<float> vp_t_tcb_24 [[id(11)]];
    sampler vp_t_tcb_24Smplr [[id(12)]];
    texture2d_array<float> vp_t_tcb_14 [[id(13)]];
    sampler vp_t_tcb_14Smplr [[id(14)]];
    texture2d_array<float> vp_t_tcb_16 [[id(15)]];
    sampler vp_t_tcb_16Smplr [[id(16)]];
    texture3d<float> vp_t_tcb_32 [[id(17)]];
    sampler vp_t_tcb_32Smplr [[id(18)]];
    texture3d<float> vp_t_tcb_30 [[id(19)]];
    sampler vp_t_tcb_30Smplr [[id(20)]];
    texture2d<float> vp_t_tcb_1C [[id(21)]];
    sampler vp_t_tcb_1CSmplr [[id(22)]];
    sampler vp_t_tcb_2CSmplr_w [[id(23)]];
    sampler vp_t_tcb_28Smplr_w [[id(24)]];
    sampler vp_t_tcb_24Smplr_w [[id(25)]];
    sampler vp_t_tcb_14Smplr_w [[id(26)]];
    sampler vp_t_tcb_32Smplr_w [[id(27)]];
    sampler vp_t_tcb_30Smplr_w [[id(28)]];
    sampler vp_t_tcb_1CSmplr_w [[id(29)]];
    constant dm_border_t* dm_border [[id(30)]];
};

struct main0_out
{
    float4 m_81 [[user(locn0)]];
    float4 m_91 [[user(locn1)]];
    float4 m_107 [[user(locn2)]];
    float4 m_97 [[user(locn3)]];
    float4 m_89 [[user(locn4)]];
    float4 m_95 [[user(locn5)]];
    float4 m_65 [[user(locn6)]];
    float4 m_87 [[user(locn7)]];
    float4 m_93 [[user(locn8)]];
    float4 m_99 [[user(locn9)]];
    float4 m_83 [[user(locn10)]];
    float4 m_105 [[user(locn11)]];
    float4 m_101 [[user(locn12)]];
    float4 m_103 [[user(locn13)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_62 [[attribute(2)]];
    float4 m_67 [[attribute(3)]];
    float4 m_77 [[attribute(4)]];
    float4 m_71 [[attribute(5)]];
    float4 m_75 [[attribute(6)]];
    float4 m_69 [[attribute(7)]];
    float4 m_79 [[attribute(8)]];
    float4 m_73 [[attribute(9)]];
    float4 m_85 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2176 = false;
    bool _914 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _121 = in.m_62.w;
    float _123 = trunc(_121);
    int _126 = int(_123);
    bool _130 = _126 >= 1;
    float _132 = 0.0;
    float _134 = as_type<float>(_126);
    if (!_130)
    {
        _132 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _132;
    if (!_130)
    {
        out.m_65.x = 0.0;
    }
    int _138 = 0;
    if (!_130)
    {
        float _140 = _136 * 5.0;
        _138 = as_type<int>(_140);
    }
    int _142 = _138;
    int _144 = _142;
    if (!_130)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2482 = as_type<float>(_142);
        out.gl_Position.z = _2482;
    }
    if (!_130)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _146 = in.m_67.w;
    bool _148 = _146 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _150 = isnan(_146);
    bool _152 = _148 || _150;
    bool _154 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _156 = _152 || _154;
    float _158 = -_146;
    float _160 = _158 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_156)
    {
        float _162 = float(_126);
        _134 = _162;
    }
    float _164 = _134;
    bool _166 = _160 >= _164;
    bool _168 = !_156;
    bool _170 = _166 || _168;
    float _172 = _164;
    if (_170)
    {
        _172 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _174 = _172;
    if (_170)
    {
        out.m_65.x = 0.0;
    }
    if (_170)
    {
        float _176 = _174 * 5.0;
        _144 = as_type<int>(_176);
    }
    int _178 = _144;
    if (_170)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2551 = as_type<float>(_178);
        out.gl_Position.z = _2551;
    }
    if (_170)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _180 = in.m_69.w;
    float _182 = _160 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _184 = in.m_67.x;
    float _186 = in.m_67.y;
    float _188 = in.m_67.z;
    bool _190 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _192 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _194 = _190 || _192;
    bool _196 = isnan(1.0);
    bool _198 = _194 || _196;
    float _200 = in.m_62.x;
    float _202 = in.m_62.y;
    float _204 = in.m_62.z;
    float _206 = in.m_71.x;
    float _208 = in.m_71.y;
    float _210 = in.m_71.z;
    float _212 = in.m_69.x;
    float _214 = in.m_69.y;
    float _216 = in.m_69.z;
    float _218 = 0.0;
    float _220 = _182;
    if (!_198)
    {
        float _222 = _182 * _182;
        float _224 = _222 * 0.5;
        _218 = _224;
    }
    float _226 = _218;
    float _228 = _226;
    if (!_198)
    {
        float _230 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _228 = _230;
    }
    float _232 = _228;
    bool _234 = !_198;
    float _236 = _232;
    if (!_234)
    {
        float _238 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _240 = log2(_238);
        float _242 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _244 = _242 + 1.0;
        float _246 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _248 = _182 * _240;
        float _250 = exp2(_248);
        float _252 = _246 * 0.693147182464599609375;
        float _254 = 1.0 / _252;
        float _256 = 1.0 / _244;
        float _258 = _250 + (-1.0);
        float _260 = -_258;
        float _262 = fma(_260, _254, _182);
        float _264 = _262 * _256;
        float _266 = _264 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _236 = _266;
    }
    float _268 = _236;
    bool _270 = !_198;
    if (!_270)
    {
        float _272 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _274 = log2(_272);
        float _276 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _278 = _276 + 1.0;
        float _280 = 1.0 / _278;
        float _282 = _182 * _274;
        float _284 = exp2(_282);
        float _286 = -_284;
        float _288 = _286 + 1.0;
        float _290 = _288 * _280;
        _220 = _290;
    }
    float _292 = _220;
    float _294 = _212 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _296 = _216 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _298 = _214 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _300 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _208);
    float _302 = _294 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _304 = _268 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _306 = _298 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _308 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _206);
    float _310 = _296 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _312 = fma(_292, _186, _304);
    float _314 = _268 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _316 = _268 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _318 = _300 * _306;
    float _320 = fma(_312, _180, _202);
    float _322 = fma(_292, _184, _314);
    float _324 = fma(_292, _188, _316);
    float _326 = _308 * _302;
    float _328 = _320 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _330 = fma(_322, _180, _200);
    float _332 = _320 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _334 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _210);
    float _336 = _318 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _338 = fma(_324, _180, _204);
    float _340 = _318 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _342 = fma(_330, (*spvDescriptorSet0.vp_c10)._m0[4].x, _328);
    float _344 = fma(_330, (*spvDescriptorSet0.vp_c10)._m0[6].x, _332);
    float _346 = _334 * _310;
    float _348 = fma(_326, (*spvDescriptorSet0.vp_c10)._m0[8].x, _336);
    float _350 = fma(_326, (*spvDescriptorSet0.vp_c10)._m0[10].x, _340);
    float _352 = fma(_338, (*spvDescriptorSet0.vp_c10)._m0[4].z, _342);
    float _354 = fma(_338, (*spvDescriptorSet0.vp_c10)._m0[6].z, _344);
    float _356 = fma(_346, (*spvDescriptorSet0.vp_c10)._m0[8].z, _348);
    float _358 = fma(_346, (*spvDescriptorSet0.vp_c10)._m0[10].z, _350);
    float _360 = _352 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _362 = _354 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _364 = _360 + _356;
    float _366 = _362 + _358;
    float _368 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _370 = _364 + _368;
    float _372 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _374 = _366 + _372;
    float _376 = _370 * _370;
    float _378 = _374 * _374;
    float _380 = _376 + _378;
    float _382 = sqrt(_380);
    bool _384 = _382 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _386 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _388 = _382 + _386;
    float _390 = _354;
    float _392 = _320;
    float _394 = _356;
    float _396 = _364;
    float _398 = _380;
    float _400 = _376;
    float _402 = _378;
    float _404 = _362;
    if (_384)
    {
        float _406 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _390 = _406;
    }
    float _408 = _390;
    float _410 = _408;
    if (_384)
    {
        float _412 = _388 * _408;
        _410 = _412;
    }
    float _414 = _410;
    float _416 = _320 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    if (!_384)
    {
        _392 = _366;
    }
    float _418 = _392;
    float _420 = _418;
    if (_384)
    {
        float _422 = _414 * 0.15915493667125701904296875;
        _394 = _422;
    }
    float _424 = _394;
    float _426 = fma(_330, (*spvDescriptorSet0.vp_c10)._m0[5].x, _416);
    float _428 = _318 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _430 = fma(_338, (*spvDescriptorSet0.vp_c10)._m0[5].z, _426);
    float _432 = _424;
    if (_384)
    {
        float _434 = _424 * 6.283185482025146484375;
        float _436 = sin(_434);
        _432 = _436;
    }
    float _438 = _432;
    float _440 = fma(_326, (*spvDescriptorSet0.vp_c10)._m0[9].x, _428);
    float _442 = _430 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _444 = fma(_346, (*spvDescriptorSet0.vp_c10)._m0[9].z, _440);
    float _446 = _430;
    if (_384)
    {
        float _448 = rsqrt(_380);
        _446 = _448;
    }
    float _450 = _446;
    float _452 = _442 + _444;
    float _454 = _452;
    if (_384)
    {
        float _456 = _452 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _454 = _456;
    }
    float _458 = _454;
    float _460 = _458;
    if (_384)
    {
        float _462 = fma(_438, _458, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _460 = _462;
    }
    float _464 = _460;
    float _466 = _450;
    if (_384)
    {
        float _468 = _450 * _464;
        _466 = _468;
    }
    float _470 = _466;
    if (_384)
    {
        float _472 = fma(_370, _470, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _396 = _472;
    }
    float _474 = _396;
    if (_384)
    {
        float _476 = fma(_374, _470, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _420 = _476;
    }
    float _478 = _420;
    float _480 = fma(_474, 6.2500002968590706586837768554688e-05, 0.5);
    float _482 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _484 = _474 + _482;
    float _486 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _488 = _478 + _486;
    float _490 = fma(_478, 6.2500002968590706586837768554688e-05, 0.5);
    float _492 = fma(_484, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _494 = fma(_488, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _3073 = float2(_480, _490);
    float _496 = dm_bs(spvDescriptorSet0.vp_t_tcb_2C.sample(spvDescriptorSet0.vp_t_tcb_2CSmplr, select(_3073, float2(0.0), isnan(_3073)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_2C, spvDescriptorSet0.vp_t_tcb_2CSmplr_w, select(_3073, float2(0.0), isnan(_3073)), level(0.0)).y;
    float2 _3083 = float2(_492, _494);
    float _498 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_3083, float2(0.0), isnan(_3083)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_3083, float2(0.0), isnan(_3083)), level(0.0)).x;
    float _500 = in.m_73.y;
    float _502 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _504 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _506 = _504 != 0;
    float _508 = in.m_75.w;
    int _510 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _512 = _510 != 0;
    int _514 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _516 = _514 != 0;
    float _518 = in.m_73.x;
    float _520 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _522 = _318;
    float _524 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    float _526 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    float _528 = _520;
    if (!_506)
    {
        float _530 = in.m_75.z;
        _522 = _530;
    }
    float _532 = _522;
    float _534 = _502 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _536 = _374;
    if (_512)
    {
        float _538 = in.m_75.z;
        _536 = _538;
    }
    float _540 = _536;
    if (!_506)
    {
        float _542 = in.m_75.y;
        _524 = _542;
    }
    float _544 = _524;
    float _546 = -_500;
    float _548 = _546 + 1.0;
    bool _550 = _508 > 0.5;
    float _552 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _554 = _500;
    if (_516)
    {
        float _556 = _550 ? _548 : _500;
        _554 = _556;
    }
    float _558 = _554;
    bool _560 = _208 != 0.0;
    bool _562 = isnan(_208);
    bool _564 = _560 || _562;
    bool _566 = isnan(0.0);
    bool _568 = _564 || _566;
    float _570 = _518;
    if (_512)
    {
        _398 = _518;
    }
    float _572 = _398;
    float _574 = fma(_534, _558, -0.5);
    float _576 = _572;
    float _578 = _532;
    if (!_506)
    {
        _526 = _532;
    }
    float _580 = _526;
    float _582 = in.m_77.x;
    float _584 = in.m_77.y;
    float _586 = in.m_77.z;
    bool _588 = _206 == 0.0;
    bool _590 = !_568;
    bool _592 = _588 && _590;
    float _594 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _596 = _540 > 0.5;
    bool _598 = _596 && _512;
    float _600 = _544;
    float _602 = _580;
    if (_506)
    {
        float _604 = in.m_75.x;
        float _606 = in.m_75.y;
        _600 = _604;
        _602 = _606;
    }
    float _608 = _600;
    float _610 = _602;
    float _612 = _552 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _614 = _210 == 0.0;
    bool _616 = _614 && _592;
    float _618 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    if (_598)
    {
        float _620 = -_572;
        float _622 = _620 + 1.0;
        _576 = _622;
    }
    float _624 = _576;
    if (_512)
    {
        _570 = _624;
    }
    float _626 = _570;
    float _628 = 0.0;
    if (_616)
    {
        _628 = _582;
    }
    float _630 = _628;
    float _632 = fma(_612, _626, -0.5);
    float _634 = 0.0;
    float _636 = _630;
    if (_616)
    {
        _634 = _584;
    }
    float _638 = _634;
    float _640 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _642 = fma(_608, (*spvDescriptorSet0.vp_c9)._m0[83].z, _594);
    float _644 = _608 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _646 = _638;
    if (_506)
    {
        _578 = _610;
    }
    float _648 = _578;
    float _650 = _610 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _652 = 0.0;
    float _654 = _650;
    if (_616)
    {
        _652 = _630;
    }
    float _656 = _652;
    float _658 = -_618;
    float _660 = fma(_644, 2.0, _658);
    float _662 = _656;
    if (!_616)
    {
        _636 = _582;
    }
    float _664 = _636;
    float _666 = in.m_79.x;
    float _668 = in.m_79.y;
    float _670 = in.m_79.z;
    float _672 = in.m_79.w;
    float _674 = fma(_650, -2.0, _640);
    float _676 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[83].w, _520);
    float _678 = 0.0;
    if (_616)
    {
        _678 = _586;
    }
    float _680 = _678;
    float _682 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[82].z, _642);
    float _684 = _680;
    if (_616)
    {
        _654 = _638;
    }
    float _686 = _654;
    float _688 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[81].y, _674);
    float _690 = -_160;
    float _692 = fma(_690, (*spvDescriptorSet0.vp_c9)._m0[81].x, _660);
    float _694 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[82].w, _676);
    float _696 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _698 = _686;
    if (!_616)
    {
        _646 = _584;
    }
    float _700 = _646;
    float _702 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    if (_616)
    {
        _528 = _680;
    }
    float _704 = _528;
    float _706 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _708 = _704;
    if (!_616)
    {
        float _710 = fma(_208, (*spvDescriptorSet0.vp_c9)._m0[17].y, _700);
        _698 = _710;
    }
    float _712 = _698;
    if (!_616)
    {
        _684 = _586;
    }
    float _714 = _684;
    float _716 = _696 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _718 = _702 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _720 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _722 = _706 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _724 = _668 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _726 = _668 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _728 = _668 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    if (!_616)
    {
        float _730 = fma(_210, (*spvDescriptorSet0.vp_c9)._m0[17].y, _714);
        _708 = _730;
    }
    float _732 = _708;
    float _734 = fma(_666, (*spvDescriptorSet0.vp_c10)._m0[10].x, _724);
    float _736 = fma(_666, (*spvDescriptorSet0.vp_c10)._m0[8].x, _726);
    float _738 = fma(_666, (*spvDescriptorSet0.vp_c10)._m0[9].x, _728);
    if (!_616)
    {
        float _740 = fma(_206, (*spvDescriptorSet0.vp_c9)._m0[17].y, _664);
        _662 = _740;
    }
    float _742 = _662;
    float _744 = fma(_670, (*spvDescriptorSet0.vp_c10)._m0[10].z, _734);
    float _746 = _670 * _664;
    float _748 = fma(_670, (*spvDescriptorSet0.vp_c10)._m0[8].z, _736);
    float _750 = fma(_670, (*spvDescriptorSet0.vp_c10)._m0[9].z, _738);
    float _752 = _712 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _754 = _668 * _714;
    float _756 = -_746;
    float _758 = fma(_666, _714, _756);
    out.m_81.x = _716;
    out.m_81.y = _718;
    out.m_81.z = _722;
    out.m_81.w = _720;
    float _760 = _666 * _700;
    float _762 = -_754;
    float _764 = fma(_670, _700, _762);
    float _766 = fma(_682, _632, _692);
    out.m_83.x = _748;
    out.m_83.y = _750;
    out.m_83.z = _744;
    float _768 = -_760;
    float _770 = fma(_668, _664, _768);
    float _772 = _764 * _672;
    float _774 = -_688;
    float _776 = fma(_694, _574, _774);
    float _778 = _712 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _780 = _770 * _672;
    float _782 = _712 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _784 = _776 + 0.5;
    float _786 = fma(_742, (*spvDescriptorSet0.vp_c10)._m0[9].x, _778);
    float _788 = fma(_742, (*spvDescriptorSet0.vp_c10)._m0[8].x, _752);
    float _790 = _758 * _672;
    float _792 = _766 + 0.5;
    float _794 = fma(_742, (*spvDescriptorSet0.vp_c10)._m0[10].x, _782);
    float _796 = _790 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _798 = _790 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _800 = _790 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _802 = _790;
    float _804 = _780;
    if (_384)
    {
        float _806 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _808 = _474 + _806;
        _802 = _808;
    }
    float _810 = _802;
    float _812 = fma(_772, (*spvDescriptorSet0.vp_c10)._m0[8].x, _796);
    float _814 = fma(_772, (*spvDescriptorSet0.vp_c10)._m0[9].x, _798);
    float _816 = fma(_772, (*spvDescriptorSet0.vp_c10)._m0[10].x, _800);
    float _818 = fma(_780, (*spvDescriptorSet0.vp_c10)._m0[8].z, _812);
    float _820 = fma(_780, (*spvDescriptorSet0.vp_c10)._m0[9].z, _814);
    float _822 = fma(_780, (*spvDescriptorSet0.vp_c10)._m0[10].z, _816);
    float _824 = _822;
    if (_384)
    {
        float _826 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _828 = _478 + _826;
        _804 = _828;
    }
    float _830 = _804;
    float _832 = in.m_85.y;
    if (_384)
    {
        float _834 = _810 * _810;
        _400 = _834;
    }
    float _836 = _400;
    float _838 = fma(_732, (*spvDescriptorSet0.vp_c10)._m0[10].z, _794);
    if (_384)
    {
        float _840 = _830 * _830;
        _402 = _840;
    }
    float _842 = _402;
    out.m_87.x = _818;
    out.m_87.y = _820;
    out.m_87.z = _822;
    float _844 = in.m_85.x;
    float _846 = in.m_85.z;
    out.m_89.z = _792;
    out.m_89.w = _784;
    out.m_91.y = _832;
    float _848 = fma(_732, (*spvDescriptorSet0.vp_c10)._m0[8].z, _788);
    float _850 = fma(_732, (*spvDescriptorSet0.vp_c10)._m0[9].z, _786);
    out.m_91.x = _844;
    out.m_91.z = _846;
    out.m_93.x = _848;
    out.m_93.y = _850;
    out.m_93.z = _838;
    float _852 = fma(_496, 2000.0, (*spvDescriptorSet0.vp_c13)._m0[0].x);
    float _854 = in.m_85.w;
    float _856 = fma(_498, 100.0, _852);
    float _858 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _860 = _856 + _858;
    float _862 = fma(_860, _860, _836);
    float _864 = _862 + _842;
    float _866 = sqrt(_864);
    out.m_91.w = _854;
    bool _868 = _866 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _870 = isnan(_866);
    bool _872 = _868 || _870;
    bool _874 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _876 = _872 || _874;
    float _878 = _864;
    if (!_876)
    {
        _824 = 1.0;
    }
    float _880 = _824;
    bool _882 = !_876;
    float _884 = _880;
    if (!_882)
    {
        bool _886 = _866 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _888 = isnan(_866);
        bool _890 = _886 || _888;
        bool _892 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _894 = _890 || _892;
        if (!_894)
        {
            float _896 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _898 = _866 + _896;
            float _900 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _902 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _900;
            float _904 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _906 = _904 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _908 = 1.0 / _902;
            float _910 = _898 * _908;
            float _912 = fma(_910, _906, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _884 = _912;
            _914 = true;
        }
        else
        {
            bool _916 = _866 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _918 = isnan(_866);
            bool _920 = _916 || _918;
            bool _922 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _924 = _920 || _922;
            if (!_924)
            {
                float _926 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _928 = _866 + _926;
                float _930 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _932 = _930 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _934 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _936 = _934 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _938 = 1.0 / _932;
                float _940 = _928 * _938;
                float _942 = fma(_940, _936, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _884 = _942;
                _914 = true;
            }
            else
            {
                _884 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _914 = false;
    float _944 = _884;
    float _946 = _442 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _948 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _950 = _856 + _948;
    float _952 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _954 = _474 + _952;
    float _956 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _958 = _478 + _956;
    float _960 = fma(_360, (*spvDescriptorSet0.vp_c8)._m0[11].x, _946);
    float _962 = fma(_950, _944, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _964 = fma(_954, _944, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _966 = fma(_958, _944, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _968 = fma(_362, (*spvDescriptorSet0.vp_c8)._m0[11].z, _960);
    float _970 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _972 = _962 + _970;
    float _974 = _442 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _976 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _978 = _964 + _976;
    float _980 = _968 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _982 = _972 * _972;
    float _984 = fma(_360, (*spvDescriptorSet0.vp_c8)._m0[10].x, _974);
    float _986 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _988 = _966 + _986;
    float _990 = 1.0 / _980;
    float _992 = fma(_978, _978, _982);
    float _994 = fma(_362, (*spvDescriptorSet0.vp_c8)._m0[10].z, _984);
    float _996 = _962 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _998 = fma(_988, _988, _992);
    float _1000 = _994 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1002 = fma(_964, (*spvDescriptorSet0.vp_c8)._m0[3].x, _996);
    float _1004 = rsqrt(_998);
    float _1006 = _1000 + _980;
    float _1008 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1010 = _1006 * _990;
    float _1012 = _1010 * 0.5;
    float _1014 = _442 + _1008;
    float _1016 = sqrt(_998);
    float _1018 = fma(_362, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1020 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1022 = fma(_1012, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1020);
    float _1024 = _1004 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1026 = 1.0 / _1022;
    float _1028 = _1014 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1030 = _978 * _1024;
    float _1032 = _988 * _1024;
    float _1034 = fma(_360, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1028);
    float _1036 = _1030 * _1030;
    float _1038 = _1032 * _1032;
    float _1040 = fma(_362, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1034);
    float _1042 = floor(_1018);
    float _1044 = _1036 + _1038;
    float _1046 = _1040 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1048 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1050 = _1026 * _1048;
    float _1052 = _1014 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1054 = sqrt(_1044);
    bool _1056 = _1050 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1058 = fma(_360, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1052);
    bool _1060 = _1050 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1062 = fma(_362, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1058);
    float _1064 = trunc(_1046);
    int _1066 = int(_1064);
    float _1068 = -_1042;
    float _1070 = _1018 + _1068;
    float _1072 = _1062 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    bool _1074 = !_1056;
    int _1076 = _1074 ? 0 : 1;
    bool _1078 = _1054 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1080 = trunc(_1072);
    int _1082 = int(_1080);
    int _1084 = 2;
    float _1086 = _1030;
    float _1088 = _1036;
    float _1090 = _1032;
    float _1092 = _1002;
    if (!_1056)
    {
        _1084 = 1;
    }
    int _1094 = _1084;
    float _1096 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1098 = _1054 + _1096;
    int _1100 = _1094;
    float _1102 = _1098;
    if (!_1060)
    {
        _1100 = _1076;
    }
    int _1104 = _1100;
    int _1106 = _1104 << 6;
    int _1108 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1110 = _1066 + _1108;
    int _1112 = _1110 + 1;
    int _1114 = _1106 + 96;
    uint _1117 = uint(int(uint(_1114) >> uint(2)));
    uint _1119 = uint(int(uint(int(_1117)) >> uint(2)));
    int _1121 = int(_1117) & 3;
    float _1123 = (*spvDescriptorSet0.vp_c15)._m0[int(_1119)][_1121];
    int _1125 = int(_1117) + 1;
    uint _1127 = uint(int(uint(_1125) >> uint(2)));
    int _1129 = _1125 & 3;
    float _1131 = (*spvDescriptorSet0.vp_c15)._m0[int(_1127)][_1129];
    float _1133 = _856;
    float _1135 = as_type<float>(_1104);
    if (_1078)
    {
        float _1137 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1133 = _1137;
    }
    float _1139 = _1133;
    float _1141 = 0.0;
    if (!_1078)
    {
        _1141 = _1038;
    }
    float _1143 = _1141;
    int _1145 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1147 = _1082 + _1145;
    int _1149 = _1147 + 1;
    float _1151 = _962 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    int _1153 = _1106 + 104;
    uint _1155 = uint(int(uint(_1153) >> uint(2)));
    uint _1157 = uint(int(uint(int(_1155)) >> uint(2)));
    int _1159 = int(_1155) & 3;
    float _1161 = (*spvDescriptorSet0.vp_c15)._m0[int(_1157)][_1159];
    int _1163 = int(_1155) + 1;
    uint _1165 = uint(int(uint(_1163) >> uint(2)));
    int _1167 = _1163 & 3;
    float _1169 = (*spvDescriptorSet0.vp_c15)._m0[int(_1165)][_1167];
    bool _1171 = _1149 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1173 = fma(_964, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1151);
    int _1175 = _1149 | _1112;
    float _1177 = fma(_966, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1173);
    bool _1179 = _1175 < 0;
    bool _1181 = _1179 || _1171;
    float _1183 = _1177;
    int _1185 = _1149;
    float _1187 = _1143;
    if (_1078)
    {
        float _1189 = _1098 * _1139;
        _1102 = _1189;
    }
    float _1191 = _1102;
    float _1193 = _1177 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _1195 = _1112 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1197 = _1195 || _1181;
    if (_1078)
    {
        float _1199 = rsqrt(_1044);
        _1183 = _1199;
    }
    float _1201 = _1183;
    float _1203 = _1201;
    if (_1078)
    {
        float _1205 = _1191 * 0.15915493667125701904296875;
        _878 = _1205;
    }
    float _1207 = _878;
    float _1209 = _1193 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1211 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1213 = _852;
    if (_1078)
    {
        float _1215 = _1207 * 6.283185482025146484375;
        float _1217 = sin(_1215);
        _1213 = _1217;
    }
    float _1219 = _1213;
    float _1221 = precise::max(0.0, _1211);
    float _1223 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1225 = _1223;
    if (!_1197)
    {
        int _1227 = _1112 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1229 = _1227 + _1149;
        _1185 = _1229;
    }
    int _1231 = _1185;
    float _1233 = _1139;
    if (_1078)
    {
        float _1235 = _1207 * 6.283185482025146484375;
        float _1237 = cos(_1235);
        _1233 = _1237;
    }
    float _1239 = _1233;
    float _1241 = -_1024;
    float _1243 = -_1221;
    float _1245 = fma(_972, _1241, _1243);
    float _1247 = -_1209;
    float _1249 = fma(_1247, _1223, 1.0);
    int _1251 = 0;
    float _1253 = _1245;
    if (!_1197)
    {
        int _1255 = _1231 << 2;
        _1251 = _1255;
    }
    int _1257 = _1251;
    int _1259 = _1257;
    if (_1078)
    {
        float _1261 = _1245 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1225 = _1261;
    }
    float _1263 = _1225;
    int _1265 = 0;
    float _1267 = _1263;
    if (!_1197)
    {
        uint _1269 = uint(int(uint(_1231) >> uint(2)));
        _1265 = int(_1269);
    }
    int _1271 = _1265;
    if (!_1197)
    {
        int _1273 = 12 & _1257;
        _1259 = _1273;
    }
    int _1275 = _1259;
    if (_1078)
    {
        float _1277 = fma(_1219, _1263, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1267 = _1277;
    }
    float _1279 = _1267;
    int _1281 = _1106 + 56;
    uint _1283 = uint(int(uint(_1281) >> uint(2)));
    uint _1285 = uint(int(uint(int(_1283)) >> uint(2)));
    int _1287 = int(_1283) & 3;
    float _1289 = (*spvDescriptorSet0.vp_c15)._m0[int(_1285)][_1287];
    int _1291 = int(_1283) + 1;
    uint _1293 = uint(int(uint(_1291) >> uint(2)));
    int _1295 = _1291 & 3;
    float _1297 = (*spvDescriptorSet0.vp_c15)._m0[int(_1293)][_1295];
    float _1299 = log2(_1249);
    float _1301 = _1014 * _1131;
    float _1303 = _1131;
    if (_1078)
    {
        float _1305 = _1201 * _1279;
        _1203 = _1305;
    }
    float _1307 = _1203;
    if (_1078)
    {
        float _1309 = _1239 + (-1.0);
        _1303 = _1309;
    }
    float _1311 = _1303;
    float _1313 = fma(_360, _1123, _1301);
    int _1315 = _1106 + 48;
    uint _1317 = uint(int(uint(_1315) >> uint(2)));
    uint _1319 = uint(int(uint(int(_1317)) >> uint(2)));
    int _1321 = int(_1317) & 3;
    float _1323 = (*spvDescriptorSet0.vp_c15)._m0[int(_1319)][_1321];
    int _1325 = int(_1317) + 1;
    uint _1327 = uint(int(uint(_1325) >> uint(2)));
    int _1329 = _1325 & 3;
    float _1331 = (*spvDescriptorSet0.vp_c15)._m0[int(_1327)][_1329];
    float _1333 = _1311;
    if (_1078)
    {
        float _1335 = _1030 * _1307;
        _1086 = _1335;
    }
    float _1337 = _1086;
    if (_1078)
    {
        float _1339 = _1311 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1333 = _1339;
    }
    float _1341 = _1333;
    float _1343 = fma(_362, _1161, _1313);
    if (_1078)
    {
        float _1345 = _1337 * _1337;
        _1088 = _1345;
    }
    float _1347 = _1088;
    if (_1078)
    {
        float _1349 = fma(_1245, _1239, _1341);
        _1253 = _1349;
    }
    float _1351 = _1253;
    if (_1078)
    {
        float _1353 = _1032 * _1307;
        _1090 = _1353;
    }
    float _1355 = _1090;
    int _1357 = _1106 + 64;
    uint _1359 = uint(int(uint(_1357) >> uint(2)));
    uint _1361 = uint(int(uint(int(_1359)) >> uint(2)));
    int _1363 = int(_1359) & 3;
    float _1365 = (*spvDescriptorSet0.vp_c15)._m0[int(_1361)][_1363];
    int _1367 = int(_1359) + 1;
    uint _1369 = uint(int(uint(_1367) >> uint(2)));
    int _1371 = _1367 & 3;
    float _1373 = (*spvDescriptorSet0.vp_c15)._m0[int(_1369)][_1371];
    float _1375 = fma(_360, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1377 = fma(_1351, _1351, _1347);
    float _1379 = _962 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1381 = _962 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    if (_1078)
    {
        float _1383 = _1355 * _1355;
        _1187 = _1383;
    }
    float _1385 = _1187;
    float _1387 = fma(_964, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1379);
    int _1389 = _1106 + 72;
    uint _1391 = uint(int(uint(_1389) >> uint(2)));
    uint _1393 = uint(int(uint(int(_1391)) >> uint(2)));
    int _1395 = int(_1391) & 3;
    float _1397 = (*spvDescriptorSet0.vp_c15)._m0[int(_1393)][_1395];
    int _1399 = int(_1391) + 1;
    uint _1401 = uint(int(uint(_1399) >> uint(2)));
    int _1403 = _1399 & 3;
    float _1405 = (*spvDescriptorSet0.vp_c15)._m0[int(_1401)][_1403];
    float _1407 = fma(_964, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1381);
    float _1409 = _1377 + _1385;
    float _1411 = fma(_966, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1387);
    float _1413 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1415 = fma(_1016, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1413);
    float _1417 = precise::clamp(_1415, 0.0, 1.0);
    float _1419 = fma(_966, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1407);
    float _1421 = fma(_966, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1002);
    float _1423 = _1411 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    int _1425 = _1106 + 80;
    uint _1427 = uint(int(uint(_1425) >> uint(2)));
    uint _1429 = uint(int(uint(int(_1427)) >> uint(2)));
    int _1431 = int(_1427) & 3;
    float _1433 = (*spvDescriptorSet0.vp_c15)._m0[int(_1429)][_1431];
    int _1435 = int(_1427) + 1;
    uint _1437 = uint(int(uint(_1435) >> uint(2)));
    int _1439 = _1435 & 3;
    float _1441 = (*spvDescriptorSet0.vp_c15)._m0[int(_1437)][_1439];
    float _1443 = -_1417;
    float _1445 = _1443 + 1.0;
    float _1447 = _1419 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1449 = _1423 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1451 = _1343 + _1169;
    if (!_1197)
    {
        int _1453 = _1271 << 4;
        int _1455 = _1453 + _1275;
        _1092 = as_type<float>(_1455);
    }
    float _1457 = _1092;
    float _1459 = _1421 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1461 = fma(_1447, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1449);
    int _1463 = _1106 + 88;
    uint _1465 = uint(int(uint(_1463) >> uint(2)));
    uint _1467 = uint(int(uint(int(_1465)) >> uint(2)));
    int _1469 = int(_1465) & 3;
    float _1471 = (*spvDescriptorSet0.vp_c15)._m0[int(_1467)][_1469];
    int _1473 = int(_1465) + 1;
    uint _1475 = uint(int(uint(_1473) >> uint(2)));
    int _1477 = _1473 & 3;
    float _1479 = (*spvDescriptorSet0.vp_c15)._m0[int(_1475)][_1477];
    float _1481 = rsqrt(_1409);
    float _1483 = _1299 * 0.693147182464599609375;
    float _1485 = fma(_1193, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1461);
    float _1487 = fma(_1459, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1485);
    float _1489 = _1457;
    if (!_1197)
    {
        int _1491 = as_type<int>(_1457) + 400;
        uint _1493 = uint(int(uint(_1491) >> uint(2)));
        uint _1495 = uint(int(uint(int(_1493)) >> uint(2)));
        int _1497 = int(_1493) & 3;
        float _1499 = (*spvDescriptorSet0.vp_c15)._m0[int(_1495)][_1497];
        _1489 = _1499;
    }
    float _1501 = _1489;
    float _1503 = 1.0 / _1451;
    float _1505 = _1014 * _1331;
    float _1507 = _1481 * _1337;
    float _1509 = abs(_1445);
    float _1511 = log2(_1509);
    float _1513 = _1481 * _1351;
    float _1515 = fma(_360, _1323, _1505);
    float _1517 = _1507 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1519 = _1481 * _1355;
    float _1521 = _1014 * _1373;
    float _1523 = fma(_362, _1289, _1515);
    float _1525 = 1.0 / _1487;
    float _1527 = fma(_360, _1365, _1521);
    float _1529 = _1523 + _1297;
    float _1531 = -_1517;
    float _1533 = fma(_1513, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1531);
    float _1535 = fma(_362, _1397, _1527);
    float _1537 = _1529 * _1503;
    float _1539 = _1297;
    float _1541 = _1507;
    if (!_1197)
    {
        float _1543 = floor(_1046);
        _1539 = _1543;
    }
    float _1545 = _1539;
    float _1547 = -_1519;
    float _1549 = fma(_1547, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1533);
    float _1551 = _1535 + _1405;
    float _1553 = _1511 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    bool _1555 = _1537 >= 0.0;
    float _1557 = fma(_1549, -0.5, 0.5);
    float _1559 = _1551 * _1503;
    float _1561 = _1014 * _1441;
    bool _1563 = _1537 <= 1.0;
    bool _1565 = _1563 && _1555;
    float _1567 = fma(_1549, 0.5, 0.5);
    float _1569 = fma(_360, _1433, _1561);
    bool _1571 = _1559 >= 0.0;
    bool _1573 = _1571 && _1565;
    float _1575 = exp2(_1553);
    float _1577 = _1423 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1579 = fma(_362, _1471, _1569);
    bool _1581 = _1559 <= 1.0;
    bool _1583 = _1581 && _1573;
    float _1585 = fma(_1567, -0.0187292993068695068359375, 0.07426099479198455810546875);
    if (!_1197)
    {
        float _1587 = -_1545;
        float _1589 = _1046 + _1587;
        _1541 = _1589;
    }
    float _1591 = _1541;
    float _1593 = _1579 + _1479;
    float _1595 = fma(_1447, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1577);
    float _1597 = fma(_1567, _1585, -0.212114393711090087890625);
    float _1599 = sqrt(_1557);
    float _1601 = _1423 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1603 = _1513 + 1.0;
    float _1605 = fma(_1567, _1597, 1.570728778839111328125);
    float _1607 = fma(_1193, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1595);
    float _1609 = fma(_1447, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1601);
    float _1611 = _1593 * _1503;
    float _1613 = _1605;
    if (_1583)
    {
        float _1615 = float(_1104);
        _1135 = _1615;
    }
    float _1617 = _1135;
    float _1619 = floor(_1375);
    float _1621 = fma(_1193, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1609);
    float _1623 = -_1513;
    float _1625 = fma(_1575, _1603, _1623);
    float _1627 = fma(_1459, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1607);
    float _1629 = fma(_1459, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1621);
    float _1631 = _1627 * _1525;
    float _1633 = _1519;
    float _1635 = _1629;
    if (!_1197)
    {
        float _1637 = floor(_1072);
        _1633 = _1637;
    }
    float _1639 = _1633;
    float _1641 = _1599 * 0.636619746685028076171875;
    float _1643 = _1629 * _1525;
    float _1645 = fma(_1631, 0.5, 0.5);
    float _1647 = -_1605;
    float _1649 = fma(_1641, _1647, 1.0);
    float _1651 = _1471;
    if (!_1197)
    {
        float _1653 = rint(_1501);
        float _1655 = precise::max(_1653, 0.0);
        uint _1657 = uint(_1655);
        uint _1659 = clamp(_1657, 0u, 65535u);
        _1651 = as_type<float>(_1659);
    }
    float _1661 = _1651;
    float _1663 = -_1619;
    float _1665 = _1375 + _1663;
    float _1667 = fma(_1643, -0.5, 0.5);
    float _1669 = fma(_1625, 0.5, 0.5);
    float _1671 = _1609;
    if (_1583)
    {
        float _1673 = rint(_1617);
        float _1675 = precise::max(_1673, 0.0);
        uint _1677 = uint(_1675);
        uint _1679 = clamp(_1677, 0u, 65535u);
        _1671 = as_type<float>(_1679);
    }
    float _1681 = _1671;
    if (!_1197)
    {
        float _1683 = -_1639;
        float _1685 = _1072 + _1683;
        _1613 = _1685;
    }
    float _1687 = _1613;
    float _1689 = _1483 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float2 _5124 = float2(_1665, _1070);
    float _1691 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5124, float2(0.0), isnan(_5124)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5124, float2(0.0), isnan(_5124)), level(0.0)).x;
    float _1693 = _1483;
    if (!_1197)
    {
        float3 _5139 = float3(_1687, _1591, float(as_type<int>(_1661)));
        float3 _5143 = select(_5139, float3(0.0), isnan(_5139));
        float _1695 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5143.xy, uint(rint(_5143.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5143.xy, uint(rint(_5143.z)), level(0.0)).x;
        _1693 = _1695;
    }
    float _1697 = _1693;
    float _1699 = _1559;
    if (_1583)
    {
        float3 _5158 = float3(_1537, _1559, float(as_type<int>(_1681)));
        float3 _5160 = select(_5158, float3(0.0), isnan(_5158));
        float _1701 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5160.xy, uint(rint(_5160.z)), _1611, level(0.0));
        _1699 = _1701;
    }
    float _1703 = _1699;
    float3 _5170 = float3(_1645, _1667, _1689);
    float _1705 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5170, float3(0.0), isnan(_5170)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5170, float3(0.0), isnan(_5170)), level(0.0)).x;
    float3 _5179 = float3(_1645, _1667, _1689);
    float4 _1708 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5179, float3(0.0), isnan(_5179)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5179, float3(0.0), isnan(_5179)), level(0.0)).xyzw;
    float _1710 = _1708.x;
    float _1712 = _1708.y;
    float _1714 = _1708.z;
    float _1716 = _1708.w;
    float2 _5195 = float2(_1649, _1669);
    float3 _1720 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5195, float2(0.0), isnan(_5195)), level(0.0)), spvDescriptorSet0.dm_border, 6u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5195, float2(0.0), isnan(_5195)), level(0.0)).xyz;
    float _1722 = _1720.x;
    float _1724 = _1720.y;
    float _1726 = _1720.z;
    float _1728 = abs(_1050);
    float _1730 = log2(_1728);
    float _1732 = _1423 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1734 = _1511 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1736 = fma(_1447, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1732);
    float _1738 = fma(_1193, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1736);
    float _1740 = _1627 + _1487;
    float _1742 = fma(_1459, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1738);
    float _1744 = _1487 * 0.5;
    float _1746 = _1730 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1748 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _1750 = _1742 + _1748;
    float _1752 = fma(_1629, -0.5, _1744);
    float _1754 = _1740 * 0.5;
    float _1756 = _1487 + _1750;
    float _1758 = exp2(_1746);
    out.gl_Position.x = _1627;
    out.gl_Position.y = _1629;
    out.gl_Position.z = _1750;
    out.gl_Position.w = _1487;
    float _1760 = _1756 * 0.5;
    out.m_95.x = _1754;
    out.m_95.y = _1752;
    out.m_95.z = _1760;
    out.m_95.w = _1487;
    bool _1762 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1764 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1766 = _1762 || _1764;
    bool _1768 = isnan(0.5);
    bool _1770 = _1766 || _1768;
    out.m_97.z = _1760;
    out.m_97.w = _1487;
    float _1772 = fma(_1758, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1774 = precise::clamp(_1772, 0.0, 1.0);
    float _1776 = exp2(_1734);
    bool _1778 = _1050 <= 8000.0;
    bool _1780 = isnan(_1050);
    bool _1782 = _1778 || _1780;
    bool _1784 = isnan(8000.0);
    bool _1786 = _1782 || _1784;
    float _1788 = float(_1786);
    float _1790 = fma(_1774, -2.0, 3.0);
    float _1792 = _1774 * _1774;
    if (_1770)
    {
        _1635 = 1.0;
    }
    float _1794 = _1635;
    float _1796 = _1792 * _1790;
    float _1798 = -_1796;
    float _1800 = _1798 + 1.0;
    float _1802 = fma(_1800, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1796);
    float _1804 = _1788 * _1802;
    float _1806 = _1802;
    float _1808 = _1794;
    float _1810 = _1804;
    if (_1770)
    {
        _1806 = 1.0;
    }
    float _1812 = _1806;
    float _1814 = _1812;
    float _1816 = _1703;
    if (!_1770)
    {
        float _1818 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1820 = _1818 * 0.15915493667125701904296875;
        float _1822 = _1820 * 6.283185482025146484375;
        float _1824 = cos(_1822);
        float _1826 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1828 = _1826 * 0.15915493667125701904296875;
        float _1830 = _1820 * 6.283185482025146484375;
        float _1832 = sin(_1830);
        float _1834 = 1.0 / _1824;
        float _1836 = _1828 * 6.283185482025146484375;
        float _1838 = cos(_1836);
        float _1840 = _1832 * _1834;
        float _1842 = _1828 * 6.283185482025146484375;
        float _1844 = sin(_1842);
        float _1846 = _1838 * _1840;
        float _1848 = 1.0 / _1846;
        float _1850 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1852 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1850;
        float _1854 = 1.0 / _1852;
        float _1856 = _1844 * _1848;
        float _1858 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1860 = fma(_1050, _1856, _1858);
        float _1862 = _1860 * _1854;
        float _1864 = precise::clamp(_1862, 0.0, 1.0);
        _1808 = _1864;
    }
    float _1866 = _1808;
    if (!_1770)
    {
        float _1868 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1870 = _1868 * 0.15915493667125701904296875;
        float _1872 = _1870 * 6.283185482025146484375;
        float _1874 = cos(_1872);
        float _1876 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1878 = _1876 * 0.15915493667125701904296875;
        float _1880 = _1870 * 6.283185482025146484375;
        float _1882 = sin(_1880);
        float _1884 = 1.0 / _1874;
        float _1886 = _1878 * 6.283185482025146484375;
        float _1888 = cos(_1886);
        float _1890 = _1882 * _1884;
        float _1892 = _1878 * 6.283185482025146484375;
        float _1894 = sin(_1892);
        float _1896 = _1888 * _1890;
        float _1898 = 1.0 / _1896;
        float _1900 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1902 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1900;
        float _1904 = 1.0 / _1902;
        float _1906 = _1894 * _1898;
        float _1908 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1910 = fma(_1050, _1906, _1908);
        float _1912 = _1910 * _1904;
        float _1914 = precise::clamp(_1912, 0.0, 1.0);
        float _1916 = -_1914;
        float _1918 = _1916 + 1.0;
        _1814 = _1918;
    }
    float _1920 = _1814;
    float _1922 = -_1776;
    float _1924 = _1922 + 1.0;
    float _1926 = _1804 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1928 = -_1691;
    float _1930 = _1928 + 1.0;
    float _1932 = _1924;
    if (!_1583)
    {
        _1810 = 1.0;
    }
    float _1934 = _1810;
    float _1936 = _1934;
    if (_1583)
    {
        bool _1938 = _1703 >= _1611;
        bool _1940 = isnan(_1703);
        bool _1942 = _1938 || _1940;
        bool _1944 = isnan(_1611);
        bool _1946 = _1942 || _1944;
        float _1948 = float(_1946);
        _1936 = _1948;
    }
    float _1950 = _1936;
    float _1952 = _1924 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1954 = _1930 * _1926;
    float _1956 = precise::clamp(_1954, 0.0, 1.0);
    float _1958 = _1950;
    if (_1197)
    {
        _1932 = 1.0;
    }
    float _1960 = _1932;
    float _1962 = _1960;
    if (!_1197)
    {
        int _1964 = _1231 << 4;
        int _1966 = _1964 + 2048;
        uint _1968 = uint(int(uint(_1966) >> uint(2)));
        uint _1970 = uint(int(uint(int(_1968)) >> uint(2)));
        int _1972 = int(_1968) & 3;
        float _1974 = (*spvDescriptorSet0.vp_c15)._m0[int(_1970)][_1972];
        int _1976 = int(_1968) + 1;
        uint _1978 = uint(int(uint(_1976) >> uint(2)));
        int _1980 = _1976 & 3;
        float _1982 = (*spvDescriptorSet0.vp_c15)._m0[int(_1978)][_1980];
        int _1984 = _1966 + 8;
        uint _1986 = uint(int(uint(_1984) >> uint(2)));
        uint _1988 = uint(int(uint(int(_1986)) >> uint(2)));
        int _1990 = int(_1986) & 3;
        float _1992 = (*spvDescriptorSet0.vp_c15)._m0[int(_1988)][_1990];
        int _1994 = int(_1986) + 1;
        uint _1996 = uint(int(uint(_1994) >> uint(2)));
        int _1998 = _1994 & 3;
        float _2000 = (*spvDescriptorSet0.vp_c15)._m0[int(_1996)][_1998];
        float _2002 = _1014 * _1982;
        float _2004 = fma(_360, _1974, _2002);
        float _2006 = fma(_362, _1992, _2004);
        float _2008 = _2006 + _2000;
        float _2010 = precise::clamp(_2008, 0.0, 1.0);
        float _2012 = -_2010;
        float _2014 = _2012 + _1697;
        float _2016 = fma(_2014, 500.0, 1.5);
        float _2018 = exp2(_2016);
        float _2020 = 0.0 + _2018;
        float _2022 = precise::clamp(_2020, 0.0, 1.0);
        _1962 = _2022;
    }
    float _2024 = _1962;
    float _2026 = _1950 * _2024;
    float _2028 = _1952 * _1705;
    float _2030 = -_1956;
    float _2032 = fma(_2030, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2034 = -_1952;
    float _2036 = _2034 + 1.0;
    out.m_99.x = _964;
    out.m_99.y = _962;
    out.m_99.z = _966;
    float _2038 = _1716 * _2028;
    float _2040 = -_2026;
    float _2042 = fma(_2040, _2032, 1.0);
    float _2044 = precise::clamp(_2042, 0.0, 1.0);
    float _2046 = _1726 * _2028;
    float _2048 = _1716 * _2036;
    float _2050 = fma(_1722, _2038, _1710);
    float _2052 = fma(_1724, _2038, _1712);
    float _2054 = _2044 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2056 = fma(_1716, _2046, _1714);
    bool _2058 = _1016 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2060 = isnan(_1016);
    bool _2062 = _2058 || _2060;
    bool _2064 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2066 = _2062 || _2064;
    float _2068 = _1866 * _1920;
    out.m_101.x = _2054;
    float _2070 = _2068 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_103.x = _2050;
    out.m_103.y = _2052;
    out.m_103.z = _2056;
    out.m_103.w = _2048;
    float _2072 = _2036;
    float _2074 = _2044;
    float _2076 = _2038;
    if (!_2066)
    {
        _1816 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2078 = _1816;
    float _2080 = _2078;
    float _2082 = _2078;
    if (!_2066)
    {
        _404 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2084 = _404;
    float _2086 = _2084;
    float _2088 = _2084;
    if (!_2066)
    {
        _2072 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2090 = _2072;
    float _2092 = _2090;
    float _2094 = _2090;
    if (!_2066)
    {
        _1958 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2096 = _1958;
    float _2098 = _2096;
    float _2100 = _2096;
    if (!_2066)
    {
        _2074 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2102 = _2074;
    float _2104 = _2102;
    float _2106 = _2102;
    if (!_2066)
    {
        _2076 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2108 = _2076;
    bool _2110 = !_2066;
    float _2112 = _2108;
    float _2114 = _2108;
    if (!_2110)
    {
        bool _2116 = _1016 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2118 = isnan(_1016);
        bool _2120 = _2116 || _2118;
        bool _2122 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2124 = _2120 || _2122;
        if (!_2124)
        {
            float _2126 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2128 = _1016 + _2126;
            float _2130 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2132 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2130;
            float _2134 = 1.0 / _2132;
            float _2136 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2138 = _2136 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2140 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2142 = _2140 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2144 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2146 = _2144 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2148 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2150 = _2148 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2152 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2154 = _2152 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2156 = _2128 * _2134;
            float _2158 = precise::clamp(_2156, 0.0, 1.0);
            float _2160 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2162 = _2160 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2164 = fma(_2158, _2138, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2166 = fma(_2158, _2162, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2168 = fma(_2158, _2142, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2170 = fma(_2158, _2146, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2172 = fma(_2158, _2150, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2174 = fma(_2158, _2154, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2088 = _2166;
            _2106 = _2172;
            _2082 = _2164;
            _2100 = _2170;
            _2094 = _2168;
            _2114 = _2174;
            _2176 = true;
        }
        else
        {
            bool _2178 = _1016 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2180 = isnan(_1016);
            bool _2182 = _2178 || _2180;
            bool _2184 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2186 = _2182 || _2184;
            if (!_2186)
            {
                _2080 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2188 = _2080;
            _2082 = _2188;
            if (!_2186)
            {
                _2086 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2190 = _2086;
            _2088 = _2190;
            if (!_2186)
            {
                _2092 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2192 = _2092;
            _2094 = _2192;
            if (!_2186)
            {
                _2098 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2194 = _2098;
            _2100 = _2194;
            if (!_2186)
            {
                _2104 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2196 = _2104;
            _2106 = _2196;
            if (!_2186)
            {
                _2112 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2198 = _2112;
            bool _2200 = !_2186;
            _2114 = _2198;
            if (!_2200)
            {
                bool _2202 = _1016 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2204 = isnan(_1016);
                bool _2206 = _2202 || _2204;
                bool _2208 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2210 = _2206 || _2208;
                if (!_2210)
                {
                    float _2212 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2214 = _1016 + _2212;
                    float _2216 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2218 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2216;
                    float _2220 = 1.0 / _2218;
                    float _2222 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2224 = _2222 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2226 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2228 = _2226 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2230 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2232 = _2230 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2234 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2236 = _2234 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2238 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2240 = _2238 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2242 = _2214 * _2220;
                    float _2244 = precise::clamp(_2242, 0.0, 1.0);
                    float _2246 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2248 = _2246 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2250 = fma(_2244, _2224, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2252 = fma(_2244, _2248, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2254 = fma(_2244, _2228, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2256 = fma(_2244, _2232, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2258 = fma(_2244, _2236, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2260 = fma(_2244, _2240, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2088 = _2252;
                    _2106 = _2258;
                    _2082 = _2250;
                    _2100 = _2256;
                    _2094 = _2254;
                    _2114 = _2260;
                    _2176 = true;
                }
                else
                {
                    _2088 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2106 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2082 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2100 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2094 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2114 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2176 = false;
    float _2262 = _2088;
    float _2264 = _2106;
    float _2266 = _2082;
    float _2268 = _2100;
    float _2270 = _2094;
    float _2272 = _2114;
    float _2274 = fma(_850, -0.5, 0.5);
    float _2276 = precise::clamp(_2274, 0.0, 1.0);
    float _2278 = -_2262;
    float _2280 = _2278 + _2264;
    float _2282 = _2070 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2284 = -_2266;
    float _2286 = _2284 + _2268;
    out.m_105.x = 0.0;
    float _2288 = fma(_2276, _2280, _2262);
    float _2290 = fma(_2276, _2286, _2266);
    out.m_65.x = _2282;
    float _2292 = -_2270;
    float _2294 = _2292 + _2272;
    float _2296 = _2288 * 0.586610972881317138671875;
    bool _2298 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2300 = fma(_2276, _2294, _2270);
    float _2302 = fma(_2290, 0.298911988735198974609375, _2296);
    bool _2304 = _1866 > 0.0;
    bool _2306 = isnan(_1866);
    bool _2308 = _2304 || _2306;
    bool _2310 = isnan(0.0);
    bool _2312 = _2308 || _2310;
    float _2314 = fma(_2300, 0.114477999508380889892578125, _2302);
    bool _2316 = _1920 <= 0.0;
    bool _2318 = !_2312;
    bool _2320 = _2316 || _2318;
    float _2322 = -_2314;
    float _2324 = _2290 + _2322;
    float _2326 = -_2314;
    float _2328 = _2288 + _2326;
    float _2330 = -_2314;
    float _2332 = _2300 + _2330;
    float _2334 = fma(_2324, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2314);
    float _2336 = fma(_2328, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2314);
    float _2338 = fma(_2332, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2314);
    bool _2340 = !_2298;
    if (!_2340)
    {
        float _2342 = -_962;
        float _2344 = _2342 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2346 = -_964;
        float _2348 = _2346 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2350 = -_966;
        float _2352 = _2350 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2354 = _2344 * _2344;
        float _2356 = fma(_2348, _2348, _2354);
        float _2358 = fma(_2352, _2352, _2356);
        float _2360 = sqrt(_2358);
        float _2362 = rsqrt(_2358);
        float _2364 = -_2360;
        float _2366 = _2364 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2368 = _2366 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2370 = precise::clamp(_2368, 0.0, 1.0);
        float _2372 = _2348 * _2362;
        float _2374 = _2344 * _2362;
        float _2376 = abs(_2370);
        float _2378 = log2(_2376);
        float _2380 = _2352 * _2362;
        float _2382 = _2372 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2384 = _850 * _2374;
        float _2386 = -_2374;
        float _2388 = -_2382;
        float _2390 = fma(_2386, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2388);
        float _2392 = fma(_848, _2372, _2384);
        float _2394 = -_2380;
        float _2396 = fma(_2394, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2390);
        float _2398 = fma(_838, _2380, _2392);
        float _2400 = precise::clamp(_2398, 0.0, 1.0);
        float _2402 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2404 = _2396 + _2402;
        float _2406 = _2378 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2408 = _2404 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2410 = precise::clamp(_2408, 0.0, 1.0);
        float _2412 = exp2(_2406);
        float _2414 = _2412 * _2410;
        float _2416 = _2400 * _2414;
        float _2418 = _2416 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2420 = _2416 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2422 = _2416 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_105.x = _2418;
        out.m_105.y = _2420;
        out.m_105.z = _2422;
    }
    out.m_107.x = _2334;
    out.m_107.y = _2336;
    out.m_107.z = _2338;
    if (!_2320)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_65.x = 0.0;
    float _2424 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2424;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2176 = false;
    bool _914 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _121 = in.m_62.w;
    float _123 = trunc(_121);
    int _126 = int(_123);
    bool _130 = _126 >= 1;
    float _132 = 0.0;
    float _134 = as_type<float>(_126);
    if (!_130)
    {
        _132 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _132;
    if (!_130)
    {
        out.m_65.x = 0.0;
    }
    int _138 = 0;
    if (!_130)
    {
        float _140 = _136 * 5.0;
        _138 = as_type<int>(_140);
    }
    int _142 = _138;
    int _144 = _142;
    if (!_130)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2482 = as_type<float>(_142);
        out.gl_Position.z = _2482;
    }
    if (!_130)
    {
        return out;
    }
    float _146 = in.m_67.w;
    bool _148 = _146 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _150 = isnan(_146);
    bool _152 = _148 || _150;
    bool _154 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _156 = _152 || _154;
    float _158 = -_146;
    float _160 = _158 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_156)
    {
        float _162 = float(_126);
        _134 = _162;
    }
    float _164 = _134;
    bool _166 = _160 >= _164;
    bool _168 = !_156;
    bool _170 = _166 || _168;
    float _172 = _164;
    if (_170)
    {
        _172 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _174 = _172;
    if (_170)
    {
        out.m_65.x = 0.0;
    }
    if (_170)
    {
        float _176 = _174 * 5.0;
        _144 = as_type<int>(_176);
    }
    int _178 = _144;
    if (_170)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2551 = as_type<float>(_178);
        out.gl_Position.z = _2551;
    }
    if (_170)
    {
        return out;
    }
    float _180 = in.m_69.w;
    float _182 = _160 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _184 = in.m_67.x;
    float _186 = in.m_67.y;
    float _188 = in.m_67.z;
    bool _190 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _192 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _194 = _190 || _192;
    bool _196 = isnan(1.0);
    bool _198 = _194 || _196;
    float _200 = in.m_62.x;
    float _202 = in.m_62.y;
    float _204 = in.m_62.z;
    float _206 = in.m_71.x;
    float _208 = in.m_71.y;
    float _210 = in.m_71.z;
    float _212 = in.m_69.x;
    float _214 = in.m_69.y;
    float _216 = in.m_69.z;
    float _218 = 0.0;
    float _220 = _182;
    if (!_198)
    {
        float _222 = _182 * _182;
        float _224 = _222 * 0.5;
        _218 = _224;
    }
    float _226 = _218;
    float _228 = _226;
    if (!_198)
    {
        float _230 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _228 = _230;
    }
    float _232 = _228;
    bool _234 = !_198;
    float _236 = _232;
    if (!_234)
    {
        float _238 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _240 = log2(_238);
        float _242 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _244 = _242 + 1.0;
        float _246 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _248 = _182 * _240;
        float _250 = exp2(_248);
        float _252 = _246 * 0.693147182464599609375;
        float _254 = 1.0 / _252;
        float _256 = 1.0 / _244;
        float _258 = _250 + (-1.0);
        float _260 = -_258;
        float _262 = fma(_260, _254, _182);
        float _264 = _262 * _256;
        float _266 = _264 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _236 = _266;
    }
    float _268 = _236;
    bool _270 = !_198;
    if (!_270)
    {
        float _272 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _274 = log2(_272);
        float _276 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _278 = _276 + 1.0;
        float _280 = 1.0 / _278;
        float _282 = _182 * _274;
        float _284 = exp2(_282);
        float _286 = -_284;
        float _288 = _286 + 1.0;
        float _290 = _288 * _280;
        _220 = _290;
    }
    float _292 = _220;
    float _294 = _212 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _296 = _216 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _298 = _214 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _300 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _208);
    float _302 = _294 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _304 = _268 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _306 = _298 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _308 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _206);
    float _310 = _296 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _312 = fma(_292, _186, _304);
    float _314 = _268 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _316 = _268 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _318 = _300 * _306;
    float _320 = fma(_312, _180, _202);
    float _322 = fma(_292, _184, _314);
    float _324 = fma(_292, _188, _316);
    float _326 = _308 * _302;
    float _328 = _320 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _330 = fma(_322, _180, _200);
    float _332 = _320 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _334 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _210);
    float _336 = _318 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _338 = fma(_324, _180, _204);
    float _340 = _318 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _342 = fma(_330, (*spvDescriptorSet0.vp_c10)._m0[4].x, _328);
    float _344 = fma(_330, (*spvDescriptorSet0.vp_c10)._m0[6].x, _332);
    float _346 = _334 * _310;
    float _348 = fma(_326, (*spvDescriptorSet0.vp_c10)._m0[8].x, _336);
    float _350 = fma(_326, (*spvDescriptorSet0.vp_c10)._m0[10].x, _340);
    float _352 = fma(_338, (*spvDescriptorSet0.vp_c10)._m0[4].z, _342);
    float _354 = fma(_338, (*spvDescriptorSet0.vp_c10)._m0[6].z, _344);
    float _356 = fma(_346, (*spvDescriptorSet0.vp_c10)._m0[8].z, _348);
    float _358 = fma(_346, (*spvDescriptorSet0.vp_c10)._m0[10].z, _350);
    float _360 = _352 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _362 = _354 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _364 = _360 + _356;
    float _366 = _362 + _358;
    float _368 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _370 = _364 + _368;
    float _372 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _374 = _366 + _372;
    float _376 = _370 * _370;
    float _378 = _374 * _374;
    float _380 = _376 + _378;
    float _382 = sqrt(_380);
    bool _384 = _382 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _386 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _388 = _382 + _386;
    float _390 = _354;
    float _392 = _320;
    float _394 = _356;
    float _396 = _364;
    float _398 = _380;
    float _400 = _376;
    float _402 = _378;
    float _404 = _362;
    if (_384)
    {
        float _406 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _390 = _406;
    }
    float _408 = _390;
    float _410 = _408;
    if (_384)
    {
        float _412 = _388 * _408;
        _410 = _412;
    }
    float _414 = _410;
    float _416 = _320 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    if (!_384)
    {
        _392 = _366;
    }
    float _418 = _392;
    float _420 = _418;
    if (_384)
    {
        float _422 = _414 * 0.15915493667125701904296875;
        _394 = _422;
    }
    float _424 = _394;
    float _426 = fma(_330, (*spvDescriptorSet0.vp_c10)._m0[5].x, _416);
    float _428 = _318 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _430 = fma(_338, (*spvDescriptorSet0.vp_c10)._m0[5].z, _426);
    float _432 = _424;
    if (_384)
    {
        float _434 = _424 * 6.283185482025146484375;
        float _436 = sin(_434);
        _432 = _436;
    }
    float _438 = _432;
    float _440 = fma(_326, (*spvDescriptorSet0.vp_c10)._m0[9].x, _428);
    float _442 = _430 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _444 = fma(_346, (*spvDescriptorSet0.vp_c10)._m0[9].z, _440);
    float _446 = _430;
    if (_384)
    {
        float _448 = rsqrt(_380);
        _446 = _448;
    }
    float _450 = _446;
    float _452 = _442 + _444;
    float _454 = _452;
    if (_384)
    {
        float _456 = _452 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _454 = _456;
    }
    float _458 = _454;
    float _460 = _458;
    if (_384)
    {
        float _462 = fma(_438, _458, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _460 = _462;
    }
    float _464 = _460;
    float _466 = _450;
    if (_384)
    {
        float _468 = _450 * _464;
        _466 = _468;
    }
    float _470 = _466;
    if (_384)
    {
        float _472 = fma(_370, _470, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _396 = _472;
    }
    float _474 = _396;
    if (_384)
    {
        float _476 = fma(_374, _470, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _420 = _476;
    }
    float _478 = _420;
    float _480 = fma(_474, 6.2500002968590706586837768554688e-05, 0.5);
    float _482 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _484 = _474 + _482;
    float _486 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _488 = _478 + _486;
    float _490 = fma(_478, 6.2500002968590706586837768554688e-05, 0.5);
    float _492 = fma(_484, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _494 = fma(_488, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _3073 = float2(_480, _490);
    float _496 = dm_bs(spvDescriptorSet0.vp_t_tcb_2C.sample(spvDescriptorSet0.vp_t_tcb_2CSmplr, select(_3073, float2(0.0), isnan(_3073)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_2C, spvDescriptorSet0.vp_t_tcb_2CSmplr_w, select(_3073, float2(0.0), isnan(_3073)), level(0.0)).y;
    float2 _3083 = float2(_492, _494);
    float _498 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_3083, float2(0.0), isnan(_3083)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_3083, float2(0.0), isnan(_3083)), level(0.0)).x;
    float _500 = in.m_73.y;
    float _502 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _504 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _506 = _504 != 0;
    float _508 = in.m_75.w;
    int _510 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _512 = _510 != 0;
    int _514 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _516 = _514 != 0;
    float _518 = in.m_73.x;
    float _520 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _522 = _318;
    float _524 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    float _526 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    float _528 = _520;
    if (!_506)
    {
        float _530 = in.m_75.z;
        _522 = _530;
    }
    float _532 = _522;
    float _534 = _502 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _536 = _374;
    if (_512)
    {
        float _538 = in.m_75.z;
        _536 = _538;
    }
    float _540 = _536;
    if (!_506)
    {
        float _542 = in.m_75.y;
        _524 = _542;
    }
    float _544 = _524;
    float _546 = -_500;
    float _548 = _546 + 1.0;
    bool _550 = _508 > 0.5;
    float _552 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _554 = _500;
    if (_516)
    {
        float _556 = _550 ? _548 : _500;
        _554 = _556;
    }
    float _558 = _554;
    bool _560 = _208 != 0.0;
    bool _562 = isnan(_208);
    bool _564 = _560 || _562;
    bool _566 = isnan(0.0);
    bool _568 = _564 || _566;
    float _570 = _518;
    if (_512)
    {
        _398 = _518;
    }
    float _572 = _398;
    float _574 = fma(_534, _558, -0.5);
    float _576 = _572;
    float _578 = _532;
    if (!_506)
    {
        _526 = _532;
    }
    float _580 = _526;
    float _582 = in.m_77.x;
    float _584 = in.m_77.y;
    float _586 = in.m_77.z;
    bool _588 = _206 == 0.0;
    bool _590 = !_568;
    bool _592 = _588 && _590;
    float _594 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _596 = _540 > 0.5;
    bool _598 = _596 && _512;
    float _600 = _544;
    float _602 = _580;
    if (_506)
    {
        float _604 = in.m_75.x;
        float _606 = in.m_75.y;
        _600 = _604;
        _602 = _606;
    }
    float _608 = _600;
    float _610 = _602;
    float _612 = _552 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _614 = _210 == 0.0;
    bool _616 = _614 && _592;
    float _618 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    if (_598)
    {
        float _620 = -_572;
        float _622 = _620 + 1.0;
        _576 = _622;
    }
    float _624 = _576;
    if (_512)
    {
        _570 = _624;
    }
    float _626 = _570;
    float _628 = 0.0;
    if (_616)
    {
        _628 = _582;
    }
    float _630 = _628;
    float _632 = fma(_612, _626, -0.5);
    float _634 = 0.0;
    float _636 = _630;
    if (_616)
    {
        _634 = _584;
    }
    float _638 = _634;
    float _640 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _642 = fma(_608, (*spvDescriptorSet0.vp_c9)._m0[83].z, _594);
    float _644 = _608 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _646 = _638;
    if (_506)
    {
        _578 = _610;
    }
    float _648 = _578;
    float _650 = _610 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _652 = 0.0;
    float _654 = _650;
    if (_616)
    {
        _652 = _630;
    }
    float _656 = _652;
    float _658 = -_618;
    float _660 = fma(_644, 2.0, _658);
    float _662 = _656;
    if (!_616)
    {
        _636 = _582;
    }
    float _664 = _636;
    float _666 = in.m_79.x;
    float _668 = in.m_79.y;
    float _670 = in.m_79.z;
    float _672 = in.m_79.w;
    float _674 = fma(_650, -2.0, _640);
    float _676 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[83].w, _520);
    float _678 = 0.0;
    if (_616)
    {
        _678 = _586;
    }
    float _680 = _678;
    float _682 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[82].z, _642);
    float _684 = _680;
    if (_616)
    {
        _654 = _638;
    }
    float _686 = _654;
    float _688 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[81].y, _674);
    float _690 = -_160;
    float _692 = fma(_690, (*spvDescriptorSet0.vp_c9)._m0[81].x, _660);
    float _694 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[82].w, _676);
    float _696 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _698 = _686;
    if (!_616)
    {
        _646 = _584;
    }
    float _700 = _646;
    float _702 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    if (_616)
    {
        _528 = _680;
    }
    float _704 = _528;
    float _706 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _708 = _704;
    if (!_616)
    {
        float _710 = fma(_208, (*spvDescriptorSet0.vp_c9)._m0[17].y, _700);
        _698 = _710;
    }
    float _712 = _698;
    if (!_616)
    {
        _684 = _586;
    }
    float _714 = _684;
    float _716 = _696 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _718 = _702 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _720 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _722 = _706 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _724 = _668 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _726 = _668 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _728 = _668 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    if (!_616)
    {
        float _730 = fma(_210, (*spvDescriptorSet0.vp_c9)._m0[17].y, _714);
        _708 = _730;
    }
    float _732 = _708;
    float _734 = fma(_666, (*spvDescriptorSet0.vp_c10)._m0[10].x, _724);
    float _736 = fma(_666, (*spvDescriptorSet0.vp_c10)._m0[8].x, _726);
    float _738 = fma(_666, (*spvDescriptorSet0.vp_c10)._m0[9].x, _728);
    if (!_616)
    {
        float _740 = fma(_206, (*spvDescriptorSet0.vp_c9)._m0[17].y, _664);
        _662 = _740;
    }
    float _742 = _662;
    float _744 = fma(_670, (*spvDescriptorSet0.vp_c10)._m0[10].z, _734);
    float _746 = _670 * _664;
    float _748 = fma(_670, (*spvDescriptorSet0.vp_c10)._m0[8].z, _736);
    float _750 = fma(_670, (*spvDescriptorSet0.vp_c10)._m0[9].z, _738);
    float _752 = _712 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _754 = _668 * _714;
    float _756 = -_746;
    float _758 = fma(_666, _714, _756);
    out.m_81.x = _716;
    out.m_81.y = _718;
    out.m_81.z = _722;
    out.m_81.w = _720;
    float _760 = _666 * _700;
    float _762 = -_754;
    float _764 = fma(_670, _700, _762);
    float _766 = fma(_682, _632, _692);
    out.m_83.x = _748;
    out.m_83.y = _750;
    out.m_83.z = _744;
    float _768 = -_760;
    float _770 = fma(_668, _664, _768);
    float _772 = _764 * _672;
    float _774 = -_688;
    float _776 = fma(_694, _574, _774);
    float _778 = _712 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _780 = _770 * _672;
    float _782 = _712 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _784 = _776 + 0.5;
    float _786 = fma(_742, (*spvDescriptorSet0.vp_c10)._m0[9].x, _778);
    float _788 = fma(_742, (*spvDescriptorSet0.vp_c10)._m0[8].x, _752);
    float _790 = _758 * _672;
    float _792 = _766 + 0.5;
    float _794 = fma(_742, (*spvDescriptorSet0.vp_c10)._m0[10].x, _782);
    float _796 = _790 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _798 = _790 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _800 = _790 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _802 = _790;
    float _804 = _780;
    if (_384)
    {
        float _806 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _808 = _474 + _806;
        _802 = _808;
    }
    float _810 = _802;
    float _812 = fma(_772, (*spvDescriptorSet0.vp_c10)._m0[8].x, _796);
    float _814 = fma(_772, (*spvDescriptorSet0.vp_c10)._m0[9].x, _798);
    float _816 = fma(_772, (*spvDescriptorSet0.vp_c10)._m0[10].x, _800);
    float _818 = fma(_780, (*spvDescriptorSet0.vp_c10)._m0[8].z, _812);
    float _820 = fma(_780, (*spvDescriptorSet0.vp_c10)._m0[9].z, _814);
    float _822 = fma(_780, (*spvDescriptorSet0.vp_c10)._m0[10].z, _816);
    float _824 = _822;
    if (_384)
    {
        float _826 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _828 = _478 + _826;
        _804 = _828;
    }
    float _830 = _804;
    float _832 = in.m_85.y;
    if (_384)
    {
        float _834 = _810 * _810;
        _400 = _834;
    }
    float _836 = _400;
    float _838 = fma(_732, (*spvDescriptorSet0.vp_c10)._m0[10].z, _794);
    if (_384)
    {
        float _840 = _830 * _830;
        _402 = _840;
    }
    float _842 = _402;
    out.m_87.x = _818;
    out.m_87.y = _820;
    out.m_87.z = _822;
    float _844 = in.m_85.x;
    float _846 = in.m_85.z;
    out.m_89.z = _792;
    out.m_89.w = _784;
    out.m_91.y = _832;
    float _848 = fma(_732, (*spvDescriptorSet0.vp_c10)._m0[8].z, _788);
    float _850 = fma(_732, (*spvDescriptorSet0.vp_c10)._m0[9].z, _786);
    out.m_91.x = _844;
    out.m_91.z = _846;
    out.m_93.x = _848;
    out.m_93.y = _850;
    out.m_93.z = _838;
    float _852 = fma(_496, 2000.0, (*spvDescriptorSet0.vp_c13)._m0[0].x);
    float _854 = in.m_85.w;
    float _856 = fma(_498, 100.0, _852);
    float _858 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _860 = _856 + _858;
    float _862 = fma(_860, _860, _836);
    float _864 = _862 + _842;
    float _866 = sqrt(_864);
    out.m_91.w = _854;
    bool _868 = _866 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _870 = isnan(_866);
    bool _872 = _868 || _870;
    bool _874 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _876 = _872 || _874;
    float _878 = _864;
    if (!_876)
    {
        _824 = 1.0;
    }
    float _880 = _824;
    bool _882 = !_876;
    float _884 = _880;
    if (!_882)
    {
        bool _886 = _866 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _888 = isnan(_866);
        bool _890 = _886 || _888;
        bool _892 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _894 = _890 || _892;
        if (!_894)
        {
            float _896 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _898 = _866 + _896;
            float _900 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _902 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _900;
            float _904 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _906 = _904 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _908 = 1.0 / _902;
            float _910 = _898 * _908;
            float _912 = fma(_910, _906, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _884 = _912;
            _914 = true;
        }
        else
        {
            bool _916 = _866 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _918 = isnan(_866);
            bool _920 = _916 || _918;
            bool _922 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _924 = _920 || _922;
            if (!_924)
            {
                float _926 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _928 = _866 + _926;
                float _930 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _932 = _930 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _934 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _936 = _934 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _938 = 1.0 / _932;
                float _940 = _928 * _938;
                float _942 = fma(_940, _936, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _884 = _942;
                _914 = true;
            }
            else
            {
                _884 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _914 = false;
    float _944 = _884;
    float _946 = _442 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _948 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _950 = _856 + _948;
    float _952 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _954 = _474 + _952;
    float _956 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _958 = _478 + _956;
    float _960 = fma(_360, (*spvDescriptorSet0.vp_c8)._m0[11].x, _946);
    float _962 = fma(_950, _944, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _964 = fma(_954, _944, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _966 = fma(_958, _944, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _968 = fma(_362, (*spvDescriptorSet0.vp_c8)._m0[11].z, _960);
    float _970 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _972 = _962 + _970;
    float _974 = _442 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _976 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _978 = _964 + _976;
    float _980 = _968 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _982 = _972 * _972;
    float _984 = fma(_360, (*spvDescriptorSet0.vp_c8)._m0[10].x, _974);
    float _986 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _988 = _966 + _986;
    float _990 = 1.0 / _980;
    float _992 = fma(_978, _978, _982);
    float _994 = fma(_362, (*spvDescriptorSet0.vp_c8)._m0[10].z, _984);
    float _996 = _962 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _998 = fma(_988, _988, _992);
    float _1000 = _994 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1002 = fma(_964, (*spvDescriptorSet0.vp_c8)._m0[3].x, _996);
    float _1004 = rsqrt(_998);
    float _1006 = _1000 + _980;
    float _1008 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1010 = _1006 * _990;
    float _1012 = _1010 * 0.5;
    float _1014 = _442 + _1008;
    float _1016 = sqrt(_998);
    float _1018 = fma(_362, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1020 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1022 = fma(_1012, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1020);
    float _1024 = _1004 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1026 = 1.0 / _1022;
    float _1028 = _1014 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1030 = _978 * _1024;
    float _1032 = _988 * _1024;
    float _1034 = fma(_360, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1028);
    float _1036 = _1030 * _1030;
    float _1038 = _1032 * _1032;
    float _1040 = fma(_362, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1034);
    float _1042 = floor(_1018);
    float _1044 = _1036 + _1038;
    float _1046 = _1040 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1048 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1050 = _1026 * _1048;
    float _1052 = _1014 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1054 = sqrt(_1044);
    bool _1056 = _1050 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1058 = fma(_360, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1052);
    bool _1060 = _1050 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1062 = fma(_362, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1058);
    float _1064 = trunc(_1046);
    int _1066 = int(_1064);
    float _1068 = -_1042;
    float _1070 = _1018 + _1068;
    float _1072 = _1062 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    bool _1074 = !_1056;
    int _1076 = _1074 ? 0 : 1;
    bool _1078 = _1054 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1080 = trunc(_1072);
    int _1082 = int(_1080);
    int _1084 = 2;
    float _1086 = _1030;
    float _1088 = _1036;
    float _1090 = _1032;
    float _1092 = _1002;
    if (!_1056)
    {
        _1084 = 1;
    }
    int _1094 = _1084;
    float _1096 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1098 = _1054 + _1096;
    int _1100 = _1094;
    float _1102 = _1098;
    if (!_1060)
    {
        _1100 = _1076;
    }
    int _1104 = _1100;
    int _1106 = _1104 << 6;
    int _1108 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1110 = _1066 + _1108;
    int _1112 = _1110 + 1;
    int _1114 = _1106 + 96;
    uint _1117 = uint(int(uint(_1114) >> uint(2)));
    uint _1119 = uint(int(uint(int(_1117)) >> uint(2)));
    int _1121 = int(_1117) & 3;
    float _1123 = (*spvDescriptorSet0.vp_c15)._m0[int(_1119)][_1121];
    int _1125 = int(_1117) + 1;
    uint _1127 = uint(int(uint(_1125) >> uint(2)));
    int _1129 = _1125 & 3;
    float _1131 = (*spvDescriptorSet0.vp_c15)._m0[int(_1127)][_1129];
    float _1133 = _856;
    float _1135 = as_type<float>(_1104);
    if (_1078)
    {
        float _1137 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1133 = _1137;
    }
    float _1139 = _1133;
    float _1141 = 0.0;
    if (!_1078)
    {
        _1141 = _1038;
    }
    float _1143 = _1141;
    int _1145 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1147 = _1082 + _1145;
    int _1149 = _1147 + 1;
    float _1151 = _962 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    int _1153 = _1106 + 104;
    uint _1155 = uint(int(uint(_1153) >> uint(2)));
    uint _1157 = uint(int(uint(int(_1155)) >> uint(2)));
    int _1159 = int(_1155) & 3;
    float _1161 = (*spvDescriptorSet0.vp_c15)._m0[int(_1157)][_1159];
    int _1163 = int(_1155) + 1;
    uint _1165 = uint(int(uint(_1163) >> uint(2)));
    int _1167 = _1163 & 3;
    float _1169 = (*spvDescriptorSet0.vp_c15)._m0[int(_1165)][_1167];
    bool _1171 = _1149 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1173 = fma(_964, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1151);
    int _1175 = _1149 | _1112;
    float _1177 = fma(_966, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1173);
    bool _1179 = _1175 < 0;
    bool _1181 = _1179 || _1171;
    float _1183 = _1177;
    int _1185 = _1149;
    float _1187 = _1143;
    if (_1078)
    {
        float _1189 = _1098 * _1139;
        _1102 = _1189;
    }
    float _1191 = _1102;
    float _1193 = _1177 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _1195 = _1112 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1197 = _1195 || _1181;
    if (_1078)
    {
        float _1199 = rsqrt(_1044);
        _1183 = _1199;
    }
    float _1201 = _1183;
    float _1203 = _1201;
    if (_1078)
    {
        float _1205 = _1191 * 0.15915493667125701904296875;
        _878 = _1205;
    }
    float _1207 = _878;
    float _1209 = _1193 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1211 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1213 = _852;
    if (_1078)
    {
        float _1215 = _1207 * 6.283185482025146484375;
        float _1217 = sin(_1215);
        _1213 = _1217;
    }
    float _1219 = _1213;
    float _1221 = precise::max(0.0, _1211);
    float _1223 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1225 = _1223;
    if (!_1197)
    {
        int _1227 = _1112 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1229 = _1227 + _1149;
        _1185 = _1229;
    }
    int _1231 = _1185;
    float _1233 = _1139;
    if (_1078)
    {
        float _1235 = _1207 * 6.283185482025146484375;
        float _1237 = cos(_1235);
        _1233 = _1237;
    }
    float _1239 = _1233;
    float _1241 = -_1024;
    float _1243 = -_1221;
    float _1245 = fma(_972, _1241, _1243);
    float _1247 = -_1209;
    float _1249 = fma(_1247, _1223, 1.0);
    int _1251 = 0;
    float _1253 = _1245;
    if (!_1197)
    {
        int _1255 = _1231 << 2;
        _1251 = _1255;
    }
    int _1257 = _1251;
    int _1259 = _1257;
    if (_1078)
    {
        float _1261 = _1245 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1225 = _1261;
    }
    float _1263 = _1225;
    int _1265 = 0;
    float _1267 = _1263;
    if (!_1197)
    {
        uint _1269 = uint(int(uint(_1231) >> uint(2)));
        _1265 = int(_1269);
    }
    int _1271 = _1265;
    if (!_1197)
    {
        int _1273 = 12 & _1257;
        _1259 = _1273;
    }
    int _1275 = _1259;
    if (_1078)
    {
        float _1277 = fma(_1219, _1263, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1267 = _1277;
    }
    float _1279 = _1267;
    int _1281 = _1106 + 56;
    uint _1283 = uint(int(uint(_1281) >> uint(2)));
    uint _1285 = uint(int(uint(int(_1283)) >> uint(2)));
    int _1287 = int(_1283) & 3;
    float _1289 = (*spvDescriptorSet0.vp_c15)._m0[int(_1285)][_1287];
    int _1291 = int(_1283) + 1;
    uint _1293 = uint(int(uint(_1291) >> uint(2)));
    int _1295 = _1291 & 3;
    float _1297 = (*spvDescriptorSet0.vp_c15)._m0[int(_1293)][_1295];
    float _1299 = log2(_1249);
    float _1301 = _1014 * _1131;
    float _1303 = _1131;
    if (_1078)
    {
        float _1305 = _1201 * _1279;
        _1203 = _1305;
    }
    float _1307 = _1203;
    if (_1078)
    {
        float _1309 = _1239 + (-1.0);
        _1303 = _1309;
    }
    float _1311 = _1303;
    float _1313 = fma(_360, _1123, _1301);
    int _1315 = _1106 + 48;
    uint _1317 = uint(int(uint(_1315) >> uint(2)));
    uint _1319 = uint(int(uint(int(_1317)) >> uint(2)));
    int _1321 = int(_1317) & 3;
    float _1323 = (*spvDescriptorSet0.vp_c15)._m0[int(_1319)][_1321];
    int _1325 = int(_1317) + 1;
    uint _1327 = uint(int(uint(_1325) >> uint(2)));
    int _1329 = _1325 & 3;
    float _1331 = (*spvDescriptorSet0.vp_c15)._m0[int(_1327)][_1329];
    float _1333 = _1311;
    if (_1078)
    {
        float _1335 = _1030 * _1307;
        _1086 = _1335;
    }
    float _1337 = _1086;
    if (_1078)
    {
        float _1339 = _1311 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1333 = _1339;
    }
    float _1341 = _1333;
    float _1343 = fma(_362, _1161, _1313);
    if (_1078)
    {
        float _1345 = _1337 * _1337;
        _1088 = _1345;
    }
    float _1347 = _1088;
    if (_1078)
    {
        float _1349 = fma(_1245, _1239, _1341);
        _1253 = _1349;
    }
    float _1351 = _1253;
    if (_1078)
    {
        float _1353 = _1032 * _1307;
        _1090 = _1353;
    }
    float _1355 = _1090;
    int _1357 = _1106 + 64;
    uint _1359 = uint(int(uint(_1357) >> uint(2)));
    uint _1361 = uint(int(uint(int(_1359)) >> uint(2)));
    int _1363 = int(_1359) & 3;
    float _1365 = (*spvDescriptorSet0.vp_c15)._m0[int(_1361)][_1363];
    int _1367 = int(_1359) + 1;
    uint _1369 = uint(int(uint(_1367) >> uint(2)));
    int _1371 = _1367 & 3;
    float _1373 = (*spvDescriptorSet0.vp_c15)._m0[int(_1369)][_1371];
    float _1375 = fma(_360, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1377 = fma(_1351, _1351, _1347);
    float _1379 = _962 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1381 = _962 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    if (_1078)
    {
        float _1383 = _1355 * _1355;
        _1187 = _1383;
    }
    float _1385 = _1187;
    float _1387 = fma(_964, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1379);
    int _1389 = _1106 + 72;
    uint _1391 = uint(int(uint(_1389) >> uint(2)));
    uint _1393 = uint(int(uint(int(_1391)) >> uint(2)));
    int _1395 = int(_1391) & 3;
    float _1397 = (*spvDescriptorSet0.vp_c15)._m0[int(_1393)][_1395];
    int _1399 = int(_1391) + 1;
    uint _1401 = uint(int(uint(_1399) >> uint(2)));
    int _1403 = _1399 & 3;
    float _1405 = (*spvDescriptorSet0.vp_c15)._m0[int(_1401)][_1403];
    float _1407 = fma(_964, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1381);
    float _1409 = _1377 + _1385;
    float _1411 = fma(_966, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1387);
    float _1413 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1415 = fma(_1016, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1413);
    float _1417 = precise::clamp(_1415, 0.0, 1.0);
    float _1419 = fma(_966, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1407);
    float _1421 = fma(_966, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1002);
    float _1423 = _1411 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    int _1425 = _1106 + 80;
    uint _1427 = uint(int(uint(_1425) >> uint(2)));
    uint _1429 = uint(int(uint(int(_1427)) >> uint(2)));
    int _1431 = int(_1427) & 3;
    float _1433 = (*spvDescriptorSet0.vp_c15)._m0[int(_1429)][_1431];
    int _1435 = int(_1427) + 1;
    uint _1437 = uint(int(uint(_1435) >> uint(2)));
    int _1439 = _1435 & 3;
    float _1441 = (*spvDescriptorSet0.vp_c15)._m0[int(_1437)][_1439];
    float _1443 = -_1417;
    float _1445 = _1443 + 1.0;
    float _1447 = _1419 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1449 = _1423 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1451 = _1343 + _1169;
    if (!_1197)
    {
        int _1453 = _1271 << 4;
        int _1455 = _1453 + _1275;
        _1092 = as_type<float>(_1455);
    }
    float _1457 = _1092;
    float _1459 = _1421 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1461 = fma(_1447, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1449);
    int _1463 = _1106 + 88;
    uint _1465 = uint(int(uint(_1463) >> uint(2)));
    uint _1467 = uint(int(uint(int(_1465)) >> uint(2)));
    int _1469 = int(_1465) & 3;
    float _1471 = (*spvDescriptorSet0.vp_c15)._m0[int(_1467)][_1469];
    int _1473 = int(_1465) + 1;
    uint _1475 = uint(int(uint(_1473) >> uint(2)));
    int _1477 = _1473 & 3;
    float _1479 = (*spvDescriptorSet0.vp_c15)._m0[int(_1475)][_1477];
    float _1481 = rsqrt(_1409);
    float _1483 = _1299 * 0.693147182464599609375;
    float _1485 = fma(_1193, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1461);
    float _1487 = fma(_1459, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1485);
    float _1489 = _1457;
    if (!_1197)
    {
        int _1491 = as_type<int>(_1457) + 400;
        uint _1493 = uint(int(uint(_1491) >> uint(2)));
        uint _1495 = uint(int(uint(int(_1493)) >> uint(2)));
        int _1497 = int(_1493) & 3;
        float _1499 = (*spvDescriptorSet0.vp_c15)._m0[int(_1495)][_1497];
        _1489 = _1499;
    }
    float _1501 = _1489;
    float _1503 = 1.0 / _1451;
    float _1505 = _1014 * _1331;
    float _1507 = _1481 * _1337;
    float _1509 = abs(_1445);
    float _1511 = log2(_1509);
    float _1513 = _1481 * _1351;
    float _1515 = fma(_360, _1323, _1505);
    float _1517 = _1507 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1519 = _1481 * _1355;
    float _1521 = _1014 * _1373;
    float _1523 = fma(_362, _1289, _1515);
    float _1525 = 1.0 / _1487;
    float _1527 = fma(_360, _1365, _1521);
    float _1529 = _1523 + _1297;
    float _1531 = -_1517;
    float _1533 = fma(_1513, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1531);
    float _1535 = fma(_362, _1397, _1527);
    float _1537 = _1529 * _1503;
    float _1539 = _1297;
    float _1541 = _1507;
    if (!_1197)
    {
        float _1543 = floor(_1046);
        _1539 = _1543;
    }
    float _1545 = _1539;
    float _1547 = -_1519;
    float _1549 = fma(_1547, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1533);
    float _1551 = _1535 + _1405;
    float _1553 = _1511 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    bool _1555 = _1537 >= 0.0;
    float _1557 = fma(_1549, -0.5, 0.5);
    float _1559 = _1551 * _1503;
    float _1561 = _1014 * _1441;
    bool _1563 = _1537 <= 1.0;
    bool _1565 = _1563 && _1555;
    float _1567 = fma(_1549, 0.5, 0.5);
    float _1569 = fma(_360, _1433, _1561);
    bool _1571 = _1559 >= 0.0;
    bool _1573 = _1571 && _1565;
    float _1575 = exp2(_1553);
    float _1577 = _1423 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1579 = fma(_362, _1471, _1569);
    bool _1581 = _1559 <= 1.0;
    bool _1583 = _1581 && _1573;
    float _1585 = fma(_1567, -0.0187292993068695068359375, 0.07426099479198455810546875);
    if (!_1197)
    {
        float _1587 = -_1545;
        float _1589 = _1046 + _1587;
        _1541 = _1589;
    }
    float _1591 = _1541;
    float _1593 = _1579 + _1479;
    float _1595 = fma(_1447, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1577);
    float _1597 = fma(_1567, _1585, -0.212114393711090087890625);
    float _1599 = sqrt(_1557);
    float _1601 = _1423 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1603 = _1513 + 1.0;
    float _1605 = fma(_1567, _1597, 1.570728778839111328125);
    float _1607 = fma(_1193, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1595);
    float _1609 = fma(_1447, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1601);
    float _1611 = _1593 * _1503;
    float _1613 = _1605;
    if (_1583)
    {
        float _1615 = float(_1104);
        _1135 = _1615;
    }
    float _1617 = _1135;
    float _1619 = floor(_1375);
    float _1621 = fma(_1193, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1609);
    float _1623 = -_1513;
    float _1625 = fma(_1575, _1603, _1623);
    float _1627 = fma(_1459, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1607);
    float _1629 = fma(_1459, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1621);
    float _1631 = _1627 * _1525;
    float _1633 = _1519;
    float _1635 = _1629;
    if (!_1197)
    {
        float _1637 = floor(_1072);
        _1633 = _1637;
    }
    float _1639 = _1633;
    float _1641 = _1599 * 0.636619746685028076171875;
    float _1643 = _1629 * _1525;
    float _1645 = fma(_1631, 0.5, 0.5);
    float _1647 = -_1605;
    float _1649 = fma(_1641, _1647, 1.0);
    float _1651 = _1471;
    if (!_1197)
    {
        float _1653 = rint(_1501);
        float _1655 = precise::max(_1653, 0.0);
        uint _1657 = uint(_1655);
        uint _1659 = clamp(_1657, 0u, 65535u);
        _1651 = as_type<float>(_1659);
    }
    float _1661 = _1651;
    float _1663 = -_1619;
    float _1665 = _1375 + _1663;
    float _1667 = fma(_1643, -0.5, 0.5);
    float _1669 = fma(_1625, 0.5, 0.5);
    float _1671 = _1609;
    if (_1583)
    {
        float _1673 = rint(_1617);
        float _1675 = precise::max(_1673, 0.0);
        uint _1677 = uint(_1675);
        uint _1679 = clamp(_1677, 0u, 65535u);
        _1671 = as_type<float>(_1679);
    }
    float _1681 = _1671;
    if (!_1197)
    {
        float _1683 = -_1639;
        float _1685 = _1072 + _1683;
        _1613 = _1685;
    }
    float _1687 = _1613;
    float _1689 = _1483 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float2 _5124 = float2(_1665, _1070);
    float _1691 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5124, float2(0.0), isnan(_5124)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5124, float2(0.0), isnan(_5124)), level(0.0)).x;
    float _1693 = _1483;
    if (!_1197)
    {
        float3 _5139 = float3(_1687, _1591, float(as_type<int>(_1661)));
        float3 _5143 = select(_5139, float3(0.0), isnan(_5139));
        float _1695 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5143.xy, uint(rint(_5143.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5143.xy, uint(rint(_5143.z)), level(0.0)).x;
        _1693 = _1695;
    }
    float _1697 = _1693;
    float _1699 = _1559;
    if (_1583)
    {
        float3 _5158 = float3(_1537, _1559, float(as_type<int>(_1681)));
        float3 _5160 = select(_5158, float3(0.0), isnan(_5158));
        float _1701 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5160.xy, uint(rint(_5160.z)), _1611, level(0.0));
        _1699 = _1701;
    }
    float _1703 = _1699;
    float3 _5170 = float3(_1645, _1667, _1689);
    float _1705 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5170, float3(0.0), isnan(_5170)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5170, float3(0.0), isnan(_5170)), level(0.0)).x;
    float3 _5179 = float3(_1645, _1667, _1689);
    float4 _1708 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5179, float3(0.0), isnan(_5179)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5179, float3(0.0), isnan(_5179)), level(0.0)).xyzw;
    float _1710 = _1708.x;
    float _1712 = _1708.y;
    float _1714 = _1708.z;
    float _1716 = _1708.w;
    float2 _5195 = float2(_1649, _1669);
    float3 _1720 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5195, float2(0.0), isnan(_5195)), level(0.0)), spvDescriptorSet0.dm_border, 6u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5195, float2(0.0), isnan(_5195)), level(0.0)).xyz;
    float _1722 = _1720.x;
    float _1724 = _1720.y;
    float _1726 = _1720.z;
    float _1728 = abs(_1050);
    float _1730 = log2(_1728);
    float _1732 = _1423 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1734 = _1511 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1736 = fma(_1447, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1732);
    float _1738 = fma(_1193, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1736);
    float _1740 = _1627 + _1487;
    float _1742 = fma(_1459, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1738);
    float _1744 = _1487 * 0.5;
    float _1746 = _1730 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1748 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _1750 = _1742 + _1748;
    float _1752 = fma(_1629, -0.5, _1744);
    float _1754 = _1740 * 0.5;
    float _1756 = _1487 + _1750;
    float _1758 = exp2(_1746);
    out.gl_Position.x = _1627;
    out.gl_Position.y = _1629;
    out.gl_Position.z = _1750;
    out.gl_Position.w = _1487;
    float _1760 = _1756 * 0.5;
    out.m_95.x = _1754;
    out.m_95.y = _1752;
    out.m_95.z = _1760;
    out.m_95.w = _1487;
    bool _1762 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1764 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1766 = _1762 || _1764;
    bool _1768 = isnan(0.5);
    bool _1770 = _1766 || _1768;
    out.m_97.z = _1760;
    out.m_97.w = _1487;
    float _1772 = fma(_1758, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1774 = precise::clamp(_1772, 0.0, 1.0);
    float _1776 = exp2(_1734);
    bool _1778 = _1050 <= 8000.0;
    bool _1780 = isnan(_1050);
    bool _1782 = _1778 || _1780;
    bool _1784 = isnan(8000.0);
    bool _1786 = _1782 || _1784;
    float _1788 = float(_1786);
    float _1790 = fma(_1774, -2.0, 3.0);
    float _1792 = _1774 * _1774;
    if (_1770)
    {
        _1635 = 1.0;
    }
    float _1794 = _1635;
    float _1796 = _1792 * _1790;
    float _1798 = -_1796;
    float _1800 = _1798 + 1.0;
    float _1802 = fma(_1800, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1796);
    float _1804 = _1788 * _1802;
    float _1806 = _1802;
    float _1808 = _1794;
    float _1810 = _1804;
    if (_1770)
    {
        _1806 = 1.0;
    }
    float _1812 = _1806;
    float _1814 = _1812;
    float _1816 = _1703;
    if (!_1770)
    {
        float _1818 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1820 = _1818 * 0.15915493667125701904296875;
        float _1822 = _1820 * 6.283185482025146484375;
        float _1824 = cos(_1822);
        float _1826 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1828 = _1826 * 0.15915493667125701904296875;
        float _1830 = _1820 * 6.283185482025146484375;
        float _1832 = sin(_1830);
        float _1834 = 1.0 / _1824;
        float _1836 = _1828 * 6.283185482025146484375;
        float _1838 = cos(_1836);
        float _1840 = _1832 * _1834;
        float _1842 = _1828 * 6.283185482025146484375;
        float _1844 = sin(_1842);
        float _1846 = _1838 * _1840;
        float _1848 = 1.0 / _1846;
        float _1850 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1852 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1850;
        float _1854 = 1.0 / _1852;
        float _1856 = _1844 * _1848;
        float _1858 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1860 = fma(_1050, _1856, _1858);
        float _1862 = _1860 * _1854;
        float _1864 = precise::clamp(_1862, 0.0, 1.0);
        _1808 = _1864;
    }
    float _1866 = _1808;
    if (!_1770)
    {
        float _1868 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1870 = _1868 * 0.15915493667125701904296875;
        float _1872 = _1870 * 6.283185482025146484375;
        float _1874 = cos(_1872);
        float _1876 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1878 = _1876 * 0.15915493667125701904296875;
        float _1880 = _1870 * 6.283185482025146484375;
        float _1882 = sin(_1880);
        float _1884 = 1.0 / _1874;
        float _1886 = _1878 * 6.283185482025146484375;
        float _1888 = cos(_1886);
        float _1890 = _1882 * _1884;
        float _1892 = _1878 * 6.283185482025146484375;
        float _1894 = sin(_1892);
        float _1896 = _1888 * _1890;
        float _1898 = 1.0 / _1896;
        float _1900 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1902 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1900;
        float _1904 = 1.0 / _1902;
        float _1906 = _1894 * _1898;
        float _1908 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1910 = fma(_1050, _1906, _1908);
        float _1912 = _1910 * _1904;
        float _1914 = precise::clamp(_1912, 0.0, 1.0);
        float _1916 = -_1914;
        float _1918 = _1916 + 1.0;
        _1814 = _1918;
    }
    float _1920 = _1814;
    float _1922 = -_1776;
    float _1924 = _1922 + 1.0;
    float _1926 = _1804 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1928 = -_1691;
    float _1930 = _1928 + 1.0;
    float _1932 = _1924;
    if (!_1583)
    {
        _1810 = 1.0;
    }
    float _1934 = _1810;
    float _1936 = _1934;
    if (_1583)
    {
        bool _1938 = _1703 >= _1611;
        bool _1940 = isnan(_1703);
        bool _1942 = _1938 || _1940;
        bool _1944 = isnan(_1611);
        bool _1946 = _1942 || _1944;
        float _1948 = float(_1946);
        _1936 = _1948;
    }
    float _1950 = _1936;
    float _1952 = _1924 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1954 = _1930 * _1926;
    float _1956 = precise::clamp(_1954, 0.0, 1.0);
    float _1958 = _1950;
    if (_1197)
    {
        _1932 = 1.0;
    }
    float _1960 = _1932;
    float _1962 = _1960;
    if (!_1197)
    {
        int _1964 = _1231 << 4;
        int _1966 = _1964 + 2048;
        uint _1968 = uint(int(uint(_1966) >> uint(2)));
        uint _1970 = uint(int(uint(int(_1968)) >> uint(2)));
        int _1972 = int(_1968) & 3;
        float _1974 = (*spvDescriptorSet0.vp_c15)._m0[int(_1970)][_1972];
        int _1976 = int(_1968) + 1;
        uint _1978 = uint(int(uint(_1976) >> uint(2)));
        int _1980 = _1976 & 3;
        float _1982 = (*spvDescriptorSet0.vp_c15)._m0[int(_1978)][_1980];
        int _1984 = _1966 + 8;
        uint _1986 = uint(int(uint(_1984) >> uint(2)));
        uint _1988 = uint(int(uint(int(_1986)) >> uint(2)));
        int _1990 = int(_1986) & 3;
        float _1992 = (*spvDescriptorSet0.vp_c15)._m0[int(_1988)][_1990];
        int _1994 = int(_1986) + 1;
        uint _1996 = uint(int(uint(_1994) >> uint(2)));
        int _1998 = _1994 & 3;
        float _2000 = (*spvDescriptorSet0.vp_c15)._m0[int(_1996)][_1998];
        float _2002 = _1014 * _1982;
        float _2004 = fma(_360, _1974, _2002);
        float _2006 = fma(_362, _1992, _2004);
        float _2008 = _2006 + _2000;
        float _2010 = precise::clamp(_2008, 0.0, 1.0);
        float _2012 = -_2010;
        float _2014 = _2012 + _1697;
        float _2016 = fma(_2014, 500.0, 1.5);
        float _2018 = exp2(_2016);
        float _2020 = 0.0 + _2018;
        float _2022 = precise::clamp(_2020, 0.0, 1.0);
        _1962 = _2022;
    }
    float _2024 = _1962;
    float _2026 = _1950 * _2024;
    float _2028 = _1952 * _1705;
    float _2030 = -_1956;
    float _2032 = fma(_2030, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2034 = -_1952;
    float _2036 = _2034 + 1.0;
    out.m_99.x = _964;
    out.m_99.y = _962;
    out.m_99.z = _966;
    float _2038 = _1716 * _2028;
    float _2040 = -_2026;
    float _2042 = fma(_2040, _2032, 1.0);
    float _2044 = precise::clamp(_2042, 0.0, 1.0);
    float _2046 = _1726 * _2028;
    float _2048 = _1716 * _2036;
    float _2050 = fma(_1722, _2038, _1710);
    float _2052 = fma(_1724, _2038, _1712);
    float _2054 = _2044 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2056 = fma(_1716, _2046, _1714);
    bool _2058 = _1016 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2060 = isnan(_1016);
    bool _2062 = _2058 || _2060;
    bool _2064 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2066 = _2062 || _2064;
    float _2068 = _1866 * _1920;
    out.m_101.x = _2054;
    float _2070 = _2068 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_103.x = _2050;
    out.m_103.y = _2052;
    out.m_103.z = _2056;
    out.m_103.w = _2048;
    float _2072 = _2036;
    float _2074 = _2044;
    float _2076 = _2038;
    if (!_2066)
    {
        _1816 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2078 = _1816;
    float _2080 = _2078;
    float _2082 = _2078;
    if (!_2066)
    {
        _404 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2084 = _404;
    float _2086 = _2084;
    float _2088 = _2084;
    if (!_2066)
    {
        _2072 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2090 = _2072;
    float _2092 = _2090;
    float _2094 = _2090;
    if (!_2066)
    {
        _1958 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2096 = _1958;
    float _2098 = _2096;
    float _2100 = _2096;
    if (!_2066)
    {
        _2074 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2102 = _2074;
    float _2104 = _2102;
    float _2106 = _2102;
    if (!_2066)
    {
        _2076 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2108 = _2076;
    bool _2110 = !_2066;
    float _2112 = _2108;
    float _2114 = _2108;
    if (!_2110)
    {
        bool _2116 = _1016 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2118 = isnan(_1016);
        bool _2120 = _2116 || _2118;
        bool _2122 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2124 = _2120 || _2122;
        if (!_2124)
        {
            float _2126 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2128 = _1016 + _2126;
            float _2130 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2132 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2130;
            float _2134 = 1.0 / _2132;
            float _2136 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2138 = _2136 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2140 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2142 = _2140 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2144 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2146 = _2144 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2148 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2150 = _2148 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2152 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2154 = _2152 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2156 = _2128 * _2134;
            float _2158 = precise::clamp(_2156, 0.0, 1.0);
            float _2160 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2162 = _2160 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2164 = fma(_2158, _2138, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2166 = fma(_2158, _2162, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2168 = fma(_2158, _2142, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2170 = fma(_2158, _2146, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2172 = fma(_2158, _2150, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2174 = fma(_2158, _2154, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2088 = _2166;
            _2106 = _2172;
            _2082 = _2164;
            _2100 = _2170;
            _2094 = _2168;
            _2114 = _2174;
            _2176 = true;
        }
        else
        {
            bool _2178 = _1016 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2180 = isnan(_1016);
            bool _2182 = _2178 || _2180;
            bool _2184 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2186 = _2182 || _2184;
            if (!_2186)
            {
                _2080 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2188 = _2080;
            _2082 = _2188;
            if (!_2186)
            {
                _2086 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2190 = _2086;
            _2088 = _2190;
            if (!_2186)
            {
                _2092 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2192 = _2092;
            _2094 = _2192;
            if (!_2186)
            {
                _2098 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2194 = _2098;
            _2100 = _2194;
            if (!_2186)
            {
                _2104 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2196 = _2104;
            _2106 = _2196;
            if (!_2186)
            {
                _2112 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2198 = _2112;
            bool _2200 = !_2186;
            _2114 = _2198;
            if (!_2200)
            {
                bool _2202 = _1016 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2204 = isnan(_1016);
                bool _2206 = _2202 || _2204;
                bool _2208 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2210 = _2206 || _2208;
                if (!_2210)
                {
                    float _2212 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2214 = _1016 + _2212;
                    float _2216 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2218 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2216;
                    float _2220 = 1.0 / _2218;
                    float _2222 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2224 = _2222 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2226 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2228 = _2226 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2230 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2232 = _2230 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2234 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2236 = _2234 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2238 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2240 = _2238 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2242 = _2214 * _2220;
                    float _2244 = precise::clamp(_2242, 0.0, 1.0);
                    float _2246 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2248 = _2246 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2250 = fma(_2244, _2224, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2252 = fma(_2244, _2248, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2254 = fma(_2244, _2228, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2256 = fma(_2244, _2232, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2258 = fma(_2244, _2236, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2260 = fma(_2244, _2240, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2088 = _2252;
                    _2106 = _2258;
                    _2082 = _2250;
                    _2100 = _2256;
                    _2094 = _2254;
                    _2114 = _2260;
                    _2176 = true;
                }
                else
                {
                    _2088 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2106 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2082 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2100 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2094 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2114 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2176 = false;
    float _2262 = _2088;
    float _2264 = _2106;
    float _2266 = _2082;
    float _2268 = _2100;
    float _2270 = _2094;
    float _2272 = _2114;
    float _2274 = fma(_850, -0.5, 0.5);
    float _2276 = precise::clamp(_2274, 0.0, 1.0);
    float _2278 = -_2262;
    float _2280 = _2278 + _2264;
    float _2282 = _2070 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2284 = -_2266;
    float _2286 = _2284 + _2268;
    out.m_105.x = 0.0;
    float _2288 = fma(_2276, _2280, _2262);
    float _2290 = fma(_2276, _2286, _2266);
    out.m_65.x = _2282;
    float _2292 = -_2270;
    float _2294 = _2292 + _2272;
    float _2296 = _2288 * 0.586610972881317138671875;
    bool _2298 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2300 = fma(_2276, _2294, _2270);
    float _2302 = fma(_2290, 0.298911988735198974609375, _2296);
    bool _2304 = _1866 > 0.0;
    bool _2306 = isnan(_1866);
    bool _2308 = _2304 || _2306;
    bool _2310 = isnan(0.0);
    bool _2312 = _2308 || _2310;
    float _2314 = fma(_2300, 0.114477999508380889892578125, _2302);
    bool _2316 = _1920 <= 0.0;
    bool _2318 = !_2312;
    bool _2320 = _2316 || _2318;
    float _2322 = -_2314;
    float _2324 = _2290 + _2322;
    float _2326 = -_2314;
    float _2328 = _2288 + _2326;
    float _2330 = -_2314;
    float _2332 = _2300 + _2330;
    float _2334 = fma(_2324, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2314);
    float _2336 = fma(_2328, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2314);
    float _2338 = fma(_2332, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2314);
    bool _2340 = !_2298;
    if (!_2340)
    {
        float _2342 = -_962;
        float _2344 = _2342 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2346 = -_964;
        float _2348 = _2346 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2350 = -_966;
        float _2352 = _2350 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2354 = _2344 * _2344;
        float _2356 = fma(_2348, _2348, _2354);
        float _2358 = fma(_2352, _2352, _2356);
        float _2360 = sqrt(_2358);
        float _2362 = rsqrt(_2358);
        float _2364 = -_2360;
        float _2366 = _2364 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2368 = _2366 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2370 = precise::clamp(_2368, 0.0, 1.0);
        float _2372 = _2348 * _2362;
        float _2374 = _2344 * _2362;
        float _2376 = abs(_2370);
        float _2378 = log2(_2376);
        float _2380 = _2352 * _2362;
        float _2382 = _2372 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2384 = _850 * _2374;
        float _2386 = -_2374;
        float _2388 = -_2382;
        float _2390 = fma(_2386, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2388);
        float _2392 = fma(_848, _2372, _2384);
        float _2394 = -_2380;
        float _2396 = fma(_2394, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2390);
        float _2398 = fma(_838, _2380, _2392);
        float _2400 = precise::clamp(_2398, 0.0, 1.0);
        float _2402 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2404 = _2396 + _2402;
        float _2406 = _2378 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2408 = _2404 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2410 = precise::clamp(_2408, 0.0, 1.0);
        float _2412 = exp2(_2406);
        float _2414 = _2412 * _2410;
        float _2416 = _2400 * _2414;
        float _2418 = _2416 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2420 = _2416 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2422 = _2416 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_105.x = _2418;
        out.m_105.y = _2420;
        out.m_105.z = _2422;
    }
    out.m_107.x = _2334;
    out.m_107.y = _2336;
    out.m_107.z = _2338;
    if (!_2320)
    {
        return out;
    }
    out.m_65.x = 0.0;
    float _2424 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2424;
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
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2176 = false;
    bool _914 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _121 = in.m_62.w;
    float _123 = trunc(_121);
    int _126 = int(_123);
    bool _130 = _126 >= 1;
    float _132 = 0.0;
    float _134 = as_type<float>(_126);
    if (!_130)
    {
        _132 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _132;
    if (!_130)
    {
        out.m_65.x = 0.0;
    }
    int _138 = 0;
    if (!_130)
    {
        float _140 = _136 * 5.0;
        _138 = as_type<int>(_140);
    }
    int _142 = _138;
    int _144 = _142;
    if (!_130)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2482 = as_type<float>(_142);
        out.gl_Position.z = _2482;
    }
    if (!_130)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _146 = in.m_67.w;
    bool _148 = _146 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _150 = isnan(_146);
    bool _152 = _148 || _150;
    bool _154 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _156 = _152 || _154;
    float _158 = -_146;
    float _160 = _158 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_156)
    {
        float _162 = float(_126);
        _134 = _162;
    }
    float _164 = _134;
    bool _166 = _160 >= _164;
    bool _168 = !_156;
    bool _170 = _166 || _168;
    float _172 = _164;
    if (_170)
    {
        _172 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _174 = _172;
    if (_170)
    {
        out.m_65.x = 0.0;
    }
    if (_170)
    {
        float _176 = _174 * 5.0;
        _144 = as_type<int>(_176);
    }
    int _178 = _144;
    if (_170)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2551 = as_type<float>(_178);
        out.gl_Position.z = _2551;
    }
    if (_170)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _180 = in.m_69.w;
    float _182 = _160 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _184 = in.m_67.x;
    float _186 = in.m_67.y;
    float _188 = in.m_67.z;
    bool _190 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _192 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _194 = _190 || _192;
    bool _196 = isnan(1.0);
    bool _198 = _194 || _196;
    float _200 = in.m_62.x;
    float _202 = in.m_62.y;
    float _204 = in.m_62.z;
    float _206 = in.m_71.x;
    float _208 = in.m_71.y;
    float _210 = in.m_71.z;
    float _212 = in.m_69.x;
    float _214 = in.m_69.y;
    float _216 = in.m_69.z;
    float _218 = 0.0;
    float _220 = _182;
    if (!_198)
    {
        float _222 = _182 * _182;
        float _224 = _222 * 0.5;
        _218 = _224;
    }
    float _226 = _218;
    float _228 = _226;
    if (!_198)
    {
        float _230 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _228 = _230;
    }
    float _232 = _228;
    bool _234 = !_198;
    float _236 = _232;
    if (!_234)
    {
        float _238 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _240 = log2(_238);
        float _242 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _244 = _242 + 1.0;
        float _246 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _248 = _182 * _240;
        float _250 = exp2(_248);
        float _252 = _246 * 0.693147182464599609375;
        float _254 = 1.0 / _252;
        float _256 = 1.0 / _244;
        float _258 = _250 + (-1.0);
        float _260 = -_258;
        float _262 = fma(_260, _254, _182);
        float _264 = _262 * _256;
        float _266 = _264 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _236 = _266;
    }
    float _268 = _236;
    bool _270 = !_198;
    if (!_270)
    {
        float _272 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _274 = log2(_272);
        float _276 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _278 = _276 + 1.0;
        float _280 = 1.0 / _278;
        float _282 = _182 * _274;
        float _284 = exp2(_282);
        float _286 = -_284;
        float _288 = _286 + 1.0;
        float _290 = _288 * _280;
        _220 = _290;
    }
    float _292 = _220;
    float _294 = _212 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _296 = _216 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _298 = _214 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _300 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _208);
    float _302 = _294 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _304 = _268 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _306 = _298 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _308 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _206);
    float _310 = _296 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _312 = fma(_292, _186, _304);
    float _314 = _268 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _316 = _268 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _318 = _300 * _306;
    float _320 = fma(_312, _180, _202);
    float _322 = fma(_292, _184, _314);
    float _324 = fma(_292, _188, _316);
    float _326 = _308 * _302;
    float _328 = _320 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _330 = fma(_322, _180, _200);
    float _332 = _320 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _334 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _210);
    float _336 = _318 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _338 = fma(_324, _180, _204);
    float _340 = _318 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _342 = fma(_330, (*spvDescriptorSet0.vp_c10)._m0[4].x, _328);
    float _344 = fma(_330, (*spvDescriptorSet0.vp_c10)._m0[6].x, _332);
    float _346 = _334 * _310;
    float _348 = fma(_326, (*spvDescriptorSet0.vp_c10)._m0[8].x, _336);
    float _350 = fma(_326, (*spvDescriptorSet0.vp_c10)._m0[10].x, _340);
    float _352 = fma(_338, (*spvDescriptorSet0.vp_c10)._m0[4].z, _342);
    float _354 = fma(_338, (*spvDescriptorSet0.vp_c10)._m0[6].z, _344);
    float _356 = fma(_346, (*spvDescriptorSet0.vp_c10)._m0[8].z, _348);
    float _358 = fma(_346, (*spvDescriptorSet0.vp_c10)._m0[10].z, _350);
    float _360 = _352 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _362 = _354 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _364 = _360 + _356;
    float _366 = _362 + _358;
    float _368 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _370 = _364 + _368;
    float _372 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _374 = _366 + _372;
    float _376 = _370 * _370;
    float _378 = _374 * _374;
    float _380 = _376 + _378;
    float _382 = sqrt(_380);
    bool _384 = _382 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _386 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _388 = _382 + _386;
    float _390 = _354;
    float _392 = _320;
    float _394 = _356;
    float _396 = _364;
    float _398 = _380;
    float _400 = _376;
    float _402 = _378;
    float _404 = _362;
    if (_384)
    {
        float _406 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _390 = _406;
    }
    float _408 = _390;
    float _410 = _408;
    if (_384)
    {
        float _412 = _388 * _408;
        _410 = _412;
    }
    float _414 = _410;
    float _416 = _320 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    if (!_384)
    {
        _392 = _366;
    }
    float _418 = _392;
    float _420 = _418;
    if (_384)
    {
        float _422 = _414 * 0.15915493667125701904296875;
        _394 = _422;
    }
    float _424 = _394;
    float _426 = fma(_330, (*spvDescriptorSet0.vp_c10)._m0[5].x, _416);
    float _428 = _318 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _430 = fma(_338, (*spvDescriptorSet0.vp_c10)._m0[5].z, _426);
    float _432 = _424;
    if (_384)
    {
        float _434 = _424 * 6.283185482025146484375;
        float _436 = sin(_434);
        _432 = _436;
    }
    float _438 = _432;
    float _440 = fma(_326, (*spvDescriptorSet0.vp_c10)._m0[9].x, _428);
    float _442 = _430 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _444 = fma(_346, (*spvDescriptorSet0.vp_c10)._m0[9].z, _440);
    float _446 = _430;
    if (_384)
    {
        float _448 = rsqrt(_380);
        _446 = _448;
    }
    float _450 = _446;
    float _452 = _442 + _444;
    float _454 = _452;
    if (_384)
    {
        float _456 = _452 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _454 = _456;
    }
    float _458 = _454;
    float _460 = _458;
    if (_384)
    {
        float _462 = fma(_438, _458, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _460 = _462;
    }
    float _464 = _460;
    float _466 = _450;
    if (_384)
    {
        float _468 = _450 * _464;
        _466 = _468;
    }
    float _470 = _466;
    if (_384)
    {
        float _472 = fma(_370, _470, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _396 = _472;
    }
    float _474 = _396;
    if (_384)
    {
        float _476 = fma(_374, _470, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _420 = _476;
    }
    float _478 = _420;
    float _480 = fma(_474, 6.2500002968590706586837768554688e-05, 0.5);
    float _482 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _484 = _474 + _482;
    float _486 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _488 = _478 + _486;
    float _490 = fma(_478, 6.2500002968590706586837768554688e-05, 0.5);
    float _492 = fma(_484, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _494 = fma(_488, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _3073 = float2(_480, _490);
    float _496 = dm_bs(spvDescriptorSet0.vp_t_tcb_2C.sample(spvDescriptorSet0.vp_t_tcb_2CSmplr, select(_3073, float2(0.0), isnan(_3073)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_2C, spvDescriptorSet0.vp_t_tcb_2CSmplr_w, select(_3073, float2(0.0), isnan(_3073)), level(0.0)).y;
    float2 _3083 = float2(_492, _494);
    float _498 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_3083, float2(0.0), isnan(_3083)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_3083, float2(0.0), isnan(_3083)), level(0.0)).x;
    float _500 = in.m_73.y;
    float _502 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _504 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _506 = _504 != 0;
    float _508 = in.m_75.w;
    int _510 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _512 = _510 != 0;
    int _514 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _516 = _514 != 0;
    float _518 = in.m_73.x;
    float _520 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _522 = _318;
    float _524 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    float _526 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    float _528 = _520;
    if (!_506)
    {
        float _530 = in.m_75.z;
        _522 = _530;
    }
    float _532 = _522;
    float _534 = _502 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _536 = _374;
    if (_512)
    {
        float _538 = in.m_75.z;
        _536 = _538;
    }
    float _540 = _536;
    if (!_506)
    {
        float _542 = in.m_75.y;
        _524 = _542;
    }
    float _544 = _524;
    float _546 = -_500;
    float _548 = _546 + 1.0;
    bool _550 = _508 > 0.5;
    float _552 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _554 = _500;
    if (_516)
    {
        float _556 = _550 ? _548 : _500;
        _554 = _556;
    }
    float _558 = _554;
    bool _560 = _208 != 0.0;
    bool _562 = isnan(_208);
    bool _564 = _560 || _562;
    bool _566 = isnan(0.0);
    bool _568 = _564 || _566;
    float _570 = _518;
    if (_512)
    {
        _398 = _518;
    }
    float _572 = _398;
    float _574 = fma(_534, _558, -0.5);
    float _576 = _572;
    float _578 = _532;
    if (!_506)
    {
        _526 = _532;
    }
    float _580 = _526;
    float _582 = in.m_77.x;
    float _584 = in.m_77.y;
    float _586 = in.m_77.z;
    bool _588 = _206 == 0.0;
    bool _590 = !_568;
    bool _592 = _588 && _590;
    float _594 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _596 = _540 > 0.5;
    bool _598 = _596 && _512;
    float _600 = _544;
    float _602 = _580;
    if (_506)
    {
        float _604 = in.m_75.x;
        float _606 = in.m_75.y;
        _600 = _604;
        _602 = _606;
    }
    float _608 = _600;
    float _610 = _602;
    float _612 = _552 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _614 = _210 == 0.0;
    bool _616 = _614 && _592;
    float _618 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    if (_598)
    {
        float _620 = -_572;
        float _622 = _620 + 1.0;
        _576 = _622;
    }
    float _624 = _576;
    if (_512)
    {
        _570 = _624;
    }
    float _626 = _570;
    float _628 = 0.0;
    if (_616)
    {
        _628 = _582;
    }
    float _630 = _628;
    float _632 = fma(_612, _626, -0.5);
    float _634 = 0.0;
    float _636 = _630;
    if (_616)
    {
        _634 = _584;
    }
    float _638 = _634;
    float _640 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _642 = fma(_608, (*spvDescriptorSet0.vp_c9)._m0[83].z, _594);
    float _644 = _608 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _646 = _638;
    if (_506)
    {
        _578 = _610;
    }
    float _648 = _578;
    float _650 = _610 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _652 = 0.0;
    float _654 = _650;
    if (_616)
    {
        _652 = _630;
    }
    float _656 = _652;
    float _658 = -_618;
    float _660 = fma(_644, 2.0, _658);
    float _662 = _656;
    if (!_616)
    {
        _636 = _582;
    }
    float _664 = _636;
    float _666 = in.m_79.x;
    float _668 = in.m_79.y;
    float _670 = in.m_79.z;
    float _672 = in.m_79.w;
    float _674 = fma(_650, -2.0, _640);
    float _676 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[83].w, _520);
    float _678 = 0.0;
    if (_616)
    {
        _678 = _586;
    }
    float _680 = _678;
    float _682 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[82].z, _642);
    float _684 = _680;
    if (_616)
    {
        _654 = _638;
    }
    float _686 = _654;
    float _688 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[81].y, _674);
    float _690 = -_160;
    float _692 = fma(_690, (*spvDescriptorSet0.vp_c9)._m0[81].x, _660);
    float _694 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[82].w, _676);
    float _696 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _698 = _686;
    if (!_616)
    {
        _646 = _584;
    }
    float _700 = _646;
    float _702 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    if (_616)
    {
        _528 = _680;
    }
    float _704 = _528;
    float _706 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _708 = _704;
    if (!_616)
    {
        float _710 = fma(_208, (*spvDescriptorSet0.vp_c9)._m0[17].y, _700);
        _698 = _710;
    }
    float _712 = _698;
    if (!_616)
    {
        _684 = _586;
    }
    float _714 = _684;
    float _716 = _696 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _718 = _702 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _720 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _722 = _706 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _724 = _668 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _726 = _668 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _728 = _668 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    if (!_616)
    {
        float _730 = fma(_210, (*spvDescriptorSet0.vp_c9)._m0[17].y, _714);
        _708 = _730;
    }
    float _732 = _708;
    float _734 = fma(_666, (*spvDescriptorSet0.vp_c10)._m0[10].x, _724);
    float _736 = fma(_666, (*spvDescriptorSet0.vp_c10)._m0[8].x, _726);
    float _738 = fma(_666, (*spvDescriptorSet0.vp_c10)._m0[9].x, _728);
    if (!_616)
    {
        float _740 = fma(_206, (*spvDescriptorSet0.vp_c9)._m0[17].y, _664);
        _662 = _740;
    }
    float _742 = _662;
    float _744 = fma(_670, (*spvDescriptorSet0.vp_c10)._m0[10].z, _734);
    float _746 = _670 * _664;
    float _748 = fma(_670, (*spvDescriptorSet0.vp_c10)._m0[8].z, _736);
    float _750 = fma(_670, (*spvDescriptorSet0.vp_c10)._m0[9].z, _738);
    float _752 = _712 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _754 = _668 * _714;
    float _756 = -_746;
    float _758 = fma(_666, _714, _756);
    out.m_81.x = _716;
    out.m_81.y = _718;
    out.m_81.z = _722;
    out.m_81.w = _720;
    float _760 = _666 * _700;
    float _762 = -_754;
    float _764 = fma(_670, _700, _762);
    float _766 = fma(_682, _632, _692);
    out.m_83.x = _748;
    out.m_83.y = _750;
    out.m_83.z = _744;
    float _768 = -_760;
    float _770 = fma(_668, _664, _768);
    float _772 = _764 * _672;
    float _774 = -_688;
    float _776 = fma(_694, _574, _774);
    float _778 = _712 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _780 = _770 * _672;
    float _782 = _712 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _784 = _776 + 0.5;
    float _786 = fma(_742, (*spvDescriptorSet0.vp_c10)._m0[9].x, _778);
    float _788 = fma(_742, (*spvDescriptorSet0.vp_c10)._m0[8].x, _752);
    float _790 = _758 * _672;
    float _792 = _766 + 0.5;
    float _794 = fma(_742, (*spvDescriptorSet0.vp_c10)._m0[10].x, _782);
    float _796 = _790 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _798 = _790 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _800 = _790 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _802 = _790;
    float _804 = _780;
    if (_384)
    {
        float _806 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _808 = _474 + _806;
        _802 = _808;
    }
    float _810 = _802;
    float _812 = fma(_772, (*spvDescriptorSet0.vp_c10)._m0[8].x, _796);
    float _814 = fma(_772, (*spvDescriptorSet0.vp_c10)._m0[9].x, _798);
    float _816 = fma(_772, (*spvDescriptorSet0.vp_c10)._m0[10].x, _800);
    float _818 = fma(_780, (*spvDescriptorSet0.vp_c10)._m0[8].z, _812);
    float _820 = fma(_780, (*spvDescriptorSet0.vp_c10)._m0[9].z, _814);
    float _822 = fma(_780, (*spvDescriptorSet0.vp_c10)._m0[10].z, _816);
    float _824 = _822;
    if (_384)
    {
        float _826 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _828 = _478 + _826;
        _804 = _828;
    }
    float _830 = _804;
    float _832 = in.m_85.y;
    if (_384)
    {
        float _834 = _810 * _810;
        _400 = _834;
    }
    float _836 = _400;
    float _838 = fma(_732, (*spvDescriptorSet0.vp_c10)._m0[10].z, _794);
    if (_384)
    {
        float _840 = _830 * _830;
        _402 = _840;
    }
    float _842 = _402;
    out.m_87.x = _818;
    out.m_87.y = _820;
    out.m_87.z = _822;
    float _844 = in.m_85.x;
    float _846 = in.m_85.z;
    out.m_89.z = _792;
    out.m_89.w = _784;
    out.m_91.y = _832;
    float _848 = fma(_732, (*spvDescriptorSet0.vp_c10)._m0[8].z, _788);
    float _850 = fma(_732, (*spvDescriptorSet0.vp_c10)._m0[9].z, _786);
    out.m_91.x = _844;
    out.m_91.z = _846;
    out.m_93.x = _848;
    out.m_93.y = _850;
    out.m_93.z = _838;
    float _852 = fma(_496, 2000.0, (*spvDescriptorSet0.vp_c13)._m0[0].x);
    float _854 = in.m_85.w;
    float _856 = fma(_498, 100.0, _852);
    float _858 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _860 = _856 + _858;
    float _862 = fma(_860, _860, _836);
    float _864 = _862 + _842;
    float _866 = sqrt(_864);
    out.m_91.w = _854;
    bool _868 = _866 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _870 = isnan(_866);
    bool _872 = _868 || _870;
    bool _874 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _876 = _872 || _874;
    float _878 = _864;
    if (!_876)
    {
        _824 = 1.0;
    }
    float _880 = _824;
    bool _882 = !_876;
    float _884 = _880;
    if (!_882)
    {
        bool _886 = _866 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _888 = isnan(_866);
        bool _890 = _886 || _888;
        bool _892 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _894 = _890 || _892;
        if (!_894)
        {
            float _896 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _898 = _866 + _896;
            float _900 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _902 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _900;
            float _904 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _906 = _904 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _908 = 1.0 / _902;
            float _910 = _898 * _908;
            float _912 = fma(_910, _906, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _884 = _912;
            _914 = true;
        }
        else
        {
            bool _916 = _866 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _918 = isnan(_866);
            bool _920 = _916 || _918;
            bool _922 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _924 = _920 || _922;
            if (!_924)
            {
                float _926 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _928 = _866 + _926;
                float _930 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _932 = _930 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _934 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _936 = _934 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _938 = 1.0 / _932;
                float _940 = _928 * _938;
                float _942 = fma(_940, _936, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _884 = _942;
                _914 = true;
            }
            else
            {
                _884 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _914 = false;
    float _944 = _884;
    float _946 = _442 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _948 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _950 = _856 + _948;
    float _952 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _954 = _474 + _952;
    float _956 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _958 = _478 + _956;
    float _960 = fma(_360, (*spvDescriptorSet0.vp_c8)._m0[11].x, _946);
    float _962 = fma(_950, _944, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _964 = fma(_954, _944, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _966 = fma(_958, _944, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _968 = fma(_362, (*spvDescriptorSet0.vp_c8)._m0[11].z, _960);
    float _970 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _972 = _962 + _970;
    float _974 = _442 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _976 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _978 = _964 + _976;
    float _980 = _968 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _982 = _972 * _972;
    float _984 = fma(_360, (*spvDescriptorSet0.vp_c8)._m0[10].x, _974);
    float _986 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _988 = _966 + _986;
    float _990 = 1.0 / _980;
    float _992 = fma(_978, _978, _982);
    float _994 = fma(_362, (*spvDescriptorSet0.vp_c8)._m0[10].z, _984);
    float _996 = _962 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _998 = fma(_988, _988, _992);
    float _1000 = _994 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1002 = fma(_964, (*spvDescriptorSet0.vp_c8)._m0[3].x, _996);
    float _1004 = rsqrt(_998);
    float _1006 = _1000 + _980;
    float _1008 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1010 = _1006 * _990;
    float _1012 = _1010 * 0.5;
    float _1014 = _442 + _1008;
    float _1016 = sqrt(_998);
    float _1018 = fma(_362, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1020 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1022 = fma(_1012, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1020);
    float _1024 = _1004 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1026 = 1.0 / _1022;
    float _1028 = _1014 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1030 = _978 * _1024;
    float _1032 = _988 * _1024;
    float _1034 = fma(_360, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1028);
    float _1036 = _1030 * _1030;
    float _1038 = _1032 * _1032;
    float _1040 = fma(_362, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1034);
    float _1042 = floor(_1018);
    float _1044 = _1036 + _1038;
    float _1046 = _1040 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1048 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1050 = _1026 * _1048;
    float _1052 = _1014 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1054 = sqrt(_1044);
    bool _1056 = _1050 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1058 = fma(_360, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1052);
    bool _1060 = _1050 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1062 = fma(_362, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1058);
    float _1064 = trunc(_1046);
    int _1066 = int(_1064);
    float _1068 = -_1042;
    float _1070 = _1018 + _1068;
    float _1072 = _1062 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    bool _1074 = !_1056;
    int _1076 = _1074 ? 0 : 1;
    bool _1078 = _1054 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1080 = trunc(_1072);
    int _1082 = int(_1080);
    int _1084 = 2;
    float _1086 = _1030;
    float _1088 = _1036;
    float _1090 = _1032;
    float _1092 = _1002;
    if (!_1056)
    {
        _1084 = 1;
    }
    int _1094 = _1084;
    float _1096 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1098 = _1054 + _1096;
    int _1100 = _1094;
    float _1102 = _1098;
    if (!_1060)
    {
        _1100 = _1076;
    }
    int _1104 = _1100;
    int _1106 = _1104 << 6;
    int _1108 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1110 = _1066 + _1108;
    int _1112 = _1110 + 1;
    int _1114 = _1106 + 96;
    uint _1117 = uint(int(uint(_1114) >> uint(2)));
    uint _1119 = uint(int(uint(int(_1117)) >> uint(2)));
    int _1121 = int(_1117) & 3;
    float _1123 = (*spvDescriptorSet0.vp_c15)._m0[int(_1119)][_1121];
    int _1125 = int(_1117) + 1;
    uint _1127 = uint(int(uint(_1125) >> uint(2)));
    int _1129 = _1125 & 3;
    float _1131 = (*spvDescriptorSet0.vp_c15)._m0[int(_1127)][_1129];
    float _1133 = _856;
    float _1135 = as_type<float>(_1104);
    if (_1078)
    {
        float _1137 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1133 = _1137;
    }
    float _1139 = _1133;
    float _1141 = 0.0;
    if (!_1078)
    {
        _1141 = _1038;
    }
    float _1143 = _1141;
    int _1145 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1147 = _1082 + _1145;
    int _1149 = _1147 + 1;
    float _1151 = _962 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    int _1153 = _1106 + 104;
    uint _1155 = uint(int(uint(_1153) >> uint(2)));
    uint _1157 = uint(int(uint(int(_1155)) >> uint(2)));
    int _1159 = int(_1155) & 3;
    float _1161 = (*spvDescriptorSet0.vp_c15)._m0[int(_1157)][_1159];
    int _1163 = int(_1155) + 1;
    uint _1165 = uint(int(uint(_1163) >> uint(2)));
    int _1167 = _1163 & 3;
    float _1169 = (*spvDescriptorSet0.vp_c15)._m0[int(_1165)][_1167];
    bool _1171 = _1149 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1173 = fma(_964, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1151);
    int _1175 = _1149 | _1112;
    float _1177 = fma(_966, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1173);
    bool _1179 = _1175 < 0;
    bool _1181 = _1179 || _1171;
    float _1183 = _1177;
    int _1185 = _1149;
    float _1187 = _1143;
    if (_1078)
    {
        float _1189 = _1098 * _1139;
        _1102 = _1189;
    }
    float _1191 = _1102;
    float _1193 = _1177 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _1195 = _1112 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1197 = _1195 || _1181;
    if (_1078)
    {
        float _1199 = rsqrt(_1044);
        _1183 = _1199;
    }
    float _1201 = _1183;
    float _1203 = _1201;
    if (_1078)
    {
        float _1205 = _1191 * 0.15915493667125701904296875;
        _878 = _1205;
    }
    float _1207 = _878;
    float _1209 = _1193 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1211 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1213 = _852;
    if (_1078)
    {
        float _1215 = _1207 * 6.283185482025146484375;
        float _1217 = sin(_1215);
        _1213 = _1217;
    }
    float _1219 = _1213;
    float _1221 = precise::max(0.0, _1211);
    float _1223 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1225 = _1223;
    if (!_1197)
    {
        int _1227 = _1112 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1229 = _1227 + _1149;
        _1185 = _1229;
    }
    int _1231 = _1185;
    float _1233 = _1139;
    if (_1078)
    {
        float _1235 = _1207 * 6.283185482025146484375;
        float _1237 = cos(_1235);
        _1233 = _1237;
    }
    float _1239 = _1233;
    float _1241 = -_1024;
    float _1243 = -_1221;
    float _1245 = fma(_972, _1241, _1243);
    float _1247 = -_1209;
    float _1249 = fma(_1247, _1223, 1.0);
    int _1251 = 0;
    float _1253 = _1245;
    if (!_1197)
    {
        int _1255 = _1231 << 2;
        _1251 = _1255;
    }
    int _1257 = _1251;
    int _1259 = _1257;
    if (_1078)
    {
        float _1261 = _1245 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1225 = _1261;
    }
    float _1263 = _1225;
    int _1265 = 0;
    float _1267 = _1263;
    if (!_1197)
    {
        uint _1269 = uint(int(uint(_1231) >> uint(2)));
        _1265 = int(_1269);
    }
    int _1271 = _1265;
    if (!_1197)
    {
        int _1273 = 12 & _1257;
        _1259 = _1273;
    }
    int _1275 = _1259;
    if (_1078)
    {
        float _1277 = fma(_1219, _1263, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1267 = _1277;
    }
    float _1279 = _1267;
    int _1281 = _1106 + 56;
    uint _1283 = uint(int(uint(_1281) >> uint(2)));
    uint _1285 = uint(int(uint(int(_1283)) >> uint(2)));
    int _1287 = int(_1283) & 3;
    float _1289 = (*spvDescriptorSet0.vp_c15)._m0[int(_1285)][_1287];
    int _1291 = int(_1283) + 1;
    uint _1293 = uint(int(uint(_1291) >> uint(2)));
    int _1295 = _1291 & 3;
    float _1297 = (*spvDescriptorSet0.vp_c15)._m0[int(_1293)][_1295];
    float _1299 = log2(_1249);
    float _1301 = _1014 * _1131;
    float _1303 = _1131;
    if (_1078)
    {
        float _1305 = _1201 * _1279;
        _1203 = _1305;
    }
    float _1307 = _1203;
    if (_1078)
    {
        float _1309 = _1239 + (-1.0);
        _1303 = _1309;
    }
    float _1311 = _1303;
    float _1313 = fma(_360, _1123, _1301);
    int _1315 = _1106 + 48;
    uint _1317 = uint(int(uint(_1315) >> uint(2)));
    uint _1319 = uint(int(uint(int(_1317)) >> uint(2)));
    int _1321 = int(_1317) & 3;
    float _1323 = (*spvDescriptorSet0.vp_c15)._m0[int(_1319)][_1321];
    int _1325 = int(_1317) + 1;
    uint _1327 = uint(int(uint(_1325) >> uint(2)));
    int _1329 = _1325 & 3;
    float _1331 = (*spvDescriptorSet0.vp_c15)._m0[int(_1327)][_1329];
    float _1333 = _1311;
    if (_1078)
    {
        float _1335 = _1030 * _1307;
        _1086 = _1335;
    }
    float _1337 = _1086;
    if (_1078)
    {
        float _1339 = _1311 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1333 = _1339;
    }
    float _1341 = _1333;
    float _1343 = fma(_362, _1161, _1313);
    if (_1078)
    {
        float _1345 = _1337 * _1337;
        _1088 = _1345;
    }
    float _1347 = _1088;
    if (_1078)
    {
        float _1349 = fma(_1245, _1239, _1341);
        _1253 = _1349;
    }
    float _1351 = _1253;
    if (_1078)
    {
        float _1353 = _1032 * _1307;
        _1090 = _1353;
    }
    float _1355 = _1090;
    int _1357 = _1106 + 64;
    uint _1359 = uint(int(uint(_1357) >> uint(2)));
    uint _1361 = uint(int(uint(int(_1359)) >> uint(2)));
    int _1363 = int(_1359) & 3;
    float _1365 = (*spvDescriptorSet0.vp_c15)._m0[int(_1361)][_1363];
    int _1367 = int(_1359) + 1;
    uint _1369 = uint(int(uint(_1367) >> uint(2)));
    int _1371 = _1367 & 3;
    float _1373 = (*spvDescriptorSet0.vp_c15)._m0[int(_1369)][_1371];
    float _1375 = fma(_360, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1377 = fma(_1351, _1351, _1347);
    float _1379 = _962 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1381 = _962 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    if (_1078)
    {
        float _1383 = _1355 * _1355;
        _1187 = _1383;
    }
    float _1385 = _1187;
    float _1387 = fma(_964, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1379);
    int _1389 = _1106 + 72;
    uint _1391 = uint(int(uint(_1389) >> uint(2)));
    uint _1393 = uint(int(uint(int(_1391)) >> uint(2)));
    int _1395 = int(_1391) & 3;
    float _1397 = (*spvDescriptorSet0.vp_c15)._m0[int(_1393)][_1395];
    int _1399 = int(_1391) + 1;
    uint _1401 = uint(int(uint(_1399) >> uint(2)));
    int _1403 = _1399 & 3;
    float _1405 = (*spvDescriptorSet0.vp_c15)._m0[int(_1401)][_1403];
    float _1407 = fma(_964, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1381);
    float _1409 = _1377 + _1385;
    float _1411 = fma(_966, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1387);
    float _1413 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1415 = fma(_1016, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1413);
    float _1417 = precise::clamp(_1415, 0.0, 1.0);
    float _1419 = fma(_966, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1407);
    float _1421 = fma(_966, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1002);
    float _1423 = _1411 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    int _1425 = _1106 + 80;
    uint _1427 = uint(int(uint(_1425) >> uint(2)));
    uint _1429 = uint(int(uint(int(_1427)) >> uint(2)));
    int _1431 = int(_1427) & 3;
    float _1433 = (*spvDescriptorSet0.vp_c15)._m0[int(_1429)][_1431];
    int _1435 = int(_1427) + 1;
    uint _1437 = uint(int(uint(_1435) >> uint(2)));
    int _1439 = _1435 & 3;
    float _1441 = (*spvDescriptorSet0.vp_c15)._m0[int(_1437)][_1439];
    float _1443 = -_1417;
    float _1445 = _1443 + 1.0;
    float _1447 = _1419 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1449 = _1423 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1451 = _1343 + _1169;
    if (!_1197)
    {
        int _1453 = _1271 << 4;
        int _1455 = _1453 + _1275;
        _1092 = as_type<float>(_1455);
    }
    float _1457 = _1092;
    float _1459 = _1421 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1461 = fma(_1447, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1449);
    int _1463 = _1106 + 88;
    uint _1465 = uint(int(uint(_1463) >> uint(2)));
    uint _1467 = uint(int(uint(int(_1465)) >> uint(2)));
    int _1469 = int(_1465) & 3;
    float _1471 = (*spvDescriptorSet0.vp_c15)._m0[int(_1467)][_1469];
    int _1473 = int(_1465) + 1;
    uint _1475 = uint(int(uint(_1473) >> uint(2)));
    int _1477 = _1473 & 3;
    float _1479 = (*spvDescriptorSet0.vp_c15)._m0[int(_1475)][_1477];
    float _1481 = rsqrt(_1409);
    float _1483 = _1299 * 0.693147182464599609375;
    float _1485 = fma(_1193, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1461);
    float _1487 = fma(_1459, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1485);
    float _1489 = _1457;
    if (!_1197)
    {
        int _1491 = as_type<int>(_1457) + 400;
        uint _1493 = uint(int(uint(_1491) >> uint(2)));
        uint _1495 = uint(int(uint(int(_1493)) >> uint(2)));
        int _1497 = int(_1493) & 3;
        float _1499 = (*spvDescriptorSet0.vp_c15)._m0[int(_1495)][_1497];
        _1489 = _1499;
    }
    float _1501 = _1489;
    float _1503 = 1.0 / _1451;
    float _1505 = _1014 * _1331;
    float _1507 = _1481 * _1337;
    float _1509 = abs(_1445);
    float _1511 = log2(_1509);
    float _1513 = _1481 * _1351;
    float _1515 = fma(_360, _1323, _1505);
    float _1517 = _1507 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1519 = _1481 * _1355;
    float _1521 = _1014 * _1373;
    float _1523 = fma(_362, _1289, _1515);
    float _1525 = 1.0 / _1487;
    float _1527 = fma(_360, _1365, _1521);
    float _1529 = _1523 + _1297;
    float _1531 = -_1517;
    float _1533 = fma(_1513, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1531);
    float _1535 = fma(_362, _1397, _1527);
    float _1537 = _1529 * _1503;
    float _1539 = _1297;
    float _1541 = _1507;
    if (!_1197)
    {
        float _1543 = floor(_1046);
        _1539 = _1543;
    }
    float _1545 = _1539;
    float _1547 = -_1519;
    float _1549 = fma(_1547, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1533);
    float _1551 = _1535 + _1405;
    float _1553 = _1511 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    bool _1555 = _1537 >= 0.0;
    float _1557 = fma(_1549, -0.5, 0.5);
    float _1559 = _1551 * _1503;
    float _1561 = _1014 * _1441;
    bool _1563 = _1537 <= 1.0;
    bool _1565 = _1563 && _1555;
    float _1567 = fma(_1549, 0.5, 0.5);
    float _1569 = fma(_360, _1433, _1561);
    bool _1571 = _1559 >= 0.0;
    bool _1573 = _1571 && _1565;
    float _1575 = exp2(_1553);
    float _1577 = _1423 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1579 = fma(_362, _1471, _1569);
    bool _1581 = _1559 <= 1.0;
    bool _1583 = _1581 && _1573;
    float _1585 = fma(_1567, -0.0187292993068695068359375, 0.07426099479198455810546875);
    if (!_1197)
    {
        float _1587 = -_1545;
        float _1589 = _1046 + _1587;
        _1541 = _1589;
    }
    float _1591 = _1541;
    float _1593 = _1579 + _1479;
    float _1595 = fma(_1447, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1577);
    float _1597 = fma(_1567, _1585, -0.212114393711090087890625);
    float _1599 = sqrt(_1557);
    float _1601 = _1423 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1603 = _1513 + 1.0;
    float _1605 = fma(_1567, _1597, 1.570728778839111328125);
    float _1607 = fma(_1193, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1595);
    float _1609 = fma(_1447, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1601);
    float _1611 = _1593 * _1503;
    float _1613 = _1605;
    if (_1583)
    {
        float _1615 = float(_1104);
        _1135 = _1615;
    }
    float _1617 = _1135;
    float _1619 = floor(_1375);
    float _1621 = fma(_1193, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1609);
    float _1623 = -_1513;
    float _1625 = fma(_1575, _1603, _1623);
    float _1627 = fma(_1459, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1607);
    float _1629 = fma(_1459, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1621);
    float _1631 = _1627 * _1525;
    float _1633 = _1519;
    float _1635 = _1629;
    if (!_1197)
    {
        float _1637 = floor(_1072);
        _1633 = _1637;
    }
    float _1639 = _1633;
    float _1641 = _1599 * 0.636619746685028076171875;
    float _1643 = _1629 * _1525;
    float _1645 = fma(_1631, 0.5, 0.5);
    float _1647 = -_1605;
    float _1649 = fma(_1641, _1647, 1.0);
    float _1651 = _1471;
    if (!_1197)
    {
        float _1653 = rint(_1501);
        float _1655 = precise::max(_1653, 0.0);
        uint _1657 = uint(_1655);
        uint _1659 = clamp(_1657, 0u, 65535u);
        _1651 = as_type<float>(_1659);
    }
    float _1661 = _1651;
    float _1663 = -_1619;
    float _1665 = _1375 + _1663;
    float _1667 = fma(_1643, -0.5, 0.5);
    float _1669 = fma(_1625, 0.5, 0.5);
    float _1671 = _1609;
    if (_1583)
    {
        float _1673 = rint(_1617);
        float _1675 = precise::max(_1673, 0.0);
        uint _1677 = uint(_1675);
        uint _1679 = clamp(_1677, 0u, 65535u);
        _1671 = as_type<float>(_1679);
    }
    float _1681 = _1671;
    if (!_1197)
    {
        float _1683 = -_1639;
        float _1685 = _1072 + _1683;
        _1613 = _1685;
    }
    float _1687 = _1613;
    float _1689 = _1483 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float2 _5124 = float2(_1665, _1070);
    float _1691 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5124, float2(0.0), isnan(_5124)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5124, float2(0.0), isnan(_5124)), level(0.0)).x;
    float _1693 = _1483;
    if (!_1197)
    {
        float3 _5139 = float3(_1687, _1591, float(as_type<int>(_1661)));
        float3 _5143 = select(_5139, float3(0.0), isnan(_5139));
        float _1695 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5143.xy, uint(rint(_5143.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5143.xy, uint(rint(_5143.z)), level(0.0)).x;
        _1693 = _1695;
    }
    float _1697 = _1693;
    float _1699 = _1559;
    if (_1583)
    {
        float3 _5158 = float3(_1537, _1559, float(as_type<int>(_1681)));
        float3 _5160 = select(_5158, float3(0.0), isnan(_5158));
        float _1701 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5160.xy, uint(rint(_5160.z)), _1611, level(0.0));
        _1699 = _1701;
    }
    float _1703 = _1699;
    float3 _5170 = float3(_1645, _1667, _1689);
    float _1705 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5170, float3(0.0), isnan(_5170)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5170, float3(0.0), isnan(_5170)), level(0.0)).x;
    float3 _5179 = float3(_1645, _1667, _1689);
    float4 _1708 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5179, float3(0.0), isnan(_5179)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5179, float3(0.0), isnan(_5179)), level(0.0)).xyzw;
    float _1710 = _1708.x;
    float _1712 = _1708.y;
    float _1714 = _1708.z;
    float _1716 = _1708.w;
    float2 _5195 = float2(_1649, _1669);
    float3 _1720 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5195, float2(0.0), isnan(_5195)), level(0.0)), spvDescriptorSet0.dm_border, 6u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5195, float2(0.0), isnan(_5195)), level(0.0)).xyz;
    float _1722 = _1720.x;
    float _1724 = _1720.y;
    float _1726 = _1720.z;
    float _1728 = abs(_1050);
    float _1730 = log2(_1728);
    float _1732 = _1423 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1734 = _1511 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1736 = fma(_1447, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1732);
    float _1738 = fma(_1193, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1736);
    float _1740 = _1627 + _1487;
    float _1742 = fma(_1459, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1738);
    float _1744 = _1487 * 0.5;
    float _1746 = _1730 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1748 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _1750 = _1742 + _1748;
    float _1752 = fma(_1629, -0.5, _1744);
    float _1754 = _1740 * 0.5;
    float _1756 = _1487 + _1750;
    float _1758 = exp2(_1746);
    out.gl_Position.x = _1627;
    out.gl_Position.y = _1629;
    out.gl_Position.z = _1750;
    out.gl_Position.w = _1487;
    float _1760 = _1756 * 0.5;
    out.m_95.x = _1754;
    out.m_95.y = _1752;
    out.m_95.z = _1760;
    out.m_95.w = _1487;
    bool _1762 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1764 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1766 = _1762 || _1764;
    bool _1768 = isnan(0.5);
    bool _1770 = _1766 || _1768;
    out.m_97.z = _1760;
    out.m_97.w = _1487;
    float _1772 = fma(_1758, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1774 = precise::clamp(_1772, 0.0, 1.0);
    float _1776 = exp2(_1734);
    bool _1778 = _1050 <= 8000.0;
    bool _1780 = isnan(_1050);
    bool _1782 = _1778 || _1780;
    bool _1784 = isnan(8000.0);
    bool _1786 = _1782 || _1784;
    float _1788 = float(_1786);
    float _1790 = fma(_1774, -2.0, 3.0);
    float _1792 = _1774 * _1774;
    if (_1770)
    {
        _1635 = 1.0;
    }
    float _1794 = _1635;
    float _1796 = _1792 * _1790;
    float _1798 = -_1796;
    float _1800 = _1798 + 1.0;
    float _1802 = fma(_1800, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1796);
    float _1804 = _1788 * _1802;
    float _1806 = _1802;
    float _1808 = _1794;
    float _1810 = _1804;
    if (_1770)
    {
        _1806 = 1.0;
    }
    float _1812 = _1806;
    float _1814 = _1812;
    float _1816 = _1703;
    if (!_1770)
    {
        float _1818 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1820 = _1818 * 0.15915493667125701904296875;
        float _1822 = _1820 * 6.283185482025146484375;
        float _1824 = cos(_1822);
        float _1826 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1828 = _1826 * 0.15915493667125701904296875;
        float _1830 = _1820 * 6.283185482025146484375;
        float _1832 = sin(_1830);
        float _1834 = 1.0 / _1824;
        float _1836 = _1828 * 6.283185482025146484375;
        float _1838 = cos(_1836);
        float _1840 = _1832 * _1834;
        float _1842 = _1828 * 6.283185482025146484375;
        float _1844 = sin(_1842);
        float _1846 = _1838 * _1840;
        float _1848 = 1.0 / _1846;
        float _1850 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1852 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1850;
        float _1854 = 1.0 / _1852;
        float _1856 = _1844 * _1848;
        float _1858 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1860 = fma(_1050, _1856, _1858);
        float _1862 = _1860 * _1854;
        float _1864 = precise::clamp(_1862, 0.0, 1.0);
        _1808 = _1864;
    }
    float _1866 = _1808;
    if (!_1770)
    {
        float _1868 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1870 = _1868 * 0.15915493667125701904296875;
        float _1872 = _1870 * 6.283185482025146484375;
        float _1874 = cos(_1872);
        float _1876 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1878 = _1876 * 0.15915493667125701904296875;
        float _1880 = _1870 * 6.283185482025146484375;
        float _1882 = sin(_1880);
        float _1884 = 1.0 / _1874;
        float _1886 = _1878 * 6.283185482025146484375;
        float _1888 = cos(_1886);
        float _1890 = _1882 * _1884;
        float _1892 = _1878 * 6.283185482025146484375;
        float _1894 = sin(_1892);
        float _1896 = _1888 * _1890;
        float _1898 = 1.0 / _1896;
        float _1900 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1902 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1900;
        float _1904 = 1.0 / _1902;
        float _1906 = _1894 * _1898;
        float _1908 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1910 = fma(_1050, _1906, _1908);
        float _1912 = _1910 * _1904;
        float _1914 = precise::clamp(_1912, 0.0, 1.0);
        float _1916 = -_1914;
        float _1918 = _1916 + 1.0;
        _1814 = _1918;
    }
    float _1920 = _1814;
    float _1922 = -_1776;
    float _1924 = _1922 + 1.0;
    float _1926 = _1804 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1928 = -_1691;
    float _1930 = _1928 + 1.0;
    float _1932 = _1924;
    if (!_1583)
    {
        _1810 = 1.0;
    }
    float _1934 = _1810;
    float _1936 = _1934;
    if (_1583)
    {
        bool _1938 = _1703 >= _1611;
        bool _1940 = isnan(_1703);
        bool _1942 = _1938 || _1940;
        bool _1944 = isnan(_1611);
        bool _1946 = _1942 || _1944;
        float _1948 = float(_1946);
        _1936 = _1948;
    }
    float _1950 = _1936;
    float _1952 = _1924 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1954 = _1930 * _1926;
    float _1956 = precise::clamp(_1954, 0.0, 1.0);
    float _1958 = _1950;
    if (_1197)
    {
        _1932 = 1.0;
    }
    float _1960 = _1932;
    float _1962 = _1960;
    if (!_1197)
    {
        int _1964 = _1231 << 4;
        int _1966 = _1964 + 2048;
        uint _1968 = uint(int(uint(_1966) >> uint(2)));
        uint _1970 = uint(int(uint(int(_1968)) >> uint(2)));
        int _1972 = int(_1968) & 3;
        float _1974 = (*spvDescriptorSet0.vp_c15)._m0[int(_1970)][_1972];
        int _1976 = int(_1968) + 1;
        uint _1978 = uint(int(uint(_1976) >> uint(2)));
        int _1980 = _1976 & 3;
        float _1982 = (*spvDescriptorSet0.vp_c15)._m0[int(_1978)][_1980];
        int _1984 = _1966 + 8;
        uint _1986 = uint(int(uint(_1984) >> uint(2)));
        uint _1988 = uint(int(uint(int(_1986)) >> uint(2)));
        int _1990 = int(_1986) & 3;
        float _1992 = (*spvDescriptorSet0.vp_c15)._m0[int(_1988)][_1990];
        int _1994 = int(_1986) + 1;
        uint _1996 = uint(int(uint(_1994) >> uint(2)));
        int _1998 = _1994 & 3;
        float _2000 = (*spvDescriptorSet0.vp_c15)._m0[int(_1996)][_1998];
        float _2002 = _1014 * _1982;
        float _2004 = fma(_360, _1974, _2002);
        float _2006 = fma(_362, _1992, _2004);
        float _2008 = _2006 + _2000;
        float _2010 = precise::clamp(_2008, 0.0, 1.0);
        float _2012 = -_2010;
        float _2014 = _2012 + _1697;
        float _2016 = fma(_2014, 500.0, 1.5);
        float _2018 = exp2(_2016);
        float _2020 = 0.0 + _2018;
        float _2022 = precise::clamp(_2020, 0.0, 1.0);
        _1962 = _2022;
    }
    float _2024 = _1962;
    float _2026 = _1950 * _2024;
    float _2028 = _1952 * _1705;
    float _2030 = -_1956;
    float _2032 = fma(_2030, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2034 = -_1952;
    float _2036 = _2034 + 1.0;
    out.m_99.x = _964;
    out.m_99.y = _962;
    out.m_99.z = _966;
    float _2038 = _1716 * _2028;
    float _2040 = -_2026;
    float _2042 = fma(_2040, _2032, 1.0);
    float _2044 = precise::clamp(_2042, 0.0, 1.0);
    float _2046 = _1726 * _2028;
    float _2048 = _1716 * _2036;
    float _2050 = fma(_1722, _2038, _1710);
    float _2052 = fma(_1724, _2038, _1712);
    float _2054 = _2044 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2056 = fma(_1716, _2046, _1714);
    bool _2058 = _1016 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2060 = isnan(_1016);
    bool _2062 = _2058 || _2060;
    bool _2064 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2066 = _2062 || _2064;
    float _2068 = _1866 * _1920;
    out.m_101.x = _2054;
    float _2070 = _2068 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_103.x = _2050;
    out.m_103.y = _2052;
    out.m_103.z = _2056;
    out.m_103.w = _2048;
    float _2072 = _2036;
    float _2074 = _2044;
    float _2076 = _2038;
    if (!_2066)
    {
        _1816 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2078 = _1816;
    float _2080 = _2078;
    float _2082 = _2078;
    if (!_2066)
    {
        _404 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2084 = _404;
    float _2086 = _2084;
    float _2088 = _2084;
    if (!_2066)
    {
        _2072 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2090 = _2072;
    float _2092 = _2090;
    float _2094 = _2090;
    if (!_2066)
    {
        _1958 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2096 = _1958;
    float _2098 = _2096;
    float _2100 = _2096;
    if (!_2066)
    {
        _2074 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2102 = _2074;
    float _2104 = _2102;
    float _2106 = _2102;
    if (!_2066)
    {
        _2076 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2108 = _2076;
    bool _2110 = !_2066;
    float _2112 = _2108;
    float _2114 = _2108;
    if (!_2110)
    {
        bool _2116 = _1016 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2118 = isnan(_1016);
        bool _2120 = _2116 || _2118;
        bool _2122 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2124 = _2120 || _2122;
        if (!_2124)
        {
            float _2126 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2128 = _1016 + _2126;
            float _2130 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2132 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2130;
            float _2134 = 1.0 / _2132;
            float _2136 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2138 = _2136 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2140 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2142 = _2140 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2144 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2146 = _2144 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2148 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2150 = _2148 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2152 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2154 = _2152 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2156 = _2128 * _2134;
            float _2158 = precise::clamp(_2156, 0.0, 1.0);
            float _2160 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2162 = _2160 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2164 = fma(_2158, _2138, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2166 = fma(_2158, _2162, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2168 = fma(_2158, _2142, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2170 = fma(_2158, _2146, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2172 = fma(_2158, _2150, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2174 = fma(_2158, _2154, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2088 = _2166;
            _2106 = _2172;
            _2082 = _2164;
            _2100 = _2170;
            _2094 = _2168;
            _2114 = _2174;
            _2176 = true;
        }
        else
        {
            bool _2178 = _1016 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2180 = isnan(_1016);
            bool _2182 = _2178 || _2180;
            bool _2184 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2186 = _2182 || _2184;
            if (!_2186)
            {
                _2080 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2188 = _2080;
            _2082 = _2188;
            if (!_2186)
            {
                _2086 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2190 = _2086;
            _2088 = _2190;
            if (!_2186)
            {
                _2092 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2192 = _2092;
            _2094 = _2192;
            if (!_2186)
            {
                _2098 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2194 = _2098;
            _2100 = _2194;
            if (!_2186)
            {
                _2104 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2196 = _2104;
            _2106 = _2196;
            if (!_2186)
            {
                _2112 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2198 = _2112;
            bool _2200 = !_2186;
            _2114 = _2198;
            if (!_2200)
            {
                bool _2202 = _1016 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2204 = isnan(_1016);
                bool _2206 = _2202 || _2204;
                bool _2208 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2210 = _2206 || _2208;
                if (!_2210)
                {
                    float _2212 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2214 = _1016 + _2212;
                    float _2216 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2218 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2216;
                    float _2220 = 1.0 / _2218;
                    float _2222 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2224 = _2222 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2226 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2228 = _2226 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2230 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2232 = _2230 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2234 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2236 = _2234 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2238 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2240 = _2238 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2242 = _2214 * _2220;
                    float _2244 = precise::clamp(_2242, 0.0, 1.0);
                    float _2246 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2248 = _2246 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2250 = fma(_2244, _2224, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2252 = fma(_2244, _2248, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2254 = fma(_2244, _2228, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2256 = fma(_2244, _2232, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2258 = fma(_2244, _2236, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2260 = fma(_2244, _2240, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2088 = _2252;
                    _2106 = _2258;
                    _2082 = _2250;
                    _2100 = _2256;
                    _2094 = _2254;
                    _2114 = _2260;
                    _2176 = true;
                }
                else
                {
                    _2088 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2106 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2082 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2100 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2094 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2114 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2176 = false;
    float _2262 = _2088;
    float _2264 = _2106;
    float _2266 = _2082;
    float _2268 = _2100;
    float _2270 = _2094;
    float _2272 = _2114;
    float _2274 = fma(_850, -0.5, 0.5);
    float _2276 = precise::clamp(_2274, 0.0, 1.0);
    float _2278 = -_2262;
    float _2280 = _2278 + _2264;
    float _2282 = _2070 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2284 = -_2266;
    float _2286 = _2284 + _2268;
    out.m_105.x = 0.0;
    float _2288 = fma(_2276, _2280, _2262);
    float _2290 = fma(_2276, _2286, _2266);
    out.m_65.x = _2282;
    float _2292 = -_2270;
    float _2294 = _2292 + _2272;
    float _2296 = _2288 * 0.586610972881317138671875;
    bool _2298 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2300 = fma(_2276, _2294, _2270);
    float _2302 = fma(_2290, 0.298911988735198974609375, _2296);
    bool _2304 = _1866 > 0.0;
    bool _2306 = isnan(_1866);
    bool _2308 = _2304 || _2306;
    bool _2310 = isnan(0.0);
    bool _2312 = _2308 || _2310;
    float _2314 = fma(_2300, 0.114477999508380889892578125, _2302);
    bool _2316 = _1920 <= 0.0;
    bool _2318 = !_2312;
    bool _2320 = _2316 || _2318;
    float _2322 = -_2314;
    float _2324 = _2290 + _2322;
    float _2326 = -_2314;
    float _2328 = _2288 + _2326;
    float _2330 = -_2314;
    float _2332 = _2300 + _2330;
    float _2334 = fma(_2324, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2314);
    float _2336 = fma(_2328, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2314);
    float _2338 = fma(_2332, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2314);
    bool _2340 = !_2298;
    if (!_2340)
    {
        float _2342 = -_962;
        float _2344 = _2342 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2346 = -_964;
        float _2348 = _2346 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2350 = -_966;
        float _2352 = _2350 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2354 = _2344 * _2344;
        float _2356 = fma(_2348, _2348, _2354);
        float _2358 = fma(_2352, _2352, _2356);
        float _2360 = sqrt(_2358);
        float _2362 = rsqrt(_2358);
        float _2364 = -_2360;
        float _2366 = _2364 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2368 = _2366 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2370 = precise::clamp(_2368, 0.0, 1.0);
        float _2372 = _2348 * _2362;
        float _2374 = _2344 * _2362;
        float _2376 = abs(_2370);
        float _2378 = log2(_2376);
        float _2380 = _2352 * _2362;
        float _2382 = _2372 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2384 = _850 * _2374;
        float _2386 = -_2374;
        float _2388 = -_2382;
        float _2390 = fma(_2386, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2388);
        float _2392 = fma(_848, _2372, _2384);
        float _2394 = -_2380;
        float _2396 = fma(_2394, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2390);
        float _2398 = fma(_838, _2380, _2392);
        float _2400 = precise::clamp(_2398, 0.0, 1.0);
        float _2402 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2404 = _2396 + _2402;
        float _2406 = _2378 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2408 = _2404 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2410 = precise::clamp(_2408, 0.0, 1.0);
        float _2412 = exp2(_2406);
        float _2414 = _2412 * _2410;
        float _2416 = _2400 * _2414;
        float _2418 = _2416 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2420 = _2416 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2422 = _2416 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_105.x = _2418;
        out.m_105.y = _2420;
        out.m_105.z = _2422;
    }
    out.m_107.x = _2334;
    out.m_107.y = _2336;
    out.m_107.z = _2338;
    if (!_2320)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_65.x = 0.0;
    float _2424 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2424;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

