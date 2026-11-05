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
    texture2d<float> vp_t_tcb_20 [[id(18)]];
    sampler vp_t_tcb_20Smplr [[id(19)]];
    sampler vp_t_tcb_24Smplr_w [[id(20)]];
    sampler vp_t_tcb_32Smplr_w [[id(21)]];
    sampler vp_t_tcb_30Smplr_w [[id(22)]];
    sampler vp_t_tcb_14Smplr_w [[id(23)]];
    sampler vp_t_tcb_1CSmplr_w [[id(24)]];
    sampler vp_t_tcb_20Smplr_w [[id(25)]];
    constant dm_border_t* dm_border [[id(26)]];
};

struct main0_out
{
    float4 m_77 [[user(locn0)]];
    float4 m_91 [[user(locn1)]];
    float4 m_61 [[user(locn2)]];
    float4 m_113 [[user(locn3)]];
    float4 m_85 [[user(locn4)]];
    float4 m_95 [[user(locn5)]];
    float4 m_103 [[user(locn6)]];
    float4 m_93 [[user(locn7)]];
    float4 m_99 [[user(locn8)]];
    float4 m_101 [[user(locn9)]];
    float4 m_97 [[user(locn10)]];
    float4 m_111 [[user(locn11)]];
    float4 m_105 [[user(locn12)]];
    float4 m_107 [[user(locn13)]];
    float4 m_109 [[user(locn14)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_67 [[attribute(1)]];
    float4 m_69 [[attribute(2)]];
    float4 m_71 [[attribute(3)]];
    float4 m_79 [[attribute(4)]];
    float4 m_65 [[attribute(5)]];
    float4 m_58 [[attribute(6)]];
    float4 m_63 [[attribute(7)]];
    float4 m_87 [[attribute(8)]];
    float4 m_81 [[attribute(9)]];
    float4 m_73 [[attribute(10)]];
    float4 m_75 [[attribute(11)]];
    float4 m_89 [[attribute(12)]];
    float4 m_83 [[attribute(13)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_113 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_111 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_109 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3042 = false;
    bool _628 = false;
    bool _474 = false;
    bool _252 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _127 = in.m_58.w;
    float _129 = trunc(_127);
    int _132 = int(_129);
    bool _136 = _132 >= 1;
    float _138 = 0.0;
    if (!_136)
    {
        _138 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _138;
    float _142 = _140;
    if (!_136)
    {
        out.m_61.x = 0.0;
    }
    int _144 = 0;
    if (!_136)
    {
        float _146 = _140 * 5.0;
        _144 = as_type<int>(_146);
    }
    int _148 = _144;
    int _150 = _148;
    if (!_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3341 = as_type<float>(_148);
        out.gl_Position.z = _3341;
    }
    if (!_136)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _152 = in.m_63.w;
    bool _154 = _152 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _156 = isnan(_152);
    bool _158 = _154 || _156;
    bool _160 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _162 = _158 || _160;
    float _164 = -_152;
    float _166 = _164 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _168 = _166;
    if (_162)
    {
        float _170 = float(_132);
        _142 = _170;
    }
    float _172 = _142;
    bool _174 = _166 >= _172;
    bool _176 = !_162;
    bool _178 = _174 || _176;
    float _180 = _172;
    if (_178)
    {
        _180 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _182 = _180;
    if (_178)
    {
        out.m_61.x = 0.0;
    }
    if (_178)
    {
        float _184 = _182 * 5.0;
        _150 = as_type<int>(_184);
    }
    int _186 = _150;
    if (_178)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3411 = as_type<float>(_186);
        out.gl_Position.z = _3411;
    }
    if (_178)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _188 = in.m_65.x;
    float _190 = in.m_65.y;
    float _192 = in.m_65.z;
    bool _194 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _196 = in.m_67.x;
    float _198 = in.m_67.y;
    float _200 = in.m_67.z;
    float _202 = in.m_69.x;
    float _204 = in.m_69.y;
    float _206 = in.m_69.z;
    float _208 = in.m_71.x;
    float _210 = in.m_71.y;
    float _212 = in.m_71.z;
    float _214 = _190 * _198;
    float _216 = _190 * _204;
    float _218 = fma(_188, _196, _214);
    float _220 = _190 * _210;
    float _222 = fma(_188, _202, _216);
    float _224 = fma(_192, _200, _218);
    float _226 = fma(_188, _208, _220);
    float _228 = fma(_192, _206, _222);
    float _230 = fma(_192, _212, _226);
    bool _232 = !_194;
    float _250;
    if (!_232)
    {
        float _234 = in.m_73.x;
        float _236 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _238 = _234 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _240 = fma(_238, (*spvDescriptorSet0.vp_c9)._m0[12].x, _166);
        float _242 = _240 * _236;
        float _244 = floor(_242);
        float _246 = -_244;
        float _248 = _242 + _246;
        _250 = _248;
        _252 = true;
    }
    else
    {
        float _254 = float(_132);
        float _256 = 1.0 / _254;
        float _258 = _166 * _256;
        _250 = _258;
    }
    _252 = false;
    float _260 = _250;
    float _262 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _264 = _260 + _262;
    float _266 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _268 = _260 + _266;
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _272 = _260 + _270;
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _276 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _274;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _280 = _278 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _284 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _282;
    float _286 = 1.0 / _280;
    bool _288 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _290 = 1.0 / _284;
    float _292 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _294 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _292;
    float _296 = 1.0 / _276;
    float _298 = _264 * _286;
    bool _300 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _302 = isnan(_260);
    bool _304 = _300 || _302;
    bool _306 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _308 = _304 || _306;
    float _310 = float(_308);
    bool _312 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _314 = isnan(_260);
    bool _316 = _312 || _314;
    bool _318 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _320 = _316 || _318;
    float _322 = float(_320);
    float _324 = _268 * _290;
    bool _326 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _328 = isnan(_260);
    bool _330 = _326 || _328;
    bool _332 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _334 = _330 || _332;
    float _336 = float(_334);
    float _338 = -_310;
    float _340 = _338 + 1.0;
    float _342 = _336 * _340;
    bool _344 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _346 = isnan(_260);
    bool _348 = _344 || _346;
    bool _350 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _352 = _348 || _350;
    float _354 = float(_352);
    float _356 = _272 * _296;
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _360 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _358;
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _364 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _362;
    float _366 = -_336;
    float _368 = _366 + 1.0;
    float _370 = fma(_294, _356, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _372 = fma(_360, _356, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _374 = fma(_364, _356, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _376 = -_322;
    float _378 = _376 + 1.0;
    float _380 = _322 * _368;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _384 = _382 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _388 = _386 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _390 = _354 * _378;
    float _392 = -_354;
    float _394 = _392 + 1.0;
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _398 = _396 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _400 = _372 * _390;
    float _402 = _374 * _390;
    float _404 = _370 * _390;
    float _406 = fma(_394, (*spvDescriptorSet0.vp_c9)._m0[143].x, _400);
    float _408 = fma(_394, (*spvDescriptorSet0.vp_c9)._m0[143].y, _402);
    float _410 = fma(_398, _298, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _414 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _412;
    float _416 = fma(_384, _298, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _418 = fma(_388, _298, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _420 = fma(_394, (*spvDescriptorSet0.vp_c9)._m0[143].z, _404);
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _424 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _422;
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _428 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _426;
    float _430 = fma(_410, _380, _406);
    float _432 = fma(_414, _324, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _434 = fma(_424, _324, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _436 = fma(_428, _324, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _438 = fma(_416, _380, _408);
    float _440 = fma(_418, _380, _420);
    float _442 = fma(_434, _342, _430);
    float _444 = fma(_432, _342, _438);
    float _446 = fma(_436, _342, _440);
    float _448 = fma(_310, (*spvDescriptorSet0.vp_c9)._m0[146].x, _442);
    float _450 = fma(_310, (*spvDescriptorSet0.vp_c9)._m0[146].y, _444);
    float _452 = fma(_310, (*spvDescriptorSet0.vp_c9)._m0[146].z, _446);
    bool _454 = !_288;
    float _472;
    if (!_454)
    {
        float _456 = in.m_73.x;
        float _458 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _460 = _456 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _462 = fma(_460, (*spvDescriptorSet0.vp_c9)._m0[11].y, _166);
        float _464 = _462 * _458;
        float _466 = floor(_464);
        float _468 = -_466;
        float _470 = _464 + _468;
        _472 = _470;
        _474 = true;
    }
    else
    {
        float _476 = float(_132);
        float _478 = 1.0 / _476;
        float _480 = _166 * _478;
        _472 = _480;
    }
    _474 = false;
    float _482 = _472;
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _486 = _482 + _484;
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _490 = _488 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _492 = _482 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _494 = isnan(_482);
    bool _496 = _492 || _494;
    bool _498 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _500 = _496 || _498;
    float _502 = float(_500);
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _506 = _504 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _508 = _482 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _510 = isnan(_482);
    bool _512 = _508 || _510;
    bool _514 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _516 = _512 || _514;
    float _518 = float(_516);
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _522 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _520;
    bool _524 = _482 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _526 = isnan(_482);
    bool _528 = _524 || _526;
    bool _530 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _532 = _528 || _530;
    float _534 = float(_532);
    float _536 = 1.0 / _490;
    float _538 = -_502;
    float _540 = _538 + 1.0;
    float _542 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _544 = _482 + _542;
    bool _546 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _548 = 1.0 / _506;
    float _550 = _522 * _536;
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _554 = _552 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _556 = -_534;
    float _558 = _556 + 1.0;
    float _560 = fma(_550, _486, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _562 = _518 * _540;
    float _564 = -_518;
    float _566 = _564 + 1.0;
    float _568 = _502 * _558;
    float _570 = _554 * _548;
    float _572 = _560 * _562;
    float _574 = fma(_570, _544, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _576 = fma(_566, (*spvDescriptorSet0.vp_c9)._m0[115].x, _572);
    float _578 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _580 = fma(_574, _568, _576);
    float _582 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _584 = _578 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _586 = fma(_534, (*spvDescriptorSet0.vp_c9)._m0[117].x, _580);
    float _588 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _590 = _582 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _592 = in.m_75.x;
    float _594 = in.m_75.y;
    float _596 = in.m_75.z;
    float _598 = _586 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _600 = _588 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_77.x = _590;
    out.m_77.y = _600;
    out.m_77.z = _584;
    out.m_77.w = _598;
    float _602 = _452 * _596;
    float _604 = _450 * _594;
    float _606 = _448 * _592;
    bool _608 = !_546;
    float _626;
    if (!_608)
    {
        float _610 = in.m_73.x;
        float _612 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _614 = _610 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _616 = fma(_614, (*spvDescriptorSet0.vp_c9)._m0[11].w, _166);
        float _618 = _616 * _612;
        float _620 = floor(_618);
        float _622 = -_620;
        float _624 = _618 + _622;
        _626 = _624;
        _628 = true;
    }
    else
    {
        float _630 = float(_132);
        float _632 = 1.0 / _630;
        float _634 = _166 * _632;
        _626 = _634;
    }
    _628 = false;
    float _636 = _626;
    float _638 = in.m_58.x;
    float _640 = in.m_58.y;
    float _642 = in.m_58.z;
    float _644 = in.m_67.w;
    float _646 = in.m_71.w;
    float _648 = _198 * _640;
    float _650 = _210 * _640;
    float _652 = fma(_196, _638, _648);
    float _654 = fma(_208, _638, _650);
    float _656 = fma(_200, _642, _652);
    float _658 = fma(_212, _642, _654);
    float _660 = _656 + _644;
    float _662 = _658 + _646;
    float _664 = fma(_660, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _666 = fma(_662, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _668 = floor(_664);
    float _670 = floor(_666);
    float _672 = -_668;
    float _674 = _664 + _672;
    float _676 = -_670;
    float _678 = _666 + _676;
    float2 _4205 = float2(_674, _678);
    float _680 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4205, float2(0.0), isnan(_4205)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4205, float2(0.0), isnan(_4205)), level(0.0)).x;
    float _682 = in.m_73.z;
    float _684 = _204 * _640;
    float _686 = in.m_73.x;
    int _688 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _690 = _688 != 0;
    float _692 = _602 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _694 = in.m_73.y;
    float _696 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _698 = fma(_202, _638, _684);
    float _700 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _702 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _704 = _702 != 0;
    int _706 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _708 = _706 != 0;
    int _710 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _712 = _710 != 0;
    float _714 = fma(_206, _642, _698);
    float _716 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _718 = _682 * 2.0;
    bool _720 = !_712;
    int _722 = _720 ? 0 : 1;
    float _724 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _726 = _686 * 2.0;
    float _728 = floor(_718);
    float _730 = _686 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _732 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _734 = _694 * 2.0;
    float _736 = _694 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _738 = -_696;
    float _740 = fma(_730, 2.0, _738);
    float _742 = _730;
    float _744 = _736;
    if (!_690)
    {
        _742 = _682;
    }
    float _746 = _742;
    float _748 = floor(_726);
    float _750 = fma(_736, -2.0, _700);
    float _752 = _746;
    if (!_690)
    {
        _744 = _694;
    }
    float _754 = _744;
    float _756 = _686 + _694;
    float _758 = _754;
    if (_690)
    {
        _758 = _686;
    }
    float _760 = _758;
    float _762 = -_166;
    float _764 = fma(_762, (*spvDescriptorSet0.vp_c9)._m0[76].x, _740);
    if (_690)
    {
        _752 = _694;
    }
    float _766 = _752;
    float _768 = _756 + (-1.0);
    float _770 = floor(_734);
    bool _772 = _728 > 0.0;
    float _774 = fma(_760, (*spvDescriptorSet0.vp_c9)._m0[83].z, _716);
    bool _776 = _728 >= 0.0;
    bool _778 = isnan(_728);
    bool _780 = _776 || _778;
    bool _782 = isnan(0.0);
    bool _784 = _780 || _782;
    float _786 = fma(_768, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _788 = _728;
    if (!_690)
    {
        _788 = _682;
    }
    float _790 = _788;
    float _792 = _760 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _794 = _790;
    if (_690)
    {
        _794 = _694;
    }
    float _796 = _794;
    float _798 = fma(_766, (*spvDescriptorSet0.vp_c9)._m0[83].w, _724);
    bool _800 = _748 > 0.0;
    float _802 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[76].y, _750);
    bool _804 = _748 >= 0.0;
    bool _806 = isnan(_748);
    bool _808 = _804 || _806;
    bool _810 = isnan(0.0);
    bool _812 = _808 || _810;
    float _814 = _796 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _816 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _818 = log2(_816);
    int _820 = _784 ? 0 : 1;
    float _822 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[82].z, _774);
    bool _824 = !_704;
    int _826 = _824 ? 0 : 1;
    float _828 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[82].w, _798);
    bool _830 = _770 > 0.0;
    bool _832 = _770 >= 0.0;
    bool _834 = isnan(_770);
    bool _836 = _832 || _834;
    bool _838 = isnan(0.0);
    bool _840 = _836 || _838;
    int _842 = ~_820;
    int _844 = _842 + 1;
    int _846 = _844 + 1;
    int _848 = _846;
    int _850 = as_type<int>(_802);
    if (!_772)
    {
        int _852 = ~_820;
        int _854 = _852 + 1;
        _848 = _854;
    }
    int _856 = _848;
    float _858 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _860 = abs(_826);
    float _862 = float(_856);
    float _864 = _818 * _166;
    float _866 = -_858;
    float _868 = fma(_792, 2.0, _866);
    float _870 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _872 = _840 ? 0 : 1;
    float _874 = float(_860);
    float _876 = exp2(_864);
    float _878 = fma(_814, -2.0, _870);
    int _880 = ~_872;
    int _882 = _880 + 1;
    int _884 = _882 + 1;
    float _886 = in.m_79.x;
    float _888 = in.m_79.y;
    float _890 = in.m_79.z;
    int _892 = _884;
    if (!_830)
    {
        int _894 = ~_872;
        int _896 = _894 + 1;
        _892 = _896;
    }
    int _898 = _892;
    float _900 = _874 * _862;
    float _902 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _904 = 1.0 + _902;
    int _906 = _812 ? 0 : 1;
    float _908 = 1.0 / _904;
    float _910 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _912 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _914 = isnan(1.0);
    bool _916 = _912 || _914;
    bool _918 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _920 = _916 || _918;
    int _922 = ~_906;
    int _924 = _922 + 1;
    int _926 = _924 + 1;
    float _928 = fma(_686, (*spvDescriptorSet0.vp_c9)._m0[78].z, _910);
    int _930 = _926;
    if (!_800)
    {
        int _932 = ~_906;
        int _934 = _932 + 1;
        _930 = _934;
    }
    int _936 = _930;
    float _938 = -_876;
    float _940 = _938 + 1.0;
    bool _942 = !_708;
    int _944 = _942 ? 0 : 1;
    float _946 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _948 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _950 = isnan(0.0);
    bool _952 = _948 || _950;
    bool _954 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _956 = _952 || _954;
    float _958 = _900 * (-2.0);
    int _960 = abs(_944);
    float _962 = fma(_694, (*spvDescriptorSet0.vp_c9)._m0[78].w, _946);
    float _964 = _956 ? _940 : 0.0;
    float _966 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[77].z, _928);
    float _968 = float(_960);
    float _970 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[77].w, _962);
    float _972 = float(_936);
    float _974 = -_166;
    float _976 = fma(_974, (*spvDescriptorSet0.vp_c9)._m0[81].x, _868);
    float _978 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[81].y, _878);
    if (_920)
    {
        float _980 = _964 * _908;
        _168 = _980;
    }
    float _982 = _168;
    float _984 = fma(_958, _886, _886);
    int _986 = abs(_722);
    float _988 = _686 + (-0.5);
    float _990 = fma(_786, _958, _786);
    float _992 = _968 * _972;
    float _994 = _694 + _682;
    float _996 = float(_986);
    float _998 = fma(_988, (*spvDescriptorSet0.vp_c9)._m0[196].x, _984);
    float _1000 = float(_898);
    float _1002 = _994 + (-1.0);
    float _1004 = _992 * (-2.0);
    float _1006 = fma(_990, _982, _998);
    float _1008 = _996 * _1000;
    float _1010 = _694 + (-0.5);
    float _1012 = fma(_1002, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1014 = fma(_1004, _888, _888);
    float _1016 = _686 + _682;
    float _1018 = fma(_1012, _1004, _1012);
    float _1020 = fma(_1010, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1014);
    float _1022 = _1016 + (-1.0);
    float _1024 = _1008 * (-2.0);
    float _1026 = _1006 * 0.15915493667125701904296875;
    float _1028 = fma(_1018, _982, _1020);
    float _1030 = fma(_1022, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1032 = fma(_1024, _890, _890);
    float _1034 = _682 + (-0.5);
    float _1036 = in.m_81.x;
    float _1038 = in.m_81.y;
    float _1040 = in.m_81.z;
    float _1042 = _1028 * 0.15915493667125701904296875;
    float _1044 = fma(_1030, _1024, _1030);
    float _1046 = fma(_1034, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1032);
    float _1048 = _1026 * 6.283185482025146484375;
    float _1050 = cos(_1048);
    float _1052 = _606 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1054 = fma(_1044, _982, _1046);
    float _1056 = _604 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1058 = in.m_69.w;
    float _1060 = _1054 * 0.15915493667125701904296875;
    float _1062 = _1042 * 6.283185482025146484375;
    float _1064 = sin(_1062);
    float _1066 = _1042 * 6.283185482025146484375;
    float _1068 = cos(_1066);
    float _1070 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1038);
    float _1072 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1040);
    float _1074 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1036);
    float _1076 = _1026 * 6.283185482025146484375;
    float _1078 = sin(_1076);
    float _1080 = _1070 * _1056;
    float _1082 = _1072 * _692;
    float _1084 = _1050 * _1064;
    float _1086 = _1074 * _1052;
    float _1088 = _1060 * 6.283185482025146484375;
    float _1090 = cos(_1088);
    float _1092 = _1050 * _1068;
    float _1094 = _1060 * 6.283185482025146484375;
    float _1096 = sin(_1094);
    float _1098 = _1078 * _1064;
    float _1100 = _1078 * _1068;
    float _1102 = _1050 * _1090;
    float _1104 = _1078 * _1090;
    float _1106 = _1068 * _1090;
    float _1108 = _1064 * _1090;
    float _1110 = _1102 * _1080;
    float _1112 = _1104 * _1080;
    float _1114 = _714 + _1058;
    float _1116 = fma(_1096, _1092, _1098);
    float _1118 = -_1080;
    float _1120 = _1096 * _1118;
    float _1122 = -_1100;
    float _1124 = fma(_1096, _1084, _1122);
    float _1126 = -_1084;
    float _1128 = fma(_1096, _1100, _1126);
    float _1130 = fma(_1116, _1086, _1110);
    float _1132 = fma(_1106, _1086, _1120);
    float _1134 = fma(_1096, _1098, _1092);
    float _1136 = fma(_1128, _1086, _1112);
    float _1138 = fma(_1124, _1082, _1130);
    float _1140 = fma(_1108, _1082, _1132);
    float _1142 = fma(_1134, _1082, _1136);
    float _1144 = _1138 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1146 = _1138 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1148 = _1138 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1150 = _1114 + _732;
    float _1152 = fma(_1140, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1144);
    float _1154 = fma(_1140, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1146);
    float _1156 = _1114 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1158 = _1114 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1160 = fma(_1142, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1152);
    float _1162 = fma(_1142, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1154);
    float _1164 = fma(_660, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1156);
    float _1166 = fma(_660, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1158);
    float _1168 = _1160 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1170 = _1162 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1172 = fma(_662, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1164);
    float _1174 = fma(_662, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1166);
    float _1176 = _662 + _1168;
    float _1178 = _660 + _1170;
    float _1180 = _1172 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1182 = _1174 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1184 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1186 = _1176 + _1184;
    float _1188 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1190 = _1178 + _1188;
    float _1192 = 1.0 / _1180;
    float _1194 = _1182 + _1180;
    float _1196 = _1186 * _1186;
    float _1198 = fma(_1140, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1148);
    float _1200 = fma(_1190, _1190, _1196);
    float _1202 = fma(_1142, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1198);
    float _1204 = _1150 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1206 = sqrt(_1200);
    float _1208 = _1202 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1210 = fma(_660, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1204);
    float _1212 = _1114 + _1208;
    float _1214 = _1194 * _1192;
    float _1216 = _1214 * 0.5;
    float _1218 = fma(_662, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1210);
    float _1220 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1222 = fma(_1216, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1220);
    float _1224 = _1218 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1226 = trunc(_1224);
    int _1228 = int(_1226);
    bool _1230 = _1206 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1232 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1234 = _1206 + _1232;
    float _1236 = 1.0 / _1222;
    float _1238 = _1060;
    float _1240 = _1206;
    float _1242 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    int _1244 = 2;
    float _1246 = _1212;
    float _1248 = _1178;
    float _1250 = _1176;
    float _1252 = _1224;
    if (_1230)
    {
        float _1254 = _1212 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1238 = _1254;
    }
    float _1256 = _1238;
    float _1258 = _1192;
    if (_1230)
    {
        float _1260 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1258 = _1260;
    }
    float _1262 = _1258;
    float _1264 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1266 = _1236 * _1264;
    float _1268 = 0.0;
    if (_1230)
    {
        float _1270 = rsqrt(_1200);
        _1268 = _1270;
    }
    float _1272 = _1268;
    bool _1274 = _1266 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1276 = _1266 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    if (_1230)
    {
        float _1278 = _1234 * _1262;
        _1240 = _1278;
    }
    float _1280 = _1240;
    float _1282 = _1150 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    if (_1230)
    {
        float _1284 = _1280 * 0.15915493667125701904296875;
        _1242 = _1284;
    }
    float _1286 = _1242;
    bool _1288 = !_1274;
    int _1290 = _1288 ? 0 : 1;
    float _1292 = fma(_660, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1282);
    float _1294 = 0.0;
    if (_1230)
    {
        float _1296 = _1286 * 6.283185482025146484375;
        float _1298 = cos(_1296);
        _1294 = _1298;
    }
    float _1300 = _1294;
    if (!_1274)
    {
        _1244 = 1;
    }
    int _1302 = _1244;
    float _1304 = fma(_662, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1292);
    int _1306 = _1302;
    if (!_1276)
    {
        _1306 = _1290;
    }
    int _1308 = _1306;
    float _1310 = _1304 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    int _1312 = _1308 << 6;
    float _1314 = _1058;
    float _1316 = as_type<float>(_1308);
    if (_1230)
    {
        float _1318 = _1286 * 6.283185482025146484375;
        float _1320 = sin(_1318);
        _1314 = _1320;
    }
    float _1322 = _1314;
    int _1324 = _1312 + 96;
    uint _1327 = uint(int(uint(_1324) >> uint(2)));
    uint _1329 = uint(int(uint(int(_1327)) >> uint(2)));
    int _1331 = int(_1327) & 3;
    float _1333 = (*spvDescriptorSet0.vp_c15)._m0[int(_1329)][_1331];
    int _1335 = int(_1327) + 1;
    uint _1337 = uint(int(uint(_1335) >> uint(2)));
    int _1339 = _1335 & 3;
    float _1341 = (*spvDescriptorSet0.vp_c15)._m0[int(_1337)][_1339];
    float _1343 = 0.0;
    if (_1230)
    {
        float _1345 = _1300 + (-1.0);
        _1343 = _1345;
    }
    float _1347 = _1343;
    float _1349 = trunc(_1310);
    int _1351 = int(_1349);
    int _1353 = _1312 + 104;
    uint _1355 = uint(int(uint(_1353) >> uint(2)));
    uint _1357 = uint(int(uint(int(_1355)) >> uint(2)));
    int _1359 = int(_1355) & 3;
    float _1361 = (*spvDescriptorSet0.vp_c15)._m0[int(_1357)][_1359];
    int _1363 = int(_1355) + 1;
    uint _1365 = uint(int(uint(_1363) >> uint(2)));
    int _1367 = _1363 & 3;
    float _1369 = (*spvDescriptorSet0.vp_c15)._m0[int(_1365)][_1367];
    float _1371 = _1347;
    if (_1230)
    {
        float _1373 = _1347 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1371 = _1373;
    }
    float _1375 = _1371;
    float _1377 = 0.0;
    if (_1230)
    {
        float _1379 = fma(_1322, _1256, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1377 = _1379;
    }
    float _1381 = _1377;
    float _1383 = _1381;
    if (_1230)
    {
        float _1385 = fma(_1212, _1300, _1375);
        _1246 = _1385;
    }
    float _1387 = _1246;
    int _1389 = _1312 + 48;
    uint _1391 = uint(int(uint(_1389) >> uint(2)));
    uint _1393 = uint(int(uint(int(_1391)) >> uint(2)));
    int _1395 = int(_1391) & 3;
    float _1397 = (*spvDescriptorSet0.vp_c15)._m0[int(_1393)][_1395];
    int _1399 = int(_1391) + 1;
    uint _1401 = uint(int(uint(_1399) >> uint(2)));
    int _1403 = _1399 & 3;
    float _1405 = (*spvDescriptorSet0.vp_c15)._m0[int(_1401)][_1403];
    float _1407 = _1387;
    if (_1230)
    {
        float _1409 = _1272 * _1381;
        _1383 = _1409;
    }
    float _1411 = _1383;
    int _1413 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1415 = _1228 + _1413;
    int _1417 = _1415 + 1;
    float _1419 = -_1114;
    float _1421 = _1419 + _1387;
    int _1423 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1425 = _1351 + _1423;
    int _1427 = _1425 + 1;
    int _1429 = _1417;
    if (_1230)
    {
        float _1431 = fma(_1190, _1411, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _1248 = _1431;
    }
    float _1433 = _1248;
    if (_1230)
    {
        float _1435 = fma(_1186, _1411, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1250 = _1435;
    }
    float _1437 = _1250;
    int _1439 = _1312 + 64;
    uint _1441 = uint(int(uint(_1439) >> uint(2)));
    uint _1443 = uint(int(uint(int(_1441)) >> uint(2)));
    int _1445 = int(_1441) & 3;
    float _1447 = (*spvDescriptorSet0.vp_c15)._m0[int(_1443)][_1445];
    int _1449 = int(_1441) + 1;
    uint _1451 = uint(int(uint(_1449) >> uint(2)));
    int _1453 = _1449 & 3;
    float _1455 = (*spvDescriptorSet0.vp_c15)._m0[int(_1451)][_1453];
    bool _1457 = _1417 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1459 = -_660;
    float _1461 = _1459 + _1433;
    int _1463 = _1417 | _1427;
    float _1465 = _1421 * _1421;
    bool _1467 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1469 = isnan(0.5);
    bool _1471 = _1467 || _1469;
    bool _1473 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1475 = _1471 || _1473;
    bool _1477 = _1463 < 0;
    bool _1479 = _1477 || _1457;
    int _1481 = _1312 + 56;
    uint _1483 = uint(int(uint(_1481) >> uint(2)));
    uint _1485 = uint(int(uint(int(_1483)) >> uint(2)));
    int _1487 = int(_1483) & 3;
    float _1489 = (*spvDescriptorSet0.vp_c15)._m0[int(_1485)][_1487];
    int _1491 = int(_1483) + 1;
    uint _1493 = uint(int(uint(_1491) >> uint(2)));
    int _1495 = _1491 & 3;
    float _1497 = (*spvDescriptorSet0.vp_c15)._m0[int(_1493)][_1495];
    float _1499 = -_662;
    float _1501 = _1499 + _1437;
    float _1503 = fma(_1461, _1461, _1465);
    bool _1505 = _1427 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1507 = _1505 || _1479;
    float _1509 = fma(_1501, _1501, _1503);
    int _1511 = _1312 + 72;
    uint _1513 = uint(int(uint(_1511) >> uint(2)));
    uint _1515 = uint(int(uint(int(_1513)) >> uint(2)));
    int _1517 = int(_1513) & 3;
    float _1519 = (*spvDescriptorSet0.vp_c15)._m0[int(_1515)][_1517];
    int _1521 = int(_1513) + 1;
    uint _1523 = uint(int(uint(_1521) >> uint(2)));
    int _1525 = _1521 & 3;
    float _1527 = (*spvDescriptorSet0.vp_c15)._m0[int(_1523)][_1525];
    float _1529 = sqrt(_1509);
    int _1531 = _1312 + 80;
    uint _1533 = uint(int(uint(_1531) >> uint(2)));
    uint _1535 = uint(int(uint(int(_1533)) >> uint(2)));
    int _1537 = int(_1533) & 3;
    float _1539 = (*spvDescriptorSet0.vp_c15)._m0[int(_1535)][_1537];
    int _1541 = int(_1533) + 1;
    uint _1543 = uint(int(uint(_1541) >> uint(2)));
    int _1545 = _1541 & 3;
    float _1547 = (*spvDescriptorSet0.vp_c15)._m0[int(_1543)][_1545];
    float _1549 = _1150 * _1341;
    float _1551 = _1461;
    if (!_1507)
    {
        int _1553 = _1427 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1555 = _1553 + _1417;
        _1429 = _1555;
    }
    int _1557 = _1429;
    float _1559 = fma(_660, _1333, _1549);
    float _1561 = fma(_662, _1361, _1559);
    bool _1563 = _1529 > 0.0;
    float _1565 = _1561 + _1369;
    float _1567 = _1150 * _1405;
    float _1569 = 1.0 / _1565;
    float _1571 = fma(_660, _1397, _1567);
    float _1573 = _1397;
    int _1575 = as_type<int>(_1571);
    float _1577 = _1565;
    if (!_1563)
    {
        _1573 = _1433;
    }
    float _1579 = _1573;
    float _1581 = _1150 * _1455;
    float _1583 = _1455;
    int _1585 = as_type<int>(_1581);
    float _1587 = _1579;
    float _1589 = _1579;
    if (!_1507)
    {
        float _1591 = floor(_1224);
        _1583 = _1591;
    }
    float _1593 = _1583;
    float _1595 = fma(_660, _1447, _1581);
    int _1597 = as_type<int>(_1595);
    if (!_1507)
    {
        int _1599 = _1557 << 2;
        _1585 = _1599;
    }
    int _1601 = _1585;
    float _1603 = fma(_662, _1489, _1571);
    int _1605 = _1601;
    float _1607 = _1519;
    if (!_1507)
    {
        uint _1609 = uint(int(uint(_1557) >> uint(2)));
        _1575 = int(_1609);
    }
    int _1611 = _1575;
    float _1613 = as_type<float>(_1611);
    if (!_1507)
    {
        int _1615 = 12 & _1601;
        _1605 = _1615;
    }
    int _1617 = _1605;
    float _1619 = _1603 + _1497;
    float _1621 = fma(_662, _1519, _1595);
    float _1623 = as_type<float>(_1617);
    if (!_1507)
    {
        int _1625 = _1611 << 4;
        int _1627 = _1625 + _1617;
        _1597 = _1627;
    }
    int _1629 = _1597;
    if (!_1563)
    {
        _1613 = _1387;
    }
    float _1631 = _1613;
    float _1633 = _1621 + _1527;
    float _1635 = _1631;
    if (!_1563)
    {
        _1623 = _1437;
    }
    float _1637 = _1623;
    bool _1639 = !_1563;
    float _1641 = _1637;
    float _1643 = _1637;
    if (!_1639)
    {
        float _1645 = _228 * _228;
        float _1647 = rsqrt(_1509);
        float _1649 = fma(_224, _224, _1645);
        float _1651 = fma(_230, _230, _1649);
        float _1653 = sqrt(_1651);
        float _1655 = _1461 * _1647;
        float _1657 = _1421 * _1647;
        float _1659 = _1501 * _1647;
        bool _1661 = _1653 > 0.0;
        float _1663 = _1653;
        _1551 = _1655;
        if (!_1661)
        {
            _1587 = _1433;
        }
        float _1665 = _1587;
        _1589 = _1665;
        if (!_1661)
        {
            _1663 = _1387;
        }
        float _1667 = _1663;
        _1635 = _1667;
        if (!_1661)
        {
            _1641 = _1437;
        }
        float _1669 = _1641;
        bool _1671 = !_1661;
        _1643 = _1669;
        if (!_1671)
        {
            float _1673 = rsqrt(_1651);
            float _1675 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1677 = _228 * _1673;
            float _1679 = _224 * _1673;
            float _1681 = _230 * _1673;
            float _1683 = _1657 * _1677;
            float _1685 = fma(_1655, _1679, _1683);
            float _1687 = _1675 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1689 = fma(_1659, _1681, _1685);
            float _1691 = _1689 * _1687;
            float _1693 = fma(_228, _1691, _1387);
            float _1695 = fma(_224, _1691, _1433);
            float _1697 = fma(_230, _1691, _1437);
            _1589 = _1695;
            _1635 = _1693;
            _1643 = _1697;
            _1577 = _1691;
        }
    }
    float _1699 = _1589;
    float _1701 = _1635;
    float _1703 = _1643;
    float _1705 = _1577;
    float _1707 = _1551;
    float _1709 = _1701;
    float _1711 = _1703;
    float _1713 = _1705;
    float _1715 = _1707;
    if (_1475)
    {
        _1407 = _1699;
    }
    float _1717 = _1407;
    float _1719 = _1717;
    if (!_1475)
    {
        float _1721 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1723 = _1114 + _1721;
        float _1725 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1727 = _660 + _1725;
        float _1729 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1731 = -_1114;
        float _1733 = _1731 + _1701;
        float _1735 = _1723 * _1723;
        float _1737 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1739 = _662 + _1737;
        float _1741 = fma(_1727, _1727, _1735);
        float _1743 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1745 = fma(_1739, _1739, _1741);
        float _1747 = sqrt(_1745);
        float _1749 = _1729 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1751 = precise::min(_1747, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1753 = _1751 * _1743;
        float _1755 = _1749 * _1753;
        float _1757 = -_660;
        float _1759 = _1757 + _1699;
        float _1761 = -_662;
        float _1763 = _1761 + _1703;
        float _1765 = fma(_1733, _1755, _1114);
        float _1767 = fma(_1759, _1755, _660);
        float _1769 = fma(_1763, _1755, _662);
        _1709 = _1765;
        _1719 = _1767;
        _1607 = _1743;
        _1711 = _1769;
        _1713 = _1755;
    }
    float _1771 = _1709;
    float _1773 = _1719;
    float _1775 = _1607;
    float _1777 = _1711;
    float _1779 = _1713;
    float _1781 = _1771 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1783 = _1619 * _1569;
    float _1785 = _1771 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1787 = _1771 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1789 = fma(_1773, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1781);
    float _1791 = _1633 * _1569;
    float _1793 = _1775;
    if (!_1507)
    {
        int _1795 = _1629 + 400;
        uint _1797 = uint(int(uint(_1795) >> uint(2)));
        uint _1799 = uint(int(uint(int(_1797)) >> uint(2)));
        int _1801 = int(_1797) & 3;
        float _1803 = (*spvDescriptorSet0.vp_c15)._m0[int(_1799)][_1801];
        _1793 = _1803;
    }
    float _1805 = _1793;
    float _1807 = fma(_1773, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1785);
    float _1809 = fma(_1773, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1787);
    float _1811 = fma(_1777, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1789);
    float _1813 = _1771 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1815 = fma(_1777, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1807);
    float _1817 = fma(_1777, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1809);
    float _1819 = _1811 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    int _1821 = _1312 + 88;
    uint _1823 = uint(int(uint(_1821) >> uint(2)));
    uint _1825 = uint(int(uint(int(_1823)) >> uint(2)));
    int _1827 = int(_1823) & 3;
    float _1829 = (*spvDescriptorSet0.vp_c15)._m0[int(_1825)][_1827];
    int _1831 = int(_1823) + 1;
    uint _1833 = uint(int(uint(_1831) >> uint(2)));
    int _1835 = _1831 & 3;
    float _1837 = (*spvDescriptorSet0.vp_c15)._m0[int(_1833)][_1835];
    float _1839 = _1815 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1841 = _1817 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1843 = fma(_1773, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1813);
    float _1845 = _1819 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1847 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    bool _1849 = _1783 >= 0.0;
    float _1851 = fma(_1777, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1843);
    float _1853 = _1839 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1855 = fma(_1841, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1845);
    bool _1857 = _1783 <= 1.0;
    bool _1859 = _1857 && _1849;
    float _1861 = _1779;
    if (!_1507)
    {
        float _1863 = floor(_1310);
        _1861 = _1863;
    }
    float _1865 = _1861;
    float _1867 = -_1853;
    float _1869 = fma(_1867, _1847, 1.0);
    float _1871 = _1851 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1873 = fma(_1839, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1855);
    bool _1875 = _1791 >= 0.0;
    bool _1877 = _1875 && _1859;
    float _1879 = _1819 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1881 = _1819 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1883 = fma(_1871, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1873);
    bool _1885 = _1791 <= 1.0;
    bool _1887 = _1885 && _1877;
    float _1889 = fma(_1841, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1879);
    float _1891 = fma(_1841, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1881);
    float _1893 = 1.0 / _1883;
    float _1895 = _1150 * _1547;
    float _1897 = fma(_1839, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1889);
    float _1899 = fma(_1839, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1891);
    float _1901 = _1865;
    if (!_1507)
    {
        float _1903 = -_1865;
        float _1905 = _1310 + _1903;
        _1715 = _1905;
    }
    float _1907 = _1715;
    float _1909 = fma(_1871, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1897);
    float _1911 = fma(_1871, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1899);
    float _1913 = log2(_1869);
    float _1915 = fma(_660, _1539, _1895);
    if (_1887)
    {
        float _1917 = float(_1308);
        _1316 = _1917;
    }
    float _1919 = _1316;
    if (!_1507)
    {
        float _1921 = -_1593;
        float _1923 = _1224 + _1921;
        _1901 = _1923;
    }
    float _1925 = _1901;
    float _1927 = _1909 * _1893;
    float _1929 = _1911 * _1893;
    float _1931 = _1919;
    if (_1887)
    {
        float _1933 = rint(_1919);
        float _1935 = precise::max(_1933, 0.0);
        uint _1937 = uint(_1935);
        uint _1939 = clamp(_1937, 0u, 65535u);
        _1931 = as_type<float>(_1939);
    }
    float _1941 = _1931;
    float _1943 = fma(_1927, 0.5, 0.5);
    float _1945 = fma(_1929, -0.5, 0.5);
    float _1947 = _1913 * 0.693147182464599609375;
    float _1949 = _1929;
    if (!_1507)
    {
        float _1951 = rint(_1805);
        float _1953 = precise::max(_1951, 0.0);
        uint _1955 = uint(_1953);
        uint _1957 = clamp(_1955, 0u, 65535u);
        _1949 = as_type<float>(_1957);
    }
    float _1959 = _1949;
    float _1961 = fma(_662, _1829, _1915);
    float _1963 = _1961 + _1837;
    float _1965 = _1947 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1967 = _1963 * _1569;
    float _1969 = _1791;
    if (_1887)
    {
        float3 _6293 = float3(_1783, _1791, float(as_type<int>(_1941)));
        float3 _6297 = select(_6293, float3(0.0), isnan(_6293));
        float _1971 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6297.xy, uint(rint(_6297.z)), _1967, level(0.0));
        _1969 = _1971;
    }
    float _1973 = _1969;
    float3 _6307 = float3(_1943, _1945, _1965);
    float _1975 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6307, float3(0.0), isnan(_6307)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6307, float3(0.0), isnan(_6307)), level(0.0)).x;
    float3 _6316 = float3(_1943, _1945, _1965);
    float4 _1978 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6316, float3(0.0), isnan(_6316)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6316, float3(0.0), isnan(_6316)), level(0.0)).xyzw;
    float _1980 = _1978.x;
    float _1982 = _1978.y;
    float _1984 = _1978.z;
    float _1986 = _1978.w;
    float _1988 = _1907;
    if (!_1507)
    {
        float3 _6339 = float3(_1925, _1907, float(as_type<int>(_1959)));
        float3 _6341 = select(_6339, float3(0.0), isnan(_6339));
        float _1990 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6341.xy, uint(rint(_6341.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6341.xy, uint(rint(_6341.z)), level(0.0)).x;
        _1988 = _1990;
    }
    float _1992 = _1988;
    if (_1507)
    {
        _1252 = 1.0;
    }
    float _1994 = _1252;
    float _1996 = _1994;
    float _1998 = _1992;
    float _2000 = _1986;
    if (!_1507)
    {
        int _2002 = _1557 << 4;
        int _2004 = _2002 + 2048;
        uint _2006 = uint(int(uint(_2004) >> uint(2)));
        uint _2008 = uint(int(uint(int(_2006)) >> uint(2)));
        int _2010 = int(_2006) & 3;
        float _2012 = (*spvDescriptorSet0.vp_c15)._m0[int(_2008)][_2010];
        int _2014 = int(_2006) + 1;
        uint _2016 = uint(int(uint(_2014) >> uint(2)));
        int _2018 = _2014 & 3;
        float _2020 = (*spvDescriptorSet0.vp_c15)._m0[int(_2016)][_2018];
        int _2022 = _2004 + 8;
        uint _2024 = uint(int(uint(_2022) >> uint(2)));
        uint _2026 = uint(int(uint(int(_2024)) >> uint(2)));
        int _2028 = int(_2024) & 3;
        float _2030 = (*spvDescriptorSet0.vp_c15)._m0[int(_2026)][_2028];
        int _2032 = int(_2024) + 1;
        uint _2034 = uint(int(uint(_2032) >> uint(2)));
        int _2036 = _2032 & 3;
        float _2038 = (*spvDescriptorSet0.vp_c15)._m0[int(_2034)][_2036];
        float _2040 = _1150 * _2020;
        float _2042 = fma(_660, _2012, _2040);
        float _2044 = fma(_662, _2030, _2042);
        float _2046 = _2044 + _2038;
        float _2048 = precise::clamp(_2046, 0.0, 1.0);
        float _2050 = -_2048;
        float _2052 = _2050 + _1992;
        float _2054 = fma(_2052, 500.0, 1.5);
        float _2056 = exp2(_2054);
        float _2058 = 0.0 + _2056;
        float _2060 = precise::clamp(_2058, 0.0, 1.0);
        _1996 = _2060;
    }
    float _2062 = _1996;
    float _2064 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2066 = _1771 + _2064;
    float _2068 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2070 = _1773 + _2068;
    float _2072 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2074 = _1777 + _2072;
    float _2076 = _2066 * _2066;
    float _2078 = fma(_2070, _2070, _2076);
    float _2080 = fma(_2074, _2074, _2078);
    float _2082 = rsqrt(_2080);
    float _2084 = sqrt(_2080);
    float _2086 = _2082 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2088 = _2070 * _2086;
    float _2090 = _2074 * _2086;
    float _2092 = _2088 * _2088;
    float _2094 = _2090 * _2090;
    float _2096 = _2092 + _2094;
    float _2098 = sqrt(_2096);
    bool _2100 = _2098 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2102 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2104 = _2098 + _2102;
    float _2106 = _1941;
    float _2108 = _2096;
    float _2110 = _2104;
    float _2112 = _2066;
    float _2114 = _2088;
    float _2116 = _2090;
    float _2118 = _2092;
    float _2120 = _2094;
    bool _2122 = _2100;
    if (_2100)
    {
        float _2124 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2106 = _2124;
    }
    float _2126 = _2106;
    if (_2100)
    {
        float _2128 = rsqrt(_2096);
        _2108 = _2128;
    }
    float _2130 = _2108;
    if (_2100)
    {
        float _2132 = _2104 * _2126;
        _2110 = _2132;
    }
    float _2134 = _2110;
    if (_2100)
    {
        float _2136 = _2134 * 0.15915493667125701904296875;
        _1998 = _2136;
    }
    float _2138 = _1998;
    float _2140 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2142 = _660;
    float _2144 = _2140;
    float _2146 = _2138;
    if (_2100)
    {
        float _2148 = _2138 * 6.283185482025146484375;
        float _2150 = sin(_2148);
        _2142 = _2150;
    }
    float _2152 = _2142;
    float _2154 = precise::max(0.0, _2140);
    float _2156 = _2134;
    if (_2100)
    {
        float _2158 = _2138 * 6.283185482025146484375;
        float _2160 = cos(_2158);
        _2156 = _2160;
    }
    float _2162 = _2156;
    float _2164 = -_2086;
    float _2166 = -_2154;
    float _2168 = fma(_2066, _2164, _2166);
    if (_2100)
    {
        float _2170 = _2168 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2112 = _2170;
    }
    float _2172 = _2112;
    float _2174 = _2172;
    float _2176 = _2152;
    if (_2100)
    {
        float _2178 = fma(_2152, _2172, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2174 = _2178;
    }
    float _2180 = _2174;
    float _2182 = _2180;
    if (_2100)
    {
        float _2184 = _2130 * _2180;
        _2176 = _2184;
    }
    float _2186 = _2176;
    if (!_2100)
    {
        _2182 = _2168;
    }
    float _2188 = _2182;
    float _2190 = _2188;
    if (_2100)
    {
        float _2192 = _2162 + (-1.0);
        _2144 = _2192;
    }
    float _2194 = _2144;
    float _2196 = _2194;
    if (_2100)
    {
        float _2198 = _2088 * _2186;
        _2114 = _2198;
    }
    float _2200 = _2114;
    if (_2100)
    {
        float _2202 = _2090 * _2186;
        _2116 = _2202;
    }
    float _2204 = _2116;
    if (_2100)
    {
        float _2206 = _2194 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2196 = _2206;
    }
    float _2208 = _2196;
    if (_2100)
    {
        float _2210 = _2200 * _2200;
        _2118 = _2210;
    }
    float _2212 = _2118;
    if (_2100)
    {
        float _2214 = _2204 * _2204;
        _2120 = _2214;
    }
    float _2216 = _2120;
    if (_2100)
    {
        float _2218 = fma(_2168, _2162, _2208);
        _2190 = _2218;
    }
    float _2220 = _2190;
    float _2222 = fma(_2220, _2220, _2212);
    float _2224 = _2222 + _2216;
    float _2226 = rsqrt(_2224);
    float _2228 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2230 = fma(_2084, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2228);
    float _2232 = precise::clamp(_2230, 0.0, 1.0);
    float _2234 = -_2232;
    float _2236 = _2234 + 1.0;
    float _2238 = abs(_2236);
    float _2240 = log2(_2238);
    float _2242 = _2226 * _2200;
    float _2244 = _2226 * _2220;
    float _2246 = _2226 * _2204;
    float _2248 = _2242 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2250 = -_2248;
    float _2252 = fma(_2244, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2250);
    float _2254 = -_2246;
    float _2256 = fma(_2254, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2252);
    float _2258 = _2240 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2260 = fma(_2256, -0.5, 0.5);
    float _2262 = fma(_2256, 0.5, 0.5);
    float _2264 = exp2(_2258);
    float _2266 = fma(_2262, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2268 = fma(_2262, _2266, -0.212114393711090087890625);
    float _2270 = _2244 + 1.0;
    float _2272 = sqrt(_2260);
    float _2274 = fma(_2262, _2268, 1.570728778839111328125);
    float _2276 = -_2244;
    float _2278 = fma(_2264, _2270, _2276);
    float _2280 = fma(_2278, 0.5, 0.5);
    float _2282 = _2272 * 0.636619746685028076171875;
    float _2284 = fma(_1437, 6.2500002968590706586837768554688e-05, 0.5);
    float _2286 = -_2274;
    float _2288 = fma(_2282, _2286, 1.0);
    float _2290 = fma(_1433, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _6795 = float2(_2288, _2280);
    float3 _2294 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6795, float2(0.0), isnan(_6795)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6795, float2(0.0), isnan(_6795)), level(0.0)).xyz;
    float _2296 = _2294.x;
    float _2298 = _2294.y;
    float _2300 = _2294.z;
    float2 _6809 = float2(_2290, _2284);
    float3 _2302 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_6809, float2(0.0), isnan(_6809)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_6809, float2(0.0), isnan(_6809)), level(0.0)).xyz;
    float _2304 = _2302.x;
    float _2306 = _2302.y;
    float _2308 = _2302.z;
    float _2310 = in.m_73.w;
    float _2312 = _2240 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2314 = in.m_83.x;
    int _2316 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2318 = _2316 != 0;
    float _2320 = _1819 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2322 = in.m_83.y;
    bool _2324 = _694 > 0.5;
    float _2326 = exp2(_2312);
    bool _2328 = _682 > 0.5;
    float _2330 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2332 = _2330 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2334 = _636 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2336 = isnan(_636);
    bool _2338 = _2334 || _2336;
    bool _2340 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2342 = _2338 || _2340;
    float _2344 = float(_2342);
    float _2346 = fma(_1841, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2320);
    int _2348 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2350 = _2348 != 0;
    float _2352 = -_680;
    float _2354 = _2352 + 1.0;
    float _2356 = 1.0 / _2332;
    int _2358 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[132].x);
    if (_2318)
    {
        bool _2360 = _686 > 0.5;
        _2122 = _2360;
    }
    bool _2362 = _2122;
    float _2364 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2366 = _636 + _2364;
    bool _2368 = _636 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2370 = isnan(_636);
    bool _2372 = _2368 || _2370;
    bool _2374 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2376 = _2372 || _2374;
    float _2378 = float(_2376);
    float _2380 = -_2344;
    float _2382 = _2380 + 1.0;
    float _2384 = fma(_1839, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2346);
    bool _2386 = _2310 > 0.5;
    float _2388 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2390 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2388;
    float _2392 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2394 = fma(_1871, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2384);
    float _2396 = _2314;
    float _2398 = _2384;
    if (_2318)
    {
        float _2400 = -_2314;
        float _2402 = _2400 + 1.0;
        _2358 = as_type<int>(_2402);
    }
    int _2404 = _2358;
    if (!_2318)
    {
        _2146 = _2314;
    }
    float _2406 = _2146;
    float _2408 = -_2326;
    float _2410 = _2408 + 1.0;
    float _2412 = -_2322;
    float _2414 = _2412 + 1.0;
    float _2416 = _2406;
    float _2418 = _2322;
    float _2420 = _2414;
    if (_2318)
    {
        float _2422 = _2362 ? as_type<float>(_2404) : _2314;
        _2416 = _2422;
    }
    float _2424 = _2416;
    float _2426 = _2390 * _2356;
    float _2428 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2430 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2432 = _2430 != 0;
    float _2434 = _2410 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _2436 = _2324 ? as_type<int>(_2414) : as_type<int>(_2322);
    out.m_85.x = 1.0;
    out.m_85.y = 1.0;
    out.m_85.z = 1.0;
    int _2438 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2440 = _2438 != 0;
    float _2442 = _2434 * _1975;
    float _2444 = _2432 ? as_type<float>(_2436) : _2322;
    float _2446 = _2392 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _2448 = _2386 ? as_type<int>(_2414) : as_type<int>(_2322);
    float _2450 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _2452 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2454 = _2452 != 0;
    out.gl_Position.x = _1909;
    out.gl_Position.y = _1911;
    out.gl_Position.z = _2394;
    out.gl_Position.w = _1883;
    float _2456 = _2350 ? as_type<float>(_2448) : _2322;
    float _2458 = fma(_2426, _2366, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    int _2460 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2462 = _2460 != 0;
    float _2464 = _2428 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2466 = in.m_87.x;
    float _2468 = in.m_87.y;
    float _2470 = in.m_87.z;
    float _2472 = 0.0;
    float _2474 = _2458;
    float _2476 = _2442;
    if (!_2440)
    {
        _2472 = _2314;
    }
    float _2478 = _2472;
    float _2480 = fma(_2456, _2446, -0.5);
    float _2482 = fma(_2464, _2444, -0.5);
    float _2484 = _2378 * _2382;
    float _2486 = -_2378;
    float _2488 = _2486 + 1.0;
    float _2490 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2492 = -_802;
    float _2494 = fma(_970, _2482, _2492);
    float _2496 = _2478;
    if (_2440)
    {
        float _2498 = -_2314;
        float _2500 = _2498 + 1.0;
        _850 = as_type<int>(_2500);
    }
    int _2502 = _850;
    int _2504 = 0;
    if (_2454)
    {
        float _2506 = -_2314;
        float _2508 = _2506 + 1.0;
        _2504 = as_type<int>(_2508);
    }
    int _2510 = _2504;
    bool _2512 = _1038 != 0.0;
    bool _2514 = isnan(_1038);
    bool _2516 = _2512 || _2514;
    bool _2518 = isnan(0.0);
    bool _2520 = _2516 || _2518;
    float _2522 = _2458 * _2484;
    float _2524 = _2522;
    if (_2462)
    {
        float _2526 = _2328 ? _2414 : _2322;
        _2418 = _2526;
    }
    float _2528 = _2418;
    float _2530 = -_978;
    float _2532 = fma(_828, _2480, _2530);
    if (_2440)
    {
        float _2534 = _2328 ? as_type<float>(_2502) : _2314;
        _2496 = _2534;
    }
    float _2536 = _2496;
    float _2538 = fma(_2488, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2522);
    float _2540 = in.m_89.x;
    float _2542 = in.m_89.y;
    float _2544 = in.m_89.z;
    float _2546 = in.m_89.w;
    if (_2454)
    {
        float _2548 = _2324 ? as_type<float>(_2510) : _2314;
        _2396 = _2548;
    }
    float _2550 = _2396;
    float _2552 = _2450 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2554 = _1036 == 0.0;
    bool _2556 = !_2520;
    bool _2558 = _2554 && _2556;
    float _2560 = fma(_2344, (*spvDescriptorSet0.vp_c9)._m0[132].x, _2538);
    float _2562 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2564 = _2490 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2566 = fma(_2552, _2424, -0.5);
    bool _2568 = _1040 == 0.0;
    bool _2570 = _2568 && _2558;
    float _2572 = _2560 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2574 = fma(_2564, _2536, -0.5);
    float _2576 = fma(_966, _2566, _764);
    float _2578 = _2550 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2580 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2582 = fma(_822, _2574, _976);
    float _2584 = abs(_1266);
    float _2586 = log2(_2584);
    if (_2570)
    {
        _2474 = _2466;
    }
    float _2588 = _2474;
    float _2590 = _2588;
    if (!_2570)
    {
        float _2592 = fma(_1036, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2466);
        _2590 = _2592;
    }
    float _2594 = _2590;
    float _2596 = _2544 * _2466;
    if (_2570)
    {
        _2524 = _2468;
    }
    float _2598 = _2524;
    float _2600 = _2598;
    if (!_2570)
    {
        float _2602 = fma(_1038, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2468);
        _2600 = _2602;
    }
    float _2604 = _2600;
    if (_2570)
    {
        _2420 = _2470;
    }
    float _2606 = _2420;
    float _2608 = -_2596;
    float _2610 = fma(_2540, _2470, _2608);
    float _2612 = _2542 * _2470;
    float _2614 = _2606;
    if (!_2570)
    {
        float _2616 = fma(_1040, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2470);
        _2614 = _2616;
    }
    float _2618 = _2614;
    float _2620 = _2540 * _2468;
    float _2622 = -_2612;
    float _2624 = fma(_2544, _2468, _2622);
    float _2626 = _2494 + 0.5;
    float _2628 = _2586 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2630 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2632 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2634 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2636 = _2528 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2638 = _2630 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2640 = exp2(_2628);
    float _2642 = _2632 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2644 = _2634 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2646 = -_2620;
    float _2648 = fma(_2542, _2466, _2646);
    float _2650 = _2576 + 0.5;
    float _2652 = _2636 * _2580;
    float _2654 = _2578 * _2562;
    out.m_91.x = _2638;
    out.m_91.y = _2642;
    out.m_91.z = _2644;
    out.m_91.w = _2572;
    float _2656 = _1102 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2658 = _2582 + 0.5;
    float _2660 = _2532 + 0.5;
    out.m_93.x = _2654;
    out.m_93.y = _2652;
    float _2662 = -_1096;
    float _2664 = fma(_2662, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2656);
    float _2666 = _1116 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2668 = _2610 * _2546;
    float _2670 = _2624 * _2546;
    out.m_95.x = _2650;
    out.m_95.y = _2626;
    out.m_95.z = _2658;
    out.m_95.w = _2660;
    float _2672 = fma(_1104, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2664);
    bool _2674 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2676 = isnan(0.5);
    bool _2678 = _2674 || _2676;
    bool _2680 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2682 = _2678 || _2680;
    float _2684 = _1102 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2686 = _1102 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2688 = _1116 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2690 = -_1096;
    float _2692 = fma(_2690, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2684);
    float _2694 = -_1096;
    float _2696 = fma(_2694, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2686);
    float _2698 = _1116 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2700 = _2648 * _2546;
    float _2702 = fma(_2640, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2704 = precise::clamp(_2702, 0.0, 1.0);
    float _2706 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2688);
    float _2708 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2698);
    float _2710 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2666);
    float _2712 = _1124 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2714 = _1124 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2716 = _1124 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2718 = fma(_1104, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2692);
    float _2720 = fma(_1104, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2696);
    float _2722 = fma(_1108, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2712);
    float _2724 = fma(_1108, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2714);
    float _2726 = fma(_1108, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2716);
    float _2728 = fma(_1128, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2708);
    float _2730 = fma(_1128, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2706);
    float _2732 = fma(_1128, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2710);
    float _2734 = _2718 * _2542;
    float _2736 = _2672 * _2542;
    float _2738 = _2720 * _2542;
    float _2740 = _2672 * _2604;
    float _2742 = _2718 * _2604;
    float _2744 = _2668 * _2718;
    float _2746 = _2668 * _2672;
    float _2748 = _2720 * _2604;
    float _2750 = _2668 * _2720;
    float _2752 = fma(_2704, -2.0, 3.0);
    float _2754 = _2704 * _2704;
    float _2756 = fma(_1134, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2722);
    float _2758 = fma(_2728, _2594, _2742);
    float _2760 = fma(_2730, _2540, _2736);
    float _2762 = _2754 * _2752;
    float _2764 = fma(_2728, _2540, _2734);
    float _2766 = fma(_2670, _2728, _2744);
    float _2768 = fma(_2732, _2540, _2738);
    float _2770 = fma(_1134, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2724);
    float _2772 = fma(_2756, _2544, _2764);
    float _2774 = fma(_2700, _2756, _2766);
    float _2776 = _2766;
    float _2778 = _2732;
    if (!_2682)
    {
        _2776 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _2780 = _2776;
    float _2782 = fma(_1134, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2726);
    float _2784 = fma(_2770, _2544, _2760);
    float _2786 = -_2762;
    float _2788 = _2786 + 1.0;
    float _2790 = fma(_2732, _2594, _2748);
    float _2792 = _2780;
    if (!_2682)
    {
        float _2794 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2796 = _2780 + _2794;
        _2792 = _2796;
    }
    float _2798 = _2792;
    float _2800 = fma(_2782, _2544, _2768);
    float _2802 = fma(_2670, _2732, _2750);
    float _2804 = fma(_2670, _2730, _2746);
    float _2806 = _2768;
    if (!_2682)
    {
        float _2808 = 1.0 / _2798;
        _2806 = _2808;
    }
    float _2810 = _2806;
    if (!_2682)
    {
        float _2812 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2814 = _1266 + _2812;
        _2778 = _2814;
    }
    float _2816 = _2778;
    bool _2818 = _1266 <= 8000.0;
    bool _2820 = isnan(_1266);
    bool _2822 = _2818 || _2820;
    bool _2824 = isnan(8000.0);
    bool _2826 = _2822 || _2824;
    float _2828 = float(_2826);
    float _2830 = fma(_2788, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2762);
    float _2832 = fma(_2730, _2594, _2740);
    float _2834 = fma(_2700, _2770, _2804);
    float _2836 = fma(_2700, _2782, _2802);
    float _2838 = _2828 * _2830;
    float _2840 = _2828;
    if (_2682)
    {
        _2398 = 1.0;
    }
    float _2842 = _2398;
    out.m_97.x = _2772;
    out.m_97.y = _2784;
    out.m_97.z = _2800;
    float _2844 = _2842;
    if (!_1887)
    {
        _2840 = 1.0;
    }
    float _2846 = _2840;
    float _2848 = fma(_2756, _2618, _2758);
    float _2850 = _2846;
    if (_1887)
    {
        bool _2852 = _1973 >= _1967;
        bool _2854 = isnan(_1973);
        bool _2856 = _2852 || _2854;
        bool _2858 = isnan(_1967);
        bool _2860 = _2856 || _2858;
        float _2862 = float(_2860);
        _2850 = _2862;
    }
    float _2864 = _2850;
    out.m_99.x = _2774;
    out.m_99.y = _2834;
    out.m_99.z = _2836;
    float _2866 = fma(_2770, _2618, _2832);
    float _2868 = _2864;
    if (!_2682)
    {
        float _2870 = _2816 * _2810;
        float _2872 = precise::clamp(_2870, 0.0, 1.0);
        _2844 = _2872;
    }
    float _2874 = _2844;
    float _2876 = _2838 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2878 = _2864 * _2062;
    float _2880 = fma(_2782, _2618, _2790);
    bool _2882 = _2084 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2884 = isnan(_2084);
    bool _2886 = _2882 || _2884;
    bool _2888 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2890 = _2886 || _2888;
    float _2892 = _1883 * 0.5;
    float _2894 = _2354 * _2876;
    float _2896 = precise::clamp(_2894, 0.0, 1.0);
    float _2898 = -_2434;
    float _2900 = _2898 + 1.0;
    out.m_101.x = _2848;
    out.m_101.y = _2866;
    out.m_101.z = _2880;
    float _2902 = _2394 + _1883;
    float _2904 = _1909 + _1883;
    float _2906 = fma(_1911, -0.5, _2892);
    float _2908 = -_2896;
    float _2910 = fma(_2908, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2912 = _2902 * 0.5;
    float _2914 = _2904 * 0.5;
    float _2916 = -_2878;
    float _2918 = fma(_2916, _2910, 1.0);
    float _2920 = precise::clamp(_2918, 0.0, 1.0);
    float _2922 = _2900;
    float _2924 = _2920;
    if (!_2890)
    {
        _2868 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2926 = _2868;
    out.m_103.x = _2914;
    out.m_103.y = _2906;
    out.m_103.z = _2912;
    out.m_103.w = _1883;
    float _2928 = _1986 * _2442;
    float _2930 = _1986 * _2900;
    float _2932 = _2926;
    float _2934 = _2926;
    if (!_2890)
    {
        _2922 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2936 = _2922;
    float _2938 = _2300 * _2442;
    float _2940 = fma(_2296, _2928, _1980);
    float _2942 = fma(_2298, _2928, _1982);
    float _2944 = _2920 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2946 = fma(_1986, _2938, _1984);
    out.m_105.x = _2304;
    out.m_105.y = _2306;
    out.m_105.z = _2308;
    float _2948 = _2874 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2950 = _2938;
    float _2952 = _2936;
    float _2954 = _2936;
    if (!_2890)
    {
        _2924 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2956 = _2924;
    out.m_107.x = _2944;
    float _2958 = _2956;
    float _2960 = _2956;
    if (!_2890)
    {
        _2000 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2962 = _2000;
    float _2964 = _2962;
    float _2966 = _2962;
    if (!_2890)
    {
        _2950 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2968 = _2950;
    out.m_109.x = _2940;
    out.m_109.y = _2942;
    out.m_109.z = _2946;
    out.m_109.w = _2930;
    float _2970 = _2968;
    float _2972 = _2968;
    if (!_2890)
    {
        _2476 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2974 = _2476;
    bool _2976 = !_2890;
    float _2978 = _2974;
    float _2980 = _2974;
    if (!_2976)
    {
        bool _2982 = _2084 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2984 = isnan(_2084);
        bool _2986 = _2982 || _2984;
        bool _2988 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2990 = _2986 || _2988;
        if (!_2990)
        {
            float _2992 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2994 = _2084 + _2992;
            float _2996 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2998 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2996;
            float _3000 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3002 = _3000 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3004 = 1.0 / _2998;
            float _3006 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3008 = _3006 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3010 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3012 = _3010 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3014 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3016 = _3014 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3018 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3020 = _3018 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3022 = _2994 * _3004;
            float _3024 = precise::clamp(_3022, 0.0, 1.0);
            float _3026 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3028 = _3026 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3030 = fma(_3024, _3002, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3032 = fma(_3024, _3028, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3034 = fma(_3024, _3008, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3036 = fma(_3024, _3012, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3038 = fma(_3024, _3016, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3040 = fma(_3024, _3020, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2966 = _3030;
            _2980 = _3038;
            _2960 = _3034;
            _2972 = _3036;
            _2934 = _3032;
            _2954 = _3040;
            _3042 = true;
        }
        else
        {
            bool _3044 = _2084 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3046 = isnan(_2084);
            bool _3048 = _3044 || _3046;
            bool _3050 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3052 = _3048 || _3050;
            if (!_3052)
            {
                _2958 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3054 = _2958;
            _2960 = _3054;
            if (!_3052)
            {
                _2964 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3056 = _2964;
            _2966 = _3056;
            if (!_3052)
            {
                _2932 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3058 = _2932;
            _2934 = _3058;
            if (!_3052)
            {
                _2970 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3060 = _2970;
            _2972 = _3060;
            if (!_3052)
            {
                _2978 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3062 = _2978;
            _2980 = _3062;
            if (!_3052)
            {
                _2952 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3064 = _2952;
            bool _3066 = !_3052;
            _2954 = _3064;
            if (!_3066)
            {
                bool _3068 = _2084 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3070 = isnan(_2084);
                bool _3072 = _3068 || _3070;
                bool _3074 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3076 = _3072 || _3074;
                if (!_3076)
                {
                    float _3078 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3080 = _2084 + _3078;
                    float _3082 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3084 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3082;
                    float _3086 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3088 = _3086 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3090 = 1.0 / _3084;
                    float _3092 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3094 = _3092 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3096 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3098 = _3096 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3100 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3102 = _3100 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3104 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3106 = _3104 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3108 = _3080 * _3090;
                    float _3110 = precise::clamp(_3108, 0.0, 1.0);
                    float _3112 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3114 = _3112 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3116 = fma(_3110, _3088, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3118 = fma(_3110, _3114, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3120 = fma(_3110, _3094, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3122 = fma(_3110, _3098, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3124 = fma(_3110, _3102, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3126 = fma(_3110, _3106, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2966 = _3116;
                    _2980 = _3124;
                    _2960 = _3120;
                    _2972 = _3122;
                    _2934 = _3118;
                    _2954 = _3126;
                    _3042 = true;
                }
                else
                {
                    _2966 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2980 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2960 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2972 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2934 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2954 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3042 = false;
    float _3128 = _2966;
    float _3130 = _2980;
    float _3132 = _2960;
    float _3134 = _2972;
    float _3136 = _2934;
    float _3138 = _2954;
    float _3140 = fma(_2866, -0.5, 0.5);
    float _3142 = precise::clamp(_3140, 0.0, 1.0);
    float _3144 = -_3128;
    float _3146 = _3144 + _3130;
    float _3148 = -_3132;
    float _3150 = _3148 + _3134;
    out.m_111.x = 0.0;
    float _3152 = -_3136;
    float _3154 = _3152 + _3138;
    float _3156 = fma(_3142, _3146, _3128);
    float _3158 = fma(_3142, _3150, _3132);
    bool _3160 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3162 = _3156 * 0.586610972881317138671875;
    float _3164 = fma(_3142, _3154, _3136);
    float _3166 = _2948 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3168 = fma(_3158, 0.298911988735198974609375, _3162);
    bool _3170 = _2874 > 0.0;
    bool _3172 = isnan(_2874);
    bool _3174 = _3170 || _3172;
    bool _3176 = isnan(0.0);
    bool _3178 = _3174 || _3176;
    float _3180 = fma(_3164, 0.114477999508380889892578125, _3168);
    out.m_61.x = _3166;
    float _3182 = -_3180;
    float _3184 = _3156 + _3182;
    float _3186 = -_3180;
    float _3188 = _3158 + _3186;
    float _3190 = -_3180;
    float _3192 = _3164 + _3190;
    float _3194 = fma(_3184, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3180);
    float _3196 = fma(_3188, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3180);
    float _3198 = fma(_3192, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3180);
    bool _3200 = !_3160;
    if (!_3200)
    {
        float _3202 = -_1771;
        float _3204 = _3202 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3206 = -_1773;
        float _3208 = _3206 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3210 = -_1777;
        float _3212 = _3210 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3214 = _3204 * _3204;
        float _3216 = fma(_3208, _3208, _3214);
        float _3218 = fma(_3212, _3212, _3216);
        float _3220 = sqrt(_3218);
        float _3222 = rsqrt(_3218);
        float _3224 = -_3220;
        float _3226 = _3224 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3228 = _3226 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3230 = precise::clamp(_3228, 0.0, 1.0);
        float _3232 = _3208 * _3222;
        float _3234 = _3204 * _3222;
        float _3236 = abs(_3230);
        float _3238 = log2(_3236);
        float _3240 = _3212 * _3222;
        float _3242 = _3232 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3244 = _2866 * _3234;
        float _3246 = -_3234;
        float _3248 = -_3242;
        float _3250 = fma(_3246, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3248);
        float _3252 = fma(_2848, _3232, _3244);
        float _3254 = -_3240;
        float _3256 = fma(_3254, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3250);
        float _3258 = fma(_2880, _3240, _3252);
        float _3260 = precise::clamp(_3258, 0.0, 1.0);
        float _3262 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3264 = _3256 + _3262;
        float _3266 = _3238 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3268 = _3264 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3270 = precise::clamp(_3268, 0.0, 1.0);
        float _3272 = exp2(_3266);
        float _3274 = _3272 * _3270;
        float _3276 = _3260 * _3274;
        float _3278 = _3276 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3280 = _3276 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3282 = _3276 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_111.x = _3278;
        out.m_111.y = _3280;
        out.m_111.z = _3282;
    }
    out.m_113.x = _3196;
    out.m_113.y = _3194;
    out.m_113.z = _3198;
    if (_3178)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_61.x = 0.0;
    float _3284 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3284;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_113 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_111 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_109 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3042 = false;
    bool _628 = false;
    bool _474 = false;
    bool _252 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _127 = in.m_58.w;
    float _129 = trunc(_127);
    int _132 = int(_129);
    bool _136 = _132 >= 1;
    float _138 = 0.0;
    if (!_136)
    {
        _138 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _138;
    float _142 = _140;
    if (!_136)
    {
        out.m_61.x = 0.0;
    }
    int _144 = 0;
    if (!_136)
    {
        float _146 = _140 * 5.0;
        _144 = as_type<int>(_146);
    }
    int _148 = _144;
    int _150 = _148;
    if (!_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3341 = as_type<float>(_148);
        out.gl_Position.z = _3341;
    }
    if (!_136)
    {
        return out;
    }
    float _152 = in.m_63.w;
    bool _154 = _152 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _156 = isnan(_152);
    bool _158 = _154 || _156;
    bool _160 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _162 = _158 || _160;
    float _164 = -_152;
    float _166 = _164 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _168 = _166;
    if (_162)
    {
        float _170 = float(_132);
        _142 = _170;
    }
    float _172 = _142;
    bool _174 = _166 >= _172;
    bool _176 = !_162;
    bool _178 = _174 || _176;
    float _180 = _172;
    if (_178)
    {
        _180 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _182 = _180;
    if (_178)
    {
        out.m_61.x = 0.0;
    }
    if (_178)
    {
        float _184 = _182 * 5.0;
        _150 = as_type<int>(_184);
    }
    int _186 = _150;
    if (_178)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3411 = as_type<float>(_186);
        out.gl_Position.z = _3411;
    }
    if (_178)
    {
        return out;
    }
    float _188 = in.m_65.x;
    float _190 = in.m_65.y;
    float _192 = in.m_65.z;
    bool _194 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _196 = in.m_67.x;
    float _198 = in.m_67.y;
    float _200 = in.m_67.z;
    float _202 = in.m_69.x;
    float _204 = in.m_69.y;
    float _206 = in.m_69.z;
    float _208 = in.m_71.x;
    float _210 = in.m_71.y;
    float _212 = in.m_71.z;
    float _214 = _190 * _198;
    float _216 = _190 * _204;
    float _218 = fma(_188, _196, _214);
    float _220 = _190 * _210;
    float _222 = fma(_188, _202, _216);
    float _224 = fma(_192, _200, _218);
    float _226 = fma(_188, _208, _220);
    float _228 = fma(_192, _206, _222);
    float _230 = fma(_192, _212, _226);
    bool _232 = !_194;
    float _250;
    if (!_232)
    {
        float _234 = in.m_73.x;
        float _236 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _238 = _234 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _240 = fma(_238, (*spvDescriptorSet0.vp_c9)._m0[12].x, _166);
        float _242 = _240 * _236;
        float _244 = floor(_242);
        float _246 = -_244;
        float _248 = _242 + _246;
        _250 = _248;
        _252 = true;
    }
    else
    {
        float _254 = float(_132);
        float _256 = 1.0 / _254;
        float _258 = _166 * _256;
        _250 = _258;
    }
    _252 = false;
    float _260 = _250;
    float _262 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _264 = _260 + _262;
    float _266 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _268 = _260 + _266;
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _272 = _260 + _270;
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _276 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _274;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _280 = _278 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _284 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _282;
    float _286 = 1.0 / _280;
    bool _288 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _290 = 1.0 / _284;
    float _292 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _294 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _292;
    float _296 = 1.0 / _276;
    float _298 = _264 * _286;
    bool _300 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _302 = isnan(_260);
    bool _304 = _300 || _302;
    bool _306 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _308 = _304 || _306;
    float _310 = float(_308);
    bool _312 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _314 = isnan(_260);
    bool _316 = _312 || _314;
    bool _318 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _320 = _316 || _318;
    float _322 = float(_320);
    float _324 = _268 * _290;
    bool _326 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _328 = isnan(_260);
    bool _330 = _326 || _328;
    bool _332 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _334 = _330 || _332;
    float _336 = float(_334);
    float _338 = -_310;
    float _340 = _338 + 1.0;
    float _342 = _336 * _340;
    bool _344 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _346 = isnan(_260);
    bool _348 = _344 || _346;
    bool _350 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _352 = _348 || _350;
    float _354 = float(_352);
    float _356 = _272 * _296;
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _360 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _358;
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _364 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _362;
    float _366 = -_336;
    float _368 = _366 + 1.0;
    float _370 = fma(_294, _356, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _372 = fma(_360, _356, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _374 = fma(_364, _356, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _376 = -_322;
    float _378 = _376 + 1.0;
    float _380 = _322 * _368;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _384 = _382 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _388 = _386 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _390 = _354 * _378;
    float _392 = -_354;
    float _394 = _392 + 1.0;
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _398 = _396 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _400 = _372 * _390;
    float _402 = _374 * _390;
    float _404 = _370 * _390;
    float _406 = fma(_394, (*spvDescriptorSet0.vp_c9)._m0[143].x, _400);
    float _408 = fma(_394, (*spvDescriptorSet0.vp_c9)._m0[143].y, _402);
    float _410 = fma(_398, _298, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _414 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _412;
    float _416 = fma(_384, _298, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _418 = fma(_388, _298, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _420 = fma(_394, (*spvDescriptorSet0.vp_c9)._m0[143].z, _404);
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _424 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _422;
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _428 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _426;
    float _430 = fma(_410, _380, _406);
    float _432 = fma(_414, _324, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _434 = fma(_424, _324, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _436 = fma(_428, _324, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _438 = fma(_416, _380, _408);
    float _440 = fma(_418, _380, _420);
    float _442 = fma(_434, _342, _430);
    float _444 = fma(_432, _342, _438);
    float _446 = fma(_436, _342, _440);
    float _448 = fma(_310, (*spvDescriptorSet0.vp_c9)._m0[146].x, _442);
    float _450 = fma(_310, (*spvDescriptorSet0.vp_c9)._m0[146].y, _444);
    float _452 = fma(_310, (*spvDescriptorSet0.vp_c9)._m0[146].z, _446);
    bool _454 = !_288;
    float _472;
    if (!_454)
    {
        float _456 = in.m_73.x;
        float _458 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _460 = _456 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _462 = fma(_460, (*spvDescriptorSet0.vp_c9)._m0[11].y, _166);
        float _464 = _462 * _458;
        float _466 = floor(_464);
        float _468 = -_466;
        float _470 = _464 + _468;
        _472 = _470;
        _474 = true;
    }
    else
    {
        float _476 = float(_132);
        float _478 = 1.0 / _476;
        float _480 = _166 * _478;
        _472 = _480;
    }
    _474 = false;
    float _482 = _472;
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _486 = _482 + _484;
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _490 = _488 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _492 = _482 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _494 = isnan(_482);
    bool _496 = _492 || _494;
    bool _498 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _500 = _496 || _498;
    float _502 = float(_500);
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _506 = _504 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _508 = _482 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _510 = isnan(_482);
    bool _512 = _508 || _510;
    bool _514 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _516 = _512 || _514;
    float _518 = float(_516);
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _522 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _520;
    bool _524 = _482 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _526 = isnan(_482);
    bool _528 = _524 || _526;
    bool _530 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _532 = _528 || _530;
    float _534 = float(_532);
    float _536 = 1.0 / _490;
    float _538 = -_502;
    float _540 = _538 + 1.0;
    float _542 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _544 = _482 + _542;
    bool _546 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _548 = 1.0 / _506;
    float _550 = _522 * _536;
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _554 = _552 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _556 = -_534;
    float _558 = _556 + 1.0;
    float _560 = fma(_550, _486, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _562 = _518 * _540;
    float _564 = -_518;
    float _566 = _564 + 1.0;
    float _568 = _502 * _558;
    float _570 = _554 * _548;
    float _572 = _560 * _562;
    float _574 = fma(_570, _544, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _576 = fma(_566, (*spvDescriptorSet0.vp_c9)._m0[115].x, _572);
    float _578 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _580 = fma(_574, _568, _576);
    float _582 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _584 = _578 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _586 = fma(_534, (*spvDescriptorSet0.vp_c9)._m0[117].x, _580);
    float _588 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _590 = _582 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _592 = in.m_75.x;
    float _594 = in.m_75.y;
    float _596 = in.m_75.z;
    float _598 = _586 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _600 = _588 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_77.x = _590;
    out.m_77.y = _600;
    out.m_77.z = _584;
    out.m_77.w = _598;
    float _602 = _452 * _596;
    float _604 = _450 * _594;
    float _606 = _448 * _592;
    bool _608 = !_546;
    float _626;
    if (!_608)
    {
        float _610 = in.m_73.x;
        float _612 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _614 = _610 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _616 = fma(_614, (*spvDescriptorSet0.vp_c9)._m0[11].w, _166);
        float _618 = _616 * _612;
        float _620 = floor(_618);
        float _622 = -_620;
        float _624 = _618 + _622;
        _626 = _624;
        _628 = true;
    }
    else
    {
        float _630 = float(_132);
        float _632 = 1.0 / _630;
        float _634 = _166 * _632;
        _626 = _634;
    }
    _628 = false;
    float _636 = _626;
    float _638 = in.m_58.x;
    float _640 = in.m_58.y;
    float _642 = in.m_58.z;
    float _644 = in.m_67.w;
    float _646 = in.m_71.w;
    float _648 = _198 * _640;
    float _650 = _210 * _640;
    float _652 = fma(_196, _638, _648);
    float _654 = fma(_208, _638, _650);
    float _656 = fma(_200, _642, _652);
    float _658 = fma(_212, _642, _654);
    float _660 = _656 + _644;
    float _662 = _658 + _646;
    float _664 = fma(_660, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _666 = fma(_662, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _668 = floor(_664);
    float _670 = floor(_666);
    float _672 = -_668;
    float _674 = _664 + _672;
    float _676 = -_670;
    float _678 = _666 + _676;
    float2 _4205 = float2(_674, _678);
    float _680 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4205, float2(0.0), isnan(_4205)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4205, float2(0.0), isnan(_4205)), level(0.0)).x;
    float _682 = in.m_73.z;
    float _684 = _204 * _640;
    float _686 = in.m_73.x;
    int _688 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _690 = _688 != 0;
    float _692 = _602 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _694 = in.m_73.y;
    float _696 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _698 = fma(_202, _638, _684);
    float _700 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _702 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _704 = _702 != 0;
    int _706 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _708 = _706 != 0;
    int _710 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _712 = _710 != 0;
    float _714 = fma(_206, _642, _698);
    float _716 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _718 = _682 * 2.0;
    bool _720 = !_712;
    int _722 = _720 ? 0 : 1;
    float _724 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _726 = _686 * 2.0;
    float _728 = floor(_718);
    float _730 = _686 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _732 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _734 = _694 * 2.0;
    float _736 = _694 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _738 = -_696;
    float _740 = fma(_730, 2.0, _738);
    float _742 = _730;
    float _744 = _736;
    if (!_690)
    {
        _742 = _682;
    }
    float _746 = _742;
    float _748 = floor(_726);
    float _750 = fma(_736, -2.0, _700);
    float _752 = _746;
    if (!_690)
    {
        _744 = _694;
    }
    float _754 = _744;
    float _756 = _686 + _694;
    float _758 = _754;
    if (_690)
    {
        _758 = _686;
    }
    float _760 = _758;
    float _762 = -_166;
    float _764 = fma(_762, (*spvDescriptorSet0.vp_c9)._m0[76].x, _740);
    if (_690)
    {
        _752 = _694;
    }
    float _766 = _752;
    float _768 = _756 + (-1.0);
    float _770 = floor(_734);
    bool _772 = _728 > 0.0;
    float _774 = fma(_760, (*spvDescriptorSet0.vp_c9)._m0[83].z, _716);
    bool _776 = _728 >= 0.0;
    bool _778 = isnan(_728);
    bool _780 = _776 || _778;
    bool _782 = isnan(0.0);
    bool _784 = _780 || _782;
    float _786 = fma(_768, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _788 = _728;
    if (!_690)
    {
        _788 = _682;
    }
    float _790 = _788;
    float _792 = _760 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _794 = _790;
    if (_690)
    {
        _794 = _694;
    }
    float _796 = _794;
    float _798 = fma(_766, (*spvDescriptorSet0.vp_c9)._m0[83].w, _724);
    bool _800 = _748 > 0.0;
    float _802 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[76].y, _750);
    bool _804 = _748 >= 0.0;
    bool _806 = isnan(_748);
    bool _808 = _804 || _806;
    bool _810 = isnan(0.0);
    bool _812 = _808 || _810;
    float _814 = _796 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _816 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _818 = log2(_816);
    int _820 = _784 ? 0 : 1;
    float _822 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[82].z, _774);
    bool _824 = !_704;
    int _826 = _824 ? 0 : 1;
    float _828 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[82].w, _798);
    bool _830 = _770 > 0.0;
    bool _832 = _770 >= 0.0;
    bool _834 = isnan(_770);
    bool _836 = _832 || _834;
    bool _838 = isnan(0.0);
    bool _840 = _836 || _838;
    int _842 = ~_820;
    int _844 = _842 + 1;
    int _846 = _844 + 1;
    int _848 = _846;
    int _850 = as_type<int>(_802);
    if (!_772)
    {
        int _852 = ~_820;
        int _854 = _852 + 1;
        _848 = _854;
    }
    int _856 = _848;
    float _858 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _860 = abs(_826);
    float _862 = float(_856);
    float _864 = _818 * _166;
    float _866 = -_858;
    float _868 = fma(_792, 2.0, _866);
    float _870 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _872 = _840 ? 0 : 1;
    float _874 = float(_860);
    float _876 = exp2(_864);
    float _878 = fma(_814, -2.0, _870);
    int _880 = ~_872;
    int _882 = _880 + 1;
    int _884 = _882 + 1;
    float _886 = in.m_79.x;
    float _888 = in.m_79.y;
    float _890 = in.m_79.z;
    int _892 = _884;
    if (!_830)
    {
        int _894 = ~_872;
        int _896 = _894 + 1;
        _892 = _896;
    }
    int _898 = _892;
    float _900 = _874 * _862;
    float _902 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _904 = 1.0 + _902;
    int _906 = _812 ? 0 : 1;
    float _908 = 1.0 / _904;
    float _910 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _912 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _914 = isnan(1.0);
    bool _916 = _912 || _914;
    bool _918 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _920 = _916 || _918;
    int _922 = ~_906;
    int _924 = _922 + 1;
    int _926 = _924 + 1;
    float _928 = fma(_686, (*spvDescriptorSet0.vp_c9)._m0[78].z, _910);
    int _930 = _926;
    if (!_800)
    {
        int _932 = ~_906;
        int _934 = _932 + 1;
        _930 = _934;
    }
    int _936 = _930;
    float _938 = -_876;
    float _940 = _938 + 1.0;
    bool _942 = !_708;
    int _944 = _942 ? 0 : 1;
    float _946 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _948 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _950 = isnan(0.0);
    bool _952 = _948 || _950;
    bool _954 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _956 = _952 || _954;
    float _958 = _900 * (-2.0);
    int _960 = abs(_944);
    float _962 = fma(_694, (*spvDescriptorSet0.vp_c9)._m0[78].w, _946);
    float _964 = _956 ? _940 : 0.0;
    float _966 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[77].z, _928);
    float _968 = float(_960);
    float _970 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[77].w, _962);
    float _972 = float(_936);
    float _974 = -_166;
    float _976 = fma(_974, (*spvDescriptorSet0.vp_c9)._m0[81].x, _868);
    float _978 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[81].y, _878);
    if (_920)
    {
        float _980 = _964 * _908;
        _168 = _980;
    }
    float _982 = _168;
    float _984 = fma(_958, _886, _886);
    int _986 = abs(_722);
    float _988 = _686 + (-0.5);
    float _990 = fma(_786, _958, _786);
    float _992 = _968 * _972;
    float _994 = _694 + _682;
    float _996 = float(_986);
    float _998 = fma(_988, (*spvDescriptorSet0.vp_c9)._m0[196].x, _984);
    float _1000 = float(_898);
    float _1002 = _994 + (-1.0);
    float _1004 = _992 * (-2.0);
    float _1006 = fma(_990, _982, _998);
    float _1008 = _996 * _1000;
    float _1010 = _694 + (-0.5);
    float _1012 = fma(_1002, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1014 = fma(_1004, _888, _888);
    float _1016 = _686 + _682;
    float _1018 = fma(_1012, _1004, _1012);
    float _1020 = fma(_1010, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1014);
    float _1022 = _1016 + (-1.0);
    float _1024 = _1008 * (-2.0);
    float _1026 = _1006 * 0.15915493667125701904296875;
    float _1028 = fma(_1018, _982, _1020);
    float _1030 = fma(_1022, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1032 = fma(_1024, _890, _890);
    float _1034 = _682 + (-0.5);
    float _1036 = in.m_81.x;
    float _1038 = in.m_81.y;
    float _1040 = in.m_81.z;
    float _1042 = _1028 * 0.15915493667125701904296875;
    float _1044 = fma(_1030, _1024, _1030);
    float _1046 = fma(_1034, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1032);
    float _1048 = _1026 * 6.283185482025146484375;
    float _1050 = cos(_1048);
    float _1052 = _606 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1054 = fma(_1044, _982, _1046);
    float _1056 = _604 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1058 = in.m_69.w;
    float _1060 = _1054 * 0.15915493667125701904296875;
    float _1062 = _1042 * 6.283185482025146484375;
    float _1064 = sin(_1062);
    float _1066 = _1042 * 6.283185482025146484375;
    float _1068 = cos(_1066);
    float _1070 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1038);
    float _1072 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1040);
    float _1074 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1036);
    float _1076 = _1026 * 6.283185482025146484375;
    float _1078 = sin(_1076);
    float _1080 = _1070 * _1056;
    float _1082 = _1072 * _692;
    float _1084 = _1050 * _1064;
    float _1086 = _1074 * _1052;
    float _1088 = _1060 * 6.283185482025146484375;
    float _1090 = cos(_1088);
    float _1092 = _1050 * _1068;
    float _1094 = _1060 * 6.283185482025146484375;
    float _1096 = sin(_1094);
    float _1098 = _1078 * _1064;
    float _1100 = _1078 * _1068;
    float _1102 = _1050 * _1090;
    float _1104 = _1078 * _1090;
    float _1106 = _1068 * _1090;
    float _1108 = _1064 * _1090;
    float _1110 = _1102 * _1080;
    float _1112 = _1104 * _1080;
    float _1114 = _714 + _1058;
    float _1116 = fma(_1096, _1092, _1098);
    float _1118 = -_1080;
    float _1120 = _1096 * _1118;
    float _1122 = -_1100;
    float _1124 = fma(_1096, _1084, _1122);
    float _1126 = -_1084;
    float _1128 = fma(_1096, _1100, _1126);
    float _1130 = fma(_1116, _1086, _1110);
    float _1132 = fma(_1106, _1086, _1120);
    float _1134 = fma(_1096, _1098, _1092);
    float _1136 = fma(_1128, _1086, _1112);
    float _1138 = fma(_1124, _1082, _1130);
    float _1140 = fma(_1108, _1082, _1132);
    float _1142 = fma(_1134, _1082, _1136);
    float _1144 = _1138 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1146 = _1138 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1148 = _1138 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1150 = _1114 + _732;
    float _1152 = fma(_1140, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1144);
    float _1154 = fma(_1140, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1146);
    float _1156 = _1114 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1158 = _1114 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1160 = fma(_1142, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1152);
    float _1162 = fma(_1142, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1154);
    float _1164 = fma(_660, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1156);
    float _1166 = fma(_660, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1158);
    float _1168 = _1160 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1170 = _1162 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1172 = fma(_662, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1164);
    float _1174 = fma(_662, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1166);
    float _1176 = _662 + _1168;
    float _1178 = _660 + _1170;
    float _1180 = _1172 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1182 = _1174 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1184 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1186 = _1176 + _1184;
    float _1188 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1190 = _1178 + _1188;
    float _1192 = 1.0 / _1180;
    float _1194 = _1182 + _1180;
    float _1196 = _1186 * _1186;
    float _1198 = fma(_1140, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1148);
    float _1200 = fma(_1190, _1190, _1196);
    float _1202 = fma(_1142, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1198);
    float _1204 = _1150 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1206 = sqrt(_1200);
    float _1208 = _1202 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1210 = fma(_660, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1204);
    float _1212 = _1114 + _1208;
    float _1214 = _1194 * _1192;
    float _1216 = _1214 * 0.5;
    float _1218 = fma(_662, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1210);
    float _1220 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1222 = fma(_1216, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1220);
    float _1224 = _1218 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1226 = trunc(_1224);
    int _1228 = int(_1226);
    bool _1230 = _1206 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1232 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1234 = _1206 + _1232;
    float _1236 = 1.0 / _1222;
    float _1238 = _1060;
    float _1240 = _1206;
    float _1242 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    int _1244 = 2;
    float _1246 = _1212;
    float _1248 = _1178;
    float _1250 = _1176;
    float _1252 = _1224;
    if (_1230)
    {
        float _1254 = _1212 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1238 = _1254;
    }
    float _1256 = _1238;
    float _1258 = _1192;
    if (_1230)
    {
        float _1260 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1258 = _1260;
    }
    float _1262 = _1258;
    float _1264 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1266 = _1236 * _1264;
    float _1268 = 0.0;
    if (_1230)
    {
        float _1270 = rsqrt(_1200);
        _1268 = _1270;
    }
    float _1272 = _1268;
    bool _1274 = _1266 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1276 = _1266 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    if (_1230)
    {
        float _1278 = _1234 * _1262;
        _1240 = _1278;
    }
    float _1280 = _1240;
    float _1282 = _1150 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    if (_1230)
    {
        float _1284 = _1280 * 0.15915493667125701904296875;
        _1242 = _1284;
    }
    float _1286 = _1242;
    bool _1288 = !_1274;
    int _1290 = _1288 ? 0 : 1;
    float _1292 = fma(_660, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1282);
    float _1294 = 0.0;
    if (_1230)
    {
        float _1296 = _1286 * 6.283185482025146484375;
        float _1298 = cos(_1296);
        _1294 = _1298;
    }
    float _1300 = _1294;
    if (!_1274)
    {
        _1244 = 1;
    }
    int _1302 = _1244;
    float _1304 = fma(_662, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1292);
    int _1306 = _1302;
    if (!_1276)
    {
        _1306 = _1290;
    }
    int _1308 = _1306;
    float _1310 = _1304 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    int _1312 = _1308 << 6;
    float _1314 = _1058;
    float _1316 = as_type<float>(_1308);
    if (_1230)
    {
        float _1318 = _1286 * 6.283185482025146484375;
        float _1320 = sin(_1318);
        _1314 = _1320;
    }
    float _1322 = _1314;
    int _1324 = _1312 + 96;
    uint _1327 = uint(int(uint(_1324) >> uint(2)));
    uint _1329 = uint(int(uint(int(_1327)) >> uint(2)));
    int _1331 = int(_1327) & 3;
    float _1333 = (*spvDescriptorSet0.vp_c15)._m0[int(_1329)][_1331];
    int _1335 = int(_1327) + 1;
    uint _1337 = uint(int(uint(_1335) >> uint(2)));
    int _1339 = _1335 & 3;
    float _1341 = (*spvDescriptorSet0.vp_c15)._m0[int(_1337)][_1339];
    float _1343 = 0.0;
    if (_1230)
    {
        float _1345 = _1300 + (-1.0);
        _1343 = _1345;
    }
    float _1347 = _1343;
    float _1349 = trunc(_1310);
    int _1351 = int(_1349);
    int _1353 = _1312 + 104;
    uint _1355 = uint(int(uint(_1353) >> uint(2)));
    uint _1357 = uint(int(uint(int(_1355)) >> uint(2)));
    int _1359 = int(_1355) & 3;
    float _1361 = (*spvDescriptorSet0.vp_c15)._m0[int(_1357)][_1359];
    int _1363 = int(_1355) + 1;
    uint _1365 = uint(int(uint(_1363) >> uint(2)));
    int _1367 = _1363 & 3;
    float _1369 = (*spvDescriptorSet0.vp_c15)._m0[int(_1365)][_1367];
    float _1371 = _1347;
    if (_1230)
    {
        float _1373 = _1347 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1371 = _1373;
    }
    float _1375 = _1371;
    float _1377 = 0.0;
    if (_1230)
    {
        float _1379 = fma(_1322, _1256, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1377 = _1379;
    }
    float _1381 = _1377;
    float _1383 = _1381;
    if (_1230)
    {
        float _1385 = fma(_1212, _1300, _1375);
        _1246 = _1385;
    }
    float _1387 = _1246;
    int _1389 = _1312 + 48;
    uint _1391 = uint(int(uint(_1389) >> uint(2)));
    uint _1393 = uint(int(uint(int(_1391)) >> uint(2)));
    int _1395 = int(_1391) & 3;
    float _1397 = (*spvDescriptorSet0.vp_c15)._m0[int(_1393)][_1395];
    int _1399 = int(_1391) + 1;
    uint _1401 = uint(int(uint(_1399) >> uint(2)));
    int _1403 = _1399 & 3;
    float _1405 = (*spvDescriptorSet0.vp_c15)._m0[int(_1401)][_1403];
    float _1407 = _1387;
    if (_1230)
    {
        float _1409 = _1272 * _1381;
        _1383 = _1409;
    }
    float _1411 = _1383;
    int _1413 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1415 = _1228 + _1413;
    int _1417 = _1415 + 1;
    float _1419 = -_1114;
    float _1421 = _1419 + _1387;
    int _1423 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1425 = _1351 + _1423;
    int _1427 = _1425 + 1;
    int _1429 = _1417;
    if (_1230)
    {
        float _1431 = fma(_1190, _1411, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _1248 = _1431;
    }
    float _1433 = _1248;
    if (_1230)
    {
        float _1435 = fma(_1186, _1411, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1250 = _1435;
    }
    float _1437 = _1250;
    int _1439 = _1312 + 64;
    uint _1441 = uint(int(uint(_1439) >> uint(2)));
    uint _1443 = uint(int(uint(int(_1441)) >> uint(2)));
    int _1445 = int(_1441) & 3;
    float _1447 = (*spvDescriptorSet0.vp_c15)._m0[int(_1443)][_1445];
    int _1449 = int(_1441) + 1;
    uint _1451 = uint(int(uint(_1449) >> uint(2)));
    int _1453 = _1449 & 3;
    float _1455 = (*spvDescriptorSet0.vp_c15)._m0[int(_1451)][_1453];
    bool _1457 = _1417 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1459 = -_660;
    float _1461 = _1459 + _1433;
    int _1463 = _1417 | _1427;
    float _1465 = _1421 * _1421;
    bool _1467 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1469 = isnan(0.5);
    bool _1471 = _1467 || _1469;
    bool _1473 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1475 = _1471 || _1473;
    bool _1477 = _1463 < 0;
    bool _1479 = _1477 || _1457;
    int _1481 = _1312 + 56;
    uint _1483 = uint(int(uint(_1481) >> uint(2)));
    uint _1485 = uint(int(uint(int(_1483)) >> uint(2)));
    int _1487 = int(_1483) & 3;
    float _1489 = (*spvDescriptorSet0.vp_c15)._m0[int(_1485)][_1487];
    int _1491 = int(_1483) + 1;
    uint _1493 = uint(int(uint(_1491) >> uint(2)));
    int _1495 = _1491 & 3;
    float _1497 = (*spvDescriptorSet0.vp_c15)._m0[int(_1493)][_1495];
    float _1499 = -_662;
    float _1501 = _1499 + _1437;
    float _1503 = fma(_1461, _1461, _1465);
    bool _1505 = _1427 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1507 = _1505 || _1479;
    float _1509 = fma(_1501, _1501, _1503);
    int _1511 = _1312 + 72;
    uint _1513 = uint(int(uint(_1511) >> uint(2)));
    uint _1515 = uint(int(uint(int(_1513)) >> uint(2)));
    int _1517 = int(_1513) & 3;
    float _1519 = (*spvDescriptorSet0.vp_c15)._m0[int(_1515)][_1517];
    int _1521 = int(_1513) + 1;
    uint _1523 = uint(int(uint(_1521) >> uint(2)));
    int _1525 = _1521 & 3;
    float _1527 = (*spvDescriptorSet0.vp_c15)._m0[int(_1523)][_1525];
    float _1529 = sqrt(_1509);
    int _1531 = _1312 + 80;
    uint _1533 = uint(int(uint(_1531) >> uint(2)));
    uint _1535 = uint(int(uint(int(_1533)) >> uint(2)));
    int _1537 = int(_1533) & 3;
    float _1539 = (*spvDescriptorSet0.vp_c15)._m0[int(_1535)][_1537];
    int _1541 = int(_1533) + 1;
    uint _1543 = uint(int(uint(_1541) >> uint(2)));
    int _1545 = _1541 & 3;
    float _1547 = (*spvDescriptorSet0.vp_c15)._m0[int(_1543)][_1545];
    float _1549 = _1150 * _1341;
    float _1551 = _1461;
    if (!_1507)
    {
        int _1553 = _1427 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1555 = _1553 + _1417;
        _1429 = _1555;
    }
    int _1557 = _1429;
    float _1559 = fma(_660, _1333, _1549);
    float _1561 = fma(_662, _1361, _1559);
    bool _1563 = _1529 > 0.0;
    float _1565 = _1561 + _1369;
    float _1567 = _1150 * _1405;
    float _1569 = 1.0 / _1565;
    float _1571 = fma(_660, _1397, _1567);
    float _1573 = _1397;
    int _1575 = as_type<int>(_1571);
    float _1577 = _1565;
    if (!_1563)
    {
        _1573 = _1433;
    }
    float _1579 = _1573;
    float _1581 = _1150 * _1455;
    float _1583 = _1455;
    int _1585 = as_type<int>(_1581);
    float _1587 = _1579;
    float _1589 = _1579;
    if (!_1507)
    {
        float _1591 = floor(_1224);
        _1583 = _1591;
    }
    float _1593 = _1583;
    float _1595 = fma(_660, _1447, _1581);
    int _1597 = as_type<int>(_1595);
    if (!_1507)
    {
        int _1599 = _1557 << 2;
        _1585 = _1599;
    }
    int _1601 = _1585;
    float _1603 = fma(_662, _1489, _1571);
    int _1605 = _1601;
    float _1607 = _1519;
    if (!_1507)
    {
        uint _1609 = uint(int(uint(_1557) >> uint(2)));
        _1575 = int(_1609);
    }
    int _1611 = _1575;
    float _1613 = as_type<float>(_1611);
    if (!_1507)
    {
        int _1615 = 12 & _1601;
        _1605 = _1615;
    }
    int _1617 = _1605;
    float _1619 = _1603 + _1497;
    float _1621 = fma(_662, _1519, _1595);
    float _1623 = as_type<float>(_1617);
    if (!_1507)
    {
        int _1625 = _1611 << 4;
        int _1627 = _1625 + _1617;
        _1597 = _1627;
    }
    int _1629 = _1597;
    if (!_1563)
    {
        _1613 = _1387;
    }
    float _1631 = _1613;
    float _1633 = _1621 + _1527;
    float _1635 = _1631;
    if (!_1563)
    {
        _1623 = _1437;
    }
    float _1637 = _1623;
    bool _1639 = !_1563;
    float _1641 = _1637;
    float _1643 = _1637;
    if (!_1639)
    {
        float _1645 = _228 * _228;
        float _1647 = rsqrt(_1509);
        float _1649 = fma(_224, _224, _1645);
        float _1651 = fma(_230, _230, _1649);
        float _1653 = sqrt(_1651);
        float _1655 = _1461 * _1647;
        float _1657 = _1421 * _1647;
        float _1659 = _1501 * _1647;
        bool _1661 = _1653 > 0.0;
        float _1663 = _1653;
        _1551 = _1655;
        if (!_1661)
        {
            _1587 = _1433;
        }
        float _1665 = _1587;
        _1589 = _1665;
        if (!_1661)
        {
            _1663 = _1387;
        }
        float _1667 = _1663;
        _1635 = _1667;
        if (!_1661)
        {
            _1641 = _1437;
        }
        float _1669 = _1641;
        bool _1671 = !_1661;
        _1643 = _1669;
        if (!_1671)
        {
            float _1673 = rsqrt(_1651);
            float _1675 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1677 = _228 * _1673;
            float _1679 = _224 * _1673;
            float _1681 = _230 * _1673;
            float _1683 = _1657 * _1677;
            float _1685 = fma(_1655, _1679, _1683);
            float _1687 = _1675 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1689 = fma(_1659, _1681, _1685);
            float _1691 = _1689 * _1687;
            float _1693 = fma(_228, _1691, _1387);
            float _1695 = fma(_224, _1691, _1433);
            float _1697 = fma(_230, _1691, _1437);
            _1589 = _1695;
            _1635 = _1693;
            _1643 = _1697;
            _1577 = _1691;
        }
    }
    float _1699 = _1589;
    float _1701 = _1635;
    float _1703 = _1643;
    float _1705 = _1577;
    float _1707 = _1551;
    float _1709 = _1701;
    float _1711 = _1703;
    float _1713 = _1705;
    float _1715 = _1707;
    if (_1475)
    {
        _1407 = _1699;
    }
    float _1717 = _1407;
    float _1719 = _1717;
    if (!_1475)
    {
        float _1721 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1723 = _1114 + _1721;
        float _1725 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1727 = _660 + _1725;
        float _1729 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1731 = -_1114;
        float _1733 = _1731 + _1701;
        float _1735 = _1723 * _1723;
        float _1737 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1739 = _662 + _1737;
        float _1741 = fma(_1727, _1727, _1735);
        float _1743 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1745 = fma(_1739, _1739, _1741);
        float _1747 = sqrt(_1745);
        float _1749 = _1729 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1751 = precise::min(_1747, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1753 = _1751 * _1743;
        float _1755 = _1749 * _1753;
        float _1757 = -_660;
        float _1759 = _1757 + _1699;
        float _1761 = -_662;
        float _1763 = _1761 + _1703;
        float _1765 = fma(_1733, _1755, _1114);
        float _1767 = fma(_1759, _1755, _660);
        float _1769 = fma(_1763, _1755, _662);
        _1709 = _1765;
        _1719 = _1767;
        _1607 = _1743;
        _1711 = _1769;
        _1713 = _1755;
    }
    float _1771 = _1709;
    float _1773 = _1719;
    float _1775 = _1607;
    float _1777 = _1711;
    float _1779 = _1713;
    float _1781 = _1771 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1783 = _1619 * _1569;
    float _1785 = _1771 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1787 = _1771 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1789 = fma(_1773, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1781);
    float _1791 = _1633 * _1569;
    float _1793 = _1775;
    if (!_1507)
    {
        int _1795 = _1629 + 400;
        uint _1797 = uint(int(uint(_1795) >> uint(2)));
        uint _1799 = uint(int(uint(int(_1797)) >> uint(2)));
        int _1801 = int(_1797) & 3;
        float _1803 = (*spvDescriptorSet0.vp_c15)._m0[int(_1799)][_1801];
        _1793 = _1803;
    }
    float _1805 = _1793;
    float _1807 = fma(_1773, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1785);
    float _1809 = fma(_1773, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1787);
    float _1811 = fma(_1777, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1789);
    float _1813 = _1771 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1815 = fma(_1777, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1807);
    float _1817 = fma(_1777, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1809);
    float _1819 = _1811 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    int _1821 = _1312 + 88;
    uint _1823 = uint(int(uint(_1821) >> uint(2)));
    uint _1825 = uint(int(uint(int(_1823)) >> uint(2)));
    int _1827 = int(_1823) & 3;
    float _1829 = (*spvDescriptorSet0.vp_c15)._m0[int(_1825)][_1827];
    int _1831 = int(_1823) + 1;
    uint _1833 = uint(int(uint(_1831) >> uint(2)));
    int _1835 = _1831 & 3;
    float _1837 = (*spvDescriptorSet0.vp_c15)._m0[int(_1833)][_1835];
    float _1839 = _1815 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1841 = _1817 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1843 = fma(_1773, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1813);
    float _1845 = _1819 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1847 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    bool _1849 = _1783 >= 0.0;
    float _1851 = fma(_1777, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1843);
    float _1853 = _1839 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1855 = fma(_1841, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1845);
    bool _1857 = _1783 <= 1.0;
    bool _1859 = _1857 && _1849;
    float _1861 = _1779;
    if (!_1507)
    {
        float _1863 = floor(_1310);
        _1861 = _1863;
    }
    float _1865 = _1861;
    float _1867 = -_1853;
    float _1869 = fma(_1867, _1847, 1.0);
    float _1871 = _1851 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1873 = fma(_1839, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1855);
    bool _1875 = _1791 >= 0.0;
    bool _1877 = _1875 && _1859;
    float _1879 = _1819 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1881 = _1819 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1883 = fma(_1871, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1873);
    bool _1885 = _1791 <= 1.0;
    bool _1887 = _1885 && _1877;
    float _1889 = fma(_1841, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1879);
    float _1891 = fma(_1841, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1881);
    float _1893 = 1.0 / _1883;
    float _1895 = _1150 * _1547;
    float _1897 = fma(_1839, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1889);
    float _1899 = fma(_1839, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1891);
    float _1901 = _1865;
    if (!_1507)
    {
        float _1903 = -_1865;
        float _1905 = _1310 + _1903;
        _1715 = _1905;
    }
    float _1907 = _1715;
    float _1909 = fma(_1871, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1897);
    float _1911 = fma(_1871, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1899);
    float _1913 = log2(_1869);
    float _1915 = fma(_660, _1539, _1895);
    if (_1887)
    {
        float _1917 = float(_1308);
        _1316 = _1917;
    }
    float _1919 = _1316;
    if (!_1507)
    {
        float _1921 = -_1593;
        float _1923 = _1224 + _1921;
        _1901 = _1923;
    }
    float _1925 = _1901;
    float _1927 = _1909 * _1893;
    float _1929 = _1911 * _1893;
    float _1931 = _1919;
    if (_1887)
    {
        float _1933 = rint(_1919);
        float _1935 = precise::max(_1933, 0.0);
        uint _1937 = uint(_1935);
        uint _1939 = clamp(_1937, 0u, 65535u);
        _1931 = as_type<float>(_1939);
    }
    float _1941 = _1931;
    float _1943 = fma(_1927, 0.5, 0.5);
    float _1945 = fma(_1929, -0.5, 0.5);
    float _1947 = _1913 * 0.693147182464599609375;
    float _1949 = _1929;
    if (!_1507)
    {
        float _1951 = rint(_1805);
        float _1953 = precise::max(_1951, 0.0);
        uint _1955 = uint(_1953);
        uint _1957 = clamp(_1955, 0u, 65535u);
        _1949 = as_type<float>(_1957);
    }
    float _1959 = _1949;
    float _1961 = fma(_662, _1829, _1915);
    float _1963 = _1961 + _1837;
    float _1965 = _1947 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1967 = _1963 * _1569;
    float _1969 = _1791;
    if (_1887)
    {
        float3 _6293 = float3(_1783, _1791, float(as_type<int>(_1941)));
        float3 _6297 = select(_6293, float3(0.0), isnan(_6293));
        float _1971 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6297.xy, uint(rint(_6297.z)), _1967, level(0.0));
        _1969 = _1971;
    }
    float _1973 = _1969;
    float3 _6307 = float3(_1943, _1945, _1965);
    float _1975 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6307, float3(0.0), isnan(_6307)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6307, float3(0.0), isnan(_6307)), level(0.0)).x;
    float3 _6316 = float3(_1943, _1945, _1965);
    float4 _1978 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6316, float3(0.0), isnan(_6316)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6316, float3(0.0), isnan(_6316)), level(0.0)).xyzw;
    float _1980 = _1978.x;
    float _1982 = _1978.y;
    float _1984 = _1978.z;
    float _1986 = _1978.w;
    float _1988 = _1907;
    if (!_1507)
    {
        float3 _6339 = float3(_1925, _1907, float(as_type<int>(_1959)));
        float3 _6341 = select(_6339, float3(0.0), isnan(_6339));
        float _1990 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6341.xy, uint(rint(_6341.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6341.xy, uint(rint(_6341.z)), level(0.0)).x;
        _1988 = _1990;
    }
    float _1992 = _1988;
    if (_1507)
    {
        _1252 = 1.0;
    }
    float _1994 = _1252;
    float _1996 = _1994;
    float _1998 = _1992;
    float _2000 = _1986;
    if (!_1507)
    {
        int _2002 = _1557 << 4;
        int _2004 = _2002 + 2048;
        uint _2006 = uint(int(uint(_2004) >> uint(2)));
        uint _2008 = uint(int(uint(int(_2006)) >> uint(2)));
        int _2010 = int(_2006) & 3;
        float _2012 = (*spvDescriptorSet0.vp_c15)._m0[int(_2008)][_2010];
        int _2014 = int(_2006) + 1;
        uint _2016 = uint(int(uint(_2014) >> uint(2)));
        int _2018 = _2014 & 3;
        float _2020 = (*spvDescriptorSet0.vp_c15)._m0[int(_2016)][_2018];
        int _2022 = _2004 + 8;
        uint _2024 = uint(int(uint(_2022) >> uint(2)));
        uint _2026 = uint(int(uint(int(_2024)) >> uint(2)));
        int _2028 = int(_2024) & 3;
        float _2030 = (*spvDescriptorSet0.vp_c15)._m0[int(_2026)][_2028];
        int _2032 = int(_2024) + 1;
        uint _2034 = uint(int(uint(_2032) >> uint(2)));
        int _2036 = _2032 & 3;
        float _2038 = (*spvDescriptorSet0.vp_c15)._m0[int(_2034)][_2036];
        float _2040 = _1150 * _2020;
        float _2042 = fma(_660, _2012, _2040);
        float _2044 = fma(_662, _2030, _2042);
        float _2046 = _2044 + _2038;
        float _2048 = precise::clamp(_2046, 0.0, 1.0);
        float _2050 = -_2048;
        float _2052 = _2050 + _1992;
        float _2054 = fma(_2052, 500.0, 1.5);
        float _2056 = exp2(_2054);
        float _2058 = 0.0 + _2056;
        float _2060 = precise::clamp(_2058, 0.0, 1.0);
        _1996 = _2060;
    }
    float _2062 = _1996;
    float _2064 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2066 = _1771 + _2064;
    float _2068 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2070 = _1773 + _2068;
    float _2072 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2074 = _1777 + _2072;
    float _2076 = _2066 * _2066;
    float _2078 = fma(_2070, _2070, _2076);
    float _2080 = fma(_2074, _2074, _2078);
    float _2082 = rsqrt(_2080);
    float _2084 = sqrt(_2080);
    float _2086 = _2082 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2088 = _2070 * _2086;
    float _2090 = _2074 * _2086;
    float _2092 = _2088 * _2088;
    float _2094 = _2090 * _2090;
    float _2096 = _2092 + _2094;
    float _2098 = sqrt(_2096);
    bool _2100 = _2098 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2102 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2104 = _2098 + _2102;
    float _2106 = _1941;
    float _2108 = _2096;
    float _2110 = _2104;
    float _2112 = _2066;
    float _2114 = _2088;
    float _2116 = _2090;
    float _2118 = _2092;
    float _2120 = _2094;
    bool _2122 = _2100;
    if (_2100)
    {
        float _2124 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2106 = _2124;
    }
    float _2126 = _2106;
    if (_2100)
    {
        float _2128 = rsqrt(_2096);
        _2108 = _2128;
    }
    float _2130 = _2108;
    if (_2100)
    {
        float _2132 = _2104 * _2126;
        _2110 = _2132;
    }
    float _2134 = _2110;
    if (_2100)
    {
        float _2136 = _2134 * 0.15915493667125701904296875;
        _1998 = _2136;
    }
    float _2138 = _1998;
    float _2140 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2142 = _660;
    float _2144 = _2140;
    float _2146 = _2138;
    if (_2100)
    {
        float _2148 = _2138 * 6.283185482025146484375;
        float _2150 = sin(_2148);
        _2142 = _2150;
    }
    float _2152 = _2142;
    float _2154 = precise::max(0.0, _2140);
    float _2156 = _2134;
    if (_2100)
    {
        float _2158 = _2138 * 6.283185482025146484375;
        float _2160 = cos(_2158);
        _2156 = _2160;
    }
    float _2162 = _2156;
    float _2164 = -_2086;
    float _2166 = -_2154;
    float _2168 = fma(_2066, _2164, _2166);
    if (_2100)
    {
        float _2170 = _2168 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2112 = _2170;
    }
    float _2172 = _2112;
    float _2174 = _2172;
    float _2176 = _2152;
    if (_2100)
    {
        float _2178 = fma(_2152, _2172, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2174 = _2178;
    }
    float _2180 = _2174;
    float _2182 = _2180;
    if (_2100)
    {
        float _2184 = _2130 * _2180;
        _2176 = _2184;
    }
    float _2186 = _2176;
    if (!_2100)
    {
        _2182 = _2168;
    }
    float _2188 = _2182;
    float _2190 = _2188;
    if (_2100)
    {
        float _2192 = _2162 + (-1.0);
        _2144 = _2192;
    }
    float _2194 = _2144;
    float _2196 = _2194;
    if (_2100)
    {
        float _2198 = _2088 * _2186;
        _2114 = _2198;
    }
    float _2200 = _2114;
    if (_2100)
    {
        float _2202 = _2090 * _2186;
        _2116 = _2202;
    }
    float _2204 = _2116;
    if (_2100)
    {
        float _2206 = _2194 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2196 = _2206;
    }
    float _2208 = _2196;
    if (_2100)
    {
        float _2210 = _2200 * _2200;
        _2118 = _2210;
    }
    float _2212 = _2118;
    if (_2100)
    {
        float _2214 = _2204 * _2204;
        _2120 = _2214;
    }
    float _2216 = _2120;
    if (_2100)
    {
        float _2218 = fma(_2168, _2162, _2208);
        _2190 = _2218;
    }
    float _2220 = _2190;
    float _2222 = fma(_2220, _2220, _2212);
    float _2224 = _2222 + _2216;
    float _2226 = rsqrt(_2224);
    float _2228 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2230 = fma(_2084, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2228);
    float _2232 = precise::clamp(_2230, 0.0, 1.0);
    float _2234 = -_2232;
    float _2236 = _2234 + 1.0;
    float _2238 = abs(_2236);
    float _2240 = log2(_2238);
    float _2242 = _2226 * _2200;
    float _2244 = _2226 * _2220;
    float _2246 = _2226 * _2204;
    float _2248 = _2242 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2250 = -_2248;
    float _2252 = fma(_2244, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2250);
    float _2254 = -_2246;
    float _2256 = fma(_2254, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2252);
    float _2258 = _2240 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2260 = fma(_2256, -0.5, 0.5);
    float _2262 = fma(_2256, 0.5, 0.5);
    float _2264 = exp2(_2258);
    float _2266 = fma(_2262, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2268 = fma(_2262, _2266, -0.212114393711090087890625);
    float _2270 = _2244 + 1.0;
    float _2272 = sqrt(_2260);
    float _2274 = fma(_2262, _2268, 1.570728778839111328125);
    float _2276 = -_2244;
    float _2278 = fma(_2264, _2270, _2276);
    float _2280 = fma(_2278, 0.5, 0.5);
    float _2282 = _2272 * 0.636619746685028076171875;
    float _2284 = fma(_1437, 6.2500002968590706586837768554688e-05, 0.5);
    float _2286 = -_2274;
    float _2288 = fma(_2282, _2286, 1.0);
    float _2290 = fma(_1433, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _6795 = float2(_2288, _2280);
    float3 _2294 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6795, float2(0.0), isnan(_6795)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6795, float2(0.0), isnan(_6795)), level(0.0)).xyz;
    float _2296 = _2294.x;
    float _2298 = _2294.y;
    float _2300 = _2294.z;
    float2 _6809 = float2(_2290, _2284);
    float3 _2302 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_6809, float2(0.0), isnan(_6809)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_6809, float2(0.0), isnan(_6809)), level(0.0)).xyz;
    float _2304 = _2302.x;
    float _2306 = _2302.y;
    float _2308 = _2302.z;
    float _2310 = in.m_73.w;
    float _2312 = _2240 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2314 = in.m_83.x;
    int _2316 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2318 = _2316 != 0;
    float _2320 = _1819 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2322 = in.m_83.y;
    bool _2324 = _694 > 0.5;
    float _2326 = exp2(_2312);
    bool _2328 = _682 > 0.5;
    float _2330 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2332 = _2330 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2334 = _636 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2336 = isnan(_636);
    bool _2338 = _2334 || _2336;
    bool _2340 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2342 = _2338 || _2340;
    float _2344 = float(_2342);
    float _2346 = fma(_1841, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2320);
    int _2348 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2350 = _2348 != 0;
    float _2352 = -_680;
    float _2354 = _2352 + 1.0;
    float _2356 = 1.0 / _2332;
    int _2358 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[132].x);
    if (_2318)
    {
        bool _2360 = _686 > 0.5;
        _2122 = _2360;
    }
    bool _2362 = _2122;
    float _2364 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2366 = _636 + _2364;
    bool _2368 = _636 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2370 = isnan(_636);
    bool _2372 = _2368 || _2370;
    bool _2374 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2376 = _2372 || _2374;
    float _2378 = float(_2376);
    float _2380 = -_2344;
    float _2382 = _2380 + 1.0;
    float _2384 = fma(_1839, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2346);
    bool _2386 = _2310 > 0.5;
    float _2388 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2390 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2388;
    float _2392 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2394 = fma(_1871, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2384);
    float _2396 = _2314;
    float _2398 = _2384;
    if (_2318)
    {
        float _2400 = -_2314;
        float _2402 = _2400 + 1.0;
        _2358 = as_type<int>(_2402);
    }
    int _2404 = _2358;
    if (!_2318)
    {
        _2146 = _2314;
    }
    float _2406 = _2146;
    float _2408 = -_2326;
    float _2410 = _2408 + 1.0;
    float _2412 = -_2322;
    float _2414 = _2412 + 1.0;
    float _2416 = _2406;
    float _2418 = _2322;
    float _2420 = _2414;
    if (_2318)
    {
        float _2422 = _2362 ? as_type<float>(_2404) : _2314;
        _2416 = _2422;
    }
    float _2424 = _2416;
    float _2426 = _2390 * _2356;
    float _2428 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2430 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2432 = _2430 != 0;
    float _2434 = _2410 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _2436 = _2324 ? as_type<int>(_2414) : as_type<int>(_2322);
    out.m_85.x = 1.0;
    out.m_85.y = 1.0;
    out.m_85.z = 1.0;
    int _2438 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2440 = _2438 != 0;
    float _2442 = _2434 * _1975;
    float _2444 = _2432 ? as_type<float>(_2436) : _2322;
    float _2446 = _2392 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _2448 = _2386 ? as_type<int>(_2414) : as_type<int>(_2322);
    float _2450 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _2452 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2454 = _2452 != 0;
    out.gl_Position.x = _1909;
    out.gl_Position.y = _1911;
    out.gl_Position.z = _2394;
    out.gl_Position.w = _1883;
    float _2456 = _2350 ? as_type<float>(_2448) : _2322;
    float _2458 = fma(_2426, _2366, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    int _2460 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2462 = _2460 != 0;
    float _2464 = _2428 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2466 = in.m_87.x;
    float _2468 = in.m_87.y;
    float _2470 = in.m_87.z;
    float _2472 = 0.0;
    float _2474 = _2458;
    float _2476 = _2442;
    if (!_2440)
    {
        _2472 = _2314;
    }
    float _2478 = _2472;
    float _2480 = fma(_2456, _2446, -0.5);
    float _2482 = fma(_2464, _2444, -0.5);
    float _2484 = _2378 * _2382;
    float _2486 = -_2378;
    float _2488 = _2486 + 1.0;
    float _2490 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2492 = -_802;
    float _2494 = fma(_970, _2482, _2492);
    float _2496 = _2478;
    if (_2440)
    {
        float _2498 = -_2314;
        float _2500 = _2498 + 1.0;
        _850 = as_type<int>(_2500);
    }
    int _2502 = _850;
    int _2504 = 0;
    if (_2454)
    {
        float _2506 = -_2314;
        float _2508 = _2506 + 1.0;
        _2504 = as_type<int>(_2508);
    }
    int _2510 = _2504;
    bool _2512 = _1038 != 0.0;
    bool _2514 = isnan(_1038);
    bool _2516 = _2512 || _2514;
    bool _2518 = isnan(0.0);
    bool _2520 = _2516 || _2518;
    float _2522 = _2458 * _2484;
    float _2524 = _2522;
    if (_2462)
    {
        float _2526 = _2328 ? _2414 : _2322;
        _2418 = _2526;
    }
    float _2528 = _2418;
    float _2530 = -_978;
    float _2532 = fma(_828, _2480, _2530);
    if (_2440)
    {
        float _2534 = _2328 ? as_type<float>(_2502) : _2314;
        _2496 = _2534;
    }
    float _2536 = _2496;
    float _2538 = fma(_2488, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2522);
    float _2540 = in.m_89.x;
    float _2542 = in.m_89.y;
    float _2544 = in.m_89.z;
    float _2546 = in.m_89.w;
    if (_2454)
    {
        float _2548 = _2324 ? as_type<float>(_2510) : _2314;
        _2396 = _2548;
    }
    float _2550 = _2396;
    float _2552 = _2450 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2554 = _1036 == 0.0;
    bool _2556 = !_2520;
    bool _2558 = _2554 && _2556;
    float _2560 = fma(_2344, (*spvDescriptorSet0.vp_c9)._m0[132].x, _2538);
    float _2562 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2564 = _2490 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2566 = fma(_2552, _2424, -0.5);
    bool _2568 = _1040 == 0.0;
    bool _2570 = _2568 && _2558;
    float _2572 = _2560 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2574 = fma(_2564, _2536, -0.5);
    float _2576 = fma(_966, _2566, _764);
    float _2578 = _2550 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2580 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2582 = fma(_822, _2574, _976);
    float _2584 = abs(_1266);
    float _2586 = log2(_2584);
    if (_2570)
    {
        _2474 = _2466;
    }
    float _2588 = _2474;
    float _2590 = _2588;
    if (!_2570)
    {
        float _2592 = fma(_1036, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2466);
        _2590 = _2592;
    }
    float _2594 = _2590;
    float _2596 = _2544 * _2466;
    if (_2570)
    {
        _2524 = _2468;
    }
    float _2598 = _2524;
    float _2600 = _2598;
    if (!_2570)
    {
        float _2602 = fma(_1038, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2468);
        _2600 = _2602;
    }
    float _2604 = _2600;
    if (_2570)
    {
        _2420 = _2470;
    }
    float _2606 = _2420;
    float _2608 = -_2596;
    float _2610 = fma(_2540, _2470, _2608);
    float _2612 = _2542 * _2470;
    float _2614 = _2606;
    if (!_2570)
    {
        float _2616 = fma(_1040, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2470);
        _2614 = _2616;
    }
    float _2618 = _2614;
    float _2620 = _2540 * _2468;
    float _2622 = -_2612;
    float _2624 = fma(_2544, _2468, _2622);
    float _2626 = _2494 + 0.5;
    float _2628 = _2586 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2630 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2632 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2634 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2636 = _2528 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2638 = _2630 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2640 = exp2(_2628);
    float _2642 = _2632 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2644 = _2634 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2646 = -_2620;
    float _2648 = fma(_2542, _2466, _2646);
    float _2650 = _2576 + 0.5;
    float _2652 = _2636 * _2580;
    float _2654 = _2578 * _2562;
    out.m_91.x = _2638;
    out.m_91.y = _2642;
    out.m_91.z = _2644;
    out.m_91.w = _2572;
    float _2656 = _1102 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2658 = _2582 + 0.5;
    float _2660 = _2532 + 0.5;
    out.m_93.x = _2654;
    out.m_93.y = _2652;
    float _2662 = -_1096;
    float _2664 = fma(_2662, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2656);
    float _2666 = _1116 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2668 = _2610 * _2546;
    float _2670 = _2624 * _2546;
    out.m_95.x = _2650;
    out.m_95.y = _2626;
    out.m_95.z = _2658;
    out.m_95.w = _2660;
    float _2672 = fma(_1104, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2664);
    bool _2674 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2676 = isnan(0.5);
    bool _2678 = _2674 || _2676;
    bool _2680 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2682 = _2678 || _2680;
    float _2684 = _1102 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2686 = _1102 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2688 = _1116 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2690 = -_1096;
    float _2692 = fma(_2690, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2684);
    float _2694 = -_1096;
    float _2696 = fma(_2694, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2686);
    float _2698 = _1116 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2700 = _2648 * _2546;
    float _2702 = fma(_2640, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2704 = precise::clamp(_2702, 0.0, 1.0);
    float _2706 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2688);
    float _2708 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2698);
    float _2710 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2666);
    float _2712 = _1124 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2714 = _1124 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2716 = _1124 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2718 = fma(_1104, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2692);
    float _2720 = fma(_1104, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2696);
    float _2722 = fma(_1108, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2712);
    float _2724 = fma(_1108, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2714);
    float _2726 = fma(_1108, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2716);
    float _2728 = fma(_1128, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2708);
    float _2730 = fma(_1128, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2706);
    float _2732 = fma(_1128, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2710);
    float _2734 = _2718 * _2542;
    float _2736 = _2672 * _2542;
    float _2738 = _2720 * _2542;
    float _2740 = _2672 * _2604;
    float _2742 = _2718 * _2604;
    float _2744 = _2668 * _2718;
    float _2746 = _2668 * _2672;
    float _2748 = _2720 * _2604;
    float _2750 = _2668 * _2720;
    float _2752 = fma(_2704, -2.0, 3.0);
    float _2754 = _2704 * _2704;
    float _2756 = fma(_1134, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2722);
    float _2758 = fma(_2728, _2594, _2742);
    float _2760 = fma(_2730, _2540, _2736);
    float _2762 = _2754 * _2752;
    float _2764 = fma(_2728, _2540, _2734);
    float _2766 = fma(_2670, _2728, _2744);
    float _2768 = fma(_2732, _2540, _2738);
    float _2770 = fma(_1134, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2724);
    float _2772 = fma(_2756, _2544, _2764);
    float _2774 = fma(_2700, _2756, _2766);
    float _2776 = _2766;
    float _2778 = _2732;
    if (!_2682)
    {
        _2776 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _2780 = _2776;
    float _2782 = fma(_1134, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2726);
    float _2784 = fma(_2770, _2544, _2760);
    float _2786 = -_2762;
    float _2788 = _2786 + 1.0;
    float _2790 = fma(_2732, _2594, _2748);
    float _2792 = _2780;
    if (!_2682)
    {
        float _2794 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2796 = _2780 + _2794;
        _2792 = _2796;
    }
    float _2798 = _2792;
    float _2800 = fma(_2782, _2544, _2768);
    float _2802 = fma(_2670, _2732, _2750);
    float _2804 = fma(_2670, _2730, _2746);
    float _2806 = _2768;
    if (!_2682)
    {
        float _2808 = 1.0 / _2798;
        _2806 = _2808;
    }
    float _2810 = _2806;
    if (!_2682)
    {
        float _2812 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2814 = _1266 + _2812;
        _2778 = _2814;
    }
    float _2816 = _2778;
    bool _2818 = _1266 <= 8000.0;
    bool _2820 = isnan(_1266);
    bool _2822 = _2818 || _2820;
    bool _2824 = isnan(8000.0);
    bool _2826 = _2822 || _2824;
    float _2828 = float(_2826);
    float _2830 = fma(_2788, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2762);
    float _2832 = fma(_2730, _2594, _2740);
    float _2834 = fma(_2700, _2770, _2804);
    float _2836 = fma(_2700, _2782, _2802);
    float _2838 = _2828 * _2830;
    float _2840 = _2828;
    if (_2682)
    {
        _2398 = 1.0;
    }
    float _2842 = _2398;
    out.m_97.x = _2772;
    out.m_97.y = _2784;
    out.m_97.z = _2800;
    float _2844 = _2842;
    if (!_1887)
    {
        _2840 = 1.0;
    }
    float _2846 = _2840;
    float _2848 = fma(_2756, _2618, _2758);
    float _2850 = _2846;
    if (_1887)
    {
        bool _2852 = _1973 >= _1967;
        bool _2854 = isnan(_1973);
        bool _2856 = _2852 || _2854;
        bool _2858 = isnan(_1967);
        bool _2860 = _2856 || _2858;
        float _2862 = float(_2860);
        _2850 = _2862;
    }
    float _2864 = _2850;
    out.m_99.x = _2774;
    out.m_99.y = _2834;
    out.m_99.z = _2836;
    float _2866 = fma(_2770, _2618, _2832);
    float _2868 = _2864;
    if (!_2682)
    {
        float _2870 = _2816 * _2810;
        float _2872 = precise::clamp(_2870, 0.0, 1.0);
        _2844 = _2872;
    }
    float _2874 = _2844;
    float _2876 = _2838 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2878 = _2864 * _2062;
    float _2880 = fma(_2782, _2618, _2790);
    bool _2882 = _2084 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2884 = isnan(_2084);
    bool _2886 = _2882 || _2884;
    bool _2888 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2890 = _2886 || _2888;
    float _2892 = _1883 * 0.5;
    float _2894 = _2354 * _2876;
    float _2896 = precise::clamp(_2894, 0.0, 1.0);
    float _2898 = -_2434;
    float _2900 = _2898 + 1.0;
    out.m_101.x = _2848;
    out.m_101.y = _2866;
    out.m_101.z = _2880;
    float _2902 = _2394 + _1883;
    float _2904 = _1909 + _1883;
    float _2906 = fma(_1911, -0.5, _2892);
    float _2908 = -_2896;
    float _2910 = fma(_2908, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2912 = _2902 * 0.5;
    float _2914 = _2904 * 0.5;
    float _2916 = -_2878;
    float _2918 = fma(_2916, _2910, 1.0);
    float _2920 = precise::clamp(_2918, 0.0, 1.0);
    float _2922 = _2900;
    float _2924 = _2920;
    if (!_2890)
    {
        _2868 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2926 = _2868;
    out.m_103.x = _2914;
    out.m_103.y = _2906;
    out.m_103.z = _2912;
    out.m_103.w = _1883;
    float _2928 = _1986 * _2442;
    float _2930 = _1986 * _2900;
    float _2932 = _2926;
    float _2934 = _2926;
    if (!_2890)
    {
        _2922 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2936 = _2922;
    float _2938 = _2300 * _2442;
    float _2940 = fma(_2296, _2928, _1980);
    float _2942 = fma(_2298, _2928, _1982);
    float _2944 = _2920 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2946 = fma(_1986, _2938, _1984);
    out.m_105.x = _2304;
    out.m_105.y = _2306;
    out.m_105.z = _2308;
    float _2948 = _2874 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2950 = _2938;
    float _2952 = _2936;
    float _2954 = _2936;
    if (!_2890)
    {
        _2924 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2956 = _2924;
    out.m_107.x = _2944;
    float _2958 = _2956;
    float _2960 = _2956;
    if (!_2890)
    {
        _2000 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2962 = _2000;
    float _2964 = _2962;
    float _2966 = _2962;
    if (!_2890)
    {
        _2950 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2968 = _2950;
    out.m_109.x = _2940;
    out.m_109.y = _2942;
    out.m_109.z = _2946;
    out.m_109.w = _2930;
    float _2970 = _2968;
    float _2972 = _2968;
    if (!_2890)
    {
        _2476 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2974 = _2476;
    bool _2976 = !_2890;
    float _2978 = _2974;
    float _2980 = _2974;
    if (!_2976)
    {
        bool _2982 = _2084 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2984 = isnan(_2084);
        bool _2986 = _2982 || _2984;
        bool _2988 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2990 = _2986 || _2988;
        if (!_2990)
        {
            float _2992 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2994 = _2084 + _2992;
            float _2996 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2998 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2996;
            float _3000 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3002 = _3000 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3004 = 1.0 / _2998;
            float _3006 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3008 = _3006 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3010 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3012 = _3010 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3014 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3016 = _3014 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3018 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3020 = _3018 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3022 = _2994 * _3004;
            float _3024 = precise::clamp(_3022, 0.0, 1.0);
            float _3026 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3028 = _3026 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3030 = fma(_3024, _3002, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3032 = fma(_3024, _3028, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3034 = fma(_3024, _3008, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3036 = fma(_3024, _3012, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3038 = fma(_3024, _3016, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3040 = fma(_3024, _3020, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2966 = _3030;
            _2980 = _3038;
            _2960 = _3034;
            _2972 = _3036;
            _2934 = _3032;
            _2954 = _3040;
            _3042 = true;
        }
        else
        {
            bool _3044 = _2084 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3046 = isnan(_2084);
            bool _3048 = _3044 || _3046;
            bool _3050 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3052 = _3048 || _3050;
            if (!_3052)
            {
                _2958 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3054 = _2958;
            _2960 = _3054;
            if (!_3052)
            {
                _2964 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3056 = _2964;
            _2966 = _3056;
            if (!_3052)
            {
                _2932 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3058 = _2932;
            _2934 = _3058;
            if (!_3052)
            {
                _2970 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3060 = _2970;
            _2972 = _3060;
            if (!_3052)
            {
                _2978 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3062 = _2978;
            _2980 = _3062;
            if (!_3052)
            {
                _2952 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3064 = _2952;
            bool _3066 = !_3052;
            _2954 = _3064;
            if (!_3066)
            {
                bool _3068 = _2084 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3070 = isnan(_2084);
                bool _3072 = _3068 || _3070;
                bool _3074 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3076 = _3072 || _3074;
                if (!_3076)
                {
                    float _3078 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3080 = _2084 + _3078;
                    float _3082 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3084 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3082;
                    float _3086 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3088 = _3086 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3090 = 1.0 / _3084;
                    float _3092 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3094 = _3092 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3096 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3098 = _3096 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3100 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3102 = _3100 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3104 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3106 = _3104 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3108 = _3080 * _3090;
                    float _3110 = precise::clamp(_3108, 0.0, 1.0);
                    float _3112 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3114 = _3112 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3116 = fma(_3110, _3088, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3118 = fma(_3110, _3114, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3120 = fma(_3110, _3094, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3122 = fma(_3110, _3098, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3124 = fma(_3110, _3102, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3126 = fma(_3110, _3106, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2966 = _3116;
                    _2980 = _3124;
                    _2960 = _3120;
                    _2972 = _3122;
                    _2934 = _3118;
                    _2954 = _3126;
                    _3042 = true;
                }
                else
                {
                    _2966 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2980 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2960 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2972 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2934 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2954 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3042 = false;
    float _3128 = _2966;
    float _3130 = _2980;
    float _3132 = _2960;
    float _3134 = _2972;
    float _3136 = _2934;
    float _3138 = _2954;
    float _3140 = fma(_2866, -0.5, 0.5);
    float _3142 = precise::clamp(_3140, 0.0, 1.0);
    float _3144 = -_3128;
    float _3146 = _3144 + _3130;
    float _3148 = -_3132;
    float _3150 = _3148 + _3134;
    out.m_111.x = 0.0;
    float _3152 = -_3136;
    float _3154 = _3152 + _3138;
    float _3156 = fma(_3142, _3146, _3128);
    float _3158 = fma(_3142, _3150, _3132);
    bool _3160 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3162 = _3156 * 0.586610972881317138671875;
    float _3164 = fma(_3142, _3154, _3136);
    float _3166 = _2948 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3168 = fma(_3158, 0.298911988735198974609375, _3162);
    bool _3170 = _2874 > 0.0;
    bool _3172 = isnan(_2874);
    bool _3174 = _3170 || _3172;
    bool _3176 = isnan(0.0);
    bool _3178 = _3174 || _3176;
    float _3180 = fma(_3164, 0.114477999508380889892578125, _3168);
    out.m_61.x = _3166;
    float _3182 = -_3180;
    float _3184 = _3156 + _3182;
    float _3186 = -_3180;
    float _3188 = _3158 + _3186;
    float _3190 = -_3180;
    float _3192 = _3164 + _3190;
    float _3194 = fma(_3184, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3180);
    float _3196 = fma(_3188, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3180);
    float _3198 = fma(_3192, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3180);
    bool _3200 = !_3160;
    if (!_3200)
    {
        float _3202 = -_1771;
        float _3204 = _3202 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3206 = -_1773;
        float _3208 = _3206 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3210 = -_1777;
        float _3212 = _3210 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3214 = _3204 * _3204;
        float _3216 = fma(_3208, _3208, _3214);
        float _3218 = fma(_3212, _3212, _3216);
        float _3220 = sqrt(_3218);
        float _3222 = rsqrt(_3218);
        float _3224 = -_3220;
        float _3226 = _3224 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3228 = _3226 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3230 = precise::clamp(_3228, 0.0, 1.0);
        float _3232 = _3208 * _3222;
        float _3234 = _3204 * _3222;
        float _3236 = abs(_3230);
        float _3238 = log2(_3236);
        float _3240 = _3212 * _3222;
        float _3242 = _3232 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3244 = _2866 * _3234;
        float _3246 = -_3234;
        float _3248 = -_3242;
        float _3250 = fma(_3246, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3248);
        float _3252 = fma(_2848, _3232, _3244);
        float _3254 = -_3240;
        float _3256 = fma(_3254, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3250);
        float _3258 = fma(_2880, _3240, _3252);
        float _3260 = precise::clamp(_3258, 0.0, 1.0);
        float _3262 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3264 = _3256 + _3262;
        float _3266 = _3238 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3268 = _3264 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3270 = precise::clamp(_3268, 0.0, 1.0);
        float _3272 = exp2(_3266);
        float _3274 = _3272 * _3270;
        float _3276 = _3260 * _3274;
        float _3278 = _3276 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3280 = _3276 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3282 = _3276 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_111.x = _3278;
        out.m_111.y = _3280;
        out.m_111.z = _3282;
    }
    out.m_113.x = _3196;
    out.m_113.y = _3194;
    out.m_113.z = _3198;
    if (_3178)
    {
        return out;
    }
    out.m_61.x = 0.0;
    float _3284 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3284;
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
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_113 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_111 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_109 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3042 = false;
    bool _628 = false;
    bool _474 = false;
    bool _252 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _127 = in.m_58.w;
    float _129 = trunc(_127);
    int _132 = int(_129);
    bool _136 = _132 >= 1;
    float _138 = 0.0;
    if (!_136)
    {
        _138 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _138;
    float _142 = _140;
    if (!_136)
    {
        out.m_61.x = 0.0;
    }
    int _144 = 0;
    if (!_136)
    {
        float _146 = _140 * 5.0;
        _144 = as_type<int>(_146);
    }
    int _148 = _144;
    int _150 = _148;
    if (!_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3341 = as_type<float>(_148);
        out.gl_Position.z = _3341;
    }
    if (!_136)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_113.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_113.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_113.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_113.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _152 = in.m_63.w;
    bool _154 = _152 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _156 = isnan(_152);
    bool _158 = _154 || _156;
    bool _160 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _162 = _158 || _160;
    float _164 = -_152;
    float _166 = _164 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _168 = _166;
    if (_162)
    {
        float _170 = float(_132);
        _142 = _170;
    }
    float _172 = _142;
    bool _174 = _166 >= _172;
    bool _176 = !_162;
    bool _178 = _174 || _176;
    float _180 = _172;
    if (_178)
    {
        _180 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _182 = _180;
    if (_178)
    {
        out.m_61.x = 0.0;
    }
    if (_178)
    {
        float _184 = _182 * 5.0;
        _150 = as_type<int>(_184);
    }
    int _186 = _150;
    if (_178)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3411 = as_type<float>(_186);
        out.gl_Position.z = _3411;
    }
    if (_178)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_113.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_113.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_113.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_113.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _188 = in.m_65.x;
    float _190 = in.m_65.y;
    float _192 = in.m_65.z;
    bool _194 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _196 = in.m_67.x;
    float _198 = in.m_67.y;
    float _200 = in.m_67.z;
    float _202 = in.m_69.x;
    float _204 = in.m_69.y;
    float _206 = in.m_69.z;
    float _208 = in.m_71.x;
    float _210 = in.m_71.y;
    float _212 = in.m_71.z;
    float _214 = _190 * _198;
    float _216 = _190 * _204;
    float _218 = fma(_188, _196, _214);
    float _220 = _190 * _210;
    float _222 = fma(_188, _202, _216);
    float _224 = fma(_192, _200, _218);
    float _226 = fma(_188, _208, _220);
    float _228 = fma(_192, _206, _222);
    float _230 = fma(_192, _212, _226);
    bool _232 = !_194;
    float _250;
    if (!_232)
    {
        float _234 = in.m_73.x;
        float _236 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _238 = _234 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _240 = fma(_238, (*spvDescriptorSet0.vp_c9)._m0[12].x, _166);
        float _242 = _240 * _236;
        float _244 = floor(_242);
        float _246 = -_244;
        float _248 = _242 + _246;
        _250 = _248;
        _252 = true;
    }
    else
    {
        float _254 = float(_132);
        float _256 = 1.0 / _254;
        float _258 = _166 * _256;
        _250 = _258;
    }
    _252 = false;
    float _260 = _250;
    float _262 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _264 = _260 + _262;
    float _266 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _268 = _260 + _266;
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _272 = _260 + _270;
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _276 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _274;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _280 = _278 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _284 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _282;
    float _286 = 1.0 / _280;
    bool _288 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _290 = 1.0 / _284;
    float _292 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _294 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _292;
    float _296 = 1.0 / _276;
    float _298 = _264 * _286;
    bool _300 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _302 = isnan(_260);
    bool _304 = _300 || _302;
    bool _306 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _308 = _304 || _306;
    float _310 = float(_308);
    bool _312 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _314 = isnan(_260);
    bool _316 = _312 || _314;
    bool _318 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _320 = _316 || _318;
    float _322 = float(_320);
    float _324 = _268 * _290;
    bool _326 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _328 = isnan(_260);
    bool _330 = _326 || _328;
    bool _332 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _334 = _330 || _332;
    float _336 = float(_334);
    float _338 = -_310;
    float _340 = _338 + 1.0;
    float _342 = _336 * _340;
    bool _344 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _346 = isnan(_260);
    bool _348 = _344 || _346;
    bool _350 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _352 = _348 || _350;
    float _354 = float(_352);
    float _356 = _272 * _296;
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _360 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _358;
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _364 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _362;
    float _366 = -_336;
    float _368 = _366 + 1.0;
    float _370 = fma(_294, _356, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _372 = fma(_360, _356, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _374 = fma(_364, _356, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _376 = -_322;
    float _378 = _376 + 1.0;
    float _380 = _322 * _368;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _384 = _382 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _388 = _386 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _390 = _354 * _378;
    float _392 = -_354;
    float _394 = _392 + 1.0;
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _398 = _396 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _400 = _372 * _390;
    float _402 = _374 * _390;
    float _404 = _370 * _390;
    float _406 = fma(_394, (*spvDescriptorSet0.vp_c9)._m0[143].x, _400);
    float _408 = fma(_394, (*spvDescriptorSet0.vp_c9)._m0[143].y, _402);
    float _410 = fma(_398, _298, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _414 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _412;
    float _416 = fma(_384, _298, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _418 = fma(_388, _298, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _420 = fma(_394, (*spvDescriptorSet0.vp_c9)._m0[143].z, _404);
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _424 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _422;
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _428 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _426;
    float _430 = fma(_410, _380, _406);
    float _432 = fma(_414, _324, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _434 = fma(_424, _324, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _436 = fma(_428, _324, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _438 = fma(_416, _380, _408);
    float _440 = fma(_418, _380, _420);
    float _442 = fma(_434, _342, _430);
    float _444 = fma(_432, _342, _438);
    float _446 = fma(_436, _342, _440);
    float _448 = fma(_310, (*spvDescriptorSet0.vp_c9)._m0[146].x, _442);
    float _450 = fma(_310, (*spvDescriptorSet0.vp_c9)._m0[146].y, _444);
    float _452 = fma(_310, (*spvDescriptorSet0.vp_c9)._m0[146].z, _446);
    bool _454 = !_288;
    float _472;
    if (!_454)
    {
        float _456 = in.m_73.x;
        float _458 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _460 = _456 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _462 = fma(_460, (*spvDescriptorSet0.vp_c9)._m0[11].y, _166);
        float _464 = _462 * _458;
        float _466 = floor(_464);
        float _468 = -_466;
        float _470 = _464 + _468;
        _472 = _470;
        _474 = true;
    }
    else
    {
        float _476 = float(_132);
        float _478 = 1.0 / _476;
        float _480 = _166 * _478;
        _472 = _480;
    }
    _474 = false;
    float _482 = _472;
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _486 = _482 + _484;
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _490 = _488 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _492 = _482 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _494 = isnan(_482);
    bool _496 = _492 || _494;
    bool _498 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _500 = _496 || _498;
    float _502 = float(_500);
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _506 = _504 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _508 = _482 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _510 = isnan(_482);
    bool _512 = _508 || _510;
    bool _514 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _516 = _512 || _514;
    float _518 = float(_516);
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _522 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _520;
    bool _524 = _482 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _526 = isnan(_482);
    bool _528 = _524 || _526;
    bool _530 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _532 = _528 || _530;
    float _534 = float(_532);
    float _536 = 1.0 / _490;
    float _538 = -_502;
    float _540 = _538 + 1.0;
    float _542 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _544 = _482 + _542;
    bool _546 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _548 = 1.0 / _506;
    float _550 = _522 * _536;
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _554 = _552 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _556 = -_534;
    float _558 = _556 + 1.0;
    float _560 = fma(_550, _486, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _562 = _518 * _540;
    float _564 = -_518;
    float _566 = _564 + 1.0;
    float _568 = _502 * _558;
    float _570 = _554 * _548;
    float _572 = _560 * _562;
    float _574 = fma(_570, _544, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _576 = fma(_566, (*spvDescriptorSet0.vp_c9)._m0[115].x, _572);
    float _578 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _580 = fma(_574, _568, _576);
    float _582 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _584 = _578 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _586 = fma(_534, (*spvDescriptorSet0.vp_c9)._m0[117].x, _580);
    float _588 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _590 = _582 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _592 = in.m_75.x;
    float _594 = in.m_75.y;
    float _596 = in.m_75.z;
    float _598 = _586 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _600 = _588 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_77.x = _590;
    out.m_77.y = _600;
    out.m_77.z = _584;
    out.m_77.w = _598;
    float _602 = _452 * _596;
    float _604 = _450 * _594;
    float _606 = _448 * _592;
    bool _608 = !_546;
    float _626;
    if (!_608)
    {
        float _610 = in.m_73.x;
        float _612 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _614 = _610 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _616 = fma(_614, (*spvDescriptorSet0.vp_c9)._m0[11].w, _166);
        float _618 = _616 * _612;
        float _620 = floor(_618);
        float _622 = -_620;
        float _624 = _618 + _622;
        _626 = _624;
        _628 = true;
    }
    else
    {
        float _630 = float(_132);
        float _632 = 1.0 / _630;
        float _634 = _166 * _632;
        _626 = _634;
    }
    _628 = false;
    float _636 = _626;
    float _638 = in.m_58.x;
    float _640 = in.m_58.y;
    float _642 = in.m_58.z;
    float _644 = in.m_67.w;
    float _646 = in.m_71.w;
    float _648 = _198 * _640;
    float _650 = _210 * _640;
    float _652 = fma(_196, _638, _648);
    float _654 = fma(_208, _638, _650);
    float _656 = fma(_200, _642, _652);
    float _658 = fma(_212, _642, _654);
    float _660 = _656 + _644;
    float _662 = _658 + _646;
    float _664 = fma(_660, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _666 = fma(_662, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _668 = floor(_664);
    float _670 = floor(_666);
    float _672 = -_668;
    float _674 = _664 + _672;
    float _676 = -_670;
    float _678 = _666 + _676;
    float2 _4205 = float2(_674, _678);
    float _680 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4205, float2(0.0), isnan(_4205)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4205, float2(0.0), isnan(_4205)), level(0.0)).x;
    float _682 = in.m_73.z;
    float _684 = _204 * _640;
    float _686 = in.m_73.x;
    int _688 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _690 = _688 != 0;
    float _692 = _602 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _694 = in.m_73.y;
    float _696 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _698 = fma(_202, _638, _684);
    float _700 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _702 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _704 = _702 != 0;
    int _706 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _708 = _706 != 0;
    int _710 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _712 = _710 != 0;
    float _714 = fma(_206, _642, _698);
    float _716 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _718 = _682 * 2.0;
    bool _720 = !_712;
    int _722 = _720 ? 0 : 1;
    float _724 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _726 = _686 * 2.0;
    float _728 = floor(_718);
    float _730 = _686 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _732 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _734 = _694 * 2.0;
    float _736 = _694 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _738 = -_696;
    float _740 = fma(_730, 2.0, _738);
    float _742 = _730;
    float _744 = _736;
    if (!_690)
    {
        _742 = _682;
    }
    float _746 = _742;
    float _748 = floor(_726);
    float _750 = fma(_736, -2.0, _700);
    float _752 = _746;
    if (!_690)
    {
        _744 = _694;
    }
    float _754 = _744;
    float _756 = _686 + _694;
    float _758 = _754;
    if (_690)
    {
        _758 = _686;
    }
    float _760 = _758;
    float _762 = -_166;
    float _764 = fma(_762, (*spvDescriptorSet0.vp_c9)._m0[76].x, _740);
    if (_690)
    {
        _752 = _694;
    }
    float _766 = _752;
    float _768 = _756 + (-1.0);
    float _770 = floor(_734);
    bool _772 = _728 > 0.0;
    float _774 = fma(_760, (*spvDescriptorSet0.vp_c9)._m0[83].z, _716);
    bool _776 = _728 >= 0.0;
    bool _778 = isnan(_728);
    bool _780 = _776 || _778;
    bool _782 = isnan(0.0);
    bool _784 = _780 || _782;
    float _786 = fma(_768, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _788 = _728;
    if (!_690)
    {
        _788 = _682;
    }
    float _790 = _788;
    float _792 = _760 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _794 = _790;
    if (_690)
    {
        _794 = _694;
    }
    float _796 = _794;
    float _798 = fma(_766, (*spvDescriptorSet0.vp_c9)._m0[83].w, _724);
    bool _800 = _748 > 0.0;
    float _802 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[76].y, _750);
    bool _804 = _748 >= 0.0;
    bool _806 = isnan(_748);
    bool _808 = _804 || _806;
    bool _810 = isnan(0.0);
    bool _812 = _808 || _810;
    float _814 = _796 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _816 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _818 = log2(_816);
    int _820 = _784 ? 0 : 1;
    float _822 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[82].z, _774);
    bool _824 = !_704;
    int _826 = _824 ? 0 : 1;
    float _828 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[82].w, _798);
    bool _830 = _770 > 0.0;
    bool _832 = _770 >= 0.0;
    bool _834 = isnan(_770);
    bool _836 = _832 || _834;
    bool _838 = isnan(0.0);
    bool _840 = _836 || _838;
    int _842 = ~_820;
    int _844 = _842 + 1;
    int _846 = _844 + 1;
    int _848 = _846;
    int _850 = as_type<int>(_802);
    if (!_772)
    {
        int _852 = ~_820;
        int _854 = _852 + 1;
        _848 = _854;
    }
    int _856 = _848;
    float _858 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _860 = abs(_826);
    float _862 = float(_856);
    float _864 = _818 * _166;
    float _866 = -_858;
    float _868 = fma(_792, 2.0, _866);
    float _870 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _872 = _840 ? 0 : 1;
    float _874 = float(_860);
    float _876 = exp2(_864);
    float _878 = fma(_814, -2.0, _870);
    int _880 = ~_872;
    int _882 = _880 + 1;
    int _884 = _882 + 1;
    float _886 = in.m_79.x;
    float _888 = in.m_79.y;
    float _890 = in.m_79.z;
    int _892 = _884;
    if (!_830)
    {
        int _894 = ~_872;
        int _896 = _894 + 1;
        _892 = _896;
    }
    int _898 = _892;
    float _900 = _874 * _862;
    float _902 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _904 = 1.0 + _902;
    int _906 = _812 ? 0 : 1;
    float _908 = 1.0 / _904;
    float _910 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _912 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _914 = isnan(1.0);
    bool _916 = _912 || _914;
    bool _918 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _920 = _916 || _918;
    int _922 = ~_906;
    int _924 = _922 + 1;
    int _926 = _924 + 1;
    float _928 = fma(_686, (*spvDescriptorSet0.vp_c9)._m0[78].z, _910);
    int _930 = _926;
    if (!_800)
    {
        int _932 = ~_906;
        int _934 = _932 + 1;
        _930 = _934;
    }
    int _936 = _930;
    float _938 = -_876;
    float _940 = _938 + 1.0;
    bool _942 = !_708;
    int _944 = _942 ? 0 : 1;
    float _946 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _948 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _950 = isnan(0.0);
    bool _952 = _948 || _950;
    bool _954 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _956 = _952 || _954;
    float _958 = _900 * (-2.0);
    int _960 = abs(_944);
    float _962 = fma(_694, (*spvDescriptorSet0.vp_c9)._m0[78].w, _946);
    float _964 = _956 ? _940 : 0.0;
    float _966 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[77].z, _928);
    float _968 = float(_960);
    float _970 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[77].w, _962);
    float _972 = float(_936);
    float _974 = -_166;
    float _976 = fma(_974, (*spvDescriptorSet0.vp_c9)._m0[81].x, _868);
    float _978 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[81].y, _878);
    if (_920)
    {
        float _980 = _964 * _908;
        _168 = _980;
    }
    float _982 = _168;
    float _984 = fma(_958, _886, _886);
    int _986 = abs(_722);
    float _988 = _686 + (-0.5);
    float _990 = fma(_786, _958, _786);
    float _992 = _968 * _972;
    float _994 = _694 + _682;
    float _996 = float(_986);
    float _998 = fma(_988, (*spvDescriptorSet0.vp_c9)._m0[196].x, _984);
    float _1000 = float(_898);
    float _1002 = _994 + (-1.0);
    float _1004 = _992 * (-2.0);
    float _1006 = fma(_990, _982, _998);
    float _1008 = _996 * _1000;
    float _1010 = _694 + (-0.5);
    float _1012 = fma(_1002, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1014 = fma(_1004, _888, _888);
    float _1016 = _686 + _682;
    float _1018 = fma(_1012, _1004, _1012);
    float _1020 = fma(_1010, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1014);
    float _1022 = _1016 + (-1.0);
    float _1024 = _1008 * (-2.0);
    float _1026 = _1006 * 0.15915493667125701904296875;
    float _1028 = fma(_1018, _982, _1020);
    float _1030 = fma(_1022, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1032 = fma(_1024, _890, _890);
    float _1034 = _682 + (-0.5);
    float _1036 = in.m_81.x;
    float _1038 = in.m_81.y;
    float _1040 = in.m_81.z;
    float _1042 = _1028 * 0.15915493667125701904296875;
    float _1044 = fma(_1030, _1024, _1030);
    float _1046 = fma(_1034, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1032);
    float _1048 = _1026 * 6.283185482025146484375;
    float _1050 = cos(_1048);
    float _1052 = _606 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1054 = fma(_1044, _982, _1046);
    float _1056 = _604 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1058 = in.m_69.w;
    float _1060 = _1054 * 0.15915493667125701904296875;
    float _1062 = _1042 * 6.283185482025146484375;
    float _1064 = sin(_1062);
    float _1066 = _1042 * 6.283185482025146484375;
    float _1068 = cos(_1066);
    float _1070 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1038);
    float _1072 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1040);
    float _1074 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1036);
    float _1076 = _1026 * 6.283185482025146484375;
    float _1078 = sin(_1076);
    float _1080 = _1070 * _1056;
    float _1082 = _1072 * _692;
    float _1084 = _1050 * _1064;
    float _1086 = _1074 * _1052;
    float _1088 = _1060 * 6.283185482025146484375;
    float _1090 = cos(_1088);
    float _1092 = _1050 * _1068;
    float _1094 = _1060 * 6.283185482025146484375;
    float _1096 = sin(_1094);
    float _1098 = _1078 * _1064;
    float _1100 = _1078 * _1068;
    float _1102 = _1050 * _1090;
    float _1104 = _1078 * _1090;
    float _1106 = _1068 * _1090;
    float _1108 = _1064 * _1090;
    float _1110 = _1102 * _1080;
    float _1112 = _1104 * _1080;
    float _1114 = _714 + _1058;
    float _1116 = fma(_1096, _1092, _1098);
    float _1118 = -_1080;
    float _1120 = _1096 * _1118;
    float _1122 = -_1100;
    float _1124 = fma(_1096, _1084, _1122);
    float _1126 = -_1084;
    float _1128 = fma(_1096, _1100, _1126);
    float _1130 = fma(_1116, _1086, _1110);
    float _1132 = fma(_1106, _1086, _1120);
    float _1134 = fma(_1096, _1098, _1092);
    float _1136 = fma(_1128, _1086, _1112);
    float _1138 = fma(_1124, _1082, _1130);
    float _1140 = fma(_1108, _1082, _1132);
    float _1142 = fma(_1134, _1082, _1136);
    float _1144 = _1138 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1146 = _1138 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1148 = _1138 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1150 = _1114 + _732;
    float _1152 = fma(_1140, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1144);
    float _1154 = fma(_1140, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1146);
    float _1156 = _1114 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1158 = _1114 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1160 = fma(_1142, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1152);
    float _1162 = fma(_1142, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1154);
    float _1164 = fma(_660, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1156);
    float _1166 = fma(_660, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1158);
    float _1168 = _1160 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1170 = _1162 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1172 = fma(_662, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1164);
    float _1174 = fma(_662, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1166);
    float _1176 = _662 + _1168;
    float _1178 = _660 + _1170;
    float _1180 = _1172 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1182 = _1174 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1184 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1186 = _1176 + _1184;
    float _1188 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1190 = _1178 + _1188;
    float _1192 = 1.0 / _1180;
    float _1194 = _1182 + _1180;
    float _1196 = _1186 * _1186;
    float _1198 = fma(_1140, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1148);
    float _1200 = fma(_1190, _1190, _1196);
    float _1202 = fma(_1142, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1198);
    float _1204 = _1150 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1206 = sqrt(_1200);
    float _1208 = _1202 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1210 = fma(_660, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1204);
    float _1212 = _1114 + _1208;
    float _1214 = _1194 * _1192;
    float _1216 = _1214 * 0.5;
    float _1218 = fma(_662, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1210);
    float _1220 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1222 = fma(_1216, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1220);
    float _1224 = _1218 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1226 = trunc(_1224);
    int _1228 = int(_1226);
    bool _1230 = _1206 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1232 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1234 = _1206 + _1232;
    float _1236 = 1.0 / _1222;
    float _1238 = _1060;
    float _1240 = _1206;
    float _1242 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    int _1244 = 2;
    float _1246 = _1212;
    float _1248 = _1178;
    float _1250 = _1176;
    float _1252 = _1224;
    if (_1230)
    {
        float _1254 = _1212 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1238 = _1254;
    }
    float _1256 = _1238;
    float _1258 = _1192;
    if (_1230)
    {
        float _1260 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1258 = _1260;
    }
    float _1262 = _1258;
    float _1264 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1266 = _1236 * _1264;
    float _1268 = 0.0;
    if (_1230)
    {
        float _1270 = rsqrt(_1200);
        _1268 = _1270;
    }
    float _1272 = _1268;
    bool _1274 = _1266 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1276 = _1266 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    if (_1230)
    {
        float _1278 = _1234 * _1262;
        _1240 = _1278;
    }
    float _1280 = _1240;
    float _1282 = _1150 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    if (_1230)
    {
        float _1284 = _1280 * 0.15915493667125701904296875;
        _1242 = _1284;
    }
    float _1286 = _1242;
    bool _1288 = !_1274;
    int _1290 = _1288 ? 0 : 1;
    float _1292 = fma(_660, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1282);
    float _1294 = 0.0;
    if (_1230)
    {
        float _1296 = _1286 * 6.283185482025146484375;
        float _1298 = cos(_1296);
        _1294 = _1298;
    }
    float _1300 = _1294;
    if (!_1274)
    {
        _1244 = 1;
    }
    int _1302 = _1244;
    float _1304 = fma(_662, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1292);
    int _1306 = _1302;
    if (!_1276)
    {
        _1306 = _1290;
    }
    int _1308 = _1306;
    float _1310 = _1304 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    int _1312 = _1308 << 6;
    float _1314 = _1058;
    float _1316 = as_type<float>(_1308);
    if (_1230)
    {
        float _1318 = _1286 * 6.283185482025146484375;
        float _1320 = sin(_1318);
        _1314 = _1320;
    }
    float _1322 = _1314;
    int _1324 = _1312 + 96;
    uint _1327 = uint(int(uint(_1324) >> uint(2)));
    uint _1329 = uint(int(uint(int(_1327)) >> uint(2)));
    int _1331 = int(_1327) & 3;
    float _1333 = (*spvDescriptorSet0.vp_c15)._m0[int(_1329)][_1331];
    int _1335 = int(_1327) + 1;
    uint _1337 = uint(int(uint(_1335) >> uint(2)));
    int _1339 = _1335 & 3;
    float _1341 = (*spvDescriptorSet0.vp_c15)._m0[int(_1337)][_1339];
    float _1343 = 0.0;
    if (_1230)
    {
        float _1345 = _1300 + (-1.0);
        _1343 = _1345;
    }
    float _1347 = _1343;
    float _1349 = trunc(_1310);
    int _1351 = int(_1349);
    int _1353 = _1312 + 104;
    uint _1355 = uint(int(uint(_1353) >> uint(2)));
    uint _1357 = uint(int(uint(int(_1355)) >> uint(2)));
    int _1359 = int(_1355) & 3;
    float _1361 = (*spvDescriptorSet0.vp_c15)._m0[int(_1357)][_1359];
    int _1363 = int(_1355) + 1;
    uint _1365 = uint(int(uint(_1363) >> uint(2)));
    int _1367 = _1363 & 3;
    float _1369 = (*spvDescriptorSet0.vp_c15)._m0[int(_1365)][_1367];
    float _1371 = _1347;
    if (_1230)
    {
        float _1373 = _1347 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1371 = _1373;
    }
    float _1375 = _1371;
    float _1377 = 0.0;
    if (_1230)
    {
        float _1379 = fma(_1322, _1256, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1377 = _1379;
    }
    float _1381 = _1377;
    float _1383 = _1381;
    if (_1230)
    {
        float _1385 = fma(_1212, _1300, _1375);
        _1246 = _1385;
    }
    float _1387 = _1246;
    int _1389 = _1312 + 48;
    uint _1391 = uint(int(uint(_1389) >> uint(2)));
    uint _1393 = uint(int(uint(int(_1391)) >> uint(2)));
    int _1395 = int(_1391) & 3;
    float _1397 = (*spvDescriptorSet0.vp_c15)._m0[int(_1393)][_1395];
    int _1399 = int(_1391) + 1;
    uint _1401 = uint(int(uint(_1399) >> uint(2)));
    int _1403 = _1399 & 3;
    float _1405 = (*spvDescriptorSet0.vp_c15)._m0[int(_1401)][_1403];
    float _1407 = _1387;
    if (_1230)
    {
        float _1409 = _1272 * _1381;
        _1383 = _1409;
    }
    float _1411 = _1383;
    int _1413 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1415 = _1228 + _1413;
    int _1417 = _1415 + 1;
    float _1419 = -_1114;
    float _1421 = _1419 + _1387;
    int _1423 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1425 = _1351 + _1423;
    int _1427 = _1425 + 1;
    int _1429 = _1417;
    if (_1230)
    {
        float _1431 = fma(_1190, _1411, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _1248 = _1431;
    }
    float _1433 = _1248;
    if (_1230)
    {
        float _1435 = fma(_1186, _1411, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1250 = _1435;
    }
    float _1437 = _1250;
    int _1439 = _1312 + 64;
    uint _1441 = uint(int(uint(_1439) >> uint(2)));
    uint _1443 = uint(int(uint(int(_1441)) >> uint(2)));
    int _1445 = int(_1441) & 3;
    float _1447 = (*spvDescriptorSet0.vp_c15)._m0[int(_1443)][_1445];
    int _1449 = int(_1441) + 1;
    uint _1451 = uint(int(uint(_1449) >> uint(2)));
    int _1453 = _1449 & 3;
    float _1455 = (*spvDescriptorSet0.vp_c15)._m0[int(_1451)][_1453];
    bool _1457 = _1417 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1459 = -_660;
    float _1461 = _1459 + _1433;
    int _1463 = _1417 | _1427;
    float _1465 = _1421 * _1421;
    bool _1467 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1469 = isnan(0.5);
    bool _1471 = _1467 || _1469;
    bool _1473 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1475 = _1471 || _1473;
    bool _1477 = _1463 < 0;
    bool _1479 = _1477 || _1457;
    int _1481 = _1312 + 56;
    uint _1483 = uint(int(uint(_1481) >> uint(2)));
    uint _1485 = uint(int(uint(int(_1483)) >> uint(2)));
    int _1487 = int(_1483) & 3;
    float _1489 = (*spvDescriptorSet0.vp_c15)._m0[int(_1485)][_1487];
    int _1491 = int(_1483) + 1;
    uint _1493 = uint(int(uint(_1491) >> uint(2)));
    int _1495 = _1491 & 3;
    float _1497 = (*spvDescriptorSet0.vp_c15)._m0[int(_1493)][_1495];
    float _1499 = -_662;
    float _1501 = _1499 + _1437;
    float _1503 = fma(_1461, _1461, _1465);
    bool _1505 = _1427 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1507 = _1505 || _1479;
    float _1509 = fma(_1501, _1501, _1503);
    int _1511 = _1312 + 72;
    uint _1513 = uint(int(uint(_1511) >> uint(2)));
    uint _1515 = uint(int(uint(int(_1513)) >> uint(2)));
    int _1517 = int(_1513) & 3;
    float _1519 = (*spvDescriptorSet0.vp_c15)._m0[int(_1515)][_1517];
    int _1521 = int(_1513) + 1;
    uint _1523 = uint(int(uint(_1521) >> uint(2)));
    int _1525 = _1521 & 3;
    float _1527 = (*spvDescriptorSet0.vp_c15)._m0[int(_1523)][_1525];
    float _1529 = sqrt(_1509);
    int _1531 = _1312 + 80;
    uint _1533 = uint(int(uint(_1531) >> uint(2)));
    uint _1535 = uint(int(uint(int(_1533)) >> uint(2)));
    int _1537 = int(_1533) & 3;
    float _1539 = (*spvDescriptorSet0.vp_c15)._m0[int(_1535)][_1537];
    int _1541 = int(_1533) + 1;
    uint _1543 = uint(int(uint(_1541) >> uint(2)));
    int _1545 = _1541 & 3;
    float _1547 = (*spvDescriptorSet0.vp_c15)._m0[int(_1543)][_1545];
    float _1549 = _1150 * _1341;
    float _1551 = _1461;
    if (!_1507)
    {
        int _1553 = _1427 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1555 = _1553 + _1417;
        _1429 = _1555;
    }
    int _1557 = _1429;
    float _1559 = fma(_660, _1333, _1549);
    float _1561 = fma(_662, _1361, _1559);
    bool _1563 = _1529 > 0.0;
    float _1565 = _1561 + _1369;
    float _1567 = _1150 * _1405;
    float _1569 = 1.0 / _1565;
    float _1571 = fma(_660, _1397, _1567);
    float _1573 = _1397;
    int _1575 = as_type<int>(_1571);
    float _1577 = _1565;
    if (!_1563)
    {
        _1573 = _1433;
    }
    float _1579 = _1573;
    float _1581 = _1150 * _1455;
    float _1583 = _1455;
    int _1585 = as_type<int>(_1581);
    float _1587 = _1579;
    float _1589 = _1579;
    if (!_1507)
    {
        float _1591 = floor(_1224);
        _1583 = _1591;
    }
    float _1593 = _1583;
    float _1595 = fma(_660, _1447, _1581);
    int _1597 = as_type<int>(_1595);
    if (!_1507)
    {
        int _1599 = _1557 << 2;
        _1585 = _1599;
    }
    int _1601 = _1585;
    float _1603 = fma(_662, _1489, _1571);
    int _1605 = _1601;
    float _1607 = _1519;
    if (!_1507)
    {
        uint _1609 = uint(int(uint(_1557) >> uint(2)));
        _1575 = int(_1609);
    }
    int _1611 = _1575;
    float _1613 = as_type<float>(_1611);
    if (!_1507)
    {
        int _1615 = 12 & _1601;
        _1605 = _1615;
    }
    int _1617 = _1605;
    float _1619 = _1603 + _1497;
    float _1621 = fma(_662, _1519, _1595);
    float _1623 = as_type<float>(_1617);
    if (!_1507)
    {
        int _1625 = _1611 << 4;
        int _1627 = _1625 + _1617;
        _1597 = _1627;
    }
    int _1629 = _1597;
    if (!_1563)
    {
        _1613 = _1387;
    }
    float _1631 = _1613;
    float _1633 = _1621 + _1527;
    float _1635 = _1631;
    if (!_1563)
    {
        _1623 = _1437;
    }
    float _1637 = _1623;
    bool _1639 = !_1563;
    float _1641 = _1637;
    float _1643 = _1637;
    if (!_1639)
    {
        float _1645 = _228 * _228;
        float _1647 = rsqrt(_1509);
        float _1649 = fma(_224, _224, _1645);
        float _1651 = fma(_230, _230, _1649);
        float _1653 = sqrt(_1651);
        float _1655 = _1461 * _1647;
        float _1657 = _1421 * _1647;
        float _1659 = _1501 * _1647;
        bool _1661 = _1653 > 0.0;
        float _1663 = _1653;
        _1551 = _1655;
        if (!_1661)
        {
            _1587 = _1433;
        }
        float _1665 = _1587;
        _1589 = _1665;
        if (!_1661)
        {
            _1663 = _1387;
        }
        float _1667 = _1663;
        _1635 = _1667;
        if (!_1661)
        {
            _1641 = _1437;
        }
        float _1669 = _1641;
        bool _1671 = !_1661;
        _1643 = _1669;
        if (!_1671)
        {
            float _1673 = rsqrt(_1651);
            float _1675 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1677 = _228 * _1673;
            float _1679 = _224 * _1673;
            float _1681 = _230 * _1673;
            float _1683 = _1657 * _1677;
            float _1685 = fma(_1655, _1679, _1683);
            float _1687 = _1675 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1689 = fma(_1659, _1681, _1685);
            float _1691 = _1689 * _1687;
            float _1693 = fma(_228, _1691, _1387);
            float _1695 = fma(_224, _1691, _1433);
            float _1697 = fma(_230, _1691, _1437);
            _1589 = _1695;
            _1635 = _1693;
            _1643 = _1697;
            _1577 = _1691;
        }
    }
    float _1699 = _1589;
    float _1701 = _1635;
    float _1703 = _1643;
    float _1705 = _1577;
    float _1707 = _1551;
    float _1709 = _1701;
    float _1711 = _1703;
    float _1713 = _1705;
    float _1715 = _1707;
    if (_1475)
    {
        _1407 = _1699;
    }
    float _1717 = _1407;
    float _1719 = _1717;
    if (!_1475)
    {
        float _1721 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1723 = _1114 + _1721;
        float _1725 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1727 = _660 + _1725;
        float _1729 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1731 = -_1114;
        float _1733 = _1731 + _1701;
        float _1735 = _1723 * _1723;
        float _1737 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1739 = _662 + _1737;
        float _1741 = fma(_1727, _1727, _1735);
        float _1743 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1745 = fma(_1739, _1739, _1741);
        float _1747 = sqrt(_1745);
        float _1749 = _1729 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1751 = precise::min(_1747, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1753 = _1751 * _1743;
        float _1755 = _1749 * _1753;
        float _1757 = -_660;
        float _1759 = _1757 + _1699;
        float _1761 = -_662;
        float _1763 = _1761 + _1703;
        float _1765 = fma(_1733, _1755, _1114);
        float _1767 = fma(_1759, _1755, _660);
        float _1769 = fma(_1763, _1755, _662);
        _1709 = _1765;
        _1719 = _1767;
        _1607 = _1743;
        _1711 = _1769;
        _1713 = _1755;
    }
    float _1771 = _1709;
    float _1773 = _1719;
    float _1775 = _1607;
    float _1777 = _1711;
    float _1779 = _1713;
    float _1781 = _1771 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1783 = _1619 * _1569;
    float _1785 = _1771 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1787 = _1771 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1789 = fma(_1773, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1781);
    float _1791 = _1633 * _1569;
    float _1793 = _1775;
    if (!_1507)
    {
        int _1795 = _1629 + 400;
        uint _1797 = uint(int(uint(_1795) >> uint(2)));
        uint _1799 = uint(int(uint(int(_1797)) >> uint(2)));
        int _1801 = int(_1797) & 3;
        float _1803 = (*spvDescriptorSet0.vp_c15)._m0[int(_1799)][_1801];
        _1793 = _1803;
    }
    float _1805 = _1793;
    float _1807 = fma(_1773, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1785);
    float _1809 = fma(_1773, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1787);
    float _1811 = fma(_1777, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1789);
    float _1813 = _1771 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1815 = fma(_1777, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1807);
    float _1817 = fma(_1777, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1809);
    float _1819 = _1811 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    int _1821 = _1312 + 88;
    uint _1823 = uint(int(uint(_1821) >> uint(2)));
    uint _1825 = uint(int(uint(int(_1823)) >> uint(2)));
    int _1827 = int(_1823) & 3;
    float _1829 = (*spvDescriptorSet0.vp_c15)._m0[int(_1825)][_1827];
    int _1831 = int(_1823) + 1;
    uint _1833 = uint(int(uint(_1831) >> uint(2)));
    int _1835 = _1831 & 3;
    float _1837 = (*spvDescriptorSet0.vp_c15)._m0[int(_1833)][_1835];
    float _1839 = _1815 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1841 = _1817 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1843 = fma(_1773, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1813);
    float _1845 = _1819 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1847 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    bool _1849 = _1783 >= 0.0;
    float _1851 = fma(_1777, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1843);
    float _1853 = _1839 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1855 = fma(_1841, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1845);
    bool _1857 = _1783 <= 1.0;
    bool _1859 = _1857 && _1849;
    float _1861 = _1779;
    if (!_1507)
    {
        float _1863 = floor(_1310);
        _1861 = _1863;
    }
    float _1865 = _1861;
    float _1867 = -_1853;
    float _1869 = fma(_1867, _1847, 1.0);
    float _1871 = _1851 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1873 = fma(_1839, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1855);
    bool _1875 = _1791 >= 0.0;
    bool _1877 = _1875 && _1859;
    float _1879 = _1819 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1881 = _1819 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1883 = fma(_1871, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1873);
    bool _1885 = _1791 <= 1.0;
    bool _1887 = _1885 && _1877;
    float _1889 = fma(_1841, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1879);
    float _1891 = fma(_1841, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1881);
    float _1893 = 1.0 / _1883;
    float _1895 = _1150 * _1547;
    float _1897 = fma(_1839, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1889);
    float _1899 = fma(_1839, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1891);
    float _1901 = _1865;
    if (!_1507)
    {
        float _1903 = -_1865;
        float _1905 = _1310 + _1903;
        _1715 = _1905;
    }
    float _1907 = _1715;
    float _1909 = fma(_1871, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1897);
    float _1911 = fma(_1871, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1899);
    float _1913 = log2(_1869);
    float _1915 = fma(_660, _1539, _1895);
    if (_1887)
    {
        float _1917 = float(_1308);
        _1316 = _1917;
    }
    float _1919 = _1316;
    if (!_1507)
    {
        float _1921 = -_1593;
        float _1923 = _1224 + _1921;
        _1901 = _1923;
    }
    float _1925 = _1901;
    float _1927 = _1909 * _1893;
    float _1929 = _1911 * _1893;
    float _1931 = _1919;
    if (_1887)
    {
        float _1933 = rint(_1919);
        float _1935 = precise::max(_1933, 0.0);
        uint _1937 = uint(_1935);
        uint _1939 = clamp(_1937, 0u, 65535u);
        _1931 = as_type<float>(_1939);
    }
    float _1941 = _1931;
    float _1943 = fma(_1927, 0.5, 0.5);
    float _1945 = fma(_1929, -0.5, 0.5);
    float _1947 = _1913 * 0.693147182464599609375;
    float _1949 = _1929;
    if (!_1507)
    {
        float _1951 = rint(_1805);
        float _1953 = precise::max(_1951, 0.0);
        uint _1955 = uint(_1953);
        uint _1957 = clamp(_1955, 0u, 65535u);
        _1949 = as_type<float>(_1957);
    }
    float _1959 = _1949;
    float _1961 = fma(_662, _1829, _1915);
    float _1963 = _1961 + _1837;
    float _1965 = _1947 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1967 = _1963 * _1569;
    float _1969 = _1791;
    if (_1887)
    {
        float3 _6293 = float3(_1783, _1791, float(as_type<int>(_1941)));
        float3 _6297 = select(_6293, float3(0.0), isnan(_6293));
        float _1971 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6297.xy, uint(rint(_6297.z)), _1967, level(0.0));
        _1969 = _1971;
    }
    float _1973 = _1969;
    float3 _6307 = float3(_1943, _1945, _1965);
    float _1975 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6307, float3(0.0), isnan(_6307)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6307, float3(0.0), isnan(_6307)), level(0.0)).x;
    float3 _6316 = float3(_1943, _1945, _1965);
    float4 _1978 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6316, float3(0.0), isnan(_6316)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6316, float3(0.0), isnan(_6316)), level(0.0)).xyzw;
    float _1980 = _1978.x;
    float _1982 = _1978.y;
    float _1984 = _1978.z;
    float _1986 = _1978.w;
    float _1988 = _1907;
    if (!_1507)
    {
        float3 _6339 = float3(_1925, _1907, float(as_type<int>(_1959)));
        float3 _6341 = select(_6339, float3(0.0), isnan(_6339));
        float _1990 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6341.xy, uint(rint(_6341.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6341.xy, uint(rint(_6341.z)), level(0.0)).x;
        _1988 = _1990;
    }
    float _1992 = _1988;
    if (_1507)
    {
        _1252 = 1.0;
    }
    float _1994 = _1252;
    float _1996 = _1994;
    float _1998 = _1992;
    float _2000 = _1986;
    if (!_1507)
    {
        int _2002 = _1557 << 4;
        int _2004 = _2002 + 2048;
        uint _2006 = uint(int(uint(_2004) >> uint(2)));
        uint _2008 = uint(int(uint(int(_2006)) >> uint(2)));
        int _2010 = int(_2006) & 3;
        float _2012 = (*spvDescriptorSet0.vp_c15)._m0[int(_2008)][_2010];
        int _2014 = int(_2006) + 1;
        uint _2016 = uint(int(uint(_2014) >> uint(2)));
        int _2018 = _2014 & 3;
        float _2020 = (*spvDescriptorSet0.vp_c15)._m0[int(_2016)][_2018];
        int _2022 = _2004 + 8;
        uint _2024 = uint(int(uint(_2022) >> uint(2)));
        uint _2026 = uint(int(uint(int(_2024)) >> uint(2)));
        int _2028 = int(_2024) & 3;
        float _2030 = (*spvDescriptorSet0.vp_c15)._m0[int(_2026)][_2028];
        int _2032 = int(_2024) + 1;
        uint _2034 = uint(int(uint(_2032) >> uint(2)));
        int _2036 = _2032 & 3;
        float _2038 = (*spvDescriptorSet0.vp_c15)._m0[int(_2034)][_2036];
        float _2040 = _1150 * _2020;
        float _2042 = fma(_660, _2012, _2040);
        float _2044 = fma(_662, _2030, _2042);
        float _2046 = _2044 + _2038;
        float _2048 = precise::clamp(_2046, 0.0, 1.0);
        float _2050 = -_2048;
        float _2052 = _2050 + _1992;
        float _2054 = fma(_2052, 500.0, 1.5);
        float _2056 = exp2(_2054);
        float _2058 = 0.0 + _2056;
        float _2060 = precise::clamp(_2058, 0.0, 1.0);
        _1996 = _2060;
    }
    float _2062 = _1996;
    float _2064 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2066 = _1771 + _2064;
    float _2068 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2070 = _1773 + _2068;
    float _2072 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2074 = _1777 + _2072;
    float _2076 = _2066 * _2066;
    float _2078 = fma(_2070, _2070, _2076);
    float _2080 = fma(_2074, _2074, _2078);
    float _2082 = rsqrt(_2080);
    float _2084 = sqrt(_2080);
    float _2086 = _2082 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2088 = _2070 * _2086;
    float _2090 = _2074 * _2086;
    float _2092 = _2088 * _2088;
    float _2094 = _2090 * _2090;
    float _2096 = _2092 + _2094;
    float _2098 = sqrt(_2096);
    bool _2100 = _2098 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2102 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2104 = _2098 + _2102;
    float _2106 = _1941;
    float _2108 = _2096;
    float _2110 = _2104;
    float _2112 = _2066;
    float _2114 = _2088;
    float _2116 = _2090;
    float _2118 = _2092;
    float _2120 = _2094;
    bool _2122 = _2100;
    if (_2100)
    {
        float _2124 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2106 = _2124;
    }
    float _2126 = _2106;
    if (_2100)
    {
        float _2128 = rsqrt(_2096);
        _2108 = _2128;
    }
    float _2130 = _2108;
    if (_2100)
    {
        float _2132 = _2104 * _2126;
        _2110 = _2132;
    }
    float _2134 = _2110;
    if (_2100)
    {
        float _2136 = _2134 * 0.15915493667125701904296875;
        _1998 = _2136;
    }
    float _2138 = _1998;
    float _2140 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2142 = _660;
    float _2144 = _2140;
    float _2146 = _2138;
    if (_2100)
    {
        float _2148 = _2138 * 6.283185482025146484375;
        float _2150 = sin(_2148);
        _2142 = _2150;
    }
    float _2152 = _2142;
    float _2154 = precise::max(0.0, _2140);
    float _2156 = _2134;
    if (_2100)
    {
        float _2158 = _2138 * 6.283185482025146484375;
        float _2160 = cos(_2158);
        _2156 = _2160;
    }
    float _2162 = _2156;
    float _2164 = -_2086;
    float _2166 = -_2154;
    float _2168 = fma(_2066, _2164, _2166);
    if (_2100)
    {
        float _2170 = _2168 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2112 = _2170;
    }
    float _2172 = _2112;
    float _2174 = _2172;
    float _2176 = _2152;
    if (_2100)
    {
        float _2178 = fma(_2152, _2172, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2174 = _2178;
    }
    float _2180 = _2174;
    float _2182 = _2180;
    if (_2100)
    {
        float _2184 = _2130 * _2180;
        _2176 = _2184;
    }
    float _2186 = _2176;
    if (!_2100)
    {
        _2182 = _2168;
    }
    float _2188 = _2182;
    float _2190 = _2188;
    if (_2100)
    {
        float _2192 = _2162 + (-1.0);
        _2144 = _2192;
    }
    float _2194 = _2144;
    float _2196 = _2194;
    if (_2100)
    {
        float _2198 = _2088 * _2186;
        _2114 = _2198;
    }
    float _2200 = _2114;
    if (_2100)
    {
        float _2202 = _2090 * _2186;
        _2116 = _2202;
    }
    float _2204 = _2116;
    if (_2100)
    {
        float _2206 = _2194 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2196 = _2206;
    }
    float _2208 = _2196;
    if (_2100)
    {
        float _2210 = _2200 * _2200;
        _2118 = _2210;
    }
    float _2212 = _2118;
    if (_2100)
    {
        float _2214 = _2204 * _2204;
        _2120 = _2214;
    }
    float _2216 = _2120;
    if (_2100)
    {
        float _2218 = fma(_2168, _2162, _2208);
        _2190 = _2218;
    }
    float _2220 = _2190;
    float _2222 = fma(_2220, _2220, _2212);
    float _2224 = _2222 + _2216;
    float _2226 = rsqrt(_2224);
    float _2228 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2230 = fma(_2084, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2228);
    float _2232 = precise::clamp(_2230, 0.0, 1.0);
    float _2234 = -_2232;
    float _2236 = _2234 + 1.0;
    float _2238 = abs(_2236);
    float _2240 = log2(_2238);
    float _2242 = _2226 * _2200;
    float _2244 = _2226 * _2220;
    float _2246 = _2226 * _2204;
    float _2248 = _2242 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2250 = -_2248;
    float _2252 = fma(_2244, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2250);
    float _2254 = -_2246;
    float _2256 = fma(_2254, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2252);
    float _2258 = _2240 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2260 = fma(_2256, -0.5, 0.5);
    float _2262 = fma(_2256, 0.5, 0.5);
    float _2264 = exp2(_2258);
    float _2266 = fma(_2262, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2268 = fma(_2262, _2266, -0.212114393711090087890625);
    float _2270 = _2244 + 1.0;
    float _2272 = sqrt(_2260);
    float _2274 = fma(_2262, _2268, 1.570728778839111328125);
    float _2276 = -_2244;
    float _2278 = fma(_2264, _2270, _2276);
    float _2280 = fma(_2278, 0.5, 0.5);
    float _2282 = _2272 * 0.636619746685028076171875;
    float _2284 = fma(_1437, 6.2500002968590706586837768554688e-05, 0.5);
    float _2286 = -_2274;
    float _2288 = fma(_2282, _2286, 1.0);
    float _2290 = fma(_1433, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _6795 = float2(_2288, _2280);
    float3 _2294 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6795, float2(0.0), isnan(_6795)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6795, float2(0.0), isnan(_6795)), level(0.0)).xyz;
    float _2296 = _2294.x;
    float _2298 = _2294.y;
    float _2300 = _2294.z;
    float2 _6809 = float2(_2290, _2284);
    float3 _2302 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_6809, float2(0.0), isnan(_6809)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_6809, float2(0.0), isnan(_6809)), level(0.0)).xyz;
    float _2304 = _2302.x;
    float _2306 = _2302.y;
    float _2308 = _2302.z;
    float _2310 = in.m_73.w;
    float _2312 = _2240 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2314 = in.m_83.x;
    int _2316 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2318 = _2316 != 0;
    float _2320 = _1819 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2322 = in.m_83.y;
    bool _2324 = _694 > 0.5;
    float _2326 = exp2(_2312);
    bool _2328 = _682 > 0.5;
    float _2330 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2332 = _2330 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2334 = _636 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2336 = isnan(_636);
    bool _2338 = _2334 || _2336;
    bool _2340 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2342 = _2338 || _2340;
    float _2344 = float(_2342);
    float _2346 = fma(_1841, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2320);
    int _2348 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2350 = _2348 != 0;
    float _2352 = -_680;
    float _2354 = _2352 + 1.0;
    float _2356 = 1.0 / _2332;
    int _2358 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[132].x);
    if (_2318)
    {
        bool _2360 = _686 > 0.5;
        _2122 = _2360;
    }
    bool _2362 = _2122;
    float _2364 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2366 = _636 + _2364;
    bool _2368 = _636 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2370 = isnan(_636);
    bool _2372 = _2368 || _2370;
    bool _2374 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2376 = _2372 || _2374;
    float _2378 = float(_2376);
    float _2380 = -_2344;
    float _2382 = _2380 + 1.0;
    float _2384 = fma(_1839, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2346);
    bool _2386 = _2310 > 0.5;
    float _2388 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2390 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2388;
    float _2392 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2394 = fma(_1871, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2384);
    float _2396 = _2314;
    float _2398 = _2384;
    if (_2318)
    {
        float _2400 = -_2314;
        float _2402 = _2400 + 1.0;
        _2358 = as_type<int>(_2402);
    }
    int _2404 = _2358;
    if (!_2318)
    {
        _2146 = _2314;
    }
    float _2406 = _2146;
    float _2408 = -_2326;
    float _2410 = _2408 + 1.0;
    float _2412 = -_2322;
    float _2414 = _2412 + 1.0;
    float _2416 = _2406;
    float _2418 = _2322;
    float _2420 = _2414;
    if (_2318)
    {
        float _2422 = _2362 ? as_type<float>(_2404) : _2314;
        _2416 = _2422;
    }
    float _2424 = _2416;
    float _2426 = _2390 * _2356;
    float _2428 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2430 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2432 = _2430 != 0;
    float _2434 = _2410 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _2436 = _2324 ? as_type<int>(_2414) : as_type<int>(_2322);
    out.m_85.x = 1.0;
    out.m_85.y = 1.0;
    out.m_85.z = 1.0;
    int _2438 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2440 = _2438 != 0;
    float _2442 = _2434 * _1975;
    float _2444 = _2432 ? as_type<float>(_2436) : _2322;
    float _2446 = _2392 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _2448 = _2386 ? as_type<int>(_2414) : as_type<int>(_2322);
    float _2450 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _2452 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2454 = _2452 != 0;
    out.gl_Position.x = _1909;
    out.gl_Position.y = _1911;
    out.gl_Position.z = _2394;
    out.gl_Position.w = _1883;
    float _2456 = _2350 ? as_type<float>(_2448) : _2322;
    float _2458 = fma(_2426, _2366, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    int _2460 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2462 = _2460 != 0;
    float _2464 = _2428 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2466 = in.m_87.x;
    float _2468 = in.m_87.y;
    float _2470 = in.m_87.z;
    float _2472 = 0.0;
    float _2474 = _2458;
    float _2476 = _2442;
    if (!_2440)
    {
        _2472 = _2314;
    }
    float _2478 = _2472;
    float _2480 = fma(_2456, _2446, -0.5);
    float _2482 = fma(_2464, _2444, -0.5);
    float _2484 = _2378 * _2382;
    float _2486 = -_2378;
    float _2488 = _2486 + 1.0;
    float _2490 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2492 = -_802;
    float _2494 = fma(_970, _2482, _2492);
    float _2496 = _2478;
    if (_2440)
    {
        float _2498 = -_2314;
        float _2500 = _2498 + 1.0;
        _850 = as_type<int>(_2500);
    }
    int _2502 = _850;
    int _2504 = 0;
    if (_2454)
    {
        float _2506 = -_2314;
        float _2508 = _2506 + 1.0;
        _2504 = as_type<int>(_2508);
    }
    int _2510 = _2504;
    bool _2512 = _1038 != 0.0;
    bool _2514 = isnan(_1038);
    bool _2516 = _2512 || _2514;
    bool _2518 = isnan(0.0);
    bool _2520 = _2516 || _2518;
    float _2522 = _2458 * _2484;
    float _2524 = _2522;
    if (_2462)
    {
        float _2526 = _2328 ? _2414 : _2322;
        _2418 = _2526;
    }
    float _2528 = _2418;
    float _2530 = -_978;
    float _2532 = fma(_828, _2480, _2530);
    if (_2440)
    {
        float _2534 = _2328 ? as_type<float>(_2502) : _2314;
        _2496 = _2534;
    }
    float _2536 = _2496;
    float _2538 = fma(_2488, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2522);
    float _2540 = in.m_89.x;
    float _2542 = in.m_89.y;
    float _2544 = in.m_89.z;
    float _2546 = in.m_89.w;
    if (_2454)
    {
        float _2548 = _2324 ? as_type<float>(_2510) : _2314;
        _2396 = _2548;
    }
    float _2550 = _2396;
    float _2552 = _2450 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2554 = _1036 == 0.0;
    bool _2556 = !_2520;
    bool _2558 = _2554 && _2556;
    float _2560 = fma(_2344, (*spvDescriptorSet0.vp_c9)._m0[132].x, _2538);
    float _2562 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2564 = _2490 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2566 = fma(_2552, _2424, -0.5);
    bool _2568 = _1040 == 0.0;
    bool _2570 = _2568 && _2558;
    float _2572 = _2560 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2574 = fma(_2564, _2536, -0.5);
    float _2576 = fma(_966, _2566, _764);
    float _2578 = _2550 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2580 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2582 = fma(_822, _2574, _976);
    float _2584 = abs(_1266);
    float _2586 = log2(_2584);
    if (_2570)
    {
        _2474 = _2466;
    }
    float _2588 = _2474;
    float _2590 = _2588;
    if (!_2570)
    {
        float _2592 = fma(_1036, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2466);
        _2590 = _2592;
    }
    float _2594 = _2590;
    float _2596 = _2544 * _2466;
    if (_2570)
    {
        _2524 = _2468;
    }
    float _2598 = _2524;
    float _2600 = _2598;
    if (!_2570)
    {
        float _2602 = fma(_1038, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2468);
        _2600 = _2602;
    }
    float _2604 = _2600;
    if (_2570)
    {
        _2420 = _2470;
    }
    float _2606 = _2420;
    float _2608 = -_2596;
    float _2610 = fma(_2540, _2470, _2608);
    float _2612 = _2542 * _2470;
    float _2614 = _2606;
    if (!_2570)
    {
        float _2616 = fma(_1040, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2470);
        _2614 = _2616;
    }
    float _2618 = _2614;
    float _2620 = _2540 * _2468;
    float _2622 = -_2612;
    float _2624 = fma(_2544, _2468, _2622);
    float _2626 = _2494 + 0.5;
    float _2628 = _2586 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2630 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2632 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2634 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2636 = _2528 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2638 = _2630 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2640 = exp2(_2628);
    float _2642 = _2632 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2644 = _2634 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2646 = -_2620;
    float _2648 = fma(_2542, _2466, _2646);
    float _2650 = _2576 + 0.5;
    float _2652 = _2636 * _2580;
    float _2654 = _2578 * _2562;
    out.m_91.x = _2638;
    out.m_91.y = _2642;
    out.m_91.z = _2644;
    out.m_91.w = _2572;
    float _2656 = _1102 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2658 = _2582 + 0.5;
    float _2660 = _2532 + 0.5;
    out.m_93.x = _2654;
    out.m_93.y = _2652;
    float _2662 = -_1096;
    float _2664 = fma(_2662, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2656);
    float _2666 = _1116 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2668 = _2610 * _2546;
    float _2670 = _2624 * _2546;
    out.m_95.x = _2650;
    out.m_95.y = _2626;
    out.m_95.z = _2658;
    out.m_95.w = _2660;
    float _2672 = fma(_1104, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2664);
    bool _2674 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2676 = isnan(0.5);
    bool _2678 = _2674 || _2676;
    bool _2680 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2682 = _2678 || _2680;
    float _2684 = _1102 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2686 = _1102 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2688 = _1116 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2690 = -_1096;
    float _2692 = fma(_2690, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2684);
    float _2694 = -_1096;
    float _2696 = fma(_2694, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2686);
    float _2698 = _1116 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2700 = _2648 * _2546;
    float _2702 = fma(_2640, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2704 = precise::clamp(_2702, 0.0, 1.0);
    float _2706 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2688);
    float _2708 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2698);
    float _2710 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2666);
    float _2712 = _1124 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2714 = _1124 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2716 = _1124 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2718 = fma(_1104, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2692);
    float _2720 = fma(_1104, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2696);
    float _2722 = fma(_1108, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2712);
    float _2724 = fma(_1108, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2714);
    float _2726 = fma(_1108, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2716);
    float _2728 = fma(_1128, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2708);
    float _2730 = fma(_1128, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2706);
    float _2732 = fma(_1128, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2710);
    float _2734 = _2718 * _2542;
    float _2736 = _2672 * _2542;
    float _2738 = _2720 * _2542;
    float _2740 = _2672 * _2604;
    float _2742 = _2718 * _2604;
    float _2744 = _2668 * _2718;
    float _2746 = _2668 * _2672;
    float _2748 = _2720 * _2604;
    float _2750 = _2668 * _2720;
    float _2752 = fma(_2704, -2.0, 3.0);
    float _2754 = _2704 * _2704;
    float _2756 = fma(_1134, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2722);
    float _2758 = fma(_2728, _2594, _2742);
    float _2760 = fma(_2730, _2540, _2736);
    float _2762 = _2754 * _2752;
    float _2764 = fma(_2728, _2540, _2734);
    float _2766 = fma(_2670, _2728, _2744);
    float _2768 = fma(_2732, _2540, _2738);
    float _2770 = fma(_1134, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2724);
    float _2772 = fma(_2756, _2544, _2764);
    float _2774 = fma(_2700, _2756, _2766);
    float _2776 = _2766;
    float _2778 = _2732;
    if (!_2682)
    {
        _2776 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _2780 = _2776;
    float _2782 = fma(_1134, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2726);
    float _2784 = fma(_2770, _2544, _2760);
    float _2786 = -_2762;
    float _2788 = _2786 + 1.0;
    float _2790 = fma(_2732, _2594, _2748);
    float _2792 = _2780;
    if (!_2682)
    {
        float _2794 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2796 = _2780 + _2794;
        _2792 = _2796;
    }
    float _2798 = _2792;
    float _2800 = fma(_2782, _2544, _2768);
    float _2802 = fma(_2670, _2732, _2750);
    float _2804 = fma(_2670, _2730, _2746);
    float _2806 = _2768;
    if (!_2682)
    {
        float _2808 = 1.0 / _2798;
        _2806 = _2808;
    }
    float _2810 = _2806;
    if (!_2682)
    {
        float _2812 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2814 = _1266 + _2812;
        _2778 = _2814;
    }
    float _2816 = _2778;
    bool _2818 = _1266 <= 8000.0;
    bool _2820 = isnan(_1266);
    bool _2822 = _2818 || _2820;
    bool _2824 = isnan(8000.0);
    bool _2826 = _2822 || _2824;
    float _2828 = float(_2826);
    float _2830 = fma(_2788, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2762);
    float _2832 = fma(_2730, _2594, _2740);
    float _2834 = fma(_2700, _2770, _2804);
    float _2836 = fma(_2700, _2782, _2802);
    float _2838 = _2828 * _2830;
    float _2840 = _2828;
    if (_2682)
    {
        _2398 = 1.0;
    }
    float _2842 = _2398;
    out.m_97.x = _2772;
    out.m_97.y = _2784;
    out.m_97.z = _2800;
    float _2844 = _2842;
    if (!_1887)
    {
        _2840 = 1.0;
    }
    float _2846 = _2840;
    float _2848 = fma(_2756, _2618, _2758);
    float _2850 = _2846;
    if (_1887)
    {
        bool _2852 = _1973 >= _1967;
        bool _2854 = isnan(_1973);
        bool _2856 = _2852 || _2854;
        bool _2858 = isnan(_1967);
        bool _2860 = _2856 || _2858;
        float _2862 = float(_2860);
        _2850 = _2862;
    }
    float _2864 = _2850;
    out.m_99.x = _2774;
    out.m_99.y = _2834;
    out.m_99.z = _2836;
    float _2866 = fma(_2770, _2618, _2832);
    float _2868 = _2864;
    if (!_2682)
    {
        float _2870 = _2816 * _2810;
        float _2872 = precise::clamp(_2870, 0.0, 1.0);
        _2844 = _2872;
    }
    float _2874 = _2844;
    float _2876 = _2838 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2878 = _2864 * _2062;
    float _2880 = fma(_2782, _2618, _2790);
    bool _2882 = _2084 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2884 = isnan(_2084);
    bool _2886 = _2882 || _2884;
    bool _2888 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2890 = _2886 || _2888;
    float _2892 = _1883 * 0.5;
    float _2894 = _2354 * _2876;
    float _2896 = precise::clamp(_2894, 0.0, 1.0);
    float _2898 = -_2434;
    float _2900 = _2898 + 1.0;
    out.m_101.x = _2848;
    out.m_101.y = _2866;
    out.m_101.z = _2880;
    float _2902 = _2394 + _1883;
    float _2904 = _1909 + _1883;
    float _2906 = fma(_1911, -0.5, _2892);
    float _2908 = -_2896;
    float _2910 = fma(_2908, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2912 = _2902 * 0.5;
    float _2914 = _2904 * 0.5;
    float _2916 = -_2878;
    float _2918 = fma(_2916, _2910, 1.0);
    float _2920 = precise::clamp(_2918, 0.0, 1.0);
    float _2922 = _2900;
    float _2924 = _2920;
    if (!_2890)
    {
        _2868 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2926 = _2868;
    out.m_103.x = _2914;
    out.m_103.y = _2906;
    out.m_103.z = _2912;
    out.m_103.w = _1883;
    float _2928 = _1986 * _2442;
    float _2930 = _1986 * _2900;
    float _2932 = _2926;
    float _2934 = _2926;
    if (!_2890)
    {
        _2922 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2936 = _2922;
    float _2938 = _2300 * _2442;
    float _2940 = fma(_2296, _2928, _1980);
    float _2942 = fma(_2298, _2928, _1982);
    float _2944 = _2920 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2946 = fma(_1986, _2938, _1984);
    out.m_105.x = _2304;
    out.m_105.y = _2306;
    out.m_105.z = _2308;
    float _2948 = _2874 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2950 = _2938;
    float _2952 = _2936;
    float _2954 = _2936;
    if (!_2890)
    {
        _2924 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2956 = _2924;
    out.m_107.x = _2944;
    float _2958 = _2956;
    float _2960 = _2956;
    if (!_2890)
    {
        _2000 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2962 = _2000;
    float _2964 = _2962;
    float _2966 = _2962;
    if (!_2890)
    {
        _2950 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2968 = _2950;
    out.m_109.x = _2940;
    out.m_109.y = _2942;
    out.m_109.z = _2946;
    out.m_109.w = _2930;
    float _2970 = _2968;
    float _2972 = _2968;
    if (!_2890)
    {
        _2476 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2974 = _2476;
    bool _2976 = !_2890;
    float _2978 = _2974;
    float _2980 = _2974;
    if (!_2976)
    {
        bool _2982 = _2084 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2984 = isnan(_2084);
        bool _2986 = _2982 || _2984;
        bool _2988 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2990 = _2986 || _2988;
        if (!_2990)
        {
            float _2992 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2994 = _2084 + _2992;
            float _2996 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2998 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2996;
            float _3000 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3002 = _3000 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3004 = 1.0 / _2998;
            float _3006 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3008 = _3006 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3010 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3012 = _3010 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3014 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3016 = _3014 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3018 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3020 = _3018 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3022 = _2994 * _3004;
            float _3024 = precise::clamp(_3022, 0.0, 1.0);
            float _3026 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3028 = _3026 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3030 = fma(_3024, _3002, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3032 = fma(_3024, _3028, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3034 = fma(_3024, _3008, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3036 = fma(_3024, _3012, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3038 = fma(_3024, _3016, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3040 = fma(_3024, _3020, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2966 = _3030;
            _2980 = _3038;
            _2960 = _3034;
            _2972 = _3036;
            _2934 = _3032;
            _2954 = _3040;
            _3042 = true;
        }
        else
        {
            bool _3044 = _2084 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3046 = isnan(_2084);
            bool _3048 = _3044 || _3046;
            bool _3050 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3052 = _3048 || _3050;
            if (!_3052)
            {
                _2958 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3054 = _2958;
            _2960 = _3054;
            if (!_3052)
            {
                _2964 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3056 = _2964;
            _2966 = _3056;
            if (!_3052)
            {
                _2932 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3058 = _2932;
            _2934 = _3058;
            if (!_3052)
            {
                _2970 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3060 = _2970;
            _2972 = _3060;
            if (!_3052)
            {
                _2978 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3062 = _2978;
            _2980 = _3062;
            if (!_3052)
            {
                _2952 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3064 = _2952;
            bool _3066 = !_3052;
            _2954 = _3064;
            if (!_3066)
            {
                bool _3068 = _2084 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3070 = isnan(_2084);
                bool _3072 = _3068 || _3070;
                bool _3074 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3076 = _3072 || _3074;
                if (!_3076)
                {
                    float _3078 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3080 = _2084 + _3078;
                    float _3082 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3084 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3082;
                    float _3086 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3088 = _3086 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3090 = 1.0 / _3084;
                    float _3092 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3094 = _3092 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3096 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3098 = _3096 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3100 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3102 = _3100 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3104 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3106 = _3104 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3108 = _3080 * _3090;
                    float _3110 = precise::clamp(_3108, 0.0, 1.0);
                    float _3112 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3114 = _3112 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3116 = fma(_3110, _3088, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3118 = fma(_3110, _3114, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3120 = fma(_3110, _3094, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3122 = fma(_3110, _3098, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3124 = fma(_3110, _3102, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3126 = fma(_3110, _3106, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2966 = _3116;
                    _2980 = _3124;
                    _2960 = _3120;
                    _2972 = _3122;
                    _2934 = _3118;
                    _2954 = _3126;
                    _3042 = true;
                }
                else
                {
                    _2966 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2980 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2960 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2972 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2934 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2954 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3042 = false;
    float _3128 = _2966;
    float _3130 = _2980;
    float _3132 = _2960;
    float _3134 = _2972;
    float _3136 = _2934;
    float _3138 = _2954;
    float _3140 = fma(_2866, -0.5, 0.5);
    float _3142 = precise::clamp(_3140, 0.0, 1.0);
    float _3144 = -_3128;
    float _3146 = _3144 + _3130;
    float _3148 = -_3132;
    float _3150 = _3148 + _3134;
    out.m_111.x = 0.0;
    float _3152 = -_3136;
    float _3154 = _3152 + _3138;
    float _3156 = fma(_3142, _3146, _3128);
    float _3158 = fma(_3142, _3150, _3132);
    bool _3160 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3162 = _3156 * 0.586610972881317138671875;
    float _3164 = fma(_3142, _3154, _3136);
    float _3166 = _2948 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3168 = fma(_3158, 0.298911988735198974609375, _3162);
    bool _3170 = _2874 > 0.0;
    bool _3172 = isnan(_2874);
    bool _3174 = _3170 || _3172;
    bool _3176 = isnan(0.0);
    bool _3178 = _3174 || _3176;
    float _3180 = fma(_3164, 0.114477999508380889892578125, _3168);
    out.m_61.x = _3166;
    float _3182 = -_3180;
    float _3184 = _3156 + _3182;
    float _3186 = -_3180;
    float _3188 = _3158 + _3186;
    float _3190 = -_3180;
    float _3192 = _3164 + _3190;
    float _3194 = fma(_3184, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3180);
    float _3196 = fma(_3188, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3180);
    float _3198 = fma(_3192, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3180);
    bool _3200 = !_3160;
    if (!_3200)
    {
        float _3202 = -_1771;
        float _3204 = _3202 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3206 = -_1773;
        float _3208 = _3206 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3210 = -_1777;
        float _3212 = _3210 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3214 = _3204 * _3204;
        float _3216 = fma(_3208, _3208, _3214);
        float _3218 = fma(_3212, _3212, _3216);
        float _3220 = sqrt(_3218);
        float _3222 = rsqrt(_3218);
        float _3224 = -_3220;
        float _3226 = _3224 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3228 = _3226 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3230 = precise::clamp(_3228, 0.0, 1.0);
        float _3232 = _3208 * _3222;
        float _3234 = _3204 * _3222;
        float _3236 = abs(_3230);
        float _3238 = log2(_3236);
        float _3240 = _3212 * _3222;
        float _3242 = _3232 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3244 = _2866 * _3234;
        float _3246 = -_3234;
        float _3248 = -_3242;
        float _3250 = fma(_3246, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3248);
        float _3252 = fma(_2848, _3232, _3244);
        float _3254 = -_3240;
        float _3256 = fma(_3254, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3250);
        float _3258 = fma(_2880, _3240, _3252);
        float _3260 = precise::clamp(_3258, 0.0, 1.0);
        float _3262 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3264 = _3256 + _3262;
        float _3266 = _3238 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3268 = _3264 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3270 = precise::clamp(_3268, 0.0, 1.0);
        float _3272 = exp2(_3266);
        float _3274 = _3272 * _3270;
        float _3276 = _3260 * _3274;
        float _3278 = _3276 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3280 = _3276 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3282 = _3276 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_111.x = _3278;
        out.m_111.y = _3280;
        out.m_111.z = _3282;
    }
    out.m_113.x = _3196;
    out.m_113.y = _3194;
    out.m_113.z = _3198;
    if (_3178)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_113.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_113.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_113.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_113.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_61.x = 0.0;
    float _3284 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3284;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_113.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_113.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_113.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_113.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

