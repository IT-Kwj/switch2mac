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
    constant _16* vp_c10 [[id(1)]];
    constant _16* vp_c8 [[id(2)]];
    constant _16* vp_c9 [[id(3)]];
    constant _16* vp_c13 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    texture2d<float> vp_t_tcb_C [[id(6)]];
    sampler vp_t_tcb_CSmplr [[id(7)]];
    texture2d<float> vp_t_tcb_8 [[id(8)]];
    sampler vp_t_tcb_8Smplr [[id(9)]];
    texture2d<float> vp_t_tcb_24 [[id(10)]];
    sampler vp_t_tcb_24Smplr [[id(11)]];
    texture2d_array<float> vp_t_tcb_14 [[id(12)]];
    sampler vp_t_tcb_14Smplr [[id(13)]];
    texture2d_array<float> vp_t_tcb_16 [[id(14)]];
    sampler vp_t_tcb_16Smplr [[id(15)]];
    texture3d<float> vp_t_tcb_32 [[id(16)]];
    sampler vp_t_tcb_32Smplr [[id(17)]];
    texture3d<float> vp_t_tcb_30 [[id(18)]];
    sampler vp_t_tcb_30Smplr [[id(19)]];
    texture2d<float> vp_t_tcb_1C [[id(20)]];
    sampler vp_t_tcb_1CSmplr [[id(21)]];
    sampler vp_t_tcb_CSmplr_w [[id(22)]];
    sampler vp_t_tcb_8Smplr_w [[id(23)]];
    sampler vp_t_tcb_24Smplr_w [[id(24)]];
    sampler vp_t_tcb_14Smplr_w [[id(25)]];
    sampler vp_t_tcb_32Smplr_w [[id(26)]];
    sampler vp_t_tcb_30Smplr_w [[id(27)]];
    sampler vp_t_tcb_1CSmplr_w [[id(28)]];
    constant dm_border_t* dm_border [[id(29)]];
};

