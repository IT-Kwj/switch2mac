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
    texture2d<float> vp_t_tcb_2C [[id(6)]];
    sampler vp_t_tcb_2CSmplr [[id(7)]];
    texture2d<float> vp_t_tcb_28 [[id(8)]];
    sampler vp_t_tcb_28Smplr [[id(9)]];
    texture2d<float> vp_t_tcb_24 [[id(10)]];
    sampler vp_t_tcb_24Smplr [[id(11)]];
    texture2d_array<float> vp_t_tcb_16 [[id(12)]];
    sampler vp_t_tcb_16Smplr [[id(13)]];
    texture3d<float> vp_t_tcb_32 [[id(14)]];
    sampler vp_t_tcb_32Smplr [[id(15)]];
    texture3d<float> vp_t_tcb_30 [[id(16)]];
    sampler vp_t_tcb_30Smplr [[id(17)]];
    texture2d<float> vp_t_tcb_1C [[id(18)]];
    sampler vp_t_tcb_1CSmplr [[id(19)]];
    texture2d_array<float> vp_t_tcb_14 [[id(20)]];
    sampler vp_t_tcb_14Smplr [[id(21)]];
    sampler vp_t_tcb_2CSmplr_w [[id(22)]];
    sampler vp_t_tcb_28Smplr_w [[id(23)]];
    sampler vp_t_tcb_24Smplr_w [[id(24)]];
    sampler vp_t_tcb_32Smplr_w [[id(25)]];
    sampler vp_t_tcb_30Smplr_w [[id(26)]];
    sampler vp_t_tcb_1CSmplr_w [[id(27)]];
    sampler vp_t_tcb_14Smplr_w [[id(28)]];
    constant dm_border_t* dm_border [[id(29)]];
};

