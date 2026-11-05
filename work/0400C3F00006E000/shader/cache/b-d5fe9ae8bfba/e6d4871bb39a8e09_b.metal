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
    texture2d_array<float> vp_t_tcb_14 [[id(17)]];
    sampler vp_t_tcb_14Smplr [[id(18)]];
    texture2d<float> vp_t_tcb_1C [[id(19)]];
    sampler vp_t_tcb_1CSmplr [[id(20)]];
    sampler vp_t_tcb_20Smplr_w [[id(21)]];
    sampler vp_t_tcb_24Smplr_w [[id(22)]];
    sampler vp_t_tcb_32Smplr_w [[id(23)]];
    sampler vp_t_tcb_30Smplr_w [[id(24)]];
    sampler vp_t_tcb_14Smplr_w [[id(25)]];
    sampler vp_t_tcb_1CSmplr_w [[id(26)]];
    constant dm_border_t* dm_border [[id(27)]];
};

struct main0_out
{
    float4 m_81 [[user(locn0)]];
    float4 m_79 [[user(locn2)]];
    float4 m_85 [[user(locn3)]];
    float4 m_103 [[user(locn4)]];
    float4 m_63 [[user(locn5)]];
    float4 m_89 [[user(locn6)]];
    float4 m_91 [[user(locn7)]];
    float4 m_95 [[user(locn8)]];
    float4 m_87 [[user(locn9)]];
    float4 m_101 [[user(locn10)]];
    float4 m_93 [[user(locn11)]];
    float4 m_97 [[user(locn12)]];
    float4 m_99 [[user(locn13)]];
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
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2502 = false;
    bool _1278 = false;
    bool _200 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _117 = in.m_60.w;
    float _119 = trunc(_117);
    int _122 = int(_119);
    bool _126 = _122 >= 1;
    float _128 = 0.0;
    if (!_126)
    {
        _128 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _130 = _128;
    if (!_126)
    {
        out.m_63.x = 0.0;
    }
    int _132 = 0;
    if (!_126)
    {
        float _134 = _130 * 5.0;
        _132 = as_type<int>(_134);
    }
    int _136 = _132;
    int _138 = _136;
    if (!_126)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2786 = as_type<float>(_136);
        out.gl_Position.z = _2786;
    }
    if (!_126)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _140 = in.m_65.w;
    bool _142 = _140 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _144 = isnan(_140);
    bool _146 = _142 || _144;
    bool _148 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _150 = _146 || _148;
    float _152 = -_140;
    float _154 = _152 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _156 = 0.0;
    float _158 = _154;
    if (_150)
    {
        float _160 = float(_122);
        _156 = _160;
    }
    float _162 = _156;
    bool _164 = _154 >= _162;
    bool _166 = !_150;
    bool _168 = _164 || _166;
    float _170 = _162;
    if (_168)
    {
        _170 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _172 = _170;
    if (_168)
    {
        out.m_63.x = 0.0;
    }
    if (_168)
    {
        float _174 = _172 * 5.0;
        _138 = as_type<int>(_174);
    }
    int _176 = _138;
    if (_168)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2856 = as_type<float>(_176);
        out.gl_Position.z = _2856;
    }
    if (_168)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _178 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _180 = !_178;
    float _198;
    if (!_180)
    {
        float _182 = in.m_67.x;
        float _184 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _186 = _182 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _188 = fma(_186, (*spvDescriptorSet0.vp_c9)._m0[12].x, _154);
        float _190 = _188 * _184;
        float _192 = floor(_190);
        float _194 = -_192;
        float _196 = _190 + _194;
        _198 = _196;
        _200 = true;
    }
    else
    {
        float _202 = float(_122);
        float _204 = 1.0 / _202;
        float _206 = _154 * _204;
        _198 = _206;
    }
    _200 = false;
    float _208 = _198;
    float _210 = in.m_67.x;
    float _212 = in.m_67.y;
    float _214 = in.m_67.z;
    float _216 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _218 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _216;
    int _220 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _222 = _220 != 0;
    int _224 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _226 = _224 != 0;
    int _228 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _230 = _228 != 0;
    float _232 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _234 = _232 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _236 = 1.0 / _218;
    float _238 = 1.0 / _234;
    float _240 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _242 = _208 + _240;
    float _244 = _214 * 2.0;
    float _246 = _210 * 2.0;
    float _248 = _212 + _214;
    float _250 = _210 + _214;
    float _252 = floor(_244);
    float _254 = _214 + (-0.5);
    float _256 = _212 + _210;
    float _258 = _210 + (-0.5);
    float _260 = _212 * 2.0;
    float _262 = _212 + (-0.5);
    float _264 = _248 + (-1.0);
    float _266 = _242 * _236;
    float _268 = floor(_246);
    bool _270 = !_222;
    int _272 = _270 ? 0 : 1;
    float _274 = _250 + (-1.0);
    float _276 = fma(_264, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _280 = _208 + _278;
    int _282 = abs(_272);
    float _284 = _256 + (-1.0);
    float _286 = fma(_274, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _288 = _252 > 0.0;
    float _290 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _292 = log2(_290);
    bool _294 = _252 >= 0.0;
    bool _296 = isnan(_252);
    bool _298 = _294 || _296;
    bool _300 = isnan(0.0);
    bool _302 = _298 || _300;
    float _304 = _280 * _238;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _308 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _306;
    int _310 = _302 ? 0 : 1;
    bool _312 = _268 > 0.0;
    float _314 = floor(_260);
    int _316 = ~_310;
    int _318 = _316 + 1;
    int _320 = _318 + 1;
    float _322 = fma(_284, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _324 = _268 >= 0.0;
    bool _326 = isnan(_268);
    bool _328 = _324 || _326;
    bool _330 = isnan(0.0);
    bool _332 = _328 || _330;
    float _334 = fma(_308, _266, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    int _336 = _320;
    if (!_288)
    {
        int _338 = ~_310;
        int _340 = _338 + 1;
        _336 = _340;
    }
    int _342 = _336;
    float _344 = float(_282);
    float _346 = float(_342);
    float _348 = _292 * _154;
    int _350 = _332 ? 0 : 1;
    float _352 = _344 * _346;
    int _354 = ~_350;
    int _356 = _354 + 1;
    int _358 = _356 + 1;
    float _360 = in.m_69.x;
    float _362 = in.m_69.y;
    float _364 = in.m_69.z;
    int _366 = _358;
    if (!_312)
    {
        int _368 = ~_350;
        int _370 = _368 + 1;
        _366 = _370;
    }
    int _372 = _366;
    float _374 = _352 * (-2.0);
    float _376 = exp2(_348);
    bool _378 = _314 > 0.0;
    bool _380 = _314 >= 0.0;
    bool _382 = isnan(_314);
    bool _384 = _380 || _382;
    bool _386 = isnan(0.0);
    bool _388 = _384 || _386;
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _392 = 1.0 + _390;
    bool _394 = !_226;
    int _396 = _394 ? 0 : 1;
    float _398 = float(_372);
    int _400 = abs(_396);
    float _402 = 1.0 / _392;
    bool _404 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _406 = isnan(1.0);
    bool _408 = _404 || _406;
    bool _410 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _412 = _408 || _410;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _416 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _414;
    float _418 = float(_400);
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _422 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _420;
    bool _424 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _426 = isnan(0.0);
    bool _428 = _424 || _426;
    bool _430 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _432 = _428 || _430;
    float _434 = -_376;
    float _436 = _434 + 1.0;
    float _438 = fma(_416, _266, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _440 = _418 * _398;
    int _442 = _388 ? 0 : 1;
    float _444 = fma(_422, _266, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _446 = _432 ? _436 : 0.0;
    float _448 = _440 * (-2.0);
    float _450 = fma(_374, _360, _360);
    float _452 = fma(_322, _374, _322);
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _456 = _454 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    if (_412)
    {
        float _458 = _446 * _402;
        _158 = _458;
    }
    float _460 = _158;
    float _462 = fma(_258, (*spvDescriptorSet0.vp_c9)._m0[196].x, _450);
    float _464 = fma(_448, _362, _362);
    int _466 = ~_442;
    int _468 = _466 + 1;
    int _470 = _468 + 1;
    float _472 = fma(_276, _448, _276);
    float _474 = fma(_452, _460, _462);
    bool _476 = _208 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _478 = isnan(_208);
    bool _480 = _476 || _478;
    bool _482 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _484 = _480 || _482;
    float _486 = float(_484);
    int _488 = _470;
    if (!_378)
    {
        int _490 = ~_442;
        int _492 = _490 + 1;
        _488 = _492;
    }
    int _494 = _488;
    float _496 = fma(_262, (*spvDescriptorSet0.vp_c9)._m0[196].y, _464);
    bool _498 = !_230;
    int _500 = _498 ? 0 : 1;
    float _502 = -_486;
    float _504 = _502 + 1.0;
    bool _506 = _208 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _508 = isnan(_208);
    bool _510 = _506 || _508;
    bool _512 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _514 = _510 || _512;
    float _516 = float(_514);
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _520 = _518 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    int _522 = abs(_500);
    float _524 = _474 * 0.15915493667125701904296875;
    bool _526 = _208 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _528 = isnan(_208);
    bool _530 = _526 || _528;
    bool _532 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _534 = _530 || _532;
    float _536 = float(_534);
    float _538 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _540 = _538 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _542 = _516 * _504;
    float _544 = -_516;
    float _546 = _544 + 1.0;
    float _548 = fma(_540, _304, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _550 = float(_494);
    float _552 = fma(_472, _460, _496);
    float _554 = float(_522);
    float _556 = fma(_456, _304, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _558 = fma(_520, _304, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _560 = _536 * _546;
    float _562 = -_536;
    float _564 = _562 + 1.0;
    float _566 = _554 * _550;
    float _568 = _524 * 6.283185482025146484375;
    float _570 = cos(_568);
    float _572 = in.m_71.x;
    float _574 = in.m_71.y;
    float _576 = in.m_71.z;
    float _578 = _334 * _560;
    float _580 = _566 * (-2.0);
    float _582 = _438 * _560;
    float _584 = _444 * _560;
    float _586 = _552 * 0.15915493667125701904296875;
    float _588 = fma(_580, _364, _364);
    float _590 = in.m_73.x;
    float _592 = in.m_73.y;
    float _594 = in.m_73.z;
    float _596 = fma(_286, _580, _286);
    float _598 = fma(_564, (*spvDescriptorSet0.vp_c9)._m0[143].x, _582);
    float _600 = fma(_254, (*spvDescriptorSet0.vp_c9)._m0[196].z, _588);
    float _602 = fma(_564, (*spvDescriptorSet0.vp_c9)._m0[143].y, _584);
    float _604 = fma(_564, (*spvDescriptorSet0.vp_c9)._m0[143].z, _578);
    float _606 = fma(_548, _542, _598);
    float _608 = fma(_596, _460, _600);
    float _610 = fma(_558, _542, _602);
    float _612 = fma(_556, _542, _604);
    float _614 = _586 * 6.283185482025146484375;
    float _616 = sin(_614);
    float _618 = _608 * 0.15915493667125701904296875;
    float _620 = fma(_486, (*spvDescriptorSet0.vp_c9)._m0[145].y, _610);
    float _622 = fma(_486, (*spvDescriptorSet0.vp_c9)._m0[145].z, _612);
    float _624 = fma(_486, (*spvDescriptorSet0.vp_c9)._m0[145].x, _606);
    float _626 = _622 * _576;
    float _628 = _586 * 6.283185482025146484375;
    float _630 = cos(_628);
    float _632 = in.m_60.x;
    float _634 = in.m_60.y;
    float _636 = in.m_60.z;
    float _638 = _620 * _574;
    float _640 = _624 * _572;
    float _642 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _592);
    float _644 = _638 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _646 = _524 * 6.283185482025146484375;
    float _648 = sin(_646);
    float _650 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _590);
    float _652 = _640 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _654 = _642 * _644;
    float _656 = _570 * _616;
    float _658 = _626 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _660 = _650 * _652;
    float _662 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _594);
    float _664 = _618 * 6.283185482025146484375;
    float _666 = cos(_664);
    float _668 = _570 * _630;
    float _670 = _662 * _658;
    float _672 = _618 * 6.283185482025146484375;
    float _674 = sin(_672);
    float _676 = _648 * _616;
    float _678 = _648 * _630;
    float _680 = _634 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _682 = _634 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _684 = _634 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _686 = fma(_632, (*spvDescriptorSet0.vp_c10)._m0[4].x, _680);
    float _688 = _570 * _666;
    float _690 = _630 * _666;
    float _692 = _648 * _666;
    float _694 = _616 * _666;
    float _696 = _688 * _654;
    float _698 = fma(_632, (*spvDescriptorSet0.vp_c10)._m0[6].x, _682);
    float _700 = _692 * _654;
    float _702 = fma(_636, (*spvDescriptorSet0.vp_c10)._m0[4].z, _686);
    float _704 = fma(_674, _668, _676);
    float _706 = fma(_674, _676, _668);
    float _708 = -_656;
    float _710 = fma(_674, _678, _708);
    float _712 = -_654;
    float _714 = _674 * _712;
    float _716 = -_678;
    float _718 = fma(_674, _656, _716);
    float _720 = fma(_704, _660, _696);
    float _722 = fma(_710, _660, _700);
    float _724 = fma(_690, _660, _714);
    float _726 = fma(_636, (*spvDescriptorSet0.vp_c10)._m0[6].z, _698);
    float _728 = fma(_718, _670, _720);
    float _730 = fma(_706, _670, _722);
    float _732 = fma(_694, _670, _724);
    float _734 = _726 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _736 = _728 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _738 = _728 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _740 = fma(_632, (*spvDescriptorSet0.vp_c10)._m0[5].x, _684);
    float _742 = fma(_732, (*spvDescriptorSet0.vp_c10)._m0[8].x, _736);
    float _744 = fma(_732, (*spvDescriptorSet0.vp_c10)._m0[10].x, _738);
    float _746 = _702 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _748 = fma(_636, (*spvDescriptorSet0.vp_c10)._m0[5].z, _740);
    float _750 = fma(_730, (*spvDescriptorSet0.vp_c10)._m0[8].z, _742);
    float _752 = fma(_730, (*spvDescriptorSet0.vp_c10)._m0[10].z, _744);
    float _754 = _748 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _756 = _746 + _750;
    float _758 = _734 + _752;
    float _760 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _762 = _756 + _760;
    float _764 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _766 = _758 + _764;
    float _768 = _762 * _762;
    float _770 = _766 * _766;
    float _772 = _768 + _770;
    float _774 = sqrt(_772);
    bool _776 = _774 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _778 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _780 = _774 + _778;
    float _782 = _728 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _784 = fma(_732, (*spvDescriptorSet0.vp_c10)._m0[9].x, _782);
    float _786 = fma(_730, (*spvDescriptorSet0.vp_c10)._m0[9].z, _784);
    float _788 = 0.0;
    float _790 = _784;
    float _792 = _732;
    float _794 = _756;
    float _796 = _758;
    float _798 = _768;
    float _800 = _770;
    float _802 = _692;
    if (_776)
    {
        float _804 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _788 = _804;
    }
    float _806 = _788;
    float _808 = _754 + _786;
    float _810 = _808;
    if (_776)
    {
        float _812 = _808 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _790 = _812;
    }
    float _814 = _790;
    float _816 = _814;
    if (_776)
    {
        float _818 = rsqrt(_772);
        _792 = _818;
    }
    float _820 = _792;
    float _822 = _806;
    if (_776)
    {
        float _824 = _780 * _806;
        _822 = _824;
    }
    float _826 = _822;
    float _828 = _826;
    if (_776)
    {
        float _830 = _826 * 0.15915493667125701904296875;
        _828 = _830;
    }
    float _832 = _828;
    float _834 = _632;
    if (_776)
    {
        float _836 = _832 * 6.283185482025146484375;
        float _838 = sin(_836);
        _834 = _838;
    }
    float _840 = _834;
    if (_776)
    {
        float _842 = fma(_840, _814, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _816 = _842;
    }
    float _844 = _816;
    float _846 = _844;
    if (_776)
    {
        float _848 = _820 * _844;
        _846 = _848;
    }
    float _850 = _846;
    if (_776)
    {
        float _852 = fma(_762, _850, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _794 = _852;
    }
    float _854 = _794;
    if (_776)
    {
        float _856 = fma(_766, _850, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _796 = _856;
    }
    float _858 = _796;
    float _860 = fma(_854, 6.2500002968590706586837768554688e-05, 0.5);
    float _862 = fma(_858, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _3906 = float2(_860, _862);
    float3 _866 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_3906, float2(0.0), isnan(_3906)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_3906, float2(0.0), isnan(_3906)), level(0.0)).xyz;
    float _868 = _866.x;
    float _870 = _866.y;
    float _872 = _866.z;
    float _874 = in.m_75.y;
    bool _876 = _592 != 0.0;
    bool _878 = isnan(_592);
    bool _880 = _876 || _878;
    bool _882 = isnan(0.0);
    bool _884 = _880 || _882;
    float _886 = _832;
    if (_776)
    {
        float _888 = _832 * 6.283185482025146484375;
        float _890 = cos(_888);
        _886 = _890;
    }
    float _892 = _886;
    int _894 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _896 = _894 != 0;
    float _898 = in.m_67.w;
    bool _900 = _590 == 0.0;
    bool _902 = !_884;
    bool _904 = _900 && _902;
    int _906 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _908 = _906 != 0;
    float _910 = in.m_77.x;
    float _912 = in.m_77.y;
    float _914 = in.m_77.z;
    bool _916 = _594 == 0.0;
    bool _918 = _916 && _904;
    float _920 = in.m_75.x;
    float _922 = _780;
    float _924 = 1.0;
    float _926 = 1.0;
    if (_896)
    {
        float _928 = in.m_67.z;
        _922 = _928;
    }
    float _930 = _922;
    out.m_79.x = 1.0;
    out.m_79.y = 1.0;
    out.m_79.z = 1.0;
    float _932 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _934 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _936 = -_874;
    float _938 = _936 + 1.0;
    float _940 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _942 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _944 = _932 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _946 = _898 > 0.5;
    float _948 = _934 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _950 = _940 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _952 = _874;
    if (_908)
    {
        float _954 = _946 ? _938 : _874;
        _952 = _954;
    }
    float _956 = _952;
    float _958 = 0.0;
    float _960 = _910;
    float _962 = _912;
    if (_918)
    {
        _958 = _910;
    }
    float _964 = _958;
    out.m_81.x = _944;
    out.m_81.y = _948;
    out.m_81.z = _950;
    out.m_81.w = _942;
    float _966 = _964;
    if (!_896)
    {
        _924 = _920;
    }
    float _968 = _924;
    float _970 = 0.0;
    float _972 = _968;
    if (_918)
    {
        _970 = _964;
    }
    float _974 = _970;
    bool _976 = _930 > 0.5;
    bool _978 = _976 && _896;
    float _980 = in.m_83.x;
    float _982 = in.m_83.y;
    float _984 = in.m_83.z;
    float _986 = in.m_83.w;
    float _988 = _974;
    float _990 = _892;
    if (!_918)
    {
        _966 = _910;
    }
    float _992 = _966;
    if (_918)
    {
        _960 = _912;
    }
    float _994 = _960;
    float _996 = _994;
    if (_918)
    {
        _926 = _914;
    }
    float _998 = _926;
    float _1000 = _998;
    if (!_918)
    {
        float _1002 = fma(_594, (*spvDescriptorSet0.vp_c9)._m0[17].y, _914);
        _1000 = _1002;
    }
    float _1004 = _1000;
    float _1006 = 0.0;
    if (_918)
    {
        _1006 = _994;
    }
    float _1008 = _1006;
    float _1010 = _1008;
    if (!_918)
    {
        float _1012 = fma(_590, (*spvDescriptorSet0.vp_c9)._m0[17].y, _992);
        _988 = _1012;
    }
    float _1014 = _988;
    if (!_918)
    {
        _996 = _912;
    }
    float _1016 = _996;
    if (_896)
    {
        _962 = _920;
    }
    float _1018 = _962;
    float _1020 = _1018;
    if (!_918)
    {
        float _1022 = fma(_592, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1016);
        _1010 = _1022;
    }
    float _1024 = _1010;
    if (_978)
    {
        float _1026 = -_1018;
        float _1028 = _1026 + 1.0;
        _1020 = _1028;
    }
    float _1030 = _1020;
    float _1032 = -_1024;
    float _1034 = _674 * _1032;
    float _1036 = _692 * _1024;
    if (_896)
    {
        _972 = _1030;
    }
    float _1038 = _972;
    float _1040 = fma(_690, _1014, _1034);
    float _1042 = fma(_710, _1014, _1036);
    float _1044 = _984 * _992;
    float _1046 = _982 * _914;
    float _1048 = _980 * _1016;
    float _1050 = fma(_694, _1004, _1040);
    float _1052 = -_1044;
    float _1054 = fma(_980, _914, _1052);
    float _1056 = -_1046;
    float _1058 = fma(_984, _1016, _1056);
    float _1060 = -_1048;
    float _1062 = fma(_982, _992, _1060);
    float _1064 = -_982;
    float _1066 = _674 * _1064;
    float _1068 = _1054 * _986;
    float _1070 = _688 * _1024;
    float _1072 = _1058 * _986;
    float _1074 = _1062 * _986;
    float _1076 = -_1068;
    float _1078 = _674 * _1076;
    float _1080 = _688 * _982;
    float _1082 = _688 * _1068;
    float _1084 = _692 * _982;
    float _1086 = _692 * _1068;
    float _1088 = fma(_704, _1014, _1070);
    float _1090 = fma(_690, _1072, _1078);
    float _1092 = fma(_704, _1072, _1082);
    float _1094 = fma(_690, _980, _1066);
    float _1096 = fma(_704, _980, _1080);
    float _1098 = fma(_710, _980, _1084);
    float _1100 = fma(_710, _1072, _1086);
    float _1102 = fma(_718, _1004, _1088);
    float _1104 = fma(_694, _984, _1094);
    float _1106 = fma(_718, _984, _1096);
    float _1108 = fma(_706, _984, _1098);
    float _1110 = fma(_694, _1074, _1090);
    float _1112 = fma(_718, _1074, _1092);
    float _1114 = fma(_706, _1074, _1100);
    float _1116 = _1102 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1118 = _1074;
    float _1120 = _1116;
    if (_776)
    {
        float _1122 = _892 + (-1.0);
        _1118 = _1122;
    }
    float _1124 = _1118;
    float _1126 = _1102 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1128 = _1102 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1130 = fma(_1050, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1116);
    float _1132 = _1124;
    float _1134 = _1126;
    if (_776)
    {
        float _1136 = _1124 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1120 = _1136;
    }
    float _1138 = _1120;
    float _1140 = fma(_706, _1004, _1042);
    float _1142 = fma(_1050, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1126);
    float _1144 = fma(_1050, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1128);
    float _1146 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1148 = _1106 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    if (_776)
    {
        float _1150 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1152 = _854 + _1150;
        _1132 = _1152;
    }
    float _1154 = _1132;
    if (_776)
    {
        float _1156 = fma(_808, _892, _1138);
        _810 = _1156;
    }
    float _1158 = _810;
    if (_776)
    {
        float _1160 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1162 = _858 + _1160;
        _1134 = _1162;
    }
    float _1164 = _1134;
    float _1166 = fma(_1104, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1148);
    if (_776)
    {
        float _1168 = _1154 * _1154;
        _798 = _1168;
    }
    float _1170 = _798;
    float _1172 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1174 = _1158 + _1172;
    float _1176 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1178 = _1106 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    if (_776)
    {
        float _1180 = _1164 * _1164;
        _800 = _1180;
    }
    float _1182 = _800;
    float _1184 = fma(_1174, _1174, _1170);
    float _1186 = _1106 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1188 = _1038 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1190 = fma(_1104, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1178);
    float _1192 = _1184 + _1182;
    float _1194 = fma(_1104, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1186);
    float _1196 = _1112 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1198 = _1112 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1200 = _1112 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1202 = _1188 * _1146;
    float _1204 = _956 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1206 = sqrt(_1192);
    float _1208 = fma(_1110, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1196);
    float _1210 = fma(_1110, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1198);
    float _1212 = fma(_1110, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1200);
    float _1214 = _1204 * _1176;
    float _1216 = fma(_1108, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1166);
    float _1218 = fma(_1108, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1190);
    float _1220 = fma(_1114, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1208);
    float _1222 = fma(_1114, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1210);
    float _1224 = fma(_1140, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1130);
    float _1226 = fma(_1108, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1194);
    float _1228 = fma(_1114, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1212);
    float _1230 = fma(_1140, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1142);
    float _1232 = fma(_1140, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1144);
    out.m_85.z = _1202;
    out.m_85.w = _1214;
    bool _1234 = _1206 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1236 = isnan(_1206);
    bool _1238 = _1234 || _1236;
    bool _1240 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1242 = _1238 || _1240;
    out.m_87.x = _1216;
    out.m_87.y = _1218;
    out.m_87.z = _1226;
    out.m_89.x = _1220;
    out.m_89.y = _1222;
    out.m_89.z = _1228;
    out.m_91.x = _1224;
    out.m_91.y = _1230;
    out.m_91.z = _1232;
    if (!_1242)
    {
        _802 = 1.0;
    }
    float _1244 = _802;
    out.m_93.x = _868;
    out.m_93.y = _870;
    out.m_93.z = _872;
    bool _1246 = !_1242;
    float _1248 = _1244;
    if (!_1246)
    {
        bool _1250 = _1206 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1252 = isnan(_1206);
        bool _1254 = _1250 || _1252;
        bool _1256 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1258 = _1254 || _1256;
        if (!_1258)
        {
            float _1260 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1262 = _1206 + _1260;
            float _1264 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1266 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1264;
            float _1268 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1270 = _1268 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1272 = 1.0 / _1266;
            float _1274 = _1262 * _1272;
            float _1276 = fma(_1274, _1270, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1248 = _1276;
            _1278 = true;
        }
        else
        {
            bool _1280 = _1206 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1282 = isnan(_1206);
            bool _1284 = _1280 || _1282;
            bool _1286 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1288 = _1284 || _1286;
            if (!_1288)
            {
                float _1290 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1292 = _1206 + _1290;
                float _1294 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1296 = _1294 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1298 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1300 = _1298 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1302 = 1.0 / _1296;
                float _1304 = _1292 * _1302;
                float _1306 = fma(_1304, _1300, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1248 = _1306;
                _1278 = true;
            }
            else
            {
                _1248 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1278 = false;
    float _1308 = _1248;
    float _1310 = fma(_746, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1312 = fma(_734, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1314 = floor(_1310);
    float _1316 = floor(_1312);
    float _1318 = -_1314;
    float _1320 = _1310 + _1318;
    float _1322 = -_1316;
    float _1324 = _1312 + _1322;
    float2 _4725 = float2(_1320, _1324);
    float _1326 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4725, float2(0.0), isnan(_4725)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4725, float2(0.0), isnan(_4725)), level(0.0)).x;
    float _1328 = _754 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1330 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1332 = _1158 + _1330;
    float _1334 = fma(_746, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1328);
    float _1336 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1338 = _858 + _1336;
    float _1340 = fma(_1332, _1308, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1342 = fma(_734, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1334);
    float _1344 = _754 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1346 = _1342 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1348 = fma(_746, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1344);
    float _1350 = 1.0 / _1346;
    float _1352 = fma(_734, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1348);
    float _1354 = _1352 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1356 = _1354 + _1346;
    float _1358 = _1356 * _1350;
    float _1360 = _1358 * 0.5;
    float _1362 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1364 = fma(_1360, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1362);
    float _1366 = 1.0 / _1364;
    float _1368 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _1370 = _754 + _1368;
    float _1372 = _1370 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1374 = _1370 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1376 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1378 = _1366 * _1376;
    float _1380 = fma(_746, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1372);
    float _1382 = fma(_746, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1374);
    bool _1384 = _1378 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1386 = fma(_734, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1380);
    bool _1388 = _1378 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1390 = fma(_734, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1382);
    bool _1392 = !_1384;
    int _1394 = _1392 ? 0 : 1;
    float _1396 = _1386 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1398 = _1390 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1400 = trunc(_1396);
    int _1402 = int(_1400);
    int _1404 = 2;
    float _1406 = _1386;
    float _1408 = _1398;
    if (!_1384)
    {
        _1404 = 1;
    }
    int _1410 = _1404;
    int _1412 = _1410;
    if (!_1388)
    {
        _1412 = _1394;
    }
    int _1414 = _1412;
    float _1416 = trunc(_1398);
    int _1418 = int(_1416);
    int _1420 = _1414 << 6;
    bool _1422 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1424 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1426 = _1422 || _1424;
    bool _1428 = isnan(0.5);
    bool _1430 = _1426 || _1428;
    float _1432 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1434 = _854 + _1432;
    int _1436 = _1420 + 48;
    uint _1439 = uint(int(uint(_1436) >> uint(2)));
    uint _1441 = uint(int(uint(int(_1439)) >> uint(2)));
    int _1443 = int(_1439) & 3;
    float _1445 = (*spvDescriptorSet0.vp_c15)._m0[int(_1441)][_1443];
    int _1447 = int(_1439) + 1;
    uint _1449 = uint(int(uint(_1447) >> uint(2)));
    int _1451 = _1447 & 3;
    float _1453 = (*spvDescriptorSet0.vp_c15)._m0[int(_1449)][_1451];
    int _1455 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1457 = _1402 + _1455;
    int _1459 = _1457 + 1;
    float _1461 = fma(_1434, _1308, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1463 = fma(_1338, _1308, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    bool _1465 = _1459 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1467 = _1420 + 56;
    uint _1469 = uint(int(uint(_1467) >> uint(2)));
    uint _1471 = uint(int(uint(int(_1469)) >> uint(2)));
    int _1473 = int(_1469) & 3;
    float _1475 = (*spvDescriptorSet0.vp_c15)._m0[int(_1471)][_1473];
    int _1477 = int(_1469) + 1;
    uint _1479 = uint(int(uint(_1477) >> uint(2)));
    int _1481 = _1477 & 3;
    float _1483 = (*spvDescriptorSet0.vp_c15)._m0[int(_1479)][_1481];
    int _1485 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1487 = _1418 + _1485;
    int _1489 = _1487 + 1;
    float _1491 = _1434;
    int _1493 = _1489;
    if (_1430)
    {
        _1491 = _1340;
    }
    float _1495 = _1491;
    int _1497 = _1459 | _1489;
    float _1499 = as_type<float>(_1497);
    float _1501 = _1495;
    if (_1430)
    {
        _1406 = _1463;
    }
    float _1503 = _1406;
    int _1505 = _1420 + 64;
    uint _1507 = uint(int(uint(_1505) >> uint(2)));
    uint _1509 = uint(int(uint(int(_1507)) >> uint(2)));
    int _1511 = int(_1507) & 3;
    float _1513 = (*spvDescriptorSet0.vp_c15)._m0[int(_1509)][_1511];
    int _1515 = int(_1507) + 1;
    uint _1517 = uint(int(uint(_1515) >> uint(2)));
    int _1519 = _1515 & 3;
    float _1521 = (*spvDescriptorSet0.vp_c15)._m0[int(_1517)][_1519];
    bool _1523 = _1497 < 0;
    bool _1525 = _1523 || _1465;
    float _1527 = _1503;
    if (_1430)
    {
        _1499 = _1461;
    }
    float _1529 = _1499;
    bool _1531 = _1489 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1533 = _1531 || _1525;
    int _1535 = _1420 + 72;
    uint _1537 = uint(int(uint(_1535) >> uint(2)));
    uint _1539 = uint(int(uint(int(_1537)) >> uint(2)));
    int _1541 = int(_1537) & 3;
    float _1543 = (*spvDescriptorSet0.vp_c15)._m0[int(_1539)][_1541];
    int _1545 = int(_1537) + 1;
    uint _1547 = uint(int(uint(_1545) >> uint(2)));
    int _1549 = _1545 & 3;
    float _1551 = (*spvDescriptorSet0.vp_c15)._m0[int(_1547)][_1549];
    int _1553 = _1420 + 96;
    uint _1555 = uint(int(uint(_1553) >> uint(2)));
    uint _1557 = uint(int(uint(int(_1555)) >> uint(2)));
    int _1559 = int(_1555) & 3;
    float _1561 = (*spvDescriptorSet0.vp_c15)._m0[int(_1557)][_1559];
    int _1563 = int(_1555) + 1;
    uint _1565 = uint(int(uint(_1563) >> uint(2)));
    int _1567 = _1563 & 3;
    float _1569 = (*spvDescriptorSet0.vp_c15)._m0[int(_1565)][_1567];
    int _1571 = _1420 + 104;
    uint _1573 = uint(int(uint(_1571) >> uint(2)));
    uint _1575 = uint(int(uint(int(_1573)) >> uint(2)));
    int _1577 = int(_1573) & 3;
    float _1579 = (*spvDescriptorSet0.vp_c15)._m0[int(_1575)][_1577];
    int _1581 = int(_1573) + 1;
    uint _1583 = uint(int(uint(_1581) >> uint(2)));
    int _1585 = _1581 & 3;
    float _1587 = (*spvDescriptorSet0.vp_c15)._m0[int(_1583)][_1585];
    float _1589 = _1529;
    int _1591 = as_type<int>(_1569);
    if (!_1430)
    {
        float _1593 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1595 = _754 + _1593;
        float _1597 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1599 = _746 + _1597;
        float _1601 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1603 = _1595 * _1595;
        float _1605 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1607 = _734 + _1605;
        float _1609 = fma(_1599, _1599, _1603);
        float _1611 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1613 = fma(_1607, _1607, _1609);
        float _1615 = sqrt(_1613);
        float _1617 = _1601 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1619 = -_754;
        float _1621 = _1619 + _1340;
        float _1623 = precise::min(_1615, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1625 = _1623 * _1611;
        float _1627 = -_734;
        float _1629 = _1627 + _1463;
        float _1631 = _1617 * _1625;
        float _1633 = -_746;
        float _1635 = _1633 + _1461;
        float _1637 = fma(_1621, _1631, _754);
        float _1639 = fma(_1635, _1631, _746);
        float _1641 = fma(_1629, _1631, _734);
        _1501 = _1637;
        _1589 = _1639;
        _1527 = _1641;
    }
    float _1643 = _1501;
    float _1645 = _1589;
    float _1647 = _1527;
    float _1649 = _1370 * _1569;
    float _1651 = _1643 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (!_1533)
    {
        int _1653 = _1489 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1655 = _1653 + _1459;
        _1591 = _1655;
    }
    int _1657 = _1591;
    float _1659 = _1370 * _1521;
    float _1661 = fma(_746, _1561, _1649);
    float _1663 = fma(_1645, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1651);
    float _1665 = _1370 * _1453;
    if (!_1533)
    {
        int _1667 = _1657 << 2;
        _1493 = _1667;
    }
    int _1669 = _1493;
    float _1671 = fma(_734, _1579, _1661);
    float _1673 = fma(_1647, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1663);
    float _1675 = fma(_746, _1445, _1665);
    float _1677 = fma(_746, _1513, _1659);
    float _1679 = _1671 + _1587;
    float _1681 = _1673 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1683 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1685 = fma(_734, _1475, _1675);
    float _1687 = 1.0 / _1679;
    float _1689 = _1681 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    int _1691 = as_type<int>(_1673);
    int _1693 = _1669;
    float _1695 = _1683;
    float _1697 = _1679;
    if (!_1533)
    {
        uint _1699 = uint(int(uint(_1657) >> uint(2)));
        _1691 = int(_1699);
    }
    int _1701 = _1691;
    int _1703 = _1420 + 80;
    uint _1705 = uint(int(uint(_1703) >> uint(2)));
    uint _1707 = uint(int(uint(int(_1705)) >> uint(2)));
    int _1709 = int(_1705) & 3;
    float _1711 = (*spvDescriptorSet0.vp_c15)._m0[int(_1707)][_1709];
    int _1713 = int(_1705) + 1;
    uint _1715 = uint(int(uint(_1713) >> uint(2)));
    int _1717 = _1713 & 3;
    float _1719 = (*spvDescriptorSet0.vp_c15)._m0[int(_1715)][_1717];
    if (!_1533)
    {
        int _1721 = 12 & _1669;
        _1693 = _1721;
    }
    int _1723 = _1693;
    float _1725 = -_1689;
    float _1727 = fma(_1725, _1683, 1.0);
    float _1729 = fma(_734, _1543, _1677);
    float _1731 = _1685 + _1483;
    float _1733 = _1643 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    int _1735 = _1723;
    if (!_1533)
    {
        int _1737 = _1701 << 4;
        int _1739 = _1737 + _1723;
        _1735 = _1739;
    }
    int _1741 = _1735;
    float _1743 = _1729 + _1551;
    int _1745 = _1420 + 88;
    uint _1747 = uint(int(uint(_1745) >> uint(2)));
    uint _1749 = uint(int(uint(int(_1747)) >> uint(2)));
    int _1751 = int(_1747) & 3;
    float _1753 = (*spvDescriptorSet0.vp_c15)._m0[int(_1749)][_1751];
    int _1755 = int(_1747) + 1;
    uint _1757 = uint(int(uint(_1755) >> uint(2)));
    int _1759 = _1755 & 3;
    float _1761 = (*spvDescriptorSet0.vp_c15)._m0[int(_1757)][_1759];
    float _1763 = fma(_1645, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1733);
    float _1765 = _1643 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1767 = _1643 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1769 = log2(_1727);
    float _1771 = _1731 * _1687;
    float _1773 = fma(_1645, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1765);
    float _1775 = fma(_1645, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1767);
    float _1777 = _1731;
    float _1779 = _1687;
    float _1781 = _1771;
    if (!_1533)
    {
        int _1783 = _1741 + 400;
        uint _1785 = uint(int(uint(_1783) >> uint(2)));
        uint _1787 = uint(int(uint(int(_1785)) >> uint(2)));
        int _1789 = int(_1785) & 3;
        float _1791 = (*spvDescriptorSet0.vp_c15)._m0[int(_1787)][_1789];
        _1777 = _1791;
    }
    float _1793 = _1777;
    float _1795 = _1743 * _1687;
    float _1797 = fma(_1647, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1773);
    bool _1799 = _1771 >= 0.0;
    float _1801 = fma(_1647, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1775);
    float _1803 = fma(_1647, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1763);
    float _1805 = _1797 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _1807 = _1771 <= 1.0;
    bool _1809 = _1807 && _1799;
    float _1811 = _1801 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1813 = _1803 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1815 = _1805 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1817 = _1795 >= 0.0;
    bool _1819 = _1817 && _1809;
    float _1821 = _1805 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1823 = _1805 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1825 = fma(_1811, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1815);
    bool _1827 = _1795 <= 1.0;
    bool _1829 = _1827 && _1819;
    if (!_1533)
    {
        float _1831 = floor(_1396);
        _1695 = _1831;
    }
    float _1833 = _1695;
    float _1835 = fma(_1811, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1821);
    float _1837 = fma(_1681, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1825);
    float _1839 = fma(_1811, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1823);
    float _1841 = _1769 * 0.693147182464599609375;
    float _1843 = fma(_1813, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1837);
    float _1845 = _1340;
    if (!_1533)
    {
        float _1847 = floor(_1398);
        _1845 = _1847;
    }
    float _1849 = _1845;
    float _1851 = _1841 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    if (_1829)
    {
        float _1853 = float(_1414);
        _1697 = _1853;
    }
    float _1855 = _1697;
    float _1857 = 1.0 / _1843;
    float _1859 = _1370 * _1719;
    float _1861 = fma(_746, _1711, _1859);
    float _1863 = fma(_1681, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1835);
    float _1865 = fma(_1681, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1839);
    float _1867 = _1855;
    if (_1829)
    {
        float _1869 = rint(_1855);
        float _1871 = precise::max(_1869, 0.0);
        uint _1873 = uint(_1871);
        uint _1875 = clamp(_1873, 0u, 65535u);
        _1867 = as_type<float>(_1875);
    }
    float _1877 = _1867;
    float _1879 = fma(_734, _1753, _1861);
    float _1881 = fma(_1813, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1863);
    float _1883 = fma(_1813, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1865);
    float _1885 = _1849;
    float _1887 = _1883;
    float _1889 = _1881;
    if (!_1533)
    {
        float _1891 = -_1849;
        float _1893 = _1398 + _1891;
        _1885 = _1893;
    }
    float _1895 = _1885;
    float _1897 = _1879 + _1761;
    float _1899 = as_type<float>(_1741);
    if (!_1533)
    {
        float _1901 = rint(_1793);
        float _1903 = precise::max(_1901, 0.0);
        uint _1905 = uint(_1903);
        uint _1907 = clamp(_1905, 0u, 65535u);
        _1899 = as_type<float>(_1907);
    }
    float _1909 = _1899;
    float _1911 = _1881 * _1857;
    float _1913 = _1883 * _1857;
    float _1915 = _1897 * _1687;
    float _1917 = _1857;
    if (!_1533)
    {
        float _1919 = -_1833;
        float _1921 = _1396 + _1919;
        _1917 = _1921;
    }
    float _1923 = _1917;
    float _1925 = fma(_1911, 0.5, 0.5);
    float _1927 = fma(_1913, -0.5, 0.5);
    float _1929 = _1795;
    if (_1829)
    {
        float3 _5749 = float3(_1771, _1795, float(as_type<int>(_1877)));
        float3 _5753 = select(_5749, float3(0.0), isnan(_5749));
        float _1931 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5753.xy, uint(rint(_5753.z)), _1915, level(0.0));
        _1929 = _1931;
    }
    float _1933 = _1929;
    float3 _5763 = float3(_1925, _1927, _1851);
    float _1935 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5763, float3(0.0), isnan(_5763)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5763, float3(0.0), isnan(_5763)), level(0.0)).x;
    float3 _5772 = float3(_1925, _1927, _1851);
    float4 _1938 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5772, float3(0.0), isnan(_5772)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5772, float3(0.0), isnan(_5772)), level(0.0)).xyzw;
    float _1940 = _1938.x;
    float _1942 = _1938.y;
    float _1944 = _1938.z;
    float _1946 = _1938.w;
    float _1948 = _1923;
    if (!_1533)
    {
        float3 _5795 = float3(_1923, _1895, float(as_type<int>(_1909)));
        float3 _5797 = select(_5795, float3(0.0), isnan(_5795));
        float _1950 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5797.xy, uint(rint(_5797.z)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5797.xy, uint(rint(_5797.z)), level(0.0)).x;
        _1948 = _1950;
    }
    float _1952 = _1948;
    if (_1533)
    {
        _1408 = 1.0;
    }
    float _1954 = _1408;
    float _1956 = _1954;
    if (!_1533)
    {
        int _1958 = _1657 << 4;
        int _1960 = _1958 + 2048;
        uint _1962 = uint(int(uint(_1960) >> uint(2)));
        uint _1964 = uint(int(uint(int(_1962)) >> uint(2)));
        int _1966 = int(_1962) & 3;
        float _1968 = (*spvDescriptorSet0.vp_c15)._m0[int(_1964)][_1966];
        int _1970 = int(_1962) + 1;
        uint _1972 = uint(int(uint(_1970) >> uint(2)));
        int _1974 = _1970 & 3;
        float _1976 = (*spvDescriptorSet0.vp_c15)._m0[int(_1972)][_1974];
        int _1978 = _1960 + 8;
        uint _1980 = uint(int(uint(_1978) >> uint(2)));
        uint _1982 = uint(int(uint(int(_1980)) >> uint(2)));
        int _1984 = int(_1980) & 3;
        float _1986 = (*spvDescriptorSet0.vp_c15)._m0[int(_1982)][_1984];
        int _1988 = int(_1980) + 1;
        uint _1990 = uint(int(uint(_1988) >> uint(2)));
        int _1992 = _1988 & 3;
        float _1994 = (*spvDescriptorSet0.vp_c15)._m0[int(_1990)][_1992];
        float _1996 = _1370 * _1976;
        float _1998 = fma(_746, _1968, _1996);
        float _2000 = fma(_734, _1986, _1998);
        float _2002 = _2000 + _1994;
        float _2004 = precise::clamp(_2002, 0.0, 1.0);
        float _2006 = -_2004;
        float _2008 = _2006 + _1952;
        float _2010 = fma(_2008, 500.0, 1.5);
        float _2012 = exp2(_2010);
        float _2014 = 0.0 + _2012;
        float _2016 = precise::clamp(_2014, 0.0, 1.0);
        _1779 = _1986;
        _1781 = _1976;
        _1956 = _2016;
    }
    float _2018 = _1779;
    float _2020 = _1781;
    float _2022 = _1956;
    float _2024 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2026 = _1643 + _2024;
    float _2028 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2030 = _1645 + _2028;
    float _2032 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2034 = _1647 + _2032;
    float _2036 = _2026 * _2026;
    float _2038 = fma(_2030, _2030, _2036);
    float _2040 = fma(_2034, _2034, _2038);
    float _2042 = rsqrt(_2040);
    float _2044 = _2042 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2046 = _2030 * _2044;
    float _2048 = _2034 * _2044;
    float _2050 = _2046 * _2046;
    float _2052 = _2048 * _2048;
    float _2054 = _2050 + _2052;
    float _2056 = sqrt(_2054);
    bool _2058 = _2056 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2060 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2062 = _2056 + _2060;
    float _2064 = _2034;
    float _2066 = _2020;
    float _2068 = _2062;
    float _2070 = _2018;
    float _2072 = _2026;
    if (_2058)
    {
        float _2074 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2064 = _2074;
    }
    float _2076 = _2064;
    if (_2058)
    {
        float _2078 = rsqrt(_2054);
        _2066 = _2078;
    }
    float _2080 = _2066;
    float _2082 = _2080;
    if (_2058)
    {
        float _2084 = _2062 * _2076;
        _2068 = _2084;
    }
    float _2086 = _2068;
    if (_2058)
    {
        float _2088 = _2086 * 0.15915493667125701904296875;
        _2070 = _2088;
    }
    float _2090 = _2070;
    float _2092 = _2042;
    if (_2058)
    {
        float _2094 = _2090 * 6.283185482025146484375;
        float _2096 = sin(_2094);
        _2092 = _2096;
    }
    float _2098 = _2092;
    float _2100 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2102 = precise::max(0.0, _2100);
    float _2104 = _2036;
    float _2106 = _2102;
    float _2108 = _2100;
    if (_2058)
    {
        float _2110 = _2090 * 6.283185482025146484375;
        float _2112 = cos(_2110);
        _2104 = _2112;
    }
    float _2114 = _2104;
    float _2116 = -_2044;
    float _2118 = -_2102;
    float _2120 = fma(_2026, _2116, _2118);
    if (!_2058)
    {
        _2072 = _2048;
    }
    float _2122 = _2072;
    float _2124 = _2122;
    if (_2058)
    {
        float _2126 = _2120 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2106 = _2126;
    }
    float _2128 = _2106;
    float _2130 = _2128;
    float _2132 = _2098;
    if (_2058)
    {
        float _2134 = fma(_2098, _2128, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2130 = _2134;
    }
    float _2136 = _2130;
    float _2138 = _2136;
    if (!_2058)
    {
        _2132 = _2046;
    }
    float _2140 = _2132;
    float _2142 = _2140;
    float _2144 = _2114;
    if (_2058)
    {
        float _2146 = _2114 + (-1.0);
        _2108 = _2146;
    }
    float _2148 = _2108;
    float _2150 = _2148;
    if (_2058)
    {
        float _2152 = _2080 * _2136;
        _990 = _2152;
    }
    float _2154 = _990;
    if (!_2058)
    {
        _2138 = _2120;
    }
    float _2156 = _2138;
    float _2158 = _2156;
    if (_2058)
    {
        float _2160 = _2148 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2150 = _2160;
    }
    float _2162 = _2150;
    if (_2058)
    {
        float _2164 = _2046 * _2154;
        _2142 = _2164;
    }
    float _2166 = _2142;
    if (!_2058)
    {
        _2082 = _2050;
    }
    float _2168 = _2082;
    float _2170 = _2168;
    if (_2058)
    {
        float _2172 = _2048 * _2154;
        _2124 = _2172;
    }
    float _2174 = _2124;
    if (_2058)
    {
        float _2176 = fma(_2120, _2114, _2162);
        _2158 = _2176;
    }
    float _2178 = _2158;
    if (_2058)
    {
        float _2180 = _2166 * _2166;
        _2170 = _2180;
    }
    float _2182 = _2170;
    if (!_2058)
    {
        _2144 = _2052;
    }
    float _2184 = _2144;
    float _2186 = _2184;
    if (_2058)
    {
        float _2188 = _2174 * _2174;
        _2186 = _2188;
    }
    float _2190 = _2186;
    float _2192 = sqrt(_2040);
    float _2194 = fma(_2178, _2178, _2182);
    float _2196 = _2194 + _2190;
    float _2198 = rsqrt(_2196);
    float _2200 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2202 = fma(_2192, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2200);
    float _2204 = precise::clamp(_2202, 0.0, 1.0);
    float _2206 = -_2204;
    float _2208 = _2206 + 1.0;
    float _2210 = abs(_2208);
    float _2212 = log2(_2210);
    float _2214 = _2198 * _2166;
    float _2216 = _2198 * _2178;
    float _2218 = _2198 * _2174;
    float _2220 = _2214 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2222 = -_2220;
    float _2224 = fma(_2216, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2222);
    float _2226 = -_2218;
    float _2228 = fma(_2226, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2224);
    float _2230 = _2212 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2232 = fma(_2228, -0.5, 0.5);
    float _2234 = fma(_2228, 0.5, 0.5);
    float _2236 = exp2(_2230);
    float _2238 = fma(_2234, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2240 = fma(_2234, _2238, -0.212114393711090087890625);
    float _2242 = _2216 + 1.0;
    float _2244 = sqrt(_2232);
    float _2246 = fma(_2234, _2240, 1.570728778839111328125);
    float _2248 = -_2216;
    float _2250 = fma(_2236, _2242, _2248);
    float _2252 = _2244 * 0.636619746685028076171875;
    float _2254 = fma(_2250, 0.5, 0.5);
    float _2256 = -_2246;
    float _2258 = fma(_2252, _2256, 1.0);
    float2 _6274 = float2(_2258, _2254);
    float3 _2260 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6274, float2(0.0), isnan(_6274)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6274, float2(0.0), isnan(_6274)), level(0.0)).xyz;
    float _2262 = _2260.x;
    float _2264 = _2260.y;
    float _2266 = _2260.z;
    float _2268 = abs(_1378);
    float _2270 = log2(_2268);
    float _2272 = _2212 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2274 = -_1326;
    float _2276 = _2274 + 1.0;
    out.m_95.x = _1645;
    out.m_95.y = _1643;
    out.m_95.z = _1647;
    bool _2278 = _2192 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2280 = isnan(_2192);
    bool _2282 = _2278 || _2280;
    bool _2284 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2286 = _2282 || _2284;
    float _2288 = exp2(_2272);
    bool _2290 = _1378 <= 8000.0;
    bool _2292 = isnan(_1378);
    bool _2294 = _2290 || _2292;
    bool _2296 = isnan(8000.0);
    bool _2298 = _2294 || _2296;
    float _2300 = float(_2298);
    float _2302 = _2270 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2304 = _1805 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2306 = fma(_1811, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2304);
    float _2308 = exp2(_2302);
    float _2310 = fma(_2308, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2312 = precise::clamp(_2310, 0.0, 1.0);
    float _2314 = fma(_1681, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2306);
    float _2316 = -_2288;
    float _2318 = _2316 + 1.0;
    float _2320 = fma(_2312, -2.0, 3.0);
    float _2322 = _2312 * _2312;
    float _2324 = fma(_1813, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2314);
    float _2326 = _2322 * _2320;
    out.gl_Position.x = _1881;
    out.gl_Position.y = _1883;
    out.gl_Position.z = _2324;
    out.gl_Position.w = _1843;
    float _2328 = -_2326;
    float _2330 = _2328 + 1.0;
    float _2332 = fma(_2330, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2326);
    float _2334 = _2300 * _2332;
    float _2336 = _2300;
    float _2338 = _2324;
    if (!_1829)
    {
        _2336 = 1.0;
    }
    float _2340 = _2336;
    float _2342 = _2340;
    if (_1829)
    {
        bool _2344 = _1933 >= _1915;
        bool _2346 = isnan(_1933);
        bool _2348 = _2344 || _2346;
        bool _2350 = isnan(_1915);
        bool _2352 = _2348 || _2350;
        float _2354 = float(_2352);
        _2342 = _2354;
    }
    float _2356 = _2342;
    float _2358 = _2334 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2360 = _2318 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (!_2286)
    {
        _2338 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2362 = _2338;
    float _2364 = _2276 * _2358;
    float _2366 = precise::clamp(_2364, 0.0, 1.0);
    float _2368 = _2356 * _2022;
    float _2370 = _2360 * _1935;
    float _2372 = -_2360;
    float _2374 = _2372 + 1.0;
    float _2376 = -_2366;
    float _2378 = fma(_2376, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2380 = _2368;
    float _2382 = _2362;
    float _2384 = _2362;
    if (!_2286)
    {
        _1887 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2386 = _1887;
    float _2388 = _1946 * _2370;
    float _2390 = _1946 * _2374;
    float _2392 = -_2368;
    float _2394 = fma(_2392, _2378, 1.0);
    float _2396 = precise::clamp(_2394, 0.0, 1.0);
    float _2398 = _2396;
    float _2400 = _2388;
    float _2402 = _2386;
    float _2404 = _2386;
    if (!_2286)
    {
        _1889 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2406 = _1889;
    float _2408 = _2406;
    float _2410 = _2406;
    if (!_2286)
    {
        _2380 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2412 = _2380;
    float _2414 = _2396 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2416 = _2412;
    float _2418 = _2412;
    if (!_2286)
    {
        _2398 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2420 = _2398;
    out.m_97.x = _2414;
    float _2422 = _2266 * _2370;
    float _2424 = fma(_2262, _2388, _1940);
    float _2426 = fma(_2264, _2388, _1942);
    float _2428 = _2420;
    float _2430 = _2420;
    if (!_2286)
    {
        _2400 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2432 = _2400;
    float _2434 = fma(_1946, _2422, _1944);
    out.m_99.x = _2424;
    out.m_99.y = _2426;
    out.m_99.z = _2434;
    out.m_99.w = _2390;
    bool _2436 = !_2286;
    float _2438 = _2432;
    float _2440 = _2432;
    if (!_2436)
    {
        bool _2442 = _2192 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2444 = isnan(_2192);
        bool _2446 = _2442 || _2444;
        bool _2448 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2450 = _2446 || _2448;
        if (!_2450)
        {
            float _2452 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2454 = _2192 + _2452;
            float _2456 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2458 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2456;
            float _2460 = 1.0 / _2458;
            float _2462 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2464 = _2462 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2466 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2468 = _2466 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2470 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2472 = _2470 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2474 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2476 = _2474 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2478 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2480 = _2478 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2482 = _2454 * _2460;
            float _2484 = precise::clamp(_2482, 0.0, 1.0);
            float _2486 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2488 = _2486 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2490 = fma(_2484, _2464, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2492 = fma(_2484, _2488, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2494 = fma(_2484, _2468, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2496 = fma(_2484, _2472, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2498 = fma(_2484, _2476, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2500 = fma(_2484, _2480, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2404 = _2492;
            _2418 = _2498;
            _2384 = _2490;
            _2440 = _2496;
            _2410 = _2494;
            _2430 = _2500;
            _2502 = true;
        }
        else
        {
            bool _2504 = _2192 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2506 = isnan(_2192);
            bool _2508 = _2504 || _2506;
            bool _2510 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2512 = _2508 || _2510;
            if (!_2512)
            {
                _2382 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2514 = _2382;
            _2384 = _2514;
            if (!_2512)
            {
                _2402 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2516 = _2402;
            _2404 = _2516;
            if (!_2512)
            {
                _2408 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2518 = _2408;
            _2410 = _2518;
            if (!_2512)
            {
                _2438 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2520 = _2438;
            _2440 = _2520;
            if (!_2512)
            {
                _2416 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2522 = _2416;
            _2418 = _2522;
            if (!_2512)
            {
                _2428 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2524 = _2428;
            bool _2526 = !_2512;
            _2430 = _2524;
            if (!_2526)
            {
                bool _2528 = _2192 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2530 = isnan(_2192);
                bool _2532 = _2528 || _2530;
                bool _2534 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2536 = _2532 || _2534;
                if (!_2536)
                {
                    float _2538 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2540 = _2192 + _2538;
                    float _2542 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2544 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2542;
                    float _2546 = 1.0 / _2544;
                    float _2548 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2550 = _2548 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2552 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2554 = _2552 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2556 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2558 = _2556 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2560 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2562 = _2560 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2564 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2566 = _2564 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2568 = _2540 * _2546;
                    float _2570 = precise::clamp(_2568, 0.0, 1.0);
                    float _2572 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2574 = _2572 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2576 = fma(_2570, _2550, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2578 = fma(_2570, _2574, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2580 = fma(_2570, _2554, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2582 = fma(_2570, _2558, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2584 = fma(_2570, _2562, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2586 = fma(_2570, _2566, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2404 = _2578;
                    _2418 = _2584;
                    _2384 = _2576;
                    _2440 = _2582;
                    _2410 = _2580;
                    _2430 = _2586;
                    _2502 = true;
                }
                else
                {
                    _2404 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2418 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2384 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2440 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2410 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2430 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2502 = false;
    float _2588 = _2404;
    float _2590 = _2418;
    float _2592 = _2384;
    float _2594 = _2440;
    float _2596 = _2410;
    float _2598 = _2430;
    float _2600 = fma(_1230, -0.5, 0.5);
    float _2602 = precise::clamp(_2600, 0.0, 1.0);
    float _2604 = -_2588;
    float _2606 = _2604 + _2590;
    float _2608 = -_2592;
    float _2610 = _2608 + _2594;
    float _2612 = -_2596;
    float _2614 = _2612 + _2598;
    bool _2616 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2618 = fma(_2602, _2606, _2588);
    float _2620 = fma(_2602, _2610, _2592);
    float _2622 = fma(_2602, _2614, _2596);
    float _2624 = _2618 * 0.586610972881317138671875;
    out.m_63.x = 1.0;
    float _2626 = fma(_2620, 0.298911988735198974609375, _2624);
    float _2628 = fma(_2622, 0.114477999508380889892578125, _2626);
    out.m_101.x = 0.0;
    float _2630 = -_2628;
    float _2632 = _2620 + _2630;
    float _2634 = -_2628;
    float _2636 = _2618 + _2634;
    float _2638 = -_2628;
    float _2640 = _2622 + _2638;
    float _2642 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2644 = fma(_2632, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2628);
    float _2646 = fma(_2636, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2628);
    float _2648 = fma(_2640, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2628);
    out.m_97.w = _2642;
    out.m_103.x = _2644;
    out.m_103.y = _2646;
    out.m_103.z = _2648;
    if (!_2616)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2650 = -_1643;
    float _2652 = _2650 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2654 = -_1645;
    float _2656 = _2654 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2658 = -_1647;
    float _2660 = _2658 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2662 = _2652 * _2652;
    float _2664 = fma(_2656, _2656, _2662);
    float _2666 = fma(_2660, _2660, _2664);
    float _2668 = sqrt(_2666);
    float _2670 = rsqrt(_2666);
    float _2672 = -_2668;
    float _2674 = _2672 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2676 = _2674 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2678 = precise::clamp(_2676, 0.0, 1.0);
    float _2680 = _2656 * _2670;
    float _2682 = _2652 * _2670;
    float _2684 = abs(_2678);
    float _2686 = log2(_2684);
    float _2688 = _2660 * _2670;
    float _2690 = _2680 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2692 = _1230 * _2682;
    float _2694 = -_2682;
    float _2696 = -_2690;
    float _2698 = fma(_2694, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2696);
    float _2700 = fma(_1224, _2680, _2692);
    float _2702 = -_2688;
    float _2704 = fma(_2702, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2698);
    float _2706 = fma(_1232, _2688, _2700);
    float _2708 = precise::clamp(_2706, 0.0, 1.0);
    float _2710 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2712 = _2704 + _2710;
    float _2714 = _2686 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2716 = _2712 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2718 = precise::clamp(_2716, 0.0, 1.0);
    float _2720 = exp2(_2714);
    float _2722 = _2720 * _2718;
    float _2724 = _2708 * _2722;
    float _2726 = _2724 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2728 = _2724 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2730 = _2724 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_101.x = _2726;
    out.m_101.y = _2728;
    out.m_101.z = _2730;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2502 = false;
    bool _1278 = false;
    bool _200 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _117 = in.m_60.w;
    float _119 = trunc(_117);
    int _122 = int(_119);
    bool _126 = _122 >= 1;
    float _128 = 0.0;
    if (!_126)
    {
        _128 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _130 = _128;
    if (!_126)
    {
        out.m_63.x = 0.0;
    }
    int _132 = 0;
    if (!_126)
    {
        float _134 = _130 * 5.0;
        _132 = as_type<int>(_134);
    }
    int _136 = _132;
    int _138 = _136;
    if (!_126)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2786 = as_type<float>(_136);
        out.gl_Position.z = _2786;
    }
    if (!_126)
    {
        return out;
    }
    float _140 = in.m_65.w;
    bool _142 = _140 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _144 = isnan(_140);
    bool _146 = _142 || _144;
    bool _148 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _150 = _146 || _148;
    float _152 = -_140;
    float _154 = _152 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _156 = 0.0;
    float _158 = _154;
    if (_150)
    {
        float _160 = float(_122);
        _156 = _160;
    }
    float _162 = _156;
    bool _164 = _154 >= _162;
    bool _166 = !_150;
    bool _168 = _164 || _166;
    float _170 = _162;
    if (_168)
    {
        _170 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _172 = _170;
    if (_168)
    {
        out.m_63.x = 0.0;
    }
    if (_168)
    {
        float _174 = _172 * 5.0;
        _138 = as_type<int>(_174);
    }
    int _176 = _138;
    if (_168)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2856 = as_type<float>(_176);
        out.gl_Position.z = _2856;
    }
    if (_168)
    {
        return out;
    }
    bool _178 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _180 = !_178;
    float _198;
    if (!_180)
    {
        float _182 = in.m_67.x;
        float _184 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _186 = _182 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _188 = fma(_186, (*spvDescriptorSet0.vp_c9)._m0[12].x, _154);
        float _190 = _188 * _184;
        float _192 = floor(_190);
        float _194 = -_192;
        float _196 = _190 + _194;
        _198 = _196;
        _200 = true;
    }
    else
    {
        float _202 = float(_122);
        float _204 = 1.0 / _202;
        float _206 = _154 * _204;
        _198 = _206;
    }
    _200 = false;
    float _208 = _198;
    float _210 = in.m_67.x;
    float _212 = in.m_67.y;
    float _214 = in.m_67.z;
    float _216 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _218 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _216;
    int _220 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _222 = _220 != 0;
    int _224 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _226 = _224 != 0;
    int _228 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _230 = _228 != 0;
    float _232 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _234 = _232 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _236 = 1.0 / _218;
    float _238 = 1.0 / _234;
    float _240 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _242 = _208 + _240;
    float _244 = _214 * 2.0;
    float _246 = _210 * 2.0;
    float _248 = _212 + _214;
    float _250 = _210 + _214;
    float _252 = floor(_244);
    float _254 = _214 + (-0.5);
    float _256 = _212 + _210;
    float _258 = _210 + (-0.5);
    float _260 = _212 * 2.0;
    float _262 = _212 + (-0.5);
    float _264 = _248 + (-1.0);
    float _266 = _242 * _236;
    float _268 = floor(_246);
    bool _270 = !_222;
    int _272 = _270 ? 0 : 1;
    float _274 = _250 + (-1.0);
    float _276 = fma(_264, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _280 = _208 + _278;
    int _282 = abs(_272);
    float _284 = _256 + (-1.0);
    float _286 = fma(_274, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _288 = _252 > 0.0;
    float _290 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _292 = log2(_290);
    bool _294 = _252 >= 0.0;
    bool _296 = isnan(_252);
    bool _298 = _294 || _296;
    bool _300 = isnan(0.0);
    bool _302 = _298 || _300;
    float _304 = _280 * _238;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _308 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _306;
    int _310 = _302 ? 0 : 1;
    bool _312 = _268 > 0.0;
    float _314 = floor(_260);
    int _316 = ~_310;
    int _318 = _316 + 1;
    int _320 = _318 + 1;
    float _322 = fma(_284, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _324 = _268 >= 0.0;
    bool _326 = isnan(_268);
    bool _328 = _324 || _326;
    bool _330 = isnan(0.0);
    bool _332 = _328 || _330;
    float _334 = fma(_308, _266, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    int _336 = _320;
    if (!_288)
    {
        int _338 = ~_310;
        int _340 = _338 + 1;
        _336 = _340;
    }
    int _342 = _336;
    float _344 = float(_282);
    float _346 = float(_342);
    float _348 = _292 * _154;
    int _350 = _332 ? 0 : 1;
    float _352 = _344 * _346;
    int _354 = ~_350;
    int _356 = _354 + 1;
    int _358 = _356 + 1;
    float _360 = in.m_69.x;
    float _362 = in.m_69.y;
    float _364 = in.m_69.z;
    int _366 = _358;
    if (!_312)
    {
        int _368 = ~_350;
        int _370 = _368 + 1;
        _366 = _370;
    }
    int _372 = _366;
    float _374 = _352 * (-2.0);
    float _376 = exp2(_348);
    bool _378 = _314 > 0.0;
    bool _380 = _314 >= 0.0;
    bool _382 = isnan(_314);
    bool _384 = _380 || _382;
    bool _386 = isnan(0.0);
    bool _388 = _384 || _386;
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _392 = 1.0 + _390;
    bool _394 = !_226;
    int _396 = _394 ? 0 : 1;
    float _398 = float(_372);
    int _400 = abs(_396);
    float _402 = 1.0 / _392;
    bool _404 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _406 = isnan(1.0);
    bool _408 = _404 || _406;
    bool _410 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _412 = _408 || _410;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _416 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _414;
    float _418 = float(_400);
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _422 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _420;
    bool _424 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _426 = isnan(0.0);
    bool _428 = _424 || _426;
    bool _430 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _432 = _428 || _430;
    float _434 = -_376;
    float _436 = _434 + 1.0;
    float _438 = fma(_416, _266, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _440 = _418 * _398;
    int _442 = _388 ? 0 : 1;
    float _444 = fma(_422, _266, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _446 = _432 ? _436 : 0.0;
    float _448 = _440 * (-2.0);
    float _450 = fma(_374, _360, _360);
    float _452 = fma(_322, _374, _322);
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _456 = _454 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    if (_412)
    {
        float _458 = _446 * _402;
        _158 = _458;
    }
    float _460 = _158;
    float _462 = fma(_258, (*spvDescriptorSet0.vp_c9)._m0[196].x, _450);
    float _464 = fma(_448, _362, _362);
    int _466 = ~_442;
    int _468 = _466 + 1;
    int _470 = _468 + 1;
    float _472 = fma(_276, _448, _276);
    float _474 = fma(_452, _460, _462);
    bool _476 = _208 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _478 = isnan(_208);
    bool _480 = _476 || _478;
    bool _482 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _484 = _480 || _482;
    float _486 = float(_484);
    int _488 = _470;
    if (!_378)
    {
        int _490 = ~_442;
        int _492 = _490 + 1;
        _488 = _492;
    }
    int _494 = _488;
    float _496 = fma(_262, (*spvDescriptorSet0.vp_c9)._m0[196].y, _464);
    bool _498 = !_230;
    int _500 = _498 ? 0 : 1;
    float _502 = -_486;
    float _504 = _502 + 1.0;
    bool _506 = _208 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _508 = isnan(_208);
    bool _510 = _506 || _508;
    bool _512 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _514 = _510 || _512;
    float _516 = float(_514);
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _520 = _518 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    int _522 = abs(_500);
    float _524 = _474 * 0.15915493667125701904296875;
    bool _526 = _208 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _528 = isnan(_208);
    bool _530 = _526 || _528;
    bool _532 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _534 = _530 || _532;
    float _536 = float(_534);
    float _538 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _540 = _538 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _542 = _516 * _504;
    float _544 = -_516;
    float _546 = _544 + 1.0;
    float _548 = fma(_540, _304, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _550 = float(_494);
    float _552 = fma(_472, _460, _496);
    float _554 = float(_522);
    float _556 = fma(_456, _304, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _558 = fma(_520, _304, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _560 = _536 * _546;
    float _562 = -_536;
    float _564 = _562 + 1.0;
    float _566 = _554 * _550;
    float _568 = _524 * 6.283185482025146484375;
    float _570 = cos(_568);
    float _572 = in.m_71.x;
    float _574 = in.m_71.y;
    float _576 = in.m_71.z;
    float _578 = _334 * _560;
    float _580 = _566 * (-2.0);
    float _582 = _438 * _560;
    float _584 = _444 * _560;
    float _586 = _552 * 0.15915493667125701904296875;
    float _588 = fma(_580, _364, _364);
    float _590 = in.m_73.x;
    float _592 = in.m_73.y;
    float _594 = in.m_73.z;
    float _596 = fma(_286, _580, _286);
    float _598 = fma(_564, (*spvDescriptorSet0.vp_c9)._m0[143].x, _582);
    float _600 = fma(_254, (*spvDescriptorSet0.vp_c9)._m0[196].z, _588);
    float _602 = fma(_564, (*spvDescriptorSet0.vp_c9)._m0[143].y, _584);
    float _604 = fma(_564, (*spvDescriptorSet0.vp_c9)._m0[143].z, _578);
    float _606 = fma(_548, _542, _598);
    float _608 = fma(_596, _460, _600);
    float _610 = fma(_558, _542, _602);
    float _612 = fma(_556, _542, _604);
    float _614 = _586 * 6.283185482025146484375;
    float _616 = sin(_614);
    float _618 = _608 * 0.15915493667125701904296875;
    float _620 = fma(_486, (*spvDescriptorSet0.vp_c9)._m0[145].y, _610);
    float _622 = fma(_486, (*spvDescriptorSet0.vp_c9)._m0[145].z, _612);
    float _624 = fma(_486, (*spvDescriptorSet0.vp_c9)._m0[145].x, _606);
    float _626 = _622 * _576;
    float _628 = _586 * 6.283185482025146484375;
    float _630 = cos(_628);
    float _632 = in.m_60.x;
    float _634 = in.m_60.y;
    float _636 = in.m_60.z;
    float _638 = _620 * _574;
    float _640 = _624 * _572;
    float _642 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _592);
    float _644 = _638 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _646 = _524 * 6.283185482025146484375;
    float _648 = sin(_646);
    float _650 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _590);
    float _652 = _640 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _654 = _642 * _644;
    float _656 = _570 * _616;
    float _658 = _626 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _660 = _650 * _652;
    float _662 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _594);
    float _664 = _618 * 6.283185482025146484375;
    float _666 = cos(_664);
    float _668 = _570 * _630;
    float _670 = _662 * _658;
    float _672 = _618 * 6.283185482025146484375;
    float _674 = sin(_672);
    float _676 = _648 * _616;
    float _678 = _648 * _630;
    float _680 = _634 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _682 = _634 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _684 = _634 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _686 = fma(_632, (*spvDescriptorSet0.vp_c10)._m0[4].x, _680);
    float _688 = _570 * _666;
    float _690 = _630 * _666;
    float _692 = _648 * _666;
    float _694 = _616 * _666;
    float _696 = _688 * _654;
    float _698 = fma(_632, (*spvDescriptorSet0.vp_c10)._m0[6].x, _682);
    float _700 = _692 * _654;
    float _702 = fma(_636, (*spvDescriptorSet0.vp_c10)._m0[4].z, _686);
    float _704 = fma(_674, _668, _676);
    float _706 = fma(_674, _676, _668);
    float _708 = -_656;
    float _710 = fma(_674, _678, _708);
    float _712 = -_654;
    float _714 = _674 * _712;
    float _716 = -_678;
    float _718 = fma(_674, _656, _716);
    float _720 = fma(_704, _660, _696);
    float _722 = fma(_710, _660, _700);
    float _724 = fma(_690, _660, _714);
    float _726 = fma(_636, (*spvDescriptorSet0.vp_c10)._m0[6].z, _698);
    float _728 = fma(_718, _670, _720);
    float _730 = fma(_706, _670, _722);
    float _732 = fma(_694, _670, _724);
    float _734 = _726 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _736 = _728 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _738 = _728 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _740 = fma(_632, (*spvDescriptorSet0.vp_c10)._m0[5].x, _684);
    float _742 = fma(_732, (*spvDescriptorSet0.vp_c10)._m0[8].x, _736);
    float _744 = fma(_732, (*spvDescriptorSet0.vp_c10)._m0[10].x, _738);
    float _746 = _702 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _748 = fma(_636, (*spvDescriptorSet0.vp_c10)._m0[5].z, _740);
    float _750 = fma(_730, (*spvDescriptorSet0.vp_c10)._m0[8].z, _742);
    float _752 = fma(_730, (*spvDescriptorSet0.vp_c10)._m0[10].z, _744);
    float _754 = _748 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _756 = _746 + _750;
    float _758 = _734 + _752;
    float _760 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _762 = _756 + _760;
    float _764 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _766 = _758 + _764;
    float _768 = _762 * _762;
    float _770 = _766 * _766;
    float _772 = _768 + _770;
    float _774 = sqrt(_772);
    bool _776 = _774 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _778 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _780 = _774 + _778;
    float _782 = _728 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _784 = fma(_732, (*spvDescriptorSet0.vp_c10)._m0[9].x, _782);
    float _786 = fma(_730, (*spvDescriptorSet0.vp_c10)._m0[9].z, _784);
    float _788 = 0.0;
    float _790 = _784;
    float _792 = _732;
    float _794 = _756;
    float _796 = _758;
    float _798 = _768;
    float _800 = _770;
    float _802 = _692;
    if (_776)
    {
        float _804 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _788 = _804;
    }
    float _806 = _788;
    float _808 = _754 + _786;
    float _810 = _808;
    if (_776)
    {
        float _812 = _808 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _790 = _812;
    }
    float _814 = _790;
    float _816 = _814;
    if (_776)
    {
        float _818 = rsqrt(_772);
        _792 = _818;
    }
    float _820 = _792;
    float _822 = _806;
    if (_776)
    {
        float _824 = _780 * _806;
        _822 = _824;
    }
    float _826 = _822;
    float _828 = _826;
    if (_776)
    {
        float _830 = _826 * 0.15915493667125701904296875;
        _828 = _830;
    }
    float _832 = _828;
    float _834 = _632;
    if (_776)
    {
        float _836 = _832 * 6.283185482025146484375;
        float _838 = sin(_836);
        _834 = _838;
    }
    float _840 = _834;
    if (_776)
    {
        float _842 = fma(_840, _814, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _816 = _842;
    }
    float _844 = _816;
    float _846 = _844;
    if (_776)
    {
        float _848 = _820 * _844;
        _846 = _848;
    }
    float _850 = _846;
    if (_776)
    {
        float _852 = fma(_762, _850, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _794 = _852;
    }
    float _854 = _794;
    if (_776)
    {
        float _856 = fma(_766, _850, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _796 = _856;
    }
    float _858 = _796;
    float _860 = fma(_854, 6.2500002968590706586837768554688e-05, 0.5);
    float _862 = fma(_858, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _3906 = float2(_860, _862);
    float3 _866 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_3906, float2(0.0), isnan(_3906)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_3906, float2(0.0), isnan(_3906)), level(0.0)).xyz;
    float _868 = _866.x;
    float _870 = _866.y;
    float _872 = _866.z;
    float _874 = in.m_75.y;
    bool _876 = _592 != 0.0;
    bool _878 = isnan(_592);
    bool _880 = _876 || _878;
    bool _882 = isnan(0.0);
    bool _884 = _880 || _882;
    float _886 = _832;
    if (_776)
    {
        float _888 = _832 * 6.283185482025146484375;
        float _890 = cos(_888);
        _886 = _890;
    }
    float _892 = _886;
    int _894 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _896 = _894 != 0;
    float _898 = in.m_67.w;
    bool _900 = _590 == 0.0;
    bool _902 = !_884;
    bool _904 = _900 && _902;
    int _906 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _908 = _906 != 0;
    float _910 = in.m_77.x;
    float _912 = in.m_77.y;
    float _914 = in.m_77.z;
    bool _916 = _594 == 0.0;
    bool _918 = _916 && _904;
    float _920 = in.m_75.x;
    float _922 = _780;
    float _924 = 1.0;
    float _926 = 1.0;
    if (_896)
    {
        float _928 = in.m_67.z;
        _922 = _928;
    }
    float _930 = _922;
    out.m_79.x = 1.0;
    out.m_79.y = 1.0;
    out.m_79.z = 1.0;
    float _932 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _934 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _936 = -_874;
    float _938 = _936 + 1.0;
    float _940 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _942 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _944 = _932 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _946 = _898 > 0.5;
    float _948 = _934 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _950 = _940 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _952 = _874;
    if (_908)
    {
        float _954 = _946 ? _938 : _874;
        _952 = _954;
    }
    float _956 = _952;
    float _958 = 0.0;
    float _960 = _910;
    float _962 = _912;
    if (_918)
    {
        _958 = _910;
    }
    float _964 = _958;
    out.m_81.x = _944;
    out.m_81.y = _948;
    out.m_81.z = _950;
    out.m_81.w = _942;
    float _966 = _964;
    if (!_896)
    {
        _924 = _920;
    }
    float _968 = _924;
    float _970 = 0.0;
    float _972 = _968;
    if (_918)
    {
        _970 = _964;
    }
    float _974 = _970;
    bool _976 = _930 > 0.5;
    bool _978 = _976 && _896;
    float _980 = in.m_83.x;
    float _982 = in.m_83.y;
    float _984 = in.m_83.z;
    float _986 = in.m_83.w;
    float _988 = _974;
    float _990 = _892;
    if (!_918)
    {
        _966 = _910;
    }
    float _992 = _966;
    if (_918)
    {
        _960 = _912;
    }
    float _994 = _960;
    float _996 = _994;
    if (_918)
    {
        _926 = _914;
    }
    float _998 = _926;
    float _1000 = _998;
    if (!_918)
    {
        float _1002 = fma(_594, (*spvDescriptorSet0.vp_c9)._m0[17].y, _914);
        _1000 = _1002;
    }
    float _1004 = _1000;
    float _1006 = 0.0;
    if (_918)
    {
        _1006 = _994;
    }
    float _1008 = _1006;
    float _1010 = _1008;
    if (!_918)
    {
        float _1012 = fma(_590, (*spvDescriptorSet0.vp_c9)._m0[17].y, _992);
        _988 = _1012;
    }
    float _1014 = _988;
    if (!_918)
    {
        _996 = _912;
    }
    float _1016 = _996;
    if (_896)
    {
        _962 = _920;
    }
    float _1018 = _962;
    float _1020 = _1018;
    if (!_918)
    {
        float _1022 = fma(_592, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1016);
        _1010 = _1022;
    }
    float _1024 = _1010;
    if (_978)
    {
        float _1026 = -_1018;
        float _1028 = _1026 + 1.0;
        _1020 = _1028;
    }
    float _1030 = _1020;
    float _1032 = -_1024;
    float _1034 = _674 * _1032;
    float _1036 = _692 * _1024;
    if (_896)
    {
        _972 = _1030;
    }
    float _1038 = _972;
    float _1040 = fma(_690, _1014, _1034);
    float _1042 = fma(_710, _1014, _1036);
    float _1044 = _984 * _992;
    float _1046 = _982 * _914;
    float _1048 = _980 * _1016;
    float _1050 = fma(_694, _1004, _1040);
    float _1052 = -_1044;
    float _1054 = fma(_980, _914, _1052);
    float _1056 = -_1046;
    float _1058 = fma(_984, _1016, _1056);
    float _1060 = -_1048;
    float _1062 = fma(_982, _992, _1060);
    float _1064 = -_982;
    float _1066 = _674 * _1064;
    float _1068 = _1054 * _986;
    float _1070 = _688 * _1024;
    float _1072 = _1058 * _986;
    float _1074 = _1062 * _986;
    float _1076 = -_1068;
    float _1078 = _674 * _1076;
    float _1080 = _688 * _982;
    float _1082 = _688 * _1068;
    float _1084 = _692 * _982;
    float _1086 = _692 * _1068;
    float _1088 = fma(_704, _1014, _1070);
    float _1090 = fma(_690, _1072, _1078);
    float _1092 = fma(_704, _1072, _1082);
    float _1094 = fma(_690, _980, _1066);
    float _1096 = fma(_704, _980, _1080);
    float _1098 = fma(_710, _980, _1084);
    float _1100 = fma(_710, _1072, _1086);
    float _1102 = fma(_718, _1004, _1088);
    float _1104 = fma(_694, _984, _1094);
    float _1106 = fma(_718, _984, _1096);
    float _1108 = fma(_706, _984, _1098);
    float _1110 = fma(_694, _1074, _1090);
    float _1112 = fma(_718, _1074, _1092);
    float _1114 = fma(_706, _1074, _1100);
    float _1116 = _1102 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1118 = _1074;
    float _1120 = _1116;
    if (_776)
    {
        float _1122 = _892 + (-1.0);
        _1118 = _1122;
    }
    float _1124 = _1118;
    float _1126 = _1102 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1128 = _1102 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1130 = fma(_1050, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1116);
    float _1132 = _1124;
    float _1134 = _1126;
    if (_776)
    {
        float _1136 = _1124 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1120 = _1136;
    }
    float _1138 = _1120;
    float _1140 = fma(_706, _1004, _1042);
    float _1142 = fma(_1050, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1126);
    float _1144 = fma(_1050, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1128);
    float _1146 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1148 = _1106 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    if (_776)
    {
        float _1150 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1152 = _854 + _1150;
        _1132 = _1152;
    }
    float _1154 = _1132;
    if (_776)
    {
        float _1156 = fma(_808, _892, _1138);
        _810 = _1156;
    }
    float _1158 = _810;
    if (_776)
    {
        float _1160 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1162 = _858 + _1160;
        _1134 = _1162;
    }
    float _1164 = _1134;
    float _1166 = fma(_1104, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1148);
    if (_776)
    {
        float _1168 = _1154 * _1154;
        _798 = _1168;
    }
    float _1170 = _798;
    float _1172 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1174 = _1158 + _1172;
    float _1176 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1178 = _1106 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    if (_776)
    {
        float _1180 = _1164 * _1164;
        _800 = _1180;
    }
    float _1182 = _800;
    float _1184 = fma(_1174, _1174, _1170);
    float _1186 = _1106 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1188 = _1038 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1190 = fma(_1104, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1178);
    float _1192 = _1184 + _1182;
    float _1194 = fma(_1104, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1186);
    float _1196 = _1112 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1198 = _1112 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1200 = _1112 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1202 = _1188 * _1146;
    float _1204 = _956 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1206 = sqrt(_1192);
    float _1208 = fma(_1110, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1196);
    float _1210 = fma(_1110, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1198);
    float _1212 = fma(_1110, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1200);
    float _1214 = _1204 * _1176;
    float _1216 = fma(_1108, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1166);
    float _1218 = fma(_1108, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1190);
    float _1220 = fma(_1114, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1208);
    float _1222 = fma(_1114, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1210);
    float _1224 = fma(_1140, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1130);
    float _1226 = fma(_1108, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1194);
    float _1228 = fma(_1114, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1212);
    float _1230 = fma(_1140, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1142);
    float _1232 = fma(_1140, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1144);
    out.m_85.z = _1202;
    out.m_85.w = _1214;
    bool _1234 = _1206 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1236 = isnan(_1206);
    bool _1238 = _1234 || _1236;
    bool _1240 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1242 = _1238 || _1240;
    out.m_87.x = _1216;
    out.m_87.y = _1218;
    out.m_87.z = _1226;
    out.m_89.x = _1220;
    out.m_89.y = _1222;
    out.m_89.z = _1228;
    out.m_91.x = _1224;
    out.m_91.y = _1230;
    out.m_91.z = _1232;
    if (!_1242)
    {
        _802 = 1.0;
    }
    float _1244 = _802;
    out.m_93.x = _868;
    out.m_93.y = _870;
    out.m_93.z = _872;
    bool _1246 = !_1242;
    float _1248 = _1244;
    if (!_1246)
    {
        bool _1250 = _1206 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1252 = isnan(_1206);
        bool _1254 = _1250 || _1252;
        bool _1256 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1258 = _1254 || _1256;
        if (!_1258)
        {
            float _1260 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1262 = _1206 + _1260;
            float _1264 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1266 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1264;
            float _1268 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1270 = _1268 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1272 = 1.0 / _1266;
            float _1274 = _1262 * _1272;
            float _1276 = fma(_1274, _1270, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1248 = _1276;
            _1278 = true;
        }
        else
        {
            bool _1280 = _1206 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1282 = isnan(_1206);
            bool _1284 = _1280 || _1282;
            bool _1286 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1288 = _1284 || _1286;
            if (!_1288)
            {
                float _1290 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1292 = _1206 + _1290;
                float _1294 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1296 = _1294 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1298 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1300 = _1298 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1302 = 1.0 / _1296;
                float _1304 = _1292 * _1302;
                float _1306 = fma(_1304, _1300, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1248 = _1306;
                _1278 = true;
            }
            else
            {
                _1248 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1278 = false;
    float _1308 = _1248;
    float _1310 = fma(_746, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1312 = fma(_734, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1314 = floor(_1310);
    float _1316 = floor(_1312);
    float _1318 = -_1314;
    float _1320 = _1310 + _1318;
    float _1322 = -_1316;
    float _1324 = _1312 + _1322;
    float2 _4725 = float2(_1320, _1324);
    float _1326 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4725, float2(0.0), isnan(_4725)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4725, float2(0.0), isnan(_4725)), level(0.0)).x;
    float _1328 = _754 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1330 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1332 = _1158 + _1330;
    float _1334 = fma(_746, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1328);
    float _1336 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1338 = _858 + _1336;
    float _1340 = fma(_1332, _1308, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1342 = fma(_734, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1334);
    float _1344 = _754 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1346 = _1342 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1348 = fma(_746, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1344);
    float _1350 = 1.0 / _1346;
    float _1352 = fma(_734, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1348);
    float _1354 = _1352 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1356 = _1354 + _1346;
    float _1358 = _1356 * _1350;
    float _1360 = _1358 * 0.5;
    float _1362 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1364 = fma(_1360, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1362);
    float _1366 = 1.0 / _1364;
    float _1368 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _1370 = _754 + _1368;
    float _1372 = _1370 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1374 = _1370 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1376 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1378 = _1366 * _1376;
    float _1380 = fma(_746, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1372);
    float _1382 = fma(_746, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1374);
    bool _1384 = _1378 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1386 = fma(_734, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1380);
    bool _1388 = _1378 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1390 = fma(_734, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1382);
    bool _1392 = !_1384;
    int _1394 = _1392 ? 0 : 1;
    float _1396 = _1386 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1398 = _1390 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1400 = trunc(_1396);
    int _1402 = int(_1400);
    int _1404 = 2;
    float _1406 = _1386;
    float _1408 = _1398;
    if (!_1384)
    {
        _1404 = 1;
    }
    int _1410 = _1404;
    int _1412 = _1410;
    if (!_1388)
    {
        _1412 = _1394;
    }
    int _1414 = _1412;
    float _1416 = trunc(_1398);
    int _1418 = int(_1416);
    int _1420 = _1414 << 6;
    bool _1422 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1424 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1426 = _1422 || _1424;
    bool _1428 = isnan(0.5);
    bool _1430 = _1426 || _1428;
    float _1432 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1434 = _854 + _1432;
    int _1436 = _1420 + 48;
    uint _1439 = uint(int(uint(_1436) >> uint(2)));
    uint _1441 = uint(int(uint(int(_1439)) >> uint(2)));
    int _1443 = int(_1439) & 3;
    float _1445 = (*spvDescriptorSet0.vp_c15)._m0[int(_1441)][_1443];
    int _1447 = int(_1439) + 1;
    uint _1449 = uint(int(uint(_1447) >> uint(2)));
    int _1451 = _1447 & 3;
    float _1453 = (*spvDescriptorSet0.vp_c15)._m0[int(_1449)][_1451];
    int _1455 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1457 = _1402 + _1455;
    int _1459 = _1457 + 1;
    float _1461 = fma(_1434, _1308, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1463 = fma(_1338, _1308, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    bool _1465 = _1459 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1467 = _1420 + 56;
    uint _1469 = uint(int(uint(_1467) >> uint(2)));
    uint _1471 = uint(int(uint(int(_1469)) >> uint(2)));
    int _1473 = int(_1469) & 3;
    float _1475 = (*spvDescriptorSet0.vp_c15)._m0[int(_1471)][_1473];
    int _1477 = int(_1469) + 1;
    uint _1479 = uint(int(uint(_1477) >> uint(2)));
    int _1481 = _1477 & 3;
    float _1483 = (*spvDescriptorSet0.vp_c15)._m0[int(_1479)][_1481];
    int _1485 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1487 = _1418 + _1485;
    int _1489 = _1487 + 1;
    float _1491 = _1434;
    int _1493 = _1489;
    if (_1430)
    {
        _1491 = _1340;
    }
    float _1495 = _1491;
    int _1497 = _1459 | _1489;
    float _1499 = as_type<float>(_1497);
    float _1501 = _1495;
    if (_1430)
    {
        _1406 = _1463;
    }
    float _1503 = _1406;
    int _1505 = _1420 + 64;
    uint _1507 = uint(int(uint(_1505) >> uint(2)));
    uint _1509 = uint(int(uint(int(_1507)) >> uint(2)));
    int _1511 = int(_1507) & 3;
    float _1513 = (*spvDescriptorSet0.vp_c15)._m0[int(_1509)][_1511];
    int _1515 = int(_1507) + 1;
    uint _1517 = uint(int(uint(_1515) >> uint(2)));
    int _1519 = _1515 & 3;
    float _1521 = (*spvDescriptorSet0.vp_c15)._m0[int(_1517)][_1519];
    bool _1523 = _1497 < 0;
    bool _1525 = _1523 || _1465;
    float _1527 = _1503;
    if (_1430)
    {
        _1499 = _1461;
    }
    float _1529 = _1499;
    bool _1531 = _1489 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1533 = _1531 || _1525;
    int _1535 = _1420 + 72;
    uint _1537 = uint(int(uint(_1535) >> uint(2)));
    uint _1539 = uint(int(uint(int(_1537)) >> uint(2)));
    int _1541 = int(_1537) & 3;
    float _1543 = (*spvDescriptorSet0.vp_c15)._m0[int(_1539)][_1541];
    int _1545 = int(_1537) + 1;
    uint _1547 = uint(int(uint(_1545) >> uint(2)));
    int _1549 = _1545 & 3;
    float _1551 = (*spvDescriptorSet0.vp_c15)._m0[int(_1547)][_1549];
    int _1553 = _1420 + 96;
    uint _1555 = uint(int(uint(_1553) >> uint(2)));
    uint _1557 = uint(int(uint(int(_1555)) >> uint(2)));
    int _1559 = int(_1555) & 3;
    float _1561 = (*spvDescriptorSet0.vp_c15)._m0[int(_1557)][_1559];
    int _1563 = int(_1555) + 1;
    uint _1565 = uint(int(uint(_1563) >> uint(2)));
    int _1567 = _1563 & 3;
    float _1569 = (*spvDescriptorSet0.vp_c15)._m0[int(_1565)][_1567];
    int _1571 = _1420 + 104;
    uint _1573 = uint(int(uint(_1571) >> uint(2)));
    uint _1575 = uint(int(uint(int(_1573)) >> uint(2)));
    int _1577 = int(_1573) & 3;
    float _1579 = (*spvDescriptorSet0.vp_c15)._m0[int(_1575)][_1577];
    int _1581 = int(_1573) + 1;
    uint _1583 = uint(int(uint(_1581) >> uint(2)));
    int _1585 = _1581 & 3;
    float _1587 = (*spvDescriptorSet0.vp_c15)._m0[int(_1583)][_1585];
    float _1589 = _1529;
    int _1591 = as_type<int>(_1569);
    if (!_1430)
    {
        float _1593 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1595 = _754 + _1593;
        float _1597 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1599 = _746 + _1597;
        float _1601 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1603 = _1595 * _1595;
        float _1605 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1607 = _734 + _1605;
        float _1609 = fma(_1599, _1599, _1603);
        float _1611 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1613 = fma(_1607, _1607, _1609);
        float _1615 = sqrt(_1613);
        float _1617 = _1601 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1619 = -_754;
        float _1621 = _1619 + _1340;
        float _1623 = precise::min(_1615, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1625 = _1623 * _1611;
        float _1627 = -_734;
        float _1629 = _1627 + _1463;
        float _1631 = _1617 * _1625;
        float _1633 = -_746;
        float _1635 = _1633 + _1461;
        float _1637 = fma(_1621, _1631, _754);
        float _1639 = fma(_1635, _1631, _746);
        float _1641 = fma(_1629, _1631, _734);
        _1501 = _1637;
        _1589 = _1639;
        _1527 = _1641;
    }
    float _1643 = _1501;
    float _1645 = _1589;
    float _1647 = _1527;
    float _1649 = _1370 * _1569;
    float _1651 = _1643 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (!_1533)
    {
        int _1653 = _1489 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1655 = _1653 + _1459;
        _1591 = _1655;
    }
    int _1657 = _1591;
    float _1659 = _1370 * _1521;
    float _1661 = fma(_746, _1561, _1649);
    float _1663 = fma(_1645, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1651);
    float _1665 = _1370 * _1453;
    if (!_1533)
    {
        int _1667 = _1657 << 2;
        _1493 = _1667;
    }
    int _1669 = _1493;
    float _1671 = fma(_734, _1579, _1661);
    float _1673 = fma(_1647, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1663);
    float _1675 = fma(_746, _1445, _1665);
    float _1677 = fma(_746, _1513, _1659);
    float _1679 = _1671 + _1587;
    float _1681 = _1673 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1683 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1685 = fma(_734, _1475, _1675);
    float _1687 = 1.0 / _1679;
    float _1689 = _1681 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    int _1691 = as_type<int>(_1673);
    int _1693 = _1669;
    float _1695 = _1683;
    float _1697 = _1679;
    if (!_1533)
    {
        uint _1699 = uint(int(uint(_1657) >> uint(2)));
        _1691 = int(_1699);
    }
    int _1701 = _1691;
    int _1703 = _1420 + 80;
    uint _1705 = uint(int(uint(_1703) >> uint(2)));
    uint _1707 = uint(int(uint(int(_1705)) >> uint(2)));
    int _1709 = int(_1705) & 3;
    float _1711 = (*spvDescriptorSet0.vp_c15)._m0[int(_1707)][_1709];
    int _1713 = int(_1705) + 1;
    uint _1715 = uint(int(uint(_1713) >> uint(2)));
    int _1717 = _1713 & 3;
    float _1719 = (*spvDescriptorSet0.vp_c15)._m0[int(_1715)][_1717];
    if (!_1533)
    {
        int _1721 = 12 & _1669;
        _1693 = _1721;
    }
    int _1723 = _1693;
    float _1725 = -_1689;
    float _1727 = fma(_1725, _1683, 1.0);
    float _1729 = fma(_734, _1543, _1677);
    float _1731 = _1685 + _1483;
    float _1733 = _1643 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    int _1735 = _1723;
    if (!_1533)
    {
        int _1737 = _1701 << 4;
        int _1739 = _1737 + _1723;
        _1735 = _1739;
    }
    int _1741 = _1735;
    float _1743 = _1729 + _1551;
    int _1745 = _1420 + 88;
    uint _1747 = uint(int(uint(_1745) >> uint(2)));
    uint _1749 = uint(int(uint(int(_1747)) >> uint(2)));
    int _1751 = int(_1747) & 3;
    float _1753 = (*spvDescriptorSet0.vp_c15)._m0[int(_1749)][_1751];
    int _1755 = int(_1747) + 1;
    uint _1757 = uint(int(uint(_1755) >> uint(2)));
    int _1759 = _1755 & 3;
    float _1761 = (*spvDescriptorSet0.vp_c15)._m0[int(_1757)][_1759];
    float _1763 = fma(_1645, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1733);
    float _1765 = _1643 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1767 = _1643 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1769 = log2(_1727);
    float _1771 = _1731 * _1687;
    float _1773 = fma(_1645, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1765);
    float _1775 = fma(_1645, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1767);
    float _1777 = _1731;
    float _1779 = _1687;
    float _1781 = _1771;
    if (!_1533)
    {
        int _1783 = _1741 + 400;
        uint _1785 = uint(int(uint(_1783) >> uint(2)));
        uint _1787 = uint(int(uint(int(_1785)) >> uint(2)));
        int _1789 = int(_1785) & 3;
        float _1791 = (*spvDescriptorSet0.vp_c15)._m0[int(_1787)][_1789];
        _1777 = _1791;
    }
    float _1793 = _1777;
    float _1795 = _1743 * _1687;
    float _1797 = fma(_1647, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1773);
    bool _1799 = _1771 >= 0.0;
    float _1801 = fma(_1647, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1775);
    float _1803 = fma(_1647, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1763);
    float _1805 = _1797 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _1807 = _1771 <= 1.0;
    bool _1809 = _1807 && _1799;
    float _1811 = _1801 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1813 = _1803 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1815 = _1805 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1817 = _1795 >= 0.0;
    bool _1819 = _1817 && _1809;
    float _1821 = _1805 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1823 = _1805 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1825 = fma(_1811, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1815);
    bool _1827 = _1795 <= 1.0;
    bool _1829 = _1827 && _1819;
    if (!_1533)
    {
        float _1831 = floor(_1396);
        _1695 = _1831;
    }
    float _1833 = _1695;
    float _1835 = fma(_1811, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1821);
    float _1837 = fma(_1681, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1825);
    float _1839 = fma(_1811, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1823);
    float _1841 = _1769 * 0.693147182464599609375;
    float _1843 = fma(_1813, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1837);
    float _1845 = _1340;
    if (!_1533)
    {
        float _1847 = floor(_1398);
        _1845 = _1847;
    }
    float _1849 = _1845;
    float _1851 = _1841 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    if (_1829)
    {
        float _1853 = float(_1414);
        _1697 = _1853;
    }
    float _1855 = _1697;
    float _1857 = 1.0 / _1843;
    float _1859 = _1370 * _1719;
    float _1861 = fma(_746, _1711, _1859);
    float _1863 = fma(_1681, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1835);
    float _1865 = fma(_1681, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1839);
    float _1867 = _1855;
    if (_1829)
    {
        float _1869 = rint(_1855);
        float _1871 = precise::max(_1869, 0.0);
        uint _1873 = uint(_1871);
        uint _1875 = clamp(_1873, 0u, 65535u);
        _1867 = as_type<float>(_1875);
    }
    float _1877 = _1867;
    float _1879 = fma(_734, _1753, _1861);
    float _1881 = fma(_1813, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1863);
    float _1883 = fma(_1813, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1865);
    float _1885 = _1849;
    float _1887 = _1883;
    float _1889 = _1881;
    if (!_1533)
    {
        float _1891 = -_1849;
        float _1893 = _1398 + _1891;
        _1885 = _1893;
    }
    float _1895 = _1885;
    float _1897 = _1879 + _1761;
    float _1899 = as_type<float>(_1741);
    if (!_1533)
    {
        float _1901 = rint(_1793);
        float _1903 = precise::max(_1901, 0.0);
        uint _1905 = uint(_1903);
        uint _1907 = clamp(_1905, 0u, 65535u);
        _1899 = as_type<float>(_1907);
    }
    float _1909 = _1899;
    float _1911 = _1881 * _1857;
    float _1913 = _1883 * _1857;
    float _1915 = _1897 * _1687;
    float _1917 = _1857;
    if (!_1533)
    {
        float _1919 = -_1833;
        float _1921 = _1396 + _1919;
        _1917 = _1921;
    }
    float _1923 = _1917;
    float _1925 = fma(_1911, 0.5, 0.5);
    float _1927 = fma(_1913, -0.5, 0.5);
    float _1929 = _1795;
    if (_1829)
    {
        float3 _5749 = float3(_1771, _1795, float(as_type<int>(_1877)));
        float3 _5753 = select(_5749, float3(0.0), isnan(_5749));
        float _1931 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5753.xy, uint(rint(_5753.z)), _1915, level(0.0));
        _1929 = _1931;
    }
    float _1933 = _1929;
    float3 _5763 = float3(_1925, _1927, _1851);
    float _1935 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5763, float3(0.0), isnan(_5763)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5763, float3(0.0), isnan(_5763)), level(0.0)).x;
    float3 _5772 = float3(_1925, _1927, _1851);
    float4 _1938 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5772, float3(0.0), isnan(_5772)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5772, float3(0.0), isnan(_5772)), level(0.0)).xyzw;
    float _1940 = _1938.x;
    float _1942 = _1938.y;
    float _1944 = _1938.z;
    float _1946 = _1938.w;
    float _1948 = _1923;
    if (!_1533)
    {
        float3 _5795 = float3(_1923, _1895, float(as_type<int>(_1909)));
        float3 _5797 = select(_5795, float3(0.0), isnan(_5795));
        float _1950 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5797.xy, uint(rint(_5797.z)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5797.xy, uint(rint(_5797.z)), level(0.0)).x;
        _1948 = _1950;
    }
    float _1952 = _1948;
    if (_1533)
    {
        _1408 = 1.0;
    }
    float _1954 = _1408;
    float _1956 = _1954;
    if (!_1533)
    {
        int _1958 = _1657 << 4;
        int _1960 = _1958 + 2048;
        uint _1962 = uint(int(uint(_1960) >> uint(2)));
        uint _1964 = uint(int(uint(int(_1962)) >> uint(2)));
        int _1966 = int(_1962) & 3;
        float _1968 = (*spvDescriptorSet0.vp_c15)._m0[int(_1964)][_1966];
        int _1970 = int(_1962) + 1;
        uint _1972 = uint(int(uint(_1970) >> uint(2)));
        int _1974 = _1970 & 3;
        float _1976 = (*spvDescriptorSet0.vp_c15)._m0[int(_1972)][_1974];
        int _1978 = _1960 + 8;
        uint _1980 = uint(int(uint(_1978) >> uint(2)));
        uint _1982 = uint(int(uint(int(_1980)) >> uint(2)));
        int _1984 = int(_1980) & 3;
        float _1986 = (*spvDescriptorSet0.vp_c15)._m0[int(_1982)][_1984];
        int _1988 = int(_1980) + 1;
        uint _1990 = uint(int(uint(_1988) >> uint(2)));
        int _1992 = _1988 & 3;
        float _1994 = (*spvDescriptorSet0.vp_c15)._m0[int(_1990)][_1992];
        float _1996 = _1370 * _1976;
        float _1998 = fma(_746, _1968, _1996);
        float _2000 = fma(_734, _1986, _1998);
        float _2002 = _2000 + _1994;
        float _2004 = precise::clamp(_2002, 0.0, 1.0);
        float _2006 = -_2004;
        float _2008 = _2006 + _1952;
        float _2010 = fma(_2008, 500.0, 1.5);
        float _2012 = exp2(_2010);
        float _2014 = 0.0 + _2012;
        float _2016 = precise::clamp(_2014, 0.0, 1.0);
        _1779 = _1986;
        _1781 = _1976;
        _1956 = _2016;
    }
    float _2018 = _1779;
    float _2020 = _1781;
    float _2022 = _1956;
    float _2024 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2026 = _1643 + _2024;
    float _2028 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2030 = _1645 + _2028;
    float _2032 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2034 = _1647 + _2032;
    float _2036 = _2026 * _2026;
    float _2038 = fma(_2030, _2030, _2036);
    float _2040 = fma(_2034, _2034, _2038);
    float _2042 = rsqrt(_2040);
    float _2044 = _2042 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2046 = _2030 * _2044;
    float _2048 = _2034 * _2044;
    float _2050 = _2046 * _2046;
    float _2052 = _2048 * _2048;
    float _2054 = _2050 + _2052;
    float _2056 = sqrt(_2054);
    bool _2058 = _2056 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2060 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2062 = _2056 + _2060;
    float _2064 = _2034;
    float _2066 = _2020;
    float _2068 = _2062;
    float _2070 = _2018;
    float _2072 = _2026;
    if (_2058)
    {
        float _2074 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2064 = _2074;
    }
    float _2076 = _2064;
    if (_2058)
    {
        float _2078 = rsqrt(_2054);
        _2066 = _2078;
    }
    float _2080 = _2066;
    float _2082 = _2080;
    if (_2058)
    {
        float _2084 = _2062 * _2076;
        _2068 = _2084;
    }
    float _2086 = _2068;
    if (_2058)
    {
        float _2088 = _2086 * 0.15915493667125701904296875;
        _2070 = _2088;
    }
    float _2090 = _2070;
    float _2092 = _2042;
    if (_2058)
    {
        float _2094 = _2090 * 6.283185482025146484375;
        float _2096 = sin(_2094);
        _2092 = _2096;
    }
    float _2098 = _2092;
    float _2100 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2102 = precise::max(0.0, _2100);
    float _2104 = _2036;
    float _2106 = _2102;
    float _2108 = _2100;
    if (_2058)
    {
        float _2110 = _2090 * 6.283185482025146484375;
        float _2112 = cos(_2110);
        _2104 = _2112;
    }
    float _2114 = _2104;
    float _2116 = -_2044;
    float _2118 = -_2102;
    float _2120 = fma(_2026, _2116, _2118);
    if (!_2058)
    {
        _2072 = _2048;
    }
    float _2122 = _2072;
    float _2124 = _2122;
    if (_2058)
    {
        float _2126 = _2120 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2106 = _2126;
    }
    float _2128 = _2106;
    float _2130 = _2128;
    float _2132 = _2098;
    if (_2058)
    {
        float _2134 = fma(_2098, _2128, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2130 = _2134;
    }
    float _2136 = _2130;
    float _2138 = _2136;
    if (!_2058)
    {
        _2132 = _2046;
    }
    float _2140 = _2132;
    float _2142 = _2140;
    float _2144 = _2114;
    if (_2058)
    {
        float _2146 = _2114 + (-1.0);
        _2108 = _2146;
    }
    float _2148 = _2108;
    float _2150 = _2148;
    if (_2058)
    {
        float _2152 = _2080 * _2136;
        _990 = _2152;
    }
    float _2154 = _990;
    if (!_2058)
    {
        _2138 = _2120;
    }
    float _2156 = _2138;
    float _2158 = _2156;
    if (_2058)
    {
        float _2160 = _2148 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2150 = _2160;
    }
    float _2162 = _2150;
    if (_2058)
    {
        float _2164 = _2046 * _2154;
        _2142 = _2164;
    }
    float _2166 = _2142;
    if (!_2058)
    {
        _2082 = _2050;
    }
    float _2168 = _2082;
    float _2170 = _2168;
    if (_2058)
    {
        float _2172 = _2048 * _2154;
        _2124 = _2172;
    }
    float _2174 = _2124;
    if (_2058)
    {
        float _2176 = fma(_2120, _2114, _2162);
        _2158 = _2176;
    }
    float _2178 = _2158;
    if (_2058)
    {
        float _2180 = _2166 * _2166;
        _2170 = _2180;
    }
    float _2182 = _2170;
    if (!_2058)
    {
        _2144 = _2052;
    }
    float _2184 = _2144;
    float _2186 = _2184;
    if (_2058)
    {
        float _2188 = _2174 * _2174;
        _2186 = _2188;
    }
    float _2190 = _2186;
    float _2192 = sqrt(_2040);
    float _2194 = fma(_2178, _2178, _2182);
    float _2196 = _2194 + _2190;
    float _2198 = rsqrt(_2196);
    float _2200 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2202 = fma(_2192, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2200);
    float _2204 = precise::clamp(_2202, 0.0, 1.0);
    float _2206 = -_2204;
    float _2208 = _2206 + 1.0;
    float _2210 = abs(_2208);
    float _2212 = log2(_2210);
    float _2214 = _2198 * _2166;
    float _2216 = _2198 * _2178;
    float _2218 = _2198 * _2174;
    float _2220 = _2214 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2222 = -_2220;
    float _2224 = fma(_2216, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2222);
    float _2226 = -_2218;
    float _2228 = fma(_2226, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2224);
    float _2230 = _2212 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2232 = fma(_2228, -0.5, 0.5);
    float _2234 = fma(_2228, 0.5, 0.5);
    float _2236 = exp2(_2230);
    float _2238 = fma(_2234, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2240 = fma(_2234, _2238, -0.212114393711090087890625);
    float _2242 = _2216 + 1.0;
    float _2244 = sqrt(_2232);
    float _2246 = fma(_2234, _2240, 1.570728778839111328125);
    float _2248 = -_2216;
    float _2250 = fma(_2236, _2242, _2248);
    float _2252 = _2244 * 0.636619746685028076171875;
    float _2254 = fma(_2250, 0.5, 0.5);
    float _2256 = -_2246;
    float _2258 = fma(_2252, _2256, 1.0);
    float2 _6274 = float2(_2258, _2254);
    float3 _2260 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6274, float2(0.0), isnan(_6274)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6274, float2(0.0), isnan(_6274)), level(0.0)).xyz;
    float _2262 = _2260.x;
    float _2264 = _2260.y;
    float _2266 = _2260.z;
    float _2268 = abs(_1378);
    float _2270 = log2(_2268);
    float _2272 = _2212 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2274 = -_1326;
    float _2276 = _2274 + 1.0;
    out.m_95.x = _1645;
    out.m_95.y = _1643;
    out.m_95.z = _1647;
    bool _2278 = _2192 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2280 = isnan(_2192);
    bool _2282 = _2278 || _2280;
    bool _2284 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2286 = _2282 || _2284;
    float _2288 = exp2(_2272);
    bool _2290 = _1378 <= 8000.0;
    bool _2292 = isnan(_1378);
    bool _2294 = _2290 || _2292;
    bool _2296 = isnan(8000.0);
    bool _2298 = _2294 || _2296;
    float _2300 = float(_2298);
    float _2302 = _2270 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2304 = _1805 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2306 = fma(_1811, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2304);
    float _2308 = exp2(_2302);
    float _2310 = fma(_2308, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2312 = precise::clamp(_2310, 0.0, 1.0);
    float _2314 = fma(_1681, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2306);
    float _2316 = -_2288;
    float _2318 = _2316 + 1.0;
    float _2320 = fma(_2312, -2.0, 3.0);
    float _2322 = _2312 * _2312;
    float _2324 = fma(_1813, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2314);
    float _2326 = _2322 * _2320;
    out.gl_Position.x = _1881;
    out.gl_Position.y = _1883;
    out.gl_Position.z = _2324;
    out.gl_Position.w = _1843;
    float _2328 = -_2326;
    float _2330 = _2328 + 1.0;
    float _2332 = fma(_2330, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2326);
    float _2334 = _2300 * _2332;
    float _2336 = _2300;
    float _2338 = _2324;
    if (!_1829)
    {
        _2336 = 1.0;
    }
    float _2340 = _2336;
    float _2342 = _2340;
    if (_1829)
    {
        bool _2344 = _1933 >= _1915;
        bool _2346 = isnan(_1933);
        bool _2348 = _2344 || _2346;
        bool _2350 = isnan(_1915);
        bool _2352 = _2348 || _2350;
        float _2354 = float(_2352);
        _2342 = _2354;
    }
    float _2356 = _2342;
    float _2358 = _2334 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2360 = _2318 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (!_2286)
    {
        _2338 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2362 = _2338;
    float _2364 = _2276 * _2358;
    float _2366 = precise::clamp(_2364, 0.0, 1.0);
    float _2368 = _2356 * _2022;
    float _2370 = _2360 * _1935;
    float _2372 = -_2360;
    float _2374 = _2372 + 1.0;
    float _2376 = -_2366;
    float _2378 = fma(_2376, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2380 = _2368;
    float _2382 = _2362;
    float _2384 = _2362;
    if (!_2286)
    {
        _1887 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2386 = _1887;
    float _2388 = _1946 * _2370;
    float _2390 = _1946 * _2374;
    float _2392 = -_2368;
    float _2394 = fma(_2392, _2378, 1.0);
    float _2396 = precise::clamp(_2394, 0.0, 1.0);
    float _2398 = _2396;
    float _2400 = _2388;
    float _2402 = _2386;
    float _2404 = _2386;
    if (!_2286)
    {
        _1889 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2406 = _1889;
    float _2408 = _2406;
    float _2410 = _2406;
    if (!_2286)
    {
        _2380 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2412 = _2380;
    float _2414 = _2396 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2416 = _2412;
    float _2418 = _2412;
    if (!_2286)
    {
        _2398 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2420 = _2398;
    out.m_97.x = _2414;
    float _2422 = _2266 * _2370;
    float _2424 = fma(_2262, _2388, _1940);
    float _2426 = fma(_2264, _2388, _1942);
    float _2428 = _2420;
    float _2430 = _2420;
    if (!_2286)
    {
        _2400 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2432 = _2400;
    float _2434 = fma(_1946, _2422, _1944);
    out.m_99.x = _2424;
    out.m_99.y = _2426;
    out.m_99.z = _2434;
    out.m_99.w = _2390;
    bool _2436 = !_2286;
    float _2438 = _2432;
    float _2440 = _2432;
    if (!_2436)
    {
        bool _2442 = _2192 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2444 = isnan(_2192);
        bool _2446 = _2442 || _2444;
        bool _2448 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2450 = _2446 || _2448;
        if (!_2450)
        {
            float _2452 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2454 = _2192 + _2452;
            float _2456 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2458 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2456;
            float _2460 = 1.0 / _2458;
            float _2462 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2464 = _2462 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2466 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2468 = _2466 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2470 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2472 = _2470 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2474 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2476 = _2474 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2478 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2480 = _2478 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2482 = _2454 * _2460;
            float _2484 = precise::clamp(_2482, 0.0, 1.0);
            float _2486 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2488 = _2486 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2490 = fma(_2484, _2464, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2492 = fma(_2484, _2488, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2494 = fma(_2484, _2468, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2496 = fma(_2484, _2472, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2498 = fma(_2484, _2476, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2500 = fma(_2484, _2480, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2404 = _2492;
            _2418 = _2498;
            _2384 = _2490;
            _2440 = _2496;
            _2410 = _2494;
            _2430 = _2500;
            _2502 = true;
        }
        else
        {
            bool _2504 = _2192 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2506 = isnan(_2192);
            bool _2508 = _2504 || _2506;
            bool _2510 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2512 = _2508 || _2510;
            if (!_2512)
            {
                _2382 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2514 = _2382;
            _2384 = _2514;
            if (!_2512)
            {
                _2402 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2516 = _2402;
            _2404 = _2516;
            if (!_2512)
            {
                _2408 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2518 = _2408;
            _2410 = _2518;
            if (!_2512)
            {
                _2438 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2520 = _2438;
            _2440 = _2520;
            if (!_2512)
            {
                _2416 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2522 = _2416;
            _2418 = _2522;
            if (!_2512)
            {
                _2428 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2524 = _2428;
            bool _2526 = !_2512;
            _2430 = _2524;
            if (!_2526)
            {
                bool _2528 = _2192 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2530 = isnan(_2192);
                bool _2532 = _2528 || _2530;
                bool _2534 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2536 = _2532 || _2534;
                if (!_2536)
                {
                    float _2538 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2540 = _2192 + _2538;
                    float _2542 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2544 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2542;
                    float _2546 = 1.0 / _2544;
                    float _2548 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2550 = _2548 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2552 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2554 = _2552 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2556 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2558 = _2556 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2560 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2562 = _2560 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2564 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2566 = _2564 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2568 = _2540 * _2546;
                    float _2570 = precise::clamp(_2568, 0.0, 1.0);
                    float _2572 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2574 = _2572 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2576 = fma(_2570, _2550, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2578 = fma(_2570, _2574, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2580 = fma(_2570, _2554, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2582 = fma(_2570, _2558, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2584 = fma(_2570, _2562, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2586 = fma(_2570, _2566, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2404 = _2578;
                    _2418 = _2584;
                    _2384 = _2576;
                    _2440 = _2582;
                    _2410 = _2580;
                    _2430 = _2586;
                    _2502 = true;
                }
                else
                {
                    _2404 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2418 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2384 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2440 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2410 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2430 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2502 = false;
    float _2588 = _2404;
    float _2590 = _2418;
    float _2592 = _2384;
    float _2594 = _2440;
    float _2596 = _2410;
    float _2598 = _2430;
    float _2600 = fma(_1230, -0.5, 0.5);
    float _2602 = precise::clamp(_2600, 0.0, 1.0);
    float _2604 = -_2588;
    float _2606 = _2604 + _2590;
    float _2608 = -_2592;
    float _2610 = _2608 + _2594;
    float _2612 = -_2596;
    float _2614 = _2612 + _2598;
    bool _2616 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2618 = fma(_2602, _2606, _2588);
    float _2620 = fma(_2602, _2610, _2592);
    float _2622 = fma(_2602, _2614, _2596);
    float _2624 = _2618 * 0.586610972881317138671875;
    out.m_63.x = 1.0;
    float _2626 = fma(_2620, 0.298911988735198974609375, _2624);
    float _2628 = fma(_2622, 0.114477999508380889892578125, _2626);
    out.m_101.x = 0.0;
    float _2630 = -_2628;
    float _2632 = _2620 + _2630;
    float _2634 = -_2628;
    float _2636 = _2618 + _2634;
    float _2638 = -_2628;
    float _2640 = _2622 + _2638;
    float _2642 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2644 = fma(_2632, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2628);
    float _2646 = fma(_2636, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2628);
    float _2648 = fma(_2640, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2628);
    out.m_97.w = _2642;
    out.m_103.x = _2644;
    out.m_103.y = _2646;
    out.m_103.z = _2648;
    if (!_2616)
    {
        return out;
    }
    float _2650 = -_1643;
    float _2652 = _2650 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2654 = -_1645;
    float _2656 = _2654 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2658 = -_1647;
    float _2660 = _2658 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2662 = _2652 * _2652;
    float _2664 = fma(_2656, _2656, _2662);
    float _2666 = fma(_2660, _2660, _2664);
    float _2668 = sqrt(_2666);
    float _2670 = rsqrt(_2666);
    float _2672 = -_2668;
    float _2674 = _2672 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2676 = _2674 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2678 = precise::clamp(_2676, 0.0, 1.0);
    float _2680 = _2656 * _2670;
    float _2682 = _2652 * _2670;
    float _2684 = abs(_2678);
    float _2686 = log2(_2684);
    float _2688 = _2660 * _2670;
    float _2690 = _2680 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2692 = _1230 * _2682;
    float _2694 = -_2682;
    float _2696 = -_2690;
    float _2698 = fma(_2694, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2696);
    float _2700 = fma(_1224, _2680, _2692);
    float _2702 = -_2688;
    float _2704 = fma(_2702, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2698);
    float _2706 = fma(_1232, _2688, _2700);
    float _2708 = precise::clamp(_2706, 0.0, 1.0);
    float _2710 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2712 = _2704 + _2710;
    float _2714 = _2686 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2716 = _2712 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2718 = precise::clamp(_2716, 0.0, 1.0);
    float _2720 = exp2(_2714);
    float _2722 = _2720 * _2718;
    float _2724 = _2708 * _2722;
    float _2726 = _2724 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2728 = _2724 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2730 = _2724 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_101.x = _2726;
    out.m_101.y = _2728;
    out.m_101.z = _2730;
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
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2502 = false;
    bool _1278 = false;
    bool _200 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _117 = in.m_60.w;
    float _119 = trunc(_117);
    int _122 = int(_119);
    bool _126 = _122 >= 1;
    float _128 = 0.0;
    if (!_126)
    {
        _128 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _130 = _128;
    if (!_126)
    {
        out.m_63.x = 0.0;
    }
    int _132 = 0;
    if (!_126)
    {
        float _134 = _130 * 5.0;
        _132 = as_type<int>(_134);
    }
    int _136 = _132;
    int _138 = _136;
    if (!_126)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2786 = as_type<float>(_136);
        out.gl_Position.z = _2786;
    }
    if (!_126)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _140 = in.m_65.w;
    bool _142 = _140 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _144 = isnan(_140);
    bool _146 = _142 || _144;
    bool _148 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _150 = _146 || _148;
    float _152 = -_140;
    float _154 = _152 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _156 = 0.0;
    float _158 = _154;
    if (_150)
    {
        float _160 = float(_122);
        _156 = _160;
    }
    float _162 = _156;
    bool _164 = _154 >= _162;
    bool _166 = !_150;
    bool _168 = _164 || _166;
    float _170 = _162;
    if (_168)
    {
        _170 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _172 = _170;
    if (_168)
    {
        out.m_63.x = 0.0;
    }
    if (_168)
    {
        float _174 = _172 * 5.0;
        _138 = as_type<int>(_174);
    }
    int _176 = _138;
    if (_168)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2856 = as_type<float>(_176);
        out.gl_Position.z = _2856;
    }
    if (_168)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _178 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _180 = !_178;
    float _198;
    if (!_180)
    {
        float _182 = in.m_67.x;
        float _184 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _186 = _182 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _188 = fma(_186, (*spvDescriptorSet0.vp_c9)._m0[12].x, _154);
        float _190 = _188 * _184;
        float _192 = floor(_190);
        float _194 = -_192;
        float _196 = _190 + _194;
        _198 = _196;
        _200 = true;
    }
    else
    {
        float _202 = float(_122);
        float _204 = 1.0 / _202;
        float _206 = _154 * _204;
        _198 = _206;
    }
    _200 = false;
    float _208 = _198;
    float _210 = in.m_67.x;
    float _212 = in.m_67.y;
    float _214 = in.m_67.z;
    float _216 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _218 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _216;
    int _220 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _222 = _220 != 0;
    int _224 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _226 = _224 != 0;
    int _228 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _230 = _228 != 0;
    float _232 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _234 = _232 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _236 = 1.0 / _218;
    float _238 = 1.0 / _234;
    float _240 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _242 = _208 + _240;
    float _244 = _214 * 2.0;
    float _246 = _210 * 2.0;
    float _248 = _212 + _214;
    float _250 = _210 + _214;
    float _252 = floor(_244);
    float _254 = _214 + (-0.5);
    float _256 = _212 + _210;
    float _258 = _210 + (-0.5);
    float _260 = _212 * 2.0;
    float _262 = _212 + (-0.5);
    float _264 = _248 + (-1.0);
    float _266 = _242 * _236;
    float _268 = floor(_246);
    bool _270 = !_222;
    int _272 = _270 ? 0 : 1;
    float _274 = _250 + (-1.0);
    float _276 = fma(_264, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _280 = _208 + _278;
    int _282 = abs(_272);
    float _284 = _256 + (-1.0);
    float _286 = fma(_274, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _288 = _252 > 0.0;
    float _290 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _292 = log2(_290);
    bool _294 = _252 >= 0.0;
    bool _296 = isnan(_252);
    bool _298 = _294 || _296;
    bool _300 = isnan(0.0);
    bool _302 = _298 || _300;
    float _304 = _280 * _238;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _308 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _306;
    int _310 = _302 ? 0 : 1;
    bool _312 = _268 > 0.0;
    float _314 = floor(_260);
    int _316 = ~_310;
    int _318 = _316 + 1;
    int _320 = _318 + 1;
    float _322 = fma(_284, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _324 = _268 >= 0.0;
    bool _326 = isnan(_268);
    bool _328 = _324 || _326;
    bool _330 = isnan(0.0);
    bool _332 = _328 || _330;
    float _334 = fma(_308, _266, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    int _336 = _320;
    if (!_288)
    {
        int _338 = ~_310;
        int _340 = _338 + 1;
        _336 = _340;
    }
    int _342 = _336;
    float _344 = float(_282);
    float _346 = float(_342);
    float _348 = _292 * _154;
    int _350 = _332 ? 0 : 1;
    float _352 = _344 * _346;
    int _354 = ~_350;
    int _356 = _354 + 1;
    int _358 = _356 + 1;
    float _360 = in.m_69.x;
    float _362 = in.m_69.y;
    float _364 = in.m_69.z;
    int _366 = _358;
    if (!_312)
    {
        int _368 = ~_350;
        int _370 = _368 + 1;
        _366 = _370;
    }
    int _372 = _366;
    float _374 = _352 * (-2.0);
    float _376 = exp2(_348);
    bool _378 = _314 > 0.0;
    bool _380 = _314 >= 0.0;
    bool _382 = isnan(_314);
    bool _384 = _380 || _382;
    bool _386 = isnan(0.0);
    bool _388 = _384 || _386;
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _392 = 1.0 + _390;
    bool _394 = !_226;
    int _396 = _394 ? 0 : 1;
    float _398 = float(_372);
    int _400 = abs(_396);
    float _402 = 1.0 / _392;
    bool _404 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _406 = isnan(1.0);
    bool _408 = _404 || _406;
    bool _410 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _412 = _408 || _410;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _416 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _414;
    float _418 = float(_400);
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _422 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _420;
    bool _424 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _426 = isnan(0.0);
    bool _428 = _424 || _426;
    bool _430 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _432 = _428 || _430;
    float _434 = -_376;
    float _436 = _434 + 1.0;
    float _438 = fma(_416, _266, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _440 = _418 * _398;
    int _442 = _388 ? 0 : 1;
    float _444 = fma(_422, _266, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _446 = _432 ? _436 : 0.0;
    float _448 = _440 * (-2.0);
    float _450 = fma(_374, _360, _360);
    float _452 = fma(_322, _374, _322);
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _456 = _454 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    if (_412)
    {
        float _458 = _446 * _402;
        _158 = _458;
    }
    float _460 = _158;
    float _462 = fma(_258, (*spvDescriptorSet0.vp_c9)._m0[196].x, _450);
    float _464 = fma(_448, _362, _362);
    int _466 = ~_442;
    int _468 = _466 + 1;
    int _470 = _468 + 1;
    float _472 = fma(_276, _448, _276);
    float _474 = fma(_452, _460, _462);
    bool _476 = _208 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _478 = isnan(_208);
    bool _480 = _476 || _478;
    bool _482 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _484 = _480 || _482;
    float _486 = float(_484);
    int _488 = _470;
    if (!_378)
    {
        int _490 = ~_442;
        int _492 = _490 + 1;
        _488 = _492;
    }
    int _494 = _488;
    float _496 = fma(_262, (*spvDescriptorSet0.vp_c9)._m0[196].y, _464);
    bool _498 = !_230;
    int _500 = _498 ? 0 : 1;
    float _502 = -_486;
    float _504 = _502 + 1.0;
    bool _506 = _208 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _508 = isnan(_208);
    bool _510 = _506 || _508;
    bool _512 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _514 = _510 || _512;
    float _516 = float(_514);
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _520 = _518 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    int _522 = abs(_500);
    float _524 = _474 * 0.15915493667125701904296875;
    bool _526 = _208 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _528 = isnan(_208);
    bool _530 = _526 || _528;
    bool _532 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _534 = _530 || _532;
    float _536 = float(_534);
    float _538 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _540 = _538 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _542 = _516 * _504;
    float _544 = -_516;
    float _546 = _544 + 1.0;
    float _548 = fma(_540, _304, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _550 = float(_494);
    float _552 = fma(_472, _460, _496);
    float _554 = float(_522);
    float _556 = fma(_456, _304, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _558 = fma(_520, _304, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _560 = _536 * _546;
    float _562 = -_536;
    float _564 = _562 + 1.0;
    float _566 = _554 * _550;
    float _568 = _524 * 6.283185482025146484375;
    float _570 = cos(_568);
    float _572 = in.m_71.x;
    float _574 = in.m_71.y;
    float _576 = in.m_71.z;
    float _578 = _334 * _560;
    float _580 = _566 * (-2.0);
    float _582 = _438 * _560;
    float _584 = _444 * _560;
    float _586 = _552 * 0.15915493667125701904296875;
    float _588 = fma(_580, _364, _364);
    float _590 = in.m_73.x;
    float _592 = in.m_73.y;
    float _594 = in.m_73.z;
    float _596 = fma(_286, _580, _286);
    float _598 = fma(_564, (*spvDescriptorSet0.vp_c9)._m0[143].x, _582);
    float _600 = fma(_254, (*spvDescriptorSet0.vp_c9)._m0[196].z, _588);
    float _602 = fma(_564, (*spvDescriptorSet0.vp_c9)._m0[143].y, _584);
    float _604 = fma(_564, (*spvDescriptorSet0.vp_c9)._m0[143].z, _578);
    float _606 = fma(_548, _542, _598);
    float _608 = fma(_596, _460, _600);
    float _610 = fma(_558, _542, _602);
    float _612 = fma(_556, _542, _604);
    float _614 = _586 * 6.283185482025146484375;
    float _616 = sin(_614);
    float _618 = _608 * 0.15915493667125701904296875;
    float _620 = fma(_486, (*spvDescriptorSet0.vp_c9)._m0[145].y, _610);
    float _622 = fma(_486, (*spvDescriptorSet0.vp_c9)._m0[145].z, _612);
    float _624 = fma(_486, (*spvDescriptorSet0.vp_c9)._m0[145].x, _606);
    float _626 = _622 * _576;
    float _628 = _586 * 6.283185482025146484375;
    float _630 = cos(_628);
    float _632 = in.m_60.x;
    float _634 = in.m_60.y;
    float _636 = in.m_60.z;
    float _638 = _620 * _574;
    float _640 = _624 * _572;
    float _642 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _592);
    float _644 = _638 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _646 = _524 * 6.283185482025146484375;
    float _648 = sin(_646);
    float _650 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _590);
    float _652 = _640 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _654 = _642 * _644;
    float _656 = _570 * _616;
    float _658 = _626 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _660 = _650 * _652;
    float _662 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _594);
    float _664 = _618 * 6.283185482025146484375;
    float _666 = cos(_664);
    float _668 = _570 * _630;
    float _670 = _662 * _658;
    float _672 = _618 * 6.283185482025146484375;
    float _674 = sin(_672);
    float _676 = _648 * _616;
    float _678 = _648 * _630;
    float _680 = _634 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _682 = _634 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _684 = _634 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _686 = fma(_632, (*spvDescriptorSet0.vp_c10)._m0[4].x, _680);
    float _688 = _570 * _666;
    float _690 = _630 * _666;
    float _692 = _648 * _666;
    float _694 = _616 * _666;
    float _696 = _688 * _654;
    float _698 = fma(_632, (*spvDescriptorSet0.vp_c10)._m0[6].x, _682);
    float _700 = _692 * _654;
    float _702 = fma(_636, (*spvDescriptorSet0.vp_c10)._m0[4].z, _686);
    float _704 = fma(_674, _668, _676);
    float _706 = fma(_674, _676, _668);
    float _708 = -_656;
    float _710 = fma(_674, _678, _708);
    float _712 = -_654;
    float _714 = _674 * _712;
    float _716 = -_678;
    float _718 = fma(_674, _656, _716);
    float _720 = fma(_704, _660, _696);
    float _722 = fma(_710, _660, _700);
    float _724 = fma(_690, _660, _714);
    float _726 = fma(_636, (*spvDescriptorSet0.vp_c10)._m0[6].z, _698);
    float _728 = fma(_718, _670, _720);
    float _730 = fma(_706, _670, _722);
    float _732 = fma(_694, _670, _724);
    float _734 = _726 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _736 = _728 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _738 = _728 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _740 = fma(_632, (*spvDescriptorSet0.vp_c10)._m0[5].x, _684);
    float _742 = fma(_732, (*spvDescriptorSet0.vp_c10)._m0[8].x, _736);
    float _744 = fma(_732, (*spvDescriptorSet0.vp_c10)._m0[10].x, _738);
    float _746 = _702 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _748 = fma(_636, (*spvDescriptorSet0.vp_c10)._m0[5].z, _740);
    float _750 = fma(_730, (*spvDescriptorSet0.vp_c10)._m0[8].z, _742);
    float _752 = fma(_730, (*spvDescriptorSet0.vp_c10)._m0[10].z, _744);
    float _754 = _748 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _756 = _746 + _750;
    float _758 = _734 + _752;
    float _760 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _762 = _756 + _760;
    float _764 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _766 = _758 + _764;
    float _768 = _762 * _762;
    float _770 = _766 * _766;
    float _772 = _768 + _770;
    float _774 = sqrt(_772);
    bool _776 = _774 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _778 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _780 = _774 + _778;
    float _782 = _728 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _784 = fma(_732, (*spvDescriptorSet0.vp_c10)._m0[9].x, _782);
    float _786 = fma(_730, (*spvDescriptorSet0.vp_c10)._m0[9].z, _784);
    float _788 = 0.0;
    float _790 = _784;
    float _792 = _732;
    float _794 = _756;
    float _796 = _758;
    float _798 = _768;
    float _800 = _770;
    float _802 = _692;
    if (_776)
    {
        float _804 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _788 = _804;
    }
    float _806 = _788;
    float _808 = _754 + _786;
    float _810 = _808;
    if (_776)
    {
        float _812 = _808 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _790 = _812;
    }
    float _814 = _790;
    float _816 = _814;
    if (_776)
    {
        float _818 = rsqrt(_772);
        _792 = _818;
    }
    float _820 = _792;
    float _822 = _806;
    if (_776)
    {
        float _824 = _780 * _806;
        _822 = _824;
    }
    float _826 = _822;
    float _828 = _826;
    if (_776)
    {
        float _830 = _826 * 0.15915493667125701904296875;
        _828 = _830;
    }
    float _832 = _828;
    float _834 = _632;
    if (_776)
    {
        float _836 = _832 * 6.283185482025146484375;
        float _838 = sin(_836);
        _834 = _838;
    }
    float _840 = _834;
    if (_776)
    {
        float _842 = fma(_840, _814, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _816 = _842;
    }
    float _844 = _816;
    float _846 = _844;
    if (_776)
    {
        float _848 = _820 * _844;
        _846 = _848;
    }
    float _850 = _846;
    if (_776)
    {
        float _852 = fma(_762, _850, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _794 = _852;
    }
    float _854 = _794;
    if (_776)
    {
        float _856 = fma(_766, _850, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _796 = _856;
    }
    float _858 = _796;
    float _860 = fma(_854, 6.2500002968590706586837768554688e-05, 0.5);
    float _862 = fma(_858, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _3906 = float2(_860, _862);
    float3 _866 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_3906, float2(0.0), isnan(_3906)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_3906, float2(0.0), isnan(_3906)), level(0.0)).xyz;
    float _868 = _866.x;
    float _870 = _866.y;
    float _872 = _866.z;
    float _874 = in.m_75.y;
    bool _876 = _592 != 0.0;
    bool _878 = isnan(_592);
    bool _880 = _876 || _878;
    bool _882 = isnan(0.0);
    bool _884 = _880 || _882;
    float _886 = _832;
    if (_776)
    {
        float _888 = _832 * 6.283185482025146484375;
        float _890 = cos(_888);
        _886 = _890;
    }
    float _892 = _886;
    int _894 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _896 = _894 != 0;
    float _898 = in.m_67.w;
    bool _900 = _590 == 0.0;
    bool _902 = !_884;
    bool _904 = _900 && _902;
    int _906 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _908 = _906 != 0;
    float _910 = in.m_77.x;
    float _912 = in.m_77.y;
    float _914 = in.m_77.z;
    bool _916 = _594 == 0.0;
    bool _918 = _916 && _904;
    float _920 = in.m_75.x;
    float _922 = _780;
    float _924 = 1.0;
    float _926 = 1.0;
    if (_896)
    {
        float _928 = in.m_67.z;
        _922 = _928;
    }
    float _930 = _922;
    out.m_79.x = 1.0;
    out.m_79.y = 1.0;
    out.m_79.z = 1.0;
    float _932 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _934 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _936 = -_874;
    float _938 = _936 + 1.0;
    float _940 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _942 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _944 = _932 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _946 = _898 > 0.5;
    float _948 = _934 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _950 = _940 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _952 = _874;
    if (_908)
    {
        float _954 = _946 ? _938 : _874;
        _952 = _954;
    }
    float _956 = _952;
    float _958 = 0.0;
    float _960 = _910;
    float _962 = _912;
    if (_918)
    {
        _958 = _910;
    }
    float _964 = _958;
    out.m_81.x = _944;
    out.m_81.y = _948;
    out.m_81.z = _950;
    out.m_81.w = _942;
    float _966 = _964;
    if (!_896)
    {
        _924 = _920;
    }
    float _968 = _924;
    float _970 = 0.0;
    float _972 = _968;
    if (_918)
    {
        _970 = _964;
    }
    float _974 = _970;
    bool _976 = _930 > 0.5;
    bool _978 = _976 && _896;
    float _980 = in.m_83.x;
    float _982 = in.m_83.y;
    float _984 = in.m_83.z;
    float _986 = in.m_83.w;
    float _988 = _974;
    float _990 = _892;
    if (!_918)
    {
        _966 = _910;
    }
    float _992 = _966;
    if (_918)
    {
        _960 = _912;
    }
    float _994 = _960;
    float _996 = _994;
    if (_918)
    {
        _926 = _914;
    }
    float _998 = _926;
    float _1000 = _998;
    if (!_918)
    {
        float _1002 = fma(_594, (*spvDescriptorSet0.vp_c9)._m0[17].y, _914);
        _1000 = _1002;
    }
    float _1004 = _1000;
    float _1006 = 0.0;
    if (_918)
    {
        _1006 = _994;
    }
    float _1008 = _1006;
    float _1010 = _1008;
    if (!_918)
    {
        float _1012 = fma(_590, (*spvDescriptorSet0.vp_c9)._m0[17].y, _992);
        _988 = _1012;
    }
    float _1014 = _988;
    if (!_918)
    {
        _996 = _912;
    }
    float _1016 = _996;
    if (_896)
    {
        _962 = _920;
    }
    float _1018 = _962;
    float _1020 = _1018;
    if (!_918)
    {
        float _1022 = fma(_592, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1016);
        _1010 = _1022;
    }
    float _1024 = _1010;
    if (_978)
    {
        float _1026 = -_1018;
        float _1028 = _1026 + 1.0;
        _1020 = _1028;
    }
    float _1030 = _1020;
    float _1032 = -_1024;
    float _1034 = _674 * _1032;
    float _1036 = _692 * _1024;
    if (_896)
    {
        _972 = _1030;
    }
    float _1038 = _972;
    float _1040 = fma(_690, _1014, _1034);
    float _1042 = fma(_710, _1014, _1036);
    float _1044 = _984 * _992;
    float _1046 = _982 * _914;
    float _1048 = _980 * _1016;
    float _1050 = fma(_694, _1004, _1040);
    float _1052 = -_1044;
    float _1054 = fma(_980, _914, _1052);
    float _1056 = -_1046;
    float _1058 = fma(_984, _1016, _1056);
    float _1060 = -_1048;
    float _1062 = fma(_982, _992, _1060);
    float _1064 = -_982;
    float _1066 = _674 * _1064;
    float _1068 = _1054 * _986;
    float _1070 = _688 * _1024;
    float _1072 = _1058 * _986;
    float _1074 = _1062 * _986;
    float _1076 = -_1068;
    float _1078 = _674 * _1076;
    float _1080 = _688 * _982;
    float _1082 = _688 * _1068;
    float _1084 = _692 * _982;
    float _1086 = _692 * _1068;
    float _1088 = fma(_704, _1014, _1070);
    float _1090 = fma(_690, _1072, _1078);
    float _1092 = fma(_704, _1072, _1082);
    float _1094 = fma(_690, _980, _1066);
    float _1096 = fma(_704, _980, _1080);
    float _1098 = fma(_710, _980, _1084);
    float _1100 = fma(_710, _1072, _1086);
    float _1102 = fma(_718, _1004, _1088);
    float _1104 = fma(_694, _984, _1094);
    float _1106 = fma(_718, _984, _1096);
    float _1108 = fma(_706, _984, _1098);
    float _1110 = fma(_694, _1074, _1090);
    float _1112 = fma(_718, _1074, _1092);
    float _1114 = fma(_706, _1074, _1100);
    float _1116 = _1102 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1118 = _1074;
    float _1120 = _1116;
    if (_776)
    {
        float _1122 = _892 + (-1.0);
        _1118 = _1122;
    }
    float _1124 = _1118;
    float _1126 = _1102 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1128 = _1102 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1130 = fma(_1050, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1116);
    float _1132 = _1124;
    float _1134 = _1126;
    if (_776)
    {
        float _1136 = _1124 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1120 = _1136;
    }
    float _1138 = _1120;
    float _1140 = fma(_706, _1004, _1042);
    float _1142 = fma(_1050, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1126);
    float _1144 = fma(_1050, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1128);
    float _1146 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1148 = _1106 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    if (_776)
    {
        float _1150 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1152 = _854 + _1150;
        _1132 = _1152;
    }
    float _1154 = _1132;
    if (_776)
    {
        float _1156 = fma(_808, _892, _1138);
        _810 = _1156;
    }
    float _1158 = _810;
    if (_776)
    {
        float _1160 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1162 = _858 + _1160;
        _1134 = _1162;
    }
    float _1164 = _1134;
    float _1166 = fma(_1104, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1148);
    if (_776)
    {
        float _1168 = _1154 * _1154;
        _798 = _1168;
    }
    float _1170 = _798;
    float _1172 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1174 = _1158 + _1172;
    float _1176 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1178 = _1106 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    if (_776)
    {
        float _1180 = _1164 * _1164;
        _800 = _1180;
    }
    float _1182 = _800;
    float _1184 = fma(_1174, _1174, _1170);
    float _1186 = _1106 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1188 = _1038 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1190 = fma(_1104, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1178);
    float _1192 = _1184 + _1182;
    float _1194 = fma(_1104, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1186);
    float _1196 = _1112 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1198 = _1112 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1200 = _1112 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1202 = _1188 * _1146;
    float _1204 = _956 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1206 = sqrt(_1192);
    float _1208 = fma(_1110, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1196);
    float _1210 = fma(_1110, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1198);
    float _1212 = fma(_1110, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1200);
    float _1214 = _1204 * _1176;
    float _1216 = fma(_1108, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1166);
    float _1218 = fma(_1108, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1190);
    float _1220 = fma(_1114, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1208);
    float _1222 = fma(_1114, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1210);
    float _1224 = fma(_1140, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1130);
    float _1226 = fma(_1108, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1194);
    float _1228 = fma(_1114, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1212);
    float _1230 = fma(_1140, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1142);
    float _1232 = fma(_1140, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1144);
    out.m_85.z = _1202;
    out.m_85.w = _1214;
    bool _1234 = _1206 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1236 = isnan(_1206);
    bool _1238 = _1234 || _1236;
    bool _1240 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1242 = _1238 || _1240;
    out.m_87.x = _1216;
    out.m_87.y = _1218;
    out.m_87.z = _1226;
    out.m_89.x = _1220;
    out.m_89.y = _1222;
    out.m_89.z = _1228;
    out.m_91.x = _1224;
    out.m_91.y = _1230;
    out.m_91.z = _1232;
    if (!_1242)
    {
        _802 = 1.0;
    }
    float _1244 = _802;
    out.m_93.x = _868;
    out.m_93.y = _870;
    out.m_93.z = _872;
    bool _1246 = !_1242;
    float _1248 = _1244;
    if (!_1246)
    {
        bool _1250 = _1206 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1252 = isnan(_1206);
        bool _1254 = _1250 || _1252;
        bool _1256 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1258 = _1254 || _1256;
        if (!_1258)
        {
            float _1260 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1262 = _1206 + _1260;
            float _1264 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1266 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1264;
            float _1268 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1270 = _1268 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1272 = 1.0 / _1266;
            float _1274 = _1262 * _1272;
            float _1276 = fma(_1274, _1270, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1248 = _1276;
            _1278 = true;
        }
        else
        {
            bool _1280 = _1206 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1282 = isnan(_1206);
            bool _1284 = _1280 || _1282;
            bool _1286 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1288 = _1284 || _1286;
            if (!_1288)
            {
                float _1290 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1292 = _1206 + _1290;
                float _1294 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1296 = _1294 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1298 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1300 = _1298 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1302 = 1.0 / _1296;
                float _1304 = _1292 * _1302;
                float _1306 = fma(_1304, _1300, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1248 = _1306;
                _1278 = true;
            }
            else
            {
                _1248 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1278 = false;
    float _1308 = _1248;
    float _1310 = fma(_746, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1312 = fma(_734, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1314 = floor(_1310);
    float _1316 = floor(_1312);
    float _1318 = -_1314;
    float _1320 = _1310 + _1318;
    float _1322 = -_1316;
    float _1324 = _1312 + _1322;
    float2 _4725 = float2(_1320, _1324);
    float _1326 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4725, float2(0.0), isnan(_4725)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4725, float2(0.0), isnan(_4725)), level(0.0)).x;
    float _1328 = _754 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1330 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1332 = _1158 + _1330;
    float _1334 = fma(_746, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1328);
    float _1336 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1338 = _858 + _1336;
    float _1340 = fma(_1332, _1308, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1342 = fma(_734, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1334);
    float _1344 = _754 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1346 = _1342 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1348 = fma(_746, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1344);
    float _1350 = 1.0 / _1346;
    float _1352 = fma(_734, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1348);
    float _1354 = _1352 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1356 = _1354 + _1346;
    float _1358 = _1356 * _1350;
    float _1360 = _1358 * 0.5;
    float _1362 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1364 = fma(_1360, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1362);
    float _1366 = 1.0 / _1364;
    float _1368 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _1370 = _754 + _1368;
    float _1372 = _1370 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1374 = _1370 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1376 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1378 = _1366 * _1376;
    float _1380 = fma(_746, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1372);
    float _1382 = fma(_746, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1374);
    bool _1384 = _1378 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1386 = fma(_734, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1380);
    bool _1388 = _1378 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1390 = fma(_734, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1382);
    bool _1392 = !_1384;
    int _1394 = _1392 ? 0 : 1;
    float _1396 = _1386 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1398 = _1390 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1400 = trunc(_1396);
    int _1402 = int(_1400);
    int _1404 = 2;
    float _1406 = _1386;
    float _1408 = _1398;
    if (!_1384)
    {
        _1404 = 1;
    }
    int _1410 = _1404;
    int _1412 = _1410;
    if (!_1388)
    {
        _1412 = _1394;
    }
    int _1414 = _1412;
    float _1416 = trunc(_1398);
    int _1418 = int(_1416);
    int _1420 = _1414 << 6;
    bool _1422 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1424 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1426 = _1422 || _1424;
    bool _1428 = isnan(0.5);
    bool _1430 = _1426 || _1428;
    float _1432 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1434 = _854 + _1432;
    int _1436 = _1420 + 48;
    uint _1439 = uint(int(uint(_1436) >> uint(2)));
    uint _1441 = uint(int(uint(int(_1439)) >> uint(2)));
    int _1443 = int(_1439) & 3;
    float _1445 = (*spvDescriptorSet0.vp_c15)._m0[int(_1441)][_1443];
    int _1447 = int(_1439) + 1;
    uint _1449 = uint(int(uint(_1447) >> uint(2)));
    int _1451 = _1447 & 3;
    float _1453 = (*spvDescriptorSet0.vp_c15)._m0[int(_1449)][_1451];
    int _1455 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1457 = _1402 + _1455;
    int _1459 = _1457 + 1;
    float _1461 = fma(_1434, _1308, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1463 = fma(_1338, _1308, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    bool _1465 = _1459 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1467 = _1420 + 56;
    uint _1469 = uint(int(uint(_1467) >> uint(2)));
    uint _1471 = uint(int(uint(int(_1469)) >> uint(2)));
    int _1473 = int(_1469) & 3;
    float _1475 = (*spvDescriptorSet0.vp_c15)._m0[int(_1471)][_1473];
    int _1477 = int(_1469) + 1;
    uint _1479 = uint(int(uint(_1477) >> uint(2)));
    int _1481 = _1477 & 3;
    float _1483 = (*spvDescriptorSet0.vp_c15)._m0[int(_1479)][_1481];
    int _1485 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1487 = _1418 + _1485;
    int _1489 = _1487 + 1;
    float _1491 = _1434;
    int _1493 = _1489;
    if (_1430)
    {
        _1491 = _1340;
    }
    float _1495 = _1491;
    int _1497 = _1459 | _1489;
    float _1499 = as_type<float>(_1497);
    float _1501 = _1495;
    if (_1430)
    {
        _1406 = _1463;
    }
    float _1503 = _1406;
    int _1505 = _1420 + 64;
    uint _1507 = uint(int(uint(_1505) >> uint(2)));
    uint _1509 = uint(int(uint(int(_1507)) >> uint(2)));
    int _1511 = int(_1507) & 3;
    float _1513 = (*spvDescriptorSet0.vp_c15)._m0[int(_1509)][_1511];
    int _1515 = int(_1507) + 1;
    uint _1517 = uint(int(uint(_1515) >> uint(2)));
    int _1519 = _1515 & 3;
    float _1521 = (*spvDescriptorSet0.vp_c15)._m0[int(_1517)][_1519];
    bool _1523 = _1497 < 0;
    bool _1525 = _1523 || _1465;
    float _1527 = _1503;
    if (_1430)
    {
        _1499 = _1461;
    }
    float _1529 = _1499;
    bool _1531 = _1489 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1533 = _1531 || _1525;
    int _1535 = _1420 + 72;
    uint _1537 = uint(int(uint(_1535) >> uint(2)));
    uint _1539 = uint(int(uint(int(_1537)) >> uint(2)));
    int _1541 = int(_1537) & 3;
    float _1543 = (*spvDescriptorSet0.vp_c15)._m0[int(_1539)][_1541];
    int _1545 = int(_1537) + 1;
    uint _1547 = uint(int(uint(_1545) >> uint(2)));
    int _1549 = _1545 & 3;
    float _1551 = (*spvDescriptorSet0.vp_c15)._m0[int(_1547)][_1549];
    int _1553 = _1420 + 96;
    uint _1555 = uint(int(uint(_1553) >> uint(2)));
    uint _1557 = uint(int(uint(int(_1555)) >> uint(2)));
    int _1559 = int(_1555) & 3;
    float _1561 = (*spvDescriptorSet0.vp_c15)._m0[int(_1557)][_1559];
    int _1563 = int(_1555) + 1;
    uint _1565 = uint(int(uint(_1563) >> uint(2)));
    int _1567 = _1563 & 3;
    float _1569 = (*spvDescriptorSet0.vp_c15)._m0[int(_1565)][_1567];
    int _1571 = _1420 + 104;
    uint _1573 = uint(int(uint(_1571) >> uint(2)));
    uint _1575 = uint(int(uint(int(_1573)) >> uint(2)));
    int _1577 = int(_1573) & 3;
    float _1579 = (*spvDescriptorSet0.vp_c15)._m0[int(_1575)][_1577];
    int _1581 = int(_1573) + 1;
    uint _1583 = uint(int(uint(_1581) >> uint(2)));
    int _1585 = _1581 & 3;
    float _1587 = (*spvDescriptorSet0.vp_c15)._m0[int(_1583)][_1585];
    float _1589 = _1529;
    int _1591 = as_type<int>(_1569);
    if (!_1430)
    {
        float _1593 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1595 = _754 + _1593;
        float _1597 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1599 = _746 + _1597;
        float _1601 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1603 = _1595 * _1595;
        float _1605 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1607 = _734 + _1605;
        float _1609 = fma(_1599, _1599, _1603);
        float _1611 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1613 = fma(_1607, _1607, _1609);
        float _1615 = sqrt(_1613);
        float _1617 = _1601 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1619 = -_754;
        float _1621 = _1619 + _1340;
        float _1623 = precise::min(_1615, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1625 = _1623 * _1611;
        float _1627 = -_734;
        float _1629 = _1627 + _1463;
        float _1631 = _1617 * _1625;
        float _1633 = -_746;
        float _1635 = _1633 + _1461;
        float _1637 = fma(_1621, _1631, _754);
        float _1639 = fma(_1635, _1631, _746);
        float _1641 = fma(_1629, _1631, _734);
        _1501 = _1637;
        _1589 = _1639;
        _1527 = _1641;
    }
    float _1643 = _1501;
    float _1645 = _1589;
    float _1647 = _1527;
    float _1649 = _1370 * _1569;
    float _1651 = _1643 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (!_1533)
    {
        int _1653 = _1489 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1655 = _1653 + _1459;
        _1591 = _1655;
    }
    int _1657 = _1591;
    float _1659 = _1370 * _1521;
    float _1661 = fma(_746, _1561, _1649);
    float _1663 = fma(_1645, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1651);
    float _1665 = _1370 * _1453;
    if (!_1533)
    {
        int _1667 = _1657 << 2;
        _1493 = _1667;
    }
    int _1669 = _1493;
    float _1671 = fma(_734, _1579, _1661);
    float _1673 = fma(_1647, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1663);
    float _1675 = fma(_746, _1445, _1665);
    float _1677 = fma(_746, _1513, _1659);
    float _1679 = _1671 + _1587;
    float _1681 = _1673 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1683 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1685 = fma(_734, _1475, _1675);
    float _1687 = 1.0 / _1679;
    float _1689 = _1681 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    int _1691 = as_type<int>(_1673);
    int _1693 = _1669;
    float _1695 = _1683;
    float _1697 = _1679;
    if (!_1533)
    {
        uint _1699 = uint(int(uint(_1657) >> uint(2)));
        _1691 = int(_1699);
    }
    int _1701 = _1691;
    int _1703 = _1420 + 80;
    uint _1705 = uint(int(uint(_1703) >> uint(2)));
    uint _1707 = uint(int(uint(int(_1705)) >> uint(2)));
    int _1709 = int(_1705) & 3;
    float _1711 = (*spvDescriptorSet0.vp_c15)._m0[int(_1707)][_1709];
    int _1713 = int(_1705) + 1;
    uint _1715 = uint(int(uint(_1713) >> uint(2)));
    int _1717 = _1713 & 3;
    float _1719 = (*spvDescriptorSet0.vp_c15)._m0[int(_1715)][_1717];
    if (!_1533)
    {
        int _1721 = 12 & _1669;
        _1693 = _1721;
    }
    int _1723 = _1693;
    float _1725 = -_1689;
    float _1727 = fma(_1725, _1683, 1.0);
    float _1729 = fma(_734, _1543, _1677);
    float _1731 = _1685 + _1483;
    float _1733 = _1643 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    int _1735 = _1723;
    if (!_1533)
    {
        int _1737 = _1701 << 4;
        int _1739 = _1737 + _1723;
        _1735 = _1739;
    }
    int _1741 = _1735;
    float _1743 = _1729 + _1551;
    int _1745 = _1420 + 88;
    uint _1747 = uint(int(uint(_1745) >> uint(2)));
    uint _1749 = uint(int(uint(int(_1747)) >> uint(2)));
    int _1751 = int(_1747) & 3;
    float _1753 = (*spvDescriptorSet0.vp_c15)._m0[int(_1749)][_1751];
    int _1755 = int(_1747) + 1;
    uint _1757 = uint(int(uint(_1755) >> uint(2)));
    int _1759 = _1755 & 3;
    float _1761 = (*spvDescriptorSet0.vp_c15)._m0[int(_1757)][_1759];
    float _1763 = fma(_1645, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1733);
    float _1765 = _1643 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1767 = _1643 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1769 = log2(_1727);
    float _1771 = _1731 * _1687;
    float _1773 = fma(_1645, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1765);
    float _1775 = fma(_1645, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1767);
    float _1777 = _1731;
    float _1779 = _1687;
    float _1781 = _1771;
    if (!_1533)
    {
        int _1783 = _1741 + 400;
        uint _1785 = uint(int(uint(_1783) >> uint(2)));
        uint _1787 = uint(int(uint(int(_1785)) >> uint(2)));
        int _1789 = int(_1785) & 3;
        float _1791 = (*spvDescriptorSet0.vp_c15)._m0[int(_1787)][_1789];
        _1777 = _1791;
    }
    float _1793 = _1777;
    float _1795 = _1743 * _1687;
    float _1797 = fma(_1647, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1773);
    bool _1799 = _1771 >= 0.0;
    float _1801 = fma(_1647, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1775);
    float _1803 = fma(_1647, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1763);
    float _1805 = _1797 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _1807 = _1771 <= 1.0;
    bool _1809 = _1807 && _1799;
    float _1811 = _1801 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1813 = _1803 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1815 = _1805 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1817 = _1795 >= 0.0;
    bool _1819 = _1817 && _1809;
    float _1821 = _1805 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1823 = _1805 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1825 = fma(_1811, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1815);
    bool _1827 = _1795 <= 1.0;
    bool _1829 = _1827 && _1819;
    if (!_1533)
    {
        float _1831 = floor(_1396);
        _1695 = _1831;
    }
    float _1833 = _1695;
    float _1835 = fma(_1811, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1821);
    float _1837 = fma(_1681, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1825);
    float _1839 = fma(_1811, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1823);
    float _1841 = _1769 * 0.693147182464599609375;
    float _1843 = fma(_1813, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1837);
    float _1845 = _1340;
    if (!_1533)
    {
        float _1847 = floor(_1398);
        _1845 = _1847;
    }
    float _1849 = _1845;
    float _1851 = _1841 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    if (_1829)
    {
        float _1853 = float(_1414);
        _1697 = _1853;
    }
    float _1855 = _1697;
    float _1857 = 1.0 / _1843;
    float _1859 = _1370 * _1719;
    float _1861 = fma(_746, _1711, _1859);
    float _1863 = fma(_1681, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1835);
    float _1865 = fma(_1681, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1839);
    float _1867 = _1855;
    if (_1829)
    {
        float _1869 = rint(_1855);
        float _1871 = precise::max(_1869, 0.0);
        uint _1873 = uint(_1871);
        uint _1875 = clamp(_1873, 0u, 65535u);
        _1867 = as_type<float>(_1875);
    }
    float _1877 = _1867;
    float _1879 = fma(_734, _1753, _1861);
    float _1881 = fma(_1813, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1863);
    float _1883 = fma(_1813, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1865);
    float _1885 = _1849;
    float _1887 = _1883;
    float _1889 = _1881;
    if (!_1533)
    {
        float _1891 = -_1849;
        float _1893 = _1398 + _1891;
        _1885 = _1893;
    }
    float _1895 = _1885;
    float _1897 = _1879 + _1761;
    float _1899 = as_type<float>(_1741);
    if (!_1533)
    {
        float _1901 = rint(_1793);
        float _1903 = precise::max(_1901, 0.0);
        uint _1905 = uint(_1903);
        uint _1907 = clamp(_1905, 0u, 65535u);
        _1899 = as_type<float>(_1907);
    }
    float _1909 = _1899;
    float _1911 = _1881 * _1857;
    float _1913 = _1883 * _1857;
    float _1915 = _1897 * _1687;
    float _1917 = _1857;
    if (!_1533)
    {
        float _1919 = -_1833;
        float _1921 = _1396 + _1919;
        _1917 = _1921;
    }
    float _1923 = _1917;
    float _1925 = fma(_1911, 0.5, 0.5);
    float _1927 = fma(_1913, -0.5, 0.5);
    float _1929 = _1795;
    if (_1829)
    {
        float3 _5749 = float3(_1771, _1795, float(as_type<int>(_1877)));
        float3 _5753 = select(_5749, float3(0.0), isnan(_5749));
        float _1931 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5753.xy, uint(rint(_5753.z)), _1915, level(0.0));
        _1929 = _1931;
    }
    float _1933 = _1929;
    float3 _5763 = float3(_1925, _1927, _1851);
    float _1935 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5763, float3(0.0), isnan(_5763)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5763, float3(0.0), isnan(_5763)), level(0.0)).x;
    float3 _5772 = float3(_1925, _1927, _1851);
    float4 _1938 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5772, float3(0.0), isnan(_5772)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5772, float3(0.0), isnan(_5772)), level(0.0)).xyzw;
    float _1940 = _1938.x;
    float _1942 = _1938.y;
    float _1944 = _1938.z;
    float _1946 = _1938.w;
    float _1948 = _1923;
    if (!_1533)
    {
        float3 _5795 = float3(_1923, _1895, float(as_type<int>(_1909)));
        float3 _5797 = select(_5795, float3(0.0), isnan(_5795));
        float _1950 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5797.xy, uint(rint(_5797.z)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5797.xy, uint(rint(_5797.z)), level(0.0)).x;
        _1948 = _1950;
    }
    float _1952 = _1948;
    if (_1533)
    {
        _1408 = 1.0;
    }
    float _1954 = _1408;
    float _1956 = _1954;
    if (!_1533)
    {
        int _1958 = _1657 << 4;
        int _1960 = _1958 + 2048;
        uint _1962 = uint(int(uint(_1960) >> uint(2)));
        uint _1964 = uint(int(uint(int(_1962)) >> uint(2)));
        int _1966 = int(_1962) & 3;
        float _1968 = (*spvDescriptorSet0.vp_c15)._m0[int(_1964)][_1966];
        int _1970 = int(_1962) + 1;
        uint _1972 = uint(int(uint(_1970) >> uint(2)));
        int _1974 = _1970 & 3;
        float _1976 = (*spvDescriptorSet0.vp_c15)._m0[int(_1972)][_1974];
        int _1978 = _1960 + 8;
        uint _1980 = uint(int(uint(_1978) >> uint(2)));
        uint _1982 = uint(int(uint(int(_1980)) >> uint(2)));
        int _1984 = int(_1980) & 3;
        float _1986 = (*spvDescriptorSet0.vp_c15)._m0[int(_1982)][_1984];
        int _1988 = int(_1980) + 1;
        uint _1990 = uint(int(uint(_1988) >> uint(2)));
        int _1992 = _1988 & 3;
        float _1994 = (*spvDescriptorSet0.vp_c15)._m0[int(_1990)][_1992];
        float _1996 = _1370 * _1976;
        float _1998 = fma(_746, _1968, _1996);
        float _2000 = fma(_734, _1986, _1998);
        float _2002 = _2000 + _1994;
        float _2004 = precise::clamp(_2002, 0.0, 1.0);
        float _2006 = -_2004;
        float _2008 = _2006 + _1952;
        float _2010 = fma(_2008, 500.0, 1.5);
        float _2012 = exp2(_2010);
        float _2014 = 0.0 + _2012;
        float _2016 = precise::clamp(_2014, 0.0, 1.0);
        _1779 = _1986;
        _1781 = _1976;
        _1956 = _2016;
    }
    float _2018 = _1779;
    float _2020 = _1781;
    float _2022 = _1956;
    float _2024 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2026 = _1643 + _2024;
    float _2028 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2030 = _1645 + _2028;
    float _2032 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2034 = _1647 + _2032;
    float _2036 = _2026 * _2026;
    float _2038 = fma(_2030, _2030, _2036);
    float _2040 = fma(_2034, _2034, _2038);
    float _2042 = rsqrt(_2040);
    float _2044 = _2042 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2046 = _2030 * _2044;
    float _2048 = _2034 * _2044;
    float _2050 = _2046 * _2046;
    float _2052 = _2048 * _2048;
    float _2054 = _2050 + _2052;
    float _2056 = sqrt(_2054);
    bool _2058 = _2056 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2060 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2062 = _2056 + _2060;
    float _2064 = _2034;
    float _2066 = _2020;
    float _2068 = _2062;
    float _2070 = _2018;
    float _2072 = _2026;
    if (_2058)
    {
        float _2074 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2064 = _2074;
    }
    float _2076 = _2064;
    if (_2058)
    {
        float _2078 = rsqrt(_2054);
        _2066 = _2078;
    }
    float _2080 = _2066;
    float _2082 = _2080;
    if (_2058)
    {
        float _2084 = _2062 * _2076;
        _2068 = _2084;
    }
    float _2086 = _2068;
    if (_2058)
    {
        float _2088 = _2086 * 0.15915493667125701904296875;
        _2070 = _2088;
    }
    float _2090 = _2070;
    float _2092 = _2042;
    if (_2058)
    {
        float _2094 = _2090 * 6.283185482025146484375;
        float _2096 = sin(_2094);
        _2092 = _2096;
    }
    float _2098 = _2092;
    float _2100 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2102 = precise::max(0.0, _2100);
    float _2104 = _2036;
    float _2106 = _2102;
    float _2108 = _2100;
    if (_2058)
    {
        float _2110 = _2090 * 6.283185482025146484375;
        float _2112 = cos(_2110);
        _2104 = _2112;
    }
    float _2114 = _2104;
    float _2116 = -_2044;
    float _2118 = -_2102;
    float _2120 = fma(_2026, _2116, _2118);
    if (!_2058)
    {
        _2072 = _2048;
    }
    float _2122 = _2072;
    float _2124 = _2122;
    if (_2058)
    {
        float _2126 = _2120 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2106 = _2126;
    }
    float _2128 = _2106;
    float _2130 = _2128;
    float _2132 = _2098;
    if (_2058)
    {
        float _2134 = fma(_2098, _2128, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2130 = _2134;
    }
    float _2136 = _2130;
    float _2138 = _2136;
    if (!_2058)
    {
        _2132 = _2046;
    }
    float _2140 = _2132;
    float _2142 = _2140;
    float _2144 = _2114;
    if (_2058)
    {
        float _2146 = _2114 + (-1.0);
        _2108 = _2146;
    }
    float _2148 = _2108;
    float _2150 = _2148;
    if (_2058)
    {
        float _2152 = _2080 * _2136;
        _990 = _2152;
    }
    float _2154 = _990;
    if (!_2058)
    {
        _2138 = _2120;
    }
    float _2156 = _2138;
    float _2158 = _2156;
    if (_2058)
    {
        float _2160 = _2148 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2150 = _2160;
    }
    float _2162 = _2150;
    if (_2058)
    {
        float _2164 = _2046 * _2154;
        _2142 = _2164;
    }
    float _2166 = _2142;
    if (!_2058)
    {
        _2082 = _2050;
    }
    float _2168 = _2082;
    float _2170 = _2168;
    if (_2058)
    {
        float _2172 = _2048 * _2154;
        _2124 = _2172;
    }
    float _2174 = _2124;
    if (_2058)
    {
        float _2176 = fma(_2120, _2114, _2162);
        _2158 = _2176;
    }
    float _2178 = _2158;
    if (_2058)
    {
        float _2180 = _2166 * _2166;
        _2170 = _2180;
    }
    float _2182 = _2170;
    if (!_2058)
    {
        _2144 = _2052;
    }
    float _2184 = _2144;
    float _2186 = _2184;
    if (_2058)
    {
        float _2188 = _2174 * _2174;
        _2186 = _2188;
    }
    float _2190 = _2186;
    float _2192 = sqrt(_2040);
    float _2194 = fma(_2178, _2178, _2182);
    float _2196 = _2194 + _2190;
    float _2198 = rsqrt(_2196);
    float _2200 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2202 = fma(_2192, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2200);
    float _2204 = precise::clamp(_2202, 0.0, 1.0);
    float _2206 = -_2204;
    float _2208 = _2206 + 1.0;
    float _2210 = abs(_2208);
    float _2212 = log2(_2210);
    float _2214 = _2198 * _2166;
    float _2216 = _2198 * _2178;
    float _2218 = _2198 * _2174;
    float _2220 = _2214 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2222 = -_2220;
    float _2224 = fma(_2216, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2222);
    float _2226 = -_2218;
    float _2228 = fma(_2226, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2224);
    float _2230 = _2212 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2232 = fma(_2228, -0.5, 0.5);
    float _2234 = fma(_2228, 0.5, 0.5);
    float _2236 = exp2(_2230);
    float _2238 = fma(_2234, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2240 = fma(_2234, _2238, -0.212114393711090087890625);
    float _2242 = _2216 + 1.0;
    float _2244 = sqrt(_2232);
    float _2246 = fma(_2234, _2240, 1.570728778839111328125);
    float _2248 = -_2216;
    float _2250 = fma(_2236, _2242, _2248);
    float _2252 = _2244 * 0.636619746685028076171875;
    float _2254 = fma(_2250, 0.5, 0.5);
    float _2256 = -_2246;
    float _2258 = fma(_2252, _2256, 1.0);
    float2 _6274 = float2(_2258, _2254);
    float3 _2260 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6274, float2(0.0), isnan(_6274)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6274, float2(0.0), isnan(_6274)), level(0.0)).xyz;
    float _2262 = _2260.x;
    float _2264 = _2260.y;
    float _2266 = _2260.z;
    float _2268 = abs(_1378);
    float _2270 = log2(_2268);
    float _2272 = _2212 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2274 = -_1326;
    float _2276 = _2274 + 1.0;
    out.m_95.x = _1645;
    out.m_95.y = _1643;
    out.m_95.z = _1647;
    bool _2278 = _2192 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2280 = isnan(_2192);
    bool _2282 = _2278 || _2280;
    bool _2284 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2286 = _2282 || _2284;
    float _2288 = exp2(_2272);
    bool _2290 = _1378 <= 8000.0;
    bool _2292 = isnan(_1378);
    bool _2294 = _2290 || _2292;
    bool _2296 = isnan(8000.0);
    bool _2298 = _2294 || _2296;
    float _2300 = float(_2298);
    float _2302 = _2270 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2304 = _1805 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2306 = fma(_1811, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2304);
    float _2308 = exp2(_2302);
    float _2310 = fma(_2308, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2312 = precise::clamp(_2310, 0.0, 1.0);
    float _2314 = fma(_1681, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2306);
    float _2316 = -_2288;
    float _2318 = _2316 + 1.0;
    float _2320 = fma(_2312, -2.0, 3.0);
    float _2322 = _2312 * _2312;
    float _2324 = fma(_1813, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2314);
    float _2326 = _2322 * _2320;
    out.gl_Position.x = _1881;
    out.gl_Position.y = _1883;
    out.gl_Position.z = _2324;
    out.gl_Position.w = _1843;
    float _2328 = -_2326;
    float _2330 = _2328 + 1.0;
    float _2332 = fma(_2330, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2326);
    float _2334 = _2300 * _2332;
    float _2336 = _2300;
    float _2338 = _2324;
    if (!_1829)
    {
        _2336 = 1.0;
    }
    float _2340 = _2336;
    float _2342 = _2340;
    if (_1829)
    {
        bool _2344 = _1933 >= _1915;
        bool _2346 = isnan(_1933);
        bool _2348 = _2344 || _2346;
        bool _2350 = isnan(_1915);
        bool _2352 = _2348 || _2350;
        float _2354 = float(_2352);
        _2342 = _2354;
    }
    float _2356 = _2342;
    float _2358 = _2334 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2360 = _2318 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (!_2286)
    {
        _2338 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2362 = _2338;
    float _2364 = _2276 * _2358;
    float _2366 = precise::clamp(_2364, 0.0, 1.0);
    float _2368 = _2356 * _2022;
    float _2370 = _2360 * _1935;
    float _2372 = -_2360;
    float _2374 = _2372 + 1.0;
    float _2376 = -_2366;
    float _2378 = fma(_2376, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2380 = _2368;
    float _2382 = _2362;
    float _2384 = _2362;
    if (!_2286)
    {
        _1887 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2386 = _1887;
    float _2388 = _1946 * _2370;
    float _2390 = _1946 * _2374;
    float _2392 = -_2368;
    float _2394 = fma(_2392, _2378, 1.0);
    float _2396 = precise::clamp(_2394, 0.0, 1.0);
    float _2398 = _2396;
    float _2400 = _2388;
    float _2402 = _2386;
    float _2404 = _2386;
    if (!_2286)
    {
        _1889 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2406 = _1889;
    float _2408 = _2406;
    float _2410 = _2406;
    if (!_2286)
    {
        _2380 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2412 = _2380;
    float _2414 = _2396 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2416 = _2412;
    float _2418 = _2412;
    if (!_2286)
    {
        _2398 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2420 = _2398;
    out.m_97.x = _2414;
    float _2422 = _2266 * _2370;
    float _2424 = fma(_2262, _2388, _1940);
    float _2426 = fma(_2264, _2388, _1942);
    float _2428 = _2420;
    float _2430 = _2420;
    if (!_2286)
    {
        _2400 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2432 = _2400;
    float _2434 = fma(_1946, _2422, _1944);
    out.m_99.x = _2424;
    out.m_99.y = _2426;
    out.m_99.z = _2434;
    out.m_99.w = _2390;
    bool _2436 = !_2286;
    float _2438 = _2432;
    float _2440 = _2432;
    if (!_2436)
    {
        bool _2442 = _2192 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2444 = isnan(_2192);
        bool _2446 = _2442 || _2444;
        bool _2448 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2450 = _2446 || _2448;
        if (!_2450)
        {
            float _2452 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2454 = _2192 + _2452;
            float _2456 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2458 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2456;
            float _2460 = 1.0 / _2458;
            float _2462 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2464 = _2462 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2466 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2468 = _2466 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2470 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2472 = _2470 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2474 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2476 = _2474 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2478 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2480 = _2478 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2482 = _2454 * _2460;
            float _2484 = precise::clamp(_2482, 0.0, 1.0);
            float _2486 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2488 = _2486 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2490 = fma(_2484, _2464, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2492 = fma(_2484, _2488, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2494 = fma(_2484, _2468, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2496 = fma(_2484, _2472, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2498 = fma(_2484, _2476, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2500 = fma(_2484, _2480, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2404 = _2492;
            _2418 = _2498;
            _2384 = _2490;
            _2440 = _2496;
            _2410 = _2494;
            _2430 = _2500;
            _2502 = true;
        }
        else
        {
            bool _2504 = _2192 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2506 = isnan(_2192);
            bool _2508 = _2504 || _2506;
            bool _2510 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2512 = _2508 || _2510;
            if (!_2512)
            {
                _2382 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2514 = _2382;
            _2384 = _2514;
            if (!_2512)
            {
                _2402 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2516 = _2402;
            _2404 = _2516;
            if (!_2512)
            {
                _2408 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2518 = _2408;
            _2410 = _2518;
            if (!_2512)
            {
                _2438 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2520 = _2438;
            _2440 = _2520;
            if (!_2512)
            {
                _2416 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2522 = _2416;
            _2418 = _2522;
            if (!_2512)
            {
                _2428 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2524 = _2428;
            bool _2526 = !_2512;
            _2430 = _2524;
            if (!_2526)
            {
                bool _2528 = _2192 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2530 = isnan(_2192);
                bool _2532 = _2528 || _2530;
                bool _2534 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2536 = _2532 || _2534;
                if (!_2536)
                {
                    float _2538 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2540 = _2192 + _2538;
                    float _2542 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2544 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2542;
                    float _2546 = 1.0 / _2544;
                    float _2548 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2550 = _2548 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2552 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2554 = _2552 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2556 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2558 = _2556 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2560 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2562 = _2560 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2564 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2566 = _2564 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2568 = _2540 * _2546;
                    float _2570 = precise::clamp(_2568, 0.0, 1.0);
                    float _2572 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2574 = _2572 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2576 = fma(_2570, _2550, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2578 = fma(_2570, _2574, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2580 = fma(_2570, _2554, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2582 = fma(_2570, _2558, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2584 = fma(_2570, _2562, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2586 = fma(_2570, _2566, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2404 = _2578;
                    _2418 = _2584;
                    _2384 = _2576;
                    _2440 = _2582;
                    _2410 = _2580;
                    _2430 = _2586;
                    _2502 = true;
                }
                else
                {
                    _2404 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2418 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2384 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2440 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2410 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2430 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2502 = false;
    float _2588 = _2404;
    float _2590 = _2418;
    float _2592 = _2384;
    float _2594 = _2440;
    float _2596 = _2410;
    float _2598 = _2430;
    float _2600 = fma(_1230, -0.5, 0.5);
    float _2602 = precise::clamp(_2600, 0.0, 1.0);
    float _2604 = -_2588;
    float _2606 = _2604 + _2590;
    float _2608 = -_2592;
    float _2610 = _2608 + _2594;
    float _2612 = -_2596;
    float _2614 = _2612 + _2598;
    bool _2616 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2618 = fma(_2602, _2606, _2588);
    float _2620 = fma(_2602, _2610, _2592);
    float _2622 = fma(_2602, _2614, _2596);
    float _2624 = _2618 * 0.586610972881317138671875;
    out.m_63.x = 1.0;
    float _2626 = fma(_2620, 0.298911988735198974609375, _2624);
    float _2628 = fma(_2622, 0.114477999508380889892578125, _2626);
    out.m_101.x = 0.0;
    float _2630 = -_2628;
    float _2632 = _2620 + _2630;
    float _2634 = -_2628;
    float _2636 = _2618 + _2634;
    float _2638 = -_2628;
    float _2640 = _2622 + _2638;
    float _2642 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2644 = fma(_2632, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2628);
    float _2646 = fma(_2636, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2628);
    float _2648 = fma(_2640, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2628);
    out.m_97.w = _2642;
    out.m_103.x = _2644;
    out.m_103.y = _2646;
    out.m_103.z = _2648;
    if (!_2616)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2650 = -_1643;
    float _2652 = _2650 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2654 = -_1645;
    float _2656 = _2654 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2658 = -_1647;
    float _2660 = _2658 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2662 = _2652 * _2652;
    float _2664 = fma(_2656, _2656, _2662);
    float _2666 = fma(_2660, _2660, _2664);
    float _2668 = sqrt(_2666);
    float _2670 = rsqrt(_2666);
    float _2672 = -_2668;
    float _2674 = _2672 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2676 = _2674 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2678 = precise::clamp(_2676, 0.0, 1.0);
    float _2680 = _2656 * _2670;
    float _2682 = _2652 * _2670;
    float _2684 = abs(_2678);
    float _2686 = log2(_2684);
    float _2688 = _2660 * _2670;
    float _2690 = _2680 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2692 = _1230 * _2682;
    float _2694 = -_2682;
    float _2696 = -_2690;
    float _2698 = fma(_2694, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2696);
    float _2700 = fma(_1224, _2680, _2692);
    float _2702 = -_2688;
    float _2704 = fma(_2702, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2698);
    float _2706 = fma(_1232, _2688, _2700);
    float _2708 = precise::clamp(_2706, 0.0, 1.0);
    float _2710 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2712 = _2704 + _2710;
    float _2714 = _2686 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2716 = _2712 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2718 = precise::clamp(_2716, 0.0, 1.0);
    float _2720 = exp2(_2714);
    float _2722 = _2720 * _2718;
    float _2724 = _2708 * _2722;
    float _2726 = _2724 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2728 = _2724 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2730 = _2724 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_101.x = _2726;
    out.m_101.y = _2728;
    out.m_101.z = _2730;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

