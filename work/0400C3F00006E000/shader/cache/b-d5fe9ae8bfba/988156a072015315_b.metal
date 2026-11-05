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
    texture2d<float> vp_t_tcb_20 [[id(7)]];
    sampler vp_t_tcb_20Smplr [[id(8)]];
    texture2d<float> vp_t_tcb_24 [[id(9)]];
    sampler vp_t_tcb_24Smplr [[id(10)]];
    texture2d_array<float> vp_t_tcb_16 [[id(11)]];
    sampler vp_t_tcb_16Smplr [[id(12)]];
    texture3d<float> vp_t_tcb_32 [[id(13)]];
    sampler vp_t_tcb_32Smplr [[id(14)]];
    texture3d<float> vp_t_tcb_30 [[id(15)]];
    sampler vp_t_tcb_30Smplr [[id(16)]];
    texture2d<float> vp_t_tcb_1C [[id(17)]];
    sampler vp_t_tcb_1CSmplr [[id(18)]];
    texture2d_array<float> vp_t_tcb_14 [[id(19)]];
    sampler vp_t_tcb_14Smplr [[id(20)]];
    sampler vp_t_tcb_20Smplr_w [[id(21)]];
    sampler vp_t_tcb_24Smplr_w [[id(22)]];
    sampler vp_t_tcb_32Smplr_w [[id(23)]];
    sampler vp_t_tcb_30Smplr_w [[id(24)]];
    sampler vp_t_tcb_1CSmplr_w [[id(25)]];
    sampler vp_t_tcb_14Smplr_w [[id(26)]];
    constant dm_border_t* dm_border [[id(27)]];
};