struct main0_out
{
    float4 m_87 [[user(locn0)]];
    float4 m_89 [[user(locn1)]];
    float4 m_113 [[user(locn2)]];
    float4 m_83 [[user(locn3)]];
    float4 m_65 [[user(locn4)]];
    float4 m_105 [[user(locn5)]];
    float4 m_67 [[user(locn6)]];
    float4 m_93 [[user(locn7)]];
    float4 m_101 [[user(locn8)]];
    float4 m_91 [[user(locn9)]];
    float4 m_99 [[user(locn10)]];
    float4 m_103 [[user(locn11)]];
    float4 m_97 [[user(locn12)]];
    float4 m_95 [[user(locn13)]];
    float4 m_111 [[user(locn14)]];
    float4 m_107 [[user(locn15)]];
    float4 m_109 [[user(locn16)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_79 [[attribute(1)]];
    float4 m_60 [[attribute(2)]];
    float4 m_62 [[attribute(3)]];
    float4 m_85 [[attribute(4)]];
    float4 m_77 [[attribute(5)]];
    float4 m_71 [[attribute(6)]];
    float4 m_69 [[attribute(7)]];
    float4 m_81 [[attribute(8)]];
    float4 m_73 [[attribute(9)]];
    float4 m_75 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_113 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_111 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_109 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2588 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _127 = in.m_60.w;
    float _129 = in.m_62.w;
    float _131 = trunc(_127);
    int _134 = int(_131);
    float _136 = -_129;
    float _138 = _136 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_65.y = _138;
    bool _142 = _134 >= 1;
    float _144 = 0.0;
    float _146 = as_type<float>(_134);
    float _148 = _138;
    if (!_142)
    {
        _144 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _150 = _144;
    if (!_142)
    {
        out.m_67.x = 0.0;
    }
    int _152 = 0;
    if (!_142)
    {
        float _154 = _150 * 5.0;
        _152 = as_type<int>(_154);
    }
    int _156 = _152;
    int _158 = _156;
    if (!_142)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2885 = as_type<float>(_156);
        out.gl_Position.z = _2885;
    }
    if (!_142)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _160 = _129 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _162 = isnan(_129);
    bool _164 = _160 || _162;
    bool _166 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _168 = _164 || _166;
    float _170 = float(_134);
    bool _172 = _138 >= _170;
    bool _174 = !_168;
    bool _176 = _172 || _174;
    if (_176)
    {
        _146 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _178 = _146;
    if (_176)
    {
        out.m_67.x = 0.0;
    }
    if (_176)
    {
        float _180 = _178 * 5.0;
        _158 = as_type<int>(_180);
    }
    int _182 = _158;
    if (_176)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2940 = as_type<float>(_182);
        out.gl_Position.z = _2940;
    }
    if (_176)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _184 = in.m_69.w;
    float _186 = 1.0 / _170;
    float _188 = _138 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _190 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _192 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _194 = _190 || _192;
    bool _196 = isnan(1.0);
    bool _198 = _194 || _196;
    float _200 = in.m_62.x;
    float _202 = in.m_62.y;
    float _204 = in.m_62.z;
    float _206 = in.m_60.x;
    float _208 = in.m_60.y;
    float _210 = in.m_60.z;
    float _212 = 0.0;
    float _214 = _188;
    if (!_198)
    {
        float _216 = _188 * _188;
        float _218 = _216 * 0.5;
        _212 = _218;
    }
    float _220 = _212;
    float _222 = _220;
    if (!_198)
    {
        float _224 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _222 = _224;
    }
    float _226 = _222;
    bool _228 = !_198;
    float _230 = _226;
    if (!_228)
    {
        float _232 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _234 = log2(_232);
        float _236 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _238 = _236 + 1.0;
        float _240 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _242 = _188 * _234;
        float _244 = 1.0 / _238;
        float _246 = _240 * 0.693147182464599609375;
        float _248 = exp2(_242);
        float _250 = 1.0 / _246;
        float _252 = _248 + (-1.0);
        float _254 = -_252;
        float _256 = fma(_254, _250, _188);
        float _258 = _256 * _244;
        float _260 = _258 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _230 = _260;
    }
    float _262 = _230;
    bool _264 = !_198;
    if (!_264)
    {
        float _266 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _268 = log2(_266);
        float _270 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _272 = _270 + 1.0;
        float _274 = 1.0 / _272;
        float _276 = _188 * _268;
        float _278 = exp2(_276);
        float _280 = -_278;
        float _282 = _280 + 1.0;
        float _284 = _282 * _274;
        _214 = _284;
    }
    float _286 = _214;
    bool _288 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _290 = _262 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _292 = _262 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _294 = _262 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _296 = _138 * _186;
    float _298 = fma(_286, _200, _290);
    float _300 = fma(_286, _202, _292);
    float _302 = fma(_286, _204, _294);
    float _304 = fma(_298, _184, _206);
    float _306 = fma(_300, _184, _208);
    float _308 = fma(_302, _184, _210);
    bool _310 = !_288;
    float _312 = _296;
    if (!_310)
    {
        float _314 = in.m_71.x;
        float _316 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _318 = _314 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _320 = fma(_318, (*spvDescriptorSet0.vp_c9)._m0[12].x, _138);
        float _322 = _320 * _316;
        float _324 = floor(_322);
        float _326 = -_324;
        float _328 = _322 + _326;
        _312 = _328;
    }
    float _330 = _312;
    float _332 = _306 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _334 = _306 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _336 = _306 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _338 = in.m_73.y;
    float _340 = fma(_304, (*spvDescriptorSet0.vp_c10)._m0[5].x, _332);
    float _342 = fma(_304, (*spvDescriptorSet0.vp_c10)._m0[4].x, _334);
    float _344 = fma(_304, (*spvDescriptorSet0.vp_c10)._m0[6].x, _336);
    float _346 = in.m_71.y;
    float _348 = fma(_308, (*spvDescriptorSet0.vp_c10)._m0[5].z, _340);
    float _350 = fma(_308, (*spvDescriptorSet0.vp_c10)._m0[4].z, _342);
    float _352 = fma(_308, (*spvDescriptorSet0.vp_c10)._m0[6].z, _344);
    float _354 = in.m_71.x;
    float _356 = _348 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _358 = _350 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _360 = _352 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _362 = _356 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _364 = in.m_73.x;
    float _366 = fma(_358, (*spvDescriptorSet0.vp_c8)._m0[11].x, _362);
    int _368 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _370 = _368 != 0;
    float _372 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _374 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _376 = _374 != 0;
    float _378 = fma(_360, (*spvDescriptorSet0.vp_c8)._m0[11].z, _366);
    float _380 = _356 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    int _382 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _384 = _382 != 0;
    float _386 = -_338;
    float _388 = _386 + 1.0;
    float _390 = _378 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _392 = fma(_358, (*spvDescriptorSet0.vp_c8)._m0[10].x, _380);
    int _394 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _396 = _394 != 0;
    float _398 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _400 = 1.0 / _390;
    float _402 = fma(_360, (*spvDescriptorSet0.vp_c8)._m0[10].z, _392);
    float _404 = in.m_71.z;
    bool _406 = _346 > 0.5;
    float _408 = _402 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    int _410 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _412 = _410 != 0;
    float _414 = _408 + _390;
    float _416 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _418 = _414 * _400;
    float _420 = _418 * 0.5;
    float _422 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _424 = fma(_360, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _426 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _428 = fma(_420, (*spvDescriptorSet0.vp_c8)._m0[30].w, _426);
    float _430 = _356 + _422;
    float _432 = _354 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _434 = _406 ? as_type<int>(_388) : as_type<int>(_338);
    float _436 = 1.0 / _428;
    float _438 = _430 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _440 = _430 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _442 = -_398;
    float _444 = fma(_432, 2.0, _442);
    float _446 = fma(_358, (*spvDescriptorSet0.vp_c15)._m0[126].x, _438);
    float _448 = fma(_358, (*spvDescriptorSet0.vp_c15)._m0[127].x, _440);
    float _450 = _384 ? as_type<float>(_434) : _338;
    float _452 = floor(_424);
    float _454 = fma(_360, (*spvDescriptorSet0.vp_c15)._m0[126].z, _446);
    float _456 = fma(_360, (*spvDescriptorSet0.vp_c15)._m0[127].z, _448);
    float _458 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _460 = _346 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _462 = _454 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _464 = _456 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _466 = _448;
    float _468 = _364;
    int _470 = 2;
    float _472 = _338;
    if (!_370)
    {
        _466 = _364;
    }
    float _474 = _466;
    float _476 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _478 = _436 * _476;
    float _480 = trunc(_462);
    int _482 = int(_480);
    float _484 = fma(_460, -2.0, _458);
    float _486 = _372 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _488 = 0.0;
    float _490 = _474;
    if (!_370)
    {
        _488 = _474;
    }
    float _492 = _488;
    float _494 = (*spvDescriptorSet0.vp_c9)._m0[89].z + (*spvDescriptorSet0.vp_c9)._m0[89].y;
    bool _496 = _478 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _498 = fma(_486, _450, -0.5);
    bool _500 = _478 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _502 = trunc(_464);
    int _504 = int(_502);
    bool _506 = !_496;
    int _508 = _506 ? 0 : 1;
    float _510 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _512 = _508;
    bool _514 = _500;
    float _516 = _492;
    if (_370)
    {
        _490 = _364;
    }
    float _518 = _490;
    float _520 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[76].y, _484);
    int _522 = as_type<int>(_518);
    if (_412)
    {
        _468 = _346;
    }
    float _524 = _468;
    float _526 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[78].w, _510);
    float _528 = _524;
    if (!_412)
    {
        _528 = _354;
    }
    float _530 = _528;
    float _532 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _534 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _536 = _482 + _534;
    int _538 = _536 + 1;
    float _540 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[77].w, _526);
    float _542 = as_type<float>(_538);
    if (!_496)
    {
        _470 = 1;
    }
    int _544 = _470;
    float _546 = _530 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _548 = _544;
    if (!_500)
    {
        _548 = _508;
    }
    int _550 = _548;
    if (_370)
    {
        float _552 = -_518;
        float _554 = _552 + 1.0;
        _512 = as_type<int>(_554);
    }
    int _556 = _512;
    if (_370)
    {
        bool _558 = _354 > 0.5;
        _514 = _558;
    }
    bool _560 = _514;
    float _562 = -_520;
    float _564 = fma(_540, _498, _562);
    int _566 = _550 << 6;
    int _568 = 0;
    if (_376)
    {
        float _570 = -_518;
        float _572 = _570 + 1.0;
        _568 = as_type<int>(_572);
    }
    int _574 = _568;
    int _576 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _578 = _504 + _576;
    int _580 = _578 + 1;
    float _582 = _416 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _584 = _566 + 96;
    uint _587 = uint(int(uint(_584) >> uint(2)));
    uint _589 = uint(int(uint(int(_587)) >> uint(2)));
    int _591 = int(_587) & 3;
    float _593 = (*spvDescriptorSet0.vp_c15)._m0[int(_589)][_591];
    int _595 = int(_587) + 1;
    uint _597 = uint(int(uint(_595) >> uint(2)));
    int _599 = _595 & 3;
    float _601 = (*spvDescriptorSet0.vp_c15)._m0[int(_597)][_599];
    bool _603 = _538 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _605 = _564 + 0.5;
    int _607 = _538 | _580;
    float _609 = _532 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    if (_370)
    {
        float _611 = _560 ? as_type<float>(_556) : _518;
        _516 = _611;
    }
    float _613 = _516;
    bool _615 = _607 < 0;
    bool _617 = _615 || _603;
    int _619 = _566 + 48;
    uint _621 = uint(int(uint(_619) >> uint(2)));
    uint _623 = uint(int(uint(int(_621)) >> uint(2)));
    int _625 = int(_621) & 3;
    float _627 = (*spvDescriptorSet0.vp_c15)._m0[int(_623)][_625];
    int _629 = int(_621) + 1;
    uint _631 = uint(int(uint(_629) >> uint(2)));
    int _633 = _629 & 3;
    float _635 = (*spvDescriptorSet0.vp_c15)._m0[int(_631)][_633];
    float _637 = fma(_582, _613, -0.5);
    float _639 = 0.0;
    if (_412)
    {
        _639 = _404;
    }
    float _641 = _639;
    float _643 = fma(_358, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _645 = _641;
    int _647 = as_type<int>(_643);
    if (!_412)
    {
        _645 = _346;
    }
    float _649 = _645;
    int _651 = _566 + 104;
    uint _653 = uint(int(uint(_651) >> uint(2)));
    uint _655 = uint(int(uint(int(_653)) >> uint(2)));
    int _657 = int(_653) & 3;
    float _659 = (*spvDescriptorSet0.vp_c15)._m0[int(_655)][_657];
    int _661 = int(_653) + 1;
    uint _663 = uint(int(uint(_661) >> uint(2)));
    int _665 = _661 & 3;
    float _667 = (*spvDescriptorSet0.vp_c15)._m0[int(_663)][_665];
    bool _669 = _580 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _671 = _669 || _617;
    float _673 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _675 = floor(_643);
    float _677 = fma(_649, (*spvDescriptorSet0.vp_c9)._m0[89].z, _494);
    float _679 = 0.0;
    if (!_376)
    {
        _679 = _518;
    }
    float _681 = _679;
    float _683 = fma(_546, -2.0, _673);
    float _685 = -_452;
    float _687 = _424 + _685;
    int _689 = _566 + 80;
    uint _691 = uint(int(uint(_689) >> uint(2)));
    uint _693 = uint(int(uint(int(_691)) >> uint(2)));
    int _695 = int(_691) & 3;
    float _697 = (*spvDescriptorSet0.vp_c15)._m0[int(_693)][_695];
    int _699 = int(_691) + 1;
    uint _701 = uint(int(uint(_699) >> uint(2)));
    int _703 = _699 & 3;
    float _705 = (*spvDescriptorSet0.vp_c15)._m0[int(_701)][_703];
    float _707 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[89].x, _677);
    float _709 = _681;
    int _711 = as_type<int>(_707);
    if (_376)
    {
        float _713 = _406 ? as_type<float>(_574) : _518;
        _709 = _713;
    }
    float _715 = _709;
    float _717 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _719 = _404 > 0.5;
    float _721 = _707 * (-0.15915493667125701904296875);
    int _723 = as_type<int>(_715);
    if (!_671)
    {
        int _725 = _580 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _727 = _725 + _538;
        _522 = _727;
    }
    int _729 = _522;
    float _731 = fma(_609, _715, -0.5);
    int _733 = _566 + 56;
    uint _735 = uint(int(uint(_733) >> uint(2)));
    uint _737 = uint(int(uint(int(_735)) >> uint(2)));
    int _739 = int(_735) & 3;
    float _741 = (*spvDescriptorSet0.vp_c15)._m0[int(_737)][_739];
    int _743 = int(_735) + 1;
    uint _745 = uint(int(uint(_743) >> uint(2)));
    int _747 = _743 & 3;
    float _749 = (*spvDescriptorSet0.vp_c15)._m0[int(_745)][_747];
    if (_396)
    {
        float _751 = _719 ? _388 : _338;
        _472 = _751;
    }
    float _753 = _472;
    float _755 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[86].y, _683);
    float _757 = _721 * 6.283185482025146484375;
    float _759 = sin(_757);
    if (!_671)
    {
        int _761 = _729 << 2;
        _711 = _761;
    }
    int _763 = _711;
    float _765 = -_675;
    float _767 = _643 + _765;
    int _769 = _763;
    if (_412)
    {
        _542 = _354;
    }
    float _771 = _542;
    int _773 = _566 + 64;
    uint _775 = uint(int(uint(_773) >> uint(2)));
    uint _777 = uint(int(uint(int(_775)) >> uint(2)));
    int _779 = int(_775) & 3;
    float _781 = (*spvDescriptorSet0.vp_c15)._m0[int(_777)][_779];
    int _783 = int(_775) + 1;
    uint _785 = uint(int(uint(_783) >> uint(2)));
    int _787 = _783 & 3;
    float _789 = (*spvDescriptorSet0.vp_c15)._m0[int(_785)][_787];
    float _791 = _721 * 6.283185482025146484375;
    float _793 = cos(_791);
    float _795 = _771;
    if (!_671)
    {
        uint _797 = uint(int(uint(_729) >> uint(2)));
        _723 = int(_797);
    }
    int _799 = _723;
    float _801 = _717 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    if (!_671)
    {
        int _803 = 12 & _763;
        _769 = _803;
    }
    int _805 = _769;
    int _807 = _566 + 72;
    uint _809 = uint(int(uint(_807) >> uint(2)));
    uint _811 = uint(int(uint(int(_809)) >> uint(2)));
    int _813 = int(_809) & 3;
    float _815 = (*spvDescriptorSet0.vp_c15)._m0[int(_811)][_813];
    int _817 = int(_809) + 1;
    uint _819 = uint(int(uint(_817) >> uint(2)));
    int _821 = _817 & 3;
    float _823 = (*spvDescriptorSet0.vp_c15)._m0[int(_819)][_821];
    float _825 = _430 * _601;
    if (!_412)
    {
        _795 = _404;
    }
    float _827 = _795;
    if (!_671)
    {
        int _829 = _799 << 4;
        int _831 = _829 + _805;
        _647 = _831;
    }
    int _833 = _647;
    float _835 = fma(_358, _593, _825);
    float _837 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _839 = fma(_801, _753, -0.5);
    int _841 = _566 + 88;
    uint _843 = uint(int(uint(_841) >> uint(2)));
    uint _845 = uint(int(uint(int(_843)) >> uint(2)));
    int _847 = int(_843) & 3;
    float _849 = (*spvDescriptorSet0.vp_c15)._m0[int(_845)][_847];
    int _851 = int(_843) + 1;
    uint _853 = uint(int(uint(_851) >> uint(2)));
    int _855 = _851 & 3;
    float _857 = (*spvDescriptorSet0.vp_c15)._m0[int(_853)][_855];
    float _859 = fma(_360, _659, _835);
    float _861 = _827 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _863 = _659;
    if (!_671)
    {
        int _865 = _833 + 400;
        uint _867 = uint(int(uint(_865) >> uint(2)));
        uint _869 = uint(int(uint(int(_867)) >> uint(2)));
        int _871 = int(_867) & 3;
        float _873 = (*spvDescriptorSet0.vp_c15)._m0[int(_869)][_871];
        _863 = _873;
    }
    float _875 = _863;
    float _877 = _859 + _667;
    float _879 = _430 * _635;
    float _881 = -_837;
    float _883 = fma(_861, 2.0, _881);
    float _885 = _759 * _839;
    float _887 = _793 * _839;
    float _889 = fma(_358, _627, _879);
    float _891 = _430 * _705;
    float _893 = -_885;
    float _895 = fma(_793, _731, _893);
    float _897 = fma(_759, _731, _887);
    float _899 = 1.0 / _877;
    float _901 = fma(_358, _697, _891);
    float _903 = fma(_360, _741, _889);
    float _905 = -_138;
    float _907 = fma(_905, (*spvDescriptorSet0.vp_c9)._m0[86].x, _883);
    float _909 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _911 = _903 + _749;
    float _913 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _915 = _885;
    float _917 = _895;
    if (!_671)
    {
        float _919 = floor(_464);
        _915 = _919;
    }
    float _921 = _915;
    float _923 = _430 * _789;
    float _925 = fma(_354, (*spvDescriptorSet0.vp_c9)._m0[88].z, _909);
    float _927 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[88].w, _913);
    float _929 = fma(_358, _781, _923);
    float _931 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[87].z, _925);
    float _933 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[87].w, _927);
    float _935 = fma(_360, _815, _929);
    float _937 = _911 * _899;
    float _939 = fma(_931, _895, _907);
    float _941 = -_755;
    float _943 = fma(_933, _897, _941);
    float _945 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _947 = _935 + _823;
    bool _949 = _937 >= 0.0;
    float _951 = _939 + 0.5;
    float _953 = _943 + 0.5;
    float _955 = fma(_354, (*spvDescriptorSet0.vp_c9)._m0[78].z, _945);
    float _957 = _947 * _899;
    bool _959 = _937 <= 1.0;
    bool _961 = _959 && _949;
    float2 _4266 = float2(_951, _953);
    float _963 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, select(_4266, float2(0.0), isnan(_4266)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, select(_4266, float2(0.0), isnan(_4266)), level(0.0)).w;
    float _965 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[77].z, _955);
    float _967 = -_138;
    float _969 = fma(_967, (*spvDescriptorSet0.vp_c9)._m0[76].x, _444);
    bool _971 = _957 >= 0.0;
    bool _973 = _971 && _961;
    float _975 = _823;
    float _977 = _965;
    float _979 = _947;
    float _981 = _951;
    if (!_671)
    {
        float _983 = floor(_462);
        _975 = _983;
    }
    float _985 = _975;
    float _987 = fma(_360, _849, _901);
    float _989 = fma(_965, _637, _969);
    bool _991 = _957 <= 1.0;
    bool _993 = _991 && _973;
    if (!_671)
    {
        float _995 = -_921;
        float _997 = _464 + _995;
        _977 = _997;
    }
    float _999 = _977;
    float _1001 = _987 + _857;
    float _1003 = _875;
    if (!_671)
    {
        float _1005 = rint(_875);
        float _1007 = precise::max(_1005, 0.0);
        uint _1009 = uint(_1007);
        uint _1011 = clamp(_1009, 0u, 65535u);
        _1003 = as_type<float>(_1011);
    }
    float _1013 = _1003;
    float _1015 = _1001 * _899;
    if (_993)
    {
        float _1017 = float(_550);
        _979 = _1017;
    }
    float _1019 = _979;
    float _1021 = _989 + 0.5;
    if (!_671)
    {
        float _1023 = -_985;
        float _1025 = _462 + _1023;
        _917 = _1025;
    }
    float _1027 = _917;
    float _1029 = _755;
    if (_993)
    {
        float _1031 = rint(_1019);
        float _1033 = precise::max(_1031, 0.0);
        uint _1035 = uint(_1033);
        uint _1037 = clamp(_1035, 0u, 65535u);
        _1029 = as_type<float>(_1037);
    }
    float _1039 = _1029;
    float2 _4388 = float2(_1021, _605);
    float _1041 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_4388, float2(0.0), isnan(_4388)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_4388, float2(0.0), isnan(_4388)), level(0.0)).w;
    float2 _4396 = float2(_767, _687);
    float _1043 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4396, float2(0.0), isnan(_4396)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4396, float2(0.0), isnan(_4396)), level(0.0)).x;
    float _1045 = _999;
    if (!_671)
    {
        float3 _4411 = float3(_1027, _999, float(as_type<int>(_1013)));
        float3 _4415 = select(_4411, float3(0.0), isnan(_4411));
        float _1047 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _4415.xy, uint(rint(_4415.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _4415.xy, uint(rint(_4415.z)), level(0.0)).x;
        _1045 = _1047;
    }
    float _1049 = _1045;
    float _1051 = _1039;
    if (_993)
    {
        float3 _4430 = float3(_937, _957, float(as_type<int>(_1039)));
        float3 _4432 = select(_4430, float3(0.0), isnan(_4430));
        float _1053 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _4432.xy, uint(rint(_4432.z)), _1015, level(0.0));
        _1051 = _1053;
    }
    float _1055 = _1051;
    float _1057 = _346 * 2.0;
    float _1059 = _354 * 2.0;
    float _1061 = _404 * 2.0;
    float _1063 = in.m_75.x;
    float _1065 = floor(_1057);
    float _1067 = in.m_77.y;
    float _1069 = in.m_77.x;
    float _1071 = floor(_1059);
    float _1073 = _354 + _346;
    float _1075 = in.m_77.z;
    float _1077 = _1073 + (-1.0);
    float _1079 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1081 = log2(_1079);
    bool _1083 = _1065 > 0.0;
    bool _1085 = _1065 >= 0.0;
    bool _1087 = isnan(_1065);
    bool _1089 = _1085 || _1087;
    bool _1091 = isnan(0.0);
    bool _1093 = _1089 || _1091;
    float _1095 = fma(_1077, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1097 = _346 + _404;
    float _1099 = _346 + (-0.5);
    bool _1101 = _1071 > 0.0;
    float _1103 = _1097 + (-1.0);
    bool _1105 = _1071 >= 0.0;
    bool _1107 = isnan(_1071);
    bool _1109 = _1105 || _1107;
    bool _1111 = isnan(0.0);
    bool _1113 = _1109 || _1111;
    float _1115 = floor(_1061);
    int _1117 = _1093 ? 0 : 1;
    int _1119 = _1113 ? 0 : 1;
    int _1121 = ~_1117;
    int _1123 = _1121 + 1;
    int _1125 = _1123 + 1;
    int _1127 = ~_1119;
    int _1129 = _1127 + 1;
    int _1131 = _1129 + 1;
    int _1133 = _1125;
    int _1135 = _1131;
    if (!_1083)
    {
        int _1137 = ~_1117;
        int _1139 = _1137 + 1;
        _1133 = _1139;
    }
    int _1141 = _1133;
    float _1143 = _1081 * _138;
    int _1145 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1147 = _1145 != 0;
    int _1149 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1151 = _1149 != 0;
    int _1153 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1155 = _1153 != 0;
    float _1157 = fma(_1103, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    if (!_1101)
    {
        int _1159 = ~_1119;
        int _1161 = _1159 + 1;
        _1135 = _1161;
    }
    int _1163 = _1135;
    float _1165 = _354 + _404;
    bool _1167 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1169 = isnan(0.0);
    bool _1171 = _1167 || _1169;
    bool _1173 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1175 = _1171 || _1173;
    float _1177 = exp2(_1143);
    bool _1179 = !_1151;
    int _1181 = _1179 ? 0 : 1;
    float _1183 = _1165 + (-1.0);
    bool _1185 = !_1155;
    int _1187 = _1185 ? 0 : 1;
    float _1189 = _404 + (-0.5);
    int _1191 = abs(_1181);
    float _1193 = fma(_1183, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _1195 = abs(_1187);
    float _1197 = in.m_79.x;
    float _1199 = in.m_79.y;
    float _1201 = in.m_79.z;
    float _1203 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1205 = 1.0 + _1203;
    bool _1207 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1209 = isnan(1.0);
    bool _1211 = _1207 || _1209;
    bool _1213 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1215 = _1211 || _1213;
    float _1217 = _354 + (-0.5);
    float _1219 = float(_1191);
    float _1221 = 1.0 / _1205;
    float _1223 = float(_1163);
    bool _1225 = _1115 > 0.0;
    float _1227 = -_1177;
    float _1229 = _1227 + 1.0;
    bool _1231 = _1115 >= 0.0;
    bool _1233 = isnan(_1115);
    bool _1235 = _1231 || _1233;
    bool _1237 = isnan(0.0);
    bool _1239 = _1235 || _1237;
    float _1241 = _1219 * _1223;
    float _1243 = float(_1195);
    bool _1245 = !_1147;
    int _1247 = _1245 ? 0 : 1;
    float _1249 = float(_1141);
    float _1251 = _1175 ? _1229 : 0.0;
    float _1253 = _138 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    int _1255 = _1239 ? 0 : 1;
    float _1257 = _1243 * _1249;
    if (_1215)
    {
        float _1259 = _1251 * _1221;
        _148 = _1259;
    }
    float _1261 = _148;
    int _1263 = abs(_1247);
    float _1265 = _1241 * (-2.0);
    int _1267 = ~_1255;
    int _1269 = _1267 + 1;
    int _1271 = _1269 + 1;
    float _1273 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1275 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _1273;
    int _1277 = _1271;
    if (!_1225)
    {
        int _1279 = ~_1255;
        int _1281 = _1279 + 1;
        _1277 = _1281;
    }
    int _1283 = _1277;
    float _1285 = fma(_1157, _1265, _1157);
    float _1287 = fma(_1265, _1199, _1199);
    float _1289 = float(_1283);
    float _1291 = 1.0 / _1275;
    float _1293 = float(_1263);
    float _1295 = fma(_1099, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1287);
    float _1297 = _1257 * (-2.0);
    float _1299 = _1293 * _1289;
    float _1301 = fma(_1285, _1261, _1295);
    float _1303 = fma(_1297, _1201, _1201);
    float _1305 = fma(_1193, _1297, _1193);
    float _1307 = _1299 * (-2.0);
    float _1309 = _1301 * 0.15915493667125701904296875;
    float _1311 = fma(_1189, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1303);
    float _1313 = fma(_1307, _1197, _1197);
    float _1315 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1317 = _330 + _1315;
    float _1319 = fma(_1305, _1261, _1311);
    float _1321 = fma(_1095, _1307, _1095);
    float _1323 = fma(_1217, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1313);
    float _1325 = _1317 * _1291;
    bool _1327 = _330 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1329 = isnan(_330);
    bool _1331 = _1327 || _1329;
    bool _1333 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1335 = _1331 || _1333;
    float _1337 = float(_1335);
    float _1339 = _1319 * 0.15915493667125701904296875;
    bool _1341 = _330 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _1343 = isnan(_330);
    bool _1345 = _1341 || _1343;
    bool _1347 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _1349 = _1345 || _1347;
    float _1351 = float(_1349);
    float _1353 = fma(_1321, _1261, _1323);
    float _1355 = in.m_69.x;
    float _1357 = in.m_69.y;
    float _1359 = in.m_69.z;
    float _1361 = _1309 * 6.283185482025146484375;
    float _1363 = sin(_1361);
    float _1365 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1367 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1365;
    float _1369 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _1371 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _1369;
    float _1373 = _1353 * 0.15915493667125701904296875;
    float _1375 = fma(_1367, _1325, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _1377 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1379 = isnan(0.5);
    bool _1381 = _1377 || _1379;
    bool _1383 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1385 = _1381 || _1383;
    float _1387 = fma(_1371, _1325, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _1389 = _1309 * 6.283185482025146484375;
    float _1391 = cos(_1389);
    float _1393 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1395 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1393;
    float _1397 = fma(_1395, _1325, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _1399 = _1373 * 6.283185482025146484375;
    float _1401 = sin(_1399);
    float _1403 = -_1351;
    float _1405 = _1403 + 1.0;
    float _1407 = _1337 * _1405;
    float _1409 = -_1337;
    float _1411 = _1409 + 1.0;
    float _1413 = _1373 * 6.283185482025146484375;
    float _1415 = cos(_1413);
    float _1417 = _1387 * _1407;
    float _1419 = _1375 * _1407;
    float _1421 = _1397 * _1407;
    float _1423 = fma(_1411, (*spvDescriptorSet0.vp_c9)._m0[143].z, _1417);
    float _1425 = fma(_1411, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1419);
    float _1427 = fma(_1411, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1421);
    float _1429 = _1339 * 6.283185482025146484375;
    float _1431 = sin(_1429);
    float _1433 = _1401 * _1363;
    float _1435 = fma(_1351, (*spvDescriptorSet0.vp_c9)._m0[144].y, _1425);
    float _1437 = fma(_1351, (*spvDescriptorSet0.vp_c9)._m0[144].x, _1427);
    float _1439 = fma(_1351, (*spvDescriptorSet0.vp_c9)._m0[144].z, _1423);
    float _1441 = _1435 * _1357;
    float _1443 = _1437 * _1355;
    float _1445 = in.m_75.w;
    float _1447 = _1415 * _1391;
    float _1449 = _1415 * _1363;
    float _1451 = _1339 * 6.283185482025146484375;
    float _1453 = cos(_1451);
    float _1455 = _1439 * _1359;
    float _1457 = fma(_1431, _1447, _1433);
    float _1459 = fma(_1431, _1433, _1447);
    float _1461 = _1401 * _1391;
    float _1463 = _1455 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1465 = -_1449;
    float _1467 = fma(_1431, _1461, _1465);
    float _1469 = -_1461;
    float _1471 = fma(_1431, _1449, _1469);
    float _1473 = _1391 * _1453;
    float _1475 = _1415 * _1453;
    float _1477 = _1443 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1479 = _1401 * _1453;
    float _1481 = _1363 * _1453;
    float _1483 = _963 + _1063;
    float _1485 = fma(_1483, 6.283185482025146484375, _1253);
    float _1487 = _1485 * 0.15915493667125701904296875;
    float _1489 = _1487 * 6.283185482025146484375;
    float _1491 = sin(_1489);
    float _1493 = _1041 * _1445;
    float _1495 = _1493 * (*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1497 = fma(_1491, 0.5, 0.5);
    float _1499 = _1441 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1501 = _1495 * _1497;
    float _1503 = fma(_1501, 0.1500000059604644775390625, _1067);
    float _1505 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1069);
    float _1507 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1503);
    float _1509 = _1505 * _1477;
    float _1511 = _1507 * _1499;
    float _1513 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1075);
    float _1515 = _1475 * _1511;
    float _1517 = _1513 * _1463;
    float _1519 = -_1511;
    float _1521 = _1431 * _1519;
    float _1523 = _1479 * _1511;
    float _1525 = fma(_1457, _1509, _1515);
    float _1527 = fma(_1473, _1509, _1521);
    float _1529 = fma(_1467, _1509, _1523);
    float _1531 = fma(_1471, _1517, _1525);
    float _1533 = fma(_1481, _1517, _1527);
    float _1535 = fma(_1459, _1517, _1529);
    float _1537 = _1531 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1539 = _1531 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1541 = fma(_1533, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1537);
    float _1543 = fma(_1533, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1539);
    float _1545 = fma(_1535, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1541);
    float _1547 = fma(_1535, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1543);
    float _1549 = _1531 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1551 = _360 + _1545;
    float _1553 = _358 + _1547;
    float _1555 = fma(_1533, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1549);
    float _1557 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1559 = _1551 + _1557;
    float _1561 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1563 = _1553 + _1561;
    float _1565 = fma(_1535, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1555);
    float _1567 = _1559 * _1559;
    float _1569 = _356 + _1565;
    float _1571 = fma(_1563, _1563, _1567);
    float _1573 = sqrt(_1571);
    bool _1575 = _1573 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1577 = _1567;
    float _1579 = _1553;
    float _1581 = _1565;
    float _1583 = _1297;
    float _1585 = _1049;
    if (!_1575)
    {
        _1577 = _1553;
    }
    float _1587 = _1577;
    float _1589 = _1587;
    if (!_1575)
    {
        _1579 = _1551;
    }
    float _1591 = _1579;
    float _1593 = _1591;
    if (!_1575)
    {
        _1581 = _1569;
    }
    float _1595 = _1581;
    bool _1597 = !_1575;
    float _1599 = _1595;
    if (!_1597)
    {
        float _1601 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1603 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1605 = _1573 + _1603;
        float _1607 = rsqrt(_1571);
        float _1609 = _1605 * _1601;
        float _1611 = _1569 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1613 = _1609 * 0.15915493667125701904296875;
        float _1615 = _1613 * 6.283185482025146484375;
        float _1617 = cos(_1615);
        float _1619 = _1613 * 6.283185482025146484375;
        float _1621 = sin(_1619);
        float _1623 = _1617 + (-1.0);
        float _1625 = _1623 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1627 = fma(_1621, _1611, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1629 = fma(_1569, _1617, _1625);
        float _1631 = _1607 * _1627;
        float _1633 = fma(_1563, _1631, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1635 = fma(_1559, _1631, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1599 = _1629;
        _1589 = _1633;
        _1593 = _1635;
    }
    float _1637 = _1599;
    float _1639 = _1589;
    float _1641 = _1593;
    float _1643 = _1637;
    float _1645 = _1639;
    float _1647 = _1641;
    if (!_1385)
    {
        float _1649 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1651 = _356 + _1649;
        float _1653 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1655 = _358 + _1653;
        float _1657 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1659 = -_356;
        float _1661 = _1659 + _1637;
        float _1663 = _1651 * _1651;
        float _1665 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1667 = _360 + _1665;
        float _1669 = -_358;
        float _1671 = _1669 + _1639;
        float _1673 = -_360;
        float _1675 = _1673 + _1641;
        float _1677 = fma(_1655, _1655, _1663);
        float _1679 = fma(_1667, _1667, _1677);
        float _1681 = sqrt(_1679);
        float _1683 = precise::min(_1681, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1685 = _1683 * _1657;
        float _1687 = fma(_1661, _1685, _356);
        float _1689 = fma(_1671, _1685, _358);
        float _1691 = fma(_1675, _1685, _360);
        _1643 = _1687;
        _1645 = _1689;
        _1647 = _1691;
    }
    float _1693 = _1643;
    float _1695 = _1645;
    float _1697 = _1647;
    if (_671)
    {
        _1583 = 1.0;
    }
    float _1699 = _1583;
    float _1701 = _1699;
    if (!_671)
    {
        int _1703 = _729 << 4;
        int _1705 = _1703 + 2048;
        uint _1707 = uint(int(uint(_1705) >> uint(2)));
        uint _1709 = uint(int(uint(int(_1707)) >> uint(2)));
        int _1711 = int(_1707) & 3;
        float _1713 = (*spvDescriptorSet0.vp_c15)._m0[int(_1709)][_1711];
        int _1715 = int(_1707) + 1;
        uint _1717 = uint(int(uint(_1715) >> uint(2)));
        int _1719 = _1715 & 3;
        float _1721 = (*spvDescriptorSet0.vp_c15)._m0[int(_1717)][_1719];
        int _1723 = _1705 + 8;
        uint _1725 = uint(int(uint(_1723) >> uint(2)));
        uint _1727 = uint(int(uint(int(_1725)) >> uint(2)));
        int _1729 = int(_1725) & 3;
        float _1731 = (*spvDescriptorSet0.vp_c15)._m0[int(_1727)][_1729];
        int _1733 = int(_1725) + 1;
        uint _1735 = uint(int(uint(_1733) >> uint(2)));
        int _1737 = _1733 & 3;
        float _1739 = (*spvDescriptorSet0.vp_c15)._m0[int(_1735)][_1737];
        float _1741 = _430 * _1721;
        float _1743 = fma(_358, _1713, _1741);
        float _1745 = fma(_360, _1731, _1743);
        float _1747 = _1745 + _1739;
        float _1749 = precise::clamp(_1747, 0.0, 1.0);
        float _1751 = -_1749;
        float _1753 = _1751 + _1049;
        float _1755 = fma(_1753, 500.0, 1.5);
        float _1757 = exp2(_1755);
        float _1759 = 0.0 + _1757;
        float _1761 = precise::clamp(_1759, 0.0, 1.0);
        _1701 = _1761;
    }
    float _1763 = _1701;
    float _1765 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1767 = _1693 + _1765;
    float _1769 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1771 = _1695 + _1769;
    float _1773 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1775 = _1697 + _1773;
    float _1777 = _1767 * _1767;
    float _1779 = fma(_1771, _1771, _1777);
    float _1781 = fma(_1775, _1775, _1779);
    float _1783 = rsqrt(_1781);
    float _1785 = sqrt(_1781);
    float _1787 = _1783 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1789 = _1771 * _1787;
    float _1791 = _1775 * _1787;
    float _1793 = _1789 * _1789;
    float _1795 = _1791 * _1791;
    float _1797 = _1793 + _1795;
    float _1799 = sqrt(_1797);
    bool _1801 = _1799 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1803 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1805 = _1799 + _1803;
    float _1807 = _1783;
    float _1809 = _1805;
    float _1811 = _1767;
    float _1813 = _1787;
    float _1815 = _1797;
    if (_1801)
    {
        float _1817 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1807 = _1817;
    }
    float _1819 = _1807;
    float _1821 = _1819;
    if (_1801)
    {
        float _1823 = _1805 * _1819;
        _1809 = _1823;
    }
    float _1825 = _1809;
    if (_1801)
    {
        float _1827 = rsqrt(_1797);
        _1821 = _1827;
    }
    float _1829 = _1821;
    float _1831 = _1829;
    if (_1801)
    {
        float _1833 = _1825 * 0.15915493667125701904296875;
        _1585 = _1833;
    }
    float _1835 = _1585;
    float _1837 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1839 = _1775;
    if (_1801)
    {
        float _1841 = _1835 * 6.283185482025146484375;
        float _1843 = sin(_1841);
        _1839 = _1843;
    }
    float _1845 = _1839;
    float _1847 = precise::max(0.0, _1837);
    float _1849 = -_1787;
    float _1851 = -_1847;
    float _1853 = fma(_1767, _1849, _1851);
    float _1855 = (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1857 = _1847;
    if (_1801)
    {
        float _1859 = _1835 * 6.283185482025146484375;
        float _1861 = cos(_1859);
        _1855 = _1861;
    }
    float _1863 = _1855;
    if (_1801)
    {
        float _1865 = _1853 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1811 = _1865;
    }
    float _1867 = _1811;
    float _1869 = _1845;
    float _1871 = _1867;
    if (_1801)
    {
        float _1873 = fma(_1845, _1867, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1869 = _1873;
    }
    float _1875 = _1869;
    float _1877 = _1875;
    if (!_1801)
    {
        _1871 = _1853;
    }
    float _1879 = _1871;
    float _1881 = _1879;
    if (_1801)
    {
        float _1883 = _1829 * _1875;
        _1813 = _1883;
    }
    float _1885 = _1813;
    if (!_1801)
    {
        _1831 = _1789;
    }
    float _1887 = _1831;
    float _1889 = _1887;
    if (!_1801)
    {
        _1877 = _1793;
    }
    float _1891 = _1877;
    float _1893 = _1891;
    float _1895 = _1863;
    if (_1801)
    {
        float _1897 = _1863 + (-1.0);
        _1857 = _1897;
    }
    float _1899 = _1857;
    float _1901 = _1899;
    if (_1801)
    {
        float _1903 = _1789 * _1885;
        _1889 = _1903;
    }
    float _1905 = _1889;
    float _1907 = _1693 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_1801)
    {
        float _1909 = _1899 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1815 = _1909;
    }
    float _1911 = _1815;
    if (!_1801)
    {
        _1901 = _1791;
    }
    float _1913 = _1901;
    float _1915 = _1913;
    if (_1801)
    {
        float _1917 = _1791 * _1885;
        _1915 = _1917;
    }
    float _1919 = _1915;
    if (_1801)
    {
        float _1921 = _1905 * _1905;
        _1893 = _1921;
    }
    float _1923 = _1893;
    if (_1801)
    {
        float _1925 = fma(_1853, _1863, _1911);
        _1881 = _1925;
    }
    float _1927 = _1881;
    if (!_1801)
    {
        _1895 = _1795;
    }
    float _1929 = _1895;
    float _1931 = _1929;
    if (_1801)
    {
        float _1933 = _1919 * _1919;
        _1931 = _1933;
    }
    float _1935 = _1931;
    float _1937 = _1693 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1939 = fma(_1927, _1927, _1923);
    float _1941 = fma(_1695, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1907);
    float _1943 = fma(_1695, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1937);
    float _1945 = _1939 + _1935;
    float _1947 = _1693 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1949 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1951 = fma(_1785, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1949);
    float _1953 = precise::clamp(_1951, 0.0, 1.0);
    float _1955 = fma(_1697, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1943);
    float _1957 = rsqrt(_1945);
    float _1959 = _1693 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1961 = fma(_1695, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1947);
    float _1963 = -_1953;
    float _1965 = _1963 + 1.0;
    float _1967 = _1955 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1969 = fma(_1695, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1959);
    float _1971 = fma(_1697, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1961);
    float _1973 = fma(_1697, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1941);
    float _1975 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1977 = fma(_1697, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1969);
    float _1979 = _1971 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1981 = abs(_1965);
    float _1983 = log2(_1981);
    float _1985 = _1967 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1987 = _1977 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1989 = _1979 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1991 = _1973 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1993 = _1957 * _1905;
    float _1995 = _1957 * _1927;
    float _1997 = fma(_1987, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1989);
    float _1999 = _1957 * _1919;
    float _2001 = _1993 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2003 = -_1985;
    float _2005 = fma(_2003, _1975, 1.0);
    float _2007 = fma(_1967, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1997);
    float _2009 = _1979 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2011 = -_2001;
    float _2013 = fma(_1995, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2011);
    float _2015 = _1995 + 1.0;
    float _2017 = fma(_1991, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2007);
    float _2019 = _1983 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2021 = -_1999;
    float _2023 = fma(_2021, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2013);
    float _2025 = log2(_2005);
    float _2027 = _1979 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2029 = fma(_1987, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2009);
    float _2031 = fma(_2023, -0.5, 0.5);
    float _2033 = fma(_2023, 0.5, 0.5);
    float _2035 = fma(_1987, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2027);
    float _2037 = fma(_1967, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2029);
    float _2039 = 1.0 / _2017;
    float _2041 = fma(_2033, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2043 = fma(_1967, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2035);
    float _2045 = fma(_1991, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2037);
    float _2047 = fma(_2033, _2041, -0.212114393711090087890625);
    float _2049 = fma(_1991, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2043);
    float _2051 = exp2(_2019);
    float _2053 = _2025 * 0.693147182464599609375;
    float _2055 = _2053 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2057 = sqrt(_2031);
    float _2059 = fma(_2033, _2047, 1.570728778839111328125);
    float _2061 = _2049 * _2039;
    float _2063 = _2045 * _2039;
    float _2065 = fma(_2063, -0.5, 0.5);
    float _2067 = -_1995;
    float _2069 = fma(_2051, _2015, _2067);
    float _2071 = fma(_2061, 0.5, 0.5);
    float _2073 = fma(_2069, 0.5, 0.5);
    float _2075 = _2057 * 0.636619746685028076171875;
    float3 _6008 = float3(_2071, _2065, _2055);
    float _2077 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6008, float3(0.0), isnan(_6008)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6008, float3(0.0), isnan(_6008)), level(0.0)).x;
    float3 _6017 = float3(_2071, _2065, _2055);
    float4 _2080 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6017, float3(0.0), isnan(_6017)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6017, float3(0.0), isnan(_6017)), level(0.0)).xyzw;
    float _2082 = _2080.x;
    float _2084 = _2080.y;
    float _2086 = _2080.z;
    float _2088 = _2080.w;
    float _2090 = -_2059;
    float _2092 = fma(_2075, _2090, 1.0);
    float2 _6038 = float2(_2092, _2073);
    float3 _2096 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6038, float2(0.0), isnan(_6038)), level(0.0)), spvDescriptorSet0.dm_border, 6u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6038, float2(0.0), isnan(_6038)), level(0.0)).xyz;
    float _2098 = _2096.x;
    float _2100 = _2096.y;
    float _2102 = _2096.z;
    float _2104 = abs(_478);
    float _2106 = log2(_2104);
    float _2108 = in.m_81.x;
    float _2110 = in.m_81.y;
    float _2112 = in.m_81.z;
    float _2114 = in.m_81.w;
    float _2116 = _1979 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_83.x = _1063;
    float _2118 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2120 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2122 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2124 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2126 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2128 = _2106 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2130 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2132 = _2124 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2134 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _2136 = _1503 != 0.0;
    bool _2138 = isnan(_1503);
    bool _2140 = _2136 || _2138;
    bool _2142 = isnan(0.0);
    bool _2144 = _2140 || _2142;
    float _2146 = in.m_85.x;
    float _2148 = in.m_85.y;
    float _2150 = in.m_85.z;
    float _2152 = exp2(_2128);
    float _2154 = _2118 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2156 = _1069 == 0.0;
    bool _2158 = !_2144;
    bool _2160 = _2156 && _2158;
    float _2162 = _1475 * _2110;
    float _2164 = _2126 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2166 = -_2110;
    float _2168 = _1431 * _2166;
    float _2170 = fma(_1457, _2108, _2162);
    bool _2172 = _1075 == 0.0;
    bool _2174 = _2172 && _2160;
    float _2176 = _2120 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2178 = _2134 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2180 = _2122 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_87.x = _2154;
    out.m_87.y = _2164;
    out.m_87.z = _2132;
    out.m_87.w = _2130;
    float _2182 = fma(_1473, _2108, _2168);
    float _2184 = fma(_1471, _2112, _2170);
    float _2186 = fma(_2152, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2188 = precise::clamp(_2186, 0.0, 1.0);
    out.m_89.x = _2176;
    out.m_89.y = _2178;
    out.m_89.z = _2180;
    float _2190 = fma(_1481, _2112, _2182);
    bool _2192 = _478 <= 8000.0;
    bool _2194 = isnan(_478);
    bool _2196 = _2192 || _2194;
    bool _2198 = isnan(8000.0);
    bool _2200 = _2196 || _2198;
    float _2202 = float(_2200);
    float _2204 = fma(_1987, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2116);
    out.m_91.x = _951;
    out.m_91.y = _953;
    float _2206 = -_1043;
    float _2208 = _2206 + 1.0;
    float _2210 = fma(_1967, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2204);
    out.m_93.x = _1021;
    out.m_93.y = _605;
    float _2212 = _1479 * _2110;
    float _2214 = fma(_2188, -2.0, 3.0);
    float _2216 = _2188 * _2188;
    float _2218 = _2184 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2220 = fma(_1467, _2108, _2212);
    float _2222 = _2184 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2224 = _2216 * _2214;
    float _2226 = fma(_2190, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2218);
    float _2228 = fma(_1459, _2112, _2220);
    float _2230 = fma(_2190, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2222);
    float _2232 = _2230;
    float _2234 = _2176;
    float _2236 = _2180;
    float _2238 = _2017;
    float _2240 = _2045;
    if (_2174)
    {
        _981 = _2148;
    }
    float _2242 = _981;
    float _2244 = _2184 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2246 = fma(_2228, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2226);
    float _2248 = fma(_2228, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2230);
    float _2250 = _2242;
    if (_2174)
    {
        _2232 = _2242;
    }
    float _2252 = _2232;
    float _2254 = fma(_2190, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2244);
    float _2256 = _2252;
    if (!_2174)
    {
        _2250 = _2148;
    }
    float _2258 = _2250;
    float _2260 = _2112 * _2146;
    if (_2174)
    {
        _2234 = _2146;
    }
    float _2262 = _2234;
    float _2264 = fma(_2228, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2254);
    float _2266 = _2110 * _2150;
    float _2268 = _2108 * _2258;
    float _2270 = -_2260;
    float _2272 = fma(_2108, _2150, _2270);
    float _2274 = _2262;
    if (!_2174)
    {
        float _2276 = fma(_1503, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2258);
        _2256 = _2276;
    }
    float _2278 = _2256;
    float _2280 = -_2266;
    float _2282 = fma(_2112, _2258, _2280);
    float _2284 = -_2268;
    float _2286 = fma(_2110, _2146, _2284);
    float _2288 = _2272 * _2114;
    out.m_95.x = _2246;
    out.m_95.y = _2248;
    out.m_95.z = _2264;
    if (!_2174)
    {
        float _2290 = fma(_1069, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2146);
        _2274 = _2290;
    }
    float _2292 = _2274;
    float _2294 = _2282 * _2114;
    float _2296 = -_2278;
    float _2298 = _1431 * _2296;
    float _2300 = -_2288;
    float _2302 = _1431 * _2300;
    float _2304 = _2286 * _2114;
    if (_2174)
    {
        _2236 = _2150;
    }
    float _2306 = _2236;
    float _2308 = _2306;
    if (!_2174)
    {
        float _2310 = fma(_1075, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2150);
        _2308 = _2310;
    }
    float _2312 = _2308;
    float _2314 = fma(_1473, _2294, _2302);
    float _2316 = fma(_1473, _2292, _2298);
    out.m_97.x = _1695;
    out.m_97.y = _1693;
    out.m_97.z = _1697;
    bool _2318 = _1785 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2320 = isnan(_1785);
    bool _2322 = _2318 || _2320;
    bool _2324 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2326 = _2322 || _2324;
    float _2328 = _1475 * _2278;
    float _2330 = _1475 * _2288;
    float _2332 = _1479 * _2278;
    float _2334 = _1479 * _2288;
    float _2336 = fma(_1457, _2292, _2328);
    float _2338 = fma(_1457, _2294, _2330);
    float _2340 = fma(_1481, _2304, _2314);
    float _2342 = fma(_1467, _2294, _2334);
    float _2344 = fma(_1471, _2312, _2336);
    float _2346 = fma(_1471, _2304, _2338);
    float _2348 = fma(_1467, _2292, _2332);
    float _2350 = fma(_1459, _2304, _2342);
    float _2352 = fma(_1481, _2312, _2316);
    float _2354 = _2346 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2356 = _2346 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2358 = _2344 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2360 = fma(_1459, _2312, _2348);
    float _2362 = fma(_2340, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2354);
    float _2364 = fma(_2340, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2356);
    float _2366 = fma(_2352, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2358);
    float _2368 = _2346 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2370 = fma(_2350, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2362);
    float _2372 = fma(_2350, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2364);
    float _2374 = _2344 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2376 = _2344 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2378 = -_2224;
    float _2380 = _2378 + 1.0;
    float _2382 = fma(_2340, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2368);
    float _2384 = fma(_2352, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2374);
    float _2386 = fma(_2352, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2376);
    float _2388 = fma(_2350, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2382);
    float _2390 = fma(_2360, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2384);
    float _2392 = fma(_2360, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2386);
    float _2394 = fma(_2360, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2366);
    float _2396 = _1983 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2398 = fma(_2380, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2224);
    float _2400 = _2017 * 0.5;
    out.m_99.x = _2370;
    out.m_99.y = _2372;
    out.m_99.z = _2388;
    float _2402 = fma(_1991, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2210);
    float _2404 = _2202 * _2398;
    float _2406 = exp2(_2396);
    out.m_101.x = (*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2408 = _2404 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.gl_Position.x = _2049;
    out.gl_Position.y = _2045;
    out.gl_Position.z = _2402;
    out.gl_Position.w = _2017;
    float _2410 = _2208 * _2408;
    float _2412 = precise::clamp(_2410, 0.0, 1.0);
    float _2414 = fma(_2045, -0.5, _2400);
    float _2416 = _2400;
    float _2418 = _2402;
    if (!_993)
    {
        _2416 = 1.0;
    }
    float _2420 = _2416;
    float _2422 = -_2412;
    float _2424 = fma(_2422, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2426 = _2420;
    if (_993)
    {
        bool _2428 = _1055 >= _1015;
        bool _2430 = isnan(_1055);
        bool _2432 = _2428 || _2430;
        bool _2434 = isnan(_1015);
        bool _2436 = _2432 || _2434;
        float _2438 = float(_2436);
        _2426 = _2438;
    }
    float _2440 = _2426;
    float _2442 = _2049 + _2017;
    out.m_103.x = _2390;
    out.m_103.y = _2392;
    out.m_103.z = _2394;
    float _2444 = _2402 + _2017;
    float _2446 = -_2406;
    float _2448 = _2446 + 1.0;
    float _2450 = _2440 * _1763;
    float _2452 = _2442 * 0.5;
    float _2454 = _2444 * 0.5;
    float _2456 = _2448 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2458 = -_2450;
    float _2460 = fma(_2458, _2424, 1.0);
    float _2462 = precise::clamp(_2460, 0.0, 1.0);
    float _2464 = _2452;
    if (!_2326)
    {
        _2238 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2466 = _2238;
    float _2468 = -_2456;
    float _2470 = _2468 + 1.0;
    float _2472 = _2462 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_105.x = _2452;
    out.m_105.y = _2414;
    out.m_105.z = _2454;
    out.m_105.w = _2017;
    float _2474 = _2470;
    float _2476 = _2466;
    float _2478 = _2466;
    if (!_2326)
    {
        _2418 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2480 = _2418;
    float _2482 = _2480;
    float _2484 = _2480;
    if (!_2326)
    {
        _2240 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2486 = _2240;
    out.m_107.x = _2472;
    float _2488 = _2486;
    float _2490 = _2486;
    if (!_2326)
    {
        _2464 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2492 = _2464;
    float _2494 = _2456 * _2077;
    float _2496 = _2088 * _2470;
    float _2498 = _2492;
    float _2500 = _2492;
    if (!_2326)
    {
        _2474 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2502 = _2474;
    float _2504 = _2088 * _2494;
    float _2506 = _2102 * _2494;
    float _2508 = fma(_2098, _2504, _2082);
    float _2510 = fma(_2100, _2504, _2084);
    float _2512 = _2504;
    float _2514 = _2502;
    float _2516 = _2502;
    if (!_2326)
    {
        _2512 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2518 = _2512;
    float _2520 = fma(_2088, _2506, _2086);
    out.m_109.x = _2508;
    out.m_109.y = _2510;
    out.m_109.z = _2520;
    out.m_109.w = _2496;
    bool _2522 = !_2326;
    float _2524 = _2518;
    float _2526 = _2518;
    if (!_2522)
    {
        bool _2528 = _1785 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2530 = isnan(_1785);
        bool _2532 = _2528 || _2530;
        bool _2534 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2536 = _2532 || _2534;
        if (!_2536)
        {
            float _2538 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2540 = _1785 + _2538;
            float _2542 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2544 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2542;
            float _2546 = 1.0 / _2544;
            float _2548 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2550 = _2548 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2552 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2554 = _2552 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2556 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2558 = _2556 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2560 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2562 = _2560 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2564 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2566 = _2564 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2568 = _2540 * _2546;
            float _2570 = precise::clamp(_2568, 0.0, 1.0);
            float _2572 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2574 = _2572 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2576 = fma(_2570, _2550, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2578 = fma(_2570, _2574, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2580 = fma(_2570, _2554, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2582 = fma(_2570, _2558, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2584 = fma(_2570, _2562, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2586 = fma(_2570, _2566, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2478 = _2578;
            _2516 = _2584;
            _2500 = _2576;
            _2490 = _2582;
            _2484 = _2580;
            _2526 = _2586;
            _2588 = true;
        }
        else
        {
            bool _2590 = _1785 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2592 = isnan(_1785);
            bool _2594 = _2590 || _2592;
            bool _2596 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2598 = _2594 || _2596;
            if (!_2598)
            {
                _2498 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2600 = _2498;
            _2500 = _2600;
            if (!_2598)
            {
                _2476 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2602 = _2476;
            _2478 = _2602;
            if (!_2598)
            {
                _2482 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2604 = _2482;
            _2484 = _2604;
            if (!_2598)
            {
                _2488 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2606 = _2488;
            _2490 = _2606;
            if (!_2598)
            {
                _2514 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2608 = _2514;
            _2516 = _2608;
            if (!_2598)
            {
                _2524 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2610 = _2524;
            bool _2612 = !_2598;
            _2526 = _2610;
            if (!_2612)
            {
                bool _2614 = _1785 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2616 = isnan(_1785);
                bool _2618 = _2614 || _2616;
                bool _2620 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2622 = _2618 || _2620;
                if (!_2622)
                {
                    float _2624 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2626 = _1785 + _2624;
                    float _2628 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2630 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2628;
                    float _2632 = 1.0 / _2630;
                    float _2634 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2636 = _2634 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2638 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2640 = _2638 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2642 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2644 = _2642 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2646 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2648 = _2646 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2650 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2652 = _2650 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2654 = _2626 * _2632;
                    float _2656 = precise::clamp(_2654, 0.0, 1.0);
                    float _2658 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2660 = _2658 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2662 = fma(_2656, _2636, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2664 = fma(_2656, _2660, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2666 = fma(_2656, _2640, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2668 = fma(_2656, _2644, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2670 = fma(_2656, _2648, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2672 = fma(_2656, _2652, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2478 = _2664;
                    _2516 = _2670;
                    _2500 = _2662;
                    _2490 = _2668;
                    _2484 = _2666;
                    _2526 = _2672;
                    _2588 = true;
                }
                else
                {
                    _2478 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2516 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2500 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2490 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2484 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2526 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2588 = false;
    float _2674 = _2478;
    float _2676 = _2516;
    float _2678 = _2500;
    float _2680 = _2490;
    float _2682 = _2484;
    float _2684 = _2526;
    float _2686 = fma(_2392, -0.5, 0.5);
    float _2688 = precise::clamp(_2686, 0.0, 1.0);
    float _2690 = -_2674;
    float _2692 = _2690 + _2676;
    float _2694 = -_2678;
    float _2696 = _2694 + _2680;
    float _2698 = -_2682;
    float _2700 = _2698 + _2684;
    bool _2702 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2704 = fma(_2688, _2692, _2674);
    float _2706 = fma(_2688, _2696, _2678);
    float _2708 = fma(_2688, _2700, _2682);
    float _2710 = _2704 * 0.586610972881317138671875;
    out.m_111.x = 0.0;
    float _2712 = fma(_2706, 0.298911988735198974609375, _2710);
    float _2714 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2716 = fma(_2708, 0.114477999508380889892578125, _2712);
    out.m_67.x = _2714;
    float _2718 = -_2716;
    float _2720 = _2706 + _2718;
    float _2722 = -_2716;
    float _2724 = _2704 + _2722;
    float _2726 = -_2716;
    float _2728 = _2708 + _2726;
    float _2730 = fma(_2720, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2716);
    float _2732 = fma(_2724, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2716);
    float _2734 = fma(_2728, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2716);
    out.m_113.x = _2730;
    out.m_113.y = _2732;
    out.m_113.z = _2734;
    if (!_2702)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2736 = -_1693;
    float _2738 = _2736 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2740 = -_1695;
    float _2742 = _2740 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2744 = -_1697;
    float _2746 = _2744 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2748 = _2738 * _2738;
    float _2750 = fma(_2742, _2742, _2748);
    float _2752 = fma(_2746, _2746, _2750);
    float _2754 = sqrt(_2752);
    float _2756 = rsqrt(_2752);
    float _2758 = -_2754;
    float _2760 = _2758 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2762 = _2760 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2764 = precise::clamp(_2762, 0.0, 1.0);
    float _2766 = _2742 * _2756;
    float _2768 = _2738 * _2756;
    float _2770 = abs(_2764);
    float _2772 = log2(_2770);
    float _2774 = _2746 * _2756;
    float _2776 = _2766 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2778 = _2392 * _2768;
    float _2780 = -_2768;
    float _2782 = -_2776;
    float _2784 = fma(_2780, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2782);
    float _2786 = fma(_2390, _2766, _2778);
    float _2788 = -_2774;
    float _2790 = fma(_2788, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2784);
    float _2792 = fma(_2394, _2774, _2786);
    float _2794 = precise::clamp(_2792, 0.0, 1.0);
    float _2796 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2798 = _2790 + _2796;
    float _2800 = _2772 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2802 = _2798 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2804 = precise::clamp(_2802, 0.0, 1.0);
    float _2806 = exp2(_2800);
    float _2808 = _2806 * _2804;
    float _2810 = _2794 * _2808;
    float _2812 = _2810 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2814 = _2810 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2816 = _2810 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_111.x = _2812;
    out.m_111.y = _2814;
    out.m_111.z = _2816;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_113 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_111 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_109 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2588 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _127 = in.m_60.w;
    float _129 = in.m_62.w;
    float _131 = trunc(_127);
    int _134 = int(_131);
    float _136 = -_129;
    float _138 = _136 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_65.y = _138;
    bool _142 = _134 >= 1;
    float _144 = 0.0;
    float _146 = as_type<float>(_134);
    float _148 = _138;
    if (!_142)
    {
        _144 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _150 = _144;
    if (!_142)
    {
        out.m_67.x = 0.0;
    }
    int _152 = 0;
    if (!_142)
    {
        float _154 = _150 * 5.0;
        _152 = as_type<int>(_154);
    }
    int _156 = _152;
    int _158 = _156;
    if (!_142)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2885 = as_type<float>(_156);
        out.gl_Position.z = _2885;
    }
    if (!_142)
    {
        return out;
    }
    bool _160 = _129 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _162 = isnan(_129);
    bool _164 = _160 || _162;
    bool _166 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _168 = _164 || _166;
    float _170 = float(_134);
    bool _172 = _138 >= _170;
    bool _174 = !_168;
    bool _176 = _172 || _174;
    if (_176)
    {
        _146 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _178 = _146;
    if (_176)
    {
        out.m_67.x = 0.0;
    }
    if (_176)
    {
        float _180 = _178 * 5.0;
        _158 = as_type<int>(_180);
    }
    int _182 = _158;
    if (_176)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2940 = as_type<float>(_182);
        out.gl_Position.z = _2940;
    }
    if (_176)
    {
        return out;
    }
    float _184 = in.m_69.w;
    float _186 = 1.0 / _170;
    float _188 = _138 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _190 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _192 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _194 = _190 || _192;
    bool _196 = isnan(1.0);
    bool _198 = _194 || _196;
    float _200 = in.m_62.x;
    float _202 = in.m_62.y;
    float _204 = in.m_62.z;
    float _206 = in.m_60.x;
    float _208 = in.m_60.y;
    float _210 = in.m_60.z;
    float _212 = 0.0;
    float _214 = _188;
    if (!_198)
    {
        float _216 = _188 * _188;
        float _218 = _216 * 0.5;
        _212 = _218;
    }
    float _220 = _212;
    float _222 = _220;
    if (!_198)
    {
        float _224 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _222 = _224;
    }
    float _226 = _222;
    bool _228 = !_198;
    float _230 = _226;
    if (!_228)
    {
        float _232 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _234 = log2(_232);
        float _236 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _238 = _236 + 1.0;
        float _240 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _242 = _188 * _234;
        float _244 = 1.0 / _238;
        float _246 = _240 * 0.693147182464599609375;
        float _248 = exp2(_242);
        float _250 = 1.0 / _246;
        float _252 = _248 + (-1.0);
        float _254 = -_252;
        float _256 = fma(_254, _250, _188);
        float _258 = _256 * _244;
        float _260 = _258 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _230 = _260;
    }
    float _262 = _230;
    bool _264 = !_198;
    if (!_264)
    {
        float _266 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _268 = log2(_266);
        float _270 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _272 = _270 + 1.0;
        float _274 = 1.0 / _272;
        float _276 = _188 * _268;
        float _278 = exp2(_276);
        float _280 = -_278;
        float _282 = _280 + 1.0;
        float _284 = _282 * _274;
        _214 = _284;
    }
    float _286 = _214;
    bool _288 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _290 = _262 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _292 = _262 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _294 = _262 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _296 = _138 * _186;
    float _298 = fma(_286, _200, _290);
    float _300 = fma(_286, _202, _292);
    float _302 = fma(_286, _204, _294);
    float _304 = fma(_298, _184, _206);
    float _306 = fma(_300, _184, _208);
    float _308 = fma(_302, _184, _210);
    bool _310 = !_288;
    float _312 = _296;
    if (!_310)
    {
        float _314 = in.m_71.x;
        float _316 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _318 = _314 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _320 = fma(_318, (*spvDescriptorSet0.vp_c9)._m0[12].x, _138);
        float _322 = _320 * _316;
        float _324 = floor(_322);
        float _326 = -_324;
        float _328 = _322 + _326;
        _312 = _328;
    }
    float _330 = _312;
    float _332 = _306 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _334 = _306 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _336 = _306 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _338 = in.m_73.y;
    float _340 = fma(_304, (*spvDescriptorSet0.vp_c10)._m0[5].x, _332);
    float _342 = fma(_304, (*spvDescriptorSet0.vp_c10)._m0[4].x, _334);
    float _344 = fma(_304, (*spvDescriptorSet0.vp_c10)._m0[6].x, _336);
    float _346 = in.m_71.y;
    float _348 = fma(_308, (*spvDescriptorSet0.vp_c10)._m0[5].z, _340);
    float _350 = fma(_308, (*spvDescriptorSet0.vp_c10)._m0[4].z, _342);
    float _352 = fma(_308, (*spvDescriptorSet0.vp_c10)._m0[6].z, _344);
    float _354 = in.m_71.x;
    float _356 = _348 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _358 = _350 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _360 = _352 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _362 = _356 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _364 = in.m_73.x;
    float _366 = fma(_358, (*spvDescriptorSet0.vp_c8)._m0[11].x, _362);
    int _368 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _370 = _368 != 0;
    float _372 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _374 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _376 = _374 != 0;
    float _378 = fma(_360, (*spvDescriptorSet0.vp_c8)._m0[11].z, _366);
    float _380 = _356 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    int _382 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _384 = _382 != 0;
    float _386 = -_338;
    float _388 = _386 + 1.0;
    float _390 = _378 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _392 = fma(_358, (*spvDescriptorSet0.vp_c8)._m0[10].x, _380);
    int _394 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _396 = _394 != 0;
    float _398 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _400 = 1.0 / _390;
    float _402 = fma(_360, (*spvDescriptorSet0.vp_c8)._m0[10].z, _392);
    float _404 = in.m_71.z;
    bool _406 = _346 > 0.5;
    float _408 = _402 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    int _410 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _412 = _410 != 0;
    float _414 = _408 + _390;
    float _416 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _418 = _414 * _400;
    float _420 = _418 * 0.5;
    float _422 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _424 = fma(_360, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _426 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _428 = fma(_420, (*spvDescriptorSet0.vp_c8)._m0[30].w, _426);
    float _430 = _356 + _422;
    float _432 = _354 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _434 = _406 ? as_type<int>(_388) : as_type<int>(_338);
    float _436 = 1.0 / _428;
    float _438 = _430 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _440 = _430 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _442 = -_398;
    float _444 = fma(_432, 2.0, _442);
    float _446 = fma(_358, (*spvDescriptorSet0.vp_c15)._m0[126].x, _438);
    float _448 = fma(_358, (*spvDescriptorSet0.vp_c15)._m0[127].x, _440);
    float _450 = _384 ? as_type<float>(_434) : _338;
    float _452 = floor(_424);
    float _454 = fma(_360, (*spvDescriptorSet0.vp_c15)._m0[126].z, _446);
    float _456 = fma(_360, (*spvDescriptorSet0.vp_c15)._m0[127].z, _448);
    float _458 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _460 = _346 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _462 = _454 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _464 = _456 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _466 = _448;
    float _468 = _364;
    int _470 = 2;
    float _472 = _338;
    if (!_370)
    {
        _466 = _364;
    }
    float _474 = _466;
    float _476 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _478 = _436 * _476;
    float _480 = trunc(_462);
    int _482 = int(_480);
    float _484 = fma(_460, -2.0, _458);
    float _486 = _372 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _488 = 0.0;
    float _490 = _474;
    if (!_370)
    {
        _488 = _474;
    }
    float _492 = _488;
    float _494 = (*spvDescriptorSet0.vp_c9)._m0[89].z + (*spvDescriptorSet0.vp_c9)._m0[89].y;
    bool _496 = _478 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _498 = fma(_486, _450, -0.5);
    bool _500 = _478 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _502 = trunc(_464);
    int _504 = int(_502);
    bool _506 = !_496;
    int _508 = _506 ? 0 : 1;
    float _510 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _512 = _508;
    bool _514 = _500;
    float _516 = _492;
    if (_370)
    {
        _490 = _364;
    }
    float _518 = _490;
    float _520 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[76].y, _484);
    int _522 = as_type<int>(_518);
    if (_412)
    {
        _468 = _346;
    }
    float _524 = _468;
    float _526 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[78].w, _510);
    float _528 = _524;
    if (!_412)
    {
        _528 = _354;
    }
    float _530 = _528;
    float _532 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _534 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _536 = _482 + _534;
    int _538 = _536 + 1;
    float _540 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[77].w, _526);
    float _542 = as_type<float>(_538);
    if (!_496)
    {
        _470 = 1;
    }
    int _544 = _470;
    float _546 = _530 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _548 = _544;
    if (!_500)
    {
        _548 = _508;
    }
    int _550 = _548;
    if (_370)
    {
        float _552 = -_518;
        float _554 = _552 + 1.0;
        _512 = as_type<int>(_554);
    }
    int _556 = _512;
    if (_370)
    {
        bool _558 = _354 > 0.5;
        _514 = _558;
    }
    bool _560 = _514;
    float _562 = -_520;
    float _564 = fma(_540, _498, _562);
    int _566 = _550 << 6;
    int _568 = 0;
    if (_376)
    {
        float _570 = -_518;
        float _572 = _570 + 1.0;
        _568 = as_type<int>(_572);
    }
    int _574 = _568;
    int _576 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _578 = _504 + _576;
    int _580 = _578 + 1;
    float _582 = _416 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _584 = _566 + 96;
    uint _587 = uint(int(uint(_584) >> uint(2)));
    uint _589 = uint(int(uint(int(_587)) >> uint(2)));
    int _591 = int(_587) & 3;
    float _593 = (*spvDescriptorSet0.vp_c15)._m0[int(_589)][_591];
    int _595 = int(_587) + 1;
    uint _597 = uint(int(uint(_595) >> uint(2)));
    int _599 = _595 & 3;
    float _601 = (*spvDescriptorSet0.vp_c15)._m0[int(_597)][_599];
    bool _603 = _538 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _605 = _564 + 0.5;
    int _607 = _538 | _580;
    float _609 = _532 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    if (_370)
    {
        float _611 = _560 ? as_type<float>(_556) : _518;
        _516 = _611;
    }
    float _613 = _516;
    bool _615 = _607 < 0;
    bool _617 = _615 || _603;
    int _619 = _566 + 48;
    uint _621 = uint(int(uint(_619) >> uint(2)));
    uint _623 = uint(int(uint(int(_621)) >> uint(2)));
    int _625 = int(_621) & 3;
    float _627 = (*spvDescriptorSet0.vp_c15)._m0[int(_623)][_625];
    int _629 = int(_621) + 1;
    uint _631 = uint(int(uint(_629) >> uint(2)));
    int _633 = _629 & 3;
    float _635 = (*spvDescriptorSet0.vp_c15)._m0[int(_631)][_633];
    float _637 = fma(_582, _613, -0.5);
    float _639 = 0.0;
    if (_412)
    {
        _639 = _404;
    }
    float _641 = _639;
    float _643 = fma(_358, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _645 = _641;
    int _647 = as_type<int>(_643);
    if (!_412)
    {
        _645 = _346;
    }
    float _649 = _645;
    int _651 = _566 + 104;
    uint _653 = uint(int(uint(_651) >> uint(2)));
    uint _655 = uint(int(uint(int(_653)) >> uint(2)));
    int _657 = int(_653) & 3;
    float _659 = (*spvDescriptorSet0.vp_c15)._m0[int(_655)][_657];
    int _661 = int(_653) + 1;
    uint _663 = uint(int(uint(_661) >> uint(2)));
    int _665 = _661 & 3;
    float _667 = (*spvDescriptorSet0.vp_c15)._m0[int(_663)][_665];
    bool _669 = _580 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _671 = _669 || _617;
    float _673 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _675 = floor(_643);
    float _677 = fma(_649, (*spvDescriptorSet0.vp_c9)._m0[89].z, _494);
    float _679 = 0.0;
    if (!_376)
    {
        _679 = _518;
    }
    float _681 = _679;
    float _683 = fma(_546, -2.0, _673);
    float _685 = -_452;
    float _687 = _424 + _685;
    int _689 = _566 + 80;
    uint _691 = uint(int(uint(_689) >> uint(2)));
    uint _693 = uint(int(uint(int(_691)) >> uint(2)));
    int _695 = int(_691) & 3;
    float _697 = (*spvDescriptorSet0.vp_c15)._m0[int(_693)][_695];
    int _699 = int(_691) + 1;
    uint _701 = uint(int(uint(_699) >> uint(2)));
    int _703 = _699 & 3;
    float _705 = (*spvDescriptorSet0.vp_c15)._m0[int(_701)][_703];
    float _707 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[89].x, _677);
    float _709 = _681;
    int _711 = as_type<int>(_707);
    if (_376)
    {
        float _713 = _406 ? as_type<float>(_574) : _518;
        _709 = _713;
    }
    float _715 = _709;
    float _717 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _719 = _404 > 0.5;
    float _721 = _707 * (-0.15915493667125701904296875);
    int _723 = as_type<int>(_715);
    if (!_671)
    {
        int _725 = _580 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _727 = _725 + _538;
        _522 = _727;
    }
    int _729 = _522;
    float _731 = fma(_609, _715, -0.5);
    int _733 = _566 + 56;
    uint _735 = uint(int(uint(_733) >> uint(2)));
    uint _737 = uint(int(uint(int(_735)) >> uint(2)));
    int _739 = int(_735) & 3;
    float _741 = (*spvDescriptorSet0.vp_c15)._m0[int(_737)][_739];
    int _743 = int(_735) + 1;
    uint _745 = uint(int(uint(_743) >> uint(2)));
    int _747 = _743 & 3;
    float _749 = (*spvDescriptorSet0.vp_c15)._m0[int(_745)][_747];
    if (_396)
    {
        float _751 = _719 ? _388 : _338;
        _472 = _751;
    }
    float _753 = _472;
    float _755 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[86].y, _683);
    float _757 = _721 * 6.283185482025146484375;
    float _759 = sin(_757);
    if (!_671)
    {
        int _761 = _729 << 2;
        _711 = _761;
    }
    int _763 = _711;
    float _765 = -_675;
    float _767 = _643 + _765;
    int _769 = _763;
    if (_412)
    {
        _542 = _354;
    }
    float _771 = _542;
    int _773 = _566 + 64;
    uint _775 = uint(int(uint(_773) >> uint(2)));
    uint _777 = uint(int(uint(int(_775)) >> uint(2)));
    int _779 = int(_775) & 3;
    float _781 = (*spvDescriptorSet0.vp_c15)._m0[int(_777)][_779];
    int _783 = int(_775) + 1;
    uint _785 = uint(int(uint(_783) >> uint(2)));
    int _787 = _783 & 3;
    float _789 = (*spvDescriptorSet0.vp_c15)._m0[int(_785)][_787];
    float _791 = _721 * 6.283185482025146484375;
    float _793 = cos(_791);
    float _795 = _771;
    if (!_671)
    {
        uint _797 = uint(int(uint(_729) >> uint(2)));
        _723 = int(_797);
    }
    int _799 = _723;
    float _801 = _717 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    if (!_671)
    {
        int _803 = 12 & _763;
        _769 = _803;
    }
    int _805 = _769;
    int _807 = _566 + 72;
    uint _809 = uint(int(uint(_807) >> uint(2)));
    uint _811 = uint(int(uint(int(_809)) >> uint(2)));
    int _813 = int(_809) & 3;
    float _815 = (*spvDescriptorSet0.vp_c15)._m0[int(_811)][_813];
    int _817 = int(_809) + 1;
    uint _819 = uint(int(uint(_817) >> uint(2)));
    int _821 = _817 & 3;
    float _823 = (*spvDescriptorSet0.vp_c15)._m0[int(_819)][_821];
    float _825 = _430 * _601;
    if (!_412)
    {
        _795 = _404;
    }
    float _827 = _795;
    if (!_671)
    {
        int _829 = _799 << 4;
        int _831 = _829 + _805;
        _647 = _831;
    }
    int _833 = _647;
    float _835 = fma(_358, _593, _825);
    float _837 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _839 = fma(_801, _753, -0.5);
    int _841 = _566 + 88;
    uint _843 = uint(int(uint(_841) >> uint(2)));
    uint _845 = uint(int(uint(int(_843)) >> uint(2)));
    int _847 = int(_843) & 3;
    float _849 = (*spvDescriptorSet0.vp_c15)._m0[int(_845)][_847];
    int _851 = int(_843) + 1;
    uint _853 = uint(int(uint(_851) >> uint(2)));
    int _855 = _851 & 3;
    float _857 = (*spvDescriptorSet0.vp_c15)._m0[int(_853)][_855];
    float _859 = fma(_360, _659, _835);
    float _861 = _827 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _863 = _659;
    if (!_671)
    {
        int _865 = _833 + 400;
        uint _867 = uint(int(uint(_865) >> uint(2)));
        uint _869 = uint(int(uint(int(_867)) >> uint(2)));
        int _871 = int(_867) & 3;
        float _873 = (*spvDescriptorSet0.vp_c15)._m0[int(_869)][_871];
        _863 = _873;
    }
    float _875 = _863;
    float _877 = _859 + _667;
    float _879 = _430 * _635;
    float _881 = -_837;
    float _883 = fma(_861, 2.0, _881);
    float _885 = _759 * _839;
    float _887 = _793 * _839;
    float _889 = fma(_358, _627, _879);
    float _891 = _430 * _705;
    float _893 = -_885;
    float _895 = fma(_793, _731, _893);
    float _897 = fma(_759, _731, _887);
    float _899 = 1.0 / _877;
    float _901 = fma(_358, _697, _891);
    float _903 = fma(_360, _741, _889);
    float _905 = -_138;
    float _907 = fma(_905, (*spvDescriptorSet0.vp_c9)._m0[86].x, _883);
    float _909 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _911 = _903 + _749;
    float _913 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _915 = _885;
    float _917 = _895;
    if (!_671)
    {
        float _919 = floor(_464);
        _915 = _919;
    }
    float _921 = _915;
    float _923 = _430 * _789;
    float _925 = fma(_354, (*spvDescriptorSet0.vp_c9)._m0[88].z, _909);
    float _927 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[88].w, _913);
    float _929 = fma(_358, _781, _923);
    float _931 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[87].z, _925);
    float _933 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[87].w, _927);
    float _935 = fma(_360, _815, _929);
    float _937 = _911 * _899;
    float _939 = fma(_931, _895, _907);
    float _941 = -_755;
    float _943 = fma(_933, _897, _941);
    float _945 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _947 = _935 + _823;
    bool _949 = _937 >= 0.0;
    float _951 = _939 + 0.5;
    float _953 = _943 + 0.5;
    float _955 = fma(_354, (*spvDescriptorSet0.vp_c9)._m0[78].z, _945);
    float _957 = _947 * _899;
    bool _959 = _937 <= 1.0;
    bool _961 = _959 && _949;
    float2 _4266 = float2(_951, _953);
    float _963 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, select(_4266, float2(0.0), isnan(_4266)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, select(_4266, float2(0.0), isnan(_4266)), level(0.0)).w;
    float _965 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[77].z, _955);
    float _967 = -_138;
    float _969 = fma(_967, (*spvDescriptorSet0.vp_c9)._m0[76].x, _444);
    bool _971 = _957 >= 0.0;
    bool _973 = _971 && _961;
    float _975 = _823;
    float _977 = _965;
    float _979 = _947;
    float _981 = _951;
    if (!_671)
    {
        float _983 = floor(_462);
        _975 = _983;
    }
    float _985 = _975;
    float _987 = fma(_360, _849, _901);
    float _989 = fma(_965, _637, _969);
    bool _991 = _957 <= 1.0;
    bool _993 = _991 && _973;
    if (!_671)
    {
        float _995 = -_921;
        float _997 = _464 + _995;
        _977 = _997;
    }
    float _999 = _977;
    float _1001 = _987 + _857;
    float _1003 = _875;
    if (!_671)
    {
        float _1005 = rint(_875);
        float _1007 = precise::max(_1005, 0.0);
        uint _1009 = uint(_1007);
        uint _1011 = clamp(_1009, 0u, 65535u);
        _1003 = as_type<float>(_1011);
    }
    float _1013 = _1003;
    float _1015 = _1001 * _899;
    if (_993)
    {
        float _1017 = float(_550);
        _979 = _1017;
    }
    float _1019 = _979;
    float _1021 = _989 + 0.5;
    if (!_671)
    {
        float _1023 = -_985;
        float _1025 = _462 + _1023;
        _917 = _1025;
    }
    float _1027 = _917;
    float _1029 = _755;
    if (_993)
    {
        float _1031 = rint(_1019);
        float _1033 = precise::max(_1031, 0.0);
        uint _1035 = uint(_1033);
        uint _1037 = clamp(_1035, 0u, 65535u);
        _1029 = as_type<float>(_1037);
    }
    float _1039 = _1029;
    float2 _4388 = float2(_1021, _605);
    float _1041 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_4388, float2(0.0), isnan(_4388)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_4388, float2(0.0), isnan(_4388)), level(0.0)).w;
    float2 _4396 = float2(_767, _687);
    float _1043 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4396, float2(0.0), isnan(_4396)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4396, float2(0.0), isnan(_4396)), level(0.0)).x;
    float _1045 = _999;
    if (!_671)
    {
        float3 _4411 = float3(_1027, _999, float(as_type<int>(_1013)));
        float3 _4415 = select(_4411, float3(0.0), isnan(_4411));
        float _1047 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _4415.xy, uint(rint(_4415.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _4415.xy, uint(rint(_4415.z)), level(0.0)).x;
        _1045 = _1047;
    }
    float _1049 = _1045;
    float _1051 = _1039;
    if (_993)
    {
        float3 _4430 = float3(_937, _957, float(as_type<int>(_1039)));
        float3 _4432 = select(_4430, float3(0.0), isnan(_4430));
        float _1053 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _4432.xy, uint(rint(_4432.z)), _1015, level(0.0));
        _1051 = _1053;
    }
    float _1055 = _1051;
    float _1057 = _346 * 2.0;
    float _1059 = _354 * 2.0;
    float _1061 = _404 * 2.0;
    float _1063 = in.m_75.x;
    float _1065 = floor(_1057);
    float _1067 = in.m_77.y;
    float _1069 = in.m_77.x;
    float _1071 = floor(_1059);
    float _1073 = _354 + _346;
    float _1075 = in.m_77.z;
    float _1077 = _1073 + (-1.0);
    float _1079 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1081 = log2(_1079);
    bool _1083 = _1065 > 0.0;
    bool _1085 = _1065 >= 0.0;
    bool _1087 = isnan(_1065);
    bool _1089 = _1085 || _1087;
    bool _1091 = isnan(0.0);
    bool _1093 = _1089 || _1091;
    float _1095 = fma(_1077, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1097 = _346 + _404;
    float _1099 = _346 + (-0.5);
    bool _1101 = _1071 > 0.0;
    float _1103 = _1097 + (-1.0);
    bool _1105 = _1071 >= 0.0;
    bool _1107 = isnan(_1071);
    bool _1109 = _1105 || _1107;
    bool _1111 = isnan(0.0);
    bool _1113 = _1109 || _1111;
    float _1115 = floor(_1061);
    int _1117 = _1093 ? 0 : 1;
    int _1119 = _1113 ? 0 : 1;
    int _1121 = ~_1117;
    int _1123 = _1121 + 1;
    int _1125 = _1123 + 1;
    int _1127 = ~_1119;
    int _1129 = _1127 + 1;
    int _1131 = _1129 + 1;
    int _1133 = _1125;
    int _1135 = _1131;
    if (!_1083)
    {
        int _1137 = ~_1117;
        int _1139 = _1137 + 1;
        _1133 = _1139;
    }
    int _1141 = _1133;
    float _1143 = _1081 * _138;
    int _1145 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1147 = _1145 != 0;
    int _1149 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1151 = _1149 != 0;
    int _1153 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1155 = _1153 != 0;
    float _1157 = fma(_1103, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    if (!_1101)
    {
        int _1159 = ~_1119;
        int _1161 = _1159 + 1;
        _1135 = _1161;
    }
    int _1163 = _1135;
    float _1165 = _354 + _404;
    bool _1167 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1169 = isnan(0.0);
    bool _1171 = _1167 || _1169;
    bool _1173 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1175 = _1171 || _1173;
    float _1177 = exp2(_1143);
    bool _1179 = !_1151;
    int _1181 = _1179 ? 0 : 1;
    float _1183 = _1165 + (-1.0);
    bool _1185 = !_1155;
    int _1187 = _1185 ? 0 : 1;
    float _1189 = _404 + (-0.5);
    int _1191 = abs(_1181);
    float _1193 = fma(_1183, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _1195 = abs(_1187);
    float _1197 = in.m_79.x;
    float _1199 = in.m_79.y;
    float _1201 = in.m_79.z;
    float _1203 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1205 = 1.0 + _1203;
    bool _1207 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1209 = isnan(1.0);
    bool _1211 = _1207 || _1209;
    bool _1213 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1215 = _1211 || _1213;
    float _1217 = _354 + (-0.5);
    float _1219 = float(_1191);
    float _1221 = 1.0 / _1205;
    float _1223 = float(_1163);
    bool _1225 = _1115 > 0.0;
    float _1227 = -_1177;
    float _1229 = _1227 + 1.0;
    bool _1231 = _1115 >= 0.0;
    bool _1233 = isnan(_1115);
    bool _1235 = _1231 || _1233;
    bool _1237 = isnan(0.0);
    bool _1239 = _1235 || _1237;
    float _1241 = _1219 * _1223;
    float _1243 = float(_1195);
    bool _1245 = !_1147;
    int _1247 = _1245 ? 0 : 1;
    float _1249 = float(_1141);
    float _1251 = _1175 ? _1229 : 0.0;
    float _1253 = _138 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    int _1255 = _1239 ? 0 : 1;
    float _1257 = _1243 * _1249;
    if (_1215)
    {
        float _1259 = _1251 * _1221;
        _148 = _1259;
    }
    float _1261 = _148;
    int _1263 = abs(_1247);
    float _1265 = _1241 * (-2.0);
    int _1267 = ~_1255;
    int _1269 = _1267 + 1;
    int _1271 = _1269 + 1;
    float _1273 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1275 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _1273;
    int _1277 = _1271;
    if (!_1225)
    {
        int _1279 = ~_1255;
        int _1281 = _1279 + 1;
        _1277 = _1281;
    }
    int _1283 = _1277;
    float _1285 = fma(_1157, _1265, _1157);
    float _1287 = fma(_1265, _1199, _1199);
    float _1289 = float(_1283);
    float _1291 = 1.0 / _1275;
    float _1293 = float(_1263);
    float _1295 = fma(_1099, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1287);
    float _1297 = _1257 * (-2.0);
    float _1299 = _1293 * _1289;
    float _1301 = fma(_1285, _1261, _1295);
    float _1303 = fma(_1297, _1201, _1201);
    float _1305 = fma(_1193, _1297, _1193);
    float _1307 = _1299 * (-2.0);
    float _1309 = _1301 * 0.15915493667125701904296875;
    float _1311 = fma(_1189, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1303);
    float _1313 = fma(_1307, _1197, _1197);
    float _1315 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1317 = _330 + _1315;
    float _1319 = fma(_1305, _1261, _1311);
    float _1321 = fma(_1095, _1307, _1095);
    float _1323 = fma(_1217, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1313);
    float _1325 = _1317 * _1291;
    bool _1327 = _330 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1329 = isnan(_330);
    bool _1331 = _1327 || _1329;
    bool _1333 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1335 = _1331 || _1333;
    float _1337 = float(_1335);
    float _1339 = _1319 * 0.15915493667125701904296875;
    bool _1341 = _330 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _1343 = isnan(_330);
    bool _1345 = _1341 || _1343;
    bool _1347 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _1349 = _1345 || _1347;
    float _1351 = float(_1349);
    float _1353 = fma(_1321, _1261, _1323);
    float _1355 = in.m_69.x;
    float _1357 = in.m_69.y;
    float _1359 = in.m_69.z;
    float _1361 = _1309 * 6.283185482025146484375;
    float _1363 = sin(_1361);
    float _1365 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1367 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1365;
    float _1369 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _1371 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _1369;
    float _1373 = _1353 * 0.15915493667125701904296875;
    float _1375 = fma(_1367, _1325, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _1377 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1379 = isnan(0.5);
    bool _1381 = _1377 || _1379;
    bool _1383 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1385 = _1381 || _1383;
    float _1387 = fma(_1371, _1325, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _1389 = _1309 * 6.283185482025146484375;
    float _1391 = cos(_1389);
    float _1393 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1395 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1393;
    float _1397 = fma(_1395, _1325, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _1399 = _1373 * 6.283185482025146484375;
    float _1401 = sin(_1399);
    float _1403 = -_1351;
    float _1405 = _1403 + 1.0;
    float _1407 = _1337 * _1405;
    float _1409 = -_1337;
    float _1411 = _1409 + 1.0;
    float _1413 = _1373 * 6.283185482025146484375;
    float _1415 = cos(_1413);
    float _1417 = _1387 * _1407;
    float _1419 = _1375 * _1407;
    float _1421 = _1397 * _1407;
    float _1423 = fma(_1411, (*spvDescriptorSet0.vp_c9)._m0[143].z, _1417);
    float _1425 = fma(_1411, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1419);
    float _1427 = fma(_1411, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1421);
    float _1429 = _1339 * 6.283185482025146484375;
    float _1431 = sin(_1429);
    float _1433 = _1401 * _1363;
    float _1435 = fma(_1351, (*spvDescriptorSet0.vp_c9)._m0[144].y, _1425);
    float _1437 = fma(_1351, (*spvDescriptorSet0.vp_c9)._m0[144].x, _1427);
    float _1439 = fma(_1351, (*spvDescriptorSet0.vp_c9)._m0[144].z, _1423);
    float _1441 = _1435 * _1357;
    float _1443 = _1437 * _1355;
    float _1445 = in.m_75.w;
    float _1447 = _1415 * _1391;
    float _1449 = _1415 * _1363;
    float _1451 = _1339 * 6.283185482025146484375;
    float _1453 = cos(_1451);
    float _1455 = _1439 * _1359;
    float _1457 = fma(_1431, _1447, _1433);
    float _1459 = fma(_1431, _1433, _1447);
    float _1461 = _1401 * _1391;
    float _1463 = _1455 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1465 = -_1449;
    float _1467 = fma(_1431, _1461, _1465);
    float _1469 = -_1461;
    float _1471 = fma(_1431, _1449, _1469);
    float _1473 = _1391 * _1453;
    float _1475 = _1415 * _1453;
    float _1477 = _1443 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1479 = _1401 * _1453;
    float _1481 = _1363 * _1453;
    float _1483 = _963 + _1063;
    float _1485 = fma(_1483, 6.283185482025146484375, _1253);
    float _1487 = _1485 * 0.15915493667125701904296875;
    float _1489 = _1487 * 6.283185482025146484375;
    float _1491 = sin(_1489);
    float _1493 = _1041 * _1445;
    float _1495 = _1493 * (*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1497 = fma(_1491, 0.5, 0.5);
    float _1499 = _1441 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1501 = _1495 * _1497;
    float _1503 = fma(_1501, 0.1500000059604644775390625, _1067);
    float _1505 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1069);
    float _1507 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1503);
    float _1509 = _1505 * _1477;
    float _1511 = _1507 * _1499;
    float _1513 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1075);
    float _1515 = _1475 * _1511;
    float _1517 = _1513 * _1463;
    float _1519 = -_1511;
    float _1521 = _1431 * _1519;
    float _1523 = _1479 * _1511;
    float _1525 = fma(_1457, _1509, _1515);
    float _1527 = fma(_1473, _1509, _1521);
    float _1529 = fma(_1467, _1509, _1523);
    float _1531 = fma(_1471, _1517, _1525);
    float _1533 = fma(_1481, _1517, _1527);
    float _1535 = fma(_1459, _1517, _1529);
    float _1537 = _1531 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1539 = _1531 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1541 = fma(_1533, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1537);
    float _1543 = fma(_1533, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1539);
    float _1545 = fma(_1535, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1541);
    float _1547 = fma(_1535, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1543);
    float _1549 = _1531 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1551 = _360 + _1545;
    float _1553 = _358 + _1547;
    float _1555 = fma(_1533, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1549);
    float _1557 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1559 = _1551 + _1557;
    float _1561 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1563 = _1553 + _1561;
    float _1565 = fma(_1535, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1555);
    float _1567 = _1559 * _1559;
    float _1569 = _356 + _1565;
    float _1571 = fma(_1563, _1563, _1567);
    float _1573 = sqrt(_1571);
    bool _1575 = _1573 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1577 = _1567;
    float _1579 = _1553;
    float _1581 = _1565;
    float _1583 = _1297;
    float _1585 = _1049;
    if (!_1575)
    {
        _1577 = _1553;
    }
    float _1587 = _1577;
    float _1589 = _1587;
    if (!_1575)
    {
        _1579 = _1551;
    }
    float _1591 = _1579;
    float _1593 = _1591;
    if (!_1575)
    {
        _1581 = _1569;
    }
    float _1595 = _1581;
    bool _1597 = !_1575;
    float _1599 = _1595;
    if (!_1597)
    {
        float _1601 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1603 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1605 = _1573 + _1603;
        float _1607 = rsqrt(_1571);
        float _1609 = _1605 * _1601;
        float _1611 = _1569 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1613 = _1609 * 0.15915493667125701904296875;
        float _1615 = _1613 * 6.283185482025146484375;
        float _1617 = cos(_1615);
        float _1619 = _1613 * 6.283185482025146484375;
        float _1621 = sin(_1619);
        float _1623 = _1617 + (-1.0);
        float _1625 = _1623 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1627 = fma(_1621, _1611, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1629 = fma(_1569, _1617, _1625);
        float _1631 = _1607 * _1627;
        float _1633 = fma(_1563, _1631, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1635 = fma(_1559, _1631, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1599 = _1629;
        _1589 = _1633;
        _1593 = _1635;
    }
    float _1637 = _1599;
    float _1639 = _1589;
    float _1641 = _1593;
    float _1643 = _1637;
    float _1645 = _1639;
    float _1647 = _1641;
    if (!_1385)
    {
        float _1649 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1651 = _356 + _1649;
        float _1653 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1655 = _358 + _1653;
        float _1657 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1659 = -_356;
        float _1661 = _1659 + _1637;
        float _1663 = _1651 * _1651;
        float _1665 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1667 = _360 + _1665;
        float _1669 = -_358;
        float _1671 = _1669 + _1639;
        float _1673 = -_360;
        float _1675 = _1673 + _1641;
        float _1677 = fma(_1655, _1655, _1663);
        float _1679 = fma(_1667, _1667, _1677);
        float _1681 = sqrt(_1679);
        float _1683 = precise::min(_1681, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1685 = _1683 * _1657;
        float _1687 = fma(_1661, _1685, _356);
        float _1689 = fma(_1671, _1685, _358);
        float _1691 = fma(_1675, _1685, _360);
        _1643 = _1687;
        _1645 = _1689;
        _1647 = _1691;
    }
    float _1693 = _1643;
    float _1695 = _1645;
    float _1697 = _1647;
    if (_671)
    {
        _1583 = 1.0;
    }
    float _1699 = _1583;
    float _1701 = _1699;
    if (!_671)
    {
        int _1703 = _729 << 4;
        int _1705 = _1703 + 2048;
        uint _1707 = uint(int(uint(_1705) >> uint(2)));
        uint _1709 = uint(int(uint(int(_1707)) >> uint(2)));
        int _1711 = int(_1707) & 3;
        float _1713 = (*spvDescriptorSet0.vp_c15)._m0[int(_1709)][_1711];
        int _1715 = int(_1707) + 1;
        uint _1717 = uint(int(uint(_1715) >> uint(2)));
        int _1719 = _1715 & 3;
        float _1721 = (*spvDescriptorSet0.vp_c15)._m0[int(_1717)][_1719];
        int _1723 = _1705 + 8;
        uint _1725 = uint(int(uint(_1723) >> uint(2)));
        uint _1727 = uint(int(uint(int(_1725)) >> uint(2)));
        int _1729 = int(_1725) & 3;
        float _1731 = (*spvDescriptorSet0.vp_c15)._m0[int(_1727)][_1729];
        int _1733 = int(_1725) + 1;
        uint _1735 = uint(int(uint(_1733) >> uint(2)));
        int _1737 = _1733 & 3;
        float _1739 = (*spvDescriptorSet0.vp_c15)._m0[int(_1735)][_1737];
        float _1741 = _430 * _1721;
        float _1743 = fma(_358, _1713, _1741);
        float _1745 = fma(_360, _1731, _1743);
        float _1747 = _1745 + _1739;
        float _1749 = precise::clamp(_1747, 0.0, 1.0);
        float _1751 = -_1749;
        float _1753 = _1751 + _1049;
        float _1755 = fma(_1753, 500.0, 1.5);
        float _1757 = exp2(_1755);
        float _1759 = 0.0 + _1757;
        float _1761 = precise::clamp(_1759, 0.0, 1.0);
        _1701 = _1761;
    }
    float _1763 = _1701;
    float _1765 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1767 = _1693 + _1765;
    float _1769 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1771 = _1695 + _1769;
    float _1773 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1775 = _1697 + _1773;
    float _1777 = _1767 * _1767;
    float _1779 = fma(_1771, _1771, _1777);
    float _1781 = fma(_1775, _1775, _1779);
    float _1783 = rsqrt(_1781);
    float _1785 = sqrt(_1781);
    float _1787 = _1783 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1789 = _1771 * _1787;
    float _1791 = _1775 * _1787;
    float _1793 = _1789 * _1789;
    float _1795 = _1791 * _1791;
    float _1797 = _1793 + _1795;
    float _1799 = sqrt(_1797);
    bool _1801 = _1799 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1803 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1805 = _1799 + _1803;
    float _1807 = _1783;
    float _1809 = _1805;
    float _1811 = _1767;
    float _1813 = _1787;
    float _1815 = _1797;
    if (_1801)
    {
        float _1817 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1807 = _1817;
    }
    float _1819 = _1807;
    float _1821 = _1819;
    if (_1801)
    {
        float _1823 = _1805 * _1819;
        _1809 = _1823;
    }
    float _1825 = _1809;
    if (_1801)
    {
        float _1827 = rsqrt(_1797);
        _1821 = _1827;
    }
    float _1829 = _1821;
    float _1831 = _1829;
    if (_1801)
    {
        float _1833 = _1825 * 0.15915493667125701904296875;
        _1585 = _1833;
    }
    float _1835 = _1585;
    float _1837 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1839 = _1775;
    if (_1801)
    {
        float _1841 = _1835 * 6.283185482025146484375;
        float _1843 = sin(_1841);
        _1839 = _1843;
    }
    float _1845 = _1839;
    float _1847 = precise::max(0.0, _1837);
    float _1849 = -_1787;
    float _1851 = -_1847;
    float _1853 = fma(_1767, _1849, _1851);
    float _1855 = (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1857 = _1847;
    if (_1801)
    {
        float _1859 = _1835 * 6.283185482025146484375;
        float _1861 = cos(_1859);
        _1855 = _1861;
    }
    float _1863 = _1855;
    if (_1801)
    {
        float _1865 = _1853 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1811 = _1865;
    }
    float _1867 = _1811;
    float _1869 = _1845;
    float _1871 = _1867;
    if (_1801)
    {
        float _1873 = fma(_1845, _1867, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1869 = _1873;
    }
    float _1875 = _1869;
    float _1877 = _1875;
    if (!_1801)
    {
        _1871 = _1853;
    }
    float _1879 = _1871;
    float _1881 = _1879;
    if (_1801)
    {
        float _1883 = _1829 * _1875;
        _1813 = _1883;
    }
    float _1885 = _1813;
    if (!_1801)
    {
        _1831 = _1789;
    }
    float _1887 = _1831;
    float _1889 = _1887;
    if (!_1801)
    {
        _1877 = _1793;
    }
    float _1891 = _1877;
    float _1893 = _1891;
    float _1895 = _1863;
    if (_1801)
    {
        float _1897 = _1863 + (-1.0);
        _1857 = _1897;
    }
    float _1899 = _1857;
    float _1901 = _1899;
    if (_1801)
    {
        float _1903 = _1789 * _1885;
        _1889 = _1903;
    }
    float _1905 = _1889;
    float _1907 = _1693 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_1801)
    {
        float _1909 = _1899 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1815 = _1909;
    }
    float _1911 = _1815;
    if (!_1801)
    {
        _1901 = _1791;
    }
    float _1913 = _1901;
    float _1915 = _1913;
    if (_1801)
    {
        float _1917 = _1791 * _1885;
        _1915 = _1917;
    }
    float _1919 = _1915;
    if (_1801)
    {
        float _1921 = _1905 * _1905;
        _1893 = _1921;
    }
    float _1923 = _1893;
    if (_1801)
    {
        float _1925 = fma(_1853, _1863, _1911);
        _1881 = _1925;
    }
    float _1927 = _1881;
    if (!_1801)
    {
        _1895 = _1795;
    }
    float _1929 = _1895;
    float _1931 = _1929;
    if (_1801)
    {
        float _1933 = _1919 * _1919;
        _1931 = _1933;
    }
    float _1935 = _1931;
    float _1937 = _1693 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1939 = fma(_1927, _1927, _1923);
    float _1941 = fma(_1695, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1907);
    float _1943 = fma(_1695, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1937);
    float _1945 = _1939 + _1935;
    float _1947 = _1693 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1949 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1951 = fma(_1785, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1949);
    float _1953 = precise::clamp(_1951, 0.0, 1.0);
    float _1955 = fma(_1697, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1943);
    float _1957 = rsqrt(_1945);
    float _1959 = _1693 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1961 = fma(_1695, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1947);
    float _1963 = -_1953;
    float _1965 = _1963 + 1.0;
    float _1967 = _1955 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1969 = fma(_1695, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1959);
    float _1971 = fma(_1697, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1961);
    float _1973 = fma(_1697, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1941);
    float _1975 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1977 = fma(_1697, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1969);
    float _1979 = _1971 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1981 = abs(_1965);
    float _1983 = log2(_1981);
    float _1985 = _1967 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1987 = _1977 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1989 = _1979 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1991 = _1973 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1993 = _1957 * _1905;
    float _1995 = _1957 * _1927;
    float _1997 = fma(_1987, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1989);
    float _1999 = _1957 * _1919;
    float _2001 = _1993 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2003 = -_1985;
    float _2005 = fma(_2003, _1975, 1.0);
    float _2007 = fma(_1967, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1997);
    float _2009 = _1979 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2011 = -_2001;
    float _2013 = fma(_1995, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2011);
    float _2015 = _1995 + 1.0;
    float _2017 = fma(_1991, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2007);
    float _2019 = _1983 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2021 = -_1999;
    float _2023 = fma(_2021, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2013);
    float _2025 = log2(_2005);
    float _2027 = _1979 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2029 = fma(_1987, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2009);
    float _2031 = fma(_2023, -0.5, 0.5);
    float _2033 = fma(_2023, 0.5, 0.5);
    float _2035 = fma(_1987, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2027);
    float _2037 = fma(_1967, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2029);
    float _2039 = 1.0 / _2017;
    float _2041 = fma(_2033, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2043 = fma(_1967, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2035);
    float _2045 = fma(_1991, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2037);
    float _2047 = fma(_2033, _2041, -0.212114393711090087890625);
    float _2049 = fma(_1991, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2043);
    float _2051 = exp2(_2019);
    float _2053 = _2025 * 0.693147182464599609375;
    float _2055 = _2053 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2057 = sqrt(_2031);
    float _2059 = fma(_2033, _2047, 1.570728778839111328125);
    float _2061 = _2049 * _2039;
    float _2063 = _2045 * _2039;
    float _2065 = fma(_2063, -0.5, 0.5);
    float _2067 = -_1995;
    float _2069 = fma(_2051, _2015, _2067);
    float _2071 = fma(_2061, 0.5, 0.5);
    float _2073 = fma(_2069, 0.5, 0.5);
    float _2075 = _2057 * 0.636619746685028076171875;
    float3 _6008 = float3(_2071, _2065, _2055);
    float _2077 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6008, float3(0.0), isnan(_6008)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6008, float3(0.0), isnan(_6008)), level(0.0)).x;
    float3 _6017 = float3(_2071, _2065, _2055);
    float4 _2080 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6017, float3(0.0), isnan(_6017)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6017, float3(0.0), isnan(_6017)), level(0.0)).xyzw;
    float _2082 = _2080.x;
    float _2084 = _2080.y;
    float _2086 = _2080.z;
    float _2088 = _2080.w;
    float _2090 = -_2059;
    float _2092 = fma(_2075, _2090, 1.0);
    float2 _6038 = float2(_2092, _2073);
    float3 _2096 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6038, float2(0.0), isnan(_6038)), level(0.0)), spvDescriptorSet0.dm_border, 6u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6038, float2(0.0), isnan(_6038)), level(0.0)).xyz;
    float _2098 = _2096.x;
    float _2100 = _2096.y;
    float _2102 = _2096.z;
    float _2104 = abs(_478);
    float _2106 = log2(_2104);
    float _2108 = in.m_81.x;
    float _2110 = in.m_81.y;
    float _2112 = in.m_81.z;
    float _2114 = in.m_81.w;
    float _2116 = _1979 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_83.x = _1063;
    float _2118 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2120 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2122 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2124 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2126 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2128 = _2106 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2130 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2132 = _2124 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2134 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _2136 = _1503 != 0.0;
    bool _2138 = isnan(_1503);
    bool _2140 = _2136 || _2138;
    bool _2142 = isnan(0.0);
    bool _2144 = _2140 || _2142;
    float _2146 = in.m_85.x;
    float _2148 = in.m_85.y;
    float _2150 = in.m_85.z;
    float _2152 = exp2(_2128);
    float _2154 = _2118 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2156 = _1069 == 0.0;
    bool _2158 = !_2144;
    bool _2160 = _2156 && _2158;
    float _2162 = _1475 * _2110;
    float _2164 = _2126 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2166 = -_2110;
    float _2168 = _1431 * _2166;
    float _2170 = fma(_1457, _2108, _2162);
    bool _2172 = _1075 == 0.0;
    bool _2174 = _2172 && _2160;
    float _2176 = _2120 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2178 = _2134 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2180 = _2122 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_87.x = _2154;
    out.m_87.y = _2164;
    out.m_87.z = _2132;
    out.m_87.w = _2130;
    float _2182 = fma(_1473, _2108, _2168);
    float _2184 = fma(_1471, _2112, _2170);
    float _2186 = fma(_2152, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2188 = precise::clamp(_2186, 0.0, 1.0);
    out.m_89.x = _2176;
    out.m_89.y = _2178;
    out.m_89.z = _2180;
    float _2190 = fma(_1481, _2112, _2182);
    bool _2192 = _478 <= 8000.0;
    bool _2194 = isnan(_478);
    bool _2196 = _2192 || _2194;
    bool _2198 = isnan(8000.0);
    bool _2200 = _2196 || _2198;
    float _2202 = float(_2200);
    float _2204 = fma(_1987, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2116);
    out.m_91.x = _951;
    out.m_91.y = _953;
    float _2206 = -_1043;
    float _2208 = _2206 + 1.0;
    float _2210 = fma(_1967, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2204);
    out.m_93.x = _1021;
    out.m_93.y = _605;
    float _2212 = _1479 * _2110;
    float _2214 = fma(_2188, -2.0, 3.0);
    float _2216 = _2188 * _2188;
    float _2218 = _2184 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2220 = fma(_1467, _2108, _2212);
    float _2222 = _2184 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2224 = _2216 * _2214;
    float _2226 = fma(_2190, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2218);
    float _2228 = fma(_1459, _2112, _2220);
    float _2230 = fma(_2190, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2222);
    float _2232 = _2230;
    float _2234 = _2176;
    float _2236 = _2180;
    float _2238 = _2017;
    float _2240 = _2045;
    if (_2174)
    {
        _981 = _2148;
    }
    float _2242 = _981;
    float _2244 = _2184 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2246 = fma(_2228, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2226);
    float _2248 = fma(_2228, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2230);
    float _2250 = _2242;
    if (_2174)
    {
        _2232 = _2242;
    }
    float _2252 = _2232;
    float _2254 = fma(_2190, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2244);
    float _2256 = _2252;
    if (!_2174)
    {
        _2250 = _2148;
    }
    float _2258 = _2250;
    float _2260 = _2112 * _2146;
    if (_2174)
    {
        _2234 = _2146;
    }
    float _2262 = _2234;
    float _2264 = fma(_2228, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2254);
    float _2266 = _2110 * _2150;
    float _2268 = _2108 * _2258;
    float _2270 = -_2260;
    float _2272 = fma(_2108, _2150, _2270);
    float _2274 = _2262;
    if (!_2174)
    {
        float _2276 = fma(_1503, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2258);
        _2256 = _2276;
    }
    float _2278 = _2256;
    float _2280 = -_2266;
    float _2282 = fma(_2112, _2258, _2280);
    float _2284 = -_2268;
    float _2286 = fma(_2110, _2146, _2284);
    float _2288 = _2272 * _2114;
    out.m_95.x = _2246;
    out.m_95.y = _2248;
    out.m_95.z = _2264;
    if (!_2174)
    {
        float _2290 = fma(_1069, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2146);
        _2274 = _2290;
    }
    float _2292 = _2274;
    float _2294 = _2282 * _2114;
    float _2296 = -_2278;
    float _2298 = _1431 * _2296;
    float _2300 = -_2288;
    float _2302 = _1431 * _2300;
    float _2304 = _2286 * _2114;
    if (_2174)
    {
        _2236 = _2150;
    }
    float _2306 = _2236;
    float _2308 = _2306;
    if (!_2174)
    {
        float _2310 = fma(_1075, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2150);
        _2308 = _2310;
    }
    float _2312 = _2308;
    float _2314 = fma(_1473, _2294, _2302);
    float _2316 = fma(_1473, _2292, _2298);
    out.m_97.x = _1695;
    out.m_97.y = _1693;
    out.m_97.z = _1697;
    bool _2318 = _1785 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2320 = isnan(_1785);
    bool _2322 = _2318 || _2320;
    bool _2324 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2326 = _2322 || _2324;
    float _2328 = _1475 * _2278;
    float _2330 = _1475 * _2288;
    float _2332 = _1479 * _2278;
    float _2334 = _1479 * _2288;
    float _2336 = fma(_1457, _2292, _2328);
    float _2338 = fma(_1457, _2294, _2330);
    float _2340 = fma(_1481, _2304, _2314);
    float _2342 = fma(_1467, _2294, _2334);
    float _2344 = fma(_1471, _2312, _2336);
    float _2346 = fma(_1471, _2304, _2338);
    float _2348 = fma(_1467, _2292, _2332);
    float _2350 = fma(_1459, _2304, _2342);
    float _2352 = fma(_1481, _2312, _2316);
    float _2354 = _2346 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2356 = _2346 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2358 = _2344 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2360 = fma(_1459, _2312, _2348);
    float _2362 = fma(_2340, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2354);
    float _2364 = fma(_2340, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2356);
    float _2366 = fma(_2352, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2358);
    float _2368 = _2346 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2370 = fma(_2350, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2362);
    float _2372 = fma(_2350, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2364);
    float _2374 = _2344 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2376 = _2344 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2378 = -_2224;
    float _2380 = _2378 + 1.0;
    float _2382 = fma(_2340, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2368);
    float _2384 = fma(_2352, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2374);
    float _2386 = fma(_2352, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2376);
    float _2388 = fma(_2350, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2382);
    float _2390 = fma(_2360, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2384);
    float _2392 = fma(_2360, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2386);
    float _2394 = fma(_2360, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2366);
    float _2396 = _1983 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2398 = fma(_2380, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2224);
    float _2400 = _2017 * 0.5;
    out.m_99.x = _2370;
    out.m_99.y = _2372;
    out.m_99.z = _2388;
    float _2402 = fma(_1991, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2210);
    float _2404 = _2202 * _2398;
    float _2406 = exp2(_2396);
    out.m_101.x = (*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2408 = _2404 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.gl_Position.x = _2049;
    out.gl_Position.y = _2045;
    out.gl_Position.z = _2402;
    out.gl_Position.w = _2017;
    float _2410 = _2208 * _2408;
    float _2412 = precise::clamp(_2410, 0.0, 1.0);
    float _2414 = fma(_2045, -0.5, _2400);
    float _2416 = _2400;
    float _2418 = _2402;
    if (!_993)
    {
        _2416 = 1.0;
    }
    float _2420 = _2416;
    float _2422 = -_2412;
    float _2424 = fma(_2422, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2426 = _2420;
    if (_993)
    {
        bool _2428 = _1055 >= _1015;
        bool _2430 = isnan(_1055);
        bool _2432 = _2428 || _2430;
        bool _2434 = isnan(_1015);
        bool _2436 = _2432 || _2434;
        float _2438 = float(_2436);
        _2426 = _2438;
    }
    float _2440 = _2426;
    float _2442 = _2049 + _2017;
    out.m_103.x = _2390;
    out.m_103.y = _2392;
    out.m_103.z = _2394;
    float _2444 = _2402 + _2017;
    float _2446 = -_2406;
    float _2448 = _2446 + 1.0;
    float _2450 = _2440 * _1763;
    float _2452 = _2442 * 0.5;
    float _2454 = _2444 * 0.5;
    float _2456 = _2448 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2458 = -_2450;
    float _2460 = fma(_2458, _2424, 1.0);
    float _2462 = precise::clamp(_2460, 0.0, 1.0);
    float _2464 = _2452;
    if (!_2326)
    {
        _2238 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2466 = _2238;
    float _2468 = -_2456;
    float _2470 = _2468 + 1.0;
    float _2472 = _2462 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_105.x = _2452;
    out.m_105.y = _2414;
    out.m_105.z = _2454;
    out.m_105.w = _2017;
    float _2474 = _2470;
    float _2476 = _2466;
    float _2478 = _2466;
    if (!_2326)
    {
        _2418 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2480 = _2418;
    float _2482 = _2480;
    float _2484 = _2480;
    if (!_2326)
    {
        _2240 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2486 = _2240;
    out.m_107.x = _2472;
    float _2488 = _2486;
    float _2490 = _2486;
    if (!_2326)
    {
        _2464 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2492 = _2464;
    float _2494 = _2456 * _2077;
    float _2496 = _2088 * _2470;
    float _2498 = _2492;
    float _2500 = _2492;
    if (!_2326)
    {
        _2474 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2502 = _2474;
    float _2504 = _2088 * _2494;
    float _2506 = _2102 * _2494;
    float _2508 = fma(_2098, _2504, _2082);
    float _2510 = fma(_2100, _2504, _2084);
    float _2512 = _2504;
    float _2514 = _2502;
    float _2516 = _2502;
    if (!_2326)
    {
        _2512 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2518 = _2512;
    float _2520 = fma(_2088, _2506, _2086);
    out.m_109.x = _2508;
    out.m_109.y = _2510;
    out.m_109.z = _2520;
    out.m_109.w = _2496;
    bool _2522 = !_2326;
    float _2524 = _2518;
    float _2526 = _2518;
    if (!_2522)
    {
        bool _2528 = _1785 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2530 = isnan(_1785);
        bool _2532 = _2528 || _2530;
        bool _2534 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2536 = _2532 || _2534;
        if (!_2536)
        {
            float _2538 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2540 = _1785 + _2538;
            float _2542 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2544 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2542;
            float _2546 = 1.0 / _2544;
            float _2548 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2550 = _2548 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2552 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2554 = _2552 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2556 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2558 = _2556 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2560 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2562 = _2560 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2564 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2566 = _2564 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2568 = _2540 * _2546;
            float _2570 = precise::clamp(_2568, 0.0, 1.0);
            float _2572 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2574 = _2572 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2576 = fma(_2570, _2550, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2578 = fma(_2570, _2574, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2580 = fma(_2570, _2554, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2582 = fma(_2570, _2558, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2584 = fma(_2570, _2562, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2586 = fma(_2570, _2566, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2478 = _2578;
            _2516 = _2584;
            _2500 = _2576;
            _2490 = _2582;
            _2484 = _2580;
            _2526 = _2586;
            _2588 = true;
        }
        else
        {
            bool _2590 = _1785 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2592 = isnan(_1785);
            bool _2594 = _2590 || _2592;
            bool _2596 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2598 = _2594 || _2596;
            if (!_2598)
            {
                _2498 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2600 = _2498;
            _2500 = _2600;
            if (!_2598)
            {
                _2476 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2602 = _2476;
            _2478 = _2602;
            if (!_2598)
            {
                _2482 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2604 = _2482;
            _2484 = _2604;
            if (!_2598)
            {
                _2488 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2606 = _2488;
            _2490 = _2606;
            if (!_2598)
            {
                _2514 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2608 = _2514;
            _2516 = _2608;
            if (!_2598)
            {
                _2524 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2610 = _2524;
            bool _2612 = !_2598;
            _2526 = _2610;
            if (!_2612)
            {
                bool _2614 = _1785 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2616 = isnan(_1785);
                bool _2618 = _2614 || _2616;
                bool _2620 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2622 = _2618 || _2620;
                if (!_2622)
                {
                    float _2624 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2626 = _1785 + _2624;
                    float _2628 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2630 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2628;
                    float _2632 = 1.0 / _2630;
                    float _2634 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2636 = _2634 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2638 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2640 = _2638 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2642 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2644 = _2642 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2646 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2648 = _2646 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2650 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2652 = _2650 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2654 = _2626 * _2632;
                    float _2656 = precise::clamp(_2654, 0.0, 1.0);
                    float _2658 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2660 = _2658 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2662 = fma(_2656, _2636, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2664 = fma(_2656, _2660, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2666 = fma(_2656, _2640, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2668 = fma(_2656, _2644, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2670 = fma(_2656, _2648, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2672 = fma(_2656, _2652, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2478 = _2664;
                    _2516 = _2670;
                    _2500 = _2662;
                    _2490 = _2668;
                    _2484 = _2666;
                    _2526 = _2672;
                    _2588 = true;
                }
                else
                {
                    _2478 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2516 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2500 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2490 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2484 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2526 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2588 = false;
    float _2674 = _2478;
    float _2676 = _2516;
    float _2678 = _2500;
    float _2680 = _2490;
    float _2682 = _2484;
    float _2684 = _2526;
    float _2686 = fma(_2392, -0.5, 0.5);
    float _2688 = precise::clamp(_2686, 0.0, 1.0);
    float _2690 = -_2674;
    float _2692 = _2690 + _2676;
    float _2694 = -_2678;
    float _2696 = _2694 + _2680;
    float _2698 = -_2682;
    float _2700 = _2698 + _2684;
    bool _2702 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2704 = fma(_2688, _2692, _2674);
    float _2706 = fma(_2688, _2696, _2678);
    float _2708 = fma(_2688, _2700, _2682);
    float _2710 = _2704 * 0.586610972881317138671875;
    out.m_111.x = 0.0;
    float _2712 = fma(_2706, 0.298911988735198974609375, _2710);
    float _2714 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2716 = fma(_2708, 0.114477999508380889892578125, _2712);
    out.m_67.x = _2714;
    float _2718 = -_2716;
    float _2720 = _2706 + _2718;
    float _2722 = -_2716;
    float _2724 = _2704 + _2722;
    float _2726 = -_2716;
    float _2728 = _2708 + _2726;
    float _2730 = fma(_2720, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2716);
    float _2732 = fma(_2724, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2716);
    float _2734 = fma(_2728, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2716);
    out.m_113.x = _2730;
    out.m_113.y = _2732;
    out.m_113.z = _2734;
    if (!_2702)
    {
        return out;
    }
    float _2736 = -_1693;
    float _2738 = _2736 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2740 = -_1695;
    float _2742 = _2740 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2744 = -_1697;
    float _2746 = _2744 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2748 = _2738 * _2738;
    float _2750 = fma(_2742, _2742, _2748);
    float _2752 = fma(_2746, _2746, _2750);
    float _2754 = sqrt(_2752);
    float _2756 = rsqrt(_2752);
    float _2758 = -_2754;
    float _2760 = _2758 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2762 = _2760 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2764 = precise::clamp(_2762, 0.0, 1.0);
    float _2766 = _2742 * _2756;
    float _2768 = _2738 * _2756;
    float _2770 = abs(_2764);
    float _2772 = log2(_2770);
    float _2774 = _2746 * _2756;
    float _2776 = _2766 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2778 = _2392 * _2768;
    float _2780 = -_2768;
    float _2782 = -_2776;
    float _2784 = fma(_2780, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2782);
    float _2786 = fma(_2390, _2766, _2778);
    float _2788 = -_2774;
    float _2790 = fma(_2788, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2784);
    float _2792 = fma(_2394, _2774, _2786);
    float _2794 = precise::clamp(_2792, 0.0, 1.0);
    float _2796 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2798 = _2790 + _2796;
    float _2800 = _2772 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2802 = _2798 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2804 = precise::clamp(_2802, 0.0, 1.0);
    float _2806 = exp2(_2800);
    float _2808 = _2806 * _2804;
    float _2810 = _2794 * _2808;
    float _2812 = _2810 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2814 = _2810 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2816 = _2810 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_111.x = _2812;
    out.m_111.y = _2814;
    out.m_111.z = _2816;
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
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_113 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_111 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_109 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2588 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _127 = in.m_60.w;
    float _129 = in.m_62.w;
    float _131 = trunc(_127);
    int _134 = int(_131);
    float _136 = -_129;
    float _138 = _136 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_65.y = _138;
    bool _142 = _134 >= 1;
    float _144 = 0.0;
    float _146 = as_type<float>(_134);
    float _148 = _138;
    if (!_142)
    {
        _144 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _150 = _144;
    if (!_142)
    {
        out.m_67.x = 0.0;
    }
    int _152 = 0;
    if (!_142)
    {
        float _154 = _150 * 5.0;
        _152 = as_type<int>(_154);
    }
    int _156 = _152;
    int _158 = _156;
    if (!_142)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2885 = as_type<float>(_156);
        out.gl_Position.z = _2885;
    }
    if (!_142)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_113.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_113.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_113.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_113.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _160 = _129 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _162 = isnan(_129);
    bool _164 = _160 || _162;
    bool _166 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _168 = _164 || _166;
    float _170 = float(_134);
    bool _172 = _138 >= _170;
    bool _174 = !_168;
    bool _176 = _172 || _174;
    if (_176)
    {
        _146 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _178 = _146;
    if (_176)
    {
        out.m_67.x = 0.0;
    }
    if (_176)
    {
        float _180 = _178 * 5.0;
        _158 = as_type<int>(_180);
    }
    int _182 = _158;
    if (_176)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2940 = as_type<float>(_182);
        out.gl_Position.z = _2940;
    }
    if (_176)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_113.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_113.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_113.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_113.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _184 = in.m_69.w;
    float _186 = 1.0 / _170;
    float _188 = _138 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _190 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _192 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _194 = _190 || _192;
    bool _196 = isnan(1.0);
    bool _198 = _194 || _196;
    float _200 = in.m_62.x;
    float _202 = in.m_62.y;
    float _204 = in.m_62.z;
    float _206 = in.m_60.x;
    float _208 = in.m_60.y;
    float _210 = in.m_60.z;
    float _212 = 0.0;
    float _214 = _188;
    if (!_198)
    {
        float _216 = _188 * _188;
        float _218 = _216 * 0.5;
        _212 = _218;
    }
    float _220 = _212;
    float _222 = _220;
    if (!_198)
    {
        float _224 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _222 = _224;
    }
    float _226 = _222;
    bool _228 = !_198;
    float _230 = _226;
    if (!_228)
    {
        float _232 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _234 = log2(_232);
        float _236 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _238 = _236 + 1.0;
        float _240 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _242 = _188 * _234;
        float _244 = 1.0 / _238;
        float _246 = _240 * 0.693147182464599609375;
        float _248 = exp2(_242);
        float _250 = 1.0 / _246;
        float _252 = _248 + (-1.0);
        float _254 = -_252;
        float _256 = fma(_254, _250, _188);
        float _258 = _256 * _244;
        float _260 = _258 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _230 = _260;
    }
    float _262 = _230;
    bool _264 = !_198;
    if (!_264)
    {
        float _266 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _268 = log2(_266);
        float _270 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _272 = _270 + 1.0;
        float _274 = 1.0 / _272;
        float _276 = _188 * _268;
        float _278 = exp2(_276);
        float _280 = -_278;
        float _282 = _280 + 1.0;
        float _284 = _282 * _274;
        _214 = _284;
    }
    float _286 = _214;
    bool _288 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _290 = _262 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _292 = _262 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _294 = _262 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _296 = _138 * _186;
    float _298 = fma(_286, _200, _290);
    float _300 = fma(_286, _202, _292);
    float _302 = fma(_286, _204, _294);
    float _304 = fma(_298, _184, _206);
    float _306 = fma(_300, _184, _208);
    float _308 = fma(_302, _184, _210);
    bool _310 = !_288;
    float _312 = _296;
    if (!_310)
    {
        float _314 = in.m_71.x;
        float _316 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _318 = _314 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _320 = fma(_318, (*spvDescriptorSet0.vp_c9)._m0[12].x, _138);
        float _322 = _320 * _316;
        float _324 = floor(_322);
        float _326 = -_324;
        float _328 = _322 + _326;
        _312 = _328;
    }
    float _330 = _312;
    float _332 = _306 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _334 = _306 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _336 = _306 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _338 = in.m_73.y;
    float _340 = fma(_304, (*spvDescriptorSet0.vp_c10)._m0[5].x, _332);
    float _342 = fma(_304, (*spvDescriptorSet0.vp_c10)._m0[4].x, _334);
    float _344 = fma(_304, (*spvDescriptorSet0.vp_c10)._m0[6].x, _336);
    float _346 = in.m_71.y;
    float _348 = fma(_308, (*spvDescriptorSet0.vp_c10)._m0[5].z, _340);
    float _350 = fma(_308, (*spvDescriptorSet0.vp_c10)._m0[4].z, _342);
    float _352 = fma(_308, (*spvDescriptorSet0.vp_c10)._m0[6].z, _344);
    float _354 = in.m_71.x;
    float _356 = _348 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _358 = _350 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _360 = _352 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _362 = _356 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _364 = in.m_73.x;
    float _366 = fma(_358, (*spvDescriptorSet0.vp_c8)._m0[11].x, _362);
    int _368 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _370 = _368 != 0;
    float _372 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _374 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _376 = _374 != 0;
    float _378 = fma(_360, (*spvDescriptorSet0.vp_c8)._m0[11].z, _366);
    float _380 = _356 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    int _382 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _384 = _382 != 0;
    float _386 = -_338;
    float _388 = _386 + 1.0;
    float _390 = _378 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _392 = fma(_358, (*spvDescriptorSet0.vp_c8)._m0[10].x, _380);
    int _394 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _396 = _394 != 0;
    float _398 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _400 = 1.0 / _390;
    float _402 = fma(_360, (*spvDescriptorSet0.vp_c8)._m0[10].z, _392);
    float _404 = in.m_71.z;
    bool _406 = _346 > 0.5;
    float _408 = _402 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    int _410 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _412 = _410 != 0;
    float _414 = _408 + _390;
    float _416 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _418 = _414 * _400;
    float _420 = _418 * 0.5;
    float _422 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _424 = fma(_360, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _426 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _428 = fma(_420, (*spvDescriptorSet0.vp_c8)._m0[30].w, _426);
    float _430 = _356 + _422;
    float _432 = _354 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _434 = _406 ? as_type<int>(_388) : as_type<int>(_338);
    float _436 = 1.0 / _428;
    float _438 = _430 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _440 = _430 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _442 = -_398;
    float _444 = fma(_432, 2.0, _442);
    float _446 = fma(_358, (*spvDescriptorSet0.vp_c15)._m0[126].x, _438);
    float _448 = fma(_358, (*spvDescriptorSet0.vp_c15)._m0[127].x, _440);
    float _450 = _384 ? as_type<float>(_434) : _338;
    float _452 = floor(_424);
    float _454 = fma(_360, (*spvDescriptorSet0.vp_c15)._m0[126].z, _446);
    float _456 = fma(_360, (*spvDescriptorSet0.vp_c15)._m0[127].z, _448);
    float _458 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _460 = _346 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _462 = _454 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _464 = _456 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _466 = _448;
    float _468 = _364;
    int _470 = 2;
    float _472 = _338;
    if (!_370)
    {
        _466 = _364;
    }
    float _474 = _466;
    float _476 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _478 = _436 * _476;
    float _480 = trunc(_462);
    int _482 = int(_480);
    float _484 = fma(_460, -2.0, _458);
    float _486 = _372 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _488 = 0.0;
    float _490 = _474;
    if (!_370)
    {
        _488 = _474;
    }
    float _492 = _488;
    float _494 = (*spvDescriptorSet0.vp_c9)._m0[89].z + (*spvDescriptorSet0.vp_c9)._m0[89].y;
    bool _496 = _478 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _498 = fma(_486, _450, -0.5);
    bool _500 = _478 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _502 = trunc(_464);
    int _504 = int(_502);
    bool _506 = !_496;
    int _508 = _506 ? 0 : 1;
    float _510 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _512 = _508;
    bool _514 = _500;
    float _516 = _492;
    if (_370)
    {
        _490 = _364;
    }
    float _518 = _490;
    float _520 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[76].y, _484);
    int _522 = as_type<int>(_518);
    if (_412)
    {
        _468 = _346;
    }
    float _524 = _468;
    float _526 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[78].w, _510);
    float _528 = _524;
    if (!_412)
    {
        _528 = _354;
    }
    float _530 = _528;
    float _532 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _534 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _536 = _482 + _534;
    int _538 = _536 + 1;
    float _540 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[77].w, _526);
    float _542 = as_type<float>(_538);
    if (!_496)
    {
        _470 = 1;
    }
    int _544 = _470;
    float _546 = _530 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _548 = _544;
    if (!_500)
    {
        _548 = _508;
    }
    int _550 = _548;
    if (_370)
    {
        float _552 = -_518;
        float _554 = _552 + 1.0;
        _512 = as_type<int>(_554);
    }
    int _556 = _512;
    if (_370)
    {
        bool _558 = _354 > 0.5;
        _514 = _558;
    }
    bool _560 = _514;
    float _562 = -_520;
    float _564 = fma(_540, _498, _562);
    int _566 = _550 << 6;
    int _568 = 0;
    if (_376)
    {
        float _570 = -_518;
        float _572 = _570 + 1.0;
        _568 = as_type<int>(_572);
    }
    int _574 = _568;
    int _576 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _578 = _504 + _576;
    int _580 = _578 + 1;
    float _582 = _416 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _584 = _566 + 96;
    uint _587 = uint(int(uint(_584) >> uint(2)));
    uint _589 = uint(int(uint(int(_587)) >> uint(2)));
    int _591 = int(_587) & 3;
    float _593 = (*spvDescriptorSet0.vp_c15)._m0[int(_589)][_591];
    int _595 = int(_587) + 1;
    uint _597 = uint(int(uint(_595) >> uint(2)));
    int _599 = _595 & 3;
    float _601 = (*spvDescriptorSet0.vp_c15)._m0[int(_597)][_599];
    bool _603 = _538 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _605 = _564 + 0.5;
    int _607 = _538 | _580;
    float _609 = _532 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    if (_370)
    {
        float _611 = _560 ? as_type<float>(_556) : _518;
        _516 = _611;
    }
    float _613 = _516;
    bool _615 = _607 < 0;
    bool _617 = _615 || _603;
    int _619 = _566 + 48;
    uint _621 = uint(int(uint(_619) >> uint(2)));
    uint _623 = uint(int(uint(int(_621)) >> uint(2)));
    int _625 = int(_621) & 3;
    float _627 = (*spvDescriptorSet0.vp_c15)._m0[int(_623)][_625];
    int _629 = int(_621) + 1;
    uint _631 = uint(int(uint(_629) >> uint(2)));
    int _633 = _629 & 3;
    float _635 = (*spvDescriptorSet0.vp_c15)._m0[int(_631)][_633];
    float _637 = fma(_582, _613, -0.5);
    float _639 = 0.0;
    if (_412)
    {
        _639 = _404;
    }
    float _641 = _639;
    float _643 = fma(_358, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _645 = _641;
    int _647 = as_type<int>(_643);
    if (!_412)
    {
        _645 = _346;
    }
    float _649 = _645;
    int _651 = _566 + 104;
    uint _653 = uint(int(uint(_651) >> uint(2)));
    uint _655 = uint(int(uint(int(_653)) >> uint(2)));
    int _657 = int(_653) & 3;
    float _659 = (*spvDescriptorSet0.vp_c15)._m0[int(_655)][_657];
    int _661 = int(_653) + 1;
    uint _663 = uint(int(uint(_661) >> uint(2)));
    int _665 = _661 & 3;
    float _667 = (*spvDescriptorSet0.vp_c15)._m0[int(_663)][_665];
    bool _669 = _580 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _671 = _669 || _617;
    float _673 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _675 = floor(_643);
    float _677 = fma(_649, (*spvDescriptorSet0.vp_c9)._m0[89].z, _494);
    float _679 = 0.0;
    if (!_376)
    {
        _679 = _518;
    }
    float _681 = _679;
    float _683 = fma(_546, -2.0, _673);
    float _685 = -_452;
    float _687 = _424 + _685;
    int _689 = _566 + 80;
    uint _691 = uint(int(uint(_689) >> uint(2)));
    uint _693 = uint(int(uint(int(_691)) >> uint(2)));
    int _695 = int(_691) & 3;
    float _697 = (*spvDescriptorSet0.vp_c15)._m0[int(_693)][_695];
    int _699 = int(_691) + 1;
    uint _701 = uint(int(uint(_699) >> uint(2)));
    int _703 = _699 & 3;
    float _705 = (*spvDescriptorSet0.vp_c15)._m0[int(_701)][_703];
    float _707 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[89].x, _677);
    float _709 = _681;
    int _711 = as_type<int>(_707);
    if (_376)
    {
        float _713 = _406 ? as_type<float>(_574) : _518;
        _709 = _713;
    }
    float _715 = _709;
    float _717 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _719 = _404 > 0.5;
    float _721 = _707 * (-0.15915493667125701904296875);
    int _723 = as_type<int>(_715);
    if (!_671)
    {
        int _725 = _580 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _727 = _725 + _538;
        _522 = _727;
    }
    int _729 = _522;
    float _731 = fma(_609, _715, -0.5);
    int _733 = _566 + 56;
    uint _735 = uint(int(uint(_733) >> uint(2)));
    uint _737 = uint(int(uint(int(_735)) >> uint(2)));
    int _739 = int(_735) & 3;
    float _741 = (*spvDescriptorSet0.vp_c15)._m0[int(_737)][_739];
    int _743 = int(_735) + 1;
    uint _745 = uint(int(uint(_743) >> uint(2)));
    int _747 = _743 & 3;
    float _749 = (*spvDescriptorSet0.vp_c15)._m0[int(_745)][_747];
    if (_396)
    {
        float _751 = _719 ? _388 : _338;
        _472 = _751;
    }
    float _753 = _472;
    float _755 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[86].y, _683);
    float _757 = _721 * 6.283185482025146484375;
    float _759 = sin(_757);
    if (!_671)
    {
        int _761 = _729 << 2;
        _711 = _761;
    }
    int _763 = _711;
    float _765 = -_675;
    float _767 = _643 + _765;
    int _769 = _763;
    if (_412)
    {
        _542 = _354;
    }
    float _771 = _542;
    int _773 = _566 + 64;
    uint _775 = uint(int(uint(_773) >> uint(2)));
    uint _777 = uint(int(uint(int(_775)) >> uint(2)));
    int _779 = int(_775) & 3;
    float _781 = (*spvDescriptorSet0.vp_c15)._m0[int(_777)][_779];
    int _783 = int(_775) + 1;
    uint _785 = uint(int(uint(_783) >> uint(2)));
    int _787 = _783 & 3;
    float _789 = (*spvDescriptorSet0.vp_c15)._m0[int(_785)][_787];
    float _791 = _721 * 6.283185482025146484375;
    float _793 = cos(_791);
    float _795 = _771;
    if (!_671)
    {
        uint _797 = uint(int(uint(_729) >> uint(2)));
        _723 = int(_797);
    }
    int _799 = _723;
    float _801 = _717 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    if (!_671)
    {
        int _803 = 12 & _763;
        _769 = _803;
    }
    int _805 = _769;
    int _807 = _566 + 72;
    uint _809 = uint(int(uint(_807) >> uint(2)));
    uint _811 = uint(int(uint(int(_809)) >> uint(2)));
    int _813 = int(_809) & 3;
    float _815 = (*spvDescriptorSet0.vp_c15)._m0[int(_811)][_813];
    int _817 = int(_809) + 1;
    uint _819 = uint(int(uint(_817) >> uint(2)));
    int _821 = _817 & 3;
    float _823 = (*spvDescriptorSet0.vp_c15)._m0[int(_819)][_821];
    float _825 = _430 * _601;
    if (!_412)
    {
        _795 = _404;
    }
    float _827 = _795;
    if (!_671)
    {
        int _829 = _799 << 4;
        int _831 = _829 + _805;
        _647 = _831;
    }
    int _833 = _647;
    float _835 = fma(_358, _593, _825);
    float _837 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _839 = fma(_801, _753, -0.5);
    int _841 = _566 + 88;
    uint _843 = uint(int(uint(_841) >> uint(2)));
    uint _845 = uint(int(uint(int(_843)) >> uint(2)));
    int _847 = int(_843) & 3;
    float _849 = (*spvDescriptorSet0.vp_c15)._m0[int(_845)][_847];
    int _851 = int(_843) + 1;
    uint _853 = uint(int(uint(_851) >> uint(2)));
    int _855 = _851 & 3;
    float _857 = (*spvDescriptorSet0.vp_c15)._m0[int(_853)][_855];
    float _859 = fma(_360, _659, _835);
    float _861 = _827 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _863 = _659;
    if (!_671)
    {
        int _865 = _833 + 400;
        uint _867 = uint(int(uint(_865) >> uint(2)));
        uint _869 = uint(int(uint(int(_867)) >> uint(2)));
        int _871 = int(_867) & 3;
        float _873 = (*spvDescriptorSet0.vp_c15)._m0[int(_869)][_871];
        _863 = _873;
    }
    float _875 = _863;
    float _877 = _859 + _667;
    float _879 = _430 * _635;
    float _881 = -_837;
    float _883 = fma(_861, 2.0, _881);
    float _885 = _759 * _839;
    float _887 = _793 * _839;
    float _889 = fma(_358, _627, _879);
    float _891 = _430 * _705;
    float _893 = -_885;
    float _895 = fma(_793, _731, _893);
    float _897 = fma(_759, _731, _887);
    float _899 = 1.0 / _877;
    float _901 = fma(_358, _697, _891);
    float _903 = fma(_360, _741, _889);
    float _905 = -_138;
    float _907 = fma(_905, (*spvDescriptorSet0.vp_c9)._m0[86].x, _883);
    float _909 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _911 = _903 + _749;
    float _913 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _915 = _885;
    float _917 = _895;
    if (!_671)
    {
        float _919 = floor(_464);
        _915 = _919;
    }
    float _921 = _915;
    float _923 = _430 * _789;
    float _925 = fma(_354, (*spvDescriptorSet0.vp_c9)._m0[88].z, _909);
    float _927 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[88].w, _913);
    float _929 = fma(_358, _781, _923);
    float _931 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[87].z, _925);
    float _933 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[87].w, _927);
    float _935 = fma(_360, _815, _929);
    float _937 = _911 * _899;
    float _939 = fma(_931, _895, _907);
    float _941 = -_755;
    float _943 = fma(_933, _897, _941);
    float _945 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _947 = _935 + _823;
    bool _949 = _937 >= 0.0;
    float _951 = _939 + 0.5;
    float _953 = _943 + 0.5;
    float _955 = fma(_354, (*spvDescriptorSet0.vp_c9)._m0[78].z, _945);
    float _957 = _947 * _899;
    bool _959 = _937 <= 1.0;
    bool _961 = _959 && _949;
    float2 _4266 = float2(_951, _953);
    float _963 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, select(_4266, float2(0.0), isnan(_4266)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, select(_4266, float2(0.0), isnan(_4266)), level(0.0)).w;
    float _965 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[77].z, _955);
    float _967 = -_138;
    float _969 = fma(_967, (*spvDescriptorSet0.vp_c9)._m0[76].x, _444);
    bool _971 = _957 >= 0.0;
    bool _973 = _971 && _961;
    float _975 = _823;
    float _977 = _965;
    float _979 = _947;
    float _981 = _951;
    if (!_671)
    {
        float _983 = floor(_462);
        _975 = _983;
    }
    float _985 = _975;
    float _987 = fma(_360, _849, _901);
    float _989 = fma(_965, _637, _969);
    bool _991 = _957 <= 1.0;
    bool _993 = _991 && _973;
    if (!_671)
    {
        float _995 = -_921;
        float _997 = _464 + _995;
        _977 = _997;
    }
    float _999 = _977;
    float _1001 = _987 + _857;
    float _1003 = _875;
    if (!_671)
    {
        float _1005 = rint(_875);
        float _1007 = precise::max(_1005, 0.0);
        uint _1009 = uint(_1007);
        uint _1011 = clamp(_1009, 0u, 65535u);
        _1003 = as_type<float>(_1011);
    }
    float _1013 = _1003;
    float _1015 = _1001 * _899;
    if (_993)
    {
        float _1017 = float(_550);
        _979 = _1017;
    }
    float _1019 = _979;
    float _1021 = _989 + 0.5;
    if (!_671)
    {
        float _1023 = -_985;
        float _1025 = _462 + _1023;
        _917 = _1025;
    }
    float _1027 = _917;
    float _1029 = _755;
    if (_993)
    {
        float _1031 = rint(_1019);
        float _1033 = precise::max(_1031, 0.0);
        uint _1035 = uint(_1033);
        uint _1037 = clamp(_1035, 0u, 65535u);
        _1029 = as_type<float>(_1037);
    }
    float _1039 = _1029;
    float2 _4388 = float2(_1021, _605);
    float _1041 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_4388, float2(0.0), isnan(_4388)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_4388, float2(0.0), isnan(_4388)), level(0.0)).w;
    float2 _4396 = float2(_767, _687);
    float _1043 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4396, float2(0.0), isnan(_4396)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4396, float2(0.0), isnan(_4396)), level(0.0)).x;
    float _1045 = _999;
    if (!_671)
    {
        float3 _4411 = float3(_1027, _999, float(as_type<int>(_1013)));
        float3 _4415 = select(_4411, float3(0.0), isnan(_4411));
        float _1047 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _4415.xy, uint(rint(_4415.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _4415.xy, uint(rint(_4415.z)), level(0.0)).x;
        _1045 = _1047;
    }
    float _1049 = _1045;
    float _1051 = _1039;
    if (_993)
    {
        float3 _4430 = float3(_937, _957, float(as_type<int>(_1039)));
        float3 _4432 = select(_4430, float3(0.0), isnan(_4430));
        float _1053 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _4432.xy, uint(rint(_4432.z)), _1015, level(0.0));
        _1051 = _1053;
    }
    float _1055 = _1051;
    float _1057 = _346 * 2.0;
    float _1059 = _354 * 2.0;
    float _1061 = _404 * 2.0;
    float _1063 = in.m_75.x;
    float _1065 = floor(_1057);
    float _1067 = in.m_77.y;
    float _1069 = in.m_77.x;
    float _1071 = floor(_1059);
    float _1073 = _354 + _346;
    float _1075 = in.m_77.z;
    float _1077 = _1073 + (-1.0);
    float _1079 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1081 = log2(_1079);
    bool _1083 = _1065 > 0.0;
    bool _1085 = _1065 >= 0.0;
    bool _1087 = isnan(_1065);
    bool _1089 = _1085 || _1087;
    bool _1091 = isnan(0.0);
    bool _1093 = _1089 || _1091;
    float _1095 = fma(_1077, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1097 = _346 + _404;
    float _1099 = _346 + (-0.5);
    bool _1101 = _1071 > 0.0;
    float _1103 = _1097 + (-1.0);
    bool _1105 = _1071 >= 0.0;
    bool _1107 = isnan(_1071);
    bool _1109 = _1105 || _1107;
    bool _1111 = isnan(0.0);
    bool _1113 = _1109 || _1111;
    float _1115 = floor(_1061);
    int _1117 = _1093 ? 0 : 1;
    int _1119 = _1113 ? 0 : 1;
    int _1121 = ~_1117;
    int _1123 = _1121 + 1;
    int _1125 = _1123 + 1;
    int _1127 = ~_1119;
    int _1129 = _1127 + 1;
    int _1131 = _1129 + 1;
    int _1133 = _1125;
    int _1135 = _1131;
    if (!_1083)
    {
        int _1137 = ~_1117;
        int _1139 = _1137 + 1;
        _1133 = _1139;
    }
    int _1141 = _1133;
    float _1143 = _1081 * _138;
    int _1145 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1147 = _1145 != 0;
    int _1149 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1151 = _1149 != 0;
    int _1153 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1155 = _1153 != 0;
    float _1157 = fma(_1103, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    if (!_1101)
    {
        int _1159 = ~_1119;
        int _1161 = _1159 + 1;
        _1135 = _1161;
    }
    int _1163 = _1135;
    float _1165 = _354 + _404;
    bool _1167 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1169 = isnan(0.0);
    bool _1171 = _1167 || _1169;
    bool _1173 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1175 = _1171 || _1173;
    float _1177 = exp2(_1143);
    bool _1179 = !_1151;
    int _1181 = _1179 ? 0 : 1;
    float _1183 = _1165 + (-1.0);
    bool _1185 = !_1155;
    int _1187 = _1185 ? 0 : 1;
    float _1189 = _404 + (-0.5);
    int _1191 = abs(_1181);
    float _1193 = fma(_1183, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _1195 = abs(_1187);
    float _1197 = in.m_79.x;
    float _1199 = in.m_79.y;
    float _1201 = in.m_79.z;
    float _1203 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1205 = 1.0 + _1203;
    bool _1207 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1209 = isnan(1.0);
    bool _1211 = _1207 || _1209;
    bool _1213 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1215 = _1211 || _1213;
    float _1217 = _354 + (-0.5);
    float _1219 = float(_1191);
    float _1221 = 1.0 / _1205;
    float _1223 = float(_1163);
    bool _1225 = _1115 > 0.0;
    float _1227 = -_1177;
    float _1229 = _1227 + 1.0;
    bool _1231 = _1115 >= 0.0;
    bool _1233 = isnan(_1115);
    bool _1235 = _1231 || _1233;
    bool _1237 = isnan(0.0);
    bool _1239 = _1235 || _1237;
    float _1241 = _1219 * _1223;
    float _1243 = float(_1195);
    bool _1245 = !_1147;
    int _1247 = _1245 ? 0 : 1;
    float _1249 = float(_1141);
    float _1251 = _1175 ? _1229 : 0.0;
    float _1253 = _138 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    int _1255 = _1239 ? 0 : 1;
    float _1257 = _1243 * _1249;
    if (_1215)
    {
        float _1259 = _1251 * _1221;
        _148 = _1259;
    }
    float _1261 = _148;
    int _1263 = abs(_1247);
    float _1265 = _1241 * (-2.0);
    int _1267 = ~_1255;
    int _1269 = _1267 + 1;
    int _1271 = _1269 + 1;
    float _1273 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1275 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _1273;
    int _1277 = _1271;
    if (!_1225)
    {
        int _1279 = ~_1255;
        int _1281 = _1279 + 1;
        _1277 = _1281;
    }
    int _1283 = _1277;
    float _1285 = fma(_1157, _1265, _1157);
    float _1287 = fma(_1265, _1199, _1199);
    float _1289 = float(_1283);
    float _1291 = 1.0 / _1275;
    float _1293 = float(_1263);
    float _1295 = fma(_1099, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1287);
    float _1297 = _1257 * (-2.0);
    float _1299 = _1293 * _1289;
    float _1301 = fma(_1285, _1261, _1295);
    float _1303 = fma(_1297, _1201, _1201);
    float _1305 = fma(_1193, _1297, _1193);
    float _1307 = _1299 * (-2.0);
    float _1309 = _1301 * 0.15915493667125701904296875;
    float _1311 = fma(_1189, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1303);
    float _1313 = fma(_1307, _1197, _1197);
    float _1315 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1317 = _330 + _1315;
    float _1319 = fma(_1305, _1261, _1311);
    float _1321 = fma(_1095, _1307, _1095);
    float _1323 = fma(_1217, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1313);
    float _1325 = _1317 * _1291;
    bool _1327 = _330 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1329 = isnan(_330);
    bool _1331 = _1327 || _1329;
    bool _1333 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1335 = _1331 || _1333;
    float _1337 = float(_1335);
    float _1339 = _1319 * 0.15915493667125701904296875;
    bool _1341 = _330 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _1343 = isnan(_330);
    bool _1345 = _1341 || _1343;
    bool _1347 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _1349 = _1345 || _1347;
    float _1351 = float(_1349);
    float _1353 = fma(_1321, _1261, _1323);
    float _1355 = in.m_69.x;
    float _1357 = in.m_69.y;
    float _1359 = in.m_69.z;
    float _1361 = _1309 * 6.283185482025146484375;
    float _1363 = sin(_1361);
    float _1365 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1367 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1365;
    float _1369 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _1371 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _1369;
    float _1373 = _1353 * 0.15915493667125701904296875;
    float _1375 = fma(_1367, _1325, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _1377 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1379 = isnan(0.5);
    bool _1381 = _1377 || _1379;
    bool _1383 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1385 = _1381 || _1383;
    float _1387 = fma(_1371, _1325, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _1389 = _1309 * 6.283185482025146484375;
    float _1391 = cos(_1389);
    float _1393 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1395 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1393;
    float _1397 = fma(_1395, _1325, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _1399 = _1373 * 6.283185482025146484375;
    float _1401 = sin(_1399);
    float _1403 = -_1351;
    float _1405 = _1403 + 1.0;
    float _1407 = _1337 * _1405;
    float _1409 = -_1337;
    float _1411 = _1409 + 1.0;
    float _1413 = _1373 * 6.283185482025146484375;
    float _1415 = cos(_1413);
    float _1417 = _1387 * _1407;
    float _1419 = _1375 * _1407;
    float _1421 = _1397 * _1407;
    float _1423 = fma(_1411, (*spvDescriptorSet0.vp_c9)._m0[143].z, _1417);
    float _1425 = fma(_1411, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1419);
    float _1427 = fma(_1411, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1421);
    float _1429 = _1339 * 6.283185482025146484375;
    float _1431 = sin(_1429);
    float _1433 = _1401 * _1363;
    float _1435 = fma(_1351, (*spvDescriptorSet0.vp_c9)._m0[144].y, _1425);
    float _1437 = fma(_1351, (*spvDescriptorSet0.vp_c9)._m0[144].x, _1427);
    float _1439 = fma(_1351, (*spvDescriptorSet0.vp_c9)._m0[144].z, _1423);
    float _1441 = _1435 * _1357;
    float _1443 = _1437 * _1355;
    float _1445 = in.m_75.w;
    float _1447 = _1415 * _1391;
    float _1449 = _1415 * _1363;
    float _1451 = _1339 * 6.283185482025146484375;
    float _1453 = cos(_1451);
    float _1455 = _1439 * _1359;
    float _1457 = fma(_1431, _1447, _1433);
    float _1459 = fma(_1431, _1433, _1447);
    float _1461 = _1401 * _1391;
    float _1463 = _1455 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1465 = -_1449;
    float _1467 = fma(_1431, _1461, _1465);
    float _1469 = -_1461;
    float _1471 = fma(_1431, _1449, _1469);
    float _1473 = _1391 * _1453;
    float _1475 = _1415 * _1453;
    float _1477 = _1443 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1479 = _1401 * _1453;
    float _1481 = _1363 * _1453;
    float _1483 = _963 + _1063;
    float _1485 = fma(_1483, 6.283185482025146484375, _1253);
    float _1487 = _1485 * 0.15915493667125701904296875;
    float _1489 = _1487 * 6.283185482025146484375;
    float _1491 = sin(_1489);
    float _1493 = _1041 * _1445;
    float _1495 = _1493 * (*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1497 = fma(_1491, 0.5, 0.5);
    float _1499 = _1441 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1501 = _1495 * _1497;
    float _1503 = fma(_1501, 0.1500000059604644775390625, _1067);
    float _1505 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1069);
    float _1507 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1503);
    float _1509 = _1505 * _1477;
    float _1511 = _1507 * _1499;
    float _1513 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1075);
    float _1515 = _1475 * _1511;
    float _1517 = _1513 * _1463;
    float _1519 = -_1511;
    float _1521 = _1431 * _1519;
    float _1523 = _1479 * _1511;
    float _1525 = fma(_1457, _1509, _1515);
    float _1527 = fma(_1473, _1509, _1521);
    float _1529 = fma(_1467, _1509, _1523);
    float _1531 = fma(_1471, _1517, _1525);
    float _1533 = fma(_1481, _1517, _1527);
    float _1535 = fma(_1459, _1517, _1529);
    float _1537 = _1531 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1539 = _1531 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1541 = fma(_1533, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1537);
    float _1543 = fma(_1533, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1539);
    float _1545 = fma(_1535, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1541);
    float _1547 = fma(_1535, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1543);
    float _1549 = _1531 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1551 = _360 + _1545;
    float _1553 = _358 + _1547;
    float _1555 = fma(_1533, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1549);
    float _1557 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1559 = _1551 + _1557;
    float _1561 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1563 = _1553 + _1561;
    float _1565 = fma(_1535, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1555);
    float _1567 = _1559 * _1559;
    float _1569 = _356 + _1565;
    float _1571 = fma(_1563, _1563, _1567);
    float _1573 = sqrt(_1571);
    bool _1575 = _1573 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1577 = _1567;
    float _1579 = _1553;
    float _1581 = _1565;
    float _1583 = _1297;
    float _1585 = _1049;
    if (!_1575)
    {
        _1577 = _1553;
    }
    float _1587 = _1577;
    float _1589 = _1587;
    if (!_1575)
    {
        _1579 = _1551;
    }
    float _1591 = _1579;
    float _1593 = _1591;
    if (!_1575)
    {
        _1581 = _1569;
    }
    float _1595 = _1581;
    bool _1597 = !_1575;
    float _1599 = _1595;
    if (!_1597)
    {
        float _1601 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1603 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1605 = _1573 + _1603;
        float _1607 = rsqrt(_1571);
        float _1609 = _1605 * _1601;
        float _1611 = _1569 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1613 = _1609 * 0.15915493667125701904296875;
        float _1615 = _1613 * 6.283185482025146484375;
        float _1617 = cos(_1615);
        float _1619 = _1613 * 6.283185482025146484375;
        float _1621 = sin(_1619);
        float _1623 = _1617 + (-1.0);
        float _1625 = _1623 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1627 = fma(_1621, _1611, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1629 = fma(_1569, _1617, _1625);
        float _1631 = _1607 * _1627;
        float _1633 = fma(_1563, _1631, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1635 = fma(_1559, _1631, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1599 = _1629;
        _1589 = _1633;
        _1593 = _1635;
    }
    float _1637 = _1599;
    float _1639 = _1589;
    float _1641 = _1593;
    float _1643 = _1637;
    float _1645 = _1639;
    float _1647 = _1641;
    if (!_1385)
    {
        float _1649 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1651 = _356 + _1649;
        float _1653 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1655 = _358 + _1653;
        float _1657 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1659 = -_356;
        float _1661 = _1659 + _1637;
        float _1663 = _1651 * _1651;
        float _1665 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1667 = _360 + _1665;
        float _1669 = -_358;
        float _1671 = _1669 + _1639;
        float _1673 = -_360;
        float _1675 = _1673 + _1641;
        float _1677 = fma(_1655, _1655, _1663);
        float _1679 = fma(_1667, _1667, _1677);
        float _1681 = sqrt(_1679);
        float _1683 = precise::min(_1681, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1685 = _1683 * _1657;
        float _1687 = fma(_1661, _1685, _356);
        float _1689 = fma(_1671, _1685, _358);
        float _1691 = fma(_1675, _1685, _360);
        _1643 = _1687;
        _1645 = _1689;
        _1647 = _1691;
    }
    float _1693 = _1643;
    float _1695 = _1645;
    float _1697 = _1647;
    if (_671)
    {
        _1583 = 1.0;
    }
    float _1699 = _1583;
    float _1701 = _1699;
    if (!_671)
    {
        int _1703 = _729 << 4;
        int _1705 = _1703 + 2048;
        uint _1707 = uint(int(uint(_1705) >> uint(2)));
        uint _1709 = uint(int(uint(int(_1707)) >> uint(2)));
        int _1711 = int(_1707) & 3;
        float _1713 = (*spvDescriptorSet0.vp_c15)._m0[int(_1709)][_1711];
        int _1715 = int(_1707) + 1;
        uint _1717 = uint(int(uint(_1715) >> uint(2)));
        int _1719 = _1715 & 3;
        float _1721 = (*spvDescriptorSet0.vp_c15)._m0[int(_1717)][_1719];
        int _1723 = _1705 + 8;
        uint _1725 = uint(int(uint(_1723) >> uint(2)));
        uint _1727 = uint(int(uint(int(_1725)) >> uint(2)));
        int _1729 = int(_1725) & 3;
        float _1731 = (*spvDescriptorSet0.vp_c15)._m0[int(_1727)][_1729];
        int _1733 = int(_1725) + 1;
        uint _1735 = uint(int(uint(_1733) >> uint(2)));
        int _1737 = _1733 & 3;
        float _1739 = (*spvDescriptorSet0.vp_c15)._m0[int(_1735)][_1737];
        float _1741 = _430 * _1721;
        float _1743 = fma(_358, _1713, _1741);
        float _1745 = fma(_360, _1731, _1743);
        float _1747 = _1745 + _1739;
        float _1749 = precise::clamp(_1747, 0.0, 1.0);
        float _1751 = -_1749;
        float _1753 = _1751 + _1049;
        float _1755 = fma(_1753, 500.0, 1.5);
        float _1757 = exp2(_1755);
        float _1759 = 0.0 + _1757;
        float _1761 = precise::clamp(_1759, 0.0, 1.0);
        _1701 = _1761;
    }
    float _1763 = _1701;
    float _1765 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1767 = _1693 + _1765;
    float _1769 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1771 = _1695 + _1769;
    float _1773 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1775 = _1697 + _1773;
    float _1777 = _1767 * _1767;
    float _1779 = fma(_1771, _1771, _1777);
    float _1781 = fma(_1775, _1775, _1779);
    float _1783 = rsqrt(_1781);
    float _1785 = sqrt(_1781);
    float _1787 = _1783 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1789 = _1771 * _1787;
    float _1791 = _1775 * _1787;
    float _1793 = _1789 * _1789;
    float _1795 = _1791 * _1791;
    float _1797 = _1793 + _1795;
    float _1799 = sqrt(_1797);
    bool _1801 = _1799 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1803 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1805 = _1799 + _1803;
    float _1807 = _1783;
    float _1809 = _1805;
    float _1811 = _1767;
    float _1813 = _1787;
    float _1815 = _1797;
    if (_1801)
    {
        float _1817 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1807 = _1817;
    }
    float _1819 = _1807;
    float _1821 = _1819;
    if (_1801)
    {
        float _1823 = _1805 * _1819;
        _1809 = _1823;
    }
    float _1825 = _1809;
    if (_1801)
    {
        float _1827 = rsqrt(_1797);
        _1821 = _1827;
    }
    float _1829 = _1821;
    float _1831 = _1829;
    if (_1801)
    {
        float _1833 = _1825 * 0.15915493667125701904296875;
        _1585 = _1833;
    }
    float _1835 = _1585;
    float _1837 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1839 = _1775;
    if (_1801)
    {
        float _1841 = _1835 * 6.283185482025146484375;
        float _1843 = sin(_1841);
        _1839 = _1843;
    }
    float _1845 = _1839;
    float _1847 = precise::max(0.0, _1837);
    float _1849 = -_1787;
    float _1851 = -_1847;
    float _1853 = fma(_1767, _1849, _1851);
    float _1855 = (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1857 = _1847;
    if (_1801)
    {
        float _1859 = _1835 * 6.283185482025146484375;
        float _1861 = cos(_1859);
        _1855 = _1861;
    }
    float _1863 = _1855;
    if (_1801)
    {
        float _1865 = _1853 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1811 = _1865;
    }
    float _1867 = _1811;
    float _1869 = _1845;
    float _1871 = _1867;
    if (_1801)
    {
        float _1873 = fma(_1845, _1867, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1869 = _1873;
    }
    float _1875 = _1869;
    float _1877 = _1875;
    if (!_1801)
    {
        _1871 = _1853;
    }
    float _1879 = _1871;
    float _1881 = _1879;
    if (_1801)
    {
        float _1883 = _1829 * _1875;
        _1813 = _1883;
    }
    float _1885 = _1813;
    if (!_1801)
    {
        _1831 = _1789;
    }
    float _1887 = _1831;
    float _1889 = _1887;
    if (!_1801)
    {
        _1877 = _1793;
    }
    float _1891 = _1877;
    float _1893 = _1891;
    float _1895 = _1863;
    if (_1801)
    {
        float _1897 = _1863 + (-1.0);
        _1857 = _1897;
    }
    float _1899 = _1857;
    float _1901 = _1899;
    if (_1801)
    {
        float _1903 = _1789 * _1885;
        _1889 = _1903;
    }
    float _1905 = _1889;
    float _1907 = _1693 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_1801)
    {
        float _1909 = _1899 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1815 = _1909;
    }
    float _1911 = _1815;
    if (!_1801)
    {
        _1901 = _1791;
    }
    float _1913 = _1901;
    float _1915 = _1913;
    if (_1801)
    {
        float _1917 = _1791 * _1885;
        _1915 = _1917;
    }
    float _1919 = _1915;
    if (_1801)
    {
        float _1921 = _1905 * _1905;
        _1893 = _1921;
    }
    float _1923 = _1893;
    if (_1801)
    {
        float _1925 = fma(_1853, _1863, _1911);
        _1881 = _1925;
    }
    float _1927 = _1881;
    if (!_1801)
    {
        _1895 = _1795;
    }
    float _1929 = _1895;
    float _1931 = _1929;
    if (_1801)
    {
        float _1933 = _1919 * _1919;
        _1931 = _1933;
    }
    float _1935 = _1931;
    float _1937 = _1693 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1939 = fma(_1927, _1927, _1923);
    float _1941 = fma(_1695, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1907);
    float _1943 = fma(_1695, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1937);
    float _1945 = _1939 + _1935;
    float _1947 = _1693 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1949 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1951 = fma(_1785, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1949);
    float _1953 = precise::clamp(_1951, 0.0, 1.0);
    float _1955 = fma(_1697, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1943);
    float _1957 = rsqrt(_1945);
    float _1959 = _1693 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1961 = fma(_1695, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1947);
    float _1963 = -_1953;
    float _1965 = _1963 + 1.0;
    float _1967 = _1955 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1969 = fma(_1695, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1959);
    float _1971 = fma(_1697, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1961);
    float _1973 = fma(_1697, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1941);
    float _1975 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1977 = fma(_1697, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1969);
    float _1979 = _1971 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1981 = abs(_1965);
    float _1983 = log2(_1981);
    float _1985 = _1967 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1987 = _1977 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1989 = _1979 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1991 = _1973 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1993 = _1957 * _1905;
    float _1995 = _1957 * _1927;
    float _1997 = fma(_1987, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1989);
    float _1999 = _1957 * _1919;
    float _2001 = _1993 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2003 = -_1985;
    float _2005 = fma(_2003, _1975, 1.0);
    float _2007 = fma(_1967, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1997);
    float _2009 = _1979 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2011 = -_2001;
    float _2013 = fma(_1995, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2011);
    float _2015 = _1995 + 1.0;
    float _2017 = fma(_1991, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2007);
    float _2019 = _1983 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2021 = -_1999;
    float _2023 = fma(_2021, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2013);
    float _2025 = log2(_2005);
    float _2027 = _1979 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2029 = fma(_1987, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2009);
    float _2031 = fma(_2023, -0.5, 0.5);
    float _2033 = fma(_2023, 0.5, 0.5);
    float _2035 = fma(_1987, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2027);
    float _2037 = fma(_1967, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2029);
    float _2039 = 1.0 / _2017;
    float _2041 = fma(_2033, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2043 = fma(_1967, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2035);
    float _2045 = fma(_1991, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2037);
    float _2047 = fma(_2033, _2041, -0.212114393711090087890625);
    float _2049 = fma(_1991, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2043);
    float _2051 = exp2(_2019);
    float _2053 = _2025 * 0.693147182464599609375;
    float _2055 = _2053 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2057 = sqrt(_2031);
    float _2059 = fma(_2033, _2047, 1.570728778839111328125);
    float _2061 = _2049 * _2039;
    float _2063 = _2045 * _2039;
    float _2065 = fma(_2063, -0.5, 0.5);
    float _2067 = -_1995;
    float _2069 = fma(_2051, _2015, _2067);
    float _2071 = fma(_2061, 0.5, 0.5);
    float _2073 = fma(_2069, 0.5, 0.5);
    float _2075 = _2057 * 0.636619746685028076171875;
    float3 _6008 = float3(_2071, _2065, _2055);
    float _2077 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6008, float3(0.0), isnan(_6008)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6008, float3(0.0), isnan(_6008)), level(0.0)).x;
    float3 _6017 = float3(_2071, _2065, _2055);
    float4 _2080 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6017, float3(0.0), isnan(_6017)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6017, float3(0.0), isnan(_6017)), level(0.0)).xyzw;
    float _2082 = _2080.x;
    float _2084 = _2080.y;
    float _2086 = _2080.z;
    float _2088 = _2080.w;
    float _2090 = -_2059;
    float _2092 = fma(_2075, _2090, 1.0);
    float2 _6038 = float2(_2092, _2073);
    float3 _2096 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6038, float2(0.0), isnan(_6038)), level(0.0)), spvDescriptorSet0.dm_border, 6u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6038, float2(0.0), isnan(_6038)), level(0.0)).xyz;
    float _2098 = _2096.x;
    float _2100 = _2096.y;
    float _2102 = _2096.z;
    float _2104 = abs(_478);
    float _2106 = log2(_2104);
    float _2108 = in.m_81.x;
    float _2110 = in.m_81.y;
    float _2112 = in.m_81.z;
    float _2114 = in.m_81.w;
    float _2116 = _1979 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_83.x = _1063;
    float _2118 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2120 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2122 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2124 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2126 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2128 = _2106 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2130 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2132 = _2124 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2134 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _2136 = _1503 != 0.0;
    bool _2138 = isnan(_1503);
    bool _2140 = _2136 || _2138;
    bool _2142 = isnan(0.0);
    bool _2144 = _2140 || _2142;
    float _2146 = in.m_85.x;
    float _2148 = in.m_85.y;
    float _2150 = in.m_85.z;
    float _2152 = exp2(_2128);
    float _2154 = _2118 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2156 = _1069 == 0.0;
    bool _2158 = !_2144;
    bool _2160 = _2156 && _2158;
    float _2162 = _1475 * _2110;
    float _2164 = _2126 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2166 = -_2110;
    float _2168 = _1431 * _2166;
    float _2170 = fma(_1457, _2108, _2162);
    bool _2172 = _1075 == 0.0;
    bool _2174 = _2172 && _2160;
    float _2176 = _2120 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2178 = _2134 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2180 = _2122 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_87.x = _2154;
    out.m_87.y = _2164;
    out.m_87.z = _2132;
    out.m_87.w = _2130;
    float _2182 = fma(_1473, _2108, _2168);
    float _2184 = fma(_1471, _2112, _2170);
    float _2186 = fma(_2152, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2188 = precise::clamp(_2186, 0.0, 1.0);
    out.m_89.x = _2176;
    out.m_89.y = _2178;
    out.m_89.z = _2180;
    float _2190 = fma(_1481, _2112, _2182);
    bool _2192 = _478 <= 8000.0;
    bool _2194 = isnan(_478);
    bool _2196 = _2192 || _2194;
    bool _2198 = isnan(8000.0);
    bool _2200 = _2196 || _2198;
    float _2202 = float(_2200);
    float _2204 = fma(_1987, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2116);
    out.m_91.x = _951;
    out.m_91.y = _953;
    float _2206 = -_1043;
    float _2208 = _2206 + 1.0;
    float _2210 = fma(_1967, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2204);
    out.m_93.x = _1021;
    out.m_93.y = _605;
    float _2212 = _1479 * _2110;
    float _2214 = fma(_2188, -2.0, 3.0);
    float _2216 = _2188 * _2188;
    float _2218 = _2184 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2220 = fma(_1467, _2108, _2212);
    float _2222 = _2184 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2224 = _2216 * _2214;
    float _2226 = fma(_2190, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2218);
    float _2228 = fma(_1459, _2112, _2220);
    float _2230 = fma(_2190, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2222);
    float _2232 = _2230;
    float _2234 = _2176;
    float _2236 = _2180;
    float _2238 = _2017;
    float _2240 = _2045;
    if (_2174)
    {
        _981 = _2148;
    }
    float _2242 = _981;
    float _2244 = _2184 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2246 = fma(_2228, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2226);
    float _2248 = fma(_2228, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2230);
    float _2250 = _2242;
    if (_2174)
    {
        _2232 = _2242;
    }
    float _2252 = _2232;
    float _2254 = fma(_2190, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2244);
    float _2256 = _2252;
    if (!_2174)
    {
        _2250 = _2148;
    }
    float _2258 = _2250;
    float _2260 = _2112 * _2146;
    if (_2174)
    {
        _2234 = _2146;
    }
    float _2262 = _2234;
    float _2264 = fma(_2228, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2254);
    float _2266 = _2110 * _2150;
    float _2268 = _2108 * _2258;
    float _2270 = -_2260;
    float _2272 = fma(_2108, _2150, _2270);
    float _2274 = _2262;
    if (!_2174)
    {
        float _2276 = fma(_1503, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2258);
        _2256 = _2276;
    }
    float _2278 = _2256;
    float _2280 = -_2266;
    float _2282 = fma(_2112, _2258, _2280);
    float _2284 = -_2268;
    float _2286 = fma(_2110, _2146, _2284);
    float _2288 = _2272 * _2114;
    out.m_95.x = _2246;
    out.m_95.y = _2248;
    out.m_95.z = _2264;
    if (!_2174)
    {
        float _2290 = fma(_1069, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2146);
        _2274 = _2290;
    }
    float _2292 = _2274;
    float _2294 = _2282 * _2114;
    float _2296 = -_2278;
    float _2298 = _1431 * _2296;
    float _2300 = -_2288;
    float _2302 = _1431 * _2300;
    float _2304 = _2286 * _2114;
    if (_2174)
    {
        _2236 = _2150;
    }
    float _2306 = _2236;
    float _2308 = _2306;
    if (!_2174)
    {
        float _2310 = fma(_1075, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2150);
        _2308 = _2310;
    }
    float _2312 = _2308;
    float _2314 = fma(_1473, _2294, _2302);
    float _2316 = fma(_1473, _2292, _2298);
    out.m_97.x = _1695;
    out.m_97.y = _1693;
    out.m_97.z = _1697;
    bool _2318 = _1785 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2320 = isnan(_1785);
    bool _2322 = _2318 || _2320;
    bool _2324 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2326 = _2322 || _2324;
    float _2328 = _1475 * _2278;
    float _2330 = _1475 * _2288;
    float _2332 = _1479 * _2278;
    float _2334 = _1479 * _2288;
    float _2336 = fma(_1457, _2292, _2328);
    float _2338 = fma(_1457, _2294, _2330);
    float _2340 = fma(_1481, _2304, _2314);
    float _2342 = fma(_1467, _2294, _2334);
    float _2344 = fma(_1471, _2312, _2336);
    float _2346 = fma(_1471, _2304, _2338);
    float _2348 = fma(_1467, _2292, _2332);
    float _2350 = fma(_1459, _2304, _2342);
    float _2352 = fma(_1481, _2312, _2316);
    float _2354 = _2346 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2356 = _2346 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2358 = _2344 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2360 = fma(_1459, _2312, _2348);
    float _2362 = fma(_2340, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2354);
    float _2364 = fma(_2340, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2356);
    float _2366 = fma(_2352, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2358);
    float _2368 = _2346 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2370 = fma(_2350, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2362);
    float _2372 = fma(_2350, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2364);
    float _2374 = _2344 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2376 = _2344 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2378 = -_2224;
    float _2380 = _2378 + 1.0;
    float _2382 = fma(_2340, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2368);
    float _2384 = fma(_2352, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2374);
    float _2386 = fma(_2352, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2376);
    float _2388 = fma(_2350, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2382);
    float _2390 = fma(_2360, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2384);
    float _2392 = fma(_2360, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2386);
    float _2394 = fma(_2360, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2366);
    float _2396 = _1983 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2398 = fma(_2380, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2224);
    float _2400 = _2017 * 0.5;
    out.m_99.x = _2370;
    out.m_99.y = _2372;
    out.m_99.z = _2388;
    float _2402 = fma(_1991, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2210);
    float _2404 = _2202 * _2398;
    float _2406 = exp2(_2396);
    out.m_101.x = (*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2408 = _2404 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.gl_Position.x = _2049;
    out.gl_Position.y = _2045;
    out.gl_Position.z = _2402;
    out.gl_Position.w = _2017;
    float _2410 = _2208 * _2408;
    float _2412 = precise::clamp(_2410, 0.0, 1.0);
    float _2414 = fma(_2045, -0.5, _2400);
    float _2416 = _2400;
    float _2418 = _2402;
    if (!_993)
    {
        _2416 = 1.0;
    }
    float _2420 = _2416;
    float _2422 = -_2412;
    float _2424 = fma(_2422, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2426 = _2420;
    if (_993)
    {
        bool _2428 = _1055 >= _1015;
        bool _2430 = isnan(_1055);
        bool _2432 = _2428 || _2430;
        bool _2434 = isnan(_1015);
        bool _2436 = _2432 || _2434;
        float _2438 = float(_2436);
        _2426 = _2438;
    }
    float _2440 = _2426;
    float _2442 = _2049 + _2017;
    out.m_103.x = _2390;
    out.m_103.y = _2392;
    out.m_103.z = _2394;
    float _2444 = _2402 + _2017;
    float _2446 = -_2406;
    float _2448 = _2446 + 1.0;
    float _2450 = _2440 * _1763;
    float _2452 = _2442 * 0.5;
    float _2454 = _2444 * 0.5;
    float _2456 = _2448 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2458 = -_2450;
    float _2460 = fma(_2458, _2424, 1.0);
    float _2462 = precise::clamp(_2460, 0.0, 1.0);
    float _2464 = _2452;
    if (!_2326)
    {
        _2238 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2466 = _2238;
    float _2468 = -_2456;
    float _2470 = _2468 + 1.0;
    float _2472 = _2462 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_105.x = _2452;
    out.m_105.y = _2414;
    out.m_105.z = _2454;
    out.m_105.w = _2017;
    float _2474 = _2470;
    float _2476 = _2466;
    float _2478 = _2466;
    if (!_2326)
    {
        _2418 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2480 = _2418;
    float _2482 = _2480;
    float _2484 = _2480;
    if (!_2326)
    {
        _2240 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2486 = _2240;
    out.m_107.x = _2472;
    float _2488 = _2486;
    float _2490 = _2486;
    if (!_2326)
    {
        _2464 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2492 = _2464;
    float _2494 = _2456 * _2077;
    float _2496 = _2088 * _2470;
    float _2498 = _2492;
    float _2500 = _2492;
    if (!_2326)
    {
        _2474 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2502 = _2474;
    float _2504 = _2088 * _2494;
    float _2506 = _2102 * _2494;
    float _2508 = fma(_2098, _2504, _2082);
    float _2510 = fma(_2100, _2504, _2084);
    float _2512 = _2504;
    float _2514 = _2502;
    float _2516 = _2502;
    if (!_2326)
    {
        _2512 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2518 = _2512;
    float _2520 = fma(_2088, _2506, _2086);
    out.m_109.x = _2508;
    out.m_109.y = _2510;
    out.m_109.z = _2520;
    out.m_109.w = _2496;
    bool _2522 = !_2326;
    float _2524 = _2518;
    float _2526 = _2518;
    if (!_2522)
    {
        bool _2528 = _1785 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2530 = isnan(_1785);
        bool _2532 = _2528 || _2530;
        bool _2534 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2536 = _2532 || _2534;
        if (!_2536)
        {
            float _2538 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2540 = _1785 + _2538;
            float _2542 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2544 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2542;
            float _2546 = 1.0 / _2544;
            float _2548 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2550 = _2548 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2552 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2554 = _2552 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2556 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2558 = _2556 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2560 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2562 = _2560 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2564 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2566 = _2564 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2568 = _2540 * _2546;
            float _2570 = precise::clamp(_2568, 0.0, 1.0);
            float _2572 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2574 = _2572 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2576 = fma(_2570, _2550, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2578 = fma(_2570, _2574, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2580 = fma(_2570, _2554, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2582 = fma(_2570, _2558, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2584 = fma(_2570, _2562, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2586 = fma(_2570, _2566, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2478 = _2578;
            _2516 = _2584;
            _2500 = _2576;
            _2490 = _2582;
            _2484 = _2580;
            _2526 = _2586;
            _2588 = true;
        }
        else
        {
            bool _2590 = _1785 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2592 = isnan(_1785);
            bool _2594 = _2590 || _2592;
            bool _2596 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2598 = _2594 || _2596;
            if (!_2598)
            {
                _2498 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2600 = _2498;
            _2500 = _2600;
            if (!_2598)
            {
                _2476 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2602 = _2476;
            _2478 = _2602;
            if (!_2598)
            {
                _2482 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2604 = _2482;
            _2484 = _2604;
            if (!_2598)
            {
                _2488 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2606 = _2488;
            _2490 = _2606;
            if (!_2598)
            {
                _2514 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2608 = _2514;
            _2516 = _2608;
            if (!_2598)
            {
                _2524 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2610 = _2524;
            bool _2612 = !_2598;
            _2526 = _2610;
            if (!_2612)
            {
                bool _2614 = _1785 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2616 = isnan(_1785);
                bool _2618 = _2614 || _2616;
                bool _2620 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2622 = _2618 || _2620;
                if (!_2622)
                {
                    float _2624 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2626 = _1785 + _2624;
                    float _2628 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2630 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2628;
                    float _2632 = 1.0 / _2630;
                    float _2634 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2636 = _2634 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2638 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2640 = _2638 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2642 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2644 = _2642 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2646 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2648 = _2646 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2650 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2652 = _2650 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2654 = _2626 * _2632;
                    float _2656 = precise::clamp(_2654, 0.0, 1.0);
                    float _2658 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2660 = _2658 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2662 = fma(_2656, _2636, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2664 = fma(_2656, _2660, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2666 = fma(_2656, _2640, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2668 = fma(_2656, _2644, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2670 = fma(_2656, _2648, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2672 = fma(_2656, _2652, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2478 = _2664;
                    _2516 = _2670;
                    _2500 = _2662;
                    _2490 = _2668;
                    _2484 = _2666;
                    _2526 = _2672;
                    _2588 = true;
                }
                else
                {
                    _2478 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2516 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2500 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2490 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2484 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2526 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2588 = false;
    float _2674 = _2478;
    float _2676 = _2516;
    float _2678 = _2500;
    float _2680 = _2490;
    float _2682 = _2484;
    float _2684 = _2526;
    float _2686 = fma(_2392, -0.5, 0.5);
    float _2688 = precise::clamp(_2686, 0.0, 1.0);
    float _2690 = -_2674;
    float _2692 = _2690 + _2676;
    float _2694 = -_2678;
    float _2696 = _2694 + _2680;
    float _2698 = -_2682;
    float _2700 = _2698 + _2684;
    bool _2702 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2704 = fma(_2688, _2692, _2674);
    float _2706 = fma(_2688, _2696, _2678);
    float _2708 = fma(_2688, _2700, _2682);
    float _2710 = _2704 * 0.586610972881317138671875;
    out.m_111.x = 0.0;
    float _2712 = fma(_2706, 0.298911988735198974609375, _2710);
    float _2714 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2716 = fma(_2708, 0.114477999508380889892578125, _2712);
    out.m_67.x = _2714;
    float _2718 = -_2716;
    float _2720 = _2706 + _2718;
    float _2722 = -_2716;
    float _2724 = _2704 + _2722;
    float _2726 = -_2716;
    float _2728 = _2708 + _2726;
    float _2730 = fma(_2720, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2716);
    float _2732 = fma(_2724, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2716);
    float _2734 = fma(_2728, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2716);
    out.m_113.x = _2730;
    out.m_113.y = _2732;
    out.m_113.z = _2734;
    if (!_2702)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_113.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_113.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_113.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_113.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2736 = -_1693;
    float _2738 = _2736 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2740 = -_1695;
    float _2742 = _2740 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2744 = -_1697;
    float _2746 = _2744 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2748 = _2738 * _2738;
    float _2750 = fma(_2742, _2742, _2748);
    float _2752 = fma(_2746, _2746, _2750);
    float _2754 = sqrt(_2752);
    float _2756 = rsqrt(_2752);
    float _2758 = -_2754;
    float _2760 = _2758 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2762 = _2760 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2764 = precise::clamp(_2762, 0.0, 1.0);
    float _2766 = _2742 * _2756;
    float _2768 = _2738 * _2756;
    float _2770 = abs(_2764);
    float _2772 = log2(_2770);
    float _2774 = _2746 * _2756;
    float _2776 = _2766 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2778 = _2392 * _2768;
    float _2780 = -_2768;
    float _2782 = -_2776;
    float _2784 = fma(_2780, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2782);
    float _2786 = fma(_2390, _2766, _2778);
    float _2788 = -_2774;
    float _2790 = fma(_2788, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2784);
    float _2792 = fma(_2394, _2774, _2786);
    float _2794 = precise::clamp(_2792, 0.0, 1.0);
    float _2796 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2798 = _2790 + _2796;
    float _2800 = _2772 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2802 = _2798 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2804 = precise::clamp(_2802, 0.0, 1.0);
    float _2806 = exp2(_2800);
    float _2808 = _2806 * _2804;
    float _2810 = _2794 * _2808;
    float _2812 = _2810 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2814 = _2810 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2816 = _2810 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_111.x = _2812;
    out.m_111.y = _2814;
    out.m_111.z = _2816;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_113.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_113.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_113.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_113.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

