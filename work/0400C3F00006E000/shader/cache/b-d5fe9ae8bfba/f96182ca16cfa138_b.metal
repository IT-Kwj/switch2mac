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
    constant _16* vp_c7 [[id(5)]];
    texture2d<float> vp_t_tcb_24 [[id(6)]];
    sampler vp_t_tcb_24Smplr [[id(7)]];
    texture2d_array<float> vp_t_tcb_14 [[id(8)]];
    sampler vp_t_tcb_14Smplr [[id(9)]];
    texture2d_array<float> vp_t_tcb_16 [[id(10)]];
    sampler vp_t_tcb_16Smplr [[id(11)]];
    texture3d<float> vp_t_tcb_32 [[id(12)]];
    sampler vp_t_tcb_32Smplr [[id(13)]];
    texture3d<float> vp_t_tcb_30 [[id(14)]];
    sampler vp_t_tcb_30Smplr [[id(15)]];
    texture2d<float> vp_t_tcb_1C [[id(16)]];
    sampler vp_t_tcb_1CSmplr [[id(17)]];
    sampler vp_t_tcb_24Smplr_w [[id(18)]];
    sampler vp_t_tcb_14Smplr_w [[id(19)]];
    sampler vp_t_tcb_32Smplr_w [[id(20)]];
    sampler vp_t_tcb_30Smplr_w [[id(21)]];
    sampler vp_t_tcb_1CSmplr_w [[id(22)]];
    constant dm_border_t* dm_border [[id(23)]];
};