struct main0_out
{
    float4 m_81 [[user(locn0)]];
    float4 m_63 [[user(locn2)]];
    float4 m_105 [[user(locn3)]];
    float4 m_79 [[user(locn4)]];
    float4 m_85 [[user(locn5)]];
    float4 m_95 [[user(locn6)]];
    float4 m_89 [[user(locn7)]];
    float4 m_91 [[user(locn8)]];
    float4 m_97 [[user(locn9)]];
    float4 m_87 [[user(locn10)]];
    float4 m_103 [[user(locn11)]];
    float4 m_93 [[user(locn12)]];
    float4 m_99 [[user(locn13)]];
    float4 m_101 [[user(locn14)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_69 [[attribute(1)]];
    float4 m_60 [[attribute(2)]];
    float4 m_65 [[attribute(3)]];
    float4 m_77 [[attribute(4)]];
    float4 m_73 [[attribute(5)]];
    float4 m_67 [[attribute(6)]];
    float4 m_71 [[attribute(7)]];
    float4 m_83 [[attribute(8)]];
    float4 m_75 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2408 = false;
    bool _1282 = false;
    bool _202 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _119 = in.m_60.w;
    float _121 = trunc(_119);
    int _124 = int(_121);
    bool _128 = _124 >= 1;
    float _130 = 0.0;
    if (!_128)
    {
        _130 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _132 = _130;
    if (!_128)
    {
        out.m_63.x = 0.0;
    }
    int _134 = 0;
    if (!_128)
    {
        float _136 = _132 * 5.0;
        _134 = as_type<int>(_136);
    }
    int _138 = _134;
    int _140 = _138;
    if (!_128)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2692 = as_type<float>(_138);
        out.gl_Position.z = _2692;
    }
    if (!_128)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _142 = in.m_65.w;
    bool _144 = _142 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _146 = isnan(_142);
    bool _148 = _144 || _146;
    bool _150 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _152 = _148 || _150;
    float _154 = -_142;
    float _156 = _154 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _158 = 0.0;
    float _160 = _156;
    if (_152)
    {
        float _162 = float(_124);
        _158 = _162;
    }
    float _164 = _158;
    bool _166 = _156 >= _164;
    bool _168 = !_152;
    bool _170 = _166 || _168;
    float _172 = _164;
    if (_170)
    {
        _172 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _174 = _172;
    if (_170)
    {
        out.m_63.x = 0.0;
    }
    if (_170)
    {
        float _176 = _174 * 5.0;
        _140 = as_type<int>(_176);
    }
    int _178 = _140;
    if (_170)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2762 = as_type<float>(_178);
        out.gl_Position.z = _2762;
    }
    if (_170)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _180 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _182 = !_180;
    float _200;
    if (!_182)
    {
        float _184 = in.m_67.x;
        float _186 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _188 = _184 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _190 = fma(_188, (*spvDescriptorSet0.vp_c9)._m0[12].x, _156);
        float _192 = _190 * _186;
        float _194 = floor(_192);
        float _196 = -_194;
        float _198 = _192 + _196;
        _200 = _198;
        _202 = true;
    }
    else
    {
        float _204 = float(_124);
        float _206 = 1.0 / _204;
        float _208 = _156 * _206;
        _200 = _208;
    }
    _202 = false;
    float _210 = _200;
    float _212 = in.m_67.x;
    float _214 = in.m_67.y;
    float _216 = in.m_67.z;
    float _218 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _220 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _218;
    int _222 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _224 = _222 != 0;
    int _226 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _228 = _226 != 0;
    int _230 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _232 = _230 != 0;
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _236 = _234 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _238 = 1.0 / _220;
    float _240 = 1.0 / _236;
    float _242 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _244 = _210 + _242;
    float _246 = _216 * 2.0;
    float _248 = _212 * 2.0;
    float _250 = _214 + _216;
    float _252 = _212 + _216;
    float _254 = floor(_246);
    float _256 = _216 + (-0.5);
    float _258 = _214 + _212;
    float _260 = _212 + (-0.5);
    float _262 = _214 * 2.0;
    float _264 = _214 + (-0.5);
    float _266 = _250 + (-1.0);
    float _268 = _244 * _238;
    float _270 = floor(_248);
    bool _272 = !_224;
    int _274 = _272 ? 0 : 1;
    float _276 = _252 + (-1.0);
    float _278 = fma(_266, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _280 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _282 = _210 + _280;
    int _284 = abs(_274);
    float _286 = _258 + (-1.0);
    float _288 = fma(_276, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _290 = _254 > 0.0;
    float _292 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _294 = log2(_292);
    bool _296 = _254 >= 0.0;
    bool _298 = isnan(_254);
    bool _300 = _296 || _298;
    bool _302 = isnan(0.0);
    bool _304 = _300 || _302;
    float _306 = _282 * _240;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _310 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _308;
    int _312 = _304 ? 0 : 1;
    bool _314 = _270 > 0.0;
    float _316 = floor(_262);
    int _318 = ~_312;
    int _320 = _318 + 1;
    int _322 = _320 + 1;
    float _324 = fma(_286, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _326 = _270 >= 0.0;
    bool _328 = isnan(_270);
    bool _330 = _326 || _328;
    bool _332 = isnan(0.0);
    bool _334 = _330 || _332;
    float _336 = fma(_310, _268, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    int _338 = _322;
    if (!_290)
    {
        int _340 = ~_312;
        int _342 = _340 + 1;
        _338 = _342;
    }
    int _344 = _338;
    float _346 = float(_284);
    float _348 = float(_344);
    float _350 = _294 * _156;
    int _352 = _334 ? 0 : 1;
    float _354 = _346 * _348;
    int _356 = ~_352;
    int _358 = _356 + 1;
    int _360 = _358 + 1;
    float _362 = in.m_69.x;
    float _364 = in.m_69.y;
    float _366 = in.m_69.z;
    int _368 = _360;
    if (!_314)
    {
        int _370 = ~_352;
        int _372 = _370 + 1;
        _368 = _372;
    }
    int _374 = _368;
    float _376 = _354 * (-2.0);
    float _378 = exp2(_350);
    bool _380 = _316 > 0.0;
    bool _382 = _316 >= 0.0;
    bool _384 = isnan(_316);
    bool _386 = _382 || _384;
    bool _388 = isnan(0.0);
    bool _390 = _386 || _388;
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _394 = 1.0 + _392;
    bool _396 = !_228;
    int _398 = _396 ? 0 : 1;
    float _400 = float(_374);
    int _402 = abs(_398);
    float _404 = 1.0 / _394;
    bool _406 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _408 = isnan(1.0);
    bool _410 = _406 || _408;
    bool _412 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _414 = _410 || _412;
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _418 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _416;
    float _420 = float(_402);
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _424 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _422;
    bool _426 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _428 = isnan(0.0);
    bool _430 = _426 || _428;
    bool _432 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _434 = _430 || _432;
    float _436 = -_378;
    float _438 = _436 + 1.0;
    float _440 = fma(_418, _268, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _442 = _420 * _400;
    int _444 = _390 ? 0 : 1;
    float _446 = fma(_424, _268, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _448 = _434 ? _438 : 0.0;
    float _450 = _442 * (-2.0);
    float _452 = fma(_376, _362, _362);
    float _454 = fma(_324, _376, _324);
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _458 = _456 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    if (_414)
    {
        float _460 = _448 * _404;
        _160 = _460;
    }
    float _462 = _160;
    float _464 = fma(_260, (*spvDescriptorSet0.vp_c9)._m0[196].x, _452);
    float _466 = fma(_450, _364, _364);
    int _468 = ~_444;
    int _470 = _468 + 1;
    int _472 = _470 + 1;
    float _474 = fma(_278, _450, _278);
    float _476 = fma(_454, _462, _464);
    bool _478 = _210 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _480 = isnan(_210);
    bool _482 = _478 || _480;
    bool _484 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _486 = _482 || _484;
    float _488 = float(_486);
    int _490 = _472;
    if (!_380)
    {
        int _492 = ~_444;
        int _494 = _492 + 1;
        _490 = _494;
    }
    int _496 = _490;
    float _498 = fma(_264, (*spvDescriptorSet0.vp_c9)._m0[196].y, _466);
    bool _500 = !_232;
    int _502 = _500 ? 0 : 1;
    float _504 = -_488;
    float _506 = _504 + 1.0;
    bool _508 = _210 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _510 = isnan(_210);
    bool _512 = _508 || _510;
    bool _514 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _516 = _512 || _514;
    float _518 = float(_516);
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _522 = _520 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    int _524 = abs(_502);
    float _526 = _476 * 0.15915493667125701904296875;
    bool _528 = _210 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _530 = isnan(_210);
    bool _532 = _528 || _530;
    bool _534 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _536 = _532 || _534;
    float _538 = float(_536);
    float _540 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _542 = _540 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _544 = _518 * _506;
    float _546 = -_518;
    float _548 = _546 + 1.0;
    float _550 = fma(_542, _306, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _552 = float(_496);
    float _554 = fma(_474, _462, _498);
    float _556 = float(_524);
    float _558 = fma(_458, _306, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _560 = fma(_522, _306, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _562 = _538 * _548;
    float _564 = -_538;
    float _566 = _564 + 1.0;
    float _568 = _556 * _552;
    float _570 = _526 * 6.283185482025146484375;
    float _572 = cos(_570);
    float _574 = in.m_71.x;
    float _576 = in.m_71.y;
    float _578 = in.m_71.z;
    float _580 = _336 * _562;
    float _582 = _568 * (-2.0);
    float _584 = _440 * _562;
    float _586 = _446 * _562;
    float _588 = _554 * 0.15915493667125701904296875;
    float _590 = fma(_582, _366, _366);
    float _592 = in.m_73.x;
    float _594 = in.m_73.y;
    float _596 = in.m_73.z;
    float _598 = fma(_288, _582, _288);
    float _600 = fma(_566, (*spvDescriptorSet0.vp_c9)._m0[143].x, _584);
    float _602 = fma(_256, (*spvDescriptorSet0.vp_c9)._m0[196].z, _590);
    float _604 = fma(_566, (*spvDescriptorSet0.vp_c9)._m0[143].y, _586);
    float _606 = fma(_566, (*spvDescriptorSet0.vp_c9)._m0[143].z, _580);
    float _608 = fma(_550, _544, _600);
    float _610 = fma(_598, _462, _602);
    float _612 = fma(_560, _544, _604);
    float _614 = fma(_558, _544, _606);
    float _616 = _588 * 6.283185482025146484375;
    float _618 = sin(_616);
    float _620 = _610 * 0.15915493667125701904296875;
    float _622 = fma(_488, (*spvDescriptorSet0.vp_c9)._m0[145].y, _612);
    float _624 = fma(_488, (*spvDescriptorSet0.vp_c9)._m0[145].z, _614);
    float _626 = fma(_488, (*spvDescriptorSet0.vp_c9)._m0[145].x, _608);
    float _628 = _624 * _578;
    float _630 = _588 * 6.283185482025146484375;
    float _632 = cos(_630);
    float _634 = in.m_60.x;
    float _636 = in.m_60.y;
    float _638 = in.m_60.z;
    float _640 = _622 * _576;
    float _642 = _626 * _574;
    float _644 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _594);
    float _646 = _640 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _648 = _526 * 6.283185482025146484375;
    float _650 = sin(_648);
    float _652 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _592);
    float _654 = _642 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _656 = _644 * _646;
    float _658 = _572 * _618;
    float _660 = _628 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _662 = _652 * _654;
    float _664 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _596);
    float _666 = _620 * 6.283185482025146484375;
    float _668 = cos(_666);
    float _670 = _572 * _632;
    float _672 = _664 * _660;
    float _674 = _620 * 6.283185482025146484375;
    float _676 = sin(_674);
    float _678 = _650 * _618;
    float _680 = _650 * _632;
    float _682 = _636 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _684 = _636 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _686 = _636 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _688 = fma(_634, (*spvDescriptorSet0.vp_c10)._m0[4].x, _682);
    float _690 = _572 * _668;
    float _692 = _632 * _668;
    float _694 = _650 * _668;
    float _696 = _618 * _668;
    float _698 = _690 * _656;
    float _700 = fma(_634, (*spvDescriptorSet0.vp_c10)._m0[6].x, _684);
    float _702 = _694 * _656;
    float _704 = fma(_638, (*spvDescriptorSet0.vp_c10)._m0[4].z, _688);
    float _706 = fma(_676, _670, _678);
    float _708 = fma(_676, _678, _670);
    float _710 = -_658;
    float _712 = fma(_676, _680, _710);
    float _714 = -_656;
    float _716 = _676 * _714;
    float _718 = -_680;
    float _720 = fma(_676, _658, _718);
    float _722 = fma(_706, _662, _698);
    float _724 = fma(_712, _662, _702);
    float _726 = fma(_692, _662, _716);
    float _728 = fma(_638, (*spvDescriptorSet0.vp_c10)._m0[6].z, _700);
    float _730 = fma(_720, _672, _722);
    float _732 = fma(_708, _672, _724);
    float _734 = fma(_696, _672, _726);
    float _736 = _704 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _738 = _730 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _740 = _730 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _742 = _728 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _744 = fma(_634, (*spvDescriptorSet0.vp_c10)._m0[5].x, _686);
    float _746 = fma(_734, (*spvDescriptorSet0.vp_c10)._m0[8].x, _738);
    float _748 = fma(_734, (*spvDescriptorSet0.vp_c10)._m0[10].x, _740);
    float _750 = fma(_638, (*spvDescriptorSet0.vp_c10)._m0[5].z, _744);
    float _752 = fma(_732, (*spvDescriptorSet0.vp_c10)._m0[8].z, _746);
    float _754 = fma(_732, (*spvDescriptorSet0.vp_c10)._m0[10].z, _748);
    float _756 = _750 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _758 = _736 + _752;
    float _760 = _742 + _754;
    float _762 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _764 = _758 + _762;
    float _766 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _768 = _760 + _766;
    float _770 = _764 * _764;
    float _772 = _768 * _768;
    float _774 = _770 + _772;
    float _776 = sqrt(_774);
    bool _778 = _776 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _780 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _782 = _776 + _780;
    float _784 = _730 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _786 = fma(_734, (*spvDescriptorSet0.vp_c10)._m0[9].x, _784);
    float _788 = fma(_732, (*spvDescriptorSet0.vp_c10)._m0[9].z, _786);
    float _790 = 0.0;
    float _792 = _786;
    float _794 = _734;
    float _796 = _758;
    float _798 = _760;
    float _800 = _770;
    float _802 = _772;
    float _804 = _742;
    if (_778)
    {
        float _806 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _790 = _806;
    }
    float _808 = _790;
    float _810 = _756 + _788;
    float _812 = _810;
    if (_778)
    {
        float _814 = _810 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _792 = _814;
    }
    float _816 = _792;
    float _818 = _816;
    if (_778)
    {
        float _820 = rsqrt(_774);
        _794 = _820;
    }
    float _822 = _794;
    float _824 = _808;
    if (_778)
    {
        float _826 = _782 * _808;
        _824 = _826;
    }
    float _828 = _824;
    float _830 = _828;
    if (_778)
    {
        float _832 = _828 * 0.15915493667125701904296875;
        _830 = _832;
    }
    float _834 = _830;
    float _836 = _634;
    if (_778)
    {
        float _838 = _834 * 6.283185482025146484375;
        float _840 = sin(_838);
        _836 = _840;
    }
    float _842 = _836;
    if (_778)
    {
        float _844 = fma(_842, _816, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _818 = _844;
    }
    float _846 = _818;
    float _848 = _846;
    if (_778)
    {
        float _850 = _822 * _846;
        _848 = _850;
    }
    float _852 = _848;
    if (_778)
    {
        float _854 = fma(_764, _852, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _796 = _854;
    }
    float _856 = _796;
    if (_778)
    {
        float _858 = fma(_768, _852, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _798 = _858;
    }
    float _860 = _798;
    float _862 = fma(_856, 6.2500002968590706586837768554688e-05, 0.5);
    float _864 = fma(_860, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _3812 = float2(_862, _864);
    float3 _868 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_3812, float2(0.0), isnan(_3812)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_3812, float2(0.0), isnan(_3812)), level(0.0)).xyz;
    float _870 = _868.x;
    float _872 = _868.y;
    float _874 = _868.z;
    float _876 = in.m_75.y;
    bool _878 = _594 != 0.0;
    bool _880 = isnan(_594);
    bool _882 = _878 || _880;
    bool _884 = isnan(0.0);
    bool _886 = _882 || _884;
    float _888 = _834;
    if (_778)
    {
        float _890 = _834 * 6.283185482025146484375;
        float _892 = cos(_890);
        _888 = _892;
    }
    float _894 = _888;
    int _896 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _898 = _896 != 0;
    float _900 = in.m_67.w;
    bool _902 = _592 == 0.0;
    bool _904 = !_886;
    bool _906 = _902 && _904;
    int _908 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _910 = _908 != 0;
    float _912 = in.m_77.x;
    float _914 = in.m_77.y;
    float _916 = in.m_77.z;
    bool _918 = _596 == 0.0;
    bool _920 = _918 && _906;
    float _922 = in.m_75.x;
    float _924 = _782;
    float _926 = 1.0;
    float _928 = 1.0;
    if (_898)
    {
        float _930 = in.m_67.z;
        _924 = _930;
    }
    float _932 = _924;
    out.m_79.x = 1.0;
    out.m_79.y = 1.0;
    out.m_79.z = 1.0;
    float _934 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _936 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _938 = -_876;
    float _940 = _938 + 1.0;
    float _942 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _944 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _946 = _934 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _948 = _900 > 0.5;
    float _950 = _936 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _952 = _942 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _954 = _876;
    if (_910)
    {
        float _956 = _948 ? _940 : _876;
        _954 = _956;
    }
    float _958 = _954;
    float _960 = 0.0;
    float _962 = _912;
    float _964 = _914;
    if (_920)
    {
        _960 = _912;
    }
    float _966 = _960;
    out.m_81.x = _946;
    out.m_81.y = _950;
    out.m_81.z = _952;
    out.m_81.w = _944;
    float _968 = _966;
    float _970 = _922;
    if (!_898)
    {
        _926 = _922;
    }
    float _972 = _926;
    float _974 = 0.0;
    float _976 = _972;
    if (_920)
    {
        _974 = _966;
    }
    float _978 = _974;
    bool _980 = _932 > 0.5;
    bool _982 = _980 && _898;
    float _984 = in.m_83.x;
    float _986 = in.m_83.y;
    float _988 = in.m_83.z;
    float _990 = in.m_83.w;
    float _992 = _978;
    if (!_920)
    {
        _968 = _912;
    }
    float _994 = _968;
    if (_920)
    {
        _962 = _914;
    }
    float _996 = _962;
    float _998 = _996;
    if (_920)
    {
        _928 = _916;
    }
    float _1000 = _928;
    float _1002 = _1000;
    if (!_920)
    {
        float _1004 = fma(_596, (*spvDescriptorSet0.vp_c9)._m0[17].y, _916);
        _1002 = _1004;
    }
    float _1006 = _1002;
    float _1008 = 0.0;
    if (_920)
    {
        _1008 = _996;
    }
    float _1010 = _1008;
    float _1012 = _1010;
    if (!_920)
    {
        float _1014 = fma(_592, (*spvDescriptorSet0.vp_c9)._m0[17].y, _994);
        _992 = _1014;
    }
    float _1016 = _992;
    if (!_920)
    {
        _998 = _914;
    }
    float _1018 = _998;
    if (_898)
    {
        _964 = _922;
    }
    float _1020 = _964;
    float _1022 = _1020;
    if (!_920)
    {
        float _1024 = fma(_594, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1018);
        _1012 = _1024;
    }
    float _1026 = _1012;
    if (_982)
    {
        float _1028 = -_1020;
        float _1030 = _1028 + 1.0;
        _1022 = _1030;
    }
    float _1032 = _1022;
    float _1034 = -_1026;
    float _1036 = _676 * _1034;
    float _1038 = _694 * _1026;
    if (_898)
    {
        _976 = _1032;
    }
    float _1040 = _976;
    float _1042 = fma(_692, _1016, _1036);
    float _1044 = fma(_712, _1016, _1038);
    float _1046 = _988 * _994;
    float _1048 = _986 * _916;
    float _1050 = _984 * _1018;
    float _1052 = fma(_696, _1006, _1042);
    float _1054 = -_1046;
    float _1056 = fma(_984, _916, _1054);
    float _1058 = -_1048;
    float _1060 = fma(_988, _1018, _1058);
    float _1062 = -_1050;
    float _1064 = fma(_986, _994, _1062);
    float _1066 = -_986;
    float _1068 = _676 * _1066;
    float _1070 = _1056 * _990;
    float _1072 = _690 * _1026;
    float _1074 = _1060 * _990;
    float _1076 = _1064 * _990;
    float _1078 = -_1070;
    float _1080 = _676 * _1078;
    float _1082 = _690 * _986;
    float _1084 = _690 * _1070;
    float _1086 = _694 * _986;
    float _1088 = _694 * _1070;
    float _1090 = fma(_706, _1016, _1072);
    float _1092 = fma(_692, _1074, _1080);
    float _1094 = fma(_706, _1074, _1084);
    float _1096 = fma(_692, _984, _1068);
    float _1098 = fma(_706, _984, _1082);
    float _1100 = fma(_712, _984, _1086);
    float _1102 = fma(_712, _1074, _1088);
    float _1104 = fma(_720, _1006, _1090);
    float _1106 = fma(_696, _988, _1096);
    float _1108 = fma(_720, _988, _1098);
    float _1110 = fma(_708, _988, _1100);
    float _1112 = fma(_696, _1076, _1092);
    float _1114 = fma(_720, _1076, _1094);
    float _1116 = fma(_708, _1076, _1102);
    float _1118 = _1104 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1120 = _1076;
    float _1122 = _1118;
    if (_778)
    {
        float _1124 = _894 + (-1.0);
        _1120 = _1124;
    }
    float _1126 = _1120;
    float _1128 = _1104 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1130 = _1104 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1132 = fma(_1052, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1118);
    float _1134 = _1126;
    float _1136 = _1128;
    if (_778)
    {
        float _1138 = _1126 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1122 = _1138;
    }
    float _1140 = _1122;
    float _1142 = fma(_708, _1006, _1044);
    float _1144 = fma(_1052, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1128);
    float _1146 = fma(_1052, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1130);
    float _1148 = _1108 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    if (_778)
    {
        float _1150 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1152 = _856 + _1150;
        _1134 = _1152;
    }
    float _1154 = _1134;
    if (_778)
    {
        float _1156 = fma(_810, _894, _1140);
        _812 = _1156;
    }
    float _1158 = _812;
    if (_778)
    {
        float _1160 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1162 = _860 + _1160;
        _1136 = _1162;
    }
    float _1164 = _1136;
    float _1166 = fma(_1106, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1148);
    if (_778)
    {
        float _1168 = _1154 * _1154;
        _800 = _1168;
    }
    float _1170 = _800;
    float _1172 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1174 = _1158 + _1172;
    float _1176 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    if (_778)
    {
        float _1178 = _1164 * _1164;
        _802 = _1178;
    }
    float _1180 = _802;
    float _1182 = _1108 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1184 = fma(_1174, _1174, _1170);
    float _1186 = _1108 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1188 = _1114 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1190 = fma(_1106, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1182);
    float _1192 = _1184 + _1180;
    float _1194 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1196 = fma(_1106, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1186);
    float _1198 = _1114 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1200 = _1114 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1202 = _958 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1204 = fma(_1112, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1188);
    float _1206 = fma(_1112, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1198);
    float _1208 = _1040 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1210 = sqrt(_1192);
    float _1212 = fma(_1112, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1200);
    float _1214 = _1202 * _1176;
    float _1216 = fma(_1110, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1166);
    float _1218 = fma(_1110, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1190);
    float _1220 = fma(_1116, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1204);
    float _1222 = fma(_1116, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1206);
    float _1224 = fma(_1142, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1132);
    float _1226 = _1208 * _1194;
    float _1228 = fma(_1110, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1196);
    float _1230 = fma(_1116, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1212);
    float _1232 = fma(_1142, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1144);
    float _1234 = fma(_1142, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1146);
    out.m_85.z = _1226;
    out.m_85.w = _1214;
    bool _1236 = _1210 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1238 = isnan(_1210);
    bool _1240 = _1236 || _1238;
    bool _1242 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1244 = _1240 || _1242;
    out.m_87.x = _1216;
    out.m_87.y = _1218;
    out.m_87.z = _1228;
    out.m_89.x = _1220;
    out.m_89.y = _1222;
    out.m_89.z = _1230;
    out.m_91.x = _1224;
    out.m_91.y = _1232;
    out.m_91.z = _1234;
    float _1246 = _1208;
    if (!_1244)
    {
        _1246 = 1.0;
    }
    float _1248 = _1246;
    out.m_93.x = _870;
    out.m_93.y = _872;
    out.m_93.z = _874;
    bool _1250 = !_1244;
    float _1252 = _1248;
    if (!_1250)
    {
        bool _1254 = _1210 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1256 = isnan(_1210);
        bool _1258 = _1254 || _1256;
        bool _1260 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1262 = _1258 || _1260;
        if (!_1262)
        {
            float _1264 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1266 = _1210 + _1264;
            float _1268 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1270 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1268;
            float _1272 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1274 = _1272 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1276 = 1.0 / _1270;
            float _1278 = _1266 * _1276;
            float _1280 = fma(_1278, _1274, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1252 = _1280;
            _1282 = true;
        }
        else
        {
            bool _1284 = _1210 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1286 = isnan(_1210);
            bool _1288 = _1284 || _1286;
            bool _1290 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1292 = _1288 || _1290;
            if (!_1292)
            {
                float _1294 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1296 = _1210 + _1294;
                float _1298 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1300 = _1298 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1302 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1304 = _1302 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1306 = 1.0 / _1300;
                float _1308 = _1296 * _1306;
                float _1310 = fma(_1308, _1304, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1252 = _1310;
                _1282 = true;
            }
            else
            {
                _1252 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1282 = false;
    float _1312 = _1252;
    float _1314 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1316 = _1158 + _1314;
    float _1318 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1320 = _856 + _1318;
    float _1322 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1324 = _860 + _1322;
    float _1326 = _756 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1328 = fma(_1316, _1312, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1330 = fma(_1320, _1312, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1332 = fma(_1324, _1312, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1334 = fma(_736, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1326);
    float _1336 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1338 = _1328 + _1336;
    float _1340 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1342 = _1330 + _1340;
    float _1344 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1346 = _1332 + _1344;
    float _1348 = _1338 * _1338;
    float _1350 = fma(_1342, _1342, _1348);
    float _1352 = fma(_1346, _1346, _1350);
    float _1354 = fma(_742, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1334);
    float _1356 = _756 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1358 = fma(_736, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1360 = rsqrt(_1352);
    float _1362 = _1354 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1364 = fma(_736, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1356);
    float _1366 = fma(_742, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1368 = fma(_742, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1364);
    float _1370 = 1.0 / _1362;
    float _1372 = _1368 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1374 = _1372 + _1362;
    float _1376 = _1360 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1378 = floor(_1358);
    float _1380 = _1342 * _1376;
    float _1382 = _1346 * _1376;
    float _1384 = _1380 * _1380;
    float _1386 = _1382 * _1382;
    float _1388 = _1374 * _1370;
    float _1390 = _1388 * 0.5;
    float _1392 = sqrt(_1352);
    float _1394 = _1384 + _1386;
    float _1396 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1398 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1396);
    float _1400 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _1402 = -_1378;
    float _1404 = _1358 + _1402;
    float _1406 = sqrt(_1394);
    float _1408 = _756 + _1400;
    float _1410 = _1408 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1412 = _1408 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1414 = 1.0 / _1398;
    float _1416 = fma(_736, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1410);
    float _1418 = fma(_736, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1412);
    float _1420 = fma(_742, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1416);
    float _1422 = fma(_742, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1418);
    bool _1424 = _1406 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1426 = _1420 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1428 = _1422 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1430 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1432 = _1406 + _1430;
    float _1434 = floor(_1366);
    float _1436 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1438 = _1414 * _1436;
    float _1440 = trunc(_1426);
    int _1442 = int(_1440);
    bool _1444 = _1438 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1446 = _1438 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1448 = _756;
    int _1450 = 2;
    float _1452 = _1432;
    float _1454 = _1394;
    float _1456 = _1376;
    float _1458 = _1380;
    float _1460 = _1384;
    if (_1424)
    {
        float _1462 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1448 = _1462;
    }
    float _1464 = _1448;
    float _1466 = -_1434;
    float _1468 = _1366 + _1466;
    if (!_1444)
    {
        _1450 = 1;
    }
    int _1470 = _1450;
    float _1472 = trunc(_1428);
    int _1474 = int(_1472);
    int _1476 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1478 = _1442 + _1476;
    int _1480 = _1478 + 1;
    int _1482 = _1470;
    if (_1424)
    {
        float _1484 = _1432 * _1464;
        _1452 = _1484;
    }
    float _1486 = _1452;
    if (_1424)
    {
        float _1488 = rsqrt(_1394);
        _1454 = _1488;
    }
    float _1490 = _1454;
    float _1492 = 0.0;
    float _1494 = _1490;
    if (_1424)
    {
        float _1496 = _1486 * 0.15915493667125701904296875;
        _1492 = _1496;
    }
    float _1498 = _1492;
    bool _1500 = !_1444;
    int _1502 = _1500 ? 0 : 1;
    float _1504 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    int _1506 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1508 = _1474 + _1506;
    int _1510 = _1508 + 1;
    float _1512 = _1422;
    if (_1424)
    {
        float _1514 = _1498 * 6.283185482025146484375;
        float _1516 = sin(_1514);
        _1512 = _1516;
    }
    float _1518 = _1512;
    if (!_1446)
    {
        _1482 = _1502;
    }
    int _1520 = _1482;
    float _1522 = precise::max(0.0, _1504);
    int _1524 = _1520 << 6;
    bool _1526 = _1480 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1528 = -_1376;
    float _1530 = -_1522;
    float _1532 = fma(_1338, _1528, _1530);
    int _1534 = _1524 + 96;
    uint _1537 = uint(int(uint(_1534) >> uint(2)));
    uint _1539 = uint(int(uint(int(_1537)) >> uint(2)));
    int _1541 = int(_1537) & 3;
    float _1543 = (*spvDescriptorSet0.vp_c15)._m0[int(_1539)][_1541];
    int _1545 = int(_1537) + 1;
    uint _1547 = uint(int(uint(_1545) >> uint(2)));
    int _1549 = _1545 & 3;
    float _1551 = (*spvDescriptorSet0.vp_c15)._m0[int(_1547)][_1549];
    int _1553 = _1480 | _1510;
    float _1555 = _1498;
    float _1557 = as_type<float>(_1553);
    float _1559 = _1532;
    if (_1424)
    {
        float _1561 = _1498 * 6.283185482025146484375;
        float _1563 = cos(_1561);
        _1555 = _1563;
    }
    float _1565 = _1555;
    if (_1424)
    {
        float _1567 = _1532 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1456 = _1567;
    }
    float _1569 = _1456;
    bool _1571 = _1553 < 0;
    bool _1573 = _1571 || _1526;
    if (_1424)
    {
        float _1575 = fma(_1518, _1569, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1557 = _1575;
    }
    float _1577 = _1557;
    int _1579 = _1524 + 48;
    uint _1581 = uint(int(uint(_1579) >> uint(2)));
    uint _1583 = uint(int(uint(int(_1581)) >> uint(2)));
    int _1585 = int(_1581) & 3;
    float _1587 = (*spvDescriptorSet0.vp_c15)._m0[int(_1583)][_1585];
    int _1589 = int(_1581) + 1;
    uint _1591 = uint(int(uint(_1589) >> uint(2)));
    int _1593 = _1589 & 3;
    float _1595 = (*spvDescriptorSet0.vp_c15)._m0[int(_1591)][_1593];
    float _1597 = _1328 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    bool _1599 = _1510 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1601 = _1599 || _1573;
    float _1603 = 0.0;
    if (_1424)
    {
        float _1605 = _1490 * _1577;
        _1603 = _1605;
    }
    float _1607 = _1603;
    float _1609 = fma(_1330, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1597);
    if (_1424)
    {
        float _1611 = _1380 * _1607;
        _1458 = _1611;
    }
    float _1613 = _1458;
    int _1615 = _1524 + 104;
    uint _1617 = uint(int(uint(_1615) >> uint(2)));
    uint _1619 = uint(int(uint(int(_1617)) >> uint(2)));
    int _1621 = int(_1617) & 3;
    float _1623 = (*spvDescriptorSet0.vp_c15)._m0[int(_1619)][_1621];
    int _1625 = int(_1617) + 1;
    uint _1627 = uint(int(uint(_1625) >> uint(2)));
    int _1629 = _1625 & 3;
    float _1631 = (*spvDescriptorSet0.vp_c15)._m0[int(_1627)][_1629];
    float _1633 = fma(_1332, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1609);
    float _1635 = _1565;
    if (_1424)
    {
        float _1637 = _1565 + (-1.0);
        _1494 = _1637;
    }
    float _1639 = _1494;
    float _1641 = _1639;
    if (_1424)
    {
        float _1643 = _1613 * _1613;
        _1460 = _1643;
    }
    float _1645 = _1460;
    float _1647 = 0.0;
    if (_1424)
    {
        float _1649 = _1639 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1647 = _1649;
    }
    float _1651 = _1647;
    if (!_1424)
    {
        _1641 = _1382;
    }
    float _1653 = _1641;
    int _1655 = _1524 + 64;
    uint _1657 = uint(int(uint(_1655) >> uint(2)));
    uint _1659 = uint(int(uint(int(_1657)) >> uint(2)));
    int _1661 = int(_1657) & 3;
    float _1663 = (*spvDescriptorSet0.vp_c15)._m0[int(_1659)][_1661];
    int _1665 = int(_1657) + 1;
    uint _1667 = uint(int(uint(_1665) >> uint(2)));
    int _1669 = _1665 & 3;
    float _1671 = (*spvDescriptorSet0.vp_c15)._m0[int(_1667)][_1669];
    float _1673 = _1653;
    if (_1424)
    {
        float _1675 = _1382 * _1607;
        _1673 = _1675;
    }
    float _1677 = _1673;
    if (_1424)
    {
        float _1679 = fma(_1532, _1565, _1651);
        _1559 = _1679;
    }
    float _1681 = _1559;
    float _1683 = _1633 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    if (!_1424)
    {
        _1635 = _1386;
    }
    float _1685 = _1635;
    float _1687 = _1685;
    if (_1424)
    {
        float _1689 = _1677 * _1677;
        _1687 = _1689;
    }
    float _1691 = _1687;
    float _1693 = fma(_1681, _1681, _1645);
    float _1695 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    int _1697 = _1524 + 80;
    uint _1699 = uint(int(uint(_1697) >> uint(2)));
    uint _1701 = uint(int(uint(int(_1699)) >> uint(2)));
    int _1703 = int(_1699) & 3;
    float _1705 = (*spvDescriptorSet0.vp_c15)._m0[int(_1701)][_1703];
    int _1707 = int(_1699) + 1;
    uint _1709 = uint(int(uint(_1707) >> uint(2)));
    int _1711 = _1707 & 3;
    float _1713 = (*spvDescriptorSet0.vp_c15)._m0[int(_1709)][_1711];
    float _1715 = _1683 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1717 = _1693 + _1691;
    int _1719 = as_type<int>(_1715);
    if (!_1601)
    {
        float _1721 = floor(_1428);
        _970 = _1721;
    }
    float _1723 = _970;
    float _1725 = -_1715;
    float _1727 = fma(_1725, _1695, 1.0);
    if (!_1601)
    {
        int _1729 = _1510 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1731 = _1729 + _1480;
        _1719 = _1731;
    }
    int _1733 = _1719;
    int _1735 = _1524 + 56;
    uint _1737 = uint(int(uint(_1735) >> uint(2)));
    uint _1739 = uint(int(uint(int(_1737)) >> uint(2)));
    int _1741 = int(_1737) & 3;
    float _1743 = (*spvDescriptorSet0.vp_c15)._m0[int(_1739)][_1741];
    int _1745 = int(_1737) + 1;
    uint _1747 = uint(int(uint(_1745) >> uint(2)));
    int _1749 = _1745 & 3;
    float _1751 = (*spvDescriptorSet0.vp_c15)._m0[int(_1747)][_1749];
    float _1753 = log2(_1727);
    int _1755 = _1524 + 88;
    uint _1757 = uint(int(uint(_1755) >> uint(2)));
    uint _1759 = uint(int(uint(int(_1757)) >> uint(2)));
    int _1761 = int(_1757) & 3;
    float _1763 = (*spvDescriptorSet0.vp_c15)._m0[int(_1759)][_1761];
    int _1765 = int(_1757) + 1;
    uint _1767 = uint(int(uint(_1765) >> uint(2)));
    int _1769 = _1765 & 3;
    float _1771 = (*spvDescriptorSet0.vp_c15)._m0[int(_1767)][_1769];
    float _1773 = _1408 * _1551;
    float _1775 = fma(_736, _1543, _1773);
    int _1777 = _1524 + 72;
    uint _1779 = uint(int(uint(_1777) >> uint(2)));
    uint _1781 = uint(int(uint(int(_1779)) >> uint(2)));
    int _1783 = int(_1779) & 3;
    float _1785 = (*spvDescriptorSet0.vp_c15)._m0[int(_1781)][_1783];
    int _1787 = int(_1779) + 1;
    uint _1789 = uint(int(uint(_1787) >> uint(2)));
    int _1791 = _1787 & 3;
    float _1793 = (*spvDescriptorSet0.vp_c15)._m0[int(_1789)][_1791];
    float _1795 = _1408 * _1595;
    float _1797 = rsqrt(_1717);
    float _1799 = _1753 * 0.693147182464599609375;
    float _1801 = fma(_736, _1587, _1795);
    int _1803 = as_type<int>(_1795);
    int _1805 = as_type<int>(_1543);
    if (!_1601)
    {
        int _1807 = _1733 << 2;
        _1803 = _1807;
    }
    int _1809 = _1803;
    float _1811 = fma(_742, _1623, _1775);
    int _1813 = _1809;
    if (!_1601)
    {
        int _1815 = 12 & _1809;
        _1813 = _1815;
    }
    int _1817 = _1813;
    float _1819 = _1811 + _1631;
    float2 _5447 = float2(_1404, _1468);
    float _1821 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5447, float2(0.0), isnan(_5447)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5447, float2(0.0), isnan(_5447)), level(0.0)).x;
    float _1823 = _1799 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1825 = _1408 * _1671;
    float _1827 = _1671;
    int _1829 = as_type<int>(_1713);
    if (!_1601)
    {
        float _1831 = -_1723;
        float _1833 = _1428 + _1831;
        _1827 = _1833;
    }
    float _1835 = _1827;
    float _1837 = 1.0 / _1819;
    float _1839 = _1797 * _1613;
    float _1841 = fma(_736, _1663, _1825);
    float _1843 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1845 = fma(_1392, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1843);
    float _1847 = precise::clamp(_1845, 0.0, 1.0);
    float _1849 = _1797 * _1681;
    float _1851 = _1839 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1853 = _1408 * _1713;
    if (!_1601)
    {
        uint _1855 = uint(int(uint(_1733) >> uint(2)));
        _1829 = int(_1855);
    }
    int _1857 = _1829;
    float _1859 = _1797 * _1677;
    float _1861 = fma(_736, _1705, _1853);
    float _1863 = -_1847;
    float _1865 = _1863 + 1.0;
    if (!_1601)
    {
        int _1867 = _1857 << 4;
        int _1869 = _1867 + _1817;
        _1805 = _1869;
    }
    int _1871 = _1805;
    float _1873 = fma(_742, _1743, _1801);
    float _1875 = _1847;
    float _1877 = as_type<float>(_1871);
    if (!_1601)
    {
        int _1879 = _1871 + 400;
        uint _1881 = uint(int(uint(_1879) >> uint(2)));
        uint _1883 = uint(int(uint(int(_1881)) >> uint(2)));
        int _1885 = int(_1881) & 3;
        float _1887 = (*spvDescriptorSet0.vp_c15)._m0[int(_1883)][_1885];
        _1875 = _1887;
    }
    float _1889 = _1875;
    float _1891 = abs(_1865);
    float _1893 = log2(_1891);
    float _1895 = _1873 + _1751;
    float _1897 = _1328 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1899 = fma(_742, _1763, _1861);
    float _1901 = -_1851;
    float _1903 = fma(_1849, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1901);
    float _1905 = _1328 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1907 = fma(_1330, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1897);
    float _1909 = -_1859;
    float _1911 = fma(_1909, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1903);
    float _1913 = fma(_1330, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1905);
    float _1915 = _1895 * _1837;
    float _1917 = fma(_742, _1785, _1841);
    float _1919 = fma(_1911, -0.5, 0.5);
    float _1921 = fma(_1332, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1913);
    float _1923 = fma(_1911, 0.5, 0.5);
    float _1925 = _1917 + _1793;
    float _1927 = _1328 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    bool _1929 = _1915 >= 0.0;
    float _1931 = fma(_1332, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1907);
    float _1933 = _1925 * _1837;
    float _1935 = fma(_1330, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1927);
    bool _1937 = _1915 <= 1.0;
    bool _1939 = _1937 && _1929;
    float _1941 = _1931 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1943 = _1893 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1945 = fma(_1332, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1935);
    bool _1947 = _1933 >= 0.0;
    bool _1949 = _1947 && _1939;
    float _1951 = _1941 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1953 = exp2(_1943);
    float _1955 = _1945 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    bool _1957 = _1933 <= 1.0;
    bool _1959 = _1957 && _1949;
    float _1961 = _1921 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1963 = _1899 + _1771;
    float _1965 = fma(_1955, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1951);
    float _1967 = _1941 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1969 = _1849 + 1.0;
    float _1971 = sqrt(_1919);
    float _1973 = fma(_1683, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1965);
    float _1975 = fma(_1955, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1967);
    float _1977 = _1963 * _1837;
    float _1979 = fma(_1923, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1981 = fma(_1961, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1973);
    if (_1959)
    {
        float _1983 = float(_1520);
        _1877 = _1983;
    }
    float _1985 = _1877;
    float _1987 = -_1849;
    float _1989 = fma(_1953, _1969, _1987);
    float _1991 = fma(_1923, _1979, -0.212114393711090087890625);
    float _1993 = 1.0 / _1981;
    float _1995 = _1941 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1997 = fma(_1989, 0.5, 0.5);
    float _1999 = fma(_1923, _1991, 1.570728778839111328125);
    float _2001 = fma(_1683, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1975);
    float _2003 = fma(_1955, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1995);
    float _2005 = _1971 * 0.636619746685028076171875;
    float _2007 = _1985;
    float _2009 = _2003;
    if (_1959)
    {
        float _2011 = rint(_1985);
        float _2013 = precise::max(_2011, 0.0);
        uint _2015 = uint(_2013);
        uint _2017 = clamp(_2015, 0u, 65535u);
        _2007 = as_type<float>(_2017);
    }
    float _2019 = _2007;
    float _2021 = fma(_1683, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2003);
    float _2023 = fma(_1961, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2001);
    float _2025 = -_1999;
    float _2027 = fma(_2005, _2025, 1.0);
    float _2029 = fma(_1961, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2021);
    float _2031 = _1859;
    if (!_1601)
    {
        float _2033 = floor(_1426);
        _2031 = _2033;
    }
    float _2035 = _2031;
    float _2037 = _2023 * _1993;
    float _2039 = _2029 * _1993;
    float _2041 = fma(_2037, 0.5, 0.5);
    float _2043 = fma(_2039, -0.5, 0.5);
    float _2045 = _2019;
    if (_1959)
    {
        float3 _5836 = float3(_1915, _1933, float(as_type<int>(_2019)));
        float3 _5840 = select(_5836, float3(0.0), isnan(_5836));
        float _2047 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5840.xy, uint(rint(_5840.z)), _1977, level(0.0));
        _2045 = _2047;
    }
    float _2049 = _2045;
    float _2051 = _2039;
    if (!_1601)
    {
        float _2053 = rint(_1889);
        float _2055 = precise::max(_2053, 0.0);
        uint _2057 = uint(_2055);
        uint _2059 = clamp(_2057, 0u, 65535u);
        _2051 = as_type<float>(_2059);
    }
    float _2061 = _2051;
    float3 _5866 = float3(_2041, _2043, _1823);
    float _2063 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5866, float3(0.0), isnan(_5866)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5866, float3(0.0), isnan(_5866)), level(0.0)).x;
    if (!_1601)
    {
        float _2065 = -_2035;
        float _2067 = _1426 + _2065;
        _2009 = _2067;
    }
    float _2069 = _2009;
    float3 _5886 = float3(_2041, _2043, _1823);
    float4 _2072 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5886, float3(0.0), isnan(_5886)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5886, float3(0.0), isnan(_5886)), level(0.0)).xyzw;
    float _2074 = _2072.x;
    float _2076 = _2072.y;
    float _2078 = _2072.z;
    float _2080 = _2072.w;
    float2 _5902 = float2(_2027, _1997);
    float3 _2082 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5902, float2(0.0), isnan(_5902)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5902, float2(0.0), isnan(_5902)), level(0.0)).xyz;
    float _2084 = _2082.x;
    float _2086 = _2082.y;
    float _2088 = _2082.z;
    float _2090 = _2061;
    if (!_1601)
    {
        float3 _5923 = float3(_2069, _1835, float(as_type<int>(_2061)));
        float3 _5925 = select(_5923, float3(0.0), isnan(_5923));
        float _2092 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5925.xy, uint(rint(_5925.z)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5925.xy, uint(rint(_5925.z)), level(0.0)).x;
        _2090 = _2092;
    }
    float _2094 = _2090;
    float _2096 = abs(_1438);
    float _2098 = log2(_2096);
    float _2100 = _1941 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2102 = fma(_1955, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2100);
    float _2104 = fma(_1683, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2102);
    float _2106 = _1893 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2108 = fma(_1961, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2104);
    float _2110 = _2098 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2112 = _2108 + _1981;
    float _2114 = exp2(_2106);
    bool _2116 = _1438 <= 8000.0;
    bool _2118 = isnan(_1438);
    bool _2120 = _2116 || _2118;
    bool _2122 = isnan(8000.0);
    bool _2124 = _2120 || _2122;
    float _2126 = float(_2124);
    float _2128 = _2112 * 0.5;
    float _2130 = exp2(_2110);
    out.m_95.z = _2128;
    out.m_95.w = _1981;
    float _2132 = fma(_2130, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2134 = precise::clamp(_2132, 0.0, 1.0);
    float _2136 = fma(_2134, -2.0, 3.0);
    float _2138 = _2134 * _2134;
    float _2140 = _2138 * _2136;
    float _2142 = -_2140;
    float _2144 = _2142 + 1.0;
    out.gl_Position.x = _2023;
    out.gl_Position.y = _2029;
    out.gl_Position.z = _2108;
    out.gl_Position.w = _1981;
    float _2146 = fma(_2144, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2140);
    float _2148 = _2126 * _2146;
    float _2150 = _2146;
    float _2152 = _2108;
    float _2154 = _2023;
    if (!_1959)
    {
        _2150 = 1.0;
    }
    float _2156 = _2150;
    float _2158 = _2148 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2160 = -_2114;
    float _2162 = _2160 + 1.0;
    float _2164 = _2162 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2166 = _2162;
    float _2168 = _2156;
    if (_1601)
    {
        _2166 = 1.0;
    }
    float _2170 = _2166;
    float _2172 = -_1821;
    float _2174 = _2172 + 1.0;
    float _2176 = _2174 * _2158;
    float _2178 = precise::clamp(_2176, 0.0, 1.0);
    float _2180 = _2170;
    if (_1959)
    {
        bool _2182 = _2049 >= _1977;
        bool _2184 = isnan(_2049);
        bool _2186 = _2182 || _2184;
        bool _2188 = isnan(_1977);
        bool _2190 = _2186 || _2188;
        float _2192 = float(_2190);
        _2168 = _2192;
    }
    float _2194 = _2168;
    if (!_1601)
    {
        int _2196 = _1733 << 4;
        int _2198 = _2196 + 2048;
        uint _2200 = uint(int(uint(_2198) >> uint(2)));
        uint _2202 = uint(int(uint(int(_2200)) >> uint(2)));
        int _2204 = int(_2200) & 3;
        float _2206 = (*spvDescriptorSet0.vp_c15)._m0[int(_2202)][_2204];
        int _2208 = int(_2200) + 1;
        uint _2210 = uint(int(uint(_2208) >> uint(2)));
        int _2212 = _2208 & 3;
        float _2214 = (*spvDescriptorSet0.vp_c15)._m0[int(_2210)][_2212];
        int _2216 = _2198 + 8;
        uint _2218 = uint(int(uint(_2216) >> uint(2)));
        uint _2220 = uint(int(uint(int(_2218)) >> uint(2)));
        int _2222 = int(_2218) & 3;
        float _2224 = (*spvDescriptorSet0.vp_c15)._m0[int(_2220)][_2222];
        int _2226 = int(_2218) + 1;
        uint _2228 = uint(int(uint(_2226) >> uint(2)));
        int _2230 = _2226 & 3;
        float _2232 = (*spvDescriptorSet0.vp_c15)._m0[int(_2228)][_2230];
        float _2234 = _1408 * _2214;
        float _2236 = fma(_736, _2206, _2234);
        float _2238 = fma(_742, _2224, _2236);
        float _2240 = _2238 + _2232;
        float _2242 = precise::clamp(_2240, 0.0, 1.0);
        float _2244 = -_2242;
        float _2246 = _2244 + _2094;
        float _2248 = fma(_2246, 500.0, 1.5);
        float _2250 = exp2(_2248);
        float _2252 = 0.0 + _2250;
        float _2254 = precise::clamp(_2252, 0.0, 1.0);
        _2180 = _2254;
        _2152 = _2206;
    }
    float _2256 = _2180;
    float _2258 = _2152;
    float _2260 = _2194 * _2256;
    float _2262 = -_2178;
    float _2264 = fma(_2262, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2266 = _2164 * _2063;
    out.m_97.x = _1330;
    out.m_97.y = _1328;
    out.m_97.z = _1332;
    bool _2268 = _1392 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2270 = isnan(_1392);
    bool _2272 = _2268 || _2270;
    bool _2274 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2276 = _2272 || _2274;
    float _2278 = -_2260;
    float _2280 = fma(_2278, _2264, 1.0);
    float _2282 = precise::clamp(_2280, 0.0, 1.0);
    float _2284 = _2080 * _2266;
    float _2286 = -_2164;
    float _2288 = _2286 + 1.0;
    float _2290 = _2088 * _2266;
    float _2292 = _2282 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2294 = fma(_2084, _2284, _2074);
    float _2296 = fma(_2086, _2284, _2076);
    float _2298 = _2080 * _2288;
    float _2300 = fma(_2080, _2290, _2078);
    out.m_99.x = _2292;
    float _2302 = _2258;
    float _2304 = _2284;
    float _2306 = _2288;
    float _2308 = _2282;
    if (!_2276)
    {
        _2302 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2310 = _2302;
    out.m_101.x = _2294;
    out.m_101.y = _2296;
    out.m_101.z = _2300;
    out.m_101.w = _2298;
    float _2312 = _2310;
    float _2314 = _2310;
    if (!_2276)
    {
        _804 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2316 = _804;
    float _2318 = _2316;
    float _2320 = _2316;
    if (!_2276)
    {
        _2154 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2322 = _2154;
    float _2324 = _2322;
    float _2326 = _2322;
    if (!_2276)
    {
        _2304 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2328 = _2304;
    float _2330 = _2328;
    float _2332 = _2328;
    if (!_2276)
    {
        _2306 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2334 = _2306;
    float _2336 = _2334;
    float _2338 = _2334;
    if (!_2276)
    {
        _2308 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2340 = _2308;
    bool _2342 = !_2276;
    float _2344 = _2340;
    float _2346 = _2340;
    if (!_2342)
    {
        bool _2348 = _1392 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2350 = isnan(_1392);
        bool _2352 = _2348 || _2350;
        bool _2354 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2356 = _2352 || _2354;
        if (!_2356)
        {
            float _2358 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2360 = _1392 + _2358;
            float _2362 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2364 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2362;
            float _2366 = 1.0 / _2364;
            float _2368 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2370 = _2368 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2372 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2374 = _2372 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2376 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2378 = _2376 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2380 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2382 = _2380 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2384 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2386 = _2384 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2388 = _2360 * _2366;
            float _2390 = precise::clamp(_2388, 0.0, 1.0);
            float _2392 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2394 = _2392 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2396 = fma(_2390, _2370, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2398 = fma(_2390, _2394, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2400 = fma(_2390, _2374, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2402 = fma(_2390, _2378, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2404 = fma(_2390, _2382, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2406 = fma(_2390, _2386, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2320 = _2398;
            _2338 = _2404;
            _2314 = _2396;
            _2332 = _2402;
            _2326 = _2400;
            _2346 = _2406;
            _2408 = true;
        }
        else
        {
            bool _2410 = _1392 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2412 = isnan(_1392);
            bool _2414 = _2410 || _2412;
            bool _2416 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2418 = _2414 || _2416;
            if (!_2418)
            {
                _2312 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2420 = _2312;
            _2314 = _2420;
            if (!_2418)
            {
                _2318 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2422 = _2318;
            _2320 = _2422;
            if (!_2418)
            {
                _2324 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2424 = _2324;
            _2326 = _2424;
            if (!_2418)
            {
                _2330 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2426 = _2330;
            _2332 = _2426;
            if (!_2418)
            {
                _2336 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2428 = _2336;
            _2338 = _2428;
            if (!_2418)
            {
                _2344 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2430 = _2344;
            bool _2432 = !_2418;
            _2346 = _2430;
            if (!_2432)
            {
                bool _2434 = _1392 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2436 = isnan(_1392);
                bool _2438 = _2434 || _2436;
                bool _2440 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2442 = _2438 || _2440;
                if (!_2442)
                {
                    float _2444 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2446 = _1392 + _2444;
                    float _2448 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2450 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2448;
                    float _2452 = 1.0 / _2450;
                    float _2454 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2456 = _2454 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2458 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2460 = _2458 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2462 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2464 = _2462 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2466 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2468 = _2466 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2470 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2472 = _2470 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2474 = _2446 * _2452;
                    float _2476 = precise::clamp(_2474, 0.0, 1.0);
                    float _2478 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2480 = _2478 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2482 = fma(_2476, _2456, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2484 = fma(_2476, _2480, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2486 = fma(_2476, _2460, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2488 = fma(_2476, _2464, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2490 = fma(_2476, _2468, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2492 = fma(_2476, _2472, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2320 = _2484;
                    _2338 = _2490;
                    _2314 = _2482;
                    _2332 = _2488;
                    _2326 = _2486;
                    _2346 = _2492;
                    _2408 = true;
                }
                else
                {
                    _2320 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2338 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2314 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2332 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2326 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2346 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2408 = false;
    float _2494 = _2320;
    float _2496 = _2338;
    float _2498 = _2314;
    float _2500 = _2332;
    float _2502 = _2326;
    float _2504 = _2346;
    float _2506 = fma(_1232, -0.5, 0.5);
    float _2508 = precise::clamp(_2506, 0.0, 1.0);
    float _2510 = -_2494;
    float _2512 = _2510 + _2496;
    float _2514 = -_2498;
    float _2516 = _2514 + _2500;
    float _2518 = -_2502;
    float _2520 = _2518 + _2504;
    bool _2522 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2524 = fma(_2508, _2512, _2494);
    float _2526 = fma(_2508, _2516, _2498);
    float _2528 = fma(_2508, _2520, _2502);
    float _2530 = _2524 * 0.586610972881317138671875;
    out.m_63.x = 1.0;
    float _2532 = fma(_2526, 0.298911988735198974609375, _2530);
    float _2534 = fma(_2528, 0.114477999508380889892578125, _2532);
    out.m_103.x = 0.0;
    float _2536 = -_2534;
    float _2538 = _2526 + _2536;
    float _2540 = -_2534;
    float _2542 = _2524 + _2540;
    float _2544 = -_2534;
    float _2546 = _2528 + _2544;
    float _2548 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2550 = fma(_2538, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2534);
    float _2552 = fma(_2542, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2534);
    float _2554 = fma(_2546, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2534);
    out.m_99.w = _2548;
    out.m_105.x = _2550;
    out.m_105.y = _2552;
    out.m_105.z = _2554;
    if (!_2522)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2556 = -_1328;
    float _2558 = _2556 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2560 = -_1330;
    float _2562 = _2560 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2564 = -_1332;
    float _2566 = _2564 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2568 = _2558 * _2558;
    float _2570 = fma(_2562, _2562, _2568);
    float _2572 = fma(_2566, _2566, _2570);
    float _2574 = sqrt(_2572);
    float _2576 = rsqrt(_2572);
    float _2578 = -_2574;
    float _2580 = _2578 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2582 = _2580 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2584 = precise::clamp(_2582, 0.0, 1.0);
    float _2586 = _2562 * _2576;
    float _2588 = _2558 * _2576;
    float _2590 = abs(_2584);
    float _2592 = log2(_2590);
    float _2594 = _2566 * _2576;
    float _2596 = _2586 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2598 = _1232 * _2588;
    float _2600 = -_2588;
    float _2602 = -_2596;
    float _2604 = fma(_2600, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2602);
    float _2606 = fma(_1224, _2586, _2598);
    float _2608 = -_2594;
    float _2610 = fma(_2608, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2604);
    float _2612 = fma(_1234, _2594, _2606);
    float _2614 = precise::clamp(_2612, 0.0, 1.0);
    float _2616 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2618 = _2610 + _2616;
    float _2620 = _2592 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2622 = _2618 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2624 = precise::clamp(_2622, 0.0, 1.0);
    float _2626 = exp2(_2620);
    float _2628 = _2626 * _2624;
    float _2630 = _2614 * _2628;
    float _2632 = _2630 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2634 = _2630 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2636 = _2630 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_103.x = _2632;
    out.m_103.y = _2634;
    out.m_103.z = _2636;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2408 = false;
    bool _1282 = false;
    bool _202 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _119 = in.m_60.w;
    float _121 = trunc(_119);
    int _124 = int(_121);
    bool _128 = _124 >= 1;
    float _130 = 0.0;
    if (!_128)
    {
        _130 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _132 = _130;
    if (!_128)
    {
        out.m_63.x = 0.0;
    }
    int _134 = 0;
    if (!_128)
    {
        float _136 = _132 * 5.0;
        _134 = as_type<int>(_136);
    }
    int _138 = _134;
    int _140 = _138;
    if (!_128)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2692 = as_type<float>(_138);
        out.gl_Position.z = _2692;
    }
    if (!_128)
    {
        return out;
    }
    float _142 = in.m_65.w;
    bool _144 = _142 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _146 = isnan(_142);
    bool _148 = _144 || _146;
    bool _150 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _152 = _148 || _150;
    float _154 = -_142;
    float _156 = _154 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _158 = 0.0;
    float _160 = _156;
    if (_152)
    {
        float _162 = float(_124);
        _158 = _162;
    }
    float _164 = _158;
    bool _166 = _156 >= _164;
    bool _168 = !_152;
    bool _170 = _166 || _168;
    float _172 = _164;
    if (_170)
    {
        _172 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _174 = _172;
    if (_170)
    {
        out.m_63.x = 0.0;
    }
    if (_170)
    {
        float _176 = _174 * 5.0;
        _140 = as_type<int>(_176);
    }
    int _178 = _140;
    if (_170)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2762 = as_type<float>(_178);
        out.gl_Position.z = _2762;
    }
    if (_170)
    {
        return out;
    }
    bool _180 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _182 = !_180;
    float _200;
    if (!_182)
    {
        float _184 = in.m_67.x;
        float _186 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _188 = _184 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _190 = fma(_188, (*spvDescriptorSet0.vp_c9)._m0[12].x, _156);
        float _192 = _190 * _186;
        float _194 = floor(_192);
        float _196 = -_194;
        float _198 = _192 + _196;
        _200 = _198;
        _202 = true;
    }
    else
    {
        float _204 = float(_124);
        float _206 = 1.0 / _204;
        float _208 = _156 * _206;
        _200 = _208;
    }
    _202 = false;
    float _210 = _200;
    float _212 = in.m_67.x;
    float _214 = in.m_67.y;
    float _216 = in.m_67.z;
    float _218 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _220 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _218;
    int _222 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _224 = _222 != 0;
    int _226 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _228 = _226 != 0;
    int _230 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _232 = _230 != 0;
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _236 = _234 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _238 = 1.0 / _220;
    float _240 = 1.0 / _236;
    float _242 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _244 = _210 + _242;
    float _246 = _216 * 2.0;
    float _248 = _212 * 2.0;
    float _250 = _214 + _216;
    float _252 = _212 + _216;
    float _254 = floor(_246);
    float _256 = _216 + (-0.5);
    float _258 = _214 + _212;
    float _260 = _212 + (-0.5);
    float _262 = _214 * 2.0;
    float _264 = _214 + (-0.5);
    float _266 = _250 + (-1.0);
    float _268 = _244 * _238;
    float _270 = floor(_248);
    bool _272 = !_224;
    int _274 = _272 ? 0 : 1;
    float _276 = _252 + (-1.0);
    float _278 = fma(_266, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _280 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _282 = _210 + _280;
    int _284 = abs(_274);
    float _286 = _258 + (-1.0);
    float _288 = fma(_276, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _290 = _254 > 0.0;
    float _292 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _294 = log2(_292);
    bool _296 = _254 >= 0.0;
    bool _298 = isnan(_254);
    bool _300 = _296 || _298;
    bool _302 = isnan(0.0);
    bool _304 = _300 || _302;
    float _306 = _282 * _240;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _310 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _308;
    int _312 = _304 ? 0 : 1;
    bool _314 = _270 > 0.0;
    float _316 = floor(_262);
    int _318 = ~_312;
    int _320 = _318 + 1;
    int _322 = _320 + 1;
    float _324 = fma(_286, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _326 = _270 >= 0.0;
    bool _328 = isnan(_270);
    bool _330 = _326 || _328;
    bool _332 = isnan(0.0);
    bool _334 = _330 || _332;
    float _336 = fma(_310, _268, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    int _338 = _322;
    if (!_290)
    {
        int _340 = ~_312;
        int _342 = _340 + 1;
        _338 = _342;
    }
    int _344 = _338;
    float _346 = float(_284);
    float _348 = float(_344);
    float _350 = _294 * _156;
    int _352 = _334 ? 0 : 1;
    float _354 = _346 * _348;
    int _356 = ~_352;
    int _358 = _356 + 1;
    int _360 = _358 + 1;
    float _362 = in.m_69.x;
    float _364 = in.m_69.y;
    float _366 = in.m_69.z;
    int _368 = _360;
    if (!_314)
    {
        int _370 = ~_352;
        int _372 = _370 + 1;
        _368 = _372;
    }
    int _374 = _368;
    float _376 = _354 * (-2.0);
    float _378 = exp2(_350);
    bool _380 = _316 > 0.0;
    bool _382 = _316 >= 0.0;
    bool _384 = isnan(_316);
    bool _386 = _382 || _384;
    bool _388 = isnan(0.0);
    bool _390 = _386 || _388;
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _394 = 1.0 + _392;
    bool _396 = !_228;
    int _398 = _396 ? 0 : 1;
    float _400 = float(_374);
    int _402 = abs(_398);
    float _404 = 1.0 / _394;
    bool _406 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _408 = isnan(1.0);
    bool _410 = _406 || _408;
    bool _412 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _414 = _410 || _412;
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _418 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _416;
    float _420 = float(_402);
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _424 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _422;
    bool _426 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _428 = isnan(0.0);
    bool _430 = _426 || _428;
    bool _432 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _434 = _430 || _432;
    float _436 = -_378;
    float _438 = _436 + 1.0;
    float _440 = fma(_418, _268, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _442 = _420 * _400;
    int _444 = _390 ? 0 : 1;
    float _446 = fma(_424, _268, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _448 = _434 ? _438 : 0.0;
    float _450 = _442 * (-2.0);
    float _452 = fma(_376, _362, _362);
    float _454 = fma(_324, _376, _324);
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _458 = _456 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    if (_414)
    {
        float _460 = _448 * _404;
        _160 = _460;
    }
    float _462 = _160;
    float _464 = fma(_260, (*spvDescriptorSet0.vp_c9)._m0[196].x, _452);
    float _466 = fma(_450, _364, _364);
    int _468 = ~_444;
    int _470 = _468 + 1;
    int _472 = _470 + 1;
    float _474 = fma(_278, _450, _278);
    float _476 = fma(_454, _462, _464);
    bool _478 = _210 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _480 = isnan(_210);
    bool _482 = _478 || _480;
    bool _484 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _486 = _482 || _484;
    float _488 = float(_486);
    int _490 = _472;
    if (!_380)
    {
        int _492 = ~_444;
        int _494 = _492 + 1;
        _490 = _494;
    }
    int _496 = _490;
    float _498 = fma(_264, (*spvDescriptorSet0.vp_c9)._m0[196].y, _466);
    bool _500 = !_232;
    int _502 = _500 ? 0 : 1;
    float _504 = -_488;
    float _506 = _504 + 1.0;
    bool _508 = _210 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _510 = isnan(_210);
    bool _512 = _508 || _510;
    bool _514 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _516 = _512 || _514;
    float _518 = float(_516);
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _522 = _520 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    int _524 = abs(_502);
    float _526 = _476 * 0.15915493667125701904296875;
    bool _528 = _210 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _530 = isnan(_210);
    bool _532 = _528 || _530;
    bool _534 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _536 = _532 || _534;
    float _538 = float(_536);
    float _540 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _542 = _540 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _544 = _518 * _506;
    float _546 = -_518;
    float _548 = _546 + 1.0;
    float _550 = fma(_542, _306, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _552 = float(_496);
    float _554 = fma(_474, _462, _498);
    float _556 = float(_524);
    float _558 = fma(_458, _306, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _560 = fma(_522, _306, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _562 = _538 * _548;
    float _564 = -_538;
    float _566 = _564 + 1.0;
    float _568 = _556 * _552;
    float _570 = _526 * 6.283185482025146484375;
    float _572 = cos(_570);
    float _574 = in.m_71.x;
    float _576 = in.m_71.y;
    float _578 = in.m_71.z;
    float _580 = _336 * _562;
    float _582 = _568 * (-2.0);
    float _584 = _440 * _562;
    float _586 = _446 * _562;
    float _588 = _554 * 0.15915493667125701904296875;
    float _590 = fma(_582, _366, _366);
    float _592 = in.m_73.x;
    float _594 = in.m_73.y;
    float _596 = in.m_73.z;
    float _598 = fma(_288, _582, _288);
    float _600 = fma(_566, (*spvDescriptorSet0.vp_c9)._m0[143].x, _584);
    float _602 = fma(_256, (*spvDescriptorSet0.vp_c9)._m0[196].z, _590);
    float _604 = fma(_566, (*spvDescriptorSet0.vp_c9)._m0[143].y, _586);
    float _606 = fma(_566, (*spvDescriptorSet0.vp_c9)._m0[143].z, _580);
    float _608 = fma(_550, _544, _600);
    float _610 = fma(_598, _462, _602);
    float _612 = fma(_560, _544, _604);
    float _614 = fma(_558, _544, _606);
    float _616 = _588 * 6.283185482025146484375;
    float _618 = sin(_616);
    float _620 = _610 * 0.15915493667125701904296875;
    float _622 = fma(_488, (*spvDescriptorSet0.vp_c9)._m0[145].y, _612);
    float _624 = fma(_488, (*spvDescriptorSet0.vp_c9)._m0[145].z, _614);
    float _626 = fma(_488, (*spvDescriptorSet0.vp_c9)._m0[145].x, _608);
    float _628 = _624 * _578;
    float _630 = _588 * 6.283185482025146484375;
    float _632 = cos(_630);
    float _634 = in.m_60.x;
    float _636 = in.m_60.y;
    float _638 = in.m_60.z;
    float _640 = _622 * _576;
    float _642 = _626 * _574;
    float _644 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _594);
    float _646 = _640 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _648 = _526 * 6.283185482025146484375;
    float _650 = sin(_648);
    float _652 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _592);
    float _654 = _642 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _656 = _644 * _646;
    float _658 = _572 * _618;
    float _660 = _628 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _662 = _652 * _654;
    float _664 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _596);
    float _666 = _620 * 6.283185482025146484375;
    float _668 = cos(_666);
    float _670 = _572 * _632;
    float _672 = _664 * _660;
    float _674 = _620 * 6.283185482025146484375;
    float _676 = sin(_674);
    float _678 = _650 * _618;
    float _680 = _650 * _632;
    float _682 = _636 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _684 = _636 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _686 = _636 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _688 = fma(_634, (*spvDescriptorSet0.vp_c10)._m0[4].x, _682);
    float _690 = _572 * _668;
    float _692 = _632 * _668;
    float _694 = _650 * _668;
    float _696 = _618 * _668;
    float _698 = _690 * _656;
    float _700 = fma(_634, (*spvDescriptorSet0.vp_c10)._m0[6].x, _684);
    float _702 = _694 * _656;
    float _704 = fma(_638, (*spvDescriptorSet0.vp_c10)._m0[4].z, _688);
    float _706 = fma(_676, _670, _678);
    float _708 = fma(_676, _678, _670);
    float _710 = -_658;
    float _712 = fma(_676, _680, _710);
    float _714 = -_656;
    float _716 = _676 * _714;
    float _718 = -_680;
    float _720 = fma(_676, _658, _718);
    float _722 = fma(_706, _662, _698);
    float _724 = fma(_712, _662, _702);
    float _726 = fma(_692, _662, _716);
    float _728 = fma(_638, (*spvDescriptorSet0.vp_c10)._m0[6].z, _700);
    float _730 = fma(_720, _672, _722);
    float _732 = fma(_708, _672, _724);
    float _734 = fma(_696, _672, _726);
    float _736 = _704 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _738 = _730 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _740 = _730 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _742 = _728 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _744 = fma(_634, (*spvDescriptorSet0.vp_c10)._m0[5].x, _686);
    float _746 = fma(_734, (*spvDescriptorSet0.vp_c10)._m0[8].x, _738);
    float _748 = fma(_734, (*spvDescriptorSet0.vp_c10)._m0[10].x, _740);
    float _750 = fma(_638, (*spvDescriptorSet0.vp_c10)._m0[5].z, _744);
    float _752 = fma(_732, (*spvDescriptorSet0.vp_c10)._m0[8].z, _746);
    float _754 = fma(_732, (*spvDescriptorSet0.vp_c10)._m0[10].z, _748);
    float _756 = _750 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _758 = _736 + _752;
    float _760 = _742 + _754;
    float _762 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _764 = _758 + _762;
    float _766 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _768 = _760 + _766;
    float _770 = _764 * _764;
    float _772 = _768 * _768;
    float _774 = _770 + _772;
    float _776 = sqrt(_774);
    bool _778 = _776 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _780 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _782 = _776 + _780;
    float _784 = _730 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _786 = fma(_734, (*spvDescriptorSet0.vp_c10)._m0[9].x, _784);
    float _788 = fma(_732, (*spvDescriptorSet0.vp_c10)._m0[9].z, _786);
    float _790 = 0.0;
    float _792 = _786;
    float _794 = _734;
    float _796 = _758;
    float _798 = _760;
    float _800 = _770;
    float _802 = _772;
    float _804 = _742;
    if (_778)
    {
        float _806 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _790 = _806;
    }
    float _808 = _790;
    float _810 = _756 + _788;
    float _812 = _810;
    if (_778)
    {
        float _814 = _810 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _792 = _814;
    }
    float _816 = _792;
    float _818 = _816;
    if (_778)
    {
        float _820 = rsqrt(_774);
        _794 = _820;
    }
    float _822 = _794;
    float _824 = _808;
    if (_778)
    {
        float _826 = _782 * _808;
        _824 = _826;
    }
    float _828 = _824;
    float _830 = _828;
    if (_778)
    {
        float _832 = _828 * 0.15915493667125701904296875;
        _830 = _832;
    }
    float _834 = _830;
    float _836 = _634;
    if (_778)
    {
        float _838 = _834 * 6.283185482025146484375;
        float _840 = sin(_838);
        _836 = _840;
    }
    float _842 = _836;
    if (_778)
    {
        float _844 = fma(_842, _816, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _818 = _844;
    }
    float _846 = _818;
    float _848 = _846;
    if (_778)
    {
        float _850 = _822 * _846;
        _848 = _850;
    }
    float _852 = _848;
    if (_778)
    {
        float _854 = fma(_764, _852, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _796 = _854;
    }
    float _856 = _796;
    if (_778)
    {
        float _858 = fma(_768, _852, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _798 = _858;
    }
    float _860 = _798;
    float _862 = fma(_856, 6.2500002968590706586837768554688e-05, 0.5);
    float _864 = fma(_860, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _3812 = float2(_862, _864);
    float3 _868 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_3812, float2(0.0), isnan(_3812)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_3812, float2(0.0), isnan(_3812)), level(0.0)).xyz;
    float _870 = _868.x;
    float _872 = _868.y;
    float _874 = _868.z;
    float _876 = in.m_75.y;
    bool _878 = _594 != 0.0;
    bool _880 = isnan(_594);
    bool _882 = _878 || _880;
    bool _884 = isnan(0.0);
    bool _886 = _882 || _884;
    float _888 = _834;
    if (_778)
    {
        float _890 = _834 * 6.283185482025146484375;
        float _892 = cos(_890);
        _888 = _892;
    }
    float _894 = _888;
    int _896 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _898 = _896 != 0;
    float _900 = in.m_67.w;
    bool _902 = _592 == 0.0;
    bool _904 = !_886;
    bool _906 = _902 && _904;
    int _908 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _910 = _908 != 0;
    float _912 = in.m_77.x;
    float _914 = in.m_77.y;
    float _916 = in.m_77.z;
    bool _918 = _596 == 0.0;
    bool _920 = _918 && _906;
    float _922 = in.m_75.x;
    float _924 = _782;
    float _926 = 1.0;
    float _928 = 1.0;
    if (_898)
    {
        float _930 = in.m_67.z;
        _924 = _930;
    }
    float _932 = _924;
    out.m_79.x = 1.0;
    out.m_79.y = 1.0;
    out.m_79.z = 1.0;
    float _934 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _936 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _938 = -_876;
    float _940 = _938 + 1.0;
    float _942 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _944 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _946 = _934 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _948 = _900 > 0.5;
    float _950 = _936 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _952 = _942 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _954 = _876;
    if (_910)
    {
        float _956 = _948 ? _940 : _876;
        _954 = _956;
    }
    float _958 = _954;
    float _960 = 0.0;
    float _962 = _912;
    float _964 = _914;
    if (_920)
    {
        _960 = _912;
    }
    float _966 = _960;
    out.m_81.x = _946;
    out.m_81.y = _950;
    out.m_81.z = _952;
    out.m_81.w = _944;
    float _968 = _966;
    float _970 = _922;
    if (!_898)
    {
        _926 = _922;
    }
    float _972 = _926;
    float _974 = 0.0;
    float _976 = _972;
    if (_920)
    {
        _974 = _966;
    }
    float _978 = _974;
    bool _980 = _932 > 0.5;
    bool _982 = _980 && _898;
    float _984 = in.m_83.x;
    float _986 = in.m_83.y;
    float _988 = in.m_83.z;
    float _990 = in.m_83.w;
    float _992 = _978;
    if (!_920)
    {
        _968 = _912;
    }
    float _994 = _968;
    if (_920)
    {
        _962 = _914;
    }
    float _996 = _962;
    float _998 = _996;
    if (_920)
    {
        _928 = _916;
    }
    float _1000 = _928;
    float _1002 = _1000;
    if (!_920)
    {
        float _1004 = fma(_596, (*spvDescriptorSet0.vp_c9)._m0[17].y, _916);
        _1002 = _1004;
    }
    float _1006 = _1002;
    float _1008 = 0.0;
    if (_920)
    {
        _1008 = _996;
    }
    float _1010 = _1008;
    float _1012 = _1010;
    if (!_920)
    {
        float _1014 = fma(_592, (*spvDescriptorSet0.vp_c9)._m0[17].y, _994);
        _992 = _1014;
    }
    float _1016 = _992;
    if (!_920)
    {
        _998 = _914;
    }
    float _1018 = _998;
    if (_898)
    {
        _964 = _922;
    }
    float _1020 = _964;
    float _1022 = _1020;
    if (!_920)
    {
        float _1024 = fma(_594, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1018);
        _1012 = _1024;
    }
    float _1026 = _1012;
    if (_982)
    {
        float _1028 = -_1020;
        float _1030 = _1028 + 1.0;
        _1022 = _1030;
    }
    float _1032 = _1022;
    float _1034 = -_1026;
    float _1036 = _676 * _1034;
    float _1038 = _694 * _1026;
    if (_898)
    {
        _976 = _1032;
    }
    float _1040 = _976;
    float _1042 = fma(_692, _1016, _1036);
    float _1044 = fma(_712, _1016, _1038);
    float _1046 = _988 * _994;
    float _1048 = _986 * _916;
    float _1050 = _984 * _1018;
    float _1052 = fma(_696, _1006, _1042);
    float _1054 = -_1046;
    float _1056 = fma(_984, _916, _1054);
    float _1058 = -_1048;
    float _1060 = fma(_988, _1018, _1058);
    float _1062 = -_1050;
    float _1064 = fma(_986, _994, _1062);
    float _1066 = -_986;
    float _1068 = _676 * _1066;
    float _1070 = _1056 * _990;
    float _1072 = _690 * _1026;
    float _1074 = _1060 * _990;
    float _1076 = _1064 * _990;
    float _1078 = -_1070;
    float _1080 = _676 * _1078;
    float _1082 = _690 * _986;
    float _1084 = _690 * _1070;
    float _1086 = _694 * _986;
    float _1088 = _694 * _1070;
    float _1090 = fma(_706, _1016, _1072);
    float _1092 = fma(_692, _1074, _1080);
    float _1094 = fma(_706, _1074, _1084);
    float _1096 = fma(_692, _984, _1068);
    float _1098 = fma(_706, _984, _1082);
    float _1100 = fma(_712, _984, _1086);
    float _1102 = fma(_712, _1074, _1088);
    float _1104 = fma(_720, _1006, _1090);
    float _1106 = fma(_696, _988, _1096);
    float _1108 = fma(_720, _988, _1098);
    float _1110 = fma(_708, _988, _1100);
    float _1112 = fma(_696, _1076, _1092);
    float _1114 = fma(_720, _1076, _1094);
    float _1116 = fma(_708, _1076, _1102);
    float _1118 = _1104 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1120 = _1076;
    float _1122 = _1118;
    if (_778)
    {
        float _1124 = _894 + (-1.0);
        _1120 = _1124;
    }
    float _1126 = _1120;
    float _1128 = _1104 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1130 = _1104 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1132 = fma(_1052, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1118);
    float _1134 = _1126;
    float _1136 = _1128;
    if (_778)
    {
        float _1138 = _1126 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1122 = _1138;
    }
    float _1140 = _1122;
    float _1142 = fma(_708, _1006, _1044);
    float _1144 = fma(_1052, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1128);
    float _1146 = fma(_1052, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1130);
    float _1148 = _1108 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    if (_778)
    {
        float _1150 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1152 = _856 + _1150;
        _1134 = _1152;
    }
    float _1154 = _1134;
    if (_778)
    {
        float _1156 = fma(_810, _894, _1140);
        _812 = _1156;
    }
    float _1158 = _812;
    if (_778)
    {
        float _1160 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1162 = _860 + _1160;
        _1136 = _1162;
    }
    float _1164 = _1136;
    float _1166 = fma(_1106, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1148);
    if (_778)
    {
        float _1168 = _1154 * _1154;
        _800 = _1168;
    }
    float _1170 = _800;
    float _1172 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1174 = _1158 + _1172;
    float _1176 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    if (_778)
    {
        float _1178 = _1164 * _1164;
        _802 = _1178;
    }
    float _1180 = _802;
    float _1182 = _1108 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1184 = fma(_1174, _1174, _1170);
    float _1186 = _1108 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1188 = _1114 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1190 = fma(_1106, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1182);
    float _1192 = _1184 + _1180;
    float _1194 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1196 = fma(_1106, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1186);
    float _1198 = _1114 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1200 = _1114 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1202 = _958 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1204 = fma(_1112, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1188);
    float _1206 = fma(_1112, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1198);
    float _1208 = _1040 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1210 = sqrt(_1192);
    float _1212 = fma(_1112, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1200);
    float _1214 = _1202 * _1176;
    float _1216 = fma(_1110, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1166);
    float _1218 = fma(_1110, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1190);
    float _1220 = fma(_1116, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1204);
    float _1222 = fma(_1116, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1206);
    float _1224 = fma(_1142, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1132);
    float _1226 = _1208 * _1194;
    float _1228 = fma(_1110, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1196);
    float _1230 = fma(_1116, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1212);
    float _1232 = fma(_1142, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1144);
    float _1234 = fma(_1142, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1146);
    out.m_85.z = _1226;
    out.m_85.w = _1214;
    bool _1236 = _1210 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1238 = isnan(_1210);
    bool _1240 = _1236 || _1238;
    bool _1242 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1244 = _1240 || _1242;
    out.m_87.x = _1216;
    out.m_87.y = _1218;
    out.m_87.z = _1228;
    out.m_89.x = _1220;
    out.m_89.y = _1222;
    out.m_89.z = _1230;
    out.m_91.x = _1224;
    out.m_91.y = _1232;
    out.m_91.z = _1234;
    float _1246 = _1208;
    if (!_1244)
    {
        _1246 = 1.0;
    }
    float _1248 = _1246;
    out.m_93.x = _870;
    out.m_93.y = _872;
    out.m_93.z = _874;
    bool _1250 = !_1244;
    float _1252 = _1248;
    if (!_1250)
    {
        bool _1254 = _1210 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1256 = isnan(_1210);
        bool _1258 = _1254 || _1256;
        bool _1260 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1262 = _1258 || _1260;
        if (!_1262)
        {
            float _1264 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1266 = _1210 + _1264;
            float _1268 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1270 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1268;
            float _1272 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1274 = _1272 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1276 = 1.0 / _1270;
            float _1278 = _1266 * _1276;
            float _1280 = fma(_1278, _1274, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1252 = _1280;
            _1282 = true;
        }
        else
        {
            bool _1284 = _1210 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1286 = isnan(_1210);
            bool _1288 = _1284 || _1286;
            bool _1290 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1292 = _1288 || _1290;
            if (!_1292)
            {
                float _1294 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1296 = _1210 + _1294;
                float _1298 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1300 = _1298 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1302 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1304 = _1302 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1306 = 1.0 / _1300;
                float _1308 = _1296 * _1306;
                float _1310 = fma(_1308, _1304, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1252 = _1310;
                _1282 = true;
            }
            else
            {
                _1252 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1282 = false;
    float _1312 = _1252;
    float _1314 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1316 = _1158 + _1314;
    float _1318 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1320 = _856 + _1318;
    float _1322 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1324 = _860 + _1322;
    float _1326 = _756 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1328 = fma(_1316, _1312, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1330 = fma(_1320, _1312, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1332 = fma(_1324, _1312, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1334 = fma(_736, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1326);
    float _1336 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1338 = _1328 + _1336;
    float _1340 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1342 = _1330 + _1340;
    float _1344 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1346 = _1332 + _1344;
    float _1348 = _1338 * _1338;
    float _1350 = fma(_1342, _1342, _1348);
    float _1352 = fma(_1346, _1346, _1350);
    float _1354 = fma(_742, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1334);
    float _1356 = _756 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1358 = fma(_736, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1360 = rsqrt(_1352);
    float _1362 = _1354 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1364 = fma(_736, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1356);
    float _1366 = fma(_742, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1368 = fma(_742, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1364);
    float _1370 = 1.0 / _1362;
    float _1372 = _1368 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1374 = _1372 + _1362;
    float _1376 = _1360 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1378 = floor(_1358);
    float _1380 = _1342 * _1376;
    float _1382 = _1346 * _1376;
    float _1384 = _1380 * _1380;
    float _1386 = _1382 * _1382;
    float _1388 = _1374 * _1370;
    float _1390 = _1388 * 0.5;
    float _1392 = sqrt(_1352);
    float _1394 = _1384 + _1386;
    float _1396 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1398 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1396);
    float _1400 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _1402 = -_1378;
    float _1404 = _1358 + _1402;
    float _1406 = sqrt(_1394);
    float _1408 = _756 + _1400;
    float _1410 = _1408 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1412 = _1408 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1414 = 1.0 / _1398;
    float _1416 = fma(_736, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1410);
    float _1418 = fma(_736, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1412);
    float _1420 = fma(_742, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1416);
    float _1422 = fma(_742, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1418);
    bool _1424 = _1406 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1426 = _1420 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1428 = _1422 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1430 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1432 = _1406 + _1430;
    float _1434 = floor(_1366);
    float _1436 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1438 = _1414 * _1436;
    float _1440 = trunc(_1426);
    int _1442 = int(_1440);
    bool _1444 = _1438 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1446 = _1438 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1448 = _756;
    int _1450 = 2;
    float _1452 = _1432;
    float _1454 = _1394;
    float _1456 = _1376;
    float _1458 = _1380;
    float _1460 = _1384;
    if (_1424)
    {
        float _1462 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1448 = _1462;
    }
    float _1464 = _1448;
    float _1466 = -_1434;
    float _1468 = _1366 + _1466;
    if (!_1444)
    {
        _1450 = 1;
    }
    int _1470 = _1450;
    float _1472 = trunc(_1428);
    int _1474 = int(_1472);
    int _1476 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1478 = _1442 + _1476;
    int _1480 = _1478 + 1;
    int _1482 = _1470;
    if (_1424)
    {
        float _1484 = _1432 * _1464;
        _1452 = _1484;
    }
    float _1486 = _1452;
    if (_1424)
    {
        float _1488 = rsqrt(_1394);
        _1454 = _1488;
    }
    float _1490 = _1454;
    float _1492 = 0.0;
    float _1494 = _1490;
    if (_1424)
    {
        float _1496 = _1486 * 0.15915493667125701904296875;
        _1492 = _1496;
    }
    float _1498 = _1492;
    bool _1500 = !_1444;
    int _1502 = _1500 ? 0 : 1;
    float _1504 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    int _1506 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1508 = _1474 + _1506;
    int _1510 = _1508 + 1;
    float _1512 = _1422;
    if (_1424)
    {
        float _1514 = _1498 * 6.283185482025146484375;
        float _1516 = sin(_1514);
        _1512 = _1516;
    }
    float _1518 = _1512;
    if (!_1446)
    {
        _1482 = _1502;
    }
    int _1520 = _1482;
    float _1522 = precise::max(0.0, _1504);
    int _1524 = _1520 << 6;
    bool _1526 = _1480 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1528 = -_1376;
    float _1530 = -_1522;
    float _1532 = fma(_1338, _1528, _1530);
    int _1534 = _1524 + 96;
    uint _1537 = uint(int(uint(_1534) >> uint(2)));
    uint _1539 = uint(int(uint(int(_1537)) >> uint(2)));
    int _1541 = int(_1537) & 3;
    float _1543 = (*spvDescriptorSet0.vp_c15)._m0[int(_1539)][_1541];
    int _1545 = int(_1537) + 1;
    uint _1547 = uint(int(uint(_1545) >> uint(2)));
    int _1549 = _1545 & 3;
    float _1551 = (*spvDescriptorSet0.vp_c15)._m0[int(_1547)][_1549];
    int _1553 = _1480 | _1510;
    float _1555 = _1498;
    float _1557 = as_type<float>(_1553);
    float _1559 = _1532;
    if (_1424)
    {
        float _1561 = _1498 * 6.283185482025146484375;
        float _1563 = cos(_1561);
        _1555 = _1563;
    }
    float _1565 = _1555;
    if (_1424)
    {
        float _1567 = _1532 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1456 = _1567;
    }
    float _1569 = _1456;
    bool _1571 = _1553 < 0;
    bool _1573 = _1571 || _1526;
    if (_1424)
    {
        float _1575 = fma(_1518, _1569, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1557 = _1575;
    }
    float _1577 = _1557;
    int _1579 = _1524 + 48;
    uint _1581 = uint(int(uint(_1579) >> uint(2)));
    uint _1583 = uint(int(uint(int(_1581)) >> uint(2)));
    int _1585 = int(_1581) & 3;
    float _1587 = (*spvDescriptorSet0.vp_c15)._m0[int(_1583)][_1585];
    int _1589 = int(_1581) + 1;
    uint _1591 = uint(int(uint(_1589) >> uint(2)));
    int _1593 = _1589 & 3;
    float _1595 = (*spvDescriptorSet0.vp_c15)._m0[int(_1591)][_1593];
    float _1597 = _1328 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    bool _1599 = _1510 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1601 = _1599 || _1573;
    float _1603 = 0.0;
    if (_1424)
    {
        float _1605 = _1490 * _1577;
        _1603 = _1605;
    }
    float _1607 = _1603;
    float _1609 = fma(_1330, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1597);
    if (_1424)
    {
        float _1611 = _1380 * _1607;
        _1458 = _1611;
    }
    float _1613 = _1458;
    int _1615 = _1524 + 104;
    uint _1617 = uint(int(uint(_1615) >> uint(2)));
    uint _1619 = uint(int(uint(int(_1617)) >> uint(2)));
    int _1621 = int(_1617) & 3;
    float _1623 = (*spvDescriptorSet0.vp_c15)._m0[int(_1619)][_1621];
    int _1625 = int(_1617) + 1;
    uint _1627 = uint(int(uint(_1625) >> uint(2)));
    int _1629 = _1625 & 3;
    float _1631 = (*spvDescriptorSet0.vp_c15)._m0[int(_1627)][_1629];
    float _1633 = fma(_1332, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1609);
    float _1635 = _1565;
    if (_1424)
    {
        float _1637 = _1565 + (-1.0);
        _1494 = _1637;
    }
    float _1639 = _1494;
    float _1641 = _1639;
    if (_1424)
    {
        float _1643 = _1613 * _1613;
        _1460 = _1643;
    }
    float _1645 = _1460;
    float _1647 = 0.0;
    if (_1424)
    {
        float _1649 = _1639 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1647 = _1649;
    }
    float _1651 = _1647;
    if (!_1424)
    {
        _1641 = _1382;
    }
    float _1653 = _1641;
    int _1655 = _1524 + 64;
    uint _1657 = uint(int(uint(_1655) >> uint(2)));
    uint _1659 = uint(int(uint(int(_1657)) >> uint(2)));
    int _1661 = int(_1657) & 3;
    float _1663 = (*spvDescriptorSet0.vp_c15)._m0[int(_1659)][_1661];
    int _1665 = int(_1657) + 1;
    uint _1667 = uint(int(uint(_1665) >> uint(2)));
    int _1669 = _1665 & 3;
    float _1671 = (*spvDescriptorSet0.vp_c15)._m0[int(_1667)][_1669];
    float _1673 = _1653;
    if (_1424)
    {
        float _1675 = _1382 * _1607;
        _1673 = _1675;
    }
    float _1677 = _1673;
    if (_1424)
    {
        float _1679 = fma(_1532, _1565, _1651);
        _1559 = _1679;
    }
    float _1681 = _1559;
    float _1683 = _1633 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    if (!_1424)
    {
        _1635 = _1386;
    }
    float _1685 = _1635;
    float _1687 = _1685;
    if (_1424)
    {
        float _1689 = _1677 * _1677;
        _1687 = _1689;
    }
    float _1691 = _1687;
    float _1693 = fma(_1681, _1681, _1645);
    float _1695 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    int _1697 = _1524 + 80;
    uint _1699 = uint(int(uint(_1697) >> uint(2)));
    uint _1701 = uint(int(uint(int(_1699)) >> uint(2)));
    int _1703 = int(_1699) & 3;
    float _1705 = (*spvDescriptorSet0.vp_c15)._m0[int(_1701)][_1703];
    int _1707 = int(_1699) + 1;
    uint _1709 = uint(int(uint(_1707) >> uint(2)));
    int _1711 = _1707 & 3;
    float _1713 = (*spvDescriptorSet0.vp_c15)._m0[int(_1709)][_1711];
    float _1715 = _1683 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1717 = _1693 + _1691;
    int _1719 = as_type<int>(_1715);
    if (!_1601)
    {
        float _1721 = floor(_1428);
        _970 = _1721;
    }
    float _1723 = _970;
    float _1725 = -_1715;
    float _1727 = fma(_1725, _1695, 1.0);
    if (!_1601)
    {
        int _1729 = _1510 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1731 = _1729 + _1480;
        _1719 = _1731;
    }
    int _1733 = _1719;
    int _1735 = _1524 + 56;
    uint _1737 = uint(int(uint(_1735) >> uint(2)));
    uint _1739 = uint(int(uint(int(_1737)) >> uint(2)));
    int _1741 = int(_1737) & 3;
    float _1743 = (*spvDescriptorSet0.vp_c15)._m0[int(_1739)][_1741];
    int _1745 = int(_1737) + 1;
    uint _1747 = uint(int(uint(_1745) >> uint(2)));
    int _1749 = _1745 & 3;
    float _1751 = (*spvDescriptorSet0.vp_c15)._m0[int(_1747)][_1749];
    float _1753 = log2(_1727);
    int _1755 = _1524 + 88;
    uint _1757 = uint(int(uint(_1755) >> uint(2)));
    uint _1759 = uint(int(uint(int(_1757)) >> uint(2)));
    int _1761 = int(_1757) & 3;
    float _1763 = (*spvDescriptorSet0.vp_c15)._m0[int(_1759)][_1761];
    int _1765 = int(_1757) + 1;
    uint _1767 = uint(int(uint(_1765) >> uint(2)));
    int _1769 = _1765 & 3;
    float _1771 = (*spvDescriptorSet0.vp_c15)._m0[int(_1767)][_1769];
    float _1773 = _1408 * _1551;
    float _1775 = fma(_736, _1543, _1773);
    int _1777 = _1524 + 72;
    uint _1779 = uint(int(uint(_1777) >> uint(2)));
    uint _1781 = uint(int(uint(int(_1779)) >> uint(2)));
    int _1783 = int(_1779) & 3;
    float _1785 = (*spvDescriptorSet0.vp_c15)._m0[int(_1781)][_1783];
    int _1787 = int(_1779) + 1;
    uint _1789 = uint(int(uint(_1787) >> uint(2)));
    int _1791 = _1787 & 3;
    float _1793 = (*spvDescriptorSet0.vp_c15)._m0[int(_1789)][_1791];
    float _1795 = _1408 * _1595;
    float _1797 = rsqrt(_1717);
    float _1799 = _1753 * 0.693147182464599609375;
    float _1801 = fma(_736, _1587, _1795);
    int _1803 = as_type<int>(_1795);
    int _1805 = as_type<int>(_1543);
    if (!_1601)
    {
        int _1807 = _1733 << 2;
        _1803 = _1807;
    }
    int _1809 = _1803;
    float _1811 = fma(_742, _1623, _1775);
    int _1813 = _1809;
    if (!_1601)
    {
        int _1815 = 12 & _1809;
        _1813 = _1815;
    }
    int _1817 = _1813;
    float _1819 = _1811 + _1631;
    float2 _5447 = float2(_1404, _1468);
    float _1821 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5447, float2(0.0), isnan(_5447)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5447, float2(0.0), isnan(_5447)), level(0.0)).x;
    float _1823 = _1799 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1825 = _1408 * _1671;
    float _1827 = _1671;
    int _1829 = as_type<int>(_1713);
    if (!_1601)
    {
        float _1831 = -_1723;
        float _1833 = _1428 + _1831;
        _1827 = _1833;
    }
    float _1835 = _1827;
    float _1837 = 1.0 / _1819;
    float _1839 = _1797 * _1613;
    float _1841 = fma(_736, _1663, _1825);
    float _1843 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1845 = fma(_1392, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1843);
    float _1847 = precise::clamp(_1845, 0.0, 1.0);
    float _1849 = _1797 * _1681;
    float _1851 = _1839 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1853 = _1408 * _1713;
    if (!_1601)
    {
        uint _1855 = uint(int(uint(_1733) >> uint(2)));
        _1829 = int(_1855);
    }
    int _1857 = _1829;
    float _1859 = _1797 * _1677;
    float _1861 = fma(_736, _1705, _1853);
    float _1863 = -_1847;
    float _1865 = _1863 + 1.0;
    if (!_1601)
    {
        int _1867 = _1857 << 4;
        int _1869 = _1867 + _1817;
        _1805 = _1869;
    }
    int _1871 = _1805;
    float _1873 = fma(_742, _1743, _1801);
    float _1875 = _1847;
    float _1877 = as_type<float>(_1871);
    if (!_1601)
    {
        int _1879 = _1871 + 400;
        uint _1881 = uint(int(uint(_1879) >> uint(2)));
        uint _1883 = uint(int(uint(int(_1881)) >> uint(2)));
        int _1885 = int(_1881) & 3;
        float _1887 = (*spvDescriptorSet0.vp_c15)._m0[int(_1883)][_1885];
        _1875 = _1887;
    }
    float _1889 = _1875;
    float _1891 = abs(_1865);
    float _1893 = log2(_1891);
    float _1895 = _1873 + _1751;
    float _1897 = _1328 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1899 = fma(_742, _1763, _1861);
    float _1901 = -_1851;
    float _1903 = fma(_1849, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1901);
    float _1905 = _1328 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1907 = fma(_1330, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1897);
    float _1909 = -_1859;
    float _1911 = fma(_1909, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1903);
    float _1913 = fma(_1330, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1905);
    float _1915 = _1895 * _1837;
    float _1917 = fma(_742, _1785, _1841);
    float _1919 = fma(_1911, -0.5, 0.5);
    float _1921 = fma(_1332, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1913);
    float _1923 = fma(_1911, 0.5, 0.5);
    float _1925 = _1917 + _1793;
    float _1927 = _1328 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    bool _1929 = _1915 >= 0.0;
    float _1931 = fma(_1332, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1907);
    float _1933 = _1925 * _1837;
    float _1935 = fma(_1330, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1927);
    bool _1937 = _1915 <= 1.0;
    bool _1939 = _1937 && _1929;
    float _1941 = _1931 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1943 = _1893 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1945 = fma(_1332, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1935);
    bool _1947 = _1933 >= 0.0;
    bool _1949 = _1947 && _1939;
    float _1951 = _1941 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1953 = exp2(_1943);
    float _1955 = _1945 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    bool _1957 = _1933 <= 1.0;
    bool _1959 = _1957 && _1949;
    float _1961 = _1921 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1963 = _1899 + _1771;
    float _1965 = fma(_1955, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1951);
    float _1967 = _1941 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1969 = _1849 + 1.0;
    float _1971 = sqrt(_1919);
    float _1973 = fma(_1683, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1965);
    float _1975 = fma(_1955, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1967);
    float _1977 = _1963 * _1837;
    float _1979 = fma(_1923, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1981 = fma(_1961, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1973);
    if (_1959)
    {
        float _1983 = float(_1520);
        _1877 = _1983;
    }
    float _1985 = _1877;
    float _1987 = -_1849;
    float _1989 = fma(_1953, _1969, _1987);
    float _1991 = fma(_1923, _1979, -0.212114393711090087890625);
    float _1993 = 1.0 / _1981;
    float _1995 = _1941 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1997 = fma(_1989, 0.5, 0.5);
    float _1999 = fma(_1923, _1991, 1.570728778839111328125);
    float _2001 = fma(_1683, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1975);
    float _2003 = fma(_1955, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1995);
    float _2005 = _1971 * 0.636619746685028076171875;
    float _2007 = _1985;
    float _2009 = _2003;
    if (_1959)
    {
        float _2011 = rint(_1985);
        float _2013 = precise::max(_2011, 0.0);
        uint _2015 = uint(_2013);
        uint _2017 = clamp(_2015, 0u, 65535u);
        _2007 = as_type<float>(_2017);
    }
    float _2019 = _2007;
    float _2021 = fma(_1683, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2003);
    float _2023 = fma(_1961, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2001);
    float _2025 = -_1999;
    float _2027 = fma(_2005, _2025, 1.0);
    float _2029 = fma(_1961, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2021);
    float _2031 = _1859;
    if (!_1601)
    {
        float _2033 = floor(_1426);
        _2031 = _2033;
    }
    float _2035 = _2031;
    float _2037 = _2023 * _1993;
    float _2039 = _2029 * _1993;
    float _2041 = fma(_2037, 0.5, 0.5);
    float _2043 = fma(_2039, -0.5, 0.5);
    float _2045 = _2019;
    if (_1959)
    {
        float3 _5836 = float3(_1915, _1933, float(as_type<int>(_2019)));
        float3 _5840 = select(_5836, float3(0.0), isnan(_5836));
        float _2047 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5840.xy, uint(rint(_5840.z)), _1977, level(0.0));
        _2045 = _2047;
    }
    float _2049 = _2045;
    float _2051 = _2039;
    if (!_1601)
    {
        float _2053 = rint(_1889);
        float _2055 = precise::max(_2053, 0.0);
        uint _2057 = uint(_2055);
        uint _2059 = clamp(_2057, 0u, 65535u);
        _2051 = as_type<float>(_2059);
    }
    float _2061 = _2051;
    float3 _5866 = float3(_2041, _2043, _1823);
    float _2063 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5866, float3(0.0), isnan(_5866)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5866, float3(0.0), isnan(_5866)), level(0.0)).x;
    if (!_1601)
    {
        float _2065 = -_2035;
        float _2067 = _1426 + _2065;
        _2009 = _2067;
    }
    float _2069 = _2009;
    float3 _5886 = float3(_2041, _2043, _1823);
    float4 _2072 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5886, float3(0.0), isnan(_5886)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5886, float3(0.0), isnan(_5886)), level(0.0)).xyzw;
    float _2074 = _2072.x;
    float _2076 = _2072.y;
    float _2078 = _2072.z;
    float _2080 = _2072.w;
    float2 _5902 = float2(_2027, _1997);
    float3 _2082 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5902, float2(0.0), isnan(_5902)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5902, float2(0.0), isnan(_5902)), level(0.0)).xyz;
    float _2084 = _2082.x;
    float _2086 = _2082.y;
    float _2088 = _2082.z;
    float _2090 = _2061;
    if (!_1601)
    {
        float3 _5923 = float3(_2069, _1835, float(as_type<int>(_2061)));
        float3 _5925 = select(_5923, float3(0.0), isnan(_5923));
        float _2092 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5925.xy, uint(rint(_5925.z)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5925.xy, uint(rint(_5925.z)), level(0.0)).x;
        _2090 = _2092;
    }
    float _2094 = _2090;
    float _2096 = abs(_1438);
    float _2098 = log2(_2096);
    float _2100 = _1941 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2102 = fma(_1955, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2100);
    float _2104 = fma(_1683, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2102);
    float _2106 = _1893 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2108 = fma(_1961, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2104);
    float _2110 = _2098 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2112 = _2108 + _1981;
    float _2114 = exp2(_2106);
    bool _2116 = _1438 <= 8000.0;
    bool _2118 = isnan(_1438);
    bool _2120 = _2116 || _2118;
    bool _2122 = isnan(8000.0);
    bool _2124 = _2120 || _2122;
    float _2126 = float(_2124);
    float _2128 = _2112 * 0.5;
    float _2130 = exp2(_2110);
    out.m_95.z = _2128;
    out.m_95.w = _1981;
    float _2132 = fma(_2130, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2134 = precise::clamp(_2132, 0.0, 1.0);
    float _2136 = fma(_2134, -2.0, 3.0);
    float _2138 = _2134 * _2134;
    float _2140 = _2138 * _2136;
    float _2142 = -_2140;
    float _2144 = _2142 + 1.0;
    out.gl_Position.x = _2023;
    out.gl_Position.y = _2029;
    out.gl_Position.z = _2108;
    out.gl_Position.w = _1981;
    float _2146 = fma(_2144, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2140);
    float _2148 = _2126 * _2146;
    float _2150 = _2146;
    float _2152 = _2108;
    float _2154 = _2023;
    if (!_1959)
    {
        _2150 = 1.0;
    }
    float _2156 = _2150;
    float _2158 = _2148 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2160 = -_2114;
    float _2162 = _2160 + 1.0;
    float _2164 = _2162 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2166 = _2162;
    float _2168 = _2156;
    if (_1601)
    {
        _2166 = 1.0;
    }
    float _2170 = _2166;
    float _2172 = -_1821;
    float _2174 = _2172 + 1.0;
    float _2176 = _2174 * _2158;
    float _2178 = precise::clamp(_2176, 0.0, 1.0);
    float _2180 = _2170;
    if (_1959)
    {
        bool _2182 = _2049 >= _1977;
        bool _2184 = isnan(_2049);
        bool _2186 = _2182 || _2184;
        bool _2188 = isnan(_1977);
        bool _2190 = _2186 || _2188;
        float _2192 = float(_2190);
        _2168 = _2192;
    }
    float _2194 = _2168;
    if (!_1601)
    {
        int _2196 = _1733 << 4;
        int _2198 = _2196 + 2048;
        uint _2200 = uint(int(uint(_2198) >> uint(2)));
        uint _2202 = uint(int(uint(int(_2200)) >> uint(2)));
        int _2204 = int(_2200) & 3;
        float _2206 = (*spvDescriptorSet0.vp_c15)._m0[int(_2202)][_2204];
        int _2208 = int(_2200) + 1;
        uint _2210 = uint(int(uint(_2208) >> uint(2)));
        int _2212 = _2208 & 3;
        float _2214 = (*spvDescriptorSet0.vp_c15)._m0[int(_2210)][_2212];
        int _2216 = _2198 + 8;
        uint _2218 = uint(int(uint(_2216) >> uint(2)));
        uint _2220 = uint(int(uint(int(_2218)) >> uint(2)));
        int _2222 = int(_2218) & 3;
        float _2224 = (*spvDescriptorSet0.vp_c15)._m0[int(_2220)][_2222];
        int _2226 = int(_2218) + 1;
        uint _2228 = uint(int(uint(_2226) >> uint(2)));
        int _2230 = _2226 & 3;
        float _2232 = (*spvDescriptorSet0.vp_c15)._m0[int(_2228)][_2230];
        float _2234 = _1408 * _2214;
        float _2236 = fma(_736, _2206, _2234);
        float _2238 = fma(_742, _2224, _2236);
        float _2240 = _2238 + _2232;
        float _2242 = precise::clamp(_2240, 0.0, 1.0);
        float _2244 = -_2242;
        float _2246 = _2244 + _2094;
        float _2248 = fma(_2246, 500.0, 1.5);
        float _2250 = exp2(_2248);
        float _2252 = 0.0 + _2250;
        float _2254 = precise::clamp(_2252, 0.0, 1.0);
        _2180 = _2254;
        _2152 = _2206;
    }
    float _2256 = _2180;
    float _2258 = _2152;
    float _2260 = _2194 * _2256;
    float _2262 = -_2178;
    float _2264 = fma(_2262, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2266 = _2164 * _2063;
    out.m_97.x = _1330;
    out.m_97.y = _1328;
    out.m_97.z = _1332;
    bool _2268 = _1392 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2270 = isnan(_1392);
    bool _2272 = _2268 || _2270;
    bool _2274 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2276 = _2272 || _2274;
    float _2278 = -_2260;
    float _2280 = fma(_2278, _2264, 1.0);
    float _2282 = precise::clamp(_2280, 0.0, 1.0);
    float _2284 = _2080 * _2266;
    float _2286 = -_2164;
    float _2288 = _2286 + 1.0;
    float _2290 = _2088 * _2266;
    float _2292 = _2282 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2294 = fma(_2084, _2284, _2074);
    float _2296 = fma(_2086, _2284, _2076);
    float _2298 = _2080 * _2288;
    float _2300 = fma(_2080, _2290, _2078);
    out.m_99.x = _2292;
    float _2302 = _2258;
    float _2304 = _2284;
    float _2306 = _2288;
    float _2308 = _2282;
    if (!_2276)
    {
        _2302 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2310 = _2302;
    out.m_101.x = _2294;
    out.m_101.y = _2296;
    out.m_101.z = _2300;
    out.m_101.w = _2298;
    float _2312 = _2310;
    float _2314 = _2310;
    if (!_2276)
    {
        _804 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2316 = _804;
    float _2318 = _2316;
    float _2320 = _2316;
    if (!_2276)
    {
        _2154 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2322 = _2154;
    float _2324 = _2322;
    float _2326 = _2322;
    if (!_2276)
    {
        _2304 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2328 = _2304;
    float _2330 = _2328;
    float _2332 = _2328;
    if (!_2276)
    {
        _2306 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2334 = _2306;
    float _2336 = _2334;
    float _2338 = _2334;
    if (!_2276)
    {
        _2308 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2340 = _2308;
    bool _2342 = !_2276;
    float _2344 = _2340;
    float _2346 = _2340;
    if (!_2342)
    {
        bool _2348 = _1392 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2350 = isnan(_1392);
        bool _2352 = _2348 || _2350;
        bool _2354 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2356 = _2352 || _2354;
        if (!_2356)
        {
            float _2358 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2360 = _1392 + _2358;
            float _2362 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2364 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2362;
            float _2366 = 1.0 / _2364;
            float _2368 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2370 = _2368 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2372 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2374 = _2372 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2376 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2378 = _2376 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2380 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2382 = _2380 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2384 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2386 = _2384 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2388 = _2360 * _2366;
            float _2390 = precise::clamp(_2388, 0.0, 1.0);
            float _2392 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2394 = _2392 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2396 = fma(_2390, _2370, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2398 = fma(_2390, _2394, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2400 = fma(_2390, _2374, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2402 = fma(_2390, _2378, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2404 = fma(_2390, _2382, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2406 = fma(_2390, _2386, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2320 = _2398;
            _2338 = _2404;
            _2314 = _2396;
            _2332 = _2402;
            _2326 = _2400;
            _2346 = _2406;
            _2408 = true;
        }
        else
        {
            bool _2410 = _1392 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2412 = isnan(_1392);
            bool _2414 = _2410 || _2412;
            bool _2416 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2418 = _2414 || _2416;
            if (!_2418)
            {
                _2312 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2420 = _2312;
            _2314 = _2420;
            if (!_2418)
            {
                _2318 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2422 = _2318;
            _2320 = _2422;
            if (!_2418)
            {
                _2324 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2424 = _2324;
            _2326 = _2424;
            if (!_2418)
            {
                _2330 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2426 = _2330;
            _2332 = _2426;
            if (!_2418)
            {
                _2336 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2428 = _2336;
            _2338 = _2428;
            if (!_2418)
            {
                _2344 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2430 = _2344;
            bool _2432 = !_2418;
            _2346 = _2430;
            if (!_2432)
            {
                bool _2434 = _1392 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2436 = isnan(_1392);
                bool _2438 = _2434 || _2436;
                bool _2440 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2442 = _2438 || _2440;
                if (!_2442)
                {
                    float _2444 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2446 = _1392 + _2444;
                    float _2448 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2450 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2448;
                    float _2452 = 1.0 / _2450;
                    float _2454 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2456 = _2454 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2458 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2460 = _2458 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2462 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2464 = _2462 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2466 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2468 = _2466 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2470 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2472 = _2470 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2474 = _2446 * _2452;
                    float _2476 = precise::clamp(_2474, 0.0, 1.0);
                    float _2478 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2480 = _2478 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2482 = fma(_2476, _2456, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2484 = fma(_2476, _2480, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2486 = fma(_2476, _2460, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2488 = fma(_2476, _2464, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2490 = fma(_2476, _2468, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2492 = fma(_2476, _2472, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2320 = _2484;
                    _2338 = _2490;
                    _2314 = _2482;
                    _2332 = _2488;
                    _2326 = _2486;
                    _2346 = _2492;
                    _2408 = true;
                }
                else
                {
                    _2320 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2338 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2314 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2332 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2326 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2346 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2408 = false;
    float _2494 = _2320;
    float _2496 = _2338;
    float _2498 = _2314;
    float _2500 = _2332;
    float _2502 = _2326;
    float _2504 = _2346;
    float _2506 = fma(_1232, -0.5, 0.5);
    float _2508 = precise::clamp(_2506, 0.0, 1.0);
    float _2510 = -_2494;
    float _2512 = _2510 + _2496;
    float _2514 = -_2498;
    float _2516 = _2514 + _2500;
    float _2518 = -_2502;
    float _2520 = _2518 + _2504;
    bool _2522 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2524 = fma(_2508, _2512, _2494);
    float _2526 = fma(_2508, _2516, _2498);
    float _2528 = fma(_2508, _2520, _2502);
    float _2530 = _2524 * 0.586610972881317138671875;
    out.m_63.x = 1.0;
    float _2532 = fma(_2526, 0.298911988735198974609375, _2530);
    float _2534 = fma(_2528, 0.114477999508380889892578125, _2532);
    out.m_103.x = 0.0;
    float _2536 = -_2534;
    float _2538 = _2526 + _2536;
    float _2540 = -_2534;
    float _2542 = _2524 + _2540;
    float _2544 = -_2534;
    float _2546 = _2528 + _2544;
    float _2548 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2550 = fma(_2538, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2534);
    float _2552 = fma(_2542, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2534);
    float _2554 = fma(_2546, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2534);
    out.m_99.w = _2548;
    out.m_105.x = _2550;
    out.m_105.y = _2552;
    out.m_105.z = _2554;
    if (!_2522)
    {
        return out;
    }
    float _2556 = -_1328;
    float _2558 = _2556 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2560 = -_1330;
    float _2562 = _2560 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2564 = -_1332;
    float _2566 = _2564 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2568 = _2558 * _2558;
    float _2570 = fma(_2562, _2562, _2568);
    float _2572 = fma(_2566, _2566, _2570);
    float _2574 = sqrt(_2572);
    float _2576 = rsqrt(_2572);
    float _2578 = -_2574;
    float _2580 = _2578 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2582 = _2580 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2584 = precise::clamp(_2582, 0.0, 1.0);
    float _2586 = _2562 * _2576;
    float _2588 = _2558 * _2576;
    float _2590 = abs(_2584);
    float _2592 = log2(_2590);
    float _2594 = _2566 * _2576;
    float _2596 = _2586 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2598 = _1232 * _2588;
    float _2600 = -_2588;
    float _2602 = -_2596;
    float _2604 = fma(_2600, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2602);
    float _2606 = fma(_1224, _2586, _2598);
    float _2608 = -_2594;
    float _2610 = fma(_2608, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2604);
    float _2612 = fma(_1234, _2594, _2606);
    float _2614 = precise::clamp(_2612, 0.0, 1.0);
    float _2616 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2618 = _2610 + _2616;
    float _2620 = _2592 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2622 = _2618 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2624 = precise::clamp(_2622, 0.0, 1.0);
    float _2626 = exp2(_2620);
    float _2628 = _2626 * _2624;
    float _2630 = _2614 * _2628;
    float _2632 = _2630 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2634 = _2630 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2636 = _2630 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_103.x = _2632;
    out.m_103.y = _2634;
    out.m_103.z = _2636;
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
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2408 = false;
    bool _1282 = false;
    bool _202 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _119 = in.m_60.w;
    float _121 = trunc(_119);
    int _124 = int(_121);
    bool _128 = _124 >= 1;
    float _130 = 0.0;
    if (!_128)
    {
        _130 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _132 = _130;
    if (!_128)
    {
        out.m_63.x = 0.0;
    }
    int _134 = 0;
    if (!_128)
    {
        float _136 = _132 * 5.0;
        _134 = as_type<int>(_136);
    }
    int _138 = _134;
    int _140 = _138;
    if (!_128)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2692 = as_type<float>(_138);
        out.gl_Position.z = _2692;
    }
    if (!_128)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _142 = in.m_65.w;
    bool _144 = _142 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _146 = isnan(_142);
    bool _148 = _144 || _146;
    bool _150 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _152 = _148 || _150;
    float _154 = -_142;
    float _156 = _154 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _158 = 0.0;
    float _160 = _156;
    if (_152)
    {
        float _162 = float(_124);
        _158 = _162;
    }
    float _164 = _158;
    bool _166 = _156 >= _164;
    bool _168 = !_152;
    bool _170 = _166 || _168;
    float _172 = _164;
    if (_170)
    {
        _172 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _174 = _172;
    if (_170)
    {
        out.m_63.x = 0.0;
    }
    if (_170)
    {
        float _176 = _174 * 5.0;
        _140 = as_type<int>(_176);
    }
    int _178 = _140;
    if (_170)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2762 = as_type<float>(_178);
        out.gl_Position.z = _2762;
    }
    if (_170)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _180 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _182 = !_180;
    float _200;
    if (!_182)
    {
        float _184 = in.m_67.x;
        float _186 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _188 = _184 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _190 = fma(_188, (*spvDescriptorSet0.vp_c9)._m0[12].x, _156);
        float _192 = _190 * _186;
        float _194 = floor(_192);
        float _196 = -_194;
        float _198 = _192 + _196;
        _200 = _198;
        _202 = true;
    }
    else
    {
        float _204 = float(_124);
        float _206 = 1.0 / _204;
        float _208 = _156 * _206;
        _200 = _208;
    }
    _202 = false;
    float _210 = _200;
    float _212 = in.m_67.x;
    float _214 = in.m_67.y;
    float _216 = in.m_67.z;
    float _218 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _220 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _218;
    int _222 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _224 = _222 != 0;
    int _226 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _228 = _226 != 0;
    int _230 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _232 = _230 != 0;
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _236 = _234 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _238 = 1.0 / _220;
    float _240 = 1.0 / _236;
    float _242 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _244 = _210 + _242;
    float _246 = _216 * 2.0;
    float _248 = _212 * 2.0;
    float _250 = _214 + _216;
    float _252 = _212 + _216;
    float _254 = floor(_246);
    float _256 = _216 + (-0.5);
    float _258 = _214 + _212;
    float _260 = _212 + (-0.5);
    float _262 = _214 * 2.0;
    float _264 = _214 + (-0.5);
    float _266 = _250 + (-1.0);
    float _268 = _244 * _238;
    float _270 = floor(_248);
    bool _272 = !_224;
    int _274 = _272 ? 0 : 1;
    float _276 = _252 + (-1.0);
    float _278 = fma(_266, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _280 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _282 = _210 + _280;
    int _284 = abs(_274);
    float _286 = _258 + (-1.0);
    float _288 = fma(_276, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _290 = _254 > 0.0;
    float _292 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _294 = log2(_292);
    bool _296 = _254 >= 0.0;
    bool _298 = isnan(_254);
    bool _300 = _296 || _298;
    bool _302 = isnan(0.0);
    bool _304 = _300 || _302;
    float _306 = _282 * _240;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _310 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _308;
    int _312 = _304 ? 0 : 1;
    bool _314 = _270 > 0.0;
    float _316 = floor(_262);
    int _318 = ~_312;
    int _320 = _318 + 1;
    int _322 = _320 + 1;
    float _324 = fma(_286, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _326 = _270 >= 0.0;
    bool _328 = isnan(_270);
    bool _330 = _326 || _328;
    bool _332 = isnan(0.0);
    bool _334 = _330 || _332;
    float _336 = fma(_310, _268, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    int _338 = _322;
    if (!_290)
    {
        int _340 = ~_312;
        int _342 = _340 + 1;
        _338 = _342;
    }
    int _344 = _338;
    float _346 = float(_284);
    float _348 = float(_344);
    float _350 = _294 * _156;
    int _352 = _334 ? 0 : 1;
    float _354 = _346 * _348;
    int _356 = ~_352;
    int _358 = _356 + 1;
    int _360 = _358 + 1;
    float _362 = in.m_69.x;
    float _364 = in.m_69.y;
    float _366 = in.m_69.z;
    int _368 = _360;
    if (!_314)
    {
        int _370 = ~_352;
        int _372 = _370 + 1;
        _368 = _372;
    }
    int _374 = _368;
    float _376 = _354 * (-2.0);
    float _378 = exp2(_350);
    bool _380 = _316 > 0.0;
    bool _382 = _316 >= 0.0;
    bool _384 = isnan(_316);
    bool _386 = _382 || _384;
    bool _388 = isnan(0.0);
    bool _390 = _386 || _388;
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _394 = 1.0 + _392;
    bool _396 = !_228;
    int _398 = _396 ? 0 : 1;
    float _400 = float(_374);
    int _402 = abs(_398);
    float _404 = 1.0 / _394;
    bool _406 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _408 = isnan(1.0);
    bool _410 = _406 || _408;
    bool _412 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _414 = _410 || _412;
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _418 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _416;
    float _420 = float(_402);
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _424 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _422;
    bool _426 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _428 = isnan(0.0);
    bool _430 = _426 || _428;
    bool _432 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _434 = _430 || _432;
    float _436 = -_378;
    float _438 = _436 + 1.0;
    float _440 = fma(_418, _268, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _442 = _420 * _400;
    int _444 = _390 ? 0 : 1;
    float _446 = fma(_424, _268, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _448 = _434 ? _438 : 0.0;
    float _450 = _442 * (-2.0);
    float _452 = fma(_376, _362, _362);
    float _454 = fma(_324, _376, _324);
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _458 = _456 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    if (_414)
    {
        float _460 = _448 * _404;
        _160 = _460;
    }
    float _462 = _160;
    float _464 = fma(_260, (*spvDescriptorSet0.vp_c9)._m0[196].x, _452);
    float _466 = fma(_450, _364, _364);
    int _468 = ~_444;
    int _470 = _468 + 1;
    int _472 = _470 + 1;
    float _474 = fma(_278, _450, _278);
    float _476 = fma(_454, _462, _464);
    bool _478 = _210 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _480 = isnan(_210);
    bool _482 = _478 || _480;
    bool _484 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _486 = _482 || _484;
    float _488 = float(_486);
    int _490 = _472;
    if (!_380)
    {
        int _492 = ~_444;
        int _494 = _492 + 1;
        _490 = _494;
    }
    int _496 = _490;
    float _498 = fma(_264, (*spvDescriptorSet0.vp_c9)._m0[196].y, _466);
    bool _500 = !_232;
    int _502 = _500 ? 0 : 1;
    float _504 = -_488;
    float _506 = _504 + 1.0;
    bool _508 = _210 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _510 = isnan(_210);
    bool _512 = _508 || _510;
    bool _514 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _516 = _512 || _514;
    float _518 = float(_516);
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _522 = _520 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    int _524 = abs(_502);
    float _526 = _476 * 0.15915493667125701904296875;
    bool _528 = _210 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _530 = isnan(_210);
    bool _532 = _528 || _530;
    bool _534 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _536 = _532 || _534;
    float _538 = float(_536);
    float _540 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _542 = _540 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _544 = _518 * _506;
    float _546 = -_518;
    float _548 = _546 + 1.0;
    float _550 = fma(_542, _306, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _552 = float(_496);
    float _554 = fma(_474, _462, _498);
    float _556 = float(_524);
    float _558 = fma(_458, _306, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _560 = fma(_522, _306, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _562 = _538 * _548;
    float _564 = -_538;
    float _566 = _564 + 1.0;
    float _568 = _556 * _552;
    float _570 = _526 * 6.283185482025146484375;
    float _572 = cos(_570);
    float _574 = in.m_71.x;
    float _576 = in.m_71.y;
    float _578 = in.m_71.z;
    float _580 = _336 * _562;
    float _582 = _568 * (-2.0);
    float _584 = _440 * _562;
    float _586 = _446 * _562;
    float _588 = _554 * 0.15915493667125701904296875;
    float _590 = fma(_582, _366, _366);
    float _592 = in.m_73.x;
    float _594 = in.m_73.y;
    float _596 = in.m_73.z;
    float _598 = fma(_288, _582, _288);
    float _600 = fma(_566, (*spvDescriptorSet0.vp_c9)._m0[143].x, _584);
    float _602 = fma(_256, (*spvDescriptorSet0.vp_c9)._m0[196].z, _590);
    float _604 = fma(_566, (*spvDescriptorSet0.vp_c9)._m0[143].y, _586);
    float _606 = fma(_566, (*spvDescriptorSet0.vp_c9)._m0[143].z, _580);
    float _608 = fma(_550, _544, _600);
    float _610 = fma(_598, _462, _602);
    float _612 = fma(_560, _544, _604);
    float _614 = fma(_558, _544, _606);
    float _616 = _588 * 6.283185482025146484375;
    float _618 = sin(_616);
    float _620 = _610 * 0.15915493667125701904296875;
    float _622 = fma(_488, (*spvDescriptorSet0.vp_c9)._m0[145].y, _612);
    float _624 = fma(_488, (*spvDescriptorSet0.vp_c9)._m0[145].z, _614);
    float _626 = fma(_488, (*spvDescriptorSet0.vp_c9)._m0[145].x, _608);
    float _628 = _624 * _578;
    float _630 = _588 * 6.283185482025146484375;
    float _632 = cos(_630);
    float _634 = in.m_60.x;
    float _636 = in.m_60.y;
    float _638 = in.m_60.z;
    float _640 = _622 * _576;
    float _642 = _626 * _574;
    float _644 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _594);
    float _646 = _640 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _648 = _526 * 6.283185482025146484375;
    float _650 = sin(_648);
    float _652 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _592);
    float _654 = _642 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _656 = _644 * _646;
    float _658 = _572 * _618;
    float _660 = _628 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _662 = _652 * _654;
    float _664 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _596);
    float _666 = _620 * 6.283185482025146484375;
    float _668 = cos(_666);
    float _670 = _572 * _632;
    float _672 = _664 * _660;
    float _674 = _620 * 6.283185482025146484375;
    float _676 = sin(_674);
    float _678 = _650 * _618;
    float _680 = _650 * _632;
    float _682 = _636 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _684 = _636 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _686 = _636 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _688 = fma(_634, (*spvDescriptorSet0.vp_c10)._m0[4].x, _682);
    float _690 = _572 * _668;
    float _692 = _632 * _668;
    float _694 = _650 * _668;
    float _696 = _618 * _668;
    float _698 = _690 * _656;
    float _700 = fma(_634, (*spvDescriptorSet0.vp_c10)._m0[6].x, _684);
    float _702 = _694 * _656;
    float _704 = fma(_638, (*spvDescriptorSet0.vp_c10)._m0[4].z, _688);
    float _706 = fma(_676, _670, _678);
    float _708 = fma(_676, _678, _670);
    float _710 = -_658;
    float _712 = fma(_676, _680, _710);
    float _714 = -_656;
    float _716 = _676 * _714;
    float _718 = -_680;
    float _720 = fma(_676, _658, _718);
    float _722 = fma(_706, _662, _698);
    float _724 = fma(_712, _662, _702);
    float _726 = fma(_692, _662, _716);
    float _728 = fma(_638, (*spvDescriptorSet0.vp_c10)._m0[6].z, _700);
    float _730 = fma(_720, _672, _722);
    float _732 = fma(_708, _672, _724);
    float _734 = fma(_696, _672, _726);
    float _736 = _704 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _738 = _730 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _740 = _730 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _742 = _728 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _744 = fma(_634, (*spvDescriptorSet0.vp_c10)._m0[5].x, _686);
    float _746 = fma(_734, (*spvDescriptorSet0.vp_c10)._m0[8].x, _738);
    float _748 = fma(_734, (*spvDescriptorSet0.vp_c10)._m0[10].x, _740);
    float _750 = fma(_638, (*spvDescriptorSet0.vp_c10)._m0[5].z, _744);
    float _752 = fma(_732, (*spvDescriptorSet0.vp_c10)._m0[8].z, _746);
    float _754 = fma(_732, (*spvDescriptorSet0.vp_c10)._m0[10].z, _748);
    float _756 = _750 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _758 = _736 + _752;
    float _760 = _742 + _754;
    float _762 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _764 = _758 + _762;
    float _766 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _768 = _760 + _766;
    float _770 = _764 * _764;
    float _772 = _768 * _768;
    float _774 = _770 + _772;
    float _776 = sqrt(_774);
    bool _778 = _776 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _780 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _782 = _776 + _780;
    float _784 = _730 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _786 = fma(_734, (*spvDescriptorSet0.vp_c10)._m0[9].x, _784);
    float _788 = fma(_732, (*spvDescriptorSet0.vp_c10)._m0[9].z, _786);
    float _790 = 0.0;
    float _792 = _786;
    float _794 = _734;
    float _796 = _758;
    float _798 = _760;
    float _800 = _770;
    float _802 = _772;
    float _804 = _742;
    if (_778)
    {
        float _806 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _790 = _806;
    }
    float _808 = _790;
    float _810 = _756 + _788;
    float _812 = _810;
    if (_778)
    {
        float _814 = _810 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _792 = _814;
    }
    float _816 = _792;
    float _818 = _816;
    if (_778)
    {
        float _820 = rsqrt(_774);
        _794 = _820;
    }
    float _822 = _794;
    float _824 = _808;
    if (_778)
    {
        float _826 = _782 * _808;
        _824 = _826;
    }
    float _828 = _824;
    float _830 = _828;
    if (_778)
    {
        float _832 = _828 * 0.15915493667125701904296875;
        _830 = _832;
    }
    float _834 = _830;
    float _836 = _634;
    if (_778)
    {
        float _838 = _834 * 6.283185482025146484375;
        float _840 = sin(_838);
        _836 = _840;
    }
    float _842 = _836;
    if (_778)
    {
        float _844 = fma(_842, _816, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _818 = _844;
    }
    float _846 = _818;
    float _848 = _846;
    if (_778)
    {
        float _850 = _822 * _846;
        _848 = _850;
    }
    float _852 = _848;
    if (_778)
    {
        float _854 = fma(_764, _852, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _796 = _854;
    }
    float _856 = _796;
    if (_778)
    {
        float _858 = fma(_768, _852, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _798 = _858;
    }
    float _860 = _798;
    float _862 = fma(_856, 6.2500002968590706586837768554688e-05, 0.5);
    float _864 = fma(_860, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _3812 = float2(_862, _864);
    float3 _868 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_3812, float2(0.0), isnan(_3812)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_3812, float2(0.0), isnan(_3812)), level(0.0)).xyz;
    float _870 = _868.x;
    float _872 = _868.y;
    float _874 = _868.z;
    float _876 = in.m_75.y;
    bool _878 = _594 != 0.0;
    bool _880 = isnan(_594);
    bool _882 = _878 || _880;
    bool _884 = isnan(0.0);
    bool _886 = _882 || _884;
    float _888 = _834;
    if (_778)
    {
        float _890 = _834 * 6.283185482025146484375;
        float _892 = cos(_890);
        _888 = _892;
    }
    float _894 = _888;
    int _896 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _898 = _896 != 0;
    float _900 = in.m_67.w;
    bool _902 = _592 == 0.0;
    bool _904 = !_886;
    bool _906 = _902 && _904;
    int _908 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _910 = _908 != 0;
    float _912 = in.m_77.x;
    float _914 = in.m_77.y;
    float _916 = in.m_77.z;
    bool _918 = _596 == 0.0;
    bool _920 = _918 && _906;
    float _922 = in.m_75.x;
    float _924 = _782;
    float _926 = 1.0;
    float _928 = 1.0;
    if (_898)
    {
        float _930 = in.m_67.z;
        _924 = _930;
    }
    float _932 = _924;
    out.m_79.x = 1.0;
    out.m_79.y = 1.0;
    out.m_79.z = 1.0;
    float _934 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _936 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _938 = -_876;
    float _940 = _938 + 1.0;
    float _942 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _944 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _946 = _934 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _948 = _900 > 0.5;
    float _950 = _936 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _952 = _942 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _954 = _876;
    if (_910)
    {
        float _956 = _948 ? _940 : _876;
        _954 = _956;
    }
    float _958 = _954;
    float _960 = 0.0;
    float _962 = _912;
    float _964 = _914;
    if (_920)
    {
        _960 = _912;
    }
    float _966 = _960;
    out.m_81.x = _946;
    out.m_81.y = _950;
    out.m_81.z = _952;
    out.m_81.w = _944;
    float _968 = _966;
    float _970 = _922;
    if (!_898)
    {
        _926 = _922;
    }
    float _972 = _926;
    float _974 = 0.0;
    float _976 = _972;
    if (_920)
    {
        _974 = _966;
    }
    float _978 = _974;
    bool _980 = _932 > 0.5;
    bool _982 = _980 && _898;
    float _984 = in.m_83.x;
    float _986 = in.m_83.y;
    float _988 = in.m_83.z;
    float _990 = in.m_83.w;
    float _992 = _978;
    if (!_920)
    {
        _968 = _912;
    }
    float _994 = _968;
    if (_920)
    {
        _962 = _914;
    }
    float _996 = _962;
    float _998 = _996;
    if (_920)
    {
        _928 = _916;
    }
    float _1000 = _928;
    float _1002 = _1000;
    if (!_920)
    {
        float _1004 = fma(_596, (*spvDescriptorSet0.vp_c9)._m0[17].y, _916);
        _1002 = _1004;
    }
    float _1006 = _1002;
    float _1008 = 0.0;
    if (_920)
    {
        _1008 = _996;
    }
    float _1010 = _1008;
    float _1012 = _1010;
    if (!_920)
    {
        float _1014 = fma(_592, (*spvDescriptorSet0.vp_c9)._m0[17].y, _994);
        _992 = _1014;
    }
    float _1016 = _992;
    if (!_920)
    {
        _998 = _914;
    }
    float _1018 = _998;
    if (_898)
    {
        _964 = _922;
    }
    float _1020 = _964;
    float _1022 = _1020;
    if (!_920)
    {
        float _1024 = fma(_594, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1018);
        _1012 = _1024;
    }
    float _1026 = _1012;
    if (_982)
    {
        float _1028 = -_1020;
        float _1030 = _1028 + 1.0;
        _1022 = _1030;
    }
    float _1032 = _1022;
    float _1034 = -_1026;
    float _1036 = _676 * _1034;
    float _1038 = _694 * _1026;
    if (_898)
    {
        _976 = _1032;
    }
    float _1040 = _976;
    float _1042 = fma(_692, _1016, _1036);
    float _1044 = fma(_712, _1016, _1038);
    float _1046 = _988 * _994;
    float _1048 = _986 * _916;
    float _1050 = _984 * _1018;
    float _1052 = fma(_696, _1006, _1042);
    float _1054 = -_1046;
    float _1056 = fma(_984, _916, _1054);
    float _1058 = -_1048;
    float _1060 = fma(_988, _1018, _1058);
    float _1062 = -_1050;
    float _1064 = fma(_986, _994, _1062);
    float _1066 = -_986;
    float _1068 = _676 * _1066;
    float _1070 = _1056 * _990;
    float _1072 = _690 * _1026;
    float _1074 = _1060 * _990;
    float _1076 = _1064 * _990;
    float _1078 = -_1070;
    float _1080 = _676 * _1078;
    float _1082 = _690 * _986;
    float _1084 = _690 * _1070;
    float _1086 = _694 * _986;
    float _1088 = _694 * _1070;
    float _1090 = fma(_706, _1016, _1072);
    float _1092 = fma(_692, _1074, _1080);
    float _1094 = fma(_706, _1074, _1084);
    float _1096 = fma(_692, _984, _1068);
    float _1098 = fma(_706, _984, _1082);
    float _1100 = fma(_712, _984, _1086);
    float _1102 = fma(_712, _1074, _1088);
    float _1104 = fma(_720, _1006, _1090);
    float _1106 = fma(_696, _988, _1096);
    float _1108 = fma(_720, _988, _1098);
    float _1110 = fma(_708, _988, _1100);
    float _1112 = fma(_696, _1076, _1092);
    float _1114 = fma(_720, _1076, _1094);
    float _1116 = fma(_708, _1076, _1102);
    float _1118 = _1104 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1120 = _1076;
    float _1122 = _1118;
    if (_778)
    {
        float _1124 = _894 + (-1.0);
        _1120 = _1124;
    }
    float _1126 = _1120;
    float _1128 = _1104 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1130 = _1104 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1132 = fma(_1052, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1118);
    float _1134 = _1126;
    float _1136 = _1128;
    if (_778)
    {
        float _1138 = _1126 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1122 = _1138;
    }
    float _1140 = _1122;
    float _1142 = fma(_708, _1006, _1044);
    float _1144 = fma(_1052, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1128);
    float _1146 = fma(_1052, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1130);
    float _1148 = _1108 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    if (_778)
    {
        float _1150 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1152 = _856 + _1150;
        _1134 = _1152;
    }
    float _1154 = _1134;
    if (_778)
    {
        float _1156 = fma(_810, _894, _1140);
        _812 = _1156;
    }
    float _1158 = _812;
    if (_778)
    {
        float _1160 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1162 = _860 + _1160;
        _1136 = _1162;
    }
    float _1164 = _1136;
    float _1166 = fma(_1106, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1148);
    if (_778)
    {
        float _1168 = _1154 * _1154;
        _800 = _1168;
    }
    float _1170 = _800;
    float _1172 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1174 = _1158 + _1172;
    float _1176 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    if (_778)
    {
        float _1178 = _1164 * _1164;
        _802 = _1178;
    }
    float _1180 = _802;
    float _1182 = _1108 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1184 = fma(_1174, _1174, _1170);
    float _1186 = _1108 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1188 = _1114 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1190 = fma(_1106, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1182);
    float _1192 = _1184 + _1180;
    float _1194 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1196 = fma(_1106, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1186);
    float _1198 = _1114 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1200 = _1114 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1202 = _958 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1204 = fma(_1112, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1188);
    float _1206 = fma(_1112, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1198);
    float _1208 = _1040 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1210 = sqrt(_1192);
    float _1212 = fma(_1112, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1200);
    float _1214 = _1202 * _1176;
    float _1216 = fma(_1110, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1166);
    float _1218 = fma(_1110, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1190);
    float _1220 = fma(_1116, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1204);
    float _1222 = fma(_1116, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1206);
    float _1224 = fma(_1142, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1132);
    float _1226 = _1208 * _1194;
    float _1228 = fma(_1110, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1196);
    float _1230 = fma(_1116, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1212);
    float _1232 = fma(_1142, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1144);
    float _1234 = fma(_1142, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1146);
    out.m_85.z = _1226;
    out.m_85.w = _1214;
    bool _1236 = _1210 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1238 = isnan(_1210);
    bool _1240 = _1236 || _1238;
    bool _1242 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1244 = _1240 || _1242;
    out.m_87.x = _1216;
    out.m_87.y = _1218;
    out.m_87.z = _1228;
    out.m_89.x = _1220;
    out.m_89.y = _1222;
    out.m_89.z = _1230;
    out.m_91.x = _1224;
    out.m_91.y = _1232;
    out.m_91.z = _1234;
    float _1246 = _1208;
    if (!_1244)
    {
        _1246 = 1.0;
    }
    float _1248 = _1246;
    out.m_93.x = _870;
    out.m_93.y = _872;
    out.m_93.z = _874;
    bool _1250 = !_1244;
    float _1252 = _1248;
    if (!_1250)
    {
        bool _1254 = _1210 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1256 = isnan(_1210);
        bool _1258 = _1254 || _1256;
        bool _1260 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1262 = _1258 || _1260;
        if (!_1262)
        {
            float _1264 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1266 = _1210 + _1264;
            float _1268 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1270 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1268;
            float _1272 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1274 = _1272 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1276 = 1.0 / _1270;
            float _1278 = _1266 * _1276;
            float _1280 = fma(_1278, _1274, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1252 = _1280;
            _1282 = true;
        }
        else
        {
            bool _1284 = _1210 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1286 = isnan(_1210);
            bool _1288 = _1284 || _1286;
            bool _1290 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1292 = _1288 || _1290;
            if (!_1292)
            {
                float _1294 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1296 = _1210 + _1294;
                float _1298 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1300 = _1298 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1302 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1304 = _1302 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1306 = 1.0 / _1300;
                float _1308 = _1296 * _1306;
                float _1310 = fma(_1308, _1304, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1252 = _1310;
                _1282 = true;
            }
            else
            {
                _1252 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1282 = false;
    float _1312 = _1252;
    float _1314 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1316 = _1158 + _1314;
    float _1318 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1320 = _856 + _1318;
    float _1322 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1324 = _860 + _1322;
    float _1326 = _756 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1328 = fma(_1316, _1312, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1330 = fma(_1320, _1312, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1332 = fma(_1324, _1312, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1334 = fma(_736, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1326);
    float _1336 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1338 = _1328 + _1336;
    float _1340 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1342 = _1330 + _1340;
    float _1344 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1346 = _1332 + _1344;
    float _1348 = _1338 * _1338;
    float _1350 = fma(_1342, _1342, _1348);
    float _1352 = fma(_1346, _1346, _1350);
    float _1354 = fma(_742, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1334);
    float _1356 = _756 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1358 = fma(_736, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1360 = rsqrt(_1352);
    float _1362 = _1354 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1364 = fma(_736, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1356);
    float _1366 = fma(_742, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1368 = fma(_742, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1364);
    float _1370 = 1.0 / _1362;
    float _1372 = _1368 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1374 = _1372 + _1362;
    float _1376 = _1360 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1378 = floor(_1358);
    float _1380 = _1342 * _1376;
    float _1382 = _1346 * _1376;
    float _1384 = _1380 * _1380;
    float _1386 = _1382 * _1382;
    float _1388 = _1374 * _1370;
    float _1390 = _1388 * 0.5;
    float _1392 = sqrt(_1352);
    float _1394 = _1384 + _1386;
    float _1396 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1398 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1396);
    float _1400 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _1402 = -_1378;
    float _1404 = _1358 + _1402;
    float _1406 = sqrt(_1394);
    float _1408 = _756 + _1400;
    float _1410 = _1408 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1412 = _1408 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1414 = 1.0 / _1398;
    float _1416 = fma(_736, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1410);
    float _1418 = fma(_736, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1412);
    float _1420 = fma(_742, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1416);
    float _1422 = fma(_742, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1418);
    bool _1424 = _1406 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1426 = _1420 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1428 = _1422 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1430 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1432 = _1406 + _1430;
    float _1434 = floor(_1366);
    float _1436 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1438 = _1414 * _1436;
    float _1440 = trunc(_1426);
    int _1442 = int(_1440);
    bool _1444 = _1438 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1446 = _1438 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1448 = _756;
    int _1450 = 2;
    float _1452 = _1432;
    float _1454 = _1394;
    float _1456 = _1376;
    float _1458 = _1380;
    float _1460 = _1384;
    if (_1424)
    {
        float _1462 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1448 = _1462;
    }
    float _1464 = _1448;
    float _1466 = -_1434;
    float _1468 = _1366 + _1466;
    if (!_1444)
    {
        _1450 = 1;
    }
    int _1470 = _1450;
    float _1472 = trunc(_1428);
    int _1474 = int(_1472);
    int _1476 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1478 = _1442 + _1476;
    int _1480 = _1478 + 1;
    int _1482 = _1470;
    if (_1424)
    {
        float _1484 = _1432 * _1464;
        _1452 = _1484;
    }
    float _1486 = _1452;
    if (_1424)
    {
        float _1488 = rsqrt(_1394);
        _1454 = _1488;
    }
    float _1490 = _1454;
    float _1492 = 0.0;
    float _1494 = _1490;
    if (_1424)
    {
        float _1496 = _1486 * 0.15915493667125701904296875;
        _1492 = _1496;
    }
    float _1498 = _1492;
    bool _1500 = !_1444;
    int _1502 = _1500 ? 0 : 1;
    float _1504 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    int _1506 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1508 = _1474 + _1506;
    int _1510 = _1508 + 1;
    float _1512 = _1422;
    if (_1424)
    {
        float _1514 = _1498 * 6.283185482025146484375;
        float _1516 = sin(_1514);
        _1512 = _1516;
    }
    float _1518 = _1512;
    if (!_1446)
    {
        _1482 = _1502;
    }
    int _1520 = _1482;
    float _1522 = precise::max(0.0, _1504);
    int _1524 = _1520 << 6;
    bool _1526 = _1480 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1528 = -_1376;
    float _1530 = -_1522;
    float _1532 = fma(_1338, _1528, _1530);
    int _1534 = _1524 + 96;
    uint _1537 = uint(int(uint(_1534) >> uint(2)));
    uint _1539 = uint(int(uint(int(_1537)) >> uint(2)));
    int _1541 = int(_1537) & 3;
    float _1543 = (*spvDescriptorSet0.vp_c15)._m0[int(_1539)][_1541];
    int _1545 = int(_1537) + 1;
    uint _1547 = uint(int(uint(_1545) >> uint(2)));
    int _1549 = _1545 & 3;
    float _1551 = (*spvDescriptorSet0.vp_c15)._m0[int(_1547)][_1549];
    int _1553 = _1480 | _1510;
    float _1555 = _1498;
    float _1557 = as_type<float>(_1553);
    float _1559 = _1532;
    if (_1424)
    {
        float _1561 = _1498 * 6.283185482025146484375;
        float _1563 = cos(_1561);
        _1555 = _1563;
    }
    float _1565 = _1555;
    if (_1424)
    {
        float _1567 = _1532 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1456 = _1567;
    }
    float _1569 = _1456;
    bool _1571 = _1553 < 0;
    bool _1573 = _1571 || _1526;
    if (_1424)
    {
        float _1575 = fma(_1518, _1569, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1557 = _1575;
    }
    float _1577 = _1557;
    int _1579 = _1524 + 48;
    uint _1581 = uint(int(uint(_1579) >> uint(2)));
    uint _1583 = uint(int(uint(int(_1581)) >> uint(2)));
    int _1585 = int(_1581) & 3;
    float _1587 = (*spvDescriptorSet0.vp_c15)._m0[int(_1583)][_1585];
    int _1589 = int(_1581) + 1;
    uint _1591 = uint(int(uint(_1589) >> uint(2)));
    int _1593 = _1589 & 3;
    float _1595 = (*spvDescriptorSet0.vp_c15)._m0[int(_1591)][_1593];
    float _1597 = _1328 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    bool _1599 = _1510 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1601 = _1599 || _1573;
    float _1603 = 0.0;
    if (_1424)
    {
        float _1605 = _1490 * _1577;
        _1603 = _1605;
    }
    float _1607 = _1603;
    float _1609 = fma(_1330, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1597);
    if (_1424)
    {
        float _1611 = _1380 * _1607;
        _1458 = _1611;
    }
    float _1613 = _1458;
    int _1615 = _1524 + 104;
    uint _1617 = uint(int(uint(_1615) >> uint(2)));
    uint _1619 = uint(int(uint(int(_1617)) >> uint(2)));
    int _1621 = int(_1617) & 3;
    float _1623 = (*spvDescriptorSet0.vp_c15)._m0[int(_1619)][_1621];
    int _1625 = int(_1617) + 1;
    uint _1627 = uint(int(uint(_1625) >> uint(2)));
    int _1629 = _1625 & 3;
    float _1631 = (*spvDescriptorSet0.vp_c15)._m0[int(_1627)][_1629];
    float _1633 = fma(_1332, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1609);
    float _1635 = _1565;
    if (_1424)
    {
        float _1637 = _1565 + (-1.0);
        _1494 = _1637;
    }
    float _1639 = _1494;
    float _1641 = _1639;
    if (_1424)
    {
        float _1643 = _1613 * _1613;
        _1460 = _1643;
    }
    float _1645 = _1460;
    float _1647 = 0.0;
    if (_1424)
    {
        float _1649 = _1639 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1647 = _1649;
    }
    float _1651 = _1647;
    if (!_1424)
    {
        _1641 = _1382;
    }
    float _1653 = _1641;
    int _1655 = _1524 + 64;
    uint _1657 = uint(int(uint(_1655) >> uint(2)));
    uint _1659 = uint(int(uint(int(_1657)) >> uint(2)));
    int _1661 = int(_1657) & 3;
    float _1663 = (*spvDescriptorSet0.vp_c15)._m0[int(_1659)][_1661];
    int _1665 = int(_1657) + 1;
    uint _1667 = uint(int(uint(_1665) >> uint(2)));
    int _1669 = _1665 & 3;
    float _1671 = (*spvDescriptorSet0.vp_c15)._m0[int(_1667)][_1669];
    float _1673 = _1653;
    if (_1424)
    {
        float _1675 = _1382 * _1607;
        _1673 = _1675;
    }
    float _1677 = _1673;
    if (_1424)
    {
        float _1679 = fma(_1532, _1565, _1651);
        _1559 = _1679;
    }
    float _1681 = _1559;
    float _1683 = _1633 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    if (!_1424)
    {
        _1635 = _1386;
    }
    float _1685 = _1635;
    float _1687 = _1685;
    if (_1424)
    {
        float _1689 = _1677 * _1677;
        _1687 = _1689;
    }
    float _1691 = _1687;
    float _1693 = fma(_1681, _1681, _1645);
    float _1695 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    int _1697 = _1524 + 80;
    uint _1699 = uint(int(uint(_1697) >> uint(2)));
    uint _1701 = uint(int(uint(int(_1699)) >> uint(2)));
    int _1703 = int(_1699) & 3;
    float _1705 = (*spvDescriptorSet0.vp_c15)._m0[int(_1701)][_1703];
    int _1707 = int(_1699) + 1;
    uint _1709 = uint(int(uint(_1707) >> uint(2)));
    int _1711 = _1707 & 3;
    float _1713 = (*spvDescriptorSet0.vp_c15)._m0[int(_1709)][_1711];
    float _1715 = _1683 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1717 = _1693 + _1691;
    int _1719 = as_type<int>(_1715);
    if (!_1601)
    {
        float _1721 = floor(_1428);
        _970 = _1721;
    }
    float _1723 = _970;
    float _1725 = -_1715;
    float _1727 = fma(_1725, _1695, 1.0);
    if (!_1601)
    {
        int _1729 = _1510 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1731 = _1729 + _1480;
        _1719 = _1731;
    }
    int _1733 = _1719;
    int _1735 = _1524 + 56;
    uint _1737 = uint(int(uint(_1735) >> uint(2)));
    uint _1739 = uint(int(uint(int(_1737)) >> uint(2)));
    int _1741 = int(_1737) & 3;
    float _1743 = (*spvDescriptorSet0.vp_c15)._m0[int(_1739)][_1741];
    int _1745 = int(_1737) + 1;
    uint _1747 = uint(int(uint(_1745) >> uint(2)));
    int _1749 = _1745 & 3;
    float _1751 = (*spvDescriptorSet0.vp_c15)._m0[int(_1747)][_1749];
    float _1753 = log2(_1727);
    int _1755 = _1524 + 88;
    uint _1757 = uint(int(uint(_1755) >> uint(2)));
    uint _1759 = uint(int(uint(int(_1757)) >> uint(2)));
    int _1761 = int(_1757) & 3;
    float _1763 = (*spvDescriptorSet0.vp_c15)._m0[int(_1759)][_1761];
    int _1765 = int(_1757) + 1;
    uint _1767 = uint(int(uint(_1765) >> uint(2)));
    int _1769 = _1765 & 3;
    float _1771 = (*spvDescriptorSet0.vp_c15)._m0[int(_1767)][_1769];
    float _1773 = _1408 * _1551;
    float _1775 = fma(_736, _1543, _1773);
    int _1777 = _1524 + 72;
    uint _1779 = uint(int(uint(_1777) >> uint(2)));
    uint _1781 = uint(int(uint(int(_1779)) >> uint(2)));
    int _1783 = int(_1779) & 3;
    float _1785 = (*spvDescriptorSet0.vp_c15)._m0[int(_1781)][_1783];
    int _1787 = int(_1779) + 1;
    uint _1789 = uint(int(uint(_1787) >> uint(2)));
    int _1791 = _1787 & 3;
    float _1793 = (*spvDescriptorSet0.vp_c15)._m0[int(_1789)][_1791];
    float _1795 = _1408 * _1595;
    float _1797 = rsqrt(_1717);
    float _1799 = _1753 * 0.693147182464599609375;
    float _1801 = fma(_736, _1587, _1795);
    int _1803 = as_type<int>(_1795);
    int _1805 = as_type<int>(_1543);
    if (!_1601)
    {
        int _1807 = _1733 << 2;
        _1803 = _1807;
    }
    int _1809 = _1803;
    float _1811 = fma(_742, _1623, _1775);
    int _1813 = _1809;
    if (!_1601)
    {
        int _1815 = 12 & _1809;
        _1813 = _1815;
    }
    int _1817 = _1813;
    float _1819 = _1811 + _1631;
    float2 _5447 = float2(_1404, _1468);
    float _1821 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5447, float2(0.0), isnan(_5447)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5447, float2(0.0), isnan(_5447)), level(0.0)).x;
    float _1823 = _1799 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1825 = _1408 * _1671;
    float _1827 = _1671;
    int _1829 = as_type<int>(_1713);
    if (!_1601)
    {
        float _1831 = -_1723;
        float _1833 = _1428 + _1831;
        _1827 = _1833;
    }
    float _1835 = _1827;
    float _1837 = 1.0 / _1819;
    float _1839 = _1797 * _1613;
    float _1841 = fma(_736, _1663, _1825);
    float _1843 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1845 = fma(_1392, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1843);
    float _1847 = precise::clamp(_1845, 0.0, 1.0);
    float _1849 = _1797 * _1681;
    float _1851 = _1839 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1853 = _1408 * _1713;
    if (!_1601)
    {
        uint _1855 = uint(int(uint(_1733) >> uint(2)));
        _1829 = int(_1855);
    }
    int _1857 = _1829;
    float _1859 = _1797 * _1677;
    float _1861 = fma(_736, _1705, _1853);
    float _1863 = -_1847;
    float _1865 = _1863 + 1.0;
    if (!_1601)
    {
        int _1867 = _1857 << 4;
        int _1869 = _1867 + _1817;
        _1805 = _1869;
    }
    int _1871 = _1805;
    float _1873 = fma(_742, _1743, _1801);
    float _1875 = _1847;
    float _1877 = as_type<float>(_1871);
    if (!_1601)
    {
        int _1879 = _1871 + 400;
        uint _1881 = uint(int(uint(_1879) >> uint(2)));
        uint _1883 = uint(int(uint(int(_1881)) >> uint(2)));
        int _1885 = int(_1881) & 3;
        float _1887 = (*spvDescriptorSet0.vp_c15)._m0[int(_1883)][_1885];
        _1875 = _1887;
    }
    float _1889 = _1875;
    float _1891 = abs(_1865);
    float _1893 = log2(_1891);
    float _1895 = _1873 + _1751;
    float _1897 = _1328 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1899 = fma(_742, _1763, _1861);
    float _1901 = -_1851;
    float _1903 = fma(_1849, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1901);
    float _1905 = _1328 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1907 = fma(_1330, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1897);
    float _1909 = -_1859;
    float _1911 = fma(_1909, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1903);
    float _1913 = fma(_1330, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1905);
    float _1915 = _1895 * _1837;
    float _1917 = fma(_742, _1785, _1841);
    float _1919 = fma(_1911, -0.5, 0.5);
    float _1921 = fma(_1332, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1913);
    float _1923 = fma(_1911, 0.5, 0.5);
    float _1925 = _1917 + _1793;
    float _1927 = _1328 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    bool _1929 = _1915 >= 0.0;
    float _1931 = fma(_1332, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1907);
    float _1933 = _1925 * _1837;
    float _1935 = fma(_1330, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1927);
    bool _1937 = _1915 <= 1.0;
    bool _1939 = _1937 && _1929;
    float _1941 = _1931 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1943 = _1893 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1945 = fma(_1332, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1935);
    bool _1947 = _1933 >= 0.0;
    bool _1949 = _1947 && _1939;
    float _1951 = _1941 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1953 = exp2(_1943);
    float _1955 = _1945 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    bool _1957 = _1933 <= 1.0;
    bool _1959 = _1957 && _1949;
    float _1961 = _1921 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1963 = _1899 + _1771;
    float _1965 = fma(_1955, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1951);
    float _1967 = _1941 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1969 = _1849 + 1.0;
    float _1971 = sqrt(_1919);
    float _1973 = fma(_1683, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1965);
    float _1975 = fma(_1955, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1967);
    float _1977 = _1963 * _1837;
    float _1979 = fma(_1923, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1981 = fma(_1961, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1973);
    if (_1959)
    {
        float _1983 = float(_1520);
        _1877 = _1983;
    }
    float _1985 = _1877;
    float _1987 = -_1849;
    float _1989 = fma(_1953, _1969, _1987);
    float _1991 = fma(_1923, _1979, -0.212114393711090087890625);
    float _1993 = 1.0 / _1981;
    float _1995 = _1941 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1997 = fma(_1989, 0.5, 0.5);
    float _1999 = fma(_1923, _1991, 1.570728778839111328125);
    float _2001 = fma(_1683, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1975);
    float _2003 = fma(_1955, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1995);
    float _2005 = _1971 * 0.636619746685028076171875;
    float _2007 = _1985;
    float _2009 = _2003;
    if (_1959)
    {
        float _2011 = rint(_1985);
        float _2013 = precise::max(_2011, 0.0);
        uint _2015 = uint(_2013);
        uint _2017 = clamp(_2015, 0u, 65535u);
        _2007 = as_type<float>(_2017);
    }
    float _2019 = _2007;
    float _2021 = fma(_1683, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2003);
    float _2023 = fma(_1961, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2001);
    float _2025 = -_1999;
    float _2027 = fma(_2005, _2025, 1.0);
    float _2029 = fma(_1961, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2021);
    float _2031 = _1859;
    if (!_1601)
    {
        float _2033 = floor(_1426);
        _2031 = _2033;
    }
    float _2035 = _2031;
    float _2037 = _2023 * _1993;
    float _2039 = _2029 * _1993;
    float _2041 = fma(_2037, 0.5, 0.5);
    float _2043 = fma(_2039, -0.5, 0.5);
    float _2045 = _2019;
    if (_1959)
    {
        float3 _5836 = float3(_1915, _1933, float(as_type<int>(_2019)));
        float3 _5840 = select(_5836, float3(0.0), isnan(_5836));
        float _2047 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5840.xy, uint(rint(_5840.z)), _1977, level(0.0));
        _2045 = _2047;
    }
    float _2049 = _2045;
    float _2051 = _2039;
    if (!_1601)
    {
        float _2053 = rint(_1889);
        float _2055 = precise::max(_2053, 0.0);
        uint _2057 = uint(_2055);
        uint _2059 = clamp(_2057, 0u, 65535u);
        _2051 = as_type<float>(_2059);
    }
    float _2061 = _2051;
    float3 _5866 = float3(_2041, _2043, _1823);
    float _2063 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5866, float3(0.0), isnan(_5866)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5866, float3(0.0), isnan(_5866)), level(0.0)).x;
    if (!_1601)
    {
        float _2065 = -_2035;
        float _2067 = _1426 + _2065;
        _2009 = _2067;
    }
    float _2069 = _2009;
    float3 _5886 = float3(_2041, _2043, _1823);
    float4 _2072 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5886, float3(0.0), isnan(_5886)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5886, float3(0.0), isnan(_5886)), level(0.0)).xyzw;
    float _2074 = _2072.x;
    float _2076 = _2072.y;
    float _2078 = _2072.z;
    float _2080 = _2072.w;
    float2 _5902 = float2(_2027, _1997);
    float3 _2082 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5902, float2(0.0), isnan(_5902)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5902, float2(0.0), isnan(_5902)), level(0.0)).xyz;
    float _2084 = _2082.x;
    float _2086 = _2082.y;
    float _2088 = _2082.z;
    float _2090 = _2061;
    if (!_1601)
    {
        float3 _5923 = float3(_2069, _1835, float(as_type<int>(_2061)));
        float3 _5925 = select(_5923, float3(0.0), isnan(_5923));
        float _2092 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5925.xy, uint(rint(_5925.z)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5925.xy, uint(rint(_5925.z)), level(0.0)).x;
        _2090 = _2092;
    }
    float _2094 = _2090;
    float _2096 = abs(_1438);
    float _2098 = log2(_2096);
    float _2100 = _1941 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2102 = fma(_1955, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2100);
    float _2104 = fma(_1683, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2102);
    float _2106 = _1893 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2108 = fma(_1961, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2104);
    float _2110 = _2098 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2112 = _2108 + _1981;
    float _2114 = exp2(_2106);
    bool _2116 = _1438 <= 8000.0;
    bool _2118 = isnan(_1438);
    bool _2120 = _2116 || _2118;
    bool _2122 = isnan(8000.0);
    bool _2124 = _2120 || _2122;
    float _2126 = float(_2124);
    float _2128 = _2112 * 0.5;
    float _2130 = exp2(_2110);
    out.m_95.z = _2128;
    out.m_95.w = _1981;
    float _2132 = fma(_2130, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2134 = precise::clamp(_2132, 0.0, 1.0);
    float _2136 = fma(_2134, -2.0, 3.0);
    float _2138 = _2134 * _2134;
    float _2140 = _2138 * _2136;
    float _2142 = -_2140;
    float _2144 = _2142 + 1.0;
    out.gl_Position.x = _2023;
    out.gl_Position.y = _2029;
    out.gl_Position.z = _2108;
    out.gl_Position.w = _1981;
    float _2146 = fma(_2144, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2140);
    float _2148 = _2126 * _2146;
    float _2150 = _2146;
    float _2152 = _2108;
    float _2154 = _2023;
    if (!_1959)
    {
        _2150 = 1.0;
    }
    float _2156 = _2150;
    float _2158 = _2148 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2160 = -_2114;
    float _2162 = _2160 + 1.0;
    float _2164 = _2162 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2166 = _2162;
    float _2168 = _2156;
    if (_1601)
    {
        _2166 = 1.0;
    }
    float _2170 = _2166;
    float _2172 = -_1821;
    float _2174 = _2172 + 1.0;
    float _2176 = _2174 * _2158;
    float _2178 = precise::clamp(_2176, 0.0, 1.0);
    float _2180 = _2170;
    if (_1959)
    {
        bool _2182 = _2049 >= _1977;
        bool _2184 = isnan(_2049);
        bool _2186 = _2182 || _2184;
        bool _2188 = isnan(_1977);
        bool _2190 = _2186 || _2188;
        float _2192 = float(_2190);
        _2168 = _2192;
    }
    float _2194 = _2168;
    if (!_1601)
    {
        int _2196 = _1733 << 4;
        int _2198 = _2196 + 2048;
        uint _2200 = uint(int(uint(_2198) >> uint(2)));
        uint _2202 = uint(int(uint(int(_2200)) >> uint(2)));
        int _2204 = int(_2200) & 3;
        float _2206 = (*spvDescriptorSet0.vp_c15)._m0[int(_2202)][_2204];
        int _2208 = int(_2200) + 1;
        uint _2210 = uint(int(uint(_2208) >> uint(2)));
        int _2212 = _2208 & 3;
        float _2214 = (*spvDescriptorSet0.vp_c15)._m0[int(_2210)][_2212];
        int _2216 = _2198 + 8;
        uint _2218 = uint(int(uint(_2216) >> uint(2)));
        uint _2220 = uint(int(uint(int(_2218)) >> uint(2)));
        int _2222 = int(_2218) & 3;
        float _2224 = (*spvDescriptorSet0.vp_c15)._m0[int(_2220)][_2222];
        int _2226 = int(_2218) + 1;
        uint _2228 = uint(int(uint(_2226) >> uint(2)));
        int _2230 = _2226 & 3;
        float _2232 = (*spvDescriptorSet0.vp_c15)._m0[int(_2228)][_2230];
        float _2234 = _1408 * _2214;
        float _2236 = fma(_736, _2206, _2234);
        float _2238 = fma(_742, _2224, _2236);
        float _2240 = _2238 + _2232;
        float _2242 = precise::clamp(_2240, 0.0, 1.0);
        float _2244 = -_2242;
        float _2246 = _2244 + _2094;
        float _2248 = fma(_2246, 500.0, 1.5);
        float _2250 = exp2(_2248);
        float _2252 = 0.0 + _2250;
        float _2254 = precise::clamp(_2252, 0.0, 1.0);
        _2180 = _2254;
        _2152 = _2206;
    }
    float _2256 = _2180;
    float _2258 = _2152;
    float _2260 = _2194 * _2256;
    float _2262 = -_2178;
    float _2264 = fma(_2262, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2266 = _2164 * _2063;
    out.m_97.x = _1330;
    out.m_97.y = _1328;
    out.m_97.z = _1332;
    bool _2268 = _1392 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2270 = isnan(_1392);
    bool _2272 = _2268 || _2270;
    bool _2274 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2276 = _2272 || _2274;
    float _2278 = -_2260;
    float _2280 = fma(_2278, _2264, 1.0);
    float _2282 = precise::clamp(_2280, 0.0, 1.0);
    float _2284 = _2080 * _2266;
    float _2286 = -_2164;
    float _2288 = _2286 + 1.0;
    float _2290 = _2088 * _2266;
    float _2292 = _2282 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2294 = fma(_2084, _2284, _2074);
    float _2296 = fma(_2086, _2284, _2076);
    float _2298 = _2080 * _2288;
    float _2300 = fma(_2080, _2290, _2078);
    out.m_99.x = _2292;
    float _2302 = _2258;
    float _2304 = _2284;
    float _2306 = _2288;
    float _2308 = _2282;
    if (!_2276)
    {
        _2302 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2310 = _2302;
    out.m_101.x = _2294;
    out.m_101.y = _2296;
    out.m_101.z = _2300;
    out.m_101.w = _2298;
    float _2312 = _2310;
    float _2314 = _2310;
    if (!_2276)
    {
        _804 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2316 = _804;
    float _2318 = _2316;
    float _2320 = _2316;
    if (!_2276)
    {
        _2154 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2322 = _2154;
    float _2324 = _2322;
    float _2326 = _2322;
    if (!_2276)
    {
        _2304 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2328 = _2304;
    float _2330 = _2328;
    float _2332 = _2328;
    if (!_2276)
    {
        _2306 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2334 = _2306;
    float _2336 = _2334;
    float _2338 = _2334;
    if (!_2276)
    {
        _2308 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2340 = _2308;
    bool _2342 = !_2276;
    float _2344 = _2340;
    float _2346 = _2340;
    if (!_2342)
    {
        bool _2348 = _1392 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2350 = isnan(_1392);
        bool _2352 = _2348 || _2350;
        bool _2354 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2356 = _2352 || _2354;
        if (!_2356)
        {
            float _2358 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2360 = _1392 + _2358;
            float _2362 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2364 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2362;
            float _2366 = 1.0 / _2364;
            float _2368 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2370 = _2368 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2372 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2374 = _2372 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2376 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2378 = _2376 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2380 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2382 = _2380 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2384 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2386 = _2384 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2388 = _2360 * _2366;
            float _2390 = precise::clamp(_2388, 0.0, 1.0);
            float _2392 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2394 = _2392 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2396 = fma(_2390, _2370, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2398 = fma(_2390, _2394, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2400 = fma(_2390, _2374, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2402 = fma(_2390, _2378, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2404 = fma(_2390, _2382, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2406 = fma(_2390, _2386, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2320 = _2398;
            _2338 = _2404;
            _2314 = _2396;
            _2332 = _2402;
            _2326 = _2400;
            _2346 = _2406;
            _2408 = true;
        }
        else
        {
            bool _2410 = _1392 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2412 = isnan(_1392);
            bool _2414 = _2410 || _2412;
            bool _2416 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2418 = _2414 || _2416;
            if (!_2418)
            {
                _2312 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2420 = _2312;
            _2314 = _2420;
            if (!_2418)
            {
                _2318 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2422 = _2318;
            _2320 = _2422;
            if (!_2418)
            {
                _2324 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2424 = _2324;
            _2326 = _2424;
            if (!_2418)
            {
                _2330 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2426 = _2330;
            _2332 = _2426;
            if (!_2418)
            {
                _2336 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2428 = _2336;
            _2338 = _2428;
            if (!_2418)
            {
                _2344 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2430 = _2344;
            bool _2432 = !_2418;
            _2346 = _2430;
            if (!_2432)
            {
                bool _2434 = _1392 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2436 = isnan(_1392);
                bool _2438 = _2434 || _2436;
                bool _2440 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2442 = _2438 || _2440;
                if (!_2442)
                {
                    float _2444 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2446 = _1392 + _2444;
                    float _2448 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2450 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2448;
                    float _2452 = 1.0 / _2450;
                    float _2454 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2456 = _2454 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2458 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2460 = _2458 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2462 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2464 = _2462 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2466 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2468 = _2466 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2470 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2472 = _2470 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2474 = _2446 * _2452;
                    float _2476 = precise::clamp(_2474, 0.0, 1.0);
                    float _2478 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2480 = _2478 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2482 = fma(_2476, _2456, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2484 = fma(_2476, _2480, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2486 = fma(_2476, _2460, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2488 = fma(_2476, _2464, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2490 = fma(_2476, _2468, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2492 = fma(_2476, _2472, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2320 = _2484;
                    _2338 = _2490;
                    _2314 = _2482;
                    _2332 = _2488;
                    _2326 = _2486;
                    _2346 = _2492;
                    _2408 = true;
                }
                else
                {
                    _2320 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2338 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2314 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2332 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2326 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2346 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2408 = false;
    float _2494 = _2320;
    float _2496 = _2338;
    float _2498 = _2314;
    float _2500 = _2332;
    float _2502 = _2326;
    float _2504 = _2346;
    float _2506 = fma(_1232, -0.5, 0.5);
    float _2508 = precise::clamp(_2506, 0.0, 1.0);
    float _2510 = -_2494;
    float _2512 = _2510 + _2496;
    float _2514 = -_2498;
    float _2516 = _2514 + _2500;
    float _2518 = -_2502;
    float _2520 = _2518 + _2504;
    bool _2522 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2524 = fma(_2508, _2512, _2494);
    float _2526 = fma(_2508, _2516, _2498);
    float _2528 = fma(_2508, _2520, _2502);
    float _2530 = _2524 * 0.586610972881317138671875;
    out.m_63.x = 1.0;
    float _2532 = fma(_2526, 0.298911988735198974609375, _2530);
    float _2534 = fma(_2528, 0.114477999508380889892578125, _2532);
    out.m_103.x = 0.0;
    float _2536 = -_2534;
    float _2538 = _2526 + _2536;
    float _2540 = -_2534;
    float _2542 = _2524 + _2540;
    float _2544 = -_2534;
    float _2546 = _2528 + _2544;
    float _2548 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2550 = fma(_2538, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2534);
    float _2552 = fma(_2542, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2534);
    float _2554 = fma(_2546, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2534);
    out.m_99.w = _2548;
    out.m_105.x = _2550;
    out.m_105.y = _2552;
    out.m_105.z = _2554;
    if (!_2522)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2556 = -_1328;
    float _2558 = _2556 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2560 = -_1330;
    float _2562 = _2560 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2564 = -_1332;
    float _2566 = _2564 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2568 = _2558 * _2558;
    float _2570 = fma(_2562, _2562, _2568);
    float _2572 = fma(_2566, _2566, _2570);
    float _2574 = sqrt(_2572);
    float _2576 = rsqrt(_2572);
    float _2578 = -_2574;
    float _2580 = _2578 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2582 = _2580 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2584 = precise::clamp(_2582, 0.0, 1.0);
    float _2586 = _2562 * _2576;
    float _2588 = _2558 * _2576;
    float _2590 = abs(_2584);
    float _2592 = log2(_2590);
    float _2594 = _2566 * _2576;
    float _2596 = _2586 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2598 = _1232 * _2588;
    float _2600 = -_2588;
    float _2602 = -_2596;
    float _2604 = fma(_2600, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2602);
    float _2606 = fma(_1224, _2586, _2598);
    float _2608 = -_2594;
    float _2610 = fma(_2608, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2604);
    float _2612 = fma(_1234, _2594, _2606);
    float _2614 = precise::clamp(_2612, 0.0, 1.0);
    float _2616 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2618 = _2610 + _2616;
    float _2620 = _2592 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2622 = _2618 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2624 = precise::clamp(_2622, 0.0, 1.0);
    float _2626 = exp2(_2620);
    float _2628 = _2626 * _2624;
    float _2630 = _2614 * _2628;
    float _2632 = _2630 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2634 = _2630 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2636 = _2630 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_103.x = _2632;
    out.m_103.y = _2634;
    out.m_103.z = _2636;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

