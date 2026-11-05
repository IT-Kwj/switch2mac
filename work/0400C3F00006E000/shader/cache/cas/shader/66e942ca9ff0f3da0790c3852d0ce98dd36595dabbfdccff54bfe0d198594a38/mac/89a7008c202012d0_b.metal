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
    constant _16* vp_c9 [[id(1)]];
    constant _16* vp_c8 [[id(2)]];
    constant _16* vp_c10 [[id(3)]];
    constant _16* vp_c13 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    texture2d<float> vp_t_tcb_24 [[id(6)]];
    sampler vp_t_tcb_24Smplr [[id(7)]];
    texture2d_array<float> vp_t_tcb_14 [[id(8)]];
    sampler vp_t_tcb_14Smplr [[id(9)]];
    texture2d_array<float> vp_t_tcb_16 [[id(10)]];
    sampler vp_t_tcb_16Smplr [[id(11)]];
    sampler vp_t_tcb_24Smplr_w [[id(12)]];
    sampler vp_t_tcb_14Smplr_w [[id(13)]];
    constant dm_border_t* dm_border [[id(14)]];
};

struct main0_out
{
    float4 m_69 [[user(locn0)]];
    float4 m_75 [[user(locn1)]];
    float4 m_81 [[user(locn2)]];
    float4 m_79 [[user(locn3)]];
    float4 m_93 [[user(locn4)]];
    float4 m_50 [[user(locn5)]];
    float4 m_77 [[user(locn6)]];
    float4 m_85 [[user(locn7)]];
    float4 m_87 [[user(locn8)]];
    float4 m_83 [[user(locn9)]];
    float4 m_91 [[user(locn10)]];
    float4 m_89 [[user(locn11)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_71 [[attribute(0)]];
    float4 m_63 [[attribute(1)]];
    float4 m_61 [[attribute(2)]];
    float4 m_65 [[attribute(3)]];
    float4 m_73 [[attribute(4)]];
    float4 m_59 [[attribute(5)]];
    float4 m_47 [[attribute(6)]];
    float4 m_52 [[attribute(7)]];
    float4 m_54 [[attribute(8)]];
    float4 m_67 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4405 = false;
    bool _992 = false;
    bool _814 = false;
    bool _528 = false;
    bool _336 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _107 = in.m_47.w;
    float _109 = trunc(_107);
    int _112 = int(_109);
    bool _116 = _112 >= 1;
    float _118 = 0.0;
    if (!_116)
    {
        _118 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _120 = _118;
    float _122 = _120;
    if (!_116)
    {
        out.m_50.x = 0.0;
    }
    int _124 = 0;
    if (!_116)
    {
        float _126 = _120 * 5.0;
        _124 = as_type<int>(_126);
    }
    int _128 = _124;
    if (!_116)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4657 = as_type<float>(_128);
        out.gl_Position.z = _4657;
    }
    if (!_116)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _130 = in.m_52.w;
    bool _132 = _130 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _134 = isnan(_130);
    bool _136 = _132 || _134;
    bool _138 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _140 = _136 || _138;
    float _142 = -_130;
    float _144 = _142 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _146 = 0.0;
    float _148 = _144;
    if (_140)
    {
        float _150 = float(_112);
        _146 = _150;
    }
    float _152 = _146;
    bool _154 = _144 >= _152;
    bool _156 = !_140;
    bool _158 = _154 || _156;
    if (_158)
    {
        _122 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _160 = _122;
    if (_158)
    {
        out.m_50.x = 0.0;
    }
    int _162 = 0;
    if (_158)
    {
        float _164 = _160 * 5.0;
        _162 = as_type<int>(_164);
    }
    int _166 = _162;
    if (_158)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4726 = as_type<float>(_166);
        out.gl_Position.z = _4726;
    }
    if (_158)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _168 = in.m_54.x;
    float _170 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _172 = _144 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _174 = as_type<float>(int(gl_VertexIndex));
    float _176 = in.m_59.x;
    float _178 = in.m_59.y;
    float _180 = in.m_59.z;
    float _182 = in.m_61.x;
    float _184 = in.m_61.y;
    float _186 = in.m_61.z;
    float _188 = in.m_63.x;
    float _190 = in.m_63.y;
    float _192 = in.m_63.z;
    float _194 = _172 * _170;
    float _196 = in.m_65.x;
    float _198 = in.m_65.y;
    float _200 = in.m_65.z;
    float _202 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[20].x, _194);
    int _204 = as_type<int>(_174) & 1;
    bool _206 = _204 != 0;
    int _208 = as_type<int>(_174) & 2;
    bool _210 = _208 != 0;
    float _212 = _202 * 6.283185482025146484375;
    float _214 = floor(_202);
    float _216 = _212 * 0.15915493667125701904296875;
    bool _218 = !_210;
    float _220 = _218 ? (-0.5) : 0.5;
    int _222 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _224 = _222 != 0;
    int _226 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _228 = _226 != 0;
    float _230 = _178 * _184;
    int _232 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _234 = _232 != 0;
    float _236 = _216 * 6.283185482025146484375;
    float _238 = cos(_236);
    float _240 = _178 * _190;
    bool _242 = !_224;
    int _244 = _242 ? 0 : 1;
    float _246 = fma(_176, _182, _230);
    bool _248 = !_234;
    int _250 = _248 ? 0 : 1;
    float _252 = _178 * _198;
    int _254 = abs(_244);
    float _256 = -_214;
    float _258 = _202 + _256;
    int _260 = abs(_250);
    float _262 = fma(_176, _188, _240);
    float _264 = fma(_176, _196, _252);
    float _266 = -_258;
    float _268 = fma(_266, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _270 = !_228;
    int _272 = _270 ? 0 : 1;
    float _274 = fma(_180, _186, _246);
    float _276 = float(_254);
    float _278 = fma(_238, 0.5, 0.5);
    bool _280 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _282 = fma(_180, _192, _262);
    int _284 = abs(_272);
    float _286 = abs(_268);
    float _288 = _276 * _286;
    bool _290 = _258 < 0.5;
    float _292 = float(_290);
    float _294 = -_278;
    float _296 = fma(_294, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _298 = float(_260);
    float _300 = fma(_180, _200, _264);
    float _302 = -_292;
    float _304 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _306 = !_206;
    float _308 = _306 ? (-0.5) : 0.5;
    float _310 = fma(_298, _296, _288);
    float _312 = float(_284);
    float _314 = abs(_304);
    float _316 = fma(_312, _314, _310);
    bool _318 = !_280;
    float _334;
    if (!_318)
    {
        float _320 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _322 = _168 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _324 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[12].x, _144);
        float _326 = _324 * _320;
        float _328 = floor(_326);
        float _330 = -_328;
        float _332 = _326 + _330;
        _334 = _332;
        _336 = true;
    }
    else
    {
        float _338 = float(_112);
        float _340 = 1.0 / _338;
        float _342 = _144 * _340;
        _334 = _342;
    }
    _336 = false;
    float _344 = _334;
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _348 = _344 + _346;
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _352 = _344 + _350;
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _356 = _344 + _354;
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _360 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _358;
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _364 = _362 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _366 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _368 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _366;
    bool _370 = _344 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _372 = isnan(_344);
    bool _374 = _370 || _372;
    bool _376 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _378 = _374 || _376;
    float _380 = float(_378);
    float _382 = 1.0 / _360;
    bool _384 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _386 = 1.0 / _368;
    float _388 = 1.0 / _364;
    float _390 = _348 * _382;
    bool _392 = _344 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _394 = isnan(_344);
    bool _396 = _392 || _394;
    bool _398 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _400 = _396 || _398;
    float _402 = float(_400);
    float _404 = -_380;
    float _406 = _404 + 1.0;
    float _408 = _402 * _406;
    float _410 = _352 * _386;
    bool _412 = _344 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _414 = isnan(_344);
    bool _416 = _412 || _414;
    bool _418 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _420 = _416 || _418;
    float _422 = float(_420);
    float _424 = -_402;
    float _426 = _424 + 1.0;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _430 = _428 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _432 = _422 * _426;
    float _434 = -_422;
    float _436 = _434 + 1.0;
    float _438 = _356 * _388;
    bool _440 = _344 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _442 = isnan(_344);
    bool _444 = _440 || _442;
    bool _446 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _448 = _444 || _446;
    float _450 = float(_448);
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _454 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _452;
    float _456 = fma(_430, _438, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _460 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _458;
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _464 = _462 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _466 = fma(_454, _390, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _468 = _450 * _436;
    float _470 = fma(_460, _390, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _472 = fma(_464, _438, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _474 = -_450;
    float _476 = _474 + 1.0;
    float _478 = _466 * _468;
    float _480 = _470 * _468;
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _484 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _482;
    float _486 = fma(_476, (*spvDescriptorSet0.vp_c9)._m0[143].x, _478);
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _490 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _488;
    float _492 = fma(_476, (*spvDescriptorSet0.vp_c9)._m0[143].y, _480);
    float _494 = fma(_484, _410, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _496 = fma(_456, _432, _486);
    float _498 = fma(_490, _410, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _500 = fma(_472, _432, _492);
    float _502 = fma(_494, _408, _496);
    float _504 = fma(_498, _408, _500);
    float _506 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[146].x, _502);
    float _508 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[146].y, _504);
    bool _510 = !_384;
    float _526;
    if (!_510)
    {
        float _512 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _514 = _168 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _516 = fma(_514, (*spvDescriptorSet0.vp_c9)._m0[11].x, _144);
        float _518 = _516 * _512;
        float _520 = floor(_518);
        float _522 = -_520;
        float _524 = _518 + _522;
        _526 = _524;
        _528 = true;
    }
    else
    {
        float _530 = float(_112);
        float _532 = 1.0 / _530;
        float _534 = _144 * _532;
        _526 = _534;
    }
    _528 = false;
    float _536 = _526;
    float _538 = in.m_67.x;
    float _540 = in.m_67.y;
    float _542 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _544 = _536 + _542;
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _548 = _536 + _546;
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _552 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _550;
    float _554 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _556 = _554 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _558 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _560 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _558;
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _564 = _562 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _566 = 1.0 / _552;
    bool _568 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _570 = 1.0 / _556;
    float _572 = 1.0 / _564;
    float _574 = _508 * _540;
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _578 = _536 + _576;
    float _580 = _548 * _566;
    bool _582 = _536 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _584 = isnan(_536);
    bool _586 = _582 || _584;
    bool _588 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _590 = _586 || _588;
    float _592 = float(_590);
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _596 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _594;
    float _598 = 1.0 / _560;
    float _600 = _544 * _570;
    bool _602 = _536 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _604 = isnan(_536);
    bool _606 = _602 || _604;
    bool _608 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _610 = _606 || _608;
    float _612 = float(_610);
    float _614 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _616 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _614;
    float _618 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _620 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _618;
    float _622 = -_612;
    float _624 = _622 + 1.0;
    float _626 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _628 = _536 + _626;
    float _630 = _592 * _624;
    float _632 = -_592;
    float _634 = _632 + 1.0;
    float _636 = _628 * _572;
    bool _638 = _536 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _640 = isnan(_536);
    bool _642 = _638 || _640;
    bool _644 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _646 = _642 || _644;
    float _648 = float(_646);
    float _650 = _578 * _598;
    bool _652 = _536 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _654 = isnan(_536);
    bool _656 = _652 || _654;
    bool _658 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _660 = _656 || _658;
    float _662 = float(_660);
    float _664 = -_648;
    float _666 = _664 + 1.0;
    bool _668 = _536 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _670 = isnan(_536);
    bool _672 = _668 || _670;
    bool _674 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _676 = _672 || _674;
    float _678 = float(_676);
    float _680 = fma(_616, _650, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _682 = fma(_596, _650, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _684 = _662 * _666;
    float _686 = -_662;
    float _688 = _686 + 1.0;
    float _690 = _678 * _634;
    float _692 = fma(_620, _650, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _694 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _696 = _694 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _698 = _612 * _688;
    float _700 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _702 = _700 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _704 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _706 = _704 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _708 = _680 * _690;
    float _710 = _682 * _690;
    float _712 = -_678;
    float _714 = _712 + 1.0;
    float _716 = _692 * _690;
    float _718 = fma(_696, _636, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _720 = fma(_702, _636, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _722 = fma(_714, (*spvDescriptorSet0.vp_c9)._m0[107].x, _708);
    float _724 = fma(_714, (*spvDescriptorSet0.vp_c9)._m0[107].y, _710);
    float _726 = fma(_706, _636, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _728 = fma(_714, (*spvDescriptorSet0.vp_c9)._m0[107].z, _716);
    float _730 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _732 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _730;
    float _734 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _736 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _734;
    float _738 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _740 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _738;
    float _742 = fma(_718, _630, _722);
    float _744 = fma(_720, _630, _724);
    float _746 = fma(_726, _630, _728);
    float _748 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _750 = _748 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _752 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _754 = _752 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _756 = fma(_732, _580, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _758 = fma(_736, _580, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _760 = fma(_740, _580, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _762 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _764 = _762 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _766 = fma(_750, _600, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _768 = fma(_754, _600, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _770 = fma(_756, _698, _742);
    float _772 = fma(_764, _600, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _774 = fma(_758, _698, _744);
    float _776 = fma(_760, _698, _746);
    float _778 = fma(_766, _684, _770);
    float _780 = fma(_768, _684, _774);
    float _782 = fma(_772, _684, _776);
    float _784 = _506 * _538;
    float _786 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[111].x, _778);
    float _788 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[111].y, _780);
    float _790 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[111].z, _782);
    bool _792 = !_568;
    int _794 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[110].y);
    int _796 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _812;
    if (!_792)
    {
        float _798 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _800 = _168 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _802 = fma(_800, (*spvDescriptorSet0.vp_c9)._m0[11].y, _144);
        float _804 = _802 * _798;
        float _806 = floor(_804);
        float _808 = -_806;
        float _810 = _804 + _808;
        _812 = _810;
        _814 = true;
    }
    else
    {
        float _816 = float(_112);
        float _818 = 1.0 / _816;
        float _820 = _144 * _818;
        _812 = _820;
    }
    _814 = false;
    float _822 = _812;
    float _824 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _826 = _824 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _828 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _830 = _828 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _832 = _822 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _834 = isnan(_822);
    bool _836 = _832 || _834;
    bool _838 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _840 = _836 || _838;
    float _842 = float(_840);
    float _844 = 1.0 / _826;
    float _846 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _848 = _846 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _850 = _822 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _852 = isnan(_822);
    bool _854 = _850 || _852;
    bool _856 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _858 = _854 || _856;
    float _860 = float(_858);
    float _862 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _864 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _862;
    float _866 = -_842;
    float _868 = _866 + 1.0;
    bool _870 = _822 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _872 = isnan(_822);
    bool _874 = _870 || _872;
    bool _876 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _878 = _874 || _876;
    float _880 = float(_878);
    bool _882 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _884 = 1.0 / _830;
    float _886 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _888 = _886 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _890 = _860 * _868;
    float _892 = -_860;
    float _894 = _892 + 1.0;
    float _896 = _880 * _894;
    float _898 = 1.0 / _848;
    float _900 = _864 * _844;
    float _902 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _904 = _822 + _902;
    float _906 = -_880;
    float _908 = _906 + 1.0;
    float _910 = fma(_900, _904, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _912 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _914 = _822 + _912;
    float _916 = _888 * _884;
    bool _918 = _822 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _920 = isnan(_822);
    bool _922 = _918 || _920;
    bool _924 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _926 = _922 || _924;
    float _928 = float(_926);
    float _930 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _932 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _930;
    float _934 = _910 * _896;
    float _936 = fma(_916, _914, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _938 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _940 = _822 + _938;
    float _942 = -_928;
    float _944 = _942 + 1.0;
    float _946 = fma(_908, (*spvDescriptorSet0.vp_c9)._m0[115].x, _934);
    float _948 = _932 * _898;
    float _950 = _842 * _944;
    float _952 = fma(_936, _890, _946);
    float _954 = fma(_948, _940, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _956 = _788 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _958 = _790 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _960 = fma(_954, _950, _952);
    float _962 = _786 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _964 = _956 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _966 = _958 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _968 = fma(_928, (*spvDescriptorSet0.vp_c9)._m0[118].x, _960);
    float _970 = _962 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _972 = _968 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_69.x = _970;
    out.m_69.y = _964;
    out.m_69.z = _966;
    out.m_69.w = _972;
    bool _974 = !_882;
    float _990;
    if (!_974)
    {
        float _976 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _978 = _168 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _980 = fma(_978, (*spvDescriptorSet0.vp_c9)._m0[11].w, _144);
        float _982 = _980 * _976;
        float _984 = floor(_982);
        float _986 = -_984;
        float _988 = _982 + _986;
        _990 = _988;
        _992 = true;
    }
    else
    {
        float _994 = float(_112);
        float _996 = 1.0 / _994;
        float _998 = _144 * _996;
        _990 = _998;
    }
    _992 = false;
    float _1000 = _990;
    float _1002 = in.m_47.x;
    float _1004 = in.m_47.y;
    float _1006 = in.m_47.z;
    float _1008 = in.m_71.y;
    float _1010 = in.m_63.w;
    float _1012 = in.m_65.w;
    float _1014 = _190 * _1004;
    float _1016 = _198 * _1004;
    float _1018 = fma(_188, _1002, _1014);
    float _1020 = fma(_196, _1002, _1016);
    float _1022 = fma(_192, _1006, _1018);
    float _1024 = _1004 + _1008;
    float _1026 = fma(_200, _1006, _1020);
    float _1028 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1030 = _1022 + _1010;
    float _1032 = _1024 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1034 = _1026 + _1012;
    float _1036 = _1024 + _1028;
    float _1038 = fma(_1030, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1032);
    float _1040 = _1036 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1042 = _1036 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1044 = fma(_1034, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1038);
    float _1046 = _1024 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1048 = fma(_1030, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1040);
    float _1050 = fma(_1030, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1042);
    float _1052 = _1044 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1054 = fma(_1030, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1046);
    float _1056 = fma(_1034, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1048);
    float _1058 = fma(_1034, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1050);
    float _1060 = 1.0 / _1052;
    float _1062 = fma(_1034, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1054);
    float _1064 = _1056 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1066 = _1058 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1068 = _1062 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1070 = trunc(_1064);
    int _1072 = int(_1070);
    float _1074 = _1068 + _1052;
    float _1076 = _1074 * _1060;
    float _1078 = _1076 * 0.5;
    float _1080 = trunc(_1066);
    int _1082 = int(_1080);
    float _1084 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1086 = fma(_1078, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1084);
    int _1088 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1090 = _1072 + _1088;
    int _1092 = _1090 + 1;
    float _1094 = 1.0 / _1086;
    int _1096 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1098 = _1082 + _1096;
    int _1100 = _1098 + 1;
    int _1102 = _1092 | _1100;
    float _1104 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1106 = _1094 * _1104;
    bool _1108 = _1106 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1110 = _1106 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _1112 = !_1108;
    int _1114 = _1112 ? 0 : 1;
    int _1116 = 2;
    int _1118 = _1092;
    float _1120 = _1064;
    if (!_1108)
    {
        _1116 = 1;
    }
    int _1122 = _1116;
    int _1124 = _1122;
    if (!_1110)
    {
        _1124 = _1114;
    }
    int _1126 = _1124;
    bool _1128 = _1092 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1130 = _1126 << 6;
    bool _1132 = _1102 < 0;
    bool _1134 = _1132 || _1128;
    int _1136 = _1130 + 96;
    uint _1139 = uint(int(uint(_1136) >> uint(2)));
    uint _1141 = uint(int(uint(int(_1139)) >> uint(2)));
    int _1143 = int(_1139) & 3;
    float _1145 = (*spvDescriptorSet0.vp_c15)._m0[int(_1141)][_1143];
    int _1147 = int(_1139) + 1;
    uint _1149 = uint(int(uint(_1147) >> uint(2)));
    int _1151 = _1147 & 3;
    float _1153 = (*spvDescriptorSet0.vp_c15)._m0[int(_1149)][_1151];
    bool _1155 = _1100 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1157 = _1155 || _1134;
    int _1159 = int(_1134);
    int _1161 = _1108 ? 2 : 0;
    int _1163 = _1159 | _1161;
    int _1165 = _228 ? 4 : 0;
    int _1167 = _1163 | _1165;
    int _1169 = _1157 ? 8 : 0;
    int _1171 = _1167 | _1169;
    int _1173 = false ? 16 : 0;
    int _1175 = _1171 | _1173;
    int _1177 = false ? 32 : 0;
    int _1179 = _1175 | _1177;
    int _1181 = false ? 64 : 0;
    int _1183 = _1179 | _1181;
    int _1185 = _1183 & 8;
    int _1187 = _1130 + 104;
    uint _1189 = uint(int(uint(_1187) >> uint(2)));
    uint _1191 = uint(int(uint(int(_1189)) >> uint(2)));
    int _1193 = int(_1189) & 3;
    float _1195 = (*spvDescriptorSet0.vp_c15)._m0[int(_1191)][_1193];
    int _1197 = int(_1189) + 1;
    uint _1199 = uint(int(uint(_1197) >> uint(2)));
    int _1201 = _1197 & 3;
    float _1203 = (*spvDescriptorSet0.vp_c15)._m0[int(_1199)][_1201];
    float _1205 = as_type<float>(_1126);
    if (!_1157)
    {
        int _1207 = _1100 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1209 = _1207 + _1092;
        _1118 = _1209;
    }
    int _1211 = _1118;
    int _1213 = _1130 + 48;
    uint _1215 = uint(int(uint(_1213) >> uint(2)));
    uint _1217 = uint(int(uint(int(_1215)) >> uint(2)));
    int _1219 = int(_1215) & 3;
    float _1221 = (*spvDescriptorSet0.vp_c15)._m0[int(_1217)][_1219];
    int _1223 = int(_1215) + 1;
    uint _1225 = uint(int(uint(_1223) >> uint(2)));
    int _1227 = _1223 & 3;
    float _1229 = (*spvDescriptorSet0.vp_c15)._m0[int(_1225)][_1227];
    if (!_1157)
    {
        int _1231 = _1211 << 2;
        _794 = _1231;
    }
    int _1233 = _794;
    int _1235 = _1233;
    if (!_1157)
    {
        uint _1237 = uint(int(uint(_1211) >> uint(2)));
        _796 = int(_1237);
    }
    int _1239 = _796;
    int _1241 = _1130 + 64;
    uint _1243 = uint(int(uint(_1241) >> uint(2)));
    uint _1245 = uint(int(uint(int(_1243)) >> uint(2)));
    int _1247 = int(_1243) & 3;
    float _1249 = (*spvDescriptorSet0.vp_c15)._m0[int(_1245)][_1247];
    int _1251 = int(_1243) + 1;
    uint _1253 = uint(int(uint(_1251) >> uint(2)));
    int _1255 = _1251 & 3;
    float _1257 = (*spvDescriptorSet0.vp_c15)._m0[int(_1253)][_1255];
    if (!_1157)
    {
        int _1259 = 12 & _1233;
        _1235 = _1259;
    }
    int _1261 = _1235;
    int _1263 = _1130 + 56;
    uint _1265 = uint(int(uint(_1263) >> uint(2)));
    uint _1267 = uint(int(uint(int(_1265)) >> uint(2)));
    int _1269 = int(_1265) & 3;
    float _1271 = (*spvDescriptorSet0.vp_c15)._m0[int(_1267)][_1269];
    int _1273 = int(_1265) + 1;
    uint _1275 = uint(int(uint(_1273) >> uint(2)));
    int _1277 = _1273 & 3;
    float _1279 = (*spvDescriptorSet0.vp_c15)._m0[int(_1275)][_1277];
    int _1281 = _1130 + 72;
    uint _1283 = uint(int(uint(_1281) >> uint(2)));
    uint _1285 = uint(int(uint(int(_1283)) >> uint(2)));
    int _1287 = int(_1283) & 3;
    float _1289 = (*spvDescriptorSet0.vp_c15)._m0[int(_1285)][_1287];
    int _1291 = int(_1283) + 1;
    uint _1293 = uint(int(uint(_1291) >> uint(2)));
    int _1295 = _1291 & 3;
    float _1297 = (*spvDescriptorSet0.vp_c15)._m0[int(_1293)][_1295];
    float _1299 = _1036 * _1153;
    float _1301 = fma(_1030, _1145, _1299);
    float _1303 = _1145;
    if (!_1157)
    {
        int _1305 = _1239 << 4;
        int _1307 = _1305 + _1261;
        _1303 = as_type<float>(_1307);
    }
    float _1309 = _1303;
    float _1311 = fma(_1034, _1195, _1301);
    float _1313 = _1309;
    if (!_1157)
    {
        int _1315 = as_type<int>(_1309) + 400;
        uint _1317 = uint(int(uint(_1315) >> uint(2)));
        uint _1319 = uint(int(uint(int(_1317)) >> uint(2)));
        int _1321 = int(_1317) & 3;
        float _1323 = (*spvDescriptorSet0.vp_c15)._m0[int(_1319)][_1321];
        _1313 = _1323;
    }
    float _1325 = _1313;
    float _1327 = _1311 + _1203;
    float _1329 = _1036 * _1229;
    float _1331 = 1.0 / _1327;
    int _1333 = _1130 + 80;
    uint _1335 = uint(int(uint(_1333) >> uint(2)));
    uint _1337 = uint(int(uint(int(_1335)) >> uint(2)));
    int _1339 = int(_1335) & 3;
    float _1341 = (*spvDescriptorSet0.vp_c15)._m0[int(_1337)][_1339];
    int _1343 = int(_1335) + 1;
    uint _1345 = uint(int(uint(_1343) >> uint(2)));
    int _1347 = _1343 & 3;
    float _1349 = (*spvDescriptorSet0.vp_c15)._m0[int(_1345)][_1347];
    float _1351 = fma(_1030, _1221, _1329);
    float _1353 = _1036 * _1257;
    int _1355 = _1130 + 88;
    uint _1357 = uint(int(uint(_1355) >> uint(2)));
    uint _1359 = uint(int(uint(int(_1357)) >> uint(2)));
    int _1361 = int(_1357) & 3;
    float _1363 = (*spvDescriptorSet0.vp_c15)._m0[int(_1359)][_1361];
    int _1365 = int(_1357) + 1;
    uint _1367 = uint(int(uint(_1365) >> uint(2)));
    int _1369 = _1365 & 3;
    float _1371 = (*spvDescriptorSet0.vp_c15)._m0[int(_1367)][_1369];
    float _1373 = fma(_1030, _1249, _1353);
    float _1375 = fma(_1034, _1271, _1351);
    float _1377 = _1375 + _1279;
    float _1379 = fma(_1030, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1381 = fma(_1034, _1289, _1373);
    float _1383 = _1377 * _1331;
    float _1385 = floor(_1379);
    float _1387 = _1381 + _1297;
    bool _1389 = _1383 >= 0.0;
    float _1391 = fma(_1034, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1393 = _1387 * _1331;
    bool _1395 = _1383 <= 1.0;
    bool _1397 = _1395 && _1389;
    float _1399 = floor(_1391);
    bool _1401 = _1393 >= 0.0;
    bool _1403 = _1401 && _1397;
    bool _1405 = _1393 <= 1.0;
    bool _1407 = _1405 && _1403;
    float _1409 = _1297;
    float _1411 = _1391;
    if (!_1157)
    {
        float _1413 = floor(_1066);
        _1409 = _1413;
    }
    float _1415 = _1409;
    float _1417 = -_1385;
    float _1419 = _1379 + _1417;
    int _1421 = int(_1403);
    int _1423 = _1108 ? 2 : 0;
    int _1425 = _1421 | _1423;
    int _1427 = _1407 ? 4 : 0;
    int _1429 = _1425 | _1427;
    int _1431 = _1157 ? 8 : 0;
    int _1433 = _1429 | _1431;
    int _1435 = false ? 16 : 0;
    int _1437 = _1433 | _1435;
    int _1439 = false ? 32 : 0;
    int _1441 = _1437 | _1439;
    int _1443 = false ? 64 : 0;
    int _1445 = _1441 | _1443;
    int _1447 = _1445 & 4;
    float _1449 = (*spvDescriptorSet0.vp_c15)._m0[652].y;
    if (!_1157)
    {
        float _1451 = floor(_1064);
        _1449 = _1451;
    }
    float _1453 = _1449;
    float _1455 = _1036 * _1349;
    if (_1407)
    {
        float _1457 = float(_1126);
        _1205 = _1457;
    }
    float _1459 = _1205;
    float _1461 = fma(_1030, _1341, _1455);
    float _1463 = _580;
    if (!_1157)
    {
        float _1465 = rint(_1325);
        float _1467 = precise::max(_1465, 0.0);
        uint _1469 = uint(_1467);
        uint _1471 = clamp(_1469, 0u, 65535u);
        _1463 = as_type<float>(_1471);
    }
    float _1473 = _1463;
    float _1475 = fma(_1034, _1363, _1461);
    float _1477 = _1475 + _1371;
    float _1479 = -_1399;
    float _1481 = _1391 + _1479;
    if (!_1157)
    {
        float _1483 = -_1415;
        float _1485 = _1066 + _1483;
        _1411 = _1485;
    }
    float _1487 = _1411;
    float _1489 = _1249;
    if (_1407)
    {
        float _1491 = rint(_1459);
        float _1493 = precise::max(_1491, 0.0);
        uint _1495 = uint(_1493);
        uint _1497 = clamp(_1495, 0u, 65535u);
        _1489 = as_type<float>(_1497);
    }
    float _1499 = _1489;
    if (!_1157)
    {
        float _1501 = -_1453;
        float _1503 = _1064 + _1501;
        _1120 = _1503;
    }
    float _1505 = _1120;
    float _1507 = _1477 * _1331;
    float2 _6860 = float2(_1419, _1481);
    float _1509 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6860, float2(0.0), isnan(_6860)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6860, float2(0.0), isnan(_6860)), level(0.0)).x;
    float _1511 = _1487;
    float _1513 = _1507;
    if (!_1157)
    {
        float3 _6879 = float3(_1505, _1487, float(as_type<int>(_1473)));
        float3 _6883 = select(_6879, float3(0.0), isnan(_6879));
        float _1515 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6883.xy, uint(rint(_6883.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6883.xy, uint(rint(_6883.z)), level(0.0)).x;
        _1511 = _1515;
    }
    float _1517 = _1511;
    float _1519 = _1499;
    if (_1407)
    {
        float3 _6898 = float3(_1383, _1393, float(as_type<int>(_1499)));
        float3 _6900 = select(_6898, float3(0.0), isnan(_6898));
        float _1521 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6900.xy, uint(rint(_6900.z)), _1507, level(0.0));
        _1519 = _1521;
    }
    float _1523 = _1519;
    float _1525 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1527 = int(_1525);
    int _1529 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1531 = _1529 != 0;
    int _1533 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1535 = _1533 != 0;
    int _1537 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1539 = _1537 != 0;
    float _1541 = _316 * _574;
    float _1543 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1545 = int(_1543);
    float _1547 = float(_112);
    float _1549 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1551 = _1549 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1553 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1555 = int(_1553);
    float _1557 = float(_1527);
    float _1559 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1561 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1559;
    float _1563 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1565 = int(_1563);
    float _1567 = float(_1545);
    bool _1569 = !_1535;
    int _1571 = _1569 ? 0 : 1;
    float _1573 = 1.0 / _1557;
    float _1575 = float(uint(_1555));
    float _1577 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1579 = ~_1555;
    int _1581 = _1579 + 1;
    int _1583 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1585 = _1583 != 0;
    bool _1587 = !_1531;
    int _1589 = _1587 ? 0 : 1;
    float _1591 = 1.0 / _1567;
    float _1593 = float(uint(_1565));
    int _1595 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1597 = _1595 != 0;
    int _1599 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1601 = _1599 != 0;
    int _1603 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1605 = _1603 != 0;
    int _1607 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1609 = _1607 != 0;
    int _1611 = ~_1565;
    int _1613 = _1611 + 1;
    float _1615 = _1573 * _144;
    float _1617 = 1.0 / _1575;
    bool _1619 = !_1601;
    int _1621 = _1619 ? 0 : 1;
    int _1623 = ~_1555;
    int _1625 = _1623 + 1;
    int _1627 = ~_1565;
    int _1629 = _1627 + 1;
    float _1631 = _1591 * _144;
    float _1633 = trunc(_1615);
    int _1635 = int(_1633);
    bool _1637 = !_1539;
    int _1639 = _1637 ? 0 : 1;
    bool _1641 = !_1585;
    int _1643 = _1641 ? 0 : 1;
    float _1645 = 1.0 / _1593;
    int _1647 = as_type<int>(_1617) + (-2);
    float _1649 = in.m_54.y;
    float _1651 = trunc(_1631);
    int _1653 = int(_1651);
    float _1655 = float(uint(_1635));
    float _1657 = as_type<float>(_1647) * _1655;
    float _1659 = _168 * 2.0;
    int _1661 = as_type<int>(_1645) + (-2);
    float _1663 = 1.0 / _1551;
    float _1665 = float(uint(_1653));
    float _1667 = trunc(_1657);
    float _1669 = precise::max(_1667, 0.0);
    uint _1671 = uint(_1669);
    float _1673 = as_type<float>(_1661) * _1665;
    bool _1675 = !_1597;
    int _1677 = _1675 ? 0 : 1;
    float _1679 = floor(_1659);
    float _1681 = _1649 * 2.0;
    int _1683 = _1581 * int(_1671);
    int _1685 = _1683 + _1635;
    float _1687 = trunc(_1673);
    float _1689 = precise::max(_1687, 0.0);
    uint _1691 = uint(_1689);
    bool _1693 = _1679 > 0.0;
    float _1695 = floor(_1681);
    bool _1697 = _1679 >= 0.0;
    bool _1699 = isnan(_1679);
    bool _1701 = _1697 || _1699;
    bool _1703 = isnan(0.0);
    bool _1705 = _1701 || _1703;
    float _1707 = float(uint(_1685));
    int _1709 = _1705 ? 0 : 1;
    int _1711 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1713 = _1711 != 0;
    float _1715 = as_type<float>(_1647) * _1707;
    int _1717 = _1613 * int(_1691);
    int _1719 = _1717 + _1653;
    float _1721 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1723 = _168 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1725 = trunc(_1715);
    float _1727 = precise::max(_1725, 0.0);
    uint _1729 = uint(_1727);
    int _1731 = ~_1709;
    int _1733 = _1731 + 1;
    int _1735 = _1733 + 1;
    float _1737 = _1649 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1739 = _1735;
    if (!_1693)
    {
        int _1741 = ~_1709;
        int _1743 = _1741 + 1;
        _1739 = _1743;
    }
    int _1745 = _1739;
    float _1747 = -_1577;
    float _1749 = fma(_1723, 2.0, _1747);
    float _1751 = float(uint(_1719));
    float _1753 = fma(_1737, -2.0, _1721);
    bool _1755 = _1695 > 0.0;
    float _1757 = 1.0 / _1547;
    bool _1759 = !_1605;
    int _1761 = _1759 ? 0 : 1;
    float _1763 = as_type<float>(_1661) * _1751;
    bool _1765 = _1695 >= 0.0;
    bool _1767 = isnan(_1695);
    bool _1769 = _1765 || _1767;
    bool _1771 = isnan(0.0);
    bool _1773 = _1769 || _1771;
    int _1775 = _1773 ? 0 : 1;
    int _1777 = int(_1671) + int(_1729);
    float _1779 = trunc(_1763);
    float _1781 = precise::max(_1779, 0.0);
    uint _1783 = uint(_1781);
    int _1785 = ~_1775;
    int _1787 = _1785 + 1;
    int _1789 = _1787 + 1;
    int _1791 = _1789;
    if (!_1755)
    {
        int _1793 = ~_1775;
        int _1795 = _1793 + 1;
        _1791 = _1795;
    }
    int _1797 = _1791;
    int _1799 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1801 = _1799 != 0;
    float _1803 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1805 = _1803 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    int _1807 = _1625 * _1777;
    int _1809 = _1807 + _1635;
    bool _1811 = !_1801;
    int _1813 = _1811 ? 0 : 1;
    float _1815 = 1.0 / _1805;
    bool _1817 = uint(_1809) >= uint(_1555);
    float _1819 = as_type<float>(_1809);
    int _1821 = as_type<int>(_1805);
    if (_1713)
    {
        _1819 = 1.0;
    }
    float _1823 = _1819;
    float _1825 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1827 = _1825 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1829 = _1823;
    if (!_1713)
    {
        _1829 = 7.345489978790283203125;
    }
    float _1831 = _1829;
    int _1833 = int(_1691) + int(_1783);
    float _1835 = in.m_54.z;
    float _1837 = _1831 * _168;
    float _1839 = 0.0;
    float _1841 = as_type<float>(_1833);
    if (_1713)
    {
        _1839 = 1.0;
    }
    float _1843 = _1839;
    int _1845 = _1629 * _1833;
    int _1847 = _1845 + _1653;
    float _1849 = _1843;
    if (_1713)
    {
        _1821 = 0;
    }
    int _1851 = _1821;
    float _1853 = floor(_1837);
    float _1855 = 0.0;
    int _1857 = _1851;
    if (_1713)
    {
        _1855 = _168;
    }
    float _1859 = _1855;
    float _1861 = _1859;
    if (!_1713)
    {
        _1849 = 1.2345600128173828125;
    }
    float _1863 = _1849;
    if (!_1713)
    {
        _1857 = 1;
    }
    int _1865 = _1857;
    if (!_1713)
    {
        _1861 = _1649;
    }
    float _1867 = _1861;
    float _1869 = 1.0 / _1827;
    bool _1871 = uint(_1847) >= uint(_1565);
    float _1873 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1875 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1873;
    float _1877 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1879 = _1877 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    bool _1881 = !_1817;
    int _1883 = _1881 ? 0 : (-1);
    float _1885 = _1863 * _1867;
    float _1887 = _1875 * _1663;
    float _1889 = _1879 * _1815;
    float _1891 = -_1853;
    float _1893 = _1837 + _1891;
    float _1895 = float(_1555);
    float _1897 = _168 + _1649;
    float _1899 = float(_1635);
    float _1901 = _1835 * 2.0;
    int _1903 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1905 = _1903 != 0;
    float _1907 = _1897 + (-1.0);
    bool _1909 = _1899 >= _1895;
    bool _1911 = isnan(_1899);
    bool _1913 = _1909 || _1911;
    bool _1915 = isnan(_1895);
    bool _1917 = _1913 || _1915;
    float _1919 = float(_1917);
    float _1921 = _1561 * _1869;
    float _1923 = _168 + _1835;
    float _1925 = floor(_1901);
    int _1927 = ~_1777;
    int _1929 = _1927 + _1883;
    int _1931 = _1929 + 1;
    float _1933 = _1757 * _144;
    bool _1935 = !_1905;
    int _1937 = _1935 ? 0 : 1;
    float _1939 = _1923 + (-1.0);
    int _1941 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1943 = _1941 != 0;
    int _1945 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1947 = _1945 != 0;
    int _1949 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1951 = _1949 != 0;
    float _1953 = _1835 + _1649;
    float _1955 = fma(_1907, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1957 = trunc(_1919);
    int _1959 = int(_1957);
    int _1961 = abs(_1937);
    int _1963 = _1555 * _1931;
    int _1965 = _1963 + _1635;
    bool _1967 = _1555 == 0;
    float _1969 = _1895 * _1933;
    bool _1971 = !_1871;
    int _1973 = _1971 ? 0 : (-1);
    float _1975 = _1953 + (-1.0);
    float _1977 = fma(_1939, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _1979 = _1925 > 0.0;
    float _1981 = _1893 * _1895;
    bool _1983 = _1925 >= 0.0;
    bool _1985 = isnan(_1925);
    bool _1987 = _1983 || _1985;
    bool _1989 = isnan(0.0);
    bool _1991 = _1987 || _1989;
    float _1993 = trunc(_1969);
    int _1995 = int(_1993);
    bool _1997 = !_1967;
    int _1999 = _1997 ? _1965 : (-1);
    float _2001 = fma(_1975, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2003 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2005 = _1000 + _2003;
    int _2007 = _1555 + (-1);
    int _2009 = ~_1959;
    int _2011 = _2009 + 1;
    int _2013 = _2011 + 1;
    float _2015 = fma(_1887, _2005, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    int _2017 = abs(_1571);
    float _2019 = trunc(_1981);
    int _2021 = int(_2019);
    bool _2023 = _1000 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _2025 = isnan(_1000);
    bool _2027 = _2023 || _2025;
    bool _2029 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _2031 = _2027 || _2029;
    float _2033 = float(_2031);
    int _2035 = _1999 * _2013;
    int _2037 = abs(_1589);
    int _2039 = _1959 * _2007;
    int _2041 = _2039 + _2035;
    bool _2043 = _1000 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2045 = isnan(_1000);
    bool _2047 = _2043 || _2045;
    bool _2049 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2051 = _2047 || _2049;
    float _2053 = float(_2051);
    float _2055 = -_2033;
    float _2057 = _2055 + 1.0;
    int _2059 = _2041 * _2017;
    bool _2061 = _1000 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2063 = isnan(_1000);
    bool _2065 = _2061 || _2063;
    bool _2067 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2069 = _2065 || _2067;
    float _2071 = float(_2069);
    float _2073 = -_2053;
    float _2075 = _2073 + 1.0;
    float _2077 = _2053 * _2057;
    int _2079 = _1995 * _2037;
    int _2081 = _2079 + _2059;
    bool _2083 = _1000 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2085 = isnan(_1000);
    bool _2087 = _2083 || _2085;
    bool _2089 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2091 = _2087 || _2089;
    float _2093 = float(_2091);
    float _2095 = _2071 * _2075;
    float _2097 = -_2071;
    float _2099 = _2097 + 1.0;
    int _2101 = abs(_1639);
    int _2103 = _2021 * _1961;
    int _2105 = _2103 + _1635;
    int _2107 = abs(_1643);
    float _2109 = _2093 * _2099;
    float _2111 = floor(_1885);
    int _2113 = _2105 * _2101;
    int _2115 = _2113 + _2081;
    float _2117 = _2015 * _2109;
    float _2119 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2121 = _1000 + _2119;
    float _2123 = -_2093;
    float _2125 = _2123 + 1.0;
    bool _2127 = !_1947;
    int _2129 = _2127 ? 0 : 1;
    int _2131 = _2021 * _2107;
    int _2133 = _2131 + _2115;
    float _2135 = fma(_1889, _2121, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    int _2137 = _1991 ? 0 : 1;
    float _2139 = fma(_2125, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2117);
    bool _2141 = _1865 != 1;
    float _2143 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2145 = _1000 + _2143;
    float _2147 = float(uint(_2133));
    float _2149 = fma(_2135, _2095, _2139);
    float _2151 = float(_1565);
    float _2153 = fma(_1921, _2145, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _2155 = float(_1653);
    float _2157 = as_type<float>(_1647) * _2147;
    float _2159 = -_2111;
    float _2161 = _1885 + _2159;
    bool _2163 = _2155 >= _2151;
    bool _2165 = isnan(_2155);
    bool _2167 = _2163 || _2165;
    bool _2169 = isnan(_2151);
    bool _2171 = _2167 || _2169;
    float _2173 = float(_2171);
    float _2175 = fma(_2153, _2077, _2149);
    float _2177 = trunc(_2157);
    float _2179 = precise::max(_2177, 0.0);
    uint _2181 = uint(_2179);
    float _2183 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2185 = (*spvDescriptorSet0.vp_c9)._m0[83].z;
    float _2187 = _2135;
    float _2189 = _2183;
    if (!_2141)
    {
        _2185 = _1835;
    }
    float _2191 = _2185;
    float _2193 = fma(_2033, (*spvDescriptorSet0.vp_c9)._m0[134].x, _2175);
    float _2195 = _2191;
    if (_2141)
    {
        _2195 = _1649;
    }
    float _2197 = _2195;
    float _2199 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _2201 = ~_2137;
    int _2203 = _2201 + 1;
    int _2205 = _2203 + 1;
    float _2207 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _308);
    float _2209 = trunc(_2173);
    int _2211 = int(_2209);
    int _2213 = ~_1555;
    int _2215 = _2213 + 1;
    float _2217 = fma(_2197, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2199);
    int _2219 = _2205;
    if (!_1979)
    {
        int _2221 = ~_2137;
        int _2223 = _2221 + 1;
        _2219 = _2223;
    }
    int _2225 = _2219;
    float _2227 = _2151 * _1933;
    float _2229 = _2161 * _2151;
    int _2231 = ~_1833;
    int _2233 = _2231 + _1973;
    int _2235 = _2233 + 1;
    float _2237 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2239 = log2(_2237);
    if (!_2141)
    {
        _2187 = _1649;
    }
    float _2241 = _2187;
    int _2243 = _2215 * int(_2181);
    int _2245 = _2243 + _2133;
    bool _2247 = _1565 == 0;
    int _2249 = _1565 * _2235;
    int _2251 = _2249 + _1653;
    float _2253 = _2241;
    if (_2141)
    {
        _2253 = _168;
    }
    float _2255 = _2253;
    int _2257 = abs(_2129);
    float _2259 = trunc(_2229);
    int _2261 = int(_2259);
    float _2263 = float(_1745);
    float _2265 = fma(_2255, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2183);
    float _2267 = float(uint(_2245));
    int _2269 = ~_2211;
    int _2271 = _2269 + 1;
    int _2273 = _2271 + 1;
    bool _2275 = !_2247;
    int _2277 = _2275 ? _2251 : (-1);
    float _2279 = as_type<float>(_1647) * _2267;
    if (!_2141)
    {
        _2189 = _1649;
    }
    float _2281 = _2189;
    float _2283 = _2239 * _144;
    int _2285 = _2277 * _2273;
    float _2287 = _2281;
    if (_2141)
    {
        _2287 = _168;
    }
    float _2289 = _2287;
    float _2291 = trunc(_2279);
    float _2293 = precise::max(_2291, 0.0);
    uint _2295 = uint(_2293);
    int _2297 = _1565 + (-1);
    float _2299 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _2301 = !_1951;
    int _2303 = _2301 ? 0 : 1;
    float _2305 = _2289 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (!_2141)
    {
        _1841 = _1835;
    }
    float _2307 = _1841;
    int _2309 = _2211 * _2297;
    int _2311 = _2309 + _2285;
    float _2313 = -_2299;
    float _2315 = fma(_2305, 2.0, _2313);
    float _2317 = _2307;
    if (_2141)
    {
        _2317 = _1649;
    }
    float _2319 = _2317;
    int _2321 = abs(_2303);
    float _2323 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2325 = trunc(_2227);
    int _2327 = int(_2325);
    float _2329 = _2319 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _2331 = abs(_1621);
    float _2333 = fma(_2329, -2.0, _2323);
    int _2335 = abs(_1813);
    int _2337 = abs(_1677);
    float _2339 = float(_2321);
    float _2341 = float(_1797);
    int _2343 = _2311 * _2331;
    float _2345 = -_144;
    float _2347 = fma(_2345, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1749);
    int _2349 = int(_2181) + int(_2295);
    float _2351 = _2339 * _2341;
    int _2353 = _2327 * _2337;
    int _2355 = _2353 + _2343;
    int _2357 = ~_1555;
    int _2359 = _2357 + 1;
    float _2361 = exp2(_2283);
    bool _2363 = !_1943;
    int _2365 = _2363 ? 0 : 1;
    int _2367 = _2261 * _2335;
    int _2369 = _2367 + _1653;
    bool _2371 = !_1609;
    int _2373 = _2371 ? 0 : 1;
    int _2375 = _2359 * _2349;
    int _2377 = _2375 + _2133;
    int _2379 = abs(_1761);
    float _2381 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2383 = 1.0 + _2381;
    int _2385 = abs(_2365);
    float _2387 = -_144;
    float _2389 = fma(_2387, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2315);
    bool _2391 = uint(_2377) >= uint(_1555);
    int _2393 = _2369 * _2379;
    int _2395 = _2393 + _2355;
    int _2397 = abs(_2373);
    float _2399 = float(_2385);
    float _2401 = float(_2225);
    float _2403 = -_2361;
    float _2405 = _2403 + 1.0;
    bool _2407 = !_2391;
    int _2409 = _2407 ? 0 : (-1);
    int _2411 = _2261 * _2397;
    int _2413 = _2411 + _2395;
    bool _2415 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2417 = isnan(0.0);
    bool _2419 = _2415 || _2417;
    bool _2421 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2423 = _2419 || _2421;
    float _2425 = _2399 * _2401;
    int _2427 = ~_2349;
    int _2429 = _2427 + _2409;
    int _2431 = _2429 + 1;
    float _2433 = 1.0 / _2383;
    float _2435 = in.m_73.x;
    float _2437 = in.m_73.y;
    float _2439 = in.m_73.z;
    float _2441 = float(uint(_2105));
    float _2443 = _2423 ? _2405 : 0.0;
    float _2445 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2265);
    float _2447 = float(uint(_2413));
    float _2449 = as_type<float>(_1647) * _2441;
    float _2451 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _2453 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2455 = isnan(1.0);
    bool _2457 = _2453 || _2455;
    bool _2459 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2461 = _2457 || _2459;
    float _2463 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1753);
    float _2465 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2217);
    float _2467 = as_type<float>(_1661) * _2447;
    float _2469 = trunc(_2449);
    float _2471 = precise::max(_2469, 0.0);
    uint _2473 = uint(_2471);
    float _2475 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2477 = float(_2257);
    float _2479 = fma(_1649, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2451);
    float _2481 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2333);
    float _2483 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2475);
    int _2485 = ~_1565;
    int _2487 = _2485 + 1;
    float _2489 = _2477 * _2263;
    float _2491 = trunc(_2467);
    float _2493 = precise::max(_2491, 0.0);
    uint _2495 = uint(_2493);
    float _2497 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2483);
    float _2499 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2479);
    if (_2461)
    {
        float _2501 = _2443 * _2433;
        _148 = _2501;
    }
    float _2503 = _148;
    int _2505 = ~_1555;
    int _2507 = _2505 + 1;
    float _2509 = _2489 * (-2.0);
    int _2511 = _1555 * _2431;
    int _2513 = _2511 + _2133;
    float _2515 = float(uint(_2369));
    float _2517 = _2425 * (-2.0);
    float _2519 = fma(_2509, _2437, _2437);
    int _2521 = _2507 * int(_2473);
    int _2523 = _2521 + _2105;
    float _2525 = _1649 + (-0.5);
    float _2527 = as_type<float>(_1661) * _2515;
    bool _2529 = !_1967;
    int _2531 = _2529 ? _2513 : (-1);
    float _2533 = fma(_2001, _2509, _2001);
    float _2535 = float(uint(_2523));
    int _2537 = _2487 * int(_2495);
    int _2539 = _2537 + _2413;
    float _2541 = fma(_2525, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2519);
    int _2543 = _2531 & 3;
    bool _2545 = _2543 != 0;
    float _2547 = trunc(_2527);
    float _2549 = precise::max(_2547, 0.0);
    uint _2551 = uint(_2549);
    float _2553 = as_type<float>(_1647) * _2535;
    float _2555 = float(uint(_2539));
    float _2557 = fma(_1955, _2517, _1955);
    float _2559 = fma(_2533, _2503, _2541);
    bool _2561 = !_2545;
    int _2563 = _2561 ? 0 : 1;
    float _2565 = fma(_2517, _2435, _2435);
    float _2567 = as_type<float>(_1661) * _2555;
    float _2569 = trunc(_2553);
    float _2571 = precise::max(_2569, 0.0);
    uint _2573 = uint(_2571);
    bool _2575 = uint(_2543) >= 2u;
    float _2577 = _168 + (-0.5);
    float _2579 = _2351 * (-2.0);
    int _2581 = _2531 & 3;
    bool _2583 = _2581 != 0;
    int _2585 = _2575 ? 0 : 1;
    float _2587 = fma(_2577, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2565);
    float _2589 = trunc(_2567);
    float _2591 = precise::max(_2589, 0.0);
    uint _2593 = uint(_2591);
    bool _2595 = _2543 != 3;
    float _2597 = fma(_2579, _2439, _2439);
    int _2599 = ~_1555;
    int _2601 = _2599 + 1;
    float _2603 = fma(_2557, _2503, _2587);
    int _2605 = ~_2585;
    int _2607 = _2605 + 1;
    int _2609 = _2607 + 1;
    float _2611 = fma(_1977, _2579, _1977);
    int _2613 = _2583 ? 0 : 1;
    int _2615 = int(_2473) + int(_2573);
    int _2617 = ~_1565;
    int _2619 = _2617 + 1;
    bool _2621 = uint(_2543) > 1u;
    int _2623 = _2601 * _2615;
    int _2625 = _2623 + _2105;
    float _2627 = _2603 * 0.15915493667125701904296875;
    int _2629 = int(_2495) + int(_2593);
    float _2631 = _1835 + (-0.5);
    int _2633 = _2609;
    if (_2595)
    {
        int _2635 = ~_2585;
        int _2637 = _2635 + 1;
        _2633 = _2637;
    }
    int _2639 = _2633;
    float _2641 = _2627 * 6.283185482025146484375;
    float _2643 = cos(_2641);
    bool _2645 = uint(_2625) >= uint(_1555);
    int _2647 = _2619 * _2629;
    int _2649 = _2647 + _2413;
    float _2651 = fma(_2631, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2597);
    int _2653 = ~_2613;
    int _2655 = _2653 + 1;
    int _2657 = _2655 + 1;
    float _2659 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _220);
    bool _2661 = !_2645;
    int _2663 = _2661 ? 0 : (-1);
    float _2665 = fma(_2611, _2503, _2651);
    bool _2667 = uint(_2649) >= uint(_1565);
    float _2669 = _2627 * 6.283185482025146484375;
    float _2671 = sin(_2669);
    int _2673 = ~_1565;
    int _2675 = _2673 + 1;
    float _2677 = _2665 * 0.15915493667125701904296875;
    bool _2679 = !_2667;
    int _2681 = _2679 ? 0 : (-1);
    float _2683 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    bool _2685 = _1649 > 0.5;
    float _2687 = _316 * _784;
    int _2689 = _2657;
    if (!_2621)
    {
        int _2691 = ~_2613;
        int _2693 = _2691 + 1;
        _2689 = _2693;
    }
    int _2695 = _2689;
    float _2697 = _2677 * 6.283185482025146484375;
    float _2699 = cos(_2697);
    bool _2701 = _2543 != 3;
    int _2703 = _2675 * int(_2551);
    int _2705 = _2703 + _2369;
    float _2707 = _2559 * 0.15915493667125701904296875;
    float _2709 = _1541 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _2711 = !_2701;
    int _2713 = _2711 ? 0 : (-1);
    float _2715 = _2687 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2717 = float(uint(_2705));
    float _2719 = _2707 * 6.283185482025146484375;
    float _2721 = cos(_2719);
    bool _2723 = _168 > 0.5;
    float _2725 = _2193 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _2727 = ~_2615;
    int _2729 = _2727 + _2663;
    int _2731 = _2729 + 1;
    float _2733 = as_type<float>(_1661) * _2717;
    int _2735 = ~_2629;
    int _2737 = _2735 + _2681;
    int _2739 = _2737 + 1;
    float _2741 = _2715 * _2207;
    out.m_75.w = _2725;
    float _2743 = _2707 * 6.283185482025146484375;
    float _2745 = sin(_2743);
    int _2747 = _1555 * _2731;
    int _2749 = _2747 + _2105;
    float _2751 = _2643 * _2699;
    float _2753 = _2671 * _2699;
    float _2755 = _2709 * _2659;
    int _2757 = abs(_2695);
    bool _2759 = !_1967;
    int _2761 = _2759 ? _2749 : (-1);
    float _2763 = trunc(_2733);
    float _2765 = precise::max(_2763, 0.0);
    uint _2767 = uint(_2765);
    float _2769 = _2671 * _2721;
    float _2771 = _2643 * _2721;
    float _2773 = _2721 * _2699;
    int _2775 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2777 = _2775 != 0;
    float _2779 = _2751 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2781 = ~_2757;
    int _2783 = _2781 + 1;
    int _2785 = _2783 + 1;
    float _2787 = _2677 * 6.283185482025146484375;
    float _2789 = sin(_2787);
    float _2791 = _2745 * _2699;
    float _2793 = _2671 * _2745;
    float _2795 = _2643 * _2745;
    int _2797 = _1565 * _2739;
    int _2799 = _2797 + _2413;
    float _2801 = _2751 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _2803 = !_2777;
    int _2805 = _2803 ? 0 : 1;
    int _2807 = int(_2551) + int(_2767);
    float _2809 = _2751 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2811 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2813 = _2811 != 0;
    float _2815 = _2751 * _2755;
    int _2817 = _2531 >> 31;
    int _2819 = abs(_2563);
    float _2821 = -_2795;
    float _2823 = fma(_2789, _2769, _2821);
    float _2825 = fma(_2789, _2771, _2793);
    float _2827 = -_2789;
    float _2829 = fma(_2827, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2779);
    float _2831 = -_2769;
    float _2833 = fma(_2789, _2795, _2831);
    float _2835 = fma(_2789, _2793, _2771);
    float _2837 = -_2789;
    float _2839 = fma(_2837, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2801);
    float _2841 = -_2789;
    float _2843 = fma(_2841, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2809);
    float _2845 = -_2755;
    float _2847 = _2789 * _2845;
    bool _2849 = !_2247;
    int _2851 = _2849 ? _2799 : (-1);
    float _2853 = _2753 * _2755;
    bool _2855 = !_2813;
    int _2857 = _2855 ? 0 : 1;
    float _2859 = fma(_2773, _2741, _2847);
    int _2861 = _2851 & 3;
    bool _2863 = _2861 != 0;
    float _2865 = fma(_2825, _2741, _2815);
    float _2867 = fma(_2823, _2741, _2853);
    int _2869 = _2817 & 3;
    float _2871 = fma(_2753, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2829);
    bool _2873 = !_2863;
    int _2875 = _2873 ? 0 : 1;
    float _2877 = fma(_2753, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2839);
    int _2879 = _2851 & 3;
    bool _2881 = _2879 != 0;
    float _2883 = fma(_2833, _2683, _2865);
    int _2885 = _2851 >> 31;
    float _2887 = fma(_2753, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2843);
    int _2889 = _2881 ? 0 : 1;
    float _2891 = fma(_2791, _2683, _2859);
    bool _2893 = uint(_2861) > 1u;
    float _2895 = _2883 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2897 = _2885 & 3;
    float _2899 = fma(_2835, _2683, _2867);
    int _2901 = _2531 + _2869;
    float _2903 = _2883 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2905 = _2851 + _2897;
    float _2907 = _2833 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2909 = _2901 >> 2;
    float _2911 = fma(_2891, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2903);
    int _2913 = ~_2889;
    int _2915 = _2913 + 1;
    int _2917 = _2915 + 1;
    float _2919 = fma(_2791, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2907);
    int _2921 = _2905 >> 2;
    float _2923 = fma(_2899, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2911);
    int _2925 = _2909 << 4;
    int _2927 = _2925 + 368;
    float _2929 = _2883 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2931 = _2917;
    if (!_2893)
    {
        int _2933 = ~_2889;
        int _2935 = _2933 + 1;
        _2931 = _2935;
    }
    int _2937 = _2931;
    float _2939 = fma(_2891, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2895);
    int _2941 = ~_1565;
    int _2943 = _2941 + 1;
    uint _2945 = uint(int(uint(_2927) >> uint(2)));
    uint _2947 = uint(int(uint(int(_2945)) >> uint(2)));
    int _2949 = int(_2945) & 3;
    float _2951 = (*spvDescriptorSet0.vp_c9)._m0[int(_2947)][_2949];
    int _2953 = int(_2945) + 1;
    uint _2955 = uint(int(uint(_2953) >> uint(2)));
    int _2957 = _2953 & 3;
    float _2959 = (*spvDescriptorSet0.vp_c9)._m0[int(_2955)][_2957];
    bool _2961 = uint(_2861) >= 2u;
    float _2963 = _2833 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2965 = _2921 << 4;
    int _2967 = _2965 + 512;
    int _2969 = _2943 * _2807;
    int _2971 = _2969 + _2369;
    int _2973 = _2961 ? 0 : 1;
    float _2975 = fma(_2899, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2939);
    bool _2977 = _2861 != 3;
    uint _2979 = uint(int(uint(_2967) >> uint(2)));
    uint _2981 = uint(int(uint(int(_2979)) >> uint(2)));
    int _2983 = int(_2979) & 3;
    float _2985 = (*spvDescriptorSet0.vp_c9)._m0[int(_2981)][_2983];
    int _2987 = int(_2979) + 1;
    uint _2989 = uint(int(uint(_2987) >> uint(2)));
    int _2991 = _2987 & 3;
    float _2993 = (*spvDescriptorSet0.vp_c9)._m0[int(_2989)][_2991];
    float _2995 = fma(_2791, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2963);
    float _2997 = _2975 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    bool _2999 = !_2977;
    int _3001 = _2999 ? 0 : (-1);
    float _3003 = _2923 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    bool _3005 = uint(_2971) >= uint(_1565);
    float _3007 = _2833 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3009 = _1034 + _2997;
    int _3011 = _2927 + 8;
    uint _3013 = uint(int(uint(_3011) >> uint(2)));
    uint _3015 = uint(int(uint(int(_3013)) >> uint(2)));
    int _3017 = int(_3013) & 3;
    float _3019 = (*spvDescriptorSet0.vp_c9)._m0[int(_3015)][_3017];
    int _3021 = int(_3013) + 1;
    uint _3023 = uint(int(uint(_3021) >> uint(2)));
    int _3025 = _3021 & 3;
    float _3027 = (*spvDescriptorSet0.vp_c9)._m0[int(_3023)][_3025];
    bool _3029 = !_3005;
    int _3031 = _3029 ? 0 : (-1);
    float _3033 = fma(_2791, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3007);
    float _3035 = _1030 + _3003;
    float _3037 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3039 = _3009 + _3037;
    float _3041 = fma(_2891, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2929);
    int _3043 = ~_2807;
    int _3045 = _3043 + _3031;
    int _3047 = _3045 + 1;
    float _3049 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3051 = _3035 + _3049;
    bool _3053 = _2861 != 3;
    int _3055 = _2967 + 8;
    uint _3057 = uint(int(uint(_3055) >> uint(2)));
    uint _3059 = uint(int(uint(int(_3057)) >> uint(2)));
    int _3061 = int(_3057) & 3;
    float _3063 = (*spvDescriptorSet0.vp_c9)._m0[int(_3059)][_3061];
    int _3065 = int(_3057) + 1;
    uint _3067 = uint(int(uint(_3065) >> uint(2)));
    int _3069 = _3065 & 3;
    float _3071 = (*spvDescriptorSet0.vp_c9)._m0[int(_3067)][_3069];
    float _3073 = fma(_2835, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3033);
    float _3075 = _3039 * _3039;
    int _3077 = abs(_2937);
    float _3079 = fma(_2835, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2995);
    float _3081 = fma(_2835, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2919);
    float _3083 = fma(_3051, _3051, _3075);
    int _3085 = abs(_2639);
    float _3087 = fma(_2899, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3041);
    int _3089 = ~_2973;
    int _3091 = _3089 + 1;
    int _3093 = _3091 + 1;
    float _3095 = sqrt(_3083);
    int _3097 = ~_3077;
    int _3099 = _3097 + 1;
    int _3101 = _3099 + 1;
    float _3103 = in.m_54.w;
    int _3105 = _3093;
    if (_3053)
    {
        int _3107 = ~_2973;
        int _3109 = _3107 + 1;
        _3105 = _3109;
    }
    int _3111 = _3105;
    int _3113 = ~_2819;
    int _3115 = _3113 + 1;
    int _3117 = _3115 + 1;
    int _3119 = abs(_2875);
    int _3121 = abs(_3111);
    int _3123 = ~_3119;
    int _3125 = _3123 + 1;
    int _3127 = _3125 + 1;
    int _3129 = _2785 * as_type<int>(_2959);
    int _3131 = abs(_2713);
    float _3133 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _3135 = int(_3133);
    bool _3137 = _3095 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _3139 = _3117 * as_type<int>(_2951);
    int _3141 = _3139 + _3129;
    int _3143 = ~_3131;
    int _3145 = _3143 + 1;
    int _3147 = _3145 + 1;
    int _3149 = _1565 * _3047;
    int _3151 = _3149 + _2369;
    int _3153 = _3101 * as_type<int>(_2993);
    int _3155 = ~_3085;
    int _3157 = _3155 + 1;
    int _3159 = _3157 + 1;
    int _3161 = _3127 * as_type<int>(_2985);
    int _3163 = _3161 + _3153;
    float _3165 = _3087 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _3167 = _3103 > 0.5;
    int _3169 = _3159 * as_type<int>(_3019);
    int _3171 = _3169 + _3141;
    float _3173 = as_type<float>(_3159);
    float _3175 = _3019;
    if (!_3137)
    {
        _3173 = _3035;
    }
    float _3177 = _3173;
    float _3179 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _3181 = int(_3179);
    float _3183 = _1024 + _3165;
    float _3185 = _3183;
    float _3187 = _3177;
    if (!_3137)
    {
        _3175 = _3009;
    }
    float _3189 = _3175;
    float _3191 = float(uint(_3135));
    int _3193 = ~_3121;
    int _3195 = _3193 + 1;
    int _3197 = _3195 + 1;
    bool _3199 = !_3137;
    float _3201 = _3189;
    if (!_3199)
    {
        float _3203 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3205 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3207 = _3095 + _3205;
        float _3209 = rsqrt(_3083);
        float _3211 = _3207 * _3203;
        float _3213 = _3183 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3215 = _3211 * 0.15915493667125701904296875;
        float _3217 = _3215 * 6.283185482025146484375;
        float _3219 = cos(_3217);
        float _3221 = _3215 * 6.283185482025146484375;
        float _3223 = sin(_3221);
        float _3225 = _3219 + (-1.0);
        float _3227 = fma(_3223, _3213, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3229 = _3225 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3231 = _3209 * _3227;
        float _3233 = fma(_3183, _3219, _3229);
        float _3235 = fma(_3051, _3231, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3237 = fma(_3039, _3231, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _3185 = _3233;
        _3201 = _3237;
        _3187 = _3235;
    }
    float _3239 = _3185;
    float _3241 = _3201;
    float _3243 = _3187;
    int _3245 = abs(_3001);
    int _3247 = _3147 * as_type<int>(_3027);
    int _3249 = _3247 + _3171;
    float _3251 = _220 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _3253 = _3197 * as_type<int>(_3063);
    int _3255 = _3253 + _3163;
    int _3257 = ~_3245;
    int _3259 = _3257 + 1;
    int _3261 = _3259 + 1;
    float _3263 = 1.0 / _3191;
    int _3265 = abs(_2857);
    float _3267 = fma(_3251, _3251, 1.0);
    int _3269 = abs(_2805);
    int _3271 = _3261 * as_type<int>(_3071);
    int _3273 = _3271 + _3255;
    int _3275 = abs(_3135);
    float _3277 = -_1024;
    float _3279 = _3277 + _3239;
    float _3281 = float(uint(_3181));
    float _3283 = rsqrt(_3267);
    int _3285 = ~_3269;
    int _3287 = _3285 + 1;
    int _3289 = _3287 + 1;
    float _3291 = -_1034;
    float _3293 = _3291 + _3241;
    int _3295 = ~_3265;
    int _3297 = _3295 + 1;
    int _3299 = _3297 + 1;
    int _3301 = _3249 * _3289;
    bool _3303 = !_2247;
    int _3305 = _3303 ? _3151 : (-1);
    float _3307 = 1.0 / _3281;
    int _3309 = abs(_3181);
    int _3311 = _3273 * _3299;
    float _3313 = float(uint(_3275));
    int _3315 = _2761 * _3269;
    int _3317 = _3315 + _3301;
    int _3319 = _3305 * _3265;
    int _3321 = _3319 + _3311;
    int _3323 = as_type<int>(_3263) + (-2);
    float _3325 = _3251 * _3283;
    float _3327 = float(uint(_3317));
    float _3329 = -_1030;
    float _3331 = _3329 + _3243;
    float _3333 = _3279 * _3279;
    float _3335 = -_3079;
    float _3337 = _3325 * _3335;
    float _3339 = -_3073;
    float _3341 = _3325 * _3339;
    float _3343 = as_type<float>(_3323) * _3327;
    float _3345 = -_3081;
    float _3347 = _3325 * _3345;
    float _3349 = 1.0 / _3313;
    float _3351 = fma(_3283, _2877, _3337);
    float _3353 = float(uint(_3309));
    float _3355 = fma(_3331, _3331, _3333);
    int _3357 = as_type<int>(_3307) + (-2);
    float _3359 = fma(_3283, _2871, _3341);
    float _3361 = float(uint(_3321));
    float _3363 = fma(_3293, _3293, _3355);
    float _3365 = trunc(_3343);
    float _3367 = precise::max(_3365, 0.0);
    uint _3369 = uint(_3367);
    int _3371 = abs(_3317);
    float _3373 = fma(_3283, _2887, _3347);
    int _3375 = ~_3135;
    int _3377 = _3375 + 1;
    float _3379 = float(uint(_3371));
    int _3381 = ~_3181;
    int _3383 = _3381 + 1;
    float _3385 = 1.0 / _3353;
    float _3387 = as_type<float>(_3357) * _3361;
    int _3389 = as_type<int>(_3349) + (-2);
    out.m_77.x = _3359;
    out.m_77.y = _3351;
    out.m_77.z = _3373;
    int _3391 = abs(_3321);
    float _3393 = as_type<float>(_3389) * _3379;
    float _3395 = sqrt(_3363);
    int _3397 = _3377 * int(_3369);
    int _3399 = _3397 + _3317;
    float _3401 = float(uint(_3391));
    float _3403 = float(uint(_3399));
    float _3405 = trunc(_3387);
    float _3407 = precise::max(_3405, 0.0);
    uint _3409 = uint(_3407);
    int _3411 = as_type<int>(_3385) + (-2);
    float _3413 = as_type<float>(_3323) * _3403;
    float _3415 = -_220;
    int _3417 = _2685 ? as_type<int>(_3415) : as_type<int>(_220);
    int _3419 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _3421 = _3419 != 0;
    float _3423 = trunc(_3393);
    float _3425 = precise::max(_3423, 0.0);
    uint _3427 = uint(_3425);
    bool _3429 = _3395 > 0.0;
    float _3431 = as_type<float>(_3411) * _3401;
    int _3433 = ~_3275;
    int _3435 = _3433 + 1;
    bool _3437 = !_3421;
    float _3439 = _3437 ? _220 : as_type<float>(_3417);
    int _3441 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _3443 = _3441 != 0;
    int _3445 = _3383 * int(_3409);
    int _3447 = _3445 + _3321;
    float _3449 = trunc(_3431);
    float _3451 = precise::max(_3449, 0.0);
    uint _3453 = uint(_3451);
    float _3455 = -_220;
    int _3457 = _3167 ? as_type<int>(_3455) : as_type<int>(_220);
    int _3459 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _3461 = _3459 != 0;
    float _3463 = float(uint(_3447));
    int _3465 = _3435 * int(_3427);
    int _3467 = _3465 + _3371;
    float _3469 = trunc(_3413);
    float _3471 = precise::max(_3469, 0.0);
    uint _3473 = uint(_3471);
    bool _3475 = !_3443;
    float _3477 = _3475 ? _220 : as_type<float>(_3457);
    float _3479 = as_type<float>(_3357) * _3463;
    bool _3481 = _1835 > 0.5;
    int _3483 = ~_3309;
    int _3485 = _3483 + 1;
    float _3487 = float(uint(_3467));
    bool _3489 = !_3429;
    float _3491 = _3243;
    float _3493 = _3239;
    float _3495 = _3241;
    float _3497 = as_type<float>(_3473);
    if (!_3489)
    {
        float _3499 = _274 * _274;
        float _3501 = rsqrt(_3363);
        float _3503 = fma(_282, _282, _3499);
        float _3505 = fma(_300, _300, _3503);
        float _3507 = sqrt(_3505);
        float _3509 = _3331 * _3501;
        float _3511 = _3279 * _3501;
        float _3513 = _3293 * _3501;
        bool _3515 = _3507 > 0.0;
        bool _3517 = !_3515;
        if (!_3517)
        {
            float _3519 = rsqrt(_3505);
            float _3521 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _3523 = _274 * _3519;
            float _3525 = _282 * _3519;
            float _3527 = _3511 * _3523;
            float _3529 = _300 * _3519;
            float _3531 = fma(_3509, _3525, _3527);
            float _3533 = _3521 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _3535 = fma(_3513, _3529, _3531);
            float _3537 = _3535 * _3533;
            float _3539 = fma(_282, _3537, _3243);
            float _3541 = fma(_274, _3537, _3239);
            float _3543 = fma(_300, _3537, _3241);
            _3491 = _3539;
            _3493 = _3541;
            _3495 = _3543;
        }
    }
    float _3545 = _3491;
    float _3547 = _3493;
    float _3549 = _3495;
    float _3551 = as_type<float>(_3389) * _3487;
    bool _3553 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _3555 = isnan(0.5);
    bool _3557 = _3553 || _3555;
    bool _3559 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _3561 = _3557 || _3559;
    float _3563 = trunc(_3479);
    float _3565 = precise::max(_3563, 0.0);
    uint _3567 = uint(_3565);
    int _3569 = _3485 * int(_3453);
    int _3571 = _3569 + _3391;
    float _3573 = _2825 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3575 = _2825 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3577 = _2825 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _3579 = int(_3369) + int(_3473);
    float _3581 = fma(_2773, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3573);
    float _3583 = float(uint(_3571));
    float _3585 = trunc(_3551);
    float _3587 = precise::max(_3585, 0.0);
    uint _3589 = uint(_3587);
    int _3591 = ~_3135;
    int _3593 = _3591 + 1;
    float _3595 = fma(_2773, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3575);
    float _3597 = fma(_2773, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3577);
    float _3599 = as_type<float>(_3411) * _3583;
    float _3601 = _3583;
    float _3603 = _3573;
    if (_3561)
    {
        _3497 = _3545;
    }
    float _3605 = _3497;
    float _3607 = _3605;
    if (_3561)
    {
        _3601 = _3547;
    }
    float _3609 = _3601;
    float _3611 = _3609;
    if (_3561)
    {
        _3603 = _3549;
    }
    float _3613 = _3603;
    float _3615 = _3613;
    if (!_3561)
    {
        float _3617 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _3619 = _1024 + _3617;
        float _3621 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _3623 = _1030 + _3621;
        float _3625 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3627 = -_1024;
        float _3629 = _3627 + _3547;
        float _3631 = _3619 * _3619;
        float _3633 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _3635 = _1034 + _3633;
        float _3637 = -_1034;
        float _3639 = _3637 + _3549;
        float _3641 = fma(_3623, _3623, _3631);
        float _3643 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3645 = fma(_3635, _3635, _3641);
        float _3647 = sqrt(_3645);
        float _3649 = _3625 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3651 = precise::min(_3647, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3653 = _3651 * _3643;
        float _3655 = _3649 * _3653;
        float _3657 = -_1030;
        float _3659 = _3657 + _3545;
        float _3661 = fma(_3629, _3655, _1024);
        float _3663 = fma(_3659, _3655, _1030);
        float _3665 = fma(_3639, _3655, _1034);
        _3611 = _3661;
        _3607 = _3663;
        _3615 = _3665;
    }
    float _3667 = _3611;
    float _3669 = _3607;
    float _3671 = _3615;
    int _3673 = ~_3181;
    int _3675 = _3673 + 1;
    float _3677 = trunc(_3599);
    float _3679 = precise::max(_3677, 0.0);
    uint _3681 = uint(_3679);
    int _3683 = int(_3409) + int(_3567);
    float _3685 = _3667 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    int _3687 = int(_3427) + int(_3589);
    int _3689 = _3593 * _3579;
    int _3691 = _3689 + _3317;
    int _3693 = ~_3309;
    int _3695 = _3693 + 1;
    int _3697 = _3675 * _3683;
    int _3699 = _3697 + _3321;
    float _3701 = _3667 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3703 = fma(_3669, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3685);
    bool _3705 = uint(_3691) >= uint(_3135);
    float _3707 = -_2445;
    float _3709 = _3707 + 1.0;
    float _3711 = fma(_3669, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3701);
    float _3713 = fma(_3671, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3703);
    int _3715 = ~_3275;
    int _3717 = _3715 + 1;
    float _3719 = -_2497;
    float _3721 = _3719 + 1.0;
    float _3723 = fma(_3671, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3711);
    float _3725 = _3713 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    int _3727 = int(_3453) + int(_3681);
    int _3729 = _3717 * _3687;
    int _3731 = _3729 + _3371;
    float _3733 = _3723 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3735 = _3725 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _3737 = !_3705;
    int _3739 = _3737 ? 0 : (-1);
    float _3741 = _3725 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    bool _3743 = uint(_3699) >= uint(_3181);
    float _3745 = fma(_3733, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3735);
    int _3747 = _3695 * _3727;
    int _3749 = _3747 + _3391;
    int _3751 = ~_3579;
    int _3753 = _3751 + _3739;
    int _3755 = _3753 + 1;
    float _3757 = _3725 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    bool _3759 = !_3743;
    int _3761 = _3759 ? 0 : (-1);
    float _3763 = _3725 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _3765 = uint(_3731) >= uint(_3275);
    float _3767 = _3667 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    int _3769 = ~_3683;
    int _3771 = _3769 + _3761;
    int _3773 = _3771 + 1;
    float _3775 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _3777 = -_308;
    int _3779 = _2723 ? as_type<int>(_3777) : as_type<int>(_308);
    float _3781 = fma(_3669, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3767);
    int _3783 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _3785 = _3783 != 0;
    int _3787 = _3181 * _3773;
    int _3789 = _3787 + _3321;
    float _3791 = fma(_3733, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3757);
    int _3793 = _3135 * _3755;
    int _3795 = _3793 + _3317;
    bool _3797 = _3135 == 0;
    float _3799 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _3801 = _3317 ^ _3135;
    float _3803 = fma(_3733, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3741);
    bool _3805 = !_3785;
    float _3807 = _3805 ? _308 : as_type<float>(_3779);
    float _3809 = fma(_3733, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3763);
    bool _3811 = uint(_3749) >= uint(_3309);
    float _3813 = fma(_3671, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3781);
    int _3815 = _3321 ^ _3181;
    float _3817 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _3819 = !_3765;
    int _3821 = _3819 ? 0 : (-1);
    float _3823 = _3813 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _3825 = !_3797;
    int _3827 = _3825 ? _3795 : (-1);
    float _3829 = _3775 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    uint _3831 = uint(int(uint(_3801) >> uint(31)));
    float _3833 = -_2465;
    float _3835 = _3833 + 1.0;
    bool _3837 = _3181 == 0;
    float _3839 = _3251 * _2877;
    bool _3841 = !_3811;
    int _3843 = _3841 ? 0 : (-1);
    float _3845 = _3251 * _2887;
    uint _3847 = uint(int(uint(_3815) >> uint(31)));
    int _3849 = ~_3821;
    int _3851 = _3687 + _3849;
    int _3853 = _3851 + 1;
    int _3855 = ~int(_3831);
    int _3857 = _3855 + 1;
    bool _3859 = !_3837;
    int _3861 = _3859 ? _3789 : (-1);
    bool _3863 = _3181 == 0;
    float _3865 = fma(_3823, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3803);
    int _3867 = ~_3843;
    int _3869 = _3727 + _3867;
    int _3871 = _3869 + 1;
    float _3873 = fma(_3823, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3745);
    int _3875 = ~int(_3847);
    int _3877 = _3875 + 1;
    float _3879 = fma(_3823, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3809);
    bool _3881 = _3135 == 0;
    float _3883 = fma(_3823, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3791);
    int _3885 = _3853 ^ _3857;
    float _3887 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _3889 = float(_3827);
    float _3891 = _3807 + 0.5;
    int _3893 = _3871 ^ _3877;
    float _3895 = float(_3861);
    float _3897 = _3799 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _3899 = ~_3857;
    int _3901 = _3899 + _3885;
    int _3903 = _3901 + 1;
    float _3905 = fma(_3829, _3889, _2347);
    int _3907 = ~_3877;
    int _3909 = _3907 + _3893;
    int _3911 = _3909 + 1;
    float _3913 = fma(_3897, _3895, _2389);
    float _3915 = _3667 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3917 = _3817 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _3919 = !_3881;
    int _3921 = _3919 ? _3903 : (-1);
    float _3923 = fma(_3829, _3891, _3905);
    float _3925 = -_308;
    int _3927 = _3481 ? as_type<int>(_3925) : as_type<int>(_308);
    float _3929 = abs(_1106);
    float _3931 = log2(_3929);
    float _3933 = fma(_3669, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3915);
    float _3935 = float(_3921);
    float _3937 = _3887 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _3939 = !_3863;
    int _3941 = _3939 ? _3911 : (-1);
    float _3943 = fma(_3671, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3933);
    bool _3945 = !_3461;
    float _3947 = _3945 ? _308 : as_type<float>(_3927);
    float _3949 = -_2463;
    float _3951 = fma(_3917, _3935, _3949);
    float _3953 = float(_3941);
    float _3955 = _3943 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3957 = _3477 + (-0.5);
    float _3959 = _3947 + 0.5;
    float _3961 = -_3721;
    float _3963 = fma(_3807, _3961, _3923);
    float _3965 = -_2481;
    float _3967 = fma(_3937, _3953, _3965);
    float _3969 = _3439 + (-0.5);
    float _3971 = fma(_3897, _3959, _3913);
    float _3973 = fma(_3955, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3873);
    float _3975 = fma(_3955, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3879);
    float _3977 = fma(_3955, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3865);
    float _3979 = -_2499;
    float _3981 = _3979 + 1.0;
    float _3983 = _3931 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3985 = -_3709;
    float _3987 = fma(_3947, _3985, _3971);
    float _3989 = -_3917;
    float _3991 = fma(_3989, _3969, _3951);
    float _3993 = _3973 + _3975;
    float _3995 = -_3937;
    float _3997 = fma(_3995, _3957, _3967);
    float _3999 = fma(_3439, _3981, _3991);
    float _4001 = _3993 * 0.5;
    float _4003 = exp2(_3983);
    float _4005 = fma(_3477, _3835, _3997);
    float _4007 = fma(_2823, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3581);
    float _4009 = fma(_2823, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3595);
    float _4011 = fma(_2823, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3597);
    out.m_79.z = _4001;
    out.m_79.w = _3975;
    bool _4013 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _4015 = isnan(0.5);
    bool _4017 = _4013 || _4015;
    bool _4019 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _4021 = _4017 || _4019;
    float _4023 = fma(_3955, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3883);
    out.m_81.x = _3963;
    out.m_81.y = _3999;
    out.m_81.z = _3987;
    out.m_81.w = _4005;
    out.m_83.x = _4007;
    out.m_83.y = _4009;
    out.m_83.z = _4011;
    float _4025 = fma(_4003, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4027 = precise::clamp(_4025, 0.0, 1.0);
    out.gl_Position.x = _3977;
    out.gl_Position.y = _4023;
    out.gl_Position.z = _3973;
    out.gl_Position.w = _3975;
    float _4029 = fma(_4027, -2.0, 3.0);
    float _4031 = _4027 * _4027;
    float _4033 = _4031 * _4029;
    float _4035 = _3251 * _2871;
    float _4037 = _308 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _4039 = _3977;
    float _4041 = _4023;
    float _4043 = _4035;
    if (_4021)
    {
        _4039 = 1.0;
    }
    float _4045 = _4039;
    float _4047 = _4045;
    if (_4021)
    {
        _4041 = 1.0;
    }
    float _4049 = _4041;
    float _4051 = _4049;
    if (!_4021)
    {
        float _4053 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4055 = _4053 * 0.15915493667125701904296875;
        float _4057 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4059 = _4055 * 6.283185482025146484375;
        float _4061 = cos(_4059);
        float _4063 = _4057 * 0.15915493667125701904296875;
        float _4065 = _4055 * 6.283185482025146484375;
        float _4067 = sin(_4065);
        float _4069 = 1.0 / _4061;
        float _4071 = _4063 * 6.283185482025146484375;
        float _4073 = cos(_4071);
        float _4075 = _4067 * _4069;
        float _4077 = _4063 * 6.283185482025146484375;
        float _4079 = sin(_4077);
        float _4081 = _4073 * _4075;
        float _4083 = 1.0 / _4081;
        float _4085 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4087 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _4085;
        float _4089 = 1.0 / _4087;
        float _4091 = _4079 * _4083;
        float _4093 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4095 = fma(_1106, _4091, _4093);
        float _4097 = _4095 * _4089;
        float _4099 = precise::clamp(_4097, 0.0, 1.0);
        _4051 = _4099;
    }
    float _4101 = _4051;
    if (!_4021)
    {
        float _4103 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4105 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4107 = _4103 * 0.15915493667125701904296875;
        float _4109 = _4105 * 0.15915493667125701904296875;
        float _4111 = _4107 * 6.283185482025146484375;
        float _4113 = cos(_4111);
        float _4115 = _4107 * 6.283185482025146484375;
        float _4117 = sin(_4115);
        float _4119 = 1.0 / _4113;
        float _4121 = _4109 * 6.283185482025146484375;
        float _4123 = cos(_4121);
        float _4125 = _4117 * _4119;
        float _4127 = _4109 * 6.283185482025146484375;
        float _4129 = sin(_4127);
        float _4131 = _4123 * _4125;
        float _4133 = 1.0 / _4131;
        float _4135 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _4137 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _4135;
        float _4139 = 1.0 / _4137;
        float _4141 = _4129 * _4133;
        float _4143 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _4145 = fma(_1106, _4141, _4143);
        float _4147 = _4145 * _4139;
        float _4149 = precise::clamp(_4147, 0.0, 1.0);
        float _4151 = -_4149;
        float _4153 = _4151 + 1.0;
        _4047 = _4153;
    }
    float _4155 = _4047;
    bool _4157 = _1185 != 0;
    float _4159 = -_4033;
    float _4161 = _4159 + 1.0;
    float _4163 = _4101 * _4155;
    float _4165 = fma(_4037, _4007, _4035);
    bool _4167 = _1106 <= 8000.0;
    bool _4169 = isnan(_1106);
    bool _4171 = _4167 || _4169;
    bool _4173 = isnan(8000.0);
    bool _4175 = _4171 || _4173;
    float _4177 = float(_4175);
    float _4179 = fma(_4161, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4033);
    float _4181 = fma(_4037, _4009, _3839);
    float _4183 = _4163 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _4185 = fma(_4037, _4011, _3845);
    float _4187 = _3079 + _4181;
    float _4189 = _4177 * _4179;
    float _4191 = _316 * _4183;
    float _4193 = _3073 + _4165;
    float _4195 = _3081 + _4185;
    if (_4157)
    {
        _4043 = 1.0;
    }
    float _4197 = _4043;
    float _4199 = _4197;
    if (!_4157)
    {
        int _4201 = _1211 << 4;
        int _4203 = _4201 + 2048;
        uint _4205 = uint(int(uint(_4203) >> uint(2)));
        uint _4207 = uint(int(uint(int(_4205)) >> uint(2)));
        int _4209 = int(_4205) & 3;
        float _4211 = (*spvDescriptorSet0.vp_c15)._m0[int(_4207)][_4209];
        int _4213 = int(_4205) + 1;
        uint _4215 = uint(int(uint(_4213) >> uint(2)));
        int _4217 = _4213 & 3;
        float _4219 = (*spvDescriptorSet0.vp_c15)._m0[int(_4215)][_4217];
        int _4221 = _4203 + 8;
        uint _4223 = uint(int(uint(_4221) >> uint(2)));
        uint _4225 = uint(int(uint(int(_4223)) >> uint(2)));
        int _4227 = int(_4223) & 3;
        float _4229 = (*spvDescriptorSet0.vp_c15)._m0[int(_4225)][_4227];
        int _4231 = int(_4223) + 1;
        uint _4233 = uint(int(uint(_4231) >> uint(2)));
        int _4235 = _4231 & 3;
        float _4237 = (*spvDescriptorSet0.vp_c15)._m0[int(_4233)][_4235];
        float _4239 = _1036 * _4219;
        float _4241 = fma(_1030, _4211, _4239);
        float _4243 = fma(_1034, _4229, _4241);
        float _4245 = _4243 + _4237;
        float _4247 = precise::clamp(_4245, 0.0, 1.0);
        float _4249 = -_4247;
        float _4251 = _4249 + _1517;
        float _4253 = fma(_4251, 500.0, 1.5);
        float _4255 = exp2(_4253);
        float _4257 = 0.0 + _4255;
        float _4259 = precise::clamp(_4257, 0.0, 1.0);
        _4199 = _4259;
    }
    float _4261 = _4199;
    bool _4263 = _1447 != 0;
    float _4265 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4267 = _3667 + _4265;
    float _4269 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4271 = _3669 + _4269;
    float _4273 = _4189 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _4275 = -_1509;
    float _4277 = _4275 + 1.0;
    float _4279 = _4267 * _4267;
    out.m_85.x = _4193;
    out.m_85.y = _4187;
    out.m_85.z = _4195;
    float _4281 = _4277 * _4273;
    float _4283 = precise::clamp(_4281, 0.0, 1.0);
    float _4285 = fma(_4271, _4271, _4279);
    float _4287 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4289 = _3671 + _4287;
    out.m_87.x = _3669;
    out.m_87.y = _3667;
    out.m_87.z = _3671;
    float _4291 = -_4283;
    float _4293 = fma(_4291, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4295 = _4271;
    if (!_4263)
    {
        _4295 = 1.0;
    }
    float _4297 = _4295;
    float _4299 = fma(_4289, _4289, _4285);
    float _4301 = _4297;
    if (_4263)
    {
        bool _4303 = _1523 >= _1507;
        bool _4305 = isnan(_1523);
        bool _4307 = _4303 || _4305;
        bool _4309 = isnan(_1507);
        bool _4311 = _4307 || _4309;
        float _4313 = float(_4311);
        _4301 = _4313;
    }
    float _4315 = _4301;
    float _4317 = _4315 * _4261;
    float _4319 = sqrt(_4299);
    float _4321 = -_4317;
    float _4323 = fma(_4321, _4293, 1.0);
    float _4325 = precise::clamp(_4323, 0.0, 1.0);
    float _4327 = _4325 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_89.x = _4327;
    bool _4329 = _4319 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4331 = isnan(_4319);
    bool _4333 = _4329 || _4331;
    bool _4335 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4337 = _4333 || _4335;
    float _4339 = _4315;
    float _4341 = _4325;
    if (!_4337)
    {
        _4339 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4343 = _4339;
    float _4345 = _4343;
    float _4347 = _4343;
    if (!_4337)
    {
        _4341 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4349 = _4341;
    float _4351 = _4349;
    float _4353 = _4349;
    if (!_4337)
    {
        _1513 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4355 = _1513;
    bool _4357 = !_4337;
    float _4359 = _4355;
    float _4361 = _4355;
    if (!_4357)
    {
        bool _4363 = _4319 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4365 = isnan(_4319);
        bool _4367 = _4363 || _4365;
        bool _4369 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4371 = _4367 || _4369;
        if (!_4371)
        {
            float _4373 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4375 = _4319 + _4373;
            float _4377 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4379 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4377;
            float _4381 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4383 = _4381 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4385 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4387 = _4385 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4389 = 1.0 / _4379;
            float _4391 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4393 = _4391 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4395 = _4375 * _4389;
            float _4397 = precise::clamp(_4395, 0.0, 1.0);
            float _4399 = fma(_4397, _4383, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4401 = fma(_4397, _4387, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4403 = fma(_4397, _4393, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            _4353 = _4401;
            _4347 = _4399;
            _4361 = _4403;
            _4405 = true;
        }
        else
        {
            bool _4407 = _4319 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4409 = isnan(_4319);
            bool _4411 = _4407 || _4409;
            bool _4413 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4415 = _4411 || _4413;
            if (!_4415)
            {
                _4345 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4417 = _4345;
            _4347 = _4417;
            if (!_4415)
            {
                _4351 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4419 = _4351;
            _4353 = _4419;
            if (!_4415)
            {
                _4359 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4421 = _4359;
            bool _4423 = !_4415;
            _4361 = _4421;
            if (!_4423)
            {
                bool _4425 = _4319 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4427 = isnan(_4319);
                bool _4429 = _4425 || _4427;
                bool _4431 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4433 = _4429 || _4431;
                if (!_4433)
                {
                    float _4435 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4437 = _4319 + _4435;
                    float _4439 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4441 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4439;
                    float _4443 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4445 = _4443 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4447 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4449 = _4447 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4451 = 1.0 / _4441;
                    float _4453 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4455 = _4453 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4457 = _4437 * _4451;
                    float _4459 = precise::clamp(_4457, 0.0, 1.0);
                    float _4461 = fma(_4459, _4445, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4463 = fma(_4459, _4449, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4465 = fma(_4459, _4455, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    _4353 = _4463;
                    _4347 = _4461;
                    _4361 = _4465;
                    _4405 = true;
                }
                else
                {
                    _4353 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4347 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4361 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _4405 = false;
    float _4467 = _4353;
    float _4469 = _4347;
    float _4471 = _4361;
    float _4473 = _4191 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_91.x = 0.0;
    float _4475 = _4467 * 0.586610972881317138671875;
    bool _4477 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_50.x = _4473;
    float _4479 = fma(_4469, 0.298911988735198974609375, _4475);
    bool _4481 = _4101 > 0.0;
    bool _4483 = isnan(_4101);
    bool _4485 = _4481 || _4483;
    bool _4487 = isnan(0.0);
    bool _4489 = _4485 || _4487;
    float _4491 = fma(_4471, 0.114477999508380889892578125, _4479);
    bool _4493 = _4155 <= 0.0;
    bool _4495 = !_4489;
    bool _4497 = _4493 || _4495;
    float _4499 = -_4491;
    float _4501 = _4499 + _4469;
    float _4503 = -_4491;
    float _4505 = _4503 + _4467;
    float _4507 = -_4491;
    float _4509 = _4507 + _4471;
    float _4511 = fma(_4501, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4491);
    float _4513 = fma(_4505, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4491);
    float _4515 = fma(_4509, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4491);
    bool _4517 = !_4477;
    if (!_4517)
    {
        float _4519 = -_3667;
        float _4521 = _4519 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4523 = -_3669;
        float _4525 = _4523 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4527 = -_3671;
        float _4529 = _4527 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4531 = _4521 * _4521;
        float _4533 = fma(_4525, _4525, _4531);
        float _4535 = fma(_4529, _4529, _4533);
        float _4537 = sqrt(_4535);
        float _4539 = rsqrt(_4535);
        float _4541 = -_4537;
        float _4543 = _4541 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4545 = _4543 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4547 = precise::clamp(_4545, 0.0, 1.0);
        float _4549 = _4525 * _4539;
        float _4551 = _4521 * _4539;
        float _4553 = abs(_4547);
        float _4555 = log2(_4553);
        float _4557 = _4529 * _4539;
        float _4559 = _4549 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4561 = _4187 * _4551;
        float _4563 = -_4551;
        float _4565 = -_4559;
        float _4567 = fma(_4563, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4565);
        float _4569 = fma(_4193, _4549, _4561);
        float _4571 = -_4557;
        float _4573 = fma(_4571, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4567);
        float _4575 = fma(_4195, _4557, _4569);
        float _4577 = precise::clamp(_4575, 0.0, 1.0);
        float _4579 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4581 = _4573 + _4579;
        float _4583 = _4555 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4585 = _4581 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4587 = precise::clamp(_4585, 0.0, 1.0);
        float _4589 = exp2(_4583);
        float _4591 = _4589 * _4587;
        float _4593 = _4577 * _4591;
        float _4595 = _4593 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4597 = _4593 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4599 = _4593 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_91.x = _4595;
        out.m_91.y = _4597;
        out.m_91.z = _4599;
    }
    out.m_93.x = _4511;
    out.m_93.y = _4513;
    out.m_93.z = _4515;
    if (!_4497)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_50.x = 0.0;
    float _4601 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4601;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4405 = false;
    bool _992 = false;
    bool _814 = false;
    bool _528 = false;
    bool _336 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _107 = in.m_47.w;
    float _109 = trunc(_107);
    int _112 = int(_109);
    bool _116 = _112 >= 1;
    float _118 = 0.0;
    if (!_116)
    {
        _118 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _120 = _118;
    float _122 = _120;
    if (!_116)
    {
        out.m_50.x = 0.0;
    }
    int _124 = 0;
    if (!_116)
    {
        float _126 = _120 * 5.0;
        _124 = as_type<int>(_126);
    }
    int _128 = _124;
    if (!_116)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4657 = as_type<float>(_128);
        out.gl_Position.z = _4657;
    }
    if (!_116)
    {
        return out;
    }
    float _130 = in.m_52.w;
    bool _132 = _130 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _134 = isnan(_130);
    bool _136 = _132 || _134;
    bool _138 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _140 = _136 || _138;
    float _142 = -_130;
    float _144 = _142 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _146 = 0.0;
    float _148 = _144;
    if (_140)
    {
        float _150 = float(_112);
        _146 = _150;
    }
    float _152 = _146;
    bool _154 = _144 >= _152;
    bool _156 = !_140;
    bool _158 = _154 || _156;
    if (_158)
    {
        _122 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _160 = _122;
    if (_158)
    {
        out.m_50.x = 0.0;
    }
    int _162 = 0;
    if (_158)
    {
        float _164 = _160 * 5.0;
        _162 = as_type<int>(_164);
    }
    int _166 = _162;
    if (_158)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4726 = as_type<float>(_166);
        out.gl_Position.z = _4726;
    }
    if (_158)
    {
        return out;
    }
    float _168 = in.m_54.x;
    float _170 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _172 = _144 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _174 = as_type<float>(int(gl_VertexIndex));
    float _176 = in.m_59.x;
    float _178 = in.m_59.y;
    float _180 = in.m_59.z;
    float _182 = in.m_61.x;
    float _184 = in.m_61.y;
    float _186 = in.m_61.z;
    float _188 = in.m_63.x;
    float _190 = in.m_63.y;
    float _192 = in.m_63.z;
    float _194 = _172 * _170;
    float _196 = in.m_65.x;
    float _198 = in.m_65.y;
    float _200 = in.m_65.z;
    float _202 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[20].x, _194);
    int _204 = as_type<int>(_174) & 1;
    bool _206 = _204 != 0;
    int _208 = as_type<int>(_174) & 2;
    bool _210 = _208 != 0;
    float _212 = _202 * 6.283185482025146484375;
    float _214 = floor(_202);
    float _216 = _212 * 0.15915493667125701904296875;
    bool _218 = !_210;
    float _220 = _218 ? (-0.5) : 0.5;
    int _222 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _224 = _222 != 0;
    int _226 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _228 = _226 != 0;
    float _230 = _178 * _184;
    int _232 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _234 = _232 != 0;
    float _236 = _216 * 6.283185482025146484375;
    float _238 = cos(_236);
    float _240 = _178 * _190;
    bool _242 = !_224;
    int _244 = _242 ? 0 : 1;
    float _246 = fma(_176, _182, _230);
    bool _248 = !_234;
    int _250 = _248 ? 0 : 1;
    float _252 = _178 * _198;
    int _254 = abs(_244);
    float _256 = -_214;
    float _258 = _202 + _256;
    int _260 = abs(_250);
    float _262 = fma(_176, _188, _240);
    float _264 = fma(_176, _196, _252);
    float _266 = -_258;
    float _268 = fma(_266, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _270 = !_228;
    int _272 = _270 ? 0 : 1;
    float _274 = fma(_180, _186, _246);
    float _276 = float(_254);
    float _278 = fma(_238, 0.5, 0.5);
    bool _280 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _282 = fma(_180, _192, _262);
    int _284 = abs(_272);
    float _286 = abs(_268);
    float _288 = _276 * _286;
    bool _290 = _258 < 0.5;
    float _292 = float(_290);
    float _294 = -_278;
    float _296 = fma(_294, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _298 = float(_260);
    float _300 = fma(_180, _200, _264);
    float _302 = -_292;
    float _304 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _306 = !_206;
    float _308 = _306 ? (-0.5) : 0.5;
    float _310 = fma(_298, _296, _288);
    float _312 = float(_284);
    float _314 = abs(_304);
    float _316 = fma(_312, _314, _310);
    bool _318 = !_280;
    float _334;
    if (!_318)
    {
        float _320 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _322 = _168 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _324 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[12].x, _144);
        float _326 = _324 * _320;
        float _328 = floor(_326);
        float _330 = -_328;
        float _332 = _326 + _330;
        _334 = _332;
        _336 = true;
    }
    else
    {
        float _338 = float(_112);
        float _340 = 1.0 / _338;
        float _342 = _144 * _340;
        _334 = _342;
    }
    _336 = false;
    float _344 = _334;
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _348 = _344 + _346;
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _352 = _344 + _350;
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _356 = _344 + _354;
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _360 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _358;
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _364 = _362 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _366 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _368 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _366;
    bool _370 = _344 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _372 = isnan(_344);
    bool _374 = _370 || _372;
    bool _376 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _378 = _374 || _376;
    float _380 = float(_378);
    float _382 = 1.0 / _360;
    bool _384 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _386 = 1.0 / _368;
    float _388 = 1.0 / _364;
    float _390 = _348 * _382;
    bool _392 = _344 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _394 = isnan(_344);
    bool _396 = _392 || _394;
    bool _398 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _400 = _396 || _398;
    float _402 = float(_400);
    float _404 = -_380;
    float _406 = _404 + 1.0;
    float _408 = _402 * _406;
    float _410 = _352 * _386;
    bool _412 = _344 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _414 = isnan(_344);
    bool _416 = _412 || _414;
    bool _418 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _420 = _416 || _418;
    float _422 = float(_420);
    float _424 = -_402;
    float _426 = _424 + 1.0;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _430 = _428 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _432 = _422 * _426;
    float _434 = -_422;
    float _436 = _434 + 1.0;
    float _438 = _356 * _388;
    bool _440 = _344 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _442 = isnan(_344);
    bool _444 = _440 || _442;
    bool _446 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _448 = _444 || _446;
    float _450 = float(_448);
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _454 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _452;
    float _456 = fma(_430, _438, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _460 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _458;
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _464 = _462 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _466 = fma(_454, _390, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _468 = _450 * _436;
    float _470 = fma(_460, _390, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _472 = fma(_464, _438, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _474 = -_450;
    float _476 = _474 + 1.0;
    float _478 = _466 * _468;
    float _480 = _470 * _468;
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _484 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _482;
    float _486 = fma(_476, (*spvDescriptorSet0.vp_c9)._m0[143].x, _478);
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _490 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _488;
    float _492 = fma(_476, (*spvDescriptorSet0.vp_c9)._m0[143].y, _480);
    float _494 = fma(_484, _410, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _496 = fma(_456, _432, _486);
    float _498 = fma(_490, _410, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _500 = fma(_472, _432, _492);
    float _502 = fma(_494, _408, _496);
    float _504 = fma(_498, _408, _500);
    float _506 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[146].x, _502);
    float _508 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[146].y, _504);
    bool _510 = !_384;
    float _526;
    if (!_510)
    {
        float _512 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _514 = _168 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _516 = fma(_514, (*spvDescriptorSet0.vp_c9)._m0[11].x, _144);
        float _518 = _516 * _512;
        float _520 = floor(_518);
        float _522 = -_520;
        float _524 = _518 + _522;
        _526 = _524;
        _528 = true;
    }
    else
    {
        float _530 = float(_112);
        float _532 = 1.0 / _530;
        float _534 = _144 * _532;
        _526 = _534;
    }
    _528 = false;
    float _536 = _526;
    float _538 = in.m_67.x;
    float _540 = in.m_67.y;
    float _542 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _544 = _536 + _542;
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _548 = _536 + _546;
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _552 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _550;
    float _554 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _556 = _554 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _558 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _560 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _558;
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _564 = _562 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _566 = 1.0 / _552;
    bool _568 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _570 = 1.0 / _556;
    float _572 = 1.0 / _564;
    float _574 = _508 * _540;
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _578 = _536 + _576;
    float _580 = _548 * _566;
    bool _582 = _536 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _584 = isnan(_536);
    bool _586 = _582 || _584;
    bool _588 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _590 = _586 || _588;
    float _592 = float(_590);
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _596 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _594;
    float _598 = 1.0 / _560;
    float _600 = _544 * _570;
    bool _602 = _536 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _604 = isnan(_536);
    bool _606 = _602 || _604;
    bool _608 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _610 = _606 || _608;
    float _612 = float(_610);
    float _614 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _616 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _614;
    float _618 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _620 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _618;
    float _622 = -_612;
    float _624 = _622 + 1.0;
    float _626 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _628 = _536 + _626;
    float _630 = _592 * _624;
    float _632 = -_592;
    float _634 = _632 + 1.0;
    float _636 = _628 * _572;
    bool _638 = _536 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _640 = isnan(_536);
    bool _642 = _638 || _640;
    bool _644 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _646 = _642 || _644;
    float _648 = float(_646);
    float _650 = _578 * _598;
    bool _652 = _536 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _654 = isnan(_536);
    bool _656 = _652 || _654;
    bool _658 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _660 = _656 || _658;
    float _662 = float(_660);
    float _664 = -_648;
    float _666 = _664 + 1.0;
    bool _668 = _536 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _670 = isnan(_536);
    bool _672 = _668 || _670;
    bool _674 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _676 = _672 || _674;
    float _678 = float(_676);
    float _680 = fma(_616, _650, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _682 = fma(_596, _650, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _684 = _662 * _666;
    float _686 = -_662;
    float _688 = _686 + 1.0;
    float _690 = _678 * _634;
    float _692 = fma(_620, _650, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _694 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _696 = _694 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _698 = _612 * _688;
    float _700 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _702 = _700 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _704 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _706 = _704 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _708 = _680 * _690;
    float _710 = _682 * _690;
    float _712 = -_678;
    float _714 = _712 + 1.0;
    float _716 = _692 * _690;
    float _718 = fma(_696, _636, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _720 = fma(_702, _636, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _722 = fma(_714, (*spvDescriptorSet0.vp_c9)._m0[107].x, _708);
    float _724 = fma(_714, (*spvDescriptorSet0.vp_c9)._m0[107].y, _710);
    float _726 = fma(_706, _636, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _728 = fma(_714, (*spvDescriptorSet0.vp_c9)._m0[107].z, _716);
    float _730 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _732 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _730;
    float _734 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _736 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _734;
    float _738 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _740 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _738;
    float _742 = fma(_718, _630, _722);
    float _744 = fma(_720, _630, _724);
    float _746 = fma(_726, _630, _728);
    float _748 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _750 = _748 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _752 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _754 = _752 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _756 = fma(_732, _580, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _758 = fma(_736, _580, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _760 = fma(_740, _580, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _762 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _764 = _762 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _766 = fma(_750, _600, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _768 = fma(_754, _600, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _770 = fma(_756, _698, _742);
    float _772 = fma(_764, _600, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _774 = fma(_758, _698, _744);
    float _776 = fma(_760, _698, _746);
    float _778 = fma(_766, _684, _770);
    float _780 = fma(_768, _684, _774);
    float _782 = fma(_772, _684, _776);
    float _784 = _506 * _538;
    float _786 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[111].x, _778);
    float _788 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[111].y, _780);
    float _790 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[111].z, _782);
    bool _792 = !_568;
    int _794 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[110].y);
    int _796 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _812;
    if (!_792)
    {
        float _798 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _800 = _168 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _802 = fma(_800, (*spvDescriptorSet0.vp_c9)._m0[11].y, _144);
        float _804 = _802 * _798;
        float _806 = floor(_804);
        float _808 = -_806;
        float _810 = _804 + _808;
        _812 = _810;
        _814 = true;
    }
    else
    {
        float _816 = float(_112);
        float _818 = 1.0 / _816;
        float _820 = _144 * _818;
        _812 = _820;
    }
    _814 = false;
    float _822 = _812;
    float _824 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _826 = _824 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _828 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _830 = _828 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _832 = _822 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _834 = isnan(_822);
    bool _836 = _832 || _834;
    bool _838 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _840 = _836 || _838;
    float _842 = float(_840);
    float _844 = 1.0 / _826;
    float _846 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _848 = _846 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _850 = _822 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _852 = isnan(_822);
    bool _854 = _850 || _852;
    bool _856 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _858 = _854 || _856;
    float _860 = float(_858);
    float _862 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _864 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _862;
    float _866 = -_842;
    float _868 = _866 + 1.0;
    bool _870 = _822 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _872 = isnan(_822);
    bool _874 = _870 || _872;
    bool _876 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _878 = _874 || _876;
    float _880 = float(_878);
    bool _882 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _884 = 1.0 / _830;
    float _886 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _888 = _886 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _890 = _860 * _868;
    float _892 = -_860;
    float _894 = _892 + 1.0;
    float _896 = _880 * _894;
    float _898 = 1.0 / _848;
    float _900 = _864 * _844;
    float _902 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _904 = _822 + _902;
    float _906 = -_880;
    float _908 = _906 + 1.0;
    float _910 = fma(_900, _904, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _912 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _914 = _822 + _912;
    float _916 = _888 * _884;
    bool _918 = _822 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _920 = isnan(_822);
    bool _922 = _918 || _920;
    bool _924 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _926 = _922 || _924;
    float _928 = float(_926);
    float _930 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _932 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _930;
    float _934 = _910 * _896;
    float _936 = fma(_916, _914, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _938 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _940 = _822 + _938;
    float _942 = -_928;
    float _944 = _942 + 1.0;
    float _946 = fma(_908, (*spvDescriptorSet0.vp_c9)._m0[115].x, _934);
    float _948 = _932 * _898;
    float _950 = _842 * _944;
    float _952 = fma(_936, _890, _946);
    float _954 = fma(_948, _940, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _956 = _788 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _958 = _790 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _960 = fma(_954, _950, _952);
    float _962 = _786 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _964 = _956 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _966 = _958 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _968 = fma(_928, (*spvDescriptorSet0.vp_c9)._m0[118].x, _960);
    float _970 = _962 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _972 = _968 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_69.x = _970;
    out.m_69.y = _964;
    out.m_69.z = _966;
    out.m_69.w = _972;
    bool _974 = !_882;
    float _990;
    if (!_974)
    {
        float _976 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _978 = _168 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _980 = fma(_978, (*spvDescriptorSet0.vp_c9)._m0[11].w, _144);
        float _982 = _980 * _976;
        float _984 = floor(_982);
        float _986 = -_984;
        float _988 = _982 + _986;
        _990 = _988;
        _992 = true;
    }
    else
    {
        float _994 = float(_112);
        float _996 = 1.0 / _994;
        float _998 = _144 * _996;
        _990 = _998;
    }
    _992 = false;
    float _1000 = _990;
    float _1002 = in.m_47.x;
    float _1004 = in.m_47.y;
    float _1006 = in.m_47.z;
    float _1008 = in.m_71.y;
    float _1010 = in.m_63.w;
    float _1012 = in.m_65.w;
    float _1014 = _190 * _1004;
    float _1016 = _198 * _1004;
    float _1018 = fma(_188, _1002, _1014);
    float _1020 = fma(_196, _1002, _1016);
    float _1022 = fma(_192, _1006, _1018);
    float _1024 = _1004 + _1008;
    float _1026 = fma(_200, _1006, _1020);
    float _1028 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1030 = _1022 + _1010;
    float _1032 = _1024 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1034 = _1026 + _1012;
    float _1036 = _1024 + _1028;
    float _1038 = fma(_1030, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1032);
    float _1040 = _1036 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1042 = _1036 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1044 = fma(_1034, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1038);
    float _1046 = _1024 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1048 = fma(_1030, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1040);
    float _1050 = fma(_1030, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1042);
    float _1052 = _1044 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1054 = fma(_1030, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1046);
    float _1056 = fma(_1034, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1048);
    float _1058 = fma(_1034, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1050);
    float _1060 = 1.0 / _1052;
    float _1062 = fma(_1034, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1054);
    float _1064 = _1056 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1066 = _1058 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1068 = _1062 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1070 = trunc(_1064);
    int _1072 = int(_1070);
    float _1074 = _1068 + _1052;
    float _1076 = _1074 * _1060;
    float _1078 = _1076 * 0.5;
    float _1080 = trunc(_1066);
    int _1082 = int(_1080);
    float _1084 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1086 = fma(_1078, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1084);
    int _1088 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1090 = _1072 + _1088;
    int _1092 = _1090 + 1;
    float _1094 = 1.0 / _1086;
    int _1096 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1098 = _1082 + _1096;
    int _1100 = _1098 + 1;
    int _1102 = _1092 | _1100;
    float _1104 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1106 = _1094 * _1104;
    bool _1108 = _1106 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1110 = _1106 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _1112 = !_1108;
    int _1114 = _1112 ? 0 : 1;
    int _1116 = 2;
    int _1118 = _1092;
    float _1120 = _1064;
    if (!_1108)
    {
        _1116 = 1;
    }
    int _1122 = _1116;
    int _1124 = _1122;
    if (!_1110)
    {
        _1124 = _1114;
    }
    int _1126 = _1124;
    bool _1128 = _1092 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1130 = _1126 << 6;
    bool _1132 = _1102 < 0;
    bool _1134 = _1132 || _1128;
    int _1136 = _1130 + 96;
    uint _1139 = uint(int(uint(_1136) >> uint(2)));
    uint _1141 = uint(int(uint(int(_1139)) >> uint(2)));
    int _1143 = int(_1139) & 3;
    float _1145 = (*spvDescriptorSet0.vp_c15)._m0[int(_1141)][_1143];
    int _1147 = int(_1139) + 1;
    uint _1149 = uint(int(uint(_1147) >> uint(2)));
    int _1151 = _1147 & 3;
    float _1153 = (*spvDescriptorSet0.vp_c15)._m0[int(_1149)][_1151];
    bool _1155 = _1100 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1157 = _1155 || _1134;
    int _1159 = int(_1134);
    int _1161 = _1108 ? 2 : 0;
    int _1163 = _1159 | _1161;
    int _1165 = _228 ? 4 : 0;
    int _1167 = _1163 | _1165;
    int _1169 = _1157 ? 8 : 0;
    int _1171 = _1167 | _1169;
    int _1173 = false ? 16 : 0;
    int _1175 = _1171 | _1173;
    int _1177 = false ? 32 : 0;
    int _1179 = _1175 | _1177;
    int _1181 = false ? 64 : 0;
    int _1183 = _1179 | _1181;
    int _1185 = _1183 & 8;
    int _1187 = _1130 + 104;
    uint _1189 = uint(int(uint(_1187) >> uint(2)));
    uint _1191 = uint(int(uint(int(_1189)) >> uint(2)));
    int _1193 = int(_1189) & 3;
    float _1195 = (*spvDescriptorSet0.vp_c15)._m0[int(_1191)][_1193];
    int _1197 = int(_1189) + 1;
    uint _1199 = uint(int(uint(_1197) >> uint(2)));
    int _1201 = _1197 & 3;
    float _1203 = (*spvDescriptorSet0.vp_c15)._m0[int(_1199)][_1201];
    float _1205 = as_type<float>(_1126);
    if (!_1157)
    {
        int _1207 = _1100 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1209 = _1207 + _1092;
        _1118 = _1209;
    }
    int _1211 = _1118;
    int _1213 = _1130 + 48;
    uint _1215 = uint(int(uint(_1213) >> uint(2)));
    uint _1217 = uint(int(uint(int(_1215)) >> uint(2)));
    int _1219 = int(_1215) & 3;
    float _1221 = (*spvDescriptorSet0.vp_c15)._m0[int(_1217)][_1219];
    int _1223 = int(_1215) + 1;
    uint _1225 = uint(int(uint(_1223) >> uint(2)));
    int _1227 = _1223 & 3;
    float _1229 = (*spvDescriptorSet0.vp_c15)._m0[int(_1225)][_1227];
    if (!_1157)
    {
        int _1231 = _1211 << 2;
        _794 = _1231;
    }
    int _1233 = _794;
    int _1235 = _1233;
    if (!_1157)
    {
        uint _1237 = uint(int(uint(_1211) >> uint(2)));
        _796 = int(_1237);
    }
    int _1239 = _796;
    int _1241 = _1130 + 64;
    uint _1243 = uint(int(uint(_1241) >> uint(2)));
    uint _1245 = uint(int(uint(int(_1243)) >> uint(2)));
    int _1247 = int(_1243) & 3;
    float _1249 = (*spvDescriptorSet0.vp_c15)._m0[int(_1245)][_1247];
    int _1251 = int(_1243) + 1;
    uint _1253 = uint(int(uint(_1251) >> uint(2)));
    int _1255 = _1251 & 3;
    float _1257 = (*spvDescriptorSet0.vp_c15)._m0[int(_1253)][_1255];
    if (!_1157)
    {
        int _1259 = 12 & _1233;
        _1235 = _1259;
    }
    int _1261 = _1235;
    int _1263 = _1130 + 56;
    uint _1265 = uint(int(uint(_1263) >> uint(2)));
    uint _1267 = uint(int(uint(int(_1265)) >> uint(2)));
    int _1269 = int(_1265) & 3;
    float _1271 = (*spvDescriptorSet0.vp_c15)._m0[int(_1267)][_1269];
    int _1273 = int(_1265) + 1;
    uint _1275 = uint(int(uint(_1273) >> uint(2)));
    int _1277 = _1273 & 3;
    float _1279 = (*spvDescriptorSet0.vp_c15)._m0[int(_1275)][_1277];
    int _1281 = _1130 + 72;
    uint _1283 = uint(int(uint(_1281) >> uint(2)));
    uint _1285 = uint(int(uint(int(_1283)) >> uint(2)));
    int _1287 = int(_1283) & 3;
    float _1289 = (*spvDescriptorSet0.vp_c15)._m0[int(_1285)][_1287];
    int _1291 = int(_1283) + 1;
    uint _1293 = uint(int(uint(_1291) >> uint(2)));
    int _1295 = _1291 & 3;
    float _1297 = (*spvDescriptorSet0.vp_c15)._m0[int(_1293)][_1295];
    float _1299 = _1036 * _1153;
    float _1301 = fma(_1030, _1145, _1299);
    float _1303 = _1145;
    if (!_1157)
    {
        int _1305 = _1239 << 4;
        int _1307 = _1305 + _1261;
        _1303 = as_type<float>(_1307);
    }
    float _1309 = _1303;
    float _1311 = fma(_1034, _1195, _1301);
    float _1313 = _1309;
    if (!_1157)
    {
        int _1315 = as_type<int>(_1309) + 400;
        uint _1317 = uint(int(uint(_1315) >> uint(2)));
        uint _1319 = uint(int(uint(int(_1317)) >> uint(2)));
        int _1321 = int(_1317) & 3;
        float _1323 = (*spvDescriptorSet0.vp_c15)._m0[int(_1319)][_1321];
        _1313 = _1323;
    }
    float _1325 = _1313;
    float _1327 = _1311 + _1203;
    float _1329 = _1036 * _1229;
    float _1331 = 1.0 / _1327;
    int _1333 = _1130 + 80;
    uint _1335 = uint(int(uint(_1333) >> uint(2)));
    uint _1337 = uint(int(uint(int(_1335)) >> uint(2)));
    int _1339 = int(_1335) & 3;
    float _1341 = (*spvDescriptorSet0.vp_c15)._m0[int(_1337)][_1339];
    int _1343 = int(_1335) + 1;
    uint _1345 = uint(int(uint(_1343) >> uint(2)));
    int _1347 = _1343 & 3;
    float _1349 = (*spvDescriptorSet0.vp_c15)._m0[int(_1345)][_1347];
    float _1351 = fma(_1030, _1221, _1329);
    float _1353 = _1036 * _1257;
    int _1355 = _1130 + 88;
    uint _1357 = uint(int(uint(_1355) >> uint(2)));
    uint _1359 = uint(int(uint(int(_1357)) >> uint(2)));
    int _1361 = int(_1357) & 3;
    float _1363 = (*spvDescriptorSet0.vp_c15)._m0[int(_1359)][_1361];
    int _1365 = int(_1357) + 1;
    uint _1367 = uint(int(uint(_1365) >> uint(2)));
    int _1369 = _1365 & 3;
    float _1371 = (*spvDescriptorSet0.vp_c15)._m0[int(_1367)][_1369];
    float _1373 = fma(_1030, _1249, _1353);
    float _1375 = fma(_1034, _1271, _1351);
    float _1377 = _1375 + _1279;
    float _1379 = fma(_1030, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1381 = fma(_1034, _1289, _1373);
    float _1383 = _1377 * _1331;
    float _1385 = floor(_1379);
    float _1387 = _1381 + _1297;
    bool _1389 = _1383 >= 0.0;
    float _1391 = fma(_1034, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1393 = _1387 * _1331;
    bool _1395 = _1383 <= 1.0;
    bool _1397 = _1395 && _1389;
    float _1399 = floor(_1391);
    bool _1401 = _1393 >= 0.0;
    bool _1403 = _1401 && _1397;
    bool _1405 = _1393 <= 1.0;
    bool _1407 = _1405 && _1403;
    float _1409 = _1297;
    float _1411 = _1391;
    if (!_1157)
    {
        float _1413 = floor(_1066);
        _1409 = _1413;
    }
    float _1415 = _1409;
    float _1417 = -_1385;
    float _1419 = _1379 + _1417;
    int _1421 = int(_1403);
    int _1423 = _1108 ? 2 : 0;
    int _1425 = _1421 | _1423;
    int _1427 = _1407 ? 4 : 0;
    int _1429 = _1425 | _1427;
    int _1431 = _1157 ? 8 : 0;
    int _1433 = _1429 | _1431;
    int _1435 = false ? 16 : 0;
    int _1437 = _1433 | _1435;
    int _1439 = false ? 32 : 0;
    int _1441 = _1437 | _1439;
    int _1443 = false ? 64 : 0;
    int _1445 = _1441 | _1443;
    int _1447 = _1445 & 4;
    float _1449 = (*spvDescriptorSet0.vp_c15)._m0[652].y;
    if (!_1157)
    {
        float _1451 = floor(_1064);
        _1449 = _1451;
    }
    float _1453 = _1449;
    float _1455 = _1036 * _1349;
    if (_1407)
    {
        float _1457 = float(_1126);
        _1205 = _1457;
    }
    float _1459 = _1205;
    float _1461 = fma(_1030, _1341, _1455);
    float _1463 = _580;
    if (!_1157)
    {
        float _1465 = rint(_1325);
        float _1467 = precise::max(_1465, 0.0);
        uint _1469 = uint(_1467);
        uint _1471 = clamp(_1469, 0u, 65535u);
        _1463 = as_type<float>(_1471);
    }
    float _1473 = _1463;
    float _1475 = fma(_1034, _1363, _1461);
    float _1477 = _1475 + _1371;
    float _1479 = -_1399;
    float _1481 = _1391 + _1479;
    if (!_1157)
    {
        float _1483 = -_1415;
        float _1485 = _1066 + _1483;
        _1411 = _1485;
    }
    float _1487 = _1411;
    float _1489 = _1249;
    if (_1407)
    {
        float _1491 = rint(_1459);
        float _1493 = precise::max(_1491, 0.0);
        uint _1495 = uint(_1493);
        uint _1497 = clamp(_1495, 0u, 65535u);
        _1489 = as_type<float>(_1497);
    }
    float _1499 = _1489;
    if (!_1157)
    {
        float _1501 = -_1453;
        float _1503 = _1064 + _1501;
        _1120 = _1503;
    }
    float _1505 = _1120;
    float _1507 = _1477 * _1331;
    float2 _6860 = float2(_1419, _1481);
    float _1509 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6860, float2(0.0), isnan(_6860)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6860, float2(0.0), isnan(_6860)), level(0.0)).x;
    float _1511 = _1487;
    float _1513 = _1507;
    if (!_1157)
    {
        float3 _6879 = float3(_1505, _1487, float(as_type<int>(_1473)));
        float3 _6883 = select(_6879, float3(0.0), isnan(_6879));
        float _1515 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6883.xy, uint(rint(_6883.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6883.xy, uint(rint(_6883.z)), level(0.0)).x;
        _1511 = _1515;
    }
    float _1517 = _1511;
    float _1519 = _1499;
    if (_1407)
    {
        float3 _6898 = float3(_1383, _1393, float(as_type<int>(_1499)));
        float3 _6900 = select(_6898, float3(0.0), isnan(_6898));
        float _1521 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6900.xy, uint(rint(_6900.z)), _1507, level(0.0));
        _1519 = _1521;
    }
    float _1523 = _1519;
    float _1525 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1527 = int(_1525);
    int _1529 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1531 = _1529 != 0;
    int _1533 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1535 = _1533 != 0;
    int _1537 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1539 = _1537 != 0;
    float _1541 = _316 * _574;
    float _1543 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1545 = int(_1543);
    float _1547 = float(_112);
    float _1549 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1551 = _1549 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1553 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1555 = int(_1553);
    float _1557 = float(_1527);
    float _1559 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1561 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1559;
    float _1563 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1565 = int(_1563);
    float _1567 = float(_1545);
    bool _1569 = !_1535;
    int _1571 = _1569 ? 0 : 1;
    float _1573 = 1.0 / _1557;
    float _1575 = float(uint(_1555));
    float _1577 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1579 = ~_1555;
    int _1581 = _1579 + 1;
    int _1583 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1585 = _1583 != 0;
    bool _1587 = !_1531;
    int _1589 = _1587 ? 0 : 1;
    float _1591 = 1.0 / _1567;
    float _1593 = float(uint(_1565));
    int _1595 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1597 = _1595 != 0;
    int _1599 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1601 = _1599 != 0;
    int _1603 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1605 = _1603 != 0;
    int _1607 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1609 = _1607 != 0;
    int _1611 = ~_1565;
    int _1613 = _1611 + 1;
    float _1615 = _1573 * _144;
    float _1617 = 1.0 / _1575;
    bool _1619 = !_1601;
    int _1621 = _1619 ? 0 : 1;
    int _1623 = ~_1555;
    int _1625 = _1623 + 1;
    int _1627 = ~_1565;
    int _1629 = _1627 + 1;
    float _1631 = _1591 * _144;
    float _1633 = trunc(_1615);
    int _1635 = int(_1633);
    bool _1637 = !_1539;
    int _1639 = _1637 ? 0 : 1;
    bool _1641 = !_1585;
    int _1643 = _1641 ? 0 : 1;
    float _1645 = 1.0 / _1593;
    int _1647 = as_type<int>(_1617) + (-2);
    float _1649 = in.m_54.y;
    float _1651 = trunc(_1631);
    int _1653 = int(_1651);
    float _1655 = float(uint(_1635));
    float _1657 = as_type<float>(_1647) * _1655;
    float _1659 = _168 * 2.0;
    int _1661 = as_type<int>(_1645) + (-2);
    float _1663 = 1.0 / _1551;
    float _1665 = float(uint(_1653));
    float _1667 = trunc(_1657);
    float _1669 = precise::max(_1667, 0.0);
    uint _1671 = uint(_1669);
    float _1673 = as_type<float>(_1661) * _1665;
    bool _1675 = !_1597;
    int _1677 = _1675 ? 0 : 1;
    float _1679 = floor(_1659);
    float _1681 = _1649 * 2.0;
    int _1683 = _1581 * int(_1671);
    int _1685 = _1683 + _1635;
    float _1687 = trunc(_1673);
    float _1689 = precise::max(_1687, 0.0);
    uint _1691 = uint(_1689);
    bool _1693 = _1679 > 0.0;
    float _1695 = floor(_1681);
    bool _1697 = _1679 >= 0.0;
    bool _1699 = isnan(_1679);
    bool _1701 = _1697 || _1699;
    bool _1703 = isnan(0.0);
    bool _1705 = _1701 || _1703;
    float _1707 = float(uint(_1685));
    int _1709 = _1705 ? 0 : 1;
    int _1711 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1713 = _1711 != 0;
    float _1715 = as_type<float>(_1647) * _1707;
    int _1717 = _1613 * int(_1691);
    int _1719 = _1717 + _1653;
    float _1721 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1723 = _168 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1725 = trunc(_1715);
    float _1727 = precise::max(_1725, 0.0);
    uint _1729 = uint(_1727);
    int _1731 = ~_1709;
    int _1733 = _1731 + 1;
    int _1735 = _1733 + 1;
    float _1737 = _1649 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1739 = _1735;
    if (!_1693)
    {
        int _1741 = ~_1709;
        int _1743 = _1741 + 1;
        _1739 = _1743;
    }
    int _1745 = _1739;
    float _1747 = -_1577;
    float _1749 = fma(_1723, 2.0, _1747);
    float _1751 = float(uint(_1719));
    float _1753 = fma(_1737, -2.0, _1721);
    bool _1755 = _1695 > 0.0;
    float _1757 = 1.0 / _1547;
    bool _1759 = !_1605;
    int _1761 = _1759 ? 0 : 1;
    float _1763 = as_type<float>(_1661) * _1751;
    bool _1765 = _1695 >= 0.0;
    bool _1767 = isnan(_1695);
    bool _1769 = _1765 || _1767;
    bool _1771 = isnan(0.0);
    bool _1773 = _1769 || _1771;
    int _1775 = _1773 ? 0 : 1;
    int _1777 = int(_1671) + int(_1729);
    float _1779 = trunc(_1763);
    float _1781 = precise::max(_1779, 0.0);
    uint _1783 = uint(_1781);
    int _1785 = ~_1775;
    int _1787 = _1785 + 1;
    int _1789 = _1787 + 1;
    int _1791 = _1789;
    if (!_1755)
    {
        int _1793 = ~_1775;
        int _1795 = _1793 + 1;
        _1791 = _1795;
    }
    int _1797 = _1791;
    int _1799 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1801 = _1799 != 0;
    float _1803 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1805 = _1803 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    int _1807 = _1625 * _1777;
    int _1809 = _1807 + _1635;
    bool _1811 = !_1801;
    int _1813 = _1811 ? 0 : 1;
    float _1815 = 1.0 / _1805;
    bool _1817 = uint(_1809) >= uint(_1555);
    float _1819 = as_type<float>(_1809);
    int _1821 = as_type<int>(_1805);
    if (_1713)
    {
        _1819 = 1.0;
    }
    float _1823 = _1819;
    float _1825 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1827 = _1825 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1829 = _1823;
    if (!_1713)
    {
        _1829 = 7.345489978790283203125;
    }
    float _1831 = _1829;
    int _1833 = int(_1691) + int(_1783);
    float _1835 = in.m_54.z;
    float _1837 = _1831 * _168;
    float _1839 = 0.0;
    float _1841 = as_type<float>(_1833);
    if (_1713)
    {
        _1839 = 1.0;
    }
    float _1843 = _1839;
    int _1845 = _1629 * _1833;
    int _1847 = _1845 + _1653;
    float _1849 = _1843;
    if (_1713)
    {
        _1821 = 0;
    }
    int _1851 = _1821;
    float _1853 = floor(_1837);
    float _1855 = 0.0;
    int _1857 = _1851;
    if (_1713)
    {
        _1855 = _168;
    }
    float _1859 = _1855;
    float _1861 = _1859;
    if (!_1713)
    {
        _1849 = 1.2345600128173828125;
    }
    float _1863 = _1849;
    if (!_1713)
    {
        _1857 = 1;
    }
    int _1865 = _1857;
    if (!_1713)
    {
        _1861 = _1649;
    }
    float _1867 = _1861;
    float _1869 = 1.0 / _1827;
    bool _1871 = uint(_1847) >= uint(_1565);
    float _1873 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1875 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1873;
    float _1877 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1879 = _1877 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    bool _1881 = !_1817;
    int _1883 = _1881 ? 0 : (-1);
    float _1885 = _1863 * _1867;
    float _1887 = _1875 * _1663;
    float _1889 = _1879 * _1815;
    float _1891 = -_1853;
    float _1893 = _1837 + _1891;
    float _1895 = float(_1555);
    float _1897 = _168 + _1649;
    float _1899 = float(_1635);
    float _1901 = _1835 * 2.0;
    int _1903 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1905 = _1903 != 0;
    float _1907 = _1897 + (-1.0);
    bool _1909 = _1899 >= _1895;
    bool _1911 = isnan(_1899);
    bool _1913 = _1909 || _1911;
    bool _1915 = isnan(_1895);
    bool _1917 = _1913 || _1915;
    float _1919 = float(_1917);
    float _1921 = _1561 * _1869;
    float _1923 = _168 + _1835;
    float _1925 = floor(_1901);
    int _1927 = ~_1777;
    int _1929 = _1927 + _1883;
    int _1931 = _1929 + 1;
    float _1933 = _1757 * _144;
    bool _1935 = !_1905;
    int _1937 = _1935 ? 0 : 1;
    float _1939 = _1923 + (-1.0);
    int _1941 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1943 = _1941 != 0;
    int _1945 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1947 = _1945 != 0;
    int _1949 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1951 = _1949 != 0;
    float _1953 = _1835 + _1649;
    float _1955 = fma(_1907, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1957 = trunc(_1919);
    int _1959 = int(_1957);
    int _1961 = abs(_1937);
    int _1963 = _1555 * _1931;
    int _1965 = _1963 + _1635;
    bool _1967 = _1555 == 0;
    float _1969 = _1895 * _1933;
    bool _1971 = !_1871;
    int _1973 = _1971 ? 0 : (-1);
    float _1975 = _1953 + (-1.0);
    float _1977 = fma(_1939, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _1979 = _1925 > 0.0;
    float _1981 = _1893 * _1895;
    bool _1983 = _1925 >= 0.0;
    bool _1985 = isnan(_1925);
    bool _1987 = _1983 || _1985;
    bool _1989 = isnan(0.0);
    bool _1991 = _1987 || _1989;
    float _1993 = trunc(_1969);
    int _1995 = int(_1993);
    bool _1997 = !_1967;
    int _1999 = _1997 ? _1965 : (-1);
    float _2001 = fma(_1975, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2003 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2005 = _1000 + _2003;
    int _2007 = _1555 + (-1);
    int _2009 = ~_1959;
    int _2011 = _2009 + 1;
    int _2013 = _2011 + 1;
    float _2015 = fma(_1887, _2005, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    int _2017 = abs(_1571);
    float _2019 = trunc(_1981);
    int _2021 = int(_2019);
    bool _2023 = _1000 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _2025 = isnan(_1000);
    bool _2027 = _2023 || _2025;
    bool _2029 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _2031 = _2027 || _2029;
    float _2033 = float(_2031);
    int _2035 = _1999 * _2013;
    int _2037 = abs(_1589);
    int _2039 = _1959 * _2007;
    int _2041 = _2039 + _2035;
    bool _2043 = _1000 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2045 = isnan(_1000);
    bool _2047 = _2043 || _2045;
    bool _2049 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2051 = _2047 || _2049;
    float _2053 = float(_2051);
    float _2055 = -_2033;
    float _2057 = _2055 + 1.0;
    int _2059 = _2041 * _2017;
    bool _2061 = _1000 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2063 = isnan(_1000);
    bool _2065 = _2061 || _2063;
    bool _2067 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2069 = _2065 || _2067;
    float _2071 = float(_2069);
    float _2073 = -_2053;
    float _2075 = _2073 + 1.0;
    float _2077 = _2053 * _2057;
    int _2079 = _1995 * _2037;
    int _2081 = _2079 + _2059;
    bool _2083 = _1000 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2085 = isnan(_1000);
    bool _2087 = _2083 || _2085;
    bool _2089 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2091 = _2087 || _2089;
    float _2093 = float(_2091);
    float _2095 = _2071 * _2075;
    float _2097 = -_2071;
    float _2099 = _2097 + 1.0;
    int _2101 = abs(_1639);
    int _2103 = _2021 * _1961;
    int _2105 = _2103 + _1635;
    int _2107 = abs(_1643);
    float _2109 = _2093 * _2099;
    float _2111 = floor(_1885);
    int _2113 = _2105 * _2101;
    int _2115 = _2113 + _2081;
    float _2117 = _2015 * _2109;
    float _2119 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2121 = _1000 + _2119;
    float _2123 = -_2093;
    float _2125 = _2123 + 1.0;
    bool _2127 = !_1947;
    int _2129 = _2127 ? 0 : 1;
    int _2131 = _2021 * _2107;
    int _2133 = _2131 + _2115;
    float _2135 = fma(_1889, _2121, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    int _2137 = _1991 ? 0 : 1;
    float _2139 = fma(_2125, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2117);
    bool _2141 = _1865 != 1;
    float _2143 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2145 = _1000 + _2143;
    float _2147 = float(uint(_2133));
    float _2149 = fma(_2135, _2095, _2139);
    float _2151 = float(_1565);
    float _2153 = fma(_1921, _2145, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _2155 = float(_1653);
    float _2157 = as_type<float>(_1647) * _2147;
    float _2159 = -_2111;
    float _2161 = _1885 + _2159;
    bool _2163 = _2155 >= _2151;
    bool _2165 = isnan(_2155);
    bool _2167 = _2163 || _2165;
    bool _2169 = isnan(_2151);
    bool _2171 = _2167 || _2169;
    float _2173 = float(_2171);
    float _2175 = fma(_2153, _2077, _2149);
    float _2177 = trunc(_2157);
    float _2179 = precise::max(_2177, 0.0);
    uint _2181 = uint(_2179);
    float _2183 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2185 = (*spvDescriptorSet0.vp_c9)._m0[83].z;
    float _2187 = _2135;
    float _2189 = _2183;
    if (!_2141)
    {
        _2185 = _1835;
    }
    float _2191 = _2185;
    float _2193 = fma(_2033, (*spvDescriptorSet0.vp_c9)._m0[134].x, _2175);
    float _2195 = _2191;
    if (_2141)
    {
        _2195 = _1649;
    }
    float _2197 = _2195;
    float _2199 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _2201 = ~_2137;
    int _2203 = _2201 + 1;
    int _2205 = _2203 + 1;
    float _2207 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _308);
    float _2209 = trunc(_2173);
    int _2211 = int(_2209);
    int _2213 = ~_1555;
    int _2215 = _2213 + 1;
    float _2217 = fma(_2197, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2199);
    int _2219 = _2205;
    if (!_1979)
    {
        int _2221 = ~_2137;
        int _2223 = _2221 + 1;
        _2219 = _2223;
    }
    int _2225 = _2219;
    float _2227 = _2151 * _1933;
    float _2229 = _2161 * _2151;
    int _2231 = ~_1833;
    int _2233 = _2231 + _1973;
    int _2235 = _2233 + 1;
    float _2237 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2239 = log2(_2237);
    if (!_2141)
    {
        _2187 = _1649;
    }
    float _2241 = _2187;
    int _2243 = _2215 * int(_2181);
    int _2245 = _2243 + _2133;
    bool _2247 = _1565 == 0;
    int _2249 = _1565 * _2235;
    int _2251 = _2249 + _1653;
    float _2253 = _2241;
    if (_2141)
    {
        _2253 = _168;
    }
    float _2255 = _2253;
    int _2257 = abs(_2129);
    float _2259 = trunc(_2229);
    int _2261 = int(_2259);
    float _2263 = float(_1745);
    float _2265 = fma(_2255, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2183);
    float _2267 = float(uint(_2245));
    int _2269 = ~_2211;
    int _2271 = _2269 + 1;
    int _2273 = _2271 + 1;
    bool _2275 = !_2247;
    int _2277 = _2275 ? _2251 : (-1);
    float _2279 = as_type<float>(_1647) * _2267;
    if (!_2141)
    {
        _2189 = _1649;
    }
    float _2281 = _2189;
    float _2283 = _2239 * _144;
    int _2285 = _2277 * _2273;
    float _2287 = _2281;
    if (_2141)
    {
        _2287 = _168;
    }
    float _2289 = _2287;
    float _2291 = trunc(_2279);
    float _2293 = precise::max(_2291, 0.0);
    uint _2295 = uint(_2293);
    int _2297 = _1565 + (-1);
    float _2299 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _2301 = !_1951;
    int _2303 = _2301 ? 0 : 1;
    float _2305 = _2289 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (!_2141)
    {
        _1841 = _1835;
    }
    float _2307 = _1841;
    int _2309 = _2211 * _2297;
    int _2311 = _2309 + _2285;
    float _2313 = -_2299;
    float _2315 = fma(_2305, 2.0, _2313);
    float _2317 = _2307;
    if (_2141)
    {
        _2317 = _1649;
    }
    float _2319 = _2317;
    int _2321 = abs(_2303);
    float _2323 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2325 = trunc(_2227);
    int _2327 = int(_2325);
    float _2329 = _2319 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _2331 = abs(_1621);
    float _2333 = fma(_2329, -2.0, _2323);
    int _2335 = abs(_1813);
    int _2337 = abs(_1677);
    float _2339 = float(_2321);
    float _2341 = float(_1797);
    int _2343 = _2311 * _2331;
    float _2345 = -_144;
    float _2347 = fma(_2345, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1749);
    int _2349 = int(_2181) + int(_2295);
    float _2351 = _2339 * _2341;
    int _2353 = _2327 * _2337;
    int _2355 = _2353 + _2343;
    int _2357 = ~_1555;
    int _2359 = _2357 + 1;
    float _2361 = exp2(_2283);
    bool _2363 = !_1943;
    int _2365 = _2363 ? 0 : 1;
    int _2367 = _2261 * _2335;
    int _2369 = _2367 + _1653;
    bool _2371 = !_1609;
    int _2373 = _2371 ? 0 : 1;
    int _2375 = _2359 * _2349;
    int _2377 = _2375 + _2133;
    int _2379 = abs(_1761);
    float _2381 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2383 = 1.0 + _2381;
    int _2385 = abs(_2365);
    float _2387 = -_144;
    float _2389 = fma(_2387, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2315);
    bool _2391 = uint(_2377) >= uint(_1555);
    int _2393 = _2369 * _2379;
    int _2395 = _2393 + _2355;
    int _2397 = abs(_2373);
    float _2399 = float(_2385);
    float _2401 = float(_2225);
    float _2403 = -_2361;
    float _2405 = _2403 + 1.0;
    bool _2407 = !_2391;
    int _2409 = _2407 ? 0 : (-1);
    int _2411 = _2261 * _2397;
    int _2413 = _2411 + _2395;
    bool _2415 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2417 = isnan(0.0);
    bool _2419 = _2415 || _2417;
    bool _2421 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2423 = _2419 || _2421;
    float _2425 = _2399 * _2401;
    int _2427 = ~_2349;
    int _2429 = _2427 + _2409;
    int _2431 = _2429 + 1;
    float _2433 = 1.0 / _2383;
    float _2435 = in.m_73.x;
    float _2437 = in.m_73.y;
    float _2439 = in.m_73.z;
    float _2441 = float(uint(_2105));
    float _2443 = _2423 ? _2405 : 0.0;
    float _2445 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2265);
    float _2447 = float(uint(_2413));
    float _2449 = as_type<float>(_1647) * _2441;
    float _2451 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _2453 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2455 = isnan(1.0);
    bool _2457 = _2453 || _2455;
    bool _2459 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2461 = _2457 || _2459;
    float _2463 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1753);
    float _2465 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2217);
    float _2467 = as_type<float>(_1661) * _2447;
    float _2469 = trunc(_2449);
    float _2471 = precise::max(_2469, 0.0);
    uint _2473 = uint(_2471);
    float _2475 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2477 = float(_2257);
    float _2479 = fma(_1649, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2451);
    float _2481 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2333);
    float _2483 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2475);
    int _2485 = ~_1565;
    int _2487 = _2485 + 1;
    float _2489 = _2477 * _2263;
    float _2491 = trunc(_2467);
    float _2493 = precise::max(_2491, 0.0);
    uint _2495 = uint(_2493);
    float _2497 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2483);
    float _2499 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2479);
    if (_2461)
    {
        float _2501 = _2443 * _2433;
        _148 = _2501;
    }
    float _2503 = _148;
    int _2505 = ~_1555;
    int _2507 = _2505 + 1;
    float _2509 = _2489 * (-2.0);
    int _2511 = _1555 * _2431;
    int _2513 = _2511 + _2133;
    float _2515 = float(uint(_2369));
    float _2517 = _2425 * (-2.0);
    float _2519 = fma(_2509, _2437, _2437);
    int _2521 = _2507 * int(_2473);
    int _2523 = _2521 + _2105;
    float _2525 = _1649 + (-0.5);
    float _2527 = as_type<float>(_1661) * _2515;
    bool _2529 = !_1967;
    int _2531 = _2529 ? _2513 : (-1);
    float _2533 = fma(_2001, _2509, _2001);
    float _2535 = float(uint(_2523));
    int _2537 = _2487 * int(_2495);
    int _2539 = _2537 + _2413;
    float _2541 = fma(_2525, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2519);
    int _2543 = _2531 & 3;
    bool _2545 = _2543 != 0;
    float _2547 = trunc(_2527);
    float _2549 = precise::max(_2547, 0.0);
    uint _2551 = uint(_2549);
    float _2553 = as_type<float>(_1647) * _2535;
    float _2555 = float(uint(_2539));
    float _2557 = fma(_1955, _2517, _1955);
    float _2559 = fma(_2533, _2503, _2541);
    bool _2561 = !_2545;
    int _2563 = _2561 ? 0 : 1;
    float _2565 = fma(_2517, _2435, _2435);
    float _2567 = as_type<float>(_1661) * _2555;
    float _2569 = trunc(_2553);
    float _2571 = precise::max(_2569, 0.0);
    uint _2573 = uint(_2571);
    bool _2575 = uint(_2543) >= 2u;
    float _2577 = _168 + (-0.5);
    float _2579 = _2351 * (-2.0);
    int _2581 = _2531 & 3;
    bool _2583 = _2581 != 0;
    int _2585 = _2575 ? 0 : 1;
    float _2587 = fma(_2577, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2565);
    float _2589 = trunc(_2567);
    float _2591 = precise::max(_2589, 0.0);
    uint _2593 = uint(_2591);
    bool _2595 = _2543 != 3;
    float _2597 = fma(_2579, _2439, _2439);
    int _2599 = ~_1555;
    int _2601 = _2599 + 1;
    float _2603 = fma(_2557, _2503, _2587);
    int _2605 = ~_2585;
    int _2607 = _2605 + 1;
    int _2609 = _2607 + 1;
    float _2611 = fma(_1977, _2579, _1977);
    int _2613 = _2583 ? 0 : 1;
    int _2615 = int(_2473) + int(_2573);
    int _2617 = ~_1565;
    int _2619 = _2617 + 1;
    bool _2621 = uint(_2543) > 1u;
    int _2623 = _2601 * _2615;
    int _2625 = _2623 + _2105;
    float _2627 = _2603 * 0.15915493667125701904296875;
    int _2629 = int(_2495) + int(_2593);
    float _2631 = _1835 + (-0.5);
    int _2633 = _2609;
    if (_2595)
    {
        int _2635 = ~_2585;
        int _2637 = _2635 + 1;
        _2633 = _2637;
    }
    int _2639 = _2633;
    float _2641 = _2627 * 6.283185482025146484375;
    float _2643 = cos(_2641);
    bool _2645 = uint(_2625) >= uint(_1555);
    int _2647 = _2619 * _2629;
    int _2649 = _2647 + _2413;
    float _2651 = fma(_2631, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2597);
    int _2653 = ~_2613;
    int _2655 = _2653 + 1;
    int _2657 = _2655 + 1;
    float _2659 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _220);
    bool _2661 = !_2645;
    int _2663 = _2661 ? 0 : (-1);
    float _2665 = fma(_2611, _2503, _2651);
    bool _2667 = uint(_2649) >= uint(_1565);
    float _2669 = _2627 * 6.283185482025146484375;
    float _2671 = sin(_2669);
    int _2673 = ~_1565;
    int _2675 = _2673 + 1;
    float _2677 = _2665 * 0.15915493667125701904296875;
    bool _2679 = !_2667;
    int _2681 = _2679 ? 0 : (-1);
    float _2683 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    bool _2685 = _1649 > 0.5;
    float _2687 = _316 * _784;
    int _2689 = _2657;
    if (!_2621)
    {
        int _2691 = ~_2613;
        int _2693 = _2691 + 1;
        _2689 = _2693;
    }
    int _2695 = _2689;
    float _2697 = _2677 * 6.283185482025146484375;
    float _2699 = cos(_2697);
    bool _2701 = _2543 != 3;
    int _2703 = _2675 * int(_2551);
    int _2705 = _2703 + _2369;
    float _2707 = _2559 * 0.15915493667125701904296875;
    float _2709 = _1541 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _2711 = !_2701;
    int _2713 = _2711 ? 0 : (-1);
    float _2715 = _2687 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2717 = float(uint(_2705));
    float _2719 = _2707 * 6.283185482025146484375;
    float _2721 = cos(_2719);
    bool _2723 = _168 > 0.5;
    float _2725 = _2193 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _2727 = ~_2615;
    int _2729 = _2727 + _2663;
    int _2731 = _2729 + 1;
    float _2733 = as_type<float>(_1661) * _2717;
    int _2735 = ~_2629;
    int _2737 = _2735 + _2681;
    int _2739 = _2737 + 1;
    float _2741 = _2715 * _2207;
    out.m_75.w = _2725;
    float _2743 = _2707 * 6.283185482025146484375;
    float _2745 = sin(_2743);
    int _2747 = _1555 * _2731;
    int _2749 = _2747 + _2105;
    float _2751 = _2643 * _2699;
    float _2753 = _2671 * _2699;
    float _2755 = _2709 * _2659;
    int _2757 = abs(_2695);
    bool _2759 = !_1967;
    int _2761 = _2759 ? _2749 : (-1);
    float _2763 = trunc(_2733);
    float _2765 = precise::max(_2763, 0.0);
    uint _2767 = uint(_2765);
    float _2769 = _2671 * _2721;
    float _2771 = _2643 * _2721;
    float _2773 = _2721 * _2699;
    int _2775 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2777 = _2775 != 0;
    float _2779 = _2751 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2781 = ~_2757;
    int _2783 = _2781 + 1;
    int _2785 = _2783 + 1;
    float _2787 = _2677 * 6.283185482025146484375;
    float _2789 = sin(_2787);
    float _2791 = _2745 * _2699;
    float _2793 = _2671 * _2745;
    float _2795 = _2643 * _2745;
    int _2797 = _1565 * _2739;
    int _2799 = _2797 + _2413;
    float _2801 = _2751 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _2803 = !_2777;
    int _2805 = _2803 ? 0 : 1;
    int _2807 = int(_2551) + int(_2767);
    float _2809 = _2751 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2811 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2813 = _2811 != 0;
    float _2815 = _2751 * _2755;
    int _2817 = _2531 >> 31;
    int _2819 = abs(_2563);
    float _2821 = -_2795;
    float _2823 = fma(_2789, _2769, _2821);
    float _2825 = fma(_2789, _2771, _2793);
    float _2827 = -_2789;
    float _2829 = fma(_2827, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2779);
    float _2831 = -_2769;
    float _2833 = fma(_2789, _2795, _2831);
    float _2835 = fma(_2789, _2793, _2771);
    float _2837 = -_2789;
    float _2839 = fma(_2837, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2801);
    float _2841 = -_2789;
    float _2843 = fma(_2841, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2809);
    float _2845 = -_2755;
    float _2847 = _2789 * _2845;
    bool _2849 = !_2247;
    int _2851 = _2849 ? _2799 : (-1);
    float _2853 = _2753 * _2755;
    bool _2855 = !_2813;
    int _2857 = _2855 ? 0 : 1;
    float _2859 = fma(_2773, _2741, _2847);
    int _2861 = _2851 & 3;
    bool _2863 = _2861 != 0;
    float _2865 = fma(_2825, _2741, _2815);
    float _2867 = fma(_2823, _2741, _2853);
    int _2869 = _2817 & 3;
    float _2871 = fma(_2753, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2829);
    bool _2873 = !_2863;
    int _2875 = _2873 ? 0 : 1;
    float _2877 = fma(_2753, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2839);
    int _2879 = _2851 & 3;
    bool _2881 = _2879 != 0;
    float _2883 = fma(_2833, _2683, _2865);
    int _2885 = _2851 >> 31;
    float _2887 = fma(_2753, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2843);
    int _2889 = _2881 ? 0 : 1;
    float _2891 = fma(_2791, _2683, _2859);
    bool _2893 = uint(_2861) > 1u;
    float _2895 = _2883 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2897 = _2885 & 3;
    float _2899 = fma(_2835, _2683, _2867);
    int _2901 = _2531 + _2869;
    float _2903 = _2883 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2905 = _2851 + _2897;
    float _2907 = _2833 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2909 = _2901 >> 2;
    float _2911 = fma(_2891, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2903);
    int _2913 = ~_2889;
    int _2915 = _2913 + 1;
    int _2917 = _2915 + 1;
    float _2919 = fma(_2791, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2907);
    int _2921 = _2905 >> 2;
    float _2923 = fma(_2899, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2911);
    int _2925 = _2909 << 4;
    int _2927 = _2925 + 368;
    float _2929 = _2883 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2931 = _2917;
    if (!_2893)
    {
        int _2933 = ~_2889;
        int _2935 = _2933 + 1;
        _2931 = _2935;
    }
    int _2937 = _2931;
    float _2939 = fma(_2891, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2895);
    int _2941 = ~_1565;
    int _2943 = _2941 + 1;
    uint _2945 = uint(int(uint(_2927) >> uint(2)));
    uint _2947 = uint(int(uint(int(_2945)) >> uint(2)));
    int _2949 = int(_2945) & 3;
    float _2951 = (*spvDescriptorSet0.vp_c9)._m0[int(_2947)][_2949];
    int _2953 = int(_2945) + 1;
    uint _2955 = uint(int(uint(_2953) >> uint(2)));
    int _2957 = _2953 & 3;
    float _2959 = (*spvDescriptorSet0.vp_c9)._m0[int(_2955)][_2957];
    bool _2961 = uint(_2861) >= 2u;
    float _2963 = _2833 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2965 = _2921 << 4;
    int _2967 = _2965 + 512;
    int _2969 = _2943 * _2807;
    int _2971 = _2969 + _2369;
    int _2973 = _2961 ? 0 : 1;
    float _2975 = fma(_2899, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2939);
    bool _2977 = _2861 != 3;
    uint _2979 = uint(int(uint(_2967) >> uint(2)));
    uint _2981 = uint(int(uint(int(_2979)) >> uint(2)));
    int _2983 = int(_2979) & 3;
    float _2985 = (*spvDescriptorSet0.vp_c9)._m0[int(_2981)][_2983];
    int _2987 = int(_2979) + 1;
    uint _2989 = uint(int(uint(_2987) >> uint(2)));
    int _2991 = _2987 & 3;
    float _2993 = (*spvDescriptorSet0.vp_c9)._m0[int(_2989)][_2991];
    float _2995 = fma(_2791, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2963);
    float _2997 = _2975 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    bool _2999 = !_2977;
    int _3001 = _2999 ? 0 : (-1);
    float _3003 = _2923 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    bool _3005 = uint(_2971) >= uint(_1565);
    float _3007 = _2833 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3009 = _1034 + _2997;
    int _3011 = _2927 + 8;
    uint _3013 = uint(int(uint(_3011) >> uint(2)));
    uint _3015 = uint(int(uint(int(_3013)) >> uint(2)));
    int _3017 = int(_3013) & 3;
    float _3019 = (*spvDescriptorSet0.vp_c9)._m0[int(_3015)][_3017];
    int _3021 = int(_3013) + 1;
    uint _3023 = uint(int(uint(_3021) >> uint(2)));
    int _3025 = _3021 & 3;
    float _3027 = (*spvDescriptorSet0.vp_c9)._m0[int(_3023)][_3025];
    bool _3029 = !_3005;
    int _3031 = _3029 ? 0 : (-1);
    float _3033 = fma(_2791, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3007);
    float _3035 = _1030 + _3003;
    float _3037 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3039 = _3009 + _3037;
    float _3041 = fma(_2891, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2929);
    int _3043 = ~_2807;
    int _3045 = _3043 + _3031;
    int _3047 = _3045 + 1;
    float _3049 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3051 = _3035 + _3049;
    bool _3053 = _2861 != 3;
    int _3055 = _2967 + 8;
    uint _3057 = uint(int(uint(_3055) >> uint(2)));
    uint _3059 = uint(int(uint(int(_3057)) >> uint(2)));
    int _3061 = int(_3057) & 3;
    float _3063 = (*spvDescriptorSet0.vp_c9)._m0[int(_3059)][_3061];
    int _3065 = int(_3057) + 1;
    uint _3067 = uint(int(uint(_3065) >> uint(2)));
    int _3069 = _3065 & 3;
    float _3071 = (*spvDescriptorSet0.vp_c9)._m0[int(_3067)][_3069];
    float _3073 = fma(_2835, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3033);
    float _3075 = _3039 * _3039;
    int _3077 = abs(_2937);
    float _3079 = fma(_2835, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2995);
    float _3081 = fma(_2835, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2919);
    float _3083 = fma(_3051, _3051, _3075);
    int _3085 = abs(_2639);
    float _3087 = fma(_2899, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3041);
    int _3089 = ~_2973;
    int _3091 = _3089 + 1;
    int _3093 = _3091 + 1;
    float _3095 = sqrt(_3083);
    int _3097 = ~_3077;
    int _3099 = _3097 + 1;
    int _3101 = _3099 + 1;
    float _3103 = in.m_54.w;
    int _3105 = _3093;
    if (_3053)
    {
        int _3107 = ~_2973;
        int _3109 = _3107 + 1;
        _3105 = _3109;
    }
    int _3111 = _3105;
    int _3113 = ~_2819;
    int _3115 = _3113 + 1;
    int _3117 = _3115 + 1;
    int _3119 = abs(_2875);
    int _3121 = abs(_3111);
    int _3123 = ~_3119;
    int _3125 = _3123 + 1;
    int _3127 = _3125 + 1;
    int _3129 = _2785 * as_type<int>(_2959);
    int _3131 = abs(_2713);
    float _3133 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _3135 = int(_3133);
    bool _3137 = _3095 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _3139 = _3117 * as_type<int>(_2951);
    int _3141 = _3139 + _3129;
    int _3143 = ~_3131;
    int _3145 = _3143 + 1;
    int _3147 = _3145 + 1;
    int _3149 = _1565 * _3047;
    int _3151 = _3149 + _2369;
    int _3153 = _3101 * as_type<int>(_2993);
    int _3155 = ~_3085;
    int _3157 = _3155 + 1;
    int _3159 = _3157 + 1;
    int _3161 = _3127 * as_type<int>(_2985);
    int _3163 = _3161 + _3153;
    float _3165 = _3087 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _3167 = _3103 > 0.5;
    int _3169 = _3159 * as_type<int>(_3019);
    int _3171 = _3169 + _3141;
    float _3173 = as_type<float>(_3159);
    float _3175 = _3019;
    if (!_3137)
    {
        _3173 = _3035;
    }
    float _3177 = _3173;
    float _3179 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _3181 = int(_3179);
    float _3183 = _1024 + _3165;
    float _3185 = _3183;
    float _3187 = _3177;
    if (!_3137)
    {
        _3175 = _3009;
    }
    float _3189 = _3175;
    float _3191 = float(uint(_3135));
    int _3193 = ~_3121;
    int _3195 = _3193 + 1;
    int _3197 = _3195 + 1;
    bool _3199 = !_3137;
    float _3201 = _3189;
    if (!_3199)
    {
        float _3203 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3205 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3207 = _3095 + _3205;
        float _3209 = rsqrt(_3083);
        float _3211 = _3207 * _3203;
        float _3213 = _3183 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3215 = _3211 * 0.15915493667125701904296875;
        float _3217 = _3215 * 6.283185482025146484375;
        float _3219 = cos(_3217);
        float _3221 = _3215 * 6.283185482025146484375;
        float _3223 = sin(_3221);
        float _3225 = _3219 + (-1.0);
        float _3227 = fma(_3223, _3213, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3229 = _3225 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3231 = _3209 * _3227;
        float _3233 = fma(_3183, _3219, _3229);
        float _3235 = fma(_3051, _3231, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3237 = fma(_3039, _3231, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _3185 = _3233;
        _3201 = _3237;
        _3187 = _3235;
    }
    float _3239 = _3185;
    float _3241 = _3201;
    float _3243 = _3187;
    int _3245 = abs(_3001);
    int _3247 = _3147 * as_type<int>(_3027);
    int _3249 = _3247 + _3171;
    float _3251 = _220 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _3253 = _3197 * as_type<int>(_3063);
    int _3255 = _3253 + _3163;
    int _3257 = ~_3245;
    int _3259 = _3257 + 1;
    int _3261 = _3259 + 1;
    float _3263 = 1.0 / _3191;
    int _3265 = abs(_2857);
    float _3267 = fma(_3251, _3251, 1.0);
    int _3269 = abs(_2805);
    int _3271 = _3261 * as_type<int>(_3071);
    int _3273 = _3271 + _3255;
    int _3275 = abs(_3135);
    float _3277 = -_1024;
    float _3279 = _3277 + _3239;
    float _3281 = float(uint(_3181));
    float _3283 = rsqrt(_3267);
    int _3285 = ~_3269;
    int _3287 = _3285 + 1;
    int _3289 = _3287 + 1;
    float _3291 = -_1034;
    float _3293 = _3291 + _3241;
    int _3295 = ~_3265;
    int _3297 = _3295 + 1;
    int _3299 = _3297 + 1;
    int _3301 = _3249 * _3289;
    bool _3303 = !_2247;
    int _3305 = _3303 ? _3151 : (-1);
    float _3307 = 1.0 / _3281;
    int _3309 = abs(_3181);
    int _3311 = _3273 * _3299;
    float _3313 = float(uint(_3275));
    int _3315 = _2761 * _3269;
    int _3317 = _3315 + _3301;
    int _3319 = _3305 * _3265;
    int _3321 = _3319 + _3311;
    int _3323 = as_type<int>(_3263) + (-2);
    float _3325 = _3251 * _3283;
    float _3327 = float(uint(_3317));
    float _3329 = -_1030;
    float _3331 = _3329 + _3243;
    float _3333 = _3279 * _3279;
    float _3335 = -_3079;
    float _3337 = _3325 * _3335;
    float _3339 = -_3073;
    float _3341 = _3325 * _3339;
    float _3343 = as_type<float>(_3323) * _3327;
    float _3345 = -_3081;
    float _3347 = _3325 * _3345;
    float _3349 = 1.0 / _3313;
    float _3351 = fma(_3283, _2877, _3337);
    float _3353 = float(uint(_3309));
    float _3355 = fma(_3331, _3331, _3333);
    int _3357 = as_type<int>(_3307) + (-2);
    float _3359 = fma(_3283, _2871, _3341);
    float _3361 = float(uint(_3321));
    float _3363 = fma(_3293, _3293, _3355);
    float _3365 = trunc(_3343);
    float _3367 = precise::max(_3365, 0.0);
    uint _3369 = uint(_3367);
    int _3371 = abs(_3317);
    float _3373 = fma(_3283, _2887, _3347);
    int _3375 = ~_3135;
    int _3377 = _3375 + 1;
    float _3379 = float(uint(_3371));
    int _3381 = ~_3181;
    int _3383 = _3381 + 1;
    float _3385 = 1.0 / _3353;
    float _3387 = as_type<float>(_3357) * _3361;
    int _3389 = as_type<int>(_3349) + (-2);
    out.m_77.x = _3359;
    out.m_77.y = _3351;
    out.m_77.z = _3373;
    int _3391 = abs(_3321);
    float _3393 = as_type<float>(_3389) * _3379;
    float _3395 = sqrt(_3363);
    int _3397 = _3377 * int(_3369);
    int _3399 = _3397 + _3317;
    float _3401 = float(uint(_3391));
    float _3403 = float(uint(_3399));
    float _3405 = trunc(_3387);
    float _3407 = precise::max(_3405, 0.0);
    uint _3409 = uint(_3407);
    int _3411 = as_type<int>(_3385) + (-2);
    float _3413 = as_type<float>(_3323) * _3403;
    float _3415 = -_220;
    int _3417 = _2685 ? as_type<int>(_3415) : as_type<int>(_220);
    int _3419 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _3421 = _3419 != 0;
    float _3423 = trunc(_3393);
    float _3425 = precise::max(_3423, 0.0);
    uint _3427 = uint(_3425);
    bool _3429 = _3395 > 0.0;
    float _3431 = as_type<float>(_3411) * _3401;
    int _3433 = ~_3275;
    int _3435 = _3433 + 1;
    bool _3437 = !_3421;
    float _3439 = _3437 ? _220 : as_type<float>(_3417);
    int _3441 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _3443 = _3441 != 0;
    int _3445 = _3383 * int(_3409);
    int _3447 = _3445 + _3321;
    float _3449 = trunc(_3431);
    float _3451 = precise::max(_3449, 0.0);
    uint _3453 = uint(_3451);
    float _3455 = -_220;
    int _3457 = _3167 ? as_type<int>(_3455) : as_type<int>(_220);
    int _3459 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _3461 = _3459 != 0;
    float _3463 = float(uint(_3447));
    int _3465 = _3435 * int(_3427);
    int _3467 = _3465 + _3371;
    float _3469 = trunc(_3413);
    float _3471 = precise::max(_3469, 0.0);
    uint _3473 = uint(_3471);
    bool _3475 = !_3443;
    float _3477 = _3475 ? _220 : as_type<float>(_3457);
    float _3479 = as_type<float>(_3357) * _3463;
    bool _3481 = _1835 > 0.5;
    int _3483 = ~_3309;
    int _3485 = _3483 + 1;
    float _3487 = float(uint(_3467));
    bool _3489 = !_3429;
    float _3491 = _3243;
    float _3493 = _3239;
    float _3495 = _3241;
    float _3497 = as_type<float>(_3473);
    if (!_3489)
    {
        float _3499 = _274 * _274;
        float _3501 = rsqrt(_3363);
        float _3503 = fma(_282, _282, _3499);
        float _3505 = fma(_300, _300, _3503);
        float _3507 = sqrt(_3505);
        float _3509 = _3331 * _3501;
        float _3511 = _3279 * _3501;
        float _3513 = _3293 * _3501;
        bool _3515 = _3507 > 0.0;
        bool _3517 = !_3515;
        if (!_3517)
        {
            float _3519 = rsqrt(_3505);
            float _3521 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _3523 = _274 * _3519;
            float _3525 = _282 * _3519;
            float _3527 = _3511 * _3523;
            float _3529 = _300 * _3519;
            float _3531 = fma(_3509, _3525, _3527);
            float _3533 = _3521 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _3535 = fma(_3513, _3529, _3531);
            float _3537 = _3535 * _3533;
            float _3539 = fma(_282, _3537, _3243);
            float _3541 = fma(_274, _3537, _3239);
            float _3543 = fma(_300, _3537, _3241);
            _3491 = _3539;
            _3493 = _3541;
            _3495 = _3543;
        }
    }
    float _3545 = _3491;
    float _3547 = _3493;
    float _3549 = _3495;
    float _3551 = as_type<float>(_3389) * _3487;
    bool _3553 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _3555 = isnan(0.5);
    bool _3557 = _3553 || _3555;
    bool _3559 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _3561 = _3557 || _3559;
    float _3563 = trunc(_3479);
    float _3565 = precise::max(_3563, 0.0);
    uint _3567 = uint(_3565);
    int _3569 = _3485 * int(_3453);
    int _3571 = _3569 + _3391;
    float _3573 = _2825 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3575 = _2825 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3577 = _2825 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _3579 = int(_3369) + int(_3473);
    float _3581 = fma(_2773, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3573);
    float _3583 = float(uint(_3571));
    float _3585 = trunc(_3551);
    float _3587 = precise::max(_3585, 0.0);
    uint _3589 = uint(_3587);
    int _3591 = ~_3135;
    int _3593 = _3591 + 1;
    float _3595 = fma(_2773, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3575);
    float _3597 = fma(_2773, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3577);
    float _3599 = as_type<float>(_3411) * _3583;
    float _3601 = _3583;
    float _3603 = _3573;
    if (_3561)
    {
        _3497 = _3545;
    }
    float _3605 = _3497;
    float _3607 = _3605;
    if (_3561)
    {
        _3601 = _3547;
    }
    float _3609 = _3601;
    float _3611 = _3609;
    if (_3561)
    {
        _3603 = _3549;
    }
    float _3613 = _3603;
    float _3615 = _3613;
    if (!_3561)
    {
        float _3617 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _3619 = _1024 + _3617;
        float _3621 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _3623 = _1030 + _3621;
        float _3625 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3627 = -_1024;
        float _3629 = _3627 + _3547;
        float _3631 = _3619 * _3619;
        float _3633 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _3635 = _1034 + _3633;
        float _3637 = -_1034;
        float _3639 = _3637 + _3549;
        float _3641 = fma(_3623, _3623, _3631);
        float _3643 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3645 = fma(_3635, _3635, _3641);
        float _3647 = sqrt(_3645);
        float _3649 = _3625 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3651 = precise::min(_3647, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3653 = _3651 * _3643;
        float _3655 = _3649 * _3653;
        float _3657 = -_1030;
        float _3659 = _3657 + _3545;
        float _3661 = fma(_3629, _3655, _1024);
        float _3663 = fma(_3659, _3655, _1030);
        float _3665 = fma(_3639, _3655, _1034);
        _3611 = _3661;
        _3607 = _3663;
        _3615 = _3665;
    }
    float _3667 = _3611;
    float _3669 = _3607;
    float _3671 = _3615;
    int _3673 = ~_3181;
    int _3675 = _3673 + 1;
    float _3677 = trunc(_3599);
    float _3679 = precise::max(_3677, 0.0);
    uint _3681 = uint(_3679);
    int _3683 = int(_3409) + int(_3567);
    float _3685 = _3667 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    int _3687 = int(_3427) + int(_3589);
    int _3689 = _3593 * _3579;
    int _3691 = _3689 + _3317;
    int _3693 = ~_3309;
    int _3695 = _3693 + 1;
    int _3697 = _3675 * _3683;
    int _3699 = _3697 + _3321;
    float _3701 = _3667 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3703 = fma(_3669, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3685);
    bool _3705 = uint(_3691) >= uint(_3135);
    float _3707 = -_2445;
    float _3709 = _3707 + 1.0;
    float _3711 = fma(_3669, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3701);
    float _3713 = fma(_3671, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3703);
    int _3715 = ~_3275;
    int _3717 = _3715 + 1;
    float _3719 = -_2497;
    float _3721 = _3719 + 1.0;
    float _3723 = fma(_3671, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3711);
    float _3725 = _3713 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    int _3727 = int(_3453) + int(_3681);
    int _3729 = _3717 * _3687;
    int _3731 = _3729 + _3371;
    float _3733 = _3723 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3735 = _3725 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _3737 = !_3705;
    int _3739 = _3737 ? 0 : (-1);
    float _3741 = _3725 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    bool _3743 = uint(_3699) >= uint(_3181);
    float _3745 = fma(_3733, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3735);
    int _3747 = _3695 * _3727;
    int _3749 = _3747 + _3391;
    int _3751 = ~_3579;
    int _3753 = _3751 + _3739;
    int _3755 = _3753 + 1;
    float _3757 = _3725 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    bool _3759 = !_3743;
    int _3761 = _3759 ? 0 : (-1);
    float _3763 = _3725 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _3765 = uint(_3731) >= uint(_3275);
    float _3767 = _3667 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    int _3769 = ~_3683;
    int _3771 = _3769 + _3761;
    int _3773 = _3771 + 1;
    float _3775 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _3777 = -_308;
    int _3779 = _2723 ? as_type<int>(_3777) : as_type<int>(_308);
    float _3781 = fma(_3669, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3767);
    int _3783 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _3785 = _3783 != 0;
    int _3787 = _3181 * _3773;
    int _3789 = _3787 + _3321;
    float _3791 = fma(_3733, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3757);
    int _3793 = _3135 * _3755;
    int _3795 = _3793 + _3317;
    bool _3797 = _3135 == 0;
    float _3799 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _3801 = _3317 ^ _3135;
    float _3803 = fma(_3733, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3741);
    bool _3805 = !_3785;
    float _3807 = _3805 ? _308 : as_type<float>(_3779);
    float _3809 = fma(_3733, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3763);
    bool _3811 = uint(_3749) >= uint(_3309);
    float _3813 = fma(_3671, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3781);
    int _3815 = _3321 ^ _3181;
    float _3817 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _3819 = !_3765;
    int _3821 = _3819 ? 0 : (-1);
    float _3823 = _3813 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _3825 = !_3797;
    int _3827 = _3825 ? _3795 : (-1);
    float _3829 = _3775 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    uint _3831 = uint(int(uint(_3801) >> uint(31)));
    float _3833 = -_2465;
    float _3835 = _3833 + 1.0;
    bool _3837 = _3181 == 0;
    float _3839 = _3251 * _2877;
    bool _3841 = !_3811;
    int _3843 = _3841 ? 0 : (-1);
    float _3845 = _3251 * _2887;
    uint _3847 = uint(int(uint(_3815) >> uint(31)));
    int _3849 = ~_3821;
    int _3851 = _3687 + _3849;
    int _3853 = _3851 + 1;
    int _3855 = ~int(_3831);
    int _3857 = _3855 + 1;
    bool _3859 = !_3837;
    int _3861 = _3859 ? _3789 : (-1);
    bool _3863 = _3181 == 0;
    float _3865 = fma(_3823, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3803);
    int _3867 = ~_3843;
    int _3869 = _3727 + _3867;
    int _3871 = _3869 + 1;
    float _3873 = fma(_3823, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3745);
    int _3875 = ~int(_3847);
    int _3877 = _3875 + 1;
    float _3879 = fma(_3823, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3809);
    bool _3881 = _3135 == 0;
    float _3883 = fma(_3823, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3791);
    int _3885 = _3853 ^ _3857;
    float _3887 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _3889 = float(_3827);
    float _3891 = _3807 + 0.5;
    int _3893 = _3871 ^ _3877;
    float _3895 = float(_3861);
    float _3897 = _3799 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _3899 = ~_3857;
    int _3901 = _3899 + _3885;
    int _3903 = _3901 + 1;
    float _3905 = fma(_3829, _3889, _2347);
    int _3907 = ~_3877;
    int _3909 = _3907 + _3893;
    int _3911 = _3909 + 1;
    float _3913 = fma(_3897, _3895, _2389);
    float _3915 = _3667 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3917 = _3817 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _3919 = !_3881;
    int _3921 = _3919 ? _3903 : (-1);
    float _3923 = fma(_3829, _3891, _3905);
    float _3925 = -_308;
    int _3927 = _3481 ? as_type<int>(_3925) : as_type<int>(_308);
    float _3929 = abs(_1106);
    float _3931 = log2(_3929);
    float _3933 = fma(_3669, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3915);
    float _3935 = float(_3921);
    float _3937 = _3887 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _3939 = !_3863;
    int _3941 = _3939 ? _3911 : (-1);
    float _3943 = fma(_3671, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3933);
    bool _3945 = !_3461;
    float _3947 = _3945 ? _308 : as_type<float>(_3927);
    float _3949 = -_2463;
    float _3951 = fma(_3917, _3935, _3949);
    float _3953 = float(_3941);
    float _3955 = _3943 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3957 = _3477 + (-0.5);
    float _3959 = _3947 + 0.5;
    float _3961 = -_3721;
    float _3963 = fma(_3807, _3961, _3923);
    float _3965 = -_2481;
    float _3967 = fma(_3937, _3953, _3965);
    float _3969 = _3439 + (-0.5);
    float _3971 = fma(_3897, _3959, _3913);
    float _3973 = fma(_3955, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3873);
    float _3975 = fma(_3955, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3879);
    float _3977 = fma(_3955, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3865);
    float _3979 = -_2499;
    float _3981 = _3979 + 1.0;
    float _3983 = _3931 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3985 = -_3709;
    float _3987 = fma(_3947, _3985, _3971);
    float _3989 = -_3917;
    float _3991 = fma(_3989, _3969, _3951);
    float _3993 = _3973 + _3975;
    float _3995 = -_3937;
    float _3997 = fma(_3995, _3957, _3967);
    float _3999 = fma(_3439, _3981, _3991);
    float _4001 = _3993 * 0.5;
    float _4003 = exp2(_3983);
    float _4005 = fma(_3477, _3835, _3997);
    float _4007 = fma(_2823, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3581);
    float _4009 = fma(_2823, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3595);
    float _4011 = fma(_2823, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3597);
    out.m_79.z = _4001;
    out.m_79.w = _3975;
    bool _4013 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _4015 = isnan(0.5);
    bool _4017 = _4013 || _4015;
    bool _4019 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _4021 = _4017 || _4019;
    float _4023 = fma(_3955, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3883);
    out.m_81.x = _3963;
    out.m_81.y = _3999;
    out.m_81.z = _3987;
    out.m_81.w = _4005;
    out.m_83.x = _4007;
    out.m_83.y = _4009;
    out.m_83.z = _4011;
    float _4025 = fma(_4003, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4027 = precise::clamp(_4025, 0.0, 1.0);
    out.gl_Position.x = _3977;
    out.gl_Position.y = _4023;
    out.gl_Position.z = _3973;
    out.gl_Position.w = _3975;
    float _4029 = fma(_4027, -2.0, 3.0);
    float _4031 = _4027 * _4027;
    float _4033 = _4031 * _4029;
    float _4035 = _3251 * _2871;
    float _4037 = _308 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _4039 = _3977;
    float _4041 = _4023;
    float _4043 = _4035;
    if (_4021)
    {
        _4039 = 1.0;
    }
    float _4045 = _4039;
    float _4047 = _4045;
    if (_4021)
    {
        _4041 = 1.0;
    }
    float _4049 = _4041;
    float _4051 = _4049;
    if (!_4021)
    {
        float _4053 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4055 = _4053 * 0.15915493667125701904296875;
        float _4057 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4059 = _4055 * 6.283185482025146484375;
        float _4061 = cos(_4059);
        float _4063 = _4057 * 0.15915493667125701904296875;
        float _4065 = _4055 * 6.283185482025146484375;
        float _4067 = sin(_4065);
        float _4069 = 1.0 / _4061;
        float _4071 = _4063 * 6.283185482025146484375;
        float _4073 = cos(_4071);
        float _4075 = _4067 * _4069;
        float _4077 = _4063 * 6.283185482025146484375;
        float _4079 = sin(_4077);
        float _4081 = _4073 * _4075;
        float _4083 = 1.0 / _4081;
        float _4085 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4087 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _4085;
        float _4089 = 1.0 / _4087;
        float _4091 = _4079 * _4083;
        float _4093 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4095 = fma(_1106, _4091, _4093);
        float _4097 = _4095 * _4089;
        float _4099 = precise::clamp(_4097, 0.0, 1.0);
        _4051 = _4099;
    }
    float _4101 = _4051;
    if (!_4021)
    {
        float _4103 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4105 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4107 = _4103 * 0.15915493667125701904296875;
        float _4109 = _4105 * 0.15915493667125701904296875;
        float _4111 = _4107 * 6.283185482025146484375;
        float _4113 = cos(_4111);
        float _4115 = _4107 * 6.283185482025146484375;
        float _4117 = sin(_4115);
        float _4119 = 1.0 / _4113;
        float _4121 = _4109 * 6.283185482025146484375;
        float _4123 = cos(_4121);
        float _4125 = _4117 * _4119;
        float _4127 = _4109 * 6.283185482025146484375;
        float _4129 = sin(_4127);
        float _4131 = _4123 * _4125;
        float _4133 = 1.0 / _4131;
        float _4135 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _4137 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _4135;
        float _4139 = 1.0 / _4137;
        float _4141 = _4129 * _4133;
        float _4143 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _4145 = fma(_1106, _4141, _4143);
        float _4147 = _4145 * _4139;
        float _4149 = precise::clamp(_4147, 0.0, 1.0);
        float _4151 = -_4149;
        float _4153 = _4151 + 1.0;
        _4047 = _4153;
    }
    float _4155 = _4047;
    bool _4157 = _1185 != 0;
    float _4159 = -_4033;
    float _4161 = _4159 + 1.0;
    float _4163 = _4101 * _4155;
    float _4165 = fma(_4037, _4007, _4035);
    bool _4167 = _1106 <= 8000.0;
    bool _4169 = isnan(_1106);
    bool _4171 = _4167 || _4169;
    bool _4173 = isnan(8000.0);
    bool _4175 = _4171 || _4173;
    float _4177 = float(_4175);
    float _4179 = fma(_4161, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4033);
    float _4181 = fma(_4037, _4009, _3839);
    float _4183 = _4163 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _4185 = fma(_4037, _4011, _3845);
    float _4187 = _3079 + _4181;
    float _4189 = _4177 * _4179;
    float _4191 = _316 * _4183;
    float _4193 = _3073 + _4165;
    float _4195 = _3081 + _4185;
    if (_4157)
    {
        _4043 = 1.0;
    }
    float _4197 = _4043;
    float _4199 = _4197;
    if (!_4157)
    {
        int _4201 = _1211 << 4;
        int _4203 = _4201 + 2048;
        uint _4205 = uint(int(uint(_4203) >> uint(2)));
        uint _4207 = uint(int(uint(int(_4205)) >> uint(2)));
        int _4209 = int(_4205) & 3;
        float _4211 = (*spvDescriptorSet0.vp_c15)._m0[int(_4207)][_4209];
        int _4213 = int(_4205) + 1;
        uint _4215 = uint(int(uint(_4213) >> uint(2)));
        int _4217 = _4213 & 3;
        float _4219 = (*spvDescriptorSet0.vp_c15)._m0[int(_4215)][_4217];
        int _4221 = _4203 + 8;
        uint _4223 = uint(int(uint(_4221) >> uint(2)));
        uint _4225 = uint(int(uint(int(_4223)) >> uint(2)));
        int _4227 = int(_4223) & 3;
        float _4229 = (*spvDescriptorSet0.vp_c15)._m0[int(_4225)][_4227];
        int _4231 = int(_4223) + 1;
        uint _4233 = uint(int(uint(_4231) >> uint(2)));
        int _4235 = _4231 & 3;
        float _4237 = (*spvDescriptorSet0.vp_c15)._m0[int(_4233)][_4235];
        float _4239 = _1036 * _4219;
        float _4241 = fma(_1030, _4211, _4239);
        float _4243 = fma(_1034, _4229, _4241);
        float _4245 = _4243 + _4237;
        float _4247 = precise::clamp(_4245, 0.0, 1.0);
        float _4249 = -_4247;
        float _4251 = _4249 + _1517;
        float _4253 = fma(_4251, 500.0, 1.5);
        float _4255 = exp2(_4253);
        float _4257 = 0.0 + _4255;
        float _4259 = precise::clamp(_4257, 0.0, 1.0);
        _4199 = _4259;
    }
    float _4261 = _4199;
    bool _4263 = _1447 != 0;
    float _4265 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4267 = _3667 + _4265;
    float _4269 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4271 = _3669 + _4269;
    float _4273 = _4189 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _4275 = -_1509;
    float _4277 = _4275 + 1.0;
    float _4279 = _4267 * _4267;
    out.m_85.x = _4193;
    out.m_85.y = _4187;
    out.m_85.z = _4195;
    float _4281 = _4277 * _4273;
    float _4283 = precise::clamp(_4281, 0.0, 1.0);
    float _4285 = fma(_4271, _4271, _4279);
    float _4287 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4289 = _3671 + _4287;
    out.m_87.x = _3669;
    out.m_87.y = _3667;
    out.m_87.z = _3671;
    float _4291 = -_4283;
    float _4293 = fma(_4291, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4295 = _4271;
    if (!_4263)
    {
        _4295 = 1.0;
    }
    float _4297 = _4295;
    float _4299 = fma(_4289, _4289, _4285);
    float _4301 = _4297;
    if (_4263)
    {
        bool _4303 = _1523 >= _1507;
        bool _4305 = isnan(_1523);
        bool _4307 = _4303 || _4305;
        bool _4309 = isnan(_1507);
        bool _4311 = _4307 || _4309;
        float _4313 = float(_4311);
        _4301 = _4313;
    }
    float _4315 = _4301;
    float _4317 = _4315 * _4261;
    float _4319 = sqrt(_4299);
    float _4321 = -_4317;
    float _4323 = fma(_4321, _4293, 1.0);
    float _4325 = precise::clamp(_4323, 0.0, 1.0);
    float _4327 = _4325 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_89.x = _4327;
    bool _4329 = _4319 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4331 = isnan(_4319);
    bool _4333 = _4329 || _4331;
    bool _4335 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4337 = _4333 || _4335;
    float _4339 = _4315;
    float _4341 = _4325;
    if (!_4337)
    {
        _4339 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4343 = _4339;
    float _4345 = _4343;
    float _4347 = _4343;
    if (!_4337)
    {
        _4341 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4349 = _4341;
    float _4351 = _4349;
    float _4353 = _4349;
    if (!_4337)
    {
        _1513 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4355 = _1513;
    bool _4357 = !_4337;
    float _4359 = _4355;
    float _4361 = _4355;
    if (!_4357)
    {
        bool _4363 = _4319 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4365 = isnan(_4319);
        bool _4367 = _4363 || _4365;
        bool _4369 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4371 = _4367 || _4369;
        if (!_4371)
        {
            float _4373 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4375 = _4319 + _4373;
            float _4377 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4379 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4377;
            float _4381 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4383 = _4381 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4385 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4387 = _4385 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4389 = 1.0 / _4379;
            float _4391 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4393 = _4391 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4395 = _4375 * _4389;
            float _4397 = precise::clamp(_4395, 0.0, 1.0);
            float _4399 = fma(_4397, _4383, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4401 = fma(_4397, _4387, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4403 = fma(_4397, _4393, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            _4353 = _4401;
            _4347 = _4399;
            _4361 = _4403;
            _4405 = true;
        }
        else
        {
            bool _4407 = _4319 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4409 = isnan(_4319);
            bool _4411 = _4407 || _4409;
            bool _4413 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4415 = _4411 || _4413;
            if (!_4415)
            {
                _4345 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4417 = _4345;
            _4347 = _4417;
            if (!_4415)
            {
                _4351 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4419 = _4351;
            _4353 = _4419;
            if (!_4415)
            {
                _4359 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4421 = _4359;
            bool _4423 = !_4415;
            _4361 = _4421;
            if (!_4423)
            {
                bool _4425 = _4319 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4427 = isnan(_4319);
                bool _4429 = _4425 || _4427;
                bool _4431 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4433 = _4429 || _4431;
                if (!_4433)
                {
                    float _4435 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4437 = _4319 + _4435;
                    float _4439 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4441 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4439;
                    float _4443 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4445 = _4443 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4447 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4449 = _4447 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4451 = 1.0 / _4441;
                    float _4453 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4455 = _4453 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4457 = _4437 * _4451;
                    float _4459 = precise::clamp(_4457, 0.0, 1.0);
                    float _4461 = fma(_4459, _4445, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4463 = fma(_4459, _4449, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4465 = fma(_4459, _4455, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    _4353 = _4463;
                    _4347 = _4461;
                    _4361 = _4465;
                    _4405 = true;
                }
                else
                {
                    _4353 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4347 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4361 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _4405 = false;
    float _4467 = _4353;
    float _4469 = _4347;
    float _4471 = _4361;
    float _4473 = _4191 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_91.x = 0.0;
    float _4475 = _4467 * 0.586610972881317138671875;
    bool _4477 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_50.x = _4473;
    float _4479 = fma(_4469, 0.298911988735198974609375, _4475);
    bool _4481 = _4101 > 0.0;
    bool _4483 = isnan(_4101);
    bool _4485 = _4481 || _4483;
    bool _4487 = isnan(0.0);
    bool _4489 = _4485 || _4487;
    float _4491 = fma(_4471, 0.114477999508380889892578125, _4479);
    bool _4493 = _4155 <= 0.0;
    bool _4495 = !_4489;
    bool _4497 = _4493 || _4495;
    float _4499 = -_4491;
    float _4501 = _4499 + _4469;
    float _4503 = -_4491;
    float _4505 = _4503 + _4467;
    float _4507 = -_4491;
    float _4509 = _4507 + _4471;
    float _4511 = fma(_4501, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4491);
    float _4513 = fma(_4505, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4491);
    float _4515 = fma(_4509, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4491);
    bool _4517 = !_4477;
    if (!_4517)
    {
        float _4519 = -_3667;
        float _4521 = _4519 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4523 = -_3669;
        float _4525 = _4523 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4527 = -_3671;
        float _4529 = _4527 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4531 = _4521 * _4521;
        float _4533 = fma(_4525, _4525, _4531);
        float _4535 = fma(_4529, _4529, _4533);
        float _4537 = sqrt(_4535);
        float _4539 = rsqrt(_4535);
        float _4541 = -_4537;
        float _4543 = _4541 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4545 = _4543 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4547 = precise::clamp(_4545, 0.0, 1.0);
        float _4549 = _4525 * _4539;
        float _4551 = _4521 * _4539;
        float _4553 = abs(_4547);
        float _4555 = log2(_4553);
        float _4557 = _4529 * _4539;
        float _4559 = _4549 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4561 = _4187 * _4551;
        float _4563 = -_4551;
        float _4565 = -_4559;
        float _4567 = fma(_4563, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4565);
        float _4569 = fma(_4193, _4549, _4561);
        float _4571 = -_4557;
        float _4573 = fma(_4571, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4567);
        float _4575 = fma(_4195, _4557, _4569);
        float _4577 = precise::clamp(_4575, 0.0, 1.0);
        float _4579 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4581 = _4573 + _4579;
        float _4583 = _4555 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4585 = _4581 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4587 = precise::clamp(_4585, 0.0, 1.0);
        float _4589 = exp2(_4583);
        float _4591 = _4589 * _4587;
        float _4593 = _4577 * _4591;
        float _4595 = _4593 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4597 = _4593 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4599 = _4593 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_91.x = _4595;
        out.m_91.y = _4597;
        out.m_91.z = _4599;
    }
    out.m_93.x = _4511;
    out.m_93.y = _4513;
    out.m_93.z = _4515;
    if (!_4497)
    {
        return out;
    }
    out.m_50.x = 0.0;
    float _4601 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4601;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint dm_vid = gl_VertexIndex;
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4405 = false;
    bool _992 = false;
    bool _814 = false;
    bool _528 = false;
    bool _336 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _107 = in.m_47.w;
    float _109 = trunc(_107);
    int _112 = int(_109);
    bool _116 = _112 >= 1;
    float _118 = 0.0;
    if (!_116)
    {
        _118 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _120 = _118;
    float _122 = _120;
    if (!_116)
    {
        out.m_50.x = 0.0;
    }
    int _124 = 0;
    if (!_116)
    {
        float _126 = _120 * 5.0;
        _124 = as_type<int>(_126);
    }
    int _128 = _124;
    if (!_116)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4657 = as_type<float>(_128);
        out.gl_Position.z = _4657;
    }
    if (!_116)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _130 = in.m_52.w;
    bool _132 = _130 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _134 = isnan(_130);
    bool _136 = _132 || _134;
    bool _138 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _140 = _136 || _138;
    float _142 = -_130;
    float _144 = _142 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _146 = 0.0;
    float _148 = _144;
    if (_140)
    {
        float _150 = float(_112);
        _146 = _150;
    }
    float _152 = _146;
    bool _154 = _144 >= _152;
    bool _156 = !_140;
    bool _158 = _154 || _156;
    if (_158)
    {
        _122 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _160 = _122;
    if (_158)
    {
        out.m_50.x = 0.0;
    }
    int _162 = 0;
    if (_158)
    {
        float _164 = _160 * 5.0;
        _162 = as_type<int>(_164);
    }
    int _166 = _162;
    if (_158)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4726 = as_type<float>(_166);
        out.gl_Position.z = _4726;
    }
    if (_158)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _168 = in.m_54.x;
    float _170 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _172 = _144 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _174 = as_type<float>(int(gl_VertexIndex));
    float _176 = in.m_59.x;
    float _178 = in.m_59.y;
    float _180 = in.m_59.z;
    float _182 = in.m_61.x;
    float _184 = in.m_61.y;
    float _186 = in.m_61.z;
    float _188 = in.m_63.x;
    float _190 = in.m_63.y;
    float _192 = in.m_63.z;
    float _194 = _172 * _170;
    float _196 = in.m_65.x;
    float _198 = in.m_65.y;
    float _200 = in.m_65.z;
    float _202 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[20].x, _194);
    int _204 = as_type<int>(_174) & 1;
    bool _206 = _204 != 0;
    int _208 = as_type<int>(_174) & 2;
    bool _210 = _208 != 0;
    float _212 = _202 * 6.283185482025146484375;
    float _214 = floor(_202);
    float _216 = _212 * 0.15915493667125701904296875;
    bool _218 = !_210;
    float _220 = _218 ? (-0.5) : 0.5;
    int _222 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _224 = _222 != 0;
    int _226 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _228 = _226 != 0;
    float _230 = _178 * _184;
    int _232 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _234 = _232 != 0;
    float _236 = _216 * 6.283185482025146484375;
    float _238 = cos(_236);
    float _240 = _178 * _190;
    bool _242 = !_224;
    int _244 = _242 ? 0 : 1;
    float _246 = fma(_176, _182, _230);
    bool _248 = !_234;
    int _250 = _248 ? 0 : 1;
    float _252 = _178 * _198;
    int _254 = abs(_244);
    float _256 = -_214;
    float _258 = _202 + _256;
    int _260 = abs(_250);
    float _262 = fma(_176, _188, _240);
    float _264 = fma(_176, _196, _252);
    float _266 = -_258;
    float _268 = fma(_266, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _270 = !_228;
    int _272 = _270 ? 0 : 1;
    float _274 = fma(_180, _186, _246);
    float _276 = float(_254);
    float _278 = fma(_238, 0.5, 0.5);
    bool _280 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _282 = fma(_180, _192, _262);
    int _284 = abs(_272);
    float _286 = abs(_268);
    float _288 = _276 * _286;
    bool _290 = _258 < 0.5;
    float _292 = float(_290);
    float _294 = -_278;
    float _296 = fma(_294, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _298 = float(_260);
    float _300 = fma(_180, _200, _264);
    float _302 = -_292;
    float _304 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _306 = !_206;
    float _308 = _306 ? (-0.5) : 0.5;
    float _310 = fma(_298, _296, _288);
    float _312 = float(_284);
    float _314 = abs(_304);
    float _316 = fma(_312, _314, _310);
    bool _318 = !_280;
    float _334;
    if (!_318)
    {
        float _320 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _322 = _168 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _324 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[12].x, _144);
        float _326 = _324 * _320;
        float _328 = floor(_326);
        float _330 = -_328;
        float _332 = _326 + _330;
        _334 = _332;
        _336 = true;
    }
    else
    {
        float _338 = float(_112);
        float _340 = 1.0 / _338;
        float _342 = _144 * _340;
        _334 = _342;
    }
    _336 = false;
    float _344 = _334;
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _348 = _344 + _346;
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _352 = _344 + _350;
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _356 = _344 + _354;
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _360 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _358;
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _364 = _362 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _366 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _368 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _366;
    bool _370 = _344 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _372 = isnan(_344);
    bool _374 = _370 || _372;
    bool _376 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _378 = _374 || _376;
    float _380 = float(_378);
    float _382 = 1.0 / _360;
    bool _384 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _386 = 1.0 / _368;
    float _388 = 1.0 / _364;
    float _390 = _348 * _382;
    bool _392 = _344 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _394 = isnan(_344);
    bool _396 = _392 || _394;
    bool _398 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _400 = _396 || _398;
    float _402 = float(_400);
    float _404 = -_380;
    float _406 = _404 + 1.0;
    float _408 = _402 * _406;
    float _410 = _352 * _386;
    bool _412 = _344 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _414 = isnan(_344);
    bool _416 = _412 || _414;
    bool _418 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _420 = _416 || _418;
    float _422 = float(_420);
    float _424 = -_402;
    float _426 = _424 + 1.0;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _430 = _428 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _432 = _422 * _426;
    float _434 = -_422;
    float _436 = _434 + 1.0;
    float _438 = _356 * _388;
    bool _440 = _344 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _442 = isnan(_344);
    bool _444 = _440 || _442;
    bool _446 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _448 = _444 || _446;
    float _450 = float(_448);
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _454 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _452;
    float _456 = fma(_430, _438, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _460 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _458;
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _464 = _462 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _466 = fma(_454, _390, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _468 = _450 * _436;
    float _470 = fma(_460, _390, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _472 = fma(_464, _438, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _474 = -_450;
    float _476 = _474 + 1.0;
    float _478 = _466 * _468;
    float _480 = _470 * _468;
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _484 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _482;
    float _486 = fma(_476, (*spvDescriptorSet0.vp_c9)._m0[143].x, _478);
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _490 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _488;
    float _492 = fma(_476, (*spvDescriptorSet0.vp_c9)._m0[143].y, _480);
    float _494 = fma(_484, _410, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _496 = fma(_456, _432, _486);
    float _498 = fma(_490, _410, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _500 = fma(_472, _432, _492);
    float _502 = fma(_494, _408, _496);
    float _504 = fma(_498, _408, _500);
    float _506 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[146].x, _502);
    float _508 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[146].y, _504);
    bool _510 = !_384;
    float _526;
    if (!_510)
    {
        float _512 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _514 = _168 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _516 = fma(_514, (*spvDescriptorSet0.vp_c9)._m0[11].x, _144);
        float _518 = _516 * _512;
        float _520 = floor(_518);
        float _522 = -_520;
        float _524 = _518 + _522;
        _526 = _524;
        _528 = true;
    }
    else
    {
        float _530 = float(_112);
        float _532 = 1.0 / _530;
        float _534 = _144 * _532;
        _526 = _534;
    }
    _528 = false;
    float _536 = _526;
    float _538 = in.m_67.x;
    float _540 = in.m_67.y;
    float _542 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _544 = _536 + _542;
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _548 = _536 + _546;
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _552 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _550;
    float _554 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _556 = _554 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _558 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _560 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _558;
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _564 = _562 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _566 = 1.0 / _552;
    bool _568 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _570 = 1.0 / _556;
    float _572 = 1.0 / _564;
    float _574 = _508 * _540;
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _578 = _536 + _576;
    float _580 = _548 * _566;
    bool _582 = _536 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _584 = isnan(_536);
    bool _586 = _582 || _584;
    bool _588 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _590 = _586 || _588;
    float _592 = float(_590);
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _596 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _594;
    float _598 = 1.0 / _560;
    float _600 = _544 * _570;
    bool _602 = _536 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _604 = isnan(_536);
    bool _606 = _602 || _604;
    bool _608 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _610 = _606 || _608;
    float _612 = float(_610);
    float _614 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _616 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _614;
    float _618 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _620 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _618;
    float _622 = -_612;
    float _624 = _622 + 1.0;
    float _626 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _628 = _536 + _626;
    float _630 = _592 * _624;
    float _632 = -_592;
    float _634 = _632 + 1.0;
    float _636 = _628 * _572;
    bool _638 = _536 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _640 = isnan(_536);
    bool _642 = _638 || _640;
    bool _644 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _646 = _642 || _644;
    float _648 = float(_646);
    float _650 = _578 * _598;
    bool _652 = _536 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _654 = isnan(_536);
    bool _656 = _652 || _654;
    bool _658 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _660 = _656 || _658;
    float _662 = float(_660);
    float _664 = -_648;
    float _666 = _664 + 1.0;
    bool _668 = _536 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _670 = isnan(_536);
    bool _672 = _668 || _670;
    bool _674 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _676 = _672 || _674;
    float _678 = float(_676);
    float _680 = fma(_616, _650, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _682 = fma(_596, _650, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _684 = _662 * _666;
    float _686 = -_662;
    float _688 = _686 + 1.0;
    float _690 = _678 * _634;
    float _692 = fma(_620, _650, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _694 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _696 = _694 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _698 = _612 * _688;
    float _700 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _702 = _700 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _704 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _706 = _704 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _708 = _680 * _690;
    float _710 = _682 * _690;
    float _712 = -_678;
    float _714 = _712 + 1.0;
    float _716 = _692 * _690;
    float _718 = fma(_696, _636, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _720 = fma(_702, _636, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _722 = fma(_714, (*spvDescriptorSet0.vp_c9)._m0[107].x, _708);
    float _724 = fma(_714, (*spvDescriptorSet0.vp_c9)._m0[107].y, _710);
    float _726 = fma(_706, _636, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _728 = fma(_714, (*spvDescriptorSet0.vp_c9)._m0[107].z, _716);
    float _730 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _732 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _730;
    float _734 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _736 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _734;
    float _738 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _740 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _738;
    float _742 = fma(_718, _630, _722);
    float _744 = fma(_720, _630, _724);
    float _746 = fma(_726, _630, _728);
    float _748 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _750 = _748 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _752 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _754 = _752 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _756 = fma(_732, _580, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _758 = fma(_736, _580, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _760 = fma(_740, _580, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _762 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _764 = _762 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _766 = fma(_750, _600, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _768 = fma(_754, _600, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _770 = fma(_756, _698, _742);
    float _772 = fma(_764, _600, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _774 = fma(_758, _698, _744);
    float _776 = fma(_760, _698, _746);
    float _778 = fma(_766, _684, _770);
    float _780 = fma(_768, _684, _774);
    float _782 = fma(_772, _684, _776);
    float _784 = _506 * _538;
    float _786 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[111].x, _778);
    float _788 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[111].y, _780);
    float _790 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[111].z, _782);
    bool _792 = !_568;
    int _794 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[110].y);
    int _796 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _812;
    if (!_792)
    {
        float _798 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _800 = _168 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _802 = fma(_800, (*spvDescriptorSet0.vp_c9)._m0[11].y, _144);
        float _804 = _802 * _798;
        float _806 = floor(_804);
        float _808 = -_806;
        float _810 = _804 + _808;
        _812 = _810;
        _814 = true;
    }
    else
    {
        float _816 = float(_112);
        float _818 = 1.0 / _816;
        float _820 = _144 * _818;
        _812 = _820;
    }
    _814 = false;
    float _822 = _812;
    float _824 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _826 = _824 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _828 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _830 = _828 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _832 = _822 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _834 = isnan(_822);
    bool _836 = _832 || _834;
    bool _838 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _840 = _836 || _838;
    float _842 = float(_840);
    float _844 = 1.0 / _826;
    float _846 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _848 = _846 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _850 = _822 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _852 = isnan(_822);
    bool _854 = _850 || _852;
    bool _856 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _858 = _854 || _856;
    float _860 = float(_858);
    float _862 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _864 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _862;
    float _866 = -_842;
    float _868 = _866 + 1.0;
    bool _870 = _822 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _872 = isnan(_822);
    bool _874 = _870 || _872;
    bool _876 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _878 = _874 || _876;
    float _880 = float(_878);
    bool _882 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _884 = 1.0 / _830;
    float _886 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _888 = _886 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _890 = _860 * _868;
    float _892 = -_860;
    float _894 = _892 + 1.0;
    float _896 = _880 * _894;
    float _898 = 1.0 / _848;
    float _900 = _864 * _844;
    float _902 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _904 = _822 + _902;
    float _906 = -_880;
    float _908 = _906 + 1.0;
    float _910 = fma(_900, _904, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _912 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _914 = _822 + _912;
    float _916 = _888 * _884;
    bool _918 = _822 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _920 = isnan(_822);
    bool _922 = _918 || _920;
    bool _924 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _926 = _922 || _924;
    float _928 = float(_926);
    float _930 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _932 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _930;
    float _934 = _910 * _896;
    float _936 = fma(_916, _914, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _938 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _940 = _822 + _938;
    float _942 = -_928;
    float _944 = _942 + 1.0;
    float _946 = fma(_908, (*spvDescriptorSet0.vp_c9)._m0[115].x, _934);
    float _948 = _932 * _898;
    float _950 = _842 * _944;
    float _952 = fma(_936, _890, _946);
    float _954 = fma(_948, _940, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _956 = _788 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _958 = _790 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _960 = fma(_954, _950, _952);
    float _962 = _786 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _964 = _956 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _966 = _958 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _968 = fma(_928, (*spvDescriptorSet0.vp_c9)._m0[118].x, _960);
    float _970 = _962 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _972 = _968 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_69.x = _970;
    out.m_69.y = _964;
    out.m_69.z = _966;
    out.m_69.w = _972;
    bool _974 = !_882;
    float _990;
    if (!_974)
    {
        float _976 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _978 = _168 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _980 = fma(_978, (*spvDescriptorSet0.vp_c9)._m0[11].w, _144);
        float _982 = _980 * _976;
        float _984 = floor(_982);
        float _986 = -_984;
        float _988 = _982 + _986;
        _990 = _988;
        _992 = true;
    }
    else
    {
        float _994 = float(_112);
        float _996 = 1.0 / _994;
        float _998 = _144 * _996;
        _990 = _998;
    }
    _992 = false;
    float _1000 = _990;
    float _1002 = in.m_47.x;
    float _1004 = in.m_47.y;
    float _1006 = in.m_47.z;
    float _1008 = in.m_71.y;
    float _1010 = in.m_63.w;
    float _1012 = in.m_65.w;
    float _1014 = _190 * _1004;
    float _1016 = _198 * _1004;
    float _1018 = fma(_188, _1002, _1014);
    float _1020 = fma(_196, _1002, _1016);
    float _1022 = fma(_192, _1006, _1018);
    float _1024 = _1004 + _1008;
    float _1026 = fma(_200, _1006, _1020);
    float _1028 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1030 = _1022 + _1010;
    float _1032 = _1024 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1034 = _1026 + _1012;
    float _1036 = _1024 + _1028;
    float _1038 = fma(_1030, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1032);
    float _1040 = _1036 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1042 = _1036 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1044 = fma(_1034, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1038);
    float _1046 = _1024 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1048 = fma(_1030, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1040);
    float _1050 = fma(_1030, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1042);
    float _1052 = _1044 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1054 = fma(_1030, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1046);
    float _1056 = fma(_1034, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1048);
    float _1058 = fma(_1034, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1050);
    float _1060 = 1.0 / _1052;
    float _1062 = fma(_1034, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1054);
    float _1064 = _1056 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1066 = _1058 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1068 = _1062 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1070 = trunc(_1064);
    int _1072 = int(_1070);
    float _1074 = _1068 + _1052;
    float _1076 = _1074 * _1060;
    float _1078 = _1076 * 0.5;
    float _1080 = trunc(_1066);
    int _1082 = int(_1080);
    float _1084 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1086 = fma(_1078, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1084);
    int _1088 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1090 = _1072 + _1088;
    int _1092 = _1090 + 1;
    float _1094 = 1.0 / _1086;
    int _1096 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1098 = _1082 + _1096;
    int _1100 = _1098 + 1;
    int _1102 = _1092 | _1100;
    float _1104 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1106 = _1094 * _1104;
    bool _1108 = _1106 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1110 = _1106 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _1112 = !_1108;
    int _1114 = _1112 ? 0 : 1;
    int _1116 = 2;
    int _1118 = _1092;
    float _1120 = _1064;
    if (!_1108)
    {
        _1116 = 1;
    }
    int _1122 = _1116;
    int _1124 = _1122;
    if (!_1110)
    {
        _1124 = _1114;
    }
    int _1126 = _1124;
    bool _1128 = _1092 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1130 = _1126 << 6;
    bool _1132 = _1102 < 0;
    bool _1134 = _1132 || _1128;
    int _1136 = _1130 + 96;
    uint _1139 = uint(int(uint(_1136) >> uint(2)));
    uint _1141 = uint(int(uint(int(_1139)) >> uint(2)));
    int _1143 = int(_1139) & 3;
    float _1145 = (*spvDescriptorSet0.vp_c15)._m0[int(_1141)][_1143];
    int _1147 = int(_1139) + 1;
    uint _1149 = uint(int(uint(_1147) >> uint(2)));
    int _1151 = _1147 & 3;
    float _1153 = (*spvDescriptorSet0.vp_c15)._m0[int(_1149)][_1151];
    bool _1155 = _1100 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1157 = _1155 || _1134;
    int _1159 = int(_1134);
    int _1161 = _1108 ? 2 : 0;
    int _1163 = _1159 | _1161;
    int _1165 = _228 ? 4 : 0;
    int _1167 = _1163 | _1165;
    int _1169 = _1157 ? 8 : 0;
    int _1171 = _1167 | _1169;
    int _1173 = false ? 16 : 0;
    int _1175 = _1171 | _1173;
    int _1177 = false ? 32 : 0;
    int _1179 = _1175 | _1177;
    int _1181 = false ? 64 : 0;
    int _1183 = _1179 | _1181;
    int _1185 = _1183 & 8;
    int _1187 = _1130 + 104;
    uint _1189 = uint(int(uint(_1187) >> uint(2)));
    uint _1191 = uint(int(uint(int(_1189)) >> uint(2)));
    int _1193 = int(_1189) & 3;
    float _1195 = (*spvDescriptorSet0.vp_c15)._m0[int(_1191)][_1193];
    int _1197 = int(_1189) + 1;
    uint _1199 = uint(int(uint(_1197) >> uint(2)));
    int _1201 = _1197 & 3;
    float _1203 = (*spvDescriptorSet0.vp_c15)._m0[int(_1199)][_1201];
    float _1205 = as_type<float>(_1126);
    if (!_1157)
    {
        int _1207 = _1100 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1209 = _1207 + _1092;
        _1118 = _1209;
    }
    int _1211 = _1118;
    int _1213 = _1130 + 48;
    uint _1215 = uint(int(uint(_1213) >> uint(2)));
    uint _1217 = uint(int(uint(int(_1215)) >> uint(2)));
    int _1219 = int(_1215) & 3;
    float _1221 = (*spvDescriptorSet0.vp_c15)._m0[int(_1217)][_1219];
    int _1223 = int(_1215) + 1;
    uint _1225 = uint(int(uint(_1223) >> uint(2)));
    int _1227 = _1223 & 3;
    float _1229 = (*spvDescriptorSet0.vp_c15)._m0[int(_1225)][_1227];
    if (!_1157)
    {
        int _1231 = _1211 << 2;
        _794 = _1231;
    }
    int _1233 = _794;
    int _1235 = _1233;
    if (!_1157)
    {
        uint _1237 = uint(int(uint(_1211) >> uint(2)));
        _796 = int(_1237);
    }
    int _1239 = _796;
    int _1241 = _1130 + 64;
    uint _1243 = uint(int(uint(_1241) >> uint(2)));
    uint _1245 = uint(int(uint(int(_1243)) >> uint(2)));
    int _1247 = int(_1243) & 3;
    float _1249 = (*spvDescriptorSet0.vp_c15)._m0[int(_1245)][_1247];
    int _1251 = int(_1243) + 1;
    uint _1253 = uint(int(uint(_1251) >> uint(2)));
    int _1255 = _1251 & 3;
    float _1257 = (*spvDescriptorSet0.vp_c15)._m0[int(_1253)][_1255];
    if (!_1157)
    {
        int _1259 = 12 & _1233;
        _1235 = _1259;
    }
    int _1261 = _1235;
    int _1263 = _1130 + 56;
    uint _1265 = uint(int(uint(_1263) >> uint(2)));
    uint _1267 = uint(int(uint(int(_1265)) >> uint(2)));
    int _1269 = int(_1265) & 3;
    float _1271 = (*spvDescriptorSet0.vp_c15)._m0[int(_1267)][_1269];
    int _1273 = int(_1265) + 1;
    uint _1275 = uint(int(uint(_1273) >> uint(2)));
    int _1277 = _1273 & 3;
    float _1279 = (*spvDescriptorSet0.vp_c15)._m0[int(_1275)][_1277];
    int _1281 = _1130 + 72;
    uint _1283 = uint(int(uint(_1281) >> uint(2)));
    uint _1285 = uint(int(uint(int(_1283)) >> uint(2)));
    int _1287 = int(_1283) & 3;
    float _1289 = (*spvDescriptorSet0.vp_c15)._m0[int(_1285)][_1287];
    int _1291 = int(_1283) + 1;
    uint _1293 = uint(int(uint(_1291) >> uint(2)));
    int _1295 = _1291 & 3;
    float _1297 = (*spvDescriptorSet0.vp_c15)._m0[int(_1293)][_1295];
    float _1299 = _1036 * _1153;
    float _1301 = fma(_1030, _1145, _1299);
    float _1303 = _1145;
    if (!_1157)
    {
        int _1305 = _1239 << 4;
        int _1307 = _1305 + _1261;
        _1303 = as_type<float>(_1307);
    }
    float _1309 = _1303;
    float _1311 = fma(_1034, _1195, _1301);
    float _1313 = _1309;
    if (!_1157)
    {
        int _1315 = as_type<int>(_1309) + 400;
        uint _1317 = uint(int(uint(_1315) >> uint(2)));
        uint _1319 = uint(int(uint(int(_1317)) >> uint(2)));
        int _1321 = int(_1317) & 3;
        float _1323 = (*spvDescriptorSet0.vp_c15)._m0[int(_1319)][_1321];
        _1313 = _1323;
    }
    float _1325 = _1313;
    float _1327 = _1311 + _1203;
    float _1329 = _1036 * _1229;
    float _1331 = 1.0 / _1327;
    int _1333 = _1130 + 80;
    uint _1335 = uint(int(uint(_1333) >> uint(2)));
    uint _1337 = uint(int(uint(int(_1335)) >> uint(2)));
    int _1339 = int(_1335) & 3;
    float _1341 = (*spvDescriptorSet0.vp_c15)._m0[int(_1337)][_1339];
    int _1343 = int(_1335) + 1;
    uint _1345 = uint(int(uint(_1343) >> uint(2)));
    int _1347 = _1343 & 3;
    float _1349 = (*spvDescriptorSet0.vp_c15)._m0[int(_1345)][_1347];
    float _1351 = fma(_1030, _1221, _1329);
    float _1353 = _1036 * _1257;
    int _1355 = _1130 + 88;
    uint _1357 = uint(int(uint(_1355) >> uint(2)));
    uint _1359 = uint(int(uint(int(_1357)) >> uint(2)));
    int _1361 = int(_1357) & 3;
    float _1363 = (*spvDescriptorSet0.vp_c15)._m0[int(_1359)][_1361];
    int _1365 = int(_1357) + 1;
    uint _1367 = uint(int(uint(_1365) >> uint(2)));
    int _1369 = _1365 & 3;
    float _1371 = (*spvDescriptorSet0.vp_c15)._m0[int(_1367)][_1369];
    float _1373 = fma(_1030, _1249, _1353);
    float _1375 = fma(_1034, _1271, _1351);
    float _1377 = _1375 + _1279;
    float _1379 = fma(_1030, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1381 = fma(_1034, _1289, _1373);
    float _1383 = _1377 * _1331;
    float _1385 = floor(_1379);
    float _1387 = _1381 + _1297;
    bool _1389 = _1383 >= 0.0;
    float _1391 = fma(_1034, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1393 = _1387 * _1331;
    bool _1395 = _1383 <= 1.0;
    bool _1397 = _1395 && _1389;
    float _1399 = floor(_1391);
    bool _1401 = _1393 >= 0.0;
    bool _1403 = _1401 && _1397;
    bool _1405 = _1393 <= 1.0;
    bool _1407 = _1405 && _1403;
    float _1409 = _1297;
    float _1411 = _1391;
    if (!_1157)
    {
        float _1413 = floor(_1066);
        _1409 = _1413;
    }
    float _1415 = _1409;
    float _1417 = -_1385;
    float _1419 = _1379 + _1417;
    int _1421 = int(_1403);
    int _1423 = _1108 ? 2 : 0;
    int _1425 = _1421 | _1423;
    int _1427 = _1407 ? 4 : 0;
    int _1429 = _1425 | _1427;
    int _1431 = _1157 ? 8 : 0;
    int _1433 = _1429 | _1431;
    int _1435 = false ? 16 : 0;
    int _1437 = _1433 | _1435;
    int _1439 = false ? 32 : 0;
    int _1441 = _1437 | _1439;
    int _1443 = false ? 64 : 0;
    int _1445 = _1441 | _1443;
    int _1447 = _1445 & 4;
    float _1449 = (*spvDescriptorSet0.vp_c15)._m0[652].y;
    if (!_1157)
    {
        float _1451 = floor(_1064);
        _1449 = _1451;
    }
    float _1453 = _1449;
    float _1455 = _1036 * _1349;
    if (_1407)
    {
        float _1457 = float(_1126);
        _1205 = _1457;
    }
    float _1459 = _1205;
    float _1461 = fma(_1030, _1341, _1455);
    float _1463 = _580;
    if (!_1157)
    {
        float _1465 = rint(_1325);
        float _1467 = precise::max(_1465, 0.0);
        uint _1469 = uint(_1467);
        uint _1471 = clamp(_1469, 0u, 65535u);
        _1463 = as_type<float>(_1471);
    }
    float _1473 = _1463;
    float _1475 = fma(_1034, _1363, _1461);
    float _1477 = _1475 + _1371;
    float _1479 = -_1399;
    float _1481 = _1391 + _1479;
    if (!_1157)
    {
        float _1483 = -_1415;
        float _1485 = _1066 + _1483;
        _1411 = _1485;
    }
    float _1487 = _1411;
    float _1489 = _1249;
    if (_1407)
    {
        float _1491 = rint(_1459);
        float _1493 = precise::max(_1491, 0.0);
        uint _1495 = uint(_1493);
        uint _1497 = clamp(_1495, 0u, 65535u);
        _1489 = as_type<float>(_1497);
    }
    float _1499 = _1489;
    if (!_1157)
    {
        float _1501 = -_1453;
        float _1503 = _1064 + _1501;
        _1120 = _1503;
    }
    float _1505 = _1120;
    float _1507 = _1477 * _1331;
    float2 _6860 = float2(_1419, _1481);
    float _1509 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6860, float2(0.0), isnan(_6860)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6860, float2(0.0), isnan(_6860)), level(0.0)).x;
    float _1511 = _1487;
    float _1513 = _1507;
    if (!_1157)
    {
        float3 _6879 = float3(_1505, _1487, float(as_type<int>(_1473)));
        float3 _6883 = select(_6879, float3(0.0), isnan(_6879));
        float _1515 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6883.xy, uint(rint(_6883.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6883.xy, uint(rint(_6883.z)), level(0.0)).x;
        _1511 = _1515;
    }
    float _1517 = _1511;
    float _1519 = _1499;
    if (_1407)
    {
        float3 _6898 = float3(_1383, _1393, float(as_type<int>(_1499)));
        float3 _6900 = select(_6898, float3(0.0), isnan(_6898));
        float _1521 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6900.xy, uint(rint(_6900.z)), _1507, level(0.0));
        _1519 = _1521;
    }
    float _1523 = _1519;
    float _1525 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1527 = int(_1525);
    int _1529 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1531 = _1529 != 0;
    int _1533 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1535 = _1533 != 0;
    int _1537 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1539 = _1537 != 0;
    float _1541 = _316 * _574;
    float _1543 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1545 = int(_1543);
    float _1547 = float(_112);
    float _1549 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1551 = _1549 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1553 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1555 = int(_1553);
    float _1557 = float(_1527);
    float _1559 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1561 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1559;
    float _1563 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1565 = int(_1563);
    float _1567 = float(_1545);
    bool _1569 = !_1535;
    int _1571 = _1569 ? 0 : 1;
    float _1573 = 1.0 / _1557;
    float _1575 = float(uint(_1555));
    float _1577 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1579 = ~_1555;
    int _1581 = _1579 + 1;
    int _1583 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1585 = _1583 != 0;
    bool _1587 = !_1531;
    int _1589 = _1587 ? 0 : 1;
    float _1591 = 1.0 / _1567;
    float _1593 = float(uint(_1565));
    int _1595 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1597 = _1595 != 0;
    int _1599 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1601 = _1599 != 0;
    int _1603 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1605 = _1603 != 0;
    int _1607 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1609 = _1607 != 0;
    int _1611 = ~_1565;
    int _1613 = _1611 + 1;
    float _1615 = _1573 * _144;
    float _1617 = 1.0 / _1575;
    bool _1619 = !_1601;
    int _1621 = _1619 ? 0 : 1;
    int _1623 = ~_1555;
    int _1625 = _1623 + 1;
    int _1627 = ~_1565;
    int _1629 = _1627 + 1;
    float _1631 = _1591 * _144;
    float _1633 = trunc(_1615);
    int _1635 = int(_1633);
    bool _1637 = !_1539;
    int _1639 = _1637 ? 0 : 1;
    bool _1641 = !_1585;
    int _1643 = _1641 ? 0 : 1;
    float _1645 = 1.0 / _1593;
    int _1647 = as_type<int>(_1617) + (-2);
    float _1649 = in.m_54.y;
    float _1651 = trunc(_1631);
    int _1653 = int(_1651);
    float _1655 = float(uint(_1635));
    float _1657 = as_type<float>(_1647) * _1655;
    float _1659 = _168 * 2.0;
    int _1661 = as_type<int>(_1645) + (-2);
    float _1663 = 1.0 / _1551;
    float _1665 = float(uint(_1653));
    float _1667 = trunc(_1657);
    float _1669 = precise::max(_1667, 0.0);
    uint _1671 = uint(_1669);
    float _1673 = as_type<float>(_1661) * _1665;
    bool _1675 = !_1597;
    int _1677 = _1675 ? 0 : 1;
    float _1679 = floor(_1659);
    float _1681 = _1649 * 2.0;
    int _1683 = _1581 * int(_1671);
    int _1685 = _1683 + _1635;
    float _1687 = trunc(_1673);
    float _1689 = precise::max(_1687, 0.0);
    uint _1691 = uint(_1689);
    bool _1693 = _1679 > 0.0;
    float _1695 = floor(_1681);
    bool _1697 = _1679 >= 0.0;
    bool _1699 = isnan(_1679);
    bool _1701 = _1697 || _1699;
    bool _1703 = isnan(0.0);
    bool _1705 = _1701 || _1703;
    float _1707 = float(uint(_1685));
    int _1709 = _1705 ? 0 : 1;
    int _1711 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1713 = _1711 != 0;
    float _1715 = as_type<float>(_1647) * _1707;
    int _1717 = _1613 * int(_1691);
    int _1719 = _1717 + _1653;
    float _1721 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1723 = _168 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1725 = trunc(_1715);
    float _1727 = precise::max(_1725, 0.0);
    uint _1729 = uint(_1727);
    int _1731 = ~_1709;
    int _1733 = _1731 + 1;
    int _1735 = _1733 + 1;
    float _1737 = _1649 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1739 = _1735;
    if (!_1693)
    {
        int _1741 = ~_1709;
        int _1743 = _1741 + 1;
        _1739 = _1743;
    }
    int _1745 = _1739;
    float _1747 = -_1577;
    float _1749 = fma(_1723, 2.0, _1747);
    float _1751 = float(uint(_1719));
    float _1753 = fma(_1737, -2.0, _1721);
    bool _1755 = _1695 > 0.0;
    float _1757 = 1.0 / _1547;
    bool _1759 = !_1605;
    int _1761 = _1759 ? 0 : 1;
    float _1763 = as_type<float>(_1661) * _1751;
    bool _1765 = _1695 >= 0.0;
    bool _1767 = isnan(_1695);
    bool _1769 = _1765 || _1767;
    bool _1771 = isnan(0.0);
    bool _1773 = _1769 || _1771;
    int _1775 = _1773 ? 0 : 1;
    int _1777 = int(_1671) + int(_1729);
    float _1779 = trunc(_1763);
    float _1781 = precise::max(_1779, 0.0);
    uint _1783 = uint(_1781);
    int _1785 = ~_1775;
    int _1787 = _1785 + 1;
    int _1789 = _1787 + 1;
    int _1791 = _1789;
    if (!_1755)
    {
        int _1793 = ~_1775;
        int _1795 = _1793 + 1;
        _1791 = _1795;
    }
    int _1797 = _1791;
    int _1799 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1801 = _1799 != 0;
    float _1803 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1805 = _1803 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    int _1807 = _1625 * _1777;
    int _1809 = _1807 + _1635;
    bool _1811 = !_1801;
    int _1813 = _1811 ? 0 : 1;
    float _1815 = 1.0 / _1805;
    bool _1817 = uint(_1809) >= uint(_1555);
    float _1819 = as_type<float>(_1809);
    int _1821 = as_type<int>(_1805);
    if (_1713)
    {
        _1819 = 1.0;
    }
    float _1823 = _1819;
    float _1825 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1827 = _1825 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1829 = _1823;
    if (!_1713)
    {
        _1829 = 7.345489978790283203125;
    }
    float _1831 = _1829;
    int _1833 = int(_1691) + int(_1783);
    float _1835 = in.m_54.z;
    float _1837 = _1831 * _168;
    float _1839 = 0.0;
    float _1841 = as_type<float>(_1833);
    if (_1713)
    {
        _1839 = 1.0;
    }
    float _1843 = _1839;
    int _1845 = _1629 * _1833;
    int _1847 = _1845 + _1653;
    float _1849 = _1843;
    if (_1713)
    {
        _1821 = 0;
    }
    int _1851 = _1821;
    float _1853 = floor(_1837);
    float _1855 = 0.0;
    int _1857 = _1851;
    if (_1713)
    {
        _1855 = _168;
    }
    float _1859 = _1855;
    float _1861 = _1859;
    if (!_1713)
    {
        _1849 = 1.2345600128173828125;
    }
    float _1863 = _1849;
    if (!_1713)
    {
        _1857 = 1;
    }
    int _1865 = _1857;
    if (!_1713)
    {
        _1861 = _1649;
    }
    float _1867 = _1861;
    float _1869 = 1.0 / _1827;
    bool _1871 = uint(_1847) >= uint(_1565);
    float _1873 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1875 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1873;
    float _1877 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1879 = _1877 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    bool _1881 = !_1817;
    int _1883 = _1881 ? 0 : (-1);
    float _1885 = _1863 * _1867;
    float _1887 = _1875 * _1663;
    float _1889 = _1879 * _1815;
    float _1891 = -_1853;
    float _1893 = _1837 + _1891;
    float _1895 = float(_1555);
    float _1897 = _168 + _1649;
    float _1899 = float(_1635);
    float _1901 = _1835 * 2.0;
    int _1903 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1905 = _1903 != 0;
    float _1907 = _1897 + (-1.0);
    bool _1909 = _1899 >= _1895;
    bool _1911 = isnan(_1899);
    bool _1913 = _1909 || _1911;
    bool _1915 = isnan(_1895);
    bool _1917 = _1913 || _1915;
    float _1919 = float(_1917);
    float _1921 = _1561 * _1869;
    float _1923 = _168 + _1835;
    float _1925 = floor(_1901);
    int _1927 = ~_1777;
    int _1929 = _1927 + _1883;
    int _1931 = _1929 + 1;
    float _1933 = _1757 * _144;
    bool _1935 = !_1905;
    int _1937 = _1935 ? 0 : 1;
    float _1939 = _1923 + (-1.0);
    int _1941 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1943 = _1941 != 0;
    int _1945 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1947 = _1945 != 0;
    int _1949 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1951 = _1949 != 0;
    float _1953 = _1835 + _1649;
    float _1955 = fma(_1907, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1957 = trunc(_1919);
    int _1959 = int(_1957);
    int _1961 = abs(_1937);
    int _1963 = _1555 * _1931;
    int _1965 = _1963 + _1635;
    bool _1967 = _1555 == 0;
    float _1969 = _1895 * _1933;
    bool _1971 = !_1871;
    int _1973 = _1971 ? 0 : (-1);
    float _1975 = _1953 + (-1.0);
    float _1977 = fma(_1939, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _1979 = _1925 > 0.0;
    float _1981 = _1893 * _1895;
    bool _1983 = _1925 >= 0.0;
    bool _1985 = isnan(_1925);
    bool _1987 = _1983 || _1985;
    bool _1989 = isnan(0.0);
    bool _1991 = _1987 || _1989;
    float _1993 = trunc(_1969);
    int _1995 = int(_1993);
    bool _1997 = !_1967;
    int _1999 = _1997 ? _1965 : (-1);
    float _2001 = fma(_1975, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2003 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2005 = _1000 + _2003;
    int _2007 = _1555 + (-1);
    int _2009 = ~_1959;
    int _2011 = _2009 + 1;
    int _2013 = _2011 + 1;
    float _2015 = fma(_1887, _2005, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    int _2017 = abs(_1571);
    float _2019 = trunc(_1981);
    int _2021 = int(_2019);
    bool _2023 = _1000 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _2025 = isnan(_1000);
    bool _2027 = _2023 || _2025;
    bool _2029 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _2031 = _2027 || _2029;
    float _2033 = float(_2031);
    int _2035 = _1999 * _2013;
    int _2037 = abs(_1589);
    int _2039 = _1959 * _2007;
    int _2041 = _2039 + _2035;
    bool _2043 = _1000 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2045 = isnan(_1000);
    bool _2047 = _2043 || _2045;
    bool _2049 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2051 = _2047 || _2049;
    float _2053 = float(_2051);
    float _2055 = -_2033;
    float _2057 = _2055 + 1.0;
    int _2059 = _2041 * _2017;
    bool _2061 = _1000 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2063 = isnan(_1000);
    bool _2065 = _2061 || _2063;
    bool _2067 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2069 = _2065 || _2067;
    float _2071 = float(_2069);
    float _2073 = -_2053;
    float _2075 = _2073 + 1.0;
    float _2077 = _2053 * _2057;
    int _2079 = _1995 * _2037;
    int _2081 = _2079 + _2059;
    bool _2083 = _1000 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2085 = isnan(_1000);
    bool _2087 = _2083 || _2085;
    bool _2089 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2091 = _2087 || _2089;
    float _2093 = float(_2091);
    float _2095 = _2071 * _2075;
    float _2097 = -_2071;
    float _2099 = _2097 + 1.0;
    int _2101 = abs(_1639);
    int _2103 = _2021 * _1961;
    int _2105 = _2103 + _1635;
    int _2107 = abs(_1643);
    float _2109 = _2093 * _2099;
    float _2111 = floor(_1885);
    int _2113 = _2105 * _2101;
    int _2115 = _2113 + _2081;
    float _2117 = _2015 * _2109;
    float _2119 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2121 = _1000 + _2119;
    float _2123 = -_2093;
    float _2125 = _2123 + 1.0;
    bool _2127 = !_1947;
    int _2129 = _2127 ? 0 : 1;
    int _2131 = _2021 * _2107;
    int _2133 = _2131 + _2115;
    float _2135 = fma(_1889, _2121, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    int _2137 = _1991 ? 0 : 1;
    float _2139 = fma(_2125, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2117);
    bool _2141 = _1865 != 1;
    float _2143 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2145 = _1000 + _2143;
    float _2147 = float(uint(_2133));
    float _2149 = fma(_2135, _2095, _2139);
    float _2151 = float(_1565);
    float _2153 = fma(_1921, _2145, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _2155 = float(_1653);
    float _2157 = as_type<float>(_1647) * _2147;
    float _2159 = -_2111;
    float _2161 = _1885 + _2159;
    bool _2163 = _2155 >= _2151;
    bool _2165 = isnan(_2155);
    bool _2167 = _2163 || _2165;
    bool _2169 = isnan(_2151);
    bool _2171 = _2167 || _2169;
    float _2173 = float(_2171);
    float _2175 = fma(_2153, _2077, _2149);
    float _2177 = trunc(_2157);
    float _2179 = precise::max(_2177, 0.0);
    uint _2181 = uint(_2179);
    float _2183 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2185 = (*spvDescriptorSet0.vp_c9)._m0[83].z;
    float _2187 = _2135;
    float _2189 = _2183;
    if (!_2141)
    {
        _2185 = _1835;
    }
    float _2191 = _2185;
    float _2193 = fma(_2033, (*spvDescriptorSet0.vp_c9)._m0[134].x, _2175);
    float _2195 = _2191;
    if (_2141)
    {
        _2195 = _1649;
    }
    float _2197 = _2195;
    float _2199 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _2201 = ~_2137;
    int _2203 = _2201 + 1;
    int _2205 = _2203 + 1;
    float _2207 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _308);
    float _2209 = trunc(_2173);
    int _2211 = int(_2209);
    int _2213 = ~_1555;
    int _2215 = _2213 + 1;
    float _2217 = fma(_2197, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2199);
    int _2219 = _2205;
    if (!_1979)
    {
        int _2221 = ~_2137;
        int _2223 = _2221 + 1;
        _2219 = _2223;
    }
    int _2225 = _2219;
    float _2227 = _2151 * _1933;
    float _2229 = _2161 * _2151;
    int _2231 = ~_1833;
    int _2233 = _2231 + _1973;
    int _2235 = _2233 + 1;
    float _2237 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2239 = log2(_2237);
    if (!_2141)
    {
        _2187 = _1649;
    }
    float _2241 = _2187;
    int _2243 = _2215 * int(_2181);
    int _2245 = _2243 + _2133;
    bool _2247 = _1565 == 0;
    int _2249 = _1565 * _2235;
    int _2251 = _2249 + _1653;
    float _2253 = _2241;
    if (_2141)
    {
        _2253 = _168;
    }
    float _2255 = _2253;
    int _2257 = abs(_2129);
    float _2259 = trunc(_2229);
    int _2261 = int(_2259);
    float _2263 = float(_1745);
    float _2265 = fma(_2255, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2183);
    float _2267 = float(uint(_2245));
    int _2269 = ~_2211;
    int _2271 = _2269 + 1;
    int _2273 = _2271 + 1;
    bool _2275 = !_2247;
    int _2277 = _2275 ? _2251 : (-1);
    float _2279 = as_type<float>(_1647) * _2267;
    if (!_2141)
    {
        _2189 = _1649;
    }
    float _2281 = _2189;
    float _2283 = _2239 * _144;
    int _2285 = _2277 * _2273;
    float _2287 = _2281;
    if (_2141)
    {
        _2287 = _168;
    }
    float _2289 = _2287;
    float _2291 = trunc(_2279);
    float _2293 = precise::max(_2291, 0.0);
    uint _2295 = uint(_2293);
    int _2297 = _1565 + (-1);
    float _2299 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _2301 = !_1951;
    int _2303 = _2301 ? 0 : 1;
    float _2305 = _2289 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (!_2141)
    {
        _1841 = _1835;
    }
    float _2307 = _1841;
    int _2309 = _2211 * _2297;
    int _2311 = _2309 + _2285;
    float _2313 = -_2299;
    float _2315 = fma(_2305, 2.0, _2313);
    float _2317 = _2307;
    if (_2141)
    {
        _2317 = _1649;
    }
    float _2319 = _2317;
    int _2321 = abs(_2303);
    float _2323 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2325 = trunc(_2227);
    int _2327 = int(_2325);
    float _2329 = _2319 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _2331 = abs(_1621);
    float _2333 = fma(_2329, -2.0, _2323);
    int _2335 = abs(_1813);
    int _2337 = abs(_1677);
    float _2339 = float(_2321);
    float _2341 = float(_1797);
    int _2343 = _2311 * _2331;
    float _2345 = -_144;
    float _2347 = fma(_2345, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1749);
    int _2349 = int(_2181) + int(_2295);
    float _2351 = _2339 * _2341;
    int _2353 = _2327 * _2337;
    int _2355 = _2353 + _2343;
    int _2357 = ~_1555;
    int _2359 = _2357 + 1;
    float _2361 = exp2(_2283);
    bool _2363 = !_1943;
    int _2365 = _2363 ? 0 : 1;
    int _2367 = _2261 * _2335;
    int _2369 = _2367 + _1653;
    bool _2371 = !_1609;
    int _2373 = _2371 ? 0 : 1;
    int _2375 = _2359 * _2349;
    int _2377 = _2375 + _2133;
    int _2379 = abs(_1761);
    float _2381 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2383 = 1.0 + _2381;
    int _2385 = abs(_2365);
    float _2387 = -_144;
    float _2389 = fma(_2387, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2315);
    bool _2391 = uint(_2377) >= uint(_1555);
    int _2393 = _2369 * _2379;
    int _2395 = _2393 + _2355;
    int _2397 = abs(_2373);
    float _2399 = float(_2385);
    float _2401 = float(_2225);
    float _2403 = -_2361;
    float _2405 = _2403 + 1.0;
    bool _2407 = !_2391;
    int _2409 = _2407 ? 0 : (-1);
    int _2411 = _2261 * _2397;
    int _2413 = _2411 + _2395;
    bool _2415 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2417 = isnan(0.0);
    bool _2419 = _2415 || _2417;
    bool _2421 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2423 = _2419 || _2421;
    float _2425 = _2399 * _2401;
    int _2427 = ~_2349;
    int _2429 = _2427 + _2409;
    int _2431 = _2429 + 1;
    float _2433 = 1.0 / _2383;
    float _2435 = in.m_73.x;
    float _2437 = in.m_73.y;
    float _2439 = in.m_73.z;
    float _2441 = float(uint(_2105));
    float _2443 = _2423 ? _2405 : 0.0;
    float _2445 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2265);
    float _2447 = float(uint(_2413));
    float _2449 = as_type<float>(_1647) * _2441;
    float _2451 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _2453 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2455 = isnan(1.0);
    bool _2457 = _2453 || _2455;
    bool _2459 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2461 = _2457 || _2459;
    float _2463 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1753);
    float _2465 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2217);
    float _2467 = as_type<float>(_1661) * _2447;
    float _2469 = trunc(_2449);
    float _2471 = precise::max(_2469, 0.0);
    uint _2473 = uint(_2471);
    float _2475 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2477 = float(_2257);
    float _2479 = fma(_1649, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2451);
    float _2481 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2333);
    float _2483 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2475);
    int _2485 = ~_1565;
    int _2487 = _2485 + 1;
    float _2489 = _2477 * _2263;
    float _2491 = trunc(_2467);
    float _2493 = precise::max(_2491, 0.0);
    uint _2495 = uint(_2493);
    float _2497 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2483);
    float _2499 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2479);
    if (_2461)
    {
        float _2501 = _2443 * _2433;
        _148 = _2501;
    }
    float _2503 = _148;
    int _2505 = ~_1555;
    int _2507 = _2505 + 1;
    float _2509 = _2489 * (-2.0);
    int _2511 = _1555 * _2431;
    int _2513 = _2511 + _2133;
    float _2515 = float(uint(_2369));
    float _2517 = _2425 * (-2.0);
    float _2519 = fma(_2509, _2437, _2437);
    int _2521 = _2507 * int(_2473);
    int _2523 = _2521 + _2105;
    float _2525 = _1649 + (-0.5);
    float _2527 = as_type<float>(_1661) * _2515;
    bool _2529 = !_1967;
    int _2531 = _2529 ? _2513 : (-1);
    float _2533 = fma(_2001, _2509, _2001);
    float _2535 = float(uint(_2523));
    int _2537 = _2487 * int(_2495);
    int _2539 = _2537 + _2413;
    float _2541 = fma(_2525, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2519);
    int _2543 = _2531 & 3;
    bool _2545 = _2543 != 0;
    float _2547 = trunc(_2527);
    float _2549 = precise::max(_2547, 0.0);
    uint _2551 = uint(_2549);
    float _2553 = as_type<float>(_1647) * _2535;
    float _2555 = float(uint(_2539));
    float _2557 = fma(_1955, _2517, _1955);
    float _2559 = fma(_2533, _2503, _2541);
    bool _2561 = !_2545;
    int _2563 = _2561 ? 0 : 1;
    float _2565 = fma(_2517, _2435, _2435);
    float _2567 = as_type<float>(_1661) * _2555;
    float _2569 = trunc(_2553);
    float _2571 = precise::max(_2569, 0.0);
    uint _2573 = uint(_2571);
    bool _2575 = uint(_2543) >= 2u;
    float _2577 = _168 + (-0.5);
    float _2579 = _2351 * (-2.0);
    int _2581 = _2531 & 3;
    bool _2583 = _2581 != 0;
    int _2585 = _2575 ? 0 : 1;
    float _2587 = fma(_2577, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2565);
    float _2589 = trunc(_2567);
    float _2591 = precise::max(_2589, 0.0);
    uint _2593 = uint(_2591);
    bool _2595 = _2543 != 3;
    float _2597 = fma(_2579, _2439, _2439);
    int _2599 = ~_1555;
    int _2601 = _2599 + 1;
    float _2603 = fma(_2557, _2503, _2587);
    int _2605 = ~_2585;
    int _2607 = _2605 + 1;
    int _2609 = _2607 + 1;
    float _2611 = fma(_1977, _2579, _1977);
    int _2613 = _2583 ? 0 : 1;
    int _2615 = int(_2473) + int(_2573);
    int _2617 = ~_1565;
    int _2619 = _2617 + 1;
    bool _2621 = uint(_2543) > 1u;
    int _2623 = _2601 * _2615;
    int _2625 = _2623 + _2105;
    float _2627 = _2603 * 0.15915493667125701904296875;
    int _2629 = int(_2495) + int(_2593);
    float _2631 = _1835 + (-0.5);
    int _2633 = _2609;
    if (_2595)
    {
        int _2635 = ~_2585;
        int _2637 = _2635 + 1;
        _2633 = _2637;
    }
    int _2639 = _2633;
    float _2641 = _2627 * 6.283185482025146484375;
    float _2643 = cos(_2641);
    bool _2645 = uint(_2625) >= uint(_1555);
    int _2647 = _2619 * _2629;
    int _2649 = _2647 + _2413;
    float _2651 = fma(_2631, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2597);
    int _2653 = ~_2613;
    int _2655 = _2653 + 1;
    int _2657 = _2655 + 1;
    float _2659 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _220);
    bool _2661 = !_2645;
    int _2663 = _2661 ? 0 : (-1);
    float _2665 = fma(_2611, _2503, _2651);
    bool _2667 = uint(_2649) >= uint(_1565);
    float _2669 = _2627 * 6.283185482025146484375;
    float _2671 = sin(_2669);
    int _2673 = ~_1565;
    int _2675 = _2673 + 1;
    float _2677 = _2665 * 0.15915493667125701904296875;
    bool _2679 = !_2667;
    int _2681 = _2679 ? 0 : (-1);
    float _2683 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    bool _2685 = _1649 > 0.5;
    float _2687 = _316 * _784;
    int _2689 = _2657;
    if (!_2621)
    {
        int _2691 = ~_2613;
        int _2693 = _2691 + 1;
        _2689 = _2693;
    }
    int _2695 = _2689;
    float _2697 = _2677 * 6.283185482025146484375;
    float _2699 = cos(_2697);
    bool _2701 = _2543 != 3;
    int _2703 = _2675 * int(_2551);
    int _2705 = _2703 + _2369;
    float _2707 = _2559 * 0.15915493667125701904296875;
    float _2709 = _1541 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _2711 = !_2701;
    int _2713 = _2711 ? 0 : (-1);
    float _2715 = _2687 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2717 = float(uint(_2705));
    float _2719 = _2707 * 6.283185482025146484375;
    float _2721 = cos(_2719);
    bool _2723 = _168 > 0.5;
    float _2725 = _2193 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _2727 = ~_2615;
    int _2729 = _2727 + _2663;
    int _2731 = _2729 + 1;
    float _2733 = as_type<float>(_1661) * _2717;
    int _2735 = ~_2629;
    int _2737 = _2735 + _2681;
    int _2739 = _2737 + 1;
    float _2741 = _2715 * _2207;
    out.m_75.w = _2725;
    float _2743 = _2707 * 6.283185482025146484375;
    float _2745 = sin(_2743);
    int _2747 = _1555 * _2731;
    int _2749 = _2747 + _2105;
    float _2751 = _2643 * _2699;
    float _2753 = _2671 * _2699;
    float _2755 = _2709 * _2659;
    int _2757 = abs(_2695);
    bool _2759 = !_1967;
    int _2761 = _2759 ? _2749 : (-1);
    float _2763 = trunc(_2733);
    float _2765 = precise::max(_2763, 0.0);
    uint _2767 = uint(_2765);
    float _2769 = _2671 * _2721;
    float _2771 = _2643 * _2721;
    float _2773 = _2721 * _2699;
    int _2775 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2777 = _2775 != 0;
    float _2779 = _2751 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2781 = ~_2757;
    int _2783 = _2781 + 1;
    int _2785 = _2783 + 1;
    float _2787 = _2677 * 6.283185482025146484375;
    float _2789 = sin(_2787);
    float _2791 = _2745 * _2699;
    float _2793 = _2671 * _2745;
    float _2795 = _2643 * _2745;
    int _2797 = _1565 * _2739;
    int _2799 = _2797 + _2413;
    float _2801 = _2751 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _2803 = !_2777;
    int _2805 = _2803 ? 0 : 1;
    int _2807 = int(_2551) + int(_2767);
    float _2809 = _2751 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2811 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2813 = _2811 != 0;
    float _2815 = _2751 * _2755;
    int _2817 = _2531 >> 31;
    int _2819 = abs(_2563);
    float _2821 = -_2795;
    float _2823 = fma(_2789, _2769, _2821);
    float _2825 = fma(_2789, _2771, _2793);
    float _2827 = -_2789;
    float _2829 = fma(_2827, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2779);
    float _2831 = -_2769;
    float _2833 = fma(_2789, _2795, _2831);
    float _2835 = fma(_2789, _2793, _2771);
    float _2837 = -_2789;
    float _2839 = fma(_2837, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2801);
    float _2841 = -_2789;
    float _2843 = fma(_2841, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2809);
    float _2845 = -_2755;
    float _2847 = _2789 * _2845;
    bool _2849 = !_2247;
    int _2851 = _2849 ? _2799 : (-1);
    float _2853 = _2753 * _2755;
    bool _2855 = !_2813;
    int _2857 = _2855 ? 0 : 1;
    float _2859 = fma(_2773, _2741, _2847);
    int _2861 = _2851 & 3;
    bool _2863 = _2861 != 0;
    float _2865 = fma(_2825, _2741, _2815);
    float _2867 = fma(_2823, _2741, _2853);
    int _2869 = _2817 & 3;
    float _2871 = fma(_2753, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2829);
    bool _2873 = !_2863;
    int _2875 = _2873 ? 0 : 1;
    float _2877 = fma(_2753, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2839);
    int _2879 = _2851 & 3;
    bool _2881 = _2879 != 0;
    float _2883 = fma(_2833, _2683, _2865);
    int _2885 = _2851 >> 31;
    float _2887 = fma(_2753, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2843);
    int _2889 = _2881 ? 0 : 1;
    float _2891 = fma(_2791, _2683, _2859);
    bool _2893 = uint(_2861) > 1u;
    float _2895 = _2883 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2897 = _2885 & 3;
    float _2899 = fma(_2835, _2683, _2867);
    int _2901 = _2531 + _2869;
    float _2903 = _2883 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2905 = _2851 + _2897;
    float _2907 = _2833 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2909 = _2901 >> 2;
    float _2911 = fma(_2891, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2903);
    int _2913 = ~_2889;
    int _2915 = _2913 + 1;
    int _2917 = _2915 + 1;
    float _2919 = fma(_2791, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2907);
    int _2921 = _2905 >> 2;
    float _2923 = fma(_2899, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2911);
    int _2925 = _2909 << 4;
    int _2927 = _2925 + 368;
    float _2929 = _2883 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2931 = _2917;
    if (!_2893)
    {
        int _2933 = ~_2889;
        int _2935 = _2933 + 1;
        _2931 = _2935;
    }
    int _2937 = _2931;
    float _2939 = fma(_2891, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2895);
    int _2941 = ~_1565;
    int _2943 = _2941 + 1;
    uint _2945 = uint(int(uint(_2927) >> uint(2)));
    uint _2947 = uint(int(uint(int(_2945)) >> uint(2)));
    int _2949 = int(_2945) & 3;
    float _2951 = (*spvDescriptorSet0.vp_c9)._m0[int(_2947)][_2949];
    int _2953 = int(_2945) + 1;
    uint _2955 = uint(int(uint(_2953) >> uint(2)));
    int _2957 = _2953 & 3;
    float _2959 = (*spvDescriptorSet0.vp_c9)._m0[int(_2955)][_2957];
    bool _2961 = uint(_2861) >= 2u;
    float _2963 = _2833 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2965 = _2921 << 4;
    int _2967 = _2965 + 512;
    int _2969 = _2943 * _2807;
    int _2971 = _2969 + _2369;
    int _2973 = _2961 ? 0 : 1;
    float _2975 = fma(_2899, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2939);
    bool _2977 = _2861 != 3;
    uint _2979 = uint(int(uint(_2967) >> uint(2)));
    uint _2981 = uint(int(uint(int(_2979)) >> uint(2)));
    int _2983 = int(_2979) & 3;
    float _2985 = (*spvDescriptorSet0.vp_c9)._m0[int(_2981)][_2983];
    int _2987 = int(_2979) + 1;
    uint _2989 = uint(int(uint(_2987) >> uint(2)));
    int _2991 = _2987 & 3;
    float _2993 = (*spvDescriptorSet0.vp_c9)._m0[int(_2989)][_2991];
    float _2995 = fma(_2791, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2963);
    float _2997 = _2975 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    bool _2999 = !_2977;
    int _3001 = _2999 ? 0 : (-1);
    float _3003 = _2923 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    bool _3005 = uint(_2971) >= uint(_1565);
    float _3007 = _2833 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3009 = _1034 + _2997;
    int _3011 = _2927 + 8;
    uint _3013 = uint(int(uint(_3011) >> uint(2)));
    uint _3015 = uint(int(uint(int(_3013)) >> uint(2)));
    int _3017 = int(_3013) & 3;
    float _3019 = (*spvDescriptorSet0.vp_c9)._m0[int(_3015)][_3017];
    int _3021 = int(_3013) + 1;
    uint _3023 = uint(int(uint(_3021) >> uint(2)));
    int _3025 = _3021 & 3;
    float _3027 = (*spvDescriptorSet0.vp_c9)._m0[int(_3023)][_3025];
    bool _3029 = !_3005;
    int _3031 = _3029 ? 0 : (-1);
    float _3033 = fma(_2791, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3007);
    float _3035 = _1030 + _3003;
    float _3037 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3039 = _3009 + _3037;
    float _3041 = fma(_2891, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2929);
    int _3043 = ~_2807;
    int _3045 = _3043 + _3031;
    int _3047 = _3045 + 1;
    float _3049 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3051 = _3035 + _3049;
    bool _3053 = _2861 != 3;
    int _3055 = _2967 + 8;
    uint _3057 = uint(int(uint(_3055) >> uint(2)));
    uint _3059 = uint(int(uint(int(_3057)) >> uint(2)));
    int _3061 = int(_3057) & 3;
    float _3063 = (*spvDescriptorSet0.vp_c9)._m0[int(_3059)][_3061];
    int _3065 = int(_3057) + 1;
    uint _3067 = uint(int(uint(_3065) >> uint(2)));
    int _3069 = _3065 & 3;
    float _3071 = (*spvDescriptorSet0.vp_c9)._m0[int(_3067)][_3069];
    float _3073 = fma(_2835, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3033);
    float _3075 = _3039 * _3039;
    int _3077 = abs(_2937);
    float _3079 = fma(_2835, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2995);
    float _3081 = fma(_2835, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2919);
    float _3083 = fma(_3051, _3051, _3075);
    int _3085 = abs(_2639);
    float _3087 = fma(_2899, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3041);
    int _3089 = ~_2973;
    int _3091 = _3089 + 1;
    int _3093 = _3091 + 1;
    float _3095 = sqrt(_3083);
    int _3097 = ~_3077;
    int _3099 = _3097 + 1;
    int _3101 = _3099 + 1;
    float _3103 = in.m_54.w;
    int _3105 = _3093;
    if (_3053)
    {
        int _3107 = ~_2973;
        int _3109 = _3107 + 1;
        _3105 = _3109;
    }
    int _3111 = _3105;
    int _3113 = ~_2819;
    int _3115 = _3113 + 1;
    int _3117 = _3115 + 1;
    int _3119 = abs(_2875);
    int _3121 = abs(_3111);
    int _3123 = ~_3119;
    int _3125 = _3123 + 1;
    int _3127 = _3125 + 1;
    int _3129 = _2785 * as_type<int>(_2959);
    int _3131 = abs(_2713);
    float _3133 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _3135 = int(_3133);
    bool _3137 = _3095 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _3139 = _3117 * as_type<int>(_2951);
    int _3141 = _3139 + _3129;
    int _3143 = ~_3131;
    int _3145 = _3143 + 1;
    int _3147 = _3145 + 1;
    int _3149 = _1565 * _3047;
    int _3151 = _3149 + _2369;
    int _3153 = _3101 * as_type<int>(_2993);
    int _3155 = ~_3085;
    int _3157 = _3155 + 1;
    int _3159 = _3157 + 1;
    int _3161 = _3127 * as_type<int>(_2985);
    int _3163 = _3161 + _3153;
    float _3165 = _3087 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _3167 = _3103 > 0.5;
    int _3169 = _3159 * as_type<int>(_3019);
    int _3171 = _3169 + _3141;
    float _3173 = as_type<float>(_3159);
    float _3175 = _3019;
    if (!_3137)
    {
        _3173 = _3035;
    }
    float _3177 = _3173;
    float _3179 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _3181 = int(_3179);
    float _3183 = _1024 + _3165;
    float _3185 = _3183;
    float _3187 = _3177;
    if (!_3137)
    {
        _3175 = _3009;
    }
    float _3189 = _3175;
    float _3191 = float(uint(_3135));
    int _3193 = ~_3121;
    int _3195 = _3193 + 1;
    int _3197 = _3195 + 1;
    bool _3199 = !_3137;
    float _3201 = _3189;
    if (!_3199)
    {
        float _3203 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3205 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3207 = _3095 + _3205;
        float _3209 = rsqrt(_3083);
        float _3211 = _3207 * _3203;
        float _3213 = _3183 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3215 = _3211 * 0.15915493667125701904296875;
        float _3217 = _3215 * 6.283185482025146484375;
        float _3219 = cos(_3217);
        float _3221 = _3215 * 6.283185482025146484375;
        float _3223 = sin(_3221);
        float _3225 = _3219 + (-1.0);
        float _3227 = fma(_3223, _3213, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3229 = _3225 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3231 = _3209 * _3227;
        float _3233 = fma(_3183, _3219, _3229);
        float _3235 = fma(_3051, _3231, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3237 = fma(_3039, _3231, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _3185 = _3233;
        _3201 = _3237;
        _3187 = _3235;
    }
    float _3239 = _3185;
    float _3241 = _3201;
    float _3243 = _3187;
    int _3245 = abs(_3001);
    int _3247 = _3147 * as_type<int>(_3027);
    int _3249 = _3247 + _3171;
    float _3251 = _220 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _3253 = _3197 * as_type<int>(_3063);
    int _3255 = _3253 + _3163;
    int _3257 = ~_3245;
    int _3259 = _3257 + 1;
    int _3261 = _3259 + 1;
    float _3263 = 1.0 / _3191;
    int _3265 = abs(_2857);
    float _3267 = fma(_3251, _3251, 1.0);
    int _3269 = abs(_2805);
    int _3271 = _3261 * as_type<int>(_3071);
    int _3273 = _3271 + _3255;
    int _3275 = abs(_3135);
    float _3277 = -_1024;
    float _3279 = _3277 + _3239;
    float _3281 = float(uint(_3181));
    float _3283 = rsqrt(_3267);
    int _3285 = ~_3269;
    int _3287 = _3285 + 1;
    int _3289 = _3287 + 1;
    float _3291 = -_1034;
    float _3293 = _3291 + _3241;
    int _3295 = ~_3265;
    int _3297 = _3295 + 1;
    int _3299 = _3297 + 1;
    int _3301 = _3249 * _3289;
    bool _3303 = !_2247;
    int _3305 = _3303 ? _3151 : (-1);
    float _3307 = 1.0 / _3281;
    int _3309 = abs(_3181);
    int _3311 = _3273 * _3299;
    float _3313 = float(uint(_3275));
    int _3315 = _2761 * _3269;
    int _3317 = _3315 + _3301;
    int _3319 = _3305 * _3265;
    int _3321 = _3319 + _3311;
    int _3323 = as_type<int>(_3263) + (-2);
    float _3325 = _3251 * _3283;
    float _3327 = float(uint(_3317));
    float _3329 = -_1030;
    float _3331 = _3329 + _3243;
    float _3333 = _3279 * _3279;
    float _3335 = -_3079;
    float _3337 = _3325 * _3335;
    float _3339 = -_3073;
    float _3341 = _3325 * _3339;
    float _3343 = as_type<float>(_3323) * _3327;
    float _3345 = -_3081;
    float _3347 = _3325 * _3345;
    float _3349 = 1.0 / _3313;
    float _3351 = fma(_3283, _2877, _3337);
    float _3353 = float(uint(_3309));
    float _3355 = fma(_3331, _3331, _3333);
    int _3357 = as_type<int>(_3307) + (-2);
    float _3359 = fma(_3283, _2871, _3341);
    float _3361 = float(uint(_3321));
    float _3363 = fma(_3293, _3293, _3355);
    float _3365 = trunc(_3343);
    float _3367 = precise::max(_3365, 0.0);
    uint _3369 = uint(_3367);
    int _3371 = abs(_3317);
    float _3373 = fma(_3283, _2887, _3347);
    int _3375 = ~_3135;
    int _3377 = _3375 + 1;
    float _3379 = float(uint(_3371));
    int _3381 = ~_3181;
    int _3383 = _3381 + 1;
    float _3385 = 1.0 / _3353;
    float _3387 = as_type<float>(_3357) * _3361;
    int _3389 = as_type<int>(_3349) + (-2);
    out.m_77.x = _3359;
    out.m_77.y = _3351;
    out.m_77.z = _3373;
    int _3391 = abs(_3321);
    float _3393 = as_type<float>(_3389) * _3379;
    float _3395 = sqrt(_3363);
    int _3397 = _3377 * int(_3369);
    int _3399 = _3397 + _3317;
    float _3401 = float(uint(_3391));
    float _3403 = float(uint(_3399));
    float _3405 = trunc(_3387);
    float _3407 = precise::max(_3405, 0.0);
    uint _3409 = uint(_3407);
    int _3411 = as_type<int>(_3385) + (-2);
    float _3413 = as_type<float>(_3323) * _3403;
    float _3415 = -_220;
    int _3417 = _2685 ? as_type<int>(_3415) : as_type<int>(_220);
    int _3419 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _3421 = _3419 != 0;
    float _3423 = trunc(_3393);
    float _3425 = precise::max(_3423, 0.0);
    uint _3427 = uint(_3425);
    bool _3429 = _3395 > 0.0;
    float _3431 = as_type<float>(_3411) * _3401;
    int _3433 = ~_3275;
    int _3435 = _3433 + 1;
    bool _3437 = !_3421;
    float _3439 = _3437 ? _220 : as_type<float>(_3417);
    int _3441 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _3443 = _3441 != 0;
    int _3445 = _3383 * int(_3409);
    int _3447 = _3445 + _3321;
    float _3449 = trunc(_3431);
    float _3451 = precise::max(_3449, 0.0);
    uint _3453 = uint(_3451);
    float _3455 = -_220;
    int _3457 = _3167 ? as_type<int>(_3455) : as_type<int>(_220);
    int _3459 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _3461 = _3459 != 0;
    float _3463 = float(uint(_3447));
    int _3465 = _3435 * int(_3427);
    int _3467 = _3465 + _3371;
    float _3469 = trunc(_3413);
    float _3471 = precise::max(_3469, 0.0);
    uint _3473 = uint(_3471);
    bool _3475 = !_3443;
    float _3477 = _3475 ? _220 : as_type<float>(_3457);
    float _3479 = as_type<float>(_3357) * _3463;
    bool _3481 = _1835 > 0.5;
    int _3483 = ~_3309;
    int _3485 = _3483 + 1;
    float _3487 = float(uint(_3467));
    bool _3489 = !_3429;
    float _3491 = _3243;
    float _3493 = _3239;
    float _3495 = _3241;
    float _3497 = as_type<float>(_3473);
    if (!_3489)
    {
        float _3499 = _274 * _274;
        float _3501 = rsqrt(_3363);
        float _3503 = fma(_282, _282, _3499);
        float _3505 = fma(_300, _300, _3503);
        float _3507 = sqrt(_3505);
        float _3509 = _3331 * _3501;
        float _3511 = _3279 * _3501;
        float _3513 = _3293 * _3501;
        bool _3515 = _3507 > 0.0;
        bool _3517 = !_3515;
        if (!_3517)
        {
            float _3519 = rsqrt(_3505);
            float _3521 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _3523 = _274 * _3519;
            float _3525 = _282 * _3519;
            float _3527 = _3511 * _3523;
            float _3529 = _300 * _3519;
            float _3531 = fma(_3509, _3525, _3527);
            float _3533 = _3521 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _3535 = fma(_3513, _3529, _3531);
            float _3537 = _3535 * _3533;
            float _3539 = fma(_282, _3537, _3243);
            float _3541 = fma(_274, _3537, _3239);
            float _3543 = fma(_300, _3537, _3241);
            _3491 = _3539;
            _3493 = _3541;
            _3495 = _3543;
        }
    }
    float _3545 = _3491;
    float _3547 = _3493;
    float _3549 = _3495;
    float _3551 = as_type<float>(_3389) * _3487;
    bool _3553 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _3555 = isnan(0.5);
    bool _3557 = _3553 || _3555;
    bool _3559 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _3561 = _3557 || _3559;
    float _3563 = trunc(_3479);
    float _3565 = precise::max(_3563, 0.0);
    uint _3567 = uint(_3565);
    int _3569 = _3485 * int(_3453);
    int _3571 = _3569 + _3391;
    float _3573 = _2825 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3575 = _2825 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3577 = _2825 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _3579 = int(_3369) + int(_3473);
    float _3581 = fma(_2773, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3573);
    float _3583 = float(uint(_3571));
    float _3585 = trunc(_3551);
    float _3587 = precise::max(_3585, 0.0);
    uint _3589 = uint(_3587);
    int _3591 = ~_3135;
    int _3593 = _3591 + 1;
    float _3595 = fma(_2773, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3575);
    float _3597 = fma(_2773, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3577);
    float _3599 = as_type<float>(_3411) * _3583;
    float _3601 = _3583;
    float _3603 = _3573;
    if (_3561)
    {
        _3497 = _3545;
    }
    float _3605 = _3497;
    float _3607 = _3605;
    if (_3561)
    {
        _3601 = _3547;
    }
    float _3609 = _3601;
    float _3611 = _3609;
    if (_3561)
    {
        _3603 = _3549;
    }
    float _3613 = _3603;
    float _3615 = _3613;
    if (!_3561)
    {
        float _3617 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _3619 = _1024 + _3617;
        float _3621 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _3623 = _1030 + _3621;
        float _3625 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3627 = -_1024;
        float _3629 = _3627 + _3547;
        float _3631 = _3619 * _3619;
        float _3633 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _3635 = _1034 + _3633;
        float _3637 = -_1034;
        float _3639 = _3637 + _3549;
        float _3641 = fma(_3623, _3623, _3631);
        float _3643 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3645 = fma(_3635, _3635, _3641);
        float _3647 = sqrt(_3645);
        float _3649 = _3625 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3651 = precise::min(_3647, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3653 = _3651 * _3643;
        float _3655 = _3649 * _3653;
        float _3657 = -_1030;
        float _3659 = _3657 + _3545;
        float _3661 = fma(_3629, _3655, _1024);
        float _3663 = fma(_3659, _3655, _1030);
        float _3665 = fma(_3639, _3655, _1034);
        _3611 = _3661;
        _3607 = _3663;
        _3615 = _3665;
    }
    float _3667 = _3611;
    float _3669 = _3607;
    float _3671 = _3615;
    int _3673 = ~_3181;
    int _3675 = _3673 + 1;
    float _3677 = trunc(_3599);
    float _3679 = precise::max(_3677, 0.0);
    uint _3681 = uint(_3679);
    int _3683 = int(_3409) + int(_3567);
    float _3685 = _3667 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    int _3687 = int(_3427) + int(_3589);
    int _3689 = _3593 * _3579;
    int _3691 = _3689 + _3317;
    int _3693 = ~_3309;
    int _3695 = _3693 + 1;
    int _3697 = _3675 * _3683;
    int _3699 = _3697 + _3321;
    float _3701 = _3667 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3703 = fma(_3669, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3685);
    bool _3705 = uint(_3691) >= uint(_3135);
    float _3707 = -_2445;
    float _3709 = _3707 + 1.0;
    float _3711 = fma(_3669, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3701);
    float _3713 = fma(_3671, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3703);
    int _3715 = ~_3275;
    int _3717 = _3715 + 1;
    float _3719 = -_2497;
    float _3721 = _3719 + 1.0;
    float _3723 = fma(_3671, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3711);
    float _3725 = _3713 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    int _3727 = int(_3453) + int(_3681);
    int _3729 = _3717 * _3687;
    int _3731 = _3729 + _3371;
    float _3733 = _3723 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3735 = _3725 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _3737 = !_3705;
    int _3739 = _3737 ? 0 : (-1);
    float _3741 = _3725 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    bool _3743 = uint(_3699) >= uint(_3181);
    float _3745 = fma(_3733, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3735);
    int _3747 = _3695 * _3727;
    int _3749 = _3747 + _3391;
    int _3751 = ~_3579;
    int _3753 = _3751 + _3739;
    int _3755 = _3753 + 1;
    float _3757 = _3725 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    bool _3759 = !_3743;
    int _3761 = _3759 ? 0 : (-1);
    float _3763 = _3725 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _3765 = uint(_3731) >= uint(_3275);
    float _3767 = _3667 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    int _3769 = ~_3683;
    int _3771 = _3769 + _3761;
    int _3773 = _3771 + 1;
    float _3775 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _3777 = -_308;
    int _3779 = _2723 ? as_type<int>(_3777) : as_type<int>(_308);
    float _3781 = fma(_3669, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3767);
    int _3783 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _3785 = _3783 != 0;
    int _3787 = _3181 * _3773;
    int _3789 = _3787 + _3321;
    float _3791 = fma(_3733, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3757);
    int _3793 = _3135 * _3755;
    int _3795 = _3793 + _3317;
    bool _3797 = _3135 == 0;
    float _3799 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _3801 = _3317 ^ _3135;
    float _3803 = fma(_3733, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3741);
    bool _3805 = !_3785;
    float _3807 = _3805 ? _308 : as_type<float>(_3779);
    float _3809 = fma(_3733, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3763);
    bool _3811 = uint(_3749) >= uint(_3309);
    float _3813 = fma(_3671, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3781);
    int _3815 = _3321 ^ _3181;
    float _3817 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _3819 = !_3765;
    int _3821 = _3819 ? 0 : (-1);
    float _3823 = _3813 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _3825 = !_3797;
    int _3827 = _3825 ? _3795 : (-1);
    float _3829 = _3775 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    uint _3831 = uint(int(uint(_3801) >> uint(31)));
    float _3833 = -_2465;
    float _3835 = _3833 + 1.0;
    bool _3837 = _3181 == 0;
    float _3839 = _3251 * _2877;
    bool _3841 = !_3811;
    int _3843 = _3841 ? 0 : (-1);
    float _3845 = _3251 * _2887;
    uint _3847 = uint(int(uint(_3815) >> uint(31)));
    int _3849 = ~_3821;
    int _3851 = _3687 + _3849;
    int _3853 = _3851 + 1;
    int _3855 = ~int(_3831);
    int _3857 = _3855 + 1;
    bool _3859 = !_3837;
    int _3861 = _3859 ? _3789 : (-1);
    bool _3863 = _3181 == 0;
    float _3865 = fma(_3823, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3803);
    int _3867 = ~_3843;
    int _3869 = _3727 + _3867;
    int _3871 = _3869 + 1;
    float _3873 = fma(_3823, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3745);
    int _3875 = ~int(_3847);
    int _3877 = _3875 + 1;
    float _3879 = fma(_3823, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3809);
    bool _3881 = _3135 == 0;
    float _3883 = fma(_3823, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3791);
    int _3885 = _3853 ^ _3857;
    float _3887 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _3889 = float(_3827);
    float _3891 = _3807 + 0.5;
    int _3893 = _3871 ^ _3877;
    float _3895 = float(_3861);
    float _3897 = _3799 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _3899 = ~_3857;
    int _3901 = _3899 + _3885;
    int _3903 = _3901 + 1;
    float _3905 = fma(_3829, _3889, _2347);
    int _3907 = ~_3877;
    int _3909 = _3907 + _3893;
    int _3911 = _3909 + 1;
    float _3913 = fma(_3897, _3895, _2389);
    float _3915 = _3667 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3917 = _3817 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _3919 = !_3881;
    int _3921 = _3919 ? _3903 : (-1);
    float _3923 = fma(_3829, _3891, _3905);
    float _3925 = -_308;
    int _3927 = _3481 ? as_type<int>(_3925) : as_type<int>(_308);
    float _3929 = abs(_1106);
    float _3931 = log2(_3929);
    float _3933 = fma(_3669, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3915);
    float _3935 = float(_3921);
    float _3937 = _3887 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _3939 = !_3863;
    int _3941 = _3939 ? _3911 : (-1);
    float _3943 = fma(_3671, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3933);
    bool _3945 = !_3461;
    float _3947 = _3945 ? _308 : as_type<float>(_3927);
    float _3949 = -_2463;
    float _3951 = fma(_3917, _3935, _3949);
    float _3953 = float(_3941);
    float _3955 = _3943 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3957 = _3477 + (-0.5);
    float _3959 = _3947 + 0.5;
    float _3961 = -_3721;
    float _3963 = fma(_3807, _3961, _3923);
    float _3965 = -_2481;
    float _3967 = fma(_3937, _3953, _3965);
    float _3969 = _3439 + (-0.5);
    float _3971 = fma(_3897, _3959, _3913);
    float _3973 = fma(_3955, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3873);
    float _3975 = fma(_3955, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3879);
    float _3977 = fma(_3955, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3865);
    float _3979 = -_2499;
    float _3981 = _3979 + 1.0;
    float _3983 = _3931 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3985 = -_3709;
    float _3987 = fma(_3947, _3985, _3971);
    float _3989 = -_3917;
    float _3991 = fma(_3989, _3969, _3951);
    float _3993 = _3973 + _3975;
    float _3995 = -_3937;
    float _3997 = fma(_3995, _3957, _3967);
    float _3999 = fma(_3439, _3981, _3991);
    float _4001 = _3993 * 0.5;
    float _4003 = exp2(_3983);
    float _4005 = fma(_3477, _3835, _3997);
    float _4007 = fma(_2823, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3581);
    float _4009 = fma(_2823, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3595);
    float _4011 = fma(_2823, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3597);
    out.m_79.z = _4001;
    out.m_79.w = _3975;
    bool _4013 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _4015 = isnan(0.5);
    bool _4017 = _4013 || _4015;
    bool _4019 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _4021 = _4017 || _4019;
    float _4023 = fma(_3955, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3883);
    out.m_81.x = _3963;
    out.m_81.y = _3999;
    out.m_81.z = _3987;
    out.m_81.w = _4005;
    out.m_83.x = _4007;
    out.m_83.y = _4009;
    out.m_83.z = _4011;
    float _4025 = fma(_4003, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4027 = precise::clamp(_4025, 0.0, 1.0);
    out.gl_Position.x = _3977;
    out.gl_Position.y = _4023;
    out.gl_Position.z = _3973;
    out.gl_Position.w = _3975;
    float _4029 = fma(_4027, -2.0, 3.0);
    float _4031 = _4027 * _4027;
    float _4033 = _4031 * _4029;
    float _4035 = _3251 * _2871;
    float _4037 = _308 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _4039 = _3977;
    float _4041 = _4023;
    float _4043 = _4035;
    if (_4021)
    {
        _4039 = 1.0;
    }
    float _4045 = _4039;
    float _4047 = _4045;
    if (_4021)
    {
        _4041 = 1.0;
    }
    float _4049 = _4041;
    float _4051 = _4049;
    if (!_4021)
    {
        float _4053 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4055 = _4053 * 0.15915493667125701904296875;
        float _4057 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4059 = _4055 * 6.283185482025146484375;
        float _4061 = cos(_4059);
        float _4063 = _4057 * 0.15915493667125701904296875;
        float _4065 = _4055 * 6.283185482025146484375;
        float _4067 = sin(_4065);
        float _4069 = 1.0 / _4061;
        float _4071 = _4063 * 6.283185482025146484375;
        float _4073 = cos(_4071);
        float _4075 = _4067 * _4069;
        float _4077 = _4063 * 6.283185482025146484375;
        float _4079 = sin(_4077);
        float _4081 = _4073 * _4075;
        float _4083 = 1.0 / _4081;
        float _4085 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4087 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _4085;
        float _4089 = 1.0 / _4087;
        float _4091 = _4079 * _4083;
        float _4093 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4095 = fma(_1106, _4091, _4093);
        float _4097 = _4095 * _4089;
        float _4099 = precise::clamp(_4097, 0.0, 1.0);
        _4051 = _4099;
    }
    float _4101 = _4051;
    if (!_4021)
    {
        float _4103 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4105 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4107 = _4103 * 0.15915493667125701904296875;
        float _4109 = _4105 * 0.15915493667125701904296875;
        float _4111 = _4107 * 6.283185482025146484375;
        float _4113 = cos(_4111);
        float _4115 = _4107 * 6.283185482025146484375;
        float _4117 = sin(_4115);
        float _4119 = 1.0 / _4113;
        float _4121 = _4109 * 6.283185482025146484375;
        float _4123 = cos(_4121);
        float _4125 = _4117 * _4119;
        float _4127 = _4109 * 6.283185482025146484375;
        float _4129 = sin(_4127);
        float _4131 = _4123 * _4125;
        float _4133 = 1.0 / _4131;
        float _4135 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _4137 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _4135;
        float _4139 = 1.0 / _4137;
        float _4141 = _4129 * _4133;
        float _4143 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _4145 = fma(_1106, _4141, _4143);
        float _4147 = _4145 * _4139;
        float _4149 = precise::clamp(_4147, 0.0, 1.0);
        float _4151 = -_4149;
        float _4153 = _4151 + 1.0;
        _4047 = _4153;
    }
    float _4155 = _4047;
    bool _4157 = _1185 != 0;
    float _4159 = -_4033;
    float _4161 = _4159 + 1.0;
    float _4163 = _4101 * _4155;
    float _4165 = fma(_4037, _4007, _4035);
    bool _4167 = _1106 <= 8000.0;
    bool _4169 = isnan(_1106);
    bool _4171 = _4167 || _4169;
    bool _4173 = isnan(8000.0);
    bool _4175 = _4171 || _4173;
    float _4177 = float(_4175);
    float _4179 = fma(_4161, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4033);
    float _4181 = fma(_4037, _4009, _3839);
    float _4183 = _4163 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _4185 = fma(_4037, _4011, _3845);
    float _4187 = _3079 + _4181;
    float _4189 = _4177 * _4179;
    float _4191 = _316 * _4183;
    float _4193 = _3073 + _4165;
    float _4195 = _3081 + _4185;
    if (_4157)
    {
        _4043 = 1.0;
    }
    float _4197 = _4043;
    float _4199 = _4197;
    if (!_4157)
    {
        int _4201 = _1211 << 4;
        int _4203 = _4201 + 2048;
        uint _4205 = uint(int(uint(_4203) >> uint(2)));
        uint _4207 = uint(int(uint(int(_4205)) >> uint(2)));
        int _4209 = int(_4205) & 3;
        float _4211 = (*spvDescriptorSet0.vp_c15)._m0[int(_4207)][_4209];
        int _4213 = int(_4205) + 1;
        uint _4215 = uint(int(uint(_4213) >> uint(2)));
        int _4217 = _4213 & 3;
        float _4219 = (*spvDescriptorSet0.vp_c15)._m0[int(_4215)][_4217];
        int _4221 = _4203 + 8;
        uint _4223 = uint(int(uint(_4221) >> uint(2)));
        uint _4225 = uint(int(uint(int(_4223)) >> uint(2)));
        int _4227 = int(_4223) & 3;
        float _4229 = (*spvDescriptorSet0.vp_c15)._m0[int(_4225)][_4227];
        int _4231 = int(_4223) + 1;
        uint _4233 = uint(int(uint(_4231) >> uint(2)));
        int _4235 = _4231 & 3;
        float _4237 = (*spvDescriptorSet0.vp_c15)._m0[int(_4233)][_4235];
        float _4239 = _1036 * _4219;
        float _4241 = fma(_1030, _4211, _4239);
        float _4243 = fma(_1034, _4229, _4241);
        float _4245 = _4243 + _4237;
        float _4247 = precise::clamp(_4245, 0.0, 1.0);
        float _4249 = -_4247;
        float _4251 = _4249 + _1517;
        float _4253 = fma(_4251, 500.0, 1.5);
        float _4255 = exp2(_4253);
        float _4257 = 0.0 + _4255;
        float _4259 = precise::clamp(_4257, 0.0, 1.0);
        _4199 = _4259;
    }
    float _4261 = _4199;
    bool _4263 = _1447 != 0;
    float _4265 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4267 = _3667 + _4265;
    float _4269 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4271 = _3669 + _4269;
    float _4273 = _4189 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _4275 = -_1509;
    float _4277 = _4275 + 1.0;
    float _4279 = _4267 * _4267;
    out.m_85.x = _4193;
    out.m_85.y = _4187;
    out.m_85.z = _4195;
    float _4281 = _4277 * _4273;
    float _4283 = precise::clamp(_4281, 0.0, 1.0);
    float _4285 = fma(_4271, _4271, _4279);
    float _4287 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4289 = _3671 + _4287;
    out.m_87.x = _3669;
    out.m_87.y = _3667;
    out.m_87.z = _3671;
    float _4291 = -_4283;
    float _4293 = fma(_4291, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4295 = _4271;
    if (!_4263)
    {
        _4295 = 1.0;
    }
    float _4297 = _4295;
    float _4299 = fma(_4289, _4289, _4285);
    float _4301 = _4297;
    if (_4263)
    {
        bool _4303 = _1523 >= _1507;
        bool _4305 = isnan(_1523);
        bool _4307 = _4303 || _4305;
        bool _4309 = isnan(_1507);
        bool _4311 = _4307 || _4309;
        float _4313 = float(_4311);
        _4301 = _4313;
    }
    float _4315 = _4301;
    float _4317 = _4315 * _4261;
    float _4319 = sqrt(_4299);
    float _4321 = -_4317;
    float _4323 = fma(_4321, _4293, 1.0);
    float _4325 = precise::clamp(_4323, 0.0, 1.0);
    float _4327 = _4325 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_89.x = _4327;
    bool _4329 = _4319 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4331 = isnan(_4319);
    bool _4333 = _4329 || _4331;
    bool _4335 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4337 = _4333 || _4335;
    float _4339 = _4315;
    float _4341 = _4325;
    if (!_4337)
    {
        _4339 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4343 = _4339;
    float _4345 = _4343;
    float _4347 = _4343;
    if (!_4337)
    {
        _4341 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4349 = _4341;
    float _4351 = _4349;
    float _4353 = _4349;
    if (!_4337)
    {
        _1513 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4355 = _1513;
    bool _4357 = !_4337;
    float _4359 = _4355;
    float _4361 = _4355;
    if (!_4357)
    {
        bool _4363 = _4319 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4365 = isnan(_4319);
        bool _4367 = _4363 || _4365;
        bool _4369 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4371 = _4367 || _4369;
        if (!_4371)
        {
            float _4373 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4375 = _4319 + _4373;
            float _4377 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4379 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4377;
            float _4381 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4383 = _4381 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4385 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4387 = _4385 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4389 = 1.0 / _4379;
            float _4391 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4393 = _4391 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4395 = _4375 * _4389;
            float _4397 = precise::clamp(_4395, 0.0, 1.0);
            float _4399 = fma(_4397, _4383, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4401 = fma(_4397, _4387, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4403 = fma(_4397, _4393, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            _4353 = _4401;
            _4347 = _4399;
            _4361 = _4403;
            _4405 = true;
        }
        else
        {
            bool _4407 = _4319 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4409 = isnan(_4319);
            bool _4411 = _4407 || _4409;
            bool _4413 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4415 = _4411 || _4413;
            if (!_4415)
            {
                _4345 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4417 = _4345;
            _4347 = _4417;
            if (!_4415)
            {
                _4351 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4419 = _4351;
            _4353 = _4419;
            if (!_4415)
            {
                _4359 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4421 = _4359;
            bool _4423 = !_4415;
            _4361 = _4421;
            if (!_4423)
            {
                bool _4425 = _4319 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4427 = isnan(_4319);
                bool _4429 = _4425 || _4427;
                bool _4431 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4433 = _4429 || _4431;
                if (!_4433)
                {
                    float _4435 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4437 = _4319 + _4435;
                    float _4439 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4441 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4439;
                    float _4443 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4445 = _4443 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4447 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4449 = _4447 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4451 = 1.0 / _4441;
                    float _4453 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4455 = _4453 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4457 = _4437 * _4451;
                    float _4459 = precise::clamp(_4457, 0.0, 1.0);
                    float _4461 = fma(_4459, _4445, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4463 = fma(_4459, _4449, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4465 = fma(_4459, _4455, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    _4353 = _4463;
                    _4347 = _4461;
                    _4361 = _4465;
                    _4405 = true;
                }
                else
                {
                    _4353 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4347 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4361 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _4405 = false;
    float _4467 = _4353;
    float _4469 = _4347;
    float _4471 = _4361;
    float _4473 = _4191 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_91.x = 0.0;
    float _4475 = _4467 * 0.586610972881317138671875;
    bool _4477 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_50.x = _4473;
    float _4479 = fma(_4469, 0.298911988735198974609375, _4475);
    bool _4481 = _4101 > 0.0;
    bool _4483 = isnan(_4101);
    bool _4485 = _4481 || _4483;
    bool _4487 = isnan(0.0);
    bool _4489 = _4485 || _4487;
    float _4491 = fma(_4471, 0.114477999508380889892578125, _4479);
    bool _4493 = _4155 <= 0.0;
    bool _4495 = !_4489;
    bool _4497 = _4493 || _4495;
    float _4499 = -_4491;
    float _4501 = _4499 + _4469;
    float _4503 = -_4491;
    float _4505 = _4503 + _4467;
    float _4507 = -_4491;
    float _4509 = _4507 + _4471;
    float _4511 = fma(_4501, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4491);
    float _4513 = fma(_4505, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4491);
    float _4515 = fma(_4509, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4491);
    bool _4517 = !_4477;
    if (!_4517)
    {
        float _4519 = -_3667;
        float _4521 = _4519 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4523 = -_3669;
        float _4525 = _4523 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4527 = -_3671;
        float _4529 = _4527 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4531 = _4521 * _4521;
        float _4533 = fma(_4525, _4525, _4531);
        float _4535 = fma(_4529, _4529, _4533);
        float _4537 = sqrt(_4535);
        float _4539 = rsqrt(_4535);
        float _4541 = -_4537;
        float _4543 = _4541 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4545 = _4543 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4547 = precise::clamp(_4545, 0.0, 1.0);
        float _4549 = _4525 * _4539;
        float _4551 = _4521 * _4539;
        float _4553 = abs(_4547);
        float _4555 = log2(_4553);
        float _4557 = _4529 * _4539;
        float _4559 = _4549 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4561 = _4187 * _4551;
        float _4563 = -_4551;
        float _4565 = -_4559;
        float _4567 = fma(_4563, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4565);
        float _4569 = fma(_4193, _4549, _4561);
        float _4571 = -_4557;
        float _4573 = fma(_4571, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4567);
        float _4575 = fma(_4195, _4557, _4569);
        float _4577 = precise::clamp(_4575, 0.0, 1.0);
        float _4579 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4581 = _4573 + _4579;
        float _4583 = _4555 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4585 = _4581 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4587 = precise::clamp(_4585, 0.0, 1.0);
        float _4589 = exp2(_4583);
        float _4591 = _4589 * _4587;
        float _4593 = _4577 * _4591;
        float _4595 = _4593 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4597 = _4593 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4599 = _4593 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_91.x = _4595;
        out.m_91.y = _4597;
        out.m_91.z = _4599;
    }
    out.m_93.x = _4511;
    out.m_93.y = _4513;
    out.m_93.z = _4515;
    if (!_4497)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_50.x = 0.0;
    float _4601 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4601;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

