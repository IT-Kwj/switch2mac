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
    texture2d_array<float> vp_t_tcb_16 [[id(8)]];
    sampler vp_t_tcb_16Smplr [[id(9)]];
    texture3d<float> vp_t_tcb_32 [[id(10)]];
    sampler vp_t_tcb_32Smplr [[id(11)]];
    texture3d<float> vp_t_tcb_30 [[id(12)]];
    sampler vp_t_tcb_30Smplr [[id(13)]];
    texture2d_array<float> vp_t_tcb_14 [[id(14)]];
    sampler vp_t_tcb_14Smplr [[id(15)]];
    texture2d<float> vp_t_tcb_1C [[id(16)]];
    sampler vp_t_tcb_1CSmplr [[id(17)]];
    sampler vp_t_tcb_24Smplr_w [[id(18)]];
    sampler vp_t_tcb_32Smplr_w [[id(19)]];
    sampler vp_t_tcb_30Smplr_w [[id(20)]];
    sampler vp_t_tcb_14Smplr_w [[id(21)]];
    sampler vp_t_tcb_1CSmplr_w [[id(22)]];
    constant dm_border_t* dm_border [[id(23)]];
};

struct main0_out
{
    float4 m_83 [[user(locn0)]];
    float4 m_79 [[user(locn1)]];
    float4 m_59 [[user(locn2)]];
    float4 m_105 [[user(locn3)]];
    float4 m_95 [[user(locn4)]];
    float4 m_85 [[user(locn5)]];
    float4 m_93 [[user(locn6)]];
    float4 m_87 [[user(locn7)]];
    float4 m_91 [[user(locn8)]];
    float4 m_99 [[user(locn9)]];
    float4 m_73 [[user(locn10)]];
    float4 m_89 [[user(locn11)]];
    float4 m_103 [[user(locn12)]];
    float4 m_97 [[user(locn13)]];
    float4 m_101 [[user(locn14)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_67 [[attribute(1)]];
    float4 m_56 [[attribute(2)]];
    float4 m_61 [[attribute(3)]];
    float4 m_75 [[attribute(4)]];
    float4 m_69 [[attribute(5)]];
    float4 m_65 [[attribute(6)]];
    float4 m_63 [[attribute(7)]];
    float4 m_77 [[attribute(8)]];
    float4 m_71 [[attribute(9)]];
    float4 m_81 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2536 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _119 = in.m_56.w;
    float _121 = trunc(_119);
    int _124 = int(_121);
    bool _128 = _124 >= 1;
    float _130 = 0.0;
    float _132 = as_type<float>(_124);
    if (!_128)
    {
        _130 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _134 = _130;
    if (!_128)
    {
        out.m_59.x = 0.0;
    }
    int _136 = 0;
    if (!_128)
    {
        float _138 = _134 * 5.0;
        _136 = as_type<int>(_138);
    }
    int _140 = _136;
    int _142 = _140;
    if (!_128)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2820 = as_type<float>(_140);
        out.gl_Position.z = _2820;
    }
    if (!_128)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _144 = in.m_61.w;
    bool _146 = _144 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _148 = isnan(_144);
    bool _150 = _146 || _148;
    bool _152 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _154 = _150 || _152;
    float _156 = -_144;
    float _158 = _156 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _160 = _158;
    if (_154)
    {
        float _162 = float(_124);
        _132 = _162;
    }
    float _164 = _132;
    bool _166 = _158 >= _164;
    bool _168 = !_154;
    bool _170 = _166 || _168;
    float _172 = _164;
    if (_170)
    {
        _172 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _174 = _172;
    if (_170)
    {
        out.m_59.x = 0.0;
    }
    if (_170)
    {
        float _176 = _174 * 5.0;
        _142 = as_type<int>(_176);
    }
    int _178 = _142;
    if (_170)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2890 = as_type<float>(_178);
        out.gl_Position.z = _2890;
    }
    if (_170)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _180 = in.m_63.w;
    float _182 = _158 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _184 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _186 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _188 = _184 || _186;
    bool _190 = isnan(1.0);
    bool _192 = _188 || _190;
    float _194 = in.m_61.x;
    float _196 = in.m_61.y;
    float _198 = in.m_61.z;
    float _200 = in.m_56.x;
    float _202 = in.m_56.y;
    float _204 = in.m_56.z;
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
    float _282 = _256 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _284 = _256 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _286 = fma(_280, _196, _282);
    float _288 = _256 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _290 = fma(_280, _194, _284);
    float _292 = fma(_286, _180, _202);
    float _294 = fma(_280, _198, _288);
    float _296 = fma(_290, _180, _200);
    float _298 = _292 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _300 = fma(_294, _180, _204);
    float _302 = fma(_296, (*spvDescriptorSet0.vp_c10)._m0[4].x, _298);
    float _304 = _292 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _306 = fma(_300, (*spvDescriptorSet0.vp_c10)._m0[4].z, _302);
    float _308 = fma(_296, (*spvDescriptorSet0.vp_c10)._m0[6].x, _304);
    float _310 = _306 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _312 = fma(_300, (*spvDescriptorSet0.vp_c10)._m0[6].z, _308);
    float _314 = fma(_310, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _316 = _312 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _318 = floor(_314);
    float _320 = fma(_316, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _322 = floor(_320);
    float _324 = -_318;
    float _326 = _314 + _324;
    float _328 = -_322;
    float _330 = _320 + _328;
    float2 _3139 = float2(_326, _330);
    float _332 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3139, float2(0.0), isnan(_3139)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3139, float2(0.0), isnan(_3139)), level(0.0)).x;
    float _334 = in.m_65.z;
    float _336 = _292 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _338 = in.m_65.x;
    float _340 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _342 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _344 = _342 != 0;
    float _346 = in.m_65.y;
    float _348 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _352 = 1.0 + _350;
    float _354 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _356 = _334 * 2.0;
    float _358 = 1.0 / _352;
    float _360 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.300000011920928955078125;
    float _362 = _338 * 2.0;
    float _364 = _338 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _366 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[88].z, _354);
    float _368 = _346 + _334;
    float _370 = floor(_356);
    float _372 = _346 * 2.0;
    float _374 = -_340;
    float _376 = fma(_364, 2.0, _374);
    float _378 = _346 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _380 = _368 + (-1.0);
    float _382 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[87].z, _366);
    float _384 = -_158;
    float _386 = fma(_384, (*spvDescriptorSet0.vp_c9)._m0[76].x, _376);
    float _388 = fma(_378, -2.0, _348);
    float _390 = floor(_362);
    float _392 = _346 + _338;
    float _394 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[76].y, _388);
    float _396 = _392 + (-1.0);
    float _398 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _400 = _380;
    int _402 = 2;
    int _404 = as_type<int>(_394);
    float _406 = _346;
    if (_344)
    {
        _400 = _338;
    }
    float _408 = _400;
    float _410 = floor(_372);
    bool _412 = _370 > 0.0;
    float _414 = fma(_396, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _416 = _370 >= 0.0;
    bool _418 = isnan(_370);
    bool _420 = _416 || _418;
    bool _422 = isnan(0.0);
    bool _424 = _420 || _422;
    float _426 = _408;
    float _428 = (*spvDescriptorSet0.vp_c9)._m0[87].x;
    if (!_344)
    {
        _426 = _334;
    }
    float _430 = _426;
    bool _432 = _390 > 0.0;
    float _434 = _430 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _436 = _390 >= 0.0;
    bool _438 = isnan(_390);
    bool _440 = _436 || _438;
    bool _442 = isnan(0.0);
    bool _444 = _440 || _442;
    float _446 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _448 = _434;
    if (!_344)
    {
        _428 = _346;
    }
    float _450 = _428;
    float _452 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _454 = _450;
    if (_344)
    {
        _454 = _338;
    }
    float _456 = _454;
    float _458 = -_446;
    float _460 = fma(_434, 2.0, _458);
    bool _462 = _410 > 0.0;
    float _464 = fma(_456, (*spvDescriptorSet0.vp_c9)._m0[83].z, _452);
    bool _466 = _410 >= 0.0;
    bool _468 = isnan(_410);
    bool _470 = _466 || _468;
    bool _472 = isnan(0.0);
    bool _474 = _470 || _472;
    float _476 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _478 = _456 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _480 = _478;
    if (!_344)
    {
        _448 = _334;
    }
    float _482 = _448;
    float _484 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _486 = log2(_484);
    float _488 = _482;
    if (_344)
    {
        _488 = _346;
    }
    float _490 = _488;
    float _492 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _494 = _424 ? 0 : 1;
    float _496 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[82].z, _464);
    float _498 = -_158;
    float _500 = fma(_498, (*spvDescriptorSet0.vp_c9)._m0[86].x, _460);
    float _502 = fma(_490, (*spvDescriptorSet0.vp_c9)._m0[83].w, _476);
    float _504 = _490;
    if (_344)
    {
        _504 = _346;
    }
    float _506 = _504;
    float _508 = -_492;
    float _510 = fma(_478, 2.0, _508);
    float _512 = _506;
    if (!_344)
    {
        _512 = _338;
    }
    float _514 = _512;
    float _516 = -_158;
    float _518 = fma(_516, (*spvDescriptorSet0.vp_c9)._m0[81].x, _510);
    if (!_344)
    {
        _480 = _334;
    }
    float _520 = _480;
    float _522 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _524 = _520;
    if (_344)
    {
        _524 = _346;
    }
    float _526 = _524;
    float _528 = _514 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _530 = _486 * _158;
    int _532 = ~_494;
    int _534 = _532 + 1;
    int _536 = _534 + 1;
    float _538 = fma(_528, -2.0, _522);
    float _540 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _542 = _526 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _544 = _536;
    if (!_412)
    {
        int _546 = ~_494;
        int _548 = _546 + 1;
        _544 = _548;
    }
    int _550 = _544;
    float _552 = exp2(_530);
    float _554 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _556 = fma(_542, -2.0, _540);
    int _558 = _444 ? 0 : 1;
    float _560 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[86].y, _538);
    float _562 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[78].z, _554);
    int _564 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _566 = _564 != 0;
    int _568 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _570 = _568 != 0;
    int _572 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _574 = _572 != 0;
    float _576 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _578 = ~_558;
    int _580 = _578 + 1;
    int _582 = _580 + 1;
    float _584 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[77].z, _562);
    int _586 = _582;
    if (!_432)
    {
        int _588 = ~_558;
        int _590 = _588 + 1;
        _586 = _590;
    }
    int _592 = _586;
    float _594 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    bool _596 = !_566;
    int _598 = _596 ? 0 : 1;
    float _600 = in.m_67.x;
    float _602 = in.m_67.y;
    float _604 = in.m_67.z;
    float _606 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[78].w, _576);
    float _608 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[88].w, _594);
    int _610 = abs(_598);
    float _612 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[82].w, _502);
    float _614 = float(_550);
    float _616 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[81].y, _556);
    float _618 = float(_610);
    float _620 = -_552;
    float _622 = _620 + 1.0;
    bool _624 = !_570;
    int _626 = _624 ? 0 : 1;
    float _628 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[77].w, _606);
    bool _630 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _632 = isnan(1.0);
    bool _634 = _630 || _632;
    bool _636 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _638 = _634 || _636;
    float _640 = _618 * _614;
    int _642 = abs(_626);
    float _644 = _338 + (-0.5);
    bool _646 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _648 = isnan(0.0);
    bool _650 = _646 || _648;
    bool _652 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _654 = _650 || _652;
    float _656 = _640 * (-2.0);
    float _658 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[87].w, _608);
    float _660 = float(_592);
    float _662 = float(_642);
    float _664 = _654 ? _622 : 0.0;
    float _666 = fma(_656, _600, _600);
    bool _668 = !_574;
    int _670 = _668 ? 0 : 1;
    float _672 = _662 * _660;
    int _674 = _474 ? 0 : 1;
    if (_638)
    {
        float _676 = _664 * _358;
        _160 = _676;
    }
    float _678 = _160;
    float _680 = fma(_414, _656, _414);
    float _682 = fma(_644, (*spvDescriptorSet0.vp_c9)._m0[196].x, _666);
    int _684 = abs(_670);
    float _686 = _672 * (-2.0);
    int _688 = ~_674;
    int _690 = _688 + 1;
    int _692 = _690 + 1;
    float _694 = fma(_680, _678, _682);
    int _696 = _692;
    if (!_462)
    {
        int _698 = ~_674;
        int _700 = _698 + 1;
        _696 = _700;
    }
    int _702 = _696;
    float _704 = _346 + (-0.5);
    float _706 = fma(_686, _602, _602);
    float _708 = float(_684);
    float _710 = _694 * 0.15915493667125701904296875;
    float _712 = float(_702);
    float _714 = fma(_296, (*spvDescriptorSet0.vp_c10)._m0[5].x, _336);
    float _716 = fma(_704, (*spvDescriptorSet0.vp_c9)._m0[196].y, _706);
    float _718 = _338 + _334;
    float _720 = _708 * _712;
    float _722 = fma(_398, _686, _398);
    float _724 = _718 + (-1.0);
    float _726 = fma(_300, (*spvDescriptorSet0.vp_c10)._m0[5].z, _714);
    float _728 = _720 * (-2.0);
    float _730 = fma(_722, _678, _716);
    float _732 = fma(_724, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _734 = _334 + (-0.5);
    float _736 = fma(_728, _604, _604);
    float _738 = _726 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _740 = in.m_63.x;
    float _742 = in.m_63.y;
    float _744 = in.m_63.z;
    float _746 = fma(_732, _728, _732);
    float _748 = fma(_734, (*spvDescriptorSet0.vp_c9)._m0[196].z, _736);
    float _750 = _738 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _752 = in.m_69.x;
    float _754 = in.m_69.y;
    float _756 = in.m_69.z;
    float _758 = _710 * 6.283185482025146484375;
    float _760 = sin(_758);
    float _762 = fma(_746, _678, _748);
    float _764 = fma(_310, (*spvDescriptorSet0.vp_c8)._m0[11].x, _750);
    float _766 = _738 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _768 = _730 * 0.15915493667125701904296875;
    float _770 = _762 * 0.15915493667125701904296875;
    float _772 = fma(_316, (*spvDescriptorSet0.vp_c8)._m0[11].z, _764);
    float _774 = _710 * 6.283185482025146484375;
    float _776 = cos(_774);
    float _778 = _772 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _780 = fma(_310, (*spvDescriptorSet0.vp_c8)._m0[10].x, _766);
    float _782 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _784 = fma(_316, (*spvDescriptorSet0.vp_c8)._m0[10].z, _780);
    float _786 = 1.0 / _778;
    float _788 = _738 + _782;
    float _790 = _740 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _792 = _784 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _794 = _744 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _796 = _742 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _798 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _752);
    float _800 = _768 * 6.283185482025146484375;
    float _802 = sin(_800);
    float _804 = _790 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _806 = _792 + _778;
    float _808 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _756);
    float _810 = _794 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _812 = _798 * _804;
    float _814 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _754);
    float _816 = _768 * 6.283185482025146484375;
    float _818 = cos(_816);
    float _820 = _796 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _822 = _806 * _786;
    float _824 = _822 * 0.5;
    float _826 = _808 * _810;
    float _828 = _814 * _820;
    float _830 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _832 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[30].w, _830);
    float _834 = _770 * 6.283185482025146484375;
    float _836 = cos(_834);
    float _838 = _776 * _802;
    float _840 = _760 * _802;
    float _842 = _788 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _844 = fma(_310, (*spvDescriptorSet0.vp_c15)._m0[126].x, _842);
    float _846 = _770 * 6.283185482025146484375;
    float _848 = sin(_846);
    float _850 = _760 * _818;
    float _852 = _776 * _818;
    float _854 = fma(_316, (*spvDescriptorSet0.vp_c15)._m0[126].z, _844);
    float _856 = _854 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _858 = _776 * _836;
    float _860 = _760 * _836;
    float _862 = 1.0 / _832;
    float _864 = _818 * _836;
    float _866 = _802 * _836;
    float _868 = _860 * _828;
    float _870 = -_838;
    float _872 = fma(_848, _850, _870);
    float _874 = -_850;
    float _876 = fma(_848, _838, _874);
    float _878 = fma(_848, _852, _840);
    float _880 = _858 * _828;
    float _882 = fma(_848, _840, _852);
    float _884 = -_828;
    float _886 = _848 * _884;
    float _888 = (*spvDescriptorSet0.vp_c10)._m0[2].x * (-0.550000011920928955078125);
    float _890 = fma(_878, _812, _880);
    float _892 = trunc(_856);
    int _894 = int(_892);
    float _896 = fma(_864, _812, _886);
    float _898 = fma(_872, _812, _868);
    float _900 = fma(_876, _826, _890);
    float _902 = _788 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _904 = fma(_866, _826, _896);
    float _906 = fma(_882, _826, _898);
    float _908 = _900 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _910 = fma(_310, (*spvDescriptorSet0.vp_c15)._m0[127].x, _902);
    float _912 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _914 = _862 * _912;
    float _916 = (*spvDescriptorSet0.vp_c10)._m0[2].x * (-0.60000002384185791015625);
    float _918 = fma(_904, (*spvDescriptorSet0.vp_c10)._m0[9].x, _908);
    float _920 = fma(_316, (*spvDescriptorSet0.vp_c15)._m0[127].z, _910);
    float _922 = _900 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    bool _924 = _914 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _926 = fma(_906, (*spvDescriptorSet0.vp_c10)._m0[9].z, _918);
    bool _928 = _914 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _930 = (*spvDescriptorSet0.vp_c10)._m0[2].x * (-0.2800000011920928955078125);
    float _932 = _900 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _934 = _738 + _926;
    float _936 = _920 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    bool _938 = !_924;
    int _940 = _938 ? 0 : 1;
    float _942 = fma(_904, (*spvDescriptorSet0.vp_c10)._m0[8].x, _922);
    float _944 = fma(_934, 0.4000000059604644775390625, _930);
    float _946 = fma(_934, 0.85000002384185791015625, _916);
    float _948 = fma(_934, 0.75, _888);
    float _950 = trunc(_936);
    int _952 = int(_950);
    float _954 = _944 * 0.15915493667125701904296875;
    float _956 = (*spvDescriptorSet0.vp_c10)._m0[2].x * (-0.310000002384185791015625);
    float _958 = _934;
    if (!_924)
    {
        _402 = 1;
    }
    int _960 = _402;
    float _962 = _946 * 0.15915493667125701904296875;
    int _964 = _960;
    if (!_928)
    {
        _964 = _940;
    }
    int _966 = _964;
    float _968 = fma(_934, 0.3499999940395355224609375, _956);
    float _970 = _948 * 0.15915493667125701904296875;
    float _972 = _954 * 6.283185482025146484375;
    float _974 = sin(_972);
    int _976 = _966 << 6;
    float _978 = _968 * 0.15915493667125701904296875;
    float _980 = fma(_904, (*spvDescriptorSet0.vp_c10)._m0[10].x, _932);
    int _982 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _984 = _894 + _982;
    int _986 = _984 + 1;
    int _988 = _976 + 96;
    uint _991 = uint(int(uint(_988) >> uint(2)));
    uint _993 = uint(int(uint(int(_991)) >> uint(2)));
    int _995 = int(_991) & 3;
    float _997 = (*spvDescriptorSet0.vp_c15)._m0[int(_993)][_995];
    int _999 = int(_991) + 1;
    uint _1001 = uint(int(uint(_999) >> uint(2)));
    int _1003 = _999 & 3;
    float _1005 = (*spvDescriptorSet0.vp_c15)._m0[int(_1001)][_1003];
    float _1007 = fma(_906, (*spvDescriptorSet0.vp_c10)._m0[8].z, _942);
    float _1009 = fma(_906, (*spvDescriptorSet0.vp_c10)._m0[10].z, _980);
    float _1011 = _962 * 6.283185482025146484375;
    float _1013 = sin(_1011);
    float _1015 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.17000000178813934326171875;
    bool _1017 = _986 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1019 = _316 + _1009;
    float _1021 = _310 + _1007;
    int _1023 = _976 + 104;
    uint _1025 = uint(int(uint(_1023) >> uint(2)));
    uint _1027 = uint(int(uint(int(_1025)) >> uint(2)));
    int _1029 = int(_1025) & 3;
    float _1031 = (*spvDescriptorSet0.vp_c15)._m0[int(_1027)][_1029];
    int _1033 = int(_1025) + 1;
    uint _1035 = uint(int(uint(_1033) >> uint(2)));
    int _1037 = _1033 & 3;
    float _1039 = (*spvDescriptorSet0.vp_c15)._m0[int(_1035)][_1037];
    float _1041 = fma(_1019, 0.550000011920928955078125, _1015);
    float _1043 = _978 * 6.283185482025146484375;
    float _1045 = sin(_1043);
    float _1047 = fma(_1021, 0.89999997615814208984375, _360);
    float _1049 = _1041 * 0.15915493667125701904296875;
    int _1051 = _976 + 64;
    uint _1053 = uint(int(uint(_1051) >> uint(2)));
    uint _1055 = uint(int(uint(int(_1053)) >> uint(2)));
    int _1057 = int(_1053) & 3;
    float _1059 = (*spvDescriptorSet0.vp_c15)._m0[int(_1055)][_1057];
    int _1061 = int(_1053) + 1;
    uint _1063 = uint(int(uint(_1061) >> uint(2)));
    int _1065 = _1061 & 3;
    float _1067 = (*spvDescriptorSet0.vp_c15)._m0[int(_1063)][_1065];
    float _1069 = _1047 * 0.15915493667125701904296875;
    float _1071 = _970 * 6.283185482025146484375;
    float _1073 = sin(_1071);
    float _1075 = _974 + _1013;
    int _1077 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1079 = _952 + _1077;
    int _1081 = _1079 + 1;
    int _1083 = _976 + 48;
    uint _1085 = uint(int(uint(_1083) >> uint(2)));
    uint _1087 = uint(int(uint(int(_1085)) >> uint(2)));
    int _1089 = int(_1085) & 3;
    float _1091 = (*spvDescriptorSet0.vp_c15)._m0[int(_1087)][_1089];
    int _1093 = int(_1085) + 1;
    uint _1095 = uint(int(uint(_1093) >> uint(2)));
    int _1097 = _1093 & 3;
    float _1099 = (*spvDescriptorSet0.vp_c15)._m0[int(_1095)][_1097];
    int _1101 = _986 | _1081;
    bool _1103 = _1101 < 0;
    bool _1105 = _1103 || _1017;
    int _1107 = _976 + 72;
    uint _1109 = uint(int(uint(_1107) >> uint(2)));
    uint _1111 = uint(int(uint(int(_1109)) >> uint(2)));
    int _1113 = int(_1109) & 3;
    float _1115 = (*spvDescriptorSet0.vp_c15)._m0[int(_1111)][_1113];
    int _1117 = int(_1109) + 1;
    uint _1119 = uint(int(uint(_1117) >> uint(2)));
    int _1121 = _1117 & 3;
    float _1123 = (*spvDescriptorSet0.vp_c15)._m0[int(_1119)][_1121];
    bool _1125 = _1081 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1127 = _1125 || _1105;
    float _1129 = _1045 + _1073;
    float _1131 = fma(_1075, 0.00999999977648258209228515625, _1021);
    float _1133 = _1049 * 6.283185482025146484375;
    float _1135 = sin(_1133);
    float _1137 = fma(_1129, 0.00999999977648258209228515625, _1019);
    int _1139 = _976 + 56;
    uint _1141 = uint(int(uint(_1139) >> uint(2)));
    uint _1143 = uint(int(uint(int(_1141)) >> uint(2)));
    int _1145 = int(_1141) & 3;
    float _1147 = (*spvDescriptorSet0.vp_c15)._m0[int(_1143)][_1145];
    int _1149 = int(_1141) + 1;
    uint _1151 = uint(int(uint(_1149) >> uint(2)));
    int _1153 = _1149 & 3;
    float _1155 = (*spvDescriptorSet0.vp_c15)._m0[int(_1151)][_1153];
    float _1157 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1159 = _1131 + _1157;
    float _1161 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1163 = _1137 + _1161;
    int _1165 = _986;
    float _1167 = as_type<float>(_1081);
    float _1169 = _1069;
    if (!_1127)
    {
        int _1171 = _1081 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1173 = _1171 + _986;
        _1165 = _1173;
    }
    int _1175 = _1165;
    float _1177 = _1163 * _1163;
    int _1179 = _976 + 80;
    uint _1181 = uint(int(uint(_1179) >> uint(2)));
    uint _1183 = uint(int(uint(int(_1181)) >> uint(2)));
    int _1185 = int(_1181) & 3;
    float _1187 = (*spvDescriptorSet0.vp_c15)._m0[int(_1183)][_1185];
    int _1189 = int(_1181) + 1;
    uint _1191 = uint(int(uint(_1189) >> uint(2)));
    int _1193 = _1189 & 3;
    float _1195 = (*spvDescriptorSet0.vp_c15)._m0[int(_1191)][_1193];
    float _1197 = _788 * _1005;
    if (!_1127)
    {
        float _1199 = floor(_856);
        _1167 = _1199;
    }
    float _1201 = _1167;
    float _1203 = fma(_1159, _1159, _1177);
    float _1205 = fma(_310, _997, _1197);
    float _1207 = fma(_316, _1031, _1205);
    float _1209 = sqrt(_1203);
    float _1211 = _1207 + _1039;
    float _1213 = _1135 * 0.20999999344348907470703125;
    float _1215 = _788 * _1067;
    float _1217 = _1069 * 6.283185482025146484375;
    float _1219 = sin(_1217);
    float _1221 = fma(_310, _1059, _1215);
    int _1223 = as_type<int>(_1059);
    float _1225 = _1213;
    float _1227 = _1135;
    if (!_1127)
    {
        int _1229 = _1175 << 2;
        _1223 = _1229;
    }
    int _1231 = _1223;
    float _1233 = _788 * _1099;
    int _1235 = _1231;
    int _1237 = as_type<int>(_1233);
    float _1239 = _1195;
    if (!_1127)
    {
        int _1241 = 12 & _1231;
        _1235 = _1241;
    }
    int _1243 = _1235;
    float _1245 = 1.0 / _1211;
    bool _1247 = _1209 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1249 = fma(_310, _1091, _1233);
    int _1251 = as_type<int>(_1249);
    if (!_1127)
    {
        uint _1253 = uint(int(uint(_1175) >> uint(2)));
        _1237 = int(_1253);
    }
    int _1255 = _1237;
    float _1257 = fma(_316, _1115, _1221);
    float _1259 = fma(_1219, 0.300000011920928955078125, _1213);
    float _1261 = _1257 + _1123;
    float _1263 = _934 + _1259;
    float _1265 = fma(_316, _1147, _1249);
    float _1267 = _1259;
    if (!_1127)
    {
        int _1269 = _1255 << 4;
        int _1271 = _1269 + _1243;
        _1251 = _1271;
    }
    int _1273 = _1251;
    if (!_1247)
    {
        _1225 = _1131;
    }
    float _1275 = _1225;
    float _1277 = _1265 + _1155;
    float _1279 = _1275;
    if (!_1247)
    {
        _958 = _1137;
    }
    float _1281 = _958;
    float _1283 = _1281;
    if (!_1247)
    {
        _1267 = _1263;
    }
    float _1285 = _1267;
    bool _1287 = !_1247;
    float _1289 = _1285;
    if (!_1287)
    {
        float _1291 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1293 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1295 = _1209 + _1293;
        float _1297 = _1263 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1299 = rsqrt(_1203);
        float _1301 = _1295 * _1291;
        float _1303 = _1301 * 0.15915493667125701904296875;
        float _1305 = _1303 * 6.283185482025146484375;
        float _1307 = cos(_1305);
        float _1309 = _1303 * 6.283185482025146484375;
        float _1311 = sin(_1309);
        float _1313 = _1307 + (-1.0);
        float _1315 = _1313 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1317 = fma(_1311, _1297, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1319 = fma(_1263, _1307, _1315);
        float _1321 = _1299 * _1317;
        float _1323 = fma(_1159, _1321, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1325 = fma(_1163, _1321, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1289 = _1319;
        _1279 = _1323;
        _1283 = _1325;
    }
    float _1327 = _1289;
    float _1329 = _1279;
    float _1331 = _1283;
    int _1333 = _976 + 88;
    uint _1335 = uint(int(uint(_1333) >> uint(2)));
    uint _1337 = uint(int(uint(int(_1335)) >> uint(2)));
    int _1339 = int(_1335) & 3;
    float _1341 = (*spvDescriptorSet0.vp_c15)._m0[int(_1337)][_1339];
    int _1343 = int(_1335) + 1;
    uint _1345 = uint(int(uint(_1343) >> uint(2)));
    int _1347 = _1343 & 3;
    float _1349 = (*spvDescriptorSet0.vp_c15)._m0[int(_1345)][_1347];
    float _1351 = _1327 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1353 = _1327 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1355 = _1327 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1357 = _1277 * _1245;
    float _1359 = fma(_1329, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1351);
    float _1361 = fma(_1329, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1353);
    float _1363 = fma(_1329, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1355);
    float _1365 = _1209;
    if (!_1127)
    {
        int _1367 = _1273 + 400;
        uint _1369 = uint(int(uint(_1367) >> uint(2)));
        uint _1371 = uint(int(uint(int(_1369)) >> uint(2)));
        int _1373 = int(_1369) & 3;
        float _1375 = (*spvDescriptorSet0.vp_c15)._m0[int(_1371)][_1373];
        _1365 = _1375;
    }
    float _1377 = _1365;
    float _1379 = fma(_1331, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1359);
    float _1381 = fma(_1331, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1361);
    float _1383 = _1327 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1385 = fma(_1331, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1363);
    float _1387 = _1379 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _1389 = _1357 >= 0.0;
    float _1391 = fma(_1329, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1383);
    float _1393 = _1385 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1395 = _1387 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1397 = _1261 * _1245;
    bool _1399 = _1357 <= 1.0;
    bool _1401 = _1399 && _1389;
    float _1403 = _1381 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1405 = fma(_1331, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1391);
    float _1407 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1395);
    bool _1409 = _1397 >= 0.0;
    bool _1411 = _1409 && _1401;
    float _1413 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1415 = _1405 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1417 = fma(_1403, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1407);
    float _1419 = _1403 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    bool _1421 = _1397 <= 1.0;
    bool _1423 = _1421 && _1411;
    float _1425 = _1265;
    float _1427 = _1397;
    if (!_1127)
    {
        float _1429 = floor(_936);
        _1425 = _1429;
    }
    float _1431 = _1425;
    float _1433 = fma(_1415, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1417);
    float _1435 = _788 * _1195;
    float _1437 = -_1419;
    float _1439 = fma(_1437, _1413, 1.0);
    float _1441 = _1387 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1443 = _1387 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1445 = fma(_310, _1187, _1435);
    float _1447 = 1.0 / _1433;
    float _1449 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1441);
    float _1451 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1443);
    float _1453 = _1433;
    if (_1423)
    {
        float _1455 = float(_966);
        _1239 = _1455;
    }
    float _1457 = _1239;
    float _1459 = fma(_1403, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1449);
    float _1461 = fma(_1403, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1451);
    float _1463 = log2(_1439);
    if (!_1127)
    {
        float _1465 = -_1431;
        float _1467 = _936 + _1465;
        _1227 = _1467;
    }
    float _1469 = _1227;
    float _1471 = fma(_1415, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1459);
    float _1473 = fma(_316, _1341, _1445);
    float _1475 = fma(_1415, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1461);
    float _1477 = _1473 + _1349;
    float _1479 = _1435;
    float _1481 = _1349;
    float _1483 = _1475;
    if (_1423)
    {
        float _1485 = rint(_1457);
        float _1487 = precise::max(_1485, 0.0);
        uint _1489 = uint(_1487);
        uint _1491 = clamp(_1489, 0u, 65535u);
        _1479 = as_type<float>(_1491);
    }
    float _1493 = _1479;
    float _1495 = _1471 * _1447;
    float _1497 = _1475 * _1447;
    float _1499 = _1477 * _1245;
    if (!_1127)
    {
        float _1501 = -_1201;
        float _1503 = _856 + _1501;
        _1481 = _1503;
    }
    float _1505 = _1481;
    float _1507 = fma(_1495, 0.5, 0.5);
    float _1509 = _1477;
    float _1511 = _1507;
    if (!_1127)
    {
        float _1513 = rint(_1377);
        float _1515 = precise::max(_1513, 0.0);
        uint _1517 = uint(_1515);
        uint _1519 = clamp(_1517, 0u, 65535u);
        _1509 = as_type<float>(_1519);
    }
    float _1521 = _1509;
    float _1523 = _1463 * 0.693147182464599609375;
    float _1525 = fma(_1497, -0.5, 0.5);
    float _1527 = _1523 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1529 = _1201;
    float _1531 = _1523;
    float _1533 = _1525;
    if (_1423)
    {
        float3 _5102 = float3(_1357, _1397, float(as_type<int>(_1493)));
        float3 _5106 = select(_5102, float3(0.0), isnan(_5102));
        float _1535 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5106.xy, uint(rint(_5106.z)), _1499, level(0.0));
        _1529 = _1535;
    }
    float _1537 = _1529;
    float3 _5116 = float3(_1507, _1525, _1527);
    float _1539 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5116, float3(0.0), isnan(_5116)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5116, float3(0.0), isnan(_5116)), level(0.0)).x;
    float3 _5125 = float3(_1507, _1525, _1527);
    float4 _1542 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5125, float3(0.0), isnan(_5125)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5125, float3(0.0), isnan(_5125)), level(0.0)).xyzw;
    float _1544 = _1542.x;
    float _1546 = _1542.y;
    float _1548 = _1542.z;
    float _1550 = _1542.w;
    float _1552 = _1469;
    if (!_1127)
    {
        float3 _5148 = float3(_1505, _1469, float(as_type<int>(_1521)));
        float3 _5150 = select(_5148, float3(0.0), isnan(_5148));
        float _1554 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5150.xy, uint(rint(_5150.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5150.xy, uint(rint(_5150.z)), level(0.0)).x;
        _1552 = _1554;
    }
    float _1556 = _1552;
    if (_1127)
    {
        _1531 = 1.0;
    }
    float _1558 = _1531;
    float _1560 = _1558;
    if (!_1127)
    {
        int _1562 = _1175 << 4;
        int _1564 = _1562 + 2048;
        uint _1566 = uint(int(uint(_1564) >> uint(2)));
        uint _1568 = uint(int(uint(int(_1566)) >> uint(2)));
        int _1570 = int(_1566) & 3;
        float _1572 = (*spvDescriptorSet0.vp_c15)._m0[int(_1568)][_1570];
        int _1574 = int(_1566) + 1;
        uint _1576 = uint(int(uint(_1574) >> uint(2)));
        int _1578 = _1574 & 3;
        float _1580 = (*spvDescriptorSet0.vp_c15)._m0[int(_1576)][_1578];
        int _1582 = _1564 + 8;
        uint _1584 = uint(int(uint(_1582) >> uint(2)));
        uint _1586 = uint(int(uint(int(_1584)) >> uint(2)));
        int _1588 = int(_1584) & 3;
        float _1590 = (*spvDescriptorSet0.vp_c15)._m0[int(_1586)][_1588];
        int _1592 = int(_1584) + 1;
        uint _1594 = uint(int(uint(_1592) >> uint(2)));
        int _1596 = _1592 & 3;
        float _1598 = (*spvDescriptorSet0.vp_c15)._m0[int(_1594)][_1596];
        float _1600 = _788 * _1580;
        float _1602 = fma(_310, _1572, _1600);
        float _1604 = fma(_316, _1590, _1602);
        float _1606 = _1604 + _1598;
        float _1608 = precise::clamp(_1606, 0.0, 1.0);
        float _1610 = -_1608;
        float _1612 = _1610 + _1556;
        float _1614 = fma(_1612, 500.0, 1.5);
        float _1616 = exp2(_1614);
        float _1618 = 0.0 + _1616;
        float _1620 = precise::clamp(_1618, 0.0, 1.0);
        _1560 = _1620;
    }
    float _1622 = _1560;
    float _1624 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1626 = _1327 + _1624;
    float _1628 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1630 = _1329 + _1628;
    float _1632 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1634 = _1331 + _1632;
    float _1636 = _1626 * _1626;
    float _1638 = fma(_1630, _1630, _1636);
    float _1640 = fma(_1634, _1634, _1638);
    float _1642 = rsqrt(_1640);
    float _1644 = sqrt(_1640);
    float _1646 = _1642 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1648 = _1630 * _1646;
    float _1650 = _1634 * _1646;
    float _1652 = _1648 * _1648;
    float _1654 = _1650 * _1650;
    float _1656 = _1652 + _1654;
    float _1658 = sqrt(_1656);
    bool _1660 = _1658 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1662 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1664 = _1658 + _1662;
    float _1666 = _1642;
    float _1668 = _1664;
    float _1670 = _1626;
    bool _1672 = _1660;
    if (_1660)
    {
        float _1674 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1666 = _1674;
    }
    float _1676 = _1666;
    if (_1660)
    {
        float _1678 = rsqrt(_1656);
        _1511 = _1678;
    }
    float _1680 = _1511;
    float _1682 = _1680;
    if (_1660)
    {
        float _1684 = _1664 * _1676;
        _1668 = _1684;
    }
    float _1686 = _1668;
    if (_1660)
    {
        float _1688 = _1686 * 0.15915493667125701904296875;
        _1533 = _1688;
    }
    float _1690 = _1533;
    float _1692 = _1634;
    if (_1660)
    {
        float _1694 = _1690 * 6.283185482025146484375;
        float _1696 = sin(_1694);
        _1692 = _1696;
    }
    float _1698 = _1692;
    float _1700 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1702 = precise::max(0.0, _1700);
    float _1704 = _1676;
    float _1706 = _1702;
    if (_1660)
    {
        float _1708 = _1690 * 6.283185482025146484375;
        float _1710 = cos(_1708);
        _1704 = _1710;
    }
    float _1712 = _1704;
    float _1714 = -_1646;
    float _1716 = -_1702;
    float _1718 = fma(_1626, _1714, _1716);
    if (_1660)
    {
        float _1720 = _1718 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1670 = _1720;
    }
    float _1722 = _1670;
    float _1724 = _1722;
    float _1726 = _1698;
    if (_1660)
    {
        float _1728 = fma(_1698, _1722, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1724 = _1728;
    }
    float _1730 = _1724;
    float _1732 = _1730;
    if (!_1660)
    {
        _1726 = _1648;
    }
    float _1734 = _1726;
    float _1736 = _1734;
    float _1738 = _1712;
    if (_1660)
    {
        float _1740 = _1712 + (-1.0);
        _1706 = _1740;
    }
    float _1742 = _1706;
    float _1744 = _1742;
    if (_1660)
    {
        float _1746 = _1680 * _1730;
        _1169 = _1746;
    }
    float _1748 = _1169;
    if (!_1660)
    {
        _1732 = _1718;
    }
    float _1750 = _1732;
    float _1752 = _1750;
    if (_1660)
    {
        float _1754 = _1742 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1427 = _1754;
    }
    float _1756 = _1427;
    if (_1660)
    {
        float _1758 = _1648 * _1748;
        _1736 = _1758;
    }
    float _1760 = _1736;
    if (!_1660)
    {
        _1744 = _1650;
    }
    float _1762 = _1744;
    float _1764 = _1762;
    if (_1660)
    {
        float _1766 = _1650 * _1748;
        _1764 = _1766;
    }
    float _1768 = _1764;
    if (!_1660)
    {
        _1682 = _1652;
    }
    float _1770 = _1682;
    float _1772 = _1770;
    if (_1660)
    {
        float _1774 = fma(_1718, _1712, _1756);
        _1752 = _1774;
    }
    float _1776 = _1752;
    if (_1660)
    {
        float _1778 = _1760 * _1760;
        _1772 = _1778;
    }
    float _1780 = _1772;
    if (!_1660)
    {
        _1738 = _1654;
    }
    float _1782 = _1738;
    float _1784 = _1782;
    if (_1660)
    {
        float _1786 = _1768 * _1768;
        _1784 = _1786;
    }
    float _1788 = _1784;
    float _1790 = fma(_1776, _1776, _1780);
    float _1792 = _1790 + _1788;
    float _1794 = rsqrt(_1792);
    float _1796 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1798 = fma(_1644, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1796);
    float _1800 = precise::clamp(_1798, 0.0, 1.0);
    float _1802 = -_1800;
    float _1804 = _1802 + 1.0;
    float _1806 = abs(_1804);
    float _1808 = log2(_1806);
    float _1810 = _1794 * _1760;
    float _1812 = _1794 * _1776;
    float _1814 = _1794 * _1768;
    float _1816 = _1810 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1818 = -_1816;
    float _1820 = fma(_1812, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1818);
    float _1822 = _1808 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1824 = -_1814;
    float _1826 = fma(_1824, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1820);
    float _1828 = exp2(_1822);
    float _1830 = fma(_1826, -0.5, 0.5);
    float _1832 = fma(_1826, 0.5, 0.5);
    float _1834 = fma(_1832, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1836 = sqrt(_1830);
    float _1838 = fma(_1832, _1834, -0.212114393711090087890625);
    float _1840 = _1812 + 1.0;
    float _1842 = fma(_1832, _1838, 1.570728778839111328125);
    float _1844 = -_1812;
    float _1846 = fma(_1828, _1840, _1844);
    float _1848 = fma(_1846, 0.5, 0.5);
    float _1850 = _1836 * 0.636619746685028076171875;
    float _1852 = -_1842;
    float _1854 = fma(_1850, _1852, 1.0);
    float2 _5622 = float2(_1854, _1848);
    float3 _1858 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5622, float2(0.0), isnan(_5622)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5622, float2(0.0), isnan(_5622)), level(0.0)).xyz;
    float _1860 = _1858.x;
    float _1862 = _1858.y;
    float _1864 = _1858.z;
    float _1866 = in.m_71.x;
    float _1868 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1870 = _346 > 0.5;
    float _1872 = in.m_71.y;
    int _1874 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1876 = _1874 != 0;
    float _1878 = _1808 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1880 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1882 = _1880 != 0;
    float _1884 = in.m_65.w;
    bool _1886 = _334 > 0.5;
    float _1888 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1890 = -_332;
    float _1892 = _1890 + 1.0;
    out.m_73.x = _1329;
    out.m_73.y = _1327;
    out.m_73.z = _1331;
    int _1894 = as_type<int>(_1812);
    float _1896 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    float _1898 = _1868;
    if (_1876)
    {
        bool _1900 = _338 > 0.5;
        _1672 = _1900;
    }
    bool _1902 = _1672;
    float _1904 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1906 = _1866;
    if (_1876)
    {
        float _1908 = -_1866;
        float _1910 = _1908 + 1.0;
        _1894 = as_type<int>(_1910);
    }
    int _1912 = _1894;
    float _1914 = 0.0;
    if (!_1876)
    {
        _1914 = _1866;
    }
    float _1916 = _1914;
    float _1918 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1920 = -_1872;
    float _1922 = _1920 + 1.0;
    float _1924 = _1916;
    float _1926 = _1872;
    if (_1876)
    {
        float _1928 = _1902 ? as_type<float>(_1912) : _1866;
        _1924 = _1928;
    }
    float _1930 = _1924;
    int _1932 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1934 = _1932 != 0;
    int _1936 = _1870 ? as_type<int>(_1922) : as_type<int>(_1872);
    int _1938 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1940 = _1938 != 0;
    float _1942 = _1904 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1944 = _1884 > 0.5;
    float _1946 = exp2(_1878);
    float _1948 = in.m_75.x;
    float _1950 = in.m_75.y;
    float _1952 = in.m_75.z;
    float _1954 = _1934 ? as_type<float>(_1936) : _1872;
    float _1956 = _1868 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _1958 = _754 != 0.0;
    bool _1960 = isnan(_754);
    bool _1962 = _1958 || _1960;
    bool _1964 = isnan(0.0);
    bool _1966 = _1962 || _1964;
    float _1968 = fma(_1942, _1930, -0.5);
    int _1970 = _1944 ? as_type<int>(_1922) : as_type<int>(_1872);
    float _1972 = fma(_1956, _1954, -0.5);
    bool _1974 = _752 == 0.0;
    bool _1976 = !_1966;
    bool _1978 = _1974 && _1976;
    float _1980 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _1982 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1984 = _1982 != 0;
    float _1986 = _1918 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1988 = _1882 ? as_type<float>(_1970) : _1872;
    float _1990 = fma(_584, _1968, _386);
    int _1992 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1994 = _1992 != 0;
    bool _1996 = _756 == 0.0;
    bool _1998 = _1996 && _1978;
    float _2000 = fma(_1988, _1986, -0.5);
    if (_1940)
    {
        float _2002 = _1886 ? _1922 : _1872;
        _1926 = _2002;
    }
    float _2004 = _1926;
    float _2006 = _1888 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2008 = -_394;
    float _2010 = fma(_628, _1972, _2008);
    float _2012 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2014 = fma(_2006, _2004, -0.5);
    int _2016 = as_type<int>(_2006);
    if (_1984)
    {
        float _2018 = -_1866;
        float _2020 = _2018 + 1.0;
        _404 = as_type<int>(_2020);
    }
    int _2022 = _404;
    float _2024 = 0.0;
    if (!_1984)
    {
        _2024 = _1866;
    }
    float _2026 = _2024;
    float _2028 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2030 = _2026;
    if (_1994)
    {
        float _2032 = -_1866;
        float _2034 = _2032 + 1.0;
        _2016 = as_type<int>(_2034);
    }
    int _2036 = _2016;
    float _2038 = -_616;
    float _2040 = fma(_612, _2000, _2038);
    float _2042 = as_type<float>(_2036);
    if (_1998)
    {
        _1896 = _1948;
    }
    float _2044 = _1896;
    float _2046 = _2028 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2048 = 0.0;
    float _2050 = _2044;
    if (_1998)
    {
        _2048 = _1950;
    }
    float _2052 = _2048;
    float _2054 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2056 = _2052;
    if (_1984)
    {
        float _2058 = _1886 ? as_type<float>(_2022) : _1866;
        _2030 = _2058;
    }
    float _2060 = _2030;
    float _2062 = _2040 + 0.5;
    if (_1994)
    {
        float _2064 = _1870 ? as_type<float>(_2036) : _1866;
        _1906 = _2064;
    }
    float _2066 = _1906;
    float _2068 = _2054 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_1998)
    {
        _406 = _2044;
    }
    float _2070 = _406;
    float _2072 = -_1946;
    float _2074 = _2072 + 1.0;
    float _2076 = _2070;
    if (_1998)
    {
        _2042 = _2052;
    }
    float _2078 = _2042;
    float _2080 = _2078;
    if (!_1998)
    {
        _2050 = _1948;
    }
    float _2082 = _2050;
    float _2084 = _1980 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    if (!_1998)
    {
        _2056 = _1950;
    }
    float _2086 = _2056;
    float _2088 = _2012 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2090 = 0.0;
    if (_1998)
    {
        _2090 = _1952;
    }
    float _2092 = _2090;
    float _2094 = fma(_2084, _2060, -0.5);
    float _2096 = fma(_2088, _2066, -0.5);
    float _2098 = _2092;
    if (_1998)
    {
        _1898 = _2092;
    }
    float _2100 = _1898;
    float _2102 = fma(_496, _2094, _518);
    float _2104 = _2100;
    if (!_1998)
    {
        _2098 = _1952;
    }
    float _2106 = _2098;
    float _2108 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2110 = in.m_77.x;
    float _2112 = in.m_77.y;
    float _2114 = in.m_77.z;
    float _2116 = in.m_77.w;
    if (!_1998)
    {
        float _2118 = fma(_752, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2082);
        _2076 = _2118;
    }
    float _2120 = _2076;
    float _2122 = _2108 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (!_1998)
    {
        float _2124 = fma(_754, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2086);
        _2080 = _2124;
    }
    float _2126 = _2080;
    if (!_1998)
    {
        float _2128 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2106);
        _2104 = _2128;
    }
    float _2130 = _2104;
    float _2132 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2134 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2136 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    out.m_79.x = _2046;
    out.m_79.y = _2122;
    out.m_79.z = _2068;
    float _2138 = _2132 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2140 = _2134 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2142 = _2136 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2144 = -_2126;
    float _2146 = _848 * _2144;
    float _2148 = fma(_382, _2096, _500);
    float _2150 = in.m_81.x;
    float _2152 = fma(_864, _2120, _2146);
    float _2154 = _2074 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_83.x = _2138;
    out.m_83.y = _2140;
    out.m_83.z = _2142;
    float _2156 = fma(_866, _2130, _2152);
    float _2158 = _2114 * _2082;
    float _2160 = _2112 * _2106;
    float _2162 = _2110 * _2086;
    float _2164 = -_2158;
    float _2166 = fma(_2110, _2106, _2164);
    float _2168 = -_2160;
    float _2170 = fma(_2114, _2086, _2168);
    float _2172 = -_2162;
    float _2174 = fma(_2112, _2082, _2172);
    float _2176 = _2010 + 0.5;
    float _2178 = _2166 * _2116;
    float _2180 = _1990 + 0.5;
    float _2182 = _2102 + 0.5;
    float _2184 = -_560;
    float _2186 = fma(_658, _2014, _2184);
    float _2188 = _2170 * _2116;
    float _2190 = _2174 * _2116;
    float _2192 = -_2112;
    float _2194 = _848 * _2192;
    out.m_85.x = _2180;
    out.m_85.y = _2176;
    out.m_85.z = _2182;
    out.m_85.w = _2062;
    float _2196 = -_2178;
    float _2198 = _848 * _2196;
    float _2200 = _858 * _2126;
    float _2202 = fma(_864, _2110, _2194);
    float _2204 = _2148 + 0.5;
    float _2206 = fma(_864, _2188, _2198);
    float _2208 = _858 * _2112;
    float _2210 = _860 * _2112;
    float _2212 = fma(_878, _2120, _2200);
    float _2214 = _2186 + 0.5;
    float _2216 = fma(_878, _2110, _2208);
    float _2218 = fma(_872, _2110, _2210);
    float _2220 = fma(_866, _2190, _2206);
    float _2222 = fma(_866, _2114, _2202);
    float _2224 = abs(_914);
    float _2226 = log2(_2224);
    float _2228 = _860 * _2126;
    float _2230 = _858 * _2178;
    float _2232 = _860 * _2178;
    float _2234 = fma(_876, _2114, _2216);
    float _2236 = fma(_872, _2120, _2228);
    float _2238 = fma(_878, _2188, _2230);
    float _2240 = fma(_872, _2188, _2232);
    float _2242 = fma(_876, _2130, _2212);
    out.m_87.x = _2204;
    out.m_87.y = _2214;
    float _2244 = fma(_876, _2190, _2238);
    float _2246 = fma(_882, _2190, _2240);
    float _2248 = _2242 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2250 = _2242 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2252 = _2234 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2254 = fma(_882, _2114, _2218);
    float _2256 = _2226 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2258 = _2234 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2260 = fma(_2156, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2248);
    float _2262 = _2242 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2264 = exp2(_2256);
    float _2266 = _2234 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2268 = fma(_2156, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2250);
    float _2270 = fma(_2156, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2262);
    float _2272 = fma(_2222, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2252);
    float _2274 = fma(_2222, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2266);
    float _2276 = fma(_2222, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2258);
    float _2278 = _2244 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2280 = _2244 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2282 = _2244 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2284 = _1387 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2286 = fma(_2220, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2278);
    float _2288 = fma(_2220, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2280);
    float _2290 = fma(_2220, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2282);
    float _2292 = fma(_2254, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2272);
    float _2294 = fma(_2264, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2296 = precise::clamp(_2294, 0.0, 1.0);
    float _2298 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2284);
    float _2300 = fma(_2254, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2274);
    float _2302 = fma(_2254, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2276);
    float _2304 = fma(_2246, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2286);
    float _2306 = fma(_2246, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2288);
    float _2308 = fma(_2246, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2290);
    float _2310 = fma(_2296, -2.0, 3.0);
    float _2312 = _2296 * _2296;
    float _2314 = fma(_882, _2130, _2236);
    float _2316 = fma(_1403, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2298);
    out.m_89.x = _2292;
    out.m_89.y = _2300;
    out.m_89.z = _2302;
    float _2318 = _2312 * _2310;
    float _2320 = fma(_2314, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2260);
    bool _2322 = _914 <= 8000.0;
    bool _2324 = isnan(_914);
    bool _2326 = _2322 || _2324;
    bool _2328 = isnan(8000.0);
    bool _2330 = _2326 || _2328;
    float _2332 = float(_2330);
    float _2334 = fma(_1415, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2316);
    float _2336 = -_2318;
    float _2338 = _2336 + 1.0;
    float _2340 = in.m_81.y;
    float _2342 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _2344 = _2334 + _2342;
    float _2346 = fma(_2314, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2270);
    float _2348 = in.m_81.z;
    float _2350 = fma(_2314, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2268);
    float _2352 = fma(_2338, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2318);
    float _2354 = _1433 + _2344;
    float _2356 = in.m_81.w;
    float _2358 = _2332 * _2352;
    float _2360 = _2352;
    float _2362 = _2344;
    if (!_1423)
    {
        _2360 = 1.0;
    }
    float _2364 = _2360;
    float _2366 = _2354 * 0.5;
    float _2368 = _2364;
    if (_1423)
    {
        bool _2370 = _1537 >= _1499;
        bool _2372 = isnan(_1537);
        bool _2374 = _2370 || _2372;
        bool _2376 = isnan(_1499);
        bool _2378 = _2374 || _2376;
        float _2380 = float(_2378);
        _2368 = _2380;
    }
    float _2382 = _2368;
    float _2384 = _2358 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.gl_Position.x = _1471;
    out.gl_Position.y = _1475;
    out.gl_Position.z = _2344;
    out.gl_Position.w = _1433;
    float _2386 = _2154 * _1539;
    float _2388 = -_2154;
    float _2390 = _2388 + 1.0;
    float _2392 = _1892 * _2384;
    float _2394 = precise::clamp(_2392, 0.0, 1.0);
    float _2396 = _2382 * _1622;
    out.m_91.x = _2306;
    out.m_91.y = _2304;
    out.m_91.z = _2308;
    float _2398 = _1550 * _2390;
    bool _2400 = _1644 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2402 = isnan(_1644);
    bool _2404 = _2400 || _2402;
    bool _2406 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2408 = _2404 || _2406;
    out.m_93.z = _2366;
    out.m_93.w = _1433;
    out.m_95.x = _2150;
    float _2410 = -_2394;
    float _2412 = fma(_2410, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2414 = _1550 * _2386;
    float _2416 = -_2396;
    float _2418 = fma(_2416, _2412, 1.0);
    float _2420 = precise::clamp(_2418, 0.0, 1.0);
    out.m_95.y = _2340;
    float _2422 = _2396;
    float _2424 = _2420;
    float _2426 = _2386;
    if (!_2408)
    {
        _2422 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2428 = _2422;
    float _2430 = _2420 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_95.z = _2348;
    float _2432 = _2428;
    float _2434 = _2428;
    if (!_2408)
    {
        _1453 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2436 = _1453;
    float _2438 = _2436;
    float _2440 = _2436;
    if (!_2408)
    {
        _2362 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2442 = _2362;
    out.m_95.w = _2356;
    float _2444 = _2442;
    float _2446 = _2442;
    if (!_2408)
    {
        _1483 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2448 = _1483;
    float _2450 = _2448;
    float _2452 = _2448;
    if (!_2408)
    {
        _2424 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2454 = _2424;
    out.m_97.x = _2430;
    out.m_99.x = _2320;
    out.m_99.y = _2346;
    out.m_99.z = _2350;
    float _2456 = _1864 * _2386;
    float _2458 = fma(_1860, _2414, _1544);
    float _2460 = fma(_1862, _2414, _1546);
    float _2462 = _2454;
    float _2464 = _2454;
    if (!_2408)
    {
        _2426 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2466 = _2426;
    float _2468 = fma(_1550, _2456, _1548);
    out.m_101.x = _2458;
    out.m_101.y = _2460;
    out.m_101.z = _2468;
    out.m_101.w = _2398;
    bool _2470 = !_2408;
    float _2472 = _2466;
    float _2474 = _2466;
    if (!_2470)
    {
        bool _2476 = _1644 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2478 = isnan(_1644);
        bool _2480 = _2476 || _2478;
        bool _2482 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2484 = _2480 || _2482;
        if (!_2484)
        {
            float _2486 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2488 = _1644 + _2486;
            float _2490 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2492 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2490;
            float _2494 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2496 = _2494 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2498 = 1.0 / _2492;
            float _2500 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2502 = _2500 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2504 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2506 = _2504 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2508 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2510 = _2508 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2512 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2514 = _2512 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2516 = _2488 * _2498;
            float _2518 = precise::clamp(_2516, 0.0, 1.0);
            float _2520 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2522 = _2520 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2524 = fma(_2518, _2496, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2526 = fma(_2518, _2522, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2528 = fma(_2518, _2502, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2530 = fma(_2518, _2506, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2532 = fma(_2518, _2510, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2534 = fma(_2518, _2514, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2474 = _2528;
            _2452 = _2532;
            _2434 = _2524;
            _2446 = _2530;
            _2440 = _2526;
            _2464 = _2534;
            _2536 = true;
        }
        else
        {
            bool _2538 = _1644 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2540 = isnan(_1644);
            bool _2542 = _2538 || _2540;
            bool _2544 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2546 = _2542 || _2544;
            if (!_2546)
            {
                _2432 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2548 = _2432;
            _2434 = _2548;
            if (!_2546)
            {
                _2472 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2550 = _2472;
            _2474 = _2550;
            if (!_2546)
            {
                _2438 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2552 = _2438;
            _2440 = _2552;
            if (!_2546)
            {
                _2444 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2554 = _2444;
            _2446 = _2554;
            if (!_2546)
            {
                _2450 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2556 = _2450;
            _2452 = _2556;
            if (!_2546)
            {
                _2462 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2558 = _2462;
            bool _2560 = !_2546;
            _2464 = _2558;
            if (!_2560)
            {
                bool _2562 = _1644 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2564 = isnan(_1644);
                bool _2566 = _2562 || _2564;
                bool _2568 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2570 = _2566 || _2568;
                if (!_2570)
                {
                    float _2572 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2574 = _1644 + _2572;
                    float _2576 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2578 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2576;
                    float _2580 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2582 = _2580 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2584 = 1.0 / _2578;
                    float _2586 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2588 = _2586 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2590 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2592 = _2590 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2594 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2596 = _2594 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2598 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2600 = _2598 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2602 = _2574 * _2584;
                    float _2604 = precise::clamp(_2602, 0.0, 1.0);
                    float _2606 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2608 = _2606 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2610 = fma(_2604, _2582, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2612 = fma(_2604, _2608, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2614 = fma(_2604, _2588, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2616 = fma(_2604, _2592, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2618 = fma(_2604, _2596, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2620 = fma(_2604, _2600, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2474 = _2614;
                    _2452 = _2618;
                    _2434 = _2610;
                    _2446 = _2616;
                    _2440 = _2612;
                    _2464 = _2620;
                    _2536 = true;
                }
                else
                {
                    _2474 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2452 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2434 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2446 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2440 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2464 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2536 = false;
    float _2622 = _2474;
    float _2624 = _2452;
    float _2626 = _2434;
    float _2628 = _2446;
    float _2630 = _2440;
    float _2632 = _2464;
    float _2634 = fma(_2346, -0.5, 0.5);
    float _2636 = precise::clamp(_2634, 0.0, 1.0);
    float _2638 = -_2622;
    float _2640 = _2638 + _2624;
    float _2642 = -_2626;
    float _2644 = _2642 + _2628;
    float _2646 = -_2630;
    float _2648 = _2646 + _2632;
    bool _2650 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2652 = fma(_2636, _2640, _2622);
    float _2654 = fma(_2636, _2644, _2626);
    float _2656 = fma(_2636, _2648, _2630);
    float _2658 = _2652 * 0.586610972881317138671875;
    out.m_59.x = 1.0;
    float _2660 = fma(_2654, 0.298911988735198974609375, _2658);
    out.m_97.w = (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2662 = fma(_2656, 0.114477999508380889892578125, _2660);
    out.m_103.x = 0.0;
    float _2664 = -_2662;
    float _2666 = _2654 + _2664;
    float _2668 = -_2662;
    float _2670 = _2652 + _2668;
    float _2672 = -_2662;
    float _2674 = _2656 + _2672;
    float _2676 = fma(_2666, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2662);
    float _2678 = fma(_2670, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2662);
    float _2680 = fma(_2674, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2662);
    out.m_105.x = _2676;
    out.m_105.y = _2678;
    out.m_105.z = _2680;
    if (!_2650)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2682 = -_1327;
    float _2684 = _2682 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2686 = -_1329;
    float _2688 = _2686 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2690 = -_1331;
    float _2692 = _2690 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2694 = _2684 * _2684;
    float _2696 = fma(_2688, _2688, _2694);
    float _2698 = fma(_2692, _2692, _2696);
    float _2700 = sqrt(_2698);
    float _2702 = rsqrt(_2698);
    float _2704 = -_2700;
    float _2706 = _2704 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2708 = _2706 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2710 = precise::clamp(_2708, 0.0, 1.0);
    float _2712 = _2688 * _2702;
    float _2714 = _2684 * _2702;
    float _2716 = abs(_2710);
    float _2718 = log2(_2716);
    float _2720 = _2692 * _2702;
    float _2722 = _2712 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2724 = _2346 * _2714;
    float _2726 = -_2714;
    float _2728 = -_2722;
    float _2730 = fma(_2726, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2728);
    float _2732 = fma(_2320, _2712, _2724);
    float _2734 = -_2720;
    float _2736 = fma(_2734, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2730);
    float _2738 = fma(_2350, _2720, _2732);
    float _2740 = precise::clamp(_2738, 0.0, 1.0);
    float _2742 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2744 = _2736 + _2742;
    float _2746 = _2718 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2748 = _2744 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2750 = precise::clamp(_2748, 0.0, 1.0);
    float _2752 = exp2(_2746);
    float _2754 = _2752 * _2750;
    float _2756 = _2740 * _2754;
    float _2758 = _2756 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2760 = _2756 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2762 = _2756 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_103.x = _2758;
    out.m_103.y = _2760;
    out.m_103.z = _2762;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2536 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _119 = in.m_56.w;
    float _121 = trunc(_119);
    int _124 = int(_121);
    bool _128 = _124 >= 1;
    float _130 = 0.0;
    float _132 = as_type<float>(_124);
    if (!_128)
    {
        _130 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _134 = _130;
    if (!_128)
    {
        out.m_59.x = 0.0;
    }
    int _136 = 0;
    if (!_128)
    {
        float _138 = _134 * 5.0;
        _136 = as_type<int>(_138);
    }
    int _140 = _136;
    int _142 = _140;
    if (!_128)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2820 = as_type<float>(_140);
        out.gl_Position.z = _2820;
    }
    if (!_128)
    {
        return out;
    }
    float _144 = in.m_61.w;
    bool _146 = _144 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _148 = isnan(_144);
    bool _150 = _146 || _148;
    bool _152 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _154 = _150 || _152;
    float _156 = -_144;
    float _158 = _156 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _160 = _158;
    if (_154)
    {
        float _162 = float(_124);
        _132 = _162;
    }
    float _164 = _132;
    bool _166 = _158 >= _164;
    bool _168 = !_154;
    bool _170 = _166 || _168;
    float _172 = _164;
    if (_170)
    {
        _172 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _174 = _172;
    if (_170)
    {
        out.m_59.x = 0.0;
    }
    if (_170)
    {
        float _176 = _174 * 5.0;
        _142 = as_type<int>(_176);
    }
    int _178 = _142;
    if (_170)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2890 = as_type<float>(_178);
        out.gl_Position.z = _2890;
    }
    if (_170)
    {
        return out;
    }
    float _180 = in.m_63.w;
    float _182 = _158 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _184 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _186 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _188 = _184 || _186;
    bool _190 = isnan(1.0);
    bool _192 = _188 || _190;
    float _194 = in.m_61.x;
    float _196 = in.m_61.y;
    float _198 = in.m_61.z;
    float _200 = in.m_56.x;
    float _202 = in.m_56.y;
    float _204 = in.m_56.z;
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
    float _282 = _256 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _284 = _256 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _286 = fma(_280, _196, _282);
    float _288 = _256 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _290 = fma(_280, _194, _284);
    float _292 = fma(_286, _180, _202);
    float _294 = fma(_280, _198, _288);
    float _296 = fma(_290, _180, _200);
    float _298 = _292 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _300 = fma(_294, _180, _204);
    float _302 = fma(_296, (*spvDescriptorSet0.vp_c10)._m0[4].x, _298);
    float _304 = _292 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _306 = fma(_300, (*spvDescriptorSet0.vp_c10)._m0[4].z, _302);
    float _308 = fma(_296, (*spvDescriptorSet0.vp_c10)._m0[6].x, _304);
    float _310 = _306 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _312 = fma(_300, (*spvDescriptorSet0.vp_c10)._m0[6].z, _308);
    float _314 = fma(_310, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _316 = _312 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _318 = floor(_314);
    float _320 = fma(_316, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _322 = floor(_320);
    float _324 = -_318;
    float _326 = _314 + _324;
    float _328 = -_322;
    float _330 = _320 + _328;
    float2 _3139 = float2(_326, _330);
    float _332 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3139, float2(0.0), isnan(_3139)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3139, float2(0.0), isnan(_3139)), level(0.0)).x;
    float _334 = in.m_65.z;
    float _336 = _292 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _338 = in.m_65.x;
    float _340 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _342 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _344 = _342 != 0;
    float _346 = in.m_65.y;
    float _348 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _352 = 1.0 + _350;
    float _354 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _356 = _334 * 2.0;
    float _358 = 1.0 / _352;
    float _360 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.300000011920928955078125;
    float _362 = _338 * 2.0;
    float _364 = _338 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _366 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[88].z, _354);
    float _368 = _346 + _334;
    float _370 = floor(_356);
    float _372 = _346 * 2.0;
    float _374 = -_340;
    float _376 = fma(_364, 2.0, _374);
    float _378 = _346 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _380 = _368 + (-1.0);
    float _382 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[87].z, _366);
    float _384 = -_158;
    float _386 = fma(_384, (*spvDescriptorSet0.vp_c9)._m0[76].x, _376);
    float _388 = fma(_378, -2.0, _348);
    float _390 = floor(_362);
    float _392 = _346 + _338;
    float _394 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[76].y, _388);
    float _396 = _392 + (-1.0);
    float _398 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _400 = _380;
    int _402 = 2;
    int _404 = as_type<int>(_394);
    float _406 = _346;
    if (_344)
    {
        _400 = _338;
    }
    float _408 = _400;
    float _410 = floor(_372);
    bool _412 = _370 > 0.0;
    float _414 = fma(_396, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _416 = _370 >= 0.0;
    bool _418 = isnan(_370);
    bool _420 = _416 || _418;
    bool _422 = isnan(0.0);
    bool _424 = _420 || _422;
    float _426 = _408;
    float _428 = (*spvDescriptorSet0.vp_c9)._m0[87].x;
    if (!_344)
    {
        _426 = _334;
    }
    float _430 = _426;
    bool _432 = _390 > 0.0;
    float _434 = _430 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _436 = _390 >= 0.0;
    bool _438 = isnan(_390);
    bool _440 = _436 || _438;
    bool _442 = isnan(0.0);
    bool _444 = _440 || _442;
    float _446 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _448 = _434;
    if (!_344)
    {
        _428 = _346;
    }
    float _450 = _428;
    float _452 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _454 = _450;
    if (_344)
    {
        _454 = _338;
    }
    float _456 = _454;
    float _458 = -_446;
    float _460 = fma(_434, 2.0, _458);
    bool _462 = _410 > 0.0;
    float _464 = fma(_456, (*spvDescriptorSet0.vp_c9)._m0[83].z, _452);
    bool _466 = _410 >= 0.0;
    bool _468 = isnan(_410);
    bool _470 = _466 || _468;
    bool _472 = isnan(0.0);
    bool _474 = _470 || _472;
    float _476 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _478 = _456 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _480 = _478;
    if (!_344)
    {
        _448 = _334;
    }
    float _482 = _448;
    float _484 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _486 = log2(_484);
    float _488 = _482;
    if (_344)
    {
        _488 = _346;
    }
    float _490 = _488;
    float _492 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _494 = _424 ? 0 : 1;
    float _496 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[82].z, _464);
    float _498 = -_158;
    float _500 = fma(_498, (*spvDescriptorSet0.vp_c9)._m0[86].x, _460);
    float _502 = fma(_490, (*spvDescriptorSet0.vp_c9)._m0[83].w, _476);
    float _504 = _490;
    if (_344)
    {
        _504 = _346;
    }
    float _506 = _504;
    float _508 = -_492;
    float _510 = fma(_478, 2.0, _508);
    float _512 = _506;
    if (!_344)
    {
        _512 = _338;
    }
    float _514 = _512;
    float _516 = -_158;
    float _518 = fma(_516, (*spvDescriptorSet0.vp_c9)._m0[81].x, _510);
    if (!_344)
    {
        _480 = _334;
    }
    float _520 = _480;
    float _522 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _524 = _520;
    if (_344)
    {
        _524 = _346;
    }
    float _526 = _524;
    float _528 = _514 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _530 = _486 * _158;
    int _532 = ~_494;
    int _534 = _532 + 1;
    int _536 = _534 + 1;
    float _538 = fma(_528, -2.0, _522);
    float _540 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _542 = _526 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _544 = _536;
    if (!_412)
    {
        int _546 = ~_494;
        int _548 = _546 + 1;
        _544 = _548;
    }
    int _550 = _544;
    float _552 = exp2(_530);
    float _554 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _556 = fma(_542, -2.0, _540);
    int _558 = _444 ? 0 : 1;
    float _560 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[86].y, _538);
    float _562 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[78].z, _554);
    int _564 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _566 = _564 != 0;
    int _568 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _570 = _568 != 0;
    int _572 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _574 = _572 != 0;
    float _576 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _578 = ~_558;
    int _580 = _578 + 1;
    int _582 = _580 + 1;
    float _584 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[77].z, _562);
    int _586 = _582;
    if (!_432)
    {
        int _588 = ~_558;
        int _590 = _588 + 1;
        _586 = _590;
    }
    int _592 = _586;
    float _594 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    bool _596 = !_566;
    int _598 = _596 ? 0 : 1;
    float _600 = in.m_67.x;
    float _602 = in.m_67.y;
    float _604 = in.m_67.z;
    float _606 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[78].w, _576);
    float _608 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[88].w, _594);
    int _610 = abs(_598);
    float _612 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[82].w, _502);
    float _614 = float(_550);
    float _616 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[81].y, _556);
    float _618 = float(_610);
    float _620 = -_552;
    float _622 = _620 + 1.0;
    bool _624 = !_570;
    int _626 = _624 ? 0 : 1;
    float _628 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[77].w, _606);
    bool _630 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _632 = isnan(1.0);
    bool _634 = _630 || _632;
    bool _636 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _638 = _634 || _636;
    float _640 = _618 * _614;
    int _642 = abs(_626);
    float _644 = _338 + (-0.5);
    bool _646 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _648 = isnan(0.0);
    bool _650 = _646 || _648;
    bool _652 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _654 = _650 || _652;
    float _656 = _640 * (-2.0);
    float _658 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[87].w, _608);
    float _660 = float(_592);
    float _662 = float(_642);
    float _664 = _654 ? _622 : 0.0;
    float _666 = fma(_656, _600, _600);
    bool _668 = !_574;
    int _670 = _668 ? 0 : 1;
    float _672 = _662 * _660;
    int _674 = _474 ? 0 : 1;
    if (_638)
    {
        float _676 = _664 * _358;
        _160 = _676;
    }
    float _678 = _160;
    float _680 = fma(_414, _656, _414);
    float _682 = fma(_644, (*spvDescriptorSet0.vp_c9)._m0[196].x, _666);
    int _684 = abs(_670);
    float _686 = _672 * (-2.0);
    int _688 = ~_674;
    int _690 = _688 + 1;
    int _692 = _690 + 1;
    float _694 = fma(_680, _678, _682);
    int _696 = _692;
    if (!_462)
    {
        int _698 = ~_674;
        int _700 = _698 + 1;
        _696 = _700;
    }
    int _702 = _696;
    float _704 = _346 + (-0.5);
    float _706 = fma(_686, _602, _602);
    float _708 = float(_684);
    float _710 = _694 * 0.15915493667125701904296875;
    float _712 = float(_702);
    float _714 = fma(_296, (*spvDescriptorSet0.vp_c10)._m0[5].x, _336);
    float _716 = fma(_704, (*spvDescriptorSet0.vp_c9)._m0[196].y, _706);
    float _718 = _338 + _334;
    float _720 = _708 * _712;
    float _722 = fma(_398, _686, _398);
    float _724 = _718 + (-1.0);
    float _726 = fma(_300, (*spvDescriptorSet0.vp_c10)._m0[5].z, _714);
    float _728 = _720 * (-2.0);
    float _730 = fma(_722, _678, _716);
    float _732 = fma(_724, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _734 = _334 + (-0.5);
    float _736 = fma(_728, _604, _604);
    float _738 = _726 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _740 = in.m_63.x;
    float _742 = in.m_63.y;
    float _744 = in.m_63.z;
    float _746 = fma(_732, _728, _732);
    float _748 = fma(_734, (*spvDescriptorSet0.vp_c9)._m0[196].z, _736);
    float _750 = _738 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _752 = in.m_69.x;
    float _754 = in.m_69.y;
    float _756 = in.m_69.z;
    float _758 = _710 * 6.283185482025146484375;
    float _760 = sin(_758);
    float _762 = fma(_746, _678, _748);
    float _764 = fma(_310, (*spvDescriptorSet0.vp_c8)._m0[11].x, _750);
    float _766 = _738 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _768 = _730 * 0.15915493667125701904296875;
    float _770 = _762 * 0.15915493667125701904296875;
    float _772 = fma(_316, (*spvDescriptorSet0.vp_c8)._m0[11].z, _764);
    float _774 = _710 * 6.283185482025146484375;
    float _776 = cos(_774);
    float _778 = _772 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _780 = fma(_310, (*spvDescriptorSet0.vp_c8)._m0[10].x, _766);
    float _782 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _784 = fma(_316, (*spvDescriptorSet0.vp_c8)._m0[10].z, _780);
    float _786 = 1.0 / _778;
    float _788 = _738 + _782;
    float _790 = _740 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _792 = _784 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _794 = _744 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _796 = _742 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _798 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _752);
    float _800 = _768 * 6.283185482025146484375;
    float _802 = sin(_800);
    float _804 = _790 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _806 = _792 + _778;
    float _808 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _756);
    float _810 = _794 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _812 = _798 * _804;
    float _814 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _754);
    float _816 = _768 * 6.283185482025146484375;
    float _818 = cos(_816);
    float _820 = _796 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _822 = _806 * _786;
    float _824 = _822 * 0.5;
    float _826 = _808 * _810;
    float _828 = _814 * _820;
    float _830 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _832 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[30].w, _830);
    float _834 = _770 * 6.283185482025146484375;
    float _836 = cos(_834);
    float _838 = _776 * _802;
    float _840 = _760 * _802;
    float _842 = _788 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _844 = fma(_310, (*spvDescriptorSet0.vp_c15)._m0[126].x, _842);
    float _846 = _770 * 6.283185482025146484375;
    float _848 = sin(_846);
    float _850 = _760 * _818;
    float _852 = _776 * _818;
    float _854 = fma(_316, (*spvDescriptorSet0.vp_c15)._m0[126].z, _844);
    float _856 = _854 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _858 = _776 * _836;
    float _860 = _760 * _836;
    float _862 = 1.0 / _832;
    float _864 = _818 * _836;
    float _866 = _802 * _836;
    float _868 = _860 * _828;
    float _870 = -_838;
    float _872 = fma(_848, _850, _870);
    float _874 = -_850;
    float _876 = fma(_848, _838, _874);
    float _878 = fma(_848, _852, _840);
    float _880 = _858 * _828;
    float _882 = fma(_848, _840, _852);
    float _884 = -_828;
    float _886 = _848 * _884;
    float _888 = (*spvDescriptorSet0.vp_c10)._m0[2].x * (-0.550000011920928955078125);
    float _890 = fma(_878, _812, _880);
    float _892 = trunc(_856);
    int _894 = int(_892);
    float _896 = fma(_864, _812, _886);
    float _898 = fma(_872, _812, _868);
    float _900 = fma(_876, _826, _890);
    float _902 = _788 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _904 = fma(_866, _826, _896);
    float _906 = fma(_882, _826, _898);
    float _908 = _900 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _910 = fma(_310, (*spvDescriptorSet0.vp_c15)._m0[127].x, _902);
    float _912 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _914 = _862 * _912;
    float _916 = (*spvDescriptorSet0.vp_c10)._m0[2].x * (-0.60000002384185791015625);
    float _918 = fma(_904, (*spvDescriptorSet0.vp_c10)._m0[9].x, _908);
    float _920 = fma(_316, (*spvDescriptorSet0.vp_c15)._m0[127].z, _910);
    float _922 = _900 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    bool _924 = _914 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _926 = fma(_906, (*spvDescriptorSet0.vp_c10)._m0[9].z, _918);
    bool _928 = _914 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _930 = (*spvDescriptorSet0.vp_c10)._m0[2].x * (-0.2800000011920928955078125);
    float _932 = _900 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _934 = _738 + _926;
    float _936 = _920 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    bool _938 = !_924;
    int _940 = _938 ? 0 : 1;
    float _942 = fma(_904, (*spvDescriptorSet0.vp_c10)._m0[8].x, _922);
    float _944 = fma(_934, 0.4000000059604644775390625, _930);
    float _946 = fma(_934, 0.85000002384185791015625, _916);
    float _948 = fma(_934, 0.75, _888);
    float _950 = trunc(_936);
    int _952 = int(_950);
    float _954 = _944 * 0.15915493667125701904296875;
    float _956 = (*spvDescriptorSet0.vp_c10)._m0[2].x * (-0.310000002384185791015625);
    float _958 = _934;
    if (!_924)
    {
        _402 = 1;
    }
    int _960 = _402;
    float _962 = _946 * 0.15915493667125701904296875;
    int _964 = _960;
    if (!_928)
    {
        _964 = _940;
    }
    int _966 = _964;
    float _968 = fma(_934, 0.3499999940395355224609375, _956);
    float _970 = _948 * 0.15915493667125701904296875;
    float _972 = _954 * 6.283185482025146484375;
    float _974 = sin(_972);
    int _976 = _966 << 6;
    float _978 = _968 * 0.15915493667125701904296875;
    float _980 = fma(_904, (*spvDescriptorSet0.vp_c10)._m0[10].x, _932);
    int _982 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _984 = _894 + _982;
    int _986 = _984 + 1;
    int _988 = _976 + 96;
    uint _991 = uint(int(uint(_988) >> uint(2)));
    uint _993 = uint(int(uint(int(_991)) >> uint(2)));
    int _995 = int(_991) & 3;
    float _997 = (*spvDescriptorSet0.vp_c15)._m0[int(_993)][_995];
    int _999 = int(_991) + 1;
    uint _1001 = uint(int(uint(_999) >> uint(2)));
    int _1003 = _999 & 3;
    float _1005 = (*spvDescriptorSet0.vp_c15)._m0[int(_1001)][_1003];
    float _1007 = fma(_906, (*spvDescriptorSet0.vp_c10)._m0[8].z, _942);
    float _1009 = fma(_906, (*spvDescriptorSet0.vp_c10)._m0[10].z, _980);
    float _1011 = _962 * 6.283185482025146484375;
    float _1013 = sin(_1011);
    float _1015 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.17000000178813934326171875;
    bool _1017 = _986 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1019 = _316 + _1009;
    float _1021 = _310 + _1007;
    int _1023 = _976 + 104;
    uint _1025 = uint(int(uint(_1023) >> uint(2)));
    uint _1027 = uint(int(uint(int(_1025)) >> uint(2)));
    int _1029 = int(_1025) & 3;
    float _1031 = (*spvDescriptorSet0.vp_c15)._m0[int(_1027)][_1029];
    int _1033 = int(_1025) + 1;
    uint _1035 = uint(int(uint(_1033) >> uint(2)));
    int _1037 = _1033 & 3;
    float _1039 = (*spvDescriptorSet0.vp_c15)._m0[int(_1035)][_1037];
    float _1041 = fma(_1019, 0.550000011920928955078125, _1015);
    float _1043 = _978 * 6.283185482025146484375;
    float _1045 = sin(_1043);
    float _1047 = fma(_1021, 0.89999997615814208984375, _360);
    float _1049 = _1041 * 0.15915493667125701904296875;
    int _1051 = _976 + 64;
    uint _1053 = uint(int(uint(_1051) >> uint(2)));
    uint _1055 = uint(int(uint(int(_1053)) >> uint(2)));
    int _1057 = int(_1053) & 3;
    float _1059 = (*spvDescriptorSet0.vp_c15)._m0[int(_1055)][_1057];
    int _1061 = int(_1053) + 1;
    uint _1063 = uint(int(uint(_1061) >> uint(2)));
    int _1065 = _1061 & 3;
    float _1067 = (*spvDescriptorSet0.vp_c15)._m0[int(_1063)][_1065];
    float _1069 = _1047 * 0.15915493667125701904296875;
    float _1071 = _970 * 6.283185482025146484375;
    float _1073 = sin(_1071);
    float _1075 = _974 + _1013;
    int _1077 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1079 = _952 + _1077;
    int _1081 = _1079 + 1;
    int _1083 = _976 + 48;
    uint _1085 = uint(int(uint(_1083) >> uint(2)));
    uint _1087 = uint(int(uint(int(_1085)) >> uint(2)));
    int _1089 = int(_1085) & 3;
    float _1091 = (*spvDescriptorSet0.vp_c15)._m0[int(_1087)][_1089];
    int _1093 = int(_1085) + 1;
    uint _1095 = uint(int(uint(_1093) >> uint(2)));
    int _1097 = _1093 & 3;
    float _1099 = (*spvDescriptorSet0.vp_c15)._m0[int(_1095)][_1097];
    int _1101 = _986 | _1081;
    bool _1103 = _1101 < 0;
    bool _1105 = _1103 || _1017;
    int _1107 = _976 + 72;
    uint _1109 = uint(int(uint(_1107) >> uint(2)));
    uint _1111 = uint(int(uint(int(_1109)) >> uint(2)));
    int _1113 = int(_1109) & 3;
    float _1115 = (*spvDescriptorSet0.vp_c15)._m0[int(_1111)][_1113];
    int _1117 = int(_1109) + 1;
    uint _1119 = uint(int(uint(_1117) >> uint(2)));
    int _1121 = _1117 & 3;
    float _1123 = (*spvDescriptorSet0.vp_c15)._m0[int(_1119)][_1121];
    bool _1125 = _1081 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1127 = _1125 || _1105;
    float _1129 = _1045 + _1073;
    float _1131 = fma(_1075, 0.00999999977648258209228515625, _1021);
    float _1133 = _1049 * 6.283185482025146484375;
    float _1135 = sin(_1133);
    float _1137 = fma(_1129, 0.00999999977648258209228515625, _1019);
    int _1139 = _976 + 56;
    uint _1141 = uint(int(uint(_1139) >> uint(2)));
    uint _1143 = uint(int(uint(int(_1141)) >> uint(2)));
    int _1145 = int(_1141) & 3;
    float _1147 = (*spvDescriptorSet0.vp_c15)._m0[int(_1143)][_1145];
    int _1149 = int(_1141) + 1;
    uint _1151 = uint(int(uint(_1149) >> uint(2)));
    int _1153 = _1149 & 3;
    float _1155 = (*spvDescriptorSet0.vp_c15)._m0[int(_1151)][_1153];
    float _1157 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1159 = _1131 + _1157;
    float _1161 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1163 = _1137 + _1161;
    int _1165 = _986;
    float _1167 = as_type<float>(_1081);
    float _1169 = _1069;
    if (!_1127)
    {
        int _1171 = _1081 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1173 = _1171 + _986;
        _1165 = _1173;
    }
    int _1175 = _1165;
    float _1177 = _1163 * _1163;
    int _1179 = _976 + 80;
    uint _1181 = uint(int(uint(_1179) >> uint(2)));
    uint _1183 = uint(int(uint(int(_1181)) >> uint(2)));
    int _1185 = int(_1181) & 3;
    float _1187 = (*spvDescriptorSet0.vp_c15)._m0[int(_1183)][_1185];
    int _1189 = int(_1181) + 1;
    uint _1191 = uint(int(uint(_1189) >> uint(2)));
    int _1193 = _1189 & 3;
    float _1195 = (*spvDescriptorSet0.vp_c15)._m0[int(_1191)][_1193];
    float _1197 = _788 * _1005;
    if (!_1127)
    {
        float _1199 = floor(_856);
        _1167 = _1199;
    }
    float _1201 = _1167;
    float _1203 = fma(_1159, _1159, _1177);
    float _1205 = fma(_310, _997, _1197);
    float _1207 = fma(_316, _1031, _1205);
    float _1209 = sqrt(_1203);
    float _1211 = _1207 + _1039;
    float _1213 = _1135 * 0.20999999344348907470703125;
    float _1215 = _788 * _1067;
    float _1217 = _1069 * 6.283185482025146484375;
    float _1219 = sin(_1217);
    float _1221 = fma(_310, _1059, _1215);
    int _1223 = as_type<int>(_1059);
    float _1225 = _1213;
    float _1227 = _1135;
    if (!_1127)
    {
        int _1229 = _1175 << 2;
        _1223 = _1229;
    }
    int _1231 = _1223;
    float _1233 = _788 * _1099;
    int _1235 = _1231;
    int _1237 = as_type<int>(_1233);
    float _1239 = _1195;
    if (!_1127)
    {
        int _1241 = 12 & _1231;
        _1235 = _1241;
    }
    int _1243 = _1235;
    float _1245 = 1.0 / _1211;
    bool _1247 = _1209 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1249 = fma(_310, _1091, _1233);
    int _1251 = as_type<int>(_1249);
    if (!_1127)
    {
        uint _1253 = uint(int(uint(_1175) >> uint(2)));
        _1237 = int(_1253);
    }
    int _1255 = _1237;
    float _1257 = fma(_316, _1115, _1221);
    float _1259 = fma(_1219, 0.300000011920928955078125, _1213);
    float _1261 = _1257 + _1123;
    float _1263 = _934 + _1259;
    float _1265 = fma(_316, _1147, _1249);
    float _1267 = _1259;
    if (!_1127)
    {
        int _1269 = _1255 << 4;
        int _1271 = _1269 + _1243;
        _1251 = _1271;
    }
    int _1273 = _1251;
    if (!_1247)
    {
        _1225 = _1131;
    }
    float _1275 = _1225;
    float _1277 = _1265 + _1155;
    float _1279 = _1275;
    if (!_1247)
    {
        _958 = _1137;
    }
    float _1281 = _958;
    float _1283 = _1281;
    if (!_1247)
    {
        _1267 = _1263;
    }
    float _1285 = _1267;
    bool _1287 = !_1247;
    float _1289 = _1285;
    if (!_1287)
    {
        float _1291 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1293 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1295 = _1209 + _1293;
        float _1297 = _1263 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1299 = rsqrt(_1203);
        float _1301 = _1295 * _1291;
        float _1303 = _1301 * 0.15915493667125701904296875;
        float _1305 = _1303 * 6.283185482025146484375;
        float _1307 = cos(_1305);
        float _1309 = _1303 * 6.283185482025146484375;
        float _1311 = sin(_1309);
        float _1313 = _1307 + (-1.0);
        float _1315 = _1313 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1317 = fma(_1311, _1297, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1319 = fma(_1263, _1307, _1315);
        float _1321 = _1299 * _1317;
        float _1323 = fma(_1159, _1321, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1325 = fma(_1163, _1321, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1289 = _1319;
        _1279 = _1323;
        _1283 = _1325;
    }
    float _1327 = _1289;
    float _1329 = _1279;
    float _1331 = _1283;
    int _1333 = _976 + 88;
    uint _1335 = uint(int(uint(_1333) >> uint(2)));
    uint _1337 = uint(int(uint(int(_1335)) >> uint(2)));
    int _1339 = int(_1335) & 3;
    float _1341 = (*spvDescriptorSet0.vp_c15)._m0[int(_1337)][_1339];
    int _1343 = int(_1335) + 1;
    uint _1345 = uint(int(uint(_1343) >> uint(2)));
    int _1347 = _1343 & 3;
    float _1349 = (*spvDescriptorSet0.vp_c15)._m0[int(_1345)][_1347];
    float _1351 = _1327 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1353 = _1327 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1355 = _1327 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1357 = _1277 * _1245;
    float _1359 = fma(_1329, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1351);
    float _1361 = fma(_1329, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1353);
    float _1363 = fma(_1329, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1355);
    float _1365 = _1209;
    if (!_1127)
    {
        int _1367 = _1273 + 400;
        uint _1369 = uint(int(uint(_1367) >> uint(2)));
        uint _1371 = uint(int(uint(int(_1369)) >> uint(2)));
        int _1373 = int(_1369) & 3;
        float _1375 = (*spvDescriptorSet0.vp_c15)._m0[int(_1371)][_1373];
        _1365 = _1375;
    }
    float _1377 = _1365;
    float _1379 = fma(_1331, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1359);
    float _1381 = fma(_1331, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1361);
    float _1383 = _1327 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1385 = fma(_1331, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1363);
    float _1387 = _1379 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _1389 = _1357 >= 0.0;
    float _1391 = fma(_1329, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1383);
    float _1393 = _1385 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1395 = _1387 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1397 = _1261 * _1245;
    bool _1399 = _1357 <= 1.0;
    bool _1401 = _1399 && _1389;
    float _1403 = _1381 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1405 = fma(_1331, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1391);
    float _1407 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1395);
    bool _1409 = _1397 >= 0.0;
    bool _1411 = _1409 && _1401;
    float _1413 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1415 = _1405 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1417 = fma(_1403, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1407);
    float _1419 = _1403 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    bool _1421 = _1397 <= 1.0;
    bool _1423 = _1421 && _1411;
    float _1425 = _1265;
    float _1427 = _1397;
    if (!_1127)
    {
        float _1429 = floor(_936);
        _1425 = _1429;
    }
    float _1431 = _1425;
    float _1433 = fma(_1415, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1417);
    float _1435 = _788 * _1195;
    float _1437 = -_1419;
    float _1439 = fma(_1437, _1413, 1.0);
    float _1441 = _1387 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1443 = _1387 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1445 = fma(_310, _1187, _1435);
    float _1447 = 1.0 / _1433;
    float _1449 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1441);
    float _1451 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1443);
    float _1453 = _1433;
    if (_1423)
    {
        float _1455 = float(_966);
        _1239 = _1455;
    }
    float _1457 = _1239;
    float _1459 = fma(_1403, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1449);
    float _1461 = fma(_1403, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1451);
    float _1463 = log2(_1439);
    if (!_1127)
    {
        float _1465 = -_1431;
        float _1467 = _936 + _1465;
        _1227 = _1467;
    }
    float _1469 = _1227;
    float _1471 = fma(_1415, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1459);
    float _1473 = fma(_316, _1341, _1445);
    float _1475 = fma(_1415, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1461);
    float _1477 = _1473 + _1349;
    float _1479 = _1435;
    float _1481 = _1349;
    float _1483 = _1475;
    if (_1423)
    {
        float _1485 = rint(_1457);
        float _1487 = precise::max(_1485, 0.0);
        uint _1489 = uint(_1487);
        uint _1491 = clamp(_1489, 0u, 65535u);
        _1479 = as_type<float>(_1491);
    }
    float _1493 = _1479;
    float _1495 = _1471 * _1447;
    float _1497 = _1475 * _1447;
    float _1499 = _1477 * _1245;
    if (!_1127)
    {
        float _1501 = -_1201;
        float _1503 = _856 + _1501;
        _1481 = _1503;
    }
    float _1505 = _1481;
    float _1507 = fma(_1495, 0.5, 0.5);
    float _1509 = _1477;
    float _1511 = _1507;
    if (!_1127)
    {
        float _1513 = rint(_1377);
        float _1515 = precise::max(_1513, 0.0);
        uint _1517 = uint(_1515);
        uint _1519 = clamp(_1517, 0u, 65535u);
        _1509 = as_type<float>(_1519);
    }
    float _1521 = _1509;
    float _1523 = _1463 * 0.693147182464599609375;
    float _1525 = fma(_1497, -0.5, 0.5);
    float _1527 = _1523 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1529 = _1201;
    float _1531 = _1523;
    float _1533 = _1525;
    if (_1423)
    {
        float3 _5102 = float3(_1357, _1397, float(as_type<int>(_1493)));
        float3 _5106 = select(_5102, float3(0.0), isnan(_5102));
        float _1535 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5106.xy, uint(rint(_5106.z)), _1499, level(0.0));
        _1529 = _1535;
    }
    float _1537 = _1529;
    float3 _5116 = float3(_1507, _1525, _1527);
    float _1539 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5116, float3(0.0), isnan(_5116)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5116, float3(0.0), isnan(_5116)), level(0.0)).x;
    float3 _5125 = float3(_1507, _1525, _1527);
    float4 _1542 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5125, float3(0.0), isnan(_5125)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5125, float3(0.0), isnan(_5125)), level(0.0)).xyzw;
    float _1544 = _1542.x;
    float _1546 = _1542.y;
    float _1548 = _1542.z;
    float _1550 = _1542.w;
    float _1552 = _1469;
    if (!_1127)
    {
        float3 _5148 = float3(_1505, _1469, float(as_type<int>(_1521)));
        float3 _5150 = select(_5148, float3(0.0), isnan(_5148));
        float _1554 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5150.xy, uint(rint(_5150.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5150.xy, uint(rint(_5150.z)), level(0.0)).x;
        _1552 = _1554;
    }
    float _1556 = _1552;
    if (_1127)
    {
        _1531 = 1.0;
    }
    float _1558 = _1531;
    float _1560 = _1558;
    if (!_1127)
    {
        int _1562 = _1175 << 4;
        int _1564 = _1562 + 2048;
        uint _1566 = uint(int(uint(_1564) >> uint(2)));
        uint _1568 = uint(int(uint(int(_1566)) >> uint(2)));
        int _1570 = int(_1566) & 3;
        float _1572 = (*spvDescriptorSet0.vp_c15)._m0[int(_1568)][_1570];
        int _1574 = int(_1566) + 1;
        uint _1576 = uint(int(uint(_1574) >> uint(2)));
        int _1578 = _1574 & 3;
        float _1580 = (*spvDescriptorSet0.vp_c15)._m0[int(_1576)][_1578];
        int _1582 = _1564 + 8;
        uint _1584 = uint(int(uint(_1582) >> uint(2)));
        uint _1586 = uint(int(uint(int(_1584)) >> uint(2)));
        int _1588 = int(_1584) & 3;
        float _1590 = (*spvDescriptorSet0.vp_c15)._m0[int(_1586)][_1588];
        int _1592 = int(_1584) + 1;
        uint _1594 = uint(int(uint(_1592) >> uint(2)));
        int _1596 = _1592 & 3;
        float _1598 = (*spvDescriptorSet0.vp_c15)._m0[int(_1594)][_1596];
        float _1600 = _788 * _1580;
        float _1602 = fma(_310, _1572, _1600);
        float _1604 = fma(_316, _1590, _1602);
        float _1606 = _1604 + _1598;
        float _1608 = precise::clamp(_1606, 0.0, 1.0);
        float _1610 = -_1608;
        float _1612 = _1610 + _1556;
        float _1614 = fma(_1612, 500.0, 1.5);
        float _1616 = exp2(_1614);
        float _1618 = 0.0 + _1616;
        float _1620 = precise::clamp(_1618, 0.0, 1.0);
        _1560 = _1620;
    }
    float _1622 = _1560;
    float _1624 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1626 = _1327 + _1624;
    float _1628 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1630 = _1329 + _1628;
    float _1632 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1634 = _1331 + _1632;
    float _1636 = _1626 * _1626;
    float _1638 = fma(_1630, _1630, _1636);
    float _1640 = fma(_1634, _1634, _1638);
    float _1642 = rsqrt(_1640);
    float _1644 = sqrt(_1640);
    float _1646 = _1642 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1648 = _1630 * _1646;
    float _1650 = _1634 * _1646;
    float _1652 = _1648 * _1648;
    float _1654 = _1650 * _1650;
    float _1656 = _1652 + _1654;
    float _1658 = sqrt(_1656);
    bool _1660 = _1658 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1662 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1664 = _1658 + _1662;
    float _1666 = _1642;
    float _1668 = _1664;
    float _1670 = _1626;
    bool _1672 = _1660;
    if (_1660)
    {
        float _1674 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1666 = _1674;
    }
    float _1676 = _1666;
    if (_1660)
    {
        float _1678 = rsqrt(_1656);
        _1511 = _1678;
    }
    float _1680 = _1511;
    float _1682 = _1680;
    if (_1660)
    {
        float _1684 = _1664 * _1676;
        _1668 = _1684;
    }
    float _1686 = _1668;
    if (_1660)
    {
        float _1688 = _1686 * 0.15915493667125701904296875;
        _1533 = _1688;
    }
    float _1690 = _1533;
    float _1692 = _1634;
    if (_1660)
    {
        float _1694 = _1690 * 6.283185482025146484375;
        float _1696 = sin(_1694);
        _1692 = _1696;
    }
    float _1698 = _1692;
    float _1700 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1702 = precise::max(0.0, _1700);
    float _1704 = _1676;
    float _1706 = _1702;
    if (_1660)
    {
        float _1708 = _1690 * 6.283185482025146484375;
        float _1710 = cos(_1708);
        _1704 = _1710;
    }
    float _1712 = _1704;
    float _1714 = -_1646;
    float _1716 = -_1702;
    float _1718 = fma(_1626, _1714, _1716);
    if (_1660)
    {
        float _1720 = _1718 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1670 = _1720;
    }
    float _1722 = _1670;
    float _1724 = _1722;
    float _1726 = _1698;
    if (_1660)
    {
        float _1728 = fma(_1698, _1722, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1724 = _1728;
    }
    float _1730 = _1724;
    float _1732 = _1730;
    if (!_1660)
    {
        _1726 = _1648;
    }
    float _1734 = _1726;
    float _1736 = _1734;
    float _1738 = _1712;
    if (_1660)
    {
        float _1740 = _1712 + (-1.0);
        _1706 = _1740;
    }
    float _1742 = _1706;
    float _1744 = _1742;
    if (_1660)
    {
        float _1746 = _1680 * _1730;
        _1169 = _1746;
    }
    float _1748 = _1169;
    if (!_1660)
    {
        _1732 = _1718;
    }
    float _1750 = _1732;
    float _1752 = _1750;
    if (_1660)
    {
        float _1754 = _1742 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1427 = _1754;
    }
    float _1756 = _1427;
    if (_1660)
    {
        float _1758 = _1648 * _1748;
        _1736 = _1758;
    }
    float _1760 = _1736;
    if (!_1660)
    {
        _1744 = _1650;
    }
    float _1762 = _1744;
    float _1764 = _1762;
    if (_1660)
    {
        float _1766 = _1650 * _1748;
        _1764 = _1766;
    }
    float _1768 = _1764;
    if (!_1660)
    {
        _1682 = _1652;
    }
    float _1770 = _1682;
    float _1772 = _1770;
    if (_1660)
    {
        float _1774 = fma(_1718, _1712, _1756);
        _1752 = _1774;
    }
    float _1776 = _1752;
    if (_1660)
    {
        float _1778 = _1760 * _1760;
        _1772 = _1778;
    }
    float _1780 = _1772;
    if (!_1660)
    {
        _1738 = _1654;
    }
    float _1782 = _1738;
    float _1784 = _1782;
    if (_1660)
    {
        float _1786 = _1768 * _1768;
        _1784 = _1786;
    }
    float _1788 = _1784;
    float _1790 = fma(_1776, _1776, _1780);
    float _1792 = _1790 + _1788;
    float _1794 = rsqrt(_1792);
    float _1796 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1798 = fma(_1644, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1796);
    float _1800 = precise::clamp(_1798, 0.0, 1.0);
    float _1802 = -_1800;
    float _1804 = _1802 + 1.0;
    float _1806 = abs(_1804);
    float _1808 = log2(_1806);
    float _1810 = _1794 * _1760;
    float _1812 = _1794 * _1776;
    float _1814 = _1794 * _1768;
    float _1816 = _1810 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1818 = -_1816;
    float _1820 = fma(_1812, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1818);
    float _1822 = _1808 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1824 = -_1814;
    float _1826 = fma(_1824, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1820);
    float _1828 = exp2(_1822);
    float _1830 = fma(_1826, -0.5, 0.5);
    float _1832 = fma(_1826, 0.5, 0.5);
    float _1834 = fma(_1832, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1836 = sqrt(_1830);
    float _1838 = fma(_1832, _1834, -0.212114393711090087890625);
    float _1840 = _1812 + 1.0;
    float _1842 = fma(_1832, _1838, 1.570728778839111328125);
    float _1844 = -_1812;
    float _1846 = fma(_1828, _1840, _1844);
    float _1848 = fma(_1846, 0.5, 0.5);
    float _1850 = _1836 * 0.636619746685028076171875;
    float _1852 = -_1842;
    float _1854 = fma(_1850, _1852, 1.0);
    float2 _5622 = float2(_1854, _1848);
    float3 _1858 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5622, float2(0.0), isnan(_5622)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5622, float2(0.0), isnan(_5622)), level(0.0)).xyz;
    float _1860 = _1858.x;
    float _1862 = _1858.y;
    float _1864 = _1858.z;
    float _1866 = in.m_71.x;
    float _1868 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1870 = _346 > 0.5;
    float _1872 = in.m_71.y;
    int _1874 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1876 = _1874 != 0;
    float _1878 = _1808 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1880 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1882 = _1880 != 0;
    float _1884 = in.m_65.w;
    bool _1886 = _334 > 0.5;
    float _1888 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1890 = -_332;
    float _1892 = _1890 + 1.0;
    out.m_73.x = _1329;
    out.m_73.y = _1327;
    out.m_73.z = _1331;
    int _1894 = as_type<int>(_1812);
    float _1896 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    float _1898 = _1868;
    if (_1876)
    {
        bool _1900 = _338 > 0.5;
        _1672 = _1900;
    }
    bool _1902 = _1672;
    float _1904 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1906 = _1866;
    if (_1876)
    {
        float _1908 = -_1866;
        float _1910 = _1908 + 1.0;
        _1894 = as_type<int>(_1910);
    }
    int _1912 = _1894;
    float _1914 = 0.0;
    if (!_1876)
    {
        _1914 = _1866;
    }
    float _1916 = _1914;
    float _1918 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1920 = -_1872;
    float _1922 = _1920 + 1.0;
    float _1924 = _1916;
    float _1926 = _1872;
    if (_1876)
    {
        float _1928 = _1902 ? as_type<float>(_1912) : _1866;
        _1924 = _1928;
    }
    float _1930 = _1924;
    int _1932 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1934 = _1932 != 0;
    int _1936 = _1870 ? as_type<int>(_1922) : as_type<int>(_1872);
    int _1938 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1940 = _1938 != 0;
    float _1942 = _1904 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1944 = _1884 > 0.5;
    float _1946 = exp2(_1878);
    float _1948 = in.m_75.x;
    float _1950 = in.m_75.y;
    float _1952 = in.m_75.z;
    float _1954 = _1934 ? as_type<float>(_1936) : _1872;
    float _1956 = _1868 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _1958 = _754 != 0.0;
    bool _1960 = isnan(_754);
    bool _1962 = _1958 || _1960;
    bool _1964 = isnan(0.0);
    bool _1966 = _1962 || _1964;
    float _1968 = fma(_1942, _1930, -0.5);
    int _1970 = _1944 ? as_type<int>(_1922) : as_type<int>(_1872);
    float _1972 = fma(_1956, _1954, -0.5);
    bool _1974 = _752 == 0.0;
    bool _1976 = !_1966;
    bool _1978 = _1974 && _1976;
    float _1980 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _1982 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1984 = _1982 != 0;
    float _1986 = _1918 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1988 = _1882 ? as_type<float>(_1970) : _1872;
    float _1990 = fma(_584, _1968, _386);
    int _1992 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1994 = _1992 != 0;
    bool _1996 = _756 == 0.0;
    bool _1998 = _1996 && _1978;
    float _2000 = fma(_1988, _1986, -0.5);
    if (_1940)
    {
        float _2002 = _1886 ? _1922 : _1872;
        _1926 = _2002;
    }
    float _2004 = _1926;
    float _2006 = _1888 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2008 = -_394;
    float _2010 = fma(_628, _1972, _2008);
    float _2012 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2014 = fma(_2006, _2004, -0.5);
    int _2016 = as_type<int>(_2006);
    if (_1984)
    {
        float _2018 = -_1866;
        float _2020 = _2018 + 1.0;
        _404 = as_type<int>(_2020);
    }
    int _2022 = _404;
    float _2024 = 0.0;
    if (!_1984)
    {
        _2024 = _1866;
    }
    float _2026 = _2024;
    float _2028 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2030 = _2026;
    if (_1994)
    {
        float _2032 = -_1866;
        float _2034 = _2032 + 1.0;
        _2016 = as_type<int>(_2034);
    }
    int _2036 = _2016;
    float _2038 = -_616;
    float _2040 = fma(_612, _2000, _2038);
    float _2042 = as_type<float>(_2036);
    if (_1998)
    {
        _1896 = _1948;
    }
    float _2044 = _1896;
    float _2046 = _2028 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2048 = 0.0;
    float _2050 = _2044;
    if (_1998)
    {
        _2048 = _1950;
    }
    float _2052 = _2048;
    float _2054 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2056 = _2052;
    if (_1984)
    {
        float _2058 = _1886 ? as_type<float>(_2022) : _1866;
        _2030 = _2058;
    }
    float _2060 = _2030;
    float _2062 = _2040 + 0.5;
    if (_1994)
    {
        float _2064 = _1870 ? as_type<float>(_2036) : _1866;
        _1906 = _2064;
    }
    float _2066 = _1906;
    float _2068 = _2054 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_1998)
    {
        _406 = _2044;
    }
    float _2070 = _406;
    float _2072 = -_1946;
    float _2074 = _2072 + 1.0;
    float _2076 = _2070;
    if (_1998)
    {
        _2042 = _2052;
    }
    float _2078 = _2042;
    float _2080 = _2078;
    if (!_1998)
    {
        _2050 = _1948;
    }
    float _2082 = _2050;
    float _2084 = _1980 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    if (!_1998)
    {
        _2056 = _1950;
    }
    float _2086 = _2056;
    float _2088 = _2012 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2090 = 0.0;
    if (_1998)
    {
        _2090 = _1952;
    }
    float _2092 = _2090;
    float _2094 = fma(_2084, _2060, -0.5);
    float _2096 = fma(_2088, _2066, -0.5);
    float _2098 = _2092;
    if (_1998)
    {
        _1898 = _2092;
    }
    float _2100 = _1898;
    float _2102 = fma(_496, _2094, _518);
    float _2104 = _2100;
    if (!_1998)
    {
        _2098 = _1952;
    }
    float _2106 = _2098;
    float _2108 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2110 = in.m_77.x;
    float _2112 = in.m_77.y;
    float _2114 = in.m_77.z;
    float _2116 = in.m_77.w;
    if (!_1998)
    {
        float _2118 = fma(_752, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2082);
        _2076 = _2118;
    }
    float _2120 = _2076;
    float _2122 = _2108 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (!_1998)
    {
        float _2124 = fma(_754, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2086);
        _2080 = _2124;
    }
    float _2126 = _2080;
    if (!_1998)
    {
        float _2128 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2106);
        _2104 = _2128;
    }
    float _2130 = _2104;
    float _2132 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2134 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2136 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    out.m_79.x = _2046;
    out.m_79.y = _2122;
    out.m_79.z = _2068;
    float _2138 = _2132 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2140 = _2134 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2142 = _2136 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2144 = -_2126;
    float _2146 = _848 * _2144;
    float _2148 = fma(_382, _2096, _500);
    float _2150 = in.m_81.x;
    float _2152 = fma(_864, _2120, _2146);
    float _2154 = _2074 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_83.x = _2138;
    out.m_83.y = _2140;
    out.m_83.z = _2142;
    float _2156 = fma(_866, _2130, _2152);
    float _2158 = _2114 * _2082;
    float _2160 = _2112 * _2106;
    float _2162 = _2110 * _2086;
    float _2164 = -_2158;
    float _2166 = fma(_2110, _2106, _2164);
    float _2168 = -_2160;
    float _2170 = fma(_2114, _2086, _2168);
    float _2172 = -_2162;
    float _2174 = fma(_2112, _2082, _2172);
    float _2176 = _2010 + 0.5;
    float _2178 = _2166 * _2116;
    float _2180 = _1990 + 0.5;
    float _2182 = _2102 + 0.5;
    float _2184 = -_560;
    float _2186 = fma(_658, _2014, _2184);
    float _2188 = _2170 * _2116;
    float _2190 = _2174 * _2116;
    float _2192 = -_2112;
    float _2194 = _848 * _2192;
    out.m_85.x = _2180;
    out.m_85.y = _2176;
    out.m_85.z = _2182;
    out.m_85.w = _2062;
    float _2196 = -_2178;
    float _2198 = _848 * _2196;
    float _2200 = _858 * _2126;
    float _2202 = fma(_864, _2110, _2194);
    float _2204 = _2148 + 0.5;
    float _2206 = fma(_864, _2188, _2198);
    float _2208 = _858 * _2112;
    float _2210 = _860 * _2112;
    float _2212 = fma(_878, _2120, _2200);
    float _2214 = _2186 + 0.5;
    float _2216 = fma(_878, _2110, _2208);
    float _2218 = fma(_872, _2110, _2210);
    float _2220 = fma(_866, _2190, _2206);
    float _2222 = fma(_866, _2114, _2202);
    float _2224 = abs(_914);
    float _2226 = log2(_2224);
    float _2228 = _860 * _2126;
    float _2230 = _858 * _2178;
    float _2232 = _860 * _2178;
    float _2234 = fma(_876, _2114, _2216);
    float _2236 = fma(_872, _2120, _2228);
    float _2238 = fma(_878, _2188, _2230);
    float _2240 = fma(_872, _2188, _2232);
    float _2242 = fma(_876, _2130, _2212);
    out.m_87.x = _2204;
    out.m_87.y = _2214;
    float _2244 = fma(_876, _2190, _2238);
    float _2246 = fma(_882, _2190, _2240);
    float _2248 = _2242 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2250 = _2242 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2252 = _2234 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2254 = fma(_882, _2114, _2218);
    float _2256 = _2226 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2258 = _2234 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2260 = fma(_2156, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2248);
    float _2262 = _2242 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2264 = exp2(_2256);
    float _2266 = _2234 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2268 = fma(_2156, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2250);
    float _2270 = fma(_2156, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2262);
    float _2272 = fma(_2222, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2252);
    float _2274 = fma(_2222, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2266);
    float _2276 = fma(_2222, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2258);
    float _2278 = _2244 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2280 = _2244 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2282 = _2244 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2284 = _1387 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2286 = fma(_2220, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2278);
    float _2288 = fma(_2220, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2280);
    float _2290 = fma(_2220, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2282);
    float _2292 = fma(_2254, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2272);
    float _2294 = fma(_2264, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2296 = precise::clamp(_2294, 0.0, 1.0);
    float _2298 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2284);
    float _2300 = fma(_2254, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2274);
    float _2302 = fma(_2254, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2276);
    float _2304 = fma(_2246, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2286);
    float _2306 = fma(_2246, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2288);
    float _2308 = fma(_2246, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2290);
    float _2310 = fma(_2296, -2.0, 3.0);
    float _2312 = _2296 * _2296;
    float _2314 = fma(_882, _2130, _2236);
    float _2316 = fma(_1403, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2298);
    out.m_89.x = _2292;
    out.m_89.y = _2300;
    out.m_89.z = _2302;
    float _2318 = _2312 * _2310;
    float _2320 = fma(_2314, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2260);
    bool _2322 = _914 <= 8000.0;
    bool _2324 = isnan(_914);
    bool _2326 = _2322 || _2324;
    bool _2328 = isnan(8000.0);
    bool _2330 = _2326 || _2328;
    float _2332 = float(_2330);
    float _2334 = fma(_1415, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2316);
    float _2336 = -_2318;
    float _2338 = _2336 + 1.0;
    float _2340 = in.m_81.y;
    float _2342 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _2344 = _2334 + _2342;
    float _2346 = fma(_2314, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2270);
    float _2348 = in.m_81.z;
    float _2350 = fma(_2314, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2268);
    float _2352 = fma(_2338, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2318);
    float _2354 = _1433 + _2344;
    float _2356 = in.m_81.w;
    float _2358 = _2332 * _2352;
    float _2360 = _2352;
    float _2362 = _2344;
    if (!_1423)
    {
        _2360 = 1.0;
    }
    float _2364 = _2360;
    float _2366 = _2354 * 0.5;
    float _2368 = _2364;
    if (_1423)
    {
        bool _2370 = _1537 >= _1499;
        bool _2372 = isnan(_1537);
        bool _2374 = _2370 || _2372;
        bool _2376 = isnan(_1499);
        bool _2378 = _2374 || _2376;
        float _2380 = float(_2378);
        _2368 = _2380;
    }
    float _2382 = _2368;
    float _2384 = _2358 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.gl_Position.x = _1471;
    out.gl_Position.y = _1475;
    out.gl_Position.z = _2344;
    out.gl_Position.w = _1433;
    float _2386 = _2154 * _1539;
    float _2388 = -_2154;
    float _2390 = _2388 + 1.0;
    float _2392 = _1892 * _2384;
    float _2394 = precise::clamp(_2392, 0.0, 1.0);
    float _2396 = _2382 * _1622;
    out.m_91.x = _2306;
    out.m_91.y = _2304;
    out.m_91.z = _2308;
    float _2398 = _1550 * _2390;
    bool _2400 = _1644 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2402 = isnan(_1644);
    bool _2404 = _2400 || _2402;
    bool _2406 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2408 = _2404 || _2406;
    out.m_93.z = _2366;
    out.m_93.w = _1433;
    out.m_95.x = _2150;
    float _2410 = -_2394;
    float _2412 = fma(_2410, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2414 = _1550 * _2386;
    float _2416 = -_2396;
    float _2418 = fma(_2416, _2412, 1.0);
    float _2420 = precise::clamp(_2418, 0.0, 1.0);
    out.m_95.y = _2340;
    float _2422 = _2396;
    float _2424 = _2420;
    float _2426 = _2386;
    if (!_2408)
    {
        _2422 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2428 = _2422;
    float _2430 = _2420 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_95.z = _2348;
    float _2432 = _2428;
    float _2434 = _2428;
    if (!_2408)
    {
        _1453 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2436 = _1453;
    float _2438 = _2436;
    float _2440 = _2436;
    if (!_2408)
    {
        _2362 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2442 = _2362;
    out.m_95.w = _2356;
    float _2444 = _2442;
    float _2446 = _2442;
    if (!_2408)
    {
        _1483 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2448 = _1483;
    float _2450 = _2448;
    float _2452 = _2448;
    if (!_2408)
    {
        _2424 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2454 = _2424;
    out.m_97.x = _2430;
    out.m_99.x = _2320;
    out.m_99.y = _2346;
    out.m_99.z = _2350;
    float _2456 = _1864 * _2386;
    float _2458 = fma(_1860, _2414, _1544);
    float _2460 = fma(_1862, _2414, _1546);
    float _2462 = _2454;
    float _2464 = _2454;
    if (!_2408)
    {
        _2426 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2466 = _2426;
    float _2468 = fma(_1550, _2456, _1548);
    out.m_101.x = _2458;
    out.m_101.y = _2460;
    out.m_101.z = _2468;
    out.m_101.w = _2398;
    bool _2470 = !_2408;
    float _2472 = _2466;
    float _2474 = _2466;
    if (!_2470)
    {
        bool _2476 = _1644 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2478 = isnan(_1644);
        bool _2480 = _2476 || _2478;
        bool _2482 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2484 = _2480 || _2482;
        if (!_2484)
        {
            float _2486 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2488 = _1644 + _2486;
            float _2490 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2492 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2490;
            float _2494 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2496 = _2494 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2498 = 1.0 / _2492;
            float _2500 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2502 = _2500 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2504 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2506 = _2504 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2508 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2510 = _2508 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2512 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2514 = _2512 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2516 = _2488 * _2498;
            float _2518 = precise::clamp(_2516, 0.0, 1.0);
            float _2520 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2522 = _2520 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2524 = fma(_2518, _2496, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2526 = fma(_2518, _2522, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2528 = fma(_2518, _2502, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2530 = fma(_2518, _2506, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2532 = fma(_2518, _2510, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2534 = fma(_2518, _2514, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2474 = _2528;
            _2452 = _2532;
            _2434 = _2524;
            _2446 = _2530;
            _2440 = _2526;
            _2464 = _2534;
            _2536 = true;
        }
        else
        {
            bool _2538 = _1644 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2540 = isnan(_1644);
            bool _2542 = _2538 || _2540;
            bool _2544 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2546 = _2542 || _2544;
            if (!_2546)
            {
                _2432 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2548 = _2432;
            _2434 = _2548;
            if (!_2546)
            {
                _2472 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2550 = _2472;
            _2474 = _2550;
            if (!_2546)
            {
                _2438 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2552 = _2438;
            _2440 = _2552;
            if (!_2546)
            {
                _2444 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2554 = _2444;
            _2446 = _2554;
            if (!_2546)
            {
                _2450 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2556 = _2450;
            _2452 = _2556;
            if (!_2546)
            {
                _2462 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2558 = _2462;
            bool _2560 = !_2546;
            _2464 = _2558;
            if (!_2560)
            {
                bool _2562 = _1644 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2564 = isnan(_1644);
                bool _2566 = _2562 || _2564;
                bool _2568 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2570 = _2566 || _2568;
                if (!_2570)
                {
                    float _2572 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2574 = _1644 + _2572;
                    float _2576 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2578 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2576;
                    float _2580 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2582 = _2580 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2584 = 1.0 / _2578;
                    float _2586 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2588 = _2586 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2590 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2592 = _2590 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2594 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2596 = _2594 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2598 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2600 = _2598 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2602 = _2574 * _2584;
                    float _2604 = precise::clamp(_2602, 0.0, 1.0);
                    float _2606 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2608 = _2606 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2610 = fma(_2604, _2582, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2612 = fma(_2604, _2608, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2614 = fma(_2604, _2588, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2616 = fma(_2604, _2592, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2618 = fma(_2604, _2596, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2620 = fma(_2604, _2600, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2474 = _2614;
                    _2452 = _2618;
                    _2434 = _2610;
                    _2446 = _2616;
                    _2440 = _2612;
                    _2464 = _2620;
                    _2536 = true;
                }
                else
                {
                    _2474 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2452 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2434 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2446 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2440 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2464 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2536 = false;
    float _2622 = _2474;
    float _2624 = _2452;
    float _2626 = _2434;
    float _2628 = _2446;
    float _2630 = _2440;
    float _2632 = _2464;
    float _2634 = fma(_2346, -0.5, 0.5);
    float _2636 = precise::clamp(_2634, 0.0, 1.0);
    float _2638 = -_2622;
    float _2640 = _2638 + _2624;
    float _2642 = -_2626;
    float _2644 = _2642 + _2628;
    float _2646 = -_2630;
    float _2648 = _2646 + _2632;
    bool _2650 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2652 = fma(_2636, _2640, _2622);
    float _2654 = fma(_2636, _2644, _2626);
    float _2656 = fma(_2636, _2648, _2630);
    float _2658 = _2652 * 0.586610972881317138671875;
    out.m_59.x = 1.0;
    float _2660 = fma(_2654, 0.298911988735198974609375, _2658);
    out.m_97.w = (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2662 = fma(_2656, 0.114477999508380889892578125, _2660);
    out.m_103.x = 0.0;
    float _2664 = -_2662;
    float _2666 = _2654 + _2664;
    float _2668 = -_2662;
    float _2670 = _2652 + _2668;
    float _2672 = -_2662;
    float _2674 = _2656 + _2672;
    float _2676 = fma(_2666, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2662);
    float _2678 = fma(_2670, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2662);
    float _2680 = fma(_2674, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2662);
    out.m_105.x = _2676;
    out.m_105.y = _2678;
    out.m_105.z = _2680;
    if (!_2650)
    {
        return out;
    }
    float _2682 = -_1327;
    float _2684 = _2682 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2686 = -_1329;
    float _2688 = _2686 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2690 = -_1331;
    float _2692 = _2690 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2694 = _2684 * _2684;
    float _2696 = fma(_2688, _2688, _2694);
    float _2698 = fma(_2692, _2692, _2696);
    float _2700 = sqrt(_2698);
    float _2702 = rsqrt(_2698);
    float _2704 = -_2700;
    float _2706 = _2704 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2708 = _2706 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2710 = precise::clamp(_2708, 0.0, 1.0);
    float _2712 = _2688 * _2702;
    float _2714 = _2684 * _2702;
    float _2716 = abs(_2710);
    float _2718 = log2(_2716);
    float _2720 = _2692 * _2702;
    float _2722 = _2712 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2724 = _2346 * _2714;
    float _2726 = -_2714;
    float _2728 = -_2722;
    float _2730 = fma(_2726, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2728);
    float _2732 = fma(_2320, _2712, _2724);
    float _2734 = -_2720;
    float _2736 = fma(_2734, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2730);
    float _2738 = fma(_2350, _2720, _2732);
    float _2740 = precise::clamp(_2738, 0.0, 1.0);
    float _2742 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2744 = _2736 + _2742;
    float _2746 = _2718 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2748 = _2744 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2750 = precise::clamp(_2748, 0.0, 1.0);
    float _2752 = exp2(_2746);
    float _2754 = _2752 * _2750;
    float _2756 = _2740 * _2754;
    float _2758 = _2756 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2760 = _2756 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2762 = _2756 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_103.x = _2758;
    out.m_103.y = _2760;
    out.m_103.z = _2762;
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
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2536 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _119 = in.m_56.w;
    float _121 = trunc(_119);
    int _124 = int(_121);
    bool _128 = _124 >= 1;
    float _130 = 0.0;
    float _132 = as_type<float>(_124);
    if (!_128)
    {
        _130 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _134 = _130;
    if (!_128)
    {
        out.m_59.x = 0.0;
    }
    int _136 = 0;
    if (!_128)
    {
        float _138 = _134 * 5.0;
        _136 = as_type<int>(_138);
    }
    int _140 = _136;
    int _142 = _140;
    if (!_128)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2820 = as_type<float>(_140);
        out.gl_Position.z = _2820;
    }
    if (!_128)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _144 = in.m_61.w;
    bool _146 = _144 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _148 = isnan(_144);
    bool _150 = _146 || _148;
    bool _152 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _154 = _150 || _152;
    float _156 = -_144;
    float _158 = _156 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _160 = _158;
    if (_154)
    {
        float _162 = float(_124);
        _132 = _162;
    }
    float _164 = _132;
    bool _166 = _158 >= _164;
    bool _168 = !_154;
    bool _170 = _166 || _168;
    float _172 = _164;
    if (_170)
    {
        _172 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _174 = _172;
    if (_170)
    {
        out.m_59.x = 0.0;
    }
    if (_170)
    {
        float _176 = _174 * 5.0;
        _142 = as_type<int>(_176);
    }
    int _178 = _142;
    if (_170)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2890 = as_type<float>(_178);
        out.gl_Position.z = _2890;
    }
    if (_170)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _180 = in.m_63.w;
    float _182 = _158 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _184 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _186 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _188 = _184 || _186;
    bool _190 = isnan(1.0);
    bool _192 = _188 || _190;
    float _194 = in.m_61.x;
    float _196 = in.m_61.y;
    float _198 = in.m_61.z;
    float _200 = in.m_56.x;
    float _202 = in.m_56.y;
    float _204 = in.m_56.z;
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
    float _282 = _256 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _284 = _256 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _286 = fma(_280, _196, _282);
    float _288 = _256 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _290 = fma(_280, _194, _284);
    float _292 = fma(_286, _180, _202);
    float _294 = fma(_280, _198, _288);
    float _296 = fma(_290, _180, _200);
    float _298 = _292 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _300 = fma(_294, _180, _204);
    float _302 = fma(_296, (*spvDescriptorSet0.vp_c10)._m0[4].x, _298);
    float _304 = _292 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _306 = fma(_300, (*spvDescriptorSet0.vp_c10)._m0[4].z, _302);
    float _308 = fma(_296, (*spvDescriptorSet0.vp_c10)._m0[6].x, _304);
    float _310 = _306 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _312 = fma(_300, (*spvDescriptorSet0.vp_c10)._m0[6].z, _308);
    float _314 = fma(_310, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _316 = _312 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _318 = floor(_314);
    float _320 = fma(_316, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _322 = floor(_320);
    float _324 = -_318;
    float _326 = _314 + _324;
    float _328 = -_322;
    float _330 = _320 + _328;
    float2 _3139 = float2(_326, _330);
    float _332 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3139, float2(0.0), isnan(_3139)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3139, float2(0.0), isnan(_3139)), level(0.0)).x;
    float _334 = in.m_65.z;
    float _336 = _292 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _338 = in.m_65.x;
    float _340 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _342 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _344 = _342 != 0;
    float _346 = in.m_65.y;
    float _348 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _352 = 1.0 + _350;
    float _354 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _356 = _334 * 2.0;
    float _358 = 1.0 / _352;
    float _360 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.300000011920928955078125;
    float _362 = _338 * 2.0;
    float _364 = _338 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _366 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[88].z, _354);
    float _368 = _346 + _334;
    float _370 = floor(_356);
    float _372 = _346 * 2.0;
    float _374 = -_340;
    float _376 = fma(_364, 2.0, _374);
    float _378 = _346 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _380 = _368 + (-1.0);
    float _382 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[87].z, _366);
    float _384 = -_158;
    float _386 = fma(_384, (*spvDescriptorSet0.vp_c9)._m0[76].x, _376);
    float _388 = fma(_378, -2.0, _348);
    float _390 = floor(_362);
    float _392 = _346 + _338;
    float _394 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[76].y, _388);
    float _396 = _392 + (-1.0);
    float _398 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _400 = _380;
    int _402 = 2;
    int _404 = as_type<int>(_394);
    float _406 = _346;
    if (_344)
    {
        _400 = _338;
    }
    float _408 = _400;
    float _410 = floor(_372);
    bool _412 = _370 > 0.0;
    float _414 = fma(_396, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _416 = _370 >= 0.0;
    bool _418 = isnan(_370);
    bool _420 = _416 || _418;
    bool _422 = isnan(0.0);
    bool _424 = _420 || _422;
    float _426 = _408;
    float _428 = (*spvDescriptorSet0.vp_c9)._m0[87].x;
    if (!_344)
    {
        _426 = _334;
    }
    float _430 = _426;
    bool _432 = _390 > 0.0;
    float _434 = _430 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _436 = _390 >= 0.0;
    bool _438 = isnan(_390);
    bool _440 = _436 || _438;
    bool _442 = isnan(0.0);
    bool _444 = _440 || _442;
    float _446 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _448 = _434;
    if (!_344)
    {
        _428 = _346;
    }
    float _450 = _428;
    float _452 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _454 = _450;
    if (_344)
    {
        _454 = _338;
    }
    float _456 = _454;
    float _458 = -_446;
    float _460 = fma(_434, 2.0, _458);
    bool _462 = _410 > 0.0;
    float _464 = fma(_456, (*spvDescriptorSet0.vp_c9)._m0[83].z, _452);
    bool _466 = _410 >= 0.0;
    bool _468 = isnan(_410);
    bool _470 = _466 || _468;
    bool _472 = isnan(0.0);
    bool _474 = _470 || _472;
    float _476 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _478 = _456 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _480 = _478;
    if (!_344)
    {
        _448 = _334;
    }
    float _482 = _448;
    float _484 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _486 = log2(_484);
    float _488 = _482;
    if (_344)
    {
        _488 = _346;
    }
    float _490 = _488;
    float _492 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _494 = _424 ? 0 : 1;
    float _496 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[82].z, _464);
    float _498 = -_158;
    float _500 = fma(_498, (*spvDescriptorSet0.vp_c9)._m0[86].x, _460);
    float _502 = fma(_490, (*spvDescriptorSet0.vp_c9)._m0[83].w, _476);
    float _504 = _490;
    if (_344)
    {
        _504 = _346;
    }
    float _506 = _504;
    float _508 = -_492;
    float _510 = fma(_478, 2.0, _508);
    float _512 = _506;
    if (!_344)
    {
        _512 = _338;
    }
    float _514 = _512;
    float _516 = -_158;
    float _518 = fma(_516, (*spvDescriptorSet0.vp_c9)._m0[81].x, _510);
    if (!_344)
    {
        _480 = _334;
    }
    float _520 = _480;
    float _522 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _524 = _520;
    if (_344)
    {
        _524 = _346;
    }
    float _526 = _524;
    float _528 = _514 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _530 = _486 * _158;
    int _532 = ~_494;
    int _534 = _532 + 1;
    int _536 = _534 + 1;
    float _538 = fma(_528, -2.0, _522);
    float _540 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _542 = _526 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _544 = _536;
    if (!_412)
    {
        int _546 = ~_494;
        int _548 = _546 + 1;
        _544 = _548;
    }
    int _550 = _544;
    float _552 = exp2(_530);
    float _554 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _556 = fma(_542, -2.0, _540);
    int _558 = _444 ? 0 : 1;
    float _560 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[86].y, _538);
    float _562 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[78].z, _554);
    int _564 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _566 = _564 != 0;
    int _568 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _570 = _568 != 0;
    int _572 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _574 = _572 != 0;
    float _576 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _578 = ~_558;
    int _580 = _578 + 1;
    int _582 = _580 + 1;
    float _584 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[77].z, _562);
    int _586 = _582;
    if (!_432)
    {
        int _588 = ~_558;
        int _590 = _588 + 1;
        _586 = _590;
    }
    int _592 = _586;
    float _594 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    bool _596 = !_566;
    int _598 = _596 ? 0 : 1;
    float _600 = in.m_67.x;
    float _602 = in.m_67.y;
    float _604 = in.m_67.z;
    float _606 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[78].w, _576);
    float _608 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[88].w, _594);
    int _610 = abs(_598);
    float _612 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[82].w, _502);
    float _614 = float(_550);
    float _616 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[81].y, _556);
    float _618 = float(_610);
    float _620 = -_552;
    float _622 = _620 + 1.0;
    bool _624 = !_570;
    int _626 = _624 ? 0 : 1;
    float _628 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[77].w, _606);
    bool _630 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _632 = isnan(1.0);
    bool _634 = _630 || _632;
    bool _636 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _638 = _634 || _636;
    float _640 = _618 * _614;
    int _642 = abs(_626);
    float _644 = _338 + (-0.5);
    bool _646 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _648 = isnan(0.0);
    bool _650 = _646 || _648;
    bool _652 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _654 = _650 || _652;
    float _656 = _640 * (-2.0);
    float _658 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[87].w, _608);
    float _660 = float(_592);
    float _662 = float(_642);
    float _664 = _654 ? _622 : 0.0;
    float _666 = fma(_656, _600, _600);
    bool _668 = !_574;
    int _670 = _668 ? 0 : 1;
    float _672 = _662 * _660;
    int _674 = _474 ? 0 : 1;
    if (_638)
    {
        float _676 = _664 * _358;
        _160 = _676;
    }
    float _678 = _160;
    float _680 = fma(_414, _656, _414);
    float _682 = fma(_644, (*spvDescriptorSet0.vp_c9)._m0[196].x, _666);
    int _684 = abs(_670);
    float _686 = _672 * (-2.0);
    int _688 = ~_674;
    int _690 = _688 + 1;
    int _692 = _690 + 1;
    float _694 = fma(_680, _678, _682);
    int _696 = _692;
    if (!_462)
    {
        int _698 = ~_674;
        int _700 = _698 + 1;
        _696 = _700;
    }
    int _702 = _696;
    float _704 = _346 + (-0.5);
    float _706 = fma(_686, _602, _602);
    float _708 = float(_684);
    float _710 = _694 * 0.15915493667125701904296875;
    float _712 = float(_702);
    float _714 = fma(_296, (*spvDescriptorSet0.vp_c10)._m0[5].x, _336);
    float _716 = fma(_704, (*spvDescriptorSet0.vp_c9)._m0[196].y, _706);
    float _718 = _338 + _334;
    float _720 = _708 * _712;
    float _722 = fma(_398, _686, _398);
    float _724 = _718 + (-1.0);
    float _726 = fma(_300, (*spvDescriptorSet0.vp_c10)._m0[5].z, _714);
    float _728 = _720 * (-2.0);
    float _730 = fma(_722, _678, _716);
    float _732 = fma(_724, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _734 = _334 + (-0.5);
    float _736 = fma(_728, _604, _604);
    float _738 = _726 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _740 = in.m_63.x;
    float _742 = in.m_63.y;
    float _744 = in.m_63.z;
    float _746 = fma(_732, _728, _732);
    float _748 = fma(_734, (*spvDescriptorSet0.vp_c9)._m0[196].z, _736);
    float _750 = _738 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _752 = in.m_69.x;
    float _754 = in.m_69.y;
    float _756 = in.m_69.z;
    float _758 = _710 * 6.283185482025146484375;
    float _760 = sin(_758);
    float _762 = fma(_746, _678, _748);
    float _764 = fma(_310, (*spvDescriptorSet0.vp_c8)._m0[11].x, _750);
    float _766 = _738 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _768 = _730 * 0.15915493667125701904296875;
    float _770 = _762 * 0.15915493667125701904296875;
    float _772 = fma(_316, (*spvDescriptorSet0.vp_c8)._m0[11].z, _764);
    float _774 = _710 * 6.283185482025146484375;
    float _776 = cos(_774);
    float _778 = _772 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _780 = fma(_310, (*spvDescriptorSet0.vp_c8)._m0[10].x, _766);
    float _782 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _784 = fma(_316, (*spvDescriptorSet0.vp_c8)._m0[10].z, _780);
    float _786 = 1.0 / _778;
    float _788 = _738 + _782;
    float _790 = _740 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _792 = _784 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _794 = _744 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _796 = _742 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _798 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _752);
    float _800 = _768 * 6.283185482025146484375;
    float _802 = sin(_800);
    float _804 = _790 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _806 = _792 + _778;
    float _808 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _756);
    float _810 = _794 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _812 = _798 * _804;
    float _814 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _754);
    float _816 = _768 * 6.283185482025146484375;
    float _818 = cos(_816);
    float _820 = _796 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _822 = _806 * _786;
    float _824 = _822 * 0.5;
    float _826 = _808 * _810;
    float _828 = _814 * _820;
    float _830 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _832 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[30].w, _830);
    float _834 = _770 * 6.283185482025146484375;
    float _836 = cos(_834);
    float _838 = _776 * _802;
    float _840 = _760 * _802;
    float _842 = _788 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _844 = fma(_310, (*spvDescriptorSet0.vp_c15)._m0[126].x, _842);
    float _846 = _770 * 6.283185482025146484375;
    float _848 = sin(_846);
    float _850 = _760 * _818;
    float _852 = _776 * _818;
    float _854 = fma(_316, (*spvDescriptorSet0.vp_c15)._m0[126].z, _844);
    float _856 = _854 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _858 = _776 * _836;
    float _860 = _760 * _836;
    float _862 = 1.0 / _832;
    float _864 = _818 * _836;
    float _866 = _802 * _836;
    float _868 = _860 * _828;
    float _870 = -_838;
    float _872 = fma(_848, _850, _870);
    float _874 = -_850;
    float _876 = fma(_848, _838, _874);
    float _878 = fma(_848, _852, _840);
    float _880 = _858 * _828;
    float _882 = fma(_848, _840, _852);
    float _884 = -_828;
    float _886 = _848 * _884;
    float _888 = (*spvDescriptorSet0.vp_c10)._m0[2].x * (-0.550000011920928955078125);
    float _890 = fma(_878, _812, _880);
    float _892 = trunc(_856);
    int _894 = int(_892);
    float _896 = fma(_864, _812, _886);
    float _898 = fma(_872, _812, _868);
    float _900 = fma(_876, _826, _890);
    float _902 = _788 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _904 = fma(_866, _826, _896);
    float _906 = fma(_882, _826, _898);
    float _908 = _900 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _910 = fma(_310, (*spvDescriptorSet0.vp_c15)._m0[127].x, _902);
    float _912 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _914 = _862 * _912;
    float _916 = (*spvDescriptorSet0.vp_c10)._m0[2].x * (-0.60000002384185791015625);
    float _918 = fma(_904, (*spvDescriptorSet0.vp_c10)._m0[9].x, _908);
    float _920 = fma(_316, (*spvDescriptorSet0.vp_c15)._m0[127].z, _910);
    float _922 = _900 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    bool _924 = _914 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _926 = fma(_906, (*spvDescriptorSet0.vp_c10)._m0[9].z, _918);
    bool _928 = _914 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _930 = (*spvDescriptorSet0.vp_c10)._m0[2].x * (-0.2800000011920928955078125);
    float _932 = _900 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _934 = _738 + _926;
    float _936 = _920 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    bool _938 = !_924;
    int _940 = _938 ? 0 : 1;
    float _942 = fma(_904, (*spvDescriptorSet0.vp_c10)._m0[8].x, _922);
    float _944 = fma(_934, 0.4000000059604644775390625, _930);
    float _946 = fma(_934, 0.85000002384185791015625, _916);
    float _948 = fma(_934, 0.75, _888);
    float _950 = trunc(_936);
    int _952 = int(_950);
    float _954 = _944 * 0.15915493667125701904296875;
    float _956 = (*spvDescriptorSet0.vp_c10)._m0[2].x * (-0.310000002384185791015625);
    float _958 = _934;
    if (!_924)
    {
        _402 = 1;
    }
    int _960 = _402;
    float _962 = _946 * 0.15915493667125701904296875;
    int _964 = _960;
    if (!_928)
    {
        _964 = _940;
    }
    int _966 = _964;
    float _968 = fma(_934, 0.3499999940395355224609375, _956);
    float _970 = _948 * 0.15915493667125701904296875;
    float _972 = _954 * 6.283185482025146484375;
    float _974 = sin(_972);
    int _976 = _966 << 6;
    float _978 = _968 * 0.15915493667125701904296875;
    float _980 = fma(_904, (*spvDescriptorSet0.vp_c10)._m0[10].x, _932);
    int _982 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _984 = _894 + _982;
    int _986 = _984 + 1;
    int _988 = _976 + 96;
    uint _991 = uint(int(uint(_988) >> uint(2)));
    uint _993 = uint(int(uint(int(_991)) >> uint(2)));
    int _995 = int(_991) & 3;
    float _997 = (*spvDescriptorSet0.vp_c15)._m0[int(_993)][_995];
    int _999 = int(_991) + 1;
    uint _1001 = uint(int(uint(_999) >> uint(2)));
    int _1003 = _999 & 3;
    float _1005 = (*spvDescriptorSet0.vp_c15)._m0[int(_1001)][_1003];
    float _1007 = fma(_906, (*spvDescriptorSet0.vp_c10)._m0[8].z, _942);
    float _1009 = fma(_906, (*spvDescriptorSet0.vp_c10)._m0[10].z, _980);
    float _1011 = _962 * 6.283185482025146484375;
    float _1013 = sin(_1011);
    float _1015 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.17000000178813934326171875;
    bool _1017 = _986 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1019 = _316 + _1009;
    float _1021 = _310 + _1007;
    int _1023 = _976 + 104;
    uint _1025 = uint(int(uint(_1023) >> uint(2)));
    uint _1027 = uint(int(uint(int(_1025)) >> uint(2)));
    int _1029 = int(_1025) & 3;
    float _1031 = (*spvDescriptorSet0.vp_c15)._m0[int(_1027)][_1029];
    int _1033 = int(_1025) + 1;
    uint _1035 = uint(int(uint(_1033) >> uint(2)));
    int _1037 = _1033 & 3;
    float _1039 = (*spvDescriptorSet0.vp_c15)._m0[int(_1035)][_1037];
    float _1041 = fma(_1019, 0.550000011920928955078125, _1015);
    float _1043 = _978 * 6.283185482025146484375;
    float _1045 = sin(_1043);
    float _1047 = fma(_1021, 0.89999997615814208984375, _360);
    float _1049 = _1041 * 0.15915493667125701904296875;
    int _1051 = _976 + 64;
    uint _1053 = uint(int(uint(_1051) >> uint(2)));
    uint _1055 = uint(int(uint(int(_1053)) >> uint(2)));
    int _1057 = int(_1053) & 3;
    float _1059 = (*spvDescriptorSet0.vp_c15)._m0[int(_1055)][_1057];
    int _1061 = int(_1053) + 1;
    uint _1063 = uint(int(uint(_1061) >> uint(2)));
    int _1065 = _1061 & 3;
    float _1067 = (*spvDescriptorSet0.vp_c15)._m0[int(_1063)][_1065];
    float _1069 = _1047 * 0.15915493667125701904296875;
    float _1071 = _970 * 6.283185482025146484375;
    float _1073 = sin(_1071);
    float _1075 = _974 + _1013;
    int _1077 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1079 = _952 + _1077;
    int _1081 = _1079 + 1;
    int _1083 = _976 + 48;
    uint _1085 = uint(int(uint(_1083) >> uint(2)));
    uint _1087 = uint(int(uint(int(_1085)) >> uint(2)));
    int _1089 = int(_1085) & 3;
    float _1091 = (*spvDescriptorSet0.vp_c15)._m0[int(_1087)][_1089];
    int _1093 = int(_1085) + 1;
    uint _1095 = uint(int(uint(_1093) >> uint(2)));
    int _1097 = _1093 & 3;
    float _1099 = (*spvDescriptorSet0.vp_c15)._m0[int(_1095)][_1097];
    int _1101 = _986 | _1081;
    bool _1103 = _1101 < 0;
    bool _1105 = _1103 || _1017;
    int _1107 = _976 + 72;
    uint _1109 = uint(int(uint(_1107) >> uint(2)));
    uint _1111 = uint(int(uint(int(_1109)) >> uint(2)));
    int _1113 = int(_1109) & 3;
    float _1115 = (*spvDescriptorSet0.vp_c15)._m0[int(_1111)][_1113];
    int _1117 = int(_1109) + 1;
    uint _1119 = uint(int(uint(_1117) >> uint(2)));
    int _1121 = _1117 & 3;
    float _1123 = (*spvDescriptorSet0.vp_c15)._m0[int(_1119)][_1121];
    bool _1125 = _1081 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1127 = _1125 || _1105;
    float _1129 = _1045 + _1073;
    float _1131 = fma(_1075, 0.00999999977648258209228515625, _1021);
    float _1133 = _1049 * 6.283185482025146484375;
    float _1135 = sin(_1133);
    float _1137 = fma(_1129, 0.00999999977648258209228515625, _1019);
    int _1139 = _976 + 56;
    uint _1141 = uint(int(uint(_1139) >> uint(2)));
    uint _1143 = uint(int(uint(int(_1141)) >> uint(2)));
    int _1145 = int(_1141) & 3;
    float _1147 = (*spvDescriptorSet0.vp_c15)._m0[int(_1143)][_1145];
    int _1149 = int(_1141) + 1;
    uint _1151 = uint(int(uint(_1149) >> uint(2)));
    int _1153 = _1149 & 3;
    float _1155 = (*spvDescriptorSet0.vp_c15)._m0[int(_1151)][_1153];
    float _1157 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1159 = _1131 + _1157;
    float _1161 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1163 = _1137 + _1161;
    int _1165 = _986;
    float _1167 = as_type<float>(_1081);
    float _1169 = _1069;
    if (!_1127)
    {
        int _1171 = _1081 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1173 = _1171 + _986;
        _1165 = _1173;
    }
    int _1175 = _1165;
    float _1177 = _1163 * _1163;
    int _1179 = _976 + 80;
    uint _1181 = uint(int(uint(_1179) >> uint(2)));
    uint _1183 = uint(int(uint(int(_1181)) >> uint(2)));
    int _1185 = int(_1181) & 3;
    float _1187 = (*spvDescriptorSet0.vp_c15)._m0[int(_1183)][_1185];
    int _1189 = int(_1181) + 1;
    uint _1191 = uint(int(uint(_1189) >> uint(2)));
    int _1193 = _1189 & 3;
    float _1195 = (*spvDescriptorSet0.vp_c15)._m0[int(_1191)][_1193];
    float _1197 = _788 * _1005;
    if (!_1127)
    {
        float _1199 = floor(_856);
        _1167 = _1199;
    }
    float _1201 = _1167;
    float _1203 = fma(_1159, _1159, _1177);
    float _1205 = fma(_310, _997, _1197);
    float _1207 = fma(_316, _1031, _1205);
    float _1209 = sqrt(_1203);
    float _1211 = _1207 + _1039;
    float _1213 = _1135 * 0.20999999344348907470703125;
    float _1215 = _788 * _1067;
    float _1217 = _1069 * 6.283185482025146484375;
    float _1219 = sin(_1217);
    float _1221 = fma(_310, _1059, _1215);
    int _1223 = as_type<int>(_1059);
    float _1225 = _1213;
    float _1227 = _1135;
    if (!_1127)
    {
        int _1229 = _1175 << 2;
        _1223 = _1229;
    }
    int _1231 = _1223;
    float _1233 = _788 * _1099;
    int _1235 = _1231;
    int _1237 = as_type<int>(_1233);
    float _1239 = _1195;
    if (!_1127)
    {
        int _1241 = 12 & _1231;
        _1235 = _1241;
    }
    int _1243 = _1235;
    float _1245 = 1.0 / _1211;
    bool _1247 = _1209 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1249 = fma(_310, _1091, _1233);
    int _1251 = as_type<int>(_1249);
    if (!_1127)
    {
        uint _1253 = uint(int(uint(_1175) >> uint(2)));
        _1237 = int(_1253);
    }
    int _1255 = _1237;
    float _1257 = fma(_316, _1115, _1221);
    float _1259 = fma(_1219, 0.300000011920928955078125, _1213);
    float _1261 = _1257 + _1123;
    float _1263 = _934 + _1259;
    float _1265 = fma(_316, _1147, _1249);
    float _1267 = _1259;
    if (!_1127)
    {
        int _1269 = _1255 << 4;
        int _1271 = _1269 + _1243;
        _1251 = _1271;
    }
    int _1273 = _1251;
    if (!_1247)
    {
        _1225 = _1131;
    }
    float _1275 = _1225;
    float _1277 = _1265 + _1155;
    float _1279 = _1275;
    if (!_1247)
    {
        _958 = _1137;
    }
    float _1281 = _958;
    float _1283 = _1281;
    if (!_1247)
    {
        _1267 = _1263;
    }
    float _1285 = _1267;
    bool _1287 = !_1247;
    float _1289 = _1285;
    if (!_1287)
    {
        float _1291 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1293 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1295 = _1209 + _1293;
        float _1297 = _1263 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1299 = rsqrt(_1203);
        float _1301 = _1295 * _1291;
        float _1303 = _1301 * 0.15915493667125701904296875;
        float _1305 = _1303 * 6.283185482025146484375;
        float _1307 = cos(_1305);
        float _1309 = _1303 * 6.283185482025146484375;
        float _1311 = sin(_1309);
        float _1313 = _1307 + (-1.0);
        float _1315 = _1313 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1317 = fma(_1311, _1297, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1319 = fma(_1263, _1307, _1315);
        float _1321 = _1299 * _1317;
        float _1323 = fma(_1159, _1321, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1325 = fma(_1163, _1321, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1289 = _1319;
        _1279 = _1323;
        _1283 = _1325;
    }
    float _1327 = _1289;
    float _1329 = _1279;
    float _1331 = _1283;
    int _1333 = _976 + 88;
    uint _1335 = uint(int(uint(_1333) >> uint(2)));
    uint _1337 = uint(int(uint(int(_1335)) >> uint(2)));
    int _1339 = int(_1335) & 3;
    float _1341 = (*spvDescriptorSet0.vp_c15)._m0[int(_1337)][_1339];
    int _1343 = int(_1335) + 1;
    uint _1345 = uint(int(uint(_1343) >> uint(2)));
    int _1347 = _1343 & 3;
    float _1349 = (*spvDescriptorSet0.vp_c15)._m0[int(_1345)][_1347];
    float _1351 = _1327 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1353 = _1327 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1355 = _1327 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1357 = _1277 * _1245;
    float _1359 = fma(_1329, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1351);
    float _1361 = fma(_1329, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1353);
    float _1363 = fma(_1329, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1355);
    float _1365 = _1209;
    if (!_1127)
    {
        int _1367 = _1273 + 400;
        uint _1369 = uint(int(uint(_1367) >> uint(2)));
        uint _1371 = uint(int(uint(int(_1369)) >> uint(2)));
        int _1373 = int(_1369) & 3;
        float _1375 = (*spvDescriptorSet0.vp_c15)._m0[int(_1371)][_1373];
        _1365 = _1375;
    }
    float _1377 = _1365;
    float _1379 = fma(_1331, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1359);
    float _1381 = fma(_1331, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1361);
    float _1383 = _1327 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1385 = fma(_1331, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1363);
    float _1387 = _1379 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _1389 = _1357 >= 0.0;
    float _1391 = fma(_1329, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1383);
    float _1393 = _1385 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1395 = _1387 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1397 = _1261 * _1245;
    bool _1399 = _1357 <= 1.0;
    bool _1401 = _1399 && _1389;
    float _1403 = _1381 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1405 = fma(_1331, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1391);
    float _1407 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1395);
    bool _1409 = _1397 >= 0.0;
    bool _1411 = _1409 && _1401;
    float _1413 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1415 = _1405 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1417 = fma(_1403, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1407);
    float _1419 = _1403 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    bool _1421 = _1397 <= 1.0;
    bool _1423 = _1421 && _1411;
    float _1425 = _1265;
    float _1427 = _1397;
    if (!_1127)
    {
        float _1429 = floor(_936);
        _1425 = _1429;
    }
    float _1431 = _1425;
    float _1433 = fma(_1415, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1417);
    float _1435 = _788 * _1195;
    float _1437 = -_1419;
    float _1439 = fma(_1437, _1413, 1.0);
    float _1441 = _1387 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1443 = _1387 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1445 = fma(_310, _1187, _1435);
    float _1447 = 1.0 / _1433;
    float _1449 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1441);
    float _1451 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1443);
    float _1453 = _1433;
    if (_1423)
    {
        float _1455 = float(_966);
        _1239 = _1455;
    }
    float _1457 = _1239;
    float _1459 = fma(_1403, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1449);
    float _1461 = fma(_1403, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1451);
    float _1463 = log2(_1439);
    if (!_1127)
    {
        float _1465 = -_1431;
        float _1467 = _936 + _1465;
        _1227 = _1467;
    }
    float _1469 = _1227;
    float _1471 = fma(_1415, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1459);
    float _1473 = fma(_316, _1341, _1445);
    float _1475 = fma(_1415, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1461);
    float _1477 = _1473 + _1349;
    float _1479 = _1435;
    float _1481 = _1349;
    float _1483 = _1475;
    if (_1423)
    {
        float _1485 = rint(_1457);
        float _1487 = precise::max(_1485, 0.0);
        uint _1489 = uint(_1487);
        uint _1491 = clamp(_1489, 0u, 65535u);
        _1479 = as_type<float>(_1491);
    }
    float _1493 = _1479;
    float _1495 = _1471 * _1447;
    float _1497 = _1475 * _1447;
    float _1499 = _1477 * _1245;
    if (!_1127)
    {
        float _1501 = -_1201;
        float _1503 = _856 + _1501;
        _1481 = _1503;
    }
    float _1505 = _1481;
    float _1507 = fma(_1495, 0.5, 0.5);
    float _1509 = _1477;
    float _1511 = _1507;
    if (!_1127)
    {
        float _1513 = rint(_1377);
        float _1515 = precise::max(_1513, 0.0);
        uint _1517 = uint(_1515);
        uint _1519 = clamp(_1517, 0u, 65535u);
        _1509 = as_type<float>(_1519);
    }
    float _1521 = _1509;
    float _1523 = _1463 * 0.693147182464599609375;
    float _1525 = fma(_1497, -0.5, 0.5);
    float _1527 = _1523 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1529 = _1201;
    float _1531 = _1523;
    float _1533 = _1525;
    if (_1423)
    {
        float3 _5102 = float3(_1357, _1397, float(as_type<int>(_1493)));
        float3 _5106 = select(_5102, float3(0.0), isnan(_5102));
        float _1535 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5106.xy, uint(rint(_5106.z)), _1499, level(0.0));
        _1529 = _1535;
    }
    float _1537 = _1529;
    float3 _5116 = float3(_1507, _1525, _1527);
    float _1539 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5116, float3(0.0), isnan(_5116)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5116, float3(0.0), isnan(_5116)), level(0.0)).x;
    float3 _5125 = float3(_1507, _1525, _1527);
    float4 _1542 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5125, float3(0.0), isnan(_5125)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5125, float3(0.0), isnan(_5125)), level(0.0)).xyzw;
    float _1544 = _1542.x;
    float _1546 = _1542.y;
    float _1548 = _1542.z;
    float _1550 = _1542.w;
    float _1552 = _1469;
    if (!_1127)
    {
        float3 _5148 = float3(_1505, _1469, float(as_type<int>(_1521)));
        float3 _5150 = select(_5148, float3(0.0), isnan(_5148));
        float _1554 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5150.xy, uint(rint(_5150.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5150.xy, uint(rint(_5150.z)), level(0.0)).x;
        _1552 = _1554;
    }
    float _1556 = _1552;
    if (_1127)
    {
        _1531 = 1.0;
    }
    float _1558 = _1531;
    float _1560 = _1558;
    if (!_1127)
    {
        int _1562 = _1175 << 4;
        int _1564 = _1562 + 2048;
        uint _1566 = uint(int(uint(_1564) >> uint(2)));
        uint _1568 = uint(int(uint(int(_1566)) >> uint(2)));
        int _1570 = int(_1566) & 3;
        float _1572 = (*spvDescriptorSet0.vp_c15)._m0[int(_1568)][_1570];
        int _1574 = int(_1566) + 1;
        uint _1576 = uint(int(uint(_1574) >> uint(2)));
        int _1578 = _1574 & 3;
        float _1580 = (*spvDescriptorSet0.vp_c15)._m0[int(_1576)][_1578];
        int _1582 = _1564 + 8;
        uint _1584 = uint(int(uint(_1582) >> uint(2)));
        uint _1586 = uint(int(uint(int(_1584)) >> uint(2)));
        int _1588 = int(_1584) & 3;
        float _1590 = (*spvDescriptorSet0.vp_c15)._m0[int(_1586)][_1588];
        int _1592 = int(_1584) + 1;
        uint _1594 = uint(int(uint(_1592) >> uint(2)));
        int _1596 = _1592 & 3;
        float _1598 = (*spvDescriptorSet0.vp_c15)._m0[int(_1594)][_1596];
        float _1600 = _788 * _1580;
        float _1602 = fma(_310, _1572, _1600);
        float _1604 = fma(_316, _1590, _1602);
        float _1606 = _1604 + _1598;
        float _1608 = precise::clamp(_1606, 0.0, 1.0);
        float _1610 = -_1608;
        float _1612 = _1610 + _1556;
        float _1614 = fma(_1612, 500.0, 1.5);
        float _1616 = exp2(_1614);
        float _1618 = 0.0 + _1616;
        float _1620 = precise::clamp(_1618, 0.0, 1.0);
        _1560 = _1620;
    }
    float _1622 = _1560;
    float _1624 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1626 = _1327 + _1624;
    float _1628 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1630 = _1329 + _1628;
    float _1632 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1634 = _1331 + _1632;
    float _1636 = _1626 * _1626;
    float _1638 = fma(_1630, _1630, _1636);
    float _1640 = fma(_1634, _1634, _1638);
    float _1642 = rsqrt(_1640);
    float _1644 = sqrt(_1640);
    float _1646 = _1642 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1648 = _1630 * _1646;
    float _1650 = _1634 * _1646;
    float _1652 = _1648 * _1648;
    float _1654 = _1650 * _1650;
    float _1656 = _1652 + _1654;
    float _1658 = sqrt(_1656);
    bool _1660 = _1658 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1662 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1664 = _1658 + _1662;
    float _1666 = _1642;
    float _1668 = _1664;
    float _1670 = _1626;
    bool _1672 = _1660;
    if (_1660)
    {
        float _1674 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1666 = _1674;
    }
    float _1676 = _1666;
    if (_1660)
    {
        float _1678 = rsqrt(_1656);
        _1511 = _1678;
    }
    float _1680 = _1511;
    float _1682 = _1680;
    if (_1660)
    {
        float _1684 = _1664 * _1676;
        _1668 = _1684;
    }
    float _1686 = _1668;
    if (_1660)
    {
        float _1688 = _1686 * 0.15915493667125701904296875;
        _1533 = _1688;
    }
    float _1690 = _1533;
    float _1692 = _1634;
    if (_1660)
    {
        float _1694 = _1690 * 6.283185482025146484375;
        float _1696 = sin(_1694);
        _1692 = _1696;
    }
    float _1698 = _1692;
    float _1700 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1702 = precise::max(0.0, _1700);
    float _1704 = _1676;
    float _1706 = _1702;
    if (_1660)
    {
        float _1708 = _1690 * 6.283185482025146484375;
        float _1710 = cos(_1708);
        _1704 = _1710;
    }
    float _1712 = _1704;
    float _1714 = -_1646;
    float _1716 = -_1702;
    float _1718 = fma(_1626, _1714, _1716);
    if (_1660)
    {
        float _1720 = _1718 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1670 = _1720;
    }
    float _1722 = _1670;
    float _1724 = _1722;
    float _1726 = _1698;
    if (_1660)
    {
        float _1728 = fma(_1698, _1722, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1724 = _1728;
    }
    float _1730 = _1724;
    float _1732 = _1730;
    if (!_1660)
    {
        _1726 = _1648;
    }
    float _1734 = _1726;
    float _1736 = _1734;
    float _1738 = _1712;
    if (_1660)
    {
        float _1740 = _1712 + (-1.0);
        _1706 = _1740;
    }
    float _1742 = _1706;
    float _1744 = _1742;
    if (_1660)
    {
        float _1746 = _1680 * _1730;
        _1169 = _1746;
    }
    float _1748 = _1169;
    if (!_1660)
    {
        _1732 = _1718;
    }
    float _1750 = _1732;
    float _1752 = _1750;
    if (_1660)
    {
        float _1754 = _1742 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1427 = _1754;
    }
    float _1756 = _1427;
    if (_1660)
    {
        float _1758 = _1648 * _1748;
        _1736 = _1758;
    }
    float _1760 = _1736;
    if (!_1660)
    {
        _1744 = _1650;
    }
    float _1762 = _1744;
    float _1764 = _1762;
    if (_1660)
    {
        float _1766 = _1650 * _1748;
        _1764 = _1766;
    }
    float _1768 = _1764;
    if (!_1660)
    {
        _1682 = _1652;
    }
    float _1770 = _1682;
    float _1772 = _1770;
    if (_1660)
    {
        float _1774 = fma(_1718, _1712, _1756);
        _1752 = _1774;
    }
    float _1776 = _1752;
    if (_1660)
    {
        float _1778 = _1760 * _1760;
        _1772 = _1778;
    }
    float _1780 = _1772;
    if (!_1660)
    {
        _1738 = _1654;
    }
    float _1782 = _1738;
    float _1784 = _1782;
    if (_1660)
    {
        float _1786 = _1768 * _1768;
        _1784 = _1786;
    }
    float _1788 = _1784;
    float _1790 = fma(_1776, _1776, _1780);
    float _1792 = _1790 + _1788;
    float _1794 = rsqrt(_1792);
    float _1796 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1798 = fma(_1644, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1796);
    float _1800 = precise::clamp(_1798, 0.0, 1.0);
    float _1802 = -_1800;
    float _1804 = _1802 + 1.0;
    float _1806 = abs(_1804);
    float _1808 = log2(_1806);
    float _1810 = _1794 * _1760;
    float _1812 = _1794 * _1776;
    float _1814 = _1794 * _1768;
    float _1816 = _1810 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1818 = -_1816;
    float _1820 = fma(_1812, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1818);
    float _1822 = _1808 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1824 = -_1814;
    float _1826 = fma(_1824, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1820);
    float _1828 = exp2(_1822);
    float _1830 = fma(_1826, -0.5, 0.5);
    float _1832 = fma(_1826, 0.5, 0.5);
    float _1834 = fma(_1832, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1836 = sqrt(_1830);
    float _1838 = fma(_1832, _1834, -0.212114393711090087890625);
    float _1840 = _1812 + 1.0;
    float _1842 = fma(_1832, _1838, 1.570728778839111328125);
    float _1844 = -_1812;
    float _1846 = fma(_1828, _1840, _1844);
    float _1848 = fma(_1846, 0.5, 0.5);
    float _1850 = _1836 * 0.636619746685028076171875;
    float _1852 = -_1842;
    float _1854 = fma(_1850, _1852, 1.0);
    float2 _5622 = float2(_1854, _1848);
    float3 _1858 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5622, float2(0.0), isnan(_5622)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5622, float2(0.0), isnan(_5622)), level(0.0)).xyz;
    float _1860 = _1858.x;
    float _1862 = _1858.y;
    float _1864 = _1858.z;
    float _1866 = in.m_71.x;
    float _1868 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1870 = _346 > 0.5;
    float _1872 = in.m_71.y;
    int _1874 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1876 = _1874 != 0;
    float _1878 = _1808 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1880 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1882 = _1880 != 0;
    float _1884 = in.m_65.w;
    bool _1886 = _334 > 0.5;
    float _1888 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1890 = -_332;
    float _1892 = _1890 + 1.0;
    out.m_73.x = _1329;
    out.m_73.y = _1327;
    out.m_73.z = _1331;
    int _1894 = as_type<int>(_1812);
    float _1896 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    float _1898 = _1868;
    if (_1876)
    {
        bool _1900 = _338 > 0.5;
        _1672 = _1900;
    }
    bool _1902 = _1672;
    float _1904 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1906 = _1866;
    if (_1876)
    {
        float _1908 = -_1866;
        float _1910 = _1908 + 1.0;
        _1894 = as_type<int>(_1910);
    }
    int _1912 = _1894;
    float _1914 = 0.0;
    if (!_1876)
    {
        _1914 = _1866;
    }
    float _1916 = _1914;
    float _1918 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1920 = -_1872;
    float _1922 = _1920 + 1.0;
    float _1924 = _1916;
    float _1926 = _1872;
    if (_1876)
    {
        float _1928 = _1902 ? as_type<float>(_1912) : _1866;
        _1924 = _1928;
    }
    float _1930 = _1924;
    int _1932 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1934 = _1932 != 0;
    int _1936 = _1870 ? as_type<int>(_1922) : as_type<int>(_1872);
    int _1938 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1940 = _1938 != 0;
    float _1942 = _1904 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1944 = _1884 > 0.5;
    float _1946 = exp2(_1878);
    float _1948 = in.m_75.x;
    float _1950 = in.m_75.y;
    float _1952 = in.m_75.z;
    float _1954 = _1934 ? as_type<float>(_1936) : _1872;
    float _1956 = _1868 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _1958 = _754 != 0.0;
    bool _1960 = isnan(_754);
    bool _1962 = _1958 || _1960;
    bool _1964 = isnan(0.0);
    bool _1966 = _1962 || _1964;
    float _1968 = fma(_1942, _1930, -0.5);
    int _1970 = _1944 ? as_type<int>(_1922) : as_type<int>(_1872);
    float _1972 = fma(_1956, _1954, -0.5);
    bool _1974 = _752 == 0.0;
    bool _1976 = !_1966;
    bool _1978 = _1974 && _1976;
    float _1980 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _1982 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1984 = _1982 != 0;
    float _1986 = _1918 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1988 = _1882 ? as_type<float>(_1970) : _1872;
    float _1990 = fma(_584, _1968, _386);
    int _1992 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1994 = _1992 != 0;
    bool _1996 = _756 == 0.0;
    bool _1998 = _1996 && _1978;
    float _2000 = fma(_1988, _1986, -0.5);
    if (_1940)
    {
        float _2002 = _1886 ? _1922 : _1872;
        _1926 = _2002;
    }
    float _2004 = _1926;
    float _2006 = _1888 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2008 = -_394;
    float _2010 = fma(_628, _1972, _2008);
    float _2012 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2014 = fma(_2006, _2004, -0.5);
    int _2016 = as_type<int>(_2006);
    if (_1984)
    {
        float _2018 = -_1866;
        float _2020 = _2018 + 1.0;
        _404 = as_type<int>(_2020);
    }
    int _2022 = _404;
    float _2024 = 0.0;
    if (!_1984)
    {
        _2024 = _1866;
    }
    float _2026 = _2024;
    float _2028 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2030 = _2026;
    if (_1994)
    {
        float _2032 = -_1866;
        float _2034 = _2032 + 1.0;
        _2016 = as_type<int>(_2034);
    }
    int _2036 = _2016;
    float _2038 = -_616;
    float _2040 = fma(_612, _2000, _2038);
    float _2042 = as_type<float>(_2036);
    if (_1998)
    {
        _1896 = _1948;
    }
    float _2044 = _1896;
    float _2046 = _2028 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2048 = 0.0;
    float _2050 = _2044;
    if (_1998)
    {
        _2048 = _1950;
    }
    float _2052 = _2048;
    float _2054 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2056 = _2052;
    if (_1984)
    {
        float _2058 = _1886 ? as_type<float>(_2022) : _1866;
        _2030 = _2058;
    }
    float _2060 = _2030;
    float _2062 = _2040 + 0.5;
    if (_1994)
    {
        float _2064 = _1870 ? as_type<float>(_2036) : _1866;
        _1906 = _2064;
    }
    float _2066 = _1906;
    float _2068 = _2054 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_1998)
    {
        _406 = _2044;
    }
    float _2070 = _406;
    float _2072 = -_1946;
    float _2074 = _2072 + 1.0;
    float _2076 = _2070;
    if (_1998)
    {
        _2042 = _2052;
    }
    float _2078 = _2042;
    float _2080 = _2078;
    if (!_1998)
    {
        _2050 = _1948;
    }
    float _2082 = _2050;
    float _2084 = _1980 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    if (!_1998)
    {
        _2056 = _1950;
    }
    float _2086 = _2056;
    float _2088 = _2012 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2090 = 0.0;
    if (_1998)
    {
        _2090 = _1952;
    }
    float _2092 = _2090;
    float _2094 = fma(_2084, _2060, -0.5);
    float _2096 = fma(_2088, _2066, -0.5);
    float _2098 = _2092;
    if (_1998)
    {
        _1898 = _2092;
    }
    float _2100 = _1898;
    float _2102 = fma(_496, _2094, _518);
    float _2104 = _2100;
    if (!_1998)
    {
        _2098 = _1952;
    }
    float _2106 = _2098;
    float _2108 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2110 = in.m_77.x;
    float _2112 = in.m_77.y;
    float _2114 = in.m_77.z;
    float _2116 = in.m_77.w;
    if (!_1998)
    {
        float _2118 = fma(_752, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2082);
        _2076 = _2118;
    }
    float _2120 = _2076;
    float _2122 = _2108 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (!_1998)
    {
        float _2124 = fma(_754, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2086);
        _2080 = _2124;
    }
    float _2126 = _2080;
    if (!_1998)
    {
        float _2128 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2106);
        _2104 = _2128;
    }
    float _2130 = _2104;
    float _2132 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2134 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2136 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    out.m_79.x = _2046;
    out.m_79.y = _2122;
    out.m_79.z = _2068;
    float _2138 = _2132 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2140 = _2134 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2142 = _2136 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2144 = -_2126;
    float _2146 = _848 * _2144;
    float _2148 = fma(_382, _2096, _500);
    float _2150 = in.m_81.x;
    float _2152 = fma(_864, _2120, _2146);
    float _2154 = _2074 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_83.x = _2138;
    out.m_83.y = _2140;
    out.m_83.z = _2142;
    float _2156 = fma(_866, _2130, _2152);
    float _2158 = _2114 * _2082;
    float _2160 = _2112 * _2106;
    float _2162 = _2110 * _2086;
    float _2164 = -_2158;
    float _2166 = fma(_2110, _2106, _2164);
    float _2168 = -_2160;
    float _2170 = fma(_2114, _2086, _2168);
    float _2172 = -_2162;
    float _2174 = fma(_2112, _2082, _2172);
    float _2176 = _2010 + 0.5;
    float _2178 = _2166 * _2116;
    float _2180 = _1990 + 0.5;
    float _2182 = _2102 + 0.5;
    float _2184 = -_560;
    float _2186 = fma(_658, _2014, _2184);
    float _2188 = _2170 * _2116;
    float _2190 = _2174 * _2116;
    float _2192 = -_2112;
    float _2194 = _848 * _2192;
    out.m_85.x = _2180;
    out.m_85.y = _2176;
    out.m_85.z = _2182;
    out.m_85.w = _2062;
    float _2196 = -_2178;
    float _2198 = _848 * _2196;
    float _2200 = _858 * _2126;
    float _2202 = fma(_864, _2110, _2194);
    float _2204 = _2148 + 0.5;
    float _2206 = fma(_864, _2188, _2198);
    float _2208 = _858 * _2112;
    float _2210 = _860 * _2112;
    float _2212 = fma(_878, _2120, _2200);
    float _2214 = _2186 + 0.5;
    float _2216 = fma(_878, _2110, _2208);
    float _2218 = fma(_872, _2110, _2210);
    float _2220 = fma(_866, _2190, _2206);
    float _2222 = fma(_866, _2114, _2202);
    float _2224 = abs(_914);
    float _2226 = log2(_2224);
    float _2228 = _860 * _2126;
    float _2230 = _858 * _2178;
    float _2232 = _860 * _2178;
    float _2234 = fma(_876, _2114, _2216);
    float _2236 = fma(_872, _2120, _2228);
    float _2238 = fma(_878, _2188, _2230);
    float _2240 = fma(_872, _2188, _2232);
    float _2242 = fma(_876, _2130, _2212);
    out.m_87.x = _2204;
    out.m_87.y = _2214;
    float _2244 = fma(_876, _2190, _2238);
    float _2246 = fma(_882, _2190, _2240);
    float _2248 = _2242 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2250 = _2242 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2252 = _2234 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2254 = fma(_882, _2114, _2218);
    float _2256 = _2226 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2258 = _2234 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2260 = fma(_2156, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2248);
    float _2262 = _2242 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2264 = exp2(_2256);
    float _2266 = _2234 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2268 = fma(_2156, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2250);
    float _2270 = fma(_2156, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2262);
    float _2272 = fma(_2222, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2252);
    float _2274 = fma(_2222, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2266);
    float _2276 = fma(_2222, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2258);
    float _2278 = _2244 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2280 = _2244 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2282 = _2244 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2284 = _1387 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2286 = fma(_2220, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2278);
    float _2288 = fma(_2220, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2280);
    float _2290 = fma(_2220, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2282);
    float _2292 = fma(_2254, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2272);
    float _2294 = fma(_2264, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2296 = precise::clamp(_2294, 0.0, 1.0);
    float _2298 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2284);
    float _2300 = fma(_2254, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2274);
    float _2302 = fma(_2254, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2276);
    float _2304 = fma(_2246, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2286);
    float _2306 = fma(_2246, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2288);
    float _2308 = fma(_2246, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2290);
    float _2310 = fma(_2296, -2.0, 3.0);
    float _2312 = _2296 * _2296;
    float _2314 = fma(_882, _2130, _2236);
    float _2316 = fma(_1403, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2298);
    out.m_89.x = _2292;
    out.m_89.y = _2300;
    out.m_89.z = _2302;
    float _2318 = _2312 * _2310;
    float _2320 = fma(_2314, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2260);
    bool _2322 = _914 <= 8000.0;
    bool _2324 = isnan(_914);
    bool _2326 = _2322 || _2324;
    bool _2328 = isnan(8000.0);
    bool _2330 = _2326 || _2328;
    float _2332 = float(_2330);
    float _2334 = fma(_1415, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2316);
    float _2336 = -_2318;
    float _2338 = _2336 + 1.0;
    float _2340 = in.m_81.y;
    float _2342 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _2344 = _2334 + _2342;
    float _2346 = fma(_2314, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2270);
    float _2348 = in.m_81.z;
    float _2350 = fma(_2314, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2268);
    float _2352 = fma(_2338, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2318);
    float _2354 = _1433 + _2344;
    float _2356 = in.m_81.w;
    float _2358 = _2332 * _2352;
    float _2360 = _2352;
    float _2362 = _2344;
    if (!_1423)
    {
        _2360 = 1.0;
    }
    float _2364 = _2360;
    float _2366 = _2354 * 0.5;
    float _2368 = _2364;
    if (_1423)
    {
        bool _2370 = _1537 >= _1499;
        bool _2372 = isnan(_1537);
        bool _2374 = _2370 || _2372;
        bool _2376 = isnan(_1499);
        bool _2378 = _2374 || _2376;
        float _2380 = float(_2378);
        _2368 = _2380;
    }
    float _2382 = _2368;
    float _2384 = _2358 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.gl_Position.x = _1471;
    out.gl_Position.y = _1475;
    out.gl_Position.z = _2344;
    out.gl_Position.w = _1433;
    float _2386 = _2154 * _1539;
    float _2388 = -_2154;
    float _2390 = _2388 + 1.0;
    float _2392 = _1892 * _2384;
    float _2394 = precise::clamp(_2392, 0.0, 1.0);
    float _2396 = _2382 * _1622;
    out.m_91.x = _2306;
    out.m_91.y = _2304;
    out.m_91.z = _2308;
    float _2398 = _1550 * _2390;
    bool _2400 = _1644 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2402 = isnan(_1644);
    bool _2404 = _2400 || _2402;
    bool _2406 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2408 = _2404 || _2406;
    out.m_93.z = _2366;
    out.m_93.w = _1433;
    out.m_95.x = _2150;
    float _2410 = -_2394;
    float _2412 = fma(_2410, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2414 = _1550 * _2386;
    float _2416 = -_2396;
    float _2418 = fma(_2416, _2412, 1.0);
    float _2420 = precise::clamp(_2418, 0.0, 1.0);
    out.m_95.y = _2340;
    float _2422 = _2396;
    float _2424 = _2420;
    float _2426 = _2386;
    if (!_2408)
    {
        _2422 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2428 = _2422;
    float _2430 = _2420 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_95.z = _2348;
    float _2432 = _2428;
    float _2434 = _2428;
    if (!_2408)
    {
        _1453 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2436 = _1453;
    float _2438 = _2436;
    float _2440 = _2436;
    if (!_2408)
    {
        _2362 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2442 = _2362;
    out.m_95.w = _2356;
    float _2444 = _2442;
    float _2446 = _2442;
    if (!_2408)
    {
        _1483 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2448 = _1483;
    float _2450 = _2448;
    float _2452 = _2448;
    if (!_2408)
    {
        _2424 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2454 = _2424;
    out.m_97.x = _2430;
    out.m_99.x = _2320;
    out.m_99.y = _2346;
    out.m_99.z = _2350;
    float _2456 = _1864 * _2386;
    float _2458 = fma(_1860, _2414, _1544);
    float _2460 = fma(_1862, _2414, _1546);
    float _2462 = _2454;
    float _2464 = _2454;
    if (!_2408)
    {
        _2426 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2466 = _2426;
    float _2468 = fma(_1550, _2456, _1548);
    out.m_101.x = _2458;
    out.m_101.y = _2460;
    out.m_101.z = _2468;
    out.m_101.w = _2398;
    bool _2470 = !_2408;
    float _2472 = _2466;
    float _2474 = _2466;
    if (!_2470)
    {
        bool _2476 = _1644 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2478 = isnan(_1644);
        bool _2480 = _2476 || _2478;
        bool _2482 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2484 = _2480 || _2482;
        if (!_2484)
        {
            float _2486 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2488 = _1644 + _2486;
            float _2490 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2492 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2490;
            float _2494 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2496 = _2494 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2498 = 1.0 / _2492;
            float _2500 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2502 = _2500 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2504 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2506 = _2504 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2508 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2510 = _2508 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2512 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2514 = _2512 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2516 = _2488 * _2498;
            float _2518 = precise::clamp(_2516, 0.0, 1.0);
            float _2520 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2522 = _2520 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2524 = fma(_2518, _2496, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2526 = fma(_2518, _2522, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2528 = fma(_2518, _2502, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2530 = fma(_2518, _2506, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2532 = fma(_2518, _2510, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2534 = fma(_2518, _2514, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2474 = _2528;
            _2452 = _2532;
            _2434 = _2524;
            _2446 = _2530;
            _2440 = _2526;
            _2464 = _2534;
            _2536 = true;
        }
        else
        {
            bool _2538 = _1644 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2540 = isnan(_1644);
            bool _2542 = _2538 || _2540;
            bool _2544 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2546 = _2542 || _2544;
            if (!_2546)
            {
                _2432 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2548 = _2432;
            _2434 = _2548;
            if (!_2546)
            {
                _2472 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2550 = _2472;
            _2474 = _2550;
            if (!_2546)
            {
                _2438 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2552 = _2438;
            _2440 = _2552;
            if (!_2546)
            {
                _2444 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2554 = _2444;
            _2446 = _2554;
            if (!_2546)
            {
                _2450 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2556 = _2450;
            _2452 = _2556;
            if (!_2546)
            {
                _2462 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2558 = _2462;
            bool _2560 = !_2546;
            _2464 = _2558;
            if (!_2560)
            {
                bool _2562 = _1644 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2564 = isnan(_1644);
                bool _2566 = _2562 || _2564;
                bool _2568 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2570 = _2566 || _2568;
                if (!_2570)
                {
                    float _2572 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2574 = _1644 + _2572;
                    float _2576 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2578 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2576;
                    float _2580 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2582 = _2580 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2584 = 1.0 / _2578;
                    float _2586 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2588 = _2586 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2590 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2592 = _2590 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2594 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2596 = _2594 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2598 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2600 = _2598 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2602 = _2574 * _2584;
                    float _2604 = precise::clamp(_2602, 0.0, 1.0);
                    float _2606 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2608 = _2606 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2610 = fma(_2604, _2582, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2612 = fma(_2604, _2608, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2614 = fma(_2604, _2588, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2616 = fma(_2604, _2592, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2618 = fma(_2604, _2596, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2620 = fma(_2604, _2600, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2474 = _2614;
                    _2452 = _2618;
                    _2434 = _2610;
                    _2446 = _2616;
                    _2440 = _2612;
                    _2464 = _2620;
                    _2536 = true;
                }
                else
                {
                    _2474 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2452 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2434 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2446 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2440 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2464 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2536 = false;
    float _2622 = _2474;
    float _2624 = _2452;
    float _2626 = _2434;
    float _2628 = _2446;
    float _2630 = _2440;
    float _2632 = _2464;
    float _2634 = fma(_2346, -0.5, 0.5);
    float _2636 = precise::clamp(_2634, 0.0, 1.0);
    float _2638 = -_2622;
    float _2640 = _2638 + _2624;
    float _2642 = -_2626;
    float _2644 = _2642 + _2628;
    float _2646 = -_2630;
    float _2648 = _2646 + _2632;
    bool _2650 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2652 = fma(_2636, _2640, _2622);
    float _2654 = fma(_2636, _2644, _2626);
    float _2656 = fma(_2636, _2648, _2630);
    float _2658 = _2652 * 0.586610972881317138671875;
    out.m_59.x = 1.0;
    float _2660 = fma(_2654, 0.298911988735198974609375, _2658);
    out.m_97.w = (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2662 = fma(_2656, 0.114477999508380889892578125, _2660);
    out.m_103.x = 0.0;
    float _2664 = -_2662;
    float _2666 = _2654 + _2664;
    float _2668 = -_2662;
    float _2670 = _2652 + _2668;
    float _2672 = -_2662;
    float _2674 = _2656 + _2672;
    float _2676 = fma(_2666, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2662);
    float _2678 = fma(_2670, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2662);
    float _2680 = fma(_2674, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2662);
    out.m_105.x = _2676;
    out.m_105.y = _2678;
    out.m_105.z = _2680;
    if (!_2650)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2682 = -_1327;
    float _2684 = _2682 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2686 = -_1329;
    float _2688 = _2686 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2690 = -_1331;
    float _2692 = _2690 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2694 = _2684 * _2684;
    float _2696 = fma(_2688, _2688, _2694);
    float _2698 = fma(_2692, _2692, _2696);
    float _2700 = sqrt(_2698);
    float _2702 = rsqrt(_2698);
    float _2704 = -_2700;
    float _2706 = _2704 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2708 = _2706 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2710 = precise::clamp(_2708, 0.0, 1.0);
    float _2712 = _2688 * _2702;
    float _2714 = _2684 * _2702;
    float _2716 = abs(_2710);
    float _2718 = log2(_2716);
    float _2720 = _2692 * _2702;
    float _2722 = _2712 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2724 = _2346 * _2714;
    float _2726 = -_2714;
    float _2728 = -_2722;
    float _2730 = fma(_2726, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2728);
    float _2732 = fma(_2320, _2712, _2724);
    float _2734 = -_2720;
    float _2736 = fma(_2734, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2730);
    float _2738 = fma(_2350, _2720, _2732);
    float _2740 = precise::clamp(_2738, 0.0, 1.0);
    float _2742 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2744 = _2736 + _2742;
    float _2746 = _2718 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2748 = _2744 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2750 = precise::clamp(_2748, 0.0, 1.0);
    float _2752 = exp2(_2746);
    float _2754 = _2752 * _2750;
    float _2756 = _2740 * _2754;
    float _2758 = _2756 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2760 = _2756 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2762 = _2756 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_103.x = _2758;
    out.m_103.y = _2760;
    out.m_103.z = _2762;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