struct main0_out
{
    float4 m_85 [[user(locn0)]];
    float4 m_77 [[user(locn1)]];
    float4 m_79 [[user(locn2)]];
    float4 m_103 [[user(locn3)]];
    float4 m_73 [[user(locn4)]];
    float4 m_87 [[user(locn5)]];
    float4 m_91 [[user(locn6)]];
    float4 m_59 [[user(locn7)]];
    float4 m_89 [[user(locn8)]];
    float4 m_93 [[user(locn9)]];
    float4 m_95 [[user(locn10)]];
    float4 m_81 [[user(locn11)]];
    float4 m_101 [[user(locn12)]];
    float4 m_99 [[user(locn13)]];
    float4 m_97 [[user(locn14)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_56 [[attribute(2)]];
    float4 m_61 [[attribute(3)]];
    float4 m_83 [[attribute(4)]];
    float4 m_67 [[attribute(5)]];
    float4 m_65 [[attribute(6)]];
    float4 m_63 [[attribute(7)]];
    float4 m_75 [[attribute(8)]];
    float4 m_69 [[attribute(9)]];
    float4 m_71 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2180 = false;
    bool _318 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _117 = in.m_56.w;
    float _119 = trunc(_117);
    int _122 = int(_119);
    bool _126 = _122 >= 1;
    float _128 = 0.0;
    if (!_126)
    {
        _128 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _130 = _128;
    float _132 = _130;
    if (!_126)
    {
        out.m_59.x = 0.0;
    }
    int _134 = 0;
    if (!_126)
    {
        float _136 = _130 * 5.0;
        _134 = as_type<int>(_136);
    }
    int _138 = _134;
    int _140 = _138;
    if (!_126)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2479 = as_type<float>(_138);
        out.gl_Position.z = _2479;
    }
    if (!_126)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _142 = in.m_61.w;
    bool _144 = _142 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _146 = isnan(_142);
    bool _148 = _144 || _146;
    bool _150 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _152 = _148 || _150;
    float _154 = -_142;
    float _156 = _154 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _158 = 0.0;
    if (_152)
    {
        float _160 = float(_122);
        _158 = _160;
    }
    float _162 = _158;
    bool _164 = _156 >= _162;
    bool _166 = !_152;
    bool _168 = _164 || _166;
    if (_168)
    {
        _132 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _170 = _132;
    if (_168)
    {
        out.m_59.x = 0.0;
    }
    if (_168)
    {
        float _172 = _170 * 5.0;
        _140 = as_type<int>(_172);
    }
    int _174 = _140;
    if (_168)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2547 = as_type<float>(_174);
        out.gl_Position.z = _2547;
    }
    if (_168)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _176 = in.m_63.w;
    float _178 = _156 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _180 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _182 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _184 = _180 || _182;
    bool _186 = isnan(1.0);
    bool _188 = _184 || _186;
    float _190 = in.m_61.x;
    float _192 = in.m_61.y;
    float _194 = in.m_61.z;
    float _196 = in.m_56.x;
    float _198 = in.m_56.y;
    float _200 = in.m_56.z;
    float _202 = 0.0;
    float _204 = _178;
    if (!_188)
    {
        float _206 = _178 * _178;
        float _208 = _206 * 0.5;
        _202 = _208;
    }
    float _210 = _202;
    float _212 = _210;
    if (!_188)
    {
        float _214 = _210 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _212 = _214;
    }
    float _216 = _212;
    bool _218 = !_188;
    float _220 = _216;
    if (!_218)
    {
        float _222 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _224 = log2(_222);
        float _226 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _228 = _226 + 1.0;
        float _230 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _232 = _178 * _224;
        float _234 = 1.0 / _228;
        float _236 = _230 * 0.693147182464599609375;
        float _238 = exp2(_232);
        float _240 = 1.0 / _236;
        float _242 = _238 + (-1.0);
        float _244 = -_242;
        float _246 = fma(_244, _240, _178);
        float _248 = _246 * _234;
        float _250 = _248 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _220 = _250;
    }
    float _252 = _220;
    bool _254 = !_188;
    if (!_254)
    {
        float _256 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _258 = log2(_256);
        float _260 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _262 = _260 + 1.0;
        float _264 = 1.0 / _262;
        float _266 = _178 * _258;
        float _268 = exp2(_266);
        float _270 = -_268;
        float _272 = _270 + 1.0;
        float _274 = _272 * _264;
        _204 = _274;
    }
    float _276 = _204;
    bool _278 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _280 = _252 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _282 = _252 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _284 = _252 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _286 = fma(_276, _190, _280);
    float _288 = fma(_276, _192, _282);
    float _290 = fma(_276, _194, _284);
    float _292 = fma(_286, _176, _196);
    float _294 = fma(_288, _176, _198);
    float _296 = fma(_290, _176, _200);
    bool _298 = !_278;
    float _316;
    if (!_298)
    {
        float _300 = in.m_65.x;
        float _302 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _304 = _300 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _306 = fma(_304, (*spvDescriptorSet0.vp_c9)._m0[11].y, _156);
        float _308 = _306 * _302;
        float _310 = floor(_308);
        float _312 = -_310;
        float _314 = _308 + _312;
        _316 = _314;
        _318 = true;
    }
    else
    {
        float _320 = float(_122);
        float _322 = 1.0 / _320;
        float _324 = _156 * _322;
        _316 = _324;
    }
    _318 = false;
    float _326 = _316;
    float _328 = in.m_63.x;
    float _330 = in.m_63.y;
    float _332 = in.m_63.z;
    float _334 = in.m_67.x;
    float _336 = in.m_67.y;
    float _338 = in.m_67.z;
    float _340 = _328 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _342 = _330 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _344 = _332 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _346 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _334);
    float _348 = _340 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _350 = _342 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _352 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _338);
    float _354 = _344 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _356 = _346 * _348;
    float _358 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _336);
    float _360 = _294 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _362 = _352 * _354;
    float _364 = _358 * _350;
    float _366 = _294 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _368 = fma(_292, (*spvDescriptorSet0.vp_c10)._m0[6].x, _360);
    float _370 = _364 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _372 = fma(_292, (*spvDescriptorSet0.vp_c10)._m0[4].x, _366);
    float _374 = fma(_296, (*spvDescriptorSet0.vp_c10)._m0[6].z, _368);
    float _376 = _364 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _378 = fma(_356, (*spvDescriptorSet0.vp_c10)._m0[10].x, _370);
    float _380 = fma(_296, (*spvDescriptorSet0.vp_c10)._m0[4].z, _372);
    float _382 = _374 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _384 = fma(_356, (*spvDescriptorSet0.vp_c10)._m0[8].x, _376);
    float _386 = fma(_362, (*spvDescriptorSet0.vp_c10)._m0[10].z, _378);
    float _388 = _380 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _390 = fma(_362, (*spvDescriptorSet0.vp_c10)._m0[8].z, _384);
    float _392 = _382 + _386;
    float _394 = _388 + _390;
    float _396 = _294 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _398 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _400 = _392 + _398;
    float _402 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _404 = _394 + _402;
    float _406 = fma(_292, (*spvDescriptorSet0.vp_c10)._m0[5].x, _396);
    float _408 = _400 * _400;
    float _410 = fma(_296, (*spvDescriptorSet0.vp_c10)._m0[5].z, _406);
    float _412 = fma(_404, _404, _408);
    float _414 = _410 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _416 = sqrt(_412);
    float _418 = _414 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _420 = fma(_388, (*spvDescriptorSet0.vp_c8)._m0[11].x, _418);
    float _422 = fma(_382, (*spvDescriptorSet0.vp_c8)._m0[11].z, _420);
    float _424 = _364 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _426 = _422 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    bool _428 = _416 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _430 = fma(_356, (*spvDescriptorSet0.vp_c10)._m0[9].x, _424);
    float _432 = _414 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _434 = 1.0 / _426;
    float _436 = fma(_362, (*spvDescriptorSet0.vp_c10)._m0[9].z, _430);
    float _438 = fma(_388, (*spvDescriptorSet0.vp_c8)._m0[10].x, _432);
    float _440 = _414 + _436;
    float _442 = _432;
    float _444 = _362;
    float _446 = _422;
    if (!_428)
    {
        _442 = _394;
    }
    float _448 = _442;
    float _450 = _448;
    if (!_428)
    {
        _444 = _392;
    }
    float _452 = _444;
    float _454 = _452;
    if (!_428)
    {
        _446 = _440;
    }
    float _456 = _446;
    bool _458 = !_428;
    float _460 = _456;
    if (!_458)
    {
        float _462 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _464 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _466 = _416 + _464;
        float _468 = _440 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _470 = rsqrt(_412);
        float _472 = _466 * _462;
        float _474 = _472 * 0.15915493667125701904296875;
        float _476 = _474 * 6.283185482025146484375;
        float _478 = cos(_476);
        float _480 = _474 * 6.283185482025146484375;
        float _482 = sin(_480);
        float _484 = _478 + (-1.0);
        float _486 = _484 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _488 = fma(_482, _468, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _490 = fma(_440, _478, _486);
        float _492 = _470 * _488;
        float _494 = fma(_404, _492, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _496 = fma(_400, _492, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _460 = _490;
        _450 = _494;
        _454 = _496;
    }
    float _498 = _460;
    float _500 = _450;
    float _502 = _454;
    float _504 = fma(_382, (*spvDescriptorSet0.vp_c8)._m0[10].z, _438);
    float _506 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _508 = _498 + _506;
    float _510 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _512 = _500 + _510;
    float _514 = _504 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _516 = _508 * _508;
    float _518 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _520 = _502 + _518;
    float _522 = _514 + _426;
    float _524 = fma(_512, _512, _516);
    float _526 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _528 = _522 * _434;
    float _530 = _528 * 0.5;
    float _532 = fma(_520, _520, _524);
    float _534 = _414 + _526;
    float _536 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _538 = fma(_530, (*spvDescriptorSet0.vp_c8)._m0[30].w, _536);
    float _540 = rsqrt(_532);
    float _542 = _534 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _544 = _534 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _546 = fma(_388, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _548 = _498 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _550 = fma(_388, (*spvDescriptorSet0.vp_c15)._m0[126].x, _542);
    float _552 = fma(_388, (*spvDescriptorSet0.vp_c15)._m0[127].x, _544);
    float _554 = 1.0 / _538;
    float _556 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _558 = fma(_382, (*spvDescriptorSet0.vp_c15)._m0[127].z, _552);
    float _560 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _562 = _558 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _564 = _540 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _566 = sqrt(_532);
    float _568 = _512 * _564;
    float _570 = _520 * _564;
    float _572 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _574 = _554 * _572;
    float _576 = _568 * _568;
    float _578 = _570 * _570;
    float _580 = fma(_382, (*spvDescriptorSet0.vp_c15)._m0[126].z, _550);
    bool _582 = _574 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _584 = _576 + _578;
    bool _586 = _574 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _588 = _580 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    bool _590 = !_582;
    int _592 = _590 ? 0 : 1;
    float _594 = sqrt(_584);
    int _596 = 2;
    float _598 = _584;
    int _600 = as_type<int>(_556);
    float _602 = _568;
    float _604 = _570;
    float _606 = _576;
    float _608 = _578;
    float _610 = _512;
    float _612 = _520;
    if (!_582)
    {
        _596 = 1;
    }
    int _614 = _596;
    float _616 = trunc(_588);
    int _618 = int(_616);
    int _620 = _614;
    if (!_586)
    {
        _620 = _592;
    }
    int _622 = _620;
    int _624 = _622 << 6;
    bool _626 = _594 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _628 = trunc(_562);
    int _630 = int(_628);
    int _632 = _624 + 96;
    uint _635 = uint(int(uint(_632) >> uint(2)));
    uint _637 = uint(int(uint(int(_635)) >> uint(2)));
    int _639 = int(_635) & 3;
    float _641 = (*spvDescriptorSet0.vp_c15)._m0[int(_637)][_639];
    int _643 = int(_635) + 1;
    uint _645 = uint(int(uint(_643) >> uint(2)));
    int _647 = _643 & 3;
    float _649 = (*spvDescriptorSet0.vp_c15)._m0[int(_645)][_647];
    float _651 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _653 = _594 + _651;
    int _655 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _657 = _618 + _655;
    int _659 = _657 + 1;
    int _661 = _624 + 48;
    uint _663 = uint(int(uint(_661) >> uint(2)));
    uint _665 = uint(int(uint(int(_663)) >> uint(2)));
    int _667 = int(_663) & 3;
    float _669 = (*spvDescriptorSet0.vp_c15)._m0[int(_665)][_667];
    int _671 = int(_663) + 1;
    uint _673 = uint(int(uint(_671) >> uint(2)));
    int _675 = _671 & 3;
    float _677 = (*spvDescriptorSet0.vp_c15)._m0[int(_673)][_675];
    float _679 = as_type<float>(_618);
    float _681 = _653;
    int _683 = _659;
    float _685 = as_type<float>(_622);
    if (_626)
    {
        float _687 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _679 = _687;
    }
    float _689 = _679;
    bool _691 = _659 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _693 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _695 = _630 + _693;
    int _697 = _695 + 1;
    int _699 = _624 + 104;
    uint _701 = uint(int(uint(_699) >> uint(2)));
    uint _703 = uint(int(uint(int(_701)) >> uint(2)));
    int _705 = int(_701) & 3;
    float _707 = (*spvDescriptorSet0.vp_c15)._m0[int(_703)][_705];
    int _709 = int(_701) + 1;
    uint _711 = uint(int(uint(_709) >> uint(2)));
    int _713 = _709 & 3;
    float _715 = (*spvDescriptorSet0.vp_c15)._m0[int(_711)][_713];
    int _717 = _659 | _697;
    if (_626)
    {
        float _719 = rsqrt(_584);
        _598 = _719;
    }
    float _721 = _598;
    bool _723 = _717 < 0;
    bool _725 = _723 || _691;
    int _727 = _624 + 64;
    uint _729 = uint(int(uint(_727) >> uint(2)));
    uint _731 = uint(int(uint(int(_729)) >> uint(2)));
    int _733 = int(_729) & 3;
    float _735 = (*spvDescriptorSet0.vp_c15)._m0[int(_731)][_733];
    int _737 = int(_729) + 1;
    uint _739 = uint(int(uint(_737) >> uint(2)));
    int _741 = _737 & 3;
    float _743 = (*spvDescriptorSet0.vp_c15)._m0[int(_739)][_741];
    bool _745 = _697 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _747 = _745 || _725;
    if (_626)
    {
        float _749 = _653 * _689;
        _681 = _749;
    }
    float _751 = _681;
    float _753 = floor(_546);
    float _755 = 0.0;
    if (_626)
    {
        float _757 = _751 * 0.15915493667125701904296875;
        _755 = _757;
    }
    float _759 = _755;
    int _761 = _624 + 56;
    uint _763 = uint(int(uint(_761) >> uint(2)));
    uint _765 = uint(int(uint(int(_763)) >> uint(2)));
    int _767 = int(_763) & 3;
    float _769 = (*spvDescriptorSet0.vp_c15)._m0[int(_765)][_767];
    int _771 = int(_763) + 1;
    uint _773 = uint(int(uint(_771) >> uint(2)));
    int _775 = _771 & 3;
    float _777 = (*spvDescriptorSet0.vp_c15)._m0[int(_773)][_775];
    float _779 = _751;
    if (_626)
    {
        float _781 = _759 * 6.283185482025146484375;
        float _783 = cos(_781);
        _779 = _783;
    }
    float _785 = _779;
    if (!_747)
    {
        int _787 = _697 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _789 = _787 + _659;
        _683 = _789;
    }
    int _791 = _683;
    float _793 = precise::max(0.0, _556);
    float _795 = 0.0;
    if (_626)
    {
        float _797 = _759 * 6.283185482025146484375;
        float _799 = sin(_797);
        _795 = _799;
    }
    float _801 = _795;
    int _803 = 0;
    if (!_747)
    {
        int _805 = _791 << 2;
        _803 = _805;
    }
    int _807 = _803;
    float _809 = -_753;
    float _811 = _546 + _809;
    float _813 = _534 * _649;
    int _815 = 0;
    float _817 = _813;
    if (!_747)
    {
        uint _819 = uint(int(uint(_791) >> uint(2)));
        _815 = int(_819);
    }
    int _821 = _815;
    float _823 = as_type<float>(_821);
    if (!_747)
    {
        int _825 = 12 & _807;
        _600 = _825;
    }
    int _827 = _600;
    float _829 = -_564;
    float _831 = -_793;
    float _833 = fma(_508, _829, _831);
    float _835 = fma(_388, _641, _813);
    float _837 = _677;
    float _839 = as_type<float>(_827);
    if (_626)
    {
        float _841 = _785 + (-1.0);
        _817 = _841;
    }
    float _843 = _817;
    float _845 = _843;
    if (!_747)
    {
        int _847 = _821 << 4;
        int _849 = _847 + _827;
        _823 = as_type<float>(_849);
    }
    float _851 = _823;
    float _853 = _534 * _677;
    if (_626)
    {
        float _855 = _833 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _837 = _855;
    }
    float _857 = _837;
    if (_626)
    {
        float _859 = _843 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _845 = _859;
    }
    float _861 = _845;
    if (!_626)
    {
        _839 = _833;
    }
    float _863 = _839;
    float _865 = fma(_388, _669, _853);
    float _867 = _801;
    float _869 = _863;
    if (_626)
    {
        float _871 = fma(_801, _857, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _867 = _871;
    }
    float _873 = _867;
    float _875 = _873;
    if (_626)
    {
        float _877 = fma(_833, _785, _861);
        _869 = _877;
    }
    float _879 = _869;
    float _881 = fma(_382, _707, _835);
    if (_626)
    {
        float _883 = _721 * _873;
        _875 = _883;
    }
    float _885 = _875;
    int _887 = _624 + 72;
    uint _889 = uint(int(uint(_887) >> uint(2)));
    uint _891 = uint(int(uint(int(_889)) >> uint(2)));
    int _893 = int(_889) & 3;
    float _895 = (*spvDescriptorSet0.vp_c15)._m0[int(_891)][_893];
    int _897 = int(_889) + 1;
    uint _899 = uint(int(uint(_897) >> uint(2)));
    int _901 = _897 & 3;
    float _903 = (*spvDescriptorSet0.vp_c15)._m0[int(_899)][_901];
    float _905 = _498 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _907 = fma(_382, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    if (_626)
    {
        float _909 = _568 * _885;
        _602 = _909;
    }
    float _911 = _602;
    if (_626)
    {
        float _913 = _570 * _885;
        _604 = _913;
    }
    float _915 = _604;
    float _917 = _881 + _715;
    float _919 = _534 * _743;
    if (_626)
    {
        float _921 = _911 * _911;
        _606 = _921;
    }
    float _923 = _606;
    if (_626)
    {
        float _925 = _915 * _915;
        _608 = _925;
    }
    float _927 = _608;
    float _929 = fma(_500, (*spvDescriptorSet0.vp_c8)._m0[2].x, _905);
    float _931 = fma(_388, _735, _919);
    float _933 = fma(_879, _879, _923);
    int _935 = _624 + 80;
    uint _937 = uint(int(uint(_935) >> uint(2)));
    uint _939 = uint(int(uint(int(_937)) >> uint(2)));
    int _941 = int(_937) & 3;
    float _943 = (*spvDescriptorSet0.vp_c15)._m0[int(_939)][_941];
    int _945 = int(_937) + 1;
    uint _947 = uint(int(uint(_945) >> uint(2)));
    int _949 = _945 & 3;
    float _951 = (*spvDescriptorSet0.vp_c15)._m0[int(_947)][_949];
    float _953 = _498 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _955 = fma(_502, (*spvDescriptorSet0.vp_c8)._m0[2].z, _929);
    float _957 = _933 + _927;
    float _959 = _498 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _961 = fma(_382, _769, _865);
    float _963 = fma(_500, (*spvDescriptorSet0.vp_c8)._m0[0].x, _953);
    float _965 = _955 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    int _967 = _624 + 88;
    uint _969 = uint(int(uint(_967) >> uint(2)));
    uint _971 = uint(int(uint(int(_969)) >> uint(2)));
    int _973 = int(_969) & 3;
    float _975 = (*spvDescriptorSet0.vp_c15)._m0[int(_971)][_973];
    int _977 = int(_969) + 1;
    uint _979 = uint(int(uint(_977) >> uint(2)));
    int _981 = _977 & 3;
    float _983 = (*spvDescriptorSet0.vp_c15)._m0[int(_979)][_981];
    float _985 = rsqrt(_957);
    float _987 = fma(_500, (*spvDescriptorSet0.vp_c8)._m0[1].x, _959);
    float _989 = fma(_502, (*spvDescriptorSet0.vp_c8)._m0[0].z, _963);
    float _991 = _965 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _993 = fma(_502, (*spvDescriptorSet0.vp_c8)._m0[1].z, _987);
    float _995 = _851;
    if (!_747)
    {
        int _997 = as_type<int>(_851) + 400;
        uint _999 = uint(int(uint(_997) >> uint(2)));
        uint _1001 = uint(int(uint(int(_999)) >> uint(2)));
        int _1003 = int(_999) & 3;
        float _1005 = (*spvDescriptorSet0.vp_c15)._m0[int(_1001)][_1003];
        _995 = _1005;
    }
    float _1007 = _995;
    float _1009 = 1.0 / _917;
    float _1011 = _993 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1013 = fma(_500, (*spvDescriptorSet0.vp_c8)._m0[3].x, _548);
    float _1015 = _989 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1017 = -_991;
    float _1019 = fma(_1017, _560, 1.0);
    float _1021 = _1011 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1023 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1025 = fma(_566, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1023);
    float _1027 = precise::clamp(_1025, 0.0, 1.0);
    float _1029 = fma(_502, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1013);
    float _1031 = floor(_907);
    float _1033 = fma(_1015, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1021);
    float _1035 = _985 * _911;
    float _1037 = -_1027;
    float _1039 = _1037 + 1.0;
    float _1041 = _1029 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1043 = fma(_965, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1033);
    float _1045 = _1035 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1047 = _961 + _777;
    float _1049 = abs(_1039);
    float _1051 = log2(_1049);
    float _1053 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1043);
    float _1055 = _985 * _879;
    float _1057 = fma(_382, _895, _931);
    float _1059 = _1047 * _1009;
    float _1061 = _985 * _915;
    float _1063 = -_1045;
    float _1065 = fma(_1055, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1063);
    float _1067 = _1057 + _903;
    float _1069 = _707;
    float _1071 = _1019;
    if (!_747)
    {
        float _1073 = floor(_562);
        _1069 = _1073;
    }
    float _1075 = _1069;
    bool _1077 = _1059 >= 0.0;
    float _1079 = -_1031;
    float _1081 = _907 + _1079;
    float _1083 = _1067 * _1009;
    float _1085 = -_1061;
    float _1087 = fma(_1085, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1065);
    bool _1089 = _1059 <= 1.0;
    bool _1091 = _1089 && _1077;
    float _1093 = _534 * _951;
    float _1095 = _1051 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    bool _1097 = _1083 >= 0.0;
    bool _1099 = _1097 && _1091;
    float _1101 = fma(_1087, -0.5, 0.5);
    float _1103 = fma(_388, _943, _1093);
    float _1105 = fma(_1087, 0.5, 0.5);
    bool _1107 = _1083 <= 1.0;
    bool _1109 = _1107 && _1099;
    float _1111 = exp2(_1095);
    float _1113 = fma(_382, _975, _1103);
    float _1115 = fma(_1105, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1117 = _1011 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1119 = _1113 + _983;
    float _1121 = fma(_1105, _1115, -0.212114393711090087890625);
    float _1123 = fma(_1015, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1117);
    float _1125 = log2(_1019);
    float _1127 = fma(_1105, _1121, 1.570728778839111328125);
    float _1129 = fma(_965, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1123);
    if (_1109)
    {
        float _1131 = float(_622);
        _685 = _1131;
    }
    float _1133 = _685;
    float _1135 = _1055 + 1.0;
    float _1137 = sqrt(_1101);
    if (!_747)
    {
        float _1139 = -_1075;
        float _1141 = _562 + _1139;
        _1071 = _1141;
    }
    float _1143 = _1071;
    float _1145 = _1011 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1147 = -_1055;
    float _1149 = fma(_1111, _1135, _1147);
    float _1151 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1129);
    float _1153 = fma(_1015, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1145);
    float _1155 = 1.0 / _1053;
    float _1157 = _1125 * 0.693147182464599609375;
    float _1159 = fma(_965, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1153);
    float _1161 = _785;
    float _1163 = _1159;
    float _1165 = _1151;
    if (!_747)
    {
        float _1167 = floor(_588);
        _1161 = _1167;
    }
    float _1169 = _1161;
    float _1171 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1159);
    float _1173 = _1137 * 0.636619746685028076171875;
    float _1175 = _1157 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float2 _4211 = float2(_811, _1081);
    float _1177 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4211, float2(0.0), isnan(_4211)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4211, float2(0.0), isnan(_4211)), level(0.0)).x;
    float _1179 = -_1127;
    float _1181 = fma(_1173, _1179, 1.0);
    float _1183 = _943;
    if (!_747)
    {
        float _1185 = rint(_1007);
        float _1187 = precise::max(_1185, 0.0);
        uint _1189 = uint(_1187);
        uint _1191 = clamp(_1189, 0u, 65535u);
        _1183 = as_type<float>(_1191);
    }
    float _1193 = _1183;
    float _1195 = _1151 * _1155;
    float _1197 = _1171 * _1155;
    float _1199 = _1119 * _1009;
    float _1201 = fma(_1195, 0.5, 0.5);
    float _1203 = fma(_1197, -0.5, 0.5);
    float _1205 = _1153;
    if (_1109)
    {
        float _1207 = rint(_1133);
        float _1209 = precise::max(_1207, 0.0);
        uint _1211 = uint(_1209);
        uint _1213 = clamp(_1211, 0u, 65535u);
        _1205 = as_type<float>(_1213);
    }
    float _1215 = _1205;
    if (!_747)
    {
        float _1217 = -_1169;
        float _1219 = _588 + _1217;
        _1163 = _1219;
    }
    float _1221 = _1163;
    float _1223 = fma(_1149, 0.5, 0.5);
    float _1225 = _588;
    if (!_747)
    {
        float3 _4292 = float3(_1221, _1143, float(as_type<int>(_1193)));
        float3 _4296 = select(_4292, float3(0.0), isnan(_4292));
        float _1227 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _4296.xy, uint(rint(_4296.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _4296.xy, uint(rint(_4296.z)), level(0.0)).x;
        _1225 = _1227;
    }
    float _1229 = _1225;
    float _1231 = _1083;
    if (_1109)
    {
        float3 _4311 = float3(_1059, _1083, float(as_type<int>(_1215)));
        float3 _4313 = select(_4311, float3(0.0), isnan(_4311));
        float _1233 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _4313.xy, uint(rint(_4313.z)), _1199, level(0.0));
        _1231 = _1233;
    }
    float _1235 = _1231;
    float3 _4323 = float3(_1201, _1203, _1175);
    float _1237 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4323, float3(0.0), isnan(_4323)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4323, float3(0.0), isnan(_4323)), level(0.0)).x;
    float3 _4332 = float3(_1201, _1203, _1175);
    float4 _1240 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4332, float3(0.0), isnan(_4332)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4332, float3(0.0), isnan(_4332)), level(0.0)).xyzw;
    float _1242 = _1240.x;
    float _1244 = _1240.y;
    float _1246 = _1240.z;
    float _1248 = _1240.w;
    float2 _4348 = float2(_1181, _1223);
    float3 _1252 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4348, float2(0.0), isnan(_4348)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4348, float2(0.0), isnan(_4348)), level(0.0)).xyz;
    float _1254 = _1252.x;
    float _1256 = _1252.y;
    float _1258 = _1252.z;
    float _1260 = in.m_69.y;
    float _1262 = _1011 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1264 = in.m_65.x;
    float _1266 = in.m_65.y;
    float _1268 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1270 = _1268 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1272 = in.m_71.w;
    float _1274 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1276 = _1274 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1278 = in.m_71.y;
    float _1280 = _1051 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1282 = in.m_71.z;
    float _1284 = in.m_65.w;
    float _1286 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1288 = -_1260;
    float _1290 = _1288 + 1.0;
    float _1292 = in.m_71.x;
    int _1294 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1296 = _1294 != 0;
    float _1298 = 1.0 / _1270;
    bool _1300 = _1266 > 0.5;
    float _1302 = _1266 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1304 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1306 = _1304 != 0;
    float _1308 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1310 = _1300 ? as_type<int>(_1290) : as_type<int>(_1260);
    out.m_73.w = _1272;
    int _1312 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1314 = _1312 != 0;
    float _1316 = 1.0 / _1276;
    int _1318 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1320 = _1318 != 0;
    out.m_73.y = _1278;
    int _1322 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1324 = _1322 != 0;
    float _1326 = fma(_1302, -2.0, _1308);
    float _1328 = _1320 ? as_type<float>(_1310) : _1260;
    float _1330 = in.m_75.x;
    float _1332 = in.m_75.y;
    float _1334 = in.m_75.z;
    float _1336 = in.m_75.w;
    float _1338 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1340 = _1284 > 0.5;
    float _1342 = _1264 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    out.m_73.z = _1282;
    float _1344 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1346 = -_1286;
    float _1348 = fma(_1342, 2.0, _1346);
    float _1350 = _1282;
    float _1352 = _1260;
    bool _1354 = _1324;
    bool _1356 = _1340;
    if (_1314)
    {
        float _1358 = in.m_65.x;
        _1350 = _1358;
    }
    float _1360 = _1350;
    float _1362 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1364 = _1342;
    if (_1296)
    {
        float _1366 = in.m_65.z;
        _1364 = _1366;
    }
    float _1368 = _1364;
    float _1370 = _1344 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1372 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1374 = _1362 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_73.x = _1292;
    float _1376 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1378 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1376;
    float _1380 = _1372 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_1324)
    {
        float _1382 = _1340 ? _1290 : _1260;
        _1352 = _1382;
    }
    float _1384 = _1352;
    float _1386 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1388 = _1378 * _1298;
    float _1390 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1392 = _1390 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1394 = _1332 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1396 = _1332 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1398 = _1392 * _1316;
    float _1400 = fma(_1330, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1394);
    float _1402 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1404 = fma(_1330, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1396);
    float _1406 = in.m_69.x;
    float _1408 = _1386;
    float _1410 = _1404;
    float _1412 = _1338;
    float _1414 = _1406;
    if (_1314)
    {
        bool _1416 = _1360 > 0.5;
        _1354 = _1416;
    }
    bool _1418 = _1354;
    float _1420 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1326);
    float _1422 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    out.m_77.x = _1370;
    out.m_77.y = _1374;
    out.m_77.z = _1380;
    out.m_77.w = _1402;
    if (_1296)
    {
        bool _1424 = _1368 > 0.5;
        _1356 = _1424;
    }
    bool _1426 = _1356;
    float _1428 = -_156;
    float _1430 = fma(_1428, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1348);
    float _1432 = fma(_1015, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1262);
    float _1434 = _1360;
    if (!_1306)
    {
        float _1436 = in.m_65.z;
        _1434 = _1436;
    }
    float _1438 = _1434;
    float _1440 = exp2(_1280);
    float _1442 = fma(_965, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1432);
    out.m_79.x = _512;
    out.m_79.y = _508;
    out.m_79.z = _520;
    float _1444 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1442);
    float _1446 = _1332 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1448 = fma(_1264, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1386);
    if (!_1306)
    {
        _1408 = _1266;
    }
    float _1450 = _1408;
    float _1452 = fma(_1334, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1400);
    float _1454 = _1450;
    if (_1306)
    {
        _1454 = _1264;
    }
    float _1456 = _1454;
    float _1458 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1460 = _326 + _1458;
    float _1462 = fma(_1330, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1446);
    float _1464 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1466 = _326 + _1464;
    float _1468 = fma(_1334, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1404);
    float _1470 = fma(_1398, _1460, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1472 = fma(_1334, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1462);
    float _1474 = _1338 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _1476 = _326 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1478 = isnan(_326);
    bool _1480 = _1476 || _1478;
    bool _1482 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1484 = _1480 || _1482;
    float _1486 = float(_1484);
    float _1488 = fma(_1388, _1466, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1490 = _1438;
    int _1492 = as_type<int>(_1456);
    if (!_1306)
    {
        _1410 = _1438;
    }
    float _1494 = _1410;
    float _1496 = fma(_1474, _1328, -0.5);
    out.m_81.x = _1452;
    out.m_81.y = _1472;
    out.m_81.z = _1468;
    bool _1498 = _326 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1500 = isnan(_326);
    bool _1502 = _1498 || _1500;
    bool _1504 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1506 = _1502 || _1504;
    float _1508 = float(_1506);
    float _1510 = -_1486;
    float _1512 = _1510 + 1.0;
    bool _1514 = _326 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1516 = isnan(_326);
    bool _1518 = _1514 || _1516;
    bool _1520 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1522 = _1518 || _1520;
    float _1524 = float(_1522);
    out.gl_Position.x = _1151;
    out.gl_Position.y = _1171;
    out.gl_Position.z = _1444;
    out.gl_Position.w = _1053;
    float _1526 = _1494;
    if (_1306)
    {
        _1526 = _1266;
    }
    float _1528 = _1526;
    float _1530 = _1508 * _1512;
    float _1532 = -_1508;
    float _1534 = _1532 + 1.0;
    if (_1306)
    {
        _1490 = _1266;
    }
    float _1536 = _1490;
    bool _1538 = _336 != 0.0;
    bool _1540 = isnan(_336);
    bool _1542 = _1538 || _1540;
    bool _1544 = isnan(0.0);
    bool _1546 = _1542 || _1544;
    float _1548 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    if (!_1314)
    {
        _1412 = _1406;
    }
    float _1550 = _1412;
    float _1552 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _1554 = _334 == 0.0;
    bool _1556 = !_1546;
    bool _1558 = _1554 && _1556;
    float _1560 = fma(_1266, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1548);
    float _1562 = fma(_1456, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1422);
    float _1564 = _1456 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _1566 = _338 == 0.0;
    bool _1568 = _1566 && _1558;
    float _1570 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1560);
    float _1572 = _1524 * _1534;
    float _1574 = _1550;
    float _1576 = _1564;
    if (_1314)
    {
        float _1578 = -_1406;
        float _1580 = _1578 + 1.0;
        _1492 = as_type<int>(_1580);
    }
    int _1582 = _1492;
    float _1584 = -_1420;
    float _1586 = fma(_1570, _1496, _1584);
    float _1588 = _1488 * _1572;
    float _1590 = in.m_83.x;
    float _1592 = in.m_83.y;
    float _1594 = in.m_83.z;
    float _1596 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1598 = _1552 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1600 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _1602 = _1582;
    if (_1314)
    {
        float _1604 = _1418 ? as_type<float>(_1582) : _1406;
        _1574 = _1604;
    }
    float _1606 = _1574;
    if (_1296)
    {
        float _1608 = -_1406;
        float _1610 = _1608 + 1.0;
        _1602 = as_type<int>(_1610);
    }
    int _1612 = _1602;
    float _1614 = fma(_1598, _1384, -0.5);
    float _1616 = fma(_1536, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1600);
    float _1618 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1620 = -_1524;
    float _1622 = _1620 + 1.0;
    float _1624 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _1626 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1628 = isnan(0.5);
    bool _1630 = _1626 || _1628;
    bool _1632 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1634 = _1630 || _1632;
    float _1636 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1638 = _1528 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1640 = -_1624;
    float _1642 = fma(_1564, 2.0, _1640);
    float _1644 = _1638;
    float _1646 = as_type<float>(_1612);
    float _1648 = _1636;
    if (!_1296)
    {
        _1576 = _1406;
    }
    float _1650 = _1576;
    float _1652 = fma(_1622, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1588);
    float _1654 = fma(_1638, -2.0, _1636);
    float _1656 = _1650;
    if (_1296)
    {
        float _1658 = _1426 ? as_type<float>(_1612) : _1406;
        _1656 = _1658;
    }
    float _1660 = _1656;
    float _1662 = -_156;
    float _1664 = fma(_1662, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1642);
    float _1666 = fma(_1470, _1530, _1652);
    if (_1568)
    {
        _1644 = _1592;
    }
    float _1668 = _1644;
    float _1670 = _1618 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1672 = _1668;
    float _1674 = _1618;
    if (_1568)
    {
        _1646 = _1594;
    }
    float _1676 = _1646;
    float _1678 = fma(_1486, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1666);
    float _1680 = _1676;
    if (_1568)
    {
        _1414 = _1668;
    }
    float _1682 = _1414;
    float _1684 = fma(_1670, _1660, -0.5);
    float _1686 = _1682;
    if (!_1568)
    {
        _1672 = _1592;
    }
    float _1688 = _1672;
    float _1690 = _1596 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    if (_1568)
    {
        _1674 = _1676;
    }
    float _1692 = _1674;
    float _1694 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1616);
    float _1696 = _1692;
    if (!_1568)
    {
        _1680 = _1594;
    }
    float _1698 = _1680;
    float _1700 = fma(_1690, _1606, -0.5);
    float _1702 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1448);
    float _1704 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1562);
    float _1706 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1654);
    float _1708 = _1330 * _1688;
    if (_1568)
    {
        _1648 = _1590;
    }
    float _1710 = _1648;
    float _1712 = _1710;
    if (!_1568)
    {
        float _1714 = fma(_334, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1590);
        _1712 = _1714;
    }
    float _1716 = _1712;
    float _1718 = _1334 * _1590;
    float _1720 = -_1708;
    float _1722 = fma(_1332, _1590, _1720);
    float _1724 = fma(_1702, _1700, _1430);
    float _1726 = abs(_574);
    float _1728 = log2(_1726);
    float _1730 = _1332 * _1698;
    float _1732 = -_1718;
    float _1734 = fma(_1330, _1698, _1732);
    float _1736 = _1722 * _1336;
    float _1738 = fma(_1704, _1684, _1664);
    float _1740 = -_1730;
    float _1742 = fma(_1334, _1688, _1740);
    float _1744 = _1734 * _1336;
    float _1746 = -_1706;
    float _1748 = fma(_1694, _1614, _1746);
    float _1750 = _1742 * _1336;
    float _1752 = _1744 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1754 = _1744 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1756 = _1744 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1758 = fma(_1750, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1752);
    float _1760 = _1678 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1762 = _1728 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1764 = fma(_1750, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1754);
    float _1766 = fma(_1750, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1756);
    float _1768 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1770 = exp2(_1762);
    float _1772 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1774 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1776 = _1586 + 0.5;
    float _1778 = fma(_1736, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1764);
    float _1780 = fma(_1736, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1758);
    float _1782 = _1768 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1784 = _1772 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1786 = _1774 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1788 = _1444 + _1053;
    float _1790 = _1738 + 0.5;
    float _1792 = _1748 + 0.5;
    float _1794 = _1724 + 0.5;
    float _1796 = fma(_1736, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1766);
    float _1798 = _1788 * 0.5;
    out.m_85.x = _1782;
    out.m_85.y = _1784;
    out.m_85.z = _1786;
    out.m_85.w = _1760;
    float _1800 = fma(_1770, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1802 = precise::clamp(_1800, 0.0, 1.0);
    if (!_1568)
    {
        float _1804 = fma(_336, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1688);
        _1686 = _1804;
    }
    float _1806 = _1686;
    out.m_87.x = _1794;
    out.m_87.y = _1776;
    out.m_87.z = _1790;
    out.m_87.w = _1792;
    if (!_1568)
    {
        float _1808 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1698);
        _1696 = _1808;
    }
    float _1810 = _1696;
    bool _1812 = _574 <= 8000.0;
    bool _1814 = isnan(_574);
    bool _1816 = _1812 || _1814;
    bool _1818 = isnan(8000.0);
    bool _1820 = _1816 || _1818;
    float _1822 = float(_1820);
    float _1824 = fma(_1802, -2.0, 3.0);
    out.m_89.x = _1778;
    out.m_89.y = _1780;
    out.m_89.z = _1796;
    float _1826 = _1802 * _1802;
    float _1828 = _1806 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1830 = _1806 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    out.m_91.z = _1798;
    out.m_91.w = _1053;
    float _1832 = _1826 * _1824;
    float _1834 = _1806 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1836 = fma(_1716, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1828);
    float _1838 = fma(_1716, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1830);
    float _1840 = -_1832;
    float _1842 = _1840 + 1.0;
    float _1844 = fma(_1716, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1834);
    if (_1634)
    {
        _610 = 1.0;
    }
    float _1846 = _610;
    float _1848 = fma(_1842, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1832);
    float _1850 = _1846;
    if (!_1634)
    {
        float _1852 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1854 = _1852 * 0.15915493667125701904296875;
        float _1856 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1858 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1860 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1858;
        float _1862 = _1854 * 6.283185482025146484375;
        float _1864 = cos(_1862);
        float _1866 = _1856 * 0.15915493667125701904296875;
        float _1868 = _1854 * 6.283185482025146484375;
        float _1870 = sin(_1868);
        float _1872 = 1.0 / _1864;
        float _1874 = _1866 * 6.283185482025146484375;
        float _1876 = cos(_1874);
        float _1878 = _1870 * _1872;
        float _1880 = _1866 * 6.283185482025146484375;
        float _1882 = sin(_1880);
        float _1884 = _1876 * _1878;
        float _1886 = 1.0 / _1860;
        float _1888 = 1.0 / _1884;
        float _1890 = _1882 * _1888;
        float _1892 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1894 = fma(_574, _1890, _1892);
        float _1896 = _1894 * _1886;
        float _1898 = precise::clamp(_1896, 0.0, 1.0);
        _612 = _1864;
        _1850 = _1898;
        _1165 = _1860;
    }
    float _1900 = _612;
    float _1902 = _1850;
    float _1904 = _1165;
    float _1906 = _1822 * _1848;
    float _1908 = -_1177;
    float _1910 = _1908 + 1.0;
    float _1912 = -_1440;
    float _1914 = _1912 + 1.0;
    float _1916 = fma(_1810, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1836);
    float _1918 = _1906 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1920 = fma(_1810, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1838);
    float _1922 = _1900;
    float _1924 = _1910;
    float _1926 = _1904;
    float _1928 = _1918;
    if (!_1109)
    {
        _1922 = 1.0;
    }
    float _1930 = _1922;
    float _1932 = _1910 * _1918;
    float _1934 = precise::clamp(_1932, 0.0, 1.0);
    float _1936 = fma(_1810, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1844);
    float _1938 = _1930;
    float _1940 = _1934;
    if (_1109)
    {
        bool _1942 = _1235 >= _1199;
        bool _1944 = isnan(_1235);
        bool _1946 = _1942 || _1944;
        bool _1948 = isnan(_1199);
        bool _1950 = _1946 || _1948;
        float _1952 = float(_1950);
        _1938 = _1952;
    }
    float _1954 = _1938;
    float _1956 = _1914 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (_747)
    {
        _1924 = 1.0;
    }
    float _1958 = _1924;
    float _1960 = _1958;
    if (!_747)
    {
        int _1962 = _791 << 4;
        int _1964 = _1962 + 2048;
        uint _1966 = uint(int(uint(_1964) >> uint(2)));
        uint _1968 = uint(int(uint(int(_1966)) >> uint(2)));
        int _1970 = int(_1966) & 3;
        float _1972 = (*spvDescriptorSet0.vp_c15)._m0[int(_1968)][_1970];
        int _1974 = int(_1966) + 1;
        uint _1976 = uint(int(uint(_1974) >> uint(2)));
        int _1978 = _1974 & 3;
        float _1980 = (*spvDescriptorSet0.vp_c15)._m0[int(_1976)][_1978];
        int _1982 = _1964 + 8;
        uint _1984 = uint(int(uint(_1982) >> uint(2)));
        uint _1986 = uint(int(uint(int(_1984)) >> uint(2)));
        int _1988 = int(_1984) & 3;
        float _1990 = (*spvDescriptorSet0.vp_c15)._m0[int(_1986)][_1988];
        int _1992 = int(_1984) + 1;
        uint _1994 = uint(int(uint(_1992) >> uint(2)));
        int _1996 = _1992 & 3;
        float _1998 = (*spvDescriptorSet0.vp_c15)._m0[int(_1994)][_1996];
        float _2000 = _534 * _1980;
        float _2002 = fma(_388, _1972, _2000);
        float _2004 = fma(_382, _1990, _2002);
        float _2006 = _2004 + _1998;
        float _2008 = precise::clamp(_2006, 0.0, 1.0);
        float _2010 = -_2008;
        float _2012 = _2010 + _1229;
        float _2014 = fma(_2012, 500.0, 1.5);
        float _2016 = exp2(_2014);
        float _2018 = 0.0 + _2016;
        float _2020 = precise::clamp(_2018, 0.0, 1.0);
        _1960 = _2020;
        _1926 = 500.0;
        _1928 = _1972;
    }
    float _2022 = _1960;
    float _2024 = _1926;
    float _2026 = _1928;
    float _2028 = _1956 * _1237;
    float _2030 = _1954 * _2022;
    float _2032 = -_1956;
    float _2034 = _2032 + 1.0;
    out.m_93.x = _1916;
    out.m_93.y = _1920;
    out.m_93.z = _1936;
    float _2036 = _1248 * _2028;
    float _2038 = _1258 * _2028;
    float _2040 = _1248 * _2034;
    out.m_95.x = _500;
    out.m_95.y = _498;
    out.m_95.z = _502;
    float _2042 = fma(_1254, _2036, _1242);
    float _2044 = fma(_1256, _2036, _1244);
    float _2046 = fma(_1248, _2038, _1246);
    bool _2048 = _566 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2050 = isnan(_566);
    bool _2052 = _2048 || _2050;
    bool _2054 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2056 = _2052 || _2054;
    float _2058 = -_1934;
    float _2060 = fma(_2058, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2062 = _1902 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_97.x = _2042;
    out.m_97.y = _2044;
    out.m_97.z = _2046;
    out.m_97.w = _2040;
    float _2064 = -_2030;
    float _2066 = fma(_2064, _2060, 1.0);
    float _2068 = precise::clamp(_2066, 0.0, 1.0);
    float _2070 = _2068 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2072 = _2026;
    float _2074 = _2024;
    float _2076 = _2034;
    float _2078 = _2068;
    float _2080 = _2070;
    if (!_2056)
    {
        _2072 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2082 = _2072;
    out.m_99.x = _2070;
    float _2084 = _2082;
    float _2086 = _2082;
    if (!_2056)
    {
        _2074 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2088 = _2074;
    float _2090 = _2088;
    float _2092 = _2088;
    if (!_2056)
    {
        _2076 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2094 = _2076;
    float _2096 = _2094;
    float _2098 = _2094;
    if (!_2056)
    {
        _1940 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2100 = _1940;
    float _2102 = _2100;
    float _2104 = _2100;
    if (!_2056)
    {
        _2078 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2106 = _2078;
    float _2108 = _2106;
    float _2110 = _2106;
    if (!_2056)
    {
        _2080 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2112 = _2080;
    bool _2114 = !_2056;
    float _2116 = _2112;
    float _2118 = _2112;
    if (!_2114)
    {
        bool _2120 = _566 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2122 = isnan(_566);
        bool _2124 = _2120 || _2122;
        bool _2126 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2128 = _2124 || _2126;
        if (!_2128)
        {
            float _2130 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2132 = _566 + _2130;
            float _2134 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2136 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2134;
            float _2138 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2140 = _2138 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2142 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2144 = _2142 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2146 = 1.0 / _2136;
            float _2148 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2150 = _2148 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2152 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2154 = _2152 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2156 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2158 = _2156 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2160 = _2132 * _2146;
            float _2162 = precise::clamp(_2160, 0.0, 1.0);
            float _2164 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2166 = _2164 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2168 = fma(_2162, _2140, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2170 = fma(_2162, _2144, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2172 = fma(_2162, _2166, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2174 = fma(_2162, _2150, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2176 = fma(_2162, _2154, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2178 = fma(_2162, _2158, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2092 = _2170;
            _2110 = _2176;
            _2086 = _2168;
            _2104 = _2174;
            _2098 = _2172;
            _2118 = _2178;
            _2180 = true;
        }
        else
        {
            bool _2182 = _566 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2184 = isnan(_566);
            bool _2186 = _2182 || _2184;
            bool _2188 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2190 = _2186 || _2188;
            if (!_2190)
            {
                _2084 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2192 = _2084;
            _2086 = _2192;
            if (!_2190)
            {
                _2090 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2194 = _2090;
            _2092 = _2194;
            if (!_2190)
            {
                _2096 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2196 = _2096;
            _2098 = _2196;
            if (!_2190)
            {
                _2102 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2198 = _2102;
            _2104 = _2198;
            if (!_2190)
            {
                _2108 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2200 = _2108;
            _2110 = _2200;
            if (!_2190)
            {
                _2116 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2202 = _2116;
            bool _2204 = !_2190;
            _2118 = _2202;
            if (!_2204)
            {
                bool _2206 = _566 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2208 = isnan(_566);
                bool _2210 = _2206 || _2208;
                bool _2212 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2214 = _2210 || _2212;
                if (!_2214)
                {
                    float _2216 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2218 = _566 + _2216;
                    float _2220 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2222 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2220;
                    float _2224 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2226 = _2224 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2228 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2230 = _2228 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2232 = 1.0 / _2222;
                    float _2234 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2236 = _2234 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2238 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2240 = _2238 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2242 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2244 = _2242 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2246 = _2218 * _2232;
                    float _2248 = precise::clamp(_2246, 0.0, 1.0);
                    float _2250 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2252 = _2250 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2254 = fma(_2248, _2226, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2256 = fma(_2248, _2230, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2258 = fma(_2248, _2252, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2260 = fma(_2248, _2236, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2262 = fma(_2248, _2240, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2264 = fma(_2248, _2244, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2092 = _2256;
                    _2110 = _2262;
                    _2086 = _2254;
                    _2104 = _2260;
                    _2098 = _2258;
                    _2118 = _2264;
                    _2180 = true;
                }
                else
                {
                    _2092 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2110 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2086 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2104 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2098 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2118 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2180 = false;
    float _2266 = _2092;
    float _2268 = _2110;
    float _2270 = _2086;
    float _2272 = _2104;
    float _2274 = _2098;
    float _2276 = _2118;
    float _2278 = fma(_1920, -0.5, 0.5);
    float _2280 = precise::clamp(_2278, 0.0, 1.0);
    float _2282 = -_2266;
    float _2284 = _2282 + _2268;
    float _2286 = _2062 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2288 = -_2270;
    float _2290 = _2288 + _2272;
    float _2292 = fma(_2280, _2284, _2266);
    out.m_101.x = 0.0;
    float _2294 = -_2274;
    float _2296 = _2294 + _2276;
    float _2298 = fma(_2280, _2290, _2270);
    float _2300 = _2292 * 0.586610972881317138671875;
    out.m_59.x = _2286;
    bool _2302 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2304 = fma(_2280, _2296, _2274);
    float _2306 = fma(_2298, 0.298911988735198974609375, _2300);
    bool _2308 = _1902 > 0.0;
    bool _2310 = isnan(_1902);
    bool _2312 = _2308 || _2310;
    bool _2314 = isnan(0.0);
    bool _2316 = _2312 || _2314;
    float _2318 = fma(_2304, 0.114477999508380889892578125, _2306);
    float _2320 = -_2318;
    float _2322 = _2298 + _2320;
    float _2324 = -_2318;
    float _2326 = _2292 + _2324;
    float _2328 = -_2318;
    float _2330 = _2304 + _2328;
    float _2332 = fma(_2322, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2318);
    float _2334 = fma(_2326, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2318);
    float _2336 = fma(_2330, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2318);
    bool _2338 = !_2302;
    if (!_2338)
    {
        float _2340 = -_498;
        float _2342 = _2340 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2344 = -_500;
        float _2346 = _2344 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2348 = -_502;
        float _2350 = _2348 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2352 = _2342 * _2342;
        float _2354 = fma(_2346, _2346, _2352);
        float _2356 = fma(_2350, _2350, _2354);
        float _2358 = sqrt(_2356);
        float _2360 = rsqrt(_2356);
        float _2362 = -_2358;
        float _2364 = _2362 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2366 = _2364 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2368 = precise::clamp(_2366, 0.0, 1.0);
        float _2370 = _2346 * _2360;
        float _2372 = _2342 * _2360;
        float _2374 = abs(_2368);
        float _2376 = log2(_2374);
        float _2378 = _2350 * _2360;
        float _2380 = _2370 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2382 = _1920 * _2372;
        float _2384 = -_2372;
        float _2386 = -_2380;
        float _2388 = fma(_2384, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2386);
        float _2390 = fma(_1916, _2370, _2382);
        float _2392 = -_2378;
        float _2394 = fma(_2392, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2388);
        float _2396 = fma(_1936, _2378, _2390);
        float _2398 = precise::clamp(_2396, 0.0, 1.0);
        float _2400 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2402 = _2394 + _2400;
        float _2404 = _2376 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2406 = _2402 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2408 = precise::clamp(_2406, 0.0, 1.0);
        float _2410 = exp2(_2404);
        float _2412 = _2410 * _2408;
        float _2414 = _2398 * _2412;
        float _2416 = _2414 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2418 = _2414 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2420 = _2414 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_101.x = _2416;
        out.m_101.y = _2418;
        out.m_101.z = _2420;
    }
    out.m_103.x = _2332;
    out.m_103.y = _2334;
    out.m_103.z = _2336;
    if (_2316)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_59.x = 0.0;
    float _2422 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2422;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2180 = false;
    bool _318 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _117 = in.m_56.w;
    float _119 = trunc(_117);
    int _122 = int(_119);
    bool _126 = _122 >= 1;
    float _128 = 0.0;
    if (!_126)
    {
        _128 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _130 = _128;
    float _132 = _130;
    if (!_126)
    {
        out.m_59.x = 0.0;
    }
    int _134 = 0;
    if (!_126)
    {
        float _136 = _130 * 5.0;
        _134 = as_type<int>(_136);
    }
    int _138 = _134;
    int _140 = _138;
    if (!_126)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2479 = as_type<float>(_138);
        out.gl_Position.z = _2479;
    }
    if (!_126)
    {
        return out;
    }
    float _142 = in.m_61.w;
    bool _144 = _142 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _146 = isnan(_142);
    bool _148 = _144 || _146;
    bool _150 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _152 = _148 || _150;
    float _154 = -_142;
    float _156 = _154 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _158 = 0.0;
    if (_152)
    {
        float _160 = float(_122);
        _158 = _160;
    }
    float _162 = _158;
    bool _164 = _156 >= _162;
    bool _166 = !_152;
    bool _168 = _164 || _166;
    if (_168)
    {
        _132 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _170 = _132;
    if (_168)
    {
        out.m_59.x = 0.0;
    }
    if (_168)
    {
        float _172 = _170 * 5.0;
        _140 = as_type<int>(_172);
    }
    int _174 = _140;
    if (_168)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2547 = as_type<float>(_174);
        out.gl_Position.z = _2547;
    }
    if (_168)
    {
        return out;
    }
    float _176 = in.m_63.w;
    float _178 = _156 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _180 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _182 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _184 = _180 || _182;
    bool _186 = isnan(1.0);
    bool _188 = _184 || _186;
    float _190 = in.m_61.x;
    float _192 = in.m_61.y;
    float _194 = in.m_61.z;
    float _196 = in.m_56.x;
    float _198 = in.m_56.y;
    float _200 = in.m_56.z;
    float _202 = 0.0;
    float _204 = _178;
    if (!_188)
    {
        float _206 = _178 * _178;
        float _208 = _206 * 0.5;
        _202 = _208;
    }
    float _210 = _202;
    float _212 = _210;
    if (!_188)
    {
        float _214 = _210 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _212 = _214;
    }
    float _216 = _212;
    bool _218 = !_188;
    float _220 = _216;
    if (!_218)
    {
        float _222 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _224 = log2(_222);
        float _226 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _228 = _226 + 1.0;
        float _230 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _232 = _178 * _224;
        float _234 = 1.0 / _228;
        float _236 = _230 * 0.693147182464599609375;
        float _238 = exp2(_232);
        float _240 = 1.0 / _236;
        float _242 = _238 + (-1.0);
        float _244 = -_242;
        float _246 = fma(_244, _240, _178);
        float _248 = _246 * _234;
        float _250 = _248 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _220 = _250;
    }
    float _252 = _220;
    bool _254 = !_188;
    if (!_254)
    {
        float _256 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _258 = log2(_256);
        float _260 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _262 = _260 + 1.0;
        float _264 = 1.0 / _262;
        float _266 = _178 * _258;
        float _268 = exp2(_266);
        float _270 = -_268;
        float _272 = _270 + 1.0;
        float _274 = _272 * _264;
        _204 = _274;
    }
    float _276 = _204;
    bool _278 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _280 = _252 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _282 = _252 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _284 = _252 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _286 = fma(_276, _190, _280);
    float _288 = fma(_276, _192, _282);
    float _290 = fma(_276, _194, _284);
    float _292 = fma(_286, _176, _196);
    float _294 = fma(_288, _176, _198);
    float _296 = fma(_290, _176, _200);
    bool _298 = !_278;
    float _316;
    if (!_298)
    {
        float _300 = in.m_65.x;
        float _302 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _304 = _300 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _306 = fma(_304, (*spvDescriptorSet0.vp_c9)._m0[11].y, _156);
        float _308 = _306 * _302;
        float _310 = floor(_308);
        float _312 = -_310;
        float _314 = _308 + _312;
        _316 = _314;
        _318 = true;
    }
    else
    {
        float _320 = float(_122);
        float _322 = 1.0 / _320;
        float _324 = _156 * _322;
        _316 = _324;
    }
    _318 = false;
    float _326 = _316;
    float _328 = in.m_63.x;
    float _330 = in.m_63.y;
    float _332 = in.m_63.z;
    float _334 = in.m_67.x;
    float _336 = in.m_67.y;
    float _338 = in.m_67.z;
    float _340 = _328 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _342 = _330 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _344 = _332 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _346 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _334);
    float _348 = _340 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _350 = _342 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _352 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _338);
    float _354 = _344 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _356 = _346 * _348;
    float _358 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _336);
    float _360 = _294 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _362 = _352 * _354;
    float _364 = _358 * _350;
    float _366 = _294 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _368 = fma(_292, (*spvDescriptorSet0.vp_c10)._m0[6].x, _360);
    float _370 = _364 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _372 = fma(_292, (*spvDescriptorSet0.vp_c10)._m0[4].x, _366);
    float _374 = fma(_296, (*spvDescriptorSet0.vp_c10)._m0[6].z, _368);
    float _376 = _364 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _378 = fma(_356, (*spvDescriptorSet0.vp_c10)._m0[10].x, _370);
    float _380 = fma(_296, (*spvDescriptorSet0.vp_c10)._m0[4].z, _372);
    float _382 = _374 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _384 = fma(_356, (*spvDescriptorSet0.vp_c10)._m0[8].x, _376);
    float _386 = fma(_362, (*spvDescriptorSet0.vp_c10)._m0[10].z, _378);
    float _388 = _380 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _390 = fma(_362, (*spvDescriptorSet0.vp_c10)._m0[8].z, _384);
    float _392 = _382 + _386;
    float _394 = _388 + _390;
    float _396 = _294 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _398 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _400 = _392 + _398;
    float _402 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _404 = _394 + _402;
    float _406 = fma(_292, (*spvDescriptorSet0.vp_c10)._m0[5].x, _396);
    float _408 = _400 * _400;
    float _410 = fma(_296, (*spvDescriptorSet0.vp_c10)._m0[5].z, _406);
    float _412 = fma(_404, _404, _408);
    float _414 = _410 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _416 = sqrt(_412);
    float _418 = _414 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _420 = fma(_388, (*spvDescriptorSet0.vp_c8)._m0[11].x, _418);
    float _422 = fma(_382, (*spvDescriptorSet0.vp_c8)._m0[11].z, _420);
    float _424 = _364 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _426 = _422 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    bool _428 = _416 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _430 = fma(_356, (*spvDescriptorSet0.vp_c10)._m0[9].x, _424);
    float _432 = _414 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _434 = 1.0 / _426;
    float _436 = fma(_362, (*spvDescriptorSet0.vp_c10)._m0[9].z, _430);
    float _438 = fma(_388, (*spvDescriptorSet0.vp_c8)._m0[10].x, _432);
    float _440 = _414 + _436;
    float _442 = _432;
    float _444 = _362;
    float _446 = _422;
    if (!_428)
    {
        _442 = _394;
    }
    float _448 = _442;
    float _450 = _448;
    if (!_428)
    {
        _444 = _392;
    }
    float _452 = _444;
    float _454 = _452;
    if (!_428)
    {
        _446 = _440;
    }
    float _456 = _446;
    bool _458 = !_428;
    float _460 = _456;
    if (!_458)
    {
        float _462 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _464 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _466 = _416 + _464;
        float _468 = _440 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _470 = rsqrt(_412);
        float _472 = _466 * _462;
        float _474 = _472 * 0.15915493667125701904296875;
        float _476 = _474 * 6.283185482025146484375;
        float _478 = cos(_476);
        float _480 = _474 * 6.283185482025146484375;
        float _482 = sin(_480);
        float _484 = _478 + (-1.0);
        float _486 = _484 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _488 = fma(_482, _468, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _490 = fma(_440, _478, _486);
        float _492 = _470 * _488;
        float _494 = fma(_404, _492, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _496 = fma(_400, _492, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _460 = _490;
        _450 = _494;
        _454 = _496;
    }
    float _498 = _460;
    float _500 = _450;
    float _502 = _454;
    float _504 = fma(_382, (*spvDescriptorSet0.vp_c8)._m0[10].z, _438);
    float _506 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _508 = _498 + _506;
    float _510 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _512 = _500 + _510;
    float _514 = _504 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _516 = _508 * _508;
    float _518 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _520 = _502 + _518;
    float _522 = _514 + _426;
    float _524 = fma(_512, _512, _516);
    float _526 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _528 = _522 * _434;
    float _530 = _528 * 0.5;
    float _532 = fma(_520, _520, _524);
    float _534 = _414 + _526;
    float _536 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _538 = fma(_530, (*spvDescriptorSet0.vp_c8)._m0[30].w, _536);
    float _540 = rsqrt(_532);
    float _542 = _534 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _544 = _534 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _546 = fma(_388, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _548 = _498 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _550 = fma(_388, (*spvDescriptorSet0.vp_c15)._m0[126].x, _542);
    float _552 = fma(_388, (*spvDescriptorSet0.vp_c15)._m0[127].x, _544);
    float _554 = 1.0 / _538;
    float _556 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _558 = fma(_382, (*spvDescriptorSet0.vp_c15)._m0[127].z, _552);
    float _560 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _562 = _558 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _564 = _540 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _566 = sqrt(_532);
    float _568 = _512 * _564;
    float _570 = _520 * _564;
    float _572 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _574 = _554 * _572;
    float _576 = _568 * _568;
    float _578 = _570 * _570;
    float _580 = fma(_382, (*spvDescriptorSet0.vp_c15)._m0[126].z, _550);
    bool _582 = _574 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _584 = _576 + _578;
    bool _586 = _574 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _588 = _580 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    bool _590 = !_582;
    int _592 = _590 ? 0 : 1;
    float _594 = sqrt(_584);
    int _596 = 2;
    float _598 = _584;
    int _600 = as_type<int>(_556);
    float _602 = _568;
    float _604 = _570;
    float _606 = _576;
    float _608 = _578;
    float _610 = _512;
    float _612 = _520;
    if (!_582)
    {
        _596 = 1;
    }
    int _614 = _596;
    float _616 = trunc(_588);
    int _618 = int(_616);
    int _620 = _614;
    if (!_586)
    {
        _620 = _592;
    }
    int _622 = _620;
    int _624 = _622 << 6;
    bool _626 = _594 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _628 = trunc(_562);
    int _630 = int(_628);
    int _632 = _624 + 96;
    uint _635 = uint(int(uint(_632) >> uint(2)));
    uint _637 = uint(int(uint(int(_635)) >> uint(2)));
    int _639 = int(_635) & 3;
    float _641 = (*spvDescriptorSet0.vp_c15)._m0[int(_637)][_639];
    int _643 = int(_635) + 1;
    uint _645 = uint(int(uint(_643) >> uint(2)));
    int _647 = _643 & 3;
    float _649 = (*spvDescriptorSet0.vp_c15)._m0[int(_645)][_647];
    float _651 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _653 = _594 + _651;
    int _655 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _657 = _618 + _655;
    int _659 = _657 + 1;
    int _661 = _624 + 48;
    uint _663 = uint(int(uint(_661) >> uint(2)));
    uint _665 = uint(int(uint(int(_663)) >> uint(2)));
    int _667 = int(_663) & 3;
    float _669 = (*spvDescriptorSet0.vp_c15)._m0[int(_665)][_667];
    int _671 = int(_663) + 1;
    uint _673 = uint(int(uint(_671) >> uint(2)));
    int _675 = _671 & 3;
    float _677 = (*spvDescriptorSet0.vp_c15)._m0[int(_673)][_675];
    float _679 = as_type<float>(_618);
    float _681 = _653;
    int _683 = _659;
    float _685 = as_type<float>(_622);
    if (_626)
    {
        float _687 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _679 = _687;
    }
    float _689 = _679;
    bool _691 = _659 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _693 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _695 = _630 + _693;
    int _697 = _695 + 1;
    int _699 = _624 + 104;
    uint _701 = uint(int(uint(_699) >> uint(2)));
    uint _703 = uint(int(uint(int(_701)) >> uint(2)));
    int _705 = int(_701) & 3;
    float _707 = (*spvDescriptorSet0.vp_c15)._m0[int(_703)][_705];
    int _709 = int(_701) + 1;
    uint _711 = uint(int(uint(_709) >> uint(2)));
    int _713 = _709 & 3;
    float _715 = (*spvDescriptorSet0.vp_c15)._m0[int(_711)][_713];
    int _717 = _659 | _697;
    if (_626)
    {
        float _719 = rsqrt(_584);
        _598 = _719;
    }
    float _721 = _598;
    bool _723 = _717 < 0;
    bool _725 = _723 || _691;
    int _727 = _624 + 64;
    uint _729 = uint(int(uint(_727) >> uint(2)));
    uint _731 = uint(int(uint(int(_729)) >> uint(2)));
    int _733 = int(_729) & 3;
    float _735 = (*spvDescriptorSet0.vp_c15)._m0[int(_731)][_733];
    int _737 = int(_729) + 1;
    uint _739 = uint(int(uint(_737) >> uint(2)));
    int _741 = _737 & 3;
    float _743 = (*spvDescriptorSet0.vp_c15)._m0[int(_739)][_741];
    bool _745 = _697 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _747 = _745 || _725;
    if (_626)
    {
        float _749 = _653 * _689;
        _681 = _749;
    }
    float _751 = _681;
    float _753 = floor(_546);
    float _755 = 0.0;
    if (_626)
    {
        float _757 = _751 * 0.15915493667125701904296875;
        _755 = _757;
    }
    float _759 = _755;
    int _761 = _624 + 56;
    uint _763 = uint(int(uint(_761) >> uint(2)));
    uint _765 = uint(int(uint(int(_763)) >> uint(2)));
    int _767 = int(_763) & 3;
    float _769 = (*spvDescriptorSet0.vp_c15)._m0[int(_765)][_767];
    int _771 = int(_763) + 1;
    uint _773 = uint(int(uint(_771) >> uint(2)));
    int _775 = _771 & 3;
    float _777 = (*spvDescriptorSet0.vp_c15)._m0[int(_773)][_775];
    float _779 = _751;
    if (_626)
    {
        float _781 = _759 * 6.283185482025146484375;
        float _783 = cos(_781);
        _779 = _783;
    }
    float _785 = _779;
    if (!_747)
    {
        int _787 = _697 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _789 = _787 + _659;
        _683 = _789;
    }
    int _791 = _683;
    float _793 = precise::max(0.0, _556);
    float _795 = 0.0;
    if (_626)
    {
        float _797 = _759 * 6.283185482025146484375;
        float _799 = sin(_797);
        _795 = _799;
    }
    float _801 = _795;
    int _803 = 0;
    if (!_747)
    {
        int _805 = _791 << 2;
        _803 = _805;
    }
    int _807 = _803;
    float _809 = -_753;
    float _811 = _546 + _809;
    float _813 = _534 * _649;
    int _815 = 0;
    float _817 = _813;
    if (!_747)
    {
        uint _819 = uint(int(uint(_791) >> uint(2)));
        _815 = int(_819);
    }
    int _821 = _815;
    float _823 = as_type<float>(_821);
    if (!_747)
    {
        int _825 = 12 & _807;
        _600 = _825;
    }
    int _827 = _600;
    float _829 = -_564;
    float _831 = -_793;
    float _833 = fma(_508, _829, _831);
    float _835 = fma(_388, _641, _813);
    float _837 = _677;
    float _839 = as_type<float>(_827);
    if (_626)
    {
        float _841 = _785 + (-1.0);
        _817 = _841;
    }
    float _843 = _817;
    float _845 = _843;
    if (!_747)
    {
        int _847 = _821 << 4;
        int _849 = _847 + _827;
        _823 = as_type<float>(_849);
    }
    float _851 = _823;
    float _853 = _534 * _677;
    if (_626)
    {
        float _855 = _833 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _837 = _855;
    }
    float _857 = _837;
    if (_626)
    {
        float _859 = _843 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _845 = _859;
    }
    float _861 = _845;
    if (!_626)
    {
        _839 = _833;
    }
    float _863 = _839;
    float _865 = fma(_388, _669, _853);
    float _867 = _801;
    float _869 = _863;
    if (_626)
    {
        float _871 = fma(_801, _857, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _867 = _871;
    }
    float _873 = _867;
    float _875 = _873;
    if (_626)
    {
        float _877 = fma(_833, _785, _861);
        _869 = _877;
    }
    float _879 = _869;
    float _881 = fma(_382, _707, _835);
    if (_626)
    {
        float _883 = _721 * _873;
        _875 = _883;
    }
    float _885 = _875;
    int _887 = _624 + 72;
    uint _889 = uint(int(uint(_887) >> uint(2)));
    uint _891 = uint(int(uint(int(_889)) >> uint(2)));
    int _893 = int(_889) & 3;
    float _895 = (*spvDescriptorSet0.vp_c15)._m0[int(_891)][_893];
    int _897 = int(_889) + 1;
    uint _899 = uint(int(uint(_897) >> uint(2)));
    int _901 = _897 & 3;
    float _903 = (*spvDescriptorSet0.vp_c15)._m0[int(_899)][_901];
    float _905 = _498 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _907 = fma(_382, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    if (_626)
    {
        float _909 = _568 * _885;
        _602 = _909;
    }
    float _911 = _602;
    if (_626)
    {
        float _913 = _570 * _885;
        _604 = _913;
    }
    float _915 = _604;
    float _917 = _881 + _715;
    float _919 = _534 * _743;
    if (_626)
    {
        float _921 = _911 * _911;
        _606 = _921;
    }
    float _923 = _606;
    if (_626)
    {
        float _925 = _915 * _915;
        _608 = _925;
    }
    float _927 = _608;
    float _929 = fma(_500, (*spvDescriptorSet0.vp_c8)._m0[2].x, _905);
    float _931 = fma(_388, _735, _919);
    float _933 = fma(_879, _879, _923);
    int _935 = _624 + 80;
    uint _937 = uint(int(uint(_935) >> uint(2)));
    uint _939 = uint(int(uint(int(_937)) >> uint(2)));
    int _941 = int(_937) & 3;
    float _943 = (*spvDescriptorSet0.vp_c15)._m0[int(_939)][_941];
    int _945 = int(_937) + 1;
    uint _947 = uint(int(uint(_945) >> uint(2)));
    int _949 = _945 & 3;
    float _951 = (*spvDescriptorSet0.vp_c15)._m0[int(_947)][_949];
    float _953 = _498 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _955 = fma(_502, (*spvDescriptorSet0.vp_c8)._m0[2].z, _929);
    float _957 = _933 + _927;
    float _959 = _498 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _961 = fma(_382, _769, _865);
    float _963 = fma(_500, (*spvDescriptorSet0.vp_c8)._m0[0].x, _953);
    float _965 = _955 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    int _967 = _624 + 88;
    uint _969 = uint(int(uint(_967) >> uint(2)));
    uint _971 = uint(int(uint(int(_969)) >> uint(2)));
    int _973 = int(_969) & 3;
    float _975 = (*spvDescriptorSet0.vp_c15)._m0[int(_971)][_973];
    int _977 = int(_969) + 1;
    uint _979 = uint(int(uint(_977) >> uint(2)));
    int _981 = _977 & 3;
    float _983 = (*spvDescriptorSet0.vp_c15)._m0[int(_979)][_981];
    float _985 = rsqrt(_957);
    float _987 = fma(_500, (*spvDescriptorSet0.vp_c8)._m0[1].x, _959);
    float _989 = fma(_502, (*spvDescriptorSet0.vp_c8)._m0[0].z, _963);
    float _991 = _965 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _993 = fma(_502, (*spvDescriptorSet0.vp_c8)._m0[1].z, _987);
    float _995 = _851;
    if (!_747)
    {
        int _997 = as_type<int>(_851) + 400;
        uint _999 = uint(int(uint(_997) >> uint(2)));
        uint _1001 = uint(int(uint(int(_999)) >> uint(2)));
        int _1003 = int(_999) & 3;
        float _1005 = (*spvDescriptorSet0.vp_c15)._m0[int(_1001)][_1003];
        _995 = _1005;
    }
    float _1007 = _995;
    float _1009 = 1.0 / _917;
    float _1011 = _993 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1013 = fma(_500, (*spvDescriptorSet0.vp_c8)._m0[3].x, _548);
    float _1015 = _989 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1017 = -_991;
    float _1019 = fma(_1017, _560, 1.0);
    float _1021 = _1011 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1023 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1025 = fma(_566, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1023);
    float _1027 = precise::clamp(_1025, 0.0, 1.0);
    float _1029 = fma(_502, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1013);
    float _1031 = floor(_907);
    float _1033 = fma(_1015, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1021);
    float _1035 = _985 * _911;
    float _1037 = -_1027;
    float _1039 = _1037 + 1.0;
    float _1041 = _1029 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1043 = fma(_965, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1033);
    float _1045 = _1035 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1047 = _961 + _777;
    float _1049 = abs(_1039);
    float _1051 = log2(_1049);
    float _1053 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1043);
    float _1055 = _985 * _879;
    float _1057 = fma(_382, _895, _931);
    float _1059 = _1047 * _1009;
    float _1061 = _985 * _915;
    float _1063 = -_1045;
    float _1065 = fma(_1055, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1063);
    float _1067 = _1057 + _903;
    float _1069 = _707;
    float _1071 = _1019;
    if (!_747)
    {
        float _1073 = floor(_562);
        _1069 = _1073;
    }
    float _1075 = _1069;
    bool _1077 = _1059 >= 0.0;
    float _1079 = -_1031;
    float _1081 = _907 + _1079;
    float _1083 = _1067 * _1009;
    float _1085 = -_1061;
    float _1087 = fma(_1085, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1065);
    bool _1089 = _1059 <= 1.0;
    bool _1091 = _1089 && _1077;
    float _1093 = _534 * _951;
    float _1095 = _1051 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    bool _1097 = _1083 >= 0.0;
    bool _1099 = _1097 && _1091;
    float _1101 = fma(_1087, -0.5, 0.5);
    float _1103 = fma(_388, _943, _1093);
    float _1105 = fma(_1087, 0.5, 0.5);
    bool _1107 = _1083 <= 1.0;
    bool _1109 = _1107 && _1099;
    float _1111 = exp2(_1095);
    float _1113 = fma(_382, _975, _1103);
    float _1115 = fma(_1105, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1117 = _1011 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1119 = _1113 + _983;
    float _1121 = fma(_1105, _1115, -0.212114393711090087890625);
    float _1123 = fma(_1015, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1117);
    float _1125 = log2(_1019);
    float _1127 = fma(_1105, _1121, 1.570728778839111328125);
    float _1129 = fma(_965, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1123);
    if (_1109)
    {
        float _1131 = float(_622);
        _685 = _1131;
    }
    float _1133 = _685;
    float _1135 = _1055 + 1.0;
    float _1137 = sqrt(_1101);
    if (!_747)
    {
        float _1139 = -_1075;
        float _1141 = _562 + _1139;
        _1071 = _1141;
    }
    float _1143 = _1071;
    float _1145 = _1011 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1147 = -_1055;
    float _1149 = fma(_1111, _1135, _1147);
    float _1151 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1129);
    float _1153 = fma(_1015, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1145);
    float _1155 = 1.0 / _1053;
    float _1157 = _1125 * 0.693147182464599609375;
    float _1159 = fma(_965, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1153);
    float _1161 = _785;
    float _1163 = _1159;
    float _1165 = _1151;
    if (!_747)
    {
        float _1167 = floor(_588);
        _1161 = _1167;
    }
    float _1169 = _1161;
    float _1171 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1159);
    float _1173 = _1137 * 0.636619746685028076171875;
    float _1175 = _1157 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float2 _4211 = float2(_811, _1081);
    float _1177 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4211, float2(0.0), isnan(_4211)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4211, float2(0.0), isnan(_4211)), level(0.0)).x;
    float _1179 = -_1127;
    float _1181 = fma(_1173, _1179, 1.0);
    float _1183 = _943;
    if (!_747)
    {
        float _1185 = rint(_1007);
        float _1187 = precise::max(_1185, 0.0);
        uint _1189 = uint(_1187);
        uint _1191 = clamp(_1189, 0u, 65535u);
        _1183 = as_type<float>(_1191);
    }
    float _1193 = _1183;
    float _1195 = _1151 * _1155;
    float _1197 = _1171 * _1155;
    float _1199 = _1119 * _1009;
    float _1201 = fma(_1195, 0.5, 0.5);
    float _1203 = fma(_1197, -0.5, 0.5);
    float _1205 = _1153;
    if (_1109)
    {
        float _1207 = rint(_1133);
        float _1209 = precise::max(_1207, 0.0);
        uint _1211 = uint(_1209);
        uint _1213 = clamp(_1211, 0u, 65535u);
        _1205 = as_type<float>(_1213);
    }
    float _1215 = _1205;
    if (!_747)
    {
        float _1217 = -_1169;
        float _1219 = _588 + _1217;
        _1163 = _1219;
    }
    float _1221 = _1163;
    float _1223 = fma(_1149, 0.5, 0.5);
    float _1225 = _588;
    if (!_747)
    {
        float3 _4292 = float3(_1221, _1143, float(as_type<int>(_1193)));
        float3 _4296 = select(_4292, float3(0.0), isnan(_4292));
        float _1227 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _4296.xy, uint(rint(_4296.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _4296.xy, uint(rint(_4296.z)), level(0.0)).x;
        _1225 = _1227;
    }
    float _1229 = _1225;
    float _1231 = _1083;
    if (_1109)
    {
        float3 _4311 = float3(_1059, _1083, float(as_type<int>(_1215)));
        float3 _4313 = select(_4311, float3(0.0), isnan(_4311));
        float _1233 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _4313.xy, uint(rint(_4313.z)), _1199, level(0.0));
        _1231 = _1233;
    }
    float _1235 = _1231;
    float3 _4323 = float3(_1201, _1203, _1175);
    float _1237 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4323, float3(0.0), isnan(_4323)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4323, float3(0.0), isnan(_4323)), level(0.0)).x;
    float3 _4332 = float3(_1201, _1203, _1175);
    float4 _1240 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4332, float3(0.0), isnan(_4332)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4332, float3(0.0), isnan(_4332)), level(0.0)).xyzw;
    float _1242 = _1240.x;
    float _1244 = _1240.y;
    float _1246 = _1240.z;
    float _1248 = _1240.w;
    float2 _4348 = float2(_1181, _1223);
    float3 _1252 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4348, float2(0.0), isnan(_4348)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4348, float2(0.0), isnan(_4348)), level(0.0)).xyz;
    float _1254 = _1252.x;
    float _1256 = _1252.y;
    float _1258 = _1252.z;
    float _1260 = in.m_69.y;
    float _1262 = _1011 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1264 = in.m_65.x;
    float _1266 = in.m_65.y;
    float _1268 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1270 = _1268 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1272 = in.m_71.w;
    float _1274 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1276 = _1274 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1278 = in.m_71.y;
    float _1280 = _1051 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1282 = in.m_71.z;
    float _1284 = in.m_65.w;
    float _1286 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1288 = -_1260;
    float _1290 = _1288 + 1.0;
    float _1292 = in.m_71.x;
    int _1294 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1296 = _1294 != 0;
    float _1298 = 1.0 / _1270;
    bool _1300 = _1266 > 0.5;
    float _1302 = _1266 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1304 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1306 = _1304 != 0;
    float _1308 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1310 = _1300 ? as_type<int>(_1290) : as_type<int>(_1260);
    out.m_73.w = _1272;
    int _1312 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1314 = _1312 != 0;
    float _1316 = 1.0 / _1276;
    int _1318 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1320 = _1318 != 0;
    out.m_73.y = _1278;
    int _1322 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1324 = _1322 != 0;
    float _1326 = fma(_1302, -2.0, _1308);
    float _1328 = _1320 ? as_type<float>(_1310) : _1260;
    float _1330 = in.m_75.x;
    float _1332 = in.m_75.y;
    float _1334 = in.m_75.z;
    float _1336 = in.m_75.w;
    float _1338 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1340 = _1284 > 0.5;
    float _1342 = _1264 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    out.m_73.z = _1282;
    float _1344 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1346 = -_1286;
    float _1348 = fma(_1342, 2.0, _1346);
    float _1350 = _1282;
    float _1352 = _1260;
    bool _1354 = _1324;
    bool _1356 = _1340;
    if (_1314)
    {
        float _1358 = in.m_65.x;
        _1350 = _1358;
    }
    float _1360 = _1350;
    float _1362 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1364 = _1342;
    if (_1296)
    {
        float _1366 = in.m_65.z;
        _1364 = _1366;
    }
    float _1368 = _1364;
    float _1370 = _1344 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1372 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1374 = _1362 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_73.x = _1292;
    float _1376 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1378 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1376;
    float _1380 = _1372 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_1324)
    {
        float _1382 = _1340 ? _1290 : _1260;
        _1352 = _1382;
    }
    float _1384 = _1352;
    float _1386 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1388 = _1378 * _1298;
    float _1390 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1392 = _1390 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1394 = _1332 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1396 = _1332 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1398 = _1392 * _1316;
    float _1400 = fma(_1330, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1394);
    float _1402 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1404 = fma(_1330, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1396);
    float _1406 = in.m_69.x;
    float _1408 = _1386;
    float _1410 = _1404;
    float _1412 = _1338;
    float _1414 = _1406;
    if (_1314)
    {
        bool _1416 = _1360 > 0.5;
        _1354 = _1416;
    }
    bool _1418 = _1354;
    float _1420 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1326);
    float _1422 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    out.m_77.x = _1370;
    out.m_77.y = _1374;
    out.m_77.z = _1380;
    out.m_77.w = _1402;
    if (_1296)
    {
        bool _1424 = _1368 > 0.5;
        _1356 = _1424;
    }
    bool _1426 = _1356;
    float _1428 = -_156;
    float _1430 = fma(_1428, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1348);
    float _1432 = fma(_1015, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1262);
    float _1434 = _1360;
    if (!_1306)
    {
        float _1436 = in.m_65.z;
        _1434 = _1436;
    }
    float _1438 = _1434;
    float _1440 = exp2(_1280);
    float _1442 = fma(_965, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1432);
    out.m_79.x = _512;
    out.m_79.y = _508;
    out.m_79.z = _520;
    float _1444 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1442);
    float _1446 = _1332 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1448 = fma(_1264, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1386);
    if (!_1306)
    {
        _1408 = _1266;
    }
    float _1450 = _1408;
    float _1452 = fma(_1334, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1400);
    float _1454 = _1450;
    if (_1306)
    {
        _1454 = _1264;
    }
    float _1456 = _1454;
    float _1458 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1460 = _326 + _1458;
    float _1462 = fma(_1330, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1446);
    float _1464 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1466 = _326 + _1464;
    float _1468 = fma(_1334, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1404);
    float _1470 = fma(_1398, _1460, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1472 = fma(_1334, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1462);
    float _1474 = _1338 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _1476 = _326 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1478 = isnan(_326);
    bool _1480 = _1476 || _1478;
    bool _1482 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1484 = _1480 || _1482;
    float _1486 = float(_1484);
    float _1488 = fma(_1388, _1466, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1490 = _1438;
    int _1492 = as_type<int>(_1456);
    if (!_1306)
    {
        _1410 = _1438;
    }
    float _1494 = _1410;
    float _1496 = fma(_1474, _1328, -0.5);
    out.m_81.x = _1452;
    out.m_81.y = _1472;
    out.m_81.z = _1468;
    bool _1498 = _326 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1500 = isnan(_326);
    bool _1502 = _1498 || _1500;
    bool _1504 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1506 = _1502 || _1504;
    float _1508 = float(_1506);
    float _1510 = -_1486;
    float _1512 = _1510 + 1.0;
    bool _1514 = _326 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1516 = isnan(_326);
    bool _1518 = _1514 || _1516;
    bool _1520 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1522 = _1518 || _1520;
    float _1524 = float(_1522);
    out.gl_Position.x = _1151;
    out.gl_Position.y = _1171;
    out.gl_Position.z = _1444;
    out.gl_Position.w = _1053;
    float _1526 = _1494;
    if (_1306)
    {
        _1526 = _1266;
    }
    float _1528 = _1526;
    float _1530 = _1508 * _1512;
    float _1532 = -_1508;
    float _1534 = _1532 + 1.0;
    if (_1306)
    {
        _1490 = _1266;
    }
    float _1536 = _1490;
    bool _1538 = _336 != 0.0;
    bool _1540 = isnan(_336);
    bool _1542 = _1538 || _1540;
    bool _1544 = isnan(0.0);
    bool _1546 = _1542 || _1544;
    float _1548 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    if (!_1314)
    {
        _1412 = _1406;
    }
    float _1550 = _1412;
    float _1552 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _1554 = _334 == 0.0;
    bool _1556 = !_1546;
    bool _1558 = _1554 && _1556;
    float _1560 = fma(_1266, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1548);
    float _1562 = fma(_1456, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1422);
    float _1564 = _1456 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _1566 = _338 == 0.0;
    bool _1568 = _1566 && _1558;
    float _1570 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1560);
    float _1572 = _1524 * _1534;
    float _1574 = _1550;
    float _1576 = _1564;
    if (_1314)
    {
        float _1578 = -_1406;
        float _1580 = _1578 + 1.0;
        _1492 = as_type<int>(_1580);
    }
    int _1582 = _1492;
    float _1584 = -_1420;
    float _1586 = fma(_1570, _1496, _1584);
    float _1588 = _1488 * _1572;
    float _1590 = in.m_83.x;
    float _1592 = in.m_83.y;
    float _1594 = in.m_83.z;
    float _1596 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1598 = _1552 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1600 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _1602 = _1582;
    if (_1314)
    {
        float _1604 = _1418 ? as_type<float>(_1582) : _1406;
        _1574 = _1604;
    }
    float _1606 = _1574;
    if (_1296)
    {
        float _1608 = -_1406;
        float _1610 = _1608 + 1.0;
        _1602 = as_type<int>(_1610);
    }
    int _1612 = _1602;
    float _1614 = fma(_1598, _1384, -0.5);
    float _1616 = fma(_1536, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1600);
    float _1618 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1620 = -_1524;
    float _1622 = _1620 + 1.0;
    float _1624 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _1626 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1628 = isnan(0.5);
    bool _1630 = _1626 || _1628;
    bool _1632 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1634 = _1630 || _1632;
    float _1636 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1638 = _1528 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1640 = -_1624;
    float _1642 = fma(_1564, 2.0, _1640);
    float _1644 = _1638;
    float _1646 = as_type<float>(_1612);
    float _1648 = _1636;
    if (!_1296)
    {
        _1576 = _1406;
    }
    float _1650 = _1576;
    float _1652 = fma(_1622, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1588);
    float _1654 = fma(_1638, -2.0, _1636);
    float _1656 = _1650;
    if (_1296)
    {
        float _1658 = _1426 ? as_type<float>(_1612) : _1406;
        _1656 = _1658;
    }
    float _1660 = _1656;
    float _1662 = -_156;
    float _1664 = fma(_1662, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1642);
    float _1666 = fma(_1470, _1530, _1652);
    if (_1568)
    {
        _1644 = _1592;
    }
    float _1668 = _1644;
    float _1670 = _1618 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1672 = _1668;
    float _1674 = _1618;
    if (_1568)
    {
        _1646 = _1594;
    }
    float _1676 = _1646;
    float _1678 = fma(_1486, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1666);
    float _1680 = _1676;
    if (_1568)
    {
        _1414 = _1668;
    }
    float _1682 = _1414;
    float _1684 = fma(_1670, _1660, -0.5);
    float _1686 = _1682;
    if (!_1568)
    {
        _1672 = _1592;
    }
    float _1688 = _1672;
    float _1690 = _1596 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    if (_1568)
    {
        _1674 = _1676;
    }
    float _1692 = _1674;
    float _1694 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1616);
    float _1696 = _1692;
    if (!_1568)
    {
        _1680 = _1594;
    }
    float _1698 = _1680;
    float _1700 = fma(_1690, _1606, -0.5);
    float _1702 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1448);
    float _1704 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1562);
    float _1706 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1654);
    float _1708 = _1330 * _1688;
    if (_1568)
    {
        _1648 = _1590;
    }
    float _1710 = _1648;
    float _1712 = _1710;
    if (!_1568)
    {
        float _1714 = fma(_334, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1590);
        _1712 = _1714;
    }
    float _1716 = _1712;
    float _1718 = _1334 * _1590;
    float _1720 = -_1708;
    float _1722 = fma(_1332, _1590, _1720);
    float _1724 = fma(_1702, _1700, _1430);
    float _1726 = abs(_574);
    float _1728 = log2(_1726);
    float _1730 = _1332 * _1698;
    float _1732 = -_1718;
    float _1734 = fma(_1330, _1698, _1732);
    float _1736 = _1722 * _1336;
    float _1738 = fma(_1704, _1684, _1664);
    float _1740 = -_1730;
    float _1742 = fma(_1334, _1688, _1740);
    float _1744 = _1734 * _1336;
    float _1746 = -_1706;
    float _1748 = fma(_1694, _1614, _1746);
    float _1750 = _1742 * _1336;
    float _1752 = _1744 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1754 = _1744 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1756 = _1744 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1758 = fma(_1750, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1752);
    float _1760 = _1678 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1762 = _1728 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1764 = fma(_1750, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1754);
    float _1766 = fma(_1750, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1756);
    float _1768 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1770 = exp2(_1762);
    float _1772 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1774 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1776 = _1586 + 0.5;
    float _1778 = fma(_1736, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1764);
    float _1780 = fma(_1736, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1758);
    float _1782 = _1768 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1784 = _1772 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1786 = _1774 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1788 = _1444 + _1053;
    float _1790 = _1738 + 0.5;
    float _1792 = _1748 + 0.5;
    float _1794 = _1724 + 0.5;
    float _1796 = fma(_1736, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1766);
    float _1798 = _1788 * 0.5;
    out.m_85.x = _1782;
    out.m_85.y = _1784;
    out.m_85.z = _1786;
    out.m_85.w = _1760;
    float _1800 = fma(_1770, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1802 = precise::clamp(_1800, 0.0, 1.0);
    if (!_1568)
    {
        float _1804 = fma(_336, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1688);
        _1686 = _1804;
    }
    float _1806 = _1686;
    out.m_87.x = _1794;
    out.m_87.y = _1776;
    out.m_87.z = _1790;
    out.m_87.w = _1792;
    if (!_1568)
    {
        float _1808 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1698);
        _1696 = _1808;
    }
    float _1810 = _1696;
    bool _1812 = _574 <= 8000.0;
    bool _1814 = isnan(_574);
    bool _1816 = _1812 || _1814;
    bool _1818 = isnan(8000.0);
    bool _1820 = _1816 || _1818;
    float _1822 = float(_1820);
    float _1824 = fma(_1802, -2.0, 3.0);
    out.m_89.x = _1778;
    out.m_89.y = _1780;
    out.m_89.z = _1796;
    float _1826 = _1802 * _1802;
    float _1828 = _1806 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1830 = _1806 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    out.m_91.z = _1798;
    out.m_91.w = _1053;
    float _1832 = _1826 * _1824;
    float _1834 = _1806 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1836 = fma(_1716, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1828);
    float _1838 = fma(_1716, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1830);
    float _1840 = -_1832;
    float _1842 = _1840 + 1.0;
    float _1844 = fma(_1716, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1834);
    if (_1634)
    {
        _610 = 1.0;
    }
    float _1846 = _610;
    float _1848 = fma(_1842, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1832);
    float _1850 = _1846;
    if (!_1634)
    {
        float _1852 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1854 = _1852 * 0.15915493667125701904296875;
        float _1856 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1858 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1860 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1858;
        float _1862 = _1854 * 6.283185482025146484375;
        float _1864 = cos(_1862);
        float _1866 = _1856 * 0.15915493667125701904296875;
        float _1868 = _1854 * 6.283185482025146484375;
        float _1870 = sin(_1868);
        float _1872 = 1.0 / _1864;
        float _1874 = _1866 * 6.283185482025146484375;
        float _1876 = cos(_1874);
        float _1878 = _1870 * _1872;
        float _1880 = _1866 * 6.283185482025146484375;
        float _1882 = sin(_1880);
        float _1884 = _1876 * _1878;
        float _1886 = 1.0 / _1860;
        float _1888 = 1.0 / _1884;
        float _1890 = _1882 * _1888;
        float _1892 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1894 = fma(_574, _1890, _1892);
        float _1896 = _1894 * _1886;
        float _1898 = precise::clamp(_1896, 0.0, 1.0);
        _612 = _1864;
        _1850 = _1898;
        _1165 = _1860;
    }
    float _1900 = _612;
    float _1902 = _1850;
    float _1904 = _1165;
    float _1906 = _1822 * _1848;
    float _1908 = -_1177;
    float _1910 = _1908 + 1.0;
    float _1912 = -_1440;
    float _1914 = _1912 + 1.0;
    float _1916 = fma(_1810, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1836);
    float _1918 = _1906 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1920 = fma(_1810, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1838);
    float _1922 = _1900;
    float _1924 = _1910;
    float _1926 = _1904;
    float _1928 = _1918;
    if (!_1109)
    {
        _1922 = 1.0;
    }
    float _1930 = _1922;
    float _1932 = _1910 * _1918;
    float _1934 = precise::clamp(_1932, 0.0, 1.0);
    float _1936 = fma(_1810, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1844);
    float _1938 = _1930;
    float _1940 = _1934;
    if (_1109)
    {
        bool _1942 = _1235 >= _1199;
        bool _1944 = isnan(_1235);
        bool _1946 = _1942 || _1944;
        bool _1948 = isnan(_1199);
        bool _1950 = _1946 || _1948;
        float _1952 = float(_1950);
        _1938 = _1952;
    }
    float _1954 = _1938;
    float _1956 = _1914 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (_747)
    {
        _1924 = 1.0;
    }
    float _1958 = _1924;
    float _1960 = _1958;
    if (!_747)
    {
        int _1962 = _791 << 4;
        int _1964 = _1962 + 2048;
        uint _1966 = uint(int(uint(_1964) >> uint(2)));
        uint _1968 = uint(int(uint(int(_1966)) >> uint(2)));
        int _1970 = int(_1966) & 3;
        float _1972 = (*spvDescriptorSet0.vp_c15)._m0[int(_1968)][_1970];
        int _1974 = int(_1966) + 1;
        uint _1976 = uint(int(uint(_1974) >> uint(2)));
        int _1978 = _1974 & 3;
        float _1980 = (*spvDescriptorSet0.vp_c15)._m0[int(_1976)][_1978];
        int _1982 = _1964 + 8;
        uint _1984 = uint(int(uint(_1982) >> uint(2)));
        uint _1986 = uint(int(uint(int(_1984)) >> uint(2)));
        int _1988 = int(_1984) & 3;
        float _1990 = (*spvDescriptorSet0.vp_c15)._m0[int(_1986)][_1988];
        int _1992 = int(_1984) + 1;
        uint _1994 = uint(int(uint(_1992) >> uint(2)));
        int _1996 = _1992 & 3;
        float _1998 = (*spvDescriptorSet0.vp_c15)._m0[int(_1994)][_1996];
        float _2000 = _534 * _1980;
        float _2002 = fma(_388, _1972, _2000);
        float _2004 = fma(_382, _1990, _2002);
        float _2006 = _2004 + _1998;
        float _2008 = precise::clamp(_2006, 0.0, 1.0);
        float _2010 = -_2008;
        float _2012 = _2010 + _1229;
        float _2014 = fma(_2012, 500.0, 1.5);
        float _2016 = exp2(_2014);
        float _2018 = 0.0 + _2016;
        float _2020 = precise::clamp(_2018, 0.0, 1.0);
        _1960 = _2020;
        _1926 = 500.0;
        _1928 = _1972;
    }
    float _2022 = _1960;
    float _2024 = _1926;
    float _2026 = _1928;
    float _2028 = _1956 * _1237;
    float _2030 = _1954 * _2022;
    float _2032 = -_1956;
    float _2034 = _2032 + 1.0;
    out.m_93.x = _1916;
    out.m_93.y = _1920;
    out.m_93.z = _1936;
    float _2036 = _1248 * _2028;
    float _2038 = _1258 * _2028;
    float _2040 = _1248 * _2034;
    out.m_95.x = _500;
    out.m_95.y = _498;
    out.m_95.z = _502;
    float _2042 = fma(_1254, _2036, _1242);
    float _2044 = fma(_1256, _2036, _1244);
    float _2046 = fma(_1248, _2038, _1246);
    bool _2048 = _566 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2050 = isnan(_566);
    bool _2052 = _2048 || _2050;
    bool _2054 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2056 = _2052 || _2054;
    float _2058 = -_1934;
    float _2060 = fma(_2058, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2062 = _1902 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_97.x = _2042;
    out.m_97.y = _2044;
    out.m_97.z = _2046;
    out.m_97.w = _2040;
    float _2064 = -_2030;
    float _2066 = fma(_2064, _2060, 1.0);
    float _2068 = precise::clamp(_2066, 0.0, 1.0);
    float _2070 = _2068 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2072 = _2026;
    float _2074 = _2024;
    float _2076 = _2034;
    float _2078 = _2068;
    float _2080 = _2070;
    if (!_2056)
    {
        _2072 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2082 = _2072;
    out.m_99.x = _2070;
    float _2084 = _2082;
    float _2086 = _2082;
    if (!_2056)
    {
        _2074 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2088 = _2074;
    float _2090 = _2088;
    float _2092 = _2088;
    if (!_2056)
    {
        _2076 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2094 = _2076;
    float _2096 = _2094;
    float _2098 = _2094;
    if (!_2056)
    {
        _1940 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2100 = _1940;
    float _2102 = _2100;
    float _2104 = _2100;
    if (!_2056)
    {
        _2078 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2106 = _2078;
    float _2108 = _2106;
    float _2110 = _2106;
    if (!_2056)
    {
        _2080 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2112 = _2080;
    bool _2114 = !_2056;
    float _2116 = _2112;
    float _2118 = _2112;
    if (!_2114)
    {
        bool _2120 = _566 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2122 = isnan(_566);
        bool _2124 = _2120 || _2122;
        bool _2126 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2128 = _2124 || _2126;
        if (!_2128)
        {
            float _2130 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2132 = _566 + _2130;
            float _2134 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2136 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2134;
            float _2138 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2140 = _2138 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2142 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2144 = _2142 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2146 = 1.0 / _2136;
            float _2148 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2150 = _2148 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2152 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2154 = _2152 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2156 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2158 = _2156 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2160 = _2132 * _2146;
            float _2162 = precise::clamp(_2160, 0.0, 1.0);
            float _2164 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2166 = _2164 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2168 = fma(_2162, _2140, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2170 = fma(_2162, _2144, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2172 = fma(_2162, _2166, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2174 = fma(_2162, _2150, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2176 = fma(_2162, _2154, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2178 = fma(_2162, _2158, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2092 = _2170;
            _2110 = _2176;
            _2086 = _2168;
            _2104 = _2174;
            _2098 = _2172;
            _2118 = _2178;
            _2180 = true;
        }
        else
        {
            bool _2182 = _566 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2184 = isnan(_566);
            bool _2186 = _2182 || _2184;
            bool _2188 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2190 = _2186 || _2188;
            if (!_2190)
            {
                _2084 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2192 = _2084;
            _2086 = _2192;
            if (!_2190)
            {
                _2090 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2194 = _2090;
            _2092 = _2194;
            if (!_2190)
            {
                _2096 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2196 = _2096;
            _2098 = _2196;
            if (!_2190)
            {
                _2102 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2198 = _2102;
            _2104 = _2198;
            if (!_2190)
            {
                _2108 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2200 = _2108;
            _2110 = _2200;
            if (!_2190)
            {
                _2116 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2202 = _2116;
            bool _2204 = !_2190;
            _2118 = _2202;
            if (!_2204)
            {
                bool _2206 = _566 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2208 = isnan(_566);
                bool _2210 = _2206 || _2208;
                bool _2212 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2214 = _2210 || _2212;
                if (!_2214)
                {
                    float _2216 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2218 = _566 + _2216;
                    float _2220 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2222 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2220;
                    float _2224 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2226 = _2224 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2228 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2230 = _2228 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2232 = 1.0 / _2222;
                    float _2234 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2236 = _2234 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2238 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2240 = _2238 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2242 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2244 = _2242 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2246 = _2218 * _2232;
                    float _2248 = precise::clamp(_2246, 0.0, 1.0);
                    float _2250 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2252 = _2250 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2254 = fma(_2248, _2226, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2256 = fma(_2248, _2230, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2258 = fma(_2248, _2252, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2260 = fma(_2248, _2236, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2262 = fma(_2248, _2240, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2264 = fma(_2248, _2244, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2092 = _2256;
                    _2110 = _2262;
                    _2086 = _2254;
                    _2104 = _2260;
                    _2098 = _2258;
                    _2118 = _2264;
                    _2180 = true;
                }
                else
                {
                    _2092 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2110 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2086 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2104 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2098 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2118 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2180 = false;
    float _2266 = _2092;
    float _2268 = _2110;
    float _2270 = _2086;
    float _2272 = _2104;
    float _2274 = _2098;
    float _2276 = _2118;
    float _2278 = fma(_1920, -0.5, 0.5);
    float _2280 = precise::clamp(_2278, 0.0, 1.0);
    float _2282 = -_2266;
    float _2284 = _2282 + _2268;
    float _2286 = _2062 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2288 = -_2270;
    float _2290 = _2288 + _2272;
    float _2292 = fma(_2280, _2284, _2266);
    out.m_101.x = 0.0;
    float _2294 = -_2274;
    float _2296 = _2294 + _2276;
    float _2298 = fma(_2280, _2290, _2270);
    float _2300 = _2292 * 0.586610972881317138671875;
    out.m_59.x = _2286;
    bool _2302 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2304 = fma(_2280, _2296, _2274);
    float _2306 = fma(_2298, 0.298911988735198974609375, _2300);
    bool _2308 = _1902 > 0.0;
    bool _2310 = isnan(_1902);
    bool _2312 = _2308 || _2310;
    bool _2314 = isnan(0.0);
    bool _2316 = _2312 || _2314;
    float _2318 = fma(_2304, 0.114477999508380889892578125, _2306);
    float _2320 = -_2318;
    float _2322 = _2298 + _2320;
    float _2324 = -_2318;
    float _2326 = _2292 + _2324;
    float _2328 = -_2318;
    float _2330 = _2304 + _2328;
    float _2332 = fma(_2322, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2318);
    float _2334 = fma(_2326, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2318);
    float _2336 = fma(_2330, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2318);
    bool _2338 = !_2302;
    if (!_2338)
    {
        float _2340 = -_498;
        float _2342 = _2340 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2344 = -_500;
        float _2346 = _2344 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2348 = -_502;
        float _2350 = _2348 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2352 = _2342 * _2342;
        float _2354 = fma(_2346, _2346, _2352);
        float _2356 = fma(_2350, _2350, _2354);
        float _2358 = sqrt(_2356);
        float _2360 = rsqrt(_2356);
        float _2362 = -_2358;
        float _2364 = _2362 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2366 = _2364 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2368 = precise::clamp(_2366, 0.0, 1.0);
        float _2370 = _2346 * _2360;
        float _2372 = _2342 * _2360;
        float _2374 = abs(_2368);
        float _2376 = log2(_2374);
        float _2378 = _2350 * _2360;
        float _2380 = _2370 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2382 = _1920 * _2372;
        float _2384 = -_2372;
        float _2386 = -_2380;
        float _2388 = fma(_2384, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2386);
        float _2390 = fma(_1916, _2370, _2382);
        float _2392 = -_2378;
        float _2394 = fma(_2392, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2388);
        float _2396 = fma(_1936, _2378, _2390);
        float _2398 = precise::clamp(_2396, 0.0, 1.0);
        float _2400 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2402 = _2394 + _2400;
        float _2404 = _2376 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2406 = _2402 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2408 = precise::clamp(_2406, 0.0, 1.0);
        float _2410 = exp2(_2404);
        float _2412 = _2410 * _2408;
        float _2414 = _2398 * _2412;
        float _2416 = _2414 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2418 = _2414 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2420 = _2414 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_101.x = _2416;
        out.m_101.y = _2418;
        out.m_101.z = _2420;
    }
    out.m_103.x = _2332;
    out.m_103.y = _2334;
    out.m_103.z = _2336;
    if (_2316)
    {
        return out;
    }
    out.m_59.x = 0.0;
    float _2422 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2422;
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
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2180 = false;
    bool _318 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _117 = in.m_56.w;
    float _119 = trunc(_117);
    int _122 = int(_119);
    bool _126 = _122 >= 1;
    float _128 = 0.0;
    if (!_126)
    {
        _128 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _130 = _128;
    float _132 = _130;
    if (!_126)
    {
        out.m_59.x = 0.0;
    }
    int _134 = 0;
    if (!_126)
    {
        float _136 = _130 * 5.0;
        _134 = as_type<int>(_136);
    }
    int _138 = _134;
    int _140 = _138;
    if (!_126)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2479 = as_type<float>(_138);
        out.gl_Position.z = _2479;
    }
    if (!_126)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _142 = in.m_61.w;
    bool _144 = _142 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _146 = isnan(_142);
    bool _148 = _144 || _146;
    bool _150 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _152 = _148 || _150;
    float _154 = -_142;
    float _156 = _154 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _158 = 0.0;
    if (_152)
    {
        float _160 = float(_122);
        _158 = _160;
    }
    float _162 = _158;
    bool _164 = _156 >= _162;
    bool _166 = !_152;
    bool _168 = _164 || _166;
    if (_168)
    {
        _132 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _170 = _132;
    if (_168)
    {
        out.m_59.x = 0.0;
    }
    if (_168)
    {
        float _172 = _170 * 5.0;
        _140 = as_type<int>(_172);
    }
    int _174 = _140;
    if (_168)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2547 = as_type<float>(_174);
        out.gl_Position.z = _2547;
    }
    if (_168)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _176 = in.m_63.w;
    float _178 = _156 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _180 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _182 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _184 = _180 || _182;
    bool _186 = isnan(1.0);
    bool _188 = _184 || _186;
    float _190 = in.m_61.x;
    float _192 = in.m_61.y;
    float _194 = in.m_61.z;
    float _196 = in.m_56.x;
    float _198 = in.m_56.y;
    float _200 = in.m_56.z;
    float _202 = 0.0;
    float _204 = _178;
    if (!_188)
    {
        float _206 = _178 * _178;
        float _208 = _206 * 0.5;
        _202 = _208;
    }
    float _210 = _202;
    float _212 = _210;
    if (!_188)
    {
        float _214 = _210 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _212 = _214;
    }
    float _216 = _212;
    bool _218 = !_188;
    float _220 = _216;
    if (!_218)
    {
        float _222 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _224 = log2(_222);
        float _226 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _228 = _226 + 1.0;
        float _230 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _232 = _178 * _224;
        float _234 = 1.0 / _228;
        float _236 = _230 * 0.693147182464599609375;
        float _238 = exp2(_232);
        float _240 = 1.0 / _236;
        float _242 = _238 + (-1.0);
        float _244 = -_242;
        float _246 = fma(_244, _240, _178);
        float _248 = _246 * _234;
        float _250 = _248 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _220 = _250;
    }
    float _252 = _220;
    bool _254 = !_188;
    if (!_254)
    {
        float _256 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _258 = log2(_256);
        float _260 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _262 = _260 + 1.0;
        float _264 = 1.0 / _262;
        float _266 = _178 * _258;
        float _268 = exp2(_266);
        float _270 = -_268;
        float _272 = _270 + 1.0;
        float _274 = _272 * _264;
        _204 = _274;
    }
    float _276 = _204;
    bool _278 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _280 = _252 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _282 = _252 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _284 = _252 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _286 = fma(_276, _190, _280);
    float _288 = fma(_276, _192, _282);
    float _290 = fma(_276, _194, _284);
    float _292 = fma(_286, _176, _196);
    float _294 = fma(_288, _176, _198);
    float _296 = fma(_290, _176, _200);
    bool _298 = !_278;
    float _316;
    if (!_298)
    {
        float _300 = in.m_65.x;
        float _302 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _304 = _300 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _306 = fma(_304, (*spvDescriptorSet0.vp_c9)._m0[11].y, _156);
        float _308 = _306 * _302;
        float _310 = floor(_308);
        float _312 = -_310;
        float _314 = _308 + _312;
        _316 = _314;
        _318 = true;
    }
    else
    {
        float _320 = float(_122);
        float _322 = 1.0 / _320;
        float _324 = _156 * _322;
        _316 = _324;
    }
    _318 = false;
    float _326 = _316;
    float _328 = in.m_63.x;
    float _330 = in.m_63.y;
    float _332 = in.m_63.z;
    float _334 = in.m_67.x;
    float _336 = in.m_67.y;
    float _338 = in.m_67.z;
    float _340 = _328 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _342 = _330 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _344 = _332 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _346 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _334);
    float _348 = _340 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _350 = _342 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _352 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _338);
    float _354 = _344 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _356 = _346 * _348;
    float _358 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _336);
    float _360 = _294 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _362 = _352 * _354;
    float _364 = _358 * _350;
    float _366 = _294 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _368 = fma(_292, (*spvDescriptorSet0.vp_c10)._m0[6].x, _360);
    float _370 = _364 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _372 = fma(_292, (*spvDescriptorSet0.vp_c10)._m0[4].x, _366);
    float _374 = fma(_296, (*spvDescriptorSet0.vp_c10)._m0[6].z, _368);
    float _376 = _364 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _378 = fma(_356, (*spvDescriptorSet0.vp_c10)._m0[10].x, _370);
    float _380 = fma(_296, (*spvDescriptorSet0.vp_c10)._m0[4].z, _372);
    float _382 = _374 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _384 = fma(_356, (*spvDescriptorSet0.vp_c10)._m0[8].x, _376);
    float _386 = fma(_362, (*spvDescriptorSet0.vp_c10)._m0[10].z, _378);
    float _388 = _380 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _390 = fma(_362, (*spvDescriptorSet0.vp_c10)._m0[8].z, _384);
    float _392 = _382 + _386;
    float _394 = _388 + _390;
    float _396 = _294 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _398 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _400 = _392 + _398;
    float _402 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _404 = _394 + _402;
    float _406 = fma(_292, (*spvDescriptorSet0.vp_c10)._m0[5].x, _396);
    float _408 = _400 * _400;
    float _410 = fma(_296, (*spvDescriptorSet0.vp_c10)._m0[5].z, _406);
    float _412 = fma(_404, _404, _408);
    float _414 = _410 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _416 = sqrt(_412);
    float _418 = _414 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _420 = fma(_388, (*spvDescriptorSet0.vp_c8)._m0[11].x, _418);
    float _422 = fma(_382, (*spvDescriptorSet0.vp_c8)._m0[11].z, _420);
    float _424 = _364 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _426 = _422 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    bool _428 = _416 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _430 = fma(_356, (*spvDescriptorSet0.vp_c10)._m0[9].x, _424);
    float _432 = _414 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _434 = 1.0 / _426;
    float _436 = fma(_362, (*spvDescriptorSet0.vp_c10)._m0[9].z, _430);
    float _438 = fma(_388, (*spvDescriptorSet0.vp_c8)._m0[10].x, _432);
    float _440 = _414 + _436;
    float _442 = _432;
    float _444 = _362;
    float _446 = _422;
    if (!_428)
    {
        _442 = _394;
    }
    float _448 = _442;
    float _450 = _448;
    if (!_428)
    {
        _444 = _392;
    }
    float _452 = _444;
    float _454 = _452;
    if (!_428)
    {
        _446 = _440;
    }
    float _456 = _446;
    bool _458 = !_428;
    float _460 = _456;
    if (!_458)
    {
        float _462 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _464 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _466 = _416 + _464;
        float _468 = _440 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _470 = rsqrt(_412);
        float _472 = _466 * _462;
        float _474 = _472 * 0.15915493667125701904296875;
        float _476 = _474 * 6.283185482025146484375;
        float _478 = cos(_476);
        float _480 = _474 * 6.283185482025146484375;
        float _482 = sin(_480);
        float _484 = _478 + (-1.0);
        float _486 = _484 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _488 = fma(_482, _468, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _490 = fma(_440, _478, _486);
        float _492 = _470 * _488;
        float _494 = fma(_404, _492, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _496 = fma(_400, _492, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _460 = _490;
        _450 = _494;
        _454 = _496;
    }
    float _498 = _460;
    float _500 = _450;
    float _502 = _454;
    float _504 = fma(_382, (*spvDescriptorSet0.vp_c8)._m0[10].z, _438);
    float _506 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _508 = _498 + _506;
    float _510 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _512 = _500 + _510;
    float _514 = _504 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _516 = _508 * _508;
    float _518 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _520 = _502 + _518;
    float _522 = _514 + _426;
    float _524 = fma(_512, _512, _516);
    float _526 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _528 = _522 * _434;
    float _530 = _528 * 0.5;
    float _532 = fma(_520, _520, _524);
    float _534 = _414 + _526;
    float _536 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _538 = fma(_530, (*spvDescriptorSet0.vp_c8)._m0[30].w, _536);
    float _540 = rsqrt(_532);
    float _542 = _534 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _544 = _534 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _546 = fma(_388, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _548 = _498 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _550 = fma(_388, (*spvDescriptorSet0.vp_c15)._m0[126].x, _542);
    float _552 = fma(_388, (*spvDescriptorSet0.vp_c15)._m0[127].x, _544);
    float _554 = 1.0 / _538;
    float _556 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _558 = fma(_382, (*spvDescriptorSet0.vp_c15)._m0[127].z, _552);
    float _560 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _562 = _558 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _564 = _540 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _566 = sqrt(_532);
    float _568 = _512 * _564;
    float _570 = _520 * _564;
    float _572 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _574 = _554 * _572;
    float _576 = _568 * _568;
    float _578 = _570 * _570;
    float _580 = fma(_382, (*spvDescriptorSet0.vp_c15)._m0[126].z, _550);
    bool _582 = _574 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _584 = _576 + _578;
    bool _586 = _574 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _588 = _580 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    bool _590 = !_582;
    int _592 = _590 ? 0 : 1;
    float _594 = sqrt(_584);
    int _596 = 2;
    float _598 = _584;
    int _600 = as_type<int>(_556);
    float _602 = _568;
    float _604 = _570;
    float _606 = _576;
    float _608 = _578;
    float _610 = _512;
    float _612 = _520;
    if (!_582)
    {
        _596 = 1;
    }
    int _614 = _596;
    float _616 = trunc(_588);
    int _618 = int(_616);
    int _620 = _614;
    if (!_586)
    {
        _620 = _592;
    }
    int _622 = _620;
    int _624 = _622 << 6;
    bool _626 = _594 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _628 = trunc(_562);
    int _630 = int(_628);
    int _632 = _624 + 96;
    uint _635 = uint(int(uint(_632) >> uint(2)));
    uint _637 = uint(int(uint(int(_635)) >> uint(2)));
    int _639 = int(_635) & 3;
    float _641 = (*spvDescriptorSet0.vp_c15)._m0[int(_637)][_639];
    int _643 = int(_635) + 1;
    uint _645 = uint(int(uint(_643) >> uint(2)));
    int _647 = _643 & 3;
    float _649 = (*spvDescriptorSet0.vp_c15)._m0[int(_645)][_647];
    float _651 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _653 = _594 + _651;
    int _655 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _657 = _618 + _655;
    int _659 = _657 + 1;
    int _661 = _624 + 48;
    uint _663 = uint(int(uint(_661) >> uint(2)));
    uint _665 = uint(int(uint(int(_663)) >> uint(2)));
    int _667 = int(_663) & 3;
    float _669 = (*spvDescriptorSet0.vp_c15)._m0[int(_665)][_667];
    int _671 = int(_663) + 1;
    uint _673 = uint(int(uint(_671) >> uint(2)));
    int _675 = _671 & 3;
    float _677 = (*spvDescriptorSet0.vp_c15)._m0[int(_673)][_675];
    float _679 = as_type<float>(_618);
    float _681 = _653;
    int _683 = _659;
    float _685 = as_type<float>(_622);
    if (_626)
    {
        float _687 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _679 = _687;
    }
    float _689 = _679;
    bool _691 = _659 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _693 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _695 = _630 + _693;
    int _697 = _695 + 1;
    int _699 = _624 + 104;
    uint _701 = uint(int(uint(_699) >> uint(2)));
    uint _703 = uint(int(uint(int(_701)) >> uint(2)));
    int _705 = int(_701) & 3;
    float _707 = (*spvDescriptorSet0.vp_c15)._m0[int(_703)][_705];
    int _709 = int(_701) + 1;
    uint _711 = uint(int(uint(_709) >> uint(2)));
    int _713 = _709 & 3;
    float _715 = (*spvDescriptorSet0.vp_c15)._m0[int(_711)][_713];
    int _717 = _659 | _697;
    if (_626)
    {
        float _719 = rsqrt(_584);
        _598 = _719;
    }
    float _721 = _598;
    bool _723 = _717 < 0;
    bool _725 = _723 || _691;
    int _727 = _624 + 64;
    uint _729 = uint(int(uint(_727) >> uint(2)));
    uint _731 = uint(int(uint(int(_729)) >> uint(2)));
    int _733 = int(_729) & 3;
    float _735 = (*spvDescriptorSet0.vp_c15)._m0[int(_731)][_733];
    int _737 = int(_729) + 1;
    uint _739 = uint(int(uint(_737) >> uint(2)));
    int _741 = _737 & 3;
    float _743 = (*spvDescriptorSet0.vp_c15)._m0[int(_739)][_741];
    bool _745 = _697 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _747 = _745 || _725;
    if (_626)
    {
        float _749 = _653 * _689;
        _681 = _749;
    }
    float _751 = _681;
    float _753 = floor(_546);
    float _755 = 0.0;
    if (_626)
    {
        float _757 = _751 * 0.15915493667125701904296875;
        _755 = _757;
    }
    float _759 = _755;
    int _761 = _624 + 56;
    uint _763 = uint(int(uint(_761) >> uint(2)));
    uint _765 = uint(int(uint(int(_763)) >> uint(2)));
    int _767 = int(_763) & 3;
    float _769 = (*spvDescriptorSet0.vp_c15)._m0[int(_765)][_767];
    int _771 = int(_763) + 1;
    uint _773 = uint(int(uint(_771) >> uint(2)));
    int _775 = _771 & 3;
    float _777 = (*spvDescriptorSet0.vp_c15)._m0[int(_773)][_775];
    float _779 = _751;
    if (_626)
    {
        float _781 = _759 * 6.283185482025146484375;
        float _783 = cos(_781);
        _779 = _783;
    }
    float _785 = _779;
    if (!_747)
    {
        int _787 = _697 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _789 = _787 + _659;
        _683 = _789;
    }
    int _791 = _683;
    float _793 = precise::max(0.0, _556);
    float _795 = 0.0;
    if (_626)
    {
        float _797 = _759 * 6.283185482025146484375;
        float _799 = sin(_797);
        _795 = _799;
    }
    float _801 = _795;
    int _803 = 0;
    if (!_747)
    {
        int _805 = _791 << 2;
        _803 = _805;
    }
    int _807 = _803;
    float _809 = -_753;
    float _811 = _546 + _809;
    float _813 = _534 * _649;
    int _815 = 0;
    float _817 = _813;
    if (!_747)
    {
        uint _819 = uint(int(uint(_791) >> uint(2)));
        _815 = int(_819);
    }
    int _821 = _815;
    float _823 = as_type<float>(_821);
    if (!_747)
    {
        int _825 = 12 & _807;
        _600 = _825;
    }
    int _827 = _600;
    float _829 = -_564;
    float _831 = -_793;
    float _833 = fma(_508, _829, _831);
    float _835 = fma(_388, _641, _813);
    float _837 = _677;
    float _839 = as_type<float>(_827);
    if (_626)
    {
        float _841 = _785 + (-1.0);
        _817 = _841;
    }
    float _843 = _817;
    float _845 = _843;
    if (!_747)
    {
        int _847 = _821 << 4;
        int _849 = _847 + _827;
        _823 = as_type<float>(_849);
    }
    float _851 = _823;
    float _853 = _534 * _677;
    if (_626)
    {
        float _855 = _833 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _837 = _855;
    }
    float _857 = _837;
    if (_626)
    {
        float _859 = _843 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _845 = _859;
    }
    float _861 = _845;
    if (!_626)
    {
        _839 = _833;
    }
    float _863 = _839;
    float _865 = fma(_388, _669, _853);
    float _867 = _801;
    float _869 = _863;
    if (_626)
    {
        float _871 = fma(_801, _857, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _867 = _871;
    }
    float _873 = _867;
    float _875 = _873;
    if (_626)
    {
        float _877 = fma(_833, _785, _861);
        _869 = _877;
    }
    float _879 = _869;
    float _881 = fma(_382, _707, _835);
    if (_626)
    {
        float _883 = _721 * _873;
        _875 = _883;
    }
    float _885 = _875;
    int _887 = _624 + 72;
    uint _889 = uint(int(uint(_887) >> uint(2)));
    uint _891 = uint(int(uint(int(_889)) >> uint(2)));
    int _893 = int(_889) & 3;
    float _895 = (*spvDescriptorSet0.vp_c15)._m0[int(_891)][_893];
    int _897 = int(_889) + 1;
    uint _899 = uint(int(uint(_897) >> uint(2)));
    int _901 = _897 & 3;
    float _903 = (*spvDescriptorSet0.vp_c15)._m0[int(_899)][_901];
    float _905 = _498 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _907 = fma(_382, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    if (_626)
    {
        float _909 = _568 * _885;
        _602 = _909;
    }
    float _911 = _602;
    if (_626)
    {
        float _913 = _570 * _885;
        _604 = _913;
    }
    float _915 = _604;
    float _917 = _881 + _715;
    float _919 = _534 * _743;
    if (_626)
    {
        float _921 = _911 * _911;
        _606 = _921;
    }
    float _923 = _606;
    if (_626)
    {
        float _925 = _915 * _915;
        _608 = _925;
    }
    float _927 = _608;
    float _929 = fma(_500, (*spvDescriptorSet0.vp_c8)._m0[2].x, _905);
    float _931 = fma(_388, _735, _919);
    float _933 = fma(_879, _879, _923);
    int _935 = _624 + 80;
    uint _937 = uint(int(uint(_935) >> uint(2)));
    uint _939 = uint(int(uint(int(_937)) >> uint(2)));
    int _941 = int(_937) & 3;
    float _943 = (*spvDescriptorSet0.vp_c15)._m0[int(_939)][_941];
    int _945 = int(_937) + 1;
    uint _947 = uint(int(uint(_945) >> uint(2)));
    int _949 = _945 & 3;
    float _951 = (*spvDescriptorSet0.vp_c15)._m0[int(_947)][_949];
    float _953 = _498 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _955 = fma(_502, (*spvDescriptorSet0.vp_c8)._m0[2].z, _929);
    float _957 = _933 + _927;
    float _959 = _498 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _961 = fma(_382, _769, _865);
    float _963 = fma(_500, (*spvDescriptorSet0.vp_c8)._m0[0].x, _953);
    float _965 = _955 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    int _967 = _624 + 88;
    uint _969 = uint(int(uint(_967) >> uint(2)));
    uint _971 = uint(int(uint(int(_969)) >> uint(2)));
    int _973 = int(_969) & 3;
    float _975 = (*spvDescriptorSet0.vp_c15)._m0[int(_971)][_973];
    int _977 = int(_969) + 1;
    uint _979 = uint(int(uint(_977) >> uint(2)));
    int _981 = _977 & 3;
    float _983 = (*spvDescriptorSet0.vp_c15)._m0[int(_979)][_981];
    float _985 = rsqrt(_957);
    float _987 = fma(_500, (*spvDescriptorSet0.vp_c8)._m0[1].x, _959);
    float _989 = fma(_502, (*spvDescriptorSet0.vp_c8)._m0[0].z, _963);
    float _991 = _965 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _993 = fma(_502, (*spvDescriptorSet0.vp_c8)._m0[1].z, _987);
    float _995 = _851;
    if (!_747)
    {
        int _997 = as_type<int>(_851) + 400;
        uint _999 = uint(int(uint(_997) >> uint(2)));
        uint _1001 = uint(int(uint(int(_999)) >> uint(2)));
        int _1003 = int(_999) & 3;
        float _1005 = (*spvDescriptorSet0.vp_c15)._m0[int(_1001)][_1003];
        _995 = _1005;
    }
    float _1007 = _995;
    float _1009 = 1.0 / _917;
    float _1011 = _993 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1013 = fma(_500, (*spvDescriptorSet0.vp_c8)._m0[3].x, _548);
    float _1015 = _989 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1017 = -_991;
    float _1019 = fma(_1017, _560, 1.0);
    float _1021 = _1011 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1023 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1025 = fma(_566, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1023);
    float _1027 = precise::clamp(_1025, 0.0, 1.0);
    float _1029 = fma(_502, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1013);
    float _1031 = floor(_907);
    float _1033 = fma(_1015, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1021);
    float _1035 = _985 * _911;
    float _1037 = -_1027;
    float _1039 = _1037 + 1.0;
    float _1041 = _1029 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1043 = fma(_965, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1033);
    float _1045 = _1035 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1047 = _961 + _777;
    float _1049 = abs(_1039);
    float _1051 = log2(_1049);
    float _1053 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1043);
    float _1055 = _985 * _879;
    float _1057 = fma(_382, _895, _931);
    float _1059 = _1047 * _1009;
    float _1061 = _985 * _915;
    float _1063 = -_1045;
    float _1065 = fma(_1055, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1063);
    float _1067 = _1057 + _903;
    float _1069 = _707;
    float _1071 = _1019;
    if (!_747)
    {
        float _1073 = floor(_562);
        _1069 = _1073;
    }
    float _1075 = _1069;
    bool _1077 = _1059 >= 0.0;
    float _1079 = -_1031;
    float _1081 = _907 + _1079;
    float _1083 = _1067 * _1009;
    float _1085 = -_1061;
    float _1087 = fma(_1085, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1065);
    bool _1089 = _1059 <= 1.0;
    bool _1091 = _1089 && _1077;
    float _1093 = _534 * _951;
    float _1095 = _1051 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    bool _1097 = _1083 >= 0.0;
    bool _1099 = _1097 && _1091;
    float _1101 = fma(_1087, -0.5, 0.5);
    float _1103 = fma(_388, _943, _1093);
    float _1105 = fma(_1087, 0.5, 0.5);
    bool _1107 = _1083 <= 1.0;
    bool _1109 = _1107 && _1099;
    float _1111 = exp2(_1095);
    float _1113 = fma(_382, _975, _1103);
    float _1115 = fma(_1105, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1117 = _1011 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1119 = _1113 + _983;
    float _1121 = fma(_1105, _1115, -0.212114393711090087890625);
    float _1123 = fma(_1015, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1117);
    float _1125 = log2(_1019);
    float _1127 = fma(_1105, _1121, 1.570728778839111328125);
    float _1129 = fma(_965, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1123);
    if (_1109)
    {
        float _1131 = float(_622);
        _685 = _1131;
    }
    float _1133 = _685;
    float _1135 = _1055 + 1.0;
    float _1137 = sqrt(_1101);
    if (!_747)
    {
        float _1139 = -_1075;
        float _1141 = _562 + _1139;
        _1071 = _1141;
    }
    float _1143 = _1071;
    float _1145 = _1011 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1147 = -_1055;
    float _1149 = fma(_1111, _1135, _1147);
    float _1151 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1129);
    float _1153 = fma(_1015, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1145);
    float _1155 = 1.0 / _1053;
    float _1157 = _1125 * 0.693147182464599609375;
    float _1159 = fma(_965, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1153);
    float _1161 = _785;
    float _1163 = _1159;
    float _1165 = _1151;
    if (!_747)
    {
        float _1167 = floor(_588);
        _1161 = _1167;
    }
    float _1169 = _1161;
    float _1171 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1159);
    float _1173 = _1137 * 0.636619746685028076171875;
    float _1175 = _1157 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float2 _4211 = float2(_811, _1081);
    float _1177 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4211, float2(0.0), isnan(_4211)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4211, float2(0.0), isnan(_4211)), level(0.0)).x;
    float _1179 = -_1127;
    float _1181 = fma(_1173, _1179, 1.0);
    float _1183 = _943;
    if (!_747)
    {
        float _1185 = rint(_1007);
        float _1187 = precise::max(_1185, 0.0);
        uint _1189 = uint(_1187);
        uint _1191 = clamp(_1189, 0u, 65535u);
        _1183 = as_type<float>(_1191);
    }
    float _1193 = _1183;
    float _1195 = _1151 * _1155;
    float _1197 = _1171 * _1155;
    float _1199 = _1119 * _1009;
    float _1201 = fma(_1195, 0.5, 0.5);
    float _1203 = fma(_1197, -0.5, 0.5);
    float _1205 = _1153;
    if (_1109)
    {
        float _1207 = rint(_1133);
        float _1209 = precise::max(_1207, 0.0);
        uint _1211 = uint(_1209);
        uint _1213 = clamp(_1211, 0u, 65535u);
        _1205 = as_type<float>(_1213);
    }
    float _1215 = _1205;
    if (!_747)
    {
        float _1217 = -_1169;
        float _1219 = _588 + _1217;
        _1163 = _1219;
    }
    float _1221 = _1163;
    float _1223 = fma(_1149, 0.5, 0.5);
    float _1225 = _588;
    if (!_747)
    {
        float3 _4292 = float3(_1221, _1143, float(as_type<int>(_1193)));
        float3 _4296 = select(_4292, float3(0.0), isnan(_4292));
        float _1227 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _4296.xy, uint(rint(_4296.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _4296.xy, uint(rint(_4296.z)), level(0.0)).x;
        _1225 = _1227;
    }
    float _1229 = _1225;
    float _1231 = _1083;
    if (_1109)
    {
        float3 _4311 = float3(_1059, _1083, float(as_type<int>(_1215)));
        float3 _4313 = select(_4311, float3(0.0), isnan(_4311));
        float _1233 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _4313.xy, uint(rint(_4313.z)), _1199, level(0.0));
        _1231 = _1233;
    }
    float _1235 = _1231;
    float3 _4323 = float3(_1201, _1203, _1175);
    float _1237 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4323, float3(0.0), isnan(_4323)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4323, float3(0.0), isnan(_4323)), level(0.0)).x;
    float3 _4332 = float3(_1201, _1203, _1175);
    float4 _1240 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4332, float3(0.0), isnan(_4332)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4332, float3(0.0), isnan(_4332)), level(0.0)).xyzw;
    float _1242 = _1240.x;
    float _1244 = _1240.y;
    float _1246 = _1240.z;
    float _1248 = _1240.w;
    float2 _4348 = float2(_1181, _1223);
    float3 _1252 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4348, float2(0.0), isnan(_4348)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4348, float2(0.0), isnan(_4348)), level(0.0)).xyz;
    float _1254 = _1252.x;
    float _1256 = _1252.y;
    float _1258 = _1252.z;
    float _1260 = in.m_69.y;
    float _1262 = _1011 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1264 = in.m_65.x;
    float _1266 = in.m_65.y;
    float _1268 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1270 = _1268 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1272 = in.m_71.w;
    float _1274 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1276 = _1274 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1278 = in.m_71.y;
    float _1280 = _1051 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1282 = in.m_71.z;
    float _1284 = in.m_65.w;
    float _1286 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1288 = -_1260;
    float _1290 = _1288 + 1.0;
    float _1292 = in.m_71.x;
    int _1294 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1296 = _1294 != 0;
    float _1298 = 1.0 / _1270;
    bool _1300 = _1266 > 0.5;
    float _1302 = _1266 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1304 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1306 = _1304 != 0;
    float _1308 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1310 = _1300 ? as_type<int>(_1290) : as_type<int>(_1260);
    out.m_73.w = _1272;
    int _1312 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1314 = _1312 != 0;
    float _1316 = 1.0 / _1276;
    int _1318 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1320 = _1318 != 0;
    out.m_73.y = _1278;
    int _1322 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1324 = _1322 != 0;
    float _1326 = fma(_1302, -2.0, _1308);
    float _1328 = _1320 ? as_type<float>(_1310) : _1260;
    float _1330 = in.m_75.x;
    float _1332 = in.m_75.y;
    float _1334 = in.m_75.z;
    float _1336 = in.m_75.w;
    float _1338 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1340 = _1284 > 0.5;
    float _1342 = _1264 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    out.m_73.z = _1282;
    float _1344 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1346 = -_1286;
    float _1348 = fma(_1342, 2.0, _1346);
    float _1350 = _1282;
    float _1352 = _1260;
    bool _1354 = _1324;
    bool _1356 = _1340;
    if (_1314)
    {
        float _1358 = in.m_65.x;
        _1350 = _1358;
    }
    float _1360 = _1350;
    float _1362 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1364 = _1342;
    if (_1296)
    {
        float _1366 = in.m_65.z;
        _1364 = _1366;
    }
    float _1368 = _1364;
    float _1370 = _1344 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1372 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1374 = _1362 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_73.x = _1292;
    float _1376 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1378 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1376;
    float _1380 = _1372 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_1324)
    {
        float _1382 = _1340 ? _1290 : _1260;
        _1352 = _1382;
    }
    float _1384 = _1352;
    float _1386 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1388 = _1378 * _1298;
    float _1390 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1392 = _1390 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1394 = _1332 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1396 = _1332 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1398 = _1392 * _1316;
    float _1400 = fma(_1330, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1394);
    float _1402 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1404 = fma(_1330, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1396);
    float _1406 = in.m_69.x;
    float _1408 = _1386;
    float _1410 = _1404;
    float _1412 = _1338;
    float _1414 = _1406;
    if (_1314)
    {
        bool _1416 = _1360 > 0.5;
        _1354 = _1416;
    }
    bool _1418 = _1354;
    float _1420 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1326);
    float _1422 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    out.m_77.x = _1370;
    out.m_77.y = _1374;
    out.m_77.z = _1380;
    out.m_77.w = _1402;
    if (_1296)
    {
        bool _1424 = _1368 > 0.5;
        _1356 = _1424;
    }
    bool _1426 = _1356;
    float _1428 = -_156;
    float _1430 = fma(_1428, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1348);
    float _1432 = fma(_1015, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1262);
    float _1434 = _1360;
    if (!_1306)
    {
        float _1436 = in.m_65.z;
        _1434 = _1436;
    }
    float _1438 = _1434;
    float _1440 = exp2(_1280);
    float _1442 = fma(_965, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1432);
    out.m_79.x = _512;
    out.m_79.y = _508;
    out.m_79.z = _520;
    float _1444 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1442);
    float _1446 = _1332 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1448 = fma(_1264, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1386);
    if (!_1306)
    {
        _1408 = _1266;
    }
    float _1450 = _1408;
    float _1452 = fma(_1334, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1400);
    float _1454 = _1450;
    if (_1306)
    {
        _1454 = _1264;
    }
    float _1456 = _1454;
    float _1458 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1460 = _326 + _1458;
    float _1462 = fma(_1330, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1446);
    float _1464 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1466 = _326 + _1464;
    float _1468 = fma(_1334, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1404);
    float _1470 = fma(_1398, _1460, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1472 = fma(_1334, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1462);
    float _1474 = _1338 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _1476 = _326 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1478 = isnan(_326);
    bool _1480 = _1476 || _1478;
    bool _1482 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1484 = _1480 || _1482;
    float _1486 = float(_1484);
    float _1488 = fma(_1388, _1466, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1490 = _1438;
    int _1492 = as_type<int>(_1456);
    if (!_1306)
    {
        _1410 = _1438;
    }
    float _1494 = _1410;
    float _1496 = fma(_1474, _1328, -0.5);
    out.m_81.x = _1452;
    out.m_81.y = _1472;
    out.m_81.z = _1468;
    bool _1498 = _326 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1500 = isnan(_326);
    bool _1502 = _1498 || _1500;
    bool _1504 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1506 = _1502 || _1504;
    float _1508 = float(_1506);
    float _1510 = -_1486;
    float _1512 = _1510 + 1.0;
    bool _1514 = _326 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1516 = isnan(_326);
    bool _1518 = _1514 || _1516;
    bool _1520 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1522 = _1518 || _1520;
    float _1524 = float(_1522);
    out.gl_Position.x = _1151;
    out.gl_Position.y = _1171;
    out.gl_Position.z = _1444;
    out.gl_Position.w = _1053;
    float _1526 = _1494;
    if (_1306)
    {
        _1526 = _1266;
    }
    float _1528 = _1526;
    float _1530 = _1508 * _1512;
    float _1532 = -_1508;
    float _1534 = _1532 + 1.0;
    if (_1306)
    {
        _1490 = _1266;
    }
    float _1536 = _1490;
    bool _1538 = _336 != 0.0;
    bool _1540 = isnan(_336);
    bool _1542 = _1538 || _1540;
    bool _1544 = isnan(0.0);
    bool _1546 = _1542 || _1544;
    float _1548 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    if (!_1314)
    {
        _1412 = _1406;
    }
    float _1550 = _1412;
    float _1552 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _1554 = _334 == 0.0;
    bool _1556 = !_1546;
    bool _1558 = _1554 && _1556;
    float _1560 = fma(_1266, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1548);
    float _1562 = fma(_1456, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1422);
    float _1564 = _1456 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _1566 = _338 == 0.0;
    bool _1568 = _1566 && _1558;
    float _1570 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1560);
    float _1572 = _1524 * _1534;
    float _1574 = _1550;
    float _1576 = _1564;
    if (_1314)
    {
        float _1578 = -_1406;
        float _1580 = _1578 + 1.0;
        _1492 = as_type<int>(_1580);
    }
    int _1582 = _1492;
    float _1584 = -_1420;
    float _1586 = fma(_1570, _1496, _1584);
    float _1588 = _1488 * _1572;
    float _1590 = in.m_83.x;
    float _1592 = in.m_83.y;
    float _1594 = in.m_83.z;
    float _1596 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1598 = _1552 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1600 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _1602 = _1582;
    if (_1314)
    {
        float _1604 = _1418 ? as_type<float>(_1582) : _1406;
        _1574 = _1604;
    }
    float _1606 = _1574;
    if (_1296)
    {
        float _1608 = -_1406;
        float _1610 = _1608 + 1.0;
        _1602 = as_type<int>(_1610);
    }
    int _1612 = _1602;
    float _1614 = fma(_1598, _1384, -0.5);
    float _1616 = fma(_1536, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1600);
    float _1618 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1620 = -_1524;
    float _1622 = _1620 + 1.0;
    float _1624 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _1626 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1628 = isnan(0.5);
    bool _1630 = _1626 || _1628;
    bool _1632 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1634 = _1630 || _1632;
    float _1636 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1638 = _1528 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1640 = -_1624;
    float _1642 = fma(_1564, 2.0, _1640);
    float _1644 = _1638;
    float _1646 = as_type<float>(_1612);
    float _1648 = _1636;
    if (!_1296)
    {
        _1576 = _1406;
    }
    float _1650 = _1576;
    float _1652 = fma(_1622, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1588);
    float _1654 = fma(_1638, -2.0, _1636);
    float _1656 = _1650;
    if (_1296)
    {
        float _1658 = _1426 ? as_type<float>(_1612) : _1406;
        _1656 = _1658;
    }
    float _1660 = _1656;
    float _1662 = -_156;
    float _1664 = fma(_1662, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1642);
    float _1666 = fma(_1470, _1530, _1652);
    if (_1568)
    {
        _1644 = _1592;
    }
    float _1668 = _1644;
    float _1670 = _1618 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1672 = _1668;
    float _1674 = _1618;
    if (_1568)
    {
        _1646 = _1594;
    }
    float _1676 = _1646;
    float _1678 = fma(_1486, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1666);
    float _1680 = _1676;
    if (_1568)
    {
        _1414 = _1668;
    }
    float _1682 = _1414;
    float _1684 = fma(_1670, _1660, -0.5);
    float _1686 = _1682;
    if (!_1568)
    {
        _1672 = _1592;
    }
    float _1688 = _1672;
    float _1690 = _1596 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    if (_1568)
    {
        _1674 = _1676;
    }
    float _1692 = _1674;
    float _1694 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1616);
    float _1696 = _1692;
    if (!_1568)
    {
        _1680 = _1594;
    }
    float _1698 = _1680;
    float _1700 = fma(_1690, _1606, -0.5);
    float _1702 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1448);
    float _1704 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1562);
    float _1706 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1654);
    float _1708 = _1330 * _1688;
    if (_1568)
    {
        _1648 = _1590;
    }
    float _1710 = _1648;
    float _1712 = _1710;
    if (!_1568)
    {
        float _1714 = fma(_334, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1590);
        _1712 = _1714;
    }
    float _1716 = _1712;
    float _1718 = _1334 * _1590;
    float _1720 = -_1708;
    float _1722 = fma(_1332, _1590, _1720);
    float _1724 = fma(_1702, _1700, _1430);
    float _1726 = abs(_574);
    float _1728 = log2(_1726);
    float _1730 = _1332 * _1698;
    float _1732 = -_1718;
    float _1734 = fma(_1330, _1698, _1732);
    float _1736 = _1722 * _1336;
    float _1738 = fma(_1704, _1684, _1664);
    float _1740 = -_1730;
    float _1742 = fma(_1334, _1688, _1740);
    float _1744 = _1734 * _1336;
    float _1746 = -_1706;
    float _1748 = fma(_1694, _1614, _1746);
    float _1750 = _1742 * _1336;
    float _1752 = _1744 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1754 = _1744 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1756 = _1744 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1758 = fma(_1750, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1752);
    float _1760 = _1678 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1762 = _1728 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1764 = fma(_1750, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1754);
    float _1766 = fma(_1750, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1756);
    float _1768 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1770 = exp2(_1762);
    float _1772 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1774 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1776 = _1586 + 0.5;
    float _1778 = fma(_1736, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1764);
    float _1780 = fma(_1736, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1758);
    float _1782 = _1768 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1784 = _1772 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1786 = _1774 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1788 = _1444 + _1053;
    float _1790 = _1738 + 0.5;
    float _1792 = _1748 + 0.5;
    float _1794 = _1724 + 0.5;
    float _1796 = fma(_1736, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1766);
    float _1798 = _1788 * 0.5;
    out.m_85.x = _1782;
    out.m_85.y = _1784;
    out.m_85.z = _1786;
    out.m_85.w = _1760;
    float _1800 = fma(_1770, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1802 = precise::clamp(_1800, 0.0, 1.0);
    if (!_1568)
    {
        float _1804 = fma(_336, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1688);
        _1686 = _1804;
    }
    float _1806 = _1686;
    out.m_87.x = _1794;
    out.m_87.y = _1776;
    out.m_87.z = _1790;
    out.m_87.w = _1792;
    if (!_1568)
    {
        float _1808 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1698);
        _1696 = _1808;
    }
    float _1810 = _1696;
    bool _1812 = _574 <= 8000.0;
    bool _1814 = isnan(_574);
    bool _1816 = _1812 || _1814;
    bool _1818 = isnan(8000.0);
    bool _1820 = _1816 || _1818;
    float _1822 = float(_1820);
    float _1824 = fma(_1802, -2.0, 3.0);
    out.m_89.x = _1778;
    out.m_89.y = _1780;
    out.m_89.z = _1796;
    float _1826 = _1802 * _1802;
    float _1828 = _1806 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1830 = _1806 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    out.m_91.z = _1798;
    out.m_91.w = _1053;
    float _1832 = _1826 * _1824;
    float _1834 = _1806 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1836 = fma(_1716, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1828);
    float _1838 = fma(_1716, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1830);
    float _1840 = -_1832;
    float _1842 = _1840 + 1.0;
    float _1844 = fma(_1716, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1834);
    if (_1634)
    {
        _610 = 1.0;
    }
    float _1846 = _610;
    float _1848 = fma(_1842, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1832);
    float _1850 = _1846;
    if (!_1634)
    {
        float _1852 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1854 = _1852 * 0.15915493667125701904296875;
        float _1856 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1858 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1860 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1858;
        float _1862 = _1854 * 6.283185482025146484375;
        float _1864 = cos(_1862);
        float _1866 = _1856 * 0.15915493667125701904296875;
        float _1868 = _1854 * 6.283185482025146484375;
        float _1870 = sin(_1868);
        float _1872 = 1.0 / _1864;
        float _1874 = _1866 * 6.283185482025146484375;
        float _1876 = cos(_1874);
        float _1878 = _1870 * _1872;
        float _1880 = _1866 * 6.283185482025146484375;
        float _1882 = sin(_1880);
        float _1884 = _1876 * _1878;
        float _1886 = 1.0 / _1860;
        float _1888 = 1.0 / _1884;
        float _1890 = _1882 * _1888;
        float _1892 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1894 = fma(_574, _1890, _1892);
        float _1896 = _1894 * _1886;
        float _1898 = precise::clamp(_1896, 0.0, 1.0);
        _612 = _1864;
        _1850 = _1898;
        _1165 = _1860;
    }
    float _1900 = _612;
    float _1902 = _1850;
    float _1904 = _1165;
    float _1906 = _1822 * _1848;
    float _1908 = -_1177;
    float _1910 = _1908 + 1.0;
    float _1912 = -_1440;
    float _1914 = _1912 + 1.0;
    float _1916 = fma(_1810, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1836);
    float _1918 = _1906 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1920 = fma(_1810, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1838);
    float _1922 = _1900;
    float _1924 = _1910;
    float _1926 = _1904;
    float _1928 = _1918;
    if (!_1109)
    {
        _1922 = 1.0;
    }
    float _1930 = _1922;
    float _1932 = _1910 * _1918;
    float _1934 = precise::clamp(_1932, 0.0, 1.0);
    float _1936 = fma(_1810, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1844);
    float _1938 = _1930;
    float _1940 = _1934;
    if (_1109)
    {
        bool _1942 = _1235 >= _1199;
        bool _1944 = isnan(_1235);
        bool _1946 = _1942 || _1944;
        bool _1948 = isnan(_1199);
        bool _1950 = _1946 || _1948;
        float _1952 = float(_1950);
        _1938 = _1952;
    }
    float _1954 = _1938;
    float _1956 = _1914 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (_747)
    {
        _1924 = 1.0;
    }
    float _1958 = _1924;
    float _1960 = _1958;
    if (!_747)
    {
        int _1962 = _791 << 4;
        int _1964 = _1962 + 2048;
        uint _1966 = uint(int(uint(_1964) >> uint(2)));
        uint _1968 = uint(int(uint(int(_1966)) >> uint(2)));
        int _1970 = int(_1966) & 3;
        float _1972 = (*spvDescriptorSet0.vp_c15)._m0[int(_1968)][_1970];
        int _1974 = int(_1966) + 1;
        uint _1976 = uint(int(uint(_1974) >> uint(2)));
        int _1978 = _1974 & 3;
        float _1980 = (*spvDescriptorSet0.vp_c15)._m0[int(_1976)][_1978];
        int _1982 = _1964 + 8;
        uint _1984 = uint(int(uint(_1982) >> uint(2)));
        uint _1986 = uint(int(uint(int(_1984)) >> uint(2)));
        int _1988 = int(_1984) & 3;
        float _1990 = (*spvDescriptorSet0.vp_c15)._m0[int(_1986)][_1988];
        int _1992 = int(_1984) + 1;
        uint _1994 = uint(int(uint(_1992) >> uint(2)));
        int _1996 = _1992 & 3;
        float _1998 = (*spvDescriptorSet0.vp_c15)._m0[int(_1994)][_1996];
        float _2000 = _534 * _1980;
        float _2002 = fma(_388, _1972, _2000);
        float _2004 = fma(_382, _1990, _2002);
        float _2006 = _2004 + _1998;
        float _2008 = precise::clamp(_2006, 0.0, 1.0);
        float _2010 = -_2008;
        float _2012 = _2010 + _1229;
        float _2014 = fma(_2012, 500.0, 1.5);
        float _2016 = exp2(_2014);
        float _2018 = 0.0 + _2016;
        float _2020 = precise::clamp(_2018, 0.0, 1.0);
        _1960 = _2020;
        _1926 = 500.0;
        _1928 = _1972;
    }
    float _2022 = _1960;
    float _2024 = _1926;
    float _2026 = _1928;
    float _2028 = _1956 * _1237;
    float _2030 = _1954 * _2022;
    float _2032 = -_1956;
    float _2034 = _2032 + 1.0;
    out.m_93.x = _1916;
    out.m_93.y = _1920;
    out.m_93.z = _1936;
    float _2036 = _1248 * _2028;
    float _2038 = _1258 * _2028;
    float _2040 = _1248 * _2034;
    out.m_95.x = _500;
    out.m_95.y = _498;
    out.m_95.z = _502;
    float _2042 = fma(_1254, _2036, _1242);
    float _2044 = fma(_1256, _2036, _1244);
    float _2046 = fma(_1248, _2038, _1246);
    bool _2048 = _566 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2050 = isnan(_566);
    bool _2052 = _2048 || _2050;
    bool _2054 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2056 = _2052 || _2054;
    float _2058 = -_1934;
    float _2060 = fma(_2058, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2062 = _1902 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_97.x = _2042;
    out.m_97.y = _2044;
    out.m_97.z = _2046;
    out.m_97.w = _2040;
    float _2064 = -_2030;
    float _2066 = fma(_2064, _2060, 1.0);
    float _2068 = precise::clamp(_2066, 0.0, 1.0);
    float _2070 = _2068 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2072 = _2026;
    float _2074 = _2024;
    float _2076 = _2034;
    float _2078 = _2068;
    float _2080 = _2070;
    if (!_2056)
    {
        _2072 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2082 = _2072;
    out.m_99.x = _2070;
    float _2084 = _2082;
    float _2086 = _2082;
    if (!_2056)
    {
        _2074 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2088 = _2074;
    float _2090 = _2088;
    float _2092 = _2088;
    if (!_2056)
    {
        _2076 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2094 = _2076;
    float _2096 = _2094;
    float _2098 = _2094;
    if (!_2056)
    {
        _1940 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2100 = _1940;
    float _2102 = _2100;
    float _2104 = _2100;
    if (!_2056)
    {
        _2078 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2106 = _2078;
    float _2108 = _2106;
    float _2110 = _2106;
    if (!_2056)
    {
        _2080 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2112 = _2080;
    bool _2114 = !_2056;
    float _2116 = _2112;
    float _2118 = _2112;
    if (!_2114)
    {
        bool _2120 = _566 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2122 = isnan(_566);
        bool _2124 = _2120 || _2122;
        bool _2126 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2128 = _2124 || _2126;
        if (!_2128)
        {
            float _2130 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2132 = _566 + _2130;
            float _2134 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2136 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2134;
            float _2138 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2140 = _2138 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2142 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2144 = _2142 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2146 = 1.0 / _2136;
            float _2148 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2150 = _2148 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2152 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2154 = _2152 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2156 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2158 = _2156 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2160 = _2132 * _2146;
            float _2162 = precise::clamp(_2160, 0.0, 1.0);
            float _2164 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2166 = _2164 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2168 = fma(_2162, _2140, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2170 = fma(_2162, _2144, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2172 = fma(_2162, _2166, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2174 = fma(_2162, _2150, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2176 = fma(_2162, _2154, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2178 = fma(_2162, _2158, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2092 = _2170;
            _2110 = _2176;
            _2086 = _2168;
            _2104 = _2174;
            _2098 = _2172;
            _2118 = _2178;
            _2180 = true;
        }
        else
        {
            bool _2182 = _566 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2184 = isnan(_566);
            bool _2186 = _2182 || _2184;
            bool _2188 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2190 = _2186 || _2188;
            if (!_2190)
            {
                _2084 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2192 = _2084;
            _2086 = _2192;
            if (!_2190)
            {
                _2090 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2194 = _2090;
            _2092 = _2194;
            if (!_2190)
            {
                _2096 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2196 = _2096;
            _2098 = _2196;
            if (!_2190)
            {
                _2102 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2198 = _2102;
            _2104 = _2198;
            if (!_2190)
            {
                _2108 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2200 = _2108;
            _2110 = _2200;
            if (!_2190)
            {
                _2116 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2202 = _2116;
            bool _2204 = !_2190;
            _2118 = _2202;
            if (!_2204)
            {
                bool _2206 = _566 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2208 = isnan(_566);
                bool _2210 = _2206 || _2208;
                bool _2212 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2214 = _2210 || _2212;
                if (!_2214)
                {
                    float _2216 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2218 = _566 + _2216;
                    float _2220 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2222 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2220;
                    float _2224 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2226 = _2224 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2228 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2230 = _2228 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2232 = 1.0 / _2222;
                    float _2234 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2236 = _2234 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2238 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2240 = _2238 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2242 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2244 = _2242 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2246 = _2218 * _2232;
                    float _2248 = precise::clamp(_2246, 0.0, 1.0);
                    float _2250 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2252 = _2250 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2254 = fma(_2248, _2226, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2256 = fma(_2248, _2230, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2258 = fma(_2248, _2252, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2260 = fma(_2248, _2236, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2262 = fma(_2248, _2240, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2264 = fma(_2248, _2244, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2092 = _2256;
                    _2110 = _2262;
                    _2086 = _2254;
                    _2104 = _2260;
                    _2098 = _2258;
                    _2118 = _2264;
                    _2180 = true;
                }
                else
                {
                    _2092 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2110 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2086 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2104 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2098 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2118 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2180 = false;
    float _2266 = _2092;
    float _2268 = _2110;
    float _2270 = _2086;
    float _2272 = _2104;
    float _2274 = _2098;
    float _2276 = _2118;
    float _2278 = fma(_1920, -0.5, 0.5);
    float _2280 = precise::clamp(_2278, 0.0, 1.0);
    float _2282 = -_2266;
    float _2284 = _2282 + _2268;
    float _2286 = _2062 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2288 = -_2270;
    float _2290 = _2288 + _2272;
    float _2292 = fma(_2280, _2284, _2266);
    out.m_101.x = 0.0;
    float _2294 = -_2274;
    float _2296 = _2294 + _2276;
    float _2298 = fma(_2280, _2290, _2270);
    float _2300 = _2292 * 0.586610972881317138671875;
    out.m_59.x = _2286;
    bool _2302 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2304 = fma(_2280, _2296, _2274);
    float _2306 = fma(_2298, 0.298911988735198974609375, _2300);
    bool _2308 = _1902 > 0.0;
    bool _2310 = isnan(_1902);
    bool _2312 = _2308 || _2310;
    bool _2314 = isnan(0.0);
    bool _2316 = _2312 || _2314;
    float _2318 = fma(_2304, 0.114477999508380889892578125, _2306);
    float _2320 = -_2318;
    float _2322 = _2298 + _2320;
    float _2324 = -_2318;
    float _2326 = _2292 + _2324;
    float _2328 = -_2318;
    float _2330 = _2304 + _2328;
    float _2332 = fma(_2322, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2318);
    float _2334 = fma(_2326, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2318);
    float _2336 = fma(_2330, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2318);
    bool _2338 = !_2302;
    if (!_2338)
    {
        float _2340 = -_498;
        float _2342 = _2340 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2344 = -_500;
        float _2346 = _2344 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2348 = -_502;
        float _2350 = _2348 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2352 = _2342 * _2342;
        float _2354 = fma(_2346, _2346, _2352);
        float _2356 = fma(_2350, _2350, _2354);
        float _2358 = sqrt(_2356);
        float _2360 = rsqrt(_2356);
        float _2362 = -_2358;
        float _2364 = _2362 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2366 = _2364 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2368 = precise::clamp(_2366, 0.0, 1.0);
        float _2370 = _2346 * _2360;
        float _2372 = _2342 * _2360;
        float _2374 = abs(_2368);
        float _2376 = log2(_2374);
        float _2378 = _2350 * _2360;
        float _2380 = _2370 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2382 = _1920 * _2372;
        float _2384 = -_2372;
        float _2386 = -_2380;
        float _2388 = fma(_2384, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2386);
        float _2390 = fma(_1916, _2370, _2382);
        float _2392 = -_2378;
        float _2394 = fma(_2392, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2388);
        float _2396 = fma(_1936, _2378, _2390);
        float _2398 = precise::clamp(_2396, 0.0, 1.0);
        float _2400 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2402 = _2394 + _2400;
        float _2404 = _2376 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2406 = _2402 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2408 = precise::clamp(_2406, 0.0, 1.0);
        float _2410 = exp2(_2404);
        float _2412 = _2410 * _2408;
        float _2414 = _2398 * _2412;
        float _2416 = _2414 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2418 = _2414 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2420 = _2414 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_101.x = _2416;
        out.m_101.y = _2418;
        out.m_101.z = _2420;
    }
    out.m_103.x = _2332;
    out.m_103.y = _2334;
    out.m_103.z = _2336;
    if (_2316)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_59.x = 0.0;
    float _2422 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2422;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

