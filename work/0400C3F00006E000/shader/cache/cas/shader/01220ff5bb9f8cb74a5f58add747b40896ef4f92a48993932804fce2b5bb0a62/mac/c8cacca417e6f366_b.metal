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
    bool _2462 = false;
    bool _1336 = false;
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
        float _2746 = as_type<float>(_138);
        out.gl_Position.z = _2746;
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
        float _2816 = as_type<float>(_178);
        out.gl_Position.z = _2816;
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
    float _218 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _220 = _210 + _218;
    float _222 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _224 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _222;
    float _226 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _228 = _226 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    int _230 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _232 = _230 != 0;
    int _234 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _236 = _234 != 0;
    int _238 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _240 = _238 != 0;
    float _242 = 1.0 / _224;
    float _244 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _246 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _244;
    float _248 = 1.0 / _228;
    float _250 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _252 = _210 + _250;
    bool _254 = !_236;
    int _256 = _254 ? 0 : 1;
    float _258 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _260 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _258;
    float _262 = _212 + _216;
    float _264 = _214 + _216;
    float _266 = _216 + (-0.5);
    float _268 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _270 = _210 + _268;
    float _272 = _216 * 2.0;
    float _274 = _214 + _212;
    float _276 = _212 + (-0.5);
    float _278 = _252 * _242;
    float _280 = _212 * 2.0;
    float _282 = _270 * _248;
    float _284 = _262 + (-1.0);
    float _286 = floor(_272);
    float _288 = _214 + (-0.5);
    float _290 = _214 * 2.0;
    float _292 = fma(_284, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _294 = _264 + (-1.0);
    float _296 = _274 + (-1.0);
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _300 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _298;
    float _302 = floor(_280);
    float _304 = fma(_294, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _306 = fma(_296, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _308 = abs(_256);
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _312 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _310;
    float _314 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _316 = log2(_314);
    bool _318 = _286 > 0.0;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _322 = _320 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    bool _324 = _286 >= 0.0;
    bool _326 = isnan(_286);
    bool _328 = _324 || _326;
    bool _330 = isnan(0.0);
    bool _332 = _328 || _330;
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _336 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _334;
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _340 = _338 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _342 = fma(_322, _282, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _344 = fma(_312, _278, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _346 = 1.0 / _246;
    bool _348 = _302 > 0.0;
    float _350 = fma(_340, _282, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _352 = _302 >= 0.0;
    bool _354 = isnan(_302);
    bool _356 = _352 || _354;
    bool _358 = isnan(0.0);
    bool _360 = _356 || _358;
    float _362 = fma(_336, _278, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    int _364 = _332 ? 0 : 1;
    int _366 = _360 ? 0 : 1;
    float _368 = floor(_290);
    float _370 = _316 * _156;
    int _372 = ~_364;
    int _374 = _372 + 1;
    int _376 = _374 + 1;
    int _378 = ~_366;
    int _380 = _378 + 1;
    int _382 = _380 + 1;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _386 = 1.0 + _384;
    float _388 = _220 * _346;
    float _390 = exp2(_370);
    int _392 = _376;
    int _394 = _382;
    if (!_318)
    {
        int _396 = ~_364;
        int _398 = _396 + 1;
        _392 = _398;
    }
    int _400 = _392;
    if (!_348)
    {
        int _402 = ~_366;
        int _404 = _402 + 1;
        _394 = _404;
    }
    int _406 = _394;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _410 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _408;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _414 = _412 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _416 = _368 > 0.0;
    bool _418 = _368 >= 0.0;
    bool _420 = isnan(_368);
    bool _422 = _418 || _420;
    bool _424 = isnan(0.0);
    bool _426 = _422 || _424;
    float _428 = fma(_414, _282, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _430 = in.m_69.x;
    float _432 = in.m_69.y;
    float _434 = in.m_69.z;
    bool _436 = !_232;
    int _438 = _436 ? 0 : 1;
    float _440 = 1.0 / _386;
    bool _442 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _444 = isnan(1.0);
    bool _446 = _442 || _444;
    bool _448 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _450 = _446 || _448;
    float _452 = fma(_410, _278, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    int _454 = abs(_438);
    float _456 = -_390;
    float _458 = _456 + 1.0;
    float _460 = fma(_260, _388, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _462 = float(_400);
    float _464 = float(_454);
    bool _466 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _468 = isnan(0.0);
    bool _470 = _466 || _468;
    bool _472 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _474 = _470 || _472;
    float _476 = float(_308);
    float _478 = _464 * _462;
    float _480 = float(_406);
    float _482 = _474 ? _458 : 0.0;
    float _484 = _476 * _480;
    float _486 = _478 * (-2.0);
    if (_450)
    {
        float _488 = _482 * _440;
        _160 = _488;
    }
    float _490 = _160;
    int _492 = _426 ? 0 : 1;
    float _494 = _484 * (-2.0);
    float _496 = fma(_306, _486, _306);
    float _498 = fma(_486, _430, _430);
    bool _500 = _210 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _502 = isnan(_210);
    bool _504 = _500 || _502;
    bool _506 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _508 = _504 || _506;
    float _510 = float(_508);
    float _512 = fma(_304, _494, _304);
    bool _514 = !_240;
    int _516 = _514 ? 0 : 1;
    float _518 = fma(_276, (*spvDescriptorSet0.vp_c9)._m0[196].x, _498);
    bool _520 = _210 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _522 = isnan(_210);
    bool _524 = _520 || _522;
    bool _526 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _528 = _524 || _526;
    float _530 = float(_528);
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _534 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _532;
    float _536 = -_510;
    float _538 = _536 + 1.0;
    int _540 = abs(_516);
    float _542 = fma(_494, _432, _432);
    float _544 = fma(_534, _388, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _546 = _530 * _538;
    float _548 = fma(_300, _388, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    bool _550 = _210 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _552 = isnan(_210);
    bool _554 = _550 || _552;
    bool _556 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _558 = _554 || _556;
    float _560 = float(_558);
    float _562 = -_530;
    float _564 = _562 + 1.0;
    int _566 = ~_492;
    int _568 = _566 + 1;
    int _570 = _568 + 1;
    float _572 = fma(_496, _490, _518);
    bool _574 = _210 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _576 = isnan(_210);
    bool _578 = _574 || _576;
    bool _580 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _582 = _578 || _580;
    float _584 = float(_582);
    float _586 = fma(_288, (*spvDescriptorSet0.vp_c9)._m0[196].y, _542);
    float _588 = -_560;
    float _590 = _588 + 1.0;
    int _592 = _570;
    if (!_416)
    {
        int _594 = ~_492;
        int _596 = _594 + 1;
        _592 = _596;
    }
    int _598 = _592;
    float _600 = _584 * _564;
    float _602 = float(_540);
    float _604 = _510 * _590;
    float _606 = float(_598);
    float _608 = _362 * _600;
    float _610 = -_584;
    float _612 = _610 + 1.0;
    float _614 = _572 * 0.15915493667125701904296875;
    float _616 = _452 * _600;
    float _618 = _602 * _606;
    float _620 = _344 * _600;
    float _622 = fma(_612, (*spvDescriptorSet0.vp_c9)._m0[143].x, _608);
    float _624 = in.m_71.x;
    float _626 = in.m_71.y;
    float _628 = in.m_71.z;
    float _630 = _618 * (-2.0);
    float _632 = fma(_612, (*spvDescriptorSet0.vp_c9)._m0[143].y, _616);
    float _634 = fma(_612, (*spvDescriptorSet0.vp_c9)._m0[143].z, _620);
    float _636 = in.m_73.x;
    float _638 = in.m_73.y;
    float _640 = in.m_73.z;
    float _642 = fma(_630, _434, _434);
    float _644 = fma(_292, _630, _292);
    float _646 = fma(_512, _490, _586);
    float _648 = fma(_428, _546, _632);
    float _650 = fma(_266, (*spvDescriptorSet0.vp_c9)._m0[196].z, _642);
    float _652 = fma(_342, _546, _634);
    float _654 = _646 * 0.15915493667125701904296875;
    float _656 = fma(_350, _546, _622);
    float _658 = fma(_644, _490, _650);
    float _660 = _614 * 6.283185482025146484375;
    float _662 = sin(_660);
    float _664 = fma(_460, _604, _648);
    float _666 = fma(_548, _604, _652);
    float _668 = _658 * 0.15915493667125701904296875;
    float _670 = fma(_544, _604, _656);
    float _672 = fma(_560, (*spvDescriptorSet0.vp_c9)._m0[146].y, _664);
    float _674 = in.m_60.x;
    float _676 = in.m_60.y;
    float _678 = in.m_60.z;
    float _680 = _614 * 6.283185482025146484375;
    float _682 = cos(_680);
    float _684 = fma(_560, (*spvDescriptorSet0.vp_c9)._m0[146].x, _670);
    float _686 = _672 * _626;
    float _688 = fma(_560, (*spvDescriptorSet0.vp_c9)._m0[146].z, _666);
    float _690 = _684 * _624;
    float _692 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _638);
    float _694 = _686 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _696 = _654 * 6.283185482025146484375;
    float _698 = sin(_696);
    float _700 = _688 * _628;
    float _702 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _636);
    float _704 = _690 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _706 = _692 * _694;
    float _708 = _700 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _710 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _640);
    float _712 = _702 * _704;
    float _714 = _654 * 6.283185482025146484375;
    float _716 = cos(_714);
    float _718 = _710 * _708;
    float _720 = _676 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _722 = _676 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _724 = _668 * 6.283185482025146484375;
    float _726 = cos(_724);
    float _728 = _682 * _698;
    float _730 = _662 * _698;
    float _732 = fma(_674, (*spvDescriptorSet0.vp_c10)._m0[4].x, _720);
    float _734 = fma(_674, (*spvDescriptorSet0.vp_c10)._m0[6].x, _722);
    float _736 = _676 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _738 = fma(_678, (*spvDescriptorSet0.vp_c10)._m0[4].z, _732);
    float _740 = _668 * 6.283185482025146484375;
    float _742 = sin(_740);
    float _744 = _682 * _716;
    float _746 = _662 * _716;
    float _748 = fma(_674, (*spvDescriptorSet0.vp_c10)._m0[5].x, _736);
    float _750 = fma(_678, (*spvDescriptorSet0.vp_c10)._m0[5].z, _748);
    float _752 = _682 * _726;
    float _754 = _716 * _726;
    float _756 = _662 * _726;
    float _758 = _698 * _726;
    float _760 = _752 * _706;
    float _762 = fma(_678, (*spvDescriptorSet0.vp_c10)._m0[6].z, _734);
    float _764 = _756 * _706;
    float _766 = _738 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _768 = fma(_742, _744, _730);
    float _770 = fma(_742, _730, _744);
    float _772 = -_728;
    float _774 = fma(_742, _746, _772);
    float _776 = -_706;
    float _778 = _742 * _776;
    float _780 = -_746;
    float _782 = fma(_742, _728, _780);
    float _784 = fma(_768, _712, _760);
    float _786 = fma(_774, _712, _764);
    float _788 = fma(_754, _712, _778);
    float _790 = _762 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _792 = fma(_782, _718, _784);
    float _794 = fma(_770, _718, _786);
    float _796 = fma(_758, _718, _788);
    float _798 = _792 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _800 = _792 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _802 = fma(_796, (*spvDescriptorSet0.vp_c10)._m0[8].x, _798);
    float _804 = fma(_796, (*spvDescriptorSet0.vp_c10)._m0[10].x, _800);
    float _806 = fma(_794, (*spvDescriptorSet0.vp_c10)._m0[8].z, _802);
    float _808 = fma(_794, (*spvDescriptorSet0.vp_c10)._m0[10].z, _804);
    float _810 = _750 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _812 = _766 + _806;
    float _814 = _790 + _808;
    float _816 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _818 = _812 + _816;
    float _820 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _822 = _814 + _820;
    float _824 = _818 * _818;
    float _826 = _822 * _822;
    float _828 = _824 + _826;
    float _830 = sqrt(_828);
    bool _832 = _830 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _834 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _836 = _830 + _834;
    float _838 = _792 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _840 = fma(_796, (*spvDescriptorSet0.vp_c10)._m0[9].x, _838);
    float _842 = fma(_794, (*spvDescriptorSet0.vp_c10)._m0[9].z, _840);
    float _844 = 0.0;
    float _846 = _840;
    float _848 = _796;
    float _850 = _812;
    float _852 = _814;
    float _854 = _824;
    float _856 = _826;
    float _858 = _790;
    if (_832)
    {
        float _860 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _844 = _860;
    }
    float _862 = _844;
    float _864 = _810 + _842;
    float _866 = _864;
    if (_832)
    {
        float _868 = _864 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _846 = _868;
    }
    float _870 = _846;
    float _872 = _870;
    if (_832)
    {
        float _874 = rsqrt(_828);
        _848 = _874;
    }
    float _876 = _848;
    float _878 = _862;
    if (_832)
    {
        float _880 = _836 * _862;
        _878 = _880;
    }
    float _882 = _878;
    float _884 = _882;
    if (_832)
    {
        float _886 = _882 * 0.15915493667125701904296875;
        _884 = _886;
    }
    float _888 = _884;
    float _890 = _674;
    if (_832)
    {
        float _892 = _888 * 6.283185482025146484375;
        float _894 = sin(_892);
        _890 = _894;
    }
    float _896 = _890;
    if (_832)
    {
        float _898 = fma(_896, _870, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _872 = _898;
    }
    float _900 = _872;
    float _902 = _900;
    if (_832)
    {
        float _904 = _876 * _900;
        _902 = _904;
    }
    float _906 = _902;
    if (_832)
    {
        float _908 = fma(_818, _906, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _850 = _908;
    }
    float _910 = _850;
    if (_832)
    {
        float _912 = fma(_822, _906, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _852 = _912;
    }
    float _914 = _852;
    float _916 = fma(_910, 6.2500002968590706586837768554688e-05, 0.5);
    float _918 = fma(_914, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _3957 = float2(_916, _918);
    float3 _922 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_3957, float2(0.0), isnan(_3957)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_3957, float2(0.0), isnan(_3957)), level(0.0)).xyz;
    float _924 = _922.x;
    float _926 = _922.y;
    float _928 = _922.z;
    float _930 = in.m_75.y;
    bool _932 = _638 != 0.0;
    bool _934 = isnan(_638);
    bool _936 = _932 || _934;
    bool _938 = isnan(0.0);
    bool _940 = _936 || _938;
    float _942 = _888;
    if (_832)
    {
        float _944 = _888 * 6.283185482025146484375;
        float _946 = cos(_944);
        _942 = _946;
    }
    float _948 = _942;
    int _950 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _952 = _950 != 0;
    float _954 = in.m_67.w;
    bool _956 = _636 == 0.0;
    bool _958 = !_940;
    bool _960 = _956 && _958;
    int _962 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _964 = _962 != 0;
    float _966 = in.m_77.x;
    float _968 = in.m_77.y;
    float _970 = in.m_77.z;
    bool _972 = _640 == 0.0;
    bool _974 = _972 && _960;
    float _976 = in.m_75.x;
    float _978 = _836;
    float _980 = 1.0;
    float _982 = 1.0;
    if (_952)
    {
        float _984 = in.m_67.z;
        _978 = _984;
    }
    float _986 = _978;
    out.m_79.x = 1.0;
    out.m_79.y = 1.0;
    out.m_79.z = 1.0;
    float _988 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _990 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _992 = -_930;
    float _994 = _992 + 1.0;
    float _996 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _998 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1000 = _988 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1002 = _954 > 0.5;
    float _1004 = _990 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1006 = _996 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1008 = _930;
    if (_964)
    {
        float _1010 = _1002 ? _994 : _930;
        _1008 = _1010;
    }
    float _1012 = _1008;
    float _1014 = 0.0;
    float _1016 = _966;
    float _1018 = _968;
    if (_974)
    {
        _1014 = _966;
    }
    float _1020 = _1014;
    out.m_81.x = _1000;
    out.m_81.y = _1004;
    out.m_81.z = _1006;
    out.m_81.w = _998;
    float _1022 = _1020;
    float _1024 = _976;
    if (!_952)
    {
        _980 = _976;
    }
    float _1026 = _980;
    float _1028 = 0.0;
    float _1030 = _1026;
    if (_974)
    {
        _1028 = _1020;
    }
    float _1032 = _1028;
    bool _1034 = _986 > 0.5;
    bool _1036 = _1034 && _952;
    float _1038 = in.m_83.x;
    float _1040 = in.m_83.y;
    float _1042 = in.m_83.z;
    float _1044 = in.m_83.w;
    float _1046 = _1032;
    if (!_974)
    {
        _1022 = _966;
    }
    float _1048 = _1022;
    if (_974)
    {
        _1016 = _968;
    }
    float _1050 = _1016;
    float _1052 = _1050;
    if (_974)
    {
        _982 = _970;
    }
    float _1054 = _982;
    float _1056 = _1054;
    if (!_974)
    {
        float _1058 = fma(_640, (*spvDescriptorSet0.vp_c9)._m0[17].y, _970);
        _1056 = _1058;
    }
    float _1060 = _1056;
    float _1062 = 0.0;
    if (_974)
    {
        _1062 = _1050;
    }
    float _1064 = _1062;
    float _1066 = _1064;
    if (!_974)
    {
        float _1068 = fma(_636, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1048);
        _1046 = _1068;
    }
    float _1070 = _1046;
    if (!_974)
    {
        _1052 = _968;
    }
    float _1072 = _1052;
    if (_952)
    {
        _1018 = _976;
    }
    float _1074 = _1018;
    float _1076 = _1074;
    if (!_974)
    {
        float _1078 = fma(_638, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1072);
        _1066 = _1078;
    }
    float _1080 = _1066;
    if (_1036)
    {
        float _1082 = -_1074;
        float _1084 = _1082 + 1.0;
        _1076 = _1084;
    }
    float _1086 = _1076;
    float _1088 = -_1080;
    float _1090 = _742 * _1088;
    float _1092 = _756 * _1080;
    if (_952)
    {
        _1030 = _1086;
    }
    float _1094 = _1030;
    float _1096 = fma(_754, _1070, _1090);
    float _1098 = fma(_774, _1070, _1092);
    float _1100 = _1042 * _1048;
    float _1102 = _1040 * _970;
    float _1104 = _1038 * _1072;
    float _1106 = fma(_758, _1060, _1096);
    float _1108 = -_1100;
    float _1110 = fma(_1038, _970, _1108);
    float _1112 = -_1102;
    float _1114 = fma(_1042, _1072, _1112);
    float _1116 = -_1104;
    float _1118 = fma(_1040, _1048, _1116);
    float _1120 = -_1040;
    float _1122 = _742 * _1120;
    float _1124 = _1110 * _1044;
    float _1126 = _752 * _1080;
    float _1128 = _1114 * _1044;
    float _1130 = _1118 * _1044;
    float _1132 = -_1124;
    float _1134 = _742 * _1132;
    float _1136 = _752 * _1040;
    float _1138 = _752 * _1124;
    float _1140 = _756 * _1040;
    float _1142 = _756 * _1124;
    float _1144 = fma(_768, _1070, _1126);
    float _1146 = fma(_754, _1128, _1134);
    float _1148 = fma(_768, _1128, _1138);
    float _1150 = fma(_754, _1038, _1122);
    float _1152 = fma(_768, _1038, _1136);
    float _1154 = fma(_774, _1038, _1140);
    float _1156 = fma(_774, _1128, _1142);
    float _1158 = fma(_782, _1060, _1144);
    float _1160 = fma(_758, _1042, _1150);
    float _1162 = fma(_782, _1042, _1152);
    float _1164 = fma(_770, _1042, _1154);
    float _1166 = fma(_758, _1130, _1146);
    float _1168 = fma(_782, _1130, _1148);
    float _1170 = fma(_770, _1130, _1156);
    float _1172 = _1158 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1174 = _1130;
    float _1176 = _1172;
    if (_832)
    {
        float _1178 = _948 + (-1.0);
        _1174 = _1178;
    }
    float _1180 = _1174;
    float _1182 = _1158 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1184 = _1158 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1186 = fma(_1106, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1172);
    float _1188 = _1180;
    float _1190 = _1182;
    if (_832)
    {
        float _1192 = _1180 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1176 = _1192;
    }
    float _1194 = _1176;
    float _1196 = fma(_770, _1060, _1098);
    float _1198 = fma(_1106, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1182);
    float _1200 = fma(_1106, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1184);
    float _1202 = _1162 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    if (_832)
    {
        float _1204 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1206 = _910 + _1204;
        _1188 = _1206;
    }
    float _1208 = _1188;
    if (_832)
    {
        float _1210 = fma(_864, _948, _1194);
        _866 = _1210;
    }
    float _1212 = _866;
    if (_832)
    {
        float _1214 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1216 = _914 + _1214;
        _1190 = _1216;
    }
    float _1218 = _1190;
    float _1220 = fma(_1160, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1202);
    if (_832)
    {
        float _1222 = _1208 * _1208;
        _854 = _1222;
    }
    float _1224 = _854;
    float _1226 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1228 = _1212 + _1226;
    float _1230 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    if (_832)
    {
        float _1232 = _1218 * _1218;
        _856 = _1232;
    }
    float _1234 = _856;
    float _1236 = _1162 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1238 = fma(_1228, _1228, _1224);
    float _1240 = _1162 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1242 = _1168 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1244 = fma(_1160, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1236);
    float _1246 = _1238 + _1234;
    float _1248 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1250 = fma(_1160, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1240);
    float _1252 = _1168 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1254 = _1168 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1256 = _1012 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1258 = fma(_1166, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1242);
    float _1260 = fma(_1166, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1252);
    float _1262 = _1094 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1264 = sqrt(_1246);
    float _1266 = fma(_1166, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1254);
    float _1268 = _1256 * _1230;
    float _1270 = fma(_1164, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1220);
    float _1272 = fma(_1164, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1244);
    float _1274 = fma(_1170, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1258);
    float _1276 = fma(_1170, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1260);
    float _1278 = fma(_1196, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1186);
    float _1280 = _1262 * _1248;
    float _1282 = fma(_1164, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1250);
    float _1284 = fma(_1170, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1266);
    float _1286 = fma(_1196, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1198);
    float _1288 = fma(_1196, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1200);
    out.m_85.z = _1280;
    out.m_85.w = _1268;
    bool _1290 = _1264 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1292 = isnan(_1264);
    bool _1294 = _1290 || _1292;
    bool _1296 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1298 = _1294 || _1296;
    out.m_87.x = _1270;
    out.m_87.y = _1272;
    out.m_87.z = _1282;
    out.m_89.x = _1274;
    out.m_89.y = _1276;
    out.m_89.z = _1284;
    out.m_91.x = _1278;
    out.m_91.y = _1286;
    out.m_91.z = _1288;
    float _1300 = _1262;
    if (!_1298)
    {
        _1300 = 1.0;
    }
    float _1302 = _1300;
    out.m_93.x = _924;
    out.m_93.y = _926;
    out.m_93.z = _928;
    bool _1304 = !_1298;
    float _1306 = _1302;
    if (!_1304)
    {
        bool _1308 = _1264 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1310 = isnan(_1264);
        bool _1312 = _1308 || _1310;
        bool _1314 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1316 = _1312 || _1314;
        if (!_1316)
        {
            float _1318 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1320 = _1264 + _1318;
            float _1322 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1324 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1322;
            float _1326 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1328 = _1326 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1330 = 1.0 / _1324;
            float _1332 = _1320 * _1330;
            float _1334 = fma(_1332, _1328, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1306 = _1334;
            _1336 = true;
        }
        else
        {
            bool _1338 = _1264 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1340 = isnan(_1264);
            bool _1342 = _1338 || _1340;
            bool _1344 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1346 = _1342 || _1344;
            if (!_1346)
            {
                float _1348 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1350 = _1264 + _1348;
                float _1352 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1354 = _1352 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1356 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1358 = _1356 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1360 = 1.0 / _1354;
                float _1362 = _1350 * _1360;
                float _1364 = fma(_1362, _1358, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1306 = _1364;
                _1336 = true;
            }
            else
            {
                _1306 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1336 = false;
    float _1366 = _1306;
    float _1368 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1370 = _1212 + _1368;
    float _1372 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1374 = _910 + _1372;
    float _1376 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1378 = _914 + _1376;
    float _1380 = _810 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1382 = fma(_1370, _1366, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1384 = fma(_1374, _1366, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1386 = fma(_1378, _1366, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1388 = fma(_766, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1380);
    float _1390 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1392 = _1382 + _1390;
    float _1394 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1396 = _1384 + _1394;
    float _1398 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1400 = _1386 + _1398;
    float _1402 = _1392 * _1392;
    float _1404 = fma(_1396, _1396, _1402);
    float _1406 = fma(_1400, _1400, _1404);
    float _1408 = fma(_790, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1388);
    float _1410 = _810 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1412 = fma(_766, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1414 = rsqrt(_1406);
    float _1416 = _1408 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1418 = fma(_766, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1410);
    float _1420 = fma(_790, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1422 = fma(_790, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1418);
    float _1424 = 1.0 / _1416;
    float _1426 = _1422 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1428 = _1426 + _1416;
    float _1430 = _1414 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1432 = floor(_1412);
    float _1434 = _1396 * _1430;
    float _1436 = _1400 * _1430;
    float _1438 = _1434 * _1434;
    float _1440 = _1436 * _1436;
    float _1442 = _1428 * _1424;
    float _1444 = _1442 * 0.5;
    float _1446 = sqrt(_1406);
    float _1448 = _1438 + _1440;
    float _1450 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1452 = fma(_1444, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1450);
    float _1454 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _1456 = -_1432;
    float _1458 = _1412 + _1456;
    float _1460 = sqrt(_1448);
    float _1462 = _810 + _1454;
    float _1464 = _1462 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1466 = _1462 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1468 = 1.0 / _1452;
    float _1470 = fma(_766, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1464);
    float _1472 = fma(_766, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1466);
    float _1474 = fma(_790, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1470);
    float _1476 = fma(_790, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1472);
    bool _1478 = _1460 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1480 = _1474 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1482 = _1476 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1484 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1486 = _1460 + _1484;
    float _1488 = floor(_1420);
    float _1490 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1492 = _1468 * _1490;
    float _1494 = trunc(_1480);
    int _1496 = int(_1494);
    bool _1498 = _1492 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1500 = _1492 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1502 = _810;
    int _1504 = 2;
    float _1506 = _1486;
    float _1508 = _1448;
    float _1510 = _1430;
    float _1512 = _1434;
    float _1514 = _1438;
    if (_1478)
    {
        float _1516 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1502 = _1516;
    }
    float _1518 = _1502;
    float _1520 = -_1488;
    float _1522 = _1420 + _1520;
    if (!_1498)
    {
        _1504 = 1;
    }
    int _1524 = _1504;
    float _1526 = trunc(_1482);
    int _1528 = int(_1526);
    int _1530 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1532 = _1496 + _1530;
    int _1534 = _1532 + 1;
    int _1536 = _1524;
    if (_1478)
    {
        float _1538 = _1486 * _1518;
        _1506 = _1538;
    }
    float _1540 = _1506;
    if (_1478)
    {
        float _1542 = rsqrt(_1448);
        _1508 = _1542;
    }
    float _1544 = _1508;
    float _1546 = 0.0;
    float _1548 = _1544;
    if (_1478)
    {
        float _1550 = _1540 * 0.15915493667125701904296875;
        _1546 = _1550;
    }
    float _1552 = _1546;
    bool _1554 = !_1498;
    int _1556 = _1554 ? 0 : 1;
    float _1558 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    int _1560 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1562 = _1528 + _1560;
    int _1564 = _1562 + 1;
    float _1566 = _1476;
    if (_1478)
    {
        float _1568 = _1552 * 6.283185482025146484375;
        float _1570 = sin(_1568);
        _1566 = _1570;
    }
    float _1572 = _1566;
    if (!_1500)
    {
        _1536 = _1556;
    }
    int _1574 = _1536;
    float _1576 = precise::max(0.0, _1558);
    int _1578 = _1574 << 6;
    bool _1580 = _1534 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1582 = -_1430;
    float _1584 = -_1576;
    float _1586 = fma(_1392, _1582, _1584);
    int _1588 = _1578 + 96;
    uint _1591 = uint(int(uint(_1588) >> uint(2)));
    uint _1593 = uint(int(uint(int(_1591)) >> uint(2)));
    int _1595 = int(_1591) & 3;
    float _1597 = (*spvDescriptorSet0.vp_c15)._m0[int(_1593)][_1595];
    int _1599 = int(_1591) + 1;
    uint _1601 = uint(int(uint(_1599) >> uint(2)));
    int _1603 = _1599 & 3;
    float _1605 = (*spvDescriptorSet0.vp_c15)._m0[int(_1601)][_1603];
    int _1607 = _1534 | _1564;
    float _1609 = _1552;
    float _1611 = as_type<float>(_1607);
    float _1613 = _1586;
    if (_1478)
    {
        float _1615 = _1552 * 6.283185482025146484375;
        float _1617 = cos(_1615);
        _1609 = _1617;
    }
    float _1619 = _1609;
    if (_1478)
    {
        float _1621 = _1586 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1510 = _1621;
    }
    float _1623 = _1510;
    bool _1625 = _1607 < 0;
    bool _1627 = _1625 || _1580;
    if (_1478)
    {
        float _1629 = fma(_1572, _1623, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1611 = _1629;
    }
    float _1631 = _1611;
    int _1633 = _1578 + 48;
    uint _1635 = uint(int(uint(_1633) >> uint(2)));
    uint _1637 = uint(int(uint(int(_1635)) >> uint(2)));
    int _1639 = int(_1635) & 3;
    float _1641 = (*spvDescriptorSet0.vp_c15)._m0[int(_1637)][_1639];
    int _1643 = int(_1635) + 1;
    uint _1645 = uint(int(uint(_1643) >> uint(2)));
    int _1647 = _1643 & 3;
    float _1649 = (*spvDescriptorSet0.vp_c15)._m0[int(_1645)][_1647];
    float _1651 = _1382 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    bool _1653 = _1564 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1655 = _1653 || _1627;
    float _1657 = 0.0;
    if (_1478)
    {
        float _1659 = _1544 * _1631;
        _1657 = _1659;
    }
    float _1661 = _1657;
    float _1663 = fma(_1384, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1651);
    if (_1478)
    {
        float _1665 = _1434 * _1661;
        _1512 = _1665;
    }
    float _1667 = _1512;
    int _1669 = _1578 + 104;
    uint _1671 = uint(int(uint(_1669) >> uint(2)));
    uint _1673 = uint(int(uint(int(_1671)) >> uint(2)));
    int _1675 = int(_1671) & 3;
    float _1677 = (*spvDescriptorSet0.vp_c15)._m0[int(_1673)][_1675];
    int _1679 = int(_1671) + 1;
    uint _1681 = uint(int(uint(_1679) >> uint(2)));
    int _1683 = _1679 & 3;
    float _1685 = (*spvDescriptorSet0.vp_c15)._m0[int(_1681)][_1683];
    float _1687 = fma(_1386, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1663);
    float _1689 = _1619;
    if (_1478)
    {
        float _1691 = _1619 + (-1.0);
        _1548 = _1691;
    }
    float _1693 = _1548;
    float _1695 = _1693;
    if (_1478)
    {
        float _1697 = _1667 * _1667;
        _1514 = _1697;
    }
    float _1699 = _1514;
    float _1701 = 0.0;
    if (_1478)
    {
        float _1703 = _1693 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1701 = _1703;
    }
    float _1705 = _1701;
    if (!_1478)
    {
        _1695 = _1436;
    }
    float _1707 = _1695;
    int _1709 = _1578 + 64;
    uint _1711 = uint(int(uint(_1709) >> uint(2)));
    uint _1713 = uint(int(uint(int(_1711)) >> uint(2)));
    int _1715 = int(_1711) & 3;
    float _1717 = (*spvDescriptorSet0.vp_c15)._m0[int(_1713)][_1715];
    int _1719 = int(_1711) + 1;
    uint _1721 = uint(int(uint(_1719) >> uint(2)));
    int _1723 = _1719 & 3;
    float _1725 = (*spvDescriptorSet0.vp_c15)._m0[int(_1721)][_1723];
    float _1727 = _1707;
    if (_1478)
    {
        float _1729 = _1436 * _1661;
        _1727 = _1729;
    }
    float _1731 = _1727;
    if (_1478)
    {
        float _1733 = fma(_1586, _1619, _1705);
        _1613 = _1733;
    }
    float _1735 = _1613;
    float _1737 = _1687 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    if (!_1478)
    {
        _1689 = _1440;
    }
    float _1739 = _1689;
    float _1741 = _1739;
    if (_1478)
    {
        float _1743 = _1731 * _1731;
        _1741 = _1743;
    }
    float _1745 = _1741;
    float _1747 = fma(_1735, _1735, _1699);
    float _1749 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    int _1751 = _1578 + 80;
    uint _1753 = uint(int(uint(_1751) >> uint(2)));
    uint _1755 = uint(int(uint(int(_1753)) >> uint(2)));
    int _1757 = int(_1753) & 3;
    float _1759 = (*spvDescriptorSet0.vp_c15)._m0[int(_1755)][_1757];
    int _1761 = int(_1753) + 1;
    uint _1763 = uint(int(uint(_1761) >> uint(2)));
    int _1765 = _1761 & 3;
    float _1767 = (*spvDescriptorSet0.vp_c15)._m0[int(_1763)][_1765];
    float _1769 = _1737 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1771 = _1747 + _1745;
    int _1773 = as_type<int>(_1769);
    if (!_1655)
    {
        float _1775 = floor(_1482);
        _1024 = _1775;
    }
    float _1777 = _1024;
    float _1779 = -_1769;
    float _1781 = fma(_1779, _1749, 1.0);
    if (!_1655)
    {
        int _1783 = _1564 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1785 = _1783 + _1534;
        _1773 = _1785;
    }
    int _1787 = _1773;
    int _1789 = _1578 + 56;
    uint _1791 = uint(int(uint(_1789) >> uint(2)));
    uint _1793 = uint(int(uint(int(_1791)) >> uint(2)));
    int _1795 = int(_1791) & 3;
    float _1797 = (*spvDescriptorSet0.vp_c15)._m0[int(_1793)][_1795];
    int _1799 = int(_1791) + 1;
    uint _1801 = uint(int(uint(_1799) >> uint(2)));
    int _1803 = _1799 & 3;
    float _1805 = (*spvDescriptorSet0.vp_c15)._m0[int(_1801)][_1803];
    float _1807 = log2(_1781);
    int _1809 = _1578 + 88;
    uint _1811 = uint(int(uint(_1809) >> uint(2)));
    uint _1813 = uint(int(uint(int(_1811)) >> uint(2)));
    int _1815 = int(_1811) & 3;
    float _1817 = (*spvDescriptorSet0.vp_c15)._m0[int(_1813)][_1815];
    int _1819 = int(_1811) + 1;
    uint _1821 = uint(int(uint(_1819) >> uint(2)));
    int _1823 = _1819 & 3;
    float _1825 = (*spvDescriptorSet0.vp_c15)._m0[int(_1821)][_1823];
    float _1827 = _1462 * _1605;
    float _1829 = fma(_766, _1597, _1827);
    int _1831 = _1578 + 72;
    uint _1833 = uint(int(uint(_1831) >> uint(2)));
    uint _1835 = uint(int(uint(int(_1833)) >> uint(2)));
    int _1837 = int(_1833) & 3;
    float _1839 = (*spvDescriptorSet0.vp_c15)._m0[int(_1835)][_1837];
    int _1841 = int(_1833) + 1;
    uint _1843 = uint(int(uint(_1841) >> uint(2)));
    int _1845 = _1841 & 3;
    float _1847 = (*spvDescriptorSet0.vp_c15)._m0[int(_1843)][_1845];
    float _1849 = _1462 * _1649;
    float _1851 = rsqrt(_1771);
    float _1853 = _1807 * 0.693147182464599609375;
    float _1855 = fma(_766, _1641, _1849);
    int _1857 = as_type<int>(_1849);
    int _1859 = as_type<int>(_1597);
    if (!_1655)
    {
        int _1861 = _1787 << 2;
        _1857 = _1861;
    }
    int _1863 = _1857;
    float _1865 = fma(_790, _1677, _1829);
    int _1867 = _1863;
    if (!_1655)
    {
        int _1869 = 12 & _1863;
        _1867 = _1869;
    }
    int _1871 = _1867;
    float _1873 = _1865 + _1685;
    float2 _5592 = float2(_1458, _1522);
    float _1875 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5592, float2(0.0), isnan(_5592)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5592, float2(0.0), isnan(_5592)), level(0.0)).x;
    float _1877 = _1853 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1879 = _1462 * _1725;
    float _1881 = _1725;
    int _1883 = as_type<int>(_1767);
    if (!_1655)
    {
        float _1885 = -_1777;
        float _1887 = _1482 + _1885;
        _1881 = _1887;
    }
    float _1889 = _1881;
    float _1891 = 1.0 / _1873;
    float _1893 = _1851 * _1667;
    float _1895 = fma(_766, _1717, _1879);
    float _1897 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1899 = fma(_1446, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1897);
    float _1901 = precise::clamp(_1899, 0.0, 1.0);
    float _1903 = _1851 * _1735;
    float _1905 = _1893 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1907 = _1462 * _1767;
    if (!_1655)
    {
        uint _1909 = uint(int(uint(_1787) >> uint(2)));
        _1883 = int(_1909);
    }
    int _1911 = _1883;
    float _1913 = _1851 * _1731;
    float _1915 = fma(_766, _1759, _1907);
    float _1917 = -_1901;
    float _1919 = _1917 + 1.0;
    if (!_1655)
    {
        int _1921 = _1911 << 4;
        int _1923 = _1921 + _1871;
        _1859 = _1923;
    }
    int _1925 = _1859;
    float _1927 = fma(_790, _1797, _1855);
    float _1929 = _1901;
    float _1931 = as_type<float>(_1925);
    if (!_1655)
    {
        int _1933 = _1925 + 400;
        uint _1935 = uint(int(uint(_1933) >> uint(2)));
        uint _1937 = uint(int(uint(int(_1935)) >> uint(2)));
        int _1939 = int(_1935) & 3;
        float _1941 = (*spvDescriptorSet0.vp_c15)._m0[int(_1937)][_1939];
        _1929 = _1941;
    }
    float _1943 = _1929;
    float _1945 = abs(_1919);
    float _1947 = log2(_1945);
    float _1949 = _1927 + _1805;
    float _1951 = _1382 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1953 = fma(_790, _1817, _1915);
    float _1955 = -_1905;
    float _1957 = fma(_1903, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1955);
    float _1959 = _1382 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1961 = fma(_1384, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1951);
    float _1963 = -_1913;
    float _1965 = fma(_1963, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1957);
    float _1967 = fma(_1384, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1959);
    float _1969 = _1949 * _1891;
    float _1971 = fma(_790, _1839, _1895);
    float _1973 = fma(_1965, -0.5, 0.5);
    float _1975 = fma(_1386, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1967);
    float _1977 = fma(_1965, 0.5, 0.5);
    float _1979 = _1971 + _1847;
    float _1981 = _1382 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    bool _1983 = _1969 >= 0.0;
    float _1985 = fma(_1386, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1961);
    float _1987 = _1979 * _1891;
    float _1989 = fma(_1384, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1981);
    bool _1991 = _1969 <= 1.0;
    bool _1993 = _1991 && _1983;
    float _1995 = _1985 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1997 = _1947 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1999 = fma(_1386, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1989);
    bool _2001 = _1987 >= 0.0;
    bool _2003 = _2001 && _1993;
    float _2005 = _1995 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2007 = exp2(_1997);
    float _2009 = _1999 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    bool _2011 = _1987 <= 1.0;
    bool _2013 = _2011 && _2003;
    float _2015 = _1975 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2017 = _1953 + _1825;
    float _2019 = fma(_2009, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2005);
    float _2021 = _1995 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2023 = _1903 + 1.0;
    float _2025 = sqrt(_1973);
    float _2027 = fma(_1737, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2019);
    float _2029 = fma(_2009, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2021);
    float _2031 = _2017 * _1891;
    float _2033 = fma(_1977, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2035 = fma(_2015, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2027);
    if (_2013)
    {
        float _2037 = float(_1574);
        _1931 = _2037;
    }
    float _2039 = _1931;
    float _2041 = -_1903;
    float _2043 = fma(_2007, _2023, _2041);
    float _2045 = fma(_1977, _2033, -0.212114393711090087890625);
    float _2047 = 1.0 / _2035;
    float _2049 = _1995 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2051 = fma(_2043, 0.5, 0.5);
    float _2053 = fma(_1977, _2045, 1.570728778839111328125);
    float _2055 = fma(_1737, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2029);
    float _2057 = fma(_2009, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2049);
    float _2059 = _2025 * 0.636619746685028076171875;
    float _2061 = _2039;
    float _2063 = _2057;
    if (_2013)
    {
        float _2065 = rint(_2039);
        float _2067 = precise::max(_2065, 0.0);
        uint _2069 = uint(_2067);
        uint _2071 = clamp(_2069, 0u, 65535u);
        _2061 = as_type<float>(_2071);
    }
    float _2073 = _2061;
    float _2075 = fma(_1737, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2057);
    float _2077 = fma(_2015, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2055);
    float _2079 = -_2053;
    float _2081 = fma(_2059, _2079, 1.0);
    float _2083 = fma(_2015, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2075);
    float _2085 = _1913;
    if (!_1655)
    {
        float _2087 = floor(_1480);
        _2085 = _2087;
    }
    float _2089 = _2085;
    float _2091 = _2077 * _2047;
    float _2093 = _2083 * _2047;
    float _2095 = fma(_2091, 0.5, 0.5);
    float _2097 = fma(_2093, -0.5, 0.5);
    float _2099 = _2073;
    if (_2013)
    {
        float3 _5981 = float3(_1969, _1987, float(as_type<int>(_2073)));
        float3 _5985 = select(_5981, float3(0.0), isnan(_5981));
        float _2101 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5985.xy, uint(rint(_5985.z)), _2031, level(0.0));
        _2099 = _2101;
    }
    float _2103 = _2099;
    float _2105 = _2093;
    if (!_1655)
    {
        float _2107 = rint(_1943);
        float _2109 = precise::max(_2107, 0.0);
        uint _2111 = uint(_2109);
        uint _2113 = clamp(_2111, 0u, 65535u);
        _2105 = as_type<float>(_2113);
    }
    float _2115 = _2105;
    float3 _6011 = float3(_2095, _2097, _1877);
    float _2117 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6011, float3(0.0), isnan(_6011)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6011, float3(0.0), isnan(_6011)), level(0.0)).x;
    if (!_1655)
    {
        float _2119 = -_2089;
        float _2121 = _1480 + _2119;
        _2063 = _2121;
    }
    float _2123 = _2063;
    float3 _6031 = float3(_2095, _2097, _1877);
    float4 _2126 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6031, float3(0.0), isnan(_6031)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6031, float3(0.0), isnan(_6031)), level(0.0)).xyzw;
    float _2128 = _2126.x;
    float _2130 = _2126.y;
    float _2132 = _2126.z;
    float _2134 = _2126.w;
    float2 _6047 = float2(_2081, _2051);
    float3 _2136 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6047, float2(0.0), isnan(_6047)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6047, float2(0.0), isnan(_6047)), level(0.0)).xyz;
    float _2138 = _2136.x;
    float _2140 = _2136.y;
    float _2142 = _2136.z;
    float _2144 = _2115;
    if (!_1655)
    {
        float3 _6068 = float3(_2123, _1889, float(as_type<int>(_2115)));
        float3 _6070 = select(_6068, float3(0.0), isnan(_6068));
        float _2146 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6070.xy, uint(rint(_6070.z)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6070.xy, uint(rint(_6070.z)), level(0.0)).x;
        _2144 = _2146;
    }
    float _2148 = _2144;
    float _2150 = abs(_1492);
    float _2152 = log2(_2150);
    float _2154 = _1995 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2156 = fma(_2009, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2154);
    float _2158 = fma(_1737, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2156);
    float _2160 = _1947 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2162 = fma(_2015, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2158);
    float _2164 = _2152 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2166 = _2162 + _2035;
    float _2168 = exp2(_2160);
    bool _2170 = _1492 <= 8000.0;
    bool _2172 = isnan(_1492);
    bool _2174 = _2170 || _2172;
    bool _2176 = isnan(8000.0);
    bool _2178 = _2174 || _2176;
    float _2180 = float(_2178);
    float _2182 = _2166 * 0.5;
    float _2184 = exp2(_2164);
    out.m_95.z = _2182;
    out.m_95.w = _2035;
    float _2186 = fma(_2184, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2188 = precise::clamp(_2186, 0.0, 1.0);
    float _2190 = fma(_2188, -2.0, 3.0);
    float _2192 = _2188 * _2188;
    float _2194 = _2192 * _2190;
    float _2196 = -_2194;
    float _2198 = _2196 + 1.0;
    out.gl_Position.x = _2077;
    out.gl_Position.y = _2083;
    out.gl_Position.z = _2162;
    out.gl_Position.w = _2035;
    float _2200 = fma(_2198, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2194);
    float _2202 = _2180 * _2200;
    float _2204 = _2200;
    float _2206 = _2162;
    float _2208 = _2077;
    if (!_2013)
    {
        _2204 = 1.0;
    }
    float _2210 = _2204;
    float _2212 = _2202 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2214 = -_2168;
    float _2216 = _2214 + 1.0;
    float _2218 = _2216 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2220 = _2216;
    float _2222 = _2210;
    if (_1655)
    {
        _2220 = 1.0;
    }
    float _2224 = _2220;
    float _2226 = -_1875;
    float _2228 = _2226 + 1.0;
    float _2230 = _2228 * _2212;
    float _2232 = precise::clamp(_2230, 0.0, 1.0);
    float _2234 = _2224;
    if (_2013)
    {
        bool _2236 = _2103 >= _2031;
        bool _2238 = isnan(_2103);
        bool _2240 = _2236 || _2238;
        bool _2242 = isnan(_2031);
        bool _2244 = _2240 || _2242;
        float _2246 = float(_2244);
        _2222 = _2246;
    }
    float _2248 = _2222;
    if (!_1655)
    {
        int _2250 = _1787 << 4;
        int _2252 = _2250 + 2048;
        uint _2254 = uint(int(uint(_2252) >> uint(2)));
        uint _2256 = uint(int(uint(int(_2254)) >> uint(2)));
        int _2258 = int(_2254) & 3;
        float _2260 = (*spvDescriptorSet0.vp_c15)._m0[int(_2256)][_2258];
        int _2262 = int(_2254) + 1;
        uint _2264 = uint(int(uint(_2262) >> uint(2)));
        int _2266 = _2262 & 3;
        float _2268 = (*spvDescriptorSet0.vp_c15)._m0[int(_2264)][_2266];
        int _2270 = _2252 + 8;
        uint _2272 = uint(int(uint(_2270) >> uint(2)));
        uint _2274 = uint(int(uint(int(_2272)) >> uint(2)));
        int _2276 = int(_2272) & 3;
        float _2278 = (*spvDescriptorSet0.vp_c15)._m0[int(_2274)][_2276];
        int _2280 = int(_2272) + 1;
        uint _2282 = uint(int(uint(_2280) >> uint(2)));
        int _2284 = _2280 & 3;
        float _2286 = (*spvDescriptorSet0.vp_c15)._m0[int(_2282)][_2284];
        float _2288 = _1462 * _2268;
        float _2290 = fma(_766, _2260, _2288);
        float _2292 = fma(_790, _2278, _2290);
        float _2294 = _2292 + _2286;
        float _2296 = precise::clamp(_2294, 0.0, 1.0);
        float _2298 = -_2296;
        float _2300 = _2298 + _2148;
        float _2302 = fma(_2300, 500.0, 1.5);
        float _2304 = exp2(_2302);
        float _2306 = 0.0 + _2304;
        float _2308 = precise::clamp(_2306, 0.0, 1.0);
        _2234 = _2308;
        _2206 = _2260;
    }
    float _2310 = _2234;
    float _2312 = _2206;
    float _2314 = _2248 * _2310;
    float _2316 = -_2232;
    float _2318 = fma(_2316, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2320 = _2218 * _2117;
    out.m_97.x = _1384;
    out.m_97.y = _1382;
    out.m_97.z = _1386;
    bool _2322 = _1446 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2324 = isnan(_1446);
    bool _2326 = _2322 || _2324;
    bool _2328 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2330 = _2326 || _2328;
    float _2332 = -_2314;
    float _2334 = fma(_2332, _2318, 1.0);
    float _2336 = precise::clamp(_2334, 0.0, 1.0);
    float _2338 = _2134 * _2320;
    float _2340 = -_2218;
    float _2342 = _2340 + 1.0;
    float _2344 = _2142 * _2320;
    float _2346 = _2336 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2348 = fma(_2138, _2338, _2128);
    float _2350 = fma(_2140, _2338, _2130);
    float _2352 = _2134 * _2342;
    float _2354 = fma(_2134, _2344, _2132);
    out.m_99.x = _2346;
    float _2356 = _2312;
    float _2358 = _2338;
    float _2360 = _2342;
    float _2362 = _2336;
    if (!_2330)
    {
        _2356 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2364 = _2356;
    out.m_101.x = _2348;
    out.m_101.y = _2350;
    out.m_101.z = _2354;
    out.m_101.w = _2352;
    float _2366 = _2364;
    float _2368 = _2364;
    if (!_2330)
    {
        _858 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2370 = _858;
    float _2372 = _2370;
    float _2374 = _2370;
    if (!_2330)
    {
        _2208 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2376 = _2208;
    float _2378 = _2376;
    float _2380 = _2376;
    if (!_2330)
    {
        _2358 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2382 = _2358;
    float _2384 = _2382;
    float _2386 = _2382;
    if (!_2330)
    {
        _2360 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2388 = _2360;
    float _2390 = _2388;
    float _2392 = _2388;
    if (!_2330)
    {
        _2362 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2394 = _2362;
    bool _2396 = !_2330;
    float _2398 = _2394;
    float _2400 = _2394;
    if (!_2396)
    {
        bool _2402 = _1446 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2404 = isnan(_1446);
        bool _2406 = _2402 || _2404;
        bool _2408 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2410 = _2406 || _2408;
        if (!_2410)
        {
            float _2412 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2414 = _1446 + _2412;
            float _2416 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2418 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2416;
            float _2420 = 1.0 / _2418;
            float _2422 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2424 = _2422 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2426 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2428 = _2426 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2430 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2432 = _2430 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2434 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2436 = _2434 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2438 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2440 = _2438 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2442 = _2414 * _2420;
            float _2444 = precise::clamp(_2442, 0.0, 1.0);
            float _2446 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2448 = _2446 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2450 = fma(_2444, _2424, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2452 = fma(_2444, _2448, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2454 = fma(_2444, _2428, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2456 = fma(_2444, _2432, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2458 = fma(_2444, _2436, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2460 = fma(_2444, _2440, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2374 = _2452;
            _2392 = _2458;
            _2368 = _2450;
            _2386 = _2456;
            _2380 = _2454;
            _2400 = _2460;
            _2462 = true;
        }
        else
        {
            bool _2464 = _1446 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2466 = isnan(_1446);
            bool _2468 = _2464 || _2466;
            bool _2470 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2472 = _2468 || _2470;
            if (!_2472)
            {
                _2366 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2474 = _2366;
            _2368 = _2474;
            if (!_2472)
            {
                _2372 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2476 = _2372;
            _2374 = _2476;
            if (!_2472)
            {
                _2378 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2478 = _2378;
            _2380 = _2478;
            if (!_2472)
            {
                _2384 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2480 = _2384;
            _2386 = _2480;
            if (!_2472)
            {
                _2390 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2482 = _2390;
            _2392 = _2482;
            if (!_2472)
            {
                _2398 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2484 = _2398;
            bool _2486 = !_2472;
            _2400 = _2484;
            if (!_2486)
            {
                bool _2488 = _1446 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2490 = isnan(_1446);
                bool _2492 = _2488 || _2490;
                bool _2494 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2496 = _2492 || _2494;
                if (!_2496)
                {
                    float _2498 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2500 = _1446 + _2498;
                    float _2502 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2504 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2502;
                    float _2506 = 1.0 / _2504;
                    float _2508 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2510 = _2508 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2512 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2514 = _2512 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2516 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2518 = _2516 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2520 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2522 = _2520 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2524 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2526 = _2524 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2528 = _2500 * _2506;
                    float _2530 = precise::clamp(_2528, 0.0, 1.0);
                    float _2532 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2534 = _2532 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2536 = fma(_2530, _2510, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2538 = fma(_2530, _2534, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2540 = fma(_2530, _2514, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2542 = fma(_2530, _2518, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2544 = fma(_2530, _2522, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2546 = fma(_2530, _2526, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2374 = _2538;
                    _2392 = _2544;
                    _2368 = _2536;
                    _2386 = _2542;
                    _2380 = _2540;
                    _2400 = _2546;
                    _2462 = true;
                }
                else
                {
                    _2374 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2392 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2368 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2386 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2380 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2400 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2462 = false;
    float _2548 = _2374;
    float _2550 = _2392;
    float _2552 = _2368;
    float _2554 = _2386;
    float _2556 = _2380;
    float _2558 = _2400;
    float _2560 = fma(_1286, -0.5, 0.5);
    float _2562 = precise::clamp(_2560, 0.0, 1.0);
    float _2564 = -_2548;
    float _2566 = _2564 + _2550;
    float _2568 = -_2552;
    float _2570 = _2568 + _2554;
    float _2572 = -_2556;
    float _2574 = _2572 + _2558;
    bool _2576 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2578 = fma(_2562, _2566, _2548);
    float _2580 = fma(_2562, _2570, _2552);
    float _2582 = fma(_2562, _2574, _2556);
    float _2584 = _2578 * 0.586610972881317138671875;
    out.m_63.x = 1.0;
    float _2586 = fma(_2580, 0.298911988735198974609375, _2584);
    float _2588 = fma(_2582, 0.114477999508380889892578125, _2586);
    out.m_103.x = 0.0;
    float _2590 = -_2588;
    float _2592 = _2580 + _2590;
    float _2594 = -_2588;
    float _2596 = _2578 + _2594;
    float _2598 = -_2588;
    float _2600 = _2582 + _2598;
    float _2602 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2604 = fma(_2592, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2588);
    float _2606 = fma(_2596, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2588);
    float _2608 = fma(_2600, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2588);
    out.m_99.w = _2602;
    out.m_105.x = _2604;
    out.m_105.y = _2606;
    out.m_105.z = _2608;
    if (!_2576)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2610 = -_1382;
    float _2612 = _2610 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2614 = -_1384;
    float _2616 = _2614 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2618 = -_1386;
    float _2620 = _2618 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2622 = _2612 * _2612;
    float _2624 = fma(_2616, _2616, _2622);
    float _2626 = fma(_2620, _2620, _2624);
    float _2628 = sqrt(_2626);
    float _2630 = rsqrt(_2626);
    float _2632 = -_2628;
    float _2634 = _2632 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2636 = _2634 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2638 = precise::clamp(_2636, 0.0, 1.0);
    float _2640 = _2616 * _2630;
    float _2642 = _2612 * _2630;
    float _2644 = abs(_2638);
    float _2646 = log2(_2644);
    float _2648 = _2620 * _2630;
    float _2650 = _2640 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2652 = _1286 * _2642;
    float _2654 = -_2642;
    float _2656 = -_2650;
    float _2658 = fma(_2654, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2656);
    float _2660 = fma(_1278, _2640, _2652);
    float _2662 = -_2648;
    float _2664 = fma(_2662, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2658);
    float _2666 = fma(_1288, _2648, _2660);
    float _2668 = precise::clamp(_2666, 0.0, 1.0);
    float _2670 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2672 = _2664 + _2670;
    float _2674 = _2646 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2676 = _2672 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2678 = precise::clamp(_2676, 0.0, 1.0);
    float _2680 = exp2(_2674);
    float _2682 = _2680 * _2678;
    float _2684 = _2668 * _2682;
    float _2686 = _2684 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2688 = _2684 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2690 = _2684 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_103.x = _2686;
    out.m_103.y = _2688;
    out.m_103.z = _2690;
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
    bool _2462 = false;
    bool _1336 = false;
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
        float _2746 = as_type<float>(_138);
        out.gl_Position.z = _2746;
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
        float _2816 = as_type<float>(_178);
        out.gl_Position.z = _2816;
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
    float _218 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _220 = _210 + _218;
    float _222 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _224 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _222;
    float _226 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _228 = _226 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    int _230 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _232 = _230 != 0;
    int _234 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _236 = _234 != 0;
    int _238 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _240 = _238 != 0;
    float _242 = 1.0 / _224;
    float _244 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _246 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _244;
    float _248 = 1.0 / _228;
    float _250 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _252 = _210 + _250;
    bool _254 = !_236;
    int _256 = _254 ? 0 : 1;
    float _258 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _260 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _258;
    float _262 = _212 + _216;
    float _264 = _214 + _216;
    float _266 = _216 + (-0.5);
    float _268 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _270 = _210 + _268;
    float _272 = _216 * 2.0;
    float _274 = _214 + _212;
    float _276 = _212 + (-0.5);
    float _278 = _252 * _242;
    float _280 = _212 * 2.0;
    float _282 = _270 * _248;
    float _284 = _262 + (-1.0);
    float _286 = floor(_272);
    float _288 = _214 + (-0.5);
    float _290 = _214 * 2.0;
    float _292 = fma(_284, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _294 = _264 + (-1.0);
    float _296 = _274 + (-1.0);
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _300 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _298;
    float _302 = floor(_280);
    float _304 = fma(_294, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _306 = fma(_296, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _308 = abs(_256);
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _312 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _310;
    float _314 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _316 = log2(_314);
    bool _318 = _286 > 0.0;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _322 = _320 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    bool _324 = _286 >= 0.0;
    bool _326 = isnan(_286);
    bool _328 = _324 || _326;
    bool _330 = isnan(0.0);
    bool _332 = _328 || _330;
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _336 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _334;
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _340 = _338 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _342 = fma(_322, _282, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _344 = fma(_312, _278, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _346 = 1.0 / _246;
    bool _348 = _302 > 0.0;
    float _350 = fma(_340, _282, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _352 = _302 >= 0.0;
    bool _354 = isnan(_302);
    bool _356 = _352 || _354;
    bool _358 = isnan(0.0);
    bool _360 = _356 || _358;
    float _362 = fma(_336, _278, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    int _364 = _332 ? 0 : 1;
    int _366 = _360 ? 0 : 1;
    float _368 = floor(_290);
    float _370 = _316 * _156;
    int _372 = ~_364;
    int _374 = _372 + 1;
    int _376 = _374 + 1;
    int _378 = ~_366;
    int _380 = _378 + 1;
    int _382 = _380 + 1;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _386 = 1.0 + _384;
    float _388 = _220 * _346;
    float _390 = exp2(_370);
    int _392 = _376;
    int _394 = _382;
    if (!_318)
    {
        int _396 = ~_364;
        int _398 = _396 + 1;
        _392 = _398;
    }
    int _400 = _392;
    if (!_348)
    {
        int _402 = ~_366;
        int _404 = _402 + 1;
        _394 = _404;
    }
    int _406 = _394;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _410 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _408;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _414 = _412 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _416 = _368 > 0.0;
    bool _418 = _368 >= 0.0;
    bool _420 = isnan(_368);
    bool _422 = _418 || _420;
    bool _424 = isnan(0.0);
    bool _426 = _422 || _424;
    float _428 = fma(_414, _282, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _430 = in.m_69.x;
    float _432 = in.m_69.y;
    float _434 = in.m_69.z;
    bool _436 = !_232;
    int _438 = _436 ? 0 : 1;
    float _440 = 1.0 / _386;
    bool _442 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _444 = isnan(1.0);
    bool _446 = _442 || _444;
    bool _448 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _450 = _446 || _448;
    float _452 = fma(_410, _278, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    int _454 = abs(_438);
    float _456 = -_390;
    float _458 = _456 + 1.0;
    float _460 = fma(_260, _388, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _462 = float(_400);
    float _464 = float(_454);
    bool _466 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _468 = isnan(0.0);
    bool _470 = _466 || _468;
    bool _472 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _474 = _470 || _472;
    float _476 = float(_308);
    float _478 = _464 * _462;
    float _480 = float(_406);
    float _482 = _474 ? _458 : 0.0;
    float _484 = _476 * _480;
    float _486 = _478 * (-2.0);
    if (_450)
    {
        float _488 = _482 * _440;
        _160 = _488;
    }
    float _490 = _160;
    int _492 = _426 ? 0 : 1;
    float _494 = _484 * (-2.0);
    float _496 = fma(_306, _486, _306);
    float _498 = fma(_486, _430, _430);
    bool _500 = _210 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _502 = isnan(_210);
    bool _504 = _500 || _502;
    bool _506 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _508 = _504 || _506;
    float _510 = float(_508);
    float _512 = fma(_304, _494, _304);
    bool _514 = !_240;
    int _516 = _514 ? 0 : 1;
    float _518 = fma(_276, (*spvDescriptorSet0.vp_c9)._m0[196].x, _498);
    bool _520 = _210 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _522 = isnan(_210);
    bool _524 = _520 || _522;
    bool _526 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _528 = _524 || _526;
    float _530 = float(_528);
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _534 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _532;
    float _536 = -_510;
    float _538 = _536 + 1.0;
    int _540 = abs(_516);
    float _542 = fma(_494, _432, _432);
    float _544 = fma(_534, _388, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _546 = _530 * _538;
    float _548 = fma(_300, _388, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    bool _550 = _210 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _552 = isnan(_210);
    bool _554 = _550 || _552;
    bool _556 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _558 = _554 || _556;
    float _560 = float(_558);
    float _562 = -_530;
    float _564 = _562 + 1.0;
    int _566 = ~_492;
    int _568 = _566 + 1;
    int _570 = _568 + 1;
    float _572 = fma(_496, _490, _518);
    bool _574 = _210 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _576 = isnan(_210);
    bool _578 = _574 || _576;
    bool _580 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _582 = _578 || _580;
    float _584 = float(_582);
    float _586 = fma(_288, (*spvDescriptorSet0.vp_c9)._m0[196].y, _542);
    float _588 = -_560;
    float _590 = _588 + 1.0;
    int _592 = _570;
    if (!_416)
    {
        int _594 = ~_492;
        int _596 = _594 + 1;
        _592 = _596;
    }
    int _598 = _592;
    float _600 = _584 * _564;
    float _602 = float(_540);
    float _604 = _510 * _590;
    float _606 = float(_598);
    float _608 = _362 * _600;
    float _610 = -_584;
    float _612 = _610 + 1.0;
    float _614 = _572 * 0.15915493667125701904296875;
    float _616 = _452 * _600;
    float _618 = _602 * _606;
    float _620 = _344 * _600;
    float _622 = fma(_612, (*spvDescriptorSet0.vp_c9)._m0[143].x, _608);
    float _624 = in.m_71.x;
    float _626 = in.m_71.y;
    float _628 = in.m_71.z;
    float _630 = _618 * (-2.0);
    float _632 = fma(_612, (*spvDescriptorSet0.vp_c9)._m0[143].y, _616);
    float _634 = fma(_612, (*spvDescriptorSet0.vp_c9)._m0[143].z, _620);
    float _636 = in.m_73.x;
    float _638 = in.m_73.y;
    float _640 = in.m_73.z;
    float _642 = fma(_630, _434, _434);
    float _644 = fma(_292, _630, _292);
    float _646 = fma(_512, _490, _586);
    float _648 = fma(_428, _546, _632);
    float _650 = fma(_266, (*spvDescriptorSet0.vp_c9)._m0[196].z, _642);
    float _652 = fma(_342, _546, _634);
    float _654 = _646 * 0.15915493667125701904296875;
    float _656 = fma(_350, _546, _622);
    float _658 = fma(_644, _490, _650);
    float _660 = _614 * 6.283185482025146484375;
    float _662 = sin(_660);
    float _664 = fma(_460, _604, _648);
    float _666 = fma(_548, _604, _652);
    float _668 = _658 * 0.15915493667125701904296875;
    float _670 = fma(_544, _604, _656);
    float _672 = fma(_560, (*spvDescriptorSet0.vp_c9)._m0[146].y, _664);
    float _674 = in.m_60.x;
    float _676 = in.m_60.y;
    float _678 = in.m_60.z;
    float _680 = _614 * 6.283185482025146484375;
    float _682 = cos(_680);
    float _684 = fma(_560, (*spvDescriptorSet0.vp_c9)._m0[146].x, _670);
    float _686 = _672 * _626;
    float _688 = fma(_560, (*spvDescriptorSet0.vp_c9)._m0[146].z, _666);
    float _690 = _684 * _624;
    float _692 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _638);
    float _694 = _686 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _696 = _654 * 6.283185482025146484375;
    float _698 = sin(_696);
    float _700 = _688 * _628;
    float _702 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _636);
    float _704 = _690 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _706 = _692 * _694;
    float _708 = _700 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _710 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _640);
    float _712 = _702 * _704;
    float _714 = _654 * 6.283185482025146484375;
    float _716 = cos(_714);
    float _718 = _710 * _708;
    float _720 = _676 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _722 = _676 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _724 = _668 * 6.283185482025146484375;
    float _726 = cos(_724);
    float _728 = _682 * _698;
    float _730 = _662 * _698;
    float _732 = fma(_674, (*spvDescriptorSet0.vp_c10)._m0[4].x, _720);
    float _734 = fma(_674, (*spvDescriptorSet0.vp_c10)._m0[6].x, _722);
    float _736 = _676 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _738 = fma(_678, (*spvDescriptorSet0.vp_c10)._m0[4].z, _732);
    float _740 = _668 * 6.283185482025146484375;
    float _742 = sin(_740);
    float _744 = _682 * _716;
    float _746 = _662 * _716;
    float _748 = fma(_674, (*spvDescriptorSet0.vp_c10)._m0[5].x, _736);
    float _750 = fma(_678, (*spvDescriptorSet0.vp_c10)._m0[5].z, _748);
    float _752 = _682 * _726;
    float _754 = _716 * _726;
    float _756 = _662 * _726;
    float _758 = _698 * _726;
    float _760 = _752 * _706;
    float _762 = fma(_678, (*spvDescriptorSet0.vp_c10)._m0[6].z, _734);
    float _764 = _756 * _706;
    float _766 = _738 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _768 = fma(_742, _744, _730);
    float _770 = fma(_742, _730, _744);
    float _772 = -_728;
    float _774 = fma(_742, _746, _772);
    float _776 = -_706;
    float _778 = _742 * _776;
    float _780 = -_746;
    float _782 = fma(_742, _728, _780);
    float _784 = fma(_768, _712, _760);
    float _786 = fma(_774, _712, _764);
    float _788 = fma(_754, _712, _778);
    float _790 = _762 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _792 = fma(_782, _718, _784);
    float _794 = fma(_770, _718, _786);
    float _796 = fma(_758, _718, _788);
    float _798 = _792 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _800 = _792 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _802 = fma(_796, (*spvDescriptorSet0.vp_c10)._m0[8].x, _798);
    float _804 = fma(_796, (*spvDescriptorSet0.vp_c10)._m0[10].x, _800);
    float _806 = fma(_794, (*spvDescriptorSet0.vp_c10)._m0[8].z, _802);
    float _808 = fma(_794, (*spvDescriptorSet0.vp_c10)._m0[10].z, _804);
    float _810 = _750 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _812 = _766 + _806;
    float _814 = _790 + _808;
    float _816 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _818 = _812 + _816;
    float _820 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _822 = _814 + _820;
    float _824 = _818 * _818;
    float _826 = _822 * _822;
    float _828 = _824 + _826;
    float _830 = sqrt(_828);
    bool _832 = _830 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _834 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _836 = _830 + _834;
    float _838 = _792 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _840 = fma(_796, (*spvDescriptorSet0.vp_c10)._m0[9].x, _838);
    float _842 = fma(_794, (*spvDescriptorSet0.vp_c10)._m0[9].z, _840);
    float _844 = 0.0;
    float _846 = _840;
    float _848 = _796;
    float _850 = _812;
    float _852 = _814;
    float _854 = _824;
    float _856 = _826;
    float _858 = _790;
    if (_832)
    {
        float _860 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _844 = _860;
    }
    float _862 = _844;
    float _864 = _810 + _842;
    float _866 = _864;
    if (_832)
    {
        float _868 = _864 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _846 = _868;
    }
    float _870 = _846;
    float _872 = _870;
    if (_832)
    {
        float _874 = rsqrt(_828);
        _848 = _874;
    }
    float _876 = _848;
    float _878 = _862;
    if (_832)
    {
        float _880 = _836 * _862;
        _878 = _880;
    }
    float _882 = _878;
    float _884 = _882;
    if (_832)
    {
        float _886 = _882 * 0.15915493667125701904296875;
        _884 = _886;
    }
    float _888 = _884;
    float _890 = _674;
    if (_832)
    {
        float _892 = _888 * 6.283185482025146484375;
        float _894 = sin(_892);
        _890 = _894;
    }
    float _896 = _890;
    if (_832)
    {
        float _898 = fma(_896, _870, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _872 = _898;
    }
    float _900 = _872;
    float _902 = _900;
    if (_832)
    {
        float _904 = _876 * _900;
        _902 = _904;
    }
    float _906 = _902;
    if (_832)
    {
        float _908 = fma(_818, _906, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _850 = _908;
    }
    float _910 = _850;
    if (_832)
    {
        float _912 = fma(_822, _906, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _852 = _912;
    }
    float _914 = _852;
    float _916 = fma(_910, 6.2500002968590706586837768554688e-05, 0.5);
    float _918 = fma(_914, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _3957 = float2(_916, _918);
    float3 _922 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_3957, float2(0.0), isnan(_3957)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_3957, float2(0.0), isnan(_3957)), level(0.0)).xyz;
    float _924 = _922.x;
    float _926 = _922.y;
    float _928 = _922.z;
    float _930 = in.m_75.y;
    bool _932 = _638 != 0.0;
    bool _934 = isnan(_638);
    bool _936 = _932 || _934;
    bool _938 = isnan(0.0);
    bool _940 = _936 || _938;
    float _942 = _888;
    if (_832)
    {
        float _944 = _888 * 6.283185482025146484375;
        float _946 = cos(_944);
        _942 = _946;
    }
    float _948 = _942;
    int _950 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _952 = _950 != 0;
    float _954 = in.m_67.w;
    bool _956 = _636 == 0.0;
    bool _958 = !_940;
    bool _960 = _956 && _958;
    int _962 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _964 = _962 != 0;
    float _966 = in.m_77.x;
    float _968 = in.m_77.y;
    float _970 = in.m_77.z;
    bool _972 = _640 == 0.0;
    bool _974 = _972 && _960;
    float _976 = in.m_75.x;
    float _978 = _836;
    float _980 = 1.0;
    float _982 = 1.0;
    if (_952)
    {
        float _984 = in.m_67.z;
        _978 = _984;
    }
    float _986 = _978;
    out.m_79.x = 1.0;
    out.m_79.y = 1.0;
    out.m_79.z = 1.0;
    float _988 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _990 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _992 = -_930;
    float _994 = _992 + 1.0;
    float _996 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _998 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1000 = _988 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1002 = _954 > 0.5;
    float _1004 = _990 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1006 = _996 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1008 = _930;
    if (_964)
    {
        float _1010 = _1002 ? _994 : _930;
        _1008 = _1010;
    }
    float _1012 = _1008;
    float _1014 = 0.0;
    float _1016 = _966;
    float _1018 = _968;
    if (_974)
    {
        _1014 = _966;
    }
    float _1020 = _1014;
    out.m_81.x = _1000;
    out.m_81.y = _1004;
    out.m_81.z = _1006;
    out.m_81.w = _998;
    float _1022 = _1020;
    float _1024 = _976;
    if (!_952)
    {
        _980 = _976;
    }
    float _1026 = _980;
    float _1028 = 0.0;
    float _1030 = _1026;
    if (_974)
    {
        _1028 = _1020;
    }
    float _1032 = _1028;
    bool _1034 = _986 > 0.5;
    bool _1036 = _1034 && _952;
    float _1038 = in.m_83.x;
    float _1040 = in.m_83.y;
    float _1042 = in.m_83.z;
    float _1044 = in.m_83.w;
    float _1046 = _1032;
    if (!_974)
    {
        _1022 = _966;
    }
    float _1048 = _1022;
    if (_974)
    {
        _1016 = _968;
    }
    float _1050 = _1016;
    float _1052 = _1050;
    if (_974)
    {
        _982 = _970;
    }
    float _1054 = _982;
    float _1056 = _1054;
    if (!_974)
    {
        float _1058 = fma(_640, (*spvDescriptorSet0.vp_c9)._m0[17].y, _970);
        _1056 = _1058;
    }
    float _1060 = _1056;
    float _1062 = 0.0;
    if (_974)
    {
        _1062 = _1050;
    }
    float _1064 = _1062;
    float _1066 = _1064;
    if (!_974)
    {
        float _1068 = fma(_636, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1048);
        _1046 = _1068;
    }
    float _1070 = _1046;
    if (!_974)
    {
        _1052 = _968;
    }
    float _1072 = _1052;
    if (_952)
    {
        _1018 = _976;
    }
    float _1074 = _1018;
    float _1076 = _1074;
    if (!_974)
    {
        float _1078 = fma(_638, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1072);
        _1066 = _1078;
    }
    float _1080 = _1066;
    if (_1036)
    {
        float _1082 = -_1074;
        float _1084 = _1082 + 1.0;
        _1076 = _1084;
    }
    float _1086 = _1076;
    float _1088 = -_1080;
    float _1090 = _742 * _1088;
    float _1092 = _756 * _1080;
    if (_952)
    {
        _1030 = _1086;
    }
    float _1094 = _1030;
    float _1096 = fma(_754, _1070, _1090);
    float _1098 = fma(_774, _1070, _1092);
    float _1100 = _1042 * _1048;
    float _1102 = _1040 * _970;
    float _1104 = _1038 * _1072;
    float _1106 = fma(_758, _1060, _1096);
    float _1108 = -_1100;
    float _1110 = fma(_1038, _970, _1108);
    float _1112 = -_1102;
    float _1114 = fma(_1042, _1072, _1112);
    float _1116 = -_1104;
    float _1118 = fma(_1040, _1048, _1116);
    float _1120 = -_1040;
    float _1122 = _742 * _1120;
    float _1124 = _1110 * _1044;
    float _1126 = _752 * _1080;
    float _1128 = _1114 * _1044;
    float _1130 = _1118 * _1044;
    float _1132 = -_1124;
    float _1134 = _742 * _1132;
    float _1136 = _752 * _1040;
    float _1138 = _752 * _1124;
    float _1140 = _756 * _1040;
    float _1142 = _756 * _1124;
    float _1144 = fma(_768, _1070, _1126);
    float _1146 = fma(_754, _1128, _1134);
    float _1148 = fma(_768, _1128, _1138);
    float _1150 = fma(_754, _1038, _1122);
    float _1152 = fma(_768, _1038, _1136);
    float _1154 = fma(_774, _1038, _1140);
    float _1156 = fma(_774, _1128, _1142);
    float _1158 = fma(_782, _1060, _1144);
    float _1160 = fma(_758, _1042, _1150);
    float _1162 = fma(_782, _1042, _1152);
    float _1164 = fma(_770, _1042, _1154);
    float _1166 = fma(_758, _1130, _1146);
    float _1168 = fma(_782, _1130, _1148);
    float _1170 = fma(_770, _1130, _1156);
    float _1172 = _1158 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1174 = _1130;
    float _1176 = _1172;
    if (_832)
    {
        float _1178 = _948 + (-1.0);
        _1174 = _1178;
    }
    float _1180 = _1174;
    float _1182 = _1158 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1184 = _1158 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1186 = fma(_1106, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1172);
    float _1188 = _1180;
    float _1190 = _1182;
    if (_832)
    {
        float _1192 = _1180 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1176 = _1192;
    }
    float _1194 = _1176;
    float _1196 = fma(_770, _1060, _1098);
    float _1198 = fma(_1106, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1182);
    float _1200 = fma(_1106, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1184);
    float _1202 = _1162 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    if (_832)
    {
        float _1204 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1206 = _910 + _1204;
        _1188 = _1206;
    }
    float _1208 = _1188;
    if (_832)
    {
        float _1210 = fma(_864, _948, _1194);
        _866 = _1210;
    }
    float _1212 = _866;
    if (_832)
    {
        float _1214 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1216 = _914 + _1214;
        _1190 = _1216;
    }
    float _1218 = _1190;
    float _1220 = fma(_1160, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1202);
    if (_832)
    {
        float _1222 = _1208 * _1208;
        _854 = _1222;
    }
    float _1224 = _854;
    float _1226 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1228 = _1212 + _1226;
    float _1230 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    if (_832)
    {
        float _1232 = _1218 * _1218;
        _856 = _1232;
    }
    float _1234 = _856;
    float _1236 = _1162 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1238 = fma(_1228, _1228, _1224);
    float _1240 = _1162 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1242 = _1168 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1244 = fma(_1160, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1236);
    float _1246 = _1238 + _1234;
    float _1248 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1250 = fma(_1160, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1240);
    float _1252 = _1168 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1254 = _1168 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1256 = _1012 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1258 = fma(_1166, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1242);
    float _1260 = fma(_1166, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1252);
    float _1262 = _1094 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1264 = sqrt(_1246);
    float _1266 = fma(_1166, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1254);
    float _1268 = _1256 * _1230;
    float _1270 = fma(_1164, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1220);
    float _1272 = fma(_1164, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1244);
    float _1274 = fma(_1170, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1258);
    float _1276 = fma(_1170, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1260);
    float _1278 = fma(_1196, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1186);
    float _1280 = _1262 * _1248;
    float _1282 = fma(_1164, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1250);
    float _1284 = fma(_1170, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1266);
    float _1286 = fma(_1196, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1198);
    float _1288 = fma(_1196, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1200);
    out.m_85.z = _1280;
    out.m_85.w = _1268;
    bool _1290 = _1264 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1292 = isnan(_1264);
    bool _1294 = _1290 || _1292;
    bool _1296 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1298 = _1294 || _1296;
    out.m_87.x = _1270;
    out.m_87.y = _1272;
    out.m_87.z = _1282;
    out.m_89.x = _1274;
    out.m_89.y = _1276;
    out.m_89.z = _1284;
    out.m_91.x = _1278;
    out.m_91.y = _1286;
    out.m_91.z = _1288;
    float _1300 = _1262;
    if (!_1298)
    {
        _1300 = 1.0;
    }
    float _1302 = _1300;
    out.m_93.x = _924;
    out.m_93.y = _926;
    out.m_93.z = _928;
    bool _1304 = !_1298;
    float _1306 = _1302;
    if (!_1304)
    {
        bool _1308 = _1264 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1310 = isnan(_1264);
        bool _1312 = _1308 || _1310;
        bool _1314 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1316 = _1312 || _1314;
        if (!_1316)
        {
            float _1318 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1320 = _1264 + _1318;
            float _1322 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1324 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1322;
            float _1326 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1328 = _1326 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1330 = 1.0 / _1324;
            float _1332 = _1320 * _1330;
            float _1334 = fma(_1332, _1328, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1306 = _1334;
            _1336 = true;
        }
        else
        {
            bool _1338 = _1264 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1340 = isnan(_1264);
            bool _1342 = _1338 || _1340;
            bool _1344 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1346 = _1342 || _1344;
            if (!_1346)
            {
                float _1348 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1350 = _1264 + _1348;
                float _1352 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1354 = _1352 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1356 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1358 = _1356 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1360 = 1.0 / _1354;
                float _1362 = _1350 * _1360;
                float _1364 = fma(_1362, _1358, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1306 = _1364;
                _1336 = true;
            }
            else
            {
                _1306 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1336 = false;
    float _1366 = _1306;
    float _1368 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1370 = _1212 + _1368;
    float _1372 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1374 = _910 + _1372;
    float _1376 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1378 = _914 + _1376;
    float _1380 = _810 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1382 = fma(_1370, _1366, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1384 = fma(_1374, _1366, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1386 = fma(_1378, _1366, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1388 = fma(_766, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1380);
    float _1390 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1392 = _1382 + _1390;
    float _1394 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1396 = _1384 + _1394;
    float _1398 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1400 = _1386 + _1398;
    float _1402 = _1392 * _1392;
    float _1404 = fma(_1396, _1396, _1402);
    float _1406 = fma(_1400, _1400, _1404);
    float _1408 = fma(_790, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1388);
    float _1410 = _810 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1412 = fma(_766, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1414 = rsqrt(_1406);
    float _1416 = _1408 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1418 = fma(_766, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1410);
    float _1420 = fma(_790, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1422 = fma(_790, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1418);
    float _1424 = 1.0 / _1416;
    float _1426 = _1422 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1428 = _1426 + _1416;
    float _1430 = _1414 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1432 = floor(_1412);
    float _1434 = _1396 * _1430;
    float _1436 = _1400 * _1430;
    float _1438 = _1434 * _1434;
    float _1440 = _1436 * _1436;
    float _1442 = _1428 * _1424;
    float _1444 = _1442 * 0.5;
    float _1446 = sqrt(_1406);
    float _1448 = _1438 + _1440;
    float _1450 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1452 = fma(_1444, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1450);
    float _1454 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _1456 = -_1432;
    float _1458 = _1412 + _1456;
    float _1460 = sqrt(_1448);
    float _1462 = _810 + _1454;
    float _1464 = _1462 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1466 = _1462 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1468 = 1.0 / _1452;
    float _1470 = fma(_766, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1464);
    float _1472 = fma(_766, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1466);
    float _1474 = fma(_790, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1470);
    float _1476 = fma(_790, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1472);
    bool _1478 = _1460 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1480 = _1474 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1482 = _1476 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1484 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1486 = _1460 + _1484;
    float _1488 = floor(_1420);
    float _1490 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1492 = _1468 * _1490;
    float _1494 = trunc(_1480);
    int _1496 = int(_1494);
    bool _1498 = _1492 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1500 = _1492 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1502 = _810;
    int _1504 = 2;
    float _1506 = _1486;
    float _1508 = _1448;
    float _1510 = _1430;
    float _1512 = _1434;
    float _1514 = _1438;
    if (_1478)
    {
        float _1516 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1502 = _1516;
    }
    float _1518 = _1502;
    float _1520 = -_1488;
    float _1522 = _1420 + _1520;
    if (!_1498)
    {
        _1504 = 1;
    }
    int _1524 = _1504;
    float _1526 = trunc(_1482);
    int _1528 = int(_1526);
    int _1530 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1532 = _1496 + _1530;
    int _1534 = _1532 + 1;
    int _1536 = _1524;
    if (_1478)
    {
        float _1538 = _1486 * _1518;
        _1506 = _1538;
    }
    float _1540 = _1506;
    if (_1478)
    {
        float _1542 = rsqrt(_1448);
        _1508 = _1542;
    }
    float _1544 = _1508;
    float _1546 = 0.0;
    float _1548 = _1544;
    if (_1478)
    {
        float _1550 = _1540 * 0.15915493667125701904296875;
        _1546 = _1550;
    }
    float _1552 = _1546;
    bool _1554 = !_1498;
    int _1556 = _1554 ? 0 : 1;
    float _1558 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    int _1560 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1562 = _1528 + _1560;
    int _1564 = _1562 + 1;
    float _1566 = _1476;
    if (_1478)
    {
        float _1568 = _1552 * 6.283185482025146484375;
        float _1570 = sin(_1568);
        _1566 = _1570;
    }
    float _1572 = _1566;
    if (!_1500)
    {
        _1536 = _1556;
    }
    int _1574 = _1536;
    float _1576 = precise::max(0.0, _1558);
    int _1578 = _1574 << 6;
    bool _1580 = _1534 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1582 = -_1430;
    float _1584 = -_1576;
    float _1586 = fma(_1392, _1582, _1584);
    int _1588 = _1578 + 96;
    uint _1591 = uint(int(uint(_1588) >> uint(2)));
    uint _1593 = uint(int(uint(int(_1591)) >> uint(2)));
    int _1595 = int(_1591) & 3;
    float _1597 = (*spvDescriptorSet0.vp_c15)._m0[int(_1593)][_1595];
    int _1599 = int(_1591) + 1;
    uint _1601 = uint(int(uint(_1599) >> uint(2)));
    int _1603 = _1599 & 3;
    float _1605 = (*spvDescriptorSet0.vp_c15)._m0[int(_1601)][_1603];
    int _1607 = _1534 | _1564;
    float _1609 = _1552;
    float _1611 = as_type<float>(_1607);
    float _1613 = _1586;
    if (_1478)
    {
        float _1615 = _1552 * 6.283185482025146484375;
        float _1617 = cos(_1615);
        _1609 = _1617;
    }
    float _1619 = _1609;
    if (_1478)
    {
        float _1621 = _1586 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1510 = _1621;
    }
    float _1623 = _1510;
    bool _1625 = _1607 < 0;
    bool _1627 = _1625 || _1580;
    if (_1478)
    {
        float _1629 = fma(_1572, _1623, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1611 = _1629;
    }
    float _1631 = _1611;
    int _1633 = _1578 + 48;
    uint _1635 = uint(int(uint(_1633) >> uint(2)));
    uint _1637 = uint(int(uint(int(_1635)) >> uint(2)));
    int _1639 = int(_1635) & 3;
    float _1641 = (*spvDescriptorSet0.vp_c15)._m0[int(_1637)][_1639];
    int _1643 = int(_1635) + 1;
    uint _1645 = uint(int(uint(_1643) >> uint(2)));
    int _1647 = _1643 & 3;
    float _1649 = (*spvDescriptorSet0.vp_c15)._m0[int(_1645)][_1647];
    float _1651 = _1382 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    bool _1653 = _1564 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1655 = _1653 || _1627;
    float _1657 = 0.0;
    if (_1478)
    {
        float _1659 = _1544 * _1631;
        _1657 = _1659;
    }
    float _1661 = _1657;
    float _1663 = fma(_1384, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1651);
    if (_1478)
    {
        float _1665 = _1434 * _1661;
        _1512 = _1665;
    }
    float _1667 = _1512;
    int _1669 = _1578 + 104;
    uint _1671 = uint(int(uint(_1669) >> uint(2)));
    uint _1673 = uint(int(uint(int(_1671)) >> uint(2)));
    int _1675 = int(_1671) & 3;
    float _1677 = (*spvDescriptorSet0.vp_c15)._m0[int(_1673)][_1675];
    int _1679 = int(_1671) + 1;
    uint _1681 = uint(int(uint(_1679) >> uint(2)));
    int _1683 = _1679 & 3;
    float _1685 = (*spvDescriptorSet0.vp_c15)._m0[int(_1681)][_1683];
    float _1687 = fma(_1386, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1663);
    float _1689 = _1619;
    if (_1478)
    {
        float _1691 = _1619 + (-1.0);
        _1548 = _1691;
    }
    float _1693 = _1548;
    float _1695 = _1693;
    if (_1478)
    {
        float _1697 = _1667 * _1667;
        _1514 = _1697;
    }
    float _1699 = _1514;
    float _1701 = 0.0;
    if (_1478)
    {
        float _1703 = _1693 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1701 = _1703;
    }
    float _1705 = _1701;
    if (!_1478)
    {
        _1695 = _1436;
    }
    float _1707 = _1695;
    int _1709 = _1578 + 64;
    uint _1711 = uint(int(uint(_1709) >> uint(2)));
    uint _1713 = uint(int(uint(int(_1711)) >> uint(2)));
    int _1715 = int(_1711) & 3;
    float _1717 = (*spvDescriptorSet0.vp_c15)._m0[int(_1713)][_1715];
    int _1719 = int(_1711) + 1;
    uint _1721 = uint(int(uint(_1719) >> uint(2)));
    int _1723 = _1719 & 3;
    float _1725 = (*spvDescriptorSet0.vp_c15)._m0[int(_1721)][_1723];
    float _1727 = _1707;
    if (_1478)
    {
        float _1729 = _1436 * _1661;
        _1727 = _1729;
    }
    float _1731 = _1727;
    if (_1478)
    {
        float _1733 = fma(_1586, _1619, _1705);
        _1613 = _1733;
    }
    float _1735 = _1613;
    float _1737 = _1687 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    if (!_1478)
    {
        _1689 = _1440;
    }
    float _1739 = _1689;
    float _1741 = _1739;
    if (_1478)
    {
        float _1743 = _1731 * _1731;
        _1741 = _1743;
    }
    float _1745 = _1741;
    float _1747 = fma(_1735, _1735, _1699);
    float _1749 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    int _1751 = _1578 + 80;
    uint _1753 = uint(int(uint(_1751) >> uint(2)));
    uint _1755 = uint(int(uint(int(_1753)) >> uint(2)));
    int _1757 = int(_1753) & 3;
    float _1759 = (*spvDescriptorSet0.vp_c15)._m0[int(_1755)][_1757];
    int _1761 = int(_1753) + 1;
    uint _1763 = uint(int(uint(_1761) >> uint(2)));
    int _1765 = _1761 & 3;
    float _1767 = (*spvDescriptorSet0.vp_c15)._m0[int(_1763)][_1765];
    float _1769 = _1737 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1771 = _1747 + _1745;
    int _1773 = as_type<int>(_1769);
    if (!_1655)
    {
        float _1775 = floor(_1482);
        _1024 = _1775;
    }
    float _1777 = _1024;
    float _1779 = -_1769;
    float _1781 = fma(_1779, _1749, 1.0);
    if (!_1655)
    {
        int _1783 = _1564 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1785 = _1783 + _1534;
        _1773 = _1785;
    }
    int _1787 = _1773;
    int _1789 = _1578 + 56;
    uint _1791 = uint(int(uint(_1789) >> uint(2)));
    uint _1793 = uint(int(uint(int(_1791)) >> uint(2)));
    int _1795 = int(_1791) & 3;
    float _1797 = (*spvDescriptorSet0.vp_c15)._m0[int(_1793)][_1795];
    int _1799 = int(_1791) + 1;
    uint _1801 = uint(int(uint(_1799) >> uint(2)));
    int _1803 = _1799 & 3;
    float _1805 = (*spvDescriptorSet0.vp_c15)._m0[int(_1801)][_1803];
    float _1807 = log2(_1781);
    int _1809 = _1578 + 88;
    uint _1811 = uint(int(uint(_1809) >> uint(2)));
    uint _1813 = uint(int(uint(int(_1811)) >> uint(2)));
    int _1815 = int(_1811) & 3;
    float _1817 = (*spvDescriptorSet0.vp_c15)._m0[int(_1813)][_1815];
    int _1819 = int(_1811) + 1;
    uint _1821 = uint(int(uint(_1819) >> uint(2)));
    int _1823 = _1819 & 3;
    float _1825 = (*spvDescriptorSet0.vp_c15)._m0[int(_1821)][_1823];
    float _1827 = _1462 * _1605;
    float _1829 = fma(_766, _1597, _1827);
    int _1831 = _1578 + 72;
    uint _1833 = uint(int(uint(_1831) >> uint(2)));
    uint _1835 = uint(int(uint(int(_1833)) >> uint(2)));
    int _1837 = int(_1833) & 3;
    float _1839 = (*spvDescriptorSet0.vp_c15)._m0[int(_1835)][_1837];
    int _1841 = int(_1833) + 1;
    uint _1843 = uint(int(uint(_1841) >> uint(2)));
    int _1845 = _1841 & 3;
    float _1847 = (*spvDescriptorSet0.vp_c15)._m0[int(_1843)][_1845];
    float _1849 = _1462 * _1649;
    float _1851 = rsqrt(_1771);
    float _1853 = _1807 * 0.693147182464599609375;
    float _1855 = fma(_766, _1641, _1849);
    int _1857 = as_type<int>(_1849);
    int _1859 = as_type<int>(_1597);
    if (!_1655)
    {
        int _1861 = _1787 << 2;
        _1857 = _1861;
    }
    int _1863 = _1857;
    float _1865 = fma(_790, _1677, _1829);
    int _1867 = _1863;
    if (!_1655)
    {
        int _1869 = 12 & _1863;
        _1867 = _1869;
    }
    int _1871 = _1867;
    float _1873 = _1865 + _1685;
    float2 _5592 = float2(_1458, _1522);
    float _1875 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5592, float2(0.0), isnan(_5592)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5592, float2(0.0), isnan(_5592)), level(0.0)).x;
    float _1877 = _1853 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1879 = _1462 * _1725;
    float _1881 = _1725;
    int _1883 = as_type<int>(_1767);
    if (!_1655)
    {
        float _1885 = -_1777;
        float _1887 = _1482 + _1885;
        _1881 = _1887;
    }
    float _1889 = _1881;
    float _1891 = 1.0 / _1873;
    float _1893 = _1851 * _1667;
    float _1895 = fma(_766, _1717, _1879);
    float _1897 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1899 = fma(_1446, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1897);
    float _1901 = precise::clamp(_1899, 0.0, 1.0);
    float _1903 = _1851 * _1735;
    float _1905 = _1893 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1907 = _1462 * _1767;
    if (!_1655)
    {
        uint _1909 = uint(int(uint(_1787) >> uint(2)));
        _1883 = int(_1909);
    }
    int _1911 = _1883;
    float _1913 = _1851 * _1731;
    float _1915 = fma(_766, _1759, _1907);
    float _1917 = -_1901;
    float _1919 = _1917 + 1.0;
    if (!_1655)
    {
        int _1921 = _1911 << 4;
        int _1923 = _1921 + _1871;
        _1859 = _1923;
    }
    int _1925 = _1859;
    float _1927 = fma(_790, _1797, _1855);
    float _1929 = _1901;
    float _1931 = as_type<float>(_1925);
    if (!_1655)
    {
        int _1933 = _1925 + 400;
        uint _1935 = uint(int(uint(_1933) >> uint(2)));
        uint _1937 = uint(int(uint(int(_1935)) >> uint(2)));
        int _1939 = int(_1935) & 3;
        float _1941 = (*spvDescriptorSet0.vp_c15)._m0[int(_1937)][_1939];
        _1929 = _1941;
    }
    float _1943 = _1929;
    float _1945 = abs(_1919);
    float _1947 = log2(_1945);
    float _1949 = _1927 + _1805;
    float _1951 = _1382 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1953 = fma(_790, _1817, _1915);
    float _1955 = -_1905;
    float _1957 = fma(_1903, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1955);
    float _1959 = _1382 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1961 = fma(_1384, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1951);
    float _1963 = -_1913;
    float _1965 = fma(_1963, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1957);
    float _1967 = fma(_1384, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1959);
    float _1969 = _1949 * _1891;
    float _1971 = fma(_790, _1839, _1895);
    float _1973 = fma(_1965, -0.5, 0.5);
    float _1975 = fma(_1386, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1967);
    float _1977 = fma(_1965, 0.5, 0.5);
    float _1979 = _1971 + _1847;
    float _1981 = _1382 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    bool _1983 = _1969 >= 0.0;
    float _1985 = fma(_1386, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1961);
    float _1987 = _1979 * _1891;
    float _1989 = fma(_1384, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1981);
    bool _1991 = _1969 <= 1.0;
    bool _1993 = _1991 && _1983;
    float _1995 = _1985 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1997 = _1947 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1999 = fma(_1386, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1989);
    bool _2001 = _1987 >= 0.0;
    bool _2003 = _2001 && _1993;
    float _2005 = _1995 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2007 = exp2(_1997);
    float _2009 = _1999 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    bool _2011 = _1987 <= 1.0;
    bool _2013 = _2011 && _2003;
    float _2015 = _1975 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2017 = _1953 + _1825;
    float _2019 = fma(_2009, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2005);
    float _2021 = _1995 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2023 = _1903 + 1.0;
    float _2025 = sqrt(_1973);
    float _2027 = fma(_1737, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2019);
    float _2029 = fma(_2009, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2021);
    float _2031 = _2017 * _1891;
    float _2033 = fma(_1977, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2035 = fma(_2015, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2027);
    if (_2013)
    {
        float _2037 = float(_1574);
        _1931 = _2037;
    }
    float _2039 = _1931;
    float _2041 = -_1903;
    float _2043 = fma(_2007, _2023, _2041);
    float _2045 = fma(_1977, _2033, -0.212114393711090087890625);
    float _2047 = 1.0 / _2035;
    float _2049 = _1995 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2051 = fma(_2043, 0.5, 0.5);
    float _2053 = fma(_1977, _2045, 1.570728778839111328125);
    float _2055 = fma(_1737, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2029);
    float _2057 = fma(_2009, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2049);
    float _2059 = _2025 * 0.636619746685028076171875;
    float _2061 = _2039;
    float _2063 = _2057;
    if (_2013)
    {
        float _2065 = rint(_2039);
        float _2067 = precise::max(_2065, 0.0);
        uint _2069 = uint(_2067);
        uint _2071 = clamp(_2069, 0u, 65535u);
        _2061 = as_type<float>(_2071);
    }
    float _2073 = _2061;
    float _2075 = fma(_1737, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2057);
    float _2077 = fma(_2015, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2055);
    float _2079 = -_2053;
    float _2081 = fma(_2059, _2079, 1.0);
    float _2083 = fma(_2015, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2075);
    float _2085 = _1913;
    if (!_1655)
    {
        float _2087 = floor(_1480);
        _2085 = _2087;
    }
    float _2089 = _2085;
    float _2091 = _2077 * _2047;
    float _2093 = _2083 * _2047;
    float _2095 = fma(_2091, 0.5, 0.5);
    float _2097 = fma(_2093, -0.5, 0.5);
    float _2099 = _2073;
    if (_2013)
    {
        float3 _5981 = float3(_1969, _1987, float(as_type<int>(_2073)));
        float3 _5985 = select(_5981, float3(0.0), isnan(_5981));
        float _2101 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5985.xy, uint(rint(_5985.z)), _2031, level(0.0));
        _2099 = _2101;
    }
    float _2103 = _2099;
    float _2105 = _2093;
    if (!_1655)
    {
        float _2107 = rint(_1943);
        float _2109 = precise::max(_2107, 0.0);
        uint _2111 = uint(_2109);
        uint _2113 = clamp(_2111, 0u, 65535u);
        _2105 = as_type<float>(_2113);
    }
    float _2115 = _2105;
    float3 _6011 = float3(_2095, _2097, _1877);
    float _2117 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6011, float3(0.0), isnan(_6011)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6011, float3(0.0), isnan(_6011)), level(0.0)).x;
    if (!_1655)
    {
        float _2119 = -_2089;
        float _2121 = _1480 + _2119;
        _2063 = _2121;
    }
    float _2123 = _2063;
    float3 _6031 = float3(_2095, _2097, _1877);
    float4 _2126 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6031, float3(0.0), isnan(_6031)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6031, float3(0.0), isnan(_6031)), level(0.0)).xyzw;
    float _2128 = _2126.x;
    float _2130 = _2126.y;
    float _2132 = _2126.z;
    float _2134 = _2126.w;
    float2 _6047 = float2(_2081, _2051);
    float3 _2136 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6047, float2(0.0), isnan(_6047)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6047, float2(0.0), isnan(_6047)), level(0.0)).xyz;
    float _2138 = _2136.x;
    float _2140 = _2136.y;
    float _2142 = _2136.z;
    float _2144 = _2115;
    if (!_1655)
    {
        float3 _6068 = float3(_2123, _1889, float(as_type<int>(_2115)));
        float3 _6070 = select(_6068, float3(0.0), isnan(_6068));
        float _2146 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6070.xy, uint(rint(_6070.z)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6070.xy, uint(rint(_6070.z)), level(0.0)).x;
        _2144 = _2146;
    }
    float _2148 = _2144;
    float _2150 = abs(_1492);
    float _2152 = log2(_2150);
    float _2154 = _1995 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2156 = fma(_2009, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2154);
    float _2158 = fma(_1737, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2156);
    float _2160 = _1947 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2162 = fma(_2015, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2158);
    float _2164 = _2152 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2166 = _2162 + _2035;
    float _2168 = exp2(_2160);
    bool _2170 = _1492 <= 8000.0;
    bool _2172 = isnan(_1492);
    bool _2174 = _2170 || _2172;
    bool _2176 = isnan(8000.0);
    bool _2178 = _2174 || _2176;
    float _2180 = float(_2178);
    float _2182 = _2166 * 0.5;
    float _2184 = exp2(_2164);
    out.m_95.z = _2182;
    out.m_95.w = _2035;
    float _2186 = fma(_2184, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2188 = precise::clamp(_2186, 0.0, 1.0);
    float _2190 = fma(_2188, -2.0, 3.0);
    float _2192 = _2188 * _2188;
    float _2194 = _2192 * _2190;
    float _2196 = -_2194;
    float _2198 = _2196 + 1.0;
    out.gl_Position.x = _2077;
    out.gl_Position.y = _2083;
    out.gl_Position.z = _2162;
    out.gl_Position.w = _2035;
    float _2200 = fma(_2198, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2194);
    float _2202 = _2180 * _2200;
    float _2204 = _2200;
    float _2206 = _2162;
    float _2208 = _2077;
    if (!_2013)
    {
        _2204 = 1.0;
    }
    float _2210 = _2204;
    float _2212 = _2202 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2214 = -_2168;
    float _2216 = _2214 + 1.0;
    float _2218 = _2216 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2220 = _2216;
    float _2222 = _2210;
    if (_1655)
    {
        _2220 = 1.0;
    }
    float _2224 = _2220;
    float _2226 = -_1875;
    float _2228 = _2226 + 1.0;
    float _2230 = _2228 * _2212;
    float _2232 = precise::clamp(_2230, 0.0, 1.0);
    float _2234 = _2224;
    if (_2013)
    {
        bool _2236 = _2103 >= _2031;
        bool _2238 = isnan(_2103);
        bool _2240 = _2236 || _2238;
        bool _2242 = isnan(_2031);
        bool _2244 = _2240 || _2242;
        float _2246 = float(_2244);
        _2222 = _2246;
    }
    float _2248 = _2222;
    if (!_1655)
    {
        int _2250 = _1787 << 4;
        int _2252 = _2250 + 2048;
        uint _2254 = uint(int(uint(_2252) >> uint(2)));
        uint _2256 = uint(int(uint(int(_2254)) >> uint(2)));
        int _2258 = int(_2254) & 3;
        float _2260 = (*spvDescriptorSet0.vp_c15)._m0[int(_2256)][_2258];
        int _2262 = int(_2254) + 1;
        uint _2264 = uint(int(uint(_2262) >> uint(2)));
        int _2266 = _2262 & 3;
        float _2268 = (*spvDescriptorSet0.vp_c15)._m0[int(_2264)][_2266];
        int _2270 = _2252 + 8;
        uint _2272 = uint(int(uint(_2270) >> uint(2)));
        uint _2274 = uint(int(uint(int(_2272)) >> uint(2)));
        int _2276 = int(_2272) & 3;
        float _2278 = (*spvDescriptorSet0.vp_c15)._m0[int(_2274)][_2276];
        int _2280 = int(_2272) + 1;
        uint _2282 = uint(int(uint(_2280) >> uint(2)));
        int _2284 = _2280 & 3;
        float _2286 = (*spvDescriptorSet0.vp_c15)._m0[int(_2282)][_2284];
        float _2288 = _1462 * _2268;
        float _2290 = fma(_766, _2260, _2288);
        float _2292 = fma(_790, _2278, _2290);
        float _2294 = _2292 + _2286;
        float _2296 = precise::clamp(_2294, 0.0, 1.0);
        float _2298 = -_2296;
        float _2300 = _2298 + _2148;
        float _2302 = fma(_2300, 500.0, 1.5);
        float _2304 = exp2(_2302);
        float _2306 = 0.0 + _2304;
        float _2308 = precise::clamp(_2306, 0.0, 1.0);
        _2234 = _2308;
        _2206 = _2260;
    }
    float _2310 = _2234;
    float _2312 = _2206;
    float _2314 = _2248 * _2310;
    float _2316 = -_2232;
    float _2318 = fma(_2316, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2320 = _2218 * _2117;
    out.m_97.x = _1384;
    out.m_97.y = _1382;
    out.m_97.z = _1386;
    bool _2322 = _1446 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2324 = isnan(_1446);
    bool _2326 = _2322 || _2324;
    bool _2328 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2330 = _2326 || _2328;
    float _2332 = -_2314;
    float _2334 = fma(_2332, _2318, 1.0);
    float _2336 = precise::clamp(_2334, 0.0, 1.0);
    float _2338 = _2134 * _2320;
    float _2340 = -_2218;
    float _2342 = _2340 + 1.0;
    float _2344 = _2142 * _2320;
    float _2346 = _2336 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2348 = fma(_2138, _2338, _2128);
    float _2350 = fma(_2140, _2338, _2130);
    float _2352 = _2134 * _2342;
    float _2354 = fma(_2134, _2344, _2132);
    out.m_99.x = _2346;
    float _2356 = _2312;
    float _2358 = _2338;
    float _2360 = _2342;
    float _2362 = _2336;
    if (!_2330)
    {
        _2356 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2364 = _2356;
    out.m_101.x = _2348;
    out.m_101.y = _2350;
    out.m_101.z = _2354;
    out.m_101.w = _2352;
    float _2366 = _2364;
    float _2368 = _2364;
    if (!_2330)
    {
        _858 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2370 = _858;
    float _2372 = _2370;
    float _2374 = _2370;
    if (!_2330)
    {
        _2208 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2376 = _2208;
    float _2378 = _2376;
    float _2380 = _2376;
    if (!_2330)
    {
        _2358 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2382 = _2358;
    float _2384 = _2382;
    float _2386 = _2382;
    if (!_2330)
    {
        _2360 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2388 = _2360;
    float _2390 = _2388;
    float _2392 = _2388;
    if (!_2330)
    {
        _2362 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2394 = _2362;
    bool _2396 = !_2330;
    float _2398 = _2394;
    float _2400 = _2394;
    if (!_2396)
    {
        bool _2402 = _1446 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2404 = isnan(_1446);
        bool _2406 = _2402 || _2404;
        bool _2408 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2410 = _2406 || _2408;
        if (!_2410)
        {
            float _2412 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2414 = _1446 + _2412;
            float _2416 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2418 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2416;
            float _2420 = 1.0 / _2418;
            float _2422 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2424 = _2422 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2426 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2428 = _2426 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2430 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2432 = _2430 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2434 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2436 = _2434 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2438 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2440 = _2438 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2442 = _2414 * _2420;
            float _2444 = precise::clamp(_2442, 0.0, 1.0);
            float _2446 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2448 = _2446 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2450 = fma(_2444, _2424, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2452 = fma(_2444, _2448, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2454 = fma(_2444, _2428, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2456 = fma(_2444, _2432, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2458 = fma(_2444, _2436, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2460 = fma(_2444, _2440, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2374 = _2452;
            _2392 = _2458;
            _2368 = _2450;
            _2386 = _2456;
            _2380 = _2454;
            _2400 = _2460;
            _2462 = true;
        }
        else
        {
            bool _2464 = _1446 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2466 = isnan(_1446);
            bool _2468 = _2464 || _2466;
            bool _2470 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2472 = _2468 || _2470;
            if (!_2472)
            {
                _2366 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2474 = _2366;
            _2368 = _2474;
            if (!_2472)
            {
                _2372 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2476 = _2372;
            _2374 = _2476;
            if (!_2472)
            {
                _2378 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2478 = _2378;
            _2380 = _2478;
            if (!_2472)
            {
                _2384 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2480 = _2384;
            _2386 = _2480;
            if (!_2472)
            {
                _2390 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2482 = _2390;
            _2392 = _2482;
            if (!_2472)
            {
                _2398 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2484 = _2398;
            bool _2486 = !_2472;
            _2400 = _2484;
            if (!_2486)
            {
                bool _2488 = _1446 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2490 = isnan(_1446);
                bool _2492 = _2488 || _2490;
                bool _2494 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2496 = _2492 || _2494;
                if (!_2496)
                {
                    float _2498 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2500 = _1446 + _2498;
                    float _2502 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2504 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2502;
                    float _2506 = 1.0 / _2504;
                    float _2508 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2510 = _2508 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2512 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2514 = _2512 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2516 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2518 = _2516 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2520 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2522 = _2520 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2524 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2526 = _2524 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2528 = _2500 * _2506;
                    float _2530 = precise::clamp(_2528, 0.0, 1.0);
                    float _2532 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2534 = _2532 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2536 = fma(_2530, _2510, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2538 = fma(_2530, _2534, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2540 = fma(_2530, _2514, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2542 = fma(_2530, _2518, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2544 = fma(_2530, _2522, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2546 = fma(_2530, _2526, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2374 = _2538;
                    _2392 = _2544;
                    _2368 = _2536;
                    _2386 = _2542;
                    _2380 = _2540;
                    _2400 = _2546;
                    _2462 = true;
                }
                else
                {
                    _2374 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2392 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2368 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2386 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2380 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2400 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2462 = false;
    float _2548 = _2374;
    float _2550 = _2392;
    float _2552 = _2368;
    float _2554 = _2386;
    float _2556 = _2380;
    float _2558 = _2400;
    float _2560 = fma(_1286, -0.5, 0.5);
    float _2562 = precise::clamp(_2560, 0.0, 1.0);
    float _2564 = -_2548;
    float _2566 = _2564 + _2550;
    float _2568 = -_2552;
    float _2570 = _2568 + _2554;
    float _2572 = -_2556;
    float _2574 = _2572 + _2558;
    bool _2576 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2578 = fma(_2562, _2566, _2548);
    float _2580 = fma(_2562, _2570, _2552);
    float _2582 = fma(_2562, _2574, _2556);
    float _2584 = _2578 * 0.586610972881317138671875;
    out.m_63.x = 1.0;
    float _2586 = fma(_2580, 0.298911988735198974609375, _2584);
    float _2588 = fma(_2582, 0.114477999508380889892578125, _2586);
    out.m_103.x = 0.0;
    float _2590 = -_2588;
    float _2592 = _2580 + _2590;
    float _2594 = -_2588;
    float _2596 = _2578 + _2594;
    float _2598 = -_2588;
    float _2600 = _2582 + _2598;
    float _2602 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2604 = fma(_2592, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2588);
    float _2606 = fma(_2596, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2588);
    float _2608 = fma(_2600, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2588);
    out.m_99.w = _2602;
    out.m_105.x = _2604;
    out.m_105.y = _2606;
    out.m_105.z = _2608;
    if (!_2576)
    {
        return out;
    }
    float _2610 = -_1382;
    float _2612 = _2610 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2614 = -_1384;
    float _2616 = _2614 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2618 = -_1386;
    float _2620 = _2618 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2622 = _2612 * _2612;
    float _2624 = fma(_2616, _2616, _2622);
    float _2626 = fma(_2620, _2620, _2624);
    float _2628 = sqrt(_2626);
    float _2630 = rsqrt(_2626);
    float _2632 = -_2628;
    float _2634 = _2632 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2636 = _2634 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2638 = precise::clamp(_2636, 0.0, 1.0);
    float _2640 = _2616 * _2630;
    float _2642 = _2612 * _2630;
    float _2644 = abs(_2638);
    float _2646 = log2(_2644);
    float _2648 = _2620 * _2630;
    float _2650 = _2640 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2652 = _1286 * _2642;
    float _2654 = -_2642;
    float _2656 = -_2650;
    float _2658 = fma(_2654, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2656);
    float _2660 = fma(_1278, _2640, _2652);
    float _2662 = -_2648;
    float _2664 = fma(_2662, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2658);
    float _2666 = fma(_1288, _2648, _2660);
    float _2668 = precise::clamp(_2666, 0.0, 1.0);
    float _2670 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2672 = _2664 + _2670;
    float _2674 = _2646 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2676 = _2672 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2678 = precise::clamp(_2676, 0.0, 1.0);
    float _2680 = exp2(_2674);
    float _2682 = _2680 * _2678;
    float _2684 = _2668 * _2682;
    float _2686 = _2684 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2688 = _2684 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2690 = _2684 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_103.x = _2686;
    out.m_103.y = _2688;
    out.m_103.z = _2690;
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
    bool _2462 = false;
    bool _1336 = false;
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
        float _2746 = as_type<float>(_138);
        out.gl_Position.z = _2746;
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
        float _2816 = as_type<float>(_178);
        out.gl_Position.z = _2816;
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
    float _218 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _220 = _210 + _218;
    float _222 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _224 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _222;
    float _226 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _228 = _226 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    int _230 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _232 = _230 != 0;
    int _234 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _236 = _234 != 0;
    int _238 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _240 = _238 != 0;
    float _242 = 1.0 / _224;
    float _244 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _246 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _244;
    float _248 = 1.0 / _228;
    float _250 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _252 = _210 + _250;
    bool _254 = !_236;
    int _256 = _254 ? 0 : 1;
    float _258 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _260 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _258;
    float _262 = _212 + _216;
    float _264 = _214 + _216;
    float _266 = _216 + (-0.5);
    float _268 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _270 = _210 + _268;
    float _272 = _216 * 2.0;
    float _274 = _214 + _212;
    float _276 = _212 + (-0.5);
    float _278 = _252 * _242;
    float _280 = _212 * 2.0;
    float _282 = _270 * _248;
    float _284 = _262 + (-1.0);
    float _286 = floor(_272);
    float _288 = _214 + (-0.5);
    float _290 = _214 * 2.0;
    float _292 = fma(_284, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _294 = _264 + (-1.0);
    float _296 = _274 + (-1.0);
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _300 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _298;
    float _302 = floor(_280);
    float _304 = fma(_294, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _306 = fma(_296, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _308 = abs(_256);
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _312 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _310;
    float _314 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _316 = log2(_314);
    bool _318 = _286 > 0.0;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _322 = _320 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    bool _324 = _286 >= 0.0;
    bool _326 = isnan(_286);
    bool _328 = _324 || _326;
    bool _330 = isnan(0.0);
    bool _332 = _328 || _330;
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _336 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _334;
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _340 = _338 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _342 = fma(_322, _282, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _344 = fma(_312, _278, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _346 = 1.0 / _246;
    bool _348 = _302 > 0.0;
    float _350 = fma(_340, _282, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _352 = _302 >= 0.0;
    bool _354 = isnan(_302);
    bool _356 = _352 || _354;
    bool _358 = isnan(0.0);
    bool _360 = _356 || _358;
    float _362 = fma(_336, _278, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    int _364 = _332 ? 0 : 1;
    int _366 = _360 ? 0 : 1;
    float _368 = floor(_290);
    float _370 = _316 * _156;
    int _372 = ~_364;
    int _374 = _372 + 1;
    int _376 = _374 + 1;
    int _378 = ~_366;
    int _380 = _378 + 1;
    int _382 = _380 + 1;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _386 = 1.0 + _384;
    float _388 = _220 * _346;
    float _390 = exp2(_370);
    int _392 = _376;
    int _394 = _382;
    if (!_318)
    {
        int _396 = ~_364;
        int _398 = _396 + 1;
        _392 = _398;
    }
    int _400 = _392;
    if (!_348)
    {
        int _402 = ~_366;
        int _404 = _402 + 1;
        _394 = _404;
    }
    int _406 = _394;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _410 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _408;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _414 = _412 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _416 = _368 > 0.0;
    bool _418 = _368 >= 0.0;
    bool _420 = isnan(_368);
    bool _422 = _418 || _420;
    bool _424 = isnan(0.0);
    bool _426 = _422 || _424;
    float _428 = fma(_414, _282, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _430 = in.m_69.x;
    float _432 = in.m_69.y;
    float _434 = in.m_69.z;
    bool _436 = !_232;
    int _438 = _436 ? 0 : 1;
    float _440 = 1.0 / _386;
    bool _442 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _444 = isnan(1.0);
    bool _446 = _442 || _444;
    bool _448 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _450 = _446 || _448;
    float _452 = fma(_410, _278, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    int _454 = abs(_438);
    float _456 = -_390;
    float _458 = _456 + 1.0;
    float _460 = fma(_260, _388, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _462 = float(_400);
    float _464 = float(_454);
    bool _466 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _468 = isnan(0.0);
    bool _470 = _466 || _468;
    bool _472 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _474 = _470 || _472;
    float _476 = float(_308);
    float _478 = _464 * _462;
    float _480 = float(_406);
    float _482 = _474 ? _458 : 0.0;
    float _484 = _476 * _480;
    float _486 = _478 * (-2.0);
    if (_450)
    {
        float _488 = _482 * _440;
        _160 = _488;
    }
    float _490 = _160;
    int _492 = _426 ? 0 : 1;
    float _494 = _484 * (-2.0);
    float _496 = fma(_306, _486, _306);
    float _498 = fma(_486, _430, _430);
    bool _500 = _210 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _502 = isnan(_210);
    bool _504 = _500 || _502;
    bool _506 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _508 = _504 || _506;
    float _510 = float(_508);
    float _512 = fma(_304, _494, _304);
    bool _514 = !_240;
    int _516 = _514 ? 0 : 1;
    float _518 = fma(_276, (*spvDescriptorSet0.vp_c9)._m0[196].x, _498);
    bool _520 = _210 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _522 = isnan(_210);
    bool _524 = _520 || _522;
    bool _526 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _528 = _524 || _526;
    float _530 = float(_528);
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _534 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _532;
    float _536 = -_510;
    float _538 = _536 + 1.0;
    int _540 = abs(_516);
    float _542 = fma(_494, _432, _432);
    float _544 = fma(_534, _388, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _546 = _530 * _538;
    float _548 = fma(_300, _388, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    bool _550 = _210 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _552 = isnan(_210);
    bool _554 = _550 || _552;
    bool _556 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _558 = _554 || _556;
    float _560 = float(_558);
    float _562 = -_530;
    float _564 = _562 + 1.0;
    int _566 = ~_492;
    int _568 = _566 + 1;
    int _570 = _568 + 1;
    float _572 = fma(_496, _490, _518);
    bool _574 = _210 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _576 = isnan(_210);
    bool _578 = _574 || _576;
    bool _580 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _582 = _578 || _580;
    float _584 = float(_582);
    float _586 = fma(_288, (*spvDescriptorSet0.vp_c9)._m0[196].y, _542);
    float _588 = -_560;
    float _590 = _588 + 1.0;
    int _592 = _570;
    if (!_416)
    {
        int _594 = ~_492;
        int _596 = _594 + 1;
        _592 = _596;
    }
    int _598 = _592;
    float _600 = _584 * _564;
    float _602 = float(_540);
    float _604 = _510 * _590;
    float _606 = float(_598);
    float _608 = _362 * _600;
    float _610 = -_584;
    float _612 = _610 + 1.0;
    float _614 = _572 * 0.15915493667125701904296875;
    float _616 = _452 * _600;
    float _618 = _602 * _606;
    float _620 = _344 * _600;
    float _622 = fma(_612, (*spvDescriptorSet0.vp_c9)._m0[143].x, _608);
    float _624 = in.m_71.x;
    float _626 = in.m_71.y;
    float _628 = in.m_71.z;
    float _630 = _618 * (-2.0);
    float _632 = fma(_612, (*spvDescriptorSet0.vp_c9)._m0[143].y, _616);
    float _634 = fma(_612, (*spvDescriptorSet0.vp_c9)._m0[143].z, _620);
    float _636 = in.m_73.x;
    float _638 = in.m_73.y;
    float _640 = in.m_73.z;
    float _642 = fma(_630, _434, _434);
    float _644 = fma(_292, _630, _292);
    float _646 = fma(_512, _490, _586);
    float _648 = fma(_428, _546, _632);
    float _650 = fma(_266, (*spvDescriptorSet0.vp_c9)._m0[196].z, _642);
    float _652 = fma(_342, _546, _634);
    float _654 = _646 * 0.15915493667125701904296875;
    float _656 = fma(_350, _546, _622);
    float _658 = fma(_644, _490, _650);
    float _660 = _614 * 6.283185482025146484375;
    float _662 = sin(_660);
    float _664 = fma(_460, _604, _648);
    float _666 = fma(_548, _604, _652);
    float _668 = _658 * 0.15915493667125701904296875;
    float _670 = fma(_544, _604, _656);
    float _672 = fma(_560, (*spvDescriptorSet0.vp_c9)._m0[146].y, _664);
    float _674 = in.m_60.x;
    float _676 = in.m_60.y;
    float _678 = in.m_60.z;
    float _680 = _614 * 6.283185482025146484375;
    float _682 = cos(_680);
    float _684 = fma(_560, (*spvDescriptorSet0.vp_c9)._m0[146].x, _670);
    float _686 = _672 * _626;
    float _688 = fma(_560, (*spvDescriptorSet0.vp_c9)._m0[146].z, _666);
    float _690 = _684 * _624;
    float _692 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _638);
    float _694 = _686 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _696 = _654 * 6.283185482025146484375;
    float _698 = sin(_696);
    float _700 = _688 * _628;
    float _702 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _636);
    float _704 = _690 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _706 = _692 * _694;
    float _708 = _700 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _710 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _640);
    float _712 = _702 * _704;
    float _714 = _654 * 6.283185482025146484375;
    float _716 = cos(_714);
    float _718 = _710 * _708;
    float _720 = _676 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _722 = _676 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _724 = _668 * 6.283185482025146484375;
    float _726 = cos(_724);
    float _728 = _682 * _698;
    float _730 = _662 * _698;
    float _732 = fma(_674, (*spvDescriptorSet0.vp_c10)._m0[4].x, _720);
    float _734 = fma(_674, (*spvDescriptorSet0.vp_c10)._m0[6].x, _722);
    float _736 = _676 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _738 = fma(_678, (*spvDescriptorSet0.vp_c10)._m0[4].z, _732);
    float _740 = _668 * 6.283185482025146484375;
    float _742 = sin(_740);
    float _744 = _682 * _716;
    float _746 = _662 * _716;
    float _748 = fma(_674, (*spvDescriptorSet0.vp_c10)._m0[5].x, _736);
    float _750 = fma(_678, (*spvDescriptorSet0.vp_c10)._m0[5].z, _748);
    float _752 = _682 * _726;
    float _754 = _716 * _726;
    float _756 = _662 * _726;
    float _758 = _698 * _726;
    float _760 = _752 * _706;
    float _762 = fma(_678, (*spvDescriptorSet0.vp_c10)._m0[6].z, _734);
    float _764 = _756 * _706;
    float _766 = _738 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _768 = fma(_742, _744, _730);
    float _770 = fma(_742, _730, _744);
    float _772 = -_728;
    float _774 = fma(_742, _746, _772);
    float _776 = -_706;
    float _778 = _742 * _776;
    float _780 = -_746;
    float _782 = fma(_742, _728, _780);
    float _784 = fma(_768, _712, _760);
    float _786 = fma(_774, _712, _764);
    float _788 = fma(_754, _712, _778);
    float _790 = _762 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _792 = fma(_782, _718, _784);
    float _794 = fma(_770, _718, _786);
    float _796 = fma(_758, _718, _788);
    float _798 = _792 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _800 = _792 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _802 = fma(_796, (*spvDescriptorSet0.vp_c10)._m0[8].x, _798);
    float _804 = fma(_796, (*spvDescriptorSet0.vp_c10)._m0[10].x, _800);
    float _806 = fma(_794, (*spvDescriptorSet0.vp_c10)._m0[8].z, _802);
    float _808 = fma(_794, (*spvDescriptorSet0.vp_c10)._m0[10].z, _804);
    float _810 = _750 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _812 = _766 + _806;
    float _814 = _790 + _808;
    float _816 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _818 = _812 + _816;
    float _820 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _822 = _814 + _820;
    float _824 = _818 * _818;
    float _826 = _822 * _822;
    float _828 = _824 + _826;
    float _830 = sqrt(_828);
    bool _832 = _830 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _834 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _836 = _830 + _834;
    float _838 = _792 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _840 = fma(_796, (*spvDescriptorSet0.vp_c10)._m0[9].x, _838);
    float _842 = fma(_794, (*spvDescriptorSet0.vp_c10)._m0[9].z, _840);
    float _844 = 0.0;
    float _846 = _840;
    float _848 = _796;
    float _850 = _812;
    float _852 = _814;
    float _854 = _824;
    float _856 = _826;
    float _858 = _790;
    if (_832)
    {
        float _860 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _844 = _860;
    }
    float _862 = _844;
    float _864 = _810 + _842;
    float _866 = _864;
    if (_832)
    {
        float _868 = _864 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _846 = _868;
    }
    float _870 = _846;
    float _872 = _870;
    if (_832)
    {
        float _874 = rsqrt(_828);
        _848 = _874;
    }
    float _876 = _848;
    float _878 = _862;
    if (_832)
    {
        float _880 = _836 * _862;
        _878 = _880;
    }
    float _882 = _878;
    float _884 = _882;
    if (_832)
    {
        float _886 = _882 * 0.15915493667125701904296875;
        _884 = _886;
    }
    float _888 = _884;
    float _890 = _674;
    if (_832)
    {
        float _892 = _888 * 6.283185482025146484375;
        float _894 = sin(_892);
        _890 = _894;
    }
    float _896 = _890;
    if (_832)
    {
        float _898 = fma(_896, _870, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _872 = _898;
    }
    float _900 = _872;
    float _902 = _900;
    if (_832)
    {
        float _904 = _876 * _900;
        _902 = _904;
    }
    float _906 = _902;
    if (_832)
    {
        float _908 = fma(_818, _906, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _850 = _908;
    }
    float _910 = _850;
    if (_832)
    {
        float _912 = fma(_822, _906, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _852 = _912;
    }
    float _914 = _852;
    float _916 = fma(_910, 6.2500002968590706586837768554688e-05, 0.5);
    float _918 = fma(_914, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _3957 = float2(_916, _918);
    float3 _922 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_3957, float2(0.0), isnan(_3957)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_3957, float2(0.0), isnan(_3957)), level(0.0)).xyz;
    float _924 = _922.x;
    float _926 = _922.y;
    float _928 = _922.z;
    float _930 = in.m_75.y;
    bool _932 = _638 != 0.0;
    bool _934 = isnan(_638);
    bool _936 = _932 || _934;
    bool _938 = isnan(0.0);
    bool _940 = _936 || _938;
    float _942 = _888;
    if (_832)
    {
        float _944 = _888 * 6.283185482025146484375;
        float _946 = cos(_944);
        _942 = _946;
    }
    float _948 = _942;
    int _950 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _952 = _950 != 0;
    float _954 = in.m_67.w;
    bool _956 = _636 == 0.0;
    bool _958 = !_940;
    bool _960 = _956 && _958;
    int _962 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _964 = _962 != 0;
    float _966 = in.m_77.x;
    float _968 = in.m_77.y;
    float _970 = in.m_77.z;
    bool _972 = _640 == 0.0;
    bool _974 = _972 && _960;
    float _976 = in.m_75.x;
    float _978 = _836;
    float _980 = 1.0;
    float _982 = 1.0;
    if (_952)
    {
        float _984 = in.m_67.z;
        _978 = _984;
    }
    float _986 = _978;
    out.m_79.x = 1.0;
    out.m_79.y = 1.0;
    out.m_79.z = 1.0;
    float _988 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _990 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _992 = -_930;
    float _994 = _992 + 1.0;
    float _996 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _998 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1000 = _988 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1002 = _954 > 0.5;
    float _1004 = _990 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1006 = _996 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1008 = _930;
    if (_964)
    {
        float _1010 = _1002 ? _994 : _930;
        _1008 = _1010;
    }
    float _1012 = _1008;
    float _1014 = 0.0;
    float _1016 = _966;
    float _1018 = _968;
    if (_974)
    {
        _1014 = _966;
    }
    float _1020 = _1014;
    out.m_81.x = _1000;
    out.m_81.y = _1004;
    out.m_81.z = _1006;
    out.m_81.w = _998;
    float _1022 = _1020;
    float _1024 = _976;
    if (!_952)
    {
        _980 = _976;
    }
    float _1026 = _980;
    float _1028 = 0.0;
    float _1030 = _1026;
    if (_974)
    {
        _1028 = _1020;
    }
    float _1032 = _1028;
    bool _1034 = _986 > 0.5;
    bool _1036 = _1034 && _952;
    float _1038 = in.m_83.x;
    float _1040 = in.m_83.y;
    float _1042 = in.m_83.z;
    float _1044 = in.m_83.w;
    float _1046 = _1032;
    if (!_974)
    {
        _1022 = _966;
    }
    float _1048 = _1022;
    if (_974)
    {
        _1016 = _968;
    }
    float _1050 = _1016;
    float _1052 = _1050;
    if (_974)
    {
        _982 = _970;
    }
    float _1054 = _982;
    float _1056 = _1054;
    if (!_974)
    {
        float _1058 = fma(_640, (*spvDescriptorSet0.vp_c9)._m0[17].y, _970);
        _1056 = _1058;
    }
    float _1060 = _1056;
    float _1062 = 0.0;
    if (_974)
    {
        _1062 = _1050;
    }
    float _1064 = _1062;
    float _1066 = _1064;
    if (!_974)
    {
        float _1068 = fma(_636, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1048);
        _1046 = _1068;
    }
    float _1070 = _1046;
    if (!_974)
    {
        _1052 = _968;
    }
    float _1072 = _1052;
    if (_952)
    {
        _1018 = _976;
    }
    float _1074 = _1018;
    float _1076 = _1074;
    if (!_974)
    {
        float _1078 = fma(_638, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1072);
        _1066 = _1078;
    }
    float _1080 = _1066;
    if (_1036)
    {
        float _1082 = -_1074;
        float _1084 = _1082 + 1.0;
        _1076 = _1084;
    }
    float _1086 = _1076;
    float _1088 = -_1080;
    float _1090 = _742 * _1088;
    float _1092 = _756 * _1080;
    if (_952)
    {
        _1030 = _1086;
    }
    float _1094 = _1030;
    float _1096 = fma(_754, _1070, _1090);
    float _1098 = fma(_774, _1070, _1092);
    float _1100 = _1042 * _1048;
    float _1102 = _1040 * _970;
    float _1104 = _1038 * _1072;
    float _1106 = fma(_758, _1060, _1096);
    float _1108 = -_1100;
    float _1110 = fma(_1038, _970, _1108);
    float _1112 = -_1102;
    float _1114 = fma(_1042, _1072, _1112);
    float _1116 = -_1104;
    float _1118 = fma(_1040, _1048, _1116);
    float _1120 = -_1040;
    float _1122 = _742 * _1120;
    float _1124 = _1110 * _1044;
    float _1126 = _752 * _1080;
    float _1128 = _1114 * _1044;
    float _1130 = _1118 * _1044;
    float _1132 = -_1124;
    float _1134 = _742 * _1132;
    float _1136 = _752 * _1040;
    float _1138 = _752 * _1124;
    float _1140 = _756 * _1040;
    float _1142 = _756 * _1124;
    float _1144 = fma(_768, _1070, _1126);
    float _1146 = fma(_754, _1128, _1134);
    float _1148 = fma(_768, _1128, _1138);
    float _1150 = fma(_754, _1038, _1122);
    float _1152 = fma(_768, _1038, _1136);
    float _1154 = fma(_774, _1038, _1140);
    float _1156 = fma(_774, _1128, _1142);
    float _1158 = fma(_782, _1060, _1144);
    float _1160 = fma(_758, _1042, _1150);
    float _1162 = fma(_782, _1042, _1152);
    float _1164 = fma(_770, _1042, _1154);
    float _1166 = fma(_758, _1130, _1146);
    float _1168 = fma(_782, _1130, _1148);
    float _1170 = fma(_770, _1130, _1156);
    float _1172 = _1158 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1174 = _1130;
    float _1176 = _1172;
    if (_832)
    {
        float _1178 = _948 + (-1.0);
        _1174 = _1178;
    }
    float _1180 = _1174;
    float _1182 = _1158 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1184 = _1158 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1186 = fma(_1106, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1172);
    float _1188 = _1180;
    float _1190 = _1182;
    if (_832)
    {
        float _1192 = _1180 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1176 = _1192;
    }
    float _1194 = _1176;
    float _1196 = fma(_770, _1060, _1098);
    float _1198 = fma(_1106, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1182);
    float _1200 = fma(_1106, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1184);
    float _1202 = _1162 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    if (_832)
    {
        float _1204 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1206 = _910 + _1204;
        _1188 = _1206;
    }
    float _1208 = _1188;
    if (_832)
    {
        float _1210 = fma(_864, _948, _1194);
        _866 = _1210;
    }
    float _1212 = _866;
    if (_832)
    {
        float _1214 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1216 = _914 + _1214;
        _1190 = _1216;
    }
    float _1218 = _1190;
    float _1220 = fma(_1160, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1202);
    if (_832)
    {
        float _1222 = _1208 * _1208;
        _854 = _1222;
    }
    float _1224 = _854;
    float _1226 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1228 = _1212 + _1226;
    float _1230 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    if (_832)
    {
        float _1232 = _1218 * _1218;
        _856 = _1232;
    }
    float _1234 = _856;
    float _1236 = _1162 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1238 = fma(_1228, _1228, _1224);
    float _1240 = _1162 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1242 = _1168 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1244 = fma(_1160, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1236);
    float _1246 = _1238 + _1234;
    float _1248 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1250 = fma(_1160, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1240);
    float _1252 = _1168 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1254 = _1168 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1256 = _1012 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1258 = fma(_1166, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1242);
    float _1260 = fma(_1166, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1252);
    float _1262 = _1094 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1264 = sqrt(_1246);
    float _1266 = fma(_1166, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1254);
    float _1268 = _1256 * _1230;
    float _1270 = fma(_1164, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1220);
    float _1272 = fma(_1164, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1244);
    float _1274 = fma(_1170, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1258);
    float _1276 = fma(_1170, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1260);
    float _1278 = fma(_1196, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1186);
    float _1280 = _1262 * _1248;
    float _1282 = fma(_1164, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1250);
    float _1284 = fma(_1170, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1266);
    float _1286 = fma(_1196, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1198);
    float _1288 = fma(_1196, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1200);
    out.m_85.z = _1280;
    out.m_85.w = _1268;
    bool _1290 = _1264 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1292 = isnan(_1264);
    bool _1294 = _1290 || _1292;
    bool _1296 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1298 = _1294 || _1296;
    out.m_87.x = _1270;
    out.m_87.y = _1272;
    out.m_87.z = _1282;
    out.m_89.x = _1274;
    out.m_89.y = _1276;
    out.m_89.z = _1284;
    out.m_91.x = _1278;
    out.m_91.y = _1286;
    out.m_91.z = _1288;
    float _1300 = _1262;
    if (!_1298)
    {
        _1300 = 1.0;
    }
    float _1302 = _1300;
    out.m_93.x = _924;
    out.m_93.y = _926;
    out.m_93.z = _928;
    bool _1304 = !_1298;
    float _1306 = _1302;
    if (!_1304)
    {
        bool _1308 = _1264 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1310 = isnan(_1264);
        bool _1312 = _1308 || _1310;
        bool _1314 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1316 = _1312 || _1314;
        if (!_1316)
        {
            float _1318 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1320 = _1264 + _1318;
            float _1322 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1324 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1322;
            float _1326 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1328 = _1326 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1330 = 1.0 / _1324;
            float _1332 = _1320 * _1330;
            float _1334 = fma(_1332, _1328, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1306 = _1334;
            _1336 = true;
        }
        else
        {
            bool _1338 = _1264 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1340 = isnan(_1264);
            bool _1342 = _1338 || _1340;
            bool _1344 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1346 = _1342 || _1344;
            if (!_1346)
            {
                float _1348 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1350 = _1264 + _1348;
                float _1352 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1354 = _1352 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1356 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1358 = _1356 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1360 = 1.0 / _1354;
                float _1362 = _1350 * _1360;
                float _1364 = fma(_1362, _1358, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1306 = _1364;
                _1336 = true;
            }
            else
            {
                _1306 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1336 = false;
    float _1366 = _1306;
    float _1368 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1370 = _1212 + _1368;
    float _1372 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1374 = _910 + _1372;
    float _1376 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1378 = _914 + _1376;
    float _1380 = _810 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1382 = fma(_1370, _1366, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1384 = fma(_1374, _1366, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1386 = fma(_1378, _1366, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1388 = fma(_766, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1380);
    float _1390 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1392 = _1382 + _1390;
    float _1394 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1396 = _1384 + _1394;
    float _1398 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1400 = _1386 + _1398;
    float _1402 = _1392 * _1392;
    float _1404 = fma(_1396, _1396, _1402);
    float _1406 = fma(_1400, _1400, _1404);
    float _1408 = fma(_790, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1388);
    float _1410 = _810 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1412 = fma(_766, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1414 = rsqrt(_1406);
    float _1416 = _1408 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1418 = fma(_766, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1410);
    float _1420 = fma(_790, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1422 = fma(_790, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1418);
    float _1424 = 1.0 / _1416;
    float _1426 = _1422 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1428 = _1426 + _1416;
    float _1430 = _1414 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1432 = floor(_1412);
    float _1434 = _1396 * _1430;
    float _1436 = _1400 * _1430;
    float _1438 = _1434 * _1434;
    float _1440 = _1436 * _1436;
    float _1442 = _1428 * _1424;
    float _1444 = _1442 * 0.5;
    float _1446 = sqrt(_1406);
    float _1448 = _1438 + _1440;
    float _1450 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1452 = fma(_1444, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1450);
    float _1454 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _1456 = -_1432;
    float _1458 = _1412 + _1456;
    float _1460 = sqrt(_1448);
    float _1462 = _810 + _1454;
    float _1464 = _1462 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1466 = _1462 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1468 = 1.0 / _1452;
    float _1470 = fma(_766, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1464);
    float _1472 = fma(_766, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1466);
    float _1474 = fma(_790, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1470);
    float _1476 = fma(_790, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1472);
    bool _1478 = _1460 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1480 = _1474 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1482 = _1476 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1484 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1486 = _1460 + _1484;
    float _1488 = floor(_1420);
    float _1490 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1492 = _1468 * _1490;
    float _1494 = trunc(_1480);
    int _1496 = int(_1494);
    bool _1498 = _1492 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1500 = _1492 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1502 = _810;
    int _1504 = 2;
    float _1506 = _1486;
    float _1508 = _1448;
    float _1510 = _1430;
    float _1512 = _1434;
    float _1514 = _1438;
    if (_1478)
    {
        float _1516 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1502 = _1516;
    }
    float _1518 = _1502;
    float _1520 = -_1488;
    float _1522 = _1420 + _1520;
    if (!_1498)
    {
        _1504 = 1;
    }
    int _1524 = _1504;
    float _1526 = trunc(_1482);
    int _1528 = int(_1526);
    int _1530 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1532 = _1496 + _1530;
    int _1534 = _1532 + 1;
    int _1536 = _1524;
    if (_1478)
    {
        float _1538 = _1486 * _1518;
        _1506 = _1538;
    }
    float _1540 = _1506;
    if (_1478)
    {
        float _1542 = rsqrt(_1448);
        _1508 = _1542;
    }
    float _1544 = _1508;
    float _1546 = 0.0;
    float _1548 = _1544;
    if (_1478)
    {
        float _1550 = _1540 * 0.15915493667125701904296875;
        _1546 = _1550;
    }
    float _1552 = _1546;
    bool _1554 = !_1498;
    int _1556 = _1554 ? 0 : 1;
    float _1558 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    int _1560 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1562 = _1528 + _1560;
    int _1564 = _1562 + 1;
    float _1566 = _1476;
    if (_1478)
    {
        float _1568 = _1552 * 6.283185482025146484375;
        float _1570 = sin(_1568);
        _1566 = _1570;
    }
    float _1572 = _1566;
    if (!_1500)
    {
        _1536 = _1556;
    }
    int _1574 = _1536;
    float _1576 = precise::max(0.0, _1558);
    int _1578 = _1574 << 6;
    bool _1580 = _1534 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1582 = -_1430;
    float _1584 = -_1576;
    float _1586 = fma(_1392, _1582, _1584);
    int _1588 = _1578 + 96;
    uint _1591 = uint(int(uint(_1588) >> uint(2)));
    uint _1593 = uint(int(uint(int(_1591)) >> uint(2)));
    int _1595 = int(_1591) & 3;
    float _1597 = (*spvDescriptorSet0.vp_c15)._m0[int(_1593)][_1595];
    int _1599 = int(_1591) + 1;
    uint _1601 = uint(int(uint(_1599) >> uint(2)));
    int _1603 = _1599 & 3;
    float _1605 = (*spvDescriptorSet0.vp_c15)._m0[int(_1601)][_1603];
    int _1607 = _1534 | _1564;
    float _1609 = _1552;
    float _1611 = as_type<float>(_1607);
    float _1613 = _1586;
    if (_1478)
    {
        float _1615 = _1552 * 6.283185482025146484375;
        float _1617 = cos(_1615);
        _1609 = _1617;
    }
    float _1619 = _1609;
    if (_1478)
    {
        float _1621 = _1586 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1510 = _1621;
    }
    float _1623 = _1510;
    bool _1625 = _1607 < 0;
    bool _1627 = _1625 || _1580;
    if (_1478)
    {
        float _1629 = fma(_1572, _1623, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1611 = _1629;
    }
    float _1631 = _1611;
    int _1633 = _1578 + 48;
    uint _1635 = uint(int(uint(_1633) >> uint(2)));
    uint _1637 = uint(int(uint(int(_1635)) >> uint(2)));
    int _1639 = int(_1635) & 3;
    float _1641 = (*spvDescriptorSet0.vp_c15)._m0[int(_1637)][_1639];
    int _1643 = int(_1635) + 1;
    uint _1645 = uint(int(uint(_1643) >> uint(2)));
    int _1647 = _1643 & 3;
    float _1649 = (*spvDescriptorSet0.vp_c15)._m0[int(_1645)][_1647];
    float _1651 = _1382 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    bool _1653 = _1564 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1655 = _1653 || _1627;
    float _1657 = 0.0;
    if (_1478)
    {
        float _1659 = _1544 * _1631;
        _1657 = _1659;
    }
    float _1661 = _1657;
    float _1663 = fma(_1384, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1651);
    if (_1478)
    {
        float _1665 = _1434 * _1661;
        _1512 = _1665;
    }
    float _1667 = _1512;
    int _1669 = _1578 + 104;
    uint _1671 = uint(int(uint(_1669) >> uint(2)));
    uint _1673 = uint(int(uint(int(_1671)) >> uint(2)));
    int _1675 = int(_1671) & 3;
    float _1677 = (*spvDescriptorSet0.vp_c15)._m0[int(_1673)][_1675];
    int _1679 = int(_1671) + 1;
    uint _1681 = uint(int(uint(_1679) >> uint(2)));
    int _1683 = _1679 & 3;
    float _1685 = (*spvDescriptorSet0.vp_c15)._m0[int(_1681)][_1683];
    float _1687 = fma(_1386, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1663);
    float _1689 = _1619;
    if (_1478)
    {
        float _1691 = _1619 + (-1.0);
        _1548 = _1691;
    }
    float _1693 = _1548;
    float _1695 = _1693;
    if (_1478)
    {
        float _1697 = _1667 * _1667;
        _1514 = _1697;
    }
    float _1699 = _1514;
    float _1701 = 0.0;
    if (_1478)
    {
        float _1703 = _1693 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1701 = _1703;
    }
    float _1705 = _1701;
    if (!_1478)
    {
        _1695 = _1436;
    }
    float _1707 = _1695;
    int _1709 = _1578 + 64;
    uint _1711 = uint(int(uint(_1709) >> uint(2)));
    uint _1713 = uint(int(uint(int(_1711)) >> uint(2)));
    int _1715 = int(_1711) & 3;
    float _1717 = (*spvDescriptorSet0.vp_c15)._m0[int(_1713)][_1715];
    int _1719 = int(_1711) + 1;
    uint _1721 = uint(int(uint(_1719) >> uint(2)));
    int _1723 = _1719 & 3;
    float _1725 = (*spvDescriptorSet0.vp_c15)._m0[int(_1721)][_1723];
    float _1727 = _1707;
    if (_1478)
    {
        float _1729 = _1436 * _1661;
        _1727 = _1729;
    }
    float _1731 = _1727;
    if (_1478)
    {
        float _1733 = fma(_1586, _1619, _1705);
        _1613 = _1733;
    }
    float _1735 = _1613;
    float _1737 = _1687 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    if (!_1478)
    {
        _1689 = _1440;
    }
    float _1739 = _1689;
    float _1741 = _1739;
    if (_1478)
    {
        float _1743 = _1731 * _1731;
        _1741 = _1743;
    }
    float _1745 = _1741;
    float _1747 = fma(_1735, _1735, _1699);
    float _1749 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    int _1751 = _1578 + 80;
    uint _1753 = uint(int(uint(_1751) >> uint(2)));
    uint _1755 = uint(int(uint(int(_1753)) >> uint(2)));
    int _1757 = int(_1753) & 3;
    float _1759 = (*spvDescriptorSet0.vp_c15)._m0[int(_1755)][_1757];
    int _1761 = int(_1753) + 1;
    uint _1763 = uint(int(uint(_1761) >> uint(2)));
    int _1765 = _1761 & 3;
    float _1767 = (*spvDescriptorSet0.vp_c15)._m0[int(_1763)][_1765];
    float _1769 = _1737 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1771 = _1747 + _1745;
    int _1773 = as_type<int>(_1769);
    if (!_1655)
    {
        float _1775 = floor(_1482);
        _1024 = _1775;
    }
    float _1777 = _1024;
    float _1779 = -_1769;
    float _1781 = fma(_1779, _1749, 1.0);
    if (!_1655)
    {
        int _1783 = _1564 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1785 = _1783 + _1534;
        _1773 = _1785;
    }
    int _1787 = _1773;
    int _1789 = _1578 + 56;
    uint _1791 = uint(int(uint(_1789) >> uint(2)));
    uint _1793 = uint(int(uint(int(_1791)) >> uint(2)));
    int _1795 = int(_1791) & 3;
    float _1797 = (*spvDescriptorSet0.vp_c15)._m0[int(_1793)][_1795];
    int _1799 = int(_1791) + 1;
    uint _1801 = uint(int(uint(_1799) >> uint(2)));
    int _1803 = _1799 & 3;
    float _1805 = (*spvDescriptorSet0.vp_c15)._m0[int(_1801)][_1803];
    float _1807 = log2(_1781);
    int _1809 = _1578 + 88;
    uint _1811 = uint(int(uint(_1809) >> uint(2)));
    uint _1813 = uint(int(uint(int(_1811)) >> uint(2)));
    int _1815 = int(_1811) & 3;
    float _1817 = (*spvDescriptorSet0.vp_c15)._m0[int(_1813)][_1815];
    int _1819 = int(_1811) + 1;
    uint _1821 = uint(int(uint(_1819) >> uint(2)));
    int _1823 = _1819 & 3;
    float _1825 = (*spvDescriptorSet0.vp_c15)._m0[int(_1821)][_1823];
    float _1827 = _1462 * _1605;
    float _1829 = fma(_766, _1597, _1827);
    int _1831 = _1578 + 72;
    uint _1833 = uint(int(uint(_1831) >> uint(2)));
    uint _1835 = uint(int(uint(int(_1833)) >> uint(2)));
    int _1837 = int(_1833) & 3;
    float _1839 = (*spvDescriptorSet0.vp_c15)._m0[int(_1835)][_1837];
    int _1841 = int(_1833) + 1;
    uint _1843 = uint(int(uint(_1841) >> uint(2)));
    int _1845 = _1841 & 3;
    float _1847 = (*spvDescriptorSet0.vp_c15)._m0[int(_1843)][_1845];
    float _1849 = _1462 * _1649;
    float _1851 = rsqrt(_1771);
    float _1853 = _1807 * 0.693147182464599609375;
    float _1855 = fma(_766, _1641, _1849);
    int _1857 = as_type<int>(_1849);
    int _1859 = as_type<int>(_1597);
    if (!_1655)
    {
        int _1861 = _1787 << 2;
        _1857 = _1861;
    }
    int _1863 = _1857;
    float _1865 = fma(_790, _1677, _1829);
    int _1867 = _1863;
    if (!_1655)
    {
        int _1869 = 12 & _1863;
        _1867 = _1869;
    }
    int _1871 = _1867;
    float _1873 = _1865 + _1685;
    float2 _5592 = float2(_1458, _1522);
    float _1875 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5592, float2(0.0), isnan(_5592)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5592, float2(0.0), isnan(_5592)), level(0.0)).x;
    float _1877 = _1853 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1879 = _1462 * _1725;
    float _1881 = _1725;
    int _1883 = as_type<int>(_1767);
    if (!_1655)
    {
        float _1885 = -_1777;
        float _1887 = _1482 + _1885;
        _1881 = _1887;
    }
    float _1889 = _1881;
    float _1891 = 1.0 / _1873;
    float _1893 = _1851 * _1667;
    float _1895 = fma(_766, _1717, _1879);
    float _1897 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1899 = fma(_1446, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1897);
    float _1901 = precise::clamp(_1899, 0.0, 1.0);
    float _1903 = _1851 * _1735;
    float _1905 = _1893 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1907 = _1462 * _1767;
    if (!_1655)
    {
        uint _1909 = uint(int(uint(_1787) >> uint(2)));
        _1883 = int(_1909);
    }
    int _1911 = _1883;
    float _1913 = _1851 * _1731;
    float _1915 = fma(_766, _1759, _1907);
    float _1917 = -_1901;
    float _1919 = _1917 + 1.0;
    if (!_1655)
    {
        int _1921 = _1911 << 4;
        int _1923 = _1921 + _1871;
        _1859 = _1923;
    }
    int _1925 = _1859;
    float _1927 = fma(_790, _1797, _1855);
    float _1929 = _1901;
    float _1931 = as_type<float>(_1925);
    if (!_1655)
    {
        int _1933 = _1925 + 400;
        uint _1935 = uint(int(uint(_1933) >> uint(2)));
        uint _1937 = uint(int(uint(int(_1935)) >> uint(2)));
        int _1939 = int(_1935) & 3;
        float _1941 = (*spvDescriptorSet0.vp_c15)._m0[int(_1937)][_1939];
        _1929 = _1941;
    }
    float _1943 = _1929;
    float _1945 = abs(_1919);
    float _1947 = log2(_1945);
    float _1949 = _1927 + _1805;
    float _1951 = _1382 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1953 = fma(_790, _1817, _1915);
    float _1955 = -_1905;
    float _1957 = fma(_1903, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1955);
    float _1959 = _1382 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1961 = fma(_1384, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1951);
    float _1963 = -_1913;
    float _1965 = fma(_1963, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1957);
    float _1967 = fma(_1384, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1959);
    float _1969 = _1949 * _1891;
    float _1971 = fma(_790, _1839, _1895);
    float _1973 = fma(_1965, -0.5, 0.5);
    float _1975 = fma(_1386, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1967);
    float _1977 = fma(_1965, 0.5, 0.5);
    float _1979 = _1971 + _1847;
    float _1981 = _1382 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    bool _1983 = _1969 >= 0.0;
    float _1985 = fma(_1386, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1961);
    float _1987 = _1979 * _1891;
    float _1989 = fma(_1384, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1981);
    bool _1991 = _1969 <= 1.0;
    bool _1993 = _1991 && _1983;
    float _1995 = _1985 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1997 = _1947 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1999 = fma(_1386, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1989);
    bool _2001 = _1987 >= 0.0;
    bool _2003 = _2001 && _1993;
    float _2005 = _1995 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2007 = exp2(_1997);
    float _2009 = _1999 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    bool _2011 = _1987 <= 1.0;
    bool _2013 = _2011 && _2003;
    float _2015 = _1975 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2017 = _1953 + _1825;
    float _2019 = fma(_2009, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2005);
    float _2021 = _1995 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2023 = _1903 + 1.0;
    float _2025 = sqrt(_1973);
    float _2027 = fma(_1737, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2019);
    float _2029 = fma(_2009, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2021);
    float _2031 = _2017 * _1891;
    float _2033 = fma(_1977, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2035 = fma(_2015, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2027);
    if (_2013)
    {
        float _2037 = float(_1574);
        _1931 = _2037;
    }
    float _2039 = _1931;
    float _2041 = -_1903;
    float _2043 = fma(_2007, _2023, _2041);
    float _2045 = fma(_1977, _2033, -0.212114393711090087890625);
    float _2047 = 1.0 / _2035;
    float _2049 = _1995 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2051 = fma(_2043, 0.5, 0.5);
    float _2053 = fma(_1977, _2045, 1.570728778839111328125);
    float _2055 = fma(_1737, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2029);
    float _2057 = fma(_2009, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2049);
    float _2059 = _2025 * 0.636619746685028076171875;
    float _2061 = _2039;
    float _2063 = _2057;
    if (_2013)
    {
        float _2065 = rint(_2039);
        float _2067 = precise::max(_2065, 0.0);
        uint _2069 = uint(_2067);
        uint _2071 = clamp(_2069, 0u, 65535u);
        _2061 = as_type<float>(_2071);
    }
    float _2073 = _2061;
    float _2075 = fma(_1737, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2057);
    float _2077 = fma(_2015, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2055);
    float _2079 = -_2053;
    float _2081 = fma(_2059, _2079, 1.0);
    float _2083 = fma(_2015, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2075);
    float _2085 = _1913;
    if (!_1655)
    {
        float _2087 = floor(_1480);
        _2085 = _2087;
    }
    float _2089 = _2085;
    float _2091 = _2077 * _2047;
    float _2093 = _2083 * _2047;
    float _2095 = fma(_2091, 0.5, 0.5);
    float _2097 = fma(_2093, -0.5, 0.5);
    float _2099 = _2073;
    if (_2013)
    {
        float3 _5981 = float3(_1969, _1987, float(as_type<int>(_2073)));
        float3 _5985 = select(_5981, float3(0.0), isnan(_5981));
        float _2101 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5985.xy, uint(rint(_5985.z)), _2031, level(0.0));
        _2099 = _2101;
    }
    float _2103 = _2099;
    float _2105 = _2093;
    if (!_1655)
    {
        float _2107 = rint(_1943);
        float _2109 = precise::max(_2107, 0.0);
        uint _2111 = uint(_2109);
        uint _2113 = clamp(_2111, 0u, 65535u);
        _2105 = as_type<float>(_2113);
    }
    float _2115 = _2105;
    float3 _6011 = float3(_2095, _2097, _1877);
    float _2117 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6011, float3(0.0), isnan(_6011)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6011, float3(0.0), isnan(_6011)), level(0.0)).x;
    if (!_1655)
    {
        float _2119 = -_2089;
        float _2121 = _1480 + _2119;
        _2063 = _2121;
    }
    float _2123 = _2063;
    float3 _6031 = float3(_2095, _2097, _1877);
    float4 _2126 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6031, float3(0.0), isnan(_6031)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6031, float3(0.0), isnan(_6031)), level(0.0)).xyzw;
    float _2128 = _2126.x;
    float _2130 = _2126.y;
    float _2132 = _2126.z;
    float _2134 = _2126.w;
    float2 _6047 = float2(_2081, _2051);
    float3 _2136 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6047, float2(0.0), isnan(_6047)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6047, float2(0.0), isnan(_6047)), level(0.0)).xyz;
    float _2138 = _2136.x;
    float _2140 = _2136.y;
    float _2142 = _2136.z;
    float _2144 = _2115;
    if (!_1655)
    {
        float3 _6068 = float3(_2123, _1889, float(as_type<int>(_2115)));
        float3 _6070 = select(_6068, float3(0.0), isnan(_6068));
        float _2146 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6070.xy, uint(rint(_6070.z)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6070.xy, uint(rint(_6070.z)), level(0.0)).x;
        _2144 = _2146;
    }
    float _2148 = _2144;
    float _2150 = abs(_1492);
    float _2152 = log2(_2150);
    float _2154 = _1995 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2156 = fma(_2009, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2154);
    float _2158 = fma(_1737, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2156);
    float _2160 = _1947 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2162 = fma(_2015, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2158);
    float _2164 = _2152 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2166 = _2162 + _2035;
    float _2168 = exp2(_2160);
    bool _2170 = _1492 <= 8000.0;
    bool _2172 = isnan(_1492);
    bool _2174 = _2170 || _2172;
    bool _2176 = isnan(8000.0);
    bool _2178 = _2174 || _2176;
    float _2180 = float(_2178);
    float _2182 = _2166 * 0.5;
    float _2184 = exp2(_2164);
    out.m_95.z = _2182;
    out.m_95.w = _2035;
    float _2186 = fma(_2184, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2188 = precise::clamp(_2186, 0.0, 1.0);
    float _2190 = fma(_2188, -2.0, 3.0);
    float _2192 = _2188 * _2188;
    float _2194 = _2192 * _2190;
    float _2196 = -_2194;
    float _2198 = _2196 + 1.0;
    out.gl_Position.x = _2077;
    out.gl_Position.y = _2083;
    out.gl_Position.z = _2162;
    out.gl_Position.w = _2035;
    float _2200 = fma(_2198, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2194);
    float _2202 = _2180 * _2200;
    float _2204 = _2200;
    float _2206 = _2162;
    float _2208 = _2077;
    if (!_2013)
    {
        _2204 = 1.0;
    }
    float _2210 = _2204;
    float _2212 = _2202 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2214 = -_2168;
    float _2216 = _2214 + 1.0;
    float _2218 = _2216 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2220 = _2216;
    float _2222 = _2210;
    if (_1655)
    {
        _2220 = 1.0;
    }
    float _2224 = _2220;
    float _2226 = -_1875;
    float _2228 = _2226 + 1.0;
    float _2230 = _2228 * _2212;
    float _2232 = precise::clamp(_2230, 0.0, 1.0);
    float _2234 = _2224;
    if (_2013)
    {
        bool _2236 = _2103 >= _2031;
        bool _2238 = isnan(_2103);
        bool _2240 = _2236 || _2238;
        bool _2242 = isnan(_2031);
        bool _2244 = _2240 || _2242;
        float _2246 = float(_2244);
        _2222 = _2246;
    }
    float _2248 = _2222;
    if (!_1655)
    {
        int _2250 = _1787 << 4;
        int _2252 = _2250 + 2048;
        uint _2254 = uint(int(uint(_2252) >> uint(2)));
        uint _2256 = uint(int(uint(int(_2254)) >> uint(2)));
        int _2258 = int(_2254) & 3;
        float _2260 = (*spvDescriptorSet0.vp_c15)._m0[int(_2256)][_2258];
        int _2262 = int(_2254) + 1;
        uint _2264 = uint(int(uint(_2262) >> uint(2)));
        int _2266 = _2262 & 3;
        float _2268 = (*spvDescriptorSet0.vp_c15)._m0[int(_2264)][_2266];
        int _2270 = _2252 + 8;
        uint _2272 = uint(int(uint(_2270) >> uint(2)));
        uint _2274 = uint(int(uint(int(_2272)) >> uint(2)));
        int _2276 = int(_2272) & 3;
        float _2278 = (*spvDescriptorSet0.vp_c15)._m0[int(_2274)][_2276];
        int _2280 = int(_2272) + 1;
        uint _2282 = uint(int(uint(_2280) >> uint(2)));
        int _2284 = _2280 & 3;
        float _2286 = (*spvDescriptorSet0.vp_c15)._m0[int(_2282)][_2284];
        float _2288 = _1462 * _2268;
        float _2290 = fma(_766, _2260, _2288);
        float _2292 = fma(_790, _2278, _2290);
        float _2294 = _2292 + _2286;
        float _2296 = precise::clamp(_2294, 0.0, 1.0);
        float _2298 = -_2296;
        float _2300 = _2298 + _2148;
        float _2302 = fma(_2300, 500.0, 1.5);
        float _2304 = exp2(_2302);
        float _2306 = 0.0 + _2304;
        float _2308 = precise::clamp(_2306, 0.0, 1.0);
        _2234 = _2308;
        _2206 = _2260;
    }
    float _2310 = _2234;
    float _2312 = _2206;
    float _2314 = _2248 * _2310;
    float _2316 = -_2232;
    float _2318 = fma(_2316, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2320 = _2218 * _2117;
    out.m_97.x = _1384;
    out.m_97.y = _1382;
    out.m_97.z = _1386;
    bool _2322 = _1446 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2324 = isnan(_1446);
    bool _2326 = _2322 || _2324;
    bool _2328 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2330 = _2326 || _2328;
    float _2332 = -_2314;
    float _2334 = fma(_2332, _2318, 1.0);
    float _2336 = precise::clamp(_2334, 0.0, 1.0);
    float _2338 = _2134 * _2320;
    float _2340 = -_2218;
    float _2342 = _2340 + 1.0;
    float _2344 = _2142 * _2320;
    float _2346 = _2336 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2348 = fma(_2138, _2338, _2128);
    float _2350 = fma(_2140, _2338, _2130);
    float _2352 = _2134 * _2342;
    float _2354 = fma(_2134, _2344, _2132);
    out.m_99.x = _2346;
    float _2356 = _2312;
    float _2358 = _2338;
    float _2360 = _2342;
    float _2362 = _2336;
    if (!_2330)
    {
        _2356 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2364 = _2356;
    out.m_101.x = _2348;
    out.m_101.y = _2350;
    out.m_101.z = _2354;
    out.m_101.w = _2352;
    float _2366 = _2364;
    float _2368 = _2364;
    if (!_2330)
    {
        _858 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2370 = _858;
    float _2372 = _2370;
    float _2374 = _2370;
    if (!_2330)
    {
        _2208 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2376 = _2208;
    float _2378 = _2376;
    float _2380 = _2376;
    if (!_2330)
    {
        _2358 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2382 = _2358;
    float _2384 = _2382;
    float _2386 = _2382;
    if (!_2330)
    {
        _2360 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2388 = _2360;
    float _2390 = _2388;
    float _2392 = _2388;
    if (!_2330)
    {
        _2362 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2394 = _2362;
    bool _2396 = !_2330;
    float _2398 = _2394;
    float _2400 = _2394;
    if (!_2396)
    {
        bool _2402 = _1446 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2404 = isnan(_1446);
        bool _2406 = _2402 || _2404;
        bool _2408 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2410 = _2406 || _2408;
        if (!_2410)
        {
            float _2412 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2414 = _1446 + _2412;
            float _2416 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2418 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2416;
            float _2420 = 1.0 / _2418;
            float _2422 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2424 = _2422 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2426 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2428 = _2426 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2430 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2432 = _2430 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2434 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2436 = _2434 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2438 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2440 = _2438 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2442 = _2414 * _2420;
            float _2444 = precise::clamp(_2442, 0.0, 1.0);
            float _2446 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2448 = _2446 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2450 = fma(_2444, _2424, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2452 = fma(_2444, _2448, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2454 = fma(_2444, _2428, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2456 = fma(_2444, _2432, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2458 = fma(_2444, _2436, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2460 = fma(_2444, _2440, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2374 = _2452;
            _2392 = _2458;
            _2368 = _2450;
            _2386 = _2456;
            _2380 = _2454;
            _2400 = _2460;
            _2462 = true;
        }
        else
        {
            bool _2464 = _1446 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2466 = isnan(_1446);
            bool _2468 = _2464 || _2466;
            bool _2470 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2472 = _2468 || _2470;
            if (!_2472)
            {
                _2366 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2474 = _2366;
            _2368 = _2474;
            if (!_2472)
            {
                _2372 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2476 = _2372;
            _2374 = _2476;
            if (!_2472)
            {
                _2378 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2478 = _2378;
            _2380 = _2478;
            if (!_2472)
            {
                _2384 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2480 = _2384;
            _2386 = _2480;
            if (!_2472)
            {
                _2390 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2482 = _2390;
            _2392 = _2482;
            if (!_2472)
            {
                _2398 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2484 = _2398;
            bool _2486 = !_2472;
            _2400 = _2484;
            if (!_2486)
            {
                bool _2488 = _1446 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2490 = isnan(_1446);
                bool _2492 = _2488 || _2490;
                bool _2494 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2496 = _2492 || _2494;
                if (!_2496)
                {
                    float _2498 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2500 = _1446 + _2498;
                    float _2502 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2504 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2502;
                    float _2506 = 1.0 / _2504;
                    float _2508 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2510 = _2508 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2512 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2514 = _2512 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2516 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2518 = _2516 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2520 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2522 = _2520 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2524 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2526 = _2524 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2528 = _2500 * _2506;
                    float _2530 = precise::clamp(_2528, 0.0, 1.0);
                    float _2532 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2534 = _2532 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2536 = fma(_2530, _2510, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2538 = fma(_2530, _2534, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2540 = fma(_2530, _2514, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2542 = fma(_2530, _2518, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2544 = fma(_2530, _2522, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2546 = fma(_2530, _2526, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2374 = _2538;
                    _2392 = _2544;
                    _2368 = _2536;
                    _2386 = _2542;
                    _2380 = _2540;
                    _2400 = _2546;
                    _2462 = true;
                }
                else
                {
                    _2374 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2392 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2368 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2386 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2380 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2400 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2462 = false;
    float _2548 = _2374;
    float _2550 = _2392;
    float _2552 = _2368;
    float _2554 = _2386;
    float _2556 = _2380;
    float _2558 = _2400;
    float _2560 = fma(_1286, -0.5, 0.5);
    float _2562 = precise::clamp(_2560, 0.0, 1.0);
    float _2564 = -_2548;
    float _2566 = _2564 + _2550;
    float _2568 = -_2552;
    float _2570 = _2568 + _2554;
    float _2572 = -_2556;
    float _2574 = _2572 + _2558;
    bool _2576 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2578 = fma(_2562, _2566, _2548);
    float _2580 = fma(_2562, _2570, _2552);
    float _2582 = fma(_2562, _2574, _2556);
    float _2584 = _2578 * 0.586610972881317138671875;
    out.m_63.x = 1.0;
    float _2586 = fma(_2580, 0.298911988735198974609375, _2584);
    float _2588 = fma(_2582, 0.114477999508380889892578125, _2586);
    out.m_103.x = 0.0;
    float _2590 = -_2588;
    float _2592 = _2580 + _2590;
    float _2594 = -_2588;
    float _2596 = _2578 + _2594;
    float _2598 = -_2588;
    float _2600 = _2582 + _2598;
    float _2602 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2604 = fma(_2592, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2588);
    float _2606 = fma(_2596, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2588);
    float _2608 = fma(_2600, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2588);
    out.m_99.w = _2602;
    out.m_105.x = _2604;
    out.m_105.y = _2606;
    out.m_105.z = _2608;
    if (!_2576)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2610 = -_1382;
    float _2612 = _2610 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2614 = -_1384;
    float _2616 = _2614 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2618 = -_1386;
    float _2620 = _2618 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2622 = _2612 * _2612;
    float _2624 = fma(_2616, _2616, _2622);
    float _2626 = fma(_2620, _2620, _2624);
    float _2628 = sqrt(_2626);
    float _2630 = rsqrt(_2626);
    float _2632 = -_2628;
    float _2634 = _2632 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2636 = _2634 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2638 = precise::clamp(_2636, 0.0, 1.0);
    float _2640 = _2616 * _2630;
    float _2642 = _2612 * _2630;
    float _2644 = abs(_2638);
    float _2646 = log2(_2644);
    float _2648 = _2620 * _2630;
    float _2650 = _2640 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2652 = _1286 * _2642;
    float _2654 = -_2642;
    float _2656 = -_2650;
    float _2658 = fma(_2654, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2656);
    float _2660 = fma(_1278, _2640, _2652);
    float _2662 = -_2648;
    float _2664 = fma(_2662, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2658);
    float _2666 = fma(_1288, _2648, _2660);
    float _2668 = precise::clamp(_2666, 0.0, 1.0);
    float _2670 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2672 = _2664 + _2670;
    float _2674 = _2646 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2676 = _2672 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2678 = precise::clamp(_2676, 0.0, 1.0);
    float _2680 = exp2(_2674);
    float _2682 = _2680 * _2678;
    float _2684 = _2668 * _2682;
    float _2686 = _2684 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2688 = _2684 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2690 = _2684 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_103.x = _2686;
    out.m_103.y = _2688;
    out.m_103.z = _2690;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

