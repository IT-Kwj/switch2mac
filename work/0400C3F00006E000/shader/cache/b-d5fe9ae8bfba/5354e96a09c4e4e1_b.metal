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
    float4 m_67 [[user(locn0)]];
    float4 m_69 [[user(locn1)]];
    float4 m_89 [[user(locn2)]];
    float4 m_93 [[user(locn3)]];
    float4 m_103 [[user(locn4)]];
    float4 m_59 [[user(locn5)]];
    float4 m_83 [[user(locn6)]];
    float4 m_91 [[user(locn7)]];
    float4 m_87 [[user(locn8)]];
    float4 m_99 [[user(locn9)]];
    float4 m_77 [[user(locn10)]];
    float4 m_85 [[user(locn11)]];
    float4 m_101 [[user(locn12)]];
    float4 m_95 [[user(locn13)]];
    float4 m_97 [[user(locn14)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_71 [[attribute(1)]];
    float4 m_56 [[attribute(2)]];
    float4 m_61 [[attribute(3)]];
    float4 m_79 [[attribute(4)]];
    float4 m_73 [[attribute(5)]];
    float4 m_63 [[attribute(6)]];
    float4 m_65 [[attribute(7)]];
    float4 m_81 [[attribute(8)]];
    float4 m_75 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    bool _5404 = false;
    bool _804 = false;
    bool _700 = false;
    bool _584 = false;
    bool _200 = false;
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
    if (!_126)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5688 = as_type<float>(_138);
        out.gl_Position.z = _5688;
    }
    if (!_126)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _140 = in.m_61.w;
    bool _142 = _140 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _144 = isnan(_140);
    bool _146 = _142 || _144;
    bool _148 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _150 = _146 || _148;
    float _152 = -_140;
    float _154 = _152 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _156 = _154;
    if (_150)
    {
        float _158 = float(_122);
        _132 = _158;
    }
    float _160 = _132;
    bool _162 = _154 >= _160;
    bool _164 = !_150;
    bool _166 = _162 || _164;
    float _168 = _160;
    if (_166)
    {
        _168 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _170 = _168;
    if (_166)
    {
        out.m_59.x = 0.0;
    }
    int _172 = 0;
    if (_166)
    {
        float _174 = _170 * 5.0;
        _172 = as_type<int>(_174);
    }
    int _176 = _172;
    if (_166)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5758 = as_type<float>(_176);
        out.gl_Position.z = _5758;
    }
    if (_166)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _178 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _180 = !_178;
    float _198;
    if (!_180)
    {
        float _182 = in.m_63.x;
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
    float _210 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _212 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _210;
    float _214 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _216 = _214 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _218 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _220 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _218;
    float _222 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _224 = _222 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _226 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _228 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _226;
    float _230 = 1.0 / _216;
    float _232 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _234 = _232 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _236 = 1.0 / _224;
    float _238 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _240 = _208 + _238;
    bool _242 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _244 = 1.0 / _212;
    float _246 = _240 * _230;
    float _248 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _250 = _208 + _248;
    float _252 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _254 = _208 + _252;
    bool _256 = _208 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _258 = isnan(_208);
    bool _260 = _256 || _258;
    bool _262 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _264 = _260 || _262;
    float _266 = float(_264);
    float _268 = 1.0 / _234;
    float _270 = _250 * _236;
    bool _272 = _208 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _274 = isnan(_208);
    bool _276 = _272 || _274;
    bool _278 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _280 = _276 || _278;
    float _282 = float(_280);
    float _284 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _286 = _208 + _284;
    float _288 = 1.0 / _228;
    float _290 = _286 * _244;
    float _292 = -_282;
    float _294 = _292 + 1.0;
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _298 = _208 + _296;
    bool _300 = _208 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _302 = isnan(_208);
    bool _304 = _300 || _302;
    bool _306 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _308 = _304 || _306;
    float _310 = float(_308);
    float _312 = 1.0 / _220;
    bool _314 = _208 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _316 = isnan(_208);
    bool _318 = _314 || _316;
    bool _320 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _322 = _318 || _320;
    float _324 = float(_322);
    float _326 = _254 * _268;
    bool _328 = _208 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _330 = isnan(_208);
    bool _332 = _328 || _330;
    bool _334 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _336 = _332 || _334;
    float _338 = float(_336);
    float _340 = _324 * _294;
    float _342 = -_324;
    float _344 = _342 + 1.0;
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _348 = _346 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _352 = _208 + _350;
    float _354 = _338 * _344;
    float _356 = fma(_348, _246, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _358 = _352 * _288;
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _362 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _360;
    float _364 = _298 * _312;
    float _366 = -_338;
    float _368 = _366 + 1.0;
    float _370 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _372 = _370 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _374 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _376 = _374 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _380 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _378;
    float _382 = _266 * _368;
    float _384 = -_266;
    float _386 = _384 + 1.0;
    bool _388 = _208 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _390 = isnan(_208);
    bool _392 = _388 || _390;
    bool _394 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _396 = _392 || _394;
    float _398 = float(_396);
    float _400 = fma(_372, _246, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _402 = _208 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _404 = isnan(_208);
    bool _406 = _402 || _404;
    bool _408 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _410 = _406 || _408;
    float _412 = float(_410);
    float _414 = fma(_376, _246, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _416 = _310 * _386;
    float _418 = -_310;
    float _420 = _418 + 1.0;
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _424 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _422;
    float _426 = -_412;
    float _428 = _426 + 1.0;
    float _430 = _412 * _420;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _434 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _432;
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _438 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _436;
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _442 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _440;
    float _444 = fma(_380, _290, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _446 = fma(_424, _290, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _448 = _398 * _428;
    float _450 = fma(_362, _290, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _452 = fma(_438, _364, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _454 = fma(_434, _364, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _456 = fma(_442, _364, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _458 = _444 * _448;
    float _460 = _446 * _448;
    float _462 = -_398;
    float _464 = _462 + 1.0;
    float _466 = _450 * _448;
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _470 = _468 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _474 = _472 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _476 = fma(_464, (*spvDescriptorSet0.vp_c9)._m0[143].x, _458);
    float _478 = fma(_464, (*spvDescriptorSet0.vp_c9)._m0[143].y, _460);
    float _480 = fma(_464, (*spvDescriptorSet0.vp_c9)._m0[143].z, _466);
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _484 = _482 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _486 = fma(_400, _430, _476);
    float _488 = fma(_414, _430, _478);
    float _490 = fma(_356, _430, _480);
    float _492 = fma(_470, _270, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _494 = fma(_474, _270, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _496 = fma(_484, _270, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _498 = fma(_452, _416, _486);
    float _500 = fma(_454, _416, _488);
    float _502 = fma(_456, _416, _490);
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _506 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _504;
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _510 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _508;
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _514 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _512;
    float _516 = fma(_492, _382, _498);
    float _518 = fma(_494, _382, _500);
    float _520 = fma(_496, _382, _502);
    float _522 = fma(_506, _358, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _524 = fma(_510, _358, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _526 = fma(_514, _358, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _530 = _528 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _534 = _532 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[148].z;
    float _538 = _536 + (*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _540 = fma(_522, _354, _516);
    float _542 = fma(_530, _326, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _544 = fma(_534, _326, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _546 = fma(_538, _326, (*spvDescriptorSet0.vp_c9)._m0[148].z);
    float _548 = fma(_524, _354, _518);
    float _550 = fma(_526, _354, _520);
    float _552 = fma(_542, _340, _540);
    float _554 = fma(_544, _340, _548);
    float _556 = fma(_546, _340, _550);
    float _558 = fma(_282, (*spvDescriptorSet0.vp_c9)._m0[149].x, _552);
    float _560 = fma(_282, (*spvDescriptorSet0.vp_c9)._m0[149].y, _554);
    float _562 = fma(_282, (*spvDescriptorSet0.vp_c9)._m0[149].z, _556);
    bool _564 = !_242;
    float _582;
    if (!_564)
    {
        float _566 = in.m_63.x;
        float _568 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _570 = _566 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _572 = fma(_570, (*spvDescriptorSet0.vp_c9)._m0[11].y, _154);
        float _574 = _572 * _568;
        float _576 = floor(_574);
        float _578 = -_576;
        float _580 = _574 + _578;
        _582 = _580;
        _584 = true;
    }
    else
    {
        float _586 = float(_122);
        float _588 = 1.0 / _586;
        float _590 = _154 * _588;
        _582 = _590;
    }
    _584 = false;
    float _592 = _582;
    float _594 = in.m_65.x;
    float _596 = in.m_65.y;
    float _598 = in.m_65.z;
    bool _600 = _592 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _602 = isnan(_592);
    bool _604 = _600 || _602;
    bool _606 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _608 = _604 || _606;
    float _610 = float(_608);
    float _612 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _614 = _612 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _616 = _592 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _618 = isnan(_592);
    bool _620 = _616 || _618;
    bool _622 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _624 = _620 || _622;
    float _626 = float(_624);
    float _628 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _630 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _628;
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _634 = _592 + _632;
    float _636 = -_610;
    float _638 = _636 + 1.0;
    bool _640 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _642 = 1.0 / _614;
    float _644 = _626 * _638;
    float _646 = -_626;
    float _648 = _646 + 1.0;
    float _650 = _558 * _594;
    float _652 = _630 * _642;
    float _654 = fma(_652, _634, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _656 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _658 = _654 * _644;
    float _660 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _662 = _656 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _664 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[115].x, _658);
    float _666 = _560 * _596;
    float _668 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _670 = _660 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _672 = fma(_610, (*spvDescriptorSet0.vp_c9)._m0[116].x, _664);
    float _674 = _562 * _598;
    float _676 = _668 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _678 = _672 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_67.x = _676;
    out.m_67.y = _670;
    out.m_67.z = _662;
    out.m_67.w = _678;
    bool _680 = !_640;
    float _698;
    if (!_680)
    {
        float _682 = in.m_63.x;
        float _684 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _686 = _682 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _688 = fma(_686, (*spvDescriptorSet0.vp_c9)._m0[11].w, _154);
        float _690 = _688 * _684;
        float _692 = floor(_690);
        float _694 = -_692;
        float _696 = _690 + _694;
        _698 = _696;
        _700 = true;
    }
    else
    {
        float _702 = float(_122);
        float _704 = 1.0 / _702;
        float _706 = _154 * _704;
        _698 = _706;
    }
    _700 = false;
    float _708 = _698;
    bool _710 = _708 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _712 = isnan(_708);
    bool _714 = _710 || _712;
    bool _716 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _718 = _714 || _716;
    float _720 = float(_718);
    float _722 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _724 = _722 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _726 = _708 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _728 = isnan(_708);
    bool _730 = _726 || _728;
    bool _732 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _734 = _730 || _732;
    float _736 = float(_734);
    float _738 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _740 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _738;
    float _742 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _744 = _708 + _742;
    float _746 = -_720;
    float _748 = _746 + 1.0;
    float _750 = 1.0 / _724;
    bool _752 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _754 = _736 * _748;
    float _756 = -_736;
    float _758 = _756 + 1.0;
    float _760 = _740 * _750;
    float _762 = fma(_760, _744, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _764 = _762 * _754;
    float _766 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _768 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _770 = fma(_758, (*spvDescriptorSet0.vp_c9)._m0[131].x, _764);
    float _772 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _774 = _766 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _776 = _768 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _778 = fma(_720, (*spvDescriptorSet0.vp_c9)._m0[132].x, _770);
    float _780 = _772 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _782 = _778 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_69.x = _774;
    out.m_69.y = _776;
    out.m_69.z = _780;
    out.m_69.w = _782;
    bool _784 = !_752;
    float _802;
    if (!_784)
    {
        float _786 = in.m_63.x;
        float _788 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _790 = _786 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _792 = fma(_790, (*spvDescriptorSet0.vp_c9)._m0[14].x, _154);
        float _794 = _792 * _788;
        float _796 = floor(_794);
        float _798 = -_796;
        float _800 = _794 + _798;
        _802 = _800;
        _804 = true;
    }
    else
    {
        float _806 = float(_122);
        float _808 = 1.0 / _806;
        float _810 = _154 * _808;
        _802 = _810;
    }
    _804 = false;
    float _812 = _802;
    float _814 = in.m_56.x;
    float _816 = in.m_56.y;
    float _818 = in.m_56.z;
    float _820 = _816 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _822 = _816 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _824 = fma(_814, (*spvDescriptorSet0.vp_c10)._m0[4].x, _820);
    float _826 = fma(_814, (*spvDescriptorSet0.vp_c10)._m0[6].x, _822);
    float _828 = fma(_818, (*spvDescriptorSet0.vp_c10)._m0[4].z, _824);
    float _830 = fma(_818, (*spvDescriptorSet0.vp_c10)._m0[6].z, _826);
    float _832 = _828 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _834 = _830 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _836 = fma(_832, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _838 = fma(_834, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _840 = floor(_836);
    float _842 = floor(_838);
    float _844 = -_840;
    float _846 = _836 + _844;
    float _848 = -_842;
    float _850 = _838 + _848;
    float2 _6891 = float2(_846, _850);
    float _852 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6891, float2(0.0), isnan(_6891)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6891, float2(0.0), isnan(_6891)), level(0.0)).x;
    float _854 = in.m_63.x;
    float _856 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _858 = int(_856);
    float _860 = in.m_63.y;
    int _862 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _864 = _862 != 0;
    float _866 = -_832;
    float _868 = _866 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _870 = in.m_63.z;
    float _872 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _874 = _816 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _876 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _878 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _880 = log2(_878);
    float _882 = fma(_814, (*spvDescriptorSet0.vp_c10)._m0[5].x, _874);
    float _884 = -_834;
    float _886 = _884 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _888 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _890 = fma(_818, (*spvDescriptorSet0.vp_c10)._m0[5].z, _882);
    float _892 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _894 = int(_892);
    float _896 = float(_122);
    float _898 = _854 * 2.0;
    float _900 = _854 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _902 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _904 = float(_858);
    float _906 = _860 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _908 = _860 * 2.0;
    float _910 = floor(_898);
    float _912 = -_876;
    float _914 = fma(_900, 2.0, _912);
    float _916 = fma(_906, -2.0, _872);
    float _918 = _870 * 2.0;
    float _920 = _854 + _860;
    float _922 = _860 + _870;
    float _924 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[76].y, _916);
    float _926 = floor(_908);
    float _928 = _920 + (-1.0);
    int _930 = as_type<int>(_920);
    float _932 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    float _934 = _860;
    float _936 = _854;
    float _938 = _834;
    if (_864)
    {
        _930 = 0;
    }
    int _940 = _930;
    float _942 = _922 + (-1.0);
    int _944 = _940;
    if (!_864)
    {
        _944 = 2;
    }
    int _946 = _944;
    float _948 = fma(_928, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _950 = -_154;
    float _952 = fma(_950, (*spvDescriptorSet0.vp_c9)._m0[76].x, _914);
    float _954 = floor(_918);
    bool _956 = _910 > 0.0;
    float _958 = _666 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _960 = _946 != 2;
    float _962 = fma(_942, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _964 = _910 >= 0.0;
    bool _966 = isnan(_910);
    bool _968 = _964 || _966;
    bool _970 = isnan(0.0);
    bool _972 = _968 || _970;
    float _974 = _650 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _976 = _946;
    if (_864)
    {
        _976 = 0;
    }
    int _978 = _976;
    float _980 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _982 = int(_980);
    int _984 = _972 ? 0 : 1;
    int _986 = _978;
    if (!_864)
    {
        _986 = 1;
    }
    int _988 = _986;
    bool _990 = _926 > 0.0;
    bool _992 = _926 >= 0.0;
    bool _994 = isnan(_926);
    bool _996 = _992 || _994;
    bool _998 = isnan(0.0);
    bool _1000 = _996 || _998;
    float _1002 = 1.0 / _904;
    bool _1004 = _954 > 0.0;
    bool _1006 = _954 >= 0.0;
    bool _1008 = isnan(_954);
    bool _1010 = _1006 || _1008;
    bool _1012 = isnan(0.0);
    bool _1014 = _1010 || _1012;
    int _1016 = ~_984;
    int _1018 = _1016 + 1;
    int _1020 = _1018 + 1;
    int _1022 = _1020;
    float _1024 = as_type<float>(_988);
    if (!_956)
    {
        int _1026 = ~_984;
        int _1028 = _1026 + 1;
        _1022 = _1028;
    }
    int _1030 = _1022;
    float _1032 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1034 = int(_1032);
    bool _1036 = _988 != 1;
    float _1038 = _880 * _154;
    if (_960)
    {
        _1024 = _854;
    }
    float _1040 = _1024;
    float _1042 = _1040;
    if (!_960)
    {
        _1042 = _870;
    }
    float _1044 = _1042;
    float _1046 = _1014 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _1048 = exp2(_1038);
    int _1050 = _1000 ? 0 : 1;
    float _1052 = _1044 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    int _1054 = ~as_type<int>(_1046);
    int _1056 = _1054 + 1;
    int _1058 = _1056 + 1;
    float _1060 = _1002 * _154;
    int _1062 = ~_1050;
    int _1064 = _1062 + 1;
    int _1066 = _1064 + 1;
    float _1068 = -_888;
    float _1070 = fma(_1052, 2.0, _1068);
    float _1072 = _1052;
    int _1074 = _1058;
    int _1076 = _1066;
    float _1078 = _1046;
    float _1080 = _1044;
    if (!_1036)
    {
        _1072 = _860;
    }
    float _1082 = _1072;
    float _1084 = 1.0 / _896;
    float _1086 = _1082;
    if (!_1004)
    {
        int _1088 = ~as_type<int>(_1046);
        int _1090 = _1088 + 1;
        _1074 = _1090;
    }
    int _1092 = _1074;
    float _1094 = -_154;
    float _1096 = fma(_1094, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1070);
    if (!_990)
    {
        int _1098 = ~_1050;
        int _1100 = _1098 + 1;
        _1076 = _1100;
    }
    int _1102 = _1076;
    if (!_1036)
    {
        _1078 = _1082;
    }
    float _1104 = _1078;
    float _1106 = -_1048;
    float _1108 = _1106 + 1.0;
    float _1110 = _1104;
    if (_1036)
    {
        _1110 = _854;
    }
    float _1112 = _1110;
    float _1114 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _1116 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1118 = _1116 != 0;
    int _1120 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1122 = _1120 != 0;
    int _1124 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1126 = _1124 != 0;
    float _1128 = _1112 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (!_1036)
    {
        _1080 = _870;
    }
    float _1130 = _1080;
    float _1132 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1134 = _1130;
    if (_1036)
    {
        _1134 = _860;
    }
    float _1136 = _1134;
    float _1138 = -_1114;
    float _1140 = fma(_1128, 2.0, _1138);
    float _1142 = _890 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1144 = !_1122;
    int _1146 = _1144 ? 0 : 1;
    float _1148 = _1084 * _154;
    bool _1150 = !_1118;
    int _1152 = _1150 ? 0 : 1;
    float _1154 = fma(_1136, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1132);
    int _1156 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1158 = _1156 != 0;
    int _1160 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1162 = _1160 != 0;
    float _1164 = _1142 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1166 = _1142 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    if (_1036)
    {
        _1086 = _854;
    }
    float _1168 = _1086;
    float _1170 = -_1142;
    float _1172 = _1170 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    bool _1174 = !_1126;
    int _1176 = _1174 ? 0 : 1;
    float _1178 = fma(_832, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1164);
    bool _1180 = !_1162;
    int _1182 = _1180 ? 0 : 1;
    float _1184 = fma(_832, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1166);
    bool _1186 = !_1158;
    int _1188 = _1186 ? 0 : 1;
    float _1190 = fma(_834, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1178);
    int _1192 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1194 = _1192 != 0;
    int _1196 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1198 = _1196 != 0;
    int _1200 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1202 = _1200 != 0;
    float _1204 = fma(_1168, (*spvDescriptorSet0.vp_c9)._m0[83].z, _902);
    float _1206 = fma(_834, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1184);
    float _1208 = _1190 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1210 = float(_894);
    float _1212 = in.m_71.x;
    float _1214 = in.m_71.y;
    float _1216 = in.m_71.z;
    bool _1218 = !_1194;
    int _1220 = _1218 ? 0 : 1;
    float _1222 = _1206 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1224 = float(_1092);
    float _1226 = 1.0 / _1210;
    int _1228 = abs(_1220);
    float _1230 = _1208 + _1222;
    float _1232 = _1178;
    float _1234 = as_type<float>(_1228);
    if (!_1036)
    {
        _1232 = _870;
    }
    float _1236 = _1232;
    float _1238 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1240 = _1172 * _1172;
    float _1242 = _1236;
    if (_1036)
    {
        _1242 = _860;
    }
    float _1244 = _1242;
    float _1246 = 1.0 / _1222;
    float _1248 = float(_1228);
    float _1250 = fma(_868, _868, _1240);
    if (_960)
    {
        _1234 = _860;
    }
    float _1252 = _1234;
    float _1254 = _1244 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1256 = _1252;
    if (!_960)
    {
        _1256 = _854;
    }
    float _1258 = _1256;
    float _1260 = _1248 * _1224;
    float _1262 = fma(_1254, -2.0, _1238);
    float _1264 = _1260 * (-2.0);
    float _1266 = _1258 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1268 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1270 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1272 = 1.0 + _1270;
    float _1274 = _1230 * _1246;
    float _1276 = _1274 * 0.5;
    float _1278 = fma(_948, _1264, _948);
    float _1280 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1282 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1284 = fma(_1266, -2.0, _1268);
    float _1286 = float(_982);
    float _1288 = _1142 + _1280;
    float _1290 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1292 = fma(_860, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1282);
    float _1294 = 1.0 / _1286;
    float _1296 = _1288 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1298 = fma(_1264, _1212, _1212);
    float _1300 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1302 = fma(_860, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1290);
    bool _1304 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1306 = isnan(1.0);
    bool _1308 = _1304 || _1306;
    bool _1310 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1312 = _1308 || _1310;
    float _1314 = fma(_832, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1296);
    float _1316 = 1.0 / _1272;
    bool _1318 = !_1198;
    int _1320 = _1318 ? 0 : 1;
    float _1322 = fma(_854, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1300);
    float _1324 = fma(_886, _886, _1250);
    bool _1326 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1328 = isnan(0.0);
    bool _1330 = _1326 || _1328;
    bool _1332 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1334 = _1330 || _1332;
    float _1336 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1338 = !_1202;
    int _1340 = _1338 ? 0 : 1;
    float _1342 = _1226 * _154;
    float _1344 = float(_1030);
    float _1346 = fma(_854, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1336);
    int _1348 = abs(_1320);
    float _1350 = _854 + (-0.5);
    float _1352 = float(_1034);
    float _1354 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1346);
    float _1356 = _1334 ? _1108 : 0.0;
    float _1358 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1292);
    int _1360 = abs(_1340);
    float _1362 = _1352 * _154;
    float _1364 = float(_1348);
    float _1366 = _1294 * _154;
    float _1368 = float(_1102);
    float _1370 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1322);
    float _1372 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1302);
    float _1374 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1204);
    float _1376 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1154);
    float _1378 = -_154;
    float _1380 = fma(_1378, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1140);
    float _1382 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1262);
    float _1384 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1284);
    float _1386 = float(_1360);
    int _1388 = as_type<int>(_1342);
    float _1390 = _1288;
    if (_1312)
    {
        float _1392 = _1356 * _1316;
        _156 = _1392;
    }
    float _1394 = _156;
    float _1396 = fma(_834, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1314);
    float _1398 = fma(_1350, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1298);
    float _1400 = _1364 * _1344;
    float _1402 = rsqrt(_1324);
    float _1404 = _1396 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1406 = _1386 * _1368;
    float _1408 = fma(_1278, _1394, _1398);
    float _1410 = _854 + _870;
    float _1412 = _1400 * (-2.0);
    float _1414 = _1406 * (-2.0);
    float _1416 = _860 + (-0.5);
    float _1418 = _1410 + (-1.0);
    float _1420 = fma(_1412, _1214, _1214);
    float _1422 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1424 = fma(_1276, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1422);
    float _1426 = _1288 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1428 = in.m_73.x;
    float _1430 = in.m_73.y;
    float _1432 = in.m_73.z;
    float _1434 = fma(_1418, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1436 = fma(_1416, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1420);
    float _1438 = fma(_1414, _1216, _1216);
    float _1440 = _870 + (-0.5);
    float _1442 = 1.0 / _1424;
    float _1444 = fma(_1434, _1414, _1434);
    float _1446 = _868 * _1402;
    float _1448 = fma(_1440, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1438);
    float _1450 = fma(_832, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1426);
    float _1452 = fma(_962, _1412, _962);
    float _1454 = _886 * _1402;
    float _1456 = fma(_1444, _1394, _1448);
    float _1458 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1460 = _1446 * _1458;
    float _1462 = fma(_834, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1450);
    float _1464 = fma(_1452, _1394, _1436);
    float _1466 = _1172 * _1402;
    float _1468 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1470 = _1454 * _1468;
    float _1472 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1474 = -_1460;
    float _1476 = fma(_1454, _1472, _1474);
    float _1478 = _1462 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1480 = _1464 * 0.15915493667125701904296875;
    float _1482 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1484 = -_1470;
    float _1486 = fma(_1466, _1482, _1484);
    float _1488 = _1408 * 0.15915493667125701904296875;
    float _1490 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1492 = _1466 * _1490;
    float _1494 = _1476 * _1476;
    float _1496 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1498 = _1442 * _1496;
    float _1500 = trunc(_1404);
    int _1502 = int(_1500);
    float _1504 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1506 = -_1492;
    float _1508 = fma(_1446, _1504, _1506);
    float _1510 = fma(_1486, _1486, _1494);
    float _1512 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1430);
    bool _1514 = _1498 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1516 = _1456 * 0.15915493667125701904296875;
    float _1518 = fma(_1508, _1508, _1510);
    bool _1520 = _1498 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1522 = trunc(_1478);
    int _1524 = int(_1522);
    float _1526 = _1512 * _958;
    float _1528 = _674 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _1530 = !_1514;
    int _1532 = _1530 ? 0 : 1;
    float _1534 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1428);
    float _1536 = rsqrt(_1518);
    int _1538 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1540 = _1502 + _1538;
    int _1542 = _1540 + 1;
    float _1544 = _1534 * _974;
    int _1546 = 2;
    int _1548 = _1542;
    if (!_1514)
    {
        _1546 = 1;
    }
    int _1550 = _1546;
    float _1552 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1432);
    int _1554 = _1550;
    if (!_1520)
    {
        _1554 = _1532;
    }
    int _1556 = _1554;
    bool _1558 = _1542 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1560 = _1488 * 6.283185482025146484375;
    float _1562 = sin(_1560);
    int _1564 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1566 = _1524 + _1564;
    int _1568 = _1566 + 1;
    float _1570 = _1552 * _1528;
    int _1572 = _1556 << 6;
    int _1574 = _1542 | _1568;
    int _1576 = _1572 + 104;
    uint _1579 = uint(int(uint(_1576) >> uint(2)));
    uint _1581 = uint(int(uint(int(_1579)) >> uint(2)));
    int _1583 = int(_1579) & 3;
    float _1585 = (*spvDescriptorSet0.vp_c15)._m0[int(_1581)][_1583];
    int _1587 = int(_1579) + 1;
    uint _1589 = uint(int(uint(_1587) >> uint(2)));
    int _1591 = _1587 & 3;
    float _1593 = (*spvDescriptorSet0.vp_c15)._m0[int(_1589)][_1591];
    float _1595 = _1488 * 6.283185482025146484375;
    float _1597 = cos(_1595);
    bool _1599 = _1574 < 0;
    bool _1601 = _1599 || _1558;
    float _1603 = _1486 * _1536;
    float _1605 = _1476 * _1536;
    float _1607 = _1508 * _1536;
    bool _1609 = _1568 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1611 = _1609 || _1601;
    float _1613 = _1466 * _1603;
    int _1615 = _1572 + 96;
    uint _1617 = uint(int(uint(_1615) >> uint(2)));
    uint _1619 = uint(int(uint(int(_1617)) >> uint(2)));
    int _1621 = int(_1617) & 3;
    float _1623 = (*spvDescriptorSet0.vp_c15)._m0[int(_1619)][_1621];
    int _1625 = int(_1617) + 1;
    uint _1627 = uint(int(uint(_1625) >> uint(2)));
    int _1629 = _1625 & 3;
    float _1631 = (*spvDescriptorSet0.vp_c15)._m0[int(_1627)][_1629];
    float _1633 = _1480 * 6.283185482025146484375;
    float _1635 = sin(_1633);
    float _1637 = _1454 * _1605;
    float _1639 = -_1613;
    float _1641 = fma(_1446, _1605, _1639);
    float _1643 = -_1637;
    float _1645 = fma(_1466, _1607, _1643);
    int _1647 = _1572 + 48;
    uint _1649 = uint(int(uint(_1647) >> uint(2)));
    uint _1651 = uint(int(uint(int(_1649)) >> uint(2)));
    int _1653 = int(_1649) & 3;
    float _1655 = (*spvDescriptorSet0.vp_c15)._m0[int(_1651)][_1653];
    int _1657 = int(_1649) + 1;
    uint _1659 = uint(int(uint(_1657) >> uint(2)));
    int _1661 = _1657 & 3;
    float _1663 = (*spvDescriptorSet0.vp_c15)._m0[int(_1659)][_1661];
    float _1665 = _1480 * 6.283185482025146484375;
    float _1667 = cos(_1665);
    int _1669 = _1568;
    if (!_1611)
    {
        int _1671 = _1568 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1673 = _1671 + _1542;
        _1548 = _1673;
    }
    int _1675 = _1548;
    float _1677 = as_type<float>(_1675);
    if (!_1611)
    {
        int _1679 = _1675 << 2;
        _1669 = _1679;
    }
    int _1681 = _1669;
    float _1683 = _1516 * 6.283185482025146484375;
    float _1685 = cos(_1683);
    float _1687 = _1562 * _1635;
    float _1689 = _1597 * _1635;
    int _1691 = 0;
    int _1693 = _1681;
    if (!_1611)
    {
        uint _1695 = uint(int(uint(_1675) >> uint(2)));
        _1691 = int(_1695);
    }
    int _1697 = _1691;
    int _1699 = _1697;
    if (!_1611)
    {
        int _1701 = 12 & _1681;
        _1693 = _1701;
    }
    int _1703 = _1693;
    float _1705 = _1516 * 6.283185482025146484375;
    float _1707 = sin(_1705);
    float _1709 = _1597 * _1667;
    float _1711 = _1562 * _1667;
    if (!_1611)
    {
        int _1713 = _1697 << 4;
        int _1715 = _1713 + _1703;
        _1699 = _1715;
    }
    int _1717 = _1699;
    float _1719 = _1597 * _1685;
    float _1721 = _1562 * _1685;
    float _1723 = _1667 * _1685;
    float _1725 = _1635 * _1685;
    float _1727 = _1719 * _1526;
    int _1729 = _1572 + 72;
    uint _1731 = uint(int(uint(_1729) >> uint(2)));
    uint _1733 = uint(int(uint(int(_1731)) >> uint(2)));
    int _1735 = int(_1731) & 3;
    float _1737 = (*spvDescriptorSet0.vp_c15)._m0[int(_1733)][_1735];
    int _1739 = int(_1731) + 1;
    uint _1741 = uint(int(uint(_1739) >> uint(2)));
    int _1743 = _1739 & 3;
    float _1745 = (*spvDescriptorSet0.vp_c15)._m0[int(_1741)][_1743];
    float _1747 = fma(_1707, _1709, _1687);
    float _1749 = -_1689;
    float _1751 = fma(_1707, _1711, _1749);
    float _1753 = -_1711;
    float _1755 = fma(_1707, _1689, _1753);
    float _1757 = fma(_1707, _1687, _1709);
    float _1759 = -_1526;
    float _1761 = _1707 * _1759;
    float _1763 = fma(_1747, _1544, _1727);
    int _1765 = _1572 + 64;
    uint _1767 = uint(int(uint(_1765) >> uint(2)));
    uint _1769 = uint(int(uint(int(_1767)) >> uint(2)));
    int _1771 = int(_1767) & 3;
    float _1773 = (*spvDescriptorSet0.vp_c15)._m0[int(_1769)][_1771];
    int _1775 = int(_1767) + 1;
    uint _1777 = uint(int(uint(_1775) >> uint(2)));
    int _1779 = _1775 & 3;
    float _1781 = (*spvDescriptorSet0.vp_c15)._m0[int(_1777)][_1779];
    float _1783 = _1721 * _1526;
    float _1785 = fma(_1723, _1544, _1761);
    float _1787 = fma(_1755, _1570, _1763);
    float _1789 = _1288 * _1631;
    float _1791 = fma(_1751, _1544, _1783);
    float _1793 = fma(_1725, _1570, _1785);
    float _1795 = _1641 * _1787;
    float _1797 = _1645 * _1787;
    float _1799 = fma(_1757, _1570, _1791);
    int _1801 = _1572 + 56;
    uint _1803 = uint(int(uint(_1801) >> uint(2)));
    uint _1805 = uint(int(uint(int(_1803)) >> uint(2)));
    int _1807 = int(_1803) & 3;
    float _1809 = (*spvDescriptorSet0.vp_c15)._m0[int(_1805)][_1807];
    int _1811 = int(_1803) + 1;
    uint _1813 = uint(int(uint(_1811) >> uint(2)));
    int _1815 = _1811 & 3;
    float _1817 = (*spvDescriptorSet0.vp_c15)._m0[int(_1813)][_1815];
    float _1819 = fma(_1607, _1793, _1795);
    float _1821 = fma(_1603, _1793, _1797);
    float _1823 = fma(_832, _1623, _1789);
    float _1825 = _1288 * _1663;
    float _1827 = fma(_1454, _1799, _1819);
    float _1829 = fma(_1446, _1799, _1821);
    float _1831 = fma(_834, _1585, _1823);
    float _1833 = _1663;
    float _1835 = _1623;
    if (!_1611)
    {
        float _1837 = floor(_1404);
        _1833 = _1837;
    }
    float _1839 = _1833;
    float _1841 = _834 + _1827;
    float _1843 = _832 + _1829;
    int _1845 = _1572 + 80;
    uint _1847 = uint(int(uint(_1845) >> uint(2)));
    uint _1849 = uint(int(uint(int(_1847)) >> uint(2)));
    int _1851 = int(_1847) & 3;
    float _1853 = (*spvDescriptorSet0.vp_c15)._m0[int(_1849)][_1851];
    int _1855 = int(_1847) + 1;
    uint _1857 = uint(int(uint(_1855) >> uint(2)));
    int _1859 = _1855 & 3;
    float _1861 = (*spvDescriptorSet0.vp_c15)._m0[int(_1857)][_1859];
    float _1863 = _1831 + _1593;
    float _1865 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1867 = _1841 + _1865;
    float _1869 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1871 = _1843 + _1869;
    float _1873 = fma(_832, _1655, _1825);
    float _1875 = _1867 * _1867;
    float _1877 = 1.0 / _1863;
    float _1879 = fma(_1871, _1871, _1875);
    float _1881 = _1446 * _1607;
    float _1883 = sqrt(_1879);
    float _1885 = -_1881;
    float _1887 = fma(_1454, _1603, _1885);
    float _1889 = _1887 * _1787;
    float _1891 = fma(_1605, _1793, _1889);
    float _1893 = _1288 * _1781;
    bool _1895 = _1883 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1897 = fma(_832, _1773, _1893);
    float _1899 = fma(_1466, _1799, _1891);
    int _1901 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1903 = _1901 != 0;
    int _1905 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1907 = _1905 != 0;
    float _1909 = fma(_834, _1737, _1897);
    float _1911 = fma(_834, _1809, _1873);
    float _1913 = _1909 + _1745;
    int _1915 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1917 = _1915 != 0;
    int _1919 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1921 = _1919 != 0;
    float _1923 = _1142 + _1899;
    bool _1925 = !_1907;
    int _1927 = _1925 ? 0 : 1;
    float _1929 = _1911 + _1817;
    bool _1931 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1933 = isnan(0.5);
    bool _1935 = _1931 || _1933;
    bool _1937 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1939 = _1935 || _1937;
    bool _1941 = !_1903;
    int _1943 = _1941 ? 0 : 1;
    bool _1945 = !_1917;
    int _1947 = _1945 ? 0 : 1;
    bool _1949 = !_1921;
    int _1951 = _1949 ? 0 : 1;
    float _1953 = _1899;
    float _1955 = _1897;
    float _1957 = _1871;
    float _1959 = _1873;
    if (!_1895)
    {
        _1953 = _1843;
    }
    float _1961 = _1953;
    float _1963 = _1961;
    if (!_1895)
    {
        _1835 = _1841;
    }
    float _1965 = _1835;
    float _1967 = _1965;
    if (!_1895)
    {
        _1955 = _1923;
    }
    float _1969 = _1955;
    bool _1971 = !_1895;
    float _1973 = _1969;
    float _1975 = _1861;
    if (!_1971)
    {
        float _1977 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1979 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1981 = _1883 + _1979;
        float _1983 = _1923 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1985 = rsqrt(_1879);
        float _1987 = _1981 * _1977;
        float _1989 = _1987 * 0.15915493667125701904296875;
        float _1991 = _1989 * 6.283185482025146484375;
        float _1993 = cos(_1991);
        float _1995 = _1989 * 6.283185482025146484375;
        float _1997 = sin(_1995);
        float _1999 = _1993 + (-1.0);
        float _2001 = _1999 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2003 = fma(_1997, _1983, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2005 = fma(_1923, _1993, _2001);
        float _2007 = _1985 * _2003;
        float _2009 = fma(_1871, _2007, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2011 = fma(_1867, _2007, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1967 = _2011;
        _1963 = _2009;
        _1973 = _2005;
    }
    float _2013 = _1967;
    float _2015 = _1963;
    float _2017 = _1973;
    float _2019 = _1929 * _1877;
    float _2021 = _2017;
    float _2023 = _2015;
    if (_1939)
    {
        _1957 = _2013;
    }
    float _2025 = _1957;
    float _2027 = _2025;
    if (!_1939)
    {
        float _2029 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2031 = _1142 + _2029;
        float _2033 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2035 = _832 + _2033;
        float _2037 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2039 = -_832;
        float _2041 = _2039 + _2015;
        float _2043 = _2031 * _2031;
        float _2045 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2047 = _834 + _2045;
        float _2049 = -_834;
        float _2051 = _2049 + _2013;
        float _2053 = fma(_2035, _2035, _2043);
        float _2055 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2057 = fma(_2047, _2047, _2053);
        float _2059 = sqrt(_2057);
        float _2061 = _2037 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2063 = precise::min(_2059, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2065 = _2063 * _2055;
        float _2067 = -_1142;
        float _2069 = _2067 + _2017;
        float _2071 = _2061 * _2065;
        float _2073 = fma(_2069, _2071, _1142);
        float _2075 = fma(_2041, _2071, _832);
        float _2077 = fma(_2051, _2071, _834);
        _2021 = _2073;
        _2023 = _2075;
        _2027 = _2077;
    }
    float _2079 = _2021;
    float _2081 = _2023;
    float _2083 = _2027;
    int _2085 = _1572 + 88;
    uint _2087 = uint(int(uint(_2085) >> uint(2)));
    uint _2089 = uint(int(uint(int(_2087)) >> uint(2)));
    int _2091 = int(_2087) & 3;
    float _2093 = (*spvDescriptorSet0.vp_c15)._m0[int(_2089)][_2091];
    int _2095 = int(_2087) + 1;
    uint _2097 = uint(int(uint(_2095) >> uint(2)));
    int _2099 = _2095 & 3;
    float _2101 = (*spvDescriptorSet0.vp_c15)._m0[int(_2097)][_2099];
    float _2103 = _2079 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2105 = _2079 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2107 = _2079 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    bool _2109 = _2019 >= 0.0;
    float _2111 = fma(_2081, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2103);
    float _2113 = fma(_2081, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2105);
    float _2115 = fma(_2081, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2107);
    float _2117 = _1879;
    if (!_1611)
    {
        int _2119 = _1717 + 400;
        uint _2121 = uint(int(uint(_2119) >> uint(2)));
        uint _2123 = uint(int(uint(int(_2121)) >> uint(2)));
        int _2125 = int(_2121) & 3;
        float _2127 = (*spvDescriptorSet0.vp_c15)._m0[int(_2123)][_2125];
        _2117 = _2127;
    }
    float _2129 = _2117;
    float _2131 = fma(_2083, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2111);
    float _2133 = _1913 * _1877;
    bool _2135 = _2019 <= 1.0;
    bool _2137 = _2135 && _2109;
    float _2139 = fma(_2083, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2113);
    float _2141 = fma(_2083, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2115);
    float _2143 = _2079 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2145 = _2131 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _2147 = _2133 >= 0.0;
    bool _2149 = _2147 && _2137;
    float _2151 = _2139 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2153 = _2141 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2155 = fma(_2081, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2143);
    float _2157 = _2145 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _2159 = _2133 <= 1.0;
    bool _2161 = _2159 && _2149;
    float _2163 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2165 = _2151 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2167 = fma(_2083, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2155);
    float _2169 = fma(_2153, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2157);
    float _2171 = _2145 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2173 = -_2165;
    float _2175 = fma(_2173, _2163, 1.0);
    float _2177 = _2167 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2179 = fma(_2151, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2169);
    float _2181 = _1288 * _1861;
    float _2183 = _2169;
    if (!_1611)
    {
        float _2185 = floor(_1478);
        _1959 = _2185;
    }
    float _2187 = _1959;
    float _2189 = fma(_2153, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2171);
    float _2191 = fma(_2177, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2179);
    float _2193 = _2191;
    if (_2161)
    {
        float _2195 = float(_1556);
        _2183 = _2195;
    }
    float _2197 = _2183;
    float _2199 = _2145 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2201 = fma(_832, _1853, _2181);
    if (!_1611)
    {
        float _2203 = -_1839;
        float _2205 = _1404 + _2203;
        _1975 = _2205;
    }
    float _2207 = _1975;
    float _2209 = log2(_2175);
    float _2211 = fma(_2153, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2199);
    float _2213 = fma(_2151, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2189);
    float _2215 = fma(_2151, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2211);
    float _2217 = fma(_2177, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2213);
    float _2219 = 1.0 / _2191;
    float _2221 = fma(_834, _2093, _2201);
    float _2223 = fma(_2177, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2215);
    float _2225 = _2221 + _2101;
    float _2227 = _2197;
    if (_2161)
    {
        float _2229 = rint(_2197);
        float _2231 = precise::max(_2229, 0.0);
        uint _2233 = uint(_2231);
        uint _2235 = clamp(_2233, 0u, 65535u);
        _2227 = as_type<float>(_2235);
    }
    float _2237 = _2227;
    float _2239 = _2209 * 0.693147182464599609375;
    float _2241 = _2225 * _1877;
    float _2243 = _2239 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2245 = _2239;
    if (!_1611)
    {
        float _2247 = -_2187;
        float _2249 = _1478 + _2247;
        _2245 = _2249;
    }
    float _2251 = _2245;
    float _2253 = _2201;
    if (!_1611)
    {
        float _2255 = rint(_2129);
        float _2257 = precise::max(_2255, 0.0);
        uint _2259 = uint(_2257);
        uint _2261 = clamp(_2259, 0u, 65535u);
        _2253 = as_type<float>(_2261);
    }
    float _2263 = _2253;
    float _2265 = _2217 * _2219;
    float _2267 = _2223 * _2219;
    float _2269 = fma(_2265, 0.5, 0.5);
    float _2271 = fma(_2267, -0.5, 0.5);
    float _2273 = _2265;
    if (_2161)
    {
        float3 _9159 = float3(_2019, _2133, float(as_type<int>(_2237)));
        float3 _9163 = select(_9159, float3(0.0), isnan(_9159));
        float _2275 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _9163.xy, uint(rint(_9163.z)), _2241, level(0.0));
        _2273 = _2275;
    }
    float _2277 = _2273;
    float3 _9173 = float3(_2269, _2271, _2243);
    float _2279 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9173, float3(0.0), isnan(_9173)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9173, float3(0.0), isnan(_9173)), level(0.0)).x;
    float3 _9182 = float3(_2269, _2271, _2243);
    float4 _2282 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9182, float3(0.0), isnan(_9182)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9182, float3(0.0), isnan(_9182)), level(0.0)).xyzw;
    float _2284 = _2282.x;
    float _2286 = _2282.y;
    float _2288 = _2282.z;
    float _2290 = _2282.w;
    float _2292 = _2251;
    float _2294 = _2263;
    if (!_1611)
    {
        float3 _9206 = float3(_2207, _2251, float(as_type<int>(_2263)));
        float3 _9208 = select(_9206, float3(0.0), isnan(_9206));
        float _2296 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _9208.xy, uint(rint(_9208.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _9208.xy, uint(rint(_9208.z)), level(0.0)).x;
        _2292 = _2296;
    }
    float _2298 = _2292;
    float _2300 = float(uint(_1034));
    float _2302 = trunc(_1342);
    int _2304 = int(_2302);
    int _2306 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2308 = _2306 != 0;
    float _2310 = _1362 * _1084;
    int _2312 = abs(_1146);
    int _2314 = abs(_1176);
    int _2316 = abs(_1947);
    float _2318 = 1.0 / _2300;
    float _2320 = float(uint(_2304));
    float _2322 = trunc(_2310);
    int _2324 = int(_2322);
    int _2326 = as_type<int>(_2318) + (-2);
    float _2328 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _2330 = int(_2328);
    float _2332 = as_type<float>(_2326) * _2320;
    float _2334 = trunc(_2332);
    float _2336 = precise::max(_2334, 0.0);
    uint _2338 = uint(_2336);
    int _2340 = ~_1034;
    int _2342 = _2340 + 1;
    float _2344 = trunc(_1060);
    int _2346 = int(_2344);
    int _2348 = _2342 * int(_2338);
    int _2350 = _2348 + _2304;
    if (_2308)
    {
        _2294 = 1.0;
    }
    float _2352 = _2294;
    float _2354 = _2352;
    if (!_2308)
    {
        _2354 = 7.345489978790283203125;
    }
    float _2356 = _2354;
    float _2358 = float(uint(_2350));
    int _2360 = ~_1034;
    int _2362 = _2360 + 1;
    float _2364 = _2356 * _854;
    float _2366 = float(_2304);
    float _2368 = as_type<float>(_2326) * _2358;
    int _2370 = ~_2330;
    int _2372 = _2370 + 1;
    bool _2374 = _2366 >= _1352;
    bool _2376 = isnan(_2366);
    bool _2378 = _2374 || _2376;
    bool _2380 = isnan(_1352);
    bool _2382 = _2378 || _2380;
    float _2384 = float(_2382);
    float _2386 = trunc(_2368);
    float _2388 = precise::max(_2386, 0.0);
    uint _2390 = uint(_2388);
    int _2392 = ~_2330;
    int _2394 = _2392 + 1;
    float _2396 = trunc(_2384);
    int _2398 = int(_2396);
    int _2400 = int(_2338) + int(_2390);
    float _2402 = floor(_2364);
    int _2404 = _2362 * _2400;
    int _2406 = _2404 + _2304;
    bool _2408 = uint(_2406) >= uint(_1034);
    bool _2410 = !_2408;
    int _2412 = _2410 ? 0 : (-1);
    bool _2414 = _1034 == 0;
    int _2416 = ~_2400;
    int _2418 = _2416 + _2412;
    int _2420 = _2418 + 1;
    float _2422 = -_2402;
    float _2424 = _2364 + _2422;
    int _2426 = _1034 + (-1);
    float _2428 = in.m_63.w;
    int _2430 = _1034 * _2420;
    int _2432 = _2430 + _2304;
    float _2434 = _2424 * _1352;
    int _2436 = ~_2398;
    int _2438 = _2436 + 1;
    int _2440 = _2438 + 1;
    bool _2442 = !_2414;
    int _2444 = _2442 ? _2432 : (-1);
    float _2446 = trunc(_2434);
    int _2448 = int(_2446);
    int _2450 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2452 = _2450 != 0;
    int _2454 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2456 = _2454 != 0;
    int _2458 = _2444 * _2440;
    bool _2460 = !_2452;
    int _2462 = _2460 ? 0 : 1;
    int _2464 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2466 = _2464 != 0;
    int _2468 = _2398 * _2426;
    int _2470 = _2468 + _2458;
    int _2472 = abs(_2462);
    int _2474 = abs(_1152);
    float _2476 = trunc(_1366);
    int _2478 = int(_2476);
    int _2480 = _2470 * _2312;
    bool _2482 = !_2466;
    int _2484 = _2482 ? 0 : 1;
    float _2486 = float(uint(_2346));
    int _2488 = _2448 * _2472;
    int _2490 = _2488 + _2304;
    int _2492 = abs(_2484);
    int _2494 = _2324 * _2474;
    int _2496 = _2494 + _2480;
    float _2498 = in.m_75.x;
    float _2500 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _2502 = int(_2500);
    int _2504 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2506 = _2504 != 0;
    int _2508 = _2490 * _2314;
    int _2510 = _2508 + _2496;
    bool _2512 = _2466;
    float _2514 = as_type<float>(_2372);
    if (_2456)
    {
        bool _2516 = _854 > 0.5;
        _2512 = _2516;
    }
    bool _2518 = _2512;
    float _2520 = float(uint(_2478));
    int _2522 = _2448 * _2492;
    int _2524 = _2522 + _2510;
    float _2526 = float(uint(_2330));
    float _2528 = 1.0 / _2526;
    float _2530 = float(uint(_2524));
    float _2532 = float(uint(_2502));
    float _2534 = as_type<float>(_2326) * _2530;
    int _2536 = ~_1034;
    int _2538 = _2536 + 1;
    float _2540 = trunc(_2534);
    float _2542 = precise::max(_2540, 0.0);
    uint _2544 = uint(_2542);
    int _2546 = _2538;
    if (!_2456)
    {
        _932 = _2498;
    }
    float _2548 = _932;
    float _2550 = _2548;
    if (_2506)
    {
        float _2552 = -_2498;
        float _2554 = _2552 + 1.0;
        _1388 = as_type<int>(_2554);
    }
    int _2556 = _1388;
    int _2558 = as_type<int>(_2528) + (-2);
    float _2560 = 1.0 / _2532;
    float _2562 = as_type<float>(_2558) * _2486;
    float _2564 = trunc(_2562);
    float _2566 = precise::max(_2564, 0.0);
    uint _2568 = uint(_2566);
    int _2570 = _2538 * int(_2544);
    int _2572 = _2570 + _2524;
    int _2574 = int(_2544);
    if (_2456)
    {
        float _2576 = -_2498;
        float _2578 = _2576 + 1.0;
        _2546 = as_type<int>(_2578);
    }
    int _2580 = _2546;
    float _2582 = float(uint(_2572));
    float _2584 = _2582;
    if (_2456)
    {
        float _2586 = _2518 ? as_type<float>(_2580) : _2498;
        _2550 = _2586;
    }
    float _2588 = _2550;
    float _2590 = as_type<float>(_2326) * _2582;
    int _2592 = as_type<int>(_2560) + (-2);
    bool _2594 = _870 > 0.5;
    float _2596 = trunc(_2590);
    float _2598 = precise::max(_2596, 0.0);
    uint _2600 = uint(_2598);
    int _2602 = _2372 * int(_2568);
    int _2604 = _2602 + _2346;
    float _2606 = as_type<float>(_2592) * _2520;
    int _2608 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2610 = _2608 != 0;
    float _2612 = as_type<float>(_2372);
    if (_2308)
    {
        _2584 = _854;
    }
    float _2614 = _2584;
    float _2616 = float(uint(_2604));
    float _2618 = trunc(_2606);
    float _2620 = precise::max(_2618, 0.0);
    uint _2622 = uint(_2620);
    float _2624 = _2614;
    if (_2308)
    {
        _2612 = 1.0;
    }
    float _2626 = _2612;
    float _2628 = _2626;
    if (!_2506)
    {
        _2514 = _2498;
    }
    float _2630 = _2514;
    float _2632 = as_type<float>(_2558) * _2616;
    float _2634 = _2630;
    if (!_2308)
    {
        _2624 = _860;
    }
    float _2636 = _2624;
    if (!_2308)
    {
        _2628 = 1.2345600128173828125;
    }
    float _2638 = _2628;
    if (_2506)
    {
        float _2640 = _2594 ? as_type<float>(_2556) : _2498;
        _2634 = _2640;
    }
    float _2642 = _2634;
    int _2644 = ~_2502;
    int _2646 = _2644 + 1;
    float _2648 = _2636 * _2638;
    int _2650 = int(_2544) + int(_2600);
    if (_2610)
    {
        float _2652 = -_2498;
        float _2654 = _2652 + 1.0;
        _2574 = as_type<int>(_2654);
    }
    int _2656 = _2574;
    float _2658 = floor(_2648);
    bool _2660 = _860 > 0.5;
    float _2662 = as_type<float>(_2656);
    if (!_2610)
    {
        _934 = _2498;
    }
    float _2664 = _934;
    int _2666 = _2646 * int(_2622);
    int _2668 = _2666 + _2478;
    int _2670 = ~_1034;
    int _2672 = _2670 + 1;
    float _2674 = _2664;
    if (_2610)
    {
        float _2676 = _2660 ? as_type<float>(_2656) : _2498;
        _2674 = _2676;
    }
    float _2678 = _2674;
    float _2680 = trunc(_2632);
    float _2682 = precise::max(_2680, 0.0);
    uint _2684 = uint(_2682);
    float _2686 = float(uint(_2668));
    int _2688 = _2672 * _2650;
    int _2690 = _2688 + _2524;
    if (_2308)
    {
        _2662 = 1.0;
    }
    float _2692 = _2662;
    float _2694 = _2692;
    if (!_2308)
    {
        _936 = _870;
    }
    float _2696 = _936;
    float _2698 = as_type<float>(_2592) * _2686;
    float _2700 = float(_2330);
    float _2702 = in.m_75.y;
    if (!_2308)
    {
        _2694 = 5.839270114898681640625;
    }
    float _2704 = _2694;
    float _2706 = trunc(_2698);
    float _2708 = precise::max(_2706, 0.0);
    uint _2710 = uint(_2708);
    bool _2712 = uint(_2690) >= uint(_1034);
    float _2714 = _2696 * _2704;
    int _2716 = int(_2568) + int(_2684);
    float _2718 = float(_2346);
    bool _2720 = !_2712;
    int _2722 = _2720 ? 0 : (-1);
    int _2724 = _2394 * _2716;
    int _2726 = _2724 + _2346;
    bool _2728 = _2718 >= _2700;
    bool _2730 = isnan(_2718);
    bool _2732 = _2728 || _2730;
    bool _2734 = isnan(_2700);
    bool _2736 = _2732 || _2734;
    float _2738 = float(_2736);
    float _2740 = floor(_2714);
    bool _2742 = _2428 > 0.5;
    float _2744 = -_2658;
    float _2746 = _2648 + _2744;
    bool _2748 = uint(_2726) >= uint(_2330);
    int _2750 = ~_2502;
    int _2752 = _2750 + 1;
    float _2754 = _2700 * _2746;
    bool _2756 = !_2748;
    int _2758 = _2756 ? 0 : (-1);
    float _2760 = trunc(_2738);
    int _2762 = int(_2760);
    int _2764 = int(_2622) + int(_2710);
    float _2766 = -_2702;
    float _2768 = _2766 + 1.0;
    int _2770 = ~_2716;
    int _2772 = _2770 + _2758;
    int _2774 = _2772 + 1;
    float _2776 = _2700 * _1148;
    int _2778 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2780 = _2778 != 0;
    int _2782 = _2330 * _2774;
    int _2784 = _2782 + _2346;
    int _2786 = _2660 ? as_type<int>(_2768) : as_type<int>(_2702);
    int _2788 = _2752 * _2764;
    int _2790 = _2788 + _2478;
    bool _2792 = _2330 == 0;
    float _2794 = trunc(_2776);
    int _2796 = int(_2794);
    float _2798 = _2780 ? as_type<float>(_2786) : _2702;
    float _2800 = -_2740;
    float _2802 = _2714 + _2800;
    int _2804 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2806 = _2804 != 0;
    int _2808 = ~_2762;
    int _2810 = _2808 + 1;
    int _2812 = _2810 + 1;
    bool _2814 = !_2792;
    int _2816 = _2814 ? _2784 : (-1);
    int _2818 = _2742 ? as_type<int>(_2768) : as_type<int>(_2702);
    bool _2820 = !_2806;
    int _2822 = _2820 ? 0 : 1;
    bool _2824 = uint(_2790) >= uint(_2502);
    int _2826 = _2812 * _2816;
    int _2828 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _2830 = _2828 != 0;
    float _2832 = trunc(_2754);
    int _2834 = int(_2832);
    int _2836 = _2330 + (-1);
    bool _2838 = !_2824;
    int _2840 = _2838 ? 0 : (-1);
    bool _2842 = !_2830;
    int _2844 = _2842 ? 0 : 1;
    int _2846 = _2762 * _2836;
    int _2848 = _2846 + _2826;
    int _2850 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _2852 = _2850 != 0;
    int _2854 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _2856 = _2854 != 0;
    float _2858 = float(_2502);
    float _2860 = float(_2478);
    int _2862 = abs(_1927);
    int _2864 = abs(_2822);
    int _2866 = abs(_1943);
    int _2868 = _2848 * _2862;
    bool _2870 = _2860 >= _2858;
    bool _2872 = isnan(_2860);
    bool _2874 = _2870 || _2872;
    bool _2876 = isnan(_2858);
    bool _2878 = _2874 || _2876;
    float _2880 = float(_2878);
    int _2882 = _2834 * _2864;
    int _2884 = _2882 + _2346;
    float _2886 = _2858 * _2802;
    int _2888 = abs(_1951);
    float _2890 = _2858 * _1148;
    float _2892 = trunc(_2880);
    int _2894 = int(_2892);
    int _2896 = _2796 * _2866;
    int _2898 = _2896 + _2868;
    int _2900 = ~_2764;
    int _2902 = _2900 + _2840;
    int _2904 = _2902 + 1;
    int _2906 = _2884 * _2316;
    int _2908 = _2906 + _2898;
    bool _2910 = !_2852;
    int _2912 = _2910 ? 0 : 1;
    int _2914 = _2502 * _2904;
    int _2916 = _2914 + _2478;
    bool _2918 = _2502 == 0;
    int _2920 = _2834 * _2888;
    int _2922 = _2920 + _2908;
    float _2924 = trunc(_2886);
    int _2926 = int(_2924);
    int _2928 = abs(_2844);
    bool _2930 = !_2918;
    int _2932 = _2930 ? _2916 : (-1);
    float _2934 = float(uint(_2922));
    int _2936 = ~_2894;
    int _2938 = _2936 + 1;
    int _2940 = _2938 + 1;
    float _2942 = trunc(_2890);
    int _2944 = int(_2942);
    int _2946 = _2502 + (-1);
    int _2948 = ~_2650;
    int _2950 = _2948 + _2722;
    int _2952 = _2950 + 1;
    int _2954 = _2940 * _2932;
    int _2956 = abs(_1182);
    float _2958 = as_type<float>(_2558) * _2934;
    int _2960 = _2894 * _2946;
    int _2962 = _2960 + _2954;
    int _2964 = abs(_1188);
    int _2966 = _2926 * _2928;
    int _2968 = _2966 + _2478;
    int _2970 = _1034 * _2952;
    int _2972 = _2970 + _2524;
    float _2974 = trunc(_2958);
    float _2976 = precise::max(_2974, 0.0);
    uint _2978 = uint(_2976);
    int _2980 = abs(_2912);
    int _2982 = _2962 * _2956;
    float _2984 = float(uint(_2490));
    bool _2986 = !_2856;
    int _2988 = _2986 ? 0 : 1;
    int _2990 = _2944 * _2964;
    int _2992 = _2990 + _2982;
    int _2994 = ~_2330;
    int _2996 = _2994 + 1;
    float _2998 = as_type<float>(_2326) * _2984;
    int _3000 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _3002 = _3000 != 0;
    int _3004 = _2968 * _2980;
    int _3006 = _3004 + _2992;
    int _3008 = abs(_2988);
    float _3010 = _3002 ? as_type<float>(_2818) : _2702;
    float _3012 = trunc(_2998);
    float _3014 = precise::max(_3012, 0.0);
    uint _3016 = uint(_3014);
    int _3018 = _2996 * int(_2978);
    int _3020 = _3018 + _2922;
    int _3022 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _3024 = _3022 != 0;
    float _3026 = float(uint(_3020));
    int _3028 = _2926 * _3008;
    int _3030 = _3028 + _3006;
    int _3032 = ~_1034;
    int _3034 = _3032 + 1;
    bool _3036 = !_2414;
    int _3038 = _3036 ? _2972 : (-1);
    float _3040 = as_type<float>(_2558) * _3026;
    float _3042 = float(uint(_3030));
    float _3044 = trunc(_3040);
    float _3046 = precise::max(_3044, 0.0);
    uint _3048 = uint(_3046);
    int _3050 = ~_2502;
    int _3052 = _3050 + 1;
    int _3054 = _3034 * int(_3016);
    int _3056 = _3054 + _2490;
    float _3058 = _2702;
    float _3060 = as_type<float>(_2862);
    if (_3024)
    {
        float _3062 = _2594 ? _2768 : _2702;
        _3058 = _3062;
    }
    float _3064 = _3058;
    float _3066 = as_type<float>(_2592) * _3042;
    int _3068 = _3038 & 3;
    bool _3070 = _3068 != 0;
    int _3072 = _3038 & 3;
    bool _3074 = _3072 != 0;
    float _3076 = trunc(_3066);
    float _3078 = precise::max(_3076, 0.0);
    uint _3080 = uint(_3078);
    float _3082 = float(uint(_3056));
    int _3084 = _3070 ? 0 : 1;
    bool _3086 = uint(_3072) > 1u;
    float _3088 = as_type<float>(_2326) * _3082;
    float _3090 = float(uint(_2884));
    int _3092 = ~_3084;
    int _3094 = _3092 + 1;
    int _3096 = _3094 + 1;
    int _3098 = int(_2978) + int(_3048);
    float _3100 = trunc(_3088);
    float _3102 = precise::max(_3100, 0.0);
    uint _3104 = uint(_3102);
    float _3106 = as_type<float>(_2558) * _3090;
    int _3108 = ~_2330;
    int _3110 = _3108 + 1;
    int _3112 = _3052 * int(_3080);
    int _3114 = _3112 + _3030;
    int _3116 = ~_2330;
    int _3118 = _3116 + 1;
    int _3120 = _3096;
    float _3122 = as_type<float>(_3098);
    if (!_3086)
    {
        int _3124 = ~_3084;
        int _3126 = _3124 + 1;
        _3120 = _3126;
    }
    int _3128 = _3120;
    float _3130 = trunc(_3106);
    float _3132 = precise::max(_3130, 0.0);
    uint _3134 = uint(_3132);
    bool _3136 = uint(_3072) >= 2u;
    float _3138 = float(uint(_3114));
    int _3140 = _3136 ? 0 : 1;
    bool _3142 = _3072 != 3;
    float _3144 = as_type<float>(_2592) * _3138;
    int _3146 = int(_3016) + int(_3104);
    int _3148 = _3118 * _3098;
    int _3150 = _3148 + _2922;
    float _3152 = trunc(_3144);
    float _3154 = precise::max(_3152, 0.0);
    uint _3156 = uint(_3154);
    int _3158 = ~_3140;
    int _3160 = _3158 + 1;
    int _3162 = _3160 + 1;
    int _3164 = ~_1034;
    int _3166 = _3164 + 1;
    int _3168 = _3110 * int(_3134);
    int _3170 = _3168 + _2884;
    int _3172 = _3162;
    if (_3142)
    {
        int _3174 = ~_3140;
        int _3176 = _3174 + 1;
        _3172 = _3176;
    }
    int _3178 = _3172;
    bool _3180 = uint(_3150) >= uint(_2330);
    int _3182 = _3166 * _3146;
    int _3184 = _3182 + _2490;
    float _3186 = float(uint(_3170));
    bool _3188 = !_3180;
    int _3190 = _3188 ? 0 : (-1);
    bool _3192 = uint(_3184) >= uint(_1034);
    float _3194 = as_type<float>(_2558) * _3186;
    int _3196 = ~_3098;
    int _3198 = _3196 + _3190;
    int _3200 = _3198 + 1;
    int _3202 = int(_3080) + int(_3156);
    if (_1611)
    {
        _3122 = 1.0;
    }
    float _3204 = _3122;
    int _3206 = _2330 * _3200;
    int _3208 = _3206 + _2922;
    float _3210 = _3204;
    if (!_1611)
    {
        int _3212 = _1675 << 4;
        int _3214 = _3212 + 2048;
        uint _3216 = uint(int(uint(_3214) >> uint(2)));
        uint _3218 = uint(int(uint(int(_3216)) >> uint(2)));
        int _3220 = int(_3216) & 3;
        float _3222 = (*spvDescriptorSet0.vp_c15)._m0[int(_3218)][_3220];
        int _3224 = int(_3216) + 1;
        uint _3226 = uint(int(uint(_3224) >> uint(2)));
        int _3228 = _3224 & 3;
        float _3230 = (*spvDescriptorSet0.vp_c15)._m0[int(_3226)][_3228];
        int _3232 = _3214 + 8;
        uint _3234 = uint(int(uint(_3232) >> uint(2)));
        uint _3236 = uint(int(uint(int(_3234)) >> uint(2)));
        int _3238 = int(_3234) & 3;
        float _3240 = (*spvDescriptorSet0.vp_c15)._m0[int(_3236)][_3238];
        int _3242 = int(_3234) + 1;
        uint _3244 = uint(int(uint(_3242) >> uint(2)));
        int _3246 = _3242 & 3;
        float _3248 = (*spvDescriptorSet0.vp_c15)._m0[int(_3244)][_3246];
        float _3250 = _1288 * _3230;
        float _3252 = fma(_832, _3222, _3250);
        float _3254 = fma(_834, _3240, _3252);
        float _3256 = _3254 + _3248;
        float _3258 = precise::clamp(_3256, 0.0, 1.0);
        float _3260 = -_3258;
        float _3262 = _3260 + _2298;
        float _3264 = fma(_3262, 500.0, 1.5);
        float _3266 = exp2(_3264);
        float _3268 = 0.0 + _3266;
        float _3270 = precise::clamp(_3268, 0.0, 1.0);
        _1390 = _3250;
        _1677 = as_type<float>(_3214);
        _3210 = _3270;
    }
    float _3272 = _1390;
    float _3274 = _1677;
    float _3276 = _3210;
    float _3278 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3280 = _2079 + _3278;
    float _3282 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3284 = _2081 + _3282;
    float _3286 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3288 = _2083 + _3286;
    bool _3290 = !_2792;
    int _3292 = _3290 ? _3208 : (-1);
    float _3294 = _3280 * _3280;
    bool _3296 = !_3192;
    int _3298 = _3296 ? 0 : (-1);
    float _3300 = fma(_3284, _3284, _3294);
    float _3302 = fma(_3288, _3288, _3300);
    float _3304 = rsqrt(_3302);
    float _3306 = sqrt(_3302);
    float _3308 = _3304 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3310 = _3284 * _3308;
    float _3312 = _3288 * _3308;
    float _3314 = _3310 * _3310;
    float _3316 = _3312 * _3312;
    float _3318 = _3314 + _3316;
    float _3320 = sqrt(_3318);
    bool _3322 = _3320 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3324 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3326 = _3320 + _3324;
    float _3328 = _3304;
    float _3330 = _3272;
    float _3332 = _3326;
    float _3334 = _3280;
    float _3336 = _3274;
    if (_3322)
    {
        float _3338 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3328 = _3338;
    }
    float _3340 = _3328;
    if (_3322)
    {
        float _3342 = rsqrt(_3318);
        _3330 = _3342;
    }
    float _3344 = _3330;
    float _3346 = _3344;
    if (_3322)
    {
        float _3348 = _3326 * _3340;
        _3332 = _3348;
    }
    float _3350 = _3332;
    bool _3352 = !_3074;
    int _3354 = _3352 ? 0 : 1;
    if (_3322)
    {
        float _3356 = _3350 * 0.15915493667125701904296875;
        _938 = _3356;
    }
    float _3358 = _938;
    float _3360 = _3288;
    if (_3322)
    {
        float _3362 = _3358 * 6.283185482025146484375;
        float _3364 = sin(_3362);
        _3360 = _3364;
    }
    float _3366 = _3360;
    float _3368 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3370 = precise::max(0.0, _3368);
    float _3372 = _3340;
    float _3374 = _3370;
    if (_3322)
    {
        float _3376 = _3358 * 6.283185482025146484375;
        float _3378 = cos(_3376);
        _3372 = _3378;
    }
    float _3380 = _3372;
    float _3382 = -_3308;
    float _3384 = -_3370;
    float _3386 = fma(_3280, _3382, _3384);
    if (_3322)
    {
        float _3388 = _3386 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3334 = _3388;
    }
    float _3390 = _3334;
    float _3392 = _3390;
    float _3394 = _3366;
    if (_3322)
    {
        float _3396 = fma(_3366, _3390, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3392 = _3396;
    }
    float _3398 = _3392;
    float _3400 = _3398;
    if (!_3322)
    {
        _3394 = _3310;
    }
    float _3402 = _3394;
    float _3404 = _3402;
    float _3406 = _3380;
    if (_3322)
    {
        float _3408 = _3380 + (-1.0);
        _3374 = _3408;
    }
    float _3410 = _3374;
    float _3412 = _3410;
    if (_3322)
    {
        float _3414 = _3344 * _3398;
        _3060 = _3414;
    }
    float _3416 = _3060;
    if (!_3322)
    {
        _3400 = _3386;
    }
    float _3418 = _3400;
    float _3420 = _3418;
    if (_3322)
    {
        float _3422 = _3410 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3336 = _3422;
    }
    float _3424 = _3336;
    if (_3322)
    {
        float _3426 = _3310 * _3416;
        _3404 = _3426;
    }
    float _3428 = _3404;
    if (!_3322)
    {
        _3412 = _3312;
    }
    float _3430 = _3412;
    float _3432 = _3430;
    if (_3322)
    {
        float _3434 = _3312 * _3416;
        _3432 = _3434;
    }
    float _3436 = _3432;
    if (!_3322)
    {
        _3346 = _3314;
    }
    float _3438 = _3346;
    float _3440 = _3438;
    if (_3322)
    {
        float _3442 = fma(_3386, _3380, _3424);
        _3420 = _3442;
    }
    float _3444 = _3420;
    if (_3322)
    {
        float _3446 = _3428 * _3428;
        _3440 = _3446;
    }
    float _3448 = _3440;
    if (!_3322)
    {
        _3406 = _3316;
    }
    float _3450 = _3406;
    float _3452 = _3450;
    if (_3322)
    {
        float _3454 = _3436 * _3436;
        _3452 = _3454;
    }
    float _3456 = _3452;
    float _3458 = fma(_3444, _3444, _3448);
    int _3460 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _3462 = _3460 != 0;
    float _3464 = _3458 + _3456;
    float _3466 = rsqrt(_3464);
    float _3468 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3470 = fma(_3306, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3468);
    float _3472 = precise::clamp(_3470, 0.0, 1.0);
    float _3474 = -_3472;
    float _3476 = _3474 + 1.0;
    float _3478 = abs(_3476);
    float _3480 = log2(_3478);
    float _3482 = _3466 * _3428;
    float _3484 = _3466 * _3444;
    float _3486 = _3466 * _3436;
    float _3488 = _3482 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3490 = -_3488;
    float _3492 = fma(_3484, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3490);
    float _3494 = _3480 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3496 = -_3486;
    float _3498 = fma(_3496, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3492);
    float _3500 = exp2(_3494);
    float _3502 = fma(_3498, -0.5, 0.5);
    float _3504 = fma(_3498, 0.5, 0.5);
    float _3506 = fma(_3504, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3508 = sqrt(_3502);
    float _3510 = fma(_3504, _3506, -0.212114393711090087890625);
    float _3512 = fma(_3504, _3510, 1.570728778839111328125);
    float _3514 = _3484 + 1.0;
    float _3516 = -_3484;
    float _3518 = fma(_3500, _3514, _3516);
    int _3520 = _3292 & 3;
    bool _3522 = _3520 != 0;
    float _3524 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _3526 = _3524 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _3528 = !_3462;
    int _3530 = _3528 ? 0 : 1;
    float _3532 = fma(_3518, 0.5, 0.5);
    float _3534 = _3508 * 0.636619746685028076171875;
    int _3536 = ~_2502;
    int _3538 = _3536 + 1;
    bool _3540 = _3520 != 3;
    float _3542 = -_3512;
    float _3544 = fma(_3534, _3542, 1.0);
    bool _3546 = uint(_3520) >= 2u;
    int _3548 = _3538 * _3202;
    int _3550 = _3548 + _3030;
    float _3552 = 1.0 / _3526;
    int _3554 = _3546 ? 0 : 1;
    float2 _10978 = float2(_3544, _3532);
    float3 _3558 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_10978, float2(0.0), isnan(_10978)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_10978, float2(0.0), isnan(_10978)), level(0.0)).xyz;
    float _3560 = _3558.x;
    float _3562 = _3558.y;
    float _3564 = _3558.z;
    bool _3566 = uint(_3550) >= uint(_2502);
    float _3568 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _3570 = _3568 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    int _3572 = _3522 ? 0 : 1;
    float _3574 = trunc(_3194);
    float _3576 = precise::max(_3574, 0.0);
    uint _3578 = uint(_3576);
    bool _3580 = _3072 != 3;
    float _3582 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _3584 = _812 + _3582;
    int _3586 = ~_3554;
    int _3588 = _3586 + 1;
    int _3590 = _3588 + 1;
    float _3592 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _3594 = _812 + _3592;
    int _3596 = _3590;
    if (_3540)
    {
        int _3598 = ~_3554;
        int _3600 = _3598 + 1;
        _3596 = _3600;
    }
    int _3602 = _3596;
    float _3604 = _3480 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _3606 = !_3580;
    int _3608 = _3606 ? 0 : (-1);
    float _3610 = 1.0 / _3570;
    bool _3612 = _3520 != 3;
    float _3614 = -_852;
    float _3616 = _3614 + 1.0;
    bool _3618 = uint(_3520) > 1u;
    out.m_77.x = _2081;
    out.m_77.y = _2079;
    out.m_77.z = _2083;
    bool _3620 = !_3612;
    int _3622 = _3620 ? 0 : (-1);
    bool _3624 = !_3566;
    int _3626 = _3624 ? 0 : (-1);
    float _3628 = exp2(_3604);
    int _3630 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _3632 = _3630 != 0;
    int _3634 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _3636 = _3634 != 0;
    float _3638 = float(uint(_2968));
    int _3640 = int(_3134) + int(_3578);
    int _3642 = ~_2330;
    int _3644 = _3642 + 1;
    float _3646 = as_type<float>(_2592) * _3638;
    int _3648 = ~_3202;
    int _3650 = _3648 + _3626;
    int _3652 = _3650 + 1;
    int _3654 = ~_3572;
    int _3656 = _3654 + 1;
    int _3658 = _3656 + 1;
    int _3660 = _3644 * _3640;
    int _3662 = _3660 + _2884;
    int _3664 = _3658;
    if (!_3618)
    {
        int _3666 = ~_3572;
        int _3668 = _3666 + 1;
        _3664 = _3668;
    }
    int _3670 = _3664;
    int _3672 = _2502 * _3652;
    int _3674 = _3672 + _3030;
    int _3676 = _3292 & 3;
    bool _3678 = _3676 != 0;
    float _3680 = trunc(_3646);
    float _3682 = precise::max(_3680, 0.0);
    uint _3684 = uint(_3682);
    float _3686 = -_3628;
    float _3688 = _3686 + 1.0;
    bool _3690 = !_3678;
    int _3692 = _3690 ? 0 : 1;
    bool _3694 = uint(_3662) >= uint(_2330);
    float _3696 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _3698 = _3696 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _3700 = !_2918;
    int _3702 = _3700 ? _3674 : (-1);
    float _3704 = _3688 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _3706 = !_3694;
    int _3708 = _3706 ? 0 : (-1);
    int _3710 = _3702 & 3;
    bool _3712 = _3710 != 0;
    float _3714 = 1.0 / _3698;
    int _3716 = ~_2502;
    int _3718 = _3716 + 1;
    float _3720 = _3704 * _2279;
    int _3722 = _3712 ? 0 : 1;
    bool _3724 = uint(_3710) >= 2u;
    int _3726 = _3718 * int(_3684);
    int _3728 = _3726 + _2968;
    int _3730 = _3724 ? 0 : 1;
    float _3732 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _3734 = _3732 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _3736 = _3710 != 3;
    float _3738 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _3740 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _3738;
    float _3742 = _3740 * _3552;
    float _3744 = float(uint(_3728));
    float _3746 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _3748 = _3746 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _3750 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _3752 = _3750 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _3754 = 1.0 / _3734;
    float _3756 = as_type<float>(_2592) * _3744;
    float _3758 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _3760 = _3758 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _3762 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _3764 = _812 + _3762;
    float _3766 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _3768 = _3766 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    bool _3770 = _812 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _3772 = isnan(_812);
    bool _3774 = _3770 || _3772;
    bool _3776 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _3778 = _3774 || _3776;
    float _3780 = float(_3778);
    float _3782 = 1.0 / _3748;
    float _3784 = _3768 * _3714;
    bool _3786 = _812 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _3788 = isnan(_812);
    bool _3790 = _3786 || _3788;
    bool _3792 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _3794 = _3790 || _3792;
    float _3796 = float(_3794);
    float _3798 = -_3780;
    float _3800 = _3798 + 1.0;
    int _3802 = ~_3146;
    int _3804 = _3802 + _3298;
    int _3806 = _3804 + 1;
    float _3808 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _3810 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _3808;
    float _3812 = fma(_3784, _3584, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _3814 = trunc(_3756);
    float _3816 = precise::max(_3814, 0.0);
    uint _3818 = uint(_3816);
    float _3820 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _3822 = _3820 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    int _3824 = ~_3730;
    int _3826 = _3824 + 1;
    int _3828 = _3826 + 1;
    float _3830 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _3832 = _812 + _3830;
    int _3834 = _3828;
    if (_3736)
    {
        int _3836 = ~_3730;
        int _3838 = _3836 + 1;
        _3834 = _3838;
    }
    int _3840 = _3834;
    float _3842 = _3822 * _3610;
    bool _3844 = _3710 != 3;
    float _3846 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _3848 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _3846;
    float _3850 = 1.0 / _3760;
    float _3852 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _3854 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _3852;
    bool _3856 = !_3844;
    int _3858 = _3856 ? 0 : (-1);
    float _3860 = _3848 * _3754;
    bool _3862 = uint(_3710) > 1u;
    float _3864 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _3866 = _812 + _3864;
    float _3868 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _3870 = _3868 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _3872 = _3854 * _3782;
    int _3874 = int(_3684) + int(_3818);
    float _3876 = fma(_3742, _3866, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _3878 = _812 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _3880 = isnan(_812);
    bool _3882 = _3878 || _3880;
    bool _3884 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _3886 = _3882 || _3884;
    float _3888 = float(_3886);
    float _3890 = 1.0 / _3752;
    int _3892 = ~_3722;
    int _3894 = _3892 + 1;
    int _3896 = _3894 + 1;
    float _3898 = fma(_3842, _3764, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    int _3900 = ~_2502;
    int _3902 = _3900 + 1;
    float _3904 = _3888 * _3800;
    float _3906 = _3870 * _3850;
    int _3908 = _3896;
    float _3910 = _3906;
    float _3912 = _3872;
    float _3914 = _3898;
    if (!_3862)
    {
        int _3916 = ~_3722;
        int _3918 = _3916 + 1;
        _3908 = _3918;
    }
    int _3920 = _3908;
    float _3922 = -_3888;
    float _3924 = _3922 + 1.0;
    bool _3926 = _812 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _3928 = isnan(_812);
    bool _3930 = _3926 || _3928;
    bool _3932 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _3934 = _3930 || _3932;
    float _3936 = float(_3934);
    int _3938 = _3902 * _3874;
    int _3940 = _3938 + _2968;
    bool _3942 = _812 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _3944 = isnan(_812);
    bool _3946 = _3942 || _3944;
    bool _3948 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _3950 = _3946 || _3948;
    float _3952 = float(_3950);
    int _3954 = _1034 * _3806;
    int _3956 = _3954 + _2490;
    bool _3958 = _812 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _3960 = isnan(_812);
    bool _3962 = _3958 || _3960;
    bool _3964 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _3966 = _3962 || _3964;
    float _3968 = float(_3966);
    float _3970 = -_3936;
    float _3972 = _3970 + 1.0;
    float _3974 = _3936 * _3924;
    bool _3976 = _812 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _3978 = isnan(_812);
    bool _3980 = _3976 || _3978;
    bool _3982 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _3984 = _3980 || _3982;
    float _3986 = float(_3984);
    float _3988 = -_3952;
    float _3990 = _3988 + 1.0;
    float _3992 = _3952 * _3972;
    int _3994 = _3702 & 3;
    bool _3996 = _3994 != 0;
    float _3998 = -_3968;
    float _4000 = _3998 + 1.0;
    bool _4002 = _812 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _4004 = isnan(_812);
    bool _4006 = _4002 || _4004;
    bool _4008 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _4010 = _4006 || _4008;
    float _4012 = float(_4010);
    float _4014 = _3986 * _3990;
    float _4016 = -_3986;
    float _4018 = _4016 + 1.0;
    float _4020 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _4022 = _812 + _4020;
    bool _4024 = !_3996;
    int _4026 = _4024 ? 0 : 1;
    float _4028 = -_4012;
    float _4030 = _4028 + 1.0;
    bool _4032 = uint(_3940) >= uint(_2502);
    float _4034 = _3810 * _3890;
    float _4036 = _3968 * _4018;
    float _4038 = in.m_79.x;
    float _4040 = in.m_79.y;
    float _4042 = in.m_79.z;
    float _4044 = fma(_3860, _4022, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _4046 = _4012 * _4000;
    bool _4048 = !_4032;
    int _4050 = _4048 ? 0 : (-1);
    float _4052 = in.m_81.x;
    float _4054 = in.m_81.y;
    float _4056 = in.m_81.z;
    float _4058 = in.m_81.w;
    float _4060 = _3796 * _4030;
    bool _4062 = _1430 != 0.0;
    bool _4064 = isnan(_1430);
    bool _4066 = _4062 || _4064;
    bool _4068 = isnan(0.0);
    bool _4070 = _4066 || _4068;
    float _4072 = -_3796;
    float _4074 = _4072 + 1.0;
    float _4076 = fma(_3872, _3594, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _4078 = _3876 * _4060;
    bool _4080 = _1428 == 0.0;
    bool _4082 = !_4070;
    bool _4084 = _4080 && _4082;
    float _4086 = fma(_3906, _3832, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    int _4088 = ~_3874;
    int _4090 = _4088 + _4050;
    int _4092 = _4090 + 1;
    float _4094 = fma(_4074, (*spvDescriptorSet0.vp_c9)._m0[159].x, _4078);
    bool _4096 = _1432 == 0.0;
    bool _4098 = _4096 && _4084;
    float _4100 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _4102 = _812 + _4100;
    int _4104 = ~_3640;
    int _4106 = _4104 + _3708;
    int _4108 = _4106 + 1;
    float _4110 = abs(_1498);
    float _4112 = log2(_4110);
    float _4114 = fma(_3898, _4046, _4094);
    float _4116 = fma(_4034, _4102, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    int _4118 = _2502 * _4092;
    int _4120 = _4118 + _2968;
    int _4122 = abs(_3692);
    float _4124 = fma(_4044, _4036, _4114);
    int _4126 = _2330 * _4108;
    int _4128 = _4126 + _2884;
    int _4130 = abs(_3128);
    float _4132 = fma(_3812, _4014, _4124);
    if (_4098)
    {
        _3910 = _4040;
    }
    float _4134 = _3910;
    float _4136 = _4134;
    if (!_4098)
    {
        float _4138 = fma(_1430, (*spvDescriptorSet0.vp_c9)._m0[17].y, _4040);
        _4136 = _4138;
    }
    float _4140 = _4136;
    float _4142 = _4054 * _4042;
    if (_4098)
    {
        _3912 = _4038;
    }
    float _4144 = _3912;
    float _4146 = _4144;
    if (!_4098)
    {
        float _4148 = fma(_1428, (*spvDescriptorSet0.vp_c9)._m0[17].y, _4038);
        _4146 = _4148;
    }
    float _4150 = _4146;
    if (_4098)
    {
        _3914 = _4042;
    }
    float _4152 = _3914;
    float _4154 = _4056 * _4038;
    float _4156 = _4112 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _4158 = _4152;
    if (!_4098)
    {
        float _4160 = fma(_1432, (*spvDescriptorSet0.vp_c9)._m0[17].y, _4042);
        _4158 = _4160;
    }
    float _4162 = _4158;
    float _4164 = _4052 * _4040;
    float _4166 = fma(_4076, _3992, _4132);
    float _4168 = -_4142;
    float _4170 = fma(_4056, _4040, _4168);
    float _4172 = -_4154;
    float _4174 = fma(_4052, _4042, _4172);
    float _4176 = -_4164;
    float _4178 = fma(_4054, _4038, _4176);
    float _4180 = fma(_4086, _3974, _4166);
    float _4182 = _4170 * _4058;
    float _4184 = exp2(_4156);
    int _4186 = _3702 >> 31;
    float _4188 = _4174 * _4058;
    float _4190 = _4178 * _4058;
    int _4192 = _3038 >> 31;
    float _4194 = fma(_4116, _3904, _4180);
    int _4196 = _4186 & 3;
    float _4198 = _1747 * _1641;
    int _4200 = _4192 & 3;
    float _4202 = fma(_3780, (*spvDescriptorSet0.vp_c9)._m0[166].x, _4194);
    int _4204 = _3702 + _4196;
    float _4206 = _1747 * _1887;
    float _4208 = _1719 * _1887;
    int _4210 = _3038 + _4200;
    float _4212 = _1719 * _1641;
    int _4214 = _4204 >> 2;
    float _4216 = fma(_4184, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4218 = precise::clamp(_4216, 0.0, 1.0);
    float _4220 = _1755 * _1645;
    int _4222 = _3292 >> 31;
    float _4224 = _4218 * _4218;
    int _4226 = _4214 << 4;
    int _4228 = _4226 + 656;
    float _4230 = fma(_4218, -2.0, 3.0);
    int _4232 = _4210 >> 2;
    float _4234 = fma(_1723, _1605, _4206);
    int _4236 = _4222 & 3;
    uint _4238 = uint(int(uint(_4228) >> uint(2)));
    uint _4240 = uint(int(uint(int(_4238)) >> uint(2)));
    int _4242 = int(_4238) & 3;
    float _4244 = (*spvDescriptorSet0.vp_c9)._m0[int(_4240)][_4242];
    int _4246 = int(_4238) + 1;
    uint _4248 = uint(int(uint(_4246) >> uint(2)));
    int _4250 = _4246 & 3;
    float _4252 = (*spvDescriptorSet0.vp_c9)._m0[int(_4248)][_4250];
    int _4254 = _4232 << 4;
    int _4256 = _4254 + 368;
    float _4258 = _4224 * _4230;
    int _4260 = _3292 + _4236;
    float _4262 = _1747 * _1645;
    float _4264 = _1719 * _1645;
    float _4266 = _1755 * _1887;
    int _4268 = _4260 >> 2;
    uint _4270 = uint(int(uint(_4256) >> uint(2)));
    uint _4272 = uint(int(uint(int(_4270)) >> uint(2)));
    int _4274 = int(_4270) & 3;
    float _4276 = (*spvDescriptorSet0.vp_c9)._m0[int(_4272)][_4274];
    int _4278 = int(_4270) + 1;
    uint _4280 = uint(int(uint(_4278) >> uint(2)));
    int _4282 = _4278 & 3;
    float _4284 = (*spvDescriptorSet0.vp_c9)._m0[int(_4280)][_4282];
    float _4286 = _1755 * _1641;
    float _4288 = fma(_1723, _1603, _4262);
    int _4290 = _4268 << 4;
    int _4292 = _4290 + 512;
    float _4294 = fma(_1723, _1607, _4198);
    float _4296 = -_1707;
    float _4298 = fma(_4296, _1603, _4264);
    float _4300 = -_1707;
    float _4302 = fma(_4300, _1605, _4208);
    float _4304 = -_1707;
    float _4306 = fma(_4304, _1607, _4212);
    int _4308 = _4256 + 8;
    uint _4310 = uint(int(uint(_4308) >> uint(2)));
    uint _4312 = uint(int(uint(int(_4310)) >> uint(2)));
    int _4314 = int(_4310) & 3;
    float _4316 = (*spvDescriptorSet0.vp_c9)._m0[int(_4312)][_4314];
    int _4318 = int(_4310) + 1;
    uint _4320 = uint(int(uint(_4318) >> uint(2)));
    int _4322 = _4318 & 3;
    float _4324 = (*spvDescriptorSet0.vp_c9)._m0[int(_4320)][_4322];
    float _4326 = fma(_1725, _1603, _4220);
    float _4328 = fma(_1725, _1605, _4266);
    float _4330 = fma(_1725, _1607, _4286);
    int _4332 = abs(_3670);
    float _4334 = fma(_1721, _1446, _4298);
    int _4336 = abs(_3920);
    float _4338 = fma(_1721, _1466, _4302);
    uint _4340 = uint(int(uint(_4292) >> uint(2)));
    uint _4342 = uint(int(uint(int(_4340)) >> uint(2)));
    int _4344 = int(_4340) & 3;
    float _4346 = (*spvDescriptorSet0.vp_c9)._m0[int(_4342)][_4344];
    int _4348 = int(_4340) + 1;
    uint _4350 = uint(int(uint(_4348) >> uint(2)));
    int _4352 = _4348 & 3;
    float _4354 = (*spvDescriptorSet0.vp_c9)._m0[int(_4350)][_4352];
    int _4356 = ~_4130;
    int _4358 = _4356 + 1;
    int _4360 = _4358 + 1;
    float _4362 = fma(_1721, _1454, _4306);
    int _4364 = ~_4336;
    int _4366 = _4364 + 1;
    int _4368 = _4366 + 1;
    float _4370 = fma(_1751, _1466, _4234);
    int _4372 = abs(_3178);
    float _4374 = fma(_1757, _1466, _4328);
    int _4376 = ~_4332;
    int _4378 = _4376 + 1;
    int _4380 = _4378 + 1;
    int _4382 = _4292 + 8;
    uint _4384 = uint(int(uint(_4382) >> uint(2)));
    uint _4386 = uint(int(uint(int(_4384)) >> uint(2)));
    int _4388 = int(_4384) & 3;
    float _4390 = (*spvDescriptorSet0.vp_c9)._m0[int(_4386)][_4388];
    int _4392 = int(_4384) + 1;
    uint _4394 = uint(int(uint(_4392) >> uint(2)));
    int _4396 = _4392 & 3;
    float _4398 = (*spvDescriptorSet0.vp_c9)._m0[int(_4394)][_4396];
    int _4400 = ~_4372;
    int _4402 = _4400 + 1;
    int _4404 = _4402 + 1;
    float _4406 = fma(_1751, _1446, _4288);
    float _4408 = fma(_1751, _1454, _4294);
    int _4410 = abs(_3840);
    float _4412 = fma(_1757, _1454, _4330);
    int _4414 = ~_4122;
    int _4416 = _4414 + 1;
    int _4418 = _4416 + 1;
    int _4420 = _4228 + 8;
    uint _4422 = uint(int(uint(_4420) >> uint(2)));
    uint _4424 = uint(int(uint(int(_4422)) >> uint(2)));
    int _4426 = int(_4422) & 3;
    float _4428 = (*spvDescriptorSet0.vp_c9)._m0[int(_4424)][_4426];
    int _4430 = int(_4422) + 1;
    uint _4432 = uint(int(uint(_4430) >> uint(2)));
    int _4434 = _4430 & 3;
    float _4436 = (*spvDescriptorSet0.vp_c9)._m0[int(_4432)][_4434];
    int _4438 = ~_4410;
    int _4440 = _4438 + 1;
    int _4442 = _4440 + 1;
    float _4444 = fma(_1757, _1446, _4326);
    bool _4446 = !_2792;
    int _4448 = _4446 ? _4128 : (-1);
    out.m_83.x = _4202;
    bool _4450 = !_2918;
    int _4452 = _4450 ? _4120 : (-1);
    int _4454 = _4368 * as_type<int>(_4252);
    int _4456 = abs(_3354);
    float _4458 = _4338 * _4054;
    float _4460 = _4362 * _4054;
    int _4462 = ~_4456;
    int _4464 = _4462 + 1;
    int _4466 = _4464 + 1;
    int _4468 = _4360 * as_type<int>(_4284);
    float _4470 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _4472 = int(_4470);
    int _4474 = _4466 * as_type<int>(_4276);
    int _4476 = _4474 + _4468;
    int _4478 = abs(_3602);
    float _4480 = _4188 * _4338;
    int _4482 = abs(_3530);
    int _4484 = _4404 * as_type<int>(_4316);
    int _4486 = _4484 + _4476;
    int _4488 = ~_4478;
    int _4490 = _4488 + 1;
    int _4492 = _4490 + 1;
    float _4494 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _4496 = int(_4494);
    int _4498 = _4380 * as_type<int>(_4354);
    int _4500 = abs(_4026);
    float _4502 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _4504 = int(_4502);
    float _4506 = float(uint(_4472));
    int _4508 = _4418 * as_type<int>(_4346);
    int _4510 = _4508 + _4498;
    int _4512 = ~_4500;
    int _4514 = _4512 + 1;
    int _4516 = _4514 + 1;
    int _4518 = abs(_3608);
    int _4520 = _4492 * as_type<int>(_4390);
    int _4522 = _4520 + _4510;
    int _4524 = abs(_3858);
    int _4526 = _4516 * as_type<int>(_4244);
    int _4528 = _4526 + _4454;
    int _4530 = ~_4518;
    int _4532 = _4530 + 1;
    int _4534 = _4532 + 1;
    float _4536 = 1.0 / _4506;
    int _4538 = abs(_3622);
    float _4540 = _4334 * _4054;
    int _4542 = ~_4524;
    int _4544 = _4542 + 1;
    int _4546 = _4544 + 1;
    int _4548 = _4534 * as_type<int>(_4324);
    int _4550 = _4548 + _4486;
    int _4552 = ~_4538;
    int _4554 = _4552 + 1;
    int _4556 = _4554 + 1;
    int _4558 = _4442 * as_type<int>(_4428);
    int _4560 = _4558 + _4528;
    float _4562 = float(uint(_4496));
    float _4564 = _4338 * _4140;
    int _4566 = abs(_4472);
    int _4568 = _4556 * as_type<int>(_4398);
    int _4570 = _4568 + _4522;
    float _4572 = 1.0 / _4562;
    float _4574 = float(uint(_4504));
    int _4576 = _4546 * as_type<int>(_4436);
    int _4578 = _4576 + _4560;
    bool _4580 = !_3632;
    int _4582 = _4580 ? 0 : 1;
    int _4584 = ~_4482;
    int _4586 = _4584 + 1;
    int _4588 = _4586 + 1;
    float _4590 = float(uint(_4566));
    float _4592 = 1.0 / _4574;
    bool _4594 = !_3636;
    int _4596 = _4594 ? 0 : 1;
    int _4598 = _4550 * _4588;
    int _4600 = abs(_4582);
    int _4602 = abs(_4596);
    int _4604 = ~_4600;
    int _4606 = _4604 + 1;
    int _4608 = _4606 + 1;
    float _4610 = 1.0 / _4590;
    bool _4612 = !_2414;
    int _4614 = _4612 ? _3956 : (-1);
    int _4616 = abs(_4504);
    int _4618 = _4608 * _4570;
    int _4620 = ~_4496;
    int _4622 = _4620 + 1;
    int _4624 = _4614 * _4482;
    int _4626 = _4624 + _4598;
    int _4628 = abs(_4496);
    int _4630 = ~_4602;
    int _4632 = _4630 + 1;
    int _4634 = _4632 + 1;
    float _4636 = float(uint(_4616));
    int _4638 = as_type<int>(_4536) + (-2);
    int _4640 = _4634 * _4578;
    float _4642 = float(uint(_4626));
    int _4644 = _4448 * _4600;
    int _4646 = _4644 + _4618;
    int _4648 = as_type<int>(_4592) + (-2);
    int _4650 = _4452 * _4602;
    int _4652 = _4650 + _4640;
    float _4654 = 1.0 / _4636;
    float _4656 = float(uint(_4628));
    float _4658 = _4334 * _4140;
    float _4660 = float(uint(_4646));
    float _4662 = _4362 * _4140;
    float _4664 = float(uint(_4652));
    int _4666 = abs(_4626);
    float _4668 = as_type<float>(_4648) * _4660;
    int _4670 = as_type<int>(_4572) + (-2);
    float _4672 = as_type<float>(_4638) * _4642;
    float _4674 = 1.0 / _4656;
    int _4676 = as_type<int>(_4610) + (-2);
    float _4678 = as_type<float>(_4670) * _4664;
    int _4680 = abs(_4646);
    int _4682 = as_type<int>(_4654) + (-2);
    float _4684 = trunc(_4672);
    float _4686 = precise::max(_4684, 0.0);
    uint _4688 = uint(_4686);
    int _4690 = ~_4472;
    int _4692 = _4690 + 1;
    float _4694 = float(uint(_4680));
    float _4696 = float(uint(_4666));
    float _4698 = trunc(_4678);
    float _4700 = precise::max(_4698, 0.0);
    uint _4702 = uint(_4700);
    int _4704 = abs(_4652);
    float _4706 = as_type<float>(_4682) * _4694;
    int _4708 = as_type<int>(_4674) + (-2);
    float _4710 = as_type<float>(_4676) * _4696;
    float _4712 = float(uint(_4704));
    float _4714 = _4188 * _4334;
    int _4716 = ~_4504;
    int _4718 = _4716 + 1;
    float _4720 = trunc(_4668);
    float _4722 = precise::max(_4720, 0.0);
    uint _4724 = uint(_4722);
    int _4726 = _4692 * int(_4688);
    int _4728 = _4726 + _4626;
    float _4730 = _4188 * _4362;
    float _4732 = as_type<float>(_4708) * _4712;
    float _4734 = fma(_4408, _4052, _4460);
    float _4736 = float(uint(_4728));
    float _4738 = fma(_4406, _4052, _4540);
    float _4740 = trunc(_4710);
    float _4742 = precise::max(_4740, 0.0);
    uint _4744 = uint(_4742);
    int _4746 = _4622 * int(_4702);
    int _4748 = _4746 + _4652;
    int _4750 = ~_4566;
    int _4752 = _4750 + 1;
    float _4754 = as_type<float>(_4638) * _4736;
    float _4756 = float(uint(_4748));
    float _4758 = trunc(_4706);
    float _4760 = precise::max(_4758, 0.0);
    uint _4762 = uint(_4760);
    int _4764 = _4718 * int(_4724);
    int _4766 = _4764 + _4646;
    float _4768 = fma(_4370, _4052, _4458);
    float _4770 = as_type<float>(_4670) * _4756;
    int _4772 = ~_4628;
    int _4774 = _4772 + 1;
    float _4776 = fma(_4406, _4150, _4658);
    float _4778 = float(uint(_4766));
    float _4780 = trunc(_4732);
    float _4782 = precise::max(_4780, 0.0);
    uint _4784 = uint(_4782);
    int _4786 = _4752 * int(_4744);
    int _4788 = _4786 + _4666;
    int _4790 = ~_4616;
    int _4792 = _4790 + 1;
    float _4794 = as_type<float>(_4648) * _4778;
    float _4796 = fma(_4182, _4406, _4714);
    float _4798 = float(uint(_4788));
    float _4800 = fma(_4370, _4150, _4564);
    int _4802 = _4792 * int(_4762);
    int _4804 = _4802 + _4680;
    float _4806 = trunc(_4794);
    float _4808 = precise::max(_4806, 0.0);
    uint _4810 = uint(_4808);
    float _4812 = as_type<float>(_4676) * _4798;
    float _4814 = fma(_4182, _4370, _4480);
    float _4816 = float(uint(_4804));
    float _4818 = _3564 * _3720;
    float _4820 = fma(_4374, _4162, _4800);
    int _4822 = _4774 * int(_4784);
    int _4824 = _4822 + _4704;
    int _4826 = ~_4504;
    int _4828 = _4826 + 1;
    float _4830 = trunc(_4754);
    float _4832 = precise::max(_4830, 0.0);
    uint _4834 = uint(_4832);
    float _4836 = as_type<float>(_4682) * _4816;
    float _4838 = fma(_4408, _4150, _4662);
    float _4840 = float(uint(_4824));
    float _4842 = fma(_4182, _4408, _4730);
    float _4844 = fma(_4444, _4056, _4738);
    float _4846 = fma(_4374, _4056, _4768);
    float _4848 = fma(_4412, _4056, _4734);
    float _4850 = trunc(_4836);
    float _4852 = precise::max(_4850, 0.0);
    uint _4854 = uint(_4852);
    float _4856 = as_type<float>(_4708) * _4840;
    int _4858 = int(_4724) + int(_4810);
    int _4860 = ~_4472;
    int _4862 = _4860 + 1;
    out.m_85.x = _4844;
    out.m_85.y = _4846;
    out.m_85.z = _4848;
    float _4864 = trunc(_4812);
    float _4866 = precise::max(_4864, 0.0);
    uint _4868 = uint(_4866);
    int _4870 = int(_4688) + int(_4834);
    float _4872 = trunc(_4856);
    float _4874 = precise::max(_4872, 0.0);
    uint _4876 = uint(_4874);
    float _4878 = _2145 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _4880 = _4862 * _4870;
    int _4882 = _4880 + _4626;
    int _4884 = int(_4762) + int(_4854);
    int _4886 = _4828 * _4858;
    int _4888 = _4886 + _4646;
    float _4890 = fma(_2153, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4878);
    int _4892 = ~_4566;
    int _4894 = _4892 + 1;
    float _4896 = trunc(_4770);
    float _4898 = precise::max(_4896, 0.0);
    uint _4900 = uint(_4898);
    int _4902 = int(_4744) + int(_4868);
    float _4904 = fma(_2151, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4890);
    int _4906 = ~_4628;
    int _4908 = _4906 + 1;
    bool _4910 = uint(_4888) >= uint(_4504);
    int _4912 = _4894 * _4902;
    int _4914 = _4912 + _4666;
    int _4916 = ~_4496;
    int _4918 = _4916 + 1;
    float _4920 = fma(_2177, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4904);
    int _4922 = int(_4784) + int(_4876);
    float _4924 = _4920 + _2191;
    bool _4926 = uint(_4882) >= uint(_4472);
    int _4928 = ~_4616;
    int _4930 = _4928 + 1;
    int _4932 = _4908 * _4922;
    int _4934 = _4932 + _4704;
    int _4936 = int(_4702) + int(_4900);
    float _4938 = _4924 * 0.5;
    bool _4940 = uint(_4914) >= uint(_4566);
    int _4942 = _4930 * _4884;
    int _4944 = _4942 + _4680;
    bool _4946 = !_4926;
    int _4948 = _4946 ? 0 : (-1);
    int _4950 = _4918 * _4936;
    int _4952 = _4950 + _4652;
    bool _4954 = !_4910;
    int _4956 = _4954 ? 0 : (-1);
    float _4958 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _4960 = uint(_4934) >= uint(_4628);
    bool _4962 = uint(_4952) >= uint(_4496);
    int _4964 = ~_4870;
    int _4966 = _4964 + _4948;
    int _4968 = _4966 + 1;
    int _4970 = ~_4858;
    int _4972 = _4970 + _4956;
    int _4974 = _4972 + 1;
    float _4976 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _4978 = uint(_4944) >= uint(_4616);
    bool _4980 = !_4962;
    int _4982 = _4980 ? 0 : (-1);
    bool _4984 = _4472 == 0;
    bool _4986 = _4472 == 0;
    float _4988 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _4990 = _4626 ^ _4472;
    int _4992 = _4472 * _4968;
    int _4994 = _4992 + _4626;
    bool _4996 = !_4940;
    int _4998 = _4996 ? 0 : (-1);
    int _5000 = _4504 * _4974;
    int _5002 = _5000 + _4646;
    bool _5004 = _4504 == 0;
    int _5006 = ~_4936;
    int _5008 = _5006 + _4982;
    int _5010 = _5008 + 1;
    float _5012 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _5014 = !_5004;
    int _5016 = _5014 ? _5002 : (-1);
    bool _5018 = !_4984;
    int _5020 = _5018 ? _4994 : (-1);
    int _5022 = _4496 * _5010;
    int _5024 = _5022 + _4652;
    bool _5026 = _4496 == 0;
    bool _5028 = _4496 == 0;
    int _5030 = _4652 ^ _4496;
    float _5032 = _4976 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _5034 = float(_5016);
    bool _5036 = !_4978;
    int _5038 = _5036 ? 0 : (-1);
    float _5040 = fma(_5032, _2642, -0.5);
    int _5042 = _4646 ^ _4504;
    float _5044 = fma(_5032, _5034, _1380);
    uint _5046 = uint(int(uint(_4990) >> uint(31)));
    float _5048 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _5050 = _4504 == 0;
    float _5052 = _4958 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _5054 = float(_5020);
    float _5056 = fma(_1374, _5040, _5044);
    bool _5058 = !_4960;
    int _5060 = _5058 ? 0 : (-1);
    float _5062 = fma(_5052, _2588, -0.5);
    uint _5064 = uint(int(uint(_5030) >> uint(31)));
    float _5066 = fma(_5052, _5054, _952);
    bool _5068 = !_5026;
    int _5070 = _5068 ? _5024 : (-1);
    float _5072 = _5012 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _5074 = ~_4998;
    int _5076 = _4902 + _5074;
    int _5078 = _5076 + 1;
    float _5080 = fma(_1354, _5062, _5066);
    uint _5082 = uint(int(uint(_5042) >> uint(31)));
    float _5084 = fma(_5072, _2678, -0.5);
    int _5086 = ~int(_5046);
    int _5088 = _5086 + 1;
    float _5090 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _5092 = ~_5060;
    int _5094 = _4922 + _5092;
    int _5096 = _5094 + 1;
    float _5098 = _5080 + 0.5;
    int _5100 = ~int(_5064);
    int _5102 = _5100 + 1;
    float _5104 = float(_5070);
    int _5106 = ~_5038;
    int _5108 = _4884 + _5106;
    int _5110 = _5108 + 1;
    int _5112 = ~int(_5082);
    int _5114 = _5112 + 1;
    int _5116 = _5078 ^ _5088;
    int _5118 = _5096 ^ _5102;
    float _5120 = fma(_5072, _5104, _1096);
    int _5122 = _5110 ^ _5114;
    float _5124 = _4988 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _5126 = ~_5088;
    int _5128 = _5126 + _5116;
    int _5130 = _5128 + 1;
    float _5132 = fma(_1370, _5084, _5120);
    int _5134 = ~_5114;
    int _5136 = _5134 + _5122;
    int _5138 = _5136 + 1;
    bool _5140 = !_4986;
    int _5142 = _5140 ? _5130 : (-1);
    float _5144 = _5132 + 0.5;
    bool _5146 = !_5050;
    int _5148 = _5146 ? _5138 : (-1);
    float _5150 = float(_5142);
    float _5152 = float(_5148);
    float _5154 = fma(_2798, _5124, -0.5);
    bool _5156 = _1498 <= 8000.0;
    bool _5158 = isnan(_1498);
    bool _5160 = _5156 || _5158;
    bool _5162 = isnan(8000.0);
    bool _5164 = _5160 || _5162;
    float _5166 = float(_5164);
    float _5168 = -_924;
    float _5170 = fma(_5124, _5150, _5168);
    float _5172 = fma(_4190, _4374, _4814);
    int _5174 = ~_5102;
    int _5176 = _5174 + _5118;
    int _5178 = _5176 + 1;
    float _5180 = _5090 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _5182 = fma(_1358, _5154, _5170);
    float _5184 = fma(_4190, _4444, _4796);
    float _5186 = fma(_4190, _4412, _4842);
    float _5188 = -_4258;
    float _5190 = _5188 + 1.0;
    bool _5192 = !_5028;
    int _5194 = _5192 ? _5178 : (-1);
    float _5196 = _5048 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _5198 = _4924;
    float _5200 = _4920;
    if (!_2161)
    {
        _5198 = 1.0;
    }
    float _5202 = _5198;
    float _5204 = fma(_5190, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4258);
    out.m_87.x = _5184;
    out.m_87.y = _5172;
    out.m_87.z = _5186;
    float _5206 = float(_5194);
    float _5208 = fma(_3010, _5180, -0.5);
    float _5210 = _5166 * _5204;
    float _5212 = _5202;
    if (_2161)
    {
        bool _5214 = _2277 >= _2241;
        bool _5216 = isnan(_2277);
        bool _5218 = _5214 || _5216;
        bool _5220 = isnan(_2241);
        bool _5222 = _5218 || _5220;
        float _5224 = float(_5222);
        _5212 = _5224;
    }
    float _5226 = _5212;
    float _5228 = -_1382;
    float _5230 = fma(_5180, _5152, _5228);
    float _5232 = fma(_5196, _3064, -0.5);
    float _5234 = -_1384;
    float _5236 = fma(_5196, _5206, _5234);
    float _5238 = _5226 * _3276;
    float _5240 = fma(_1376, _5208, _5230);
    out.gl_Position.x = _2217;
    out.gl_Position.y = _2223;
    out.gl_Position.z = _4920;
    out.gl_Position.w = _2191;
    float _5242 = _5210 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _5244 = fma(_1372, _5232, _5236);
    float _5246 = fma(_4444, _4162, _4776);
    float _5248 = _5056 + 0.5;
    float _5250 = _3616 * _5242;
    float _5252 = precise::clamp(_5250, 0.0, 1.0);
    float _5254 = _5182 + 0.5;
    float _5256 = _5240 + 0.5;
    float _5258 = _5244 + 0.5;
    float _5260 = -_5252;
    float _5262 = fma(_5260, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _5264 = fma(_4412, _4162, _4838);
    float _5266 = fma(_2290, _4818, _2288);
    float _5268 = -_5238;
    float _5270 = fma(_5268, _5262, 1.0);
    float _5272 = precise::clamp(_5270, 0.0, 1.0);
    float _5274 = _2290 * _3720;
    float _5276 = -_3704;
    float _5278 = _5276 + 1.0;
    out.m_89.x = _5098;
    out.m_89.y = _5254;
    out.m_89.z = _5248;
    out.m_89.w = _5256;
    float _5280 = _5272 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _5282 = fma(_3560, _5274, _2284);
    float _5284 = fma(_3562, _5274, _2286);
    float _5286 = _2290 * _5278;
    out.m_91.x = _5144;
    out.m_91.y = _5258;
    bool _5288 = _3306 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _5290 = isnan(_3306);
    bool _5292 = _5288 || _5290;
    bool _5294 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _5296 = _5292 || _5294;
    out.m_93.z = _4938;
    out.m_93.w = _2191;
    out.m_95.x = _5280;
    out.m_97.x = _5282;
    out.m_97.y = _5284;
    out.m_97.z = _5266;
    out.m_97.w = _5286;
    float _5298 = _5238;
    float _5300 = _5274;
    float _5302 = _5278;
    float _5304 = _5272;
    if (!_5296)
    {
        _5298 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _5306 = _5298;
    out.m_99.x = _5246;
    out.m_99.y = _4820;
    out.m_99.z = _5264;
    float _5308 = _5306;
    float _5310 = _5306;
    if (!_5296)
    {
        _2193 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _5312 = _2193;
    float _5314 = _5312;
    float _5316 = _5312;
    if (!_5296)
    {
        _5200 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _5318 = _5200;
    float _5320 = _5318;
    float _5322 = _5318;
    if (!_5296)
    {
        _5300 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _5324 = _5300;
    float _5326 = _5324;
    float _5328 = _5324;
    if (!_5296)
    {
        _5302 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _5330 = _5302;
    float _5332 = _5330;
    float _5334 = _5330;
    if (!_5296)
    {
        _5304 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _5336 = _5304;
    bool _5338 = !_5296;
    float _5340 = _5336;
    float _5342 = _5336;
    if (!_5338)
    {
        bool _5344 = _3306 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _5346 = isnan(_3306);
        bool _5348 = _5344 || _5346;
        bool _5350 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _5352 = _5348 || _5350;
        if (!_5352)
        {
            float _5354 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5356 = _3306 + _5354;
            float _5358 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5360 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _5358;
            float _5362 = 1.0 / _5360;
            float _5364 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _5366 = _5364 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _5368 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _5370 = _5368 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _5372 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _5374 = _5372 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _5376 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _5378 = _5376 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _5380 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _5382 = _5380 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _5384 = _5356 * _5362;
            float _5386 = precise::clamp(_5384, 0.0, 1.0);
            float _5388 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _5390 = _5388 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _5392 = fma(_5386, _5366, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _5394 = fma(_5386, _5390, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _5396 = fma(_5386, _5370, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _5398 = fma(_5386, _5374, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _5400 = fma(_5386, _5378, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _5402 = fma(_5386, _5382, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _5316 = _5394;
            _5334 = _5400;
            _5310 = _5392;
            _5328 = _5398;
            _5322 = _5396;
            _5342 = _5402;
            _5404 = true;
        }
        else
        {
            bool _5406 = _3306 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _5408 = isnan(_3306);
            bool _5410 = _5406 || _5408;
            bool _5412 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _5414 = _5410 || _5412;
            if (!_5414)
            {
                _5308 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _5416 = _5308;
            _5310 = _5416;
            if (!_5414)
            {
                _5314 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _5418 = _5314;
            _5316 = _5418;
            if (!_5414)
            {
                _5320 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _5420 = _5320;
            _5322 = _5420;
            if (!_5414)
            {
                _5326 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _5422 = _5326;
            _5328 = _5422;
            if (!_5414)
            {
                _5332 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _5424 = _5332;
            _5334 = _5424;
            if (!_5414)
            {
                _5340 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _5426 = _5340;
            bool _5428 = !_5414;
            _5342 = _5426;
            if (!_5428)
            {
                bool _5430 = _3306 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _5432 = isnan(_3306);
                bool _5434 = _5430 || _5432;
                bool _5436 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _5438 = _5434 || _5436;
                if (!_5438)
                {
                    float _5440 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5442 = _3306 + _5440;
                    float _5444 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5446 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _5444;
                    float _5448 = 1.0 / _5446;
                    float _5450 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _5452 = _5450 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _5454 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _5456 = _5454 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _5458 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _5460 = _5458 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _5462 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _5464 = _5462 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _5466 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _5468 = _5466 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _5470 = _5442 * _5448;
                    float _5472 = precise::clamp(_5470, 0.0, 1.0);
                    float _5474 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _5476 = _5474 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _5478 = fma(_5472, _5452, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _5480 = fma(_5472, _5476, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _5482 = fma(_5472, _5456, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _5484 = fma(_5472, _5460, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _5486 = fma(_5472, _5464, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _5488 = fma(_5472, _5468, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _5316 = _5480;
                    _5334 = _5486;
                    _5310 = _5478;
                    _5328 = _5484;
                    _5322 = _5482;
                    _5342 = _5488;
                    _5404 = true;
                }
                else
                {
                    _5316 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _5334 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _5310 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _5328 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _5322 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _5342 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _5404 = false;
    float _5490 = _5316;
    float _5492 = _5334;
    float _5494 = _5310;
    float _5496 = _5328;
    float _5498 = _5322;
    float _5500 = _5342;
    float _5502 = fma(_4820, -0.5, 0.5);
    float _5504 = precise::clamp(_5502, 0.0, 1.0);
    float _5506 = -_5490;
    float _5508 = _5506 + _5492;
    float _5510 = -_5494;
    float _5512 = _5510 + _5496;
    float _5514 = -_5498;
    float _5516 = _5514 + _5500;
    bool _5518 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _5520 = fma(_5504, _5508, _5490);
    float _5522 = fma(_5504, _5512, _5494);
    float _5524 = fma(_5504, _5516, _5498);
    float _5526 = _5520 * 0.586610972881317138671875;
    out.m_59.x = 1.0;
    float _5528 = fma(_5522, 0.298911988735198974609375, _5526);
    float _5530 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _5532 = fma(_5524, 0.114477999508380889892578125, _5528);
    out.m_95.w = _5530;
    float _5534 = -_5532;
    float _5536 = _5522 + _5534;
    float _5538 = -_5532;
    float _5540 = _5520 + _5538;
    float _5542 = -_5532;
    float _5544 = _5524 + _5542;
    out.m_101.x = 0.0;
    float _5546 = fma(_5536, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5532);
    float _5548 = fma(_5540, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5532);
    float _5550 = fma(_5544, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5532);
    out.m_103.x = _5546;
    out.m_103.y = _5548;
    out.m_103.z = _5550;
    if (!_5518)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _5552 = -_2079;
    float _5554 = _5552 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _5556 = -_2081;
    float _5558 = _5556 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _5560 = -_2083;
    float _5562 = _5560 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _5564 = _5554 * _5554;
    float _5566 = fma(_5558, _5558, _5564);
    float _5568 = fma(_5562, _5562, _5566);
    float _5570 = sqrt(_5568);
    float _5572 = rsqrt(_5568);
    float _5574 = -_5570;
    float _5576 = _5574 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _5578 = _5576 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _5580 = precise::clamp(_5578, 0.0, 1.0);
    float _5582 = _5558 * _5572;
    float _5584 = _5554 * _5572;
    float _5586 = abs(_5580);
    float _5588 = log2(_5586);
    float _5590 = _5562 * _5572;
    float _5592 = _5582 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _5594 = _4820 * _5584;
    float _5596 = -_5584;
    float _5598 = -_5592;
    float _5600 = fma(_5596, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5598);
    float _5602 = fma(_5246, _5582, _5594);
    float _5604 = -_5590;
    float _5606 = fma(_5604, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5600);
    float _5608 = fma(_5264, _5590, _5602);
    float _5610 = precise::clamp(_5608, 0.0, 1.0);
    float _5612 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _5614 = _5606 + _5612;
    float _5616 = _5588 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _5618 = _5614 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _5620 = precise::clamp(_5618, 0.0, 1.0);
    float _5622 = exp2(_5616);
    float _5624 = _5622 * _5620;
    float _5626 = _5610 * _5624;
    float _5628 = _5626 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _5630 = _5626 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _5632 = _5626 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_101.x = _5628;
    out.m_101.y = _5630;
    out.m_101.z = _5632;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    bool _5404 = false;
    bool _804 = false;
    bool _700 = false;
    bool _584 = false;
    bool _200 = false;
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
    if (!_126)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5688 = as_type<float>(_138);
        out.gl_Position.z = _5688;
    }
    if (!_126)
    {
        return out;
    }
    float _140 = in.m_61.w;
    bool _142 = _140 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _144 = isnan(_140);
    bool _146 = _142 || _144;
    bool _148 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _150 = _146 || _148;
    float _152 = -_140;
    float _154 = _152 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _156 = _154;
    if (_150)
    {
        float _158 = float(_122);
        _132 = _158;
    }
    float _160 = _132;
    bool _162 = _154 >= _160;
    bool _164 = !_150;
    bool _166 = _162 || _164;
    float _168 = _160;
    if (_166)
    {
        _168 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _170 = _168;
    if (_166)
    {
        out.m_59.x = 0.0;
    }
    int _172 = 0;
    if (_166)
    {
        float _174 = _170 * 5.0;
        _172 = as_type<int>(_174);
    }
    int _176 = _172;
    if (_166)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5758 = as_type<float>(_176);
        out.gl_Position.z = _5758;
    }
    if (_166)
    {
        return out;
    }
    bool _178 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _180 = !_178;
    float _198;
    if (!_180)
    {
        float _182 = in.m_63.x;
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
    float _210 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _212 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _210;
    float _214 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _216 = _214 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _218 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _220 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _218;
    float _222 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _224 = _222 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _226 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _228 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _226;
    float _230 = 1.0 / _216;
    float _232 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _234 = _232 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _236 = 1.0 / _224;
    float _238 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _240 = _208 + _238;
    bool _242 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _244 = 1.0 / _212;
    float _246 = _240 * _230;
    float _248 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _250 = _208 + _248;
    float _252 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _254 = _208 + _252;
    bool _256 = _208 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _258 = isnan(_208);
    bool _260 = _256 || _258;
    bool _262 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _264 = _260 || _262;
    float _266 = float(_264);
    float _268 = 1.0 / _234;
    float _270 = _250 * _236;
    bool _272 = _208 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _274 = isnan(_208);
    bool _276 = _272 || _274;
    bool _278 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _280 = _276 || _278;
    float _282 = float(_280);
    float _284 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _286 = _208 + _284;
    float _288 = 1.0 / _228;
    float _290 = _286 * _244;
    float _292 = -_282;
    float _294 = _292 + 1.0;
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _298 = _208 + _296;
    bool _300 = _208 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _302 = isnan(_208);
    bool _304 = _300 || _302;
    bool _306 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _308 = _304 || _306;
    float _310 = float(_308);
    float _312 = 1.0 / _220;
    bool _314 = _208 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _316 = isnan(_208);
    bool _318 = _314 || _316;
    bool _320 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _322 = _318 || _320;
    float _324 = float(_322);
    float _326 = _254 * _268;
    bool _328 = _208 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _330 = isnan(_208);
    bool _332 = _328 || _330;
    bool _334 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _336 = _332 || _334;
    float _338 = float(_336);
    float _340 = _324 * _294;
    float _342 = -_324;
    float _344 = _342 + 1.0;
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _348 = _346 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _352 = _208 + _350;
    float _354 = _338 * _344;
    float _356 = fma(_348, _246, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _358 = _352 * _288;
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _362 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _360;
    float _364 = _298 * _312;
    float _366 = -_338;
    float _368 = _366 + 1.0;
    float _370 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _372 = _370 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _374 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _376 = _374 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _380 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _378;
    float _382 = _266 * _368;
    float _384 = -_266;
    float _386 = _384 + 1.0;
    bool _388 = _208 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _390 = isnan(_208);
    bool _392 = _388 || _390;
    bool _394 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _396 = _392 || _394;
    float _398 = float(_396);
    float _400 = fma(_372, _246, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _402 = _208 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _404 = isnan(_208);
    bool _406 = _402 || _404;
    bool _408 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _410 = _406 || _408;
    float _412 = float(_410);
    float _414 = fma(_376, _246, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _416 = _310 * _386;
    float _418 = -_310;
    float _420 = _418 + 1.0;
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _424 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _422;
    float _426 = -_412;
    float _428 = _426 + 1.0;
    float _430 = _412 * _420;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _434 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _432;
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _438 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _436;
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _442 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _440;
    float _444 = fma(_380, _290, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _446 = fma(_424, _290, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _448 = _398 * _428;
    float _450 = fma(_362, _290, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _452 = fma(_438, _364, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _454 = fma(_434, _364, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _456 = fma(_442, _364, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _458 = _444 * _448;
    float _460 = _446 * _448;
    float _462 = -_398;
    float _464 = _462 + 1.0;
    float _466 = _450 * _448;
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _470 = _468 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _474 = _472 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _476 = fma(_464, (*spvDescriptorSet0.vp_c9)._m0[143].x, _458);
    float _478 = fma(_464, (*spvDescriptorSet0.vp_c9)._m0[143].y, _460);
    float _480 = fma(_464, (*spvDescriptorSet0.vp_c9)._m0[143].z, _466);
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _484 = _482 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _486 = fma(_400, _430, _476);
    float _488 = fma(_414, _430, _478);
    float _490 = fma(_356, _430, _480);
    float _492 = fma(_470, _270, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _494 = fma(_474, _270, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _496 = fma(_484, _270, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _498 = fma(_452, _416, _486);
    float _500 = fma(_454, _416, _488);
    float _502 = fma(_456, _416, _490);
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _506 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _504;
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _510 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _508;
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _514 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _512;
    float _516 = fma(_492, _382, _498);
    float _518 = fma(_494, _382, _500);
    float _520 = fma(_496, _382, _502);
    float _522 = fma(_506, _358, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _524 = fma(_510, _358, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _526 = fma(_514, _358, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _530 = _528 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _534 = _532 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[148].z;
    float _538 = _536 + (*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _540 = fma(_522, _354, _516);
    float _542 = fma(_530, _326, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _544 = fma(_534, _326, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _546 = fma(_538, _326, (*spvDescriptorSet0.vp_c9)._m0[148].z);
    float _548 = fma(_524, _354, _518);
    float _550 = fma(_526, _354, _520);
    float _552 = fma(_542, _340, _540);
    float _554 = fma(_544, _340, _548);
    float _556 = fma(_546, _340, _550);
    float _558 = fma(_282, (*spvDescriptorSet0.vp_c9)._m0[149].x, _552);
    float _560 = fma(_282, (*spvDescriptorSet0.vp_c9)._m0[149].y, _554);
    float _562 = fma(_282, (*spvDescriptorSet0.vp_c9)._m0[149].z, _556);
    bool _564 = !_242;
    float _582;
    if (!_564)
    {
        float _566 = in.m_63.x;
        float _568 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _570 = _566 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _572 = fma(_570, (*spvDescriptorSet0.vp_c9)._m0[11].y, _154);
        float _574 = _572 * _568;
        float _576 = floor(_574);
        float _578 = -_576;
        float _580 = _574 + _578;
        _582 = _580;
        _584 = true;
    }
    else
    {
        float _586 = float(_122);
        float _588 = 1.0 / _586;
        float _590 = _154 * _588;
        _582 = _590;
    }
    _584 = false;
    float _592 = _582;
    float _594 = in.m_65.x;
    float _596 = in.m_65.y;
    float _598 = in.m_65.z;
    bool _600 = _592 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _602 = isnan(_592);
    bool _604 = _600 || _602;
    bool _606 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _608 = _604 || _606;
    float _610 = float(_608);
    float _612 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _614 = _612 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _616 = _592 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _618 = isnan(_592);
    bool _620 = _616 || _618;
    bool _622 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _624 = _620 || _622;
    float _626 = float(_624);
    float _628 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _630 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _628;
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _634 = _592 + _632;
    float _636 = -_610;
    float _638 = _636 + 1.0;
    bool _640 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _642 = 1.0 / _614;
    float _644 = _626 * _638;
    float _646 = -_626;
    float _648 = _646 + 1.0;
    float _650 = _558 * _594;
    float _652 = _630 * _642;
    float _654 = fma(_652, _634, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _656 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _658 = _654 * _644;
    float _660 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _662 = _656 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _664 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[115].x, _658);
    float _666 = _560 * _596;
    float _668 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _670 = _660 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _672 = fma(_610, (*spvDescriptorSet0.vp_c9)._m0[116].x, _664);
    float _674 = _562 * _598;
    float _676 = _668 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _678 = _672 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_67.x = _676;
    out.m_67.y = _670;
    out.m_67.z = _662;
    out.m_67.w = _678;
    bool _680 = !_640;
    float _698;
    if (!_680)
    {
        float _682 = in.m_63.x;
        float _684 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _686 = _682 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _688 = fma(_686, (*spvDescriptorSet0.vp_c9)._m0[11].w, _154);
        float _690 = _688 * _684;
        float _692 = floor(_690);
        float _694 = -_692;
        float _696 = _690 + _694;
        _698 = _696;
        _700 = true;
    }
    else
    {
        float _702 = float(_122);
        float _704 = 1.0 / _702;
        float _706 = _154 * _704;
        _698 = _706;
    }
    _700 = false;
    float _708 = _698;
    bool _710 = _708 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _712 = isnan(_708);
    bool _714 = _710 || _712;
    bool _716 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _718 = _714 || _716;
    float _720 = float(_718);
    float _722 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _724 = _722 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _726 = _708 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _728 = isnan(_708);
    bool _730 = _726 || _728;
    bool _732 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _734 = _730 || _732;
    float _736 = float(_734);
    float _738 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _740 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _738;
    float _742 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _744 = _708 + _742;
    float _746 = -_720;
    float _748 = _746 + 1.0;
    float _750 = 1.0 / _724;
    bool _752 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _754 = _736 * _748;
    float _756 = -_736;
    float _758 = _756 + 1.0;
    float _760 = _740 * _750;
    float _762 = fma(_760, _744, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _764 = _762 * _754;
    float _766 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _768 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _770 = fma(_758, (*spvDescriptorSet0.vp_c9)._m0[131].x, _764);
    float _772 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _774 = _766 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _776 = _768 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _778 = fma(_720, (*spvDescriptorSet0.vp_c9)._m0[132].x, _770);
    float _780 = _772 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _782 = _778 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_69.x = _774;
    out.m_69.y = _776;
    out.m_69.z = _780;
    out.m_69.w = _782;
    bool _784 = !_752;
    float _802;
    if (!_784)
    {
        float _786 = in.m_63.x;
        float _788 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _790 = _786 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _792 = fma(_790, (*spvDescriptorSet0.vp_c9)._m0[14].x, _154);
        float _794 = _792 * _788;
        float _796 = floor(_794);
        float _798 = -_796;
        float _800 = _794 + _798;
        _802 = _800;
        _804 = true;
    }
    else
    {
        float _806 = float(_122);
        float _808 = 1.0 / _806;
        float _810 = _154 * _808;
        _802 = _810;
    }
    _804 = false;
    float _812 = _802;
    float _814 = in.m_56.x;
    float _816 = in.m_56.y;
    float _818 = in.m_56.z;
    float _820 = _816 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _822 = _816 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _824 = fma(_814, (*spvDescriptorSet0.vp_c10)._m0[4].x, _820);
    float _826 = fma(_814, (*spvDescriptorSet0.vp_c10)._m0[6].x, _822);
    float _828 = fma(_818, (*spvDescriptorSet0.vp_c10)._m0[4].z, _824);
    float _830 = fma(_818, (*spvDescriptorSet0.vp_c10)._m0[6].z, _826);
    float _832 = _828 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _834 = _830 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _836 = fma(_832, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _838 = fma(_834, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _840 = floor(_836);
    float _842 = floor(_838);
    float _844 = -_840;
    float _846 = _836 + _844;
    float _848 = -_842;
    float _850 = _838 + _848;
    float2 _6891 = float2(_846, _850);
    float _852 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6891, float2(0.0), isnan(_6891)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6891, float2(0.0), isnan(_6891)), level(0.0)).x;
    float _854 = in.m_63.x;
    float _856 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _858 = int(_856);
    float _860 = in.m_63.y;
    int _862 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _864 = _862 != 0;
    float _866 = -_832;
    float _868 = _866 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _870 = in.m_63.z;
    float _872 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _874 = _816 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _876 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _878 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _880 = log2(_878);
    float _882 = fma(_814, (*spvDescriptorSet0.vp_c10)._m0[5].x, _874);
    float _884 = -_834;
    float _886 = _884 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _888 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _890 = fma(_818, (*spvDescriptorSet0.vp_c10)._m0[5].z, _882);
    float _892 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _894 = int(_892);
    float _896 = float(_122);
    float _898 = _854 * 2.0;
    float _900 = _854 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _902 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _904 = float(_858);
    float _906 = _860 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _908 = _860 * 2.0;
    float _910 = floor(_898);
    float _912 = -_876;
    float _914 = fma(_900, 2.0, _912);
    float _916 = fma(_906, -2.0, _872);
    float _918 = _870 * 2.0;
    float _920 = _854 + _860;
    float _922 = _860 + _870;
    float _924 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[76].y, _916);
    float _926 = floor(_908);
    float _928 = _920 + (-1.0);
    int _930 = as_type<int>(_920);
    float _932 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    float _934 = _860;
    float _936 = _854;
    float _938 = _834;
    if (_864)
    {
        _930 = 0;
    }
    int _940 = _930;
    float _942 = _922 + (-1.0);
    int _944 = _940;
    if (!_864)
    {
        _944 = 2;
    }
    int _946 = _944;
    float _948 = fma(_928, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _950 = -_154;
    float _952 = fma(_950, (*spvDescriptorSet0.vp_c9)._m0[76].x, _914);
    float _954 = floor(_918);
    bool _956 = _910 > 0.0;
    float _958 = _666 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _960 = _946 != 2;
    float _962 = fma(_942, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _964 = _910 >= 0.0;
    bool _966 = isnan(_910);
    bool _968 = _964 || _966;
    bool _970 = isnan(0.0);
    bool _972 = _968 || _970;
    float _974 = _650 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _976 = _946;
    if (_864)
    {
        _976 = 0;
    }
    int _978 = _976;
    float _980 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _982 = int(_980);
    int _984 = _972 ? 0 : 1;
    int _986 = _978;
    if (!_864)
    {
        _986 = 1;
    }
    int _988 = _986;
    bool _990 = _926 > 0.0;
    bool _992 = _926 >= 0.0;
    bool _994 = isnan(_926);
    bool _996 = _992 || _994;
    bool _998 = isnan(0.0);
    bool _1000 = _996 || _998;
    float _1002 = 1.0 / _904;
    bool _1004 = _954 > 0.0;
    bool _1006 = _954 >= 0.0;
    bool _1008 = isnan(_954);
    bool _1010 = _1006 || _1008;
    bool _1012 = isnan(0.0);
    bool _1014 = _1010 || _1012;
    int _1016 = ~_984;
    int _1018 = _1016 + 1;
    int _1020 = _1018 + 1;
    int _1022 = _1020;
    float _1024 = as_type<float>(_988);
    if (!_956)
    {
        int _1026 = ~_984;
        int _1028 = _1026 + 1;
        _1022 = _1028;
    }
    int _1030 = _1022;
    float _1032 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1034 = int(_1032);
    bool _1036 = _988 != 1;
    float _1038 = _880 * _154;
    if (_960)
    {
        _1024 = _854;
    }
    float _1040 = _1024;
    float _1042 = _1040;
    if (!_960)
    {
        _1042 = _870;
    }
    float _1044 = _1042;
    float _1046 = _1014 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _1048 = exp2(_1038);
    int _1050 = _1000 ? 0 : 1;
    float _1052 = _1044 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    int _1054 = ~as_type<int>(_1046);
    int _1056 = _1054 + 1;
    int _1058 = _1056 + 1;
    float _1060 = _1002 * _154;
    int _1062 = ~_1050;
    int _1064 = _1062 + 1;
    int _1066 = _1064 + 1;
    float _1068 = -_888;
    float _1070 = fma(_1052, 2.0, _1068);
    float _1072 = _1052;
    int _1074 = _1058;
    int _1076 = _1066;
    float _1078 = _1046;
    float _1080 = _1044;
    if (!_1036)
    {
        _1072 = _860;
    }
    float _1082 = _1072;
    float _1084 = 1.0 / _896;
    float _1086 = _1082;
    if (!_1004)
    {
        int _1088 = ~as_type<int>(_1046);
        int _1090 = _1088 + 1;
        _1074 = _1090;
    }
    int _1092 = _1074;
    float _1094 = -_154;
    float _1096 = fma(_1094, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1070);
    if (!_990)
    {
        int _1098 = ~_1050;
        int _1100 = _1098 + 1;
        _1076 = _1100;
    }
    int _1102 = _1076;
    if (!_1036)
    {
        _1078 = _1082;
    }
    float _1104 = _1078;
    float _1106 = -_1048;
    float _1108 = _1106 + 1.0;
    float _1110 = _1104;
    if (_1036)
    {
        _1110 = _854;
    }
    float _1112 = _1110;
    float _1114 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _1116 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1118 = _1116 != 0;
    int _1120 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1122 = _1120 != 0;
    int _1124 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1126 = _1124 != 0;
    float _1128 = _1112 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (!_1036)
    {
        _1080 = _870;
    }
    float _1130 = _1080;
    float _1132 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1134 = _1130;
    if (_1036)
    {
        _1134 = _860;
    }
    float _1136 = _1134;
    float _1138 = -_1114;
    float _1140 = fma(_1128, 2.0, _1138);
    float _1142 = _890 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1144 = !_1122;
    int _1146 = _1144 ? 0 : 1;
    float _1148 = _1084 * _154;
    bool _1150 = !_1118;
    int _1152 = _1150 ? 0 : 1;
    float _1154 = fma(_1136, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1132);
    int _1156 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1158 = _1156 != 0;
    int _1160 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1162 = _1160 != 0;
    float _1164 = _1142 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1166 = _1142 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    if (_1036)
    {
        _1086 = _854;
    }
    float _1168 = _1086;
    float _1170 = -_1142;
    float _1172 = _1170 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    bool _1174 = !_1126;
    int _1176 = _1174 ? 0 : 1;
    float _1178 = fma(_832, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1164);
    bool _1180 = !_1162;
    int _1182 = _1180 ? 0 : 1;
    float _1184 = fma(_832, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1166);
    bool _1186 = !_1158;
    int _1188 = _1186 ? 0 : 1;
    float _1190 = fma(_834, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1178);
    int _1192 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1194 = _1192 != 0;
    int _1196 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1198 = _1196 != 0;
    int _1200 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1202 = _1200 != 0;
    float _1204 = fma(_1168, (*spvDescriptorSet0.vp_c9)._m0[83].z, _902);
    float _1206 = fma(_834, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1184);
    float _1208 = _1190 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1210 = float(_894);
    float _1212 = in.m_71.x;
    float _1214 = in.m_71.y;
    float _1216 = in.m_71.z;
    bool _1218 = !_1194;
    int _1220 = _1218 ? 0 : 1;
    float _1222 = _1206 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1224 = float(_1092);
    float _1226 = 1.0 / _1210;
    int _1228 = abs(_1220);
    float _1230 = _1208 + _1222;
    float _1232 = _1178;
    float _1234 = as_type<float>(_1228);
    if (!_1036)
    {
        _1232 = _870;
    }
    float _1236 = _1232;
    float _1238 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1240 = _1172 * _1172;
    float _1242 = _1236;
    if (_1036)
    {
        _1242 = _860;
    }
    float _1244 = _1242;
    float _1246 = 1.0 / _1222;
    float _1248 = float(_1228);
    float _1250 = fma(_868, _868, _1240);
    if (_960)
    {
        _1234 = _860;
    }
    float _1252 = _1234;
    float _1254 = _1244 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1256 = _1252;
    if (!_960)
    {
        _1256 = _854;
    }
    float _1258 = _1256;
    float _1260 = _1248 * _1224;
    float _1262 = fma(_1254, -2.0, _1238);
    float _1264 = _1260 * (-2.0);
    float _1266 = _1258 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1268 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1270 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1272 = 1.0 + _1270;
    float _1274 = _1230 * _1246;
    float _1276 = _1274 * 0.5;
    float _1278 = fma(_948, _1264, _948);
    float _1280 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1282 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1284 = fma(_1266, -2.0, _1268);
    float _1286 = float(_982);
    float _1288 = _1142 + _1280;
    float _1290 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1292 = fma(_860, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1282);
    float _1294 = 1.0 / _1286;
    float _1296 = _1288 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1298 = fma(_1264, _1212, _1212);
    float _1300 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1302 = fma(_860, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1290);
    bool _1304 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1306 = isnan(1.0);
    bool _1308 = _1304 || _1306;
    bool _1310 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1312 = _1308 || _1310;
    float _1314 = fma(_832, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1296);
    float _1316 = 1.0 / _1272;
    bool _1318 = !_1198;
    int _1320 = _1318 ? 0 : 1;
    float _1322 = fma(_854, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1300);
    float _1324 = fma(_886, _886, _1250);
    bool _1326 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1328 = isnan(0.0);
    bool _1330 = _1326 || _1328;
    bool _1332 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1334 = _1330 || _1332;
    float _1336 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1338 = !_1202;
    int _1340 = _1338 ? 0 : 1;
    float _1342 = _1226 * _154;
    float _1344 = float(_1030);
    float _1346 = fma(_854, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1336);
    int _1348 = abs(_1320);
    float _1350 = _854 + (-0.5);
    float _1352 = float(_1034);
    float _1354 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1346);
    float _1356 = _1334 ? _1108 : 0.0;
    float _1358 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1292);
    int _1360 = abs(_1340);
    float _1362 = _1352 * _154;
    float _1364 = float(_1348);
    float _1366 = _1294 * _154;
    float _1368 = float(_1102);
    float _1370 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1322);
    float _1372 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1302);
    float _1374 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1204);
    float _1376 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1154);
    float _1378 = -_154;
    float _1380 = fma(_1378, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1140);
    float _1382 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1262);
    float _1384 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1284);
    float _1386 = float(_1360);
    int _1388 = as_type<int>(_1342);
    float _1390 = _1288;
    if (_1312)
    {
        float _1392 = _1356 * _1316;
        _156 = _1392;
    }
    float _1394 = _156;
    float _1396 = fma(_834, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1314);
    float _1398 = fma(_1350, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1298);
    float _1400 = _1364 * _1344;
    float _1402 = rsqrt(_1324);
    float _1404 = _1396 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1406 = _1386 * _1368;
    float _1408 = fma(_1278, _1394, _1398);
    float _1410 = _854 + _870;
    float _1412 = _1400 * (-2.0);
    float _1414 = _1406 * (-2.0);
    float _1416 = _860 + (-0.5);
    float _1418 = _1410 + (-1.0);
    float _1420 = fma(_1412, _1214, _1214);
    float _1422 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1424 = fma(_1276, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1422);
    float _1426 = _1288 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1428 = in.m_73.x;
    float _1430 = in.m_73.y;
    float _1432 = in.m_73.z;
    float _1434 = fma(_1418, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1436 = fma(_1416, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1420);
    float _1438 = fma(_1414, _1216, _1216);
    float _1440 = _870 + (-0.5);
    float _1442 = 1.0 / _1424;
    float _1444 = fma(_1434, _1414, _1434);
    float _1446 = _868 * _1402;
    float _1448 = fma(_1440, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1438);
    float _1450 = fma(_832, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1426);
    float _1452 = fma(_962, _1412, _962);
    float _1454 = _886 * _1402;
    float _1456 = fma(_1444, _1394, _1448);
    float _1458 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1460 = _1446 * _1458;
    float _1462 = fma(_834, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1450);
    float _1464 = fma(_1452, _1394, _1436);
    float _1466 = _1172 * _1402;
    float _1468 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1470 = _1454 * _1468;
    float _1472 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1474 = -_1460;
    float _1476 = fma(_1454, _1472, _1474);
    float _1478 = _1462 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1480 = _1464 * 0.15915493667125701904296875;
    float _1482 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1484 = -_1470;
    float _1486 = fma(_1466, _1482, _1484);
    float _1488 = _1408 * 0.15915493667125701904296875;
    float _1490 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1492 = _1466 * _1490;
    float _1494 = _1476 * _1476;
    float _1496 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1498 = _1442 * _1496;
    float _1500 = trunc(_1404);
    int _1502 = int(_1500);
    float _1504 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1506 = -_1492;
    float _1508 = fma(_1446, _1504, _1506);
    float _1510 = fma(_1486, _1486, _1494);
    float _1512 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1430);
    bool _1514 = _1498 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1516 = _1456 * 0.15915493667125701904296875;
    float _1518 = fma(_1508, _1508, _1510);
    bool _1520 = _1498 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1522 = trunc(_1478);
    int _1524 = int(_1522);
    float _1526 = _1512 * _958;
    float _1528 = _674 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _1530 = !_1514;
    int _1532 = _1530 ? 0 : 1;
    float _1534 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1428);
    float _1536 = rsqrt(_1518);
    int _1538 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1540 = _1502 + _1538;
    int _1542 = _1540 + 1;
    float _1544 = _1534 * _974;
    int _1546 = 2;
    int _1548 = _1542;
    if (!_1514)
    {
        _1546 = 1;
    }
    int _1550 = _1546;
    float _1552 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1432);
    int _1554 = _1550;
    if (!_1520)
    {
        _1554 = _1532;
    }
    int _1556 = _1554;
    bool _1558 = _1542 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1560 = _1488 * 6.283185482025146484375;
    float _1562 = sin(_1560);
    int _1564 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1566 = _1524 + _1564;
    int _1568 = _1566 + 1;
    float _1570 = _1552 * _1528;
    int _1572 = _1556 << 6;
    int _1574 = _1542 | _1568;
    int _1576 = _1572 + 104;
    uint _1579 = uint(int(uint(_1576) >> uint(2)));
    uint _1581 = uint(int(uint(int(_1579)) >> uint(2)));
    int _1583 = int(_1579) & 3;
    float _1585 = (*spvDescriptorSet0.vp_c15)._m0[int(_1581)][_1583];
    int _1587 = int(_1579) + 1;
    uint _1589 = uint(int(uint(_1587) >> uint(2)));
    int _1591 = _1587 & 3;
    float _1593 = (*spvDescriptorSet0.vp_c15)._m0[int(_1589)][_1591];
    float _1595 = _1488 * 6.283185482025146484375;
    float _1597 = cos(_1595);
    bool _1599 = _1574 < 0;
    bool _1601 = _1599 || _1558;
    float _1603 = _1486 * _1536;
    float _1605 = _1476 * _1536;
    float _1607 = _1508 * _1536;
    bool _1609 = _1568 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1611 = _1609 || _1601;
    float _1613 = _1466 * _1603;
    int _1615 = _1572 + 96;
    uint _1617 = uint(int(uint(_1615) >> uint(2)));
    uint _1619 = uint(int(uint(int(_1617)) >> uint(2)));
    int _1621 = int(_1617) & 3;
    float _1623 = (*spvDescriptorSet0.vp_c15)._m0[int(_1619)][_1621];
    int _1625 = int(_1617) + 1;
    uint _1627 = uint(int(uint(_1625) >> uint(2)));
    int _1629 = _1625 & 3;
    float _1631 = (*spvDescriptorSet0.vp_c15)._m0[int(_1627)][_1629];
    float _1633 = _1480 * 6.283185482025146484375;
    float _1635 = sin(_1633);
    float _1637 = _1454 * _1605;
    float _1639 = -_1613;
    float _1641 = fma(_1446, _1605, _1639);
    float _1643 = -_1637;
    float _1645 = fma(_1466, _1607, _1643);
    int _1647 = _1572 + 48;
    uint _1649 = uint(int(uint(_1647) >> uint(2)));
    uint _1651 = uint(int(uint(int(_1649)) >> uint(2)));
    int _1653 = int(_1649) & 3;
    float _1655 = (*spvDescriptorSet0.vp_c15)._m0[int(_1651)][_1653];
    int _1657 = int(_1649) + 1;
    uint _1659 = uint(int(uint(_1657) >> uint(2)));
    int _1661 = _1657 & 3;
    float _1663 = (*spvDescriptorSet0.vp_c15)._m0[int(_1659)][_1661];
    float _1665 = _1480 * 6.283185482025146484375;
    float _1667 = cos(_1665);
    int _1669 = _1568;
    if (!_1611)
    {
        int _1671 = _1568 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1673 = _1671 + _1542;
        _1548 = _1673;
    }
    int _1675 = _1548;
    float _1677 = as_type<float>(_1675);
    if (!_1611)
    {
        int _1679 = _1675 << 2;
        _1669 = _1679;
    }
    int _1681 = _1669;
    float _1683 = _1516 * 6.283185482025146484375;
    float _1685 = cos(_1683);
    float _1687 = _1562 * _1635;
    float _1689 = _1597 * _1635;
    int _1691 = 0;
    int _1693 = _1681;
    if (!_1611)
    {
        uint _1695 = uint(int(uint(_1675) >> uint(2)));
        _1691 = int(_1695);
    }
    int _1697 = _1691;
    int _1699 = _1697;
    if (!_1611)
    {
        int _1701 = 12 & _1681;
        _1693 = _1701;
    }
    int _1703 = _1693;
    float _1705 = _1516 * 6.283185482025146484375;
    float _1707 = sin(_1705);
    float _1709 = _1597 * _1667;
    float _1711 = _1562 * _1667;
    if (!_1611)
    {
        int _1713 = _1697 << 4;
        int _1715 = _1713 + _1703;
        _1699 = _1715;
    }
    int _1717 = _1699;
    float _1719 = _1597 * _1685;
    float _1721 = _1562 * _1685;
    float _1723 = _1667 * _1685;
    float _1725 = _1635 * _1685;
    float _1727 = _1719 * _1526;
    int _1729 = _1572 + 72;
    uint _1731 = uint(int(uint(_1729) >> uint(2)));
    uint _1733 = uint(int(uint(int(_1731)) >> uint(2)));
    int _1735 = int(_1731) & 3;
    float _1737 = (*spvDescriptorSet0.vp_c15)._m0[int(_1733)][_1735];
    int _1739 = int(_1731) + 1;
    uint _1741 = uint(int(uint(_1739) >> uint(2)));
    int _1743 = _1739 & 3;
    float _1745 = (*spvDescriptorSet0.vp_c15)._m0[int(_1741)][_1743];
    float _1747 = fma(_1707, _1709, _1687);
    float _1749 = -_1689;
    float _1751 = fma(_1707, _1711, _1749);
    float _1753 = -_1711;
    float _1755 = fma(_1707, _1689, _1753);
    float _1757 = fma(_1707, _1687, _1709);
    float _1759 = -_1526;
    float _1761 = _1707 * _1759;
    float _1763 = fma(_1747, _1544, _1727);
    int _1765 = _1572 + 64;
    uint _1767 = uint(int(uint(_1765) >> uint(2)));
    uint _1769 = uint(int(uint(int(_1767)) >> uint(2)));
    int _1771 = int(_1767) & 3;
    float _1773 = (*spvDescriptorSet0.vp_c15)._m0[int(_1769)][_1771];
    int _1775 = int(_1767) + 1;
    uint _1777 = uint(int(uint(_1775) >> uint(2)));
    int _1779 = _1775 & 3;
    float _1781 = (*spvDescriptorSet0.vp_c15)._m0[int(_1777)][_1779];
    float _1783 = _1721 * _1526;
    float _1785 = fma(_1723, _1544, _1761);
    float _1787 = fma(_1755, _1570, _1763);
    float _1789 = _1288 * _1631;
    float _1791 = fma(_1751, _1544, _1783);
    float _1793 = fma(_1725, _1570, _1785);
    float _1795 = _1641 * _1787;
    float _1797 = _1645 * _1787;
    float _1799 = fma(_1757, _1570, _1791);
    int _1801 = _1572 + 56;
    uint _1803 = uint(int(uint(_1801) >> uint(2)));
    uint _1805 = uint(int(uint(int(_1803)) >> uint(2)));
    int _1807 = int(_1803) & 3;
    float _1809 = (*spvDescriptorSet0.vp_c15)._m0[int(_1805)][_1807];
    int _1811 = int(_1803) + 1;
    uint _1813 = uint(int(uint(_1811) >> uint(2)));
    int _1815 = _1811 & 3;
    float _1817 = (*spvDescriptorSet0.vp_c15)._m0[int(_1813)][_1815];
    float _1819 = fma(_1607, _1793, _1795);
    float _1821 = fma(_1603, _1793, _1797);
    float _1823 = fma(_832, _1623, _1789);
    float _1825 = _1288 * _1663;
    float _1827 = fma(_1454, _1799, _1819);
    float _1829 = fma(_1446, _1799, _1821);
    float _1831 = fma(_834, _1585, _1823);
    float _1833 = _1663;
    float _1835 = _1623;
    if (!_1611)
    {
        float _1837 = floor(_1404);
        _1833 = _1837;
    }
    float _1839 = _1833;
    float _1841 = _834 + _1827;
    float _1843 = _832 + _1829;
    int _1845 = _1572 + 80;
    uint _1847 = uint(int(uint(_1845) >> uint(2)));
    uint _1849 = uint(int(uint(int(_1847)) >> uint(2)));
    int _1851 = int(_1847) & 3;
    float _1853 = (*spvDescriptorSet0.vp_c15)._m0[int(_1849)][_1851];
    int _1855 = int(_1847) + 1;
    uint _1857 = uint(int(uint(_1855) >> uint(2)));
    int _1859 = _1855 & 3;
    float _1861 = (*spvDescriptorSet0.vp_c15)._m0[int(_1857)][_1859];
    float _1863 = _1831 + _1593;
    float _1865 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1867 = _1841 + _1865;
    float _1869 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1871 = _1843 + _1869;
    float _1873 = fma(_832, _1655, _1825);
    float _1875 = _1867 * _1867;
    float _1877 = 1.0 / _1863;
    float _1879 = fma(_1871, _1871, _1875);
    float _1881 = _1446 * _1607;
    float _1883 = sqrt(_1879);
    float _1885 = -_1881;
    float _1887 = fma(_1454, _1603, _1885);
    float _1889 = _1887 * _1787;
    float _1891 = fma(_1605, _1793, _1889);
    float _1893 = _1288 * _1781;
    bool _1895 = _1883 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1897 = fma(_832, _1773, _1893);
    float _1899 = fma(_1466, _1799, _1891);
    int _1901 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1903 = _1901 != 0;
    int _1905 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1907 = _1905 != 0;
    float _1909 = fma(_834, _1737, _1897);
    float _1911 = fma(_834, _1809, _1873);
    float _1913 = _1909 + _1745;
    int _1915 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1917 = _1915 != 0;
    int _1919 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1921 = _1919 != 0;
    float _1923 = _1142 + _1899;
    bool _1925 = !_1907;
    int _1927 = _1925 ? 0 : 1;
    float _1929 = _1911 + _1817;
    bool _1931 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1933 = isnan(0.5);
    bool _1935 = _1931 || _1933;
    bool _1937 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1939 = _1935 || _1937;
    bool _1941 = !_1903;
    int _1943 = _1941 ? 0 : 1;
    bool _1945 = !_1917;
    int _1947 = _1945 ? 0 : 1;
    bool _1949 = !_1921;
    int _1951 = _1949 ? 0 : 1;
    float _1953 = _1899;
    float _1955 = _1897;
    float _1957 = _1871;
    float _1959 = _1873;
    if (!_1895)
    {
        _1953 = _1843;
    }
    float _1961 = _1953;
    float _1963 = _1961;
    if (!_1895)
    {
        _1835 = _1841;
    }
    float _1965 = _1835;
    float _1967 = _1965;
    if (!_1895)
    {
        _1955 = _1923;
    }
    float _1969 = _1955;
    bool _1971 = !_1895;
    float _1973 = _1969;
    float _1975 = _1861;
    if (!_1971)
    {
        float _1977 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1979 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1981 = _1883 + _1979;
        float _1983 = _1923 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1985 = rsqrt(_1879);
        float _1987 = _1981 * _1977;
        float _1989 = _1987 * 0.15915493667125701904296875;
        float _1991 = _1989 * 6.283185482025146484375;
        float _1993 = cos(_1991);
        float _1995 = _1989 * 6.283185482025146484375;
        float _1997 = sin(_1995);
        float _1999 = _1993 + (-1.0);
        float _2001 = _1999 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2003 = fma(_1997, _1983, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2005 = fma(_1923, _1993, _2001);
        float _2007 = _1985 * _2003;
        float _2009 = fma(_1871, _2007, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2011 = fma(_1867, _2007, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1967 = _2011;
        _1963 = _2009;
        _1973 = _2005;
    }
    float _2013 = _1967;
    float _2015 = _1963;
    float _2017 = _1973;
    float _2019 = _1929 * _1877;
    float _2021 = _2017;
    float _2023 = _2015;
    if (_1939)
    {
        _1957 = _2013;
    }
    float _2025 = _1957;
    float _2027 = _2025;
    if (!_1939)
    {
        float _2029 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2031 = _1142 + _2029;
        float _2033 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2035 = _832 + _2033;
        float _2037 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2039 = -_832;
        float _2041 = _2039 + _2015;
        float _2043 = _2031 * _2031;
        float _2045 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2047 = _834 + _2045;
        float _2049 = -_834;
        float _2051 = _2049 + _2013;
        float _2053 = fma(_2035, _2035, _2043);
        float _2055 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2057 = fma(_2047, _2047, _2053);
        float _2059 = sqrt(_2057);
        float _2061 = _2037 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2063 = precise::min(_2059, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2065 = _2063 * _2055;
        float _2067 = -_1142;
        float _2069 = _2067 + _2017;
        float _2071 = _2061 * _2065;
        float _2073 = fma(_2069, _2071, _1142);
        float _2075 = fma(_2041, _2071, _832);
        float _2077 = fma(_2051, _2071, _834);
        _2021 = _2073;
        _2023 = _2075;
        _2027 = _2077;
    }
    float _2079 = _2021;
    float _2081 = _2023;
    float _2083 = _2027;
    int _2085 = _1572 + 88;
    uint _2087 = uint(int(uint(_2085) >> uint(2)));
    uint _2089 = uint(int(uint(int(_2087)) >> uint(2)));
    int _2091 = int(_2087) & 3;
    float _2093 = (*spvDescriptorSet0.vp_c15)._m0[int(_2089)][_2091];
    int _2095 = int(_2087) + 1;
    uint _2097 = uint(int(uint(_2095) >> uint(2)));
    int _2099 = _2095 & 3;
    float _2101 = (*spvDescriptorSet0.vp_c15)._m0[int(_2097)][_2099];
    float _2103 = _2079 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2105 = _2079 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2107 = _2079 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    bool _2109 = _2019 >= 0.0;
    float _2111 = fma(_2081, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2103);
    float _2113 = fma(_2081, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2105);
    float _2115 = fma(_2081, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2107);
    float _2117 = _1879;
    if (!_1611)
    {
        int _2119 = _1717 + 400;
        uint _2121 = uint(int(uint(_2119) >> uint(2)));
        uint _2123 = uint(int(uint(int(_2121)) >> uint(2)));
        int _2125 = int(_2121) & 3;
        float _2127 = (*spvDescriptorSet0.vp_c15)._m0[int(_2123)][_2125];
        _2117 = _2127;
    }
    float _2129 = _2117;
    float _2131 = fma(_2083, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2111);
    float _2133 = _1913 * _1877;
    bool _2135 = _2019 <= 1.0;
    bool _2137 = _2135 && _2109;
    float _2139 = fma(_2083, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2113);
    float _2141 = fma(_2083, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2115);
    float _2143 = _2079 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2145 = _2131 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _2147 = _2133 >= 0.0;
    bool _2149 = _2147 && _2137;
    float _2151 = _2139 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2153 = _2141 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2155 = fma(_2081, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2143);
    float _2157 = _2145 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _2159 = _2133 <= 1.0;
    bool _2161 = _2159 && _2149;
    float _2163 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2165 = _2151 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2167 = fma(_2083, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2155);
    float _2169 = fma(_2153, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2157);
    float _2171 = _2145 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2173 = -_2165;
    float _2175 = fma(_2173, _2163, 1.0);
    float _2177 = _2167 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2179 = fma(_2151, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2169);
    float _2181 = _1288 * _1861;
    float _2183 = _2169;
    if (!_1611)
    {
        float _2185 = floor(_1478);
        _1959 = _2185;
    }
    float _2187 = _1959;
    float _2189 = fma(_2153, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2171);
    float _2191 = fma(_2177, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2179);
    float _2193 = _2191;
    if (_2161)
    {
        float _2195 = float(_1556);
        _2183 = _2195;
    }
    float _2197 = _2183;
    float _2199 = _2145 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2201 = fma(_832, _1853, _2181);
    if (!_1611)
    {
        float _2203 = -_1839;
        float _2205 = _1404 + _2203;
        _1975 = _2205;
    }
    float _2207 = _1975;
    float _2209 = log2(_2175);
    float _2211 = fma(_2153, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2199);
    float _2213 = fma(_2151, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2189);
    float _2215 = fma(_2151, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2211);
    float _2217 = fma(_2177, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2213);
    float _2219 = 1.0 / _2191;
    float _2221 = fma(_834, _2093, _2201);
    float _2223 = fma(_2177, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2215);
    float _2225 = _2221 + _2101;
    float _2227 = _2197;
    if (_2161)
    {
        float _2229 = rint(_2197);
        float _2231 = precise::max(_2229, 0.0);
        uint _2233 = uint(_2231);
        uint _2235 = clamp(_2233, 0u, 65535u);
        _2227 = as_type<float>(_2235);
    }
    float _2237 = _2227;
    float _2239 = _2209 * 0.693147182464599609375;
    float _2241 = _2225 * _1877;
    float _2243 = _2239 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2245 = _2239;
    if (!_1611)
    {
        float _2247 = -_2187;
        float _2249 = _1478 + _2247;
        _2245 = _2249;
    }
    float _2251 = _2245;
    float _2253 = _2201;
    if (!_1611)
    {
        float _2255 = rint(_2129);
        float _2257 = precise::max(_2255, 0.0);
        uint _2259 = uint(_2257);
        uint _2261 = clamp(_2259, 0u, 65535u);
        _2253 = as_type<float>(_2261);
    }
    float _2263 = _2253;
    float _2265 = _2217 * _2219;
    float _2267 = _2223 * _2219;
    float _2269 = fma(_2265, 0.5, 0.5);
    float _2271 = fma(_2267, -0.5, 0.5);
    float _2273 = _2265;
    if (_2161)
    {
        float3 _9159 = float3(_2019, _2133, float(as_type<int>(_2237)));
        float3 _9163 = select(_9159, float3(0.0), isnan(_9159));
        float _2275 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _9163.xy, uint(rint(_9163.z)), _2241, level(0.0));
        _2273 = _2275;
    }
    float _2277 = _2273;
    float3 _9173 = float3(_2269, _2271, _2243);
    float _2279 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9173, float3(0.0), isnan(_9173)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9173, float3(0.0), isnan(_9173)), level(0.0)).x;
    float3 _9182 = float3(_2269, _2271, _2243);
    float4 _2282 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9182, float3(0.0), isnan(_9182)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9182, float3(0.0), isnan(_9182)), level(0.0)).xyzw;
    float _2284 = _2282.x;
    float _2286 = _2282.y;
    float _2288 = _2282.z;
    float _2290 = _2282.w;
    float _2292 = _2251;
    float _2294 = _2263;
    if (!_1611)
    {
        float3 _9206 = float3(_2207, _2251, float(as_type<int>(_2263)));
        float3 _9208 = select(_9206, float3(0.0), isnan(_9206));
        float _2296 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _9208.xy, uint(rint(_9208.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _9208.xy, uint(rint(_9208.z)), level(0.0)).x;
        _2292 = _2296;
    }
    float _2298 = _2292;
    float _2300 = float(uint(_1034));
    float _2302 = trunc(_1342);
    int _2304 = int(_2302);
    int _2306 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2308 = _2306 != 0;
    float _2310 = _1362 * _1084;
    int _2312 = abs(_1146);
    int _2314 = abs(_1176);
    int _2316 = abs(_1947);
    float _2318 = 1.0 / _2300;
    float _2320 = float(uint(_2304));
    float _2322 = trunc(_2310);
    int _2324 = int(_2322);
    int _2326 = as_type<int>(_2318) + (-2);
    float _2328 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _2330 = int(_2328);
    float _2332 = as_type<float>(_2326) * _2320;
    float _2334 = trunc(_2332);
    float _2336 = precise::max(_2334, 0.0);
    uint _2338 = uint(_2336);
    int _2340 = ~_1034;
    int _2342 = _2340 + 1;
    float _2344 = trunc(_1060);
    int _2346 = int(_2344);
    int _2348 = _2342 * int(_2338);
    int _2350 = _2348 + _2304;
    if (_2308)
    {
        _2294 = 1.0;
    }
    float _2352 = _2294;
    float _2354 = _2352;
    if (!_2308)
    {
        _2354 = 7.345489978790283203125;
    }
    float _2356 = _2354;
    float _2358 = float(uint(_2350));
    int _2360 = ~_1034;
    int _2362 = _2360 + 1;
    float _2364 = _2356 * _854;
    float _2366 = float(_2304);
    float _2368 = as_type<float>(_2326) * _2358;
    int _2370 = ~_2330;
    int _2372 = _2370 + 1;
    bool _2374 = _2366 >= _1352;
    bool _2376 = isnan(_2366);
    bool _2378 = _2374 || _2376;
    bool _2380 = isnan(_1352);
    bool _2382 = _2378 || _2380;
    float _2384 = float(_2382);
    float _2386 = trunc(_2368);
    float _2388 = precise::max(_2386, 0.0);
    uint _2390 = uint(_2388);
    int _2392 = ~_2330;
    int _2394 = _2392 + 1;
    float _2396 = trunc(_2384);
    int _2398 = int(_2396);
    int _2400 = int(_2338) + int(_2390);
    float _2402 = floor(_2364);
    int _2404 = _2362 * _2400;
    int _2406 = _2404 + _2304;
    bool _2408 = uint(_2406) >= uint(_1034);
    bool _2410 = !_2408;
    int _2412 = _2410 ? 0 : (-1);
    bool _2414 = _1034 == 0;
    int _2416 = ~_2400;
    int _2418 = _2416 + _2412;
    int _2420 = _2418 + 1;
    float _2422 = -_2402;
    float _2424 = _2364 + _2422;
    int _2426 = _1034 + (-1);
    float _2428 = in.m_63.w;
    int _2430 = _1034 * _2420;
    int _2432 = _2430 + _2304;
    float _2434 = _2424 * _1352;
    int _2436 = ~_2398;
    int _2438 = _2436 + 1;
    int _2440 = _2438 + 1;
    bool _2442 = !_2414;
    int _2444 = _2442 ? _2432 : (-1);
    float _2446 = trunc(_2434);
    int _2448 = int(_2446);
    int _2450 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2452 = _2450 != 0;
    int _2454 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2456 = _2454 != 0;
    int _2458 = _2444 * _2440;
    bool _2460 = !_2452;
    int _2462 = _2460 ? 0 : 1;
    int _2464 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2466 = _2464 != 0;
    int _2468 = _2398 * _2426;
    int _2470 = _2468 + _2458;
    int _2472 = abs(_2462);
    int _2474 = abs(_1152);
    float _2476 = trunc(_1366);
    int _2478 = int(_2476);
    int _2480 = _2470 * _2312;
    bool _2482 = !_2466;
    int _2484 = _2482 ? 0 : 1;
    float _2486 = float(uint(_2346));
    int _2488 = _2448 * _2472;
    int _2490 = _2488 + _2304;
    int _2492 = abs(_2484);
    int _2494 = _2324 * _2474;
    int _2496 = _2494 + _2480;
    float _2498 = in.m_75.x;
    float _2500 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _2502 = int(_2500);
    int _2504 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2506 = _2504 != 0;
    int _2508 = _2490 * _2314;
    int _2510 = _2508 + _2496;
    bool _2512 = _2466;
    float _2514 = as_type<float>(_2372);
    if (_2456)
    {
        bool _2516 = _854 > 0.5;
        _2512 = _2516;
    }
    bool _2518 = _2512;
    float _2520 = float(uint(_2478));
    int _2522 = _2448 * _2492;
    int _2524 = _2522 + _2510;
    float _2526 = float(uint(_2330));
    float _2528 = 1.0 / _2526;
    float _2530 = float(uint(_2524));
    float _2532 = float(uint(_2502));
    float _2534 = as_type<float>(_2326) * _2530;
    int _2536 = ~_1034;
    int _2538 = _2536 + 1;
    float _2540 = trunc(_2534);
    float _2542 = precise::max(_2540, 0.0);
    uint _2544 = uint(_2542);
    int _2546 = _2538;
    if (!_2456)
    {
        _932 = _2498;
    }
    float _2548 = _932;
    float _2550 = _2548;
    if (_2506)
    {
        float _2552 = -_2498;
        float _2554 = _2552 + 1.0;
        _1388 = as_type<int>(_2554);
    }
    int _2556 = _1388;
    int _2558 = as_type<int>(_2528) + (-2);
    float _2560 = 1.0 / _2532;
    float _2562 = as_type<float>(_2558) * _2486;
    float _2564 = trunc(_2562);
    float _2566 = precise::max(_2564, 0.0);
    uint _2568 = uint(_2566);
    int _2570 = _2538 * int(_2544);
    int _2572 = _2570 + _2524;
    int _2574 = int(_2544);
    if (_2456)
    {
        float _2576 = -_2498;
        float _2578 = _2576 + 1.0;
        _2546 = as_type<int>(_2578);
    }
    int _2580 = _2546;
    float _2582 = float(uint(_2572));
    float _2584 = _2582;
    if (_2456)
    {
        float _2586 = _2518 ? as_type<float>(_2580) : _2498;
        _2550 = _2586;
    }
    float _2588 = _2550;
    float _2590 = as_type<float>(_2326) * _2582;
    int _2592 = as_type<int>(_2560) + (-2);
    bool _2594 = _870 > 0.5;
    float _2596 = trunc(_2590);
    float _2598 = precise::max(_2596, 0.0);
    uint _2600 = uint(_2598);
    int _2602 = _2372 * int(_2568);
    int _2604 = _2602 + _2346;
    float _2606 = as_type<float>(_2592) * _2520;
    int _2608 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2610 = _2608 != 0;
    float _2612 = as_type<float>(_2372);
    if (_2308)
    {
        _2584 = _854;
    }
    float _2614 = _2584;
    float _2616 = float(uint(_2604));
    float _2618 = trunc(_2606);
    float _2620 = precise::max(_2618, 0.0);
    uint _2622 = uint(_2620);
    float _2624 = _2614;
    if (_2308)
    {
        _2612 = 1.0;
    }
    float _2626 = _2612;
    float _2628 = _2626;
    if (!_2506)
    {
        _2514 = _2498;
    }
    float _2630 = _2514;
    float _2632 = as_type<float>(_2558) * _2616;
    float _2634 = _2630;
    if (!_2308)
    {
        _2624 = _860;
    }
    float _2636 = _2624;
    if (!_2308)
    {
        _2628 = 1.2345600128173828125;
    }
    float _2638 = _2628;
    if (_2506)
    {
        float _2640 = _2594 ? as_type<float>(_2556) : _2498;
        _2634 = _2640;
    }
    float _2642 = _2634;
    int _2644 = ~_2502;
    int _2646 = _2644 + 1;
    float _2648 = _2636 * _2638;
    int _2650 = int(_2544) + int(_2600);
    if (_2610)
    {
        float _2652 = -_2498;
        float _2654 = _2652 + 1.0;
        _2574 = as_type<int>(_2654);
    }
    int _2656 = _2574;
    float _2658 = floor(_2648);
    bool _2660 = _860 > 0.5;
    float _2662 = as_type<float>(_2656);
    if (!_2610)
    {
        _934 = _2498;
    }
    float _2664 = _934;
    int _2666 = _2646 * int(_2622);
    int _2668 = _2666 + _2478;
    int _2670 = ~_1034;
    int _2672 = _2670 + 1;
    float _2674 = _2664;
    if (_2610)
    {
        float _2676 = _2660 ? as_type<float>(_2656) : _2498;
        _2674 = _2676;
    }
    float _2678 = _2674;
    float _2680 = trunc(_2632);
    float _2682 = precise::max(_2680, 0.0);
    uint _2684 = uint(_2682);
    float _2686 = float(uint(_2668));
    int _2688 = _2672 * _2650;
    int _2690 = _2688 + _2524;
    if (_2308)
    {
        _2662 = 1.0;
    }
    float _2692 = _2662;
    float _2694 = _2692;
    if (!_2308)
    {
        _936 = _870;
    }
    float _2696 = _936;
    float _2698 = as_type<float>(_2592) * _2686;
    float _2700 = float(_2330);
    float _2702 = in.m_75.y;
    if (!_2308)
    {
        _2694 = 5.839270114898681640625;
    }
    float _2704 = _2694;
    float _2706 = trunc(_2698);
    float _2708 = precise::max(_2706, 0.0);
    uint _2710 = uint(_2708);
    bool _2712 = uint(_2690) >= uint(_1034);
    float _2714 = _2696 * _2704;
    int _2716 = int(_2568) + int(_2684);
    float _2718 = float(_2346);
    bool _2720 = !_2712;
    int _2722 = _2720 ? 0 : (-1);
    int _2724 = _2394 * _2716;
    int _2726 = _2724 + _2346;
    bool _2728 = _2718 >= _2700;
    bool _2730 = isnan(_2718);
    bool _2732 = _2728 || _2730;
    bool _2734 = isnan(_2700);
    bool _2736 = _2732 || _2734;
    float _2738 = float(_2736);
    float _2740 = floor(_2714);
    bool _2742 = _2428 > 0.5;
    float _2744 = -_2658;
    float _2746 = _2648 + _2744;
    bool _2748 = uint(_2726) >= uint(_2330);
    int _2750 = ~_2502;
    int _2752 = _2750 + 1;
    float _2754 = _2700 * _2746;
    bool _2756 = !_2748;
    int _2758 = _2756 ? 0 : (-1);
    float _2760 = trunc(_2738);
    int _2762 = int(_2760);
    int _2764 = int(_2622) + int(_2710);
    float _2766 = -_2702;
    float _2768 = _2766 + 1.0;
    int _2770 = ~_2716;
    int _2772 = _2770 + _2758;
    int _2774 = _2772 + 1;
    float _2776 = _2700 * _1148;
    int _2778 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2780 = _2778 != 0;
    int _2782 = _2330 * _2774;
    int _2784 = _2782 + _2346;
    int _2786 = _2660 ? as_type<int>(_2768) : as_type<int>(_2702);
    int _2788 = _2752 * _2764;
    int _2790 = _2788 + _2478;
    bool _2792 = _2330 == 0;
    float _2794 = trunc(_2776);
    int _2796 = int(_2794);
    float _2798 = _2780 ? as_type<float>(_2786) : _2702;
    float _2800 = -_2740;
    float _2802 = _2714 + _2800;
    int _2804 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2806 = _2804 != 0;
    int _2808 = ~_2762;
    int _2810 = _2808 + 1;
    int _2812 = _2810 + 1;
    bool _2814 = !_2792;
    int _2816 = _2814 ? _2784 : (-1);
    int _2818 = _2742 ? as_type<int>(_2768) : as_type<int>(_2702);
    bool _2820 = !_2806;
    int _2822 = _2820 ? 0 : 1;
    bool _2824 = uint(_2790) >= uint(_2502);
    int _2826 = _2812 * _2816;
    int _2828 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _2830 = _2828 != 0;
    float _2832 = trunc(_2754);
    int _2834 = int(_2832);
    int _2836 = _2330 + (-1);
    bool _2838 = !_2824;
    int _2840 = _2838 ? 0 : (-1);
    bool _2842 = !_2830;
    int _2844 = _2842 ? 0 : 1;
    int _2846 = _2762 * _2836;
    int _2848 = _2846 + _2826;
    int _2850 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _2852 = _2850 != 0;
    int _2854 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _2856 = _2854 != 0;
    float _2858 = float(_2502);
    float _2860 = float(_2478);
    int _2862 = abs(_1927);
    int _2864 = abs(_2822);
    int _2866 = abs(_1943);
    int _2868 = _2848 * _2862;
    bool _2870 = _2860 >= _2858;
    bool _2872 = isnan(_2860);
    bool _2874 = _2870 || _2872;
    bool _2876 = isnan(_2858);
    bool _2878 = _2874 || _2876;
    float _2880 = float(_2878);
    int _2882 = _2834 * _2864;
    int _2884 = _2882 + _2346;
    float _2886 = _2858 * _2802;
    int _2888 = abs(_1951);
    float _2890 = _2858 * _1148;
    float _2892 = trunc(_2880);
    int _2894 = int(_2892);
    int _2896 = _2796 * _2866;
    int _2898 = _2896 + _2868;
    int _2900 = ~_2764;
    int _2902 = _2900 + _2840;
    int _2904 = _2902 + 1;
    int _2906 = _2884 * _2316;
    int _2908 = _2906 + _2898;
    bool _2910 = !_2852;
    int _2912 = _2910 ? 0 : 1;
    int _2914 = _2502 * _2904;
    int _2916 = _2914 + _2478;
    bool _2918 = _2502 == 0;
    int _2920 = _2834 * _2888;
    int _2922 = _2920 + _2908;
    float _2924 = trunc(_2886);
    int _2926 = int(_2924);
    int _2928 = abs(_2844);
    bool _2930 = !_2918;
    int _2932 = _2930 ? _2916 : (-1);
    float _2934 = float(uint(_2922));
    int _2936 = ~_2894;
    int _2938 = _2936 + 1;
    int _2940 = _2938 + 1;
    float _2942 = trunc(_2890);
    int _2944 = int(_2942);
    int _2946 = _2502 + (-1);
    int _2948 = ~_2650;
    int _2950 = _2948 + _2722;
    int _2952 = _2950 + 1;
    int _2954 = _2940 * _2932;
    int _2956 = abs(_1182);
    float _2958 = as_type<float>(_2558) * _2934;
    int _2960 = _2894 * _2946;
    int _2962 = _2960 + _2954;
    int _2964 = abs(_1188);
    int _2966 = _2926 * _2928;
    int _2968 = _2966 + _2478;
    int _2970 = _1034 * _2952;
    int _2972 = _2970 + _2524;
    float _2974 = trunc(_2958);
    float _2976 = precise::max(_2974, 0.0);
    uint _2978 = uint(_2976);
    int _2980 = abs(_2912);
    int _2982 = _2962 * _2956;
    float _2984 = float(uint(_2490));
    bool _2986 = !_2856;
    int _2988 = _2986 ? 0 : 1;
    int _2990 = _2944 * _2964;
    int _2992 = _2990 + _2982;
    int _2994 = ~_2330;
    int _2996 = _2994 + 1;
    float _2998 = as_type<float>(_2326) * _2984;
    int _3000 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _3002 = _3000 != 0;
    int _3004 = _2968 * _2980;
    int _3006 = _3004 + _2992;
    int _3008 = abs(_2988);
    float _3010 = _3002 ? as_type<float>(_2818) : _2702;
    float _3012 = trunc(_2998);
    float _3014 = precise::max(_3012, 0.0);
    uint _3016 = uint(_3014);
    int _3018 = _2996 * int(_2978);
    int _3020 = _3018 + _2922;
    int _3022 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _3024 = _3022 != 0;
    float _3026 = float(uint(_3020));
    int _3028 = _2926 * _3008;
    int _3030 = _3028 + _3006;
    int _3032 = ~_1034;
    int _3034 = _3032 + 1;
    bool _3036 = !_2414;
    int _3038 = _3036 ? _2972 : (-1);
    float _3040 = as_type<float>(_2558) * _3026;
    float _3042 = float(uint(_3030));
    float _3044 = trunc(_3040);
    float _3046 = precise::max(_3044, 0.0);
    uint _3048 = uint(_3046);
    int _3050 = ~_2502;
    int _3052 = _3050 + 1;
    int _3054 = _3034 * int(_3016);
    int _3056 = _3054 + _2490;
    float _3058 = _2702;
    float _3060 = as_type<float>(_2862);
    if (_3024)
    {
        float _3062 = _2594 ? _2768 : _2702;
        _3058 = _3062;
    }
    float _3064 = _3058;
    float _3066 = as_type<float>(_2592) * _3042;
    int _3068 = _3038 & 3;
    bool _3070 = _3068 != 0;
    int _3072 = _3038 & 3;
    bool _3074 = _3072 != 0;
    float _3076 = trunc(_3066);
    float _3078 = precise::max(_3076, 0.0);
    uint _3080 = uint(_3078);
    float _3082 = float(uint(_3056));
    int _3084 = _3070 ? 0 : 1;
    bool _3086 = uint(_3072) > 1u;
    float _3088 = as_type<float>(_2326) * _3082;
    float _3090 = float(uint(_2884));
    int _3092 = ~_3084;
    int _3094 = _3092 + 1;
    int _3096 = _3094 + 1;
    int _3098 = int(_2978) + int(_3048);
    float _3100 = trunc(_3088);
    float _3102 = precise::max(_3100, 0.0);
    uint _3104 = uint(_3102);
    float _3106 = as_type<float>(_2558) * _3090;
    int _3108 = ~_2330;
    int _3110 = _3108 + 1;
    int _3112 = _3052 * int(_3080);
    int _3114 = _3112 + _3030;
    int _3116 = ~_2330;
    int _3118 = _3116 + 1;
    int _3120 = _3096;
    float _3122 = as_type<float>(_3098);
    if (!_3086)
    {
        int _3124 = ~_3084;
        int _3126 = _3124 + 1;
        _3120 = _3126;
    }
    int _3128 = _3120;
    float _3130 = trunc(_3106);
    float _3132 = precise::max(_3130, 0.0);
    uint _3134 = uint(_3132);
    bool _3136 = uint(_3072) >= 2u;
    float _3138 = float(uint(_3114));
    int _3140 = _3136 ? 0 : 1;
    bool _3142 = _3072 != 3;
    float _3144 = as_type<float>(_2592) * _3138;
    int _3146 = int(_3016) + int(_3104);
    int _3148 = _3118 * _3098;
    int _3150 = _3148 + _2922;
    float _3152 = trunc(_3144);
    float _3154 = precise::max(_3152, 0.0);
    uint _3156 = uint(_3154);
    int _3158 = ~_3140;
    int _3160 = _3158 + 1;
    int _3162 = _3160 + 1;
    int _3164 = ~_1034;
    int _3166 = _3164 + 1;
    int _3168 = _3110 * int(_3134);
    int _3170 = _3168 + _2884;
    int _3172 = _3162;
    if (_3142)
    {
        int _3174 = ~_3140;
        int _3176 = _3174 + 1;
        _3172 = _3176;
    }
    int _3178 = _3172;
    bool _3180 = uint(_3150) >= uint(_2330);
    int _3182 = _3166 * _3146;
    int _3184 = _3182 + _2490;
    float _3186 = float(uint(_3170));
    bool _3188 = !_3180;
    int _3190 = _3188 ? 0 : (-1);
    bool _3192 = uint(_3184) >= uint(_1034);
    float _3194 = as_type<float>(_2558) * _3186;
    int _3196 = ~_3098;
    int _3198 = _3196 + _3190;
    int _3200 = _3198 + 1;
    int _3202 = int(_3080) + int(_3156);
    if (_1611)
    {
        _3122 = 1.0;
    }
    float _3204 = _3122;
    int _3206 = _2330 * _3200;
    int _3208 = _3206 + _2922;
    float _3210 = _3204;
    if (!_1611)
    {
        int _3212 = _1675 << 4;
        int _3214 = _3212 + 2048;
        uint _3216 = uint(int(uint(_3214) >> uint(2)));
        uint _3218 = uint(int(uint(int(_3216)) >> uint(2)));
        int _3220 = int(_3216) & 3;
        float _3222 = (*spvDescriptorSet0.vp_c15)._m0[int(_3218)][_3220];
        int _3224 = int(_3216) + 1;
        uint _3226 = uint(int(uint(_3224) >> uint(2)));
        int _3228 = _3224 & 3;
        float _3230 = (*spvDescriptorSet0.vp_c15)._m0[int(_3226)][_3228];
        int _3232 = _3214 + 8;
        uint _3234 = uint(int(uint(_3232) >> uint(2)));
        uint _3236 = uint(int(uint(int(_3234)) >> uint(2)));
        int _3238 = int(_3234) & 3;
        float _3240 = (*spvDescriptorSet0.vp_c15)._m0[int(_3236)][_3238];
        int _3242 = int(_3234) + 1;
        uint _3244 = uint(int(uint(_3242) >> uint(2)));
        int _3246 = _3242 & 3;
        float _3248 = (*spvDescriptorSet0.vp_c15)._m0[int(_3244)][_3246];
        float _3250 = _1288 * _3230;
        float _3252 = fma(_832, _3222, _3250);
        float _3254 = fma(_834, _3240, _3252);
        float _3256 = _3254 + _3248;
        float _3258 = precise::clamp(_3256, 0.0, 1.0);
        float _3260 = -_3258;
        float _3262 = _3260 + _2298;
        float _3264 = fma(_3262, 500.0, 1.5);
        float _3266 = exp2(_3264);
        float _3268 = 0.0 + _3266;
        float _3270 = precise::clamp(_3268, 0.0, 1.0);
        _1390 = _3250;
        _1677 = as_type<float>(_3214);
        _3210 = _3270;
    }
    float _3272 = _1390;
    float _3274 = _1677;
    float _3276 = _3210;
    float _3278 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3280 = _2079 + _3278;
    float _3282 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3284 = _2081 + _3282;
    float _3286 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3288 = _2083 + _3286;
    bool _3290 = !_2792;
    int _3292 = _3290 ? _3208 : (-1);
    float _3294 = _3280 * _3280;
    bool _3296 = !_3192;
    int _3298 = _3296 ? 0 : (-1);
    float _3300 = fma(_3284, _3284, _3294);
    float _3302 = fma(_3288, _3288, _3300);
    float _3304 = rsqrt(_3302);
    float _3306 = sqrt(_3302);
    float _3308 = _3304 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3310 = _3284 * _3308;
    float _3312 = _3288 * _3308;
    float _3314 = _3310 * _3310;
    float _3316 = _3312 * _3312;
    float _3318 = _3314 + _3316;
    float _3320 = sqrt(_3318);
    bool _3322 = _3320 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3324 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3326 = _3320 + _3324;
    float _3328 = _3304;
    float _3330 = _3272;
    float _3332 = _3326;
    float _3334 = _3280;
    float _3336 = _3274;
    if (_3322)
    {
        float _3338 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3328 = _3338;
    }
    float _3340 = _3328;
    if (_3322)
    {
        float _3342 = rsqrt(_3318);
        _3330 = _3342;
    }
    float _3344 = _3330;
    float _3346 = _3344;
    if (_3322)
    {
        float _3348 = _3326 * _3340;
        _3332 = _3348;
    }
    float _3350 = _3332;
    bool _3352 = !_3074;
    int _3354 = _3352 ? 0 : 1;
    if (_3322)
    {
        float _3356 = _3350 * 0.15915493667125701904296875;
        _938 = _3356;
    }
    float _3358 = _938;
    float _3360 = _3288;
    if (_3322)
    {
        float _3362 = _3358 * 6.283185482025146484375;
        float _3364 = sin(_3362);
        _3360 = _3364;
    }
    float _3366 = _3360;
    float _3368 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3370 = precise::max(0.0, _3368);
    float _3372 = _3340;
    float _3374 = _3370;
    if (_3322)
    {
        float _3376 = _3358 * 6.283185482025146484375;
        float _3378 = cos(_3376);
        _3372 = _3378;
    }
    float _3380 = _3372;
    float _3382 = -_3308;
    float _3384 = -_3370;
    float _3386 = fma(_3280, _3382, _3384);
    if (_3322)
    {
        float _3388 = _3386 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3334 = _3388;
    }
    float _3390 = _3334;
    float _3392 = _3390;
    float _3394 = _3366;
    if (_3322)
    {
        float _3396 = fma(_3366, _3390, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3392 = _3396;
    }
    float _3398 = _3392;
    float _3400 = _3398;
    if (!_3322)
    {
        _3394 = _3310;
    }
    float _3402 = _3394;
    float _3404 = _3402;
    float _3406 = _3380;
    if (_3322)
    {
        float _3408 = _3380 + (-1.0);
        _3374 = _3408;
    }
    float _3410 = _3374;
    float _3412 = _3410;
    if (_3322)
    {
        float _3414 = _3344 * _3398;
        _3060 = _3414;
    }
    float _3416 = _3060;
    if (!_3322)
    {
        _3400 = _3386;
    }
    float _3418 = _3400;
    float _3420 = _3418;
    if (_3322)
    {
        float _3422 = _3410 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3336 = _3422;
    }
    float _3424 = _3336;
    if (_3322)
    {
        float _3426 = _3310 * _3416;
        _3404 = _3426;
    }
    float _3428 = _3404;
    if (!_3322)
    {
        _3412 = _3312;
    }
    float _3430 = _3412;
    float _3432 = _3430;
    if (_3322)
    {
        float _3434 = _3312 * _3416;
        _3432 = _3434;
    }
    float _3436 = _3432;
    if (!_3322)
    {
        _3346 = _3314;
    }
    float _3438 = _3346;
    float _3440 = _3438;
    if (_3322)
    {
        float _3442 = fma(_3386, _3380, _3424);
        _3420 = _3442;
    }
    float _3444 = _3420;
    if (_3322)
    {
        float _3446 = _3428 * _3428;
        _3440 = _3446;
    }
    float _3448 = _3440;
    if (!_3322)
    {
        _3406 = _3316;
    }
    float _3450 = _3406;
    float _3452 = _3450;
    if (_3322)
    {
        float _3454 = _3436 * _3436;
        _3452 = _3454;
    }
    float _3456 = _3452;
    float _3458 = fma(_3444, _3444, _3448);
    int _3460 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _3462 = _3460 != 0;
    float _3464 = _3458 + _3456;
    float _3466 = rsqrt(_3464);
    float _3468 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3470 = fma(_3306, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3468);
    float _3472 = precise::clamp(_3470, 0.0, 1.0);
    float _3474 = -_3472;
    float _3476 = _3474 + 1.0;
    float _3478 = abs(_3476);
    float _3480 = log2(_3478);
    float _3482 = _3466 * _3428;
    float _3484 = _3466 * _3444;
    float _3486 = _3466 * _3436;
    float _3488 = _3482 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3490 = -_3488;
    float _3492 = fma(_3484, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3490);
    float _3494 = _3480 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3496 = -_3486;
    float _3498 = fma(_3496, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3492);
    float _3500 = exp2(_3494);
    float _3502 = fma(_3498, -0.5, 0.5);
    float _3504 = fma(_3498, 0.5, 0.5);
    float _3506 = fma(_3504, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3508 = sqrt(_3502);
    float _3510 = fma(_3504, _3506, -0.212114393711090087890625);
    float _3512 = fma(_3504, _3510, 1.570728778839111328125);
    float _3514 = _3484 + 1.0;
    float _3516 = -_3484;
    float _3518 = fma(_3500, _3514, _3516);
    int _3520 = _3292 & 3;
    bool _3522 = _3520 != 0;
    float _3524 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _3526 = _3524 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _3528 = !_3462;
    int _3530 = _3528 ? 0 : 1;
    float _3532 = fma(_3518, 0.5, 0.5);
    float _3534 = _3508 * 0.636619746685028076171875;
    int _3536 = ~_2502;
    int _3538 = _3536 + 1;
    bool _3540 = _3520 != 3;
    float _3542 = -_3512;
    float _3544 = fma(_3534, _3542, 1.0);
    bool _3546 = uint(_3520) >= 2u;
    int _3548 = _3538 * _3202;
    int _3550 = _3548 + _3030;
    float _3552 = 1.0 / _3526;
    int _3554 = _3546 ? 0 : 1;
    float2 _10978 = float2(_3544, _3532);
    float3 _3558 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_10978, float2(0.0), isnan(_10978)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_10978, float2(0.0), isnan(_10978)), level(0.0)).xyz;
    float _3560 = _3558.x;
    float _3562 = _3558.y;
    float _3564 = _3558.z;
    bool _3566 = uint(_3550) >= uint(_2502);
    float _3568 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _3570 = _3568 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    int _3572 = _3522 ? 0 : 1;
    float _3574 = trunc(_3194);
    float _3576 = precise::max(_3574, 0.0);
    uint _3578 = uint(_3576);
    bool _3580 = _3072 != 3;
    float _3582 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _3584 = _812 + _3582;
    int _3586 = ~_3554;
    int _3588 = _3586 + 1;
    int _3590 = _3588 + 1;
    float _3592 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _3594 = _812 + _3592;
    int _3596 = _3590;
    if (_3540)
    {
        int _3598 = ~_3554;
        int _3600 = _3598 + 1;
        _3596 = _3600;
    }
    int _3602 = _3596;
    float _3604 = _3480 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _3606 = !_3580;
    int _3608 = _3606 ? 0 : (-1);
    float _3610 = 1.0 / _3570;
    bool _3612 = _3520 != 3;
    float _3614 = -_852;
    float _3616 = _3614 + 1.0;
    bool _3618 = uint(_3520) > 1u;
    out.m_77.x = _2081;
    out.m_77.y = _2079;
    out.m_77.z = _2083;
    bool _3620 = !_3612;
    int _3622 = _3620 ? 0 : (-1);
    bool _3624 = !_3566;
    int _3626 = _3624 ? 0 : (-1);
    float _3628 = exp2(_3604);
    int _3630 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _3632 = _3630 != 0;
    int _3634 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _3636 = _3634 != 0;
    float _3638 = float(uint(_2968));
    int _3640 = int(_3134) + int(_3578);
    int _3642 = ~_2330;
    int _3644 = _3642 + 1;
    float _3646 = as_type<float>(_2592) * _3638;
    int _3648 = ~_3202;
    int _3650 = _3648 + _3626;
    int _3652 = _3650 + 1;
    int _3654 = ~_3572;
    int _3656 = _3654 + 1;
    int _3658 = _3656 + 1;
    int _3660 = _3644 * _3640;
    int _3662 = _3660 + _2884;
    int _3664 = _3658;
    if (!_3618)
    {
        int _3666 = ~_3572;
        int _3668 = _3666 + 1;
        _3664 = _3668;
    }
    int _3670 = _3664;
    int _3672 = _2502 * _3652;
    int _3674 = _3672 + _3030;
    int _3676 = _3292 & 3;
    bool _3678 = _3676 != 0;
    float _3680 = trunc(_3646);
    float _3682 = precise::max(_3680, 0.0);
    uint _3684 = uint(_3682);
    float _3686 = -_3628;
    float _3688 = _3686 + 1.0;
    bool _3690 = !_3678;
    int _3692 = _3690 ? 0 : 1;
    bool _3694 = uint(_3662) >= uint(_2330);
    float _3696 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _3698 = _3696 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _3700 = !_2918;
    int _3702 = _3700 ? _3674 : (-1);
    float _3704 = _3688 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _3706 = !_3694;
    int _3708 = _3706 ? 0 : (-1);
    int _3710 = _3702 & 3;
    bool _3712 = _3710 != 0;
    float _3714 = 1.0 / _3698;
    int _3716 = ~_2502;
    int _3718 = _3716 + 1;
    float _3720 = _3704 * _2279;
    int _3722 = _3712 ? 0 : 1;
    bool _3724 = uint(_3710) >= 2u;
    int _3726 = _3718 * int(_3684);
    int _3728 = _3726 + _2968;
    int _3730 = _3724 ? 0 : 1;
    float _3732 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _3734 = _3732 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _3736 = _3710 != 3;
    float _3738 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _3740 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _3738;
    float _3742 = _3740 * _3552;
    float _3744 = float(uint(_3728));
    float _3746 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _3748 = _3746 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _3750 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _3752 = _3750 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _3754 = 1.0 / _3734;
    float _3756 = as_type<float>(_2592) * _3744;
    float _3758 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _3760 = _3758 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _3762 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _3764 = _812 + _3762;
    float _3766 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _3768 = _3766 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    bool _3770 = _812 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _3772 = isnan(_812);
    bool _3774 = _3770 || _3772;
    bool _3776 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _3778 = _3774 || _3776;
    float _3780 = float(_3778);
    float _3782 = 1.0 / _3748;
    float _3784 = _3768 * _3714;
    bool _3786 = _812 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _3788 = isnan(_812);
    bool _3790 = _3786 || _3788;
    bool _3792 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _3794 = _3790 || _3792;
    float _3796 = float(_3794);
    float _3798 = -_3780;
    float _3800 = _3798 + 1.0;
    int _3802 = ~_3146;
    int _3804 = _3802 + _3298;
    int _3806 = _3804 + 1;
    float _3808 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _3810 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _3808;
    float _3812 = fma(_3784, _3584, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _3814 = trunc(_3756);
    float _3816 = precise::max(_3814, 0.0);
    uint _3818 = uint(_3816);
    float _3820 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _3822 = _3820 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    int _3824 = ~_3730;
    int _3826 = _3824 + 1;
    int _3828 = _3826 + 1;
    float _3830 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _3832 = _812 + _3830;
    int _3834 = _3828;
    if (_3736)
    {
        int _3836 = ~_3730;
        int _3838 = _3836 + 1;
        _3834 = _3838;
    }
    int _3840 = _3834;
    float _3842 = _3822 * _3610;
    bool _3844 = _3710 != 3;
    float _3846 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _3848 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _3846;
    float _3850 = 1.0 / _3760;
    float _3852 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _3854 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _3852;
    bool _3856 = !_3844;
    int _3858 = _3856 ? 0 : (-1);
    float _3860 = _3848 * _3754;
    bool _3862 = uint(_3710) > 1u;
    float _3864 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _3866 = _812 + _3864;
    float _3868 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _3870 = _3868 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _3872 = _3854 * _3782;
    int _3874 = int(_3684) + int(_3818);
    float _3876 = fma(_3742, _3866, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _3878 = _812 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _3880 = isnan(_812);
    bool _3882 = _3878 || _3880;
    bool _3884 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _3886 = _3882 || _3884;
    float _3888 = float(_3886);
    float _3890 = 1.0 / _3752;
    int _3892 = ~_3722;
    int _3894 = _3892 + 1;
    int _3896 = _3894 + 1;
    float _3898 = fma(_3842, _3764, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    int _3900 = ~_2502;
    int _3902 = _3900 + 1;
    float _3904 = _3888 * _3800;
    float _3906 = _3870 * _3850;
    int _3908 = _3896;
    float _3910 = _3906;
    float _3912 = _3872;
    float _3914 = _3898;
    if (!_3862)
    {
        int _3916 = ~_3722;
        int _3918 = _3916 + 1;
        _3908 = _3918;
    }
    int _3920 = _3908;
    float _3922 = -_3888;
    float _3924 = _3922 + 1.0;
    bool _3926 = _812 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _3928 = isnan(_812);
    bool _3930 = _3926 || _3928;
    bool _3932 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _3934 = _3930 || _3932;
    float _3936 = float(_3934);
    int _3938 = _3902 * _3874;
    int _3940 = _3938 + _2968;
    bool _3942 = _812 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _3944 = isnan(_812);
    bool _3946 = _3942 || _3944;
    bool _3948 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _3950 = _3946 || _3948;
    float _3952 = float(_3950);
    int _3954 = _1034 * _3806;
    int _3956 = _3954 + _2490;
    bool _3958 = _812 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _3960 = isnan(_812);
    bool _3962 = _3958 || _3960;
    bool _3964 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _3966 = _3962 || _3964;
    float _3968 = float(_3966);
    float _3970 = -_3936;
    float _3972 = _3970 + 1.0;
    float _3974 = _3936 * _3924;
    bool _3976 = _812 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _3978 = isnan(_812);
    bool _3980 = _3976 || _3978;
    bool _3982 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _3984 = _3980 || _3982;
    float _3986 = float(_3984);
    float _3988 = -_3952;
    float _3990 = _3988 + 1.0;
    float _3992 = _3952 * _3972;
    int _3994 = _3702 & 3;
    bool _3996 = _3994 != 0;
    float _3998 = -_3968;
    float _4000 = _3998 + 1.0;
    bool _4002 = _812 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _4004 = isnan(_812);
    bool _4006 = _4002 || _4004;
    bool _4008 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _4010 = _4006 || _4008;
    float _4012 = float(_4010);
    float _4014 = _3986 * _3990;
    float _4016 = -_3986;
    float _4018 = _4016 + 1.0;
    float _4020 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _4022 = _812 + _4020;
    bool _4024 = !_3996;
    int _4026 = _4024 ? 0 : 1;
    float _4028 = -_4012;
    float _4030 = _4028 + 1.0;
    bool _4032 = uint(_3940) >= uint(_2502);
    float _4034 = _3810 * _3890;
    float _4036 = _3968 * _4018;
    float _4038 = in.m_79.x;
    float _4040 = in.m_79.y;
    float _4042 = in.m_79.z;
    float _4044 = fma(_3860, _4022, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _4046 = _4012 * _4000;
    bool _4048 = !_4032;
    int _4050 = _4048 ? 0 : (-1);
    float _4052 = in.m_81.x;
    float _4054 = in.m_81.y;
    float _4056 = in.m_81.z;
    float _4058 = in.m_81.w;
    float _4060 = _3796 * _4030;
    bool _4062 = _1430 != 0.0;
    bool _4064 = isnan(_1430);
    bool _4066 = _4062 || _4064;
    bool _4068 = isnan(0.0);
    bool _4070 = _4066 || _4068;
    float _4072 = -_3796;
    float _4074 = _4072 + 1.0;
    float _4076 = fma(_3872, _3594, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _4078 = _3876 * _4060;
    bool _4080 = _1428 == 0.0;
    bool _4082 = !_4070;
    bool _4084 = _4080 && _4082;
    float _4086 = fma(_3906, _3832, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    int _4088 = ~_3874;
    int _4090 = _4088 + _4050;
    int _4092 = _4090 + 1;
    float _4094 = fma(_4074, (*spvDescriptorSet0.vp_c9)._m0[159].x, _4078);
    bool _4096 = _1432 == 0.0;
    bool _4098 = _4096 && _4084;
    float _4100 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _4102 = _812 + _4100;
    int _4104 = ~_3640;
    int _4106 = _4104 + _3708;
    int _4108 = _4106 + 1;
    float _4110 = abs(_1498);
    float _4112 = log2(_4110);
    float _4114 = fma(_3898, _4046, _4094);
    float _4116 = fma(_4034, _4102, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    int _4118 = _2502 * _4092;
    int _4120 = _4118 + _2968;
    int _4122 = abs(_3692);
    float _4124 = fma(_4044, _4036, _4114);
    int _4126 = _2330 * _4108;
    int _4128 = _4126 + _2884;
    int _4130 = abs(_3128);
    float _4132 = fma(_3812, _4014, _4124);
    if (_4098)
    {
        _3910 = _4040;
    }
    float _4134 = _3910;
    float _4136 = _4134;
    if (!_4098)
    {
        float _4138 = fma(_1430, (*spvDescriptorSet0.vp_c9)._m0[17].y, _4040);
        _4136 = _4138;
    }
    float _4140 = _4136;
    float _4142 = _4054 * _4042;
    if (_4098)
    {
        _3912 = _4038;
    }
    float _4144 = _3912;
    float _4146 = _4144;
    if (!_4098)
    {
        float _4148 = fma(_1428, (*spvDescriptorSet0.vp_c9)._m0[17].y, _4038);
        _4146 = _4148;
    }
    float _4150 = _4146;
    if (_4098)
    {
        _3914 = _4042;
    }
    float _4152 = _3914;
    float _4154 = _4056 * _4038;
    float _4156 = _4112 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _4158 = _4152;
    if (!_4098)
    {
        float _4160 = fma(_1432, (*spvDescriptorSet0.vp_c9)._m0[17].y, _4042);
        _4158 = _4160;
    }
    float _4162 = _4158;
    float _4164 = _4052 * _4040;
    float _4166 = fma(_4076, _3992, _4132);
    float _4168 = -_4142;
    float _4170 = fma(_4056, _4040, _4168);
    float _4172 = -_4154;
    float _4174 = fma(_4052, _4042, _4172);
    float _4176 = -_4164;
    float _4178 = fma(_4054, _4038, _4176);
    float _4180 = fma(_4086, _3974, _4166);
    float _4182 = _4170 * _4058;
    float _4184 = exp2(_4156);
    int _4186 = _3702 >> 31;
    float _4188 = _4174 * _4058;
    float _4190 = _4178 * _4058;
    int _4192 = _3038 >> 31;
    float _4194 = fma(_4116, _3904, _4180);
    int _4196 = _4186 & 3;
    float _4198 = _1747 * _1641;
    int _4200 = _4192 & 3;
    float _4202 = fma(_3780, (*spvDescriptorSet0.vp_c9)._m0[166].x, _4194);
    int _4204 = _3702 + _4196;
    float _4206 = _1747 * _1887;
    float _4208 = _1719 * _1887;
    int _4210 = _3038 + _4200;
    float _4212 = _1719 * _1641;
    int _4214 = _4204 >> 2;
    float _4216 = fma(_4184, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4218 = precise::clamp(_4216, 0.0, 1.0);
    float _4220 = _1755 * _1645;
    int _4222 = _3292 >> 31;
    float _4224 = _4218 * _4218;
    int _4226 = _4214 << 4;
    int _4228 = _4226 + 656;
    float _4230 = fma(_4218, -2.0, 3.0);
    int _4232 = _4210 >> 2;
    float _4234 = fma(_1723, _1605, _4206);
    int _4236 = _4222 & 3;
    uint _4238 = uint(int(uint(_4228) >> uint(2)));
    uint _4240 = uint(int(uint(int(_4238)) >> uint(2)));
    int _4242 = int(_4238) & 3;
    float _4244 = (*spvDescriptorSet0.vp_c9)._m0[int(_4240)][_4242];
    int _4246 = int(_4238) + 1;
    uint _4248 = uint(int(uint(_4246) >> uint(2)));
    int _4250 = _4246 & 3;
    float _4252 = (*spvDescriptorSet0.vp_c9)._m0[int(_4248)][_4250];
    int _4254 = _4232 << 4;
    int _4256 = _4254 + 368;
    float _4258 = _4224 * _4230;
    int _4260 = _3292 + _4236;
    float _4262 = _1747 * _1645;
    float _4264 = _1719 * _1645;
    float _4266 = _1755 * _1887;
    int _4268 = _4260 >> 2;
    uint _4270 = uint(int(uint(_4256) >> uint(2)));
    uint _4272 = uint(int(uint(int(_4270)) >> uint(2)));
    int _4274 = int(_4270) & 3;
    float _4276 = (*spvDescriptorSet0.vp_c9)._m0[int(_4272)][_4274];
    int _4278 = int(_4270) + 1;
    uint _4280 = uint(int(uint(_4278) >> uint(2)));
    int _4282 = _4278 & 3;
    float _4284 = (*spvDescriptorSet0.vp_c9)._m0[int(_4280)][_4282];
    float _4286 = _1755 * _1641;
    float _4288 = fma(_1723, _1603, _4262);
    int _4290 = _4268 << 4;
    int _4292 = _4290 + 512;
    float _4294 = fma(_1723, _1607, _4198);
    float _4296 = -_1707;
    float _4298 = fma(_4296, _1603, _4264);
    float _4300 = -_1707;
    float _4302 = fma(_4300, _1605, _4208);
    float _4304 = -_1707;
    float _4306 = fma(_4304, _1607, _4212);
    int _4308 = _4256 + 8;
    uint _4310 = uint(int(uint(_4308) >> uint(2)));
    uint _4312 = uint(int(uint(int(_4310)) >> uint(2)));
    int _4314 = int(_4310) & 3;
    float _4316 = (*spvDescriptorSet0.vp_c9)._m0[int(_4312)][_4314];
    int _4318 = int(_4310) + 1;
    uint _4320 = uint(int(uint(_4318) >> uint(2)));
    int _4322 = _4318 & 3;
    float _4324 = (*spvDescriptorSet0.vp_c9)._m0[int(_4320)][_4322];
    float _4326 = fma(_1725, _1603, _4220);
    float _4328 = fma(_1725, _1605, _4266);
    float _4330 = fma(_1725, _1607, _4286);
    int _4332 = abs(_3670);
    float _4334 = fma(_1721, _1446, _4298);
    int _4336 = abs(_3920);
    float _4338 = fma(_1721, _1466, _4302);
    uint _4340 = uint(int(uint(_4292) >> uint(2)));
    uint _4342 = uint(int(uint(int(_4340)) >> uint(2)));
    int _4344 = int(_4340) & 3;
    float _4346 = (*spvDescriptorSet0.vp_c9)._m0[int(_4342)][_4344];
    int _4348 = int(_4340) + 1;
    uint _4350 = uint(int(uint(_4348) >> uint(2)));
    int _4352 = _4348 & 3;
    float _4354 = (*spvDescriptorSet0.vp_c9)._m0[int(_4350)][_4352];
    int _4356 = ~_4130;
    int _4358 = _4356 + 1;
    int _4360 = _4358 + 1;
    float _4362 = fma(_1721, _1454, _4306);
    int _4364 = ~_4336;
    int _4366 = _4364 + 1;
    int _4368 = _4366 + 1;
    float _4370 = fma(_1751, _1466, _4234);
    int _4372 = abs(_3178);
    float _4374 = fma(_1757, _1466, _4328);
    int _4376 = ~_4332;
    int _4378 = _4376 + 1;
    int _4380 = _4378 + 1;
    int _4382 = _4292 + 8;
    uint _4384 = uint(int(uint(_4382) >> uint(2)));
    uint _4386 = uint(int(uint(int(_4384)) >> uint(2)));
    int _4388 = int(_4384) & 3;
    float _4390 = (*spvDescriptorSet0.vp_c9)._m0[int(_4386)][_4388];
    int _4392 = int(_4384) + 1;
    uint _4394 = uint(int(uint(_4392) >> uint(2)));
    int _4396 = _4392 & 3;
    float _4398 = (*spvDescriptorSet0.vp_c9)._m0[int(_4394)][_4396];
    int _4400 = ~_4372;
    int _4402 = _4400 + 1;
    int _4404 = _4402 + 1;
    float _4406 = fma(_1751, _1446, _4288);
    float _4408 = fma(_1751, _1454, _4294);
    int _4410 = abs(_3840);
    float _4412 = fma(_1757, _1454, _4330);
    int _4414 = ~_4122;
    int _4416 = _4414 + 1;
    int _4418 = _4416 + 1;
    int _4420 = _4228 + 8;
    uint _4422 = uint(int(uint(_4420) >> uint(2)));
    uint _4424 = uint(int(uint(int(_4422)) >> uint(2)));
    int _4426 = int(_4422) & 3;
    float _4428 = (*spvDescriptorSet0.vp_c9)._m0[int(_4424)][_4426];
    int _4430 = int(_4422) + 1;
    uint _4432 = uint(int(uint(_4430) >> uint(2)));
    int _4434 = _4430 & 3;
    float _4436 = (*spvDescriptorSet0.vp_c9)._m0[int(_4432)][_4434];
    int _4438 = ~_4410;
    int _4440 = _4438 + 1;
    int _4442 = _4440 + 1;
    float _4444 = fma(_1757, _1446, _4326);
    bool _4446 = !_2792;
    int _4448 = _4446 ? _4128 : (-1);
    out.m_83.x = _4202;
    bool _4450 = !_2918;
    int _4452 = _4450 ? _4120 : (-1);
    int _4454 = _4368 * as_type<int>(_4252);
    int _4456 = abs(_3354);
    float _4458 = _4338 * _4054;
    float _4460 = _4362 * _4054;
    int _4462 = ~_4456;
    int _4464 = _4462 + 1;
    int _4466 = _4464 + 1;
    int _4468 = _4360 * as_type<int>(_4284);
    float _4470 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _4472 = int(_4470);
    int _4474 = _4466 * as_type<int>(_4276);
    int _4476 = _4474 + _4468;
    int _4478 = abs(_3602);
    float _4480 = _4188 * _4338;
    int _4482 = abs(_3530);
    int _4484 = _4404 * as_type<int>(_4316);
    int _4486 = _4484 + _4476;
    int _4488 = ~_4478;
    int _4490 = _4488 + 1;
    int _4492 = _4490 + 1;
    float _4494 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _4496 = int(_4494);
    int _4498 = _4380 * as_type<int>(_4354);
    int _4500 = abs(_4026);
    float _4502 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _4504 = int(_4502);
    float _4506 = float(uint(_4472));
    int _4508 = _4418 * as_type<int>(_4346);
    int _4510 = _4508 + _4498;
    int _4512 = ~_4500;
    int _4514 = _4512 + 1;
    int _4516 = _4514 + 1;
    int _4518 = abs(_3608);
    int _4520 = _4492 * as_type<int>(_4390);
    int _4522 = _4520 + _4510;
    int _4524 = abs(_3858);
    int _4526 = _4516 * as_type<int>(_4244);
    int _4528 = _4526 + _4454;
    int _4530 = ~_4518;
    int _4532 = _4530 + 1;
    int _4534 = _4532 + 1;
    float _4536 = 1.0 / _4506;
    int _4538 = abs(_3622);
    float _4540 = _4334 * _4054;
    int _4542 = ~_4524;
    int _4544 = _4542 + 1;
    int _4546 = _4544 + 1;
    int _4548 = _4534 * as_type<int>(_4324);
    int _4550 = _4548 + _4486;
    int _4552 = ~_4538;
    int _4554 = _4552 + 1;
    int _4556 = _4554 + 1;
    int _4558 = _4442 * as_type<int>(_4428);
    int _4560 = _4558 + _4528;
    float _4562 = float(uint(_4496));
    float _4564 = _4338 * _4140;
    int _4566 = abs(_4472);
    int _4568 = _4556 * as_type<int>(_4398);
    int _4570 = _4568 + _4522;
    float _4572 = 1.0 / _4562;
    float _4574 = float(uint(_4504));
    int _4576 = _4546 * as_type<int>(_4436);
    int _4578 = _4576 + _4560;
    bool _4580 = !_3632;
    int _4582 = _4580 ? 0 : 1;
    int _4584 = ~_4482;
    int _4586 = _4584 + 1;
    int _4588 = _4586 + 1;
    float _4590 = float(uint(_4566));
    float _4592 = 1.0 / _4574;
    bool _4594 = !_3636;
    int _4596 = _4594 ? 0 : 1;
    int _4598 = _4550 * _4588;
    int _4600 = abs(_4582);
    int _4602 = abs(_4596);
    int _4604 = ~_4600;
    int _4606 = _4604 + 1;
    int _4608 = _4606 + 1;
    float _4610 = 1.0 / _4590;
    bool _4612 = !_2414;
    int _4614 = _4612 ? _3956 : (-1);
    int _4616 = abs(_4504);
    int _4618 = _4608 * _4570;
    int _4620 = ~_4496;
    int _4622 = _4620 + 1;
    int _4624 = _4614 * _4482;
    int _4626 = _4624 + _4598;
    int _4628 = abs(_4496);
    int _4630 = ~_4602;
    int _4632 = _4630 + 1;
    int _4634 = _4632 + 1;
    float _4636 = float(uint(_4616));
    int _4638 = as_type<int>(_4536) + (-2);
    int _4640 = _4634 * _4578;
    float _4642 = float(uint(_4626));
    int _4644 = _4448 * _4600;
    int _4646 = _4644 + _4618;
    int _4648 = as_type<int>(_4592) + (-2);
    int _4650 = _4452 * _4602;
    int _4652 = _4650 + _4640;
    float _4654 = 1.0 / _4636;
    float _4656 = float(uint(_4628));
    float _4658 = _4334 * _4140;
    float _4660 = float(uint(_4646));
    float _4662 = _4362 * _4140;
    float _4664 = float(uint(_4652));
    int _4666 = abs(_4626);
    float _4668 = as_type<float>(_4648) * _4660;
    int _4670 = as_type<int>(_4572) + (-2);
    float _4672 = as_type<float>(_4638) * _4642;
    float _4674 = 1.0 / _4656;
    int _4676 = as_type<int>(_4610) + (-2);
    float _4678 = as_type<float>(_4670) * _4664;
    int _4680 = abs(_4646);
    int _4682 = as_type<int>(_4654) + (-2);
    float _4684 = trunc(_4672);
    float _4686 = precise::max(_4684, 0.0);
    uint _4688 = uint(_4686);
    int _4690 = ~_4472;
    int _4692 = _4690 + 1;
    float _4694 = float(uint(_4680));
    float _4696 = float(uint(_4666));
    float _4698 = trunc(_4678);
    float _4700 = precise::max(_4698, 0.0);
    uint _4702 = uint(_4700);
    int _4704 = abs(_4652);
    float _4706 = as_type<float>(_4682) * _4694;
    int _4708 = as_type<int>(_4674) + (-2);
    float _4710 = as_type<float>(_4676) * _4696;
    float _4712 = float(uint(_4704));
    float _4714 = _4188 * _4334;
    int _4716 = ~_4504;
    int _4718 = _4716 + 1;
    float _4720 = trunc(_4668);
    float _4722 = precise::max(_4720, 0.0);
    uint _4724 = uint(_4722);
    int _4726 = _4692 * int(_4688);
    int _4728 = _4726 + _4626;
    float _4730 = _4188 * _4362;
    float _4732 = as_type<float>(_4708) * _4712;
    float _4734 = fma(_4408, _4052, _4460);
    float _4736 = float(uint(_4728));
    float _4738 = fma(_4406, _4052, _4540);
    float _4740 = trunc(_4710);
    float _4742 = precise::max(_4740, 0.0);
    uint _4744 = uint(_4742);
    int _4746 = _4622 * int(_4702);
    int _4748 = _4746 + _4652;
    int _4750 = ~_4566;
    int _4752 = _4750 + 1;
    float _4754 = as_type<float>(_4638) * _4736;
    float _4756 = float(uint(_4748));
    float _4758 = trunc(_4706);
    float _4760 = precise::max(_4758, 0.0);
    uint _4762 = uint(_4760);
    int _4764 = _4718 * int(_4724);
    int _4766 = _4764 + _4646;
    float _4768 = fma(_4370, _4052, _4458);
    float _4770 = as_type<float>(_4670) * _4756;
    int _4772 = ~_4628;
    int _4774 = _4772 + 1;
    float _4776 = fma(_4406, _4150, _4658);
    float _4778 = float(uint(_4766));
    float _4780 = trunc(_4732);
    float _4782 = precise::max(_4780, 0.0);
    uint _4784 = uint(_4782);
    int _4786 = _4752 * int(_4744);
    int _4788 = _4786 + _4666;
    int _4790 = ~_4616;
    int _4792 = _4790 + 1;
    float _4794 = as_type<float>(_4648) * _4778;
    float _4796 = fma(_4182, _4406, _4714);
    float _4798 = float(uint(_4788));
    float _4800 = fma(_4370, _4150, _4564);
    int _4802 = _4792 * int(_4762);
    int _4804 = _4802 + _4680;
    float _4806 = trunc(_4794);
    float _4808 = precise::max(_4806, 0.0);
    uint _4810 = uint(_4808);
    float _4812 = as_type<float>(_4676) * _4798;
    float _4814 = fma(_4182, _4370, _4480);
    float _4816 = float(uint(_4804));
    float _4818 = _3564 * _3720;
    float _4820 = fma(_4374, _4162, _4800);
    int _4822 = _4774 * int(_4784);
    int _4824 = _4822 + _4704;
    int _4826 = ~_4504;
    int _4828 = _4826 + 1;
    float _4830 = trunc(_4754);
    float _4832 = precise::max(_4830, 0.0);
    uint _4834 = uint(_4832);
    float _4836 = as_type<float>(_4682) * _4816;
    float _4838 = fma(_4408, _4150, _4662);
    float _4840 = float(uint(_4824));
    float _4842 = fma(_4182, _4408, _4730);
    float _4844 = fma(_4444, _4056, _4738);
    float _4846 = fma(_4374, _4056, _4768);
    float _4848 = fma(_4412, _4056, _4734);
    float _4850 = trunc(_4836);
    float _4852 = precise::max(_4850, 0.0);
    uint _4854 = uint(_4852);
    float _4856 = as_type<float>(_4708) * _4840;
    int _4858 = int(_4724) + int(_4810);
    int _4860 = ~_4472;
    int _4862 = _4860 + 1;
    out.m_85.x = _4844;
    out.m_85.y = _4846;
    out.m_85.z = _4848;
    float _4864 = trunc(_4812);
    float _4866 = precise::max(_4864, 0.0);
    uint _4868 = uint(_4866);
    int _4870 = int(_4688) + int(_4834);
    float _4872 = trunc(_4856);
    float _4874 = precise::max(_4872, 0.0);
    uint _4876 = uint(_4874);
    float _4878 = _2145 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _4880 = _4862 * _4870;
    int _4882 = _4880 + _4626;
    int _4884 = int(_4762) + int(_4854);
    int _4886 = _4828 * _4858;
    int _4888 = _4886 + _4646;
    float _4890 = fma(_2153, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4878);
    int _4892 = ~_4566;
    int _4894 = _4892 + 1;
    float _4896 = trunc(_4770);
    float _4898 = precise::max(_4896, 0.0);
    uint _4900 = uint(_4898);
    int _4902 = int(_4744) + int(_4868);
    float _4904 = fma(_2151, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4890);
    int _4906 = ~_4628;
    int _4908 = _4906 + 1;
    bool _4910 = uint(_4888) >= uint(_4504);
    int _4912 = _4894 * _4902;
    int _4914 = _4912 + _4666;
    int _4916 = ~_4496;
    int _4918 = _4916 + 1;
    float _4920 = fma(_2177, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4904);
    int _4922 = int(_4784) + int(_4876);
    float _4924 = _4920 + _2191;
    bool _4926 = uint(_4882) >= uint(_4472);
    int _4928 = ~_4616;
    int _4930 = _4928 + 1;
    int _4932 = _4908 * _4922;
    int _4934 = _4932 + _4704;
    int _4936 = int(_4702) + int(_4900);
    float _4938 = _4924 * 0.5;
    bool _4940 = uint(_4914) >= uint(_4566);
    int _4942 = _4930 * _4884;
    int _4944 = _4942 + _4680;
    bool _4946 = !_4926;
    int _4948 = _4946 ? 0 : (-1);
    int _4950 = _4918 * _4936;
    int _4952 = _4950 + _4652;
    bool _4954 = !_4910;
    int _4956 = _4954 ? 0 : (-1);
    float _4958 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _4960 = uint(_4934) >= uint(_4628);
    bool _4962 = uint(_4952) >= uint(_4496);
    int _4964 = ~_4870;
    int _4966 = _4964 + _4948;
    int _4968 = _4966 + 1;
    int _4970 = ~_4858;
    int _4972 = _4970 + _4956;
    int _4974 = _4972 + 1;
    float _4976 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _4978 = uint(_4944) >= uint(_4616);
    bool _4980 = !_4962;
    int _4982 = _4980 ? 0 : (-1);
    bool _4984 = _4472 == 0;
    bool _4986 = _4472 == 0;
    float _4988 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _4990 = _4626 ^ _4472;
    int _4992 = _4472 * _4968;
    int _4994 = _4992 + _4626;
    bool _4996 = !_4940;
    int _4998 = _4996 ? 0 : (-1);
    int _5000 = _4504 * _4974;
    int _5002 = _5000 + _4646;
    bool _5004 = _4504 == 0;
    int _5006 = ~_4936;
    int _5008 = _5006 + _4982;
    int _5010 = _5008 + 1;
    float _5012 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _5014 = !_5004;
    int _5016 = _5014 ? _5002 : (-1);
    bool _5018 = !_4984;
    int _5020 = _5018 ? _4994 : (-1);
    int _5022 = _4496 * _5010;
    int _5024 = _5022 + _4652;
    bool _5026 = _4496 == 0;
    bool _5028 = _4496 == 0;
    int _5030 = _4652 ^ _4496;
    float _5032 = _4976 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _5034 = float(_5016);
    bool _5036 = !_4978;
    int _5038 = _5036 ? 0 : (-1);
    float _5040 = fma(_5032, _2642, -0.5);
    int _5042 = _4646 ^ _4504;
    float _5044 = fma(_5032, _5034, _1380);
    uint _5046 = uint(int(uint(_4990) >> uint(31)));
    float _5048 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _5050 = _4504 == 0;
    float _5052 = _4958 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _5054 = float(_5020);
    float _5056 = fma(_1374, _5040, _5044);
    bool _5058 = !_4960;
    int _5060 = _5058 ? 0 : (-1);
    float _5062 = fma(_5052, _2588, -0.5);
    uint _5064 = uint(int(uint(_5030) >> uint(31)));
    float _5066 = fma(_5052, _5054, _952);
    bool _5068 = !_5026;
    int _5070 = _5068 ? _5024 : (-1);
    float _5072 = _5012 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _5074 = ~_4998;
    int _5076 = _4902 + _5074;
    int _5078 = _5076 + 1;
    float _5080 = fma(_1354, _5062, _5066);
    uint _5082 = uint(int(uint(_5042) >> uint(31)));
    float _5084 = fma(_5072, _2678, -0.5);
    int _5086 = ~int(_5046);
    int _5088 = _5086 + 1;
    float _5090 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _5092 = ~_5060;
    int _5094 = _4922 + _5092;
    int _5096 = _5094 + 1;
    float _5098 = _5080 + 0.5;
    int _5100 = ~int(_5064);
    int _5102 = _5100 + 1;
    float _5104 = float(_5070);
    int _5106 = ~_5038;
    int _5108 = _4884 + _5106;
    int _5110 = _5108 + 1;
    int _5112 = ~int(_5082);
    int _5114 = _5112 + 1;
    int _5116 = _5078 ^ _5088;
    int _5118 = _5096 ^ _5102;
    float _5120 = fma(_5072, _5104, _1096);
    int _5122 = _5110 ^ _5114;
    float _5124 = _4988 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _5126 = ~_5088;
    int _5128 = _5126 + _5116;
    int _5130 = _5128 + 1;
    float _5132 = fma(_1370, _5084, _5120);
    int _5134 = ~_5114;
    int _5136 = _5134 + _5122;
    int _5138 = _5136 + 1;
    bool _5140 = !_4986;
    int _5142 = _5140 ? _5130 : (-1);
    float _5144 = _5132 + 0.5;
    bool _5146 = !_5050;
    int _5148 = _5146 ? _5138 : (-1);
    float _5150 = float(_5142);
    float _5152 = float(_5148);
    float _5154 = fma(_2798, _5124, -0.5);
    bool _5156 = _1498 <= 8000.0;
    bool _5158 = isnan(_1498);
    bool _5160 = _5156 || _5158;
    bool _5162 = isnan(8000.0);
    bool _5164 = _5160 || _5162;
    float _5166 = float(_5164);
    float _5168 = -_924;
    float _5170 = fma(_5124, _5150, _5168);
    float _5172 = fma(_4190, _4374, _4814);
    int _5174 = ~_5102;
    int _5176 = _5174 + _5118;
    int _5178 = _5176 + 1;
    float _5180 = _5090 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _5182 = fma(_1358, _5154, _5170);
    float _5184 = fma(_4190, _4444, _4796);
    float _5186 = fma(_4190, _4412, _4842);
    float _5188 = -_4258;
    float _5190 = _5188 + 1.0;
    bool _5192 = !_5028;
    int _5194 = _5192 ? _5178 : (-1);
    float _5196 = _5048 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _5198 = _4924;
    float _5200 = _4920;
    if (!_2161)
    {
        _5198 = 1.0;
    }
    float _5202 = _5198;
    float _5204 = fma(_5190, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4258);
    out.m_87.x = _5184;
    out.m_87.y = _5172;
    out.m_87.z = _5186;
    float _5206 = float(_5194);
    float _5208 = fma(_3010, _5180, -0.5);
    float _5210 = _5166 * _5204;
    float _5212 = _5202;
    if (_2161)
    {
        bool _5214 = _2277 >= _2241;
        bool _5216 = isnan(_2277);
        bool _5218 = _5214 || _5216;
        bool _5220 = isnan(_2241);
        bool _5222 = _5218 || _5220;
        float _5224 = float(_5222);
        _5212 = _5224;
    }
    float _5226 = _5212;
    float _5228 = -_1382;
    float _5230 = fma(_5180, _5152, _5228);
    float _5232 = fma(_5196, _3064, -0.5);
    float _5234 = -_1384;
    float _5236 = fma(_5196, _5206, _5234);
    float _5238 = _5226 * _3276;
    float _5240 = fma(_1376, _5208, _5230);
    out.gl_Position.x = _2217;
    out.gl_Position.y = _2223;
    out.gl_Position.z = _4920;
    out.gl_Position.w = _2191;
    float _5242 = _5210 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _5244 = fma(_1372, _5232, _5236);
    float _5246 = fma(_4444, _4162, _4776);
    float _5248 = _5056 + 0.5;
    float _5250 = _3616 * _5242;
    float _5252 = precise::clamp(_5250, 0.0, 1.0);
    float _5254 = _5182 + 0.5;
    float _5256 = _5240 + 0.5;
    float _5258 = _5244 + 0.5;
    float _5260 = -_5252;
    float _5262 = fma(_5260, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _5264 = fma(_4412, _4162, _4838);
    float _5266 = fma(_2290, _4818, _2288);
    float _5268 = -_5238;
    float _5270 = fma(_5268, _5262, 1.0);
    float _5272 = precise::clamp(_5270, 0.0, 1.0);
    float _5274 = _2290 * _3720;
    float _5276 = -_3704;
    float _5278 = _5276 + 1.0;
    out.m_89.x = _5098;
    out.m_89.y = _5254;
    out.m_89.z = _5248;
    out.m_89.w = _5256;
    float _5280 = _5272 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _5282 = fma(_3560, _5274, _2284);
    float _5284 = fma(_3562, _5274, _2286);
    float _5286 = _2290 * _5278;
    out.m_91.x = _5144;
    out.m_91.y = _5258;
    bool _5288 = _3306 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _5290 = isnan(_3306);
    bool _5292 = _5288 || _5290;
    bool _5294 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _5296 = _5292 || _5294;
    out.m_93.z = _4938;
    out.m_93.w = _2191;
    out.m_95.x = _5280;
    out.m_97.x = _5282;
    out.m_97.y = _5284;
    out.m_97.z = _5266;
    out.m_97.w = _5286;
    float _5298 = _5238;
    float _5300 = _5274;
    float _5302 = _5278;
    float _5304 = _5272;
    if (!_5296)
    {
        _5298 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _5306 = _5298;
    out.m_99.x = _5246;
    out.m_99.y = _4820;
    out.m_99.z = _5264;
    float _5308 = _5306;
    float _5310 = _5306;
    if (!_5296)
    {
        _2193 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _5312 = _2193;
    float _5314 = _5312;
    float _5316 = _5312;
    if (!_5296)
    {
        _5200 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _5318 = _5200;
    float _5320 = _5318;
    float _5322 = _5318;
    if (!_5296)
    {
        _5300 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _5324 = _5300;
    float _5326 = _5324;
    float _5328 = _5324;
    if (!_5296)
    {
        _5302 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _5330 = _5302;
    float _5332 = _5330;
    float _5334 = _5330;
    if (!_5296)
    {
        _5304 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _5336 = _5304;
    bool _5338 = !_5296;
    float _5340 = _5336;
    float _5342 = _5336;
    if (!_5338)
    {
        bool _5344 = _3306 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _5346 = isnan(_3306);
        bool _5348 = _5344 || _5346;
        bool _5350 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _5352 = _5348 || _5350;
        if (!_5352)
        {
            float _5354 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5356 = _3306 + _5354;
            float _5358 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5360 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _5358;
            float _5362 = 1.0 / _5360;
            float _5364 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _5366 = _5364 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _5368 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _5370 = _5368 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _5372 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _5374 = _5372 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _5376 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _5378 = _5376 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _5380 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _5382 = _5380 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _5384 = _5356 * _5362;
            float _5386 = precise::clamp(_5384, 0.0, 1.0);
            float _5388 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _5390 = _5388 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _5392 = fma(_5386, _5366, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _5394 = fma(_5386, _5390, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _5396 = fma(_5386, _5370, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _5398 = fma(_5386, _5374, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _5400 = fma(_5386, _5378, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _5402 = fma(_5386, _5382, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _5316 = _5394;
            _5334 = _5400;
            _5310 = _5392;
            _5328 = _5398;
            _5322 = _5396;
            _5342 = _5402;
            _5404 = true;
        }
        else
        {
            bool _5406 = _3306 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _5408 = isnan(_3306);
            bool _5410 = _5406 || _5408;
            bool _5412 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _5414 = _5410 || _5412;
            if (!_5414)
            {
                _5308 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _5416 = _5308;
            _5310 = _5416;
            if (!_5414)
            {
                _5314 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _5418 = _5314;
            _5316 = _5418;
            if (!_5414)
            {
                _5320 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _5420 = _5320;
            _5322 = _5420;
            if (!_5414)
            {
                _5326 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _5422 = _5326;
            _5328 = _5422;
            if (!_5414)
            {
                _5332 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _5424 = _5332;
            _5334 = _5424;
            if (!_5414)
            {
                _5340 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _5426 = _5340;
            bool _5428 = !_5414;
            _5342 = _5426;
            if (!_5428)
            {
                bool _5430 = _3306 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _5432 = isnan(_3306);
                bool _5434 = _5430 || _5432;
                bool _5436 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _5438 = _5434 || _5436;
                if (!_5438)
                {
                    float _5440 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5442 = _3306 + _5440;
                    float _5444 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5446 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _5444;
                    float _5448 = 1.0 / _5446;
                    float _5450 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _5452 = _5450 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _5454 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _5456 = _5454 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _5458 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _5460 = _5458 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _5462 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _5464 = _5462 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _5466 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _5468 = _5466 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _5470 = _5442 * _5448;
                    float _5472 = precise::clamp(_5470, 0.0, 1.0);
                    float _5474 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _5476 = _5474 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _5478 = fma(_5472, _5452, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _5480 = fma(_5472, _5476, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _5482 = fma(_5472, _5456, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _5484 = fma(_5472, _5460, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _5486 = fma(_5472, _5464, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _5488 = fma(_5472, _5468, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _5316 = _5480;
                    _5334 = _5486;
                    _5310 = _5478;
                    _5328 = _5484;
                    _5322 = _5482;
                    _5342 = _5488;
                    _5404 = true;
                }
                else
                {
                    _5316 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _5334 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _5310 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _5328 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _5322 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _5342 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _5404 = false;
    float _5490 = _5316;
    float _5492 = _5334;
    float _5494 = _5310;
    float _5496 = _5328;
    float _5498 = _5322;
    float _5500 = _5342;
    float _5502 = fma(_4820, -0.5, 0.5);
    float _5504 = precise::clamp(_5502, 0.0, 1.0);
    float _5506 = -_5490;
    float _5508 = _5506 + _5492;
    float _5510 = -_5494;
    float _5512 = _5510 + _5496;
    float _5514 = -_5498;
    float _5516 = _5514 + _5500;
    bool _5518 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _5520 = fma(_5504, _5508, _5490);
    float _5522 = fma(_5504, _5512, _5494);
    float _5524 = fma(_5504, _5516, _5498);
    float _5526 = _5520 * 0.586610972881317138671875;
    out.m_59.x = 1.0;
    float _5528 = fma(_5522, 0.298911988735198974609375, _5526);
    float _5530 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _5532 = fma(_5524, 0.114477999508380889892578125, _5528);
    out.m_95.w = _5530;
    float _5534 = -_5532;
    float _5536 = _5522 + _5534;
    float _5538 = -_5532;
    float _5540 = _5520 + _5538;
    float _5542 = -_5532;
    float _5544 = _5524 + _5542;
    out.m_101.x = 0.0;
    float _5546 = fma(_5536, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5532);
    float _5548 = fma(_5540, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5532);
    float _5550 = fma(_5544, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5532);
    out.m_103.x = _5546;
    out.m_103.y = _5548;
    out.m_103.z = _5550;
    if (!_5518)
    {
        return out;
    }
    float _5552 = -_2079;
    float _5554 = _5552 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _5556 = -_2081;
    float _5558 = _5556 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _5560 = -_2083;
    float _5562 = _5560 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _5564 = _5554 * _5554;
    float _5566 = fma(_5558, _5558, _5564);
    float _5568 = fma(_5562, _5562, _5566);
    float _5570 = sqrt(_5568);
    float _5572 = rsqrt(_5568);
    float _5574 = -_5570;
    float _5576 = _5574 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _5578 = _5576 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _5580 = precise::clamp(_5578, 0.0, 1.0);
    float _5582 = _5558 * _5572;
    float _5584 = _5554 * _5572;
    float _5586 = abs(_5580);
    float _5588 = log2(_5586);
    float _5590 = _5562 * _5572;
    float _5592 = _5582 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _5594 = _4820 * _5584;
    float _5596 = -_5584;
    float _5598 = -_5592;
    float _5600 = fma(_5596, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5598);
    float _5602 = fma(_5246, _5582, _5594);
    float _5604 = -_5590;
    float _5606 = fma(_5604, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5600);
    float _5608 = fma(_5264, _5590, _5602);
    float _5610 = precise::clamp(_5608, 0.0, 1.0);
    float _5612 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _5614 = _5606 + _5612;
    float _5616 = _5588 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _5618 = _5614 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _5620 = precise::clamp(_5618, 0.0, 1.0);
    float _5622 = exp2(_5616);
    float _5624 = _5622 * _5620;
    float _5626 = _5610 * _5624;
    float _5628 = _5626 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _5630 = _5626 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _5632 = _5626 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_101.x = _5628;
    out.m_101.y = _5630;
    out.m_101.z = _5632;
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
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    bool _5404 = false;
    bool _804 = false;
    bool _700 = false;
    bool _584 = false;
    bool _200 = false;
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
    if (!_126)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5688 = as_type<float>(_138);
        out.gl_Position.z = _5688;
    }
    if (!_126)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _140 = in.m_61.w;
    bool _142 = _140 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _144 = isnan(_140);
    bool _146 = _142 || _144;
    bool _148 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _150 = _146 || _148;
    float _152 = -_140;
    float _154 = _152 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _156 = _154;
    if (_150)
    {
        float _158 = float(_122);
        _132 = _158;
    }
    float _160 = _132;
    bool _162 = _154 >= _160;
    bool _164 = !_150;
    bool _166 = _162 || _164;
    float _168 = _160;
    if (_166)
    {
        _168 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _170 = _168;
    if (_166)
    {
        out.m_59.x = 0.0;
    }
    int _172 = 0;
    if (_166)
    {
        float _174 = _170 * 5.0;
        _172 = as_type<int>(_174);
    }
    int _176 = _172;
    if (_166)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5758 = as_type<float>(_176);
        out.gl_Position.z = _5758;
    }
    if (_166)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _178 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _180 = !_178;
    float _198;
    if (!_180)
    {
        float _182 = in.m_63.x;
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
    float _210 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _212 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _210;
    float _214 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _216 = _214 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _218 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _220 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _218;
    float _222 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _224 = _222 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _226 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _228 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _226;
    float _230 = 1.0 / _216;
    float _232 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _234 = _232 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _236 = 1.0 / _224;
    float _238 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _240 = _208 + _238;
    bool _242 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _244 = 1.0 / _212;
    float _246 = _240 * _230;
    float _248 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _250 = _208 + _248;
    float _252 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _254 = _208 + _252;
    bool _256 = _208 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _258 = isnan(_208);
    bool _260 = _256 || _258;
    bool _262 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _264 = _260 || _262;
    float _266 = float(_264);
    float _268 = 1.0 / _234;
    float _270 = _250 * _236;
    bool _272 = _208 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _274 = isnan(_208);
    bool _276 = _272 || _274;
    bool _278 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _280 = _276 || _278;
    float _282 = float(_280);
    float _284 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _286 = _208 + _284;
    float _288 = 1.0 / _228;
    float _290 = _286 * _244;
    float _292 = -_282;
    float _294 = _292 + 1.0;
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _298 = _208 + _296;
    bool _300 = _208 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _302 = isnan(_208);
    bool _304 = _300 || _302;
    bool _306 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _308 = _304 || _306;
    float _310 = float(_308);
    float _312 = 1.0 / _220;
    bool _314 = _208 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _316 = isnan(_208);
    bool _318 = _314 || _316;
    bool _320 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _322 = _318 || _320;
    float _324 = float(_322);
    float _326 = _254 * _268;
    bool _328 = _208 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _330 = isnan(_208);
    bool _332 = _328 || _330;
    bool _334 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _336 = _332 || _334;
    float _338 = float(_336);
    float _340 = _324 * _294;
    float _342 = -_324;
    float _344 = _342 + 1.0;
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _348 = _346 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _352 = _208 + _350;
    float _354 = _338 * _344;
    float _356 = fma(_348, _246, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _358 = _352 * _288;
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _362 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _360;
    float _364 = _298 * _312;
    float _366 = -_338;
    float _368 = _366 + 1.0;
    float _370 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _372 = _370 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _374 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _376 = _374 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _380 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _378;
    float _382 = _266 * _368;
    float _384 = -_266;
    float _386 = _384 + 1.0;
    bool _388 = _208 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _390 = isnan(_208);
    bool _392 = _388 || _390;
    bool _394 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _396 = _392 || _394;
    float _398 = float(_396);
    float _400 = fma(_372, _246, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _402 = _208 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _404 = isnan(_208);
    bool _406 = _402 || _404;
    bool _408 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _410 = _406 || _408;
    float _412 = float(_410);
    float _414 = fma(_376, _246, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _416 = _310 * _386;
    float _418 = -_310;
    float _420 = _418 + 1.0;
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _424 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _422;
    float _426 = -_412;
    float _428 = _426 + 1.0;
    float _430 = _412 * _420;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _434 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _432;
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _438 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _436;
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _442 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _440;
    float _444 = fma(_380, _290, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _446 = fma(_424, _290, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _448 = _398 * _428;
    float _450 = fma(_362, _290, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _452 = fma(_438, _364, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _454 = fma(_434, _364, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _456 = fma(_442, _364, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _458 = _444 * _448;
    float _460 = _446 * _448;
    float _462 = -_398;
    float _464 = _462 + 1.0;
    float _466 = _450 * _448;
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _470 = _468 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _474 = _472 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _476 = fma(_464, (*spvDescriptorSet0.vp_c9)._m0[143].x, _458);
    float _478 = fma(_464, (*spvDescriptorSet0.vp_c9)._m0[143].y, _460);
    float _480 = fma(_464, (*spvDescriptorSet0.vp_c9)._m0[143].z, _466);
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _484 = _482 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _486 = fma(_400, _430, _476);
    float _488 = fma(_414, _430, _478);
    float _490 = fma(_356, _430, _480);
    float _492 = fma(_470, _270, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _494 = fma(_474, _270, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _496 = fma(_484, _270, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _498 = fma(_452, _416, _486);
    float _500 = fma(_454, _416, _488);
    float _502 = fma(_456, _416, _490);
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _506 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _504;
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _510 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _508;
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _514 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _512;
    float _516 = fma(_492, _382, _498);
    float _518 = fma(_494, _382, _500);
    float _520 = fma(_496, _382, _502);
    float _522 = fma(_506, _358, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _524 = fma(_510, _358, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _526 = fma(_514, _358, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _530 = _528 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _534 = _532 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[148].z;
    float _538 = _536 + (*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _540 = fma(_522, _354, _516);
    float _542 = fma(_530, _326, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _544 = fma(_534, _326, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _546 = fma(_538, _326, (*spvDescriptorSet0.vp_c9)._m0[148].z);
    float _548 = fma(_524, _354, _518);
    float _550 = fma(_526, _354, _520);
    float _552 = fma(_542, _340, _540);
    float _554 = fma(_544, _340, _548);
    float _556 = fma(_546, _340, _550);
    float _558 = fma(_282, (*spvDescriptorSet0.vp_c9)._m0[149].x, _552);
    float _560 = fma(_282, (*spvDescriptorSet0.vp_c9)._m0[149].y, _554);
    float _562 = fma(_282, (*spvDescriptorSet0.vp_c9)._m0[149].z, _556);
    bool _564 = !_242;
    float _582;
    if (!_564)
    {
        float _566 = in.m_63.x;
        float _568 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _570 = _566 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _572 = fma(_570, (*spvDescriptorSet0.vp_c9)._m0[11].y, _154);
        float _574 = _572 * _568;
        float _576 = floor(_574);
        float _578 = -_576;
        float _580 = _574 + _578;
        _582 = _580;
        _584 = true;
    }
    else
    {
        float _586 = float(_122);
        float _588 = 1.0 / _586;
        float _590 = _154 * _588;
        _582 = _590;
    }
    _584 = false;
    float _592 = _582;
    float _594 = in.m_65.x;
    float _596 = in.m_65.y;
    float _598 = in.m_65.z;
    bool _600 = _592 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _602 = isnan(_592);
    bool _604 = _600 || _602;
    bool _606 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _608 = _604 || _606;
    float _610 = float(_608);
    float _612 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _614 = _612 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _616 = _592 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _618 = isnan(_592);
    bool _620 = _616 || _618;
    bool _622 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _624 = _620 || _622;
    float _626 = float(_624);
    float _628 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _630 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _628;
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _634 = _592 + _632;
    float _636 = -_610;
    float _638 = _636 + 1.0;
    bool _640 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _642 = 1.0 / _614;
    float _644 = _626 * _638;
    float _646 = -_626;
    float _648 = _646 + 1.0;
    float _650 = _558 * _594;
    float _652 = _630 * _642;
    float _654 = fma(_652, _634, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _656 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _658 = _654 * _644;
    float _660 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _662 = _656 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _664 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[115].x, _658);
    float _666 = _560 * _596;
    float _668 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _670 = _660 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _672 = fma(_610, (*spvDescriptorSet0.vp_c9)._m0[116].x, _664);
    float _674 = _562 * _598;
    float _676 = _668 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _678 = _672 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_67.x = _676;
    out.m_67.y = _670;
    out.m_67.z = _662;
    out.m_67.w = _678;
    bool _680 = !_640;
    float _698;
    if (!_680)
    {
        float _682 = in.m_63.x;
        float _684 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _686 = _682 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _688 = fma(_686, (*spvDescriptorSet0.vp_c9)._m0[11].w, _154);
        float _690 = _688 * _684;
        float _692 = floor(_690);
        float _694 = -_692;
        float _696 = _690 + _694;
        _698 = _696;
        _700 = true;
    }
    else
    {
        float _702 = float(_122);
        float _704 = 1.0 / _702;
        float _706 = _154 * _704;
        _698 = _706;
    }
    _700 = false;
    float _708 = _698;
    bool _710 = _708 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _712 = isnan(_708);
    bool _714 = _710 || _712;
    bool _716 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _718 = _714 || _716;
    float _720 = float(_718);
    float _722 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _724 = _722 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _726 = _708 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _728 = isnan(_708);
    bool _730 = _726 || _728;
    bool _732 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _734 = _730 || _732;
    float _736 = float(_734);
    float _738 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _740 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _738;
    float _742 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _744 = _708 + _742;
    float _746 = -_720;
    float _748 = _746 + 1.0;
    float _750 = 1.0 / _724;
    bool _752 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _754 = _736 * _748;
    float _756 = -_736;
    float _758 = _756 + 1.0;
    float _760 = _740 * _750;
    float _762 = fma(_760, _744, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _764 = _762 * _754;
    float _766 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _768 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _770 = fma(_758, (*spvDescriptorSet0.vp_c9)._m0[131].x, _764);
    float _772 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _774 = _766 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _776 = _768 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _778 = fma(_720, (*spvDescriptorSet0.vp_c9)._m0[132].x, _770);
    float _780 = _772 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _782 = _778 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_69.x = _774;
    out.m_69.y = _776;
    out.m_69.z = _780;
    out.m_69.w = _782;
    bool _784 = !_752;
    float _802;
    if (!_784)
    {
        float _786 = in.m_63.x;
        float _788 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _790 = _786 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _792 = fma(_790, (*spvDescriptorSet0.vp_c9)._m0[14].x, _154);
        float _794 = _792 * _788;
        float _796 = floor(_794);
        float _798 = -_796;
        float _800 = _794 + _798;
        _802 = _800;
        _804 = true;
    }
    else
    {
        float _806 = float(_122);
        float _808 = 1.0 / _806;
        float _810 = _154 * _808;
        _802 = _810;
    }
    _804 = false;
    float _812 = _802;
    float _814 = in.m_56.x;
    float _816 = in.m_56.y;
    float _818 = in.m_56.z;
    float _820 = _816 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _822 = _816 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _824 = fma(_814, (*spvDescriptorSet0.vp_c10)._m0[4].x, _820);
    float _826 = fma(_814, (*spvDescriptorSet0.vp_c10)._m0[6].x, _822);
    float _828 = fma(_818, (*spvDescriptorSet0.vp_c10)._m0[4].z, _824);
    float _830 = fma(_818, (*spvDescriptorSet0.vp_c10)._m0[6].z, _826);
    float _832 = _828 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _834 = _830 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _836 = fma(_832, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _838 = fma(_834, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _840 = floor(_836);
    float _842 = floor(_838);
    float _844 = -_840;
    float _846 = _836 + _844;
    float _848 = -_842;
    float _850 = _838 + _848;
    float2 _6891 = float2(_846, _850);
    float _852 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6891, float2(0.0), isnan(_6891)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6891, float2(0.0), isnan(_6891)), level(0.0)).x;
    float _854 = in.m_63.x;
    float _856 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _858 = int(_856);
    float _860 = in.m_63.y;
    int _862 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _864 = _862 != 0;
    float _866 = -_832;
    float _868 = _866 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _870 = in.m_63.z;
    float _872 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _874 = _816 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _876 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _878 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _880 = log2(_878);
    float _882 = fma(_814, (*spvDescriptorSet0.vp_c10)._m0[5].x, _874);
    float _884 = -_834;
    float _886 = _884 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _888 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _890 = fma(_818, (*spvDescriptorSet0.vp_c10)._m0[5].z, _882);
    float _892 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _894 = int(_892);
    float _896 = float(_122);
    float _898 = _854 * 2.0;
    float _900 = _854 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _902 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _904 = float(_858);
    float _906 = _860 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _908 = _860 * 2.0;
    float _910 = floor(_898);
    float _912 = -_876;
    float _914 = fma(_900, 2.0, _912);
    float _916 = fma(_906, -2.0, _872);
    float _918 = _870 * 2.0;
    float _920 = _854 + _860;
    float _922 = _860 + _870;
    float _924 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[76].y, _916);
    float _926 = floor(_908);
    float _928 = _920 + (-1.0);
    int _930 = as_type<int>(_920);
    float _932 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    float _934 = _860;
    float _936 = _854;
    float _938 = _834;
    if (_864)
    {
        _930 = 0;
    }
    int _940 = _930;
    float _942 = _922 + (-1.0);
    int _944 = _940;
    if (!_864)
    {
        _944 = 2;
    }
    int _946 = _944;
    float _948 = fma(_928, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _950 = -_154;
    float _952 = fma(_950, (*spvDescriptorSet0.vp_c9)._m0[76].x, _914);
    float _954 = floor(_918);
    bool _956 = _910 > 0.0;
    float _958 = _666 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _960 = _946 != 2;
    float _962 = fma(_942, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _964 = _910 >= 0.0;
    bool _966 = isnan(_910);
    bool _968 = _964 || _966;
    bool _970 = isnan(0.0);
    bool _972 = _968 || _970;
    float _974 = _650 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _976 = _946;
    if (_864)
    {
        _976 = 0;
    }
    int _978 = _976;
    float _980 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _982 = int(_980);
    int _984 = _972 ? 0 : 1;
    int _986 = _978;
    if (!_864)
    {
        _986 = 1;
    }
    int _988 = _986;
    bool _990 = _926 > 0.0;
    bool _992 = _926 >= 0.0;
    bool _994 = isnan(_926);
    bool _996 = _992 || _994;
    bool _998 = isnan(0.0);
    bool _1000 = _996 || _998;
    float _1002 = 1.0 / _904;
    bool _1004 = _954 > 0.0;
    bool _1006 = _954 >= 0.0;
    bool _1008 = isnan(_954);
    bool _1010 = _1006 || _1008;
    bool _1012 = isnan(0.0);
    bool _1014 = _1010 || _1012;
    int _1016 = ~_984;
    int _1018 = _1016 + 1;
    int _1020 = _1018 + 1;
    int _1022 = _1020;
    float _1024 = as_type<float>(_988);
    if (!_956)
    {
        int _1026 = ~_984;
        int _1028 = _1026 + 1;
        _1022 = _1028;
    }
    int _1030 = _1022;
    float _1032 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1034 = int(_1032);
    bool _1036 = _988 != 1;
    float _1038 = _880 * _154;
    if (_960)
    {
        _1024 = _854;
    }
    float _1040 = _1024;
    float _1042 = _1040;
    if (!_960)
    {
        _1042 = _870;
    }
    float _1044 = _1042;
    float _1046 = _1014 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _1048 = exp2(_1038);
    int _1050 = _1000 ? 0 : 1;
    float _1052 = _1044 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    int _1054 = ~as_type<int>(_1046);
    int _1056 = _1054 + 1;
    int _1058 = _1056 + 1;
    float _1060 = _1002 * _154;
    int _1062 = ~_1050;
    int _1064 = _1062 + 1;
    int _1066 = _1064 + 1;
    float _1068 = -_888;
    float _1070 = fma(_1052, 2.0, _1068);
    float _1072 = _1052;
    int _1074 = _1058;
    int _1076 = _1066;
    float _1078 = _1046;
    float _1080 = _1044;
    if (!_1036)
    {
        _1072 = _860;
    }
    float _1082 = _1072;
    float _1084 = 1.0 / _896;
    float _1086 = _1082;
    if (!_1004)
    {
        int _1088 = ~as_type<int>(_1046);
        int _1090 = _1088 + 1;
        _1074 = _1090;
    }
    int _1092 = _1074;
    float _1094 = -_154;
    float _1096 = fma(_1094, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1070);
    if (!_990)
    {
        int _1098 = ~_1050;
        int _1100 = _1098 + 1;
        _1076 = _1100;
    }
    int _1102 = _1076;
    if (!_1036)
    {
        _1078 = _1082;
    }
    float _1104 = _1078;
    float _1106 = -_1048;
    float _1108 = _1106 + 1.0;
    float _1110 = _1104;
    if (_1036)
    {
        _1110 = _854;
    }
    float _1112 = _1110;
    float _1114 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _1116 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1118 = _1116 != 0;
    int _1120 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1122 = _1120 != 0;
    int _1124 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1126 = _1124 != 0;
    float _1128 = _1112 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (!_1036)
    {
        _1080 = _870;
    }
    float _1130 = _1080;
    float _1132 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1134 = _1130;
    if (_1036)
    {
        _1134 = _860;
    }
    float _1136 = _1134;
    float _1138 = -_1114;
    float _1140 = fma(_1128, 2.0, _1138);
    float _1142 = _890 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1144 = !_1122;
    int _1146 = _1144 ? 0 : 1;
    float _1148 = _1084 * _154;
    bool _1150 = !_1118;
    int _1152 = _1150 ? 0 : 1;
    float _1154 = fma(_1136, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1132);
    int _1156 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1158 = _1156 != 0;
    int _1160 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1162 = _1160 != 0;
    float _1164 = _1142 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1166 = _1142 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    if (_1036)
    {
        _1086 = _854;
    }
    float _1168 = _1086;
    float _1170 = -_1142;
    float _1172 = _1170 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    bool _1174 = !_1126;
    int _1176 = _1174 ? 0 : 1;
    float _1178 = fma(_832, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1164);
    bool _1180 = !_1162;
    int _1182 = _1180 ? 0 : 1;
    float _1184 = fma(_832, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1166);
    bool _1186 = !_1158;
    int _1188 = _1186 ? 0 : 1;
    float _1190 = fma(_834, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1178);
    int _1192 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1194 = _1192 != 0;
    int _1196 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1198 = _1196 != 0;
    int _1200 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1202 = _1200 != 0;
    float _1204 = fma(_1168, (*spvDescriptorSet0.vp_c9)._m0[83].z, _902);
    float _1206 = fma(_834, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1184);
    float _1208 = _1190 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1210 = float(_894);
    float _1212 = in.m_71.x;
    float _1214 = in.m_71.y;
    float _1216 = in.m_71.z;
    bool _1218 = !_1194;
    int _1220 = _1218 ? 0 : 1;
    float _1222 = _1206 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1224 = float(_1092);
    float _1226 = 1.0 / _1210;
    int _1228 = abs(_1220);
    float _1230 = _1208 + _1222;
    float _1232 = _1178;
    float _1234 = as_type<float>(_1228);
    if (!_1036)
    {
        _1232 = _870;
    }
    float _1236 = _1232;
    float _1238 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1240 = _1172 * _1172;
    float _1242 = _1236;
    if (_1036)
    {
        _1242 = _860;
    }
    float _1244 = _1242;
    float _1246 = 1.0 / _1222;
    float _1248 = float(_1228);
    float _1250 = fma(_868, _868, _1240);
    if (_960)
    {
        _1234 = _860;
    }
    float _1252 = _1234;
    float _1254 = _1244 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1256 = _1252;
    if (!_960)
    {
        _1256 = _854;
    }
    float _1258 = _1256;
    float _1260 = _1248 * _1224;
    float _1262 = fma(_1254, -2.0, _1238);
    float _1264 = _1260 * (-2.0);
    float _1266 = _1258 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1268 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1270 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1272 = 1.0 + _1270;
    float _1274 = _1230 * _1246;
    float _1276 = _1274 * 0.5;
    float _1278 = fma(_948, _1264, _948);
    float _1280 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1282 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1284 = fma(_1266, -2.0, _1268);
    float _1286 = float(_982);
    float _1288 = _1142 + _1280;
    float _1290 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1292 = fma(_860, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1282);
    float _1294 = 1.0 / _1286;
    float _1296 = _1288 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1298 = fma(_1264, _1212, _1212);
    float _1300 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1302 = fma(_860, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1290);
    bool _1304 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1306 = isnan(1.0);
    bool _1308 = _1304 || _1306;
    bool _1310 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1312 = _1308 || _1310;
    float _1314 = fma(_832, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1296);
    float _1316 = 1.0 / _1272;
    bool _1318 = !_1198;
    int _1320 = _1318 ? 0 : 1;
    float _1322 = fma(_854, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1300);
    float _1324 = fma(_886, _886, _1250);
    bool _1326 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1328 = isnan(0.0);
    bool _1330 = _1326 || _1328;
    bool _1332 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1334 = _1330 || _1332;
    float _1336 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1338 = !_1202;
    int _1340 = _1338 ? 0 : 1;
    float _1342 = _1226 * _154;
    float _1344 = float(_1030);
    float _1346 = fma(_854, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1336);
    int _1348 = abs(_1320);
    float _1350 = _854 + (-0.5);
    float _1352 = float(_1034);
    float _1354 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1346);
    float _1356 = _1334 ? _1108 : 0.0;
    float _1358 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1292);
    int _1360 = abs(_1340);
    float _1362 = _1352 * _154;
    float _1364 = float(_1348);
    float _1366 = _1294 * _154;
    float _1368 = float(_1102);
    float _1370 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1322);
    float _1372 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1302);
    float _1374 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1204);
    float _1376 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1154);
    float _1378 = -_154;
    float _1380 = fma(_1378, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1140);
    float _1382 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1262);
    float _1384 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1284);
    float _1386 = float(_1360);
    int _1388 = as_type<int>(_1342);
    float _1390 = _1288;
    if (_1312)
    {
        float _1392 = _1356 * _1316;
        _156 = _1392;
    }
    float _1394 = _156;
    float _1396 = fma(_834, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1314);
    float _1398 = fma(_1350, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1298);
    float _1400 = _1364 * _1344;
    float _1402 = rsqrt(_1324);
    float _1404 = _1396 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1406 = _1386 * _1368;
    float _1408 = fma(_1278, _1394, _1398);
    float _1410 = _854 + _870;
    float _1412 = _1400 * (-2.0);
    float _1414 = _1406 * (-2.0);
    float _1416 = _860 + (-0.5);
    float _1418 = _1410 + (-1.0);
    float _1420 = fma(_1412, _1214, _1214);
    float _1422 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1424 = fma(_1276, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1422);
    float _1426 = _1288 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1428 = in.m_73.x;
    float _1430 = in.m_73.y;
    float _1432 = in.m_73.z;
    float _1434 = fma(_1418, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1436 = fma(_1416, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1420);
    float _1438 = fma(_1414, _1216, _1216);
    float _1440 = _870 + (-0.5);
    float _1442 = 1.0 / _1424;
    float _1444 = fma(_1434, _1414, _1434);
    float _1446 = _868 * _1402;
    float _1448 = fma(_1440, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1438);
    float _1450 = fma(_832, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1426);
    float _1452 = fma(_962, _1412, _962);
    float _1454 = _886 * _1402;
    float _1456 = fma(_1444, _1394, _1448);
    float _1458 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1460 = _1446 * _1458;
    float _1462 = fma(_834, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1450);
    float _1464 = fma(_1452, _1394, _1436);
    float _1466 = _1172 * _1402;
    float _1468 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1470 = _1454 * _1468;
    float _1472 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1474 = -_1460;
    float _1476 = fma(_1454, _1472, _1474);
    float _1478 = _1462 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1480 = _1464 * 0.15915493667125701904296875;
    float _1482 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1484 = -_1470;
    float _1486 = fma(_1466, _1482, _1484);
    float _1488 = _1408 * 0.15915493667125701904296875;
    float _1490 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1492 = _1466 * _1490;
    float _1494 = _1476 * _1476;
    float _1496 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1498 = _1442 * _1496;
    float _1500 = trunc(_1404);
    int _1502 = int(_1500);
    float _1504 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1506 = -_1492;
    float _1508 = fma(_1446, _1504, _1506);
    float _1510 = fma(_1486, _1486, _1494);
    float _1512 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1430);
    bool _1514 = _1498 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1516 = _1456 * 0.15915493667125701904296875;
    float _1518 = fma(_1508, _1508, _1510);
    bool _1520 = _1498 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1522 = trunc(_1478);
    int _1524 = int(_1522);
    float _1526 = _1512 * _958;
    float _1528 = _674 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _1530 = !_1514;
    int _1532 = _1530 ? 0 : 1;
    float _1534 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1428);
    float _1536 = rsqrt(_1518);
    int _1538 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1540 = _1502 + _1538;
    int _1542 = _1540 + 1;
    float _1544 = _1534 * _974;
    int _1546 = 2;
    int _1548 = _1542;
    if (!_1514)
    {
        _1546 = 1;
    }
    int _1550 = _1546;
    float _1552 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1432);
    int _1554 = _1550;
    if (!_1520)
    {
        _1554 = _1532;
    }
    int _1556 = _1554;
    bool _1558 = _1542 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1560 = _1488 * 6.283185482025146484375;
    float _1562 = sin(_1560);
    int _1564 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1566 = _1524 + _1564;
    int _1568 = _1566 + 1;
    float _1570 = _1552 * _1528;
    int _1572 = _1556 << 6;
    int _1574 = _1542 | _1568;
    int _1576 = _1572 + 104;
    uint _1579 = uint(int(uint(_1576) >> uint(2)));
    uint _1581 = uint(int(uint(int(_1579)) >> uint(2)));
    int _1583 = int(_1579) & 3;
    float _1585 = (*spvDescriptorSet0.vp_c15)._m0[int(_1581)][_1583];
    int _1587 = int(_1579) + 1;
    uint _1589 = uint(int(uint(_1587) >> uint(2)));
    int _1591 = _1587 & 3;
    float _1593 = (*spvDescriptorSet0.vp_c15)._m0[int(_1589)][_1591];
    float _1595 = _1488 * 6.283185482025146484375;
    float _1597 = cos(_1595);
    bool _1599 = _1574 < 0;
    bool _1601 = _1599 || _1558;
    float _1603 = _1486 * _1536;
    float _1605 = _1476 * _1536;
    float _1607 = _1508 * _1536;
    bool _1609 = _1568 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1611 = _1609 || _1601;
    float _1613 = _1466 * _1603;
    int _1615 = _1572 + 96;
    uint _1617 = uint(int(uint(_1615) >> uint(2)));
    uint _1619 = uint(int(uint(int(_1617)) >> uint(2)));
    int _1621 = int(_1617) & 3;
    float _1623 = (*spvDescriptorSet0.vp_c15)._m0[int(_1619)][_1621];
    int _1625 = int(_1617) + 1;
    uint _1627 = uint(int(uint(_1625) >> uint(2)));
    int _1629 = _1625 & 3;
    float _1631 = (*spvDescriptorSet0.vp_c15)._m0[int(_1627)][_1629];
    float _1633 = _1480 * 6.283185482025146484375;
    float _1635 = sin(_1633);
    float _1637 = _1454 * _1605;
    float _1639 = -_1613;
    float _1641 = fma(_1446, _1605, _1639);
    float _1643 = -_1637;
    float _1645 = fma(_1466, _1607, _1643);
    int _1647 = _1572 + 48;
    uint _1649 = uint(int(uint(_1647) >> uint(2)));
    uint _1651 = uint(int(uint(int(_1649)) >> uint(2)));
    int _1653 = int(_1649) & 3;
    float _1655 = (*spvDescriptorSet0.vp_c15)._m0[int(_1651)][_1653];
    int _1657 = int(_1649) + 1;
    uint _1659 = uint(int(uint(_1657) >> uint(2)));
    int _1661 = _1657 & 3;
    float _1663 = (*spvDescriptorSet0.vp_c15)._m0[int(_1659)][_1661];
    float _1665 = _1480 * 6.283185482025146484375;
    float _1667 = cos(_1665);
    int _1669 = _1568;
    if (!_1611)
    {
        int _1671 = _1568 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1673 = _1671 + _1542;
        _1548 = _1673;
    }
    int _1675 = _1548;
    float _1677 = as_type<float>(_1675);
    if (!_1611)
    {
        int _1679 = _1675 << 2;
        _1669 = _1679;
    }
    int _1681 = _1669;
    float _1683 = _1516 * 6.283185482025146484375;
    float _1685 = cos(_1683);
    float _1687 = _1562 * _1635;
    float _1689 = _1597 * _1635;
    int _1691 = 0;
    int _1693 = _1681;
    if (!_1611)
    {
        uint _1695 = uint(int(uint(_1675) >> uint(2)));
        _1691 = int(_1695);
    }
    int _1697 = _1691;
    int _1699 = _1697;
    if (!_1611)
    {
        int _1701 = 12 & _1681;
        _1693 = _1701;
    }
    int _1703 = _1693;
    float _1705 = _1516 * 6.283185482025146484375;
    float _1707 = sin(_1705);
    float _1709 = _1597 * _1667;
    float _1711 = _1562 * _1667;
    if (!_1611)
    {
        int _1713 = _1697 << 4;
        int _1715 = _1713 + _1703;
        _1699 = _1715;
    }
    int _1717 = _1699;
    float _1719 = _1597 * _1685;
    float _1721 = _1562 * _1685;
    float _1723 = _1667 * _1685;
    float _1725 = _1635 * _1685;
    float _1727 = _1719 * _1526;
    int _1729 = _1572 + 72;
    uint _1731 = uint(int(uint(_1729) >> uint(2)));
    uint _1733 = uint(int(uint(int(_1731)) >> uint(2)));
    int _1735 = int(_1731) & 3;
    float _1737 = (*spvDescriptorSet0.vp_c15)._m0[int(_1733)][_1735];
    int _1739 = int(_1731) + 1;
    uint _1741 = uint(int(uint(_1739) >> uint(2)));
    int _1743 = _1739 & 3;
    float _1745 = (*spvDescriptorSet0.vp_c15)._m0[int(_1741)][_1743];
    float _1747 = fma(_1707, _1709, _1687);
    float _1749 = -_1689;
    float _1751 = fma(_1707, _1711, _1749);
    float _1753 = -_1711;
    float _1755 = fma(_1707, _1689, _1753);
    float _1757 = fma(_1707, _1687, _1709);
    float _1759 = -_1526;
    float _1761 = _1707 * _1759;
    float _1763 = fma(_1747, _1544, _1727);
    int _1765 = _1572 + 64;
    uint _1767 = uint(int(uint(_1765) >> uint(2)));
    uint _1769 = uint(int(uint(int(_1767)) >> uint(2)));
    int _1771 = int(_1767) & 3;
    float _1773 = (*spvDescriptorSet0.vp_c15)._m0[int(_1769)][_1771];
    int _1775 = int(_1767) + 1;
    uint _1777 = uint(int(uint(_1775) >> uint(2)));
    int _1779 = _1775 & 3;
    float _1781 = (*spvDescriptorSet0.vp_c15)._m0[int(_1777)][_1779];
    float _1783 = _1721 * _1526;
    float _1785 = fma(_1723, _1544, _1761);
    float _1787 = fma(_1755, _1570, _1763);
    float _1789 = _1288 * _1631;
    float _1791 = fma(_1751, _1544, _1783);
    float _1793 = fma(_1725, _1570, _1785);
    float _1795 = _1641 * _1787;
    float _1797 = _1645 * _1787;
    float _1799 = fma(_1757, _1570, _1791);
    int _1801 = _1572 + 56;
    uint _1803 = uint(int(uint(_1801) >> uint(2)));
    uint _1805 = uint(int(uint(int(_1803)) >> uint(2)));
    int _1807 = int(_1803) & 3;
    float _1809 = (*spvDescriptorSet0.vp_c15)._m0[int(_1805)][_1807];
    int _1811 = int(_1803) + 1;
    uint _1813 = uint(int(uint(_1811) >> uint(2)));
    int _1815 = _1811 & 3;
    float _1817 = (*spvDescriptorSet0.vp_c15)._m0[int(_1813)][_1815];
    float _1819 = fma(_1607, _1793, _1795);
    float _1821 = fma(_1603, _1793, _1797);
    float _1823 = fma(_832, _1623, _1789);
    float _1825 = _1288 * _1663;
    float _1827 = fma(_1454, _1799, _1819);
    float _1829 = fma(_1446, _1799, _1821);
    float _1831 = fma(_834, _1585, _1823);
    float _1833 = _1663;
    float _1835 = _1623;
    if (!_1611)
    {
        float _1837 = floor(_1404);
        _1833 = _1837;
    }
    float _1839 = _1833;
    float _1841 = _834 + _1827;
    float _1843 = _832 + _1829;
    int _1845 = _1572 + 80;
    uint _1847 = uint(int(uint(_1845) >> uint(2)));
    uint _1849 = uint(int(uint(int(_1847)) >> uint(2)));
    int _1851 = int(_1847) & 3;
    float _1853 = (*spvDescriptorSet0.vp_c15)._m0[int(_1849)][_1851];
    int _1855 = int(_1847) + 1;
    uint _1857 = uint(int(uint(_1855) >> uint(2)));
    int _1859 = _1855 & 3;
    float _1861 = (*spvDescriptorSet0.vp_c15)._m0[int(_1857)][_1859];
    float _1863 = _1831 + _1593;
    float _1865 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1867 = _1841 + _1865;
    float _1869 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1871 = _1843 + _1869;
    float _1873 = fma(_832, _1655, _1825);
    float _1875 = _1867 * _1867;
    float _1877 = 1.0 / _1863;
    float _1879 = fma(_1871, _1871, _1875);
    float _1881 = _1446 * _1607;
    float _1883 = sqrt(_1879);
    float _1885 = -_1881;
    float _1887 = fma(_1454, _1603, _1885);
    float _1889 = _1887 * _1787;
    float _1891 = fma(_1605, _1793, _1889);
    float _1893 = _1288 * _1781;
    bool _1895 = _1883 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1897 = fma(_832, _1773, _1893);
    float _1899 = fma(_1466, _1799, _1891);
    int _1901 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1903 = _1901 != 0;
    int _1905 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1907 = _1905 != 0;
    float _1909 = fma(_834, _1737, _1897);
    float _1911 = fma(_834, _1809, _1873);
    float _1913 = _1909 + _1745;
    int _1915 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1917 = _1915 != 0;
    int _1919 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1921 = _1919 != 0;
    float _1923 = _1142 + _1899;
    bool _1925 = !_1907;
    int _1927 = _1925 ? 0 : 1;
    float _1929 = _1911 + _1817;
    bool _1931 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1933 = isnan(0.5);
    bool _1935 = _1931 || _1933;
    bool _1937 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1939 = _1935 || _1937;
    bool _1941 = !_1903;
    int _1943 = _1941 ? 0 : 1;
    bool _1945 = !_1917;
    int _1947 = _1945 ? 0 : 1;
    bool _1949 = !_1921;
    int _1951 = _1949 ? 0 : 1;
    float _1953 = _1899;
    float _1955 = _1897;
    float _1957 = _1871;
    float _1959 = _1873;
    if (!_1895)
    {
        _1953 = _1843;
    }
    float _1961 = _1953;
    float _1963 = _1961;
    if (!_1895)
    {
        _1835 = _1841;
    }
    float _1965 = _1835;
    float _1967 = _1965;
    if (!_1895)
    {
        _1955 = _1923;
    }
    float _1969 = _1955;
    bool _1971 = !_1895;
    float _1973 = _1969;
    float _1975 = _1861;
    if (!_1971)
    {
        float _1977 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1979 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1981 = _1883 + _1979;
        float _1983 = _1923 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1985 = rsqrt(_1879);
        float _1987 = _1981 * _1977;
        float _1989 = _1987 * 0.15915493667125701904296875;
        float _1991 = _1989 * 6.283185482025146484375;
        float _1993 = cos(_1991);
        float _1995 = _1989 * 6.283185482025146484375;
        float _1997 = sin(_1995);
        float _1999 = _1993 + (-1.0);
        float _2001 = _1999 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2003 = fma(_1997, _1983, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2005 = fma(_1923, _1993, _2001);
        float _2007 = _1985 * _2003;
        float _2009 = fma(_1871, _2007, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2011 = fma(_1867, _2007, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1967 = _2011;
        _1963 = _2009;
        _1973 = _2005;
    }
    float _2013 = _1967;
    float _2015 = _1963;
    float _2017 = _1973;
    float _2019 = _1929 * _1877;
    float _2021 = _2017;
    float _2023 = _2015;
    if (_1939)
    {
        _1957 = _2013;
    }
    float _2025 = _1957;
    float _2027 = _2025;
    if (!_1939)
    {
        float _2029 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2031 = _1142 + _2029;
        float _2033 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2035 = _832 + _2033;
        float _2037 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2039 = -_832;
        float _2041 = _2039 + _2015;
        float _2043 = _2031 * _2031;
        float _2045 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2047 = _834 + _2045;
        float _2049 = -_834;
        float _2051 = _2049 + _2013;
        float _2053 = fma(_2035, _2035, _2043);
        float _2055 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2057 = fma(_2047, _2047, _2053);
        float _2059 = sqrt(_2057);
        float _2061 = _2037 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2063 = precise::min(_2059, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2065 = _2063 * _2055;
        float _2067 = -_1142;
        float _2069 = _2067 + _2017;
        float _2071 = _2061 * _2065;
        float _2073 = fma(_2069, _2071, _1142);
        float _2075 = fma(_2041, _2071, _832);
        float _2077 = fma(_2051, _2071, _834);
        _2021 = _2073;
        _2023 = _2075;
        _2027 = _2077;
    }
    float _2079 = _2021;
    float _2081 = _2023;
    float _2083 = _2027;
    int _2085 = _1572 + 88;
    uint _2087 = uint(int(uint(_2085) >> uint(2)));
    uint _2089 = uint(int(uint(int(_2087)) >> uint(2)));
    int _2091 = int(_2087) & 3;
    float _2093 = (*spvDescriptorSet0.vp_c15)._m0[int(_2089)][_2091];
    int _2095 = int(_2087) + 1;
    uint _2097 = uint(int(uint(_2095) >> uint(2)));
    int _2099 = _2095 & 3;
    float _2101 = (*spvDescriptorSet0.vp_c15)._m0[int(_2097)][_2099];
    float _2103 = _2079 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2105 = _2079 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2107 = _2079 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    bool _2109 = _2019 >= 0.0;
    float _2111 = fma(_2081, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2103);
    float _2113 = fma(_2081, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2105);
    float _2115 = fma(_2081, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2107);
    float _2117 = _1879;
    if (!_1611)
    {
        int _2119 = _1717 + 400;
        uint _2121 = uint(int(uint(_2119) >> uint(2)));
        uint _2123 = uint(int(uint(int(_2121)) >> uint(2)));
        int _2125 = int(_2121) & 3;
        float _2127 = (*spvDescriptorSet0.vp_c15)._m0[int(_2123)][_2125];
        _2117 = _2127;
    }
    float _2129 = _2117;
    float _2131 = fma(_2083, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2111);
    float _2133 = _1913 * _1877;
    bool _2135 = _2019 <= 1.0;
    bool _2137 = _2135 && _2109;
    float _2139 = fma(_2083, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2113);
    float _2141 = fma(_2083, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2115);
    float _2143 = _2079 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2145 = _2131 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _2147 = _2133 >= 0.0;
    bool _2149 = _2147 && _2137;
    float _2151 = _2139 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2153 = _2141 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2155 = fma(_2081, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2143);
    float _2157 = _2145 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _2159 = _2133 <= 1.0;
    bool _2161 = _2159 && _2149;
    float _2163 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2165 = _2151 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2167 = fma(_2083, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2155);
    float _2169 = fma(_2153, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2157);
    float _2171 = _2145 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2173 = -_2165;
    float _2175 = fma(_2173, _2163, 1.0);
    float _2177 = _2167 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2179 = fma(_2151, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2169);
    float _2181 = _1288 * _1861;
    float _2183 = _2169;
    if (!_1611)
    {
        float _2185 = floor(_1478);
        _1959 = _2185;
    }
    float _2187 = _1959;
    float _2189 = fma(_2153, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2171);
    float _2191 = fma(_2177, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2179);
    float _2193 = _2191;
    if (_2161)
    {
        float _2195 = float(_1556);
        _2183 = _2195;
    }
    float _2197 = _2183;
    float _2199 = _2145 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2201 = fma(_832, _1853, _2181);
    if (!_1611)
    {
        float _2203 = -_1839;
        float _2205 = _1404 + _2203;
        _1975 = _2205;
    }
    float _2207 = _1975;
    float _2209 = log2(_2175);
    float _2211 = fma(_2153, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2199);
    float _2213 = fma(_2151, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2189);
    float _2215 = fma(_2151, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2211);
    float _2217 = fma(_2177, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2213);
    float _2219 = 1.0 / _2191;
    float _2221 = fma(_834, _2093, _2201);
    float _2223 = fma(_2177, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2215);
    float _2225 = _2221 + _2101;
    float _2227 = _2197;
    if (_2161)
    {
        float _2229 = rint(_2197);
        float _2231 = precise::max(_2229, 0.0);
        uint _2233 = uint(_2231);
        uint _2235 = clamp(_2233, 0u, 65535u);
        _2227 = as_type<float>(_2235);
    }
    float _2237 = _2227;
    float _2239 = _2209 * 0.693147182464599609375;
    float _2241 = _2225 * _1877;
    float _2243 = _2239 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2245 = _2239;
    if (!_1611)
    {
        float _2247 = -_2187;
        float _2249 = _1478 + _2247;
        _2245 = _2249;
    }
    float _2251 = _2245;
    float _2253 = _2201;
    if (!_1611)
    {
        float _2255 = rint(_2129);
        float _2257 = precise::max(_2255, 0.0);
        uint _2259 = uint(_2257);
        uint _2261 = clamp(_2259, 0u, 65535u);
        _2253 = as_type<float>(_2261);
    }
    float _2263 = _2253;
    float _2265 = _2217 * _2219;
    float _2267 = _2223 * _2219;
    float _2269 = fma(_2265, 0.5, 0.5);
    float _2271 = fma(_2267, -0.5, 0.5);
    float _2273 = _2265;
    if (_2161)
    {
        float3 _9159 = float3(_2019, _2133, float(as_type<int>(_2237)));
        float3 _9163 = select(_9159, float3(0.0), isnan(_9159));
        float _2275 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _9163.xy, uint(rint(_9163.z)), _2241, level(0.0));
        _2273 = _2275;
    }
    float _2277 = _2273;
    float3 _9173 = float3(_2269, _2271, _2243);
    float _2279 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9173, float3(0.0), isnan(_9173)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9173, float3(0.0), isnan(_9173)), level(0.0)).x;
    float3 _9182 = float3(_2269, _2271, _2243);
    float4 _2282 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9182, float3(0.0), isnan(_9182)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9182, float3(0.0), isnan(_9182)), level(0.0)).xyzw;
    float _2284 = _2282.x;
    float _2286 = _2282.y;
    float _2288 = _2282.z;
    float _2290 = _2282.w;
    float _2292 = _2251;
    float _2294 = _2263;
    if (!_1611)
    {
        float3 _9206 = float3(_2207, _2251, float(as_type<int>(_2263)));
        float3 _9208 = select(_9206, float3(0.0), isnan(_9206));
        float _2296 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _9208.xy, uint(rint(_9208.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _9208.xy, uint(rint(_9208.z)), level(0.0)).x;
        _2292 = _2296;
    }
    float _2298 = _2292;
    float _2300 = float(uint(_1034));
    float _2302 = trunc(_1342);
    int _2304 = int(_2302);
    int _2306 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2308 = _2306 != 0;
    float _2310 = _1362 * _1084;
    int _2312 = abs(_1146);
    int _2314 = abs(_1176);
    int _2316 = abs(_1947);
    float _2318 = 1.0 / _2300;
    float _2320 = float(uint(_2304));
    float _2322 = trunc(_2310);
    int _2324 = int(_2322);
    int _2326 = as_type<int>(_2318) + (-2);
    float _2328 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _2330 = int(_2328);
    float _2332 = as_type<float>(_2326) * _2320;
    float _2334 = trunc(_2332);
    float _2336 = precise::max(_2334, 0.0);
    uint _2338 = uint(_2336);
    int _2340 = ~_1034;
    int _2342 = _2340 + 1;
    float _2344 = trunc(_1060);
    int _2346 = int(_2344);
    int _2348 = _2342 * int(_2338);
    int _2350 = _2348 + _2304;
    if (_2308)
    {
        _2294 = 1.0;
    }
    float _2352 = _2294;
    float _2354 = _2352;
    if (!_2308)
    {
        _2354 = 7.345489978790283203125;
    }
    float _2356 = _2354;
    float _2358 = float(uint(_2350));
    int _2360 = ~_1034;
    int _2362 = _2360 + 1;
    float _2364 = _2356 * _854;
    float _2366 = float(_2304);
    float _2368 = as_type<float>(_2326) * _2358;
    int _2370 = ~_2330;
    int _2372 = _2370 + 1;
    bool _2374 = _2366 >= _1352;
    bool _2376 = isnan(_2366);
    bool _2378 = _2374 || _2376;
    bool _2380 = isnan(_1352);
    bool _2382 = _2378 || _2380;
    float _2384 = float(_2382);
    float _2386 = trunc(_2368);
    float _2388 = precise::max(_2386, 0.0);
    uint _2390 = uint(_2388);
    int _2392 = ~_2330;
    int _2394 = _2392 + 1;
    float _2396 = trunc(_2384);
    int _2398 = int(_2396);
    int _2400 = int(_2338) + int(_2390);
    float _2402 = floor(_2364);
    int _2404 = _2362 * _2400;
    int _2406 = _2404 + _2304;
    bool _2408 = uint(_2406) >= uint(_1034);
    bool _2410 = !_2408;
    int _2412 = _2410 ? 0 : (-1);
    bool _2414 = _1034 == 0;
    int _2416 = ~_2400;
    int _2418 = _2416 + _2412;
    int _2420 = _2418 + 1;
    float _2422 = -_2402;
    float _2424 = _2364 + _2422;
    int _2426 = _1034 + (-1);
    float _2428 = in.m_63.w;
    int _2430 = _1034 * _2420;
    int _2432 = _2430 + _2304;
    float _2434 = _2424 * _1352;
    int _2436 = ~_2398;
    int _2438 = _2436 + 1;
    int _2440 = _2438 + 1;
    bool _2442 = !_2414;
    int _2444 = _2442 ? _2432 : (-1);
    float _2446 = trunc(_2434);
    int _2448 = int(_2446);
    int _2450 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2452 = _2450 != 0;
    int _2454 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2456 = _2454 != 0;
    int _2458 = _2444 * _2440;
    bool _2460 = !_2452;
    int _2462 = _2460 ? 0 : 1;
    int _2464 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2466 = _2464 != 0;
    int _2468 = _2398 * _2426;
    int _2470 = _2468 + _2458;
    int _2472 = abs(_2462);
    int _2474 = abs(_1152);
    float _2476 = trunc(_1366);
    int _2478 = int(_2476);
    int _2480 = _2470 * _2312;
    bool _2482 = !_2466;
    int _2484 = _2482 ? 0 : 1;
    float _2486 = float(uint(_2346));
    int _2488 = _2448 * _2472;
    int _2490 = _2488 + _2304;
    int _2492 = abs(_2484);
    int _2494 = _2324 * _2474;
    int _2496 = _2494 + _2480;
    float _2498 = in.m_75.x;
    float _2500 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _2502 = int(_2500);
    int _2504 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2506 = _2504 != 0;
    int _2508 = _2490 * _2314;
    int _2510 = _2508 + _2496;
    bool _2512 = _2466;
    float _2514 = as_type<float>(_2372);
    if (_2456)
    {
        bool _2516 = _854 > 0.5;
        _2512 = _2516;
    }
    bool _2518 = _2512;
    float _2520 = float(uint(_2478));
    int _2522 = _2448 * _2492;
    int _2524 = _2522 + _2510;
    float _2526 = float(uint(_2330));
    float _2528 = 1.0 / _2526;
    float _2530 = float(uint(_2524));
    float _2532 = float(uint(_2502));
    float _2534 = as_type<float>(_2326) * _2530;
    int _2536 = ~_1034;
    int _2538 = _2536 + 1;
    float _2540 = trunc(_2534);
    float _2542 = precise::max(_2540, 0.0);
    uint _2544 = uint(_2542);
    int _2546 = _2538;
    if (!_2456)
    {
        _932 = _2498;
    }
    float _2548 = _932;
    float _2550 = _2548;
    if (_2506)
    {
        float _2552 = -_2498;
        float _2554 = _2552 + 1.0;
        _1388 = as_type<int>(_2554);
    }
    int _2556 = _1388;
    int _2558 = as_type<int>(_2528) + (-2);
    float _2560 = 1.0 / _2532;
    float _2562 = as_type<float>(_2558) * _2486;
    float _2564 = trunc(_2562);
    float _2566 = precise::max(_2564, 0.0);
    uint _2568 = uint(_2566);
    int _2570 = _2538 * int(_2544);
    int _2572 = _2570 + _2524;
    int _2574 = int(_2544);
    if (_2456)
    {
        float _2576 = -_2498;
        float _2578 = _2576 + 1.0;
        _2546 = as_type<int>(_2578);
    }
    int _2580 = _2546;
    float _2582 = float(uint(_2572));
    float _2584 = _2582;
    if (_2456)
    {
        float _2586 = _2518 ? as_type<float>(_2580) : _2498;
        _2550 = _2586;
    }
    float _2588 = _2550;
    float _2590 = as_type<float>(_2326) * _2582;
    int _2592 = as_type<int>(_2560) + (-2);
    bool _2594 = _870 > 0.5;
    float _2596 = trunc(_2590);
    float _2598 = precise::max(_2596, 0.0);
    uint _2600 = uint(_2598);
    int _2602 = _2372 * int(_2568);
    int _2604 = _2602 + _2346;
    float _2606 = as_type<float>(_2592) * _2520;
    int _2608 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2610 = _2608 != 0;
    float _2612 = as_type<float>(_2372);
    if (_2308)
    {
        _2584 = _854;
    }
    float _2614 = _2584;
    float _2616 = float(uint(_2604));
    float _2618 = trunc(_2606);
    float _2620 = precise::max(_2618, 0.0);
    uint _2622 = uint(_2620);
    float _2624 = _2614;
    if (_2308)
    {
        _2612 = 1.0;
    }
    float _2626 = _2612;
    float _2628 = _2626;
    if (!_2506)
    {
        _2514 = _2498;
    }
    float _2630 = _2514;
    float _2632 = as_type<float>(_2558) * _2616;
    float _2634 = _2630;
    if (!_2308)
    {
        _2624 = _860;
    }
    float _2636 = _2624;
    if (!_2308)
    {
        _2628 = 1.2345600128173828125;
    }
    float _2638 = _2628;
    if (_2506)
    {
        float _2640 = _2594 ? as_type<float>(_2556) : _2498;
        _2634 = _2640;
    }
    float _2642 = _2634;
    int _2644 = ~_2502;
    int _2646 = _2644 + 1;
    float _2648 = _2636 * _2638;
    int _2650 = int(_2544) + int(_2600);
    if (_2610)
    {
        float _2652 = -_2498;
        float _2654 = _2652 + 1.0;
        _2574 = as_type<int>(_2654);
    }
    int _2656 = _2574;
    float _2658 = floor(_2648);
    bool _2660 = _860 > 0.5;
    float _2662 = as_type<float>(_2656);
    if (!_2610)
    {
        _934 = _2498;
    }
    float _2664 = _934;
    int _2666 = _2646 * int(_2622);
    int _2668 = _2666 + _2478;
    int _2670 = ~_1034;
    int _2672 = _2670 + 1;
    float _2674 = _2664;
    if (_2610)
    {
        float _2676 = _2660 ? as_type<float>(_2656) : _2498;
        _2674 = _2676;
    }
    float _2678 = _2674;
    float _2680 = trunc(_2632);
    float _2682 = precise::max(_2680, 0.0);
    uint _2684 = uint(_2682);
    float _2686 = float(uint(_2668));
    int _2688 = _2672 * _2650;
    int _2690 = _2688 + _2524;
    if (_2308)
    {
        _2662 = 1.0;
    }
    float _2692 = _2662;
    float _2694 = _2692;
    if (!_2308)
    {
        _936 = _870;
    }
    float _2696 = _936;
    float _2698 = as_type<float>(_2592) * _2686;
    float _2700 = float(_2330);
    float _2702 = in.m_75.y;
    if (!_2308)
    {
        _2694 = 5.839270114898681640625;
    }
    float _2704 = _2694;
    float _2706 = trunc(_2698);
    float _2708 = precise::max(_2706, 0.0);
    uint _2710 = uint(_2708);
    bool _2712 = uint(_2690) >= uint(_1034);
    float _2714 = _2696 * _2704;
    int _2716 = int(_2568) + int(_2684);
    float _2718 = float(_2346);
    bool _2720 = !_2712;
    int _2722 = _2720 ? 0 : (-1);
    int _2724 = _2394 * _2716;
    int _2726 = _2724 + _2346;
    bool _2728 = _2718 >= _2700;
    bool _2730 = isnan(_2718);
    bool _2732 = _2728 || _2730;
    bool _2734 = isnan(_2700);
    bool _2736 = _2732 || _2734;
    float _2738 = float(_2736);
    float _2740 = floor(_2714);
    bool _2742 = _2428 > 0.5;
    float _2744 = -_2658;
    float _2746 = _2648 + _2744;
    bool _2748 = uint(_2726) >= uint(_2330);
    int _2750 = ~_2502;
    int _2752 = _2750 + 1;
    float _2754 = _2700 * _2746;
    bool _2756 = !_2748;
    int _2758 = _2756 ? 0 : (-1);
    float _2760 = trunc(_2738);
    int _2762 = int(_2760);
    int _2764 = int(_2622) + int(_2710);
    float _2766 = -_2702;
    float _2768 = _2766 + 1.0;
    int _2770 = ~_2716;
    int _2772 = _2770 + _2758;
    int _2774 = _2772 + 1;
    float _2776 = _2700 * _1148;
    int _2778 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2780 = _2778 != 0;
    int _2782 = _2330 * _2774;
    int _2784 = _2782 + _2346;
    int _2786 = _2660 ? as_type<int>(_2768) : as_type<int>(_2702);
    int _2788 = _2752 * _2764;
    int _2790 = _2788 + _2478;
    bool _2792 = _2330 == 0;
    float _2794 = trunc(_2776);
    int _2796 = int(_2794);
    float _2798 = _2780 ? as_type<float>(_2786) : _2702;
    float _2800 = -_2740;
    float _2802 = _2714 + _2800;
    int _2804 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2806 = _2804 != 0;
    int _2808 = ~_2762;
    int _2810 = _2808 + 1;
    int _2812 = _2810 + 1;
    bool _2814 = !_2792;
    int _2816 = _2814 ? _2784 : (-1);
    int _2818 = _2742 ? as_type<int>(_2768) : as_type<int>(_2702);
    bool _2820 = !_2806;
    int _2822 = _2820 ? 0 : 1;
    bool _2824 = uint(_2790) >= uint(_2502);
    int _2826 = _2812 * _2816;
    int _2828 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _2830 = _2828 != 0;
    float _2832 = trunc(_2754);
    int _2834 = int(_2832);
    int _2836 = _2330 + (-1);
    bool _2838 = !_2824;
    int _2840 = _2838 ? 0 : (-1);
    bool _2842 = !_2830;
    int _2844 = _2842 ? 0 : 1;
    int _2846 = _2762 * _2836;
    int _2848 = _2846 + _2826;
    int _2850 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _2852 = _2850 != 0;
    int _2854 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _2856 = _2854 != 0;
    float _2858 = float(_2502);
    float _2860 = float(_2478);
    int _2862 = abs(_1927);
    int _2864 = abs(_2822);
    int _2866 = abs(_1943);
    int _2868 = _2848 * _2862;
    bool _2870 = _2860 >= _2858;
    bool _2872 = isnan(_2860);
    bool _2874 = _2870 || _2872;
    bool _2876 = isnan(_2858);
    bool _2878 = _2874 || _2876;
    float _2880 = float(_2878);
    int _2882 = _2834 * _2864;
    int _2884 = _2882 + _2346;
    float _2886 = _2858 * _2802;
    int _2888 = abs(_1951);
    float _2890 = _2858 * _1148;
    float _2892 = trunc(_2880);
    int _2894 = int(_2892);
    int _2896 = _2796 * _2866;
    int _2898 = _2896 + _2868;
    int _2900 = ~_2764;
    int _2902 = _2900 + _2840;
    int _2904 = _2902 + 1;
    int _2906 = _2884 * _2316;
    int _2908 = _2906 + _2898;
    bool _2910 = !_2852;
    int _2912 = _2910 ? 0 : 1;
    int _2914 = _2502 * _2904;
    int _2916 = _2914 + _2478;
    bool _2918 = _2502 == 0;
    int _2920 = _2834 * _2888;
    int _2922 = _2920 + _2908;
    float _2924 = trunc(_2886);
    int _2926 = int(_2924);
    int _2928 = abs(_2844);
    bool _2930 = !_2918;
    int _2932 = _2930 ? _2916 : (-1);
    float _2934 = float(uint(_2922));
    int _2936 = ~_2894;
    int _2938 = _2936 + 1;
    int _2940 = _2938 + 1;
    float _2942 = trunc(_2890);
    int _2944 = int(_2942);
    int _2946 = _2502 + (-1);
    int _2948 = ~_2650;
    int _2950 = _2948 + _2722;
    int _2952 = _2950 + 1;
    int _2954 = _2940 * _2932;
    int _2956 = abs(_1182);
    float _2958 = as_type<float>(_2558) * _2934;
    int _2960 = _2894 * _2946;
    int _2962 = _2960 + _2954;
    int _2964 = abs(_1188);
    int _2966 = _2926 * _2928;
    int _2968 = _2966 + _2478;
    int _2970 = _1034 * _2952;
    int _2972 = _2970 + _2524;
    float _2974 = trunc(_2958);
    float _2976 = precise::max(_2974, 0.0);
    uint _2978 = uint(_2976);
    int _2980 = abs(_2912);
    int _2982 = _2962 * _2956;
    float _2984 = float(uint(_2490));
    bool _2986 = !_2856;
    int _2988 = _2986 ? 0 : 1;
    int _2990 = _2944 * _2964;
    int _2992 = _2990 + _2982;
    int _2994 = ~_2330;
    int _2996 = _2994 + 1;
    float _2998 = as_type<float>(_2326) * _2984;
    int _3000 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _3002 = _3000 != 0;
    int _3004 = _2968 * _2980;
    int _3006 = _3004 + _2992;
    int _3008 = abs(_2988);
    float _3010 = _3002 ? as_type<float>(_2818) : _2702;
    float _3012 = trunc(_2998);
    float _3014 = precise::max(_3012, 0.0);
    uint _3016 = uint(_3014);
    int _3018 = _2996 * int(_2978);
    int _3020 = _3018 + _2922;
    int _3022 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _3024 = _3022 != 0;
    float _3026 = float(uint(_3020));
    int _3028 = _2926 * _3008;
    int _3030 = _3028 + _3006;
    int _3032 = ~_1034;
    int _3034 = _3032 + 1;
    bool _3036 = !_2414;
    int _3038 = _3036 ? _2972 : (-1);
    float _3040 = as_type<float>(_2558) * _3026;
    float _3042 = float(uint(_3030));
    float _3044 = trunc(_3040);
    float _3046 = precise::max(_3044, 0.0);
    uint _3048 = uint(_3046);
    int _3050 = ~_2502;
    int _3052 = _3050 + 1;
    int _3054 = _3034 * int(_3016);
    int _3056 = _3054 + _2490;
    float _3058 = _2702;
    float _3060 = as_type<float>(_2862);
    if (_3024)
    {
        float _3062 = _2594 ? _2768 : _2702;
        _3058 = _3062;
    }
    float _3064 = _3058;
    float _3066 = as_type<float>(_2592) * _3042;
    int _3068 = _3038 & 3;
    bool _3070 = _3068 != 0;
    int _3072 = _3038 & 3;
    bool _3074 = _3072 != 0;
    float _3076 = trunc(_3066);
    float _3078 = precise::max(_3076, 0.0);
    uint _3080 = uint(_3078);
    float _3082 = float(uint(_3056));
    int _3084 = _3070 ? 0 : 1;
    bool _3086 = uint(_3072) > 1u;
    float _3088 = as_type<float>(_2326) * _3082;
    float _3090 = float(uint(_2884));
    int _3092 = ~_3084;
    int _3094 = _3092 + 1;
    int _3096 = _3094 + 1;
    int _3098 = int(_2978) + int(_3048);
    float _3100 = trunc(_3088);
    float _3102 = precise::max(_3100, 0.0);
    uint _3104 = uint(_3102);
    float _3106 = as_type<float>(_2558) * _3090;
    int _3108 = ~_2330;
    int _3110 = _3108 + 1;
    int _3112 = _3052 * int(_3080);
    int _3114 = _3112 + _3030;
    int _3116 = ~_2330;
    int _3118 = _3116 + 1;
    int _3120 = _3096;
    float _3122 = as_type<float>(_3098);
    if (!_3086)
    {
        int _3124 = ~_3084;
        int _3126 = _3124 + 1;
        _3120 = _3126;
    }
    int _3128 = _3120;
    float _3130 = trunc(_3106);
    float _3132 = precise::max(_3130, 0.0);
    uint _3134 = uint(_3132);
    bool _3136 = uint(_3072) >= 2u;
    float _3138 = float(uint(_3114));
    int _3140 = _3136 ? 0 : 1;
    bool _3142 = _3072 != 3;
    float _3144 = as_type<float>(_2592) * _3138;
    int _3146 = int(_3016) + int(_3104);
    int _3148 = _3118 * _3098;
    int _3150 = _3148 + _2922;
    float _3152 = trunc(_3144);
    float _3154 = precise::max(_3152, 0.0);
    uint _3156 = uint(_3154);
    int _3158 = ~_3140;
    int _3160 = _3158 + 1;
    int _3162 = _3160 + 1;
    int _3164 = ~_1034;
    int _3166 = _3164 + 1;
    int _3168 = _3110 * int(_3134);
    int _3170 = _3168 + _2884;
    int _3172 = _3162;
    if (_3142)
    {
        int _3174 = ~_3140;
        int _3176 = _3174 + 1;
        _3172 = _3176;
    }
    int _3178 = _3172;
    bool _3180 = uint(_3150) >= uint(_2330);
    int _3182 = _3166 * _3146;
    int _3184 = _3182 + _2490;
    float _3186 = float(uint(_3170));
    bool _3188 = !_3180;
    int _3190 = _3188 ? 0 : (-1);
    bool _3192 = uint(_3184) >= uint(_1034);
    float _3194 = as_type<float>(_2558) * _3186;
    int _3196 = ~_3098;
    int _3198 = _3196 + _3190;
    int _3200 = _3198 + 1;
    int _3202 = int(_3080) + int(_3156);
    if (_1611)
    {
        _3122 = 1.0;
    }
    float _3204 = _3122;
    int _3206 = _2330 * _3200;
    int _3208 = _3206 + _2922;
    float _3210 = _3204;
    if (!_1611)
    {
        int _3212 = _1675 << 4;
        int _3214 = _3212 + 2048;
        uint _3216 = uint(int(uint(_3214) >> uint(2)));
        uint _3218 = uint(int(uint(int(_3216)) >> uint(2)));
        int _3220 = int(_3216) & 3;
        float _3222 = (*spvDescriptorSet0.vp_c15)._m0[int(_3218)][_3220];
        int _3224 = int(_3216) + 1;
        uint _3226 = uint(int(uint(_3224) >> uint(2)));
        int _3228 = _3224 & 3;
        float _3230 = (*spvDescriptorSet0.vp_c15)._m0[int(_3226)][_3228];
        int _3232 = _3214 + 8;
        uint _3234 = uint(int(uint(_3232) >> uint(2)));
        uint _3236 = uint(int(uint(int(_3234)) >> uint(2)));
        int _3238 = int(_3234) & 3;
        float _3240 = (*spvDescriptorSet0.vp_c15)._m0[int(_3236)][_3238];
        int _3242 = int(_3234) + 1;
        uint _3244 = uint(int(uint(_3242) >> uint(2)));
        int _3246 = _3242 & 3;
        float _3248 = (*spvDescriptorSet0.vp_c15)._m0[int(_3244)][_3246];
        float _3250 = _1288 * _3230;
        float _3252 = fma(_832, _3222, _3250);
        float _3254 = fma(_834, _3240, _3252);
        float _3256 = _3254 + _3248;
        float _3258 = precise::clamp(_3256, 0.0, 1.0);
        float _3260 = -_3258;
        float _3262 = _3260 + _2298;
        float _3264 = fma(_3262, 500.0, 1.5);
        float _3266 = exp2(_3264);
        float _3268 = 0.0 + _3266;
        float _3270 = precise::clamp(_3268, 0.0, 1.0);
        _1390 = _3250;
        _1677 = as_type<float>(_3214);
        _3210 = _3270;
    }
    float _3272 = _1390;
    float _3274 = _1677;
    float _3276 = _3210;
    float _3278 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3280 = _2079 + _3278;
    float _3282 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3284 = _2081 + _3282;
    float _3286 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3288 = _2083 + _3286;
    bool _3290 = !_2792;
    int _3292 = _3290 ? _3208 : (-1);
    float _3294 = _3280 * _3280;
    bool _3296 = !_3192;
    int _3298 = _3296 ? 0 : (-1);
    float _3300 = fma(_3284, _3284, _3294);
    float _3302 = fma(_3288, _3288, _3300);
    float _3304 = rsqrt(_3302);
    float _3306 = sqrt(_3302);
    float _3308 = _3304 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3310 = _3284 * _3308;
    float _3312 = _3288 * _3308;
    float _3314 = _3310 * _3310;
    float _3316 = _3312 * _3312;
    float _3318 = _3314 + _3316;
    float _3320 = sqrt(_3318);
    bool _3322 = _3320 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3324 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3326 = _3320 + _3324;
    float _3328 = _3304;
    float _3330 = _3272;
    float _3332 = _3326;
    float _3334 = _3280;
    float _3336 = _3274;
    if (_3322)
    {
        float _3338 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3328 = _3338;
    }
    float _3340 = _3328;
    if (_3322)
    {
        float _3342 = rsqrt(_3318);
        _3330 = _3342;
    }
    float _3344 = _3330;
    float _3346 = _3344;
    if (_3322)
    {
        float _3348 = _3326 * _3340;
        _3332 = _3348;
    }
    float _3350 = _3332;
    bool _3352 = !_3074;
    int _3354 = _3352 ? 0 : 1;
    if (_3322)
    {
        float _3356 = _3350 * 0.15915493667125701904296875;
        _938 = _3356;
    }
    float _3358 = _938;
    float _3360 = _3288;
    if (_3322)
    {
        float _3362 = _3358 * 6.283185482025146484375;
        float _3364 = sin(_3362);
        _3360 = _3364;
    }
    float _3366 = _3360;
    float _3368 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3370 = precise::max(0.0, _3368);
    float _3372 = _3340;
    float _3374 = _3370;
    if (_3322)
    {
        float _3376 = _3358 * 6.283185482025146484375;
        float _3378 = cos(_3376);
        _3372 = _3378;
    }
    float _3380 = _3372;
    float _3382 = -_3308;
    float _3384 = -_3370;
    float _3386 = fma(_3280, _3382, _3384);
    if (_3322)
    {
        float _3388 = _3386 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3334 = _3388;
    }
    float _3390 = _3334;
    float _3392 = _3390;
    float _3394 = _3366;
    if (_3322)
    {
        float _3396 = fma(_3366, _3390, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3392 = _3396;
    }
    float _3398 = _3392;
    float _3400 = _3398;
    if (!_3322)
    {
        _3394 = _3310;
    }
    float _3402 = _3394;
    float _3404 = _3402;
    float _3406 = _3380;
    if (_3322)
    {
        float _3408 = _3380 + (-1.0);
        _3374 = _3408;
    }
    float _3410 = _3374;
    float _3412 = _3410;
    if (_3322)
    {
        float _3414 = _3344 * _3398;
        _3060 = _3414;
    }
    float _3416 = _3060;
    if (!_3322)
    {
        _3400 = _3386;
    }
    float _3418 = _3400;
    float _3420 = _3418;
    if (_3322)
    {
        float _3422 = _3410 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3336 = _3422;
    }
    float _3424 = _3336;
    if (_3322)
    {
        float _3426 = _3310 * _3416;
        _3404 = _3426;
    }
    float _3428 = _3404;
    if (!_3322)
    {
        _3412 = _3312;
    }
    float _3430 = _3412;
    float _3432 = _3430;
    if (_3322)
    {
        float _3434 = _3312 * _3416;
        _3432 = _3434;
    }
    float _3436 = _3432;
    if (!_3322)
    {
        _3346 = _3314;
    }
    float _3438 = _3346;
    float _3440 = _3438;
    if (_3322)
    {
        float _3442 = fma(_3386, _3380, _3424);
        _3420 = _3442;
    }
    float _3444 = _3420;
    if (_3322)
    {
        float _3446 = _3428 * _3428;
        _3440 = _3446;
    }
    float _3448 = _3440;
    if (!_3322)
    {
        _3406 = _3316;
    }
    float _3450 = _3406;
    float _3452 = _3450;
    if (_3322)
    {
        float _3454 = _3436 * _3436;
        _3452 = _3454;
    }
    float _3456 = _3452;
    float _3458 = fma(_3444, _3444, _3448);
    int _3460 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _3462 = _3460 != 0;
    float _3464 = _3458 + _3456;
    float _3466 = rsqrt(_3464);
    float _3468 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3470 = fma(_3306, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3468);
    float _3472 = precise::clamp(_3470, 0.0, 1.0);
    float _3474 = -_3472;
    float _3476 = _3474 + 1.0;
    float _3478 = abs(_3476);
    float _3480 = log2(_3478);
    float _3482 = _3466 * _3428;
    float _3484 = _3466 * _3444;
    float _3486 = _3466 * _3436;
    float _3488 = _3482 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3490 = -_3488;
    float _3492 = fma(_3484, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3490);
    float _3494 = _3480 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3496 = -_3486;
    float _3498 = fma(_3496, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3492);
    float _3500 = exp2(_3494);
    float _3502 = fma(_3498, -0.5, 0.5);
    float _3504 = fma(_3498, 0.5, 0.5);
    float _3506 = fma(_3504, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3508 = sqrt(_3502);
    float _3510 = fma(_3504, _3506, -0.212114393711090087890625);
    float _3512 = fma(_3504, _3510, 1.570728778839111328125);
    float _3514 = _3484 + 1.0;
    float _3516 = -_3484;
    float _3518 = fma(_3500, _3514, _3516);
    int _3520 = _3292 & 3;
    bool _3522 = _3520 != 0;
    float _3524 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _3526 = _3524 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _3528 = !_3462;
    int _3530 = _3528 ? 0 : 1;
    float _3532 = fma(_3518, 0.5, 0.5);
    float _3534 = _3508 * 0.636619746685028076171875;
    int _3536 = ~_2502;
    int _3538 = _3536 + 1;
    bool _3540 = _3520 != 3;
    float _3542 = -_3512;
    float _3544 = fma(_3534, _3542, 1.0);
    bool _3546 = uint(_3520) >= 2u;
    int _3548 = _3538 * _3202;
    int _3550 = _3548 + _3030;
    float _3552 = 1.0 / _3526;
    int _3554 = _3546 ? 0 : 1;
    float2 _10978 = float2(_3544, _3532);
    float3 _3558 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_10978, float2(0.0), isnan(_10978)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_10978, float2(0.0), isnan(_10978)), level(0.0)).xyz;
    float _3560 = _3558.x;
    float _3562 = _3558.y;
    float _3564 = _3558.z;
    bool _3566 = uint(_3550) >= uint(_2502);
    float _3568 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _3570 = _3568 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    int _3572 = _3522 ? 0 : 1;
    float _3574 = trunc(_3194);
    float _3576 = precise::max(_3574, 0.0);
    uint _3578 = uint(_3576);
    bool _3580 = _3072 != 3;
    float _3582 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _3584 = _812 + _3582;
    int _3586 = ~_3554;
    int _3588 = _3586 + 1;
    int _3590 = _3588 + 1;
    float _3592 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _3594 = _812 + _3592;
    int _3596 = _3590;
    if (_3540)
    {
        int _3598 = ~_3554;
        int _3600 = _3598 + 1;
        _3596 = _3600;
    }
    int _3602 = _3596;
    float _3604 = _3480 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _3606 = !_3580;
    int _3608 = _3606 ? 0 : (-1);
    float _3610 = 1.0 / _3570;
    bool _3612 = _3520 != 3;
    float _3614 = -_852;
    float _3616 = _3614 + 1.0;
    bool _3618 = uint(_3520) > 1u;
    out.m_77.x = _2081;
    out.m_77.y = _2079;
    out.m_77.z = _2083;
    bool _3620 = !_3612;
    int _3622 = _3620 ? 0 : (-1);
    bool _3624 = !_3566;
    int _3626 = _3624 ? 0 : (-1);
    float _3628 = exp2(_3604);
    int _3630 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _3632 = _3630 != 0;
    int _3634 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _3636 = _3634 != 0;
    float _3638 = float(uint(_2968));
    int _3640 = int(_3134) + int(_3578);
    int _3642 = ~_2330;
    int _3644 = _3642 + 1;
    float _3646 = as_type<float>(_2592) * _3638;
    int _3648 = ~_3202;
    int _3650 = _3648 + _3626;
    int _3652 = _3650 + 1;
    int _3654 = ~_3572;
    int _3656 = _3654 + 1;
    int _3658 = _3656 + 1;
    int _3660 = _3644 * _3640;
    int _3662 = _3660 + _2884;
    int _3664 = _3658;
    if (!_3618)
    {
        int _3666 = ~_3572;
        int _3668 = _3666 + 1;
        _3664 = _3668;
    }
    int _3670 = _3664;
    int _3672 = _2502 * _3652;
    int _3674 = _3672 + _3030;
    int _3676 = _3292 & 3;
    bool _3678 = _3676 != 0;
    float _3680 = trunc(_3646);
    float _3682 = precise::max(_3680, 0.0);
    uint _3684 = uint(_3682);
    float _3686 = -_3628;
    float _3688 = _3686 + 1.0;
    bool _3690 = !_3678;
    int _3692 = _3690 ? 0 : 1;
    bool _3694 = uint(_3662) >= uint(_2330);
    float _3696 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _3698 = _3696 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _3700 = !_2918;
    int _3702 = _3700 ? _3674 : (-1);
    float _3704 = _3688 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _3706 = !_3694;
    int _3708 = _3706 ? 0 : (-1);
    int _3710 = _3702 & 3;
    bool _3712 = _3710 != 0;
    float _3714 = 1.0 / _3698;
    int _3716 = ~_2502;
    int _3718 = _3716 + 1;
    float _3720 = _3704 * _2279;
    int _3722 = _3712 ? 0 : 1;
    bool _3724 = uint(_3710) >= 2u;
    int _3726 = _3718 * int(_3684);
    int _3728 = _3726 + _2968;
    int _3730 = _3724 ? 0 : 1;
    float _3732 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _3734 = _3732 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _3736 = _3710 != 3;
    float _3738 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _3740 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _3738;
    float _3742 = _3740 * _3552;
    float _3744 = float(uint(_3728));
    float _3746 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _3748 = _3746 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _3750 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _3752 = _3750 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _3754 = 1.0 / _3734;
    float _3756 = as_type<float>(_2592) * _3744;
    float _3758 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _3760 = _3758 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _3762 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _3764 = _812 + _3762;
    float _3766 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _3768 = _3766 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    bool _3770 = _812 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _3772 = isnan(_812);
    bool _3774 = _3770 || _3772;
    bool _3776 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _3778 = _3774 || _3776;
    float _3780 = float(_3778);
    float _3782 = 1.0 / _3748;
    float _3784 = _3768 * _3714;
    bool _3786 = _812 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _3788 = isnan(_812);
    bool _3790 = _3786 || _3788;
    bool _3792 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _3794 = _3790 || _3792;
    float _3796 = float(_3794);
    float _3798 = -_3780;
    float _3800 = _3798 + 1.0;
    int _3802 = ~_3146;
    int _3804 = _3802 + _3298;
    int _3806 = _3804 + 1;
    float _3808 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _3810 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _3808;
    float _3812 = fma(_3784, _3584, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _3814 = trunc(_3756);
    float _3816 = precise::max(_3814, 0.0);
    uint _3818 = uint(_3816);
    float _3820 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _3822 = _3820 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    int _3824 = ~_3730;
    int _3826 = _3824 + 1;
    int _3828 = _3826 + 1;
    float _3830 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _3832 = _812 + _3830;
    int _3834 = _3828;
    if (_3736)
    {
        int _3836 = ~_3730;
        int _3838 = _3836 + 1;
        _3834 = _3838;
    }
    int _3840 = _3834;
    float _3842 = _3822 * _3610;
    bool _3844 = _3710 != 3;
    float _3846 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _3848 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _3846;
    float _3850 = 1.0 / _3760;
    float _3852 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _3854 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _3852;
    bool _3856 = !_3844;
    int _3858 = _3856 ? 0 : (-1);
    float _3860 = _3848 * _3754;
    bool _3862 = uint(_3710) > 1u;
    float _3864 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _3866 = _812 + _3864;
    float _3868 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _3870 = _3868 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _3872 = _3854 * _3782;
    int _3874 = int(_3684) + int(_3818);
    float _3876 = fma(_3742, _3866, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _3878 = _812 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _3880 = isnan(_812);
    bool _3882 = _3878 || _3880;
    bool _3884 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _3886 = _3882 || _3884;
    float _3888 = float(_3886);
    float _3890 = 1.0 / _3752;
    int _3892 = ~_3722;
    int _3894 = _3892 + 1;
    int _3896 = _3894 + 1;
    float _3898 = fma(_3842, _3764, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    int _3900 = ~_2502;
    int _3902 = _3900 + 1;
    float _3904 = _3888 * _3800;
    float _3906 = _3870 * _3850;
    int _3908 = _3896;
    float _3910 = _3906;
    float _3912 = _3872;
    float _3914 = _3898;
    if (!_3862)
    {
        int _3916 = ~_3722;
        int _3918 = _3916 + 1;
        _3908 = _3918;
    }
    int _3920 = _3908;
    float _3922 = -_3888;
    float _3924 = _3922 + 1.0;
    bool _3926 = _812 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _3928 = isnan(_812);
    bool _3930 = _3926 || _3928;
    bool _3932 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _3934 = _3930 || _3932;
    float _3936 = float(_3934);
    int _3938 = _3902 * _3874;
    int _3940 = _3938 + _2968;
    bool _3942 = _812 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _3944 = isnan(_812);
    bool _3946 = _3942 || _3944;
    bool _3948 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _3950 = _3946 || _3948;
    float _3952 = float(_3950);
    int _3954 = _1034 * _3806;
    int _3956 = _3954 + _2490;
    bool _3958 = _812 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _3960 = isnan(_812);
    bool _3962 = _3958 || _3960;
    bool _3964 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _3966 = _3962 || _3964;
    float _3968 = float(_3966);
    float _3970 = -_3936;
    float _3972 = _3970 + 1.0;
    float _3974 = _3936 * _3924;
    bool _3976 = _812 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _3978 = isnan(_812);
    bool _3980 = _3976 || _3978;
    bool _3982 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _3984 = _3980 || _3982;
    float _3986 = float(_3984);
    float _3988 = -_3952;
    float _3990 = _3988 + 1.0;
    float _3992 = _3952 * _3972;
    int _3994 = _3702 & 3;
    bool _3996 = _3994 != 0;
    float _3998 = -_3968;
    float _4000 = _3998 + 1.0;
    bool _4002 = _812 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _4004 = isnan(_812);
    bool _4006 = _4002 || _4004;
    bool _4008 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _4010 = _4006 || _4008;
    float _4012 = float(_4010);
    float _4014 = _3986 * _3990;
    float _4016 = -_3986;
    float _4018 = _4016 + 1.0;
    float _4020 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _4022 = _812 + _4020;
    bool _4024 = !_3996;
    int _4026 = _4024 ? 0 : 1;
    float _4028 = -_4012;
    float _4030 = _4028 + 1.0;
    bool _4032 = uint(_3940) >= uint(_2502);
    float _4034 = _3810 * _3890;
    float _4036 = _3968 * _4018;
    float _4038 = in.m_79.x;
    float _4040 = in.m_79.y;
    float _4042 = in.m_79.z;
    float _4044 = fma(_3860, _4022, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _4046 = _4012 * _4000;
    bool _4048 = !_4032;
    int _4050 = _4048 ? 0 : (-1);
    float _4052 = in.m_81.x;
    float _4054 = in.m_81.y;
    float _4056 = in.m_81.z;
    float _4058 = in.m_81.w;
    float _4060 = _3796 * _4030;
    bool _4062 = _1430 != 0.0;
    bool _4064 = isnan(_1430);
    bool _4066 = _4062 || _4064;
    bool _4068 = isnan(0.0);
    bool _4070 = _4066 || _4068;
    float _4072 = -_3796;
    float _4074 = _4072 + 1.0;
    float _4076 = fma(_3872, _3594, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _4078 = _3876 * _4060;
    bool _4080 = _1428 == 0.0;
    bool _4082 = !_4070;
    bool _4084 = _4080 && _4082;
    float _4086 = fma(_3906, _3832, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    int _4088 = ~_3874;
    int _4090 = _4088 + _4050;
    int _4092 = _4090 + 1;
    float _4094 = fma(_4074, (*spvDescriptorSet0.vp_c9)._m0[159].x, _4078);
    bool _4096 = _1432 == 0.0;
    bool _4098 = _4096 && _4084;
    float _4100 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _4102 = _812 + _4100;
    int _4104 = ~_3640;
    int _4106 = _4104 + _3708;
    int _4108 = _4106 + 1;
    float _4110 = abs(_1498);
    float _4112 = log2(_4110);
    float _4114 = fma(_3898, _4046, _4094);
    float _4116 = fma(_4034, _4102, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    int _4118 = _2502 * _4092;
    int _4120 = _4118 + _2968;
    int _4122 = abs(_3692);
    float _4124 = fma(_4044, _4036, _4114);
    int _4126 = _2330 * _4108;
    int _4128 = _4126 + _2884;
    int _4130 = abs(_3128);
    float _4132 = fma(_3812, _4014, _4124);
    if (_4098)
    {
        _3910 = _4040;
    }
    float _4134 = _3910;
    float _4136 = _4134;
    if (!_4098)
    {
        float _4138 = fma(_1430, (*spvDescriptorSet0.vp_c9)._m0[17].y, _4040);
        _4136 = _4138;
    }
    float _4140 = _4136;
    float _4142 = _4054 * _4042;
    if (_4098)
    {
        _3912 = _4038;
    }
    float _4144 = _3912;
    float _4146 = _4144;
    if (!_4098)
    {
        float _4148 = fma(_1428, (*spvDescriptorSet0.vp_c9)._m0[17].y, _4038);
        _4146 = _4148;
    }
    float _4150 = _4146;
    if (_4098)
    {
        _3914 = _4042;
    }
    float _4152 = _3914;
    float _4154 = _4056 * _4038;
    float _4156 = _4112 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _4158 = _4152;
    if (!_4098)
    {
        float _4160 = fma(_1432, (*spvDescriptorSet0.vp_c9)._m0[17].y, _4042);
        _4158 = _4160;
    }
    float _4162 = _4158;
    float _4164 = _4052 * _4040;
    float _4166 = fma(_4076, _3992, _4132);
    float _4168 = -_4142;
    float _4170 = fma(_4056, _4040, _4168);
    float _4172 = -_4154;
    float _4174 = fma(_4052, _4042, _4172);
    float _4176 = -_4164;
    float _4178 = fma(_4054, _4038, _4176);
    float _4180 = fma(_4086, _3974, _4166);
    float _4182 = _4170 * _4058;
    float _4184 = exp2(_4156);
    int _4186 = _3702 >> 31;
    float _4188 = _4174 * _4058;
    float _4190 = _4178 * _4058;
    int _4192 = _3038 >> 31;
    float _4194 = fma(_4116, _3904, _4180);
    int _4196 = _4186 & 3;
    float _4198 = _1747 * _1641;
    int _4200 = _4192 & 3;
    float _4202 = fma(_3780, (*spvDescriptorSet0.vp_c9)._m0[166].x, _4194);
    int _4204 = _3702 + _4196;
    float _4206 = _1747 * _1887;
    float _4208 = _1719 * _1887;
    int _4210 = _3038 + _4200;
    float _4212 = _1719 * _1641;
    int _4214 = _4204 >> 2;
    float _4216 = fma(_4184, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4218 = precise::clamp(_4216, 0.0, 1.0);
    float _4220 = _1755 * _1645;
    int _4222 = _3292 >> 31;
    float _4224 = _4218 * _4218;
    int _4226 = _4214 << 4;
    int _4228 = _4226 + 656;
    float _4230 = fma(_4218, -2.0, 3.0);
    int _4232 = _4210 >> 2;
    float _4234 = fma(_1723, _1605, _4206);
    int _4236 = _4222 & 3;
    uint _4238 = uint(int(uint(_4228) >> uint(2)));
    uint _4240 = uint(int(uint(int(_4238)) >> uint(2)));
    int _4242 = int(_4238) & 3;
    float _4244 = (*spvDescriptorSet0.vp_c9)._m0[int(_4240)][_4242];
    int _4246 = int(_4238) + 1;
    uint _4248 = uint(int(uint(_4246) >> uint(2)));
    int _4250 = _4246 & 3;
    float _4252 = (*spvDescriptorSet0.vp_c9)._m0[int(_4248)][_4250];
    int _4254 = _4232 << 4;
    int _4256 = _4254 + 368;
    float _4258 = _4224 * _4230;
    int _4260 = _3292 + _4236;
    float _4262 = _1747 * _1645;
    float _4264 = _1719 * _1645;
    float _4266 = _1755 * _1887;
    int _4268 = _4260 >> 2;
    uint _4270 = uint(int(uint(_4256) >> uint(2)));
    uint _4272 = uint(int(uint(int(_4270)) >> uint(2)));
    int _4274 = int(_4270) & 3;
    float _4276 = (*spvDescriptorSet0.vp_c9)._m0[int(_4272)][_4274];
    int _4278 = int(_4270) + 1;
    uint _4280 = uint(int(uint(_4278) >> uint(2)));
    int _4282 = _4278 & 3;
    float _4284 = (*spvDescriptorSet0.vp_c9)._m0[int(_4280)][_4282];
    float _4286 = _1755 * _1641;
    float _4288 = fma(_1723, _1603, _4262);
    int _4290 = _4268 << 4;
    int _4292 = _4290 + 512;
    float _4294 = fma(_1723, _1607, _4198);
    float _4296 = -_1707;
    float _4298 = fma(_4296, _1603, _4264);
    float _4300 = -_1707;
    float _4302 = fma(_4300, _1605, _4208);
    float _4304 = -_1707;
    float _4306 = fma(_4304, _1607, _4212);
    int _4308 = _4256 + 8;
    uint _4310 = uint(int(uint(_4308) >> uint(2)));
    uint _4312 = uint(int(uint(int(_4310)) >> uint(2)));
    int _4314 = int(_4310) & 3;
    float _4316 = (*spvDescriptorSet0.vp_c9)._m0[int(_4312)][_4314];
    int _4318 = int(_4310) + 1;
    uint _4320 = uint(int(uint(_4318) >> uint(2)));
    int _4322 = _4318 & 3;
    float _4324 = (*spvDescriptorSet0.vp_c9)._m0[int(_4320)][_4322];
    float _4326 = fma(_1725, _1603, _4220);
    float _4328 = fma(_1725, _1605, _4266);
    float _4330 = fma(_1725, _1607, _4286);
    int _4332 = abs(_3670);
    float _4334 = fma(_1721, _1446, _4298);
    int _4336 = abs(_3920);
    float _4338 = fma(_1721, _1466, _4302);
    uint _4340 = uint(int(uint(_4292) >> uint(2)));
    uint _4342 = uint(int(uint(int(_4340)) >> uint(2)));
    int _4344 = int(_4340) & 3;
    float _4346 = (*spvDescriptorSet0.vp_c9)._m0[int(_4342)][_4344];
    int _4348 = int(_4340) + 1;
    uint _4350 = uint(int(uint(_4348) >> uint(2)));
    int _4352 = _4348 & 3;
    float _4354 = (*spvDescriptorSet0.vp_c9)._m0[int(_4350)][_4352];
    int _4356 = ~_4130;
    int _4358 = _4356 + 1;
    int _4360 = _4358 + 1;
    float _4362 = fma(_1721, _1454, _4306);
    int _4364 = ~_4336;
    int _4366 = _4364 + 1;
    int _4368 = _4366 + 1;
    float _4370 = fma(_1751, _1466, _4234);
    int _4372 = abs(_3178);
    float _4374 = fma(_1757, _1466, _4328);
    int _4376 = ~_4332;
    int _4378 = _4376 + 1;
    int _4380 = _4378 + 1;
    int _4382 = _4292 + 8;
    uint _4384 = uint(int(uint(_4382) >> uint(2)));
    uint _4386 = uint(int(uint(int(_4384)) >> uint(2)));
    int _4388 = int(_4384) & 3;
    float _4390 = (*spvDescriptorSet0.vp_c9)._m0[int(_4386)][_4388];
    int _4392 = int(_4384) + 1;
    uint _4394 = uint(int(uint(_4392) >> uint(2)));
    int _4396 = _4392 & 3;
    float _4398 = (*spvDescriptorSet0.vp_c9)._m0[int(_4394)][_4396];
    int _4400 = ~_4372;
    int _4402 = _4400 + 1;
    int _4404 = _4402 + 1;
    float _4406 = fma(_1751, _1446, _4288);
    float _4408 = fma(_1751, _1454, _4294);
    int _4410 = abs(_3840);
    float _4412 = fma(_1757, _1454, _4330);
    int _4414 = ~_4122;
    int _4416 = _4414 + 1;
    int _4418 = _4416 + 1;
    int _4420 = _4228 + 8;
    uint _4422 = uint(int(uint(_4420) >> uint(2)));
    uint _4424 = uint(int(uint(int(_4422)) >> uint(2)));
    int _4426 = int(_4422) & 3;
    float _4428 = (*spvDescriptorSet0.vp_c9)._m0[int(_4424)][_4426];
    int _4430 = int(_4422) + 1;
    uint _4432 = uint(int(uint(_4430) >> uint(2)));
    int _4434 = _4430 & 3;
    float _4436 = (*spvDescriptorSet0.vp_c9)._m0[int(_4432)][_4434];
    int _4438 = ~_4410;
    int _4440 = _4438 + 1;
    int _4442 = _4440 + 1;
    float _4444 = fma(_1757, _1446, _4326);
    bool _4446 = !_2792;
    int _4448 = _4446 ? _4128 : (-1);
    out.m_83.x = _4202;
    bool _4450 = !_2918;
    int _4452 = _4450 ? _4120 : (-1);
    int _4454 = _4368 * as_type<int>(_4252);
    int _4456 = abs(_3354);
    float _4458 = _4338 * _4054;
    float _4460 = _4362 * _4054;
    int _4462 = ~_4456;
    int _4464 = _4462 + 1;
    int _4466 = _4464 + 1;
    int _4468 = _4360 * as_type<int>(_4284);
    float _4470 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _4472 = int(_4470);
    int _4474 = _4466 * as_type<int>(_4276);
    int _4476 = _4474 + _4468;
    int _4478 = abs(_3602);
    float _4480 = _4188 * _4338;
    int _4482 = abs(_3530);
    int _4484 = _4404 * as_type<int>(_4316);
    int _4486 = _4484 + _4476;
    int _4488 = ~_4478;
    int _4490 = _4488 + 1;
    int _4492 = _4490 + 1;
    float _4494 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _4496 = int(_4494);
    int _4498 = _4380 * as_type<int>(_4354);
    int _4500 = abs(_4026);
    float _4502 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _4504 = int(_4502);
    float _4506 = float(uint(_4472));
    int _4508 = _4418 * as_type<int>(_4346);
    int _4510 = _4508 + _4498;
    int _4512 = ~_4500;
    int _4514 = _4512 + 1;
    int _4516 = _4514 + 1;
    int _4518 = abs(_3608);
    int _4520 = _4492 * as_type<int>(_4390);
    int _4522 = _4520 + _4510;
    int _4524 = abs(_3858);
    int _4526 = _4516 * as_type<int>(_4244);
    int _4528 = _4526 + _4454;
    int _4530 = ~_4518;
    int _4532 = _4530 + 1;
    int _4534 = _4532 + 1;
    float _4536 = 1.0 / _4506;
    int _4538 = abs(_3622);
    float _4540 = _4334 * _4054;
    int _4542 = ~_4524;
    int _4544 = _4542 + 1;
    int _4546 = _4544 + 1;
    int _4548 = _4534 * as_type<int>(_4324);
    int _4550 = _4548 + _4486;
    int _4552 = ~_4538;
    int _4554 = _4552 + 1;
    int _4556 = _4554 + 1;
    int _4558 = _4442 * as_type<int>(_4428);
    int _4560 = _4558 + _4528;
    float _4562 = float(uint(_4496));
    float _4564 = _4338 * _4140;
    int _4566 = abs(_4472);
    int _4568 = _4556 * as_type<int>(_4398);
    int _4570 = _4568 + _4522;
    float _4572 = 1.0 / _4562;
    float _4574 = float(uint(_4504));
    int _4576 = _4546 * as_type<int>(_4436);
    int _4578 = _4576 + _4560;
    bool _4580 = !_3632;
    int _4582 = _4580 ? 0 : 1;
    int _4584 = ~_4482;
    int _4586 = _4584 + 1;
    int _4588 = _4586 + 1;
    float _4590 = float(uint(_4566));
    float _4592 = 1.0 / _4574;
    bool _4594 = !_3636;
    int _4596 = _4594 ? 0 : 1;
    int _4598 = _4550 * _4588;
    int _4600 = abs(_4582);
    int _4602 = abs(_4596);
    int _4604 = ~_4600;
    int _4606 = _4604 + 1;
    int _4608 = _4606 + 1;
    float _4610 = 1.0 / _4590;
    bool _4612 = !_2414;
    int _4614 = _4612 ? _3956 : (-1);
    int _4616 = abs(_4504);
    int _4618 = _4608 * _4570;
    int _4620 = ~_4496;
    int _4622 = _4620 + 1;
    int _4624 = _4614 * _4482;
    int _4626 = _4624 + _4598;
    int _4628 = abs(_4496);
    int _4630 = ~_4602;
    int _4632 = _4630 + 1;
    int _4634 = _4632 + 1;
    float _4636 = float(uint(_4616));
    int _4638 = as_type<int>(_4536) + (-2);
    int _4640 = _4634 * _4578;
    float _4642 = float(uint(_4626));
    int _4644 = _4448 * _4600;
    int _4646 = _4644 + _4618;
    int _4648 = as_type<int>(_4592) + (-2);
    int _4650 = _4452 * _4602;
    int _4652 = _4650 + _4640;
    float _4654 = 1.0 / _4636;
    float _4656 = float(uint(_4628));
    float _4658 = _4334 * _4140;
    float _4660 = float(uint(_4646));
    float _4662 = _4362 * _4140;
    float _4664 = float(uint(_4652));
    int _4666 = abs(_4626);
    float _4668 = as_type<float>(_4648) * _4660;
    int _4670 = as_type<int>(_4572) + (-2);
    float _4672 = as_type<float>(_4638) * _4642;
    float _4674 = 1.0 / _4656;
    int _4676 = as_type<int>(_4610) + (-2);
    float _4678 = as_type<float>(_4670) * _4664;
    int _4680 = abs(_4646);
    int _4682 = as_type<int>(_4654) + (-2);
    float _4684 = trunc(_4672);
    float _4686 = precise::max(_4684, 0.0);
    uint _4688 = uint(_4686);
    int _4690 = ~_4472;
    int _4692 = _4690 + 1;
    float _4694 = float(uint(_4680));
    float _4696 = float(uint(_4666));
    float _4698 = trunc(_4678);
    float _4700 = precise::max(_4698, 0.0);
    uint _4702 = uint(_4700);
    int _4704 = abs(_4652);
    float _4706 = as_type<float>(_4682) * _4694;
    int _4708 = as_type<int>(_4674) + (-2);
    float _4710 = as_type<float>(_4676) * _4696;
    float _4712 = float(uint(_4704));
    float _4714 = _4188 * _4334;
    int _4716 = ~_4504;
    int _4718 = _4716 + 1;
    float _4720 = trunc(_4668);
    float _4722 = precise::max(_4720, 0.0);
    uint _4724 = uint(_4722);
    int _4726 = _4692 * int(_4688);
    int _4728 = _4726 + _4626;
    float _4730 = _4188 * _4362;
    float _4732 = as_type<float>(_4708) * _4712;
    float _4734 = fma(_4408, _4052, _4460);
    float _4736 = float(uint(_4728));
    float _4738 = fma(_4406, _4052, _4540);
    float _4740 = trunc(_4710);
    float _4742 = precise::max(_4740, 0.0);
    uint _4744 = uint(_4742);
    int _4746 = _4622 * int(_4702);
    int _4748 = _4746 + _4652;
    int _4750 = ~_4566;
    int _4752 = _4750 + 1;
    float _4754 = as_type<float>(_4638) * _4736;
    float _4756 = float(uint(_4748));
    float _4758 = trunc(_4706);
    float _4760 = precise::max(_4758, 0.0);
    uint _4762 = uint(_4760);
    int _4764 = _4718 * int(_4724);
    int _4766 = _4764 + _4646;
    float _4768 = fma(_4370, _4052, _4458);
    float _4770 = as_type<float>(_4670) * _4756;
    int _4772 = ~_4628;
    int _4774 = _4772 + 1;
    float _4776 = fma(_4406, _4150, _4658);
    float _4778 = float(uint(_4766));
    float _4780 = trunc(_4732);
    float _4782 = precise::max(_4780, 0.0);
    uint _4784 = uint(_4782);
    int _4786 = _4752 * int(_4744);
    int _4788 = _4786 + _4666;
    int _4790 = ~_4616;
    int _4792 = _4790 + 1;
    float _4794 = as_type<float>(_4648) * _4778;
    float _4796 = fma(_4182, _4406, _4714);
    float _4798 = float(uint(_4788));
    float _4800 = fma(_4370, _4150, _4564);
    int _4802 = _4792 * int(_4762);
    int _4804 = _4802 + _4680;
    float _4806 = trunc(_4794);
    float _4808 = precise::max(_4806, 0.0);
    uint _4810 = uint(_4808);
    float _4812 = as_type<float>(_4676) * _4798;
    float _4814 = fma(_4182, _4370, _4480);
    float _4816 = float(uint(_4804));
    float _4818 = _3564 * _3720;
    float _4820 = fma(_4374, _4162, _4800);
    int _4822 = _4774 * int(_4784);
    int _4824 = _4822 + _4704;
    int _4826 = ~_4504;
    int _4828 = _4826 + 1;
    float _4830 = trunc(_4754);
    float _4832 = precise::max(_4830, 0.0);
    uint _4834 = uint(_4832);
    float _4836 = as_type<float>(_4682) * _4816;
    float _4838 = fma(_4408, _4150, _4662);
    float _4840 = float(uint(_4824));
    float _4842 = fma(_4182, _4408, _4730);
    float _4844 = fma(_4444, _4056, _4738);
    float _4846 = fma(_4374, _4056, _4768);
    float _4848 = fma(_4412, _4056, _4734);
    float _4850 = trunc(_4836);
    float _4852 = precise::max(_4850, 0.0);
    uint _4854 = uint(_4852);
    float _4856 = as_type<float>(_4708) * _4840;
    int _4858 = int(_4724) + int(_4810);
    int _4860 = ~_4472;
    int _4862 = _4860 + 1;
    out.m_85.x = _4844;
    out.m_85.y = _4846;
    out.m_85.z = _4848;
    float _4864 = trunc(_4812);
    float _4866 = precise::max(_4864, 0.0);
    uint _4868 = uint(_4866);
    int _4870 = int(_4688) + int(_4834);
    float _4872 = trunc(_4856);
    float _4874 = precise::max(_4872, 0.0);
    uint _4876 = uint(_4874);
    float _4878 = _2145 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _4880 = _4862 * _4870;
    int _4882 = _4880 + _4626;
    int _4884 = int(_4762) + int(_4854);
    int _4886 = _4828 * _4858;
    int _4888 = _4886 + _4646;
    float _4890 = fma(_2153, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4878);
    int _4892 = ~_4566;
    int _4894 = _4892 + 1;
    float _4896 = trunc(_4770);
    float _4898 = precise::max(_4896, 0.0);
    uint _4900 = uint(_4898);
    int _4902 = int(_4744) + int(_4868);
    float _4904 = fma(_2151, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4890);
    int _4906 = ~_4628;
    int _4908 = _4906 + 1;
    bool _4910 = uint(_4888) >= uint(_4504);
    int _4912 = _4894 * _4902;
    int _4914 = _4912 + _4666;
    int _4916 = ~_4496;
    int _4918 = _4916 + 1;
    float _4920 = fma(_2177, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4904);
    int _4922 = int(_4784) + int(_4876);
    float _4924 = _4920 + _2191;
    bool _4926 = uint(_4882) >= uint(_4472);
    int _4928 = ~_4616;
    int _4930 = _4928 + 1;
    int _4932 = _4908 * _4922;
    int _4934 = _4932 + _4704;
    int _4936 = int(_4702) + int(_4900);
    float _4938 = _4924 * 0.5;
    bool _4940 = uint(_4914) >= uint(_4566);
    int _4942 = _4930 * _4884;
    int _4944 = _4942 + _4680;
    bool _4946 = !_4926;
    int _4948 = _4946 ? 0 : (-1);
    int _4950 = _4918 * _4936;
    int _4952 = _4950 + _4652;
    bool _4954 = !_4910;
    int _4956 = _4954 ? 0 : (-1);
    float _4958 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _4960 = uint(_4934) >= uint(_4628);
    bool _4962 = uint(_4952) >= uint(_4496);
    int _4964 = ~_4870;
    int _4966 = _4964 + _4948;
    int _4968 = _4966 + 1;
    int _4970 = ~_4858;
    int _4972 = _4970 + _4956;
    int _4974 = _4972 + 1;
    float _4976 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _4978 = uint(_4944) >= uint(_4616);
    bool _4980 = !_4962;
    int _4982 = _4980 ? 0 : (-1);
    bool _4984 = _4472 == 0;
    bool _4986 = _4472 == 0;
    float _4988 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _4990 = _4626 ^ _4472;
    int _4992 = _4472 * _4968;
    int _4994 = _4992 + _4626;
    bool _4996 = !_4940;
    int _4998 = _4996 ? 0 : (-1);
    int _5000 = _4504 * _4974;
    int _5002 = _5000 + _4646;
    bool _5004 = _4504 == 0;
    int _5006 = ~_4936;
    int _5008 = _5006 + _4982;
    int _5010 = _5008 + 1;
    float _5012 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _5014 = !_5004;
    int _5016 = _5014 ? _5002 : (-1);
    bool _5018 = !_4984;
    int _5020 = _5018 ? _4994 : (-1);
    int _5022 = _4496 * _5010;
    int _5024 = _5022 + _4652;
    bool _5026 = _4496 == 0;
    bool _5028 = _4496 == 0;
    int _5030 = _4652 ^ _4496;
    float _5032 = _4976 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _5034 = float(_5016);
    bool _5036 = !_4978;
    int _5038 = _5036 ? 0 : (-1);
    float _5040 = fma(_5032, _2642, -0.5);
    int _5042 = _4646 ^ _4504;
    float _5044 = fma(_5032, _5034, _1380);
    uint _5046 = uint(int(uint(_4990) >> uint(31)));
    float _5048 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _5050 = _4504 == 0;
    float _5052 = _4958 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _5054 = float(_5020);
    float _5056 = fma(_1374, _5040, _5044);
    bool _5058 = !_4960;
    int _5060 = _5058 ? 0 : (-1);
    float _5062 = fma(_5052, _2588, -0.5);
    uint _5064 = uint(int(uint(_5030) >> uint(31)));
    float _5066 = fma(_5052, _5054, _952);
    bool _5068 = !_5026;
    int _5070 = _5068 ? _5024 : (-1);
    float _5072 = _5012 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _5074 = ~_4998;
    int _5076 = _4902 + _5074;
    int _5078 = _5076 + 1;
    float _5080 = fma(_1354, _5062, _5066);
    uint _5082 = uint(int(uint(_5042) >> uint(31)));
    float _5084 = fma(_5072, _2678, -0.5);
    int _5086 = ~int(_5046);
    int _5088 = _5086 + 1;
    float _5090 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _5092 = ~_5060;
    int _5094 = _4922 + _5092;
    int _5096 = _5094 + 1;
    float _5098 = _5080 + 0.5;
    int _5100 = ~int(_5064);
    int _5102 = _5100 + 1;
    float _5104 = float(_5070);
    int _5106 = ~_5038;
    int _5108 = _4884 + _5106;
    int _5110 = _5108 + 1;
    int _5112 = ~int(_5082);
    int _5114 = _5112 + 1;
    int _5116 = _5078 ^ _5088;
    int _5118 = _5096 ^ _5102;
    float _5120 = fma(_5072, _5104, _1096);
    int _5122 = _5110 ^ _5114;
    float _5124 = _4988 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _5126 = ~_5088;
    int _5128 = _5126 + _5116;
    int _5130 = _5128 + 1;
    float _5132 = fma(_1370, _5084, _5120);
    int _5134 = ~_5114;
    int _5136 = _5134 + _5122;
    int _5138 = _5136 + 1;
    bool _5140 = !_4986;
    int _5142 = _5140 ? _5130 : (-1);
    float _5144 = _5132 + 0.5;
    bool _5146 = !_5050;
    int _5148 = _5146 ? _5138 : (-1);
    float _5150 = float(_5142);
    float _5152 = float(_5148);
    float _5154 = fma(_2798, _5124, -0.5);
    bool _5156 = _1498 <= 8000.0;
    bool _5158 = isnan(_1498);
    bool _5160 = _5156 || _5158;
    bool _5162 = isnan(8000.0);
    bool _5164 = _5160 || _5162;
    float _5166 = float(_5164);
    float _5168 = -_924;
    float _5170 = fma(_5124, _5150, _5168);
    float _5172 = fma(_4190, _4374, _4814);
    int _5174 = ~_5102;
    int _5176 = _5174 + _5118;
    int _5178 = _5176 + 1;
    float _5180 = _5090 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _5182 = fma(_1358, _5154, _5170);
    float _5184 = fma(_4190, _4444, _4796);
    float _5186 = fma(_4190, _4412, _4842);
    float _5188 = -_4258;
    float _5190 = _5188 + 1.0;
    bool _5192 = !_5028;
    int _5194 = _5192 ? _5178 : (-1);
    float _5196 = _5048 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _5198 = _4924;
    float _5200 = _4920;
    if (!_2161)
    {
        _5198 = 1.0;
    }
    float _5202 = _5198;
    float _5204 = fma(_5190, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4258);
    out.m_87.x = _5184;
    out.m_87.y = _5172;
    out.m_87.z = _5186;
    float _5206 = float(_5194);
    float _5208 = fma(_3010, _5180, -0.5);
    float _5210 = _5166 * _5204;
    float _5212 = _5202;
    if (_2161)
    {
        bool _5214 = _2277 >= _2241;
        bool _5216 = isnan(_2277);
        bool _5218 = _5214 || _5216;
        bool _5220 = isnan(_2241);
        bool _5222 = _5218 || _5220;
        float _5224 = float(_5222);
        _5212 = _5224;
    }
    float _5226 = _5212;
    float _5228 = -_1382;
    float _5230 = fma(_5180, _5152, _5228);
    float _5232 = fma(_5196, _3064, -0.5);
    float _5234 = -_1384;
    float _5236 = fma(_5196, _5206, _5234);
    float _5238 = _5226 * _3276;
    float _5240 = fma(_1376, _5208, _5230);
    out.gl_Position.x = _2217;
    out.gl_Position.y = _2223;
    out.gl_Position.z = _4920;
    out.gl_Position.w = _2191;
    float _5242 = _5210 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _5244 = fma(_1372, _5232, _5236);
    float _5246 = fma(_4444, _4162, _4776);
    float _5248 = _5056 + 0.5;
    float _5250 = _3616 * _5242;
    float _5252 = precise::clamp(_5250, 0.0, 1.0);
    float _5254 = _5182 + 0.5;
    float _5256 = _5240 + 0.5;
    float _5258 = _5244 + 0.5;
    float _5260 = -_5252;
    float _5262 = fma(_5260, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _5264 = fma(_4412, _4162, _4838);
    float _5266 = fma(_2290, _4818, _2288);
    float _5268 = -_5238;
    float _5270 = fma(_5268, _5262, 1.0);
    float _5272 = precise::clamp(_5270, 0.0, 1.0);
    float _5274 = _2290 * _3720;
    float _5276 = -_3704;
    float _5278 = _5276 + 1.0;
    out.m_89.x = _5098;
    out.m_89.y = _5254;
    out.m_89.z = _5248;
    out.m_89.w = _5256;
    float _5280 = _5272 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _5282 = fma(_3560, _5274, _2284);
    float _5284 = fma(_3562, _5274, _2286);
    float _5286 = _2290 * _5278;
    out.m_91.x = _5144;
    out.m_91.y = _5258;
    bool _5288 = _3306 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _5290 = isnan(_3306);
    bool _5292 = _5288 || _5290;
    bool _5294 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _5296 = _5292 || _5294;
    out.m_93.z = _4938;
    out.m_93.w = _2191;
    out.m_95.x = _5280;
    out.m_97.x = _5282;
    out.m_97.y = _5284;
    out.m_97.z = _5266;
    out.m_97.w = _5286;
    float _5298 = _5238;
    float _5300 = _5274;
    float _5302 = _5278;
    float _5304 = _5272;
    if (!_5296)
    {
        _5298 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _5306 = _5298;
    out.m_99.x = _5246;
    out.m_99.y = _4820;
    out.m_99.z = _5264;
    float _5308 = _5306;
    float _5310 = _5306;
    if (!_5296)
    {
        _2193 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _5312 = _2193;
    float _5314 = _5312;
    float _5316 = _5312;
    if (!_5296)
    {
        _5200 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _5318 = _5200;
    float _5320 = _5318;
    float _5322 = _5318;
    if (!_5296)
    {
        _5300 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _5324 = _5300;
    float _5326 = _5324;
    float _5328 = _5324;
    if (!_5296)
    {
        _5302 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _5330 = _5302;
    float _5332 = _5330;
    float _5334 = _5330;
    if (!_5296)
    {
        _5304 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _5336 = _5304;
    bool _5338 = !_5296;
    float _5340 = _5336;
    float _5342 = _5336;
    if (!_5338)
    {
        bool _5344 = _3306 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _5346 = isnan(_3306);
        bool _5348 = _5344 || _5346;
        bool _5350 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _5352 = _5348 || _5350;
        if (!_5352)
        {
            float _5354 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5356 = _3306 + _5354;
            float _5358 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5360 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _5358;
            float _5362 = 1.0 / _5360;
            float _5364 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _5366 = _5364 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _5368 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _5370 = _5368 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _5372 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _5374 = _5372 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _5376 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _5378 = _5376 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _5380 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _5382 = _5380 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _5384 = _5356 * _5362;
            float _5386 = precise::clamp(_5384, 0.0, 1.0);
            float _5388 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _5390 = _5388 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _5392 = fma(_5386, _5366, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _5394 = fma(_5386, _5390, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _5396 = fma(_5386, _5370, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _5398 = fma(_5386, _5374, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _5400 = fma(_5386, _5378, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _5402 = fma(_5386, _5382, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _5316 = _5394;
            _5334 = _5400;
            _5310 = _5392;
            _5328 = _5398;
            _5322 = _5396;
            _5342 = _5402;
            _5404 = true;
        }
        else
        {
            bool _5406 = _3306 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _5408 = isnan(_3306);
            bool _5410 = _5406 || _5408;
            bool _5412 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _5414 = _5410 || _5412;
            if (!_5414)
            {
                _5308 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _5416 = _5308;
            _5310 = _5416;
            if (!_5414)
            {
                _5314 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _5418 = _5314;
            _5316 = _5418;
            if (!_5414)
            {
                _5320 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _5420 = _5320;
            _5322 = _5420;
            if (!_5414)
            {
                _5326 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _5422 = _5326;
            _5328 = _5422;
            if (!_5414)
            {
                _5332 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _5424 = _5332;
            _5334 = _5424;
            if (!_5414)
            {
                _5340 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _5426 = _5340;
            bool _5428 = !_5414;
            _5342 = _5426;
            if (!_5428)
            {
                bool _5430 = _3306 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _5432 = isnan(_3306);
                bool _5434 = _5430 || _5432;
                bool _5436 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _5438 = _5434 || _5436;
                if (!_5438)
                {
                    float _5440 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5442 = _3306 + _5440;
                    float _5444 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5446 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _5444;
                    float _5448 = 1.0 / _5446;
                    float _5450 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _5452 = _5450 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _5454 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _5456 = _5454 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _5458 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _5460 = _5458 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _5462 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _5464 = _5462 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _5466 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _5468 = _5466 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _5470 = _5442 * _5448;
                    float _5472 = precise::clamp(_5470, 0.0, 1.0);
                    float _5474 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _5476 = _5474 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _5478 = fma(_5472, _5452, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _5480 = fma(_5472, _5476, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _5482 = fma(_5472, _5456, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _5484 = fma(_5472, _5460, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _5486 = fma(_5472, _5464, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _5488 = fma(_5472, _5468, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _5316 = _5480;
                    _5334 = _5486;
                    _5310 = _5478;
                    _5328 = _5484;
                    _5322 = _5482;
                    _5342 = _5488;
                    _5404 = true;
                }
                else
                {
                    _5316 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _5334 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _5310 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _5328 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _5322 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _5342 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _5404 = false;
    float _5490 = _5316;
    float _5492 = _5334;
    float _5494 = _5310;
    float _5496 = _5328;
    float _5498 = _5322;
    float _5500 = _5342;
    float _5502 = fma(_4820, -0.5, 0.5);
    float _5504 = precise::clamp(_5502, 0.0, 1.0);
    float _5506 = -_5490;
    float _5508 = _5506 + _5492;
    float _5510 = -_5494;
    float _5512 = _5510 + _5496;
    float _5514 = -_5498;
    float _5516 = _5514 + _5500;
    bool _5518 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _5520 = fma(_5504, _5508, _5490);
    float _5522 = fma(_5504, _5512, _5494);
    float _5524 = fma(_5504, _5516, _5498);
    float _5526 = _5520 * 0.586610972881317138671875;
    out.m_59.x = 1.0;
    float _5528 = fma(_5522, 0.298911988735198974609375, _5526);
    float _5530 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _5532 = fma(_5524, 0.114477999508380889892578125, _5528);
    out.m_95.w = _5530;
    float _5534 = -_5532;
    float _5536 = _5522 + _5534;
    float _5538 = -_5532;
    float _5540 = _5520 + _5538;
    float _5542 = -_5532;
    float _5544 = _5524 + _5542;
    out.m_101.x = 0.0;
    float _5546 = fma(_5536, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5532);
    float _5548 = fma(_5540, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5532);
    float _5550 = fma(_5544, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5532);
    out.m_103.x = _5546;
    out.m_103.y = _5548;
    out.m_103.z = _5550;
    if (!_5518)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _5552 = -_2079;
    float _5554 = _5552 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _5556 = -_2081;
    float _5558 = _5556 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _5560 = -_2083;
    float _5562 = _5560 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _5564 = _5554 * _5554;
    float _5566 = fma(_5558, _5558, _5564);
    float _5568 = fma(_5562, _5562, _5566);
    float _5570 = sqrt(_5568);
    float _5572 = rsqrt(_5568);
    float _5574 = -_5570;
    float _5576 = _5574 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _5578 = _5576 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _5580 = precise::clamp(_5578, 0.0, 1.0);
    float _5582 = _5558 * _5572;
    float _5584 = _5554 * _5572;
    float _5586 = abs(_5580);
    float _5588 = log2(_5586);
    float _5590 = _5562 * _5572;
    float _5592 = _5582 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _5594 = _4820 * _5584;
    float _5596 = -_5584;
    float _5598 = -_5592;
    float _5600 = fma(_5596, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5598);
    float _5602 = fma(_5246, _5582, _5594);
    float _5604 = -_5590;
    float _5606 = fma(_5604, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5600);
    float _5608 = fma(_5264, _5590, _5602);
    float _5610 = precise::clamp(_5608, 0.0, 1.0);
    float _5612 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _5614 = _5606 + _5612;
    float _5616 = _5588 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _5618 = _5614 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _5620 = precise::clamp(_5618, 0.0, 1.0);
    float _5622 = exp2(_5616);
    float _5624 = _5622 * _5620;
    float _5626 = _5610 * _5624;
    float _5628 = _5626 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _5630 = _5626 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _5632 = _5626 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_101.x = _5628;
    out.m_101.y = _5630;
    out.m_101.z = _5632;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