struct main0_out
{
    float4 m_89 [[user(locn0)]];
    float4 m_85 [[user(locn1)]];
    float4 m_65 [[user(locn2)]];
    float4 m_87 [[user(locn3)]];
    float4 m_93 [[user(locn4)]];
    float4 m_67 [[user(locn5)]];
    float4 m_71 [[user(locn6)]];
    float4 m_91 [[user(locn7)]];
    float4 m_103 [[user(locn8)]];
    float4 m_95 [[user(locn9)]];
    float4 m_101 [[user(locn10)]];
    float4 m_97 [[user(locn11)]];
    float4 m_99 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_75 [[attribute(1)]];
    float4 m_60 [[attribute(2)]];
    float4 m_62 [[attribute(3)]];
    float4 m_83 [[attribute(4)]];
    float4 m_77 [[attribute(5)]];
    float4 m_69 [[attribute(6)]];
    float4 m_73 [[attribute(7)]];
    float4 m_81 [[attribute(8)]];
    float4 m_79 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2674 = false;
    bool _536 = false;
    bool _322 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _117 = in.m_60.w;
    float _119 = in.m_62.w;
    float _121 = trunc(_117);
    int _124 = int(_121);
    float _126 = -_119;
    float _128 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_65.y = _128;
    bool _132 = _124 >= 1;
    float _134 = 0.0;
    float _136 = as_type<float>(_124);
    float _138 = _128;
    if (!_132)
    {
        _134 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _134;
    if (!_132)
    {
        out.m_67.x = 0.0;
    }
    int _142 = 0;
    if (!_132)
    {
        float _144 = _140 * 5.0;
        _142 = as_type<int>(_144);
    }
    int _146 = _142;
    int _148 = _146;
    if (!_132)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2971 = as_type<float>(_146);
        out.gl_Position.z = _2971;
    }
    if (!_132)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _150 = _119 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _152 = isnan(_119);
    bool _154 = _150 || _152;
    bool _156 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _158 = _154 || _156;
    float _160 = in.m_69.x;
    float _162 = float(_124);
    float _164 = in.m_69.y;
    bool _166 = _128 >= _162;
    bool _168 = !_158;
    bool _170 = _166 || _168;
    if (_170)
    {
        _136 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _172 = _136;
    if (_170)
    {
        out.m_67.x = 0.0;
    }
    if (_170)
    {
        float _174 = _172 * 5.0;
        _148 = as_type<int>(_174);
    }
    int _176 = _148;
    out.m_71.x = _160;
    out.m_71.y = _164;
    if (_170)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3034 = as_type<float>(_176);
        out.gl_Position.z = _3034;
    }
    if (_170)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _178 = in.m_73.w;
    float _180 = 1.0 / _162;
    float _182 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _184 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _186 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _188 = _184 || _186;
    bool _190 = isnan(1.0);
    bool _192 = _188 || _190;
    float _194 = in.m_62.x;
    float _196 = in.m_62.y;
    float _198 = in.m_62.z;
    float _200 = in.m_60.x;
    float _202 = in.m_60.y;
    float _204 = in.m_60.z;
    float _206 = 0.0;
    float _208 = _182;
    if (!_192)
    {
        float _210 = _182 * _182;
        float _212 = _210 * 0.5;
        _206 = _212;
    }
    float _214 = _206;
    float _216 = _214;
    if (!_192)
    {
        float _218 = _214 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _216 = _218;
    }
    float _220 = _216;
    bool _222 = !_192;
    float _224 = _220;
    if (!_222)
    {
        float _226 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _228 = log2(_226);
        float _230 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _232 = _230 + 1.0;
        float _234 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _236 = _182 * _228;
        float _238 = 1.0 / _232;
        float _240 = _234 * 0.693147182464599609375;
        float _242 = exp2(_236);
        float _244 = 1.0 / _240;
        float _246 = _242 + (-1.0);
        float _248 = -_246;
        float _250 = fma(_248, _244, _182);
        float _252 = _250 * _238;
        float _254 = _252 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _224 = _254;
    }
    float _256 = _224;
    bool _258 = !_192;
    if (!_258)
    {
        float _260 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _262 = log2(_260);
        float _264 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _266 = _264 + 1.0;
        float _268 = 1.0 / _266;
        float _270 = _182 * _262;
        float _272 = exp2(_270);
        float _274 = -_272;
        float _276 = _274 + 1.0;
        float _278 = _276 * _268;
        _208 = _278;
    }
    float _280 = _208;
    bool _282 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _284 = _256 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _286 = _256 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _288 = _256 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _290 = _128 * _180;
    float _292 = fma(_280, _194, _284);
    float _294 = fma(_280, _196, _286);
    float _296 = fma(_280, _198, _288);
    float _298 = fma(_292, _178, _200);
    float _300 = fma(_294, _178, _202);
    float _302 = fma(_296, _178, _204);
    bool _304 = !_282;
    float _320;
    if (!_304)
    {
        float _306 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _308 = _160 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _310 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[12].x, _128);
        float _312 = _310 * _306;
        float _314 = floor(_312);
        float _316 = -_314;
        float _318 = _312 + _316;
        _320 = _318;
        _322 = true;
    }
    else
    {
        _320 = _290;
    }
    _322 = false;
    float _324 = _320;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _328 = _324 + _326;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _332 = _324 + _330;
    bool _334 = _324 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _336 = isnan(_324);
    bool _338 = _334 || _336;
    bool _340 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _342 = _338 || _340;
    float _344 = float(_342);
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _348 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _346;
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _352 = _324 + _350;
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _356 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _354;
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _360 = _358 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _362 = 1.0 / _348;
    bool _364 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _366 = 1.0 / _360;
    float _368 = 1.0 / _356;
    float _370 = _328 * _362;
    bool _372 = _324 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _374 = isnan(_324);
    bool _376 = _372 || _374;
    bool _378 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _380 = _376 || _378;
    float _382 = float(_380);
    float _384 = -_344;
    float _386 = _384 + 1.0;
    float _388 = _382 * _386;
    float _390 = _332 * _366;
    bool _392 = _324 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _394 = isnan(_324);
    bool _396 = _392 || _394;
    bool _398 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _400 = _396 || _398;
    float _402 = float(_400);
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _406 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _404;
    bool _408 = _324 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _410 = isnan(_324);
    bool _412 = _408 || _410;
    bool _414 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _416 = _412 || _414;
    float _418 = float(_416);
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _422 = _420 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _424 = -_382;
    float _426 = _424 + 1.0;
    float _428 = -_402;
    float _430 = _428 + 1.0;
    float _432 = _352 * _368;
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _436 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _434;
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _440 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _438;
    float _442 = _418 * _430;
    float _444 = fma(_406, _432, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _446 = fma(_436, _432, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _448 = fma(_440, _432, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _450 = _402 * _426;
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _454 = _452 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _456 = _446 * _442;
    float _458 = _448 * _442;
    float _460 = _444 * _442;
    float _462 = -_418;
    float _464 = _462 + 1.0;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _468 = _466 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _470 = fma(_464, (*spvDescriptorSet0.vp_c9)._m0[143].x, _458);
    float _472 = fma(_464, (*spvDescriptorSet0.vp_c9)._m0[143].y, _456);
    float _474 = fma(_464, (*spvDescriptorSet0.vp_c9)._m0[143].z, _460);
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _478 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _476;
    float _480 = fma(_422, _390, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _482 = fma(_468, _390, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _484 = fma(_454, _390, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _488 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _486;
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _492 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _490;
    float _494 = fma(_480, _450, _470);
    float _496 = fma(_478, _370, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _498 = fma(_488, _370, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _500 = fma(_492, _370, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _502 = fma(_482, _450, _472);
    float _504 = fma(_484, _450, _474);
    float _506 = fma(_496, _388, _494);
    float _508 = fma(_498, _388, _502);
    float _510 = fma(_500, _388, _504);
    float _512 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[146].x, _506);
    float _514 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[146].y, _508);
    float _516 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[146].z, _510);
    bool _518 = !_364;
    float _534;
    if (!_518)
    {
        float _520 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _522 = _160 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _524 = fma(_522, (*spvDescriptorSet0.vp_c9)._m0[11].y, _128);
        float _526 = _524 * _520;
        float _528 = floor(_526);
        float _530 = -_528;
        float _532 = _526 + _530;
        _534 = _532;
        _536 = true;
    }
    else
    {
        _534 = _290;
    }
    _536 = false;
    float _538 = _534;
    float _540 = in.m_69.z;
    float _542 = _300 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _544 = _300 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _546 = _160 * 2.0;
    float _548 = _300 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _550 = fma(_298, (*spvDescriptorSet0.vp_c10)._m0[5].x, _542);
    float _552 = fma(_298, (*spvDescriptorSet0.vp_c10)._m0[4].x, _544);
    float _554 = fma(_298, (*spvDescriptorSet0.vp_c10)._m0[6].x, _548);
    float _556 = fma(_302, (*spvDescriptorSet0.vp_c10)._m0[5].z, _550);
    float _558 = floor(_546);
    float _560 = fma(_302, (*spvDescriptorSet0.vp_c10)._m0[4].z, _552);
    float _562 = _556 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _564 = _160 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _566 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _568 = _164 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _570 = _164 * 2.0;
    float _572 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _574 = fma(_302, (*spvDescriptorSet0.vp_c10)._m0[6].z, _554);
    float _576 = _560 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _578 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _580 = _562 + _578;
    int _582 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _584 = _582 != 0;
    int _586 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _588 = _586 != 0;
    int _590 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _592 = _590 != 0;
    float _594 = -_566;
    float _596 = fma(_564, 2.0, _594);
    float _598 = _164 + _540;
    float _600 = _160 + _540;
    float _602 = fma(_568, -2.0, _572);
    float _604 = _574 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _606 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _608 = _576 + _606;
    float _610 = _580 * _580;
    float _612 = _540 * 2.0;
    float _614 = floor(_570);
    float _616 = _598 + (-1.0);
    float _618 = _600 + (-1.0);
    float _620 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _622 = _604 + _620;
    float _624 = fma(_608, _608, _610);
    bool _626 = _558 > 0.0;
    float _628 = fma(_616, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _630 = fma(_618, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _632 = floor(_612);
    float _634 = fma(_622, _622, _624);
    bool _636 = !_588;
    int _638 = _636 ? 0 : 1;
    float _640 = -_128;
    float _642 = fma(_640, (*spvDescriptorSet0.vp_c9)._m0[76].x, _596);
    bool _644 = _558 >= 0.0;
    bool _646 = isnan(_558);
    bool _648 = _644 || _646;
    bool _650 = isnan(0.0);
    bool _652 = _648 || _650;
    float _654 = in.m_75.x;
    float _656 = in.m_75.y;
    float _658 = in.m_75.z;
    int _660 = abs(_638);
    float _662 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _664 = log2(_662);
    int _666 = _652 ? 0 : 1;
    bool _668 = _614 >= 0.0;
    bool _670 = isnan(_614);
    bool _672 = _668 || _670;
    bool _674 = isnan(0.0);
    bool _676 = _672 || _674;
    int _678 = ~_666;
    int _680 = _678 + 1;
    int _682 = _680 + 1;
    int _684 = _682;
    if (!_626)
    {
        int _686 = ~_666;
        int _688 = _686 + 1;
        _684 = _688;
    }
    int _690 = _684;
    float _692 = rsqrt(_634);
    bool _694 = _614 > 0.0;
    int _696 = _676 ? 0 : 1;
    float _698 = float(_660);
    float _700 = float(_690);
    bool _702 = _632 > 0.0;
    bool _704 = _632 >= 0.0;
    bool _706 = isnan(_632);
    bool _708 = _704 || _706;
    bool _710 = isnan(0.0);
    bool _712 = _708 || _710;
    float _714 = _698 * _700;
    float _716 = _664 * _128;
    float _718 = _580 * _692;
    float _720 = _608 * _692;
    float _722 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _724 = _622 * _692;
    float _726 = exp2(_716);
    float _728 = -_720;
    float _730 = fma(_728, (*spvDescriptorSet0.vp_c9)._m0[18].w, _576);
    float _732 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[78].z, _722);
    float _734 = -_718;
    float _736 = fma(_734, (*spvDescriptorSet0.vp_c9)._m0[18].w, _562);
    int _738 = ~_696;
    int _740 = _738 + 1;
    int _742 = _740 + 1;
    float _744 = -_724;
    float _746 = fma(_744, (*spvDescriptorSet0.vp_c9)._m0[18].w, _604);
    float _748 = _736 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    int _750 = _742;
    uint _753 = as_type<uint>(_724);
    if (!_694)
    {
        int _755 = ~_696;
        int _757 = _755 + 1;
        _750 = _757;
    }
    int _759 = _750;
    float _761 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _763 = 1.0 + _761;
    bool _765 = !_592;
    int _767 = _765 ? 0 : 1;
    float _769 = fma(_730, (*spvDescriptorSet0.vp_c8)._m0[11].x, _748);
    float _771 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _773 = 1.0 / _763;
    bool _775 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _777 = isnan(1.0);
    bool _779 = _775 || _777;
    bool _781 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _783 = _779 || _781;
    float _785 = fma(_746, (*spvDescriptorSet0.vp_c8)._m0[11].z, _769);
    float _787 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[78].w, _771);
    int _789 = abs(_767);
    float _791 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[76].y, _602);
    float _793 = _736 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _795 = _785 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _797 = -_726;
    float _799 = _797 + 1.0;
    bool _801 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _803 = isnan(0.0);
    bool _805 = _801 || _803;
    bool _807 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _809 = _805 || _807;
    float _811 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].w, _787);
    float _813 = fma(_730, (*spvDescriptorSet0.vp_c8)._m0[10].x, _793);
    float _815 = 1.0 / _795;
    float _817 = _809 ? _799 : 0.0;
    float _819 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].z, _732);
    float _821 = fma(_746, (*spvDescriptorSet0.vp_c8)._m0[10].z, _813);
    float _823 = _714 * (-2.0);
    float _825 = float(_789);
    if (_783)
    {
        float _827 = _817 * _773;
        _138 = _827;
    }
    float _829 = _138;
    float _831 = _821 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _833 = float(_759);
    float _835 = fma(_628, _823, _628);
    float _837 = fma(_823, _656, _656);
    float _839 = _831 + _795;
    float _841 = _164 + (-0.5);
    float _843 = _825 * _833;
    int _845 = _712 ? 0 : 1;
    float _847 = _839 * _815;
    float _849 = _847 * 0.5;
    bool _851 = !_584;
    int _853 = _851 ? 0 : 1;
    float _855 = fma(_841, (*spvDescriptorSet0.vp_c9)._m0[196].y, _837);
    float _857 = _843 * (-2.0);
    float _859 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _861 = fma(_849, (*spvDescriptorSet0.vp_c8)._m0[30].w, _859);
    int _863 = ~_845;
    int _865 = _863 + 1;
    int _867 = _865 + 1;
    float _869 = fma(_835, _829, _855);
    int _871 = _867;
    if (!_702)
    {
        int _873 = ~_845;
        int _875 = _873 + 1;
        _871 = _875;
    }
    int _877 = _871;
    float _879 = 1.0 / _861;
    int _881 = abs(_853);
    float _883 = _160 + _164;
    float _885 = _540 + (-0.5);
    float _887 = fma(_857, _658, _658);
    float _889 = -_718;
    float _891 = fma(_889, (*spvDescriptorSet0.vp_c9)._m0[18].w, _580);
    float _893 = float(_881);
    float _895 = _883 + (-1.0);
    float _897 = float(_877);
    float _899 = fma(_630, _857, _630);
    float _901 = fma(_885, (*spvDescriptorSet0.vp_c9)._m0[196].z, _887);
    float _903 = -_720;
    float _905 = fma(_903, (*spvDescriptorSet0.vp_c9)._m0[18].w, _608);
    float _907 = _891 * _891;
    float _909 = _893 * _897;
    float _911 = fma(_895, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _913 = fma(_899, _829, _901);
    float _915 = fma(_905, _905, _907);
    float _917 = _869 * 0.15915493667125701904296875;
    float _919 = in.m_73.x;
    float _921 = in.m_73.y;
    float _923 = in.m_73.z;
    float _925 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _927 = _879 * _925;
    float _929 = _909 * (-2.0);
    float _931 = _160 + (-0.5);
    float _933 = in.m_77.x;
    float _935 = in.m_77.y;
    float _937 = in.m_77.z;
    float _939 = _913 * 0.15915493667125701904296875;
    bool _941 = _927 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _943 = fma(_929, _654, _654);
    float _945 = in.m_79.x;
    float _947 = in.m_79.y;
    float _949 = in.m_79.z;
    bool _951 = _927 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _953 = fma(_911, _929, _911);
    float _955 = fma(_931, (*spvDescriptorSet0.vp_c9)._m0[196].x, _943);
    float _957 = -_724;
    float _959 = fma(_957, (*spvDescriptorSet0.vp_c9)._m0[18].w, _622);
    float _961 = _917 * 6.283185482025146484375;
    float _963 = sin(_961);
    float _965 = fma(_953, _829, _955);
    bool _967 = !_941;
    int _969 = _967 ? 0 : 1;
    float _971 = fma(_959, _959, _915);
    float _973 = _965 * 0.15915493667125701904296875;
    int _975 = 2;
    if (!_941)
    {
        _975 = 1;
    }
    int _977 = _975;
    int _979 = _977;
    if (!_951)
    {
        _979 = _969;
    }
    int _981 = _979;
    float _983 = _917 * 6.283185482025146484375;
    float _985 = cos(_983);
    float _987 = _514 * _921;
    float _989 = _516 * _923;
    int _991 = _981 << 6;
    float _993 = _290 * _290;
    float _995 = _512 * _919;
    float _997 = _939 * 6.283185482025146484375;
    float _999 = cos(_997);
    float _1001 = -_935;
    float _1003 = _1001 + _947;
    float _1005 = -_937;
    float _1007 = _1005 + _949;
    float _1009 = -_933;
    float _1011 = _1009 + _945;
    int _1013 = _991 + 96;
    uint _1015 = uint(int(uint(_1013) >> uint(2)));
    uint _1017 = uint(int(uint(int(_1015)) >> uint(2)));
    int _1019 = int(_1015) & 3;
    float _1021 = (*spvDescriptorSet0.vp_c15)._m0[int(_1017)][_1019];
    int _1023 = int(_1015) + 1;
    uint _1025 = uint(int(uint(_1023) >> uint(2)));
    int _1027 = _1023 & 3;
    float _1029 = (*spvDescriptorSet0.vp_c15)._m0[int(_1025)][_1027];
    float _1031 = fma(_993, _1003, _935);
    float _1033 = _987 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1035 = fma(_993, _1011, _933);
    float _1037 = _973 * 6.283185482025146484375;
    float _1039 = sin(_1037);
    float _1041 = _995 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1043 = fma(_993, _1007, _937);
    float _1045 = _989 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    int _1047 = _991 + 104;
    uint _1049 = uint(int(uint(_1047) >> uint(2)));
    uint _1051 = uint(int(uint(int(_1049)) >> uint(2)));
    int _1053 = int(_1049) & 3;
    float _1055 = (*spvDescriptorSet0.vp_c15)._m0[int(_1051)][_1053];
    int _1057 = int(_1049) + 1;
    uint _1059 = uint(int(uint(_1057) >> uint(2)));
    int _1061 = _1057 & 3;
    float _1063 = (*spvDescriptorSet0.vp_c15)._m0[int(_1059)][_1061];
    float _1065 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1035);
    float _1067 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1043);
    float _1069 = _973 * 6.283185482025146484375;
    float _1071 = cos(_1069);
    float _1073 = _985 * _999;
    float _1075 = _963 * _999;
    float _1077 = sqrt(_971);
    float _1079 = _1039 * _963;
    float _1081 = _1039 * _985;
    float _1083 = _1039 * _999;
    int _1085 = _991 + 48;
    uint _1087 = uint(int(uint(_1085) >> uint(2)));
    uint _1089 = uint(int(uint(int(_1087)) >> uint(2)));
    int _1091 = int(_1087) & 3;
    float _1093 = (*spvDescriptorSet0.vp_c15)._m0[int(_1089)][_1091];
    int _1095 = int(_1087) + 1;
    uint _1097 = uint(int(uint(_1095) >> uint(2)));
    int _1099 = _1095 & 3;
    float _1101 = (*spvDescriptorSet0.vp_c15)._m0[int(_1097)][_1099];
    float _1103 = _939 * 6.283185482025146484375;
    float _1105 = sin(_1103);
    float _1107 = _1071 * _963;
    float _1109 = _1071 * _985;
    float _1111 = _1071 * _999;
    int _1113 = _991 + 56;
    uint _1115 = uint(int(uint(_1113) >> uint(2)));
    uint _1117 = uint(int(uint(int(_1115)) >> uint(2)));
    int _1119 = int(_1115) & 3;
    float _1121 = (*spvDescriptorSet0.vp_c15)._m0[int(_1117)][_1119];
    int _1123 = int(_1115) + 1;
    uint _1125 = uint(int(uint(_1123) >> uint(2)));
    int _1127 = _1123 & 3;
    float _1129 = (*spvDescriptorSet0.vp_c15)._m0[int(_1125)][_1127];
    float _1131 = _692 * _1077;
    float _1133 = _1033 * _1131;
    float _1135 = _1041 * _1131;
    float _1137 = _1045 * _1131;
    float _1139 = -_1107;
    float _1141 = fma(_1105, _1081, _1139);
    float _1143 = -_1081;
    float _1145 = fma(_1105, _1107, _1143);
    float _1147 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1031);
    int _1149 = _991 + 64;
    uint _1151 = uint(int(uint(_1149) >> uint(2)));
    uint _1153 = uint(int(uint(int(_1151)) >> uint(2)));
    int _1155 = int(_1151) & 3;
    float _1157 = (*spvDescriptorSet0.vp_c15)._m0[int(_1153)][_1155];
    int _1159 = int(_1151) + 1;
    uint _1161 = uint(int(uint(_1159) >> uint(2)));
    int _1163 = _1159 & 3;
    float _1165 = (*spvDescriptorSet0.vp_c15)._m0[int(_1161)][_1163];
    float _1167 = _1137 * _1067;
    float _1169 = _1135 * _1065;
    float _1171 = _1133 * _1147;
    float _1173 = fma(_1105, _1109, _1079);
    float _1175 = fma(_1105, _1079, _1109);
    float _1177 = _1111 * _1171;
    float _1179 = -_1171;
    float _1181 = _1105 * _1179;
    int _1183 = _991 + 72;
    uint _1185 = uint(int(uint(_1183) >> uint(2)));
    uint _1187 = uint(int(uint(int(_1185)) >> uint(2)));
    int _1189 = int(_1185) & 3;
    float _1191 = (*spvDescriptorSet0.vp_c15)._m0[int(_1187)][_1189];
    int _1193 = int(_1185) + 1;
    uint _1195 = uint(int(uint(_1193) >> uint(2)));
    int _1197 = _1193 & 3;
    float _1199 = (*spvDescriptorSet0.vp_c15)._m0[int(_1195)][_1197];
    float _1201 = _1083 * _1171;
    float _1203 = fma(_1173, _1169, _1177);
    float _1205 = fma(_1073, _1169, _1181);
    float _1207 = fma(_1141, _1169, _1201);
    float _1209 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _1211 = fma(_1145, _1167, _1203);
    int _1213 = _991 + 80;
    uint _1215 = uint(int(uint(_1213) >> uint(2)));
    uint _1217 = uint(int(uint(int(_1215)) >> uint(2)));
    int _1219 = int(_1215) & 3;
    float _1221 = (*spvDescriptorSet0.vp_c15)._m0[int(_1217)][_1219];
    int _1223 = int(_1215) + 1;
    uint _1225 = uint(int(uint(_1223) >> uint(2)));
    int _1227 = _1223 & 3;
    float _1229 = (*spvDescriptorSet0.vp_c15)._m0[int(_1225)][_1227];
    float _1231 = fma(_1075, _1167, _1205);
    float _1233 = _736 + _1209;
    float _1235 = _1211 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1237 = _1211 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1239 = fma(_1175, _1167, _1207);
    float _1241 = _1233 * _1029;
    float _1243 = fma(_1231, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1235);
    float _1245 = fma(_1231, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1237);
    float _1247 = _1211 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    int _1249 = _991 + 88;
    uint _1251 = uint(int(uint(_1249) >> uint(2)));
    uint _1253 = uint(int(uint(int(_1251)) >> uint(2)));
    int _1255 = int(_1251) & 3;
    float _1257 = (*spvDescriptorSet0.vp_c15)._m0[int(_1253)][_1255];
    int _1259 = int(_1251) + 1;
    uint _1261 = uint(int(uint(_1259) >> uint(2)));
    int _1263 = _1259 & 3;
    float _1265 = (*spvDescriptorSet0.vp_c15)._m0[int(_1261)][_1263];
    float _1267 = fma(_1239, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1243);
    float _1269 = fma(_730, _1021, _1241);
    float _1271 = fma(_1239, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1245);
    float _1273 = _604 + _1267;
    float _1275 = fma(_746, _1055, _1269);
    float _1277 = _576 + _1271;
    float _1279 = fma(_1231, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1247);
    float _1281 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1283 = _1273 + _1281;
    float _1285 = _1275 + _1063;
    float _1287 = _1233 * _1101;
    float _1289 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1291 = _1277 + _1289;
    float _1293 = _1283 * _1283;
    float _1295 = fma(_1239, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1279);
    float _1297 = fma(_730, _1093, _1287);
    float _1299 = 1.0 / _1285;
    float _1301 = fma(_1291, _1291, _1293);
    float _1303 = fma(_746, _1121, _1297);
    float _1305 = _1233 * _1165;
    float _1307 = fma(_730, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1309 = _1303 + _1129;
    float _1311 = sqrt(_1301);
    float _1313 = fma(_730, _1157, _1305);
    float _1315 = fma(_746, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1317 = fma(_746, _1191, _1313);
    float _1319 = _1309 * _1299;
    float _1321 = floor(_1307);
    float _1323 = _1317 + _1199;
    bool _1325 = _1319 >= 0.0;
    float _1327 = _1233 * _1229;
    float _1329 = _1323 * _1299;
    bool _1331 = _1311 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1333 = floor(_1315);
    float _1335 = fma(_730, _1221, _1327);
    bool _1337 = _1319 <= 1.0;
    bool _1339 = _1337 && _1325;
    bool _1341 = _1329 >= 0.0;
    bool _1343 = _1341 && _1339;
    float _1345 = fma(_746, _1257, _1335);
    float _1347 = -_1321;
    float _1349 = _1307 + _1347;
    bool _1351 = _1329 <= 1.0;
    bool _1353 = _1351 && _1343;
    float _1355 = _1345 + _1265;
    float _1357 = _1257;
    float _1359 = _1265;
    float _1361 = as_type<float>(_981);
    float _1363 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (!_1331)
    {
        _1357 = _1277;
    }
    float _1365 = _1357;
    float _1367 = _1365;
    if (!_1331)
    {
        _1359 = _1273;
    }
    float _1369 = _1359;
    float _1371 = -_1333;
    float _1373 = _1315 + _1371;
    bool _1375 = !_1331;
    float _1377 = _1369;
    if (!_1375)
    {
        float _1379 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1381 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1383 = _1311 + _1381;
        float _1385 = _562 + _1295;
        float _1387 = _1385 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1389 = rsqrt(_1301);
        float _1391 = _1383 * _1379;
        float _1393 = _1391 * 0.15915493667125701904296875;
        float _1395 = _1393 * 6.283185482025146484375;
        float _1397 = sin(_1395);
        float _1399 = fma(_1397, _1387, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1401 = _1389 * _1399;
        float _1403 = fma(_1291, _1401, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1405 = fma(_1283, _1401, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1367 = _1403;
        _1377 = _1405;
    }
    float _1407 = _1367;
    float _1409 = _1377;
    float _1411 = _1355 * _1299;
    float _1413 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _1415 = _1407 + _1413;
    float _1417 = fma(_1409, 6.2500002968590706586837768554688e-05, 0.5);
    float _1419 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _1421 = _1409 + _1419;
    float _1423 = fma(_1407, 6.2500002968590706586837768554688e-05, 0.5);
    float _1425 = fma(_1415, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _1427 = _1411;
    if (_1353)
    {
        float _1429 = float(_981);
        _1361 = _1429;
    }
    float _1431 = _1361;
    float _1433 = fma(_1421, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _5035 = float2(_1423, _1417);
    float _1435 = dm_bs(spvDescriptorSet0.vp_t_tcb_2C.sample(spvDescriptorSet0.vp_t_tcb_2CSmplr, select(_5035, float2(0.0), isnan(_5035)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_2C, spvDescriptorSet0.vp_t_tcb_2CSmplr_w, select(_5035, float2(0.0), isnan(_5035)), level(0.0)).y;
    float _1437 = _1277;
    if (_1353)
    {
        float _1439 = rint(_1431);
        float _1441 = precise::max(_1439, 0.0);
        uint _1443 = uint(_1441);
        uint _1445 = clamp(_1443, 0u, 65535u);
        _1437 = as_type<float>(_1445);
    }
    float _1447 = _1437;
    float2 _5062 = float2(_1425, _1433);
    float _1449 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_5062, float2(0.0), isnan(_5062)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_5062, float2(0.0), isnan(_5062)), level(0.0)).x;
    float2 _5070 = float2(_1349, _1373);
    float _1451 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5070, float2(0.0), isnan(_5070)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5070, float2(0.0), isnan(_5070)), level(0.0)).x;
    float _1453 = _1447;
    if (_1353)
    {
        float3 _5084 = float3(_1319, _1329, float(as_type<int>(_1447)));
        float3 _5088 = select(_5084, float3(0.0), isnan(_5084));
        float _1455 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5088.xy, uint(rint(_5088.z)), _1411, level(0.0));
        _1453 = _1455;
    }
    float _1457 = _1453;
    float _1459 = _1233 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1461 = _1233 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1463 = -_720;
    float _1465 = fma(_1463, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1407);
    float _1467 = -_724;
    float _1469 = fma(_1467, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1409);
    float _1471 = fma(_730, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1459);
    float _1473 = fma(_730, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1461);
    float _1475 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1477 = _1469 + _1475;
    float _1479 = fma(_746, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1471);
    float _1481 = fma(_746, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1473);
    float _1483 = _1479 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1485 = _1481 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1487 = trunc(_1483);
    int _1489 = int(_1487);
    float _1491 = trunc(_1485);
    int _1493 = int(_1491);
    int _1495 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1497 = _1489 + _1495;
    int _1499 = _1497 + 1;
    bool _1501 = _1499 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1503 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1505 = _1493 + _1503;
    int _1507 = _1505 + 1;
    int _1509 = _1499 | _1507;
    bool _1511 = _1509 < 0;
    bool _1513 = _1511 || _1501;
    float _1515 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1517 = _1465 + _1515;
    bool _1519 = _1507 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1521 = _1519 || _1513;
    float _1523 = as_type<float>(_1499);
    float _1525 = as_type<float>(_1507);
    float _1527 = _1483;
    if (!_1521)
    {
        int _1529 = _1507 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1531 = _1529 + _1499;
        _753 = uint(_1531);
    }
    uint _1533 = _753;
    float _1535 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1537 = fma(_1435, 2000.0, (*spvDescriptorSet0.vp_c13)._m0[0].x);
    float _1539 = fma(_1449, 100.0, _1537);
    float _1541 = -_718;
    float _1543 = fma(_1541, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1539);
    float _1545 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1547 = _1543 + _1545;
    float _1549 = _1547 * _1547;
    float _1551 = fma(_1517, _1517, _1549);
    float _1553 = fma(_1477, _1477, _1551);
    float _1555 = rsqrt(_1553);
    float _1557 = sqrt(_1553);
    float _1559 = _1555 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1561 = _1517 * _1559;
    float _1563 = _1477 * _1559;
    float _1565 = _1561 * _1561;
    float _1567 = _1563 * _1563;
    float _1569 = _1565 + _1567;
    float _1571 = sqrt(_1569);
    bool _1573 = _1571 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1575 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1577 = _1571 + _1575;
    float _1579 = _1555;
    float _1581 = _1569;
    float _1583 = _1577;
    float _1585 = _1547;
    float _1587 = _1537;
    if (_1573)
    {
        float _1589 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1579 = _1589;
    }
    float _1591 = _1579;
    if (_1573)
    {
        float _1593 = rsqrt(_1569);
        _1581 = _1593;
    }
    float _1595 = _1581;
    int _1597 = as_type<int>(_1595);
    if (_1573)
    {
        float _1599 = _1577 * _1591;
        _1583 = _1599;
    }
    float _1601 = _1583;
    if (_1573)
    {
        float _1603 = _1601 * 0.15915493667125701904296875;
        _1523 = _1603;
    }
    float _1605 = _1523;
    float _1607 = _1477;
    if (_1573)
    {
        float _1609 = _1605 * 6.283185482025146484375;
        float _1611 = sin(_1609);
        _1607 = _1611;
    }
    float _1613 = _1607;
    float _1615 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1617 = precise::max(0.0, _1615);
    float _1619 = _1591;
    float _1621 = _1617;
    if (_1573)
    {
        float _1623 = _1605 * 6.283185482025146484375;
        float _1625 = cos(_1623);
        _1619 = _1625;
    }
    float _1627 = _1619;
    float _1629 = -_1559;
    float _1631 = -_1617;
    float _1633 = fma(_1547, _1629, _1631);
    float _1635 = _1633;
    if (_1573)
    {
        float _1637 = _1633 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1585 = _1637;
    }
    float _1639 = _1585;
    float _1641 = _1543 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1643 = _1613;
    float _1645 = _1639;
    if (_1573)
    {
        float _1647 = fma(_1613, _1639, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1525 = _1647;
    }
    float _1649 = _1525;
    float _1651 = _1649;
    if (!_1573)
    {
        _1643 = _1561;
    }
    float _1653 = _1643;
    float _1655 = _1653;
    if (!_1573)
    {
        _1645 = _1567;
    }
    float _1657 = _1645;
    float _1659 = _1657;
    if (_1573)
    {
        float _1661 = _1627 + (-1.0);
        _1621 = _1661;
    }
    float _1663 = _1621;
    float _1665 = _1663;
    if (_1573)
    {
        float _1667 = _1595 * _1649;
        _1651 = _1667;
    }
    float _1669 = _1651;
    int _1671 = as_type<int>(_1669);
    if (!_1521)
    {
        uint _1673 = uint(int(uint(int(_1533)) >> uint(2)));
        _1597 = int(_1673);
    }
    int _1675 = _1597;
    float _1677 = fma(_1465, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1641);
    if (_1573)
    {
        float _1679 = _1663 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1587 = _1679;
    }
    float _1681 = _1587;
    float _1683 = _1681;
    if (!_1573)
    {
        _1665 = _1563;
    }
    float _1685 = _1665;
    float _1687 = _1685;
    if (_1573)
    {
        float _1689 = _1561 * _1669;
        _1655 = _1689;
    }
    float _1691 = _1655;
    if (_1573)
    {
        float _1693 = _1563 * _1669;
        _1687 = _1693;
    }
    float _1695 = _1687;
    if (!_1521)
    {
        int _1697 = int(_1533) << 2;
        _1671 = _1697;
    }
    int _1699 = _1671;
    int _1701 = _1699;
    if (_1573)
    {
        float _1703 = fma(_1633, _1627, _1681);
        _1635 = _1703;
    }
    float _1705 = _1635;
    if (!_1573)
    {
        _1683 = _1565;
    }
    float _1707 = _1683;
    float _1709 = _1707;
    if (_1573)
    {
        float _1711 = _1691 * _1691;
        _1709 = _1711;
    }
    float _1713 = _1709;
    if (!_1521)
    {
        int _1715 = 12 & _1699;
        _1701 = _1715;
    }
    int _1717 = _1701;
    if (_1573)
    {
        float _1719 = _1695 * _1695;
        _1659 = _1719;
    }
    float _1721 = _1659;
    float _1723 = fma(_1469, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1677);
    float _1725 = fma(_1705, _1705, _1713);
    float _1727 = _1725;
    if (!_1521)
    {
        int _1729 = _1675 << 4;
        int _1731 = _1729 + _1717;
        _1363 = as_type<float>(_1731);
    }
    float _1733 = _1363;
    float _1735 = _1543 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1737 = _1543 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1739 = _1725 + _1721;
    float _1741 = _1543 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1743 = fma(_1465, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1735);
    float _1745 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1747 = fma(_1557, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1745);
    float _1749 = precise::clamp(_1747, 0.0, 1.0);
    float _1751 = _1723 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1753 = fma(_1465, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1741);
    float _1755 = fma(_1469, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1743);
    float _1757 = rsqrt(_1739);
    float _1759 = -_1749;
    float _1761 = _1759 + 1.0;
    float _1763 = fma(_1469, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1753);
    float _1765 = _1755 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1767 = fma(_1465, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1737);
    float _1769 = _1751 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1771 = _1763 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1773 = _1765 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1775 = abs(_1761);
    float _1777 = log2(_1775);
    float _1779 = fma(_1469, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1767);
    float _1781 = -_1769;
    float _1783 = fma(_1781, _1535, 1.0);
    float _1785 = fma(_1771, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1773);
    float _1787 = _1733;
    float _1789 = _1783;
    if (!_1521)
    {
        int _1791 = as_type<int>(_1733) + 400;
        uint _1793 = uint(int(uint(_1791) >> uint(2)));
        uint _1795 = uint(int(uint(int(_1793)) >> uint(2)));
        int _1797 = int(_1793) & 3;
        float _1799 = (*spvDescriptorSet0.vp_c15)._m0[int(_1795)][_1797];
        _1787 = _1799;
    }
    float _1801 = _1787;
    float _1803 = _1779 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1805 = fma(_1751, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1785);
    float _1807 = _1757 * _1691;
    if (!_1521)
    {
        float _1809 = floor(_1485);
        _1727 = _1809;
    }
    float _1811 = _1727;
    float _1813 = _1757 * _1695;
    float _1815 = fma(_1803, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1805);
    float _1817 = _1757 * _1705;
    float _1819 = _1807 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1821 = _1777 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1823 = _1627;
    if (!_1521)
    {
        float _1825 = floor(_1483);
        _1823 = _1825;
    }
    float _1827 = _1823;
    float _1829 = -_1819;
    float _1831 = fma(_1817, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1829);
    float _1833 = -_1813;
    float _1835 = fma(_1833, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1831);
    float _1837 = _1765 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1839 = exp2(_1821);
    float _1841 = fma(_1835, -0.5, 0.5);
    float _1843 = fma(_1835, 0.5, 0.5);
    float _1845 = fma(_1843, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1847 = log2(_1783);
    if (!_1521)
    {
        float _1849 = -_1827;
        float _1851 = _1483 + _1849;
        _1527 = _1851;
    }
    float _1853 = _1527;
    float _1855 = fma(_1843, _1845, -0.212114393711090087890625);
    float _1857 = fma(_1843, _1855, 1.570728778839111328125);
    float _1859 = 1.0 / _1815;
    if (!_1521)
    {
        float _1861 = -_1811;
        float _1863 = _1485 + _1861;
        _1789 = _1863;
    }
    float _1865 = _1789;
    float _1867 = _1765 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1869 = fma(_1771, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1837);
    float _1871 = _1817 + 1.0;
    float _1873 = fma(_1771, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1867);
    float _1875 = fma(_1751, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1869);
    float _1877 = sqrt(_1841);
    float _1879 = -_1817;
    float _1881 = fma(_1839, _1871, _1879);
    float _1883 = fma(_1751, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1873);
    float _1885 = fma(_1803, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1875);
    float _1887 = _1847 * 0.693147182464599609375;
    float _1889 = fma(_1881, 0.5, 0.5);
    float _1891 = fma(_1803, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1883);
    float _1893 = _1885 * _1859;
    float _1895 = _1887 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1897 = _1891 * _1859;
    float _1899 = _1883;
    float _1901 = _1885;
    if (!_1521)
    {
        float _1903 = rint(_1801);
        float _1905 = precise::max(_1903, 0.0);
        uint _1907 = uint(_1905);
        uint _1909 = clamp(_1907, 0u, 65535u);
        _1899 = as_type<float>(_1909);
    }
    float _1911 = _1899;
    float _1913 = fma(_1893, 0.5, 0.5);
    float _1915 = fma(_1897, -0.5, 0.5);
    float _1917 = _1877 * 0.636619746685028076171875;
    float _1919 = -_1857;
    float _1921 = fma(_1917, _1919, 1.0);
    float3 _5877 = float3(_1913, _1915, _1895);
    float _1923 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5877, float3(0.0), isnan(_5877)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5877, float3(0.0), isnan(_5877)), level(0.0)).x;
    float3 _5886 = float3(_1913, _1915, _1895);
    float4 _1926 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5886, float3(0.0), isnan(_5886)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5886, float3(0.0), isnan(_5886)), level(0.0)).xyzw;
    float _1928 = _1926.x;
    float _1930 = _1926.y;
    float _1932 = _1926.z;
    float _1934 = _1926.w;
    float2 _5902 = float2(_1921, _1889);
    float3 _1938 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5902, float2(0.0), isnan(_5902)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5902, float2(0.0), isnan(_5902)), level(0.0)).xyz;
    float _1940 = _1938.x;
    float _1942 = _1938.y;
    float _1944 = _1938.z;
    float _1946 = _1865;
    if (!_1521)
    {
        float3 _5923 = float3(_1853, _1865, float(as_type<int>(_1911)));
        float3 _5925 = select(_5923, float3(0.0), isnan(_5923));
        float _1948 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5925.xy, uint(rint(_5925.z)), level(0.0)), spvDescriptorSet0.dm_border, 6u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5925.xy, uint(rint(_5925.z)), level(0.0)).x;
        _1946 = _1948;
    }
    float _1950 = _1946;
    float _1952 = in.m_69.w;
    float _1954 = _1777 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1956 = in.m_81.y;
    bool _1958 = _164 > 0.5;
    float _1960 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1962 = _1960 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1964 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1966 = _1964 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1968 = 1.0 / _1962;
    float _1970 = -_1451;
    float _1972 = _1970 + 1.0;
    float _1974 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1976 = _1974 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    int _1978 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1980 = _1978 != 0;
    int _1982 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1984 = _1982 != 0;
    float _1986 = 1.0 / _1966;
    float _1988 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1990 = _1988 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    int _1992 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1994 = _1992 != 0;
    bool _1996 = _538 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1998 = isnan(_538);
    bool _2000 = _1996 || _1998;
    bool _2002 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _2004 = _2000 || _2002;
    int _2006 = _2004 ? 1065353216 : 0;
    bool _2008 = _1952 > 0.5;
    float _2010 = 1.0 / _1990;
    float _2012 = -_1956;
    float _2014 = _2012 + 1.0;
    int _2016 = _2008 ? as_type<int>(_2014) : as_type<int>(_1956);
    float _2018 = 1.0 / _1976;
    int _2020 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2022 = _2020 != 0;
    float _2024 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _2026 = _538 + _2024;
    float _2028 = _2022 ? as_type<float>(_2016) : _1956;
    float _2030 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _2032 = _2030 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _2034 = _1956;
    bool _2036 = _1958;
    bool _2038 = _2022;
    int _2040 = _2006;
    if (_1980)
    {
        float _2042 = _1958 ? _2014 : _1956;
        _2034 = _2042;
    }
    float _2044 = _2034;
    float _2046 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _2048 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _2046;
    float _2050 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _2052 = _2050 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    if (_1984)
    {
        bool _2054 = _540 > 0.5;
        _2036 = _2054;
    }
    bool _2056 = _2036;
    float _2058 = _2032 * _2010;
    if (_1994)
    {
        bool _2060 = _160 > 0.5;
        _2038 = _2060;
    }
    bool _2062 = _2038;
    float _2064 = _2052 * _1968;
    float _2066 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _2068 = _538 + _2066;
    bool _2070 = _538 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _2072 = isnan(_538);
    bool _2074 = _2070 || _2072;
    bool _2076 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _2078 = _2074 || _2076;
    float _2080 = float(_2078);
    float _2082 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _2084 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _2082;
    float _2086 = _2048 * _1986;
    float _2088 = fma(_2064, _2068, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    bool _2090 = _538 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _2092 = isnan(_538);
    bool _2094 = _2090 || _2092;
    bool _2096 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _2098 = _2094 || _2096;
    float _2100 = float(_2098);
    float _2102 = _2084 * _2018;
    float _2104 = -_2080;
    float _2106 = _2104 + 1.0;
    float _2108 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _2110 = _538 + _2108;
    bool _2112 = _538 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _2114 = isnan(_538);
    bool _2116 = _2112 || _2114;
    bool _2118 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _2120 = _2116 || _2118;
    float _2122 = float(_2120);
    float _2124 = -_2100;
    float _2126 = _2124 + 1.0;
    float _2128 = fma(_2086, _2026, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _2130 = _2100 * _2106;
    float _2132 = fma(_2102, _2110, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _2134 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _2136 = _538 + _2134;
    bool _2138 = _538 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _2140 = isnan(_538);
    bool _2142 = _2138 || _2140;
    bool _2144 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _2146 = _2142 || _2144;
    float _2148 = float(_2146);
    float _2150 = _2122 * _2126;
    float _2152 = -_2122;
    float _2154 = _2152 + 1.0;
    float _2156 = in.m_81.x;
    float _2158 = fma(_2058, _2136, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _2160 = -_2148;
    float _2162 = _2160 + 1.0;
    float _2164 = _2148 * _2154;
    bool _2166 = _1031 != 0.0;
    bool _2168 = isnan(_1031);
    bool _2170 = _2166 || _2168;
    bool _2172 = isnan(0.0);
    bool _2174 = _2170 || _2172;
    float _2176 = in.m_83.x;
    float _2178 = in.m_83.y;
    float _2180 = in.m_83.z;
    float _2182 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2184 = as_type<float>(_2006) * _2162;
    bool _2186 = _1035 == 0.0;
    bool _2188 = !_2174;
    bool _2190 = _2186 && _2188;
    float _2192 = _2128 * _2184;
    bool _2194 = _1043 == 0.0;
    bool _2196 = _2194 && _2190;
    float _2198 = -as_type<float>(_2006);
    float _2200 = _2198 + 1.0;
    float _2202 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2204 = fma(_2200, (*spvDescriptorSet0.vp_c9)._m0[115].x, _2192);
    float _2206 = fma(_2088, _2164, _2204);
    float _2208 = _2182 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2210 = _2028 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2212 = _2182;
    float _2214 = _2156;
    if (_1994)
    {
        float _2216 = -_2156;
        float _2218 = _2216 + 1.0;
        _2040 = as_type<int>(_2218);
    }
    int _2220 = _2040;
    if (!_1994)
    {
        _2212 = _2156;
    }
    float _2222 = _2212;
    float _2224 = fma(_2208, _2044, -0.5);
    int _2226 = 0;
    float _2228 = _2222;
    if (_1984)
    {
        float _2230 = -_2156;
        float _2232 = _2230 + 1.0;
        _2226 = as_type<int>(_2232);
    }
    int _2234 = _2226;
    float _2236 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2238 = _2178;
    float _2240 = _2176;
    float _2242 = _2180;
    if (!_2196)
    {
        float _2244 = fma(_1031, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2178);
        _2238 = _2244;
    }
    float _2246 = _2238;
    if (_1994)
    {
        float _2248 = _2062 ? as_type<float>(_2220) : _2156;
        _2228 = _2248;
    }
    float _2250 = _2228;
    float _2252 = _2202 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    if (!_2196)
    {
        float _2254 = fma(_1035, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2176);
        _2240 = _2254;
    }
    float _2256 = _2240;
    float _2258 = -_2246;
    float _2260 = _1105 * _2258;
    float _2262 = fma(_2252, _2250, -0.5);
    float _2264 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2266 = fma(_1073, _2256, _2260);
    float _2268 = fma(_2132, _2150, _2206);
    float _2270 = fma(_819, _2262, _642);
    float _2272 = _1111 * _2246;
    float _2274 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2276 = abs(_927);
    float _2278 = log2(_2276);
    if (_1984)
    {
        float _2280 = _2056 ? as_type<float>(_2234) : _2156;
        _2214 = _2280;
    }
    float _2282 = _2214;
    float _2284 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2286 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2288 = -_791;
    float _2290 = fma(_811, _2224, _2288);
    if (!_2196)
    {
        float _2292 = fma(_1043, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2180);
        _2242 = _2292;
    }
    float _2294 = _2242;
    float _2296 = _2282 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2298 = fma(_1173, _2256, _2272);
    float _2300 = _2274 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2302 = _2284 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2304 = _2286 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2306 = _1083 * _2246;
    float _2308 = _2290 + 0.5;
    float _2310 = _2210 * _2236;
    float _2312 = _2296 * _2264;
    float _2314 = _2270 + 0.5;
    float _2316 = fma(_1145, _2294, _2298);
    out.m_85.x = _2300;
    out.m_85.y = _2302;
    out.m_85.z = _2304;
    float _2318 = _2278 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2320 = fma(_1075, _2294, _2266);
    float _2322 = fma(_1141, _2256, _2306);
    out.m_87.x = _2314;
    out.m_87.y = _2308;
    out.m_87.z = _2312;
    out.m_87.w = _2310;
    float _2324 = fma(_2158, _2130, _2268);
    float _2326 = exp2(_2318);
    float _2328 = fma(_1175, _2294, _2322);
    float _2330 = fma(_2080, (*spvDescriptorSet0.vp_c9)._m0[119].x, _2324);
    float _2332 = in.m_79.w;
    float _2334 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2336 = _2316 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2338 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2340 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2342 = _2334 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2344 = fma(_2320, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2336);
    float _2346 = _2316 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2348 = _2338 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2350 = _2340 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2352 = fma(_2328, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2344);
    float _2354 = fma(_2320, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2346);
    float _2356 = _2330 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2358 = exp2(_1954);
    float _2360 = fma(_2328, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2354);
    float _2362 = _1765 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_89.x = _2342;
    out.m_89.y = _2348;
    out.m_89.z = _2350;
    out.m_89.w = _2356;
    bool _2364 = _927 <= 8000.0;
    bool _2366 = isnan(_927);
    bool _2368 = _2364 || _2366;
    bool _2370 = isnan(8000.0);
    bool _2372 = _2368 || _2370;
    float _2374 = float(_2372);
    float _2376 = fma(_1771, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2362);
    float _2378 = _2316 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2380 = fma(_2326, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2382 = precise::clamp(_2380, 0.0, 1.0);
    float _2384 = _2362;
    if (!_1353)
    {
        _2384 = 1.0;
    }
    float _2386 = _2384;
    float _2388 = fma(_1751, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2376);
    out.m_91.w = _2332;
    float _2390 = fma(_2320, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2378);
    float _2392 = _2386;
    if (_1353)
    {
        bool _2394 = _1457 >= _1411;
        bool _2396 = isnan(_1457);
        bool _2398 = _2394 || _2396;
        bool _2400 = isnan(_1411);
        bool _2402 = _2398 || _2400;
        float _2404 = float(_2402);
        _2392 = _2404;
    }
    float _2406 = _2392;
    float _2408 = fma(_1803, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2388);
    float _2410 = fma(_2328, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2390);
    float _2412 = fma(_2382, -2.0, 3.0);
    float _2414 = _2382 * _2382;
    float _2416 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _2418 = _2408 + _2416;
    float _2420 = _1815 * 0.5;
    float _2422 = _2414 * _2412;
    float _2424 = _1885 + _1815;
    float _2426 = _1815 + _2418;
    float _2428 = fma(_1891, -0.5, _2420);
    out.gl_Position.x = _1885;
    out.gl_Position.y = _1891;
    out.gl_Position.z = _2418;
    out.gl_Position.w = _1815;
    float _2430 = _2424 * 0.5;
    float _2432 = _2426 * 0.5;
    float _2434 = -_2422;
    float _2436 = _2434 + 1.0;
    out.m_93.x = _2430;
    out.m_93.y = _2428;
    out.m_93.z = _2432;
    out.m_93.w = _1815;
    float _2438 = fma(_2436, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2422);
    float _2440 = -_2358;
    float _2442 = _2440 + 1.0;
    float _2444 = _2374 * _2438;
    float _2446 = _2442 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2448 = _2430;
    float _2450 = _2446;
    if (_1521)
    {
        _1901 = 1.0;
    }
    float _2452 = _1901;
    float _2454 = _2444 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2456 = _1972 * _2454;
    float _2458 = precise::clamp(_2456, 0.0, 1.0);
    float _2460 = _2452;
    if (!_1521)
    {
        int _2462 = int(_1533) << 4;
        int _2464 = _2462 + 2048;
        uint _2466 = uint(int(uint(_2464) >> uint(2)));
        uint _2468 = uint(int(uint(int(_2466)) >> uint(2)));
        int _2470 = int(_2466) & 3;
        float _2472 = (*spvDescriptorSet0.vp_c15)._m0[int(_2468)][_2470];
        int _2474 = int(_2466) + 1;
        uint _2476 = uint(int(uint(_2474) >> uint(2)));
        int _2478 = _2474 & 3;
        float _2480 = (*spvDescriptorSet0.vp_c15)._m0[int(_2476)][_2478];
        int _2482 = _2464 + 8;
        uint _2484 = uint(int(uint(_2482) >> uint(2)));
        uint _2486 = uint(int(uint(int(_2484)) >> uint(2)));
        int _2488 = int(_2484) & 3;
        float _2490 = (*spvDescriptorSet0.vp_c15)._m0[int(_2486)][_2488];
        int _2492 = int(_2484) + 1;
        uint _2494 = uint(int(uint(_2492) >> uint(2)));
        int _2496 = _2492 & 3;
        float _2498 = (*spvDescriptorSet0.vp_c15)._m0[int(_2494)][_2496];
        float _2500 = _1233 * _2480;
        float _2502 = fma(_730, _2472, _2500);
        float _2504 = fma(_746, _2490, _2502);
        float _2506 = _2504 + _2498;
        float _2508 = precise::clamp(_2506, 0.0, 1.0);
        float _2510 = -_2508;
        float _2512 = _2510 + _1950;
        float _2514 = fma(_2512, 500.0, 1.5);
        float _2516 = exp2(_2514);
        float _2518 = 0.0 + _2516;
        float _2520 = precise::clamp(_2518, 0.0, 1.0);
        _2460 = _2520;
        _2448 = _2490;
    }
    float _2522 = _2460;
    float _2524 = _2448;
    float _2526 = _2446 * _1923;
    float _2528 = _2406 * _2522;
    float _2530 = -_2458;
    float _2532 = fma(_2530, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2534 = -_2446;
    float _2536 = _2534 + 1.0;
    float _2538 = _1934 * _2526;
    float _2540 = _1944 * _2526;
    float _2542 = -_2528;
    float _2544 = fma(_2542, _2532, 1.0);
    float _2546 = precise::clamp(_2544, 0.0, 1.0);
    out.m_95.x = _2352;
    out.m_95.y = _2360;
    out.m_95.z = _2410;
    float _2548 = fma(_1940, _2538, _1928);
    float _2550 = fma(_1942, _2538, _1930);
    float _2552 = _2546 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2554 = _1934 * _2536;
    float _2556 = fma(_1934, _2540, _1932);
    bool _2558 = _1557 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2560 = isnan(_1557);
    bool _2562 = _2558 || _2560;
    bool _2564 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2566 = _2562 || _2564;
    out.m_97.x = _2552;
    out.m_99.x = _2548;
    out.m_99.y = _2550;
    out.m_99.z = _2556;
    out.m_99.w = _2554;
    float _2568 = _2524;
    float _2570 = _2538;
    float _2572 = _2536;
    float _2574 = _2546;
    if (!_2566)
    {
        _1427 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2576 = _1427;
    float _2578 = _2576;
    float _2580 = _2576;
    if (!_2566)
    {
        _2568 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2582 = _2568;
    float _2584 = _2582;
    float _2586 = _2582;
    if (!_2566)
    {
        _2570 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2588 = _2570;
    float _2590 = _2588;
    float _2592 = _2588;
    if (!_2566)
    {
        _2572 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2594 = _2572;
    float _2596 = _2594;
    float _2598 = _2594;
    if (!_2566)
    {
        _2450 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2600 = _2450;
    float _2602 = _2600;
    float _2604 = _2600;
    if (!_2566)
    {
        _2574 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2606 = _2574;
    bool _2608 = !_2566;
    float _2610 = _2606;
    float _2612 = _2606;
    if (!_2608)
    {
        bool _2614 = _1557 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2616 = isnan(_1557);
        bool _2618 = _2614 || _2616;
        bool _2620 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2622 = _2618 || _2620;
        if (!_2622)
        {
            float _2624 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2626 = _1557 + _2624;
            float _2628 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2630 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2628;
            float _2632 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2634 = _2632 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2636 = 1.0 / _2630;
            float _2638 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2640 = _2638 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2642 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2644 = _2642 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2646 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2648 = _2646 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2650 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2652 = _2650 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2654 = _2626 * _2636;
            float _2656 = precise::clamp(_2654, 0.0, 1.0);
            float _2658 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2660 = _2658 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2662 = fma(_2656, _2634, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2664 = fma(_2656, _2660, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2666 = fma(_2656, _2640, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2668 = fma(_2656, _2644, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2670 = fma(_2656, _2648, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2672 = fma(_2656, _2652, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2586 = _2666;
            _2604 = _2670;
            _2580 = _2662;
            _2598 = _2668;
            _2592 = _2664;
            _2612 = _2672;
            _2674 = true;
        }
        else
        {
            bool _2676 = _1557 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2678 = isnan(_1557);
            bool _2680 = _2676 || _2678;
            bool _2682 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2684 = _2680 || _2682;
            if (!_2684)
            {
                _2578 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2686 = _2578;
            _2580 = _2686;
            if (!_2684)
            {
                _2584 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2688 = _2584;
            _2586 = _2688;
            if (!_2684)
            {
                _2590 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2690 = _2590;
            _2592 = _2690;
            if (!_2684)
            {
                _2596 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2692 = _2596;
            _2598 = _2692;
            if (!_2684)
            {
                _2602 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2694 = _2602;
            _2604 = _2694;
            if (!_2684)
            {
                _2610 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2696 = _2610;
            bool _2698 = !_2684;
            _2612 = _2696;
            if (!_2698)
            {
                bool _2700 = _1557 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2702 = isnan(_1557);
                bool _2704 = _2700 || _2702;
                bool _2706 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2708 = _2704 || _2706;
                if (!_2708)
                {
                    float _2710 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2712 = _1557 + _2710;
                    float _2714 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2716 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2714;
                    float _2718 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2720 = _2718 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2722 = 1.0 / _2716;
                    float _2724 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2726 = _2724 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2728 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2730 = _2728 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2732 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2734 = _2732 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2736 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2738 = _2736 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2740 = _2712 * _2722;
                    float _2742 = precise::clamp(_2740, 0.0, 1.0);
                    float _2744 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2746 = _2744 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2748 = fma(_2742, _2720, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2750 = fma(_2742, _2746, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2752 = fma(_2742, _2726, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2754 = fma(_2742, _2730, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2756 = fma(_2742, _2734, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2758 = fma(_2742, _2738, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2586 = _2752;
                    _2604 = _2756;
                    _2580 = _2748;
                    _2598 = _2754;
                    _2592 = _2750;
                    _2612 = _2758;
                    _2674 = true;
                }
                else
                {
                    _2586 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2604 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2580 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2598 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2592 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2612 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2674 = false;
    float _2760 = _2586;
    float _2762 = _2604;
    float _2764 = _2580;
    float _2766 = _2598;
    float _2768 = _2592;
    float _2770 = _2612;
    float _2772 = fma(_2360, -0.5, 0.5);
    float _2774 = precise::clamp(_2772, 0.0, 1.0);
    float _2776 = -_2760;
    float _2778 = _2776 + _2762;
    float _2780 = -_2764;
    float _2782 = _2780 + _2766;
    float _2784 = -_2768;
    float _2786 = _2784 + _2770;
    bool _2788 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2790 = fma(_2774, _2778, _2760);
    float _2792 = fma(_2774, _2782, _2764);
    float _2794 = fma(_2774, _2786, _2768);
    float _2796 = _2790 * 0.586610972881317138671875;
    out.m_101.x = 0.0;
    float _2798 = fma(_2792, 0.298911988735198974609375, _2796);
    float _2800 = fma(_2794, 0.114477999508380889892578125, _2798);
    float _2802 = -_2800;
    float _2804 = _2792 + _2802;
    float _2806 = -_2800;
    float _2808 = _2790 + _2806;
    float _2810 = -_2800;
    float _2812 = _2794 + _2810;
    float _2814 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2816 = fma(_2804, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2800);
    float _2818 = fma(_2808, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2800);
    float _2820 = fma(_2812, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2800);
    out.m_67.x = _2814;
    out.m_103.x = _2816;
    out.m_103.y = _2818;
    out.m_103.z = _2820;
    if (!_2788)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2822 = -_1543;
    float _2824 = _2822 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2826 = -_1465;
    float _2828 = _2826 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2830 = -_1469;
    float _2832 = _2830 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2834 = _2824 * _2824;
    float _2836 = fma(_2828, _2828, _2834);
    float _2838 = fma(_2832, _2832, _2836);
    float _2840 = sqrt(_2838);
    float _2842 = rsqrt(_2838);
    float _2844 = -_2840;
    float _2846 = _2844 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2848 = _2846 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2850 = precise::clamp(_2848, 0.0, 1.0);
    float _2852 = _2828 * _2842;
    float _2854 = _2824 * _2842;
    float _2856 = abs(_2850);
    float _2858 = log2(_2856);
    float _2860 = _2832 * _2842;
    float _2862 = _2852 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2864 = _2360 * _2854;
    float _2866 = -_2854;
    float _2868 = -_2862;
    float _2870 = fma(_2866, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2868);
    float _2872 = fma(_2352, _2852, _2864);
    float _2874 = -_2860;
    float _2876 = fma(_2874, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2870);
    float _2878 = fma(_2410, _2860, _2872);
    float _2880 = precise::clamp(_2878, 0.0, 1.0);
    float _2882 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2884 = _2876 + _2882;
    float _2886 = _2858 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2888 = _2884 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2890 = precise::clamp(_2888, 0.0, 1.0);
    float _2892 = exp2(_2886);
    float _2894 = _2892 * _2890;
    float _2896 = _2880 * _2894;
    float _2898 = _2896 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2900 = _2896 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2902 = _2896 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_101.x = _2898;
    out.m_101.y = _2900;
    out.m_101.z = _2902;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2674 = false;
    bool _536 = false;
    bool _322 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _117 = in.m_60.w;
    float _119 = in.m_62.w;
    float _121 = trunc(_117);
    int _124 = int(_121);
    float _126 = -_119;
    float _128 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_65.y = _128;
    bool _132 = _124 >= 1;
    float _134 = 0.0;
    float _136 = as_type<float>(_124);
    float _138 = _128;
    if (!_132)
    {
        _134 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _134;
    if (!_132)
    {
        out.m_67.x = 0.0;
    }
    int _142 = 0;
    if (!_132)
    {
        float _144 = _140 * 5.0;
        _142 = as_type<int>(_144);
    }
    int _146 = _142;
    int _148 = _146;
    if (!_132)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2971 = as_type<float>(_146);
        out.gl_Position.z = _2971;
    }
    if (!_132)
    {
        return out;
    }
    bool _150 = _119 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _152 = isnan(_119);
    bool _154 = _150 || _152;
    bool _156 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _158 = _154 || _156;
    float _160 = in.m_69.x;
    float _162 = float(_124);
    float _164 = in.m_69.y;
    bool _166 = _128 >= _162;
    bool _168 = !_158;
    bool _170 = _166 || _168;
    if (_170)
    {
        _136 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _172 = _136;
    if (_170)
    {
        out.m_67.x = 0.0;
    }
    if (_170)
    {
        float _174 = _172 * 5.0;
        _148 = as_type<int>(_174);
    }
    int _176 = _148;
    out.m_71.x = _160;
    out.m_71.y = _164;
    if (_170)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3034 = as_type<float>(_176);
        out.gl_Position.z = _3034;
    }
    if (_170)
    {
        return out;
    }
    float _178 = in.m_73.w;
    float _180 = 1.0 / _162;
    float _182 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _184 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _186 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _188 = _184 || _186;
    bool _190 = isnan(1.0);
    bool _192 = _188 || _190;
    float _194 = in.m_62.x;
    float _196 = in.m_62.y;
    float _198 = in.m_62.z;
    float _200 = in.m_60.x;
    float _202 = in.m_60.y;
    float _204 = in.m_60.z;
    float _206 = 0.0;
    float _208 = _182;
    if (!_192)
    {
        float _210 = _182 * _182;
        float _212 = _210 * 0.5;
        _206 = _212;
    }
    float _214 = _206;
    float _216 = _214;
    if (!_192)
    {
        float _218 = _214 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _216 = _218;
    }
    float _220 = _216;
    bool _222 = !_192;
    float _224 = _220;
    if (!_222)
    {
        float _226 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _228 = log2(_226);
        float _230 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _232 = _230 + 1.0;
        float _234 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _236 = _182 * _228;
        float _238 = 1.0 / _232;
        float _240 = _234 * 0.693147182464599609375;
        float _242 = exp2(_236);
        float _244 = 1.0 / _240;
        float _246 = _242 + (-1.0);
        float _248 = -_246;
        float _250 = fma(_248, _244, _182);
        float _252 = _250 * _238;
        float _254 = _252 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _224 = _254;
    }
    float _256 = _224;
    bool _258 = !_192;
    if (!_258)
    {
        float _260 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _262 = log2(_260);
        float _264 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _266 = _264 + 1.0;
        float _268 = 1.0 / _266;
        float _270 = _182 * _262;
        float _272 = exp2(_270);
        float _274 = -_272;
        float _276 = _274 + 1.0;
        float _278 = _276 * _268;
        _208 = _278;
    }
    float _280 = _208;
    bool _282 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _284 = _256 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _286 = _256 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _288 = _256 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _290 = _128 * _180;
    float _292 = fma(_280, _194, _284);
    float _294 = fma(_280, _196, _286);
    float _296 = fma(_280, _198, _288);
    float _298 = fma(_292, _178, _200);
    float _300 = fma(_294, _178, _202);
    float _302 = fma(_296, _178, _204);
    bool _304 = !_282;
    float _320;
    if (!_304)
    {
        float _306 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _308 = _160 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _310 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[12].x, _128);
        float _312 = _310 * _306;
        float _314 = floor(_312);
        float _316 = -_314;
        float _318 = _312 + _316;
        _320 = _318;
        _322 = true;
    }
    else
    {
        _320 = _290;
    }
    _322 = false;
    float _324 = _320;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _328 = _324 + _326;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _332 = _324 + _330;
    bool _334 = _324 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _336 = isnan(_324);
    bool _338 = _334 || _336;
    bool _340 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _342 = _338 || _340;
    float _344 = float(_342);
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _348 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _346;
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _352 = _324 + _350;
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _356 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _354;
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _360 = _358 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _362 = 1.0 / _348;
    bool _364 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _366 = 1.0 / _360;
    float _368 = 1.0 / _356;
    float _370 = _328 * _362;
    bool _372 = _324 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _374 = isnan(_324);
    bool _376 = _372 || _374;
    bool _378 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _380 = _376 || _378;
    float _382 = float(_380);
    float _384 = -_344;
    float _386 = _384 + 1.0;
    float _388 = _382 * _386;
    float _390 = _332 * _366;
    bool _392 = _324 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _394 = isnan(_324);
    bool _396 = _392 || _394;
    bool _398 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _400 = _396 || _398;
    float _402 = float(_400);
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _406 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _404;
    bool _408 = _324 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _410 = isnan(_324);
    bool _412 = _408 || _410;
    bool _414 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _416 = _412 || _414;
    float _418 = float(_416);
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _422 = _420 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _424 = -_382;
    float _426 = _424 + 1.0;
    float _428 = -_402;
    float _430 = _428 + 1.0;
    float _432 = _352 * _368;
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _436 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _434;
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _440 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _438;
    float _442 = _418 * _430;
    float _444 = fma(_406, _432, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _446 = fma(_436, _432, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _448 = fma(_440, _432, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _450 = _402 * _426;
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _454 = _452 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _456 = _446 * _442;
    float _458 = _448 * _442;
    float _460 = _444 * _442;
    float _462 = -_418;
    float _464 = _462 + 1.0;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _468 = _466 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _470 = fma(_464, (*spvDescriptorSet0.vp_c9)._m0[143].x, _458);
    float _472 = fma(_464, (*spvDescriptorSet0.vp_c9)._m0[143].y, _456);
    float _474 = fma(_464, (*spvDescriptorSet0.vp_c9)._m0[143].z, _460);
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _478 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _476;
    float _480 = fma(_422, _390, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _482 = fma(_468, _390, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _484 = fma(_454, _390, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _488 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _486;
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _492 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _490;
    float _494 = fma(_480, _450, _470);
    float _496 = fma(_478, _370, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _498 = fma(_488, _370, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _500 = fma(_492, _370, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _502 = fma(_482, _450, _472);
    float _504 = fma(_484, _450, _474);
    float _506 = fma(_496, _388, _494);
    float _508 = fma(_498, _388, _502);
    float _510 = fma(_500, _388, _504);
    float _512 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[146].x, _506);
    float _514 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[146].y, _508);
    float _516 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[146].z, _510);
    bool _518 = !_364;
    float _534;
    if (!_518)
    {
        float _520 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _522 = _160 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _524 = fma(_522, (*spvDescriptorSet0.vp_c9)._m0[11].y, _128);
        float _526 = _524 * _520;
        float _528 = floor(_526);
        float _530 = -_528;
        float _532 = _526 + _530;
        _534 = _532;
        _536 = true;
    }
    else
    {
        _534 = _290;
    }
    _536 = false;
    float _538 = _534;
    float _540 = in.m_69.z;
    float _542 = _300 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _544 = _300 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _546 = _160 * 2.0;
    float _548 = _300 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _550 = fma(_298, (*spvDescriptorSet0.vp_c10)._m0[5].x, _542);
    float _552 = fma(_298, (*spvDescriptorSet0.vp_c10)._m0[4].x, _544);
    float _554 = fma(_298, (*spvDescriptorSet0.vp_c10)._m0[6].x, _548);
    float _556 = fma(_302, (*spvDescriptorSet0.vp_c10)._m0[5].z, _550);
    float _558 = floor(_546);
    float _560 = fma(_302, (*spvDescriptorSet0.vp_c10)._m0[4].z, _552);
    float _562 = _556 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _564 = _160 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _566 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _568 = _164 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _570 = _164 * 2.0;
    float _572 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _574 = fma(_302, (*spvDescriptorSet0.vp_c10)._m0[6].z, _554);
    float _576 = _560 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _578 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _580 = _562 + _578;
    int _582 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _584 = _582 != 0;
    int _586 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _588 = _586 != 0;
    int _590 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _592 = _590 != 0;
    float _594 = -_566;
    float _596 = fma(_564, 2.0, _594);
    float _598 = _164 + _540;
    float _600 = _160 + _540;
    float _602 = fma(_568, -2.0, _572);
    float _604 = _574 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _606 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _608 = _576 + _606;
    float _610 = _580 * _580;
    float _612 = _540 * 2.0;
    float _614 = floor(_570);
    float _616 = _598 + (-1.0);
    float _618 = _600 + (-1.0);
    float _620 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _622 = _604 + _620;
    float _624 = fma(_608, _608, _610);
    bool _626 = _558 > 0.0;
    float _628 = fma(_616, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _630 = fma(_618, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _632 = floor(_612);
    float _634 = fma(_622, _622, _624);
    bool _636 = !_588;
    int _638 = _636 ? 0 : 1;
    float _640 = -_128;
    float _642 = fma(_640, (*spvDescriptorSet0.vp_c9)._m0[76].x, _596);
    bool _644 = _558 >= 0.0;
    bool _646 = isnan(_558);
    bool _648 = _644 || _646;
    bool _650 = isnan(0.0);
    bool _652 = _648 || _650;
    float _654 = in.m_75.x;
    float _656 = in.m_75.y;
    float _658 = in.m_75.z;
    int _660 = abs(_638);
    float _662 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _664 = log2(_662);
    int _666 = _652 ? 0 : 1;
    bool _668 = _614 >= 0.0;
    bool _670 = isnan(_614);
    bool _672 = _668 || _670;
    bool _674 = isnan(0.0);
    bool _676 = _672 || _674;
    int _678 = ~_666;
    int _680 = _678 + 1;
    int _682 = _680 + 1;
    int _684 = _682;
    if (!_626)
    {
        int _686 = ~_666;
        int _688 = _686 + 1;
        _684 = _688;
    }
    int _690 = _684;
    float _692 = rsqrt(_634);
    bool _694 = _614 > 0.0;
    int _696 = _676 ? 0 : 1;
    float _698 = float(_660);
    float _700 = float(_690);
    bool _702 = _632 > 0.0;
    bool _704 = _632 >= 0.0;
    bool _706 = isnan(_632);
    bool _708 = _704 || _706;
    bool _710 = isnan(0.0);
    bool _712 = _708 || _710;
    float _714 = _698 * _700;
    float _716 = _664 * _128;
    float _718 = _580 * _692;
    float _720 = _608 * _692;
    float _722 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _724 = _622 * _692;
    float _726 = exp2(_716);
    float _728 = -_720;
    float _730 = fma(_728, (*spvDescriptorSet0.vp_c9)._m0[18].w, _576);
    float _732 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[78].z, _722);
    float _734 = -_718;
    float _736 = fma(_734, (*spvDescriptorSet0.vp_c9)._m0[18].w, _562);
    int _738 = ~_696;
    int _740 = _738 + 1;
    int _742 = _740 + 1;
    float _744 = -_724;
    float _746 = fma(_744, (*spvDescriptorSet0.vp_c9)._m0[18].w, _604);
    float _748 = _736 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    int _750 = _742;
    uint _753 = as_type<uint>(_724);
    if (!_694)
    {
        int _755 = ~_696;
        int _757 = _755 + 1;
        _750 = _757;
    }
    int _759 = _750;
    float _761 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _763 = 1.0 + _761;
    bool _765 = !_592;
    int _767 = _765 ? 0 : 1;
    float _769 = fma(_730, (*spvDescriptorSet0.vp_c8)._m0[11].x, _748);
    float _771 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _773 = 1.0 / _763;
    bool _775 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _777 = isnan(1.0);
    bool _779 = _775 || _777;
    bool _781 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _783 = _779 || _781;
    float _785 = fma(_746, (*spvDescriptorSet0.vp_c8)._m0[11].z, _769);
    float _787 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[78].w, _771);
    int _789 = abs(_767);
    float _791 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[76].y, _602);
    float _793 = _736 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _795 = _785 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _797 = -_726;
    float _799 = _797 + 1.0;
    bool _801 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _803 = isnan(0.0);
    bool _805 = _801 || _803;
    bool _807 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _809 = _805 || _807;
    float _811 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].w, _787);
    float _813 = fma(_730, (*spvDescriptorSet0.vp_c8)._m0[10].x, _793);
    float _815 = 1.0 / _795;
    float _817 = _809 ? _799 : 0.0;
    float _819 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].z, _732);
    float _821 = fma(_746, (*spvDescriptorSet0.vp_c8)._m0[10].z, _813);
    float _823 = _714 * (-2.0);
    float _825 = float(_789);
    if (_783)
    {
        float _827 = _817 * _773;
        _138 = _827;
    }
    float _829 = _138;
    float _831 = _821 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _833 = float(_759);
    float _835 = fma(_628, _823, _628);
    float _837 = fma(_823, _656, _656);
    float _839 = _831 + _795;
    float _841 = _164 + (-0.5);
    float _843 = _825 * _833;
    int _845 = _712 ? 0 : 1;
    float _847 = _839 * _815;
    float _849 = _847 * 0.5;
    bool _851 = !_584;
    int _853 = _851 ? 0 : 1;
    float _855 = fma(_841, (*spvDescriptorSet0.vp_c9)._m0[196].y, _837);
    float _857 = _843 * (-2.0);
    float _859 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _861 = fma(_849, (*spvDescriptorSet0.vp_c8)._m0[30].w, _859);
    int _863 = ~_845;
    int _865 = _863 + 1;
    int _867 = _865 + 1;
    float _869 = fma(_835, _829, _855);
    int _871 = _867;
    if (!_702)
    {
        int _873 = ~_845;
        int _875 = _873 + 1;
        _871 = _875;
    }
    int _877 = _871;
    float _879 = 1.0 / _861;
    int _881 = abs(_853);
    float _883 = _160 + _164;
    float _885 = _540 + (-0.5);
    float _887 = fma(_857, _658, _658);
    float _889 = -_718;
    float _891 = fma(_889, (*spvDescriptorSet0.vp_c9)._m0[18].w, _580);
    float _893 = float(_881);
    float _895 = _883 + (-1.0);
    float _897 = float(_877);
    float _899 = fma(_630, _857, _630);
    float _901 = fma(_885, (*spvDescriptorSet0.vp_c9)._m0[196].z, _887);
    float _903 = -_720;
    float _905 = fma(_903, (*spvDescriptorSet0.vp_c9)._m0[18].w, _608);
    float _907 = _891 * _891;
    float _909 = _893 * _897;
    float _911 = fma(_895, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _913 = fma(_899, _829, _901);
    float _915 = fma(_905, _905, _907);
    float _917 = _869 * 0.15915493667125701904296875;
    float _919 = in.m_73.x;
    float _921 = in.m_73.y;
    float _923 = in.m_73.z;
    float _925 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _927 = _879 * _925;
    float _929 = _909 * (-2.0);
    float _931 = _160 + (-0.5);
    float _933 = in.m_77.x;
    float _935 = in.m_77.y;
    float _937 = in.m_77.z;
    float _939 = _913 * 0.15915493667125701904296875;
    bool _941 = _927 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _943 = fma(_929, _654, _654);
    float _945 = in.m_79.x;
    float _947 = in.m_79.y;
    float _949 = in.m_79.z;
    bool _951 = _927 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _953 = fma(_911, _929, _911);
    float _955 = fma(_931, (*spvDescriptorSet0.vp_c9)._m0[196].x, _943);
    float _957 = -_724;
    float _959 = fma(_957, (*spvDescriptorSet0.vp_c9)._m0[18].w, _622);
    float _961 = _917 * 6.283185482025146484375;
    float _963 = sin(_961);
    float _965 = fma(_953, _829, _955);
    bool _967 = !_941;
    int _969 = _967 ? 0 : 1;
    float _971 = fma(_959, _959, _915);
    float _973 = _965 * 0.15915493667125701904296875;
    int _975 = 2;
    if (!_941)
    {
        _975 = 1;
    }
    int _977 = _975;
    int _979 = _977;
    if (!_951)
    {
        _979 = _969;
    }
    int _981 = _979;
    float _983 = _917 * 6.283185482025146484375;
    float _985 = cos(_983);
    float _987 = _514 * _921;
    float _989 = _516 * _923;
    int _991 = _981 << 6;
    float _993 = _290 * _290;
    float _995 = _512 * _919;
    float _997 = _939 * 6.283185482025146484375;
    float _999 = cos(_997);
    float _1001 = -_935;
    float _1003 = _1001 + _947;
    float _1005 = -_937;
    float _1007 = _1005 + _949;
    float _1009 = -_933;
    float _1011 = _1009 + _945;
    int _1013 = _991 + 96;
    uint _1015 = uint(int(uint(_1013) >> uint(2)));
    uint _1017 = uint(int(uint(int(_1015)) >> uint(2)));
    int _1019 = int(_1015) & 3;
    float _1021 = (*spvDescriptorSet0.vp_c15)._m0[int(_1017)][_1019];
    int _1023 = int(_1015) + 1;
    uint _1025 = uint(int(uint(_1023) >> uint(2)));
    int _1027 = _1023 & 3;
    float _1029 = (*spvDescriptorSet0.vp_c15)._m0[int(_1025)][_1027];
    float _1031 = fma(_993, _1003, _935);
    float _1033 = _987 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1035 = fma(_993, _1011, _933);
    float _1037 = _973 * 6.283185482025146484375;
    float _1039 = sin(_1037);
    float _1041 = _995 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1043 = fma(_993, _1007, _937);
    float _1045 = _989 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    int _1047 = _991 + 104;
    uint _1049 = uint(int(uint(_1047) >> uint(2)));
    uint _1051 = uint(int(uint(int(_1049)) >> uint(2)));
    int _1053 = int(_1049) & 3;
    float _1055 = (*spvDescriptorSet0.vp_c15)._m0[int(_1051)][_1053];
    int _1057 = int(_1049) + 1;
    uint _1059 = uint(int(uint(_1057) >> uint(2)));
    int _1061 = _1057 & 3;
    float _1063 = (*spvDescriptorSet0.vp_c15)._m0[int(_1059)][_1061];
    float _1065 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1035);
    float _1067 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1043);
    float _1069 = _973 * 6.283185482025146484375;
    float _1071 = cos(_1069);
    float _1073 = _985 * _999;
    float _1075 = _963 * _999;
    float _1077 = sqrt(_971);
    float _1079 = _1039 * _963;
    float _1081 = _1039 * _985;
    float _1083 = _1039 * _999;
    int _1085 = _991 + 48;
    uint _1087 = uint(int(uint(_1085) >> uint(2)));
    uint _1089 = uint(int(uint(int(_1087)) >> uint(2)));
    int _1091 = int(_1087) & 3;
    float _1093 = (*spvDescriptorSet0.vp_c15)._m0[int(_1089)][_1091];
    int _1095 = int(_1087) + 1;
    uint _1097 = uint(int(uint(_1095) >> uint(2)));
    int _1099 = _1095 & 3;
    float _1101 = (*spvDescriptorSet0.vp_c15)._m0[int(_1097)][_1099];
    float _1103 = _939 * 6.283185482025146484375;
    float _1105 = sin(_1103);
    float _1107 = _1071 * _963;
    float _1109 = _1071 * _985;
    float _1111 = _1071 * _999;
    int _1113 = _991 + 56;
    uint _1115 = uint(int(uint(_1113) >> uint(2)));
    uint _1117 = uint(int(uint(int(_1115)) >> uint(2)));
    int _1119 = int(_1115) & 3;
    float _1121 = (*spvDescriptorSet0.vp_c15)._m0[int(_1117)][_1119];
    int _1123 = int(_1115) + 1;
    uint _1125 = uint(int(uint(_1123) >> uint(2)));
    int _1127 = _1123 & 3;
    float _1129 = (*spvDescriptorSet0.vp_c15)._m0[int(_1125)][_1127];
    float _1131 = _692 * _1077;
    float _1133 = _1033 * _1131;
    float _1135 = _1041 * _1131;
    float _1137 = _1045 * _1131;
    float _1139 = -_1107;
    float _1141 = fma(_1105, _1081, _1139);
    float _1143 = -_1081;
    float _1145 = fma(_1105, _1107, _1143);
    float _1147 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1031);
    int _1149 = _991 + 64;
    uint _1151 = uint(int(uint(_1149) >> uint(2)));
    uint _1153 = uint(int(uint(int(_1151)) >> uint(2)));
    int _1155 = int(_1151) & 3;
    float _1157 = (*spvDescriptorSet0.vp_c15)._m0[int(_1153)][_1155];
    int _1159 = int(_1151) + 1;
    uint _1161 = uint(int(uint(_1159) >> uint(2)));
    int _1163 = _1159 & 3;
    float _1165 = (*spvDescriptorSet0.vp_c15)._m0[int(_1161)][_1163];
    float _1167 = _1137 * _1067;
    float _1169 = _1135 * _1065;
    float _1171 = _1133 * _1147;
    float _1173 = fma(_1105, _1109, _1079);
    float _1175 = fma(_1105, _1079, _1109);
    float _1177 = _1111 * _1171;
    float _1179 = -_1171;
    float _1181 = _1105 * _1179;
    int _1183 = _991 + 72;
    uint _1185 = uint(int(uint(_1183) >> uint(2)));
    uint _1187 = uint(int(uint(int(_1185)) >> uint(2)));
    int _1189 = int(_1185) & 3;
    float _1191 = (*spvDescriptorSet0.vp_c15)._m0[int(_1187)][_1189];
    int _1193 = int(_1185) + 1;
    uint _1195 = uint(int(uint(_1193) >> uint(2)));
    int _1197 = _1193 & 3;
    float _1199 = (*spvDescriptorSet0.vp_c15)._m0[int(_1195)][_1197];
    float _1201 = _1083 * _1171;
    float _1203 = fma(_1173, _1169, _1177);
    float _1205 = fma(_1073, _1169, _1181);
    float _1207 = fma(_1141, _1169, _1201);
    float _1209 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _1211 = fma(_1145, _1167, _1203);
    int _1213 = _991 + 80;
    uint _1215 = uint(int(uint(_1213) >> uint(2)));
    uint _1217 = uint(int(uint(int(_1215)) >> uint(2)));
    int _1219 = int(_1215) & 3;
    float _1221 = (*spvDescriptorSet0.vp_c15)._m0[int(_1217)][_1219];
    int _1223 = int(_1215) + 1;
    uint _1225 = uint(int(uint(_1223) >> uint(2)));
    int _1227 = _1223 & 3;
    float _1229 = (*spvDescriptorSet0.vp_c15)._m0[int(_1225)][_1227];
    float _1231 = fma(_1075, _1167, _1205);
    float _1233 = _736 + _1209;
    float _1235 = _1211 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1237 = _1211 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1239 = fma(_1175, _1167, _1207);
    float _1241 = _1233 * _1029;
    float _1243 = fma(_1231, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1235);
    float _1245 = fma(_1231, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1237);
    float _1247 = _1211 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    int _1249 = _991 + 88;
    uint _1251 = uint(int(uint(_1249) >> uint(2)));
    uint _1253 = uint(int(uint(int(_1251)) >> uint(2)));
    int _1255 = int(_1251) & 3;
    float _1257 = (*spvDescriptorSet0.vp_c15)._m0[int(_1253)][_1255];
    int _1259 = int(_1251) + 1;
    uint _1261 = uint(int(uint(_1259) >> uint(2)));
    int _1263 = _1259 & 3;
    float _1265 = (*spvDescriptorSet0.vp_c15)._m0[int(_1261)][_1263];
    float _1267 = fma(_1239, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1243);
    float _1269 = fma(_730, _1021, _1241);
    float _1271 = fma(_1239, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1245);
    float _1273 = _604 + _1267;
    float _1275 = fma(_746, _1055, _1269);
    float _1277 = _576 + _1271;
    float _1279 = fma(_1231, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1247);
    float _1281 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1283 = _1273 + _1281;
    float _1285 = _1275 + _1063;
    float _1287 = _1233 * _1101;
    float _1289 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1291 = _1277 + _1289;
    float _1293 = _1283 * _1283;
    float _1295 = fma(_1239, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1279);
    float _1297 = fma(_730, _1093, _1287);
    float _1299 = 1.0 / _1285;
    float _1301 = fma(_1291, _1291, _1293);
    float _1303 = fma(_746, _1121, _1297);
    float _1305 = _1233 * _1165;
    float _1307 = fma(_730, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1309 = _1303 + _1129;
    float _1311 = sqrt(_1301);
    float _1313 = fma(_730, _1157, _1305);
    float _1315 = fma(_746, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1317 = fma(_746, _1191, _1313);
    float _1319 = _1309 * _1299;
    float _1321 = floor(_1307);
    float _1323 = _1317 + _1199;
    bool _1325 = _1319 >= 0.0;
    float _1327 = _1233 * _1229;
    float _1329 = _1323 * _1299;
    bool _1331 = _1311 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1333 = floor(_1315);
    float _1335 = fma(_730, _1221, _1327);
    bool _1337 = _1319 <= 1.0;
    bool _1339 = _1337 && _1325;
    bool _1341 = _1329 >= 0.0;
    bool _1343 = _1341 && _1339;
    float _1345 = fma(_746, _1257, _1335);
    float _1347 = -_1321;
    float _1349 = _1307 + _1347;
    bool _1351 = _1329 <= 1.0;
    bool _1353 = _1351 && _1343;
    float _1355 = _1345 + _1265;
    float _1357 = _1257;
    float _1359 = _1265;
    float _1361 = as_type<float>(_981);
    float _1363 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (!_1331)
    {
        _1357 = _1277;
    }
    float _1365 = _1357;
    float _1367 = _1365;
    if (!_1331)
    {
        _1359 = _1273;
    }
    float _1369 = _1359;
    float _1371 = -_1333;
    float _1373 = _1315 + _1371;
    bool _1375 = !_1331;
    float _1377 = _1369;
    if (!_1375)
    {
        float _1379 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1381 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1383 = _1311 + _1381;
        float _1385 = _562 + _1295;
        float _1387 = _1385 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1389 = rsqrt(_1301);
        float _1391 = _1383 * _1379;
        float _1393 = _1391 * 0.15915493667125701904296875;
        float _1395 = _1393 * 6.283185482025146484375;
        float _1397 = sin(_1395);
        float _1399 = fma(_1397, _1387, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1401 = _1389 * _1399;
        float _1403 = fma(_1291, _1401, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1405 = fma(_1283, _1401, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1367 = _1403;
        _1377 = _1405;
    }
    float _1407 = _1367;
    float _1409 = _1377;
    float _1411 = _1355 * _1299;
    float _1413 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _1415 = _1407 + _1413;
    float _1417 = fma(_1409, 6.2500002968590706586837768554688e-05, 0.5);
    float _1419 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _1421 = _1409 + _1419;
    float _1423 = fma(_1407, 6.2500002968590706586837768554688e-05, 0.5);
    float _1425 = fma(_1415, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _1427 = _1411;
    if (_1353)
    {
        float _1429 = float(_981);
        _1361 = _1429;
    }
    float _1431 = _1361;
    float _1433 = fma(_1421, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _5035 = float2(_1423, _1417);
    float _1435 = dm_bs(spvDescriptorSet0.vp_t_tcb_2C.sample(spvDescriptorSet0.vp_t_tcb_2CSmplr, select(_5035, float2(0.0), isnan(_5035)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_2C, spvDescriptorSet0.vp_t_tcb_2CSmplr_w, select(_5035, float2(0.0), isnan(_5035)), level(0.0)).y;
    float _1437 = _1277;
    if (_1353)
    {
        float _1439 = rint(_1431);
        float _1441 = precise::max(_1439, 0.0);
        uint _1443 = uint(_1441);
        uint _1445 = clamp(_1443, 0u, 65535u);
        _1437 = as_type<float>(_1445);
    }
    float _1447 = _1437;
    float2 _5062 = float2(_1425, _1433);
    float _1449 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_5062, float2(0.0), isnan(_5062)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_5062, float2(0.0), isnan(_5062)), level(0.0)).x;
    float2 _5070 = float2(_1349, _1373);
    float _1451 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5070, float2(0.0), isnan(_5070)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5070, float2(0.0), isnan(_5070)), level(0.0)).x;
    float _1453 = _1447;
    if (_1353)
    {
        float3 _5084 = float3(_1319, _1329, float(as_type<int>(_1447)));
        float3 _5088 = select(_5084, float3(0.0), isnan(_5084));
        float _1455 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5088.xy, uint(rint(_5088.z)), _1411, level(0.0));
        _1453 = _1455;
    }
    float _1457 = _1453;
    float _1459 = _1233 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1461 = _1233 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1463 = -_720;
    float _1465 = fma(_1463, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1407);
    float _1467 = -_724;
    float _1469 = fma(_1467, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1409);
    float _1471 = fma(_730, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1459);
    float _1473 = fma(_730, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1461);
    float _1475 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1477 = _1469 + _1475;
    float _1479 = fma(_746, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1471);
    float _1481 = fma(_746, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1473);
    float _1483 = _1479 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1485 = _1481 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1487 = trunc(_1483);
    int _1489 = int(_1487);
    float _1491 = trunc(_1485);
    int _1493 = int(_1491);
    int _1495 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1497 = _1489 + _1495;
    int _1499 = _1497 + 1;
    bool _1501 = _1499 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1503 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1505 = _1493 + _1503;
    int _1507 = _1505 + 1;
    int _1509 = _1499 | _1507;
    bool _1511 = _1509 < 0;
    bool _1513 = _1511 || _1501;
    float _1515 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1517 = _1465 + _1515;
    bool _1519 = _1507 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1521 = _1519 || _1513;
    float _1523 = as_type<float>(_1499);
    float _1525 = as_type<float>(_1507);
    float _1527 = _1483;
    if (!_1521)
    {
        int _1529 = _1507 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1531 = _1529 + _1499;
        _753 = uint(_1531);
    }
    uint _1533 = _753;
    float _1535 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1537 = fma(_1435, 2000.0, (*spvDescriptorSet0.vp_c13)._m0[0].x);
    float _1539 = fma(_1449, 100.0, _1537);
    float _1541 = -_718;
    float _1543 = fma(_1541, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1539);
    float _1545 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1547 = _1543 + _1545;
    float _1549 = _1547 * _1547;
    float _1551 = fma(_1517, _1517, _1549);
    float _1553 = fma(_1477, _1477, _1551);
    float _1555 = rsqrt(_1553);
    float _1557 = sqrt(_1553);
    float _1559 = _1555 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1561 = _1517 * _1559;
    float _1563 = _1477 * _1559;
    float _1565 = _1561 * _1561;
    float _1567 = _1563 * _1563;
    float _1569 = _1565 + _1567;
    float _1571 = sqrt(_1569);
    bool _1573 = _1571 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1575 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1577 = _1571 + _1575;
    float _1579 = _1555;
    float _1581 = _1569;
    float _1583 = _1577;
    float _1585 = _1547;
    float _1587 = _1537;
    if (_1573)
    {
        float _1589 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1579 = _1589;
    }
    float _1591 = _1579;
    if (_1573)
    {
        float _1593 = rsqrt(_1569);
        _1581 = _1593;
    }
    float _1595 = _1581;
    int _1597 = as_type<int>(_1595);
    if (_1573)
    {
        float _1599 = _1577 * _1591;
        _1583 = _1599;
    }
    float _1601 = _1583;
    if (_1573)
    {
        float _1603 = _1601 * 0.15915493667125701904296875;
        _1523 = _1603;
    }
    float _1605 = _1523;
    float _1607 = _1477;
    if (_1573)
    {
        float _1609 = _1605 * 6.283185482025146484375;
        float _1611 = sin(_1609);
        _1607 = _1611;
    }
    float _1613 = _1607;
    float _1615 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1617 = precise::max(0.0, _1615);
    float _1619 = _1591;
    float _1621 = _1617;
    if (_1573)
    {
        float _1623 = _1605 * 6.283185482025146484375;
        float _1625 = cos(_1623);
        _1619 = _1625;
    }
    float _1627 = _1619;
    float _1629 = -_1559;
    float _1631 = -_1617;
    float _1633 = fma(_1547, _1629, _1631);
    float _1635 = _1633;
    if (_1573)
    {
        float _1637 = _1633 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1585 = _1637;
    }
    float _1639 = _1585;
    float _1641 = _1543 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1643 = _1613;
    float _1645 = _1639;
    if (_1573)
    {
        float _1647 = fma(_1613, _1639, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1525 = _1647;
    }
    float _1649 = _1525;
    float _1651 = _1649;
    if (!_1573)
    {
        _1643 = _1561;
    }
    float _1653 = _1643;
    float _1655 = _1653;
    if (!_1573)
    {
        _1645 = _1567;
    }
    float _1657 = _1645;
    float _1659 = _1657;
    if (_1573)
    {
        float _1661 = _1627 + (-1.0);
        _1621 = _1661;
    }
    float _1663 = _1621;
    float _1665 = _1663;
    if (_1573)
    {
        float _1667 = _1595 * _1649;
        _1651 = _1667;
    }
    float _1669 = _1651;
    int _1671 = as_type<int>(_1669);
    if (!_1521)
    {
        uint _1673 = uint(int(uint(int(_1533)) >> uint(2)));
        _1597 = int(_1673);
    }
    int _1675 = _1597;
    float _1677 = fma(_1465, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1641);
    if (_1573)
    {
        float _1679 = _1663 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1587 = _1679;
    }
    float _1681 = _1587;
    float _1683 = _1681;
    if (!_1573)
    {
        _1665 = _1563;
    }
    float _1685 = _1665;
    float _1687 = _1685;
    if (_1573)
    {
        float _1689 = _1561 * _1669;
        _1655 = _1689;
    }
    float _1691 = _1655;
    if (_1573)
    {
        float _1693 = _1563 * _1669;
        _1687 = _1693;
    }
    float _1695 = _1687;
    if (!_1521)
    {
        int _1697 = int(_1533) << 2;
        _1671 = _1697;
    }
    int _1699 = _1671;
    int _1701 = _1699;
    if (_1573)
    {
        float _1703 = fma(_1633, _1627, _1681);
        _1635 = _1703;
    }
    float _1705 = _1635;
    if (!_1573)
    {
        _1683 = _1565;
    }
    float _1707 = _1683;
    float _1709 = _1707;
    if (_1573)
    {
        float _1711 = _1691 * _1691;
        _1709 = _1711;
    }
    float _1713 = _1709;
    if (!_1521)
    {
        int _1715 = 12 & _1699;
        _1701 = _1715;
    }
    int _1717 = _1701;
    if (_1573)
    {
        float _1719 = _1695 * _1695;
        _1659 = _1719;
    }
    float _1721 = _1659;
    float _1723 = fma(_1469, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1677);
    float _1725 = fma(_1705, _1705, _1713);
    float _1727 = _1725;
    if (!_1521)
    {
        int _1729 = _1675 << 4;
        int _1731 = _1729 + _1717;
        _1363 = as_type<float>(_1731);
    }
    float _1733 = _1363;
    float _1735 = _1543 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1737 = _1543 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1739 = _1725 + _1721;
    float _1741 = _1543 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1743 = fma(_1465, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1735);
    float _1745 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1747 = fma(_1557, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1745);
    float _1749 = precise::clamp(_1747, 0.0, 1.0);
    float _1751 = _1723 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1753 = fma(_1465, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1741);
    float _1755 = fma(_1469, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1743);
    float _1757 = rsqrt(_1739);
    float _1759 = -_1749;
    float _1761 = _1759 + 1.0;
    float _1763 = fma(_1469, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1753);
    float _1765 = _1755 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1767 = fma(_1465, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1737);
    float _1769 = _1751 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1771 = _1763 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1773 = _1765 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1775 = abs(_1761);
    float _1777 = log2(_1775);
    float _1779 = fma(_1469, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1767);
    float _1781 = -_1769;
    float _1783 = fma(_1781, _1535, 1.0);
    float _1785 = fma(_1771, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1773);
    float _1787 = _1733;
    float _1789 = _1783;
    if (!_1521)
    {
        int _1791 = as_type<int>(_1733) + 400;
        uint _1793 = uint(int(uint(_1791) >> uint(2)));
        uint _1795 = uint(int(uint(int(_1793)) >> uint(2)));
        int _1797 = int(_1793) & 3;
        float _1799 = (*spvDescriptorSet0.vp_c15)._m0[int(_1795)][_1797];
        _1787 = _1799;
    }
    float _1801 = _1787;
    float _1803 = _1779 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1805 = fma(_1751, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1785);
    float _1807 = _1757 * _1691;
    if (!_1521)
    {
        float _1809 = floor(_1485);
        _1727 = _1809;
    }
    float _1811 = _1727;
    float _1813 = _1757 * _1695;
    float _1815 = fma(_1803, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1805);
    float _1817 = _1757 * _1705;
    float _1819 = _1807 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1821 = _1777 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1823 = _1627;
    if (!_1521)
    {
        float _1825 = floor(_1483);
        _1823 = _1825;
    }
    float _1827 = _1823;
    float _1829 = -_1819;
    float _1831 = fma(_1817, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1829);
    float _1833 = -_1813;
    float _1835 = fma(_1833, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1831);
    float _1837 = _1765 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1839 = exp2(_1821);
    float _1841 = fma(_1835, -0.5, 0.5);
    float _1843 = fma(_1835, 0.5, 0.5);
    float _1845 = fma(_1843, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1847 = log2(_1783);
    if (!_1521)
    {
        float _1849 = -_1827;
        float _1851 = _1483 + _1849;
        _1527 = _1851;
    }
    float _1853 = _1527;
    float _1855 = fma(_1843, _1845, -0.212114393711090087890625);
    float _1857 = fma(_1843, _1855, 1.570728778839111328125);
    float _1859 = 1.0 / _1815;
    if (!_1521)
    {
        float _1861 = -_1811;
        float _1863 = _1485 + _1861;
        _1789 = _1863;
    }
    float _1865 = _1789;
    float _1867 = _1765 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1869 = fma(_1771, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1837);
    float _1871 = _1817 + 1.0;
    float _1873 = fma(_1771, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1867);
    float _1875 = fma(_1751, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1869);
    float _1877 = sqrt(_1841);
    float _1879 = -_1817;
    float _1881 = fma(_1839, _1871, _1879);
    float _1883 = fma(_1751, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1873);
    float _1885 = fma(_1803, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1875);
    float _1887 = _1847 * 0.693147182464599609375;
    float _1889 = fma(_1881, 0.5, 0.5);
    float _1891 = fma(_1803, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1883);
    float _1893 = _1885 * _1859;
    float _1895 = _1887 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1897 = _1891 * _1859;
    float _1899 = _1883;
    float _1901 = _1885;
    if (!_1521)
    {
        float _1903 = rint(_1801);
        float _1905 = precise::max(_1903, 0.0);
        uint _1907 = uint(_1905);
        uint _1909 = clamp(_1907, 0u, 65535u);
        _1899 = as_type<float>(_1909);
    }
    float _1911 = _1899;
    float _1913 = fma(_1893, 0.5, 0.5);
    float _1915 = fma(_1897, -0.5, 0.5);
    float _1917 = _1877 * 0.636619746685028076171875;
    float _1919 = -_1857;
    float _1921 = fma(_1917, _1919, 1.0);
    float3 _5877 = float3(_1913, _1915, _1895);
    float _1923 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5877, float3(0.0), isnan(_5877)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5877, float3(0.0), isnan(_5877)), level(0.0)).x;
    float3 _5886 = float3(_1913, _1915, _1895);
    float4 _1926 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5886, float3(0.0), isnan(_5886)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5886, float3(0.0), isnan(_5886)), level(0.0)).xyzw;
    float _1928 = _1926.x;
    float _1930 = _1926.y;
    float _1932 = _1926.z;
    float _1934 = _1926.w;
    float2 _5902 = float2(_1921, _1889);
    float3 _1938 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5902, float2(0.0), isnan(_5902)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5902, float2(0.0), isnan(_5902)), level(0.0)).xyz;
    float _1940 = _1938.x;
    float _1942 = _1938.y;
    float _1944 = _1938.z;
    float _1946 = _1865;
    if (!_1521)
    {
        float3 _5923 = float3(_1853, _1865, float(as_type<int>(_1911)));
        float3 _5925 = select(_5923, float3(0.0), isnan(_5923));
        float _1948 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5925.xy, uint(rint(_5925.z)), level(0.0)), spvDescriptorSet0.dm_border, 6u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5925.xy, uint(rint(_5925.z)), level(0.0)).x;
        _1946 = _1948;
    }
    float _1950 = _1946;
    float _1952 = in.m_69.w;
    float _1954 = _1777 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1956 = in.m_81.y;
    bool _1958 = _164 > 0.5;
    float _1960 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1962 = _1960 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1964 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1966 = _1964 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1968 = 1.0 / _1962;
    float _1970 = -_1451;
    float _1972 = _1970 + 1.0;
    float _1974 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1976 = _1974 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    int _1978 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1980 = _1978 != 0;
    int _1982 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1984 = _1982 != 0;
    float _1986 = 1.0 / _1966;
    float _1988 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1990 = _1988 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    int _1992 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1994 = _1992 != 0;
    bool _1996 = _538 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1998 = isnan(_538);
    bool _2000 = _1996 || _1998;
    bool _2002 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _2004 = _2000 || _2002;
    int _2006 = _2004 ? 1065353216 : 0;
    bool _2008 = _1952 > 0.5;
    float _2010 = 1.0 / _1990;
    float _2012 = -_1956;
    float _2014 = _2012 + 1.0;
    int _2016 = _2008 ? as_type<int>(_2014) : as_type<int>(_1956);
    float _2018 = 1.0 / _1976;
    int _2020 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2022 = _2020 != 0;
    float _2024 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _2026 = _538 + _2024;
    float _2028 = _2022 ? as_type<float>(_2016) : _1956;
    float _2030 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _2032 = _2030 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _2034 = _1956;
    bool _2036 = _1958;
    bool _2038 = _2022;
    int _2040 = _2006;
    if (_1980)
    {
        float _2042 = _1958 ? _2014 : _1956;
        _2034 = _2042;
    }
    float _2044 = _2034;
    float _2046 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _2048 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _2046;
    float _2050 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _2052 = _2050 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    if (_1984)
    {
        bool _2054 = _540 > 0.5;
        _2036 = _2054;
    }
    bool _2056 = _2036;
    float _2058 = _2032 * _2010;
    if (_1994)
    {
        bool _2060 = _160 > 0.5;
        _2038 = _2060;
    }
    bool _2062 = _2038;
    float _2064 = _2052 * _1968;
    float _2066 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _2068 = _538 + _2066;
    bool _2070 = _538 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _2072 = isnan(_538);
    bool _2074 = _2070 || _2072;
    bool _2076 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _2078 = _2074 || _2076;
    float _2080 = float(_2078);
    float _2082 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _2084 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _2082;
    float _2086 = _2048 * _1986;
    float _2088 = fma(_2064, _2068, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    bool _2090 = _538 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _2092 = isnan(_538);
    bool _2094 = _2090 || _2092;
    bool _2096 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _2098 = _2094 || _2096;
    float _2100 = float(_2098);
    float _2102 = _2084 * _2018;
    float _2104 = -_2080;
    float _2106 = _2104 + 1.0;
    float _2108 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _2110 = _538 + _2108;
    bool _2112 = _538 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _2114 = isnan(_538);
    bool _2116 = _2112 || _2114;
    bool _2118 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _2120 = _2116 || _2118;
    float _2122 = float(_2120);
    float _2124 = -_2100;
    float _2126 = _2124 + 1.0;
    float _2128 = fma(_2086, _2026, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _2130 = _2100 * _2106;
    float _2132 = fma(_2102, _2110, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _2134 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _2136 = _538 + _2134;
    bool _2138 = _538 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _2140 = isnan(_538);
    bool _2142 = _2138 || _2140;
    bool _2144 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _2146 = _2142 || _2144;
    float _2148 = float(_2146);
    float _2150 = _2122 * _2126;
    float _2152 = -_2122;
    float _2154 = _2152 + 1.0;
    float _2156 = in.m_81.x;
    float _2158 = fma(_2058, _2136, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _2160 = -_2148;
    float _2162 = _2160 + 1.0;
    float _2164 = _2148 * _2154;
    bool _2166 = _1031 != 0.0;
    bool _2168 = isnan(_1031);
    bool _2170 = _2166 || _2168;
    bool _2172 = isnan(0.0);
    bool _2174 = _2170 || _2172;
    float _2176 = in.m_83.x;
    float _2178 = in.m_83.y;
    float _2180 = in.m_83.z;
    float _2182 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2184 = as_type<float>(_2006) * _2162;
    bool _2186 = _1035 == 0.0;
    bool _2188 = !_2174;
    bool _2190 = _2186 && _2188;
    float _2192 = _2128 * _2184;
    bool _2194 = _1043 == 0.0;
    bool _2196 = _2194 && _2190;
    float _2198 = -as_type<float>(_2006);
    float _2200 = _2198 + 1.0;
    float _2202 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2204 = fma(_2200, (*spvDescriptorSet0.vp_c9)._m0[115].x, _2192);
    float _2206 = fma(_2088, _2164, _2204);
    float _2208 = _2182 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2210 = _2028 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2212 = _2182;
    float _2214 = _2156;
    if (_1994)
    {
        float _2216 = -_2156;
        float _2218 = _2216 + 1.0;
        _2040 = as_type<int>(_2218);
    }
    int _2220 = _2040;
    if (!_1994)
    {
        _2212 = _2156;
    }
    float _2222 = _2212;
    float _2224 = fma(_2208, _2044, -0.5);
    int _2226 = 0;
    float _2228 = _2222;
    if (_1984)
    {
        float _2230 = -_2156;
        float _2232 = _2230 + 1.0;
        _2226 = as_type<int>(_2232);
    }
    int _2234 = _2226;
    float _2236 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2238 = _2178;
    float _2240 = _2176;
    float _2242 = _2180;
    if (!_2196)
    {
        float _2244 = fma(_1031, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2178);
        _2238 = _2244;
    }
    float _2246 = _2238;
    if (_1994)
    {
        float _2248 = _2062 ? as_type<float>(_2220) : _2156;
        _2228 = _2248;
    }
    float _2250 = _2228;
    float _2252 = _2202 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    if (!_2196)
    {
        float _2254 = fma(_1035, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2176);
        _2240 = _2254;
    }
    float _2256 = _2240;
    float _2258 = -_2246;
    float _2260 = _1105 * _2258;
    float _2262 = fma(_2252, _2250, -0.5);
    float _2264 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2266 = fma(_1073, _2256, _2260);
    float _2268 = fma(_2132, _2150, _2206);
    float _2270 = fma(_819, _2262, _642);
    float _2272 = _1111 * _2246;
    float _2274 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2276 = abs(_927);
    float _2278 = log2(_2276);
    if (_1984)
    {
        float _2280 = _2056 ? as_type<float>(_2234) : _2156;
        _2214 = _2280;
    }
    float _2282 = _2214;
    float _2284 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2286 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2288 = -_791;
    float _2290 = fma(_811, _2224, _2288);
    if (!_2196)
    {
        float _2292 = fma(_1043, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2180);
        _2242 = _2292;
    }
    float _2294 = _2242;
    float _2296 = _2282 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2298 = fma(_1173, _2256, _2272);
    float _2300 = _2274 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2302 = _2284 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2304 = _2286 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2306 = _1083 * _2246;
    float _2308 = _2290 + 0.5;
    float _2310 = _2210 * _2236;
    float _2312 = _2296 * _2264;
    float _2314 = _2270 + 0.5;
    float _2316 = fma(_1145, _2294, _2298);
    out.m_85.x = _2300;
    out.m_85.y = _2302;
    out.m_85.z = _2304;
    float _2318 = _2278 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2320 = fma(_1075, _2294, _2266);
    float _2322 = fma(_1141, _2256, _2306);
    out.m_87.x = _2314;
    out.m_87.y = _2308;
    out.m_87.z = _2312;
    out.m_87.w = _2310;
    float _2324 = fma(_2158, _2130, _2268);
    float _2326 = exp2(_2318);
    float _2328 = fma(_1175, _2294, _2322);
    float _2330 = fma(_2080, (*spvDescriptorSet0.vp_c9)._m0[119].x, _2324);
    float _2332 = in.m_79.w;
    float _2334 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2336 = _2316 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2338 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2340 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2342 = _2334 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2344 = fma(_2320, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2336);
    float _2346 = _2316 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2348 = _2338 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2350 = _2340 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2352 = fma(_2328, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2344);
    float _2354 = fma(_2320, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2346);
    float _2356 = _2330 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2358 = exp2(_1954);
    float _2360 = fma(_2328, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2354);
    float _2362 = _1765 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_89.x = _2342;
    out.m_89.y = _2348;
    out.m_89.z = _2350;
    out.m_89.w = _2356;
    bool _2364 = _927 <= 8000.0;
    bool _2366 = isnan(_927);
    bool _2368 = _2364 || _2366;
    bool _2370 = isnan(8000.0);
    bool _2372 = _2368 || _2370;
    float _2374 = float(_2372);
    float _2376 = fma(_1771, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2362);
    float _2378 = _2316 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2380 = fma(_2326, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2382 = precise::clamp(_2380, 0.0, 1.0);
    float _2384 = _2362;
    if (!_1353)
    {
        _2384 = 1.0;
    }
    float _2386 = _2384;
    float _2388 = fma(_1751, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2376);
    out.m_91.w = _2332;
    float _2390 = fma(_2320, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2378);
    float _2392 = _2386;
    if (_1353)
    {
        bool _2394 = _1457 >= _1411;
        bool _2396 = isnan(_1457);
        bool _2398 = _2394 || _2396;
        bool _2400 = isnan(_1411);
        bool _2402 = _2398 || _2400;
        float _2404 = float(_2402);
        _2392 = _2404;
    }
    float _2406 = _2392;
    float _2408 = fma(_1803, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2388);
    float _2410 = fma(_2328, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2390);
    float _2412 = fma(_2382, -2.0, 3.0);
    float _2414 = _2382 * _2382;
    float _2416 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _2418 = _2408 + _2416;
    float _2420 = _1815 * 0.5;
    float _2422 = _2414 * _2412;
    float _2424 = _1885 + _1815;
    float _2426 = _1815 + _2418;
    float _2428 = fma(_1891, -0.5, _2420);
    out.gl_Position.x = _1885;
    out.gl_Position.y = _1891;
    out.gl_Position.z = _2418;
    out.gl_Position.w = _1815;
    float _2430 = _2424 * 0.5;
    float _2432 = _2426 * 0.5;
    float _2434 = -_2422;
    float _2436 = _2434 + 1.0;
    out.m_93.x = _2430;
    out.m_93.y = _2428;
    out.m_93.z = _2432;
    out.m_93.w = _1815;
    float _2438 = fma(_2436, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2422);
    float _2440 = -_2358;
    float _2442 = _2440 + 1.0;
    float _2444 = _2374 * _2438;
    float _2446 = _2442 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2448 = _2430;
    float _2450 = _2446;
    if (_1521)
    {
        _1901 = 1.0;
    }
    float _2452 = _1901;
    float _2454 = _2444 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2456 = _1972 * _2454;
    float _2458 = precise::clamp(_2456, 0.0, 1.0);
    float _2460 = _2452;
    if (!_1521)
    {
        int _2462 = int(_1533) << 4;
        int _2464 = _2462 + 2048;
        uint _2466 = uint(int(uint(_2464) >> uint(2)));
        uint _2468 = uint(int(uint(int(_2466)) >> uint(2)));
        int _2470 = int(_2466) & 3;
        float _2472 = (*spvDescriptorSet0.vp_c15)._m0[int(_2468)][_2470];
        int _2474 = int(_2466) + 1;
        uint _2476 = uint(int(uint(_2474) >> uint(2)));
        int _2478 = _2474 & 3;
        float _2480 = (*spvDescriptorSet0.vp_c15)._m0[int(_2476)][_2478];
        int _2482 = _2464 + 8;
        uint _2484 = uint(int(uint(_2482) >> uint(2)));
        uint _2486 = uint(int(uint(int(_2484)) >> uint(2)));
        int _2488 = int(_2484) & 3;
        float _2490 = (*spvDescriptorSet0.vp_c15)._m0[int(_2486)][_2488];
        int _2492 = int(_2484) + 1;
        uint _2494 = uint(int(uint(_2492) >> uint(2)));
        int _2496 = _2492 & 3;
        float _2498 = (*spvDescriptorSet0.vp_c15)._m0[int(_2494)][_2496];
        float _2500 = _1233 * _2480;
        float _2502 = fma(_730, _2472, _2500);
        float _2504 = fma(_746, _2490, _2502);
        float _2506 = _2504 + _2498;
        float _2508 = precise::clamp(_2506, 0.0, 1.0);
        float _2510 = -_2508;
        float _2512 = _2510 + _1950;
        float _2514 = fma(_2512, 500.0, 1.5);
        float _2516 = exp2(_2514);
        float _2518 = 0.0 + _2516;
        float _2520 = precise::clamp(_2518, 0.0, 1.0);
        _2460 = _2520;
        _2448 = _2490;
    }
    float _2522 = _2460;
    float _2524 = _2448;
    float _2526 = _2446 * _1923;
    float _2528 = _2406 * _2522;
    float _2530 = -_2458;
    float _2532 = fma(_2530, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2534 = -_2446;
    float _2536 = _2534 + 1.0;
    float _2538 = _1934 * _2526;
    float _2540 = _1944 * _2526;
    float _2542 = -_2528;
    float _2544 = fma(_2542, _2532, 1.0);
    float _2546 = precise::clamp(_2544, 0.0, 1.0);
    out.m_95.x = _2352;
    out.m_95.y = _2360;
    out.m_95.z = _2410;
    float _2548 = fma(_1940, _2538, _1928);
    float _2550 = fma(_1942, _2538, _1930);
    float _2552 = _2546 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2554 = _1934 * _2536;
    float _2556 = fma(_1934, _2540, _1932);
    bool _2558 = _1557 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2560 = isnan(_1557);
    bool _2562 = _2558 || _2560;
    bool _2564 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2566 = _2562 || _2564;
    out.m_97.x = _2552;
    out.m_99.x = _2548;
    out.m_99.y = _2550;
    out.m_99.z = _2556;
    out.m_99.w = _2554;
    float _2568 = _2524;
    float _2570 = _2538;
    float _2572 = _2536;
    float _2574 = _2546;
    if (!_2566)
    {
        _1427 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2576 = _1427;
    float _2578 = _2576;
    float _2580 = _2576;
    if (!_2566)
    {
        _2568 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2582 = _2568;
    float _2584 = _2582;
    float _2586 = _2582;
    if (!_2566)
    {
        _2570 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2588 = _2570;
    float _2590 = _2588;
    float _2592 = _2588;
    if (!_2566)
    {
        _2572 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2594 = _2572;
    float _2596 = _2594;
    float _2598 = _2594;
    if (!_2566)
    {
        _2450 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2600 = _2450;
    float _2602 = _2600;
    float _2604 = _2600;
    if (!_2566)
    {
        _2574 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2606 = _2574;
    bool _2608 = !_2566;
    float _2610 = _2606;
    float _2612 = _2606;
    if (!_2608)
    {
        bool _2614 = _1557 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2616 = isnan(_1557);
        bool _2618 = _2614 || _2616;
        bool _2620 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2622 = _2618 || _2620;
        if (!_2622)
        {
            float _2624 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2626 = _1557 + _2624;
            float _2628 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2630 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2628;
            float _2632 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2634 = _2632 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2636 = 1.0 / _2630;
            float _2638 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2640 = _2638 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2642 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2644 = _2642 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2646 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2648 = _2646 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2650 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2652 = _2650 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2654 = _2626 * _2636;
            float _2656 = precise::clamp(_2654, 0.0, 1.0);
            float _2658 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2660 = _2658 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2662 = fma(_2656, _2634, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2664 = fma(_2656, _2660, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2666 = fma(_2656, _2640, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2668 = fma(_2656, _2644, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2670 = fma(_2656, _2648, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2672 = fma(_2656, _2652, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2586 = _2666;
            _2604 = _2670;
            _2580 = _2662;
            _2598 = _2668;
            _2592 = _2664;
            _2612 = _2672;
            _2674 = true;
        }
        else
        {
            bool _2676 = _1557 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2678 = isnan(_1557);
            bool _2680 = _2676 || _2678;
            bool _2682 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2684 = _2680 || _2682;
            if (!_2684)
            {
                _2578 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2686 = _2578;
            _2580 = _2686;
            if (!_2684)
            {
                _2584 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2688 = _2584;
            _2586 = _2688;
            if (!_2684)
            {
                _2590 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2690 = _2590;
            _2592 = _2690;
            if (!_2684)
            {
                _2596 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2692 = _2596;
            _2598 = _2692;
            if (!_2684)
            {
                _2602 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2694 = _2602;
            _2604 = _2694;
            if (!_2684)
            {
                _2610 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2696 = _2610;
            bool _2698 = !_2684;
            _2612 = _2696;
            if (!_2698)
            {
                bool _2700 = _1557 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2702 = isnan(_1557);
                bool _2704 = _2700 || _2702;
                bool _2706 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2708 = _2704 || _2706;
                if (!_2708)
                {
                    float _2710 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2712 = _1557 + _2710;
                    float _2714 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2716 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2714;
                    float _2718 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2720 = _2718 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2722 = 1.0 / _2716;
                    float _2724 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2726 = _2724 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2728 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2730 = _2728 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2732 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2734 = _2732 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2736 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2738 = _2736 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2740 = _2712 * _2722;
                    float _2742 = precise::clamp(_2740, 0.0, 1.0);
                    float _2744 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2746 = _2744 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2748 = fma(_2742, _2720, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2750 = fma(_2742, _2746, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2752 = fma(_2742, _2726, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2754 = fma(_2742, _2730, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2756 = fma(_2742, _2734, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2758 = fma(_2742, _2738, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2586 = _2752;
                    _2604 = _2756;
                    _2580 = _2748;
                    _2598 = _2754;
                    _2592 = _2750;
                    _2612 = _2758;
                    _2674 = true;
                }
                else
                {
                    _2586 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2604 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2580 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2598 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2592 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2612 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2674 = false;
    float _2760 = _2586;
    float _2762 = _2604;
    float _2764 = _2580;
    float _2766 = _2598;
    float _2768 = _2592;
    float _2770 = _2612;
    float _2772 = fma(_2360, -0.5, 0.5);
    float _2774 = precise::clamp(_2772, 0.0, 1.0);
    float _2776 = -_2760;
    float _2778 = _2776 + _2762;
    float _2780 = -_2764;
    float _2782 = _2780 + _2766;
    float _2784 = -_2768;
    float _2786 = _2784 + _2770;
    bool _2788 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2790 = fma(_2774, _2778, _2760);
    float _2792 = fma(_2774, _2782, _2764);
    float _2794 = fma(_2774, _2786, _2768);
    float _2796 = _2790 * 0.586610972881317138671875;
    out.m_101.x = 0.0;
    float _2798 = fma(_2792, 0.298911988735198974609375, _2796);
    float _2800 = fma(_2794, 0.114477999508380889892578125, _2798);
    float _2802 = -_2800;
    float _2804 = _2792 + _2802;
    float _2806 = -_2800;
    float _2808 = _2790 + _2806;
    float _2810 = -_2800;
    float _2812 = _2794 + _2810;
    float _2814 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2816 = fma(_2804, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2800);
    float _2818 = fma(_2808, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2800);
    float _2820 = fma(_2812, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2800);
    out.m_67.x = _2814;
    out.m_103.x = _2816;
    out.m_103.y = _2818;
    out.m_103.z = _2820;
    if (!_2788)
    {
        return out;
    }
    float _2822 = -_1543;
    float _2824 = _2822 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2826 = -_1465;
    float _2828 = _2826 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2830 = -_1469;
    float _2832 = _2830 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2834 = _2824 * _2824;
    float _2836 = fma(_2828, _2828, _2834);
    float _2838 = fma(_2832, _2832, _2836);
    float _2840 = sqrt(_2838);
    float _2842 = rsqrt(_2838);
    float _2844 = -_2840;
    float _2846 = _2844 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2848 = _2846 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2850 = precise::clamp(_2848, 0.0, 1.0);
    float _2852 = _2828 * _2842;
    float _2854 = _2824 * _2842;
    float _2856 = abs(_2850);
    float _2858 = log2(_2856);
    float _2860 = _2832 * _2842;
    float _2862 = _2852 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2864 = _2360 * _2854;
    float _2866 = -_2854;
    float _2868 = -_2862;
    float _2870 = fma(_2866, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2868);
    float _2872 = fma(_2352, _2852, _2864);
    float _2874 = -_2860;
    float _2876 = fma(_2874, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2870);
    float _2878 = fma(_2410, _2860, _2872);
    float _2880 = precise::clamp(_2878, 0.0, 1.0);
    float _2882 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2884 = _2876 + _2882;
    float _2886 = _2858 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2888 = _2884 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2890 = precise::clamp(_2888, 0.0, 1.0);
    float _2892 = exp2(_2886);
    float _2894 = _2892 * _2890;
    float _2896 = _2880 * _2894;
    float _2898 = _2896 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2900 = _2896 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2902 = _2896 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_101.x = _2898;
    out.m_101.y = _2900;
    out.m_101.z = _2902;
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
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2674 = false;
    bool _536 = false;
    bool _322 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _117 = in.m_60.w;
    float _119 = in.m_62.w;
    float _121 = trunc(_117);
    int _124 = int(_121);
    float _126 = -_119;
    float _128 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_65.y = _128;
    bool _132 = _124 >= 1;
    float _134 = 0.0;
    float _136 = as_type<float>(_124);
    float _138 = _128;
    if (!_132)
    {
        _134 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _134;
    if (!_132)
    {
        out.m_67.x = 0.0;
    }
    int _142 = 0;
    if (!_132)
    {
        float _144 = _140 * 5.0;
        _142 = as_type<int>(_144);
    }
    int _146 = _142;
    int _148 = _146;
    if (!_132)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2971 = as_type<float>(_146);
        out.gl_Position.z = _2971;
    }
    if (!_132)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _150 = _119 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _152 = isnan(_119);
    bool _154 = _150 || _152;
    bool _156 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _158 = _154 || _156;
    float _160 = in.m_69.x;
    float _162 = float(_124);
    float _164 = in.m_69.y;
    bool _166 = _128 >= _162;
    bool _168 = !_158;
    bool _170 = _166 || _168;
    if (_170)
    {
        _136 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _172 = _136;
    if (_170)
    {
        out.m_67.x = 0.0;
    }
    if (_170)
    {
        float _174 = _172 * 5.0;
        _148 = as_type<int>(_174);
    }
    int _176 = _148;
    out.m_71.x = _160;
    out.m_71.y = _164;
    if (_170)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3034 = as_type<float>(_176);
        out.gl_Position.z = _3034;
    }
    if (_170)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _178 = in.m_73.w;
    float _180 = 1.0 / _162;
    float _182 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _184 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _186 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _188 = _184 || _186;
    bool _190 = isnan(1.0);
    bool _192 = _188 || _190;
    float _194 = in.m_62.x;
    float _196 = in.m_62.y;
    float _198 = in.m_62.z;
    float _200 = in.m_60.x;
    float _202 = in.m_60.y;
    float _204 = in.m_60.z;
    float _206 = 0.0;
    float _208 = _182;
    if (!_192)
    {
        float _210 = _182 * _182;
        float _212 = _210 * 0.5;
        _206 = _212;
    }
    float _214 = _206;
    float _216 = _214;
    if (!_192)
    {
        float _218 = _214 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _216 = _218;
    }
    float _220 = _216;
    bool _222 = !_192;
    float _224 = _220;
    if (!_222)
    {
        float _226 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _228 = log2(_226);
        float _230 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _232 = _230 + 1.0;
        float _234 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _236 = _182 * _228;
        float _238 = 1.0 / _232;
        float _240 = _234 * 0.693147182464599609375;
        float _242 = exp2(_236);
        float _244 = 1.0 / _240;
        float _246 = _242 + (-1.0);
        float _248 = -_246;
        float _250 = fma(_248, _244, _182);
        float _252 = _250 * _238;
        float _254 = _252 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _224 = _254;
    }
    float _256 = _224;
    bool _258 = !_192;
    if (!_258)
    {
        float _260 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _262 = log2(_260);
        float _264 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _266 = _264 + 1.0;
        float _268 = 1.0 / _266;
        float _270 = _182 * _262;
        float _272 = exp2(_270);
        float _274 = -_272;
        float _276 = _274 + 1.0;
        float _278 = _276 * _268;
        _208 = _278;
    }
    float _280 = _208;
    bool _282 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _284 = _256 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _286 = _256 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _288 = _256 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _290 = _128 * _180;
    float _292 = fma(_280, _194, _284);
    float _294 = fma(_280, _196, _286);
    float _296 = fma(_280, _198, _288);
    float _298 = fma(_292, _178, _200);
    float _300 = fma(_294, _178, _202);
    float _302 = fma(_296, _178, _204);
    bool _304 = !_282;
    float _320;
    if (!_304)
    {
        float _306 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _308 = _160 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _310 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[12].x, _128);
        float _312 = _310 * _306;
        float _314 = floor(_312);
        float _316 = -_314;
        float _318 = _312 + _316;
        _320 = _318;
        _322 = true;
    }
    else
    {
        _320 = _290;
    }
    _322 = false;
    float _324 = _320;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _328 = _324 + _326;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _332 = _324 + _330;
    bool _334 = _324 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _336 = isnan(_324);
    bool _338 = _334 || _336;
    bool _340 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _342 = _338 || _340;
    float _344 = float(_342);
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _348 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _346;
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _352 = _324 + _350;
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _356 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _354;
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _360 = _358 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _362 = 1.0 / _348;
    bool _364 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _366 = 1.0 / _360;
    float _368 = 1.0 / _356;
    float _370 = _328 * _362;
    bool _372 = _324 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _374 = isnan(_324);
    bool _376 = _372 || _374;
    bool _378 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _380 = _376 || _378;
    float _382 = float(_380);
    float _384 = -_344;
    float _386 = _384 + 1.0;
    float _388 = _382 * _386;
    float _390 = _332 * _366;
    bool _392 = _324 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _394 = isnan(_324);
    bool _396 = _392 || _394;
    bool _398 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _400 = _396 || _398;
    float _402 = float(_400);
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _406 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _404;
    bool _408 = _324 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _410 = isnan(_324);
    bool _412 = _408 || _410;
    bool _414 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _416 = _412 || _414;
    float _418 = float(_416);
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _422 = _420 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _424 = -_382;
    float _426 = _424 + 1.0;
    float _428 = -_402;
    float _430 = _428 + 1.0;
    float _432 = _352 * _368;
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _436 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _434;
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _440 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _438;
    float _442 = _418 * _430;
    float _444 = fma(_406, _432, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _446 = fma(_436, _432, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _448 = fma(_440, _432, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _450 = _402 * _426;
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _454 = _452 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _456 = _446 * _442;
    float _458 = _448 * _442;
    float _460 = _444 * _442;
    float _462 = -_418;
    float _464 = _462 + 1.0;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _468 = _466 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _470 = fma(_464, (*spvDescriptorSet0.vp_c9)._m0[143].x, _458);
    float _472 = fma(_464, (*spvDescriptorSet0.vp_c9)._m0[143].y, _456);
    float _474 = fma(_464, (*spvDescriptorSet0.vp_c9)._m0[143].z, _460);
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _478 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _476;
    float _480 = fma(_422, _390, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _482 = fma(_468, _390, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _484 = fma(_454, _390, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _488 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _486;
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _492 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _490;
    float _494 = fma(_480, _450, _470);
    float _496 = fma(_478, _370, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _498 = fma(_488, _370, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _500 = fma(_492, _370, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _502 = fma(_482, _450, _472);
    float _504 = fma(_484, _450, _474);
    float _506 = fma(_496, _388, _494);
    float _508 = fma(_498, _388, _502);
    float _510 = fma(_500, _388, _504);
    float _512 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[146].x, _506);
    float _514 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[146].y, _508);
    float _516 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[146].z, _510);
    bool _518 = !_364;
    float _534;
    if (!_518)
    {
        float _520 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _522 = _160 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _524 = fma(_522, (*spvDescriptorSet0.vp_c9)._m0[11].y, _128);
        float _526 = _524 * _520;
        float _528 = floor(_526);
        float _530 = -_528;
        float _532 = _526 + _530;
        _534 = _532;
        _536 = true;
    }
    else
    {
        _534 = _290;
    }
    _536 = false;
    float _538 = _534;
    float _540 = in.m_69.z;
    float _542 = _300 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _544 = _300 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _546 = _160 * 2.0;
    float _548 = _300 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _550 = fma(_298, (*spvDescriptorSet0.vp_c10)._m0[5].x, _542);
    float _552 = fma(_298, (*spvDescriptorSet0.vp_c10)._m0[4].x, _544);
    float _554 = fma(_298, (*spvDescriptorSet0.vp_c10)._m0[6].x, _548);
    float _556 = fma(_302, (*spvDescriptorSet0.vp_c10)._m0[5].z, _550);
    float _558 = floor(_546);
    float _560 = fma(_302, (*spvDescriptorSet0.vp_c10)._m0[4].z, _552);
    float _562 = _556 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _564 = _160 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _566 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _568 = _164 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _570 = _164 * 2.0;
    float _572 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _574 = fma(_302, (*spvDescriptorSet0.vp_c10)._m0[6].z, _554);
    float _576 = _560 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _578 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _580 = _562 + _578;
    int _582 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _584 = _582 != 0;
    int _586 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _588 = _586 != 0;
    int _590 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _592 = _590 != 0;
    float _594 = -_566;
    float _596 = fma(_564, 2.0, _594);
    float _598 = _164 + _540;
    float _600 = _160 + _540;
    float _602 = fma(_568, -2.0, _572);
    float _604 = _574 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _606 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _608 = _576 + _606;
    float _610 = _580 * _580;
    float _612 = _540 * 2.0;
    float _614 = floor(_570);
    float _616 = _598 + (-1.0);
    float _618 = _600 + (-1.0);
    float _620 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _622 = _604 + _620;
    float _624 = fma(_608, _608, _610);
    bool _626 = _558 > 0.0;
    float _628 = fma(_616, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _630 = fma(_618, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _632 = floor(_612);
    float _634 = fma(_622, _622, _624);
    bool _636 = !_588;
    int _638 = _636 ? 0 : 1;
    float _640 = -_128;
    float _642 = fma(_640, (*spvDescriptorSet0.vp_c9)._m0[76].x, _596);
    bool _644 = _558 >= 0.0;
    bool _646 = isnan(_558);
    bool _648 = _644 || _646;
    bool _650 = isnan(0.0);
    bool _652 = _648 || _650;
    float _654 = in.m_75.x;
    float _656 = in.m_75.y;
    float _658 = in.m_75.z;
    int _660 = abs(_638);
    float _662 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _664 = log2(_662);
    int _666 = _652 ? 0 : 1;
    bool _668 = _614 >= 0.0;
    bool _670 = isnan(_614);
    bool _672 = _668 || _670;
    bool _674 = isnan(0.0);
    bool _676 = _672 || _674;
    int _678 = ~_666;
    int _680 = _678 + 1;
    int _682 = _680 + 1;
    int _684 = _682;
    if (!_626)
    {
        int _686 = ~_666;
        int _688 = _686 + 1;
        _684 = _688;
    }
    int _690 = _684;
    float _692 = rsqrt(_634);
    bool _694 = _614 > 0.0;
    int _696 = _676 ? 0 : 1;
    float _698 = float(_660);
    float _700 = float(_690);
    bool _702 = _632 > 0.0;
    bool _704 = _632 >= 0.0;
    bool _706 = isnan(_632);
    bool _708 = _704 || _706;
    bool _710 = isnan(0.0);
    bool _712 = _708 || _710;
    float _714 = _698 * _700;
    float _716 = _664 * _128;
    float _718 = _580 * _692;
    float _720 = _608 * _692;
    float _722 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _724 = _622 * _692;
    float _726 = exp2(_716);
    float _728 = -_720;
    float _730 = fma(_728, (*spvDescriptorSet0.vp_c9)._m0[18].w, _576);
    float _732 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[78].z, _722);
    float _734 = -_718;
    float _736 = fma(_734, (*spvDescriptorSet0.vp_c9)._m0[18].w, _562);
    int _738 = ~_696;
    int _740 = _738 + 1;
    int _742 = _740 + 1;
    float _744 = -_724;
    float _746 = fma(_744, (*spvDescriptorSet0.vp_c9)._m0[18].w, _604);
    float _748 = _736 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    int _750 = _742;
    uint _753 = as_type<uint>(_724);
    if (!_694)
    {
        int _755 = ~_696;
        int _757 = _755 + 1;
        _750 = _757;
    }
    int _759 = _750;
    float _761 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _763 = 1.0 + _761;
    bool _765 = !_592;
    int _767 = _765 ? 0 : 1;
    float _769 = fma(_730, (*spvDescriptorSet0.vp_c8)._m0[11].x, _748);
    float _771 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _773 = 1.0 / _763;
    bool _775 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _777 = isnan(1.0);
    bool _779 = _775 || _777;
    bool _781 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _783 = _779 || _781;
    float _785 = fma(_746, (*spvDescriptorSet0.vp_c8)._m0[11].z, _769);
    float _787 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[78].w, _771);
    int _789 = abs(_767);
    float _791 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[76].y, _602);
    float _793 = _736 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _795 = _785 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _797 = -_726;
    float _799 = _797 + 1.0;
    bool _801 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _803 = isnan(0.0);
    bool _805 = _801 || _803;
    bool _807 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _809 = _805 || _807;
    float _811 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].w, _787);
    float _813 = fma(_730, (*spvDescriptorSet0.vp_c8)._m0[10].x, _793);
    float _815 = 1.0 / _795;
    float _817 = _809 ? _799 : 0.0;
    float _819 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].z, _732);
    float _821 = fma(_746, (*spvDescriptorSet0.vp_c8)._m0[10].z, _813);
    float _823 = _714 * (-2.0);
    float _825 = float(_789);
    if (_783)
    {
        float _827 = _817 * _773;
        _138 = _827;
    }
    float _829 = _138;
    float _831 = _821 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _833 = float(_759);
    float _835 = fma(_628, _823, _628);
    float _837 = fma(_823, _656, _656);
    float _839 = _831 + _795;
    float _841 = _164 + (-0.5);
    float _843 = _825 * _833;
    int _845 = _712 ? 0 : 1;
    float _847 = _839 * _815;
    float _849 = _847 * 0.5;
    bool _851 = !_584;
    int _853 = _851 ? 0 : 1;
    float _855 = fma(_841, (*spvDescriptorSet0.vp_c9)._m0[196].y, _837);
    float _857 = _843 * (-2.0);
    float _859 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _861 = fma(_849, (*spvDescriptorSet0.vp_c8)._m0[30].w, _859);
    int _863 = ~_845;
    int _865 = _863 + 1;
    int _867 = _865 + 1;
    float _869 = fma(_835, _829, _855);
    int _871 = _867;
    if (!_702)
    {
        int _873 = ~_845;
        int _875 = _873 + 1;
        _871 = _875;
    }
    int _877 = _871;
    float _879 = 1.0 / _861;
    int _881 = abs(_853);
    float _883 = _160 + _164;
    float _885 = _540 + (-0.5);
    float _887 = fma(_857, _658, _658);
    float _889 = -_718;
    float _891 = fma(_889, (*spvDescriptorSet0.vp_c9)._m0[18].w, _580);
    float _893 = float(_881);
    float _895 = _883 + (-1.0);
    float _897 = float(_877);
    float _899 = fma(_630, _857, _630);
    float _901 = fma(_885, (*spvDescriptorSet0.vp_c9)._m0[196].z, _887);
    float _903 = -_720;
    float _905 = fma(_903, (*spvDescriptorSet0.vp_c9)._m0[18].w, _608);
    float _907 = _891 * _891;
    float _909 = _893 * _897;
    float _911 = fma(_895, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _913 = fma(_899, _829, _901);
    float _915 = fma(_905, _905, _907);
    float _917 = _869 * 0.15915493667125701904296875;
    float _919 = in.m_73.x;
    float _921 = in.m_73.y;
    float _923 = in.m_73.z;
    float _925 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _927 = _879 * _925;
    float _929 = _909 * (-2.0);
    float _931 = _160 + (-0.5);
    float _933 = in.m_77.x;
    float _935 = in.m_77.y;
    float _937 = in.m_77.z;
    float _939 = _913 * 0.15915493667125701904296875;
    bool _941 = _927 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _943 = fma(_929, _654, _654);
    float _945 = in.m_79.x;
    float _947 = in.m_79.y;
    float _949 = in.m_79.z;
    bool _951 = _927 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _953 = fma(_911, _929, _911);
    float _955 = fma(_931, (*spvDescriptorSet0.vp_c9)._m0[196].x, _943);
    float _957 = -_724;
    float _959 = fma(_957, (*spvDescriptorSet0.vp_c9)._m0[18].w, _622);
    float _961 = _917 * 6.283185482025146484375;
    float _963 = sin(_961);
    float _965 = fma(_953, _829, _955);
    bool _967 = !_941;
    int _969 = _967 ? 0 : 1;
    float _971 = fma(_959, _959, _915);
    float _973 = _965 * 0.15915493667125701904296875;
    int _975 = 2;
    if (!_941)
    {
        _975 = 1;
    }
    int _977 = _975;
    int _979 = _977;
    if (!_951)
    {
        _979 = _969;
    }
    int _981 = _979;
    float _983 = _917 * 6.283185482025146484375;
    float _985 = cos(_983);
    float _987 = _514 * _921;
    float _989 = _516 * _923;
    int _991 = _981 << 6;
    float _993 = _290 * _290;
    float _995 = _512 * _919;
    float _997 = _939 * 6.283185482025146484375;
    float _999 = cos(_997);
    float _1001 = -_935;
    float _1003 = _1001 + _947;
    float _1005 = -_937;
    float _1007 = _1005 + _949;
    float _1009 = -_933;
    float _1011 = _1009 + _945;
    int _1013 = _991 + 96;
    uint _1015 = uint(int(uint(_1013) >> uint(2)));
    uint _1017 = uint(int(uint(int(_1015)) >> uint(2)));
    int _1019 = int(_1015) & 3;
    float _1021 = (*spvDescriptorSet0.vp_c15)._m0[int(_1017)][_1019];
    int _1023 = int(_1015) + 1;
    uint _1025 = uint(int(uint(_1023) >> uint(2)));
    int _1027 = _1023 & 3;
    float _1029 = (*spvDescriptorSet0.vp_c15)._m0[int(_1025)][_1027];
    float _1031 = fma(_993, _1003, _935);
    float _1033 = _987 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1035 = fma(_993, _1011, _933);
    float _1037 = _973 * 6.283185482025146484375;
    float _1039 = sin(_1037);
    float _1041 = _995 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1043 = fma(_993, _1007, _937);
    float _1045 = _989 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    int _1047 = _991 + 104;
    uint _1049 = uint(int(uint(_1047) >> uint(2)));
    uint _1051 = uint(int(uint(int(_1049)) >> uint(2)));
    int _1053 = int(_1049) & 3;
    float _1055 = (*spvDescriptorSet0.vp_c15)._m0[int(_1051)][_1053];
    int _1057 = int(_1049) + 1;
    uint _1059 = uint(int(uint(_1057) >> uint(2)));
    int _1061 = _1057 & 3;
    float _1063 = (*spvDescriptorSet0.vp_c15)._m0[int(_1059)][_1061];
    float _1065 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1035);
    float _1067 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1043);
    float _1069 = _973 * 6.283185482025146484375;
    float _1071 = cos(_1069);
    float _1073 = _985 * _999;
    float _1075 = _963 * _999;
    float _1077 = sqrt(_971);
    float _1079 = _1039 * _963;
    float _1081 = _1039 * _985;
    float _1083 = _1039 * _999;
    int _1085 = _991 + 48;
    uint _1087 = uint(int(uint(_1085) >> uint(2)));
    uint _1089 = uint(int(uint(int(_1087)) >> uint(2)));
    int _1091 = int(_1087) & 3;
    float _1093 = (*spvDescriptorSet0.vp_c15)._m0[int(_1089)][_1091];
    int _1095 = int(_1087) + 1;
    uint _1097 = uint(int(uint(_1095) >> uint(2)));
    int _1099 = _1095 & 3;
    float _1101 = (*spvDescriptorSet0.vp_c15)._m0[int(_1097)][_1099];
    float _1103 = _939 * 6.283185482025146484375;
    float _1105 = sin(_1103);
    float _1107 = _1071 * _963;
    float _1109 = _1071 * _985;
    float _1111 = _1071 * _999;
    int _1113 = _991 + 56;
    uint _1115 = uint(int(uint(_1113) >> uint(2)));
    uint _1117 = uint(int(uint(int(_1115)) >> uint(2)));
    int _1119 = int(_1115) & 3;
    float _1121 = (*spvDescriptorSet0.vp_c15)._m0[int(_1117)][_1119];
    int _1123 = int(_1115) + 1;
    uint _1125 = uint(int(uint(_1123) >> uint(2)));
    int _1127 = _1123 & 3;
    float _1129 = (*spvDescriptorSet0.vp_c15)._m0[int(_1125)][_1127];
    float _1131 = _692 * _1077;
    float _1133 = _1033 * _1131;
    float _1135 = _1041 * _1131;
    float _1137 = _1045 * _1131;
    float _1139 = -_1107;
    float _1141 = fma(_1105, _1081, _1139);
    float _1143 = -_1081;
    float _1145 = fma(_1105, _1107, _1143);
    float _1147 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1031);
    int _1149 = _991 + 64;
    uint _1151 = uint(int(uint(_1149) >> uint(2)));
    uint _1153 = uint(int(uint(int(_1151)) >> uint(2)));
    int _1155 = int(_1151) & 3;
    float _1157 = (*spvDescriptorSet0.vp_c15)._m0[int(_1153)][_1155];
    int _1159 = int(_1151) + 1;
    uint _1161 = uint(int(uint(_1159) >> uint(2)));
    int _1163 = _1159 & 3;
    float _1165 = (*spvDescriptorSet0.vp_c15)._m0[int(_1161)][_1163];
    float _1167 = _1137 * _1067;
    float _1169 = _1135 * _1065;
    float _1171 = _1133 * _1147;
    float _1173 = fma(_1105, _1109, _1079);
    float _1175 = fma(_1105, _1079, _1109);
    float _1177 = _1111 * _1171;
    float _1179 = -_1171;
    float _1181 = _1105 * _1179;
    int _1183 = _991 + 72;
    uint _1185 = uint(int(uint(_1183) >> uint(2)));
    uint _1187 = uint(int(uint(int(_1185)) >> uint(2)));
    int _1189 = int(_1185) & 3;
    float _1191 = (*spvDescriptorSet0.vp_c15)._m0[int(_1187)][_1189];
    int _1193 = int(_1185) + 1;
    uint _1195 = uint(int(uint(_1193) >> uint(2)));
    int _1197 = _1193 & 3;
    float _1199 = (*spvDescriptorSet0.vp_c15)._m0[int(_1195)][_1197];
    float _1201 = _1083 * _1171;
    float _1203 = fma(_1173, _1169, _1177);
    float _1205 = fma(_1073, _1169, _1181);
    float _1207 = fma(_1141, _1169, _1201);
    float _1209 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _1211 = fma(_1145, _1167, _1203);
    int _1213 = _991 + 80;
    uint _1215 = uint(int(uint(_1213) >> uint(2)));
    uint _1217 = uint(int(uint(int(_1215)) >> uint(2)));
    int _1219 = int(_1215) & 3;
    float _1221 = (*spvDescriptorSet0.vp_c15)._m0[int(_1217)][_1219];
    int _1223 = int(_1215) + 1;
    uint _1225 = uint(int(uint(_1223) >> uint(2)));
    int _1227 = _1223 & 3;
    float _1229 = (*spvDescriptorSet0.vp_c15)._m0[int(_1225)][_1227];
    float _1231 = fma(_1075, _1167, _1205);
    float _1233 = _736 + _1209;
    float _1235 = _1211 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1237 = _1211 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1239 = fma(_1175, _1167, _1207);
    float _1241 = _1233 * _1029;
    float _1243 = fma(_1231, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1235);
    float _1245 = fma(_1231, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1237);
    float _1247 = _1211 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    int _1249 = _991 + 88;
    uint _1251 = uint(int(uint(_1249) >> uint(2)));
    uint _1253 = uint(int(uint(int(_1251)) >> uint(2)));
    int _1255 = int(_1251) & 3;
    float _1257 = (*spvDescriptorSet0.vp_c15)._m0[int(_1253)][_1255];
    int _1259 = int(_1251) + 1;
    uint _1261 = uint(int(uint(_1259) >> uint(2)));
    int _1263 = _1259 & 3;
    float _1265 = (*spvDescriptorSet0.vp_c15)._m0[int(_1261)][_1263];
    float _1267 = fma(_1239, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1243);
    float _1269 = fma(_730, _1021, _1241);
    float _1271 = fma(_1239, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1245);
    float _1273 = _604 + _1267;
    float _1275 = fma(_746, _1055, _1269);
    float _1277 = _576 + _1271;
    float _1279 = fma(_1231, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1247);
    float _1281 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1283 = _1273 + _1281;
    float _1285 = _1275 + _1063;
    float _1287 = _1233 * _1101;
    float _1289 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1291 = _1277 + _1289;
    float _1293 = _1283 * _1283;
    float _1295 = fma(_1239, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1279);
    float _1297 = fma(_730, _1093, _1287);
    float _1299 = 1.0 / _1285;
    float _1301 = fma(_1291, _1291, _1293);
    float _1303 = fma(_746, _1121, _1297);
    float _1305 = _1233 * _1165;
    float _1307 = fma(_730, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1309 = _1303 + _1129;
    float _1311 = sqrt(_1301);
    float _1313 = fma(_730, _1157, _1305);
    float _1315 = fma(_746, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1317 = fma(_746, _1191, _1313);
    float _1319 = _1309 * _1299;
    float _1321 = floor(_1307);
    float _1323 = _1317 + _1199;
    bool _1325 = _1319 >= 0.0;
    float _1327 = _1233 * _1229;
    float _1329 = _1323 * _1299;
    bool _1331 = _1311 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1333 = floor(_1315);
    float _1335 = fma(_730, _1221, _1327);
    bool _1337 = _1319 <= 1.0;
    bool _1339 = _1337 && _1325;
    bool _1341 = _1329 >= 0.0;
    bool _1343 = _1341 && _1339;
    float _1345 = fma(_746, _1257, _1335);
    float _1347 = -_1321;
    float _1349 = _1307 + _1347;
    bool _1351 = _1329 <= 1.0;
    bool _1353 = _1351 && _1343;
    float _1355 = _1345 + _1265;
    float _1357 = _1257;
    float _1359 = _1265;
    float _1361 = as_type<float>(_981);
    float _1363 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (!_1331)
    {
        _1357 = _1277;
    }
    float _1365 = _1357;
    float _1367 = _1365;
    if (!_1331)
    {
        _1359 = _1273;
    }
    float _1369 = _1359;
    float _1371 = -_1333;
    float _1373 = _1315 + _1371;
    bool _1375 = !_1331;
    float _1377 = _1369;
    if (!_1375)
    {
        float _1379 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1381 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1383 = _1311 + _1381;
        float _1385 = _562 + _1295;
        float _1387 = _1385 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1389 = rsqrt(_1301);
        float _1391 = _1383 * _1379;
        float _1393 = _1391 * 0.15915493667125701904296875;
        float _1395 = _1393 * 6.283185482025146484375;
        float _1397 = sin(_1395);
        float _1399 = fma(_1397, _1387, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1401 = _1389 * _1399;
        float _1403 = fma(_1291, _1401, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1405 = fma(_1283, _1401, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1367 = _1403;
        _1377 = _1405;
    }
    float _1407 = _1367;
    float _1409 = _1377;
    float _1411 = _1355 * _1299;
    float _1413 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _1415 = _1407 + _1413;
    float _1417 = fma(_1409, 6.2500002968590706586837768554688e-05, 0.5);
    float _1419 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _1421 = _1409 + _1419;
    float _1423 = fma(_1407, 6.2500002968590706586837768554688e-05, 0.5);
    float _1425 = fma(_1415, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _1427 = _1411;
    if (_1353)
    {
        float _1429 = float(_981);
        _1361 = _1429;
    }
    float _1431 = _1361;
    float _1433 = fma(_1421, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _5035 = float2(_1423, _1417);
    float _1435 = dm_bs(spvDescriptorSet0.vp_t_tcb_2C.sample(spvDescriptorSet0.vp_t_tcb_2CSmplr, select(_5035, float2(0.0), isnan(_5035)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_2C, spvDescriptorSet0.vp_t_tcb_2CSmplr_w, select(_5035, float2(0.0), isnan(_5035)), level(0.0)).y;
    float _1437 = _1277;
    if (_1353)
    {
        float _1439 = rint(_1431);
        float _1441 = precise::max(_1439, 0.0);
        uint _1443 = uint(_1441);
        uint _1445 = clamp(_1443, 0u, 65535u);
        _1437 = as_type<float>(_1445);
    }
    float _1447 = _1437;
    float2 _5062 = float2(_1425, _1433);
    float _1449 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_5062, float2(0.0), isnan(_5062)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_5062, float2(0.0), isnan(_5062)), level(0.0)).x;
    float2 _5070 = float2(_1349, _1373);
    float _1451 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5070, float2(0.0), isnan(_5070)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5070, float2(0.0), isnan(_5070)), level(0.0)).x;
    float _1453 = _1447;
    if (_1353)
    {
        float3 _5084 = float3(_1319, _1329, float(as_type<int>(_1447)));
        float3 _5088 = select(_5084, float3(0.0), isnan(_5084));
        float _1455 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5088.xy, uint(rint(_5088.z)), _1411, level(0.0));
        _1453 = _1455;
    }
    float _1457 = _1453;
    float _1459 = _1233 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1461 = _1233 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1463 = -_720;
    float _1465 = fma(_1463, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1407);
    float _1467 = -_724;
    float _1469 = fma(_1467, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1409);
    float _1471 = fma(_730, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1459);
    float _1473 = fma(_730, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1461);
    float _1475 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1477 = _1469 + _1475;
    float _1479 = fma(_746, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1471);
    float _1481 = fma(_746, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1473);
    float _1483 = _1479 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1485 = _1481 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1487 = trunc(_1483);
    int _1489 = int(_1487);
    float _1491 = trunc(_1485);
    int _1493 = int(_1491);
    int _1495 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1497 = _1489 + _1495;
    int _1499 = _1497 + 1;
    bool _1501 = _1499 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1503 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1505 = _1493 + _1503;
    int _1507 = _1505 + 1;
    int _1509 = _1499 | _1507;
    bool _1511 = _1509 < 0;
    bool _1513 = _1511 || _1501;
    float _1515 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1517 = _1465 + _1515;
    bool _1519 = _1507 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1521 = _1519 || _1513;
    float _1523 = as_type<float>(_1499);
    float _1525 = as_type<float>(_1507);
    float _1527 = _1483;
    if (!_1521)
    {
        int _1529 = _1507 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1531 = _1529 + _1499;
        _753 = uint(_1531);
    }
    uint _1533 = _753;
    float _1535 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1537 = fma(_1435, 2000.0, (*spvDescriptorSet0.vp_c13)._m0[0].x);
    float _1539 = fma(_1449, 100.0, _1537);
    float _1541 = -_718;
    float _1543 = fma(_1541, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1539);
    float _1545 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1547 = _1543 + _1545;
    float _1549 = _1547 * _1547;
    float _1551 = fma(_1517, _1517, _1549);
    float _1553 = fma(_1477, _1477, _1551);
    float _1555 = rsqrt(_1553);
    float _1557 = sqrt(_1553);
    float _1559 = _1555 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1561 = _1517 * _1559;
    float _1563 = _1477 * _1559;
    float _1565 = _1561 * _1561;
    float _1567 = _1563 * _1563;
    float _1569 = _1565 + _1567;
    float _1571 = sqrt(_1569);
    bool _1573 = _1571 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1575 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1577 = _1571 + _1575;
    float _1579 = _1555;
    float _1581 = _1569;
    float _1583 = _1577;
    float _1585 = _1547;
    float _1587 = _1537;
    if (_1573)
    {
        float _1589 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1579 = _1589;
    }
    float _1591 = _1579;
    if (_1573)
    {
        float _1593 = rsqrt(_1569);
        _1581 = _1593;
    }
    float _1595 = _1581;
    int _1597 = as_type<int>(_1595);
    if (_1573)
    {
        float _1599 = _1577 * _1591;
        _1583 = _1599;
    }
    float _1601 = _1583;
    if (_1573)
    {
        float _1603 = _1601 * 0.15915493667125701904296875;
        _1523 = _1603;
    }
    float _1605 = _1523;
    float _1607 = _1477;
    if (_1573)
    {
        float _1609 = _1605 * 6.283185482025146484375;
        float _1611 = sin(_1609);
        _1607 = _1611;
    }
    float _1613 = _1607;
    float _1615 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1617 = precise::max(0.0, _1615);
    float _1619 = _1591;
    float _1621 = _1617;
    if (_1573)
    {
        float _1623 = _1605 * 6.283185482025146484375;
        float _1625 = cos(_1623);
        _1619 = _1625;
    }
    float _1627 = _1619;
    float _1629 = -_1559;
    float _1631 = -_1617;
    float _1633 = fma(_1547, _1629, _1631);
    float _1635 = _1633;
    if (_1573)
    {
        float _1637 = _1633 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1585 = _1637;
    }
    float _1639 = _1585;
    float _1641 = _1543 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1643 = _1613;
    float _1645 = _1639;
    if (_1573)
    {
        float _1647 = fma(_1613, _1639, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1525 = _1647;
    }
    float _1649 = _1525;
    float _1651 = _1649;
    if (!_1573)
    {
        _1643 = _1561;
    }
    float _1653 = _1643;
    float _1655 = _1653;
    if (!_1573)
    {
        _1645 = _1567;
    }
    float _1657 = _1645;
    float _1659 = _1657;
    if (_1573)
    {
        float _1661 = _1627 + (-1.0);
        _1621 = _1661;
    }
    float _1663 = _1621;
    float _1665 = _1663;
    if (_1573)
    {
        float _1667 = _1595 * _1649;
        _1651 = _1667;
    }
    float _1669 = _1651;
    int _1671 = as_type<int>(_1669);
    if (!_1521)
    {
        uint _1673 = uint(int(uint(int(_1533)) >> uint(2)));
        _1597 = int(_1673);
    }
    int _1675 = _1597;
    float _1677 = fma(_1465, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1641);
    if (_1573)
    {
        float _1679 = _1663 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1587 = _1679;
    }
    float _1681 = _1587;
    float _1683 = _1681;
    if (!_1573)
    {
        _1665 = _1563;
    }
    float _1685 = _1665;
    float _1687 = _1685;
    if (_1573)
    {
        float _1689 = _1561 * _1669;
        _1655 = _1689;
    }
    float _1691 = _1655;
    if (_1573)
    {
        float _1693 = _1563 * _1669;
        _1687 = _1693;
    }
    float _1695 = _1687;
    if (!_1521)
    {
        int _1697 = int(_1533) << 2;
        _1671 = _1697;
    }
    int _1699 = _1671;
    int _1701 = _1699;
    if (_1573)
    {
        float _1703 = fma(_1633, _1627, _1681);
        _1635 = _1703;
    }
    float _1705 = _1635;
    if (!_1573)
    {
        _1683 = _1565;
    }
    float _1707 = _1683;
    float _1709 = _1707;
    if (_1573)
    {
        float _1711 = _1691 * _1691;
        _1709 = _1711;
    }
    float _1713 = _1709;
    if (!_1521)
    {
        int _1715 = 12 & _1699;
        _1701 = _1715;
    }
    int _1717 = _1701;
    if (_1573)
    {
        float _1719 = _1695 * _1695;
        _1659 = _1719;
    }
    float _1721 = _1659;
    float _1723 = fma(_1469, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1677);
    float _1725 = fma(_1705, _1705, _1713);
    float _1727 = _1725;
    if (!_1521)
    {
        int _1729 = _1675 << 4;
        int _1731 = _1729 + _1717;
        _1363 = as_type<float>(_1731);
    }
    float _1733 = _1363;
    float _1735 = _1543 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1737 = _1543 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1739 = _1725 + _1721;
    float _1741 = _1543 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1743 = fma(_1465, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1735);
    float _1745 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1747 = fma(_1557, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1745);
    float _1749 = precise::clamp(_1747, 0.0, 1.0);
    float _1751 = _1723 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1753 = fma(_1465, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1741);
    float _1755 = fma(_1469, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1743);
    float _1757 = rsqrt(_1739);
    float _1759 = -_1749;
    float _1761 = _1759 + 1.0;
    float _1763 = fma(_1469, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1753);
    float _1765 = _1755 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1767 = fma(_1465, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1737);
    float _1769 = _1751 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1771 = _1763 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1773 = _1765 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1775 = abs(_1761);
    float _1777 = log2(_1775);
    float _1779 = fma(_1469, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1767);
    float _1781 = -_1769;
    float _1783 = fma(_1781, _1535, 1.0);
    float _1785 = fma(_1771, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1773);
    float _1787 = _1733;
    float _1789 = _1783;
    if (!_1521)
    {
        int _1791 = as_type<int>(_1733) + 400;
        uint _1793 = uint(int(uint(_1791) >> uint(2)));
        uint _1795 = uint(int(uint(int(_1793)) >> uint(2)));
        int _1797 = int(_1793) & 3;
        float _1799 = (*spvDescriptorSet0.vp_c15)._m0[int(_1795)][_1797];
        _1787 = _1799;
    }
    float _1801 = _1787;
    float _1803 = _1779 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1805 = fma(_1751, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1785);
    float _1807 = _1757 * _1691;
    if (!_1521)
    {
        float _1809 = floor(_1485);
        _1727 = _1809;
    }
    float _1811 = _1727;
    float _1813 = _1757 * _1695;
    float _1815 = fma(_1803, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1805);
    float _1817 = _1757 * _1705;
    float _1819 = _1807 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1821 = _1777 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1823 = _1627;
    if (!_1521)
    {
        float _1825 = floor(_1483);
        _1823 = _1825;
    }
    float _1827 = _1823;
    float _1829 = -_1819;
    float _1831 = fma(_1817, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1829);
    float _1833 = -_1813;
    float _1835 = fma(_1833, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1831);
    float _1837 = _1765 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1839 = exp2(_1821);
    float _1841 = fma(_1835, -0.5, 0.5);
    float _1843 = fma(_1835, 0.5, 0.5);
    float _1845 = fma(_1843, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1847 = log2(_1783);
    if (!_1521)
    {
        float _1849 = -_1827;
        float _1851 = _1483 + _1849;
        _1527 = _1851;
    }
    float _1853 = _1527;
    float _1855 = fma(_1843, _1845, -0.212114393711090087890625);
    float _1857 = fma(_1843, _1855, 1.570728778839111328125);
    float _1859 = 1.0 / _1815;
    if (!_1521)
    {
        float _1861 = -_1811;
        float _1863 = _1485 + _1861;
        _1789 = _1863;
    }
    float _1865 = _1789;
    float _1867 = _1765 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1869 = fma(_1771, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1837);
    float _1871 = _1817 + 1.0;
    float _1873 = fma(_1771, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1867);
    float _1875 = fma(_1751, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1869);
    float _1877 = sqrt(_1841);
    float _1879 = -_1817;
    float _1881 = fma(_1839, _1871, _1879);
    float _1883 = fma(_1751, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1873);
    float _1885 = fma(_1803, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1875);
    float _1887 = _1847 * 0.693147182464599609375;
    float _1889 = fma(_1881, 0.5, 0.5);
    float _1891 = fma(_1803, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1883);
    float _1893 = _1885 * _1859;
    float _1895 = _1887 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1897 = _1891 * _1859;
    float _1899 = _1883;
    float _1901 = _1885;
    if (!_1521)
    {
        float _1903 = rint(_1801);
        float _1905 = precise::max(_1903, 0.0);
        uint _1907 = uint(_1905);
        uint _1909 = clamp(_1907, 0u, 65535u);
        _1899 = as_type<float>(_1909);
    }
    float _1911 = _1899;
    float _1913 = fma(_1893, 0.5, 0.5);
    float _1915 = fma(_1897, -0.5, 0.5);
    float _1917 = _1877 * 0.636619746685028076171875;
    float _1919 = -_1857;
    float _1921 = fma(_1917, _1919, 1.0);
    float3 _5877 = float3(_1913, _1915, _1895);
    float _1923 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5877, float3(0.0), isnan(_5877)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5877, float3(0.0), isnan(_5877)), level(0.0)).x;
    float3 _5886 = float3(_1913, _1915, _1895);
    float4 _1926 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5886, float3(0.0), isnan(_5886)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5886, float3(0.0), isnan(_5886)), level(0.0)).xyzw;
    float _1928 = _1926.x;
    float _1930 = _1926.y;
    float _1932 = _1926.z;
    float _1934 = _1926.w;
    float2 _5902 = float2(_1921, _1889);
    float3 _1938 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5902, float2(0.0), isnan(_5902)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5902, float2(0.0), isnan(_5902)), level(0.0)).xyz;
    float _1940 = _1938.x;
    float _1942 = _1938.y;
    float _1944 = _1938.z;
    float _1946 = _1865;
    if (!_1521)
    {
        float3 _5923 = float3(_1853, _1865, float(as_type<int>(_1911)));
        float3 _5925 = select(_5923, float3(0.0), isnan(_5923));
        float _1948 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5925.xy, uint(rint(_5925.z)), level(0.0)), spvDescriptorSet0.dm_border, 6u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5925.xy, uint(rint(_5925.z)), level(0.0)).x;
        _1946 = _1948;
    }
    float _1950 = _1946;
    float _1952 = in.m_69.w;
    float _1954 = _1777 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1956 = in.m_81.y;
    bool _1958 = _164 > 0.5;
    float _1960 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1962 = _1960 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1964 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1966 = _1964 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1968 = 1.0 / _1962;
    float _1970 = -_1451;
    float _1972 = _1970 + 1.0;
    float _1974 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1976 = _1974 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    int _1978 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1980 = _1978 != 0;
    int _1982 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1984 = _1982 != 0;
    float _1986 = 1.0 / _1966;
    float _1988 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1990 = _1988 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    int _1992 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1994 = _1992 != 0;
    bool _1996 = _538 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1998 = isnan(_538);
    bool _2000 = _1996 || _1998;
    bool _2002 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _2004 = _2000 || _2002;
    int _2006 = _2004 ? 1065353216 : 0;
    bool _2008 = _1952 > 0.5;
    float _2010 = 1.0 / _1990;
    float _2012 = -_1956;
    float _2014 = _2012 + 1.0;
    int _2016 = _2008 ? as_type<int>(_2014) : as_type<int>(_1956);
    float _2018 = 1.0 / _1976;
    int _2020 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2022 = _2020 != 0;
    float _2024 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _2026 = _538 + _2024;
    float _2028 = _2022 ? as_type<float>(_2016) : _1956;
    float _2030 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _2032 = _2030 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _2034 = _1956;
    bool _2036 = _1958;
    bool _2038 = _2022;
    int _2040 = _2006;
    if (_1980)
    {
        float _2042 = _1958 ? _2014 : _1956;
        _2034 = _2042;
    }
    float _2044 = _2034;
    float _2046 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _2048 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _2046;
    float _2050 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _2052 = _2050 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    if (_1984)
    {
        bool _2054 = _540 > 0.5;
        _2036 = _2054;
    }
    bool _2056 = _2036;
    float _2058 = _2032 * _2010;
    if (_1994)
    {
        bool _2060 = _160 > 0.5;
        _2038 = _2060;
    }
    bool _2062 = _2038;
    float _2064 = _2052 * _1968;
    float _2066 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _2068 = _538 + _2066;
    bool _2070 = _538 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _2072 = isnan(_538);
    bool _2074 = _2070 || _2072;
    bool _2076 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _2078 = _2074 || _2076;
    float _2080 = float(_2078);
    float _2082 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _2084 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _2082;
    float _2086 = _2048 * _1986;
    float _2088 = fma(_2064, _2068, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    bool _2090 = _538 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _2092 = isnan(_538);
    bool _2094 = _2090 || _2092;
    bool _2096 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _2098 = _2094 || _2096;
    float _2100 = float(_2098);
    float _2102 = _2084 * _2018;
    float _2104 = -_2080;
    float _2106 = _2104 + 1.0;
    float _2108 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _2110 = _538 + _2108;
    bool _2112 = _538 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _2114 = isnan(_538);
    bool _2116 = _2112 || _2114;
    bool _2118 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _2120 = _2116 || _2118;
    float _2122 = float(_2120);
    float _2124 = -_2100;
    float _2126 = _2124 + 1.0;
    float _2128 = fma(_2086, _2026, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _2130 = _2100 * _2106;
    float _2132 = fma(_2102, _2110, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _2134 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _2136 = _538 + _2134;
    bool _2138 = _538 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _2140 = isnan(_538);
    bool _2142 = _2138 || _2140;
    bool _2144 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _2146 = _2142 || _2144;
    float _2148 = float(_2146);
    float _2150 = _2122 * _2126;
    float _2152 = -_2122;
    float _2154 = _2152 + 1.0;
    float _2156 = in.m_81.x;
    float _2158 = fma(_2058, _2136, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _2160 = -_2148;
    float _2162 = _2160 + 1.0;
    float _2164 = _2148 * _2154;
    bool _2166 = _1031 != 0.0;
    bool _2168 = isnan(_1031);
    bool _2170 = _2166 || _2168;
    bool _2172 = isnan(0.0);
    bool _2174 = _2170 || _2172;
    float _2176 = in.m_83.x;
    float _2178 = in.m_83.y;
    float _2180 = in.m_83.z;
    float _2182 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2184 = as_type<float>(_2006) * _2162;
    bool _2186 = _1035 == 0.0;
    bool _2188 = !_2174;
    bool _2190 = _2186 && _2188;
    float _2192 = _2128 * _2184;
    bool _2194 = _1043 == 0.0;
    bool _2196 = _2194 && _2190;
    float _2198 = -as_type<float>(_2006);
    float _2200 = _2198 + 1.0;
    float _2202 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2204 = fma(_2200, (*spvDescriptorSet0.vp_c9)._m0[115].x, _2192);
    float _2206 = fma(_2088, _2164, _2204);
    float _2208 = _2182 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2210 = _2028 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2212 = _2182;
    float _2214 = _2156;
    if (_1994)
    {
        float _2216 = -_2156;
        float _2218 = _2216 + 1.0;
        _2040 = as_type<int>(_2218);
    }
    int _2220 = _2040;
    if (!_1994)
    {
        _2212 = _2156;
    }
    float _2222 = _2212;
    float _2224 = fma(_2208, _2044, -0.5);
    int _2226 = 0;
    float _2228 = _2222;
    if (_1984)
    {
        float _2230 = -_2156;
        float _2232 = _2230 + 1.0;
        _2226 = as_type<int>(_2232);
    }
    int _2234 = _2226;
    float _2236 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2238 = _2178;
    float _2240 = _2176;
    float _2242 = _2180;
    if (!_2196)
    {
        float _2244 = fma(_1031, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2178);
        _2238 = _2244;
    }
    float _2246 = _2238;
    if (_1994)
    {
        float _2248 = _2062 ? as_type<float>(_2220) : _2156;
        _2228 = _2248;
    }
    float _2250 = _2228;
    float _2252 = _2202 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    if (!_2196)
    {
        float _2254 = fma(_1035, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2176);
        _2240 = _2254;
    }
    float _2256 = _2240;
    float _2258 = -_2246;
    float _2260 = _1105 * _2258;
    float _2262 = fma(_2252, _2250, -0.5);
    float _2264 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2266 = fma(_1073, _2256, _2260);
    float _2268 = fma(_2132, _2150, _2206);
    float _2270 = fma(_819, _2262, _642);
    float _2272 = _1111 * _2246;
    float _2274 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2276 = abs(_927);
    float _2278 = log2(_2276);
    if (_1984)
    {
        float _2280 = _2056 ? as_type<float>(_2234) : _2156;
        _2214 = _2280;
    }
    float _2282 = _2214;
    float _2284 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2286 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2288 = -_791;
    float _2290 = fma(_811, _2224, _2288);
    if (!_2196)
    {
        float _2292 = fma(_1043, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2180);
        _2242 = _2292;
    }
    float _2294 = _2242;
    float _2296 = _2282 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2298 = fma(_1173, _2256, _2272);
    float _2300 = _2274 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2302 = _2284 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2304 = _2286 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2306 = _1083 * _2246;
    float _2308 = _2290 + 0.5;
    float _2310 = _2210 * _2236;
    float _2312 = _2296 * _2264;
    float _2314 = _2270 + 0.5;
    float _2316 = fma(_1145, _2294, _2298);
    out.m_85.x = _2300;
    out.m_85.y = _2302;
    out.m_85.z = _2304;
    float _2318 = _2278 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2320 = fma(_1075, _2294, _2266);
    float _2322 = fma(_1141, _2256, _2306);
    out.m_87.x = _2314;
    out.m_87.y = _2308;
    out.m_87.z = _2312;
    out.m_87.w = _2310;
    float _2324 = fma(_2158, _2130, _2268);
    float _2326 = exp2(_2318);
    float _2328 = fma(_1175, _2294, _2322);
    float _2330 = fma(_2080, (*spvDescriptorSet0.vp_c9)._m0[119].x, _2324);
    float _2332 = in.m_79.w;
    float _2334 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2336 = _2316 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2338 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2340 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2342 = _2334 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2344 = fma(_2320, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2336);
    float _2346 = _2316 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2348 = _2338 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2350 = _2340 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2352 = fma(_2328, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2344);
    float _2354 = fma(_2320, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2346);
    float _2356 = _2330 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2358 = exp2(_1954);
    float _2360 = fma(_2328, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2354);
    float _2362 = _1765 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_89.x = _2342;
    out.m_89.y = _2348;
    out.m_89.z = _2350;
    out.m_89.w = _2356;
    bool _2364 = _927 <= 8000.0;
    bool _2366 = isnan(_927);
    bool _2368 = _2364 || _2366;
    bool _2370 = isnan(8000.0);
    bool _2372 = _2368 || _2370;
    float _2374 = float(_2372);
    float _2376 = fma(_1771, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2362);
    float _2378 = _2316 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2380 = fma(_2326, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2382 = precise::clamp(_2380, 0.0, 1.0);
    float _2384 = _2362;
    if (!_1353)
    {
        _2384 = 1.0;
    }
    float _2386 = _2384;
    float _2388 = fma(_1751, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2376);
    out.m_91.w = _2332;
    float _2390 = fma(_2320, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2378);
    float _2392 = _2386;
    if (_1353)
    {
        bool _2394 = _1457 >= _1411;
        bool _2396 = isnan(_1457);
        bool _2398 = _2394 || _2396;
        bool _2400 = isnan(_1411);
        bool _2402 = _2398 || _2400;
        float _2404 = float(_2402);
        _2392 = _2404;
    }
    float _2406 = _2392;
    float _2408 = fma(_1803, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2388);
    float _2410 = fma(_2328, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2390);
    float _2412 = fma(_2382, -2.0, 3.0);
    float _2414 = _2382 * _2382;
    float _2416 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _2418 = _2408 + _2416;
    float _2420 = _1815 * 0.5;
    float _2422 = _2414 * _2412;
    float _2424 = _1885 + _1815;
    float _2426 = _1815 + _2418;
    float _2428 = fma(_1891, -0.5, _2420);
    out.gl_Position.x = _1885;
    out.gl_Position.y = _1891;
    out.gl_Position.z = _2418;
    out.gl_Position.w = _1815;
    float _2430 = _2424 * 0.5;
    float _2432 = _2426 * 0.5;
    float _2434 = -_2422;
    float _2436 = _2434 + 1.0;
    out.m_93.x = _2430;
    out.m_93.y = _2428;
    out.m_93.z = _2432;
    out.m_93.w = _1815;
    float _2438 = fma(_2436, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2422);
    float _2440 = -_2358;
    float _2442 = _2440 + 1.0;
    float _2444 = _2374 * _2438;
    float _2446 = _2442 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2448 = _2430;
    float _2450 = _2446;
    if (_1521)
    {
        _1901 = 1.0;
    }
    float _2452 = _1901;
    float _2454 = _2444 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2456 = _1972 * _2454;
    float _2458 = precise::clamp(_2456, 0.0, 1.0);
    float _2460 = _2452;
    if (!_1521)
    {
        int _2462 = int(_1533) << 4;
        int _2464 = _2462 + 2048;
        uint _2466 = uint(int(uint(_2464) >> uint(2)));
        uint _2468 = uint(int(uint(int(_2466)) >> uint(2)));
        int _2470 = int(_2466) & 3;
        float _2472 = (*spvDescriptorSet0.vp_c15)._m0[int(_2468)][_2470];
        int _2474 = int(_2466) + 1;
        uint _2476 = uint(int(uint(_2474) >> uint(2)));
        int _2478 = _2474 & 3;
        float _2480 = (*spvDescriptorSet0.vp_c15)._m0[int(_2476)][_2478];
        int _2482 = _2464 + 8;
        uint _2484 = uint(int(uint(_2482) >> uint(2)));
        uint _2486 = uint(int(uint(int(_2484)) >> uint(2)));
        int _2488 = int(_2484) & 3;
        float _2490 = (*spvDescriptorSet0.vp_c15)._m0[int(_2486)][_2488];
        int _2492 = int(_2484) + 1;
        uint _2494 = uint(int(uint(_2492) >> uint(2)));
        int _2496 = _2492 & 3;
        float _2498 = (*spvDescriptorSet0.vp_c15)._m0[int(_2494)][_2496];
        float _2500 = _1233 * _2480;
        float _2502 = fma(_730, _2472, _2500);
        float _2504 = fma(_746, _2490, _2502);
        float _2506 = _2504 + _2498;
        float _2508 = precise::clamp(_2506, 0.0, 1.0);
        float _2510 = -_2508;
        float _2512 = _2510 + _1950;
        float _2514 = fma(_2512, 500.0, 1.5);
        float _2516 = exp2(_2514);
        float _2518 = 0.0 + _2516;
        float _2520 = precise::clamp(_2518, 0.0, 1.0);
        _2460 = _2520;
        _2448 = _2490;
    }
    float _2522 = _2460;
    float _2524 = _2448;
    float _2526 = _2446 * _1923;
    float _2528 = _2406 * _2522;
    float _2530 = -_2458;
    float _2532 = fma(_2530, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2534 = -_2446;
    float _2536 = _2534 + 1.0;
    float _2538 = _1934 * _2526;
    float _2540 = _1944 * _2526;
    float _2542 = -_2528;
    float _2544 = fma(_2542, _2532, 1.0);
    float _2546 = precise::clamp(_2544, 0.0, 1.0);
    out.m_95.x = _2352;
    out.m_95.y = _2360;
    out.m_95.z = _2410;
    float _2548 = fma(_1940, _2538, _1928);
    float _2550 = fma(_1942, _2538, _1930);
    float _2552 = _2546 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2554 = _1934 * _2536;
    float _2556 = fma(_1934, _2540, _1932);
    bool _2558 = _1557 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2560 = isnan(_1557);
    bool _2562 = _2558 || _2560;
    bool _2564 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2566 = _2562 || _2564;
    out.m_97.x = _2552;
    out.m_99.x = _2548;
    out.m_99.y = _2550;
    out.m_99.z = _2556;
    out.m_99.w = _2554;
    float _2568 = _2524;
    float _2570 = _2538;
    float _2572 = _2536;
    float _2574 = _2546;
    if (!_2566)
    {
        _1427 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2576 = _1427;
    float _2578 = _2576;
    float _2580 = _2576;
    if (!_2566)
    {
        _2568 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2582 = _2568;
    float _2584 = _2582;
    float _2586 = _2582;
    if (!_2566)
    {
        _2570 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2588 = _2570;
    float _2590 = _2588;
    float _2592 = _2588;
    if (!_2566)
    {
        _2572 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2594 = _2572;
    float _2596 = _2594;
    float _2598 = _2594;
    if (!_2566)
    {
        _2450 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2600 = _2450;
    float _2602 = _2600;
    float _2604 = _2600;
    if (!_2566)
    {
        _2574 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2606 = _2574;
    bool _2608 = !_2566;
    float _2610 = _2606;
    float _2612 = _2606;
    if (!_2608)
    {
        bool _2614 = _1557 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2616 = isnan(_1557);
        bool _2618 = _2614 || _2616;
        bool _2620 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2622 = _2618 || _2620;
        if (!_2622)
        {
            float _2624 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2626 = _1557 + _2624;
            float _2628 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2630 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2628;
            float _2632 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2634 = _2632 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2636 = 1.0 / _2630;
            float _2638 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2640 = _2638 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2642 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2644 = _2642 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2646 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2648 = _2646 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2650 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2652 = _2650 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2654 = _2626 * _2636;
            float _2656 = precise::clamp(_2654, 0.0, 1.0);
            float _2658 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2660 = _2658 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2662 = fma(_2656, _2634, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2664 = fma(_2656, _2660, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2666 = fma(_2656, _2640, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2668 = fma(_2656, _2644, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2670 = fma(_2656, _2648, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2672 = fma(_2656, _2652, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2586 = _2666;
            _2604 = _2670;
            _2580 = _2662;
            _2598 = _2668;
            _2592 = _2664;
            _2612 = _2672;
            _2674 = true;
        }
        else
        {
            bool _2676 = _1557 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2678 = isnan(_1557);
            bool _2680 = _2676 || _2678;
            bool _2682 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2684 = _2680 || _2682;
            if (!_2684)
            {
                _2578 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2686 = _2578;
            _2580 = _2686;
            if (!_2684)
            {
                _2584 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2688 = _2584;
            _2586 = _2688;
            if (!_2684)
            {
                _2590 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2690 = _2590;
            _2592 = _2690;
            if (!_2684)
            {
                _2596 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2692 = _2596;
            _2598 = _2692;
            if (!_2684)
            {
                _2602 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2694 = _2602;
            _2604 = _2694;
            if (!_2684)
            {
                _2610 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2696 = _2610;
            bool _2698 = !_2684;
            _2612 = _2696;
            if (!_2698)
            {
                bool _2700 = _1557 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2702 = isnan(_1557);
                bool _2704 = _2700 || _2702;
                bool _2706 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2708 = _2704 || _2706;
                if (!_2708)
                {
                    float _2710 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2712 = _1557 + _2710;
                    float _2714 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2716 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2714;
                    float _2718 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2720 = _2718 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2722 = 1.0 / _2716;
                    float _2724 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2726 = _2724 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2728 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2730 = _2728 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2732 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2734 = _2732 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2736 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2738 = _2736 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2740 = _2712 * _2722;
                    float _2742 = precise::clamp(_2740, 0.0, 1.0);
                    float _2744 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2746 = _2744 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2748 = fma(_2742, _2720, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2750 = fma(_2742, _2746, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2752 = fma(_2742, _2726, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2754 = fma(_2742, _2730, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2756 = fma(_2742, _2734, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2758 = fma(_2742, _2738, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2586 = _2752;
                    _2604 = _2756;
                    _2580 = _2748;
                    _2598 = _2754;
                    _2592 = _2750;
                    _2612 = _2758;
                    _2674 = true;
                }
                else
                {
                    _2586 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2604 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2580 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2598 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2592 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2612 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2674 = false;
    float _2760 = _2586;
    float _2762 = _2604;
    float _2764 = _2580;
    float _2766 = _2598;
    float _2768 = _2592;
    float _2770 = _2612;
    float _2772 = fma(_2360, -0.5, 0.5);
    float _2774 = precise::clamp(_2772, 0.0, 1.0);
    float _2776 = -_2760;
    float _2778 = _2776 + _2762;
    float _2780 = -_2764;
    float _2782 = _2780 + _2766;
    float _2784 = -_2768;
    float _2786 = _2784 + _2770;
    bool _2788 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2790 = fma(_2774, _2778, _2760);
    float _2792 = fma(_2774, _2782, _2764);
    float _2794 = fma(_2774, _2786, _2768);
    float _2796 = _2790 * 0.586610972881317138671875;
    out.m_101.x = 0.0;
    float _2798 = fma(_2792, 0.298911988735198974609375, _2796);
    float _2800 = fma(_2794, 0.114477999508380889892578125, _2798);
    float _2802 = -_2800;
    float _2804 = _2792 + _2802;
    float _2806 = -_2800;
    float _2808 = _2790 + _2806;
    float _2810 = -_2800;
    float _2812 = _2794 + _2810;
    float _2814 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2816 = fma(_2804, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2800);
    float _2818 = fma(_2808, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2800);
    float _2820 = fma(_2812, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2800);
    out.m_67.x = _2814;
    out.m_103.x = _2816;
    out.m_103.y = _2818;
    out.m_103.z = _2820;
    if (!_2788)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2822 = -_1543;
    float _2824 = _2822 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2826 = -_1465;
    float _2828 = _2826 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2830 = -_1469;
    float _2832 = _2830 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2834 = _2824 * _2824;
    float _2836 = fma(_2828, _2828, _2834);
    float _2838 = fma(_2832, _2832, _2836);
    float _2840 = sqrt(_2838);
    float _2842 = rsqrt(_2838);
    float _2844 = -_2840;
    float _2846 = _2844 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2848 = _2846 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2850 = precise::clamp(_2848, 0.0, 1.0);
    float _2852 = _2828 * _2842;
    float _2854 = _2824 * _2842;
    float _2856 = abs(_2850);
    float _2858 = log2(_2856);
    float _2860 = _2832 * _2842;
    float _2862 = _2852 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2864 = _2360 * _2854;
    float _2866 = -_2854;
    float _2868 = -_2862;
    float _2870 = fma(_2866, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2868);
    float _2872 = fma(_2352, _2852, _2864);
    float _2874 = -_2860;
    float _2876 = fma(_2874, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2870);
    float _2878 = fma(_2410, _2860, _2872);
    float _2880 = precise::clamp(_2878, 0.0, 1.0);
    float _2882 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2884 = _2876 + _2882;
    float _2886 = _2858 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2888 = _2884 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2890 = precise::clamp(_2888, 0.0, 1.0);
    float _2892 = exp2(_2886);
    float _2894 = _2892 * _2890;
    float _2896 = _2880 * _2894;
    float _2898 = _2896 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2900 = _2896 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2902 = _2896 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_101.x = _2898;
    out.m_101.y = _2900;
    out.m_101.z = _2902;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

