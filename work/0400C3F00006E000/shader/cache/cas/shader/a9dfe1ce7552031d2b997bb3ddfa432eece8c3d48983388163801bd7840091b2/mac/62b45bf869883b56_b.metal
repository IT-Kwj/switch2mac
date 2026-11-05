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
    texture2d<float> vp_t_tcb_28 [[id(6)]];
    sampler vp_t_tcb_28Smplr [[id(7)]];
    texture2d_array<float> vp_t_tcb_14 [[id(8)]];
    sampler vp_t_tcb_14Smplr [[id(9)]];
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
    sampler vp_t_tcb_28Smplr_w [[id(20)]];
    sampler vp_t_tcb_14Smplr_w [[id(21)]];
    sampler vp_t_tcb_24Smplr_w [[id(22)]];
    sampler vp_t_tcb_32Smplr_w [[id(23)]];
    sampler vp_t_tcb_30Smplr_w [[id(24)]];
    sampler vp_t_tcb_1CSmplr_w [[id(25)]];
    constant dm_border_t* dm_border [[id(26)]];
};

struct main0_out
{
    float4 m_73 [[user(locn0)]];
    float4 m_105 [[user(locn1)]];
    float4 m_63 [[user(locn2)]];
    float4 m_87 [[user(locn3)]];
    float4 m_97 [[user(locn4)]];
    float4 m_65 [[user(locn5)]];
    float4 m_69 [[user(locn6)]];
    float4 m_85 [[user(locn7)]];
    float4 m_75 [[user(locn8)]];
    float4 m_95 [[user(locn9)]];
    float4 m_103 [[user(locn10)]];
    float4 m_101 [[user(locn11)]];
    float4 m_99 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_81 [[attribute(0)]];
    float4 m_77 [[attribute(1)]];
    float4 m_79 [[attribute(3)]];
    float4 m_58 [[attribute(5)]];
    float4 m_60 [[attribute(6)]];
    float4 m_93 [[attribute(7)]];
    float4 m_89 [[attribute(8)]];
    float4 m_67 [[attribute(9)]];
    float4 m_91 [[attribute(10)]];
    float4 m_71 [[attribute(12)]];
    float4 m_83 [[attribute(13)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2550 = false;
    bool _298 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _119 = in.m_58.w;
    float _121 = in.m_60.w;
    float _123 = trunc(_119);
    int _126 = int(_123);
    float _128 = -_121;
    float _130 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_63.y = _130;
    bool _134 = _126 >= 1;
    float _136 = 0.0;
    float _138 = as_type<float>(_126);
    if (!_134)
    {
        _136 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _136;
    if (!_134)
    {
        out.m_65.x = 0.0;
    }
    int _142 = 0;
    if (!_134)
    {
        float _144 = _140 * 5.0;
        _142 = as_type<int>(_144);
    }
    int _146 = _142;
    int _148 = _146;
    if (!_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2860 = as_type<float>(_146);
        out.gl_Position.z = _2860;
    }
    if (!_134)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _150 = _121 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _152 = isnan(_121);
    bool _154 = _150 || _152;
    bool _156 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _158 = _154 || _156;
    float _160 = in.m_67.y;
    float _162 = float(_126);
    bool _164 = _130 >= _162;
    bool _166 = !_158;
    bool _168 = _164 || _166;
    if (_168)
    {
        _138 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _170 = _138;
    if (_168)
    {
        out.m_65.x = 0.0;
    }
    if (_168)
    {
        float _172 = _170 * 5.0;
        _148 = as_type<int>(_172);
    }
    int _174 = _148;
    out.m_69.y = _160;
    if (_168)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2919 = as_type<float>(_174);
        out.gl_Position.z = _2919;
    }
    if (_168)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _176 = in.m_67.x;
    float _178 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _180 = _130 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _182 = in.m_71.x;
    int _184 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _186 = _184 != 0;
    float _188 = in.m_71.y;
    float _190 = 1.0 / _162;
    int _192 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _194 = _192 != 0;
    int _196 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _198 = _196 != 0;
    float _200 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _202 = _180 * _178;
    out.m_73.w = _200;
    bool _204 = !_198;
    int _206 = _204 ? 0 : 1;
    float _208 = fma(_176, (*spvDescriptorSet0.vp_c9)._m0[20].x, _202);
    int _210 = abs(_206);
    float _212 = _130 * _190;
    float _214 = floor(_208);
    float _216 = _208 * 6.283185482025146484375;
    out.m_75.x = _182;
    float _218 = float(_210);
    float _220 = _216 * 0.15915493667125701904296875;
    out.m_75.y = _188;
    float _222 = -_214;
    float _224 = _208 + _222;
    bool _226 = !_194;
    int _228 = _226 ? 0 : 1;
    float _230 = _220 * 6.283185482025146484375;
    float _232 = cos(_230);
    float _234 = -_224;
    float _236 = fma(_234, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _238 = abs(_228);
    bool _240 = !_186;
    int _242 = _240 ? 0 : 1;
    bool _244 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    int _246 = abs(_242);
    float _248 = float(_238);
    bool _250 = _224 < 0.5;
    float _252 = float(_250);
    float _254 = fma(_232, 0.5, 0.5);
    float _256 = abs(_236);
    float _258 = _248 * _256;
    float _260 = float(_246);
    float _262 = -_252;
    float _264 = fma(_262, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _266 = -_254;
    float _268 = fma(_266, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _270 = fma(_260, _268, _258);
    float _272 = abs(_264);
    float _274 = fma(_218, _272, _270);
    bool _276 = !_244;
    float _278 = _188;
    float _280 = _182;
    float _296;
    if (!_276)
    {
        float _282 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _284 = _176 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _286 = fma(_284, (*spvDescriptorSet0.vp_c9)._m0[14].x, _130);
        float _288 = _286 * _282;
        float _290 = floor(_288);
        float _292 = -_290;
        float _294 = _288 + _292;
        _296 = _294;
        _298 = true;
    }
    else
    {
        _296 = _212;
    }
    _298 = false;
    float _300 = _296;
    float _302 = in.m_58.x;
    float _304 = in.m_58.y;
    float _306 = in.m_58.z;
    float _308 = in.m_77.x;
    float _310 = in.m_77.y;
    float _312 = in.m_77.z;
    float _314 = in.m_77.w;
    int _316 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _318 = _316 != 0;
    int _320 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _322 = _320 != 0;
    float _324 = in.m_79.x;
    float _326 = in.m_79.y;
    float _328 = in.m_79.z;
    float _330 = in.m_79.w;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _334 = _332 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _336 = in.m_81.y;
    float _338 = 1.0 / _334;
    bool _340 = _160 > 0.5;
    float _342 = in.m_83.x;
    float _344 = _304 * _310;
    float _346 = fma(_302, _308, _344);
    float _348 = _304 * _326;
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _352 = _350 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _354 = _304 + _336;
    float _356 = fma(_302, _324, _348);
    float _358 = -_188;
    float _360 = _358 + 1.0;
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _364 = _362 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _366 = in.m_67.z;
    float _368 = in.m_67.w;
    float _370 = fma(_306, _328, _356);
    float _372 = 1.0 / _352;
    float _374 = fma(_306, _312, _346);
    float _376 = _354;
    if (_322)
    {
        float _378 = _340 ? _360 : _188;
        _278 = _378;
    }
    float _380 = _278;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _384 = _382 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _386 = _160 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _388 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _390 = 1.0 / _384;
    float _392 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _394 = _176 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _396 = fma(_386, -2.0, _392);
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _400 = _398 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _402 = 1.0 / _364;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _406 = _404 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _408 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _410 = _176 > 0.5;
    bool _412 = _410 && _318;
    float _414 = _374 + _314;
    float _416 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[79].z, _388);
    float _418 = -_408;
    float _420 = fma(_394, 2.0, _418);
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _424 = _422 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _426 = 1.0 / _400;
    float _428 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[79].x, _416);
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _432 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _430;
    float _434 = _424 * _372;
    float _436 = _428 * (-0.15915493667125701904296875);
    float _438 = _432 * _338;
    float _440 = 1.0 / _406;
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _444 = _442 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _448 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _446;
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _452 = _300 + _450;
    float _454 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _456 = _448 * _402;
    float _458 = _370 + _330;
    float _460 = 1.0 / _444;
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _464 = _462 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _468 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _466;
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _472 = _300 + _470;
    float _474 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _476 = _474 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _478 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[76].y, _396);
    float _480 = -_130;
    float _482 = fma(_480, (*spvDescriptorSet0.vp_c9)._m0[76].x, _420);
    float _484 = fma(_434, _472, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _486 = _436 * 6.283185482025146484375;
    float _488 = sin(_486);
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _492 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _490;
    float _494 = (*spvDescriptorSet0.vp_c9)._m0[166].x;
    float _496 = _414;
    if (!_318)
    {
        _494 = _182;
    }
    float _498 = _494;
    float _500 = _498;
    if (_412)
    {
        float _502 = -_182;
        float _504 = _502 + 1.0;
        _280 = _504;
    }
    float _506 = _280;
    float _508 = _464 * _440;
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _512 = _300 + _510;
    float _514 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _516 = _458 + _514;
    float _518 = _476 * _390;
    if (_318)
    {
        _500 = _506;
    }
    float _520 = _500;
    float _522 = _436 * 6.283185482025146484375;
    float _524 = cos(_522);
    float _526 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _528 = _354 + _526;
    float _530 = _492 * _460;
    float _532 = fma(_438, _512, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _534 = fma(_520, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _536 = _528 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _538 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _540 = _414 + _538;
    float _542 = fma(_456, _452, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _544 = _488 * _454;
    float _546 = fma(_540, (*spvDescriptorSet0.vp_c8)._m0[28].x, _536);
    out.m_85.x = _342;
    float _548 = _468 * _426;
    float _550 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _552 = fma(_516, (*spvDescriptorSet0.vp_c8)._m0[28].z, _546);
    float _554 = _524 * _454;
    float _556 = -_544;
    float _558 = fma(_524, _534, _556);
    bool _560 = _552 >= 0.0;
    float _562 = _528 * _528;
    float _564 = fma(_488, _534, _554);
    float _566 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _568 = fma(_176, (*spvDescriptorSet0.vp_c9)._m0[78].z, _550);
    float _570 = fma(_540, _540, _562);
    float _572 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _574 = _300 + _572;
    float _576 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[78].w, _566);
    float _578 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[77].z, _568);
    float _580 = fma(_516, _516, _570);
    float _582 = fma(_518, _574, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _584 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[77].w, _576);
    float _586 = fma(_578, _558, _482);
    bool _588 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _590 = isnan(_300);
    bool _592 = _588 || _590;
    bool _594 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _596 = _592 || _594;
    float _598 = float(_596);
    float _600 = _342 * 12.98980045318603515625;
    float _602 = rsqrt(_580);
    float _604 = -_478;
    float _606 = fma(_584, _564, _604);
    float _608 = _584;
    if (_560)
    {
        _608 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _610 = _608;
    float _612 = _586 + 0.5;
    bool _614 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _616 = isnan(_300);
    bool _618 = _614 || _616;
    bool _620 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _622 = _618 || _620;
    float _624 = float(_622);
    float _626 = _606 + 0.5;
    float _628 = -_598;
    float _630 = _628 + 1.0;
    int _632 = as_type<int>(_610);
    if (_560)
    {
        float _634 = _610 * 5.0;
        _632 = as_type<int>(_634);
    }
    int _636 = _632;
    if (_560)
    {
        out.m_65.x = 0.0;
    }
    float _638 = fma(_368, 78.233001708984375, _600);
    float _640 = fma(_366, 78.233001708984375, _600);
    float _642 = _624 * _630;
    out.m_87.x = _612;
    out.m_87.y = _626;
    bool _644 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _646 = isnan(_300);
    bool _648 = _644 || _646;
    bool _650 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _652 = _648 || _650;
    float _654 = float(_652);
    float _656 = -_624;
    float _658 = _656 + 1.0;
    bool _660 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _662 = isnan(_300);
    bool _664 = _660 || _662;
    bool _666 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _668 = _664 || _666;
    float _670 = float(_668);
    if (_560)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3719 = as_type<float>(_636);
        out.gl_Position.z = _3719;
    }
    float _672 = _528 * _602;
    float _674 = _540 * _602;
    if (_560)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _676 = -_672;
    float _678 = fma(_676, (*spvDescriptorSet0.vp_c9)._m0[18].w, _354);
    float _680 = _640 * 0.15915493667125701904296875;
    float _682 = _516 * _602;
    float _684 = -_674;
    float _686 = fma(_684, (*spvDescriptorSet0.vp_c9)._m0[18].w, _414);
    float _688 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _690 = _678 + _688;
    float _692 = fma(_176, 78.233001708984375, _600);
    float _694 = -_682;
    float _696 = fma(_694, (*spvDescriptorSet0.vp_c9)._m0[18].w, _458);
    float _698 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _700 = _686 + _698;
    float _702 = _690 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _704 = _680 * 6.283185482025146484375;
    float _706 = sin(_704);
    float _708 = _638 * 0.15915493667125701904296875;
    float _710 = _670 * _658;
    float _712 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _714 = _696 + _712;
    float _716 = fma(_700, (*spvDescriptorSet0.vp_c8)._m0[28].x, _702);
    float _718 = _692 * 0.15915493667125701904296875;
    float _720 = -_670;
    float _722 = _720 + 1.0;
    bool _724 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _726 = isnan(_300);
    bool _728 = _724 || _726;
    bool _730 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _732 = _728 || _730;
    float _734 = float(_732);
    float _736 = fma(_714, (*spvDescriptorSet0.vp_c8)._m0[28].z, _716);
    float _738 = _708 * 6.283185482025146484375;
    float _740 = sin(_738);
    float _742 = _654 * _722;
    float _744 = -_654;
    float _746 = _744 + 1.0;
    float _748 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _750 = _300 + _748;
    bool _752 = _736 >= 0.0;
    float _754 = -_734;
    float _756 = _754 + 1.0;
    float _758 = _734 * _746;
    bool _760 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _762 = isnan(_300);
    bool _764 = _760 || _762;
    bool _766 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _768 = _764 || _766;
    float _770 = float(_768);
    float _772 = _718 * 6.283185482025146484375;
    float _774 = sin(_772);
    float _776 = _706 * 43758.546875;
    float _778 = fma(_548, _750, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    bool _780 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _782 = isnan(_300);
    bool _784 = _780 || _782;
    bool _786 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _788 = _784 || _786;
    float _790 = float(_788);
    float _792 = -_770;
    float _794 = _792 + 1.0;
    bool _796 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _798 = isnan(_300);
    bool _800 = _796 || _798;
    bool _802 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _804 = _800 || _802;
    float _806 = float(_804);
    float _808 = _790 * _794;
    float _810 = floor(_776);
    float _812 = _740 * 43758.546875;
    float _814 = _806 * _756;
    float _816 = -_806;
    float _818 = _816 + 1.0;
    float _820 = _806;
    float _822 = _700;
    if (_752)
    {
        _820 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _824 = _820;
    float _826 = _532 * _808;
    float _828 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _830 = _300 + _828;
    float _832 = _774 * 43758.546875;
    float _834 = floor(_812);
    float _836 = _770 * _818;
    int _838 = as_type<int>(_824);
    if (_752)
    {
        float _840 = _824 * 5.0;
        _838 = as_type<int>(_840);
    }
    int _842 = _838;
    if (_752)
    {
        out.m_65.x = 0.0;
    }
    float _844 = fma(_508, _830, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _846 = floor(_832);
    if (_752)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3982 = as_type<float>(_842);
        out.gl_Position.z = _3982;
    }
    float _848 = -_810;
    float _850 = _776 + _848;
    if (_752)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _852 = -_354;
    float _854 = _852 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _856 = -_790;
    float _858 = _856 + 1.0;
    float _860 = -_414;
    float _862 = _860 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _864 = -_672;
    float _866 = fma(_864, (*spvDescriptorSet0.vp_c9)._m0[18].w, _528);
    float _868 = _854 * _854;
    float _870 = fma(_850, -0.12000000476837158203125, 0.4000000059604644775390625);
    float _872 = -_458;
    float _874 = _872 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _876 = -_674;
    float _878 = fma(_876, (*spvDescriptorSet0.vp_c9)._m0[18].w, _540);
    float _880 = fma(_862, _862, _868);
    float _882 = _866 * _866;
    float _884 = fma(_858, (*spvDescriptorSet0.vp_c9)._m0[159].x, _826);
    float _886 = -_834;
    float _888 = _812 + _886;
    float _890 = fma(_874, _874, _880);
    float _892 = fma(_878, _878, _882);
    float _894 = -_682;
    float _896 = fma(_894, (*spvDescriptorSet0.vp_c9)._m0[18].w, _516);
    float _898 = fma(_484, _836, _884);
    float _900 = rsqrt(_890);
    float _902 = _888 * 0.60000002384185791015625;
    float _904 = fma(_896, _896, _892);
    float _906 = fma(_542, _814, _898);
    float _908 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _910 = _300 + _908;
    float _912 = fma(_160, 78.233001708984375, _600);
    float _914 = precise::max(_212, _902);
    float _916 = fma(_582, _758, _906);
    float _918 = 1.0 / _870;
    float _920 = fma(_530, _910, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _922 = _912 * 0.15915493667125701904296875;
    float _924 = fma(_778, _742, _916);
    float _926 = in.m_89.x;
    float _928 = in.m_89.y;
    float _930 = in.m_89.z;
    float _932 = -_846;
    float _934 = _832 + _932;
    float _936 = fma(_844, _710, _924);
    float _938 = sqrt(_904);
    float _940 = _902 + _870;
    float _942 = _874 * _900;
    float _944 = _854 * _900;
    float _946 = fma(_920, _642, _936);
    float _948 = precise::min(_940, _914);
    float _950 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _952 = _942 * _950;
    float _954 = _922 * 6.283185482025146484375;
    float _956 = sin(_954);
    float _958 = _862 * _900;
    float _960 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _962 = _944 * _960;
    float _964 = -_902;
    float _966 = _964 + _948;
    float _968 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _970 = -_952;
    float _972 = fma(_944, _968, _970);
    float _974 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _976 = _958 * _974;
    float _978 = in.m_91.x;
    float _980 = in.m_91.y;
    float _982 = in.m_91.z;
    float _984 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _986 = -_962;
    float _988 = fma(_958, _984, _986);
    float _990 = _966 * _918;
    float _992 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _994 = -_976;
    float _996 = fma(_942, _992, _994);
    float _998 = _602 * _938;
    float _1000 = fma(_598, (*spvDescriptorSet0.vp_c9)._m0[166].x, _946);
    float _1002 = fma(_990, 2.0, -1.0);
    float _1004 = _996 * _996;
    float _1006 = fma(_934, 2.0, -1.0);
    float _1008 = -_1002;
    float _1010 = fma(_1008, _1002, 1.0);
    float _1012 = precise::clamp(_1010, 0.0, 1.0);
    float _1014 = fma(_972, _972, _1004);
    float _1016 = _956 * 43758.546875;
    float _1018 = _934 * _1012;
    float _1020 = fma(_988, _988, _1014);
    float _1022 = floor(_1016);
    float _1024 = _1018 * _926;
    float _1026 = _1018 * _928;
    float _1028 = _1018 * _930;
    float _1030 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1026);
    float _1032 = rsqrt(_1020);
    float _1034 = _980 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1036 = _978 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1038 = _982 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _1040 = fma(_850, 0.4000000059604644775390625, 0.100000001490116119384765625);
    float _1042 = _274 * _1034;
    float _1044 = _274 * _1036;
    float _1046 = _274 * _1038;
    float _1048 = _130 * _1040;
    float _1050 = _1042 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1052 = _1044 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1054 = -_1022;
    float _1056 = _1016 + _1054;
    float _1058 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1024);
    float _1060 = _998 * _1050;
    float _1062 = _998 * _1052;
    float _1064 = _1046 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1066 = _972 * _1032;
    float _1068 = _996 * _1032;
    float _1070 = _1030 * _1060;
    float _1072 = _988 * _1032;
    float _1074 = _944 * _1066;
    float _1076 = fma(_1056, 6.283185482025146484375, _1048);
    float _1078 = _942 * _1068;
    float _1080 = _1058 * _1062;
    float _1082 = -_1074;
    float _1084 = fma(_958, _1068, _1082);
    float _1086 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1028);
    float _1088 = _998 * _1064;
    float _1090 = fma(_934, 6.283185482025146484375, _1048);
    float _1092 = _1076 * 0.15915493667125701904296875;
    float _1094 = -_1078;
    float _1096 = fma(_944, _1072, _1094);
    float _1098 = _1070 * _1084;
    float _1100 = _1086 * _1088;
    float _1102 = _1092 * 6.283185482025146484375;
    float _1104 = sin(_1102);
    float _1106 = _1090 * 0.15915493667125701904296875;
    float _1108 = _1070 * _1096;
    float _1110 = fma(_1080, _1072, _1098);
    float _1112 = _958 * _1072;
    float _1114 = fma(_1080, _1066, _1108);
    float _1116 = fma(_1100, _942, _1110);
    float _1118 = _1106 * 6.283185482025146484375;
    float _1120 = sin(_1118);
    float _1122 = fma(_850, 2.0, -1.0);
    float _1124 = fma(_1100, _958, _1114);
    float _1126 = _458 + _1116;
    float _1128 = -_1112;
    float _1130 = fma(_942, _1066, _1128);
    float _1132 = _414 + _1124;
    float _1134 = fma(_1000, _1122, _1126);
    float _1136 = fma(_1000, _1006, _1132);
    float _1138 = fma(_1104, 0.02500000037252902984619140625, _1134);
    float _1140 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1142 = _1138 + _1140;
    float _1144 = fma(_1120, 0.02500000037252902984619140625, _1136);
    float _1146 = _1142 * _1142;
    float _1148 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1150 = _1144 + _1148;
    float _1152 = fma(_1150, _1150, _1146);
    float _1154 = _1070 * _1130;
    float _1156 = sqrt(_1152);
    float _1158 = fma(_1080, _1068, _1154);
    float _1160 = fma(_1100, _944, _1158);
    float _1162 = _354 + _1160;
    bool _1164 = _1156 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _1166 = !_1164;
    float _1168 = _1144;
    float _1170 = _1138;
    float _1172 = _1162;
    float _1174 = _868;
    if (!_1166)
    {
        float _1176 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1178 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1180 = _1156 + _1178;
        float _1182 = rsqrt(_1152);
        float _1184 = _1180 * _1176;
        float _1186 = _1162 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1188 = _1184 * 0.15915493667125701904296875;
        float _1190 = _1188 * 6.283185482025146484375;
        float _1192 = cos(_1190);
        float _1194 = _1188 * 6.283185482025146484375;
        float _1196 = sin(_1194);
        float _1198 = _1192 + (-1.0);
        float _1200 = fma(_1196, _1186, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1202 = _1198 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1204 = _1182 * _1200;
        float _1206 = fma(_1162, _1192, _1202);
        float _1208 = fma(_1150, _1204, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1210 = fma(_1142, _1204, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1168 = _1208;
        _1170 = _1210;
        _1172 = _1206;
    }
    float _1212 = _1168;
    float _1214 = _1170;
    float _1216 = _1172;
    float _1218 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _1220 = _1212 + _1218;
    float _1222 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _1224 = _1214 + _1222;
    float _1226 = fma(_1220, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _1228 = fma(_1224, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _4571 = float2(_1226, _1228);
    float _1230 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_4571, float2(0.0), isnan(_4571)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_4571, float2(0.0), isnan(_4571)), level(0.0)).x;
    float _1232 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1234 = fma(_1230, 100.0, _354);
    float _1236 = -_672;
    float _1238 = fma(_1236, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1234);
    float _1240 = _1238 + _1232;
    float _1242 = _1240 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1244 = _1240 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1246 = fma(_686, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1242);
    float _1248 = fma(_686, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1244);
    float _1250 = fma(_696, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1246);
    float _1252 = fma(_696, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1248);
    float _1254 = _1250 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1256 = _1252 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1258 = trunc(_1254);
    int _1260 = int(_1258);
    float _1262 = trunc(_1256);
    int _1264 = int(_1262);
    int _1266 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1268 = _1260 + _1266;
    int _1270 = _1268 + 1;
    bool _1272 = _1270 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1274 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1276 = _1264 + _1274;
    int _1278 = _1276 + 1;
    int _1280 = _1270 | _1278;
    bool _1282 = _1280 < 0;
    bool _1284 = _1282 || _1272;
    bool _1286 = _1278 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1288 = _1286 || _1284;
    int _1290 = _1270;
    int _1292 = _1264;
    int _1294 = _1280;
    int _1296 = as_type<int>(_1232);
    if (!_1288)
    {
        int _1298 = _1278 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1300 = _1298 + _1270;
        _1290 = _1300;
    }
    int _1302 = _1290;
    float _1304 = as_type<float>(_1278);
    if (!_1288)
    {
        float _1306 = floor(_1256);
        _1304 = _1306;
    }
    float _1308 = _1304;
    if (!_1288)
    {
        int _1310 = _1302 << 2;
        _1292 = _1310;
    }
    int _1312 = _1292;
    int _1314 = _1312;
    if (!_1288)
    {
        uint _1317 = uint(int(uint(_1302) >> uint(2)));
        _1294 = int(_1317);
    }
    int _1319 = _1294;
    if (!_1288)
    {
        int _1321 = 12 & _1312;
        _1314 = _1321;
    }
    int _1323 = _1314;
    if (!_1288)
    {
        int _1325 = _1319 << 4;
        int _1327 = _1325 + _1323;
        _1296 = _1327;
    }
    int _1329 = _1296;
    float _1331 = as_type<float>(_1323);
    if (!_1288)
    {
        float _1333 = floor(_1254);
        _1331 = _1333;
    }
    float _1335 = _1331;
    float _1337 = as_type<float>(_1319);
    if (!_1288)
    {
        int _1339 = _1329 + 400;
        uint _1341 = uint(int(uint(_1339) >> uint(2)));
        uint _1343 = uint(int(uint(int(_1341)) >> uint(2)));
        int _1345 = int(_1341) & 3;
        float _1347 = (*spvDescriptorSet0.vp_c15)._m0[int(_1343)][_1345];
        _1337 = _1347;
    }
    float _1349 = _1337;
    if (!_1288)
    {
        float _1351 = -_1308;
        float _1353 = _1256 + _1351;
        _1174 = _1353;
    }
    float _1355 = _1174;
    float _1357 = _1335;
    if (!_1288)
    {
        float _1359 = -_1335;
        float _1361 = _1254 + _1359;
        _1357 = _1361;
    }
    float _1363 = _1357;
    float _1365 = _1349;
    if (!_1288)
    {
        float _1367 = rint(_1349);
        float _1369 = precise::max(_1367, 0.0);
        uint _1371 = uint(_1369);
        uint _1373 = clamp(_1371, 0u, 65535u);
        _1365 = as_type<float>(_1373);
    }
    float _1375 = _1365;
    float _1377 = _1355;
    if (!_1288)
    {
        float3 _4836 = float3(_1363, _1355, float(as_type<int>(_1375)));
        float3 _4840 = select(_4836, float3(0.0), isnan(_4836));
        float _1379 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _4840.xy, uint(rint(_4840.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _4840.xy, uint(rint(_4840.z)), level(0.0)).x;
        _1377 = _1379;
    }
    float _1381 = _1377;
    float _1383 = _1238 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1385 = fma(_1230, 100.0, _1216);
    float _1387 = fma(_686, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1383);
    float _1389 = -_672;
    float _1391 = fma(_1389, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1385);
    float _1393 = fma(_696, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1387);
    float _1395 = _1238 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1397 = _1393 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1399 = fma(_686, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1395);
    float _1401 = 1.0 / _1397;
    float _1403 = fma(_696, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1399);
    float _1405 = _1403 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1407 = _1405 + _1397;
    float _1409 = _1407 * _1401;
    float _1411 = _1409 * 0.5;
    float _1413 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1415 = fma(_1411, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1413);
    float _1417 = 1.0 / _1415;
    float _1419 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1421 = _1417 * _1419;
    bool _1423 = _1421 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1425 = _1421 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _1427 = !_1423;
    int _1429 = _1427 ? 0 : 1;
    int _1431 = 2;
    float _1433 = _1391;
    if (!_1423)
    {
        _1431 = 1;
    }
    int _1435 = _1431;
    int _1437 = _1435;
    if (!_1425)
    {
        _1437 = _1429;
    }
    int _1439 = _1437;
    bool _1441 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1443 = isnan(0.5);
    bool _1445 = _1441 || _1443;
    bool _1447 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1449 = _1445 || _1447;
    int _1451 = _1439 << 6;
    bool _1453 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1455 = isnan(0.5);
    bool _1457 = _1453 || _1455;
    bool _1459 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1461 = _1457 || _1459;
    int _1463 = _1451 + 96;
    uint _1465 = uint(int(uint(_1463) >> uint(2)));
    uint _1467 = uint(int(uint(int(_1465)) >> uint(2)));
    int _1469 = int(_1465) & 3;
    float _1471 = (*spvDescriptorSet0.vp_c15)._m0[int(_1467)][_1469];
    int _1473 = int(_1465) + 1;
    uint _1475 = uint(int(uint(_1473) >> uint(2)));
    int _1477 = _1473 & 3;
    float _1479 = (*spvDescriptorSet0.vp_c15)._m0[int(_1475)][_1477];
    int _1481 = _1451 + 48;
    uint _1483 = uint(int(uint(_1481) >> uint(2)));
    uint _1485 = uint(int(uint(int(_1483)) >> uint(2)));
    int _1487 = int(_1483) & 3;
    float _1489 = (*spvDescriptorSet0.vp_c15)._m0[int(_1485)][_1487];
    int _1491 = int(_1483) + 1;
    uint _1493 = uint(int(uint(_1491) >> uint(2)));
    int _1495 = _1491 & 3;
    float _1497 = (*spvDescriptorSet0.vp_c15)._m0[int(_1493)][_1495];
    int _1499 = _1451 + 104;
    uint _1501 = uint(int(uint(_1499) >> uint(2)));
    uint _1503 = uint(int(uint(int(_1501)) >> uint(2)));
    int _1505 = int(_1501) & 3;
    float _1507 = (*spvDescriptorSet0.vp_c15)._m0[int(_1503)][_1505];
    int _1509 = int(_1501) + 1;
    uint _1511 = uint(int(uint(_1509) >> uint(2)));
    int _1513 = _1509 & 3;
    float _1515 = (*spvDescriptorSet0.vp_c15)._m0[int(_1511)][_1513];
    int _1517 = _1451 + 80;
    uint _1519 = uint(int(uint(_1517) >> uint(2)));
    uint _1521 = uint(int(uint(int(_1519)) >> uint(2)));
    int _1523 = int(_1519) & 3;
    float _1525 = (*spvDescriptorSet0.vp_c15)._m0[int(_1521)][_1523];
    int _1527 = int(_1519) + 1;
    uint _1529 = uint(int(uint(_1527) >> uint(2)));
    int _1531 = _1527 & 3;
    float _1533 = (*spvDescriptorSet0.vp_c15)._m0[int(_1529)][_1531];
    int _1535 = _1451 + 64;
    uint _1537 = uint(int(uint(_1535) >> uint(2)));
    uint _1539 = uint(int(uint(int(_1537)) >> uint(2)));
    int _1541 = int(_1537) & 3;
    float _1543 = (*spvDescriptorSet0.vp_c15)._m0[int(_1539)][_1541];
    int _1545 = int(_1537) + 1;
    uint _1547 = uint(int(uint(_1545) >> uint(2)));
    int _1549 = _1545 & 3;
    float _1551 = (*spvDescriptorSet0.vp_c15)._m0[int(_1547)][_1549];
    int _1553 = _1451 + 56;
    uint _1555 = uint(int(uint(_1553) >> uint(2)));
    uint _1557 = uint(int(uint(int(_1555)) >> uint(2)));
    int _1559 = int(_1555) & 3;
    float _1561 = (*spvDescriptorSet0.vp_c15)._m0[int(_1557)][_1559];
    int _1563 = int(_1555) + 1;
    uint _1565 = uint(int(uint(_1563) >> uint(2)));
    int _1567 = _1563 & 3;
    float _1569 = (*spvDescriptorSet0.vp_c15)._m0[int(_1565)][_1567];
    int _1571 = _1451 + 72;
    uint _1573 = uint(int(uint(_1571) >> uint(2)));
    uint _1575 = uint(int(uint(int(_1573)) >> uint(2)));
    int _1577 = int(_1573) & 3;
    float _1579 = (*spvDescriptorSet0.vp_c15)._m0[int(_1575)][_1577];
    int _1581 = int(_1573) + 1;
    uint _1583 = uint(int(uint(_1581) >> uint(2)));
    int _1585 = _1581 & 3;
    float _1587 = (*spvDescriptorSet0.vp_c15)._m0[int(_1583)][_1585];
    float _1589 = _1240 * _1479;
    float _1591 = fma(_686, _1471, _1589);
    int _1593 = _1451 + 88;
    uint _1595 = uint(int(uint(_1593) >> uint(2)));
    uint _1597 = uint(int(uint(int(_1595)) >> uint(2)));
    int _1599 = int(_1595) & 3;
    float _1601 = (*spvDescriptorSet0.vp_c15)._m0[int(_1597)][_1599];
    int _1603 = int(_1595) + 1;
    uint _1605 = uint(int(uint(_1603) >> uint(2)));
    int _1607 = _1603 & 3;
    float _1609 = (*spvDescriptorSet0.vp_c15)._m0[int(_1605)][_1607];
    float _1611 = _1240 * _1497;
    float _1613 = fma(_686, _1489, _1611);
    float _1615 = fma(_696, _1507, _1591);
    float _1617 = _1615 + _1515;
    float _1619 = -_674;
    float _1621 = fma(_1619, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1212);
    float _1623 = -_682;
    float _1625 = fma(_1623, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1214);
    float _1627 = _1240 * _1533;
    float _1629 = fma(_686, _1525, _1627);
    float _1631 = 1.0 / _1617;
    float _1633 = _1240 * _1551;
    float _1635 = fma(_686, _1543, _1633);
    float _1637 = fma(_696, _1561, _1613);
    float _1639 = _1637 + _1569;
    float _1641 = fma(_696, _1579, _1635);
    float _1643 = _1641 + _1587;
    float _1645 = fma(_696, _1601, _1629);
    float _1647 = _1645 + _1609;
    float _1649 = _1621;
    float _1651 = _1625;
    float _1653 = _1507;
    float _1655 = _1543;
    if (!_1449)
    {
        float _1657 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1659 = _1238 + _1657;
        float _1661 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1663 = -_458;
        float _1665 = _1663 + _1214;
        float _1667 = -_354;
        float _1669 = _1667 + _1216;
        float _1671 = _1659 * _1659;
        float _1673 = fma(_700, _700, _1671);
        float _1675 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1677 = fma(_714, _714, _1673);
        float _1679 = 1.0 / _998;
        float _1681 = sqrt(_1677);
        float _1683 = _1675 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1685 = precise::min(_1681, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1687 = _1685 * _1661;
        float _1689 = _1687 * _1679;
        float _1691 = -_414;
        float _1693 = _1691 + _1212;
        float _1695 = _1683 * _1689;
        float _1697 = _1665 * _1689;
        float _1699 = fma(_1669, _1695, _1238);
        float _1701 = fma(_1693, _1695, _686);
        float _1703 = fma(_1683, _1697, _696);
        _1433 = _1699;
        _1649 = _1701;
        _1651 = _1703;
        _1653 = _1661;
        _1655 = _1693;
        _822 = _1681;
        _376 = _1669;
    }
    float _1705 = _1433;
    float _1707 = _1649;
    float _1709 = _1651;
    float _1711 = _1653;
    float _1713 = _1655;
    float _1715 = _822;
    float _1717 = _376;
    float _1719 = _1639 * _1631;
    float _1721 = _1643 * _1631;
    float _1723 = _1647 * _1631;
    float _1725 = _1717;
    float _1727 = _1713;
    float _1729 = _1711;
    float _1731 = _1715;
    float _1733 = _1723;
    if (_1461)
    {
        _1725 = 1.0;
    }
    float _1735 = _1725;
    float _1737 = _1735;
    if (!_1461)
    {
        float _1739 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1741 = _1739 * 0.15915493667125701904296875;
        float _1743 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1745 = _1741 * 6.283185482025146484375;
        float _1747 = cos(_1745);
        float _1749 = _1743 * 0.15915493667125701904296875;
        float _1751 = _1741 * 6.283185482025146484375;
        float _1753 = sin(_1751);
        float _1755 = 1.0 / _1747;
        float _1757 = _1749 * 6.283185482025146484375;
        float _1759 = cos(_1757);
        float _1761 = _1753 * _1755;
        float _1763 = _1749 * 6.283185482025146484375;
        float _1765 = sin(_1763);
        float _1767 = _1759 * _1761;
        float _1769 = 1.0 / _1767;
        float _1771 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1773 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1771;
        float _1775 = 1.0 / _1773;
        float _1777 = _1765 * _1769;
        float _1779 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1781 = fma(_1421, _1777, _1779);
        float _1783 = _1781 * _1775;
        float _1785 = precise::clamp(_1783, 0.0, 1.0);
        _1727 = _1749;
        _1737 = _1785;
    }
    float _1787 = _1727;
    float _1789 = _1737;
    float _1791 = _1787;
    if (_1288)
    {
        _496 = 1.0;
    }
    float _1793 = _496;
    float _1795 = _1793;
    if (!_1288)
    {
        int _1797 = _1302 << 4;
        int _1799 = _1797 + 2048;
        uint _1801 = uint(int(uint(_1799) >> uint(2)));
        uint _1803 = uint(int(uint(int(_1801)) >> uint(2)));
        int _1805 = int(_1801) & 3;
        float _1807 = (*spvDescriptorSet0.vp_c15)._m0[int(_1803)][_1805];
        int _1809 = int(_1801) + 1;
        uint _1811 = uint(int(uint(_1809) >> uint(2)));
        int _1813 = _1809 & 3;
        float _1815 = (*spvDescriptorSet0.vp_c15)._m0[int(_1811)][_1813];
        int _1817 = _1799 + 8;
        uint _1819 = uint(int(uint(_1817) >> uint(2)));
        uint _1821 = uint(int(uint(int(_1819)) >> uint(2)));
        int _1823 = int(_1819) & 3;
        float _1825 = (*spvDescriptorSet0.vp_c15)._m0[int(_1821)][_1823];
        int _1827 = int(_1819) + 1;
        uint _1829 = uint(int(uint(_1827) >> uint(2)));
        int _1831 = _1827 & 3;
        float _1833 = (*spvDescriptorSet0.vp_c15)._m0[int(_1829)][_1831];
        float _1835 = _1240 * _1815;
        float _1837 = fma(_686, _1807, _1835);
        float _1839 = fma(_696, _1825, _1837);
        float _1841 = _1839 + _1833;
        float _1843 = precise::clamp(_1841, 0.0, 1.0);
        float _1845 = -_1843;
        float _1847 = _1845 + _1381;
        float _1849 = fma(_1847, 500.0, 1.5);
        float _1851 = exp2(_1849);
        float _1853 = 0.0 + _1851;
        float _1855 = precise::clamp(_1853, 0.0, 1.0);
        _1795 = _1855;
    }
    float _1857 = _1795;
    float _1859 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1861 = _1705 + _1859;
    float _1863 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1865 = _1707 + _1863;
    float _1867 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1869 = _1709 + _1867;
    float _1871 = _1861 * _1861;
    float _1873 = fma(_1865, _1865, _1871);
    float _1875 = fma(_1869, _1869, _1873);
    float _1877 = rsqrt(_1875);
    float _1879 = sqrt(_1875);
    float _1881 = _1877 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1883 = _1865 * _1881;
    float _1885 = _1869 * _1881;
    float _1887 = _1883 * _1883;
    float _1889 = _1885 * _1885;
    float _1891 = _1887 + _1889;
    float _1893 = sqrt(_1891);
    bool _1895 = _1893 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1897 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1899 = _1893 + _1897;
    float _1901 = _1877;
    float _1903 = _1899;
    float _1905 = _1861;
    float _1907 = _1883;
    if (_1895)
    {
        float _1909 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1901 = _1909;
    }
    float _1911 = _1901;
    if (_1895)
    {
        float _1913 = rsqrt(_1891);
        _1791 = _1913;
    }
    float _1915 = _1791;
    float _1917 = _1915;
    if (_1895)
    {
        float _1919 = _1899 * _1911;
        _1903 = _1919;
    }
    float _1921 = _1903;
    if (_1895)
    {
        float _1923 = _1921 * 0.15915493667125701904296875;
        _1729 = _1923;
    }
    float _1925 = _1729;
    float _1927 = _1869;
    if (_1895)
    {
        float _1929 = _1925 * 6.283185482025146484375;
        float _1931 = sin(_1929);
        _1927 = _1931;
    }
    float _1933 = _1927;
    float _1935 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1937 = precise::max(0.0, _1935);
    float _1939 = _1911;
    float _1941 = _1937;
    if (_1895)
    {
        float _1943 = _1925 * 6.283185482025146484375;
        float _1945 = cos(_1943);
        _1939 = _1945;
    }
    float _1947 = _1939;
    float _1949 = -_1881;
    float _1951 = -_1937;
    float _1953 = fma(_1861, _1949, _1951);
    if (_1895)
    {
        float _1955 = _1953 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1905 = _1955;
    }
    float _1957 = _1905;
    float _1959 = _1957;
    float _1961 = _1933;
    if (_1895)
    {
        float _1963 = fma(_1933, _1957, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1959 = _1963;
    }
    float _1965 = _1959;
    float _1967 = _1965;
    if (!_1895)
    {
        _1961 = _1885;
    }
    float _1969 = _1961;
    float _1971 = _1969;
    float _1973 = _1947;
    if (_1895)
    {
        float _1975 = _1947 + (-1.0);
        _1941 = _1975;
    }
    float _1977 = _1941;
    float _1979 = _1977;
    if (_1895)
    {
        float _1981 = _1915 * _1965;
        _1731 = _1981;
    }
    float _1983 = _1731;
    if (!_1895)
    {
        _1967 = _1953;
    }
    float _1985 = _1967;
    float _1987 = _1985;
    if (_1895)
    {
        float _1989 = _1977 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1917 = _1989;
    }
    float _1991 = _1917;
    if (_1895)
    {
        float _1993 = _1883 * _1983;
        _1907 = _1993;
    }
    float _1995 = _1907;
    if (!_1895)
    {
        _1979 = _1887;
    }
    float _1997 = _1979;
    float _1999 = _1997;
    if (_1895)
    {
        float _2001 = _1885 * _1983;
        _1971 = _2001;
    }
    float _2003 = _1971;
    if (_1895)
    {
        float _2005 = fma(_1953, _1947, _1991);
        _1987 = _2005;
    }
    float _2007 = _1987;
    if (_1895)
    {
        float _2009 = _1995 * _1995;
        _1999 = _2009;
    }
    float _2011 = _1999;
    if (!_1895)
    {
        _1973 = _1889;
    }
    float _2013 = _1973;
    float _2015 = _2013;
    if (_1895)
    {
        float _2017 = _2003 * _2003;
        _2015 = _2017;
    }
    float _2019 = _2015;
    float _2021 = fma(_2007, _2007, _2011);
    bool _2023 = _1719 >= 0.0;
    float _2025 = _2021 + _2019;
    float _2027 = _1705 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2029 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2031 = fma(_1879, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2029);
    float _2033 = precise::clamp(_2031, 0.0, 1.0);
    float _2035 = fma(_686, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2037 = rsqrt(_2025);
    float _2039 = fma(_1707, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2027);
    float _2041 = -_2033;
    float _2043 = _2041 + 1.0;
    float _2045 = fma(_1709, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2039);
    float _2047 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    bool _2049 = _1719 <= 1.0;
    bool _2051 = _2049 && _2023;
    float _2053 = abs(_2043);
    float _2055 = log2(_2053);
    float _2057 = _2045 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _2059 = _1721 >= 0.0;
    bool _2061 = _2059 && _2051;
    float _2063 = _2057 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    bool _2065 = _1721 <= 1.0;
    bool _2067 = _2065 && _2061;
    float _2069 = _2037 * _1995;
    float _2071 = fma(_696, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2073 = -_2063;
    float _2075 = fma(_2073, _2047, 1.0);
    float _2077 = _2037 * _2007;
    float _2079 = _2069 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2081 = _1705 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2083 = _2037 * _2003;
    float _2085 = _1705 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2087 = -_2079;
    float _2089 = fma(_2077, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2087);
    float _2091 = fma(_1707, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2081);
    float _2093 = floor(_2035);
    float _2095 = _1705 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2097 = -_2083;
    float _2099 = fma(_2097, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2089);
    float _2101 = fma(_1707, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2085);
    float _2103 = fma(_1709, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2091);
    float _2105 = fma(_1707, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2095);
    float _2107 = _2055 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2109 = fma(_1709, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2101);
    float _2111 = _2103 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2113 = floor(_2071);
    float _2115 = fma(_1709, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2105);
    float _2117 = _2109 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2119 = _2111 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2121 = fma(_2099, -0.5, 0.5);
    float _2123 = _2115 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2125 = fma(_2099, 0.5, 0.5);
    float _2127 = fma(_2117, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2119);
    float _2129 = log2(_2075);
    float _2131 = -_2093;
    float _2133 = _2035 + _2131;
    float _2135 = _2111 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2137 = fma(_2125, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2139 = exp2(_2107);
    float _2141 = fma(_2057, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2127);
    float _2143 = -_2113;
    float _2145 = _2071 + _2143;
    float _2147 = _2111 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2149 = fma(_2117, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2135);
    float _2151 = fma(_2123, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2141);
    float _2153 = _2141;
    if (_2067)
    {
        float _2155 = float(_1439);
        _2153 = _2155;
    }
    float _2157 = _2153;
    float _2159 = fma(_2117, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2147);
    float _2161 = sqrt(_2121);
    float _2163 = _2129 * 0.693147182464599609375;
    float _2165 = fma(_2057, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2159);
    float _2167 = _2077 + 1.0;
    float2 _6101 = float2(_2133, _2145);
    float _2169 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6101, float2(0.0), isnan(_6101)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6101, float2(0.0), isnan(_6101)), level(0.0)).x;
    float _2171 = _2163 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2173 = fma(_2123, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2165);
    float _2175 = 1.0 / _2151;
    float _2177 = fma(_2125, _2137, -0.212114393711090087890625);
    float _2179 = fma(_2057, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2149);
    float _2181 = -_2077;
    float _2183 = fma(_2139, _2167, _2181);
    float _2185 = fma(_2125, _2177, 1.570728778839111328125);
    float _2187 = fma(_2123, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2179);
    float _2189 = _2157;
    if (_2067)
    {
        float _2191 = rint(_2157);
        float _2193 = precise::max(_2191, 0.0);
        uint _2195 = uint(_2193);
        uint _2197 = clamp(_2195, 0u, 65535u);
        _2189 = as_type<float>(_2197);
    }
    float _2199 = _2189;
    float _2201 = _2161 * 0.636619746685028076171875;
    float _2203 = -_2185;
    float _2205 = fma(_2201, _2203, 1.0);
    float _2207 = _2173 * _2175;
    float _2209 = _2187 * _2175;
    float _2211 = fma(_2183, 0.5, 0.5);
    float _2213 = fma(_2207, 0.5, 0.5);
    float _2215 = fma(_2209, -0.5, 0.5);
    float _2217 = _2199;
    if (_2067)
    {
        float3 _6185 = float3(_1719, _1721, float(as_type<int>(_2199)));
        float3 _6187 = select(_6185, float3(0.0), isnan(_6185));
        float _2219 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6187.xy, uint(rint(_6187.z)), _1723, level(0.0));
        _2217 = _2219;
    }
    float _2221 = _2217;
    float3 _6197 = float3(_2213, _2215, _2171);
    float _2223 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6197, float3(0.0), isnan(_6197)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6197, float3(0.0), isnan(_6197)), level(0.0)).x;
    float3 _6206 = float3(_2213, _2215, _2171);
    float4 _2226 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6206, float3(0.0), isnan(_6206)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6206, float3(0.0), isnan(_6206)), level(0.0)).xyzw;
    float _2228 = _2226.x;
    float _2230 = _2226.y;
    float _2232 = _2226.z;
    float _2234 = _2226.w;
    float2 _6222 = float2(_2205, _2211);
    float3 _2238 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6222, float2(0.0), isnan(_6222)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6222, float2(0.0), isnan(_6222)), level(0.0)).xyz;
    float _2240 = _2238.x;
    float _2242 = _2238.y;
    float _2244 = _2238.z;
    float _2246 = in.m_93.x;
    float _2248 = in.m_93.y;
    float _2250 = in.m_93.z;
    bool _2252 = _1026 != 0.0;
    bool _2254 = isnan(_1026);
    bool _2256 = _2252 || _2254;
    bool _2258 = isnan(0.0);
    bool _2260 = _2256 || _2258;
    float _2262 = _2111 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2264 = _2055 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_73.w = _200;
    bool _2266 = _1024 == 0.0;
    bool _2268 = !_2260;
    bool _2270 = _2266 && _2268;
    float _2272 = fma(_2117, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2262);
    bool _2274 = _1028 == 0.0;
    bool _2276 = _2274 && _2270;
    float _2278 = fma(_2057, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2272);
    float _2280 = abs(_1421);
    float _2282 = log2(_2280);
    float _2284 = fma(_2123, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2278);
    float _2286 = exp2(_2264);
    bool _2288 = _1421 <= 8000.0;
    bool _2290 = isnan(_1421);
    bool _2292 = _2288 || _2290;
    bool _2294 = isnan(8000.0);
    bool _2296 = _2292 || _2294;
    float _2298 = float(_2296);
    out.gl_Position.x = _2173;
    out.gl_Position.y = _2187;
    out.gl_Position.z = _2284;
    out.gl_Position.w = _2151;
    float _2300 = _2248;
    float _2302 = _2246;
    float _2304 = _2250;
    float _2306 = _2173;
    if (!_2276)
    {
        float _2308 = fma(_1026, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2248);
        _2300 = _2308;
    }
    float _2310 = _2300;
    if (!_2276)
    {
        float _2312 = fma(_1024, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2246);
        _2302 = _2312;
    }
    float _2314 = _2302;
    if (!_2276)
    {
        float _2316 = fma(_1028, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2250);
        _2304 = _2316;
    }
    float _2318 = _2304;
    float _2320 = _1130 * _2310;
    float _2322 = _1096 * _2310;
    float _2324 = _1084 * _2310;
    float _2326 = fma(_1068, _2314, _2320);
    float _2328 = _2282 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2330 = _2284 + _2151;
    float _2332 = -_2286;
    float _2334 = _2332 + 1.0;
    if (!_2067)
    {
        _2306 = 1.0;
    }
    float _2336 = _2306;
    float _2338 = fma(_1066, _2314, _2322);
    float _2340 = _2330 * 0.5;
    float _2342 = exp2(_2328);
    float _2344 = _2334 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2346 = fma(_1072, _2314, _2324);
    float _2348 = fma(_958, _2318, _2338);
    float _2350 = fma(_944, _2318, _2326);
    float _2352 = fma(_942, _2318, _2346);
    out.m_95.x = _2348;
    out.m_95.y = _2350;
    out.m_95.z = _2352;
    out.m_97.z = _2340;
    out.m_97.w = _2151;
    float _2354 = fma(_2342, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2356 = precise::clamp(_2354, 0.0, 1.0);
    float _2358 = fma(_2356, -2.0, 3.0);
    float _2360 = _2356 * _2356;
    float _2362 = _2360 * _2358;
    float _2364 = -_2362;
    float _2366 = _2364 + 1.0;
    float _2368 = fma(_2366, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2362);
    float _2370 = _2298 * _2368;
    float _2372 = _2370 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2374 = _1789 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2376 = -_2169;
    float _2378 = _2376 + 1.0;
    float _2380 = _2378 * _2372;
    float _2382 = precise::clamp(_2380, 0.0, 1.0);
    float _2384 = -_2344;
    float _2386 = _2384 + 1.0;
    float _2388 = -_2382;
    float _2390 = fma(_2388, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2392 = _2336;
    float _2394 = _2362;
    float _2396 = _2386;
    float _2398 = _2344;
    if (_2067)
    {
        bool _2400 = _2221 >= _1723;
        bool _2402 = isnan(_2221);
        bool _2404 = _2400 || _2402;
        bool _2406 = isnan(_1723);
        bool _2408 = _2404 || _2406;
        float _2410 = float(_2408);
        _2392 = _2410;
    }
    float _2412 = _2392;
    float _2414 = _2344 * _2223;
    float _2416 = _2234 * _2386;
    bool _2418 = _1879 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2420 = isnan(_1879);
    bool _2422 = _2418 || _2420;
    bool _2424 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2426 = _2422 || _2424;
    float _2428 = _2412 * _1857;
    float _2430 = _2234 * _2414;
    float _2432 = _2244 * _2414;
    float _2434 = -_2428;
    float _2436 = fma(_2434, _2390, 1.0);
    float _2438 = precise::clamp(_2436, 0.0, 1.0);
    float _2440 = fma(_2240, _2430, _2228);
    float _2442 = fma(_2242, _2430, _2230);
    float _2444 = fma(_2234, _2432, _2232);
    float _2446 = _2438 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2448 = _2430;
    float _2450 = _2438;
    if (!_2426)
    {
        _1733 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2452 = _1733;
    out.m_99.x = _2440;
    out.m_99.y = _2442;
    out.m_99.z = _2444;
    out.m_99.w = _2416;
    float _2454 = _2452;
    float _2456 = _2452;
    if (!_2426)
    {
        _2394 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2458 = _2394;
    float _2460 = _2458;
    float _2462 = _2458;
    if (!_2426)
    {
        _2448 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2464 = _2448;
    out.m_101.x = _2446;
    float _2466 = _2464;
    float _2468 = _2464;
    if (!_2426)
    {
        _2396 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2470 = _2396;
    float _2472 = _2470;
    float _2474 = _2470;
    if (!_2426)
    {
        _2398 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2476 = _2398;
    float _2478 = _2476;
    float _2480 = _2476;
    if (!_2426)
    {
        _2450 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2482 = _2450;
    bool _2484 = !_2426;
    float _2486 = _2482;
    float _2488 = _2482;
    if (!_2484)
    {
        bool _2490 = _1879 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2492 = isnan(_1879);
        bool _2494 = _2490 || _2492;
        bool _2496 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2498 = _2494 || _2496;
        if (!_2498)
        {
            float _2500 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2502 = _1879 + _2500;
            float _2504 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2506 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2504;
            float _2508 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2510 = _2508 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2512 = 1.0 / _2506;
            float _2514 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2516 = _2514 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2518 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2520 = _2518 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2522 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2524 = _2522 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2526 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2528 = _2526 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2530 = _2502 * _2512;
            float _2532 = precise::clamp(_2530, 0.0, 1.0);
            float _2534 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2536 = _2534 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2538 = fma(_2532, _2510, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2540 = fma(_2532, _2536, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2542 = fma(_2532, _2516, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2544 = fma(_2532, _2520, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2546 = fma(_2532, _2524, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2548 = fma(_2532, _2528, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2462 = _2542;
            _2480 = _2546;
            _2456 = _2538;
            _2474 = _2544;
            _2468 = _2540;
            _2488 = _2548;
            _2550 = true;
        }
        else
        {
            bool _2552 = _1879 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2554 = isnan(_1879);
            bool _2556 = _2552 || _2554;
            bool _2558 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2560 = _2556 || _2558;
            if (!_2560)
            {
                _2454 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2562 = _2454;
            _2456 = _2562;
            if (!_2560)
            {
                _2460 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2564 = _2460;
            _2462 = _2564;
            if (!_2560)
            {
                _2466 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2566 = _2466;
            _2468 = _2566;
            if (!_2560)
            {
                _2472 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2568 = _2472;
            _2474 = _2568;
            if (!_2560)
            {
                _2478 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2570 = _2478;
            _2480 = _2570;
            if (!_2560)
            {
                _2486 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2572 = _2486;
            bool _2574 = !_2560;
            _2488 = _2572;
            if (!_2574)
            {
                bool _2576 = _1879 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2578 = isnan(_1879);
                bool _2580 = _2576 || _2578;
                bool _2582 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2584 = _2580 || _2582;
                if (!_2584)
                {
                    float _2586 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2588 = _1879 + _2586;
                    float _2590 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2592 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2590;
                    float _2594 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2596 = _2594 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2598 = 1.0 / _2592;
                    float _2600 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2602 = _2600 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2604 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2606 = _2604 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2608 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2610 = _2608 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2612 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2614 = _2612 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2616 = _2588 * _2598;
                    float _2618 = precise::clamp(_2616, 0.0, 1.0);
                    float _2620 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2622 = _2620 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2624 = fma(_2618, _2596, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2626 = fma(_2618, _2622, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2628 = fma(_2618, _2602, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2630 = fma(_2618, _2606, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2632 = fma(_2618, _2610, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2634 = fma(_2618, _2614, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2462 = _2628;
                    _2480 = _2632;
                    _2456 = _2624;
                    _2474 = _2630;
                    _2468 = _2626;
                    _2488 = _2634;
                    _2550 = true;
                }
                else
                {
                    _2462 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2480 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2456 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2474 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2468 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2488 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2550 = false;
    float _2636 = _2462;
    float _2638 = _2480;
    float _2640 = _2456;
    float _2642 = _2474;
    float _2644 = _2468;
    float _2646 = _2488;
    float _2648 = _2374 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2650 = fma(_2350, -0.5, 0.5);
    float _2652 = precise::clamp(_2650, 0.0, 1.0);
    float _2654 = -_2636;
    float _2656 = _2654 + _2638;
    float _2658 = -_2640;
    float _2660 = _2658 + _2642;
    out.m_103.x = 0.0;
    float _2662 = fma(_2652, _2656, _2636);
    float _2664 = -_2644;
    float _2666 = _2664 + _2646;
    float _2668 = fma(_2652, _2660, _2640);
    float _2670 = _2662 * 0.586610972881317138671875;
    bool _2672 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2674 = fma(_2652, _2666, _2644);
    out.m_65.x = _2648;
    float _2676 = fma(_2668, 0.298911988735198974609375, _2670);
    bool _2678 = _1789 > 0.0;
    bool _2680 = isnan(_1789);
    bool _2682 = _2678 || _2680;
    bool _2684 = isnan(0.0);
    bool _2686 = _2682 || _2684;
    float _2688 = fma(_2674, 0.114477999508380889892578125, _2676);
    float _2690 = -_2688;
    float _2692 = _2668 + _2690;
    float _2694 = -_2688;
    float _2696 = _2662 + _2694;
    float _2698 = -_2688;
    float _2700 = _2674 + _2698;
    float _2702 = fma(_2692, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2688);
    float _2704 = fma(_2696, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2688);
    float _2706 = fma(_2700, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2688);
    bool _2708 = !_2672;
    if (!_2708)
    {
        float _2710 = -_1705;
        float _2712 = _2710 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2714 = -_1707;
        float _2716 = _2714 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2718 = -_1709;
        float _2720 = _2718 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2722 = _2712 * _2712;
        float _2724 = fma(_2716, _2716, _2722);
        float _2726 = fma(_2720, _2720, _2724);
        float _2728 = sqrt(_2726);
        float _2730 = rsqrt(_2726);
        float _2732 = -_2728;
        float _2734 = _2732 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2736 = _2734 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2738 = precise::clamp(_2736, 0.0, 1.0);
        float _2740 = _2716 * _2730;
        float _2742 = _2712 * _2730;
        float _2744 = abs(_2738);
        float _2746 = log2(_2744);
        float _2748 = _2720 * _2730;
        float _2750 = _2740 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2752 = _2350 * _2742;
        float _2754 = -_2742;
        float _2756 = -_2750;
        float _2758 = fma(_2754, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2756);
        float _2760 = fma(_2348, _2740, _2752);
        float _2762 = -_2748;
        float _2764 = fma(_2762, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2758);
        float _2766 = fma(_2352, _2748, _2760);
        float _2768 = precise::clamp(_2766, 0.0, 1.0);
        float _2770 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2772 = _2764 + _2770;
        float _2774 = _2746 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2776 = _2772 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2778 = precise::clamp(_2776, 0.0, 1.0);
        float _2780 = exp2(_2774);
        float _2782 = _2780 * _2778;
        float _2784 = _2768 * _2782;
        float _2786 = _2784 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2788 = _2784 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2790 = _2784 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_103.x = _2786;
        out.m_103.y = _2788;
        out.m_103.z = _2790;
    }
    out.m_105.x = _2702;
    out.m_105.y = _2704;
    out.m_105.z = _2706;
    if (_2686)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2792 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_65.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2792;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2550 = false;
    bool _298 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _119 = in.m_58.w;
    float _121 = in.m_60.w;
    float _123 = trunc(_119);
    int _126 = int(_123);
    float _128 = -_121;
    float _130 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_63.y = _130;
    bool _134 = _126 >= 1;
    float _136 = 0.0;
    float _138 = as_type<float>(_126);
    if (!_134)
    {
        _136 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _136;
    if (!_134)
    {
        out.m_65.x = 0.0;
    }
    int _142 = 0;
    if (!_134)
    {
        float _144 = _140 * 5.0;
        _142 = as_type<int>(_144);
    }
    int _146 = _142;
    int _148 = _146;
    if (!_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2860 = as_type<float>(_146);
        out.gl_Position.z = _2860;
    }
    if (!_134)
    {
        return out;
    }
    bool _150 = _121 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _152 = isnan(_121);
    bool _154 = _150 || _152;
    bool _156 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _158 = _154 || _156;
    float _160 = in.m_67.y;
    float _162 = float(_126);
    bool _164 = _130 >= _162;
    bool _166 = !_158;
    bool _168 = _164 || _166;
    if (_168)
    {
        _138 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _170 = _138;
    if (_168)
    {
        out.m_65.x = 0.0;
    }
    if (_168)
    {
        float _172 = _170 * 5.0;
        _148 = as_type<int>(_172);
    }
    int _174 = _148;
    out.m_69.y = _160;
    if (_168)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2919 = as_type<float>(_174);
        out.gl_Position.z = _2919;
    }
    if (_168)
    {
        return out;
    }
    float _176 = in.m_67.x;
    float _178 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _180 = _130 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _182 = in.m_71.x;
    int _184 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _186 = _184 != 0;
    float _188 = in.m_71.y;
    float _190 = 1.0 / _162;
    int _192 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _194 = _192 != 0;
    int _196 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _198 = _196 != 0;
    float _200 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _202 = _180 * _178;
    out.m_73.w = _200;
    bool _204 = !_198;
    int _206 = _204 ? 0 : 1;
    float _208 = fma(_176, (*spvDescriptorSet0.vp_c9)._m0[20].x, _202);
    int _210 = abs(_206);
    float _212 = _130 * _190;
    float _214 = floor(_208);
    float _216 = _208 * 6.283185482025146484375;
    out.m_75.x = _182;
    float _218 = float(_210);
    float _220 = _216 * 0.15915493667125701904296875;
    out.m_75.y = _188;
    float _222 = -_214;
    float _224 = _208 + _222;
    bool _226 = !_194;
    int _228 = _226 ? 0 : 1;
    float _230 = _220 * 6.283185482025146484375;
    float _232 = cos(_230);
    float _234 = -_224;
    float _236 = fma(_234, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _238 = abs(_228);
    bool _240 = !_186;
    int _242 = _240 ? 0 : 1;
    bool _244 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    int _246 = abs(_242);
    float _248 = float(_238);
    bool _250 = _224 < 0.5;
    float _252 = float(_250);
    float _254 = fma(_232, 0.5, 0.5);
    float _256 = abs(_236);
    float _258 = _248 * _256;
    float _260 = float(_246);
    float _262 = -_252;
    float _264 = fma(_262, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _266 = -_254;
    float _268 = fma(_266, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _270 = fma(_260, _268, _258);
    float _272 = abs(_264);
    float _274 = fma(_218, _272, _270);
    bool _276 = !_244;
    float _278 = _188;
    float _280 = _182;
    float _296;
    if (!_276)
    {
        float _282 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _284 = _176 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _286 = fma(_284, (*spvDescriptorSet0.vp_c9)._m0[14].x, _130);
        float _288 = _286 * _282;
        float _290 = floor(_288);
        float _292 = -_290;
        float _294 = _288 + _292;
        _296 = _294;
        _298 = true;
    }
    else
    {
        _296 = _212;
    }
    _298 = false;
    float _300 = _296;
    float _302 = in.m_58.x;
    float _304 = in.m_58.y;
    float _306 = in.m_58.z;
    float _308 = in.m_77.x;
    float _310 = in.m_77.y;
    float _312 = in.m_77.z;
    float _314 = in.m_77.w;
    int _316 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _318 = _316 != 0;
    int _320 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _322 = _320 != 0;
    float _324 = in.m_79.x;
    float _326 = in.m_79.y;
    float _328 = in.m_79.z;
    float _330 = in.m_79.w;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _334 = _332 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _336 = in.m_81.y;
    float _338 = 1.0 / _334;
    bool _340 = _160 > 0.5;
    float _342 = in.m_83.x;
    float _344 = _304 * _310;
    float _346 = fma(_302, _308, _344);
    float _348 = _304 * _326;
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _352 = _350 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _354 = _304 + _336;
    float _356 = fma(_302, _324, _348);
    float _358 = -_188;
    float _360 = _358 + 1.0;
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _364 = _362 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _366 = in.m_67.z;
    float _368 = in.m_67.w;
    float _370 = fma(_306, _328, _356);
    float _372 = 1.0 / _352;
    float _374 = fma(_306, _312, _346);
    float _376 = _354;
    if (_322)
    {
        float _378 = _340 ? _360 : _188;
        _278 = _378;
    }
    float _380 = _278;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _384 = _382 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _386 = _160 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _388 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _390 = 1.0 / _384;
    float _392 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _394 = _176 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _396 = fma(_386, -2.0, _392);
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _400 = _398 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _402 = 1.0 / _364;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _406 = _404 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _408 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _410 = _176 > 0.5;
    bool _412 = _410 && _318;
    float _414 = _374 + _314;
    float _416 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[79].z, _388);
    float _418 = -_408;
    float _420 = fma(_394, 2.0, _418);
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _424 = _422 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _426 = 1.0 / _400;
    float _428 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[79].x, _416);
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _432 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _430;
    float _434 = _424 * _372;
    float _436 = _428 * (-0.15915493667125701904296875);
    float _438 = _432 * _338;
    float _440 = 1.0 / _406;
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _444 = _442 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _448 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _446;
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _452 = _300 + _450;
    float _454 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _456 = _448 * _402;
    float _458 = _370 + _330;
    float _460 = 1.0 / _444;
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _464 = _462 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _468 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _466;
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _472 = _300 + _470;
    float _474 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _476 = _474 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _478 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[76].y, _396);
    float _480 = -_130;
    float _482 = fma(_480, (*spvDescriptorSet0.vp_c9)._m0[76].x, _420);
    float _484 = fma(_434, _472, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _486 = _436 * 6.283185482025146484375;
    float _488 = sin(_486);
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _492 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _490;
    float _494 = (*spvDescriptorSet0.vp_c9)._m0[166].x;
    float _496 = _414;
    if (!_318)
    {
        _494 = _182;
    }
    float _498 = _494;
    float _500 = _498;
    if (_412)
    {
        float _502 = -_182;
        float _504 = _502 + 1.0;
        _280 = _504;
    }
    float _506 = _280;
    float _508 = _464 * _440;
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _512 = _300 + _510;
    float _514 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _516 = _458 + _514;
    float _518 = _476 * _390;
    if (_318)
    {
        _500 = _506;
    }
    float _520 = _500;
    float _522 = _436 * 6.283185482025146484375;
    float _524 = cos(_522);
    float _526 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _528 = _354 + _526;
    float _530 = _492 * _460;
    float _532 = fma(_438, _512, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _534 = fma(_520, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _536 = _528 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _538 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _540 = _414 + _538;
    float _542 = fma(_456, _452, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _544 = _488 * _454;
    float _546 = fma(_540, (*spvDescriptorSet0.vp_c8)._m0[28].x, _536);
    out.m_85.x = _342;
    float _548 = _468 * _426;
    float _550 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _552 = fma(_516, (*spvDescriptorSet0.vp_c8)._m0[28].z, _546);
    float _554 = _524 * _454;
    float _556 = -_544;
    float _558 = fma(_524, _534, _556);
    bool _560 = _552 >= 0.0;
    float _562 = _528 * _528;
    float _564 = fma(_488, _534, _554);
    float _566 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _568 = fma(_176, (*spvDescriptorSet0.vp_c9)._m0[78].z, _550);
    float _570 = fma(_540, _540, _562);
    float _572 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _574 = _300 + _572;
    float _576 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[78].w, _566);
    float _578 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[77].z, _568);
    float _580 = fma(_516, _516, _570);
    float _582 = fma(_518, _574, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _584 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[77].w, _576);
    float _586 = fma(_578, _558, _482);
    bool _588 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _590 = isnan(_300);
    bool _592 = _588 || _590;
    bool _594 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _596 = _592 || _594;
    float _598 = float(_596);
    float _600 = _342 * 12.98980045318603515625;
    float _602 = rsqrt(_580);
    float _604 = -_478;
    float _606 = fma(_584, _564, _604);
    float _608 = _584;
    if (_560)
    {
        _608 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _610 = _608;
    float _612 = _586 + 0.5;
    bool _614 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _616 = isnan(_300);
    bool _618 = _614 || _616;
    bool _620 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _622 = _618 || _620;
    float _624 = float(_622);
    float _626 = _606 + 0.5;
    float _628 = -_598;
    float _630 = _628 + 1.0;
    int _632 = as_type<int>(_610);
    if (_560)
    {
        float _634 = _610 * 5.0;
        _632 = as_type<int>(_634);
    }
    int _636 = _632;
    if (_560)
    {
        out.m_65.x = 0.0;
    }
    float _638 = fma(_368, 78.233001708984375, _600);
    float _640 = fma(_366, 78.233001708984375, _600);
    float _642 = _624 * _630;
    out.m_87.x = _612;
    out.m_87.y = _626;
    bool _644 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _646 = isnan(_300);
    bool _648 = _644 || _646;
    bool _650 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _652 = _648 || _650;
    float _654 = float(_652);
    float _656 = -_624;
    float _658 = _656 + 1.0;
    bool _660 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _662 = isnan(_300);
    bool _664 = _660 || _662;
    bool _666 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _668 = _664 || _666;
    float _670 = float(_668);
    if (_560)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3719 = as_type<float>(_636);
        out.gl_Position.z = _3719;
    }
    float _672 = _528 * _602;
    float _674 = _540 * _602;
    if (_560)
    {
        return out;
    }
    float _676 = -_672;
    float _678 = fma(_676, (*spvDescriptorSet0.vp_c9)._m0[18].w, _354);
    float _680 = _640 * 0.15915493667125701904296875;
    float _682 = _516 * _602;
    float _684 = -_674;
    float _686 = fma(_684, (*spvDescriptorSet0.vp_c9)._m0[18].w, _414);
    float _688 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _690 = _678 + _688;
    float _692 = fma(_176, 78.233001708984375, _600);
    float _694 = -_682;
    float _696 = fma(_694, (*spvDescriptorSet0.vp_c9)._m0[18].w, _458);
    float _698 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _700 = _686 + _698;
    float _702 = _690 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _704 = _680 * 6.283185482025146484375;
    float _706 = sin(_704);
    float _708 = _638 * 0.15915493667125701904296875;
    float _710 = _670 * _658;
    float _712 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _714 = _696 + _712;
    float _716 = fma(_700, (*spvDescriptorSet0.vp_c8)._m0[28].x, _702);
    float _718 = _692 * 0.15915493667125701904296875;
    float _720 = -_670;
    float _722 = _720 + 1.0;
    bool _724 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _726 = isnan(_300);
    bool _728 = _724 || _726;
    bool _730 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _732 = _728 || _730;
    float _734 = float(_732);
    float _736 = fma(_714, (*spvDescriptorSet0.vp_c8)._m0[28].z, _716);
    float _738 = _708 * 6.283185482025146484375;
    float _740 = sin(_738);
    float _742 = _654 * _722;
    float _744 = -_654;
    float _746 = _744 + 1.0;
    float _748 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _750 = _300 + _748;
    bool _752 = _736 >= 0.0;
    float _754 = -_734;
    float _756 = _754 + 1.0;
    float _758 = _734 * _746;
    bool _760 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _762 = isnan(_300);
    bool _764 = _760 || _762;
    bool _766 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _768 = _764 || _766;
    float _770 = float(_768);
    float _772 = _718 * 6.283185482025146484375;
    float _774 = sin(_772);
    float _776 = _706 * 43758.546875;
    float _778 = fma(_548, _750, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    bool _780 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _782 = isnan(_300);
    bool _784 = _780 || _782;
    bool _786 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _788 = _784 || _786;
    float _790 = float(_788);
    float _792 = -_770;
    float _794 = _792 + 1.0;
    bool _796 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _798 = isnan(_300);
    bool _800 = _796 || _798;
    bool _802 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _804 = _800 || _802;
    float _806 = float(_804);
    float _808 = _790 * _794;
    float _810 = floor(_776);
    float _812 = _740 * 43758.546875;
    float _814 = _806 * _756;
    float _816 = -_806;
    float _818 = _816 + 1.0;
    float _820 = _806;
    float _822 = _700;
    if (_752)
    {
        _820 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _824 = _820;
    float _826 = _532 * _808;
    float _828 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _830 = _300 + _828;
    float _832 = _774 * 43758.546875;
    float _834 = floor(_812);
    float _836 = _770 * _818;
    int _838 = as_type<int>(_824);
    if (_752)
    {
        float _840 = _824 * 5.0;
        _838 = as_type<int>(_840);
    }
    int _842 = _838;
    if (_752)
    {
        out.m_65.x = 0.0;
    }
    float _844 = fma(_508, _830, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _846 = floor(_832);
    if (_752)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3982 = as_type<float>(_842);
        out.gl_Position.z = _3982;
    }
    float _848 = -_810;
    float _850 = _776 + _848;
    if (_752)
    {
        return out;
    }
    float _852 = -_354;
    float _854 = _852 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _856 = -_790;
    float _858 = _856 + 1.0;
    float _860 = -_414;
    float _862 = _860 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _864 = -_672;
    float _866 = fma(_864, (*spvDescriptorSet0.vp_c9)._m0[18].w, _528);
    float _868 = _854 * _854;
    float _870 = fma(_850, -0.12000000476837158203125, 0.4000000059604644775390625);
    float _872 = -_458;
    float _874 = _872 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _876 = -_674;
    float _878 = fma(_876, (*spvDescriptorSet0.vp_c9)._m0[18].w, _540);
    float _880 = fma(_862, _862, _868);
    float _882 = _866 * _866;
    float _884 = fma(_858, (*spvDescriptorSet0.vp_c9)._m0[159].x, _826);
    float _886 = -_834;
    float _888 = _812 + _886;
    float _890 = fma(_874, _874, _880);
    float _892 = fma(_878, _878, _882);
    float _894 = -_682;
    float _896 = fma(_894, (*spvDescriptorSet0.vp_c9)._m0[18].w, _516);
    float _898 = fma(_484, _836, _884);
    float _900 = rsqrt(_890);
    float _902 = _888 * 0.60000002384185791015625;
    float _904 = fma(_896, _896, _892);
    float _906 = fma(_542, _814, _898);
    float _908 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _910 = _300 + _908;
    float _912 = fma(_160, 78.233001708984375, _600);
    float _914 = precise::max(_212, _902);
    float _916 = fma(_582, _758, _906);
    float _918 = 1.0 / _870;
    float _920 = fma(_530, _910, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _922 = _912 * 0.15915493667125701904296875;
    float _924 = fma(_778, _742, _916);
    float _926 = in.m_89.x;
    float _928 = in.m_89.y;
    float _930 = in.m_89.z;
    float _932 = -_846;
    float _934 = _832 + _932;
    float _936 = fma(_844, _710, _924);
    float _938 = sqrt(_904);
    float _940 = _902 + _870;
    float _942 = _874 * _900;
    float _944 = _854 * _900;
    float _946 = fma(_920, _642, _936);
    float _948 = precise::min(_940, _914);
    float _950 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _952 = _942 * _950;
    float _954 = _922 * 6.283185482025146484375;
    float _956 = sin(_954);
    float _958 = _862 * _900;
    float _960 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _962 = _944 * _960;
    float _964 = -_902;
    float _966 = _964 + _948;
    float _968 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _970 = -_952;
    float _972 = fma(_944, _968, _970);
    float _974 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _976 = _958 * _974;
    float _978 = in.m_91.x;
    float _980 = in.m_91.y;
    float _982 = in.m_91.z;
    float _984 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _986 = -_962;
    float _988 = fma(_958, _984, _986);
    float _990 = _966 * _918;
    float _992 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _994 = -_976;
    float _996 = fma(_942, _992, _994);
    float _998 = _602 * _938;
    float _1000 = fma(_598, (*spvDescriptorSet0.vp_c9)._m0[166].x, _946);
    float _1002 = fma(_990, 2.0, -1.0);
    float _1004 = _996 * _996;
    float _1006 = fma(_934, 2.0, -1.0);
    float _1008 = -_1002;
    float _1010 = fma(_1008, _1002, 1.0);
    float _1012 = precise::clamp(_1010, 0.0, 1.0);
    float _1014 = fma(_972, _972, _1004);
    float _1016 = _956 * 43758.546875;
    float _1018 = _934 * _1012;
    float _1020 = fma(_988, _988, _1014);
    float _1022 = floor(_1016);
    float _1024 = _1018 * _926;
    float _1026 = _1018 * _928;
    float _1028 = _1018 * _930;
    float _1030 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1026);
    float _1032 = rsqrt(_1020);
    float _1034 = _980 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1036 = _978 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1038 = _982 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _1040 = fma(_850, 0.4000000059604644775390625, 0.100000001490116119384765625);
    float _1042 = _274 * _1034;
    float _1044 = _274 * _1036;
    float _1046 = _274 * _1038;
    float _1048 = _130 * _1040;
    float _1050 = _1042 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1052 = _1044 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1054 = -_1022;
    float _1056 = _1016 + _1054;
    float _1058 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1024);
    float _1060 = _998 * _1050;
    float _1062 = _998 * _1052;
    float _1064 = _1046 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1066 = _972 * _1032;
    float _1068 = _996 * _1032;
    float _1070 = _1030 * _1060;
    float _1072 = _988 * _1032;
    float _1074 = _944 * _1066;
    float _1076 = fma(_1056, 6.283185482025146484375, _1048);
    float _1078 = _942 * _1068;
    float _1080 = _1058 * _1062;
    float _1082 = -_1074;
    float _1084 = fma(_958, _1068, _1082);
    float _1086 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1028);
    float _1088 = _998 * _1064;
    float _1090 = fma(_934, 6.283185482025146484375, _1048);
    float _1092 = _1076 * 0.15915493667125701904296875;
    float _1094 = -_1078;
    float _1096 = fma(_944, _1072, _1094);
    float _1098 = _1070 * _1084;
    float _1100 = _1086 * _1088;
    float _1102 = _1092 * 6.283185482025146484375;
    float _1104 = sin(_1102);
    float _1106 = _1090 * 0.15915493667125701904296875;
    float _1108 = _1070 * _1096;
    float _1110 = fma(_1080, _1072, _1098);
    float _1112 = _958 * _1072;
    float _1114 = fma(_1080, _1066, _1108);
    float _1116 = fma(_1100, _942, _1110);
    float _1118 = _1106 * 6.283185482025146484375;
    float _1120 = sin(_1118);
    float _1122 = fma(_850, 2.0, -1.0);
    float _1124 = fma(_1100, _958, _1114);
    float _1126 = _458 + _1116;
    float _1128 = -_1112;
    float _1130 = fma(_942, _1066, _1128);
    float _1132 = _414 + _1124;
    float _1134 = fma(_1000, _1122, _1126);
    float _1136 = fma(_1000, _1006, _1132);
    float _1138 = fma(_1104, 0.02500000037252902984619140625, _1134);
    float _1140 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1142 = _1138 + _1140;
    float _1144 = fma(_1120, 0.02500000037252902984619140625, _1136);
    float _1146 = _1142 * _1142;
    float _1148 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1150 = _1144 + _1148;
    float _1152 = fma(_1150, _1150, _1146);
    float _1154 = _1070 * _1130;
    float _1156 = sqrt(_1152);
    float _1158 = fma(_1080, _1068, _1154);
    float _1160 = fma(_1100, _944, _1158);
    float _1162 = _354 + _1160;
    bool _1164 = _1156 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _1166 = !_1164;
    float _1168 = _1144;
    float _1170 = _1138;
    float _1172 = _1162;
    float _1174 = _868;
    if (!_1166)
    {
        float _1176 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1178 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1180 = _1156 + _1178;
        float _1182 = rsqrt(_1152);
        float _1184 = _1180 * _1176;
        float _1186 = _1162 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1188 = _1184 * 0.15915493667125701904296875;
        float _1190 = _1188 * 6.283185482025146484375;
        float _1192 = cos(_1190);
        float _1194 = _1188 * 6.283185482025146484375;
        float _1196 = sin(_1194);
        float _1198 = _1192 + (-1.0);
        float _1200 = fma(_1196, _1186, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1202 = _1198 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1204 = _1182 * _1200;
        float _1206 = fma(_1162, _1192, _1202);
        float _1208 = fma(_1150, _1204, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1210 = fma(_1142, _1204, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1168 = _1208;
        _1170 = _1210;
        _1172 = _1206;
    }
    float _1212 = _1168;
    float _1214 = _1170;
    float _1216 = _1172;
    float _1218 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _1220 = _1212 + _1218;
    float _1222 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _1224 = _1214 + _1222;
    float _1226 = fma(_1220, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _1228 = fma(_1224, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _4571 = float2(_1226, _1228);
    float _1230 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_4571, float2(0.0), isnan(_4571)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_4571, float2(0.0), isnan(_4571)), level(0.0)).x;
    float _1232 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1234 = fma(_1230, 100.0, _354);
    float _1236 = -_672;
    float _1238 = fma(_1236, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1234);
    float _1240 = _1238 + _1232;
    float _1242 = _1240 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1244 = _1240 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1246 = fma(_686, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1242);
    float _1248 = fma(_686, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1244);
    float _1250 = fma(_696, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1246);
    float _1252 = fma(_696, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1248);
    float _1254 = _1250 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1256 = _1252 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1258 = trunc(_1254);
    int _1260 = int(_1258);
    float _1262 = trunc(_1256);
    int _1264 = int(_1262);
    int _1266 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1268 = _1260 + _1266;
    int _1270 = _1268 + 1;
    bool _1272 = _1270 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1274 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1276 = _1264 + _1274;
    int _1278 = _1276 + 1;
    int _1280 = _1270 | _1278;
    bool _1282 = _1280 < 0;
    bool _1284 = _1282 || _1272;
    bool _1286 = _1278 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1288 = _1286 || _1284;
    int _1290 = _1270;
    int _1292 = _1264;
    int _1294 = _1280;
    int _1296 = as_type<int>(_1232);
    if (!_1288)
    {
        int _1298 = _1278 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1300 = _1298 + _1270;
        _1290 = _1300;
    }
    int _1302 = _1290;
    float _1304 = as_type<float>(_1278);
    if (!_1288)
    {
        float _1306 = floor(_1256);
        _1304 = _1306;
    }
    float _1308 = _1304;
    if (!_1288)
    {
        int _1310 = _1302 << 2;
        _1292 = _1310;
    }
    int _1312 = _1292;
    int _1314 = _1312;
    if (!_1288)
    {
        uint _1317 = uint(int(uint(_1302) >> uint(2)));
        _1294 = int(_1317);
    }
    int _1319 = _1294;
    if (!_1288)
    {
        int _1321 = 12 & _1312;
        _1314 = _1321;
    }
    int _1323 = _1314;
    if (!_1288)
    {
        int _1325 = _1319 << 4;
        int _1327 = _1325 + _1323;
        _1296 = _1327;
    }
    int _1329 = _1296;
    float _1331 = as_type<float>(_1323);
    if (!_1288)
    {
        float _1333 = floor(_1254);
        _1331 = _1333;
    }
    float _1335 = _1331;
    float _1337 = as_type<float>(_1319);
    if (!_1288)
    {
        int _1339 = _1329 + 400;
        uint _1341 = uint(int(uint(_1339) >> uint(2)));
        uint _1343 = uint(int(uint(int(_1341)) >> uint(2)));
        int _1345 = int(_1341) & 3;
        float _1347 = (*spvDescriptorSet0.vp_c15)._m0[int(_1343)][_1345];
        _1337 = _1347;
    }
    float _1349 = _1337;
    if (!_1288)
    {
        float _1351 = -_1308;
        float _1353 = _1256 + _1351;
        _1174 = _1353;
    }
    float _1355 = _1174;
    float _1357 = _1335;
    if (!_1288)
    {
        float _1359 = -_1335;
        float _1361 = _1254 + _1359;
        _1357 = _1361;
    }
    float _1363 = _1357;
    float _1365 = _1349;
    if (!_1288)
    {
        float _1367 = rint(_1349);
        float _1369 = precise::max(_1367, 0.0);
        uint _1371 = uint(_1369);
        uint _1373 = clamp(_1371, 0u, 65535u);
        _1365 = as_type<float>(_1373);
    }
    float _1375 = _1365;
    float _1377 = _1355;
    if (!_1288)
    {
        float3 _4836 = float3(_1363, _1355, float(as_type<int>(_1375)));
        float3 _4840 = select(_4836, float3(0.0), isnan(_4836));
        float _1379 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _4840.xy, uint(rint(_4840.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _4840.xy, uint(rint(_4840.z)), level(0.0)).x;
        _1377 = _1379;
    }
    float _1381 = _1377;
    float _1383 = _1238 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1385 = fma(_1230, 100.0, _1216);
    float _1387 = fma(_686, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1383);
    float _1389 = -_672;
    float _1391 = fma(_1389, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1385);
    float _1393 = fma(_696, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1387);
    float _1395 = _1238 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1397 = _1393 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1399 = fma(_686, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1395);
    float _1401 = 1.0 / _1397;
    float _1403 = fma(_696, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1399);
    float _1405 = _1403 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1407 = _1405 + _1397;
    float _1409 = _1407 * _1401;
    float _1411 = _1409 * 0.5;
    float _1413 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1415 = fma(_1411, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1413);
    float _1417 = 1.0 / _1415;
    float _1419 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1421 = _1417 * _1419;
    bool _1423 = _1421 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1425 = _1421 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _1427 = !_1423;
    int _1429 = _1427 ? 0 : 1;
    int _1431 = 2;
    float _1433 = _1391;
    if (!_1423)
    {
        _1431 = 1;
    }
    int _1435 = _1431;
    int _1437 = _1435;
    if (!_1425)
    {
        _1437 = _1429;
    }
    int _1439 = _1437;
    bool _1441 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1443 = isnan(0.5);
    bool _1445 = _1441 || _1443;
    bool _1447 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1449 = _1445 || _1447;
    int _1451 = _1439 << 6;
    bool _1453 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1455 = isnan(0.5);
    bool _1457 = _1453 || _1455;
    bool _1459 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1461 = _1457 || _1459;
    int _1463 = _1451 + 96;
    uint _1465 = uint(int(uint(_1463) >> uint(2)));
    uint _1467 = uint(int(uint(int(_1465)) >> uint(2)));
    int _1469 = int(_1465) & 3;
    float _1471 = (*spvDescriptorSet0.vp_c15)._m0[int(_1467)][_1469];
    int _1473 = int(_1465) + 1;
    uint _1475 = uint(int(uint(_1473) >> uint(2)));
    int _1477 = _1473 & 3;
    float _1479 = (*spvDescriptorSet0.vp_c15)._m0[int(_1475)][_1477];
    int _1481 = _1451 + 48;
    uint _1483 = uint(int(uint(_1481) >> uint(2)));
    uint _1485 = uint(int(uint(int(_1483)) >> uint(2)));
    int _1487 = int(_1483) & 3;
    float _1489 = (*spvDescriptorSet0.vp_c15)._m0[int(_1485)][_1487];
    int _1491 = int(_1483) + 1;
    uint _1493 = uint(int(uint(_1491) >> uint(2)));
    int _1495 = _1491 & 3;
    float _1497 = (*spvDescriptorSet0.vp_c15)._m0[int(_1493)][_1495];
    int _1499 = _1451 + 104;
    uint _1501 = uint(int(uint(_1499) >> uint(2)));
    uint _1503 = uint(int(uint(int(_1501)) >> uint(2)));
    int _1505 = int(_1501) & 3;
    float _1507 = (*spvDescriptorSet0.vp_c15)._m0[int(_1503)][_1505];
    int _1509 = int(_1501) + 1;
    uint _1511 = uint(int(uint(_1509) >> uint(2)));
    int _1513 = _1509 & 3;
    float _1515 = (*spvDescriptorSet0.vp_c15)._m0[int(_1511)][_1513];
    int _1517 = _1451 + 80;
    uint _1519 = uint(int(uint(_1517) >> uint(2)));
    uint _1521 = uint(int(uint(int(_1519)) >> uint(2)));
    int _1523 = int(_1519) & 3;
    float _1525 = (*spvDescriptorSet0.vp_c15)._m0[int(_1521)][_1523];
    int _1527 = int(_1519) + 1;
    uint _1529 = uint(int(uint(_1527) >> uint(2)));
    int _1531 = _1527 & 3;
    float _1533 = (*spvDescriptorSet0.vp_c15)._m0[int(_1529)][_1531];
    int _1535 = _1451 + 64;
    uint _1537 = uint(int(uint(_1535) >> uint(2)));
    uint _1539 = uint(int(uint(int(_1537)) >> uint(2)));
    int _1541 = int(_1537) & 3;
    float _1543 = (*spvDescriptorSet0.vp_c15)._m0[int(_1539)][_1541];
    int _1545 = int(_1537) + 1;
    uint _1547 = uint(int(uint(_1545) >> uint(2)));
    int _1549 = _1545 & 3;
    float _1551 = (*spvDescriptorSet0.vp_c15)._m0[int(_1547)][_1549];
    int _1553 = _1451 + 56;
    uint _1555 = uint(int(uint(_1553) >> uint(2)));
    uint _1557 = uint(int(uint(int(_1555)) >> uint(2)));
    int _1559 = int(_1555) & 3;
    float _1561 = (*spvDescriptorSet0.vp_c15)._m0[int(_1557)][_1559];
    int _1563 = int(_1555) + 1;
    uint _1565 = uint(int(uint(_1563) >> uint(2)));
    int _1567 = _1563 & 3;
    float _1569 = (*spvDescriptorSet0.vp_c15)._m0[int(_1565)][_1567];
    int _1571 = _1451 + 72;
    uint _1573 = uint(int(uint(_1571) >> uint(2)));
    uint _1575 = uint(int(uint(int(_1573)) >> uint(2)));
    int _1577 = int(_1573) & 3;
    float _1579 = (*spvDescriptorSet0.vp_c15)._m0[int(_1575)][_1577];
    int _1581 = int(_1573) + 1;
    uint _1583 = uint(int(uint(_1581) >> uint(2)));
    int _1585 = _1581 & 3;
    float _1587 = (*spvDescriptorSet0.vp_c15)._m0[int(_1583)][_1585];
    float _1589 = _1240 * _1479;
    float _1591 = fma(_686, _1471, _1589);
    int _1593 = _1451 + 88;
    uint _1595 = uint(int(uint(_1593) >> uint(2)));
    uint _1597 = uint(int(uint(int(_1595)) >> uint(2)));
    int _1599 = int(_1595) & 3;
    float _1601 = (*spvDescriptorSet0.vp_c15)._m0[int(_1597)][_1599];
    int _1603 = int(_1595) + 1;
    uint _1605 = uint(int(uint(_1603) >> uint(2)));
    int _1607 = _1603 & 3;
    float _1609 = (*spvDescriptorSet0.vp_c15)._m0[int(_1605)][_1607];
    float _1611 = _1240 * _1497;
    float _1613 = fma(_686, _1489, _1611);
    float _1615 = fma(_696, _1507, _1591);
    float _1617 = _1615 + _1515;
    float _1619 = -_674;
    float _1621 = fma(_1619, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1212);
    float _1623 = -_682;
    float _1625 = fma(_1623, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1214);
    float _1627 = _1240 * _1533;
    float _1629 = fma(_686, _1525, _1627);
    float _1631 = 1.0 / _1617;
    float _1633 = _1240 * _1551;
    float _1635 = fma(_686, _1543, _1633);
    float _1637 = fma(_696, _1561, _1613);
    float _1639 = _1637 + _1569;
    float _1641 = fma(_696, _1579, _1635);
    float _1643 = _1641 + _1587;
    float _1645 = fma(_696, _1601, _1629);
    float _1647 = _1645 + _1609;
    float _1649 = _1621;
    float _1651 = _1625;
    float _1653 = _1507;
    float _1655 = _1543;
    if (!_1449)
    {
        float _1657 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1659 = _1238 + _1657;
        float _1661 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1663 = -_458;
        float _1665 = _1663 + _1214;
        float _1667 = -_354;
        float _1669 = _1667 + _1216;
        float _1671 = _1659 * _1659;
        float _1673 = fma(_700, _700, _1671);
        float _1675 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1677 = fma(_714, _714, _1673);
        float _1679 = 1.0 / _998;
        float _1681 = sqrt(_1677);
        float _1683 = _1675 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1685 = precise::min(_1681, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1687 = _1685 * _1661;
        float _1689 = _1687 * _1679;
        float _1691 = -_414;
        float _1693 = _1691 + _1212;
        float _1695 = _1683 * _1689;
        float _1697 = _1665 * _1689;
        float _1699 = fma(_1669, _1695, _1238);
        float _1701 = fma(_1693, _1695, _686);
        float _1703 = fma(_1683, _1697, _696);
        _1433 = _1699;
        _1649 = _1701;
        _1651 = _1703;
        _1653 = _1661;
        _1655 = _1693;
        _822 = _1681;
        _376 = _1669;
    }
    float _1705 = _1433;
    float _1707 = _1649;
    float _1709 = _1651;
    float _1711 = _1653;
    float _1713 = _1655;
    float _1715 = _822;
    float _1717 = _376;
    float _1719 = _1639 * _1631;
    float _1721 = _1643 * _1631;
    float _1723 = _1647 * _1631;
    float _1725 = _1717;
    float _1727 = _1713;
    float _1729 = _1711;
    float _1731 = _1715;
    float _1733 = _1723;
    if (_1461)
    {
        _1725 = 1.0;
    }
    float _1735 = _1725;
    float _1737 = _1735;
    if (!_1461)
    {
        float _1739 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1741 = _1739 * 0.15915493667125701904296875;
        float _1743 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1745 = _1741 * 6.283185482025146484375;
        float _1747 = cos(_1745);
        float _1749 = _1743 * 0.15915493667125701904296875;
        float _1751 = _1741 * 6.283185482025146484375;
        float _1753 = sin(_1751);
        float _1755 = 1.0 / _1747;
        float _1757 = _1749 * 6.283185482025146484375;
        float _1759 = cos(_1757);
        float _1761 = _1753 * _1755;
        float _1763 = _1749 * 6.283185482025146484375;
        float _1765 = sin(_1763);
        float _1767 = _1759 * _1761;
        float _1769 = 1.0 / _1767;
        float _1771 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1773 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1771;
        float _1775 = 1.0 / _1773;
        float _1777 = _1765 * _1769;
        float _1779 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1781 = fma(_1421, _1777, _1779);
        float _1783 = _1781 * _1775;
        float _1785 = precise::clamp(_1783, 0.0, 1.0);
        _1727 = _1749;
        _1737 = _1785;
    }
    float _1787 = _1727;
    float _1789 = _1737;
    float _1791 = _1787;
    if (_1288)
    {
        _496 = 1.0;
    }
    float _1793 = _496;
    float _1795 = _1793;
    if (!_1288)
    {
        int _1797 = _1302 << 4;
        int _1799 = _1797 + 2048;
        uint _1801 = uint(int(uint(_1799) >> uint(2)));
        uint _1803 = uint(int(uint(int(_1801)) >> uint(2)));
        int _1805 = int(_1801) & 3;
        float _1807 = (*spvDescriptorSet0.vp_c15)._m0[int(_1803)][_1805];
        int _1809 = int(_1801) + 1;
        uint _1811 = uint(int(uint(_1809) >> uint(2)));
        int _1813 = _1809 & 3;
        float _1815 = (*spvDescriptorSet0.vp_c15)._m0[int(_1811)][_1813];
        int _1817 = _1799 + 8;
        uint _1819 = uint(int(uint(_1817) >> uint(2)));
        uint _1821 = uint(int(uint(int(_1819)) >> uint(2)));
        int _1823 = int(_1819) & 3;
        float _1825 = (*spvDescriptorSet0.vp_c15)._m0[int(_1821)][_1823];
        int _1827 = int(_1819) + 1;
        uint _1829 = uint(int(uint(_1827) >> uint(2)));
        int _1831 = _1827 & 3;
        float _1833 = (*spvDescriptorSet0.vp_c15)._m0[int(_1829)][_1831];
        float _1835 = _1240 * _1815;
        float _1837 = fma(_686, _1807, _1835);
        float _1839 = fma(_696, _1825, _1837);
        float _1841 = _1839 + _1833;
        float _1843 = precise::clamp(_1841, 0.0, 1.0);
        float _1845 = -_1843;
        float _1847 = _1845 + _1381;
        float _1849 = fma(_1847, 500.0, 1.5);
        float _1851 = exp2(_1849);
        float _1853 = 0.0 + _1851;
        float _1855 = precise::clamp(_1853, 0.0, 1.0);
        _1795 = _1855;
    }
    float _1857 = _1795;
    float _1859 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1861 = _1705 + _1859;
    float _1863 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1865 = _1707 + _1863;
    float _1867 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1869 = _1709 + _1867;
    float _1871 = _1861 * _1861;
    float _1873 = fma(_1865, _1865, _1871);
    float _1875 = fma(_1869, _1869, _1873);
    float _1877 = rsqrt(_1875);
    float _1879 = sqrt(_1875);
    float _1881 = _1877 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1883 = _1865 * _1881;
    float _1885 = _1869 * _1881;
    float _1887 = _1883 * _1883;
    float _1889 = _1885 * _1885;
    float _1891 = _1887 + _1889;
    float _1893 = sqrt(_1891);
    bool _1895 = _1893 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1897 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1899 = _1893 + _1897;
    float _1901 = _1877;
    float _1903 = _1899;
    float _1905 = _1861;
    float _1907 = _1883;
    if (_1895)
    {
        float _1909 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1901 = _1909;
    }
    float _1911 = _1901;
    if (_1895)
    {
        float _1913 = rsqrt(_1891);
        _1791 = _1913;
    }
    float _1915 = _1791;
    float _1917 = _1915;
    if (_1895)
    {
        float _1919 = _1899 * _1911;
        _1903 = _1919;
    }
    float _1921 = _1903;
    if (_1895)
    {
        float _1923 = _1921 * 0.15915493667125701904296875;
        _1729 = _1923;
    }
    float _1925 = _1729;
    float _1927 = _1869;
    if (_1895)
    {
        float _1929 = _1925 * 6.283185482025146484375;
        float _1931 = sin(_1929);
        _1927 = _1931;
    }
    float _1933 = _1927;
    float _1935 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1937 = precise::max(0.0, _1935);
    float _1939 = _1911;
    float _1941 = _1937;
    if (_1895)
    {
        float _1943 = _1925 * 6.283185482025146484375;
        float _1945 = cos(_1943);
        _1939 = _1945;
    }
    float _1947 = _1939;
    float _1949 = -_1881;
    float _1951 = -_1937;
    float _1953 = fma(_1861, _1949, _1951);
    if (_1895)
    {
        float _1955 = _1953 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1905 = _1955;
    }
    float _1957 = _1905;
    float _1959 = _1957;
    float _1961 = _1933;
    if (_1895)
    {
        float _1963 = fma(_1933, _1957, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1959 = _1963;
    }
    float _1965 = _1959;
    float _1967 = _1965;
    if (!_1895)
    {
        _1961 = _1885;
    }
    float _1969 = _1961;
    float _1971 = _1969;
    float _1973 = _1947;
    if (_1895)
    {
        float _1975 = _1947 + (-1.0);
        _1941 = _1975;
    }
    float _1977 = _1941;
    float _1979 = _1977;
    if (_1895)
    {
        float _1981 = _1915 * _1965;
        _1731 = _1981;
    }
    float _1983 = _1731;
    if (!_1895)
    {
        _1967 = _1953;
    }
    float _1985 = _1967;
    float _1987 = _1985;
    if (_1895)
    {
        float _1989 = _1977 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1917 = _1989;
    }
    float _1991 = _1917;
    if (_1895)
    {
        float _1993 = _1883 * _1983;
        _1907 = _1993;
    }
    float _1995 = _1907;
    if (!_1895)
    {
        _1979 = _1887;
    }
    float _1997 = _1979;
    float _1999 = _1997;
    if (_1895)
    {
        float _2001 = _1885 * _1983;
        _1971 = _2001;
    }
    float _2003 = _1971;
    if (_1895)
    {
        float _2005 = fma(_1953, _1947, _1991);
        _1987 = _2005;
    }
    float _2007 = _1987;
    if (_1895)
    {
        float _2009 = _1995 * _1995;
        _1999 = _2009;
    }
    float _2011 = _1999;
    if (!_1895)
    {
        _1973 = _1889;
    }
    float _2013 = _1973;
    float _2015 = _2013;
    if (_1895)
    {
        float _2017 = _2003 * _2003;
        _2015 = _2017;
    }
    float _2019 = _2015;
    float _2021 = fma(_2007, _2007, _2011);
    bool _2023 = _1719 >= 0.0;
    float _2025 = _2021 + _2019;
    float _2027 = _1705 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2029 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2031 = fma(_1879, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2029);
    float _2033 = precise::clamp(_2031, 0.0, 1.0);
    float _2035 = fma(_686, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2037 = rsqrt(_2025);
    float _2039 = fma(_1707, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2027);
    float _2041 = -_2033;
    float _2043 = _2041 + 1.0;
    float _2045 = fma(_1709, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2039);
    float _2047 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    bool _2049 = _1719 <= 1.0;
    bool _2051 = _2049 && _2023;
    float _2053 = abs(_2043);
    float _2055 = log2(_2053);
    float _2057 = _2045 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _2059 = _1721 >= 0.0;
    bool _2061 = _2059 && _2051;
    float _2063 = _2057 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    bool _2065 = _1721 <= 1.0;
    bool _2067 = _2065 && _2061;
    float _2069 = _2037 * _1995;
    float _2071 = fma(_696, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2073 = -_2063;
    float _2075 = fma(_2073, _2047, 1.0);
    float _2077 = _2037 * _2007;
    float _2079 = _2069 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2081 = _1705 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2083 = _2037 * _2003;
    float _2085 = _1705 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2087 = -_2079;
    float _2089 = fma(_2077, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2087);
    float _2091 = fma(_1707, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2081);
    float _2093 = floor(_2035);
    float _2095 = _1705 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2097 = -_2083;
    float _2099 = fma(_2097, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2089);
    float _2101 = fma(_1707, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2085);
    float _2103 = fma(_1709, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2091);
    float _2105 = fma(_1707, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2095);
    float _2107 = _2055 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2109 = fma(_1709, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2101);
    float _2111 = _2103 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2113 = floor(_2071);
    float _2115 = fma(_1709, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2105);
    float _2117 = _2109 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2119 = _2111 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2121 = fma(_2099, -0.5, 0.5);
    float _2123 = _2115 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2125 = fma(_2099, 0.5, 0.5);
    float _2127 = fma(_2117, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2119);
    float _2129 = log2(_2075);
    float _2131 = -_2093;
    float _2133 = _2035 + _2131;
    float _2135 = _2111 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2137 = fma(_2125, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2139 = exp2(_2107);
    float _2141 = fma(_2057, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2127);
    float _2143 = -_2113;
    float _2145 = _2071 + _2143;
    float _2147 = _2111 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2149 = fma(_2117, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2135);
    float _2151 = fma(_2123, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2141);
    float _2153 = _2141;
    if (_2067)
    {
        float _2155 = float(_1439);
        _2153 = _2155;
    }
    float _2157 = _2153;
    float _2159 = fma(_2117, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2147);
    float _2161 = sqrt(_2121);
    float _2163 = _2129 * 0.693147182464599609375;
    float _2165 = fma(_2057, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2159);
    float _2167 = _2077 + 1.0;
    float2 _6101 = float2(_2133, _2145);
    float _2169 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6101, float2(0.0), isnan(_6101)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6101, float2(0.0), isnan(_6101)), level(0.0)).x;
    float _2171 = _2163 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2173 = fma(_2123, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2165);
    float _2175 = 1.0 / _2151;
    float _2177 = fma(_2125, _2137, -0.212114393711090087890625);
    float _2179 = fma(_2057, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2149);
    float _2181 = -_2077;
    float _2183 = fma(_2139, _2167, _2181);
    float _2185 = fma(_2125, _2177, 1.570728778839111328125);
    float _2187 = fma(_2123, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2179);
    float _2189 = _2157;
    if (_2067)
    {
        float _2191 = rint(_2157);
        float _2193 = precise::max(_2191, 0.0);
        uint _2195 = uint(_2193);
        uint _2197 = clamp(_2195, 0u, 65535u);
        _2189 = as_type<float>(_2197);
    }
    float _2199 = _2189;
    float _2201 = _2161 * 0.636619746685028076171875;
    float _2203 = -_2185;
    float _2205 = fma(_2201, _2203, 1.0);
    float _2207 = _2173 * _2175;
    float _2209 = _2187 * _2175;
    float _2211 = fma(_2183, 0.5, 0.5);
    float _2213 = fma(_2207, 0.5, 0.5);
    float _2215 = fma(_2209, -0.5, 0.5);
    float _2217 = _2199;
    if (_2067)
    {
        float3 _6185 = float3(_1719, _1721, float(as_type<int>(_2199)));
        float3 _6187 = select(_6185, float3(0.0), isnan(_6185));
        float _2219 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6187.xy, uint(rint(_6187.z)), _1723, level(0.0));
        _2217 = _2219;
    }
    float _2221 = _2217;
    float3 _6197 = float3(_2213, _2215, _2171);
    float _2223 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6197, float3(0.0), isnan(_6197)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6197, float3(0.0), isnan(_6197)), level(0.0)).x;
    float3 _6206 = float3(_2213, _2215, _2171);
    float4 _2226 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6206, float3(0.0), isnan(_6206)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6206, float3(0.0), isnan(_6206)), level(0.0)).xyzw;
    float _2228 = _2226.x;
    float _2230 = _2226.y;
    float _2232 = _2226.z;
    float _2234 = _2226.w;
    float2 _6222 = float2(_2205, _2211);
    float3 _2238 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6222, float2(0.0), isnan(_6222)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6222, float2(0.0), isnan(_6222)), level(0.0)).xyz;
    float _2240 = _2238.x;
    float _2242 = _2238.y;
    float _2244 = _2238.z;
    float _2246 = in.m_93.x;
    float _2248 = in.m_93.y;
    float _2250 = in.m_93.z;
    bool _2252 = _1026 != 0.0;
    bool _2254 = isnan(_1026);
    bool _2256 = _2252 || _2254;
    bool _2258 = isnan(0.0);
    bool _2260 = _2256 || _2258;
    float _2262 = _2111 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2264 = _2055 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_73.w = _200;
    bool _2266 = _1024 == 0.0;
    bool _2268 = !_2260;
    bool _2270 = _2266 && _2268;
    float _2272 = fma(_2117, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2262);
    bool _2274 = _1028 == 0.0;
    bool _2276 = _2274 && _2270;
    float _2278 = fma(_2057, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2272);
    float _2280 = abs(_1421);
    float _2282 = log2(_2280);
    float _2284 = fma(_2123, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2278);
    float _2286 = exp2(_2264);
    bool _2288 = _1421 <= 8000.0;
    bool _2290 = isnan(_1421);
    bool _2292 = _2288 || _2290;
    bool _2294 = isnan(8000.0);
    bool _2296 = _2292 || _2294;
    float _2298 = float(_2296);
    out.gl_Position.x = _2173;
    out.gl_Position.y = _2187;
    out.gl_Position.z = _2284;
    out.gl_Position.w = _2151;
    float _2300 = _2248;
    float _2302 = _2246;
    float _2304 = _2250;
    float _2306 = _2173;
    if (!_2276)
    {
        float _2308 = fma(_1026, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2248);
        _2300 = _2308;
    }
    float _2310 = _2300;
    if (!_2276)
    {
        float _2312 = fma(_1024, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2246);
        _2302 = _2312;
    }
    float _2314 = _2302;
    if (!_2276)
    {
        float _2316 = fma(_1028, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2250);
        _2304 = _2316;
    }
    float _2318 = _2304;
    float _2320 = _1130 * _2310;
    float _2322 = _1096 * _2310;
    float _2324 = _1084 * _2310;
    float _2326 = fma(_1068, _2314, _2320);
    float _2328 = _2282 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2330 = _2284 + _2151;
    float _2332 = -_2286;
    float _2334 = _2332 + 1.0;
    if (!_2067)
    {
        _2306 = 1.0;
    }
    float _2336 = _2306;
    float _2338 = fma(_1066, _2314, _2322);
    float _2340 = _2330 * 0.5;
    float _2342 = exp2(_2328);
    float _2344 = _2334 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2346 = fma(_1072, _2314, _2324);
    float _2348 = fma(_958, _2318, _2338);
    float _2350 = fma(_944, _2318, _2326);
    float _2352 = fma(_942, _2318, _2346);
    out.m_95.x = _2348;
    out.m_95.y = _2350;
    out.m_95.z = _2352;
    out.m_97.z = _2340;
    out.m_97.w = _2151;
    float _2354 = fma(_2342, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2356 = precise::clamp(_2354, 0.0, 1.0);
    float _2358 = fma(_2356, -2.0, 3.0);
    float _2360 = _2356 * _2356;
    float _2362 = _2360 * _2358;
    float _2364 = -_2362;
    float _2366 = _2364 + 1.0;
    float _2368 = fma(_2366, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2362);
    float _2370 = _2298 * _2368;
    float _2372 = _2370 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2374 = _1789 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2376 = -_2169;
    float _2378 = _2376 + 1.0;
    float _2380 = _2378 * _2372;
    float _2382 = precise::clamp(_2380, 0.0, 1.0);
    float _2384 = -_2344;
    float _2386 = _2384 + 1.0;
    float _2388 = -_2382;
    float _2390 = fma(_2388, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2392 = _2336;
    float _2394 = _2362;
    float _2396 = _2386;
    float _2398 = _2344;
    if (_2067)
    {
        bool _2400 = _2221 >= _1723;
        bool _2402 = isnan(_2221);
        bool _2404 = _2400 || _2402;
        bool _2406 = isnan(_1723);
        bool _2408 = _2404 || _2406;
        float _2410 = float(_2408);
        _2392 = _2410;
    }
    float _2412 = _2392;
    float _2414 = _2344 * _2223;
    float _2416 = _2234 * _2386;
    bool _2418 = _1879 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2420 = isnan(_1879);
    bool _2422 = _2418 || _2420;
    bool _2424 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2426 = _2422 || _2424;
    float _2428 = _2412 * _1857;
    float _2430 = _2234 * _2414;
    float _2432 = _2244 * _2414;
    float _2434 = -_2428;
    float _2436 = fma(_2434, _2390, 1.0);
    float _2438 = precise::clamp(_2436, 0.0, 1.0);
    float _2440 = fma(_2240, _2430, _2228);
    float _2442 = fma(_2242, _2430, _2230);
    float _2444 = fma(_2234, _2432, _2232);
    float _2446 = _2438 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2448 = _2430;
    float _2450 = _2438;
    if (!_2426)
    {
        _1733 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2452 = _1733;
    out.m_99.x = _2440;
    out.m_99.y = _2442;
    out.m_99.z = _2444;
    out.m_99.w = _2416;
    float _2454 = _2452;
    float _2456 = _2452;
    if (!_2426)
    {
        _2394 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2458 = _2394;
    float _2460 = _2458;
    float _2462 = _2458;
    if (!_2426)
    {
        _2448 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2464 = _2448;
    out.m_101.x = _2446;
    float _2466 = _2464;
    float _2468 = _2464;
    if (!_2426)
    {
        _2396 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2470 = _2396;
    float _2472 = _2470;
    float _2474 = _2470;
    if (!_2426)
    {
        _2398 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2476 = _2398;
    float _2478 = _2476;
    float _2480 = _2476;
    if (!_2426)
    {
        _2450 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2482 = _2450;
    bool _2484 = !_2426;
    float _2486 = _2482;
    float _2488 = _2482;
    if (!_2484)
    {
        bool _2490 = _1879 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2492 = isnan(_1879);
        bool _2494 = _2490 || _2492;
        bool _2496 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2498 = _2494 || _2496;
        if (!_2498)
        {
            float _2500 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2502 = _1879 + _2500;
            float _2504 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2506 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2504;
            float _2508 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2510 = _2508 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2512 = 1.0 / _2506;
            float _2514 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2516 = _2514 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2518 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2520 = _2518 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2522 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2524 = _2522 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2526 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2528 = _2526 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2530 = _2502 * _2512;
            float _2532 = precise::clamp(_2530, 0.0, 1.0);
            float _2534 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2536 = _2534 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2538 = fma(_2532, _2510, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2540 = fma(_2532, _2536, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2542 = fma(_2532, _2516, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2544 = fma(_2532, _2520, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2546 = fma(_2532, _2524, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2548 = fma(_2532, _2528, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2462 = _2542;
            _2480 = _2546;
            _2456 = _2538;
            _2474 = _2544;
            _2468 = _2540;
            _2488 = _2548;
            _2550 = true;
        }
        else
        {
            bool _2552 = _1879 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2554 = isnan(_1879);
            bool _2556 = _2552 || _2554;
            bool _2558 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2560 = _2556 || _2558;
            if (!_2560)
            {
                _2454 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2562 = _2454;
            _2456 = _2562;
            if (!_2560)
            {
                _2460 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2564 = _2460;
            _2462 = _2564;
            if (!_2560)
            {
                _2466 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2566 = _2466;
            _2468 = _2566;
            if (!_2560)
            {
                _2472 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2568 = _2472;
            _2474 = _2568;
            if (!_2560)
            {
                _2478 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2570 = _2478;
            _2480 = _2570;
            if (!_2560)
            {
                _2486 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2572 = _2486;
            bool _2574 = !_2560;
            _2488 = _2572;
            if (!_2574)
            {
                bool _2576 = _1879 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2578 = isnan(_1879);
                bool _2580 = _2576 || _2578;
                bool _2582 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2584 = _2580 || _2582;
                if (!_2584)
                {
                    float _2586 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2588 = _1879 + _2586;
                    float _2590 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2592 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2590;
                    float _2594 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2596 = _2594 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2598 = 1.0 / _2592;
                    float _2600 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2602 = _2600 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2604 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2606 = _2604 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2608 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2610 = _2608 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2612 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2614 = _2612 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2616 = _2588 * _2598;
                    float _2618 = precise::clamp(_2616, 0.0, 1.0);
                    float _2620 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2622 = _2620 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2624 = fma(_2618, _2596, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2626 = fma(_2618, _2622, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2628 = fma(_2618, _2602, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2630 = fma(_2618, _2606, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2632 = fma(_2618, _2610, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2634 = fma(_2618, _2614, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2462 = _2628;
                    _2480 = _2632;
                    _2456 = _2624;
                    _2474 = _2630;
                    _2468 = _2626;
                    _2488 = _2634;
                    _2550 = true;
                }
                else
                {
                    _2462 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2480 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2456 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2474 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2468 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2488 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2550 = false;
    float _2636 = _2462;
    float _2638 = _2480;
    float _2640 = _2456;
    float _2642 = _2474;
    float _2644 = _2468;
    float _2646 = _2488;
    float _2648 = _2374 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2650 = fma(_2350, -0.5, 0.5);
    float _2652 = precise::clamp(_2650, 0.0, 1.0);
    float _2654 = -_2636;
    float _2656 = _2654 + _2638;
    float _2658 = -_2640;
    float _2660 = _2658 + _2642;
    out.m_103.x = 0.0;
    float _2662 = fma(_2652, _2656, _2636);
    float _2664 = -_2644;
    float _2666 = _2664 + _2646;
    float _2668 = fma(_2652, _2660, _2640);
    float _2670 = _2662 * 0.586610972881317138671875;
    bool _2672 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2674 = fma(_2652, _2666, _2644);
    out.m_65.x = _2648;
    float _2676 = fma(_2668, 0.298911988735198974609375, _2670);
    bool _2678 = _1789 > 0.0;
    bool _2680 = isnan(_1789);
    bool _2682 = _2678 || _2680;
    bool _2684 = isnan(0.0);
    bool _2686 = _2682 || _2684;
    float _2688 = fma(_2674, 0.114477999508380889892578125, _2676);
    float _2690 = -_2688;
    float _2692 = _2668 + _2690;
    float _2694 = -_2688;
    float _2696 = _2662 + _2694;
    float _2698 = -_2688;
    float _2700 = _2674 + _2698;
    float _2702 = fma(_2692, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2688);
    float _2704 = fma(_2696, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2688);
    float _2706 = fma(_2700, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2688);
    bool _2708 = !_2672;
    if (!_2708)
    {
        float _2710 = -_1705;
        float _2712 = _2710 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2714 = -_1707;
        float _2716 = _2714 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2718 = -_1709;
        float _2720 = _2718 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2722 = _2712 * _2712;
        float _2724 = fma(_2716, _2716, _2722);
        float _2726 = fma(_2720, _2720, _2724);
        float _2728 = sqrt(_2726);
        float _2730 = rsqrt(_2726);
        float _2732 = -_2728;
        float _2734 = _2732 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2736 = _2734 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2738 = precise::clamp(_2736, 0.0, 1.0);
        float _2740 = _2716 * _2730;
        float _2742 = _2712 * _2730;
        float _2744 = abs(_2738);
        float _2746 = log2(_2744);
        float _2748 = _2720 * _2730;
        float _2750 = _2740 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2752 = _2350 * _2742;
        float _2754 = -_2742;
        float _2756 = -_2750;
        float _2758 = fma(_2754, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2756);
        float _2760 = fma(_2348, _2740, _2752);
        float _2762 = -_2748;
        float _2764 = fma(_2762, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2758);
        float _2766 = fma(_2352, _2748, _2760);
        float _2768 = precise::clamp(_2766, 0.0, 1.0);
        float _2770 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2772 = _2764 + _2770;
        float _2774 = _2746 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2776 = _2772 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2778 = precise::clamp(_2776, 0.0, 1.0);
        float _2780 = exp2(_2774);
        float _2782 = _2780 * _2778;
        float _2784 = _2768 * _2782;
        float _2786 = _2784 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2788 = _2784 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2790 = _2784 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_103.x = _2786;
        out.m_103.y = _2788;
        out.m_103.z = _2790;
    }
    out.m_105.x = _2702;
    out.m_105.y = _2704;
    out.m_105.z = _2706;
    if (_2686)
    {
        return out;
    }
    float _2792 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_65.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2792;
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
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2550 = false;
    bool _298 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _119 = in.m_58.w;
    float _121 = in.m_60.w;
    float _123 = trunc(_119);
    int _126 = int(_123);
    float _128 = -_121;
    float _130 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_63.y = _130;
    bool _134 = _126 >= 1;
    float _136 = 0.0;
    float _138 = as_type<float>(_126);
    if (!_134)
    {
        _136 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _136;
    if (!_134)
    {
        out.m_65.x = 0.0;
    }
    int _142 = 0;
    if (!_134)
    {
        float _144 = _140 * 5.0;
        _142 = as_type<int>(_144);
    }
    int _146 = _142;
    int _148 = _146;
    if (!_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2860 = as_type<float>(_146);
        out.gl_Position.z = _2860;
    }
    if (!_134)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _150 = _121 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _152 = isnan(_121);
    bool _154 = _150 || _152;
    bool _156 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _158 = _154 || _156;
    float _160 = in.m_67.y;
    float _162 = float(_126);
    bool _164 = _130 >= _162;
    bool _166 = !_158;
    bool _168 = _164 || _166;
    if (_168)
    {
        _138 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _170 = _138;
    if (_168)
    {
        out.m_65.x = 0.0;
    }
    if (_168)
    {
        float _172 = _170 * 5.0;
        _148 = as_type<int>(_172);
    }
    int _174 = _148;
    out.m_69.y = _160;
    if (_168)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2919 = as_type<float>(_174);
        out.gl_Position.z = _2919;
    }
    if (_168)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _176 = in.m_67.x;
    float _178 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _180 = _130 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _182 = in.m_71.x;
    int _184 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _186 = _184 != 0;
    float _188 = in.m_71.y;
    float _190 = 1.0 / _162;
    int _192 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _194 = _192 != 0;
    int _196 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _198 = _196 != 0;
    float _200 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _202 = _180 * _178;
    out.m_73.w = _200;
    bool _204 = !_198;
    int _206 = _204 ? 0 : 1;
    float _208 = fma(_176, (*spvDescriptorSet0.vp_c9)._m0[20].x, _202);
    int _210 = abs(_206);
    float _212 = _130 * _190;
    float _214 = floor(_208);
    float _216 = _208 * 6.283185482025146484375;
    out.m_75.x = _182;
    float _218 = float(_210);
    float _220 = _216 * 0.15915493667125701904296875;
    out.m_75.y = _188;
    float _222 = -_214;
    float _224 = _208 + _222;
    bool _226 = !_194;
    int _228 = _226 ? 0 : 1;
    float _230 = _220 * 6.283185482025146484375;
    float _232 = cos(_230);
    float _234 = -_224;
    float _236 = fma(_234, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _238 = abs(_228);
    bool _240 = !_186;
    int _242 = _240 ? 0 : 1;
    bool _244 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    int _246 = abs(_242);
    float _248 = float(_238);
    bool _250 = _224 < 0.5;
    float _252 = float(_250);
    float _254 = fma(_232, 0.5, 0.5);
    float _256 = abs(_236);
    float _258 = _248 * _256;
    float _260 = float(_246);
    float _262 = -_252;
    float _264 = fma(_262, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _266 = -_254;
    float _268 = fma(_266, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _270 = fma(_260, _268, _258);
    float _272 = abs(_264);
    float _274 = fma(_218, _272, _270);
    bool _276 = !_244;
    float _278 = _188;
    float _280 = _182;
    float _296;
    if (!_276)
    {
        float _282 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _284 = _176 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _286 = fma(_284, (*spvDescriptorSet0.vp_c9)._m0[14].x, _130);
        float _288 = _286 * _282;
        float _290 = floor(_288);
        float _292 = -_290;
        float _294 = _288 + _292;
        _296 = _294;
        _298 = true;
    }
    else
    {
        _296 = _212;
    }
    _298 = false;
    float _300 = _296;
    float _302 = in.m_58.x;
    float _304 = in.m_58.y;
    float _306 = in.m_58.z;
    float _308 = in.m_77.x;
    float _310 = in.m_77.y;
    float _312 = in.m_77.z;
    float _314 = in.m_77.w;
    int _316 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _318 = _316 != 0;
    int _320 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _322 = _320 != 0;
    float _324 = in.m_79.x;
    float _326 = in.m_79.y;
    float _328 = in.m_79.z;
    float _330 = in.m_79.w;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _334 = _332 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _336 = in.m_81.y;
    float _338 = 1.0 / _334;
    bool _340 = _160 > 0.5;
    float _342 = in.m_83.x;
    float _344 = _304 * _310;
    float _346 = fma(_302, _308, _344);
    float _348 = _304 * _326;
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _352 = _350 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _354 = _304 + _336;
    float _356 = fma(_302, _324, _348);
    float _358 = -_188;
    float _360 = _358 + 1.0;
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _364 = _362 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _366 = in.m_67.z;
    float _368 = in.m_67.w;
    float _370 = fma(_306, _328, _356);
    float _372 = 1.0 / _352;
    float _374 = fma(_306, _312, _346);
    float _376 = _354;
    if (_322)
    {
        float _378 = _340 ? _360 : _188;
        _278 = _378;
    }
    float _380 = _278;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _384 = _382 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _386 = _160 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _388 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _390 = 1.0 / _384;
    float _392 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _394 = _176 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _396 = fma(_386, -2.0, _392);
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _400 = _398 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _402 = 1.0 / _364;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _406 = _404 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _408 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _410 = _176 > 0.5;
    bool _412 = _410 && _318;
    float _414 = _374 + _314;
    float _416 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[79].z, _388);
    float _418 = -_408;
    float _420 = fma(_394, 2.0, _418);
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _424 = _422 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _426 = 1.0 / _400;
    float _428 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[79].x, _416);
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _432 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _430;
    float _434 = _424 * _372;
    float _436 = _428 * (-0.15915493667125701904296875);
    float _438 = _432 * _338;
    float _440 = 1.0 / _406;
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _444 = _442 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _448 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _446;
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _452 = _300 + _450;
    float _454 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _456 = _448 * _402;
    float _458 = _370 + _330;
    float _460 = 1.0 / _444;
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _464 = _462 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _468 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _466;
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _472 = _300 + _470;
    float _474 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _476 = _474 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _478 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[76].y, _396);
    float _480 = -_130;
    float _482 = fma(_480, (*spvDescriptorSet0.vp_c9)._m0[76].x, _420);
    float _484 = fma(_434, _472, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _486 = _436 * 6.283185482025146484375;
    float _488 = sin(_486);
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _492 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _490;
    float _494 = (*spvDescriptorSet0.vp_c9)._m0[166].x;
    float _496 = _414;
    if (!_318)
    {
        _494 = _182;
    }
    float _498 = _494;
    float _500 = _498;
    if (_412)
    {
        float _502 = -_182;
        float _504 = _502 + 1.0;
        _280 = _504;
    }
    float _506 = _280;
    float _508 = _464 * _440;
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _512 = _300 + _510;
    float _514 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _516 = _458 + _514;
    float _518 = _476 * _390;
    if (_318)
    {
        _500 = _506;
    }
    float _520 = _500;
    float _522 = _436 * 6.283185482025146484375;
    float _524 = cos(_522);
    float _526 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _528 = _354 + _526;
    float _530 = _492 * _460;
    float _532 = fma(_438, _512, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _534 = fma(_520, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _536 = _528 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _538 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _540 = _414 + _538;
    float _542 = fma(_456, _452, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _544 = _488 * _454;
    float _546 = fma(_540, (*spvDescriptorSet0.vp_c8)._m0[28].x, _536);
    out.m_85.x = _342;
    float _548 = _468 * _426;
    float _550 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _552 = fma(_516, (*spvDescriptorSet0.vp_c8)._m0[28].z, _546);
    float _554 = _524 * _454;
    float _556 = -_544;
    float _558 = fma(_524, _534, _556);
    bool _560 = _552 >= 0.0;
    float _562 = _528 * _528;
    float _564 = fma(_488, _534, _554);
    float _566 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _568 = fma(_176, (*spvDescriptorSet0.vp_c9)._m0[78].z, _550);
    float _570 = fma(_540, _540, _562);
    float _572 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _574 = _300 + _572;
    float _576 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[78].w, _566);
    float _578 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[77].z, _568);
    float _580 = fma(_516, _516, _570);
    float _582 = fma(_518, _574, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _584 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[77].w, _576);
    float _586 = fma(_578, _558, _482);
    bool _588 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _590 = isnan(_300);
    bool _592 = _588 || _590;
    bool _594 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _596 = _592 || _594;
    float _598 = float(_596);
    float _600 = _342 * 12.98980045318603515625;
    float _602 = rsqrt(_580);
    float _604 = -_478;
    float _606 = fma(_584, _564, _604);
    float _608 = _584;
    if (_560)
    {
        _608 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _610 = _608;
    float _612 = _586 + 0.5;
    bool _614 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _616 = isnan(_300);
    bool _618 = _614 || _616;
    bool _620 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _622 = _618 || _620;
    float _624 = float(_622);
    float _626 = _606 + 0.5;
    float _628 = -_598;
    float _630 = _628 + 1.0;
    int _632 = as_type<int>(_610);
    if (_560)
    {
        float _634 = _610 * 5.0;
        _632 = as_type<int>(_634);
    }
    int _636 = _632;
    if (_560)
    {
        out.m_65.x = 0.0;
    }
    float _638 = fma(_368, 78.233001708984375, _600);
    float _640 = fma(_366, 78.233001708984375, _600);
    float _642 = _624 * _630;
    out.m_87.x = _612;
    out.m_87.y = _626;
    bool _644 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _646 = isnan(_300);
    bool _648 = _644 || _646;
    bool _650 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _652 = _648 || _650;
    float _654 = float(_652);
    float _656 = -_624;
    float _658 = _656 + 1.0;
    bool _660 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _662 = isnan(_300);
    bool _664 = _660 || _662;
    bool _666 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _668 = _664 || _666;
    float _670 = float(_668);
    if (_560)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3719 = as_type<float>(_636);
        out.gl_Position.z = _3719;
    }
    float _672 = _528 * _602;
    float _674 = _540 * _602;
    if (_560)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _676 = -_672;
    float _678 = fma(_676, (*spvDescriptorSet0.vp_c9)._m0[18].w, _354);
    float _680 = _640 * 0.15915493667125701904296875;
    float _682 = _516 * _602;
    float _684 = -_674;
    float _686 = fma(_684, (*spvDescriptorSet0.vp_c9)._m0[18].w, _414);
    float _688 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _690 = _678 + _688;
    float _692 = fma(_176, 78.233001708984375, _600);
    float _694 = -_682;
    float _696 = fma(_694, (*spvDescriptorSet0.vp_c9)._m0[18].w, _458);
    float _698 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _700 = _686 + _698;
    float _702 = _690 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _704 = _680 * 6.283185482025146484375;
    float _706 = sin(_704);
    float _708 = _638 * 0.15915493667125701904296875;
    float _710 = _670 * _658;
    float _712 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _714 = _696 + _712;
    float _716 = fma(_700, (*spvDescriptorSet0.vp_c8)._m0[28].x, _702);
    float _718 = _692 * 0.15915493667125701904296875;
    float _720 = -_670;
    float _722 = _720 + 1.0;
    bool _724 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _726 = isnan(_300);
    bool _728 = _724 || _726;
    bool _730 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _732 = _728 || _730;
    float _734 = float(_732);
    float _736 = fma(_714, (*spvDescriptorSet0.vp_c8)._m0[28].z, _716);
    float _738 = _708 * 6.283185482025146484375;
    float _740 = sin(_738);
    float _742 = _654 * _722;
    float _744 = -_654;
    float _746 = _744 + 1.0;
    float _748 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _750 = _300 + _748;
    bool _752 = _736 >= 0.0;
    float _754 = -_734;
    float _756 = _754 + 1.0;
    float _758 = _734 * _746;
    bool _760 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _762 = isnan(_300);
    bool _764 = _760 || _762;
    bool _766 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _768 = _764 || _766;
    float _770 = float(_768);
    float _772 = _718 * 6.283185482025146484375;
    float _774 = sin(_772);
    float _776 = _706 * 43758.546875;
    float _778 = fma(_548, _750, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    bool _780 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _782 = isnan(_300);
    bool _784 = _780 || _782;
    bool _786 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _788 = _784 || _786;
    float _790 = float(_788);
    float _792 = -_770;
    float _794 = _792 + 1.0;
    bool _796 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _798 = isnan(_300);
    bool _800 = _796 || _798;
    bool _802 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _804 = _800 || _802;
    float _806 = float(_804);
    float _808 = _790 * _794;
    float _810 = floor(_776);
    float _812 = _740 * 43758.546875;
    float _814 = _806 * _756;
    float _816 = -_806;
    float _818 = _816 + 1.0;
    float _820 = _806;
    float _822 = _700;
    if (_752)
    {
        _820 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _824 = _820;
    float _826 = _532 * _808;
    float _828 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _830 = _300 + _828;
    float _832 = _774 * 43758.546875;
    float _834 = floor(_812);
    float _836 = _770 * _818;
    int _838 = as_type<int>(_824);
    if (_752)
    {
        float _840 = _824 * 5.0;
        _838 = as_type<int>(_840);
    }
    int _842 = _838;
    if (_752)
    {
        out.m_65.x = 0.0;
    }
    float _844 = fma(_508, _830, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _846 = floor(_832);
    if (_752)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3982 = as_type<float>(_842);
        out.gl_Position.z = _3982;
    }
    float _848 = -_810;
    float _850 = _776 + _848;
    if (_752)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _852 = -_354;
    float _854 = _852 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _856 = -_790;
    float _858 = _856 + 1.0;
    float _860 = -_414;
    float _862 = _860 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _864 = -_672;
    float _866 = fma(_864, (*spvDescriptorSet0.vp_c9)._m0[18].w, _528);
    float _868 = _854 * _854;
    float _870 = fma(_850, -0.12000000476837158203125, 0.4000000059604644775390625);
    float _872 = -_458;
    float _874 = _872 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _876 = -_674;
    float _878 = fma(_876, (*spvDescriptorSet0.vp_c9)._m0[18].w, _540);
    float _880 = fma(_862, _862, _868);
    float _882 = _866 * _866;
    float _884 = fma(_858, (*spvDescriptorSet0.vp_c9)._m0[159].x, _826);
    float _886 = -_834;
    float _888 = _812 + _886;
    float _890 = fma(_874, _874, _880);
    float _892 = fma(_878, _878, _882);
    float _894 = -_682;
    float _896 = fma(_894, (*spvDescriptorSet0.vp_c9)._m0[18].w, _516);
    float _898 = fma(_484, _836, _884);
    float _900 = rsqrt(_890);
    float _902 = _888 * 0.60000002384185791015625;
    float _904 = fma(_896, _896, _892);
    float _906 = fma(_542, _814, _898);
    float _908 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _910 = _300 + _908;
    float _912 = fma(_160, 78.233001708984375, _600);
    float _914 = precise::max(_212, _902);
    float _916 = fma(_582, _758, _906);
    float _918 = 1.0 / _870;
    float _920 = fma(_530, _910, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _922 = _912 * 0.15915493667125701904296875;
    float _924 = fma(_778, _742, _916);
    float _926 = in.m_89.x;
    float _928 = in.m_89.y;
    float _930 = in.m_89.z;
    float _932 = -_846;
    float _934 = _832 + _932;
    float _936 = fma(_844, _710, _924);
    float _938 = sqrt(_904);
    float _940 = _902 + _870;
    float _942 = _874 * _900;
    float _944 = _854 * _900;
    float _946 = fma(_920, _642, _936);
    float _948 = precise::min(_940, _914);
    float _950 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _952 = _942 * _950;
    float _954 = _922 * 6.283185482025146484375;
    float _956 = sin(_954);
    float _958 = _862 * _900;
    float _960 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _962 = _944 * _960;
    float _964 = -_902;
    float _966 = _964 + _948;
    float _968 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _970 = -_952;
    float _972 = fma(_944, _968, _970);
    float _974 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _976 = _958 * _974;
    float _978 = in.m_91.x;
    float _980 = in.m_91.y;
    float _982 = in.m_91.z;
    float _984 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _986 = -_962;
    float _988 = fma(_958, _984, _986);
    float _990 = _966 * _918;
    float _992 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _994 = -_976;
    float _996 = fma(_942, _992, _994);
    float _998 = _602 * _938;
    float _1000 = fma(_598, (*spvDescriptorSet0.vp_c9)._m0[166].x, _946);
    float _1002 = fma(_990, 2.0, -1.0);
    float _1004 = _996 * _996;
    float _1006 = fma(_934, 2.0, -1.0);
    float _1008 = -_1002;
    float _1010 = fma(_1008, _1002, 1.0);
    float _1012 = precise::clamp(_1010, 0.0, 1.0);
    float _1014 = fma(_972, _972, _1004);
    float _1016 = _956 * 43758.546875;
    float _1018 = _934 * _1012;
    float _1020 = fma(_988, _988, _1014);
    float _1022 = floor(_1016);
    float _1024 = _1018 * _926;
    float _1026 = _1018 * _928;
    float _1028 = _1018 * _930;
    float _1030 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1026);
    float _1032 = rsqrt(_1020);
    float _1034 = _980 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1036 = _978 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1038 = _982 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _1040 = fma(_850, 0.4000000059604644775390625, 0.100000001490116119384765625);
    float _1042 = _274 * _1034;
    float _1044 = _274 * _1036;
    float _1046 = _274 * _1038;
    float _1048 = _130 * _1040;
    float _1050 = _1042 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1052 = _1044 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1054 = -_1022;
    float _1056 = _1016 + _1054;
    float _1058 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1024);
    float _1060 = _998 * _1050;
    float _1062 = _998 * _1052;
    float _1064 = _1046 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1066 = _972 * _1032;
    float _1068 = _996 * _1032;
    float _1070 = _1030 * _1060;
    float _1072 = _988 * _1032;
    float _1074 = _944 * _1066;
    float _1076 = fma(_1056, 6.283185482025146484375, _1048);
    float _1078 = _942 * _1068;
    float _1080 = _1058 * _1062;
    float _1082 = -_1074;
    float _1084 = fma(_958, _1068, _1082);
    float _1086 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1028);
    float _1088 = _998 * _1064;
    float _1090 = fma(_934, 6.283185482025146484375, _1048);
    float _1092 = _1076 * 0.15915493667125701904296875;
    float _1094 = -_1078;
    float _1096 = fma(_944, _1072, _1094);
    float _1098 = _1070 * _1084;
    float _1100 = _1086 * _1088;
    float _1102 = _1092 * 6.283185482025146484375;
    float _1104 = sin(_1102);
    float _1106 = _1090 * 0.15915493667125701904296875;
    float _1108 = _1070 * _1096;
    float _1110 = fma(_1080, _1072, _1098);
    float _1112 = _958 * _1072;
    float _1114 = fma(_1080, _1066, _1108);
    float _1116 = fma(_1100, _942, _1110);
    float _1118 = _1106 * 6.283185482025146484375;
    float _1120 = sin(_1118);
    float _1122 = fma(_850, 2.0, -1.0);
    float _1124 = fma(_1100, _958, _1114);
    float _1126 = _458 + _1116;
    float _1128 = -_1112;
    float _1130 = fma(_942, _1066, _1128);
    float _1132 = _414 + _1124;
    float _1134 = fma(_1000, _1122, _1126);
    float _1136 = fma(_1000, _1006, _1132);
    float _1138 = fma(_1104, 0.02500000037252902984619140625, _1134);
    float _1140 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1142 = _1138 + _1140;
    float _1144 = fma(_1120, 0.02500000037252902984619140625, _1136);
    float _1146 = _1142 * _1142;
    float _1148 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1150 = _1144 + _1148;
    float _1152 = fma(_1150, _1150, _1146);
    float _1154 = _1070 * _1130;
    float _1156 = sqrt(_1152);
    float _1158 = fma(_1080, _1068, _1154);
    float _1160 = fma(_1100, _944, _1158);
    float _1162 = _354 + _1160;
    bool _1164 = _1156 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _1166 = !_1164;
    float _1168 = _1144;
    float _1170 = _1138;
    float _1172 = _1162;
    float _1174 = _868;
    if (!_1166)
    {
        float _1176 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1178 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1180 = _1156 + _1178;
        float _1182 = rsqrt(_1152);
        float _1184 = _1180 * _1176;
        float _1186 = _1162 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1188 = _1184 * 0.15915493667125701904296875;
        float _1190 = _1188 * 6.283185482025146484375;
        float _1192 = cos(_1190);
        float _1194 = _1188 * 6.283185482025146484375;
        float _1196 = sin(_1194);
        float _1198 = _1192 + (-1.0);
        float _1200 = fma(_1196, _1186, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1202 = _1198 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1204 = _1182 * _1200;
        float _1206 = fma(_1162, _1192, _1202);
        float _1208 = fma(_1150, _1204, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1210 = fma(_1142, _1204, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1168 = _1208;
        _1170 = _1210;
        _1172 = _1206;
    }
    float _1212 = _1168;
    float _1214 = _1170;
    float _1216 = _1172;
    float _1218 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _1220 = _1212 + _1218;
    float _1222 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _1224 = _1214 + _1222;
    float _1226 = fma(_1220, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _1228 = fma(_1224, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _4571 = float2(_1226, _1228);
    float _1230 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_4571, float2(0.0), isnan(_4571)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_4571, float2(0.0), isnan(_4571)), level(0.0)).x;
    float _1232 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1234 = fma(_1230, 100.0, _354);
    float _1236 = -_672;
    float _1238 = fma(_1236, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1234);
    float _1240 = _1238 + _1232;
    float _1242 = _1240 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1244 = _1240 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1246 = fma(_686, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1242);
    float _1248 = fma(_686, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1244);
    float _1250 = fma(_696, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1246);
    float _1252 = fma(_696, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1248);
    float _1254 = _1250 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1256 = _1252 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1258 = trunc(_1254);
    int _1260 = int(_1258);
    float _1262 = trunc(_1256);
    int _1264 = int(_1262);
    int _1266 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1268 = _1260 + _1266;
    int _1270 = _1268 + 1;
    bool _1272 = _1270 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1274 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1276 = _1264 + _1274;
    int _1278 = _1276 + 1;
    int _1280 = _1270 | _1278;
    bool _1282 = _1280 < 0;
    bool _1284 = _1282 || _1272;
    bool _1286 = _1278 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1288 = _1286 || _1284;
    int _1290 = _1270;
    int _1292 = _1264;
    int _1294 = _1280;
    int _1296 = as_type<int>(_1232);
    if (!_1288)
    {
        int _1298 = _1278 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1300 = _1298 + _1270;
        _1290 = _1300;
    }
    int _1302 = _1290;
    float _1304 = as_type<float>(_1278);
    if (!_1288)
    {
        float _1306 = floor(_1256);
        _1304 = _1306;
    }
    float _1308 = _1304;
    if (!_1288)
    {
        int _1310 = _1302 << 2;
        _1292 = _1310;
    }
    int _1312 = _1292;
    int _1314 = _1312;
    if (!_1288)
    {
        uint _1317 = uint(int(uint(_1302) >> uint(2)));
        _1294 = int(_1317);
    }
    int _1319 = _1294;
    if (!_1288)
    {
        int _1321 = 12 & _1312;
        _1314 = _1321;
    }
    int _1323 = _1314;
    if (!_1288)
    {
        int _1325 = _1319 << 4;
        int _1327 = _1325 + _1323;
        _1296 = _1327;
    }
    int _1329 = _1296;
    float _1331 = as_type<float>(_1323);
    if (!_1288)
    {
        float _1333 = floor(_1254);
        _1331 = _1333;
    }
    float _1335 = _1331;
    float _1337 = as_type<float>(_1319);
    if (!_1288)
    {
        int _1339 = _1329 + 400;
        uint _1341 = uint(int(uint(_1339) >> uint(2)));
        uint _1343 = uint(int(uint(int(_1341)) >> uint(2)));
        int _1345 = int(_1341) & 3;
        float _1347 = (*spvDescriptorSet0.vp_c15)._m0[int(_1343)][_1345];
        _1337 = _1347;
    }
    float _1349 = _1337;
    if (!_1288)
    {
        float _1351 = -_1308;
        float _1353 = _1256 + _1351;
        _1174 = _1353;
    }
    float _1355 = _1174;
    float _1357 = _1335;
    if (!_1288)
    {
        float _1359 = -_1335;
        float _1361 = _1254 + _1359;
        _1357 = _1361;
    }
    float _1363 = _1357;
    float _1365 = _1349;
    if (!_1288)
    {
        float _1367 = rint(_1349);
        float _1369 = precise::max(_1367, 0.0);
        uint _1371 = uint(_1369);
        uint _1373 = clamp(_1371, 0u, 65535u);
        _1365 = as_type<float>(_1373);
    }
    float _1375 = _1365;
    float _1377 = _1355;
    if (!_1288)
    {
        float3 _4836 = float3(_1363, _1355, float(as_type<int>(_1375)));
        float3 _4840 = select(_4836, float3(0.0), isnan(_4836));
        float _1379 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _4840.xy, uint(rint(_4840.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _4840.xy, uint(rint(_4840.z)), level(0.0)).x;
        _1377 = _1379;
    }
    float _1381 = _1377;
    float _1383 = _1238 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1385 = fma(_1230, 100.0, _1216);
    float _1387 = fma(_686, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1383);
    float _1389 = -_672;
    float _1391 = fma(_1389, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1385);
    float _1393 = fma(_696, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1387);
    float _1395 = _1238 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1397 = _1393 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1399 = fma(_686, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1395);
    float _1401 = 1.0 / _1397;
    float _1403 = fma(_696, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1399);
    float _1405 = _1403 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1407 = _1405 + _1397;
    float _1409 = _1407 * _1401;
    float _1411 = _1409 * 0.5;
    float _1413 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1415 = fma(_1411, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1413);
    float _1417 = 1.0 / _1415;
    float _1419 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1421 = _1417 * _1419;
    bool _1423 = _1421 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1425 = _1421 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _1427 = !_1423;
    int _1429 = _1427 ? 0 : 1;
    int _1431 = 2;
    float _1433 = _1391;
    if (!_1423)
    {
        _1431 = 1;
    }
    int _1435 = _1431;
    int _1437 = _1435;
    if (!_1425)
    {
        _1437 = _1429;
    }
    int _1439 = _1437;
    bool _1441 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1443 = isnan(0.5);
    bool _1445 = _1441 || _1443;
    bool _1447 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1449 = _1445 || _1447;
    int _1451 = _1439 << 6;
    bool _1453 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1455 = isnan(0.5);
    bool _1457 = _1453 || _1455;
    bool _1459 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1461 = _1457 || _1459;
    int _1463 = _1451 + 96;
    uint _1465 = uint(int(uint(_1463) >> uint(2)));
    uint _1467 = uint(int(uint(int(_1465)) >> uint(2)));
    int _1469 = int(_1465) & 3;
    float _1471 = (*spvDescriptorSet0.vp_c15)._m0[int(_1467)][_1469];
    int _1473 = int(_1465) + 1;
    uint _1475 = uint(int(uint(_1473) >> uint(2)));
    int _1477 = _1473 & 3;
    float _1479 = (*spvDescriptorSet0.vp_c15)._m0[int(_1475)][_1477];
    int _1481 = _1451 + 48;
    uint _1483 = uint(int(uint(_1481) >> uint(2)));
    uint _1485 = uint(int(uint(int(_1483)) >> uint(2)));
    int _1487 = int(_1483) & 3;
    float _1489 = (*spvDescriptorSet0.vp_c15)._m0[int(_1485)][_1487];
    int _1491 = int(_1483) + 1;
    uint _1493 = uint(int(uint(_1491) >> uint(2)));
    int _1495 = _1491 & 3;
    float _1497 = (*spvDescriptorSet0.vp_c15)._m0[int(_1493)][_1495];
    int _1499 = _1451 + 104;
    uint _1501 = uint(int(uint(_1499) >> uint(2)));
    uint _1503 = uint(int(uint(int(_1501)) >> uint(2)));
    int _1505 = int(_1501) & 3;
    float _1507 = (*spvDescriptorSet0.vp_c15)._m0[int(_1503)][_1505];
    int _1509 = int(_1501) + 1;
    uint _1511 = uint(int(uint(_1509) >> uint(2)));
    int _1513 = _1509 & 3;
    float _1515 = (*spvDescriptorSet0.vp_c15)._m0[int(_1511)][_1513];
    int _1517 = _1451 + 80;
    uint _1519 = uint(int(uint(_1517) >> uint(2)));
    uint _1521 = uint(int(uint(int(_1519)) >> uint(2)));
    int _1523 = int(_1519) & 3;
    float _1525 = (*spvDescriptorSet0.vp_c15)._m0[int(_1521)][_1523];
    int _1527 = int(_1519) + 1;
    uint _1529 = uint(int(uint(_1527) >> uint(2)));
    int _1531 = _1527 & 3;
    float _1533 = (*spvDescriptorSet0.vp_c15)._m0[int(_1529)][_1531];
    int _1535 = _1451 + 64;
    uint _1537 = uint(int(uint(_1535) >> uint(2)));
    uint _1539 = uint(int(uint(int(_1537)) >> uint(2)));
    int _1541 = int(_1537) & 3;
    float _1543 = (*spvDescriptorSet0.vp_c15)._m0[int(_1539)][_1541];
    int _1545 = int(_1537) + 1;
    uint _1547 = uint(int(uint(_1545) >> uint(2)));
    int _1549 = _1545 & 3;
    float _1551 = (*spvDescriptorSet0.vp_c15)._m0[int(_1547)][_1549];
    int _1553 = _1451 + 56;
    uint _1555 = uint(int(uint(_1553) >> uint(2)));
    uint _1557 = uint(int(uint(int(_1555)) >> uint(2)));
    int _1559 = int(_1555) & 3;
    float _1561 = (*spvDescriptorSet0.vp_c15)._m0[int(_1557)][_1559];
    int _1563 = int(_1555) + 1;
    uint _1565 = uint(int(uint(_1563) >> uint(2)));
    int _1567 = _1563 & 3;
    float _1569 = (*spvDescriptorSet0.vp_c15)._m0[int(_1565)][_1567];
    int _1571 = _1451 + 72;
    uint _1573 = uint(int(uint(_1571) >> uint(2)));
    uint _1575 = uint(int(uint(int(_1573)) >> uint(2)));
    int _1577 = int(_1573) & 3;
    float _1579 = (*spvDescriptorSet0.vp_c15)._m0[int(_1575)][_1577];
    int _1581 = int(_1573) + 1;
    uint _1583 = uint(int(uint(_1581) >> uint(2)));
    int _1585 = _1581 & 3;
    float _1587 = (*spvDescriptorSet0.vp_c15)._m0[int(_1583)][_1585];
    float _1589 = _1240 * _1479;
    float _1591 = fma(_686, _1471, _1589);
    int _1593 = _1451 + 88;
    uint _1595 = uint(int(uint(_1593) >> uint(2)));
    uint _1597 = uint(int(uint(int(_1595)) >> uint(2)));
    int _1599 = int(_1595) & 3;
    float _1601 = (*spvDescriptorSet0.vp_c15)._m0[int(_1597)][_1599];
    int _1603 = int(_1595) + 1;
    uint _1605 = uint(int(uint(_1603) >> uint(2)));
    int _1607 = _1603 & 3;
    float _1609 = (*spvDescriptorSet0.vp_c15)._m0[int(_1605)][_1607];
    float _1611 = _1240 * _1497;
    float _1613 = fma(_686, _1489, _1611);
    float _1615 = fma(_696, _1507, _1591);
    float _1617 = _1615 + _1515;
    float _1619 = -_674;
    float _1621 = fma(_1619, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1212);
    float _1623 = -_682;
    float _1625 = fma(_1623, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1214);
    float _1627 = _1240 * _1533;
    float _1629 = fma(_686, _1525, _1627);
    float _1631 = 1.0 / _1617;
    float _1633 = _1240 * _1551;
    float _1635 = fma(_686, _1543, _1633);
    float _1637 = fma(_696, _1561, _1613);
    float _1639 = _1637 + _1569;
    float _1641 = fma(_696, _1579, _1635);
    float _1643 = _1641 + _1587;
    float _1645 = fma(_696, _1601, _1629);
    float _1647 = _1645 + _1609;
    float _1649 = _1621;
    float _1651 = _1625;
    float _1653 = _1507;
    float _1655 = _1543;
    if (!_1449)
    {
        float _1657 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1659 = _1238 + _1657;
        float _1661 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1663 = -_458;
        float _1665 = _1663 + _1214;
        float _1667 = -_354;
        float _1669 = _1667 + _1216;
        float _1671 = _1659 * _1659;
        float _1673 = fma(_700, _700, _1671);
        float _1675 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1677 = fma(_714, _714, _1673);
        float _1679 = 1.0 / _998;
        float _1681 = sqrt(_1677);
        float _1683 = _1675 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1685 = precise::min(_1681, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1687 = _1685 * _1661;
        float _1689 = _1687 * _1679;
        float _1691 = -_414;
        float _1693 = _1691 + _1212;
        float _1695 = _1683 * _1689;
        float _1697 = _1665 * _1689;
        float _1699 = fma(_1669, _1695, _1238);
        float _1701 = fma(_1693, _1695, _686);
        float _1703 = fma(_1683, _1697, _696);
        _1433 = _1699;
        _1649 = _1701;
        _1651 = _1703;
        _1653 = _1661;
        _1655 = _1693;
        _822 = _1681;
        _376 = _1669;
    }
    float _1705 = _1433;
    float _1707 = _1649;
    float _1709 = _1651;
    float _1711 = _1653;
    float _1713 = _1655;
    float _1715 = _822;
    float _1717 = _376;
    float _1719 = _1639 * _1631;
    float _1721 = _1643 * _1631;
    float _1723 = _1647 * _1631;
    float _1725 = _1717;
    float _1727 = _1713;
    float _1729 = _1711;
    float _1731 = _1715;
    float _1733 = _1723;
    if (_1461)
    {
        _1725 = 1.0;
    }
    float _1735 = _1725;
    float _1737 = _1735;
    if (!_1461)
    {
        float _1739 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1741 = _1739 * 0.15915493667125701904296875;
        float _1743 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1745 = _1741 * 6.283185482025146484375;
        float _1747 = cos(_1745);
        float _1749 = _1743 * 0.15915493667125701904296875;
        float _1751 = _1741 * 6.283185482025146484375;
        float _1753 = sin(_1751);
        float _1755 = 1.0 / _1747;
        float _1757 = _1749 * 6.283185482025146484375;
        float _1759 = cos(_1757);
        float _1761 = _1753 * _1755;
        float _1763 = _1749 * 6.283185482025146484375;
        float _1765 = sin(_1763);
        float _1767 = _1759 * _1761;
        float _1769 = 1.0 / _1767;
        float _1771 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1773 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1771;
        float _1775 = 1.0 / _1773;
        float _1777 = _1765 * _1769;
        float _1779 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1781 = fma(_1421, _1777, _1779);
        float _1783 = _1781 * _1775;
        float _1785 = precise::clamp(_1783, 0.0, 1.0);
        _1727 = _1749;
        _1737 = _1785;
    }
    float _1787 = _1727;
    float _1789 = _1737;
    float _1791 = _1787;
    if (_1288)
    {
        _496 = 1.0;
    }
    float _1793 = _496;
    float _1795 = _1793;
    if (!_1288)
    {
        int _1797 = _1302 << 4;
        int _1799 = _1797 + 2048;
        uint _1801 = uint(int(uint(_1799) >> uint(2)));
        uint _1803 = uint(int(uint(int(_1801)) >> uint(2)));
        int _1805 = int(_1801) & 3;
        float _1807 = (*spvDescriptorSet0.vp_c15)._m0[int(_1803)][_1805];
        int _1809 = int(_1801) + 1;
        uint _1811 = uint(int(uint(_1809) >> uint(2)));
        int _1813 = _1809 & 3;
        float _1815 = (*spvDescriptorSet0.vp_c15)._m0[int(_1811)][_1813];
        int _1817 = _1799 + 8;
        uint _1819 = uint(int(uint(_1817) >> uint(2)));
        uint _1821 = uint(int(uint(int(_1819)) >> uint(2)));
        int _1823 = int(_1819) & 3;
        float _1825 = (*spvDescriptorSet0.vp_c15)._m0[int(_1821)][_1823];
        int _1827 = int(_1819) + 1;
        uint _1829 = uint(int(uint(_1827) >> uint(2)));
        int _1831 = _1827 & 3;
        float _1833 = (*spvDescriptorSet0.vp_c15)._m0[int(_1829)][_1831];
        float _1835 = _1240 * _1815;
        float _1837 = fma(_686, _1807, _1835);
        float _1839 = fma(_696, _1825, _1837);
        float _1841 = _1839 + _1833;
        float _1843 = precise::clamp(_1841, 0.0, 1.0);
        float _1845 = -_1843;
        float _1847 = _1845 + _1381;
        float _1849 = fma(_1847, 500.0, 1.5);
        float _1851 = exp2(_1849);
        float _1853 = 0.0 + _1851;
        float _1855 = precise::clamp(_1853, 0.0, 1.0);
        _1795 = _1855;
    }
    float _1857 = _1795;
    float _1859 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1861 = _1705 + _1859;
    float _1863 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1865 = _1707 + _1863;
    float _1867 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1869 = _1709 + _1867;
    float _1871 = _1861 * _1861;
    float _1873 = fma(_1865, _1865, _1871);
    float _1875 = fma(_1869, _1869, _1873);
    float _1877 = rsqrt(_1875);
    float _1879 = sqrt(_1875);
    float _1881 = _1877 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1883 = _1865 * _1881;
    float _1885 = _1869 * _1881;
    float _1887 = _1883 * _1883;
    float _1889 = _1885 * _1885;
    float _1891 = _1887 + _1889;
    float _1893 = sqrt(_1891);
    bool _1895 = _1893 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1897 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1899 = _1893 + _1897;
    float _1901 = _1877;
    float _1903 = _1899;
    float _1905 = _1861;
    float _1907 = _1883;
    if (_1895)
    {
        float _1909 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1901 = _1909;
    }
    float _1911 = _1901;
    if (_1895)
    {
        float _1913 = rsqrt(_1891);
        _1791 = _1913;
    }
    float _1915 = _1791;
    float _1917 = _1915;
    if (_1895)
    {
        float _1919 = _1899 * _1911;
        _1903 = _1919;
    }
    float _1921 = _1903;
    if (_1895)
    {
        float _1923 = _1921 * 0.15915493667125701904296875;
        _1729 = _1923;
    }
    float _1925 = _1729;
    float _1927 = _1869;
    if (_1895)
    {
        float _1929 = _1925 * 6.283185482025146484375;
        float _1931 = sin(_1929);
        _1927 = _1931;
    }
    float _1933 = _1927;
    float _1935 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1937 = precise::max(0.0, _1935);
    float _1939 = _1911;
    float _1941 = _1937;
    if (_1895)
    {
        float _1943 = _1925 * 6.283185482025146484375;
        float _1945 = cos(_1943);
        _1939 = _1945;
    }
    float _1947 = _1939;
    float _1949 = -_1881;
    float _1951 = -_1937;
    float _1953 = fma(_1861, _1949, _1951);
    if (_1895)
    {
        float _1955 = _1953 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1905 = _1955;
    }
    float _1957 = _1905;
    float _1959 = _1957;
    float _1961 = _1933;
    if (_1895)
    {
        float _1963 = fma(_1933, _1957, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1959 = _1963;
    }
    float _1965 = _1959;
    float _1967 = _1965;
    if (!_1895)
    {
        _1961 = _1885;
    }
    float _1969 = _1961;
    float _1971 = _1969;
    float _1973 = _1947;
    if (_1895)
    {
        float _1975 = _1947 + (-1.0);
        _1941 = _1975;
    }
    float _1977 = _1941;
    float _1979 = _1977;
    if (_1895)
    {
        float _1981 = _1915 * _1965;
        _1731 = _1981;
    }
    float _1983 = _1731;
    if (!_1895)
    {
        _1967 = _1953;
    }
    float _1985 = _1967;
    float _1987 = _1985;
    if (_1895)
    {
        float _1989 = _1977 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1917 = _1989;
    }
    float _1991 = _1917;
    if (_1895)
    {
        float _1993 = _1883 * _1983;
        _1907 = _1993;
    }
    float _1995 = _1907;
    if (!_1895)
    {
        _1979 = _1887;
    }
    float _1997 = _1979;
    float _1999 = _1997;
    if (_1895)
    {
        float _2001 = _1885 * _1983;
        _1971 = _2001;
    }
    float _2003 = _1971;
    if (_1895)
    {
        float _2005 = fma(_1953, _1947, _1991);
        _1987 = _2005;
    }
    float _2007 = _1987;
    if (_1895)
    {
        float _2009 = _1995 * _1995;
        _1999 = _2009;
    }
    float _2011 = _1999;
    if (!_1895)
    {
        _1973 = _1889;
    }
    float _2013 = _1973;
    float _2015 = _2013;
    if (_1895)
    {
        float _2017 = _2003 * _2003;
        _2015 = _2017;
    }
    float _2019 = _2015;
    float _2021 = fma(_2007, _2007, _2011);
    bool _2023 = _1719 >= 0.0;
    float _2025 = _2021 + _2019;
    float _2027 = _1705 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2029 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2031 = fma(_1879, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2029);
    float _2033 = precise::clamp(_2031, 0.0, 1.0);
    float _2035 = fma(_686, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2037 = rsqrt(_2025);
    float _2039 = fma(_1707, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2027);
    float _2041 = -_2033;
    float _2043 = _2041 + 1.0;
    float _2045 = fma(_1709, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2039);
    float _2047 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    bool _2049 = _1719 <= 1.0;
    bool _2051 = _2049 && _2023;
    float _2053 = abs(_2043);
    float _2055 = log2(_2053);
    float _2057 = _2045 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _2059 = _1721 >= 0.0;
    bool _2061 = _2059 && _2051;
    float _2063 = _2057 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    bool _2065 = _1721 <= 1.0;
    bool _2067 = _2065 && _2061;
    float _2069 = _2037 * _1995;
    float _2071 = fma(_696, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2073 = -_2063;
    float _2075 = fma(_2073, _2047, 1.0);
    float _2077 = _2037 * _2007;
    float _2079 = _2069 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2081 = _1705 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2083 = _2037 * _2003;
    float _2085 = _1705 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2087 = -_2079;
    float _2089 = fma(_2077, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2087);
    float _2091 = fma(_1707, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2081);
    float _2093 = floor(_2035);
    float _2095 = _1705 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2097 = -_2083;
    float _2099 = fma(_2097, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2089);
    float _2101 = fma(_1707, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2085);
    float _2103 = fma(_1709, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2091);
    float _2105 = fma(_1707, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2095);
    float _2107 = _2055 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2109 = fma(_1709, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2101);
    float _2111 = _2103 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2113 = floor(_2071);
    float _2115 = fma(_1709, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2105);
    float _2117 = _2109 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2119 = _2111 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2121 = fma(_2099, -0.5, 0.5);
    float _2123 = _2115 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2125 = fma(_2099, 0.5, 0.5);
    float _2127 = fma(_2117, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2119);
    float _2129 = log2(_2075);
    float _2131 = -_2093;
    float _2133 = _2035 + _2131;
    float _2135 = _2111 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2137 = fma(_2125, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2139 = exp2(_2107);
    float _2141 = fma(_2057, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2127);
    float _2143 = -_2113;
    float _2145 = _2071 + _2143;
    float _2147 = _2111 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2149 = fma(_2117, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2135);
    float _2151 = fma(_2123, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2141);
    float _2153 = _2141;
    if (_2067)
    {
        float _2155 = float(_1439);
        _2153 = _2155;
    }
    float _2157 = _2153;
    float _2159 = fma(_2117, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2147);
    float _2161 = sqrt(_2121);
    float _2163 = _2129 * 0.693147182464599609375;
    float _2165 = fma(_2057, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2159);
    float _2167 = _2077 + 1.0;
    float2 _6101 = float2(_2133, _2145);
    float _2169 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6101, float2(0.0), isnan(_6101)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6101, float2(0.0), isnan(_6101)), level(0.0)).x;
    float _2171 = _2163 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2173 = fma(_2123, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2165);
    float _2175 = 1.0 / _2151;
    float _2177 = fma(_2125, _2137, -0.212114393711090087890625);
    float _2179 = fma(_2057, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2149);
    float _2181 = -_2077;
    float _2183 = fma(_2139, _2167, _2181);
    float _2185 = fma(_2125, _2177, 1.570728778839111328125);
    float _2187 = fma(_2123, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2179);
    float _2189 = _2157;
    if (_2067)
    {
        float _2191 = rint(_2157);
        float _2193 = precise::max(_2191, 0.0);
        uint _2195 = uint(_2193);
        uint _2197 = clamp(_2195, 0u, 65535u);
        _2189 = as_type<float>(_2197);
    }
    float _2199 = _2189;
    float _2201 = _2161 * 0.636619746685028076171875;
    float _2203 = -_2185;
    float _2205 = fma(_2201, _2203, 1.0);
    float _2207 = _2173 * _2175;
    float _2209 = _2187 * _2175;
    float _2211 = fma(_2183, 0.5, 0.5);
    float _2213 = fma(_2207, 0.5, 0.5);
    float _2215 = fma(_2209, -0.5, 0.5);
    float _2217 = _2199;
    if (_2067)
    {
        float3 _6185 = float3(_1719, _1721, float(as_type<int>(_2199)));
        float3 _6187 = select(_6185, float3(0.0), isnan(_6185));
        float _2219 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6187.xy, uint(rint(_6187.z)), _1723, level(0.0));
        _2217 = _2219;
    }
    float _2221 = _2217;
    float3 _6197 = float3(_2213, _2215, _2171);
    float _2223 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6197, float3(0.0), isnan(_6197)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6197, float3(0.0), isnan(_6197)), level(0.0)).x;
    float3 _6206 = float3(_2213, _2215, _2171);
    float4 _2226 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6206, float3(0.0), isnan(_6206)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6206, float3(0.0), isnan(_6206)), level(0.0)).xyzw;
    float _2228 = _2226.x;
    float _2230 = _2226.y;
    float _2232 = _2226.z;
    float _2234 = _2226.w;
    float2 _6222 = float2(_2205, _2211);
    float3 _2238 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6222, float2(0.0), isnan(_6222)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6222, float2(0.0), isnan(_6222)), level(0.0)).xyz;
    float _2240 = _2238.x;
    float _2242 = _2238.y;
    float _2244 = _2238.z;
    float _2246 = in.m_93.x;
    float _2248 = in.m_93.y;
    float _2250 = in.m_93.z;
    bool _2252 = _1026 != 0.0;
    bool _2254 = isnan(_1026);
    bool _2256 = _2252 || _2254;
    bool _2258 = isnan(0.0);
    bool _2260 = _2256 || _2258;
    float _2262 = _2111 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2264 = _2055 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_73.w = _200;
    bool _2266 = _1024 == 0.0;
    bool _2268 = !_2260;
    bool _2270 = _2266 && _2268;
    float _2272 = fma(_2117, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2262);
    bool _2274 = _1028 == 0.0;
    bool _2276 = _2274 && _2270;
    float _2278 = fma(_2057, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2272);
    float _2280 = abs(_1421);
    float _2282 = log2(_2280);
    float _2284 = fma(_2123, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2278);
    float _2286 = exp2(_2264);
    bool _2288 = _1421 <= 8000.0;
    bool _2290 = isnan(_1421);
    bool _2292 = _2288 || _2290;
    bool _2294 = isnan(8000.0);
    bool _2296 = _2292 || _2294;
    float _2298 = float(_2296);
    out.gl_Position.x = _2173;
    out.gl_Position.y = _2187;
    out.gl_Position.z = _2284;
    out.gl_Position.w = _2151;
    float _2300 = _2248;
    float _2302 = _2246;
    float _2304 = _2250;
    float _2306 = _2173;
    if (!_2276)
    {
        float _2308 = fma(_1026, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2248);
        _2300 = _2308;
    }
    float _2310 = _2300;
    if (!_2276)
    {
        float _2312 = fma(_1024, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2246);
        _2302 = _2312;
    }
    float _2314 = _2302;
    if (!_2276)
    {
        float _2316 = fma(_1028, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2250);
        _2304 = _2316;
    }
    float _2318 = _2304;
    float _2320 = _1130 * _2310;
    float _2322 = _1096 * _2310;
    float _2324 = _1084 * _2310;
    float _2326 = fma(_1068, _2314, _2320);
    float _2328 = _2282 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2330 = _2284 + _2151;
    float _2332 = -_2286;
    float _2334 = _2332 + 1.0;
    if (!_2067)
    {
        _2306 = 1.0;
    }
    float _2336 = _2306;
    float _2338 = fma(_1066, _2314, _2322);
    float _2340 = _2330 * 0.5;
    float _2342 = exp2(_2328);
    float _2344 = _2334 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2346 = fma(_1072, _2314, _2324);
    float _2348 = fma(_958, _2318, _2338);
    float _2350 = fma(_944, _2318, _2326);
    float _2352 = fma(_942, _2318, _2346);
    out.m_95.x = _2348;
    out.m_95.y = _2350;
    out.m_95.z = _2352;
    out.m_97.z = _2340;
    out.m_97.w = _2151;
    float _2354 = fma(_2342, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2356 = precise::clamp(_2354, 0.0, 1.0);
    float _2358 = fma(_2356, -2.0, 3.0);
    float _2360 = _2356 * _2356;
    float _2362 = _2360 * _2358;
    float _2364 = -_2362;
    float _2366 = _2364 + 1.0;
    float _2368 = fma(_2366, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2362);
    float _2370 = _2298 * _2368;
    float _2372 = _2370 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2374 = _1789 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2376 = -_2169;
    float _2378 = _2376 + 1.0;
    float _2380 = _2378 * _2372;
    float _2382 = precise::clamp(_2380, 0.0, 1.0);
    float _2384 = -_2344;
    float _2386 = _2384 + 1.0;
    float _2388 = -_2382;
    float _2390 = fma(_2388, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2392 = _2336;
    float _2394 = _2362;
    float _2396 = _2386;
    float _2398 = _2344;
    if (_2067)
    {
        bool _2400 = _2221 >= _1723;
        bool _2402 = isnan(_2221);
        bool _2404 = _2400 || _2402;
        bool _2406 = isnan(_1723);
        bool _2408 = _2404 || _2406;
        float _2410 = float(_2408);
        _2392 = _2410;
    }
    float _2412 = _2392;
    float _2414 = _2344 * _2223;
    float _2416 = _2234 * _2386;
    bool _2418 = _1879 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2420 = isnan(_1879);
    bool _2422 = _2418 || _2420;
    bool _2424 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2426 = _2422 || _2424;
    float _2428 = _2412 * _1857;
    float _2430 = _2234 * _2414;
    float _2432 = _2244 * _2414;
    float _2434 = -_2428;
    float _2436 = fma(_2434, _2390, 1.0);
    float _2438 = precise::clamp(_2436, 0.0, 1.0);
    float _2440 = fma(_2240, _2430, _2228);
    float _2442 = fma(_2242, _2430, _2230);
    float _2444 = fma(_2234, _2432, _2232);
    float _2446 = _2438 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2448 = _2430;
    float _2450 = _2438;
    if (!_2426)
    {
        _1733 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2452 = _1733;
    out.m_99.x = _2440;
    out.m_99.y = _2442;
    out.m_99.z = _2444;
    out.m_99.w = _2416;
    float _2454 = _2452;
    float _2456 = _2452;
    if (!_2426)
    {
        _2394 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2458 = _2394;
    float _2460 = _2458;
    float _2462 = _2458;
    if (!_2426)
    {
        _2448 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2464 = _2448;
    out.m_101.x = _2446;
    float _2466 = _2464;
    float _2468 = _2464;
    if (!_2426)
    {
        _2396 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2470 = _2396;
    float _2472 = _2470;
    float _2474 = _2470;
    if (!_2426)
    {
        _2398 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2476 = _2398;
    float _2478 = _2476;
    float _2480 = _2476;
    if (!_2426)
    {
        _2450 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2482 = _2450;
    bool _2484 = !_2426;
    float _2486 = _2482;
    float _2488 = _2482;
    if (!_2484)
    {
        bool _2490 = _1879 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2492 = isnan(_1879);
        bool _2494 = _2490 || _2492;
        bool _2496 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2498 = _2494 || _2496;
        if (!_2498)
        {
            float _2500 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2502 = _1879 + _2500;
            float _2504 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2506 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2504;
            float _2508 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2510 = _2508 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2512 = 1.0 / _2506;
            float _2514 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2516 = _2514 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2518 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2520 = _2518 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2522 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2524 = _2522 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2526 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2528 = _2526 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2530 = _2502 * _2512;
            float _2532 = precise::clamp(_2530, 0.0, 1.0);
            float _2534 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2536 = _2534 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2538 = fma(_2532, _2510, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2540 = fma(_2532, _2536, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2542 = fma(_2532, _2516, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2544 = fma(_2532, _2520, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2546 = fma(_2532, _2524, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2548 = fma(_2532, _2528, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2462 = _2542;
            _2480 = _2546;
            _2456 = _2538;
            _2474 = _2544;
            _2468 = _2540;
            _2488 = _2548;
            _2550 = true;
        }
        else
        {
            bool _2552 = _1879 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2554 = isnan(_1879);
            bool _2556 = _2552 || _2554;
            bool _2558 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2560 = _2556 || _2558;
            if (!_2560)
            {
                _2454 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2562 = _2454;
            _2456 = _2562;
            if (!_2560)
            {
                _2460 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2564 = _2460;
            _2462 = _2564;
            if (!_2560)
            {
                _2466 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2566 = _2466;
            _2468 = _2566;
            if (!_2560)
            {
                _2472 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2568 = _2472;
            _2474 = _2568;
            if (!_2560)
            {
                _2478 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2570 = _2478;
            _2480 = _2570;
            if (!_2560)
            {
                _2486 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2572 = _2486;
            bool _2574 = !_2560;
            _2488 = _2572;
            if (!_2574)
            {
                bool _2576 = _1879 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2578 = isnan(_1879);
                bool _2580 = _2576 || _2578;
                bool _2582 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2584 = _2580 || _2582;
                if (!_2584)
                {
                    float _2586 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2588 = _1879 + _2586;
                    float _2590 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2592 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2590;
                    float _2594 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2596 = _2594 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2598 = 1.0 / _2592;
                    float _2600 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2602 = _2600 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2604 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2606 = _2604 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2608 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2610 = _2608 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2612 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2614 = _2612 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2616 = _2588 * _2598;
                    float _2618 = precise::clamp(_2616, 0.0, 1.0);
                    float _2620 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2622 = _2620 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2624 = fma(_2618, _2596, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2626 = fma(_2618, _2622, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2628 = fma(_2618, _2602, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2630 = fma(_2618, _2606, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2632 = fma(_2618, _2610, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2634 = fma(_2618, _2614, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2462 = _2628;
                    _2480 = _2632;
                    _2456 = _2624;
                    _2474 = _2630;
                    _2468 = _2626;
                    _2488 = _2634;
                    _2550 = true;
                }
                else
                {
                    _2462 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2480 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2456 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2474 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2468 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2488 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2550 = false;
    float _2636 = _2462;
    float _2638 = _2480;
    float _2640 = _2456;
    float _2642 = _2474;
    float _2644 = _2468;
    float _2646 = _2488;
    float _2648 = _2374 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2650 = fma(_2350, -0.5, 0.5);
    float _2652 = precise::clamp(_2650, 0.0, 1.0);
    float _2654 = -_2636;
    float _2656 = _2654 + _2638;
    float _2658 = -_2640;
    float _2660 = _2658 + _2642;
    out.m_103.x = 0.0;
    float _2662 = fma(_2652, _2656, _2636);
    float _2664 = -_2644;
    float _2666 = _2664 + _2646;
    float _2668 = fma(_2652, _2660, _2640);
    float _2670 = _2662 * 0.586610972881317138671875;
    bool _2672 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2674 = fma(_2652, _2666, _2644);
    out.m_65.x = _2648;
    float _2676 = fma(_2668, 0.298911988735198974609375, _2670);
    bool _2678 = _1789 > 0.0;
    bool _2680 = isnan(_1789);
    bool _2682 = _2678 || _2680;
    bool _2684 = isnan(0.0);
    bool _2686 = _2682 || _2684;
    float _2688 = fma(_2674, 0.114477999508380889892578125, _2676);
    float _2690 = -_2688;
    float _2692 = _2668 + _2690;
    float _2694 = -_2688;
    float _2696 = _2662 + _2694;
    float _2698 = -_2688;
    float _2700 = _2674 + _2698;
    float _2702 = fma(_2692, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2688);
    float _2704 = fma(_2696, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2688);
    float _2706 = fma(_2700, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2688);
    bool _2708 = !_2672;
    if (!_2708)
    {
        float _2710 = -_1705;
        float _2712 = _2710 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2714 = -_1707;
        float _2716 = _2714 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2718 = -_1709;
        float _2720 = _2718 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2722 = _2712 * _2712;
        float _2724 = fma(_2716, _2716, _2722);
        float _2726 = fma(_2720, _2720, _2724);
        float _2728 = sqrt(_2726);
        float _2730 = rsqrt(_2726);
        float _2732 = -_2728;
        float _2734 = _2732 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2736 = _2734 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2738 = precise::clamp(_2736, 0.0, 1.0);
        float _2740 = _2716 * _2730;
        float _2742 = _2712 * _2730;
        float _2744 = abs(_2738);
        float _2746 = log2(_2744);
        float _2748 = _2720 * _2730;
        float _2750 = _2740 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2752 = _2350 * _2742;
        float _2754 = -_2742;
        float _2756 = -_2750;
        float _2758 = fma(_2754, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2756);
        float _2760 = fma(_2348, _2740, _2752);
        float _2762 = -_2748;
        float _2764 = fma(_2762, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2758);
        float _2766 = fma(_2352, _2748, _2760);
        float _2768 = precise::clamp(_2766, 0.0, 1.0);
        float _2770 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2772 = _2764 + _2770;
        float _2774 = _2746 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2776 = _2772 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2778 = precise::clamp(_2776, 0.0, 1.0);
        float _2780 = exp2(_2774);
        float _2782 = _2780 * _2778;
        float _2784 = _2768 * _2782;
        float _2786 = _2784 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2788 = _2784 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2790 = _2784 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_103.x = _2786;
        out.m_103.y = _2788;
        out.m_103.z = _2790;
    }
    out.m_105.x = _2702;
    out.m_105.y = _2704;
    out.m_105.z = _2706;
    if (_2686)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2792 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_65.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2792;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

