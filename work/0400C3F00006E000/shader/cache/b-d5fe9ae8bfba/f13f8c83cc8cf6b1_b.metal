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
    texture2d<float> vp_t_tcb_24 [[id(7)]];
    sampler vp_t_tcb_24Smplr [[id(8)]];
    texture2d_array<float> vp_t_tcb_16 [[id(9)]];
    sampler vp_t_tcb_16Smplr [[id(10)]];
    texture3d<float> vp_t_tcb_32 [[id(11)]];
    sampler vp_t_tcb_32Smplr [[id(12)]];
    texture3d<float> vp_t_tcb_30 [[id(13)]];
    sampler vp_t_tcb_30Smplr [[id(14)]];
    texture2d_array<float> vp_t_tcb_14 [[id(15)]];
    sampler vp_t_tcb_14Smplr [[id(16)]];
    texture2d<float> vp_t_tcb_1C [[id(17)]];
    sampler vp_t_tcb_1CSmplr [[id(18)]];
    sampler vp_t_tcb_24Smplr_w [[id(19)]];
    sampler vp_t_tcb_32Smplr_w [[id(20)]];
    sampler vp_t_tcb_30Smplr_w [[id(21)]];
    sampler vp_t_tcb_14Smplr_w [[id(22)]];
    sampler vp_t_tcb_1CSmplr_w [[id(23)]];
    constant dm_border_t* dm_border [[id(24)]];
};

struct main0_out
{
    float4 m_71 [[user(locn0)]];
    float4 m_87 [[user(locn1)]];
    float4 m_61 [[user(locn2)]];
    float4 m_103 [[user(locn3)]];
    float4 m_77 [[user(locn4)]];
    float4 m_89 [[user(locn5)]];
    float4 m_95 [[user(locn6)]];
    float4 m_91 [[user(locn7)]];
    float4 m_93 [[user(locn8)]];
    float4 m_85 [[user(locn9)]];
    float4 m_101 [[user(locn10)]];
    float4 m_97 [[user(locn11)]];
    float4 m_99 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_79 [[attribute(1)]];
    float4 m_65 [[attribute(2)]];
    float4 m_58 [[attribute(3)]];
    float4 m_63 [[attribute(4)]];
    float4 m_81 [[attribute(5)]];
    float4 m_75 [[attribute(6)]];
    float4 m_67 [[attribute(7)]];
    float4 m_69 [[attribute(8)]];
    float4 m_83 [[attribute(9)]];
    float4 m_73 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2984 = false;
    bool _1724 = false;
    bool _730 = false;
    bool _500 = false;
    bool _224 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _117 = in.m_58.w;
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
        out.m_61.x = 0.0;
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
        float _3269 = as_type<float>(_138);
        out.gl_Position.z = _3269;
    }
    if (!_126)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _142 = in.m_63.w;
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
        float _162 = float(_122);
        _158 = _162;
    }
    float _164 = _158;
    bool _166 = _156 >= _164;
    bool _168 = !_152;
    bool _170 = _166 || _168;
    if (_170)
    {
        _132 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _172 = _132;
    if (_170)
    {
        out.m_61.x = 0.0;
    }
    if (_170)
    {
        float _174 = _172 * 5.0;
        _140 = as_type<int>(_174);
    }
    int _176 = _140;
    if (_170)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3338 = as_type<float>(_176);
        out.gl_Position.z = _3338;
    }
    if (_170)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _178 = in.m_65.x;
    float _180 = in.m_65.y;
    float _182 = in.m_65.z;
    bool _184 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _186 = _180 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _188 = _180 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _190 = _180 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _192 = fma(_178, (*spvDescriptorSet0.vp_c10)._m0[4].x, _186);
    float _194 = fma(_178, (*spvDescriptorSet0.vp_c10)._m0[5].x, _188);
    float _196 = fma(_178, (*spvDescriptorSet0.vp_c10)._m0[6].x, _190);
    float _198 = fma(_182, (*spvDescriptorSet0.vp_c10)._m0[4].z, _192);
    float _200 = fma(_182, (*spvDescriptorSet0.vp_c10)._m0[5].z, _194);
    float _202 = fma(_182, (*spvDescriptorSet0.vp_c10)._m0[6].z, _196);
    bool _204 = !_184;
    float _222;
    if (!_204)
    {
        float _206 = in.m_67.x;
        float _208 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _210 = _206 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _212 = fma(_210, (*spvDescriptorSet0.vp_c9)._m0[12].x, _156);
        float _214 = _212 * _208;
        float _216 = floor(_214);
        float _218 = -_216;
        float _220 = _214 + _218;
        _222 = _220;
        _224 = true;
    }
    else
    {
        float _226 = float(_122);
        float _228 = 1.0 / _226;
        float _230 = _156 * _228;
        _222 = _230;
    }
    _224 = false;
    float _232 = _222;
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _236 = _232 + _234;
    float _238 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _240 = _232 + _238;
    float _242 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _244 = _232 + _242;
    float _246 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _248 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _246;
    float _250 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _252 = _250 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _254 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _256 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _254;
    float _258 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _260 = _258 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _262 = 1.0 / _248;
    bool _264 = _232 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _266 = isnan(_232);
    bool _268 = _264 || _266;
    bool _270 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _272 = _268 || _270;
    float _274 = float(_272);
    float _276 = 1.0 / _252;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _280 = _232 + _278;
    float _282 = 1.0 / _260;
    float _284 = _240 * _262;
    bool _286 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _288 = 1.0 / _256;
    float _290 = _236 * _276;
    bool _292 = _232 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _294 = isnan(_232);
    bool _296 = _292 || _294;
    bool _298 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _300 = _296 || _298;
    float _302 = float(_300);
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _306 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _304;
    bool _308 = _232 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _310 = isnan(_232);
    bool _312 = _308 || _310;
    bool _314 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _316 = _312 || _314;
    float _318 = float(_316);
    float _320 = fma(_306, _284, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _322 = _280 * _282;
    bool _324 = _232 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _326 = isnan(_232);
    bool _328 = _324 || _326;
    bool _330 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _332 = _328 || _330;
    float _334 = float(_332);
    float _336 = -_302;
    float _338 = _336 + 1.0;
    float _340 = -_318;
    float _342 = _340 + 1.0;
    float _344 = _334 * _338;
    float _346 = -_334;
    float _348 = _346 + 1.0;
    float _350 = _244 * _288;
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _354 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _352;
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _358 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _356;
    float _360 = _318 * _348;
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _364 = _362 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _366 = fma(_354, _284, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _368 = fma(_358, _284, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _370 = _232 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _372 = isnan(_232);
    bool _374 = _370 || _372;
    bool _376 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _378 = _374 || _376;
    float _380 = float(_378);
    float _382 = _274 * _342;
    float _384 = -_274;
    float _386 = _384 + 1.0;
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _390 = _388 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _394 = _392 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _396 = fma(_364, _290, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _398 = _380 * _386;
    float _400 = -_380;
    float _402 = _400 + 1.0;
    float _404 = fma(_390, _290, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _406 = fma(_394, _290, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _408 = _320 * _398;
    float _410 = _366 * _398;
    float _412 = _368 * _398;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _416 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _414;
    float _418 = fma(_402, (*spvDescriptorSet0.vp_c9)._m0[143].x, _408);
    float _420 = fma(_402, (*spvDescriptorSet0.vp_c9)._m0[143].y, _410);
    float _422 = fma(_402, (*spvDescriptorSet0.vp_c9)._m0[143].z, _412);
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _426 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _424;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _430 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _428;
    float _432 = fma(_404, _382, _418);
    float _434 = fma(_406, _382, _420);
    float _436 = fma(_416, _350, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _438 = fma(_396, _382, _422);
    float _440 = fma(_426, _350, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _444 = _442 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _448 = _446 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _450 = fma(_430, _350, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _454 = _452 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _456 = fma(_436, _360, _432);
    float _458 = fma(_444, _322, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _460 = fma(_448, _322, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _462 = fma(_440, _360, _434);
    float _464 = fma(_454, _322, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _466 = fma(_450, _360, _438);
    float _468 = fma(_458, _344, _456);
    float _470 = fma(_460, _344, _462);
    float _472 = fma(_464, _344, _466);
    float _474 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[147].x, _468);
    float _476 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[147].y, _470);
    float _478 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[147].z, _472);
    bool _480 = !_286;
    float _498;
    if (!_480)
    {
        float _482 = in.m_67.x;
        float _484 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _486 = _482 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _488 = fma(_486, (*spvDescriptorSet0.vp_c9)._m0[11].y, _156);
        float _490 = _488 * _484;
        float _492 = floor(_490);
        float _494 = -_492;
        float _496 = _490 + _494;
        _498 = _496;
        _500 = true;
    }
    else
    {
        float _502 = float(_122);
        float _504 = 1.0 / _502;
        float _506 = _156 * _504;
        _498 = _506;
    }
    _500 = false;
    float _508 = _498;
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _512 = _508 + _510;
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _516 = _514 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _520 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _518;
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _524 = _522 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _526 = _508 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _528 = isnan(_508);
    bool _530 = _526 || _528;
    bool _532 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _534 = _530 || _532;
    float _536 = float(_534);
    float _538 = 1.0 / _516;
    float _540 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _542 = _540 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _544 = _508 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _546 = isnan(_508);
    bool _548 = _544 || _546;
    bool _550 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _552 = _548 || _550;
    float _554 = float(_552);
    bool _556 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _558 = 1.0 / _524;
    float _560 = _520 * _538;
    bool _562 = _508 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _564 = isnan(_508);
    bool _566 = _562 || _564;
    bool _568 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _570 = _566 || _568;
    float _572 = float(_570);
    float _574 = 1.0 / _542;
    float _576 = -_536;
    float _578 = _576 + 1.0;
    float _580 = fma(_560, _512, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _584 = _582 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _586 = _508 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _588 = isnan(_508);
    bool _590 = _586 || _588;
    bool _592 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _594 = _590 || _592;
    float _596 = float(_594);
    float _598 = -_572;
    float _600 = _598 + 1.0;
    float _602 = _572 * _578;
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _606 = _604 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _608 = 1.0 / _584;
    float _610 = -_596;
    float _612 = _610 + 1.0;
    float _614 = _554 * _600;
    float _616 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _618 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _616;
    float _620 = _606 * _558;
    float _622 = _536 * _612;
    float _624 = _580 * _614;
    float _626 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _628 = _508 + _626;
    float _630 = -_554;
    float _632 = _630 + 1.0;
    bool _634 = _508 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _636 = isnan(_508);
    bool _638 = _634 || _636;
    bool _640 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _642 = _638 || _640;
    float _644 = float(_642);
    float _646 = _618 * _574;
    float _648 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _650 = _648 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _652 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _654 = _508 + _652;
    float _656 = fma(_620, _628, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _658 = fma(_632, (*spvDescriptorSet0.vp_c9)._m0[115].x, _624);
    float _660 = -_644;
    float _662 = _660 + 1.0;
    float _664 = _650 * _608;
    float _666 = fma(_646, _654, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _668 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _670 = _508 + _668;
    float _672 = fma(_656, _602, _658);
    float _674 = _596 * _662;
    float _676 = fma(_664, _670, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _678 = fma(_666, _622, _672);
    float _680 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _682 = fma(_676, _674, _678);
    float _684 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _686 = _680 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _688 = fma(_644, (*spvDescriptorSet0.vp_c9)._m0[119].x, _682);
    float _690 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _692 = _684 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _694 = _688 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _696 = in.m_69.x;
    float _698 = in.m_69.y;
    float _700 = in.m_69.z;
    float _702 = _690 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_71.x = _686;
    out.m_71.y = _692;
    out.m_71.z = _702;
    out.m_71.w = _694;
    float _704 = _478 * _700;
    float _706 = _476 * _698;
    float _708 = _474 * _696;
    bool _710 = !_556;
    float _728;
    if (!_710)
    {
        float _712 = in.m_67.x;
        float _714 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _716 = _712 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _718 = fma(_716, (*spvDescriptorSet0.vp_c9)._m0[11].w, _156);
        float _720 = _718 * _714;
        float _722 = floor(_720);
        float _724 = -_722;
        float _726 = _720 + _724;
        _728 = _726;
        _730 = true;
    }
    else
    {
        float _732 = float(_122);
        float _734 = 1.0 / _732;
        float _736 = _156 * _734;
        _728 = _736;
    }
    _730 = false;
    float _738 = _728;
    float _740 = in.m_67.w;
    float _742 = _704 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _744 = in.m_73.y;
    float _746 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _748 = log2(_746);
    float _750 = in.m_67.z;
    int _752 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _754 = _752 != 0;
    float _756 = in.m_75.x;
    float _758 = in.m_75.y;
    float _760 = in.m_75.z;
    int _762 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _764 = _762 != 0;
    int _766 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _768 = _766 != 0;
    float _770 = in.m_67.y;
    int _772 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _774 = _772 != 0;
    float _776 = in.m_67.x;
    float _778 = _748 * _156;
    out.m_77.x = 1.0;
    out.m_77.y = 1.0;
    out.m_77.z = 1.0;
    bool _780 = _740 > 0.5;
    float _782 = in.m_58.x;
    float _784 = in.m_58.y;
    float _786 = in.m_58.z;
    float _788 = -_744;
    float _790 = _788 + 1.0;
    float _792 = exp2(_778);
    float _794 = _750 * 2.0;
    float _796 = in.m_73.x;
    int _798 = _780 ? as_type<int>(_790) : as_type<int>(_744);
    float _800 = _708 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _802 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _804 = _802 != 0;
    int _806 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _808 = _806 != 0;
    int _810 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _812 = _810 != 0;
    float _814 = _706 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _816 = floor(_794);
    float _818 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _756);
    float _820 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _760);
    float _822 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _758);
    float _824 = _770 * 2.0;
    float _826 = _818 * _800;
    float _828 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _830 = _828 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _832 = _820 * _742;
    float _834 = _822 * _814;
    float _836 = _768 ? as_type<float>(_798) : _744;
    float _838 = 1.0 / _830;
    bool _840 = _770 > 0.5;
    float _842 = _784 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _844 = _784 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _846 = _784 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _848 = _776 * 2.0;
    float _850 = fma(_782, (*spvDescriptorSet0.vp_c10)._m0[5].x, _842);
    float _852 = fma(_782, (*spvDescriptorSet0.vp_c10)._m0[4].x, _844);
    float _854 = fma(_782, (*spvDescriptorSet0.vp_c10)._m0[6].x, _846);
    float _856 = floor(_824);
    float _858 = _744;
    float _860 = _852;
    float _862 = _750;
    if (_774)
    {
        float _864 = _840 ? _790 : _744;
        _858 = _864;
    }
    float _866 = _858;
    float _868 = _770 + _750;
    bool _870 = _816 > 0.0;
    float _872 = _776 + _750;
    float _874 = _868 + (-1.0);
    bool _876 = _816 >= 0.0;
    bool _878 = isnan(_816);
    bool _880 = _876 || _878;
    bool _882 = isnan(0.0);
    bool _884 = _880 || _882;
    float _886 = floor(_848);
    float _888 = _872 + (-1.0);
    float _890 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _892 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _890;
    float _894 = fma(_874, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _896 = _776 + _770;
    float _898 = -_792;
    float _900 = _898 + 1.0;
    float _902 = _892 * _838;
    float _904 = _896 + (-1.0);
    int _906 = _884 ? 0 : 1;
    float _908 = fma(_888, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _910 = _888;
    if (!_754)
    {
        _910 = _796;
    }
    float _912 = _910;
    float _914 = fma(_904, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _916 = ~_906;
    int _918 = _916 + 1;
    int _920 = _918 + 1;
    float _922 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _924 = _738 + _922;
    int _926 = _920;
    float _928 = _912;
    if (!_870)
    {
        int _930 = ~_906;
        int _932 = _930 + 1;
        _926 = _932;
    }
    int _934 = _926;
    float _936 = fma(_786, (*spvDescriptorSet0.vp_c10)._m0[5].z, _850);
    bool _938 = _856 >= 0.0;
    bool _940 = isnan(_856);
    bool _942 = _938 || _940;
    bool _944 = isnan(0.0);
    bool _946 = _942 || _944;
    float _948 = fma(_902, _924, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _950 = _886 >= 0.0;
    bool _952 = isnan(_886);
    bool _954 = _950 || _952;
    bool _956 = isnan(0.0);
    bool _958 = _954 || _956;
    float _960 = _770 + (-0.5);
    int _962 = _946 ? 0 : 1;
    float _964 = _936 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _966 = _958 ? 0 : 1;
    bool _968 = _856 > 0.0;
    float _970 = fma(_786, (*spvDescriptorSet0.vp_c10)._m0[6].z, _854);
    bool _972 = _886 > 0.0;
    float _974 = fma(_786, (*spvDescriptorSet0.vp_c10)._m0[4].z, _852);
    bool _976 = !_804;
    int _978 = _976 ? 0 : 1;
    float _980 = in.m_79.x;
    float _982 = in.m_79.y;
    float _984 = in.m_79.z;
    bool _986 = _972;
    int _988 = as_type<int>(_948);
    if (!_754)
    {
        _860 = _912;
    }
    float _990 = _860;
    float _992 = _974 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _994 = _990;
    float _996 = _992;
    if (_754)
    {
        _928 = _796;
    }
    float _998 = _928;
    bool _1000 = !_808;
    int _1002 = _1000 ? 0 : 1;
    int _1004 = abs(_978);
    int _1006 = 0;
    float _1008 = _998;
    if (_764)
    {
        float _1010 = -_998;
        float _1012 = _1010 + 1.0;
        _1006 = as_type<int>(_1012);
    }
    int _1014 = _1006;
    int _1016 = abs(_1002);
    float _1018 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1020 = 1.0 + _1018;
    int _1022 = ~_966;
    int _1024 = _1022 + 1;
    int _1026 = _1024 + 1;
    int _1028 = _1026;
    if (!_972)
    {
        int _1030 = ~_966;
        int _1032 = _1030 + 1;
        _1028 = _1032;
    }
    int _1034 = _1028;
    float _1036 = 1.0 / _1020;
    float _1038 = float(_1004);
    float _1040 = float(_934);
    bool _1042 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1044 = isnan(1.0);
    bool _1046 = _1042 || _1044;
    bool _1048 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1050 = _1046 || _1048;
    int _1052 = ~_962;
    int _1054 = _1052 + 1;
    int _1056 = _1054 + 1;
    float _1058 = _1038 * _1040;
    int _1060 = _1056;
    bool _1062 = _1050;
    if (!_968)
    {
        int _1064 = ~_962;
        int _1066 = _1064 + 1;
        _1060 = _1066;
    }
    int _1068 = _1060;
    bool _1070 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1072 = isnan(0.0);
    bool _1074 = _1070 || _1072;
    bool _1076 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1078 = _1074 || _1076;
    float _1080 = _1058 * (-2.0);
    float _1082 = float(_1016);
    float _1084 = float(_1034);
    float _1086 = fma(_1080, _980, _980);
    float _1088 = _1078 ? _900 : 0.0;
    bool _1090 = !_812;
    int _1092 = _1090 ? 0 : 1;
    float _1094 = _1082 * _1084;
    if (_754)
    {
        bool _1096 = _776 > 0.5;
        _986 = _1096;
    }
    bool _1098 = _986;
    float _1100 = _776 + (-0.5);
    int _1102 = abs(_1092);
    if (_1050)
    {
        float _1104 = _1088 * _1036;
        _160 = _1104;
    }
    float _1106 = _160;
    float _1108 = fma(_914, _1080, _914);
    float _1110 = fma(_1100, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1086);
    float _1112 = float(_1102);
    float _1114 = _1094 * (-2.0);
    float _1116 = float(_1068);
    float _1118 = fma(_1108, _1106, _1110);
    bool _1120 = _738 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1122 = isnan(_738);
    bool _1124 = _1120 || _1122;
    bool _1126 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1128 = _1124 || _1126;
    float _1130 = float(_1128);
    float _1132 = fma(_894, _1114, _894);
    bool _1134 = _758 != 0.0;
    bool _1136 = isnan(_758);
    bool _1138 = _1134 || _1136;
    bool _1140 = isnan(0.0);
    bool _1142 = _1138 || _1140;
    float _1144 = _1112 * _1116;
    bool _1146 = _738 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1148 = isnan(_738);
    bool _1150 = _1146 || _1148;
    bool _1152 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1154 = _1150 || _1152;
    float _1156 = float(_1154);
    float _1158 = _1118 * 0.15915493667125701904296875;
    bool _1160 = _756 == 0.0;
    bool _1162 = !_1142;
    bool _1164 = _1160 && _1162;
    float _1166 = in.m_81.x;
    float _1168 = in.m_81.y;
    float _1170 = in.m_81.z;
    float _1172 = fma(_1114, _982, _982);
    float _1174 = -_1130;
    float _1176 = _1174 + 1.0;
    float _1178 = _1144 * (-2.0);
    bool _1180 = _760 == 0.0;
    bool _1182 = _1180 && _1164;
    float _1184 = fma(_960, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1172);
    float _1186 = _1156 * _1176;
    float _1188 = fma(_1178, _984, _984);
    float _1190 = _750 + (-0.5);
    float _1192 = fma(_1132, _1106, _1184);
    float _1194 = _948 * _1186;
    float _1196 = fma(_908, _1178, _908);
    float _1198 = in.m_83.x;
    float _1200 = in.m_83.y;
    float _1202 = in.m_83.z;
    float _1204 = in.m_83.w;
    float _1206 = fma(_1190, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1188);
    float _1208 = _1206;
    float _1210 = _1188;
    if (_754)
    {
        float _1212 = -_998;
        float _1214 = _1212 + 1.0;
        _988 = as_type<int>(_1214);
    }
    int _1216 = _988;
    if (_764)
    {
        bool _1218 = _750 > 0.5;
        _1062 = _1218;
    }
    bool _1220 = _1062;
    float _1222 = -_1156;
    float _1224 = _1222 + 1.0;
    float _1226 = fma(_1196, _1106, _1206);
    float _1228 = _1226;
    if (!_764)
    {
        _862 = _998;
    }
    float _1230 = _862;
    float _1232 = _1192 * 0.15915493667125701904296875;
    float _1234 = _1230;
    if (_754)
    {
        float _1236 = _1098 ? as_type<float>(_1216) : _998;
        _994 = _1236;
    }
    float _1238 = _994;
    float _1240 = fma(_1224, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1194);
    if (_764)
    {
        float _1242 = _1220 ? as_type<float>(_1014) : _998;
        _1234 = _1242;
    }
    float _1244 = _1234;
    float _1246 = _1226 * 0.15915493667125701904296875;
    float _1248 = _1166;
    if (_1182)
    {
        _1208 = _1166;
    }
    float _1250 = _1208;
    float _1252 = _1158 * 6.283185482025146484375;
    float _1254 = sin(_1252);
    float _1256 = _1250;
    if (_1182)
    {
        _1210 = _1168;
    }
    float _1258 = _1210;
    float _1260 = fma(_1130, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1240);
    float _1262 = _1258;
    if (_1182)
    {
        _1008 = _1250;
    }
    float _1264 = _1008;
    float _1266 = _1264;
    if (!_1182)
    {
        _1256 = _1166;
    }
    float _1268 = _1256;
    if (_1182)
    {
        _1248 = _1258;
    }
    float _1270 = _1248;
    float _1272 = _1158 * 6.283185482025146484375;
    float _1274 = cos(_1272);
    float _1276 = _1270;
    if (!_1182)
    {
        _1262 = _1168;
    }
    float _1278 = _1262;
    if (!_1182)
    {
        float _1280 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1268);
        _1266 = _1280;
    }
    float _1282 = _1266;
    float _1284 = _1200 * _1170;
    float _1286 = _1202 * _1268;
    float _1288 = _1282;
    if (_1182)
    {
        _1228 = _1170;
    }
    float _1290 = _1228;
    float _1292 = _1290;
    if (!_1182)
    {
        float _1294 = fma(_758, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1278);
        _1276 = _1294;
    }
    float _1296 = _1276;
    float _1298 = _1198 * _1278;
    float _1300 = _1232 * 6.283185482025146484375;
    float _1302 = sin(_1300);
    float _1304 = -_1284;
    float _1306 = fma(_1202, _1278, _1304);
    if (!_1182)
    {
        float _1308 = fma(_760, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1170);
        _1292 = _1308;
    }
    float _1310 = _1292;
    float _1312 = -_1298;
    float _1314 = fma(_1200, _1268, _1312);
    float _1316 = _1232 * 6.283185482025146484375;
    float _1318 = cos(_1316);
    float _1320 = _1246 * 6.283185482025146484375;
    float _1322 = cos(_1320);
    float _1324 = -_1286;
    float _1326 = fma(_1198, _1170, _1324);
    float _1328 = _1254 * _1302;
    float _1330 = _1274 * _1302;
    float _1332 = _1326 * _1204;
    float _1334 = _1246 * 6.283185482025146484375;
    float _1336 = sin(_1334);
    float _1338 = _1274 * _1318;
    float _1340 = _1254 * _1318;
    float _1342 = _1274 * _1322;
    float _1344 = _1318 * _1322;
    float _1346 = _1254 * _1322;
    float _1348 = _1302 * _1322;
    float _1350 = _1342 * _834;
    float _1352 = _1346 * _834;
    float _1354 = fma(_1336, _1338, _1328);
    float _1356 = -_834;
    float _1358 = _1336 * _1356;
    float _1360 = -_1330;
    float _1362 = fma(_1336, _1340, _1360);
    float _1364 = -_1340;
    float _1366 = fma(_1336, _1330, _1364);
    float _1368 = fma(_1354, _826, _1350);
    float _1370 = fma(_1344, _826, _1358);
    float _1372 = fma(_1336, _1328, _1338);
    float _1374 = fma(_1362, _826, _1352);
    float _1376 = fma(_1366, _832, _1368);
    float _1378 = fma(_1348, _832, _1370);
    float _1380 = _1306 * _1204;
    float _1382 = fma(_1372, _832, _1374);
    float _1384 = _1376 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1386 = _1376 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1388 = _1314 * _1204;
    float _1390 = _970 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1392 = fma(_1378, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1384);
    float _1394 = fma(_1378, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1386);
    float _1396 = _1342 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1398 = _1342 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1400 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1392);
    float _1402 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1394);
    float _1404 = _1342 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1406 = -_1336;
    float _1408 = fma(_1406, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1396);
    float _1410 = _1400 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1412 = _1402 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1414 = -_1336;
    float _1416 = fma(_1414, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1398);
    float _1418 = -_1336;
    float _1420 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1404);
    float _1422 = _992 + _1410;
    float _1424 = _1390 + _1412;
    float _1426 = _1354 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1428 = _1354 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1430 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1432 = _1422 + _1430;
    float _1434 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1436 = _1424 + _1434;
    float _1438 = _1354 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1440 = fma(_1344, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1426);
    float _1442 = _1432 * _1432;
    float _1444 = _1436 * _1436;
    float _1446 = fma(_1344, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1428);
    float _1448 = fma(_1344, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1438);
    float _1450 = _1366 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1452 = _1442 + _1444;
    float _1454 = _1366 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1456 = _1366 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1458 = fma(_1346, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1408);
    float _1460 = sqrt(_1452);
    float _1462 = fma(_1346, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1416);
    float _1464 = fma(_1346, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1420);
    float _1466 = fma(_1348, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1456);
    float _1468 = _1458 * _1296;
    float _1470 = _1462 * _1296;
    float _1472 = _1464 * _1296;
    float _1474 = _1376 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1476 = fma(_1348, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1454);
    float _1478 = fma(_1348, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1450);
    float _1480 = fma(_1362, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1440);
    float _1482 = fma(_1378, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1474);
    float _1484 = fma(_1362, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1446);
    float _1486 = fma(_1362, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1448);
    float _1488 = fma(_1372, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1476);
    float _1490 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1482);
    bool _1492 = _1460 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1494 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1496 = _1458 * _1200;
    float _1498 = _1490 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1500 = _1462 * _1200;
    float _1502 = _1464 * _1200;
    float _1504 = fma(_1372, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1478);
    float _1506 = _964 + _1498;
    float _1508 = _1332 * _1458;
    float _1510 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1512 = _1332 * _1462;
    float _1514 = _1332 * _1464;
    float _1516 = fma(_1480, _1282, _1468);
    float _1518 = fma(_1484, _1282, _1470);
    float _1520 = fma(_1486, _1282, _1472);
    float _1522 = fma(_1480, _1198, _1496);
    float _1524 = _1496;
    float _1526 = _1442;
    float _1528 = _1422;
    float _1530 = _1424;
    float _1532 = _1518;
    if (!_1492)
    {
        _1288 = _1442;
    }
    float _1534 = _1288;
    float _1536 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1538 = fma(_1372, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1466);
    float _1540 = fma(_1380, _1480, _1508);
    float _1542 = _1534;
    if (!_1492)
    {
        _1524 = _1444;
    }
    float _1544 = _1524;
    float _1546 = _1544;
    if (!_1492)
    {
        _1526 = _1506;
    }
    float _1548 = _1526;
    bool _1550 = !_1492;
    float _1552 = _1548;
    if (!_1550)
    {
        float _1554 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1556 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1558 = _1460 + _1556;
        float _1560 = rsqrt(_1452);
        float _1562 = _1558 * _1554;
        float _1564 = _1506 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1566 = _1562 * 0.15915493667125701904296875;
        float _1568 = _1566 * 6.283185482025146484375;
        float _1570 = sin(_1568);
        float _1572 = _1566 * 6.283185482025146484375;
        float _1574 = cos(_1572);
        float _1576 = fma(_1570, _1564, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1578 = _1560 * _1576;
        float _1580 = _1574 + (-1.0);
        float _1582 = fma(_1432, _1578, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1584 = fma(_1436, _1578, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1586 = _1580 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1588 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1590 = _1582 + _1588;
        float _1592 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1594 = _1584 + _1592;
        float _1596 = fma(_1506, _1574, _1586);
        float _1598 = _1590 * _1590;
        float _1600 = _1594 * _1594;
        _1552 = _1596;
        _1542 = _1598;
        _1546 = _1600;
        _1528 = _1582;
        _1530 = _1584;
    }
    float _1602 = _1552;
    float _1604 = _1542;
    float _1606 = _1546;
    float _1608 = _1528;
    float _1610 = _1530;
    float _1612 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1614 = _1602 + _1612;
    float _1616 = _836 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1618 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1620 = fma(_1484, _1198, _1500);
    float _1622 = fma(_1380, _1484, _1512);
    float _1624 = fma(_1614, _1614, _1604);
    float _1626 = _866 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1628 = _1616 * _1536;
    float _1630 = fma(_1486, _1198, _1502);
    float _1632 = _1624 + _1606;
    float _1634 = _1238 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1636 = fma(_1380, _1486, _1514);
    float _1638 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1640 = _1634 * _1494;
    float _1642 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1644 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1646 = _1244 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1648 = fma(_1504, _1310, _1516);
    float _1650 = sqrt(_1632);
    float _1652 = _1638 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1654 = _1642 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1656 = fma(_1504, _1202, _1522);
    float _1658 = fma(_1388, _1504, _1540);
    float _1660 = _1644 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1662 = _1646 * _1618;
    float _1664 = fma(_1488, _1310, _1518);
    float _1666 = fma(_1488, _1202, _1620);
    float _1668 = fma(_1388, _1488, _1622);
    float _1670 = fma(_1538, _1202, _1630);
    float _1672 = _1626 * _1510;
    float _1674 = _1260 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1676 = fma(_1388, _1538, _1636);
    float _1678 = fma(_1538, _1310, _1520);
    out.m_85.x = _1656;
    out.m_85.y = _1666;
    out.m_85.z = _1670;
    bool _1680 = _1650 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1682 = isnan(_1650);
    bool _1684 = _1680 || _1682;
    bool _1686 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1688 = _1684 || _1686;
    out.m_87.x = _1652;
    out.m_87.y = _1654;
    out.m_87.z = _1660;
    out.m_87.w = _1674;
    out.m_89.x = _1640;
    out.m_89.y = _1672;
    out.m_89.z = _1662;
    out.m_89.w = _1628;
    out.m_91.x = _1658;
    out.m_91.y = _1668;
    out.m_91.z = _1676;
    if (!_1688)
    {
        _1532 = 1.0;
    }
    float _1690 = _1532;
    out.m_93.x = _1648;
    out.m_93.y = _1664;
    out.m_93.z = _1678;
    bool _1692 = !_1688;
    float _1694 = _1690;
    if (!_1692)
    {
        bool _1696 = _1650 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1698 = isnan(_1650);
        bool _1700 = _1696 || _1698;
        bool _1702 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1704 = _1700 || _1702;
        if (!_1704)
        {
            float _1706 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1708 = _1650 + _1706;
            float _1710 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1712 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1710;
            float _1714 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1716 = _1714 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1718 = 1.0 / _1712;
            float _1720 = _1708 * _1718;
            float _1722 = fma(_1720, _1716, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1694 = _1722;
            _1724 = true;
        }
        else
        {
            bool _1726 = _1650 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1728 = isnan(_1650);
            bool _1730 = _1726 || _1728;
            bool _1732 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1734 = _1730 || _1732;
            if (!_1734)
            {
                float _1736 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1738 = _1650 + _1736;
                float _1740 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1742 = _1740 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1744 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1746 = _1744 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1748 = 1.0 / _1742;
                float _1750 = _1738 * _1748;
                float _1752 = fma(_1750, _1746, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1694 = _1752;
                _1724 = true;
            }
            else
            {
                _1694 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1724 = false;
    float _1754 = _1694;
    float _1756 = fma(_992, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1758 = fma(_1390, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1760 = floor(_1756);
    float _1762 = floor(_1758);
    float _1764 = -_1760;
    float _1766 = _1756 + _1764;
    float _1768 = -_1762;
    float _1770 = _1758 + _1768;
    float2 _5942 = float2(_1766, _1770);
    float _1772 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5942, float2(0.0), isnan(_5942)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5942, float2(0.0), isnan(_5942)), level(0.0)).x;
    float _1774 = _964 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1776 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1778 = _1608 + _1776;
    float _1780 = fma(_992, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1774);
    float _1782 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1780);
    float _1784 = _964 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1786 = _1782 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1788 = fma(_992, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1784);
    float _1790 = 1.0 / _1786;
    float _1792 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1788);
    float _1794 = _1792 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1796 = _1794 + _1786;
    float _1798 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _1800 = _1796 * _1790;
    float _1802 = _1800 * 0.5;
    float _1804 = _964 + _1798;
    float _1806 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1808 = fma(_1802, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1806);
    float _1810 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1812 = _1602 + _1810;
    float _1814 = 1.0 / _1808;
    float _1816 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1818 = _1814 * _1816;
    float _1820 = _1804 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    bool _1822 = _1818 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1824 = fma(_992, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1820);
    bool _1826 = _1818 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _1828 = !_1822;
    int _1830 = _1828 ? 0 : 1;
    float _1832 = fma(_1390, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1824);
    float _1834 = _1832 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1836 = fma(_1812, _1754, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1838 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1840 = _1610 + _1838;
    float _1842 = fma(_1778, _1754, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    int _1844 = 2;
    float _1846 = _1804;
    if (!_1822)
    {
        _1844 = 1;
    }
    int _1848 = _1844;
    float _1850 = trunc(_1834);
    int _1852 = int(_1850);
    int _1854 = _1848;
    if (!_1826)
    {
        _1854 = _1830;
    }
    int _1856 = _1854;
    float _1858 = _1804 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1860 = -_964;
    float _1862 = _1860 + _1836;
    float _1864 = fma(_1840, _1754, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    int _1866 = _1856 << 6;
    float _1868 = fma(_992, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1858);
    float _1870 = -_992;
    float _1872 = _1870 + _1842;
    float _1874 = _1862 * _1862;
    int _1876 = _1866 + 96;
    uint _1879 = uint(int(uint(_1876) >> uint(2)));
    uint _1881 = uint(int(uint(int(_1879)) >> uint(2)));
    int _1883 = int(_1879) & 3;
    float _1885 = (*spvDescriptorSet0.vp_c15)._m0[int(_1881)][_1883];
    int _1887 = int(_1879) + 1;
    uint _1889 = uint(int(uint(_1887) >> uint(2)));
    int _1891 = _1887 & 3;
    float _1893 = (*spvDescriptorSet0.vp_c15)._m0[int(_1889)][_1891];
    float _1895 = fma(_1390, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1868);
    float _1897 = -_1390;
    float _1899 = _1897 + _1864;
    float _1901 = fma(_1872, _1872, _1874);
    float _1903 = _1895 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    int _1905 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1907 = _1852 + _1905;
    int _1909 = _1907 + 1;
    int _1911 = _1866 + 104;
    uint _1913 = uint(int(uint(_1911) >> uint(2)));
    uint _1915 = uint(int(uint(int(_1913)) >> uint(2)));
    int _1917 = int(_1913) & 3;
    float _1919 = (*spvDescriptorSet0.vp_c15)._m0[int(_1915)][_1917];
    int _1921 = int(_1913) + 1;
    uint _1923 = uint(int(uint(_1921) >> uint(2)));
    int _1925 = _1921 & 3;
    float _1927 = (*spvDescriptorSet0.vp_c15)._m0[int(_1923)][_1925];
    float _1929 = trunc(_1903);
    int _1931 = int(_1929);
    float _1933 = fma(_1899, _1899, _1901);
    bool _1935 = _1909 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1937 = _1866 + 48;
    uint _1939 = uint(int(uint(_1937) >> uint(2)));
    uint _1941 = uint(int(uint(int(_1939)) >> uint(2)));
    int _1943 = int(_1939) & 3;
    float _1945 = (*spvDescriptorSet0.vp_c15)._m0[int(_1941)][_1943];
    int _1947 = int(_1939) + 1;
    uint _1949 = uint(int(uint(_1947) >> uint(2)));
    int _1951 = _1947 & 3;
    float _1953 = (*spvDescriptorSet0.vp_c15)._m0[int(_1949)][_1951];
    float _1955 = sqrt(_1933);
    int _1957 = _1866 + 64;
    uint _1959 = uint(int(uint(_1957) >> uint(2)));
    uint _1961 = uint(int(uint(int(_1959)) >> uint(2)));
    int _1963 = int(_1959) & 3;
    float _1965 = (*spvDescriptorSet0.vp_c15)._m0[int(_1961)][_1963];
    int _1967 = int(_1959) + 1;
    uint _1969 = uint(int(uint(_1967) >> uint(2)));
    int _1971 = _1967 & 3;
    float _1973 = (*spvDescriptorSet0.vp_c15)._m0[int(_1969)][_1971];
    int _1975 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1977 = _1931 + _1975;
    int _1979 = _1977 + 1;
    int _1981 = _1909 | _1979;
    int _1983 = _1866 + 72;
    uint _1985 = uint(int(uint(_1983) >> uint(2)));
    uint _1987 = uint(int(uint(int(_1985)) >> uint(2)));
    int _1989 = int(_1985) & 3;
    float _1991 = (*spvDescriptorSet0.vp_c15)._m0[int(_1987)][_1989];
    int _1993 = int(_1985) + 1;
    uint _1995 = uint(int(uint(_1993) >> uint(2)));
    int _1997 = _1993 & 3;
    float _1999 = (*spvDescriptorSet0.vp_c15)._m0[int(_1995)][_1997];
    bool _2001 = _1981 < 0;
    bool _2003 = _2001 || _1935;
    bool _2005 = _1979 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _2007 = _2005 || _2003;
    bool _2009 = _1955 > 0.0;
    int _2011 = _1866 + 56;
    uint _2013 = uint(int(uint(_2011) >> uint(2)));
    uint _2015 = uint(int(uint(int(_2013)) >> uint(2)));
    int _2017 = int(_2013) & 3;
    float _2019 = (*spvDescriptorSet0.vp_c15)._m0[int(_2015)][_2017];
    int _2021 = int(_2013) + 1;
    uint _2023 = uint(int(uint(_2021) >> uint(2)));
    int _2025 = _2021 & 3;
    float _2027 = (*spvDescriptorSet0.vp_c15)._m0[int(_2023)][_2025];
    int _2029 = _1866 + 80;
    uint _2031 = uint(int(uint(_2029) >> uint(2)));
    uint _2033 = uint(int(uint(int(_2031)) >> uint(2)));
    int _2035 = int(_2031) & 3;
    float _2037 = (*spvDescriptorSet0.vp_c15)._m0[int(_2033)][_2035];
    int _2039 = int(_2031) + 1;
    uint _2041 = uint(int(uint(_2039) >> uint(2)));
    int _2043 = _2039 & 3;
    float _2045 = (*spvDescriptorSet0.vp_c15)._m0[int(_2041)][_2043];
    float _2047 = _1804 * _1893;
    float _2049 = fma(_992, _1885, _2047);
    float _2051 = fma(_1390, _1919, _2049);
    float _2053 = _2051 + _1927;
    float _2055 = _1804 * _1953;
    int _2057 = as_type<int>(_1953);
    int _2059 = as_type<int>(_1955);
    int _2061 = as_type<int>(_1893);
    float _2063 = _1965;
    float _2065 = _1899;
    float _2067 = as_type<float>(_1856);
    float _2069 = _1903;
    float _2071 = as_type<float>(_1909);
    if (!_2007)
    {
        int _2073 = _1979 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _2075 = _2073 + _1909;
        _2057 = _2075;
    }
    int _2077 = _2057;
    float _2079 = fma(_992, _1945, _2055);
    float _2081 = 1.0 / _2053;
    if (!_2007)
    {
        int _2083 = _2077 << 2;
        _2059 = _2083;
    }
    int _2085 = _2059;
    float _2087 = _1804 * _1973;
    int _2089 = _2085;
    if (!_2007)
    {
        uint _2091 = uint(int(uint(_2077) >> uint(2)));
        _2061 = int(_2091);
    }
    int _2093 = _2061;
    if (!_2007)
    {
        int _2095 = 12 & _2085;
        _2089 = _2095;
    }
    int _2097 = _2089;
    float _2099 = fma(_992, _1965, _2087);
    float _2101 = _2099;
    if (!_2009)
    {
        _2063 = _1836;
    }
    float _2103 = _2063;
    float _2105 = fma(_1390, _1991, _2099);
    float _2107 = _1991;
    float _2109 = _2103;
    float _2111 = _2103;
    if (!_2009)
    {
        _2107 = _1842;
    }
    float _2113 = _2107;
    float _2115 = _2113;
    if (!_2009)
    {
        _2101 = _1864;
    }
    float _2117 = _2101;
    float _2119 = fma(_1390, _2019, _2079);
    bool _2121 = !_2009;
    float _2123 = _2117;
    float _2125 = _2117;
    if (!_2121)
    {
        float _2127 = _200 * _200;
        float _2129 = rsqrt(_1933);
        float _2131 = fma(_198, _198, _2127);
        float _2133 = fma(_202, _202, _2131);
        float _2135 = sqrt(_2133);
        float _2137 = _1872 * _2129;
        float _2139 = _1862 * _2129;
        float _2141 = _1899 * _2129;
        bool _2143 = _2135 > 0.0;
        float _2145 = _2135;
        _2065 = _2141;
        if (!_2143)
        {
            _2145 = _1842;
        }
        float _2147 = _2145;
        _2115 = _2147;
        if (!_2143)
        {
            _2109 = _1836;
        }
        float _2149 = _2109;
        _2111 = _2149;
        if (!_2143)
        {
            _2123 = _1864;
        }
        float _2151 = _2123;
        bool _2153 = !_2143;
        _2125 = _2151;
        if (!_2153)
        {
            float _2155 = rsqrt(_2133);
            float _2157 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2159 = _200 * _2155;
            float _2161 = _198 * _2155;
            float _2163 = _2139 * _2159;
            float _2165 = _202 * _2155;
            float _2167 = fma(_2137, _2161, _2163);
            float _2169 = _2157 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2171 = fma(_2141, _2165, _2167);
            float _2173 = _2171 * _2169;
            float _2175 = fma(_198, _2173, _1842);
            float _2177 = fma(_200, _2173, _1836);
            float _2179 = fma(_202, _2173, _1864);
            _2111 = _2177;
            _2115 = _2175;
            _2125 = _2179;
        }
    }
    float _2181 = _2111;
    float _2183 = _2115;
    float _2185 = _2065;
    float _2187 = _2125;
    float _2189 = _2185;
    if (!_2007)
    {
        int _2191 = _2093 << 4;
        int _2193 = _2191 + _2097;
        _2189 = as_type<float>(_2193);
    }
    float _2195 = _2189;
    int _2197 = _1866 + 88;
    uint _2199 = uint(int(uint(_2197) >> uint(2)));
    uint _2201 = uint(int(uint(int(_2199)) >> uint(2)));
    int _2203 = int(_2199) & 3;
    float _2205 = (*spvDescriptorSet0.vp_c15)._m0[int(_2201)][_2203];
    int _2207 = int(_2199) + 1;
    uint _2209 = uint(int(uint(_2207) >> uint(2)));
    int _2211 = _2207 & 3;
    float _2213 = (*spvDescriptorSet0.vp_c15)._m0[int(_2209)][_2211];
    float _2215 = _2119 + _2027;
    float _2217 = _2181 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2219 = _2181 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2221 = _2105 + _1999;
    float _2223 = _2181 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2225 = _2181 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2227 = fma(_2183, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2217);
    float _2229 = _2195;
    if (!_2007)
    {
        int _2231 = as_type<int>(_2195) + 400;
        uint _2233 = uint(int(uint(_2231) >> uint(2)));
        uint _2235 = uint(int(uint(int(_2233)) >> uint(2)));
        int _2237 = int(_2233) & 3;
        float _2239 = (*spvDescriptorSet0.vp_c15)._m0[int(_2235)][_2237];
        _2229 = _2239;
    }
    float _2241 = _2229;
    float _2243 = fma(_2183, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2219);
    float _2245 = _2215 * _2081;
    float _2247 = fma(_2183, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2223);
    float _2249 = fma(_2183, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2225);
    float _2251 = fma(_2187, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2227);
    float _2253 = fma(_2187, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2243);
    bool _2255 = _2245 >= 0.0;
    float _2257 = fma(_2187, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2247);
    float _2259 = _2251 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2261 = _2253 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2263 = _2221 * _2081;
    bool _2265 = _2245 <= 1.0;
    bool _2267 = _2265 && _2255;
    float _2269 = _2257 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2271 = _2261 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2273 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    bool _2275 = _2263 >= 0.0;
    bool _2277 = _2275 && _2267;
    float _2279 = _2269 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2281 = fma(_2187, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2249);
    float _2283 = fma(_2259, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2271);
    bool _2285 = _2263 <= 1.0;
    bool _2287 = _2285 && _2277;
    float _2289 = -_2279;
    float _2291 = fma(_2289, _2273, 1.0);
    float _2293 = _2281 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2295 = fma(_2269, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2283);
    float _2297 = _2261 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2299 = _2261 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2301 = _1804 * _2045;
    float _2303 = fma(_2293, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2295);
    float _2305 = log2(_2291);
    float _2307 = fma(_2259, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2297);
    float _2309 = fma(_2259, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2299);
    float _2311 = fma(_992, _2037, _2301);
    float _2313 = _2299;
    if (_2287)
    {
        float _2315 = float(_1856);
        _2067 = _2315;
    }
    float _2317 = _2067;
    float _2319 = fma(_2269, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2307);
    float _2321 = fma(_2269, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2309);
    float _2323 = 1.0 / _2303;
    float _2325 = fma(_2293, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2321);
    float _2327 = fma(_1390, _2205, _2311);
    float _2329 = fma(_2293, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2319);
    float _2331 = as_type<float>(_2097);
    float _2333 = _2329;
    float _2335 = _2325;
    if (!_2007)
    {
        float _2337 = floor(_1903);
        _2331 = _2337;
    }
    float _2339 = _2331;
    float _2341 = _2327 + _2213;
    float _2343 = _2305 * 0.693147182464599609375;
    float _2345 = _2341 * _2081;
    float _2347 = _2343 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2349 = _198;
    if (!_2007)
    {
        float _2351 = floor(_1834);
        _2349 = _2351;
    }
    float _2353 = _2349;
    float _2355 = _2329 * _2323;
    float _2357 = _2325 * _2323;
    float _2359 = fma(_2357, -0.5, 0.5);
    float _2361 = _2307;
    if (_2287)
    {
        float _2363 = rint(_2317);
        float _2365 = precise::max(_2363, 0.0);
        uint _2367 = uint(_2365);
        uint _2369 = clamp(_2367, 0u, 65535u);
        _2361 = as_type<float>(_2369);
    }
    float _2371 = _2361;
    float _2373 = _2339;
    if (!_2007)
    {
        float _2375 = -_2339;
        float _2377 = _1903 + _2375;
        _2373 = _2377;
    }
    float _2379 = _2373;
    float _2381 = _2241;
    if (!_2007)
    {
        float _2383 = rint(_2241);
        float _2385 = precise::max(_2383, 0.0);
        uint _2387 = uint(_2385);
        uint _2389 = clamp(_2387, 0u, 65535u);
        _2381 = as_type<float>(_2389);
    }
    float _2391 = _2381;
    float _2393 = fma(_2355, 0.5, 0.5);
    if (!_2007)
    {
        float _2395 = -_2353;
        float _2397 = _1834 + _2395;
        _2069 = _2397;
    }
    float _2399 = _2069;
    float _2401 = _2371;
    if (_2287)
    {
        float3 _7015 = float3(_2245, _2263, float(as_type<int>(_2371)));
        float3 _7019 = select(_7015, float3(0.0), isnan(_7015));
        float _2403 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _7019.xy, uint(rint(_7019.z)), _2345, level(0.0));
        _2401 = _2403;
    }
    float _2405 = _2401;
    float3 _7029 = float3(_2393, _2359, _2347);
    float _2407 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7029, float3(0.0), isnan(_7029)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7029, float3(0.0), isnan(_7029)), level(0.0)).x;
    float3 _7038 = float3(_2393, _2359, _2347);
    float4 _2410 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7038, float3(0.0), isnan(_7038)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7038, float3(0.0), isnan(_7038)), level(0.0)).xyzw;
    float _2412 = _2410.x;
    float _2414 = _2410.y;
    float _2416 = _2410.z;
    float _2418 = _2410.w;
    float _2420 = _2399;
    if (!_2007)
    {
        float3 _7061 = float3(_2399, _2379, float(as_type<int>(_2391)));
        float3 _7063 = select(_7061, float3(0.0), isnan(_7061));
        float _2422 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _7063.xy, uint(rint(_7063.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _7063.xy, uint(rint(_7063.z)), level(0.0)).x;
        _2420 = _2422;
    }
    float _2424 = _2420;
    if (_2007)
    {
        _2313 = 1.0;
    }
    float _2426 = _2313;
    float _2428 = _2426;
    if (!_2007)
    {
        int _2430 = _2077 << 4;
        int _2432 = _2430 + 2048;
        uint _2434 = uint(int(uint(_2432) >> uint(2)));
        uint _2436 = uint(int(uint(int(_2434)) >> uint(2)));
        int _2438 = int(_2434) & 3;
        float _2440 = (*spvDescriptorSet0.vp_c15)._m0[int(_2436)][_2438];
        int _2442 = int(_2434) + 1;
        uint _2444 = uint(int(uint(_2442) >> uint(2)));
        int _2446 = _2442 & 3;
        float _2448 = (*spvDescriptorSet0.vp_c15)._m0[int(_2444)][_2446];
        int _2450 = _2432 + 8;
        uint _2452 = uint(int(uint(_2450) >> uint(2)));
        uint _2454 = uint(int(uint(int(_2452)) >> uint(2)));
        int _2456 = int(_2452) & 3;
        float _2458 = (*spvDescriptorSet0.vp_c15)._m0[int(_2454)][_2456];
        int _2460 = int(_2452) + 1;
        uint _2462 = uint(int(uint(_2460) >> uint(2)));
        int _2464 = _2460 & 3;
        float _2466 = (*spvDescriptorSet0.vp_c15)._m0[int(_2462)][_2464];
        float _2468 = _1804 * _2448;
        float _2470 = fma(_992, _2440, _2468);
        float _2472 = fma(_1390, _2458, _2470);
        float _2474 = _2472 + _2466;
        float _2476 = precise::clamp(_2474, 0.0, 1.0);
        float _2478 = -_2476;
        float _2480 = _2478 + _2424;
        float _2482 = fma(_2480, 500.0, 1.5);
        float _2484 = exp2(_2482);
        float _2486 = 0.0 + _2484;
        float _2488 = precise::clamp(_2486, 0.0, 1.0);
        _1846 = _2484;
        _2428 = _2488;
    }
    float _2490 = _1846;
    float _2492 = _2428;
    float _2494 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2496 = _2181 + _2494;
    float _2498 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2500 = _2183 + _2498;
    float _2502 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2504 = _2187 + _2502;
    float _2506 = _2496 * _2496;
    float _2508 = fma(_2500, _2500, _2506);
    float _2510 = fma(_2504, _2504, _2508);
    float _2512 = rsqrt(_2510);
    float _2514 = _2512 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2516 = _2500 * _2514;
    float _2518 = _2504 * _2514;
    float _2520 = _2516 * _2516;
    float _2522 = _2518 * _2518;
    float _2524 = _2520 + _2522;
    float _2526 = sqrt(_2524);
    bool _2528 = _2526 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2530 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2532 = _2526 + _2530;
    float _2534 = _2512;
    float _2536 = _2532;
    float _2538 = _2496;
    float _2540 = _2514;
    if (_2528)
    {
        float _2542 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2534 = _2542;
    }
    float _2544 = _2534;
    float _2546 = _2544;
    if (_2528)
    {
        float _2548 = _2532 * _2544;
        _2536 = _2548;
    }
    float _2550 = _2536;
    if (_2528)
    {
        float _2552 = rsqrt(_2524);
        _2546 = _2552;
    }
    float _2554 = _2546;
    float _2556 = _2554;
    if (_2528)
    {
        float _2558 = _2550 * 0.15915493667125701904296875;
        _996 = _2558;
    }
    float _2560 = _996;
    float _2562 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2564 = _2504;
    float _2566 = _2560;
    if (_2528)
    {
        float _2568 = _2560 * 6.283185482025146484375;
        float _2570 = sin(_2568);
        _2564 = _2570;
    }
    float _2572 = _2564;
    float _2574 = precise::max(0.0, _2562);
    float _2576 = _2490;
    float _2578 = _2574;
    if (_2528)
    {
        float _2580 = _2560 * 6.283185482025146484375;
        float _2582 = cos(_2580);
        _2576 = _2582;
    }
    float _2584 = _2576;
    float _2586 = -_2514;
    float _2588 = -_2574;
    float _2590 = fma(_2496, _2586, _2588);
    if (_2528)
    {
        float _2592 = _2590 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2538 = _2592;
    }
    float _2594 = _2538;
    float _2596 = _2572;
    float _2598 = _2594;
    if (_2528)
    {
        float _2600 = fma(_2572, _2594, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2596 = _2600;
    }
    float _2602 = _2596;
    float _2604 = _2602;
    if (!_2528)
    {
        _2598 = _2518;
    }
    float _2606 = _2598;
    float _2608 = _2606;
    if (!_2528)
    {
        _2566 = _2520;
    }
    float _2610 = _2566;
    float _2612 = _2610;
    if (_2528)
    {
        float _2614 = _2554 * _2602;
        _2071 = _2614;
    }
    float _2616 = _2071;
    if (!_2528)
    {
        _2556 = _2516;
    }
    float _2618 = _2556;
    float _2620 = _2618;
    float _2622 = _2584;
    if (_2528)
    {
        float _2624 = _2584 + (-1.0);
        _2578 = _2624;
    }
    float _2626 = _2578;
    if (_2528)
    {
        float _2628 = _2516 * _2616;
        _2620 = _2628;
    }
    float _2630 = _2620;
    if (!_2528)
    {
        _2604 = _2590;
    }
    float _2632 = _2604;
    float _2634 = _2632;
    if (_2528)
    {
        float _2636 = _2518 * _2616;
        _2608 = _2636;
    }
    float _2638 = _2608;
    if (_2528)
    {
        float _2640 = _2626 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2540 = _2640;
    }
    float _2642 = _2540;
    if (_2528)
    {
        float _2644 = _2630 * _2630;
        _2612 = _2644;
    }
    float _2646 = _2612;
    float _2648 = sqrt(_2510);
    if (_2528)
    {
        float _2650 = fma(_2590, _2584, _2642);
        _2634 = _2650;
    }
    float _2652 = _2634;
    if (!_2528)
    {
        _2622 = _2522;
    }
    float _2654 = _2622;
    float _2656 = _2654;
    if (_2528)
    {
        float _2658 = _2638 * _2638;
        _2656 = _2658;
    }
    float _2660 = _2656;
    float _2662 = fma(_2652, _2652, _2646);
    float _2664 = _2662 + _2660;
    float _2666 = rsqrt(_2664);
    float _2668 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2670 = fma(_2648, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2668);
    float _2672 = precise::clamp(_2670, 0.0, 1.0);
    float _2674 = -_2672;
    float _2676 = _2674 + 1.0;
    float _2678 = _2666 * _2630;
    float _2680 = _2666 * _2652;
    float _2682 = _2666 * _2638;
    float _2684 = abs(_2676);
    float _2686 = log2(_2684);
    float _2688 = _2678 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2690 = -_2688;
    float _2692 = fma(_2680, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2690);
    float _2694 = -_2682;
    float _2696 = fma(_2694, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2692);
    float _2698 = fma(_2696, -0.5, 0.5);
    float _2700 = fma(_2696, 0.5, 0.5);
    float _2702 = _2686 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2704 = fma(_2700, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2706 = sqrt(_2698);
    float _2708 = fma(_2700, _2704, -0.212114393711090087890625);
    float _2710 = _2680 + 1.0;
    float _2712 = fma(_2700, _2708, 1.570728778839111328125);
    float _2714 = exp2(_2702);
    float _2716 = _2706 * 0.636619746685028076171875;
    float _2718 = -_2712;
    float _2720 = fma(_2716, _2718, 1.0);
    float _2722 = -_2680;
    float _2724 = fma(_2714, _2710, _2722);
    float _2726 = fma(_2724, 0.5, 0.5);
    float2 _7537 = float2(_2720, _2726);
    float3 _2730 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7537, float2(0.0), isnan(_7537)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7537, float2(0.0), isnan(_7537)), level(0.0)).xyz;
    float _2732 = _2730.x;
    float _2734 = _2730.y;
    float _2736 = _2730.z;
    float _2738 = abs(_1818);
    float _2740 = log2(_2738);
    float _2742 = _2261 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2744 = -_1772;
    float _2746 = _2744 + 1.0;
    float _2748 = fma(_2259, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2742);
    bool _2750 = _1818 <= 8000.0;
    bool _2752 = isnan(_1818);
    bool _2754 = _2750 || _2752;
    bool _2756 = isnan(8000.0);
    bool _2758 = _2754 || _2756;
    float _2760 = float(_2758);
    float _2762 = fma(_2269, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2748);
    float _2764 = fma(_2293, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2762);
    float _2766 = _2303 * 0.5;
    float _2768 = _2740 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    out.gl_Position.x = _2329;
    out.gl_Position.y = _2325;
    out.gl_Position.z = _2764;
    out.gl_Position.w = _2303;
    float _2770 = exp2(_2768);
    float _2772 = fma(_2770, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2774 = precise::clamp(_2772, 0.0, 1.0);
    float _2776 = fma(_2325, -0.5, _2766);
    float _2778 = _2766;
    float _2780 = _2764;
    if (!_2287)
    {
        _2778 = 1.0;
    }
    float _2782 = _2778;
    float _2784 = fma(_2774, -2.0, 3.0);
    float _2786 = _2774 * _2774;
    float _2788 = _2782;
    if (_2287)
    {
        bool _2790 = _2405 >= _2345;
        bool _2792 = isnan(_2405);
        bool _2794 = _2790 || _2792;
        bool _2796 = isnan(_2345);
        bool _2798 = _2794 || _2796;
        float _2800 = float(_2798);
        _2788 = _2800;
    }
    float _2802 = _2788;
    bool _2804 = _2648 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2806 = isnan(_2648);
    bool _2808 = _2804 || _2806;
    bool _2810 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2812 = _2808 || _2810;
    float _2814 = _2786 * _2784;
    float _2816 = _2686 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2818 = _2802 * _2492;
    float _2820 = _2329 + _2303;
    float _2822 = -_2814;
    float _2824 = _2822 + 1.0;
    float _2826 = exp2(_2816);
    float _2828 = fma(_2824, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2814);
    float _2830 = _2764 + _2303;
    float _2832 = _2820 * 0.5;
    float _2834 = _2760 * _2828;
    float _2836 = _2830 * 0.5;
    if (!_2812)
    {
        _2780 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2838 = _2780;
    float _2840 = _2834 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2842 = _2838;
    float _2844 = _2838;
    if (!_2812)
    {
        _2333 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2846 = _2333;
    out.m_95.x = _2832;
    out.m_95.y = _2776;
    out.m_95.z = _2836;
    out.m_95.w = _2303;
    float _2848 = _2846;
    float _2850 = _2846;
    if (!_2812)
    {
        _2335 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2852 = _2335;
    float _2854 = _2746 * _2840;
    float _2856 = precise::clamp(_2854, 0.0, 1.0);
    float _2858 = -_2826;
    float _2860 = _2858 + 1.0;
    float _2862 = -_2856;
    float _2864 = fma(_2862, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2866 = _2860 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2868 = -_2818;
    float _2870 = fma(_2868, _2864, 1.0);
    float _2872 = precise::clamp(_2870, 0.0, 1.0);
    float _2874 = _2866 * _2407;
    float _2876 = -_2866;
    float _2878 = _2876 + 1.0;
    float _2880 = _2872 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2882 = _2418 * _2874;
    float _2884 = _2418 * _2878;
    float _2886 = _2878;
    float _2888 = _2882;
    float _2890 = _2852;
    float _2892 = _2852;
    if (!_2812)
    {
        _2886 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2894 = _2886;
    out.m_97.x = _2880;
    float _2896 = _2736 * _2874;
    float _2898 = fma(_2732, _2882, _2412);
    float _2900 = fma(_2734, _2882, _2414);
    float _2902 = _2896;
    float _2904 = _2894;
    float _2906 = _2894;
    if (!_2812)
    {
        _2888 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2908 = _2888;
    float _2910 = fma(_2418, _2896, _2416);
    float _2912 = _2908;
    float _2914 = _2908;
    if (!_2812)
    {
        _2902 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2916 = _2902;
    out.m_99.x = _2898;
    out.m_99.y = _2900;
    out.m_99.z = _2910;
    out.m_99.w = _2884;
    bool _2918 = !_2812;
    float _2920 = _2916;
    float _2922 = _2916;
    if (!_2918)
    {
        bool _2924 = _2648 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2926 = isnan(_2648);
        bool _2928 = _2924 || _2926;
        bool _2930 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2932 = _2928 || _2930;
        if (!_2932)
        {
            float _2934 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2936 = _2648 + _2934;
            float _2938 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2940 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2938;
            float _2942 = 1.0 / _2940;
            float _2944 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2946 = _2944 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2948 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2950 = _2948 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2952 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2954 = _2952 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2956 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2958 = _2956 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2960 = _2936 * _2942;
            float _2962 = precise::clamp(_2960, 0.0, 1.0);
            float _2964 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2966 = _2964 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2968 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2970 = _2968 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2972 = fma(_2962, _2946, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2974 = fma(_2962, _2966, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2976 = fma(_2962, _2970, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2978 = fma(_2962, _2950, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2980 = fma(_2962, _2954, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2982 = fma(_2962, _2958, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2850 = _2976;
            _2914 = _2980;
            _2844 = _2974;
            _2922 = _2978;
            _2892 = _2972;
            _2906 = _2982;
            _2984 = true;
        }
        else
        {
            bool _2986 = _2648 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2988 = isnan(_2648);
            bool _2990 = _2986 || _2988;
            bool _2992 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2994 = _2990 || _2992;
            if (!_2994)
            {
                _2842 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2996 = _2842;
            _2844 = _2996;
            if (!_2994)
            {
                _2848 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2998 = _2848;
            _2850 = _2998;
            if (!_2994)
            {
                _2890 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3000 = _2890;
            _2892 = _3000;
            if (!_2994)
            {
                _2920 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3002 = _2920;
            _2922 = _3002;
            if (!_2994)
            {
                _2912 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3004 = _2912;
            _2914 = _3004;
            if (!_2994)
            {
                _2904 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3006 = _2904;
            bool _3008 = !_2994;
            _2906 = _3006;
            if (!_3008)
            {
                bool _3010 = _2648 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3012 = isnan(_2648);
                bool _3014 = _3010 || _3012;
                bool _3016 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3018 = _3014 || _3016;
                if (!_3018)
                {
                    float _3020 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3022 = _2648 + _3020;
                    float _3024 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3026 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3024;
                    float _3028 = 1.0 / _3026;
                    float _3030 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3032 = _3030 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3034 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3036 = _3034 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3038 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3040 = _3038 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3042 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3044 = _3042 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3046 = _3022 * _3028;
                    float _3048 = precise::clamp(_3046, 0.0, 1.0);
                    float _3050 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3052 = _3050 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3054 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3056 = _3054 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3058 = fma(_3048, _3032, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3060 = fma(_3048, _3052, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3062 = fma(_3048, _3056, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3064 = fma(_3048, _3036, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3066 = fma(_3048, _3040, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3068 = fma(_3048, _3044, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2850 = _3062;
                    _2914 = _3066;
                    _2844 = _3060;
                    _2922 = _3064;
                    _2892 = _3058;
                    _2906 = _3068;
                    _2984 = true;
                }
                else
                {
                    _2850 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2914 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2844 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2922 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2892 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2906 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2984 = false;
    float _3070 = _2850;
    float _3072 = _2914;
    float _3074 = _2844;
    float _3076 = _2922;
    float _3078 = _2892;
    float _3080 = _2906;
    float _3082 = fma(_1664, -0.5, 0.5);
    float _3084 = precise::clamp(_3082, 0.0, 1.0);
    float _3086 = -_3070;
    float _3088 = _3086 + _3072;
    float _3090 = -_3074;
    float _3092 = _3090 + _3076;
    float _3094 = -_3078;
    float _3096 = _3094 + _3080;
    bool _3098 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3100 = fma(_3084, _3088, _3070);
    float _3102 = fma(_3084, _3092, _3074);
    float _3104 = fma(_3084, _3096, _3078);
    float _3106 = _3100 * 0.586610972881317138671875;
    out.m_101.x = 0.0;
    float _3108 = fma(_3102, 0.298911988735198974609375, _3106);
    float _3110 = fma(_3104, 0.114477999508380889892578125, _3108);
    float _3112 = -_3110;
    float _3114 = _3102 + _3112;
    float _3116 = -_3110;
    float _3118 = _3100 + _3116;
    float _3120 = -_3110;
    float _3122 = _3104 + _3120;
    float _3124 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3126 = fma(_3114, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3110);
    float _3128 = fma(_3118, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3110);
    float _3130 = fma(_3122, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3110);
    out.m_61.x = _3124;
    out.m_103.x = _3126;
    out.m_103.y = _3128;
    out.m_103.z = _3130;
    if (!_3098)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3132 = -_2181;
    float _3134 = _3132 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3136 = -_2183;
    float _3138 = _3136 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3140 = -_2187;
    float _3142 = _3140 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3144 = _3134 * _3134;
    float _3146 = fma(_3138, _3138, _3144);
    float _3148 = fma(_3142, _3142, _3146);
    float _3150 = sqrt(_3148);
    float _3152 = rsqrt(_3148);
    float _3154 = -_3150;
    float _3156 = _3154 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3158 = _3156 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3160 = precise::clamp(_3158, 0.0, 1.0);
    float _3162 = _3138 * _3152;
    float _3164 = _3134 * _3152;
    float _3166 = abs(_3160);
    float _3168 = log2(_3166);
    float _3170 = _3142 * _3152;
    float _3172 = _3162 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3174 = _1664 * _3164;
    float _3176 = -_3164;
    float _3178 = -_3172;
    float _3180 = fma(_3176, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3178);
    float _3182 = fma(_1648, _3162, _3174);
    float _3184 = -_3170;
    float _3186 = fma(_3184, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3180);
    float _3188 = fma(_1678, _3170, _3182);
    float _3190 = precise::clamp(_3188, 0.0, 1.0);
    float _3192 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3194 = _3186 + _3192;
    float _3196 = _3168 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3198 = _3194 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3200 = precise::clamp(_3198, 0.0, 1.0);
    float _3202 = exp2(_3196);
    float _3204 = _3202 * _3200;
    float _3206 = _3190 * _3204;
    float _3208 = _3206 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3210 = _3206 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3212 = _3206 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_101.x = _3208;
    out.m_101.y = _3210;
    out.m_101.z = _3212;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2984 = false;
    bool _1724 = false;
    bool _730 = false;
    bool _500 = false;
    bool _224 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _117 = in.m_58.w;
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
        out.m_61.x = 0.0;
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
        float _3269 = as_type<float>(_138);
        out.gl_Position.z = _3269;
    }
    if (!_126)
    {
        return out;
    }
    float _142 = in.m_63.w;
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
        float _162 = float(_122);
        _158 = _162;
    }
    float _164 = _158;
    bool _166 = _156 >= _164;
    bool _168 = !_152;
    bool _170 = _166 || _168;
    if (_170)
    {
        _132 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _172 = _132;
    if (_170)
    {
        out.m_61.x = 0.0;
    }
    if (_170)
    {
        float _174 = _172 * 5.0;
        _140 = as_type<int>(_174);
    }
    int _176 = _140;
    if (_170)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3338 = as_type<float>(_176);
        out.gl_Position.z = _3338;
    }
    if (_170)
    {
        return out;
    }
    float _178 = in.m_65.x;
    float _180 = in.m_65.y;
    float _182 = in.m_65.z;
    bool _184 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _186 = _180 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _188 = _180 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _190 = _180 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _192 = fma(_178, (*spvDescriptorSet0.vp_c10)._m0[4].x, _186);
    float _194 = fma(_178, (*spvDescriptorSet0.vp_c10)._m0[5].x, _188);
    float _196 = fma(_178, (*spvDescriptorSet0.vp_c10)._m0[6].x, _190);
    float _198 = fma(_182, (*spvDescriptorSet0.vp_c10)._m0[4].z, _192);
    float _200 = fma(_182, (*spvDescriptorSet0.vp_c10)._m0[5].z, _194);
    float _202 = fma(_182, (*spvDescriptorSet0.vp_c10)._m0[6].z, _196);
    bool _204 = !_184;
    float _222;
    if (!_204)
    {
        float _206 = in.m_67.x;
        float _208 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _210 = _206 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _212 = fma(_210, (*spvDescriptorSet0.vp_c9)._m0[12].x, _156);
        float _214 = _212 * _208;
        float _216 = floor(_214);
        float _218 = -_216;
        float _220 = _214 + _218;
        _222 = _220;
        _224 = true;
    }
    else
    {
        float _226 = float(_122);
        float _228 = 1.0 / _226;
        float _230 = _156 * _228;
        _222 = _230;
    }
    _224 = false;
    float _232 = _222;
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _236 = _232 + _234;
    float _238 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _240 = _232 + _238;
    float _242 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _244 = _232 + _242;
    float _246 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _248 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _246;
    float _250 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _252 = _250 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _254 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _256 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _254;
    float _258 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _260 = _258 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _262 = 1.0 / _248;
    bool _264 = _232 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _266 = isnan(_232);
    bool _268 = _264 || _266;
    bool _270 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _272 = _268 || _270;
    float _274 = float(_272);
    float _276 = 1.0 / _252;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _280 = _232 + _278;
    float _282 = 1.0 / _260;
    float _284 = _240 * _262;
    bool _286 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _288 = 1.0 / _256;
    float _290 = _236 * _276;
    bool _292 = _232 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _294 = isnan(_232);
    bool _296 = _292 || _294;
    bool _298 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _300 = _296 || _298;
    float _302 = float(_300);
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _306 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _304;
    bool _308 = _232 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _310 = isnan(_232);
    bool _312 = _308 || _310;
    bool _314 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _316 = _312 || _314;
    float _318 = float(_316);
    float _320 = fma(_306, _284, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _322 = _280 * _282;
    bool _324 = _232 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _326 = isnan(_232);
    bool _328 = _324 || _326;
    bool _330 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _332 = _328 || _330;
    float _334 = float(_332);
    float _336 = -_302;
    float _338 = _336 + 1.0;
    float _340 = -_318;
    float _342 = _340 + 1.0;
    float _344 = _334 * _338;
    float _346 = -_334;
    float _348 = _346 + 1.0;
    float _350 = _244 * _288;
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _354 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _352;
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _358 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _356;
    float _360 = _318 * _348;
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _364 = _362 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _366 = fma(_354, _284, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _368 = fma(_358, _284, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _370 = _232 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _372 = isnan(_232);
    bool _374 = _370 || _372;
    bool _376 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _378 = _374 || _376;
    float _380 = float(_378);
    float _382 = _274 * _342;
    float _384 = -_274;
    float _386 = _384 + 1.0;
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _390 = _388 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _394 = _392 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _396 = fma(_364, _290, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _398 = _380 * _386;
    float _400 = -_380;
    float _402 = _400 + 1.0;
    float _404 = fma(_390, _290, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _406 = fma(_394, _290, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _408 = _320 * _398;
    float _410 = _366 * _398;
    float _412 = _368 * _398;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _416 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _414;
    float _418 = fma(_402, (*spvDescriptorSet0.vp_c9)._m0[143].x, _408);
    float _420 = fma(_402, (*spvDescriptorSet0.vp_c9)._m0[143].y, _410);
    float _422 = fma(_402, (*spvDescriptorSet0.vp_c9)._m0[143].z, _412);
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _426 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _424;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _430 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _428;
    float _432 = fma(_404, _382, _418);
    float _434 = fma(_406, _382, _420);
    float _436 = fma(_416, _350, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _438 = fma(_396, _382, _422);
    float _440 = fma(_426, _350, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _444 = _442 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _448 = _446 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _450 = fma(_430, _350, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _454 = _452 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _456 = fma(_436, _360, _432);
    float _458 = fma(_444, _322, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _460 = fma(_448, _322, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _462 = fma(_440, _360, _434);
    float _464 = fma(_454, _322, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _466 = fma(_450, _360, _438);
    float _468 = fma(_458, _344, _456);
    float _470 = fma(_460, _344, _462);
    float _472 = fma(_464, _344, _466);
    float _474 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[147].x, _468);
    float _476 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[147].y, _470);
    float _478 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[147].z, _472);
    bool _480 = !_286;
    float _498;
    if (!_480)
    {
        float _482 = in.m_67.x;
        float _484 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _486 = _482 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _488 = fma(_486, (*spvDescriptorSet0.vp_c9)._m0[11].y, _156);
        float _490 = _488 * _484;
        float _492 = floor(_490);
        float _494 = -_492;
        float _496 = _490 + _494;
        _498 = _496;
        _500 = true;
    }
    else
    {
        float _502 = float(_122);
        float _504 = 1.0 / _502;
        float _506 = _156 * _504;
        _498 = _506;
    }
    _500 = false;
    float _508 = _498;
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _512 = _508 + _510;
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _516 = _514 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _520 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _518;
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _524 = _522 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _526 = _508 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _528 = isnan(_508);
    bool _530 = _526 || _528;
    bool _532 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _534 = _530 || _532;
    float _536 = float(_534);
    float _538 = 1.0 / _516;
    float _540 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _542 = _540 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _544 = _508 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _546 = isnan(_508);
    bool _548 = _544 || _546;
    bool _550 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _552 = _548 || _550;
    float _554 = float(_552);
    bool _556 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _558 = 1.0 / _524;
    float _560 = _520 * _538;
    bool _562 = _508 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _564 = isnan(_508);
    bool _566 = _562 || _564;
    bool _568 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _570 = _566 || _568;
    float _572 = float(_570);
    float _574 = 1.0 / _542;
    float _576 = -_536;
    float _578 = _576 + 1.0;
    float _580 = fma(_560, _512, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _584 = _582 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _586 = _508 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _588 = isnan(_508);
    bool _590 = _586 || _588;
    bool _592 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _594 = _590 || _592;
    float _596 = float(_594);
    float _598 = -_572;
    float _600 = _598 + 1.0;
    float _602 = _572 * _578;
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _606 = _604 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _608 = 1.0 / _584;
    float _610 = -_596;
    float _612 = _610 + 1.0;
    float _614 = _554 * _600;
    float _616 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _618 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _616;
    float _620 = _606 * _558;
    float _622 = _536 * _612;
    float _624 = _580 * _614;
    float _626 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _628 = _508 + _626;
    float _630 = -_554;
    float _632 = _630 + 1.0;
    bool _634 = _508 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _636 = isnan(_508);
    bool _638 = _634 || _636;
    bool _640 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _642 = _638 || _640;
    float _644 = float(_642);
    float _646 = _618 * _574;
    float _648 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _650 = _648 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _652 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _654 = _508 + _652;
    float _656 = fma(_620, _628, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _658 = fma(_632, (*spvDescriptorSet0.vp_c9)._m0[115].x, _624);
    float _660 = -_644;
    float _662 = _660 + 1.0;
    float _664 = _650 * _608;
    float _666 = fma(_646, _654, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _668 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _670 = _508 + _668;
    float _672 = fma(_656, _602, _658);
    float _674 = _596 * _662;
    float _676 = fma(_664, _670, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _678 = fma(_666, _622, _672);
    float _680 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _682 = fma(_676, _674, _678);
    float _684 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _686 = _680 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _688 = fma(_644, (*spvDescriptorSet0.vp_c9)._m0[119].x, _682);
    float _690 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _692 = _684 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _694 = _688 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _696 = in.m_69.x;
    float _698 = in.m_69.y;
    float _700 = in.m_69.z;
    float _702 = _690 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_71.x = _686;
    out.m_71.y = _692;
    out.m_71.z = _702;
    out.m_71.w = _694;
    float _704 = _478 * _700;
    float _706 = _476 * _698;
    float _708 = _474 * _696;
    bool _710 = !_556;
    float _728;
    if (!_710)
    {
        float _712 = in.m_67.x;
        float _714 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _716 = _712 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _718 = fma(_716, (*spvDescriptorSet0.vp_c9)._m0[11].w, _156);
        float _720 = _718 * _714;
        float _722 = floor(_720);
        float _724 = -_722;
        float _726 = _720 + _724;
        _728 = _726;
        _730 = true;
    }
    else
    {
        float _732 = float(_122);
        float _734 = 1.0 / _732;
        float _736 = _156 * _734;
        _728 = _736;
    }
    _730 = false;
    float _738 = _728;
    float _740 = in.m_67.w;
    float _742 = _704 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _744 = in.m_73.y;
    float _746 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _748 = log2(_746);
    float _750 = in.m_67.z;
    int _752 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _754 = _752 != 0;
    float _756 = in.m_75.x;
    float _758 = in.m_75.y;
    float _760 = in.m_75.z;
    int _762 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _764 = _762 != 0;
    int _766 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _768 = _766 != 0;
    float _770 = in.m_67.y;
    int _772 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _774 = _772 != 0;
    float _776 = in.m_67.x;
    float _778 = _748 * _156;
    out.m_77.x = 1.0;
    out.m_77.y = 1.0;
    out.m_77.z = 1.0;
    bool _780 = _740 > 0.5;
    float _782 = in.m_58.x;
    float _784 = in.m_58.y;
    float _786 = in.m_58.z;
    float _788 = -_744;
    float _790 = _788 + 1.0;
    float _792 = exp2(_778);
    float _794 = _750 * 2.0;
    float _796 = in.m_73.x;
    int _798 = _780 ? as_type<int>(_790) : as_type<int>(_744);
    float _800 = _708 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _802 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _804 = _802 != 0;
    int _806 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _808 = _806 != 0;
    int _810 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _812 = _810 != 0;
    float _814 = _706 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _816 = floor(_794);
    float _818 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _756);
    float _820 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _760);
    float _822 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _758);
    float _824 = _770 * 2.0;
    float _826 = _818 * _800;
    float _828 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _830 = _828 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _832 = _820 * _742;
    float _834 = _822 * _814;
    float _836 = _768 ? as_type<float>(_798) : _744;
    float _838 = 1.0 / _830;
    bool _840 = _770 > 0.5;
    float _842 = _784 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _844 = _784 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _846 = _784 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _848 = _776 * 2.0;
    float _850 = fma(_782, (*spvDescriptorSet0.vp_c10)._m0[5].x, _842);
    float _852 = fma(_782, (*spvDescriptorSet0.vp_c10)._m0[4].x, _844);
    float _854 = fma(_782, (*spvDescriptorSet0.vp_c10)._m0[6].x, _846);
    float _856 = floor(_824);
    float _858 = _744;
    float _860 = _852;
    float _862 = _750;
    if (_774)
    {
        float _864 = _840 ? _790 : _744;
        _858 = _864;
    }
    float _866 = _858;
    float _868 = _770 + _750;
    bool _870 = _816 > 0.0;
    float _872 = _776 + _750;
    float _874 = _868 + (-1.0);
    bool _876 = _816 >= 0.0;
    bool _878 = isnan(_816);
    bool _880 = _876 || _878;
    bool _882 = isnan(0.0);
    bool _884 = _880 || _882;
    float _886 = floor(_848);
    float _888 = _872 + (-1.0);
    float _890 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _892 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _890;
    float _894 = fma(_874, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _896 = _776 + _770;
    float _898 = -_792;
    float _900 = _898 + 1.0;
    float _902 = _892 * _838;
    float _904 = _896 + (-1.0);
    int _906 = _884 ? 0 : 1;
    float _908 = fma(_888, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _910 = _888;
    if (!_754)
    {
        _910 = _796;
    }
    float _912 = _910;
    float _914 = fma(_904, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _916 = ~_906;
    int _918 = _916 + 1;
    int _920 = _918 + 1;
    float _922 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _924 = _738 + _922;
    int _926 = _920;
    float _928 = _912;
    if (!_870)
    {
        int _930 = ~_906;
        int _932 = _930 + 1;
        _926 = _932;
    }
    int _934 = _926;
    float _936 = fma(_786, (*spvDescriptorSet0.vp_c10)._m0[5].z, _850);
    bool _938 = _856 >= 0.0;
    bool _940 = isnan(_856);
    bool _942 = _938 || _940;
    bool _944 = isnan(0.0);
    bool _946 = _942 || _944;
    float _948 = fma(_902, _924, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _950 = _886 >= 0.0;
    bool _952 = isnan(_886);
    bool _954 = _950 || _952;
    bool _956 = isnan(0.0);
    bool _958 = _954 || _956;
    float _960 = _770 + (-0.5);
    int _962 = _946 ? 0 : 1;
    float _964 = _936 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _966 = _958 ? 0 : 1;
    bool _968 = _856 > 0.0;
    float _970 = fma(_786, (*spvDescriptorSet0.vp_c10)._m0[6].z, _854);
    bool _972 = _886 > 0.0;
    float _974 = fma(_786, (*spvDescriptorSet0.vp_c10)._m0[4].z, _852);
    bool _976 = !_804;
    int _978 = _976 ? 0 : 1;
    float _980 = in.m_79.x;
    float _982 = in.m_79.y;
    float _984 = in.m_79.z;
    bool _986 = _972;
    int _988 = as_type<int>(_948);
    if (!_754)
    {
        _860 = _912;
    }
    float _990 = _860;
    float _992 = _974 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _994 = _990;
    float _996 = _992;
    if (_754)
    {
        _928 = _796;
    }
    float _998 = _928;
    bool _1000 = !_808;
    int _1002 = _1000 ? 0 : 1;
    int _1004 = abs(_978);
    int _1006 = 0;
    float _1008 = _998;
    if (_764)
    {
        float _1010 = -_998;
        float _1012 = _1010 + 1.0;
        _1006 = as_type<int>(_1012);
    }
    int _1014 = _1006;
    int _1016 = abs(_1002);
    float _1018 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1020 = 1.0 + _1018;
    int _1022 = ~_966;
    int _1024 = _1022 + 1;
    int _1026 = _1024 + 1;
    int _1028 = _1026;
    if (!_972)
    {
        int _1030 = ~_966;
        int _1032 = _1030 + 1;
        _1028 = _1032;
    }
    int _1034 = _1028;
    float _1036 = 1.0 / _1020;
    float _1038 = float(_1004);
    float _1040 = float(_934);
    bool _1042 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1044 = isnan(1.0);
    bool _1046 = _1042 || _1044;
    bool _1048 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1050 = _1046 || _1048;
    int _1052 = ~_962;
    int _1054 = _1052 + 1;
    int _1056 = _1054 + 1;
    float _1058 = _1038 * _1040;
    int _1060 = _1056;
    bool _1062 = _1050;
    if (!_968)
    {
        int _1064 = ~_962;
        int _1066 = _1064 + 1;
        _1060 = _1066;
    }
    int _1068 = _1060;
    bool _1070 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1072 = isnan(0.0);
    bool _1074 = _1070 || _1072;
    bool _1076 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1078 = _1074 || _1076;
    float _1080 = _1058 * (-2.0);
    float _1082 = float(_1016);
    float _1084 = float(_1034);
    float _1086 = fma(_1080, _980, _980);
    float _1088 = _1078 ? _900 : 0.0;
    bool _1090 = !_812;
    int _1092 = _1090 ? 0 : 1;
    float _1094 = _1082 * _1084;
    if (_754)
    {
        bool _1096 = _776 > 0.5;
        _986 = _1096;
    }
    bool _1098 = _986;
    float _1100 = _776 + (-0.5);
    int _1102 = abs(_1092);
    if (_1050)
    {
        float _1104 = _1088 * _1036;
        _160 = _1104;
    }
    float _1106 = _160;
    float _1108 = fma(_914, _1080, _914);
    float _1110 = fma(_1100, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1086);
    float _1112 = float(_1102);
    float _1114 = _1094 * (-2.0);
    float _1116 = float(_1068);
    float _1118 = fma(_1108, _1106, _1110);
    bool _1120 = _738 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1122 = isnan(_738);
    bool _1124 = _1120 || _1122;
    bool _1126 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1128 = _1124 || _1126;
    float _1130 = float(_1128);
    float _1132 = fma(_894, _1114, _894);
    bool _1134 = _758 != 0.0;
    bool _1136 = isnan(_758);
    bool _1138 = _1134 || _1136;
    bool _1140 = isnan(0.0);
    bool _1142 = _1138 || _1140;
    float _1144 = _1112 * _1116;
    bool _1146 = _738 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1148 = isnan(_738);
    bool _1150 = _1146 || _1148;
    bool _1152 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1154 = _1150 || _1152;
    float _1156 = float(_1154);
    float _1158 = _1118 * 0.15915493667125701904296875;
    bool _1160 = _756 == 0.0;
    bool _1162 = !_1142;
    bool _1164 = _1160 && _1162;
    float _1166 = in.m_81.x;
    float _1168 = in.m_81.y;
    float _1170 = in.m_81.z;
    float _1172 = fma(_1114, _982, _982);
    float _1174 = -_1130;
    float _1176 = _1174 + 1.0;
    float _1178 = _1144 * (-2.0);
    bool _1180 = _760 == 0.0;
    bool _1182 = _1180 && _1164;
    float _1184 = fma(_960, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1172);
    float _1186 = _1156 * _1176;
    float _1188 = fma(_1178, _984, _984);
    float _1190 = _750 + (-0.5);
    float _1192 = fma(_1132, _1106, _1184);
    float _1194 = _948 * _1186;
    float _1196 = fma(_908, _1178, _908);
    float _1198 = in.m_83.x;
    float _1200 = in.m_83.y;
    float _1202 = in.m_83.z;
    float _1204 = in.m_83.w;
    float _1206 = fma(_1190, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1188);
    float _1208 = _1206;
    float _1210 = _1188;
    if (_754)
    {
        float _1212 = -_998;
        float _1214 = _1212 + 1.0;
        _988 = as_type<int>(_1214);
    }
    int _1216 = _988;
    if (_764)
    {
        bool _1218 = _750 > 0.5;
        _1062 = _1218;
    }
    bool _1220 = _1062;
    float _1222 = -_1156;
    float _1224 = _1222 + 1.0;
    float _1226 = fma(_1196, _1106, _1206);
    float _1228 = _1226;
    if (!_764)
    {
        _862 = _998;
    }
    float _1230 = _862;
    float _1232 = _1192 * 0.15915493667125701904296875;
    float _1234 = _1230;
    if (_754)
    {
        float _1236 = _1098 ? as_type<float>(_1216) : _998;
        _994 = _1236;
    }
    float _1238 = _994;
    float _1240 = fma(_1224, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1194);
    if (_764)
    {
        float _1242 = _1220 ? as_type<float>(_1014) : _998;
        _1234 = _1242;
    }
    float _1244 = _1234;
    float _1246 = _1226 * 0.15915493667125701904296875;
    float _1248 = _1166;
    if (_1182)
    {
        _1208 = _1166;
    }
    float _1250 = _1208;
    float _1252 = _1158 * 6.283185482025146484375;
    float _1254 = sin(_1252);
    float _1256 = _1250;
    if (_1182)
    {
        _1210 = _1168;
    }
    float _1258 = _1210;
    float _1260 = fma(_1130, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1240);
    float _1262 = _1258;
    if (_1182)
    {
        _1008 = _1250;
    }
    float _1264 = _1008;
    float _1266 = _1264;
    if (!_1182)
    {
        _1256 = _1166;
    }
    float _1268 = _1256;
    if (_1182)
    {
        _1248 = _1258;
    }
    float _1270 = _1248;
    float _1272 = _1158 * 6.283185482025146484375;
    float _1274 = cos(_1272);
    float _1276 = _1270;
    if (!_1182)
    {
        _1262 = _1168;
    }
    float _1278 = _1262;
    if (!_1182)
    {
        float _1280 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1268);
        _1266 = _1280;
    }
    float _1282 = _1266;
    float _1284 = _1200 * _1170;
    float _1286 = _1202 * _1268;
    float _1288 = _1282;
    if (_1182)
    {
        _1228 = _1170;
    }
    float _1290 = _1228;
    float _1292 = _1290;
    if (!_1182)
    {
        float _1294 = fma(_758, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1278);
        _1276 = _1294;
    }
    float _1296 = _1276;
    float _1298 = _1198 * _1278;
    float _1300 = _1232 * 6.283185482025146484375;
    float _1302 = sin(_1300);
    float _1304 = -_1284;
    float _1306 = fma(_1202, _1278, _1304);
    if (!_1182)
    {
        float _1308 = fma(_760, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1170);
        _1292 = _1308;
    }
    float _1310 = _1292;
    float _1312 = -_1298;
    float _1314 = fma(_1200, _1268, _1312);
    float _1316 = _1232 * 6.283185482025146484375;
    float _1318 = cos(_1316);
    float _1320 = _1246 * 6.283185482025146484375;
    float _1322 = cos(_1320);
    float _1324 = -_1286;
    float _1326 = fma(_1198, _1170, _1324);
    float _1328 = _1254 * _1302;
    float _1330 = _1274 * _1302;
    float _1332 = _1326 * _1204;
    float _1334 = _1246 * 6.283185482025146484375;
    float _1336 = sin(_1334);
    float _1338 = _1274 * _1318;
    float _1340 = _1254 * _1318;
    float _1342 = _1274 * _1322;
    float _1344 = _1318 * _1322;
    float _1346 = _1254 * _1322;
    float _1348 = _1302 * _1322;
    float _1350 = _1342 * _834;
    float _1352 = _1346 * _834;
    float _1354 = fma(_1336, _1338, _1328);
    float _1356 = -_834;
    float _1358 = _1336 * _1356;
    float _1360 = -_1330;
    float _1362 = fma(_1336, _1340, _1360);
    float _1364 = -_1340;
    float _1366 = fma(_1336, _1330, _1364);
    float _1368 = fma(_1354, _826, _1350);
    float _1370 = fma(_1344, _826, _1358);
    float _1372 = fma(_1336, _1328, _1338);
    float _1374 = fma(_1362, _826, _1352);
    float _1376 = fma(_1366, _832, _1368);
    float _1378 = fma(_1348, _832, _1370);
    float _1380 = _1306 * _1204;
    float _1382 = fma(_1372, _832, _1374);
    float _1384 = _1376 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1386 = _1376 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1388 = _1314 * _1204;
    float _1390 = _970 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1392 = fma(_1378, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1384);
    float _1394 = fma(_1378, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1386);
    float _1396 = _1342 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1398 = _1342 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1400 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1392);
    float _1402 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1394);
    float _1404 = _1342 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1406 = -_1336;
    float _1408 = fma(_1406, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1396);
    float _1410 = _1400 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1412 = _1402 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1414 = -_1336;
    float _1416 = fma(_1414, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1398);
    float _1418 = -_1336;
    float _1420 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1404);
    float _1422 = _992 + _1410;
    float _1424 = _1390 + _1412;
    float _1426 = _1354 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1428 = _1354 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1430 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1432 = _1422 + _1430;
    float _1434 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1436 = _1424 + _1434;
    float _1438 = _1354 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1440 = fma(_1344, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1426);
    float _1442 = _1432 * _1432;
    float _1444 = _1436 * _1436;
    float _1446 = fma(_1344, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1428);
    float _1448 = fma(_1344, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1438);
    float _1450 = _1366 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1452 = _1442 + _1444;
    float _1454 = _1366 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1456 = _1366 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1458 = fma(_1346, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1408);
    float _1460 = sqrt(_1452);
    float _1462 = fma(_1346, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1416);
    float _1464 = fma(_1346, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1420);
    float _1466 = fma(_1348, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1456);
    float _1468 = _1458 * _1296;
    float _1470 = _1462 * _1296;
    float _1472 = _1464 * _1296;
    float _1474 = _1376 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1476 = fma(_1348, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1454);
    float _1478 = fma(_1348, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1450);
    float _1480 = fma(_1362, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1440);
    float _1482 = fma(_1378, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1474);
    float _1484 = fma(_1362, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1446);
    float _1486 = fma(_1362, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1448);
    float _1488 = fma(_1372, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1476);
    float _1490 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1482);
    bool _1492 = _1460 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1494 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1496 = _1458 * _1200;
    float _1498 = _1490 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1500 = _1462 * _1200;
    float _1502 = _1464 * _1200;
    float _1504 = fma(_1372, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1478);
    float _1506 = _964 + _1498;
    float _1508 = _1332 * _1458;
    float _1510 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1512 = _1332 * _1462;
    float _1514 = _1332 * _1464;
    float _1516 = fma(_1480, _1282, _1468);
    float _1518 = fma(_1484, _1282, _1470);
    float _1520 = fma(_1486, _1282, _1472);
    float _1522 = fma(_1480, _1198, _1496);
    float _1524 = _1496;
    float _1526 = _1442;
    float _1528 = _1422;
    float _1530 = _1424;
    float _1532 = _1518;
    if (!_1492)
    {
        _1288 = _1442;
    }
    float _1534 = _1288;
    float _1536 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1538 = fma(_1372, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1466);
    float _1540 = fma(_1380, _1480, _1508);
    float _1542 = _1534;
    if (!_1492)
    {
        _1524 = _1444;
    }
    float _1544 = _1524;
    float _1546 = _1544;
    if (!_1492)
    {
        _1526 = _1506;
    }
    float _1548 = _1526;
    bool _1550 = !_1492;
    float _1552 = _1548;
    if (!_1550)
    {
        float _1554 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1556 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1558 = _1460 + _1556;
        float _1560 = rsqrt(_1452);
        float _1562 = _1558 * _1554;
        float _1564 = _1506 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1566 = _1562 * 0.15915493667125701904296875;
        float _1568 = _1566 * 6.283185482025146484375;
        float _1570 = sin(_1568);
        float _1572 = _1566 * 6.283185482025146484375;
        float _1574 = cos(_1572);
        float _1576 = fma(_1570, _1564, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1578 = _1560 * _1576;
        float _1580 = _1574 + (-1.0);
        float _1582 = fma(_1432, _1578, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1584 = fma(_1436, _1578, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1586 = _1580 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1588 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1590 = _1582 + _1588;
        float _1592 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1594 = _1584 + _1592;
        float _1596 = fma(_1506, _1574, _1586);
        float _1598 = _1590 * _1590;
        float _1600 = _1594 * _1594;
        _1552 = _1596;
        _1542 = _1598;
        _1546 = _1600;
        _1528 = _1582;
        _1530 = _1584;
    }
    float _1602 = _1552;
    float _1604 = _1542;
    float _1606 = _1546;
    float _1608 = _1528;
    float _1610 = _1530;
    float _1612 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1614 = _1602 + _1612;
    float _1616 = _836 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1618 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1620 = fma(_1484, _1198, _1500);
    float _1622 = fma(_1380, _1484, _1512);
    float _1624 = fma(_1614, _1614, _1604);
    float _1626 = _866 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1628 = _1616 * _1536;
    float _1630 = fma(_1486, _1198, _1502);
    float _1632 = _1624 + _1606;
    float _1634 = _1238 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1636 = fma(_1380, _1486, _1514);
    float _1638 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1640 = _1634 * _1494;
    float _1642 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1644 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1646 = _1244 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1648 = fma(_1504, _1310, _1516);
    float _1650 = sqrt(_1632);
    float _1652 = _1638 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1654 = _1642 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1656 = fma(_1504, _1202, _1522);
    float _1658 = fma(_1388, _1504, _1540);
    float _1660 = _1644 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1662 = _1646 * _1618;
    float _1664 = fma(_1488, _1310, _1518);
    float _1666 = fma(_1488, _1202, _1620);
    float _1668 = fma(_1388, _1488, _1622);
    float _1670 = fma(_1538, _1202, _1630);
    float _1672 = _1626 * _1510;
    float _1674 = _1260 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1676 = fma(_1388, _1538, _1636);
    float _1678 = fma(_1538, _1310, _1520);
    out.m_85.x = _1656;
    out.m_85.y = _1666;
    out.m_85.z = _1670;
    bool _1680 = _1650 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1682 = isnan(_1650);
    bool _1684 = _1680 || _1682;
    bool _1686 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1688 = _1684 || _1686;
    out.m_87.x = _1652;
    out.m_87.y = _1654;
    out.m_87.z = _1660;
    out.m_87.w = _1674;
    out.m_89.x = _1640;
    out.m_89.y = _1672;
    out.m_89.z = _1662;
    out.m_89.w = _1628;
    out.m_91.x = _1658;
    out.m_91.y = _1668;
    out.m_91.z = _1676;
    if (!_1688)
    {
        _1532 = 1.0;
    }
    float _1690 = _1532;
    out.m_93.x = _1648;
    out.m_93.y = _1664;
    out.m_93.z = _1678;
    bool _1692 = !_1688;
    float _1694 = _1690;
    if (!_1692)
    {
        bool _1696 = _1650 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1698 = isnan(_1650);
        bool _1700 = _1696 || _1698;
        bool _1702 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1704 = _1700 || _1702;
        if (!_1704)
        {
            float _1706 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1708 = _1650 + _1706;
            float _1710 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1712 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1710;
            float _1714 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1716 = _1714 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1718 = 1.0 / _1712;
            float _1720 = _1708 * _1718;
            float _1722 = fma(_1720, _1716, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1694 = _1722;
            _1724 = true;
        }
        else
        {
            bool _1726 = _1650 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1728 = isnan(_1650);
            bool _1730 = _1726 || _1728;
            bool _1732 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1734 = _1730 || _1732;
            if (!_1734)
            {
                float _1736 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1738 = _1650 + _1736;
                float _1740 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1742 = _1740 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1744 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1746 = _1744 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1748 = 1.0 / _1742;
                float _1750 = _1738 * _1748;
                float _1752 = fma(_1750, _1746, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1694 = _1752;
                _1724 = true;
            }
            else
            {
                _1694 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1724 = false;
    float _1754 = _1694;
    float _1756 = fma(_992, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1758 = fma(_1390, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1760 = floor(_1756);
    float _1762 = floor(_1758);
    float _1764 = -_1760;
    float _1766 = _1756 + _1764;
    float _1768 = -_1762;
    float _1770 = _1758 + _1768;
    float2 _5942 = float2(_1766, _1770);
    float _1772 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5942, float2(0.0), isnan(_5942)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5942, float2(0.0), isnan(_5942)), level(0.0)).x;
    float _1774 = _964 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1776 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1778 = _1608 + _1776;
    float _1780 = fma(_992, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1774);
    float _1782 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1780);
    float _1784 = _964 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1786 = _1782 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1788 = fma(_992, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1784);
    float _1790 = 1.0 / _1786;
    float _1792 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1788);
    float _1794 = _1792 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1796 = _1794 + _1786;
    float _1798 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _1800 = _1796 * _1790;
    float _1802 = _1800 * 0.5;
    float _1804 = _964 + _1798;
    float _1806 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1808 = fma(_1802, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1806);
    float _1810 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1812 = _1602 + _1810;
    float _1814 = 1.0 / _1808;
    float _1816 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1818 = _1814 * _1816;
    float _1820 = _1804 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    bool _1822 = _1818 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1824 = fma(_992, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1820);
    bool _1826 = _1818 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _1828 = !_1822;
    int _1830 = _1828 ? 0 : 1;
    float _1832 = fma(_1390, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1824);
    float _1834 = _1832 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1836 = fma(_1812, _1754, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1838 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1840 = _1610 + _1838;
    float _1842 = fma(_1778, _1754, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    int _1844 = 2;
    float _1846 = _1804;
    if (!_1822)
    {
        _1844 = 1;
    }
    int _1848 = _1844;
    float _1850 = trunc(_1834);
    int _1852 = int(_1850);
    int _1854 = _1848;
    if (!_1826)
    {
        _1854 = _1830;
    }
    int _1856 = _1854;
    float _1858 = _1804 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1860 = -_964;
    float _1862 = _1860 + _1836;
    float _1864 = fma(_1840, _1754, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    int _1866 = _1856 << 6;
    float _1868 = fma(_992, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1858);
    float _1870 = -_992;
    float _1872 = _1870 + _1842;
    float _1874 = _1862 * _1862;
    int _1876 = _1866 + 96;
    uint _1879 = uint(int(uint(_1876) >> uint(2)));
    uint _1881 = uint(int(uint(int(_1879)) >> uint(2)));
    int _1883 = int(_1879) & 3;
    float _1885 = (*spvDescriptorSet0.vp_c15)._m0[int(_1881)][_1883];
    int _1887 = int(_1879) + 1;
    uint _1889 = uint(int(uint(_1887) >> uint(2)));
    int _1891 = _1887 & 3;
    float _1893 = (*spvDescriptorSet0.vp_c15)._m0[int(_1889)][_1891];
    float _1895 = fma(_1390, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1868);
    float _1897 = -_1390;
    float _1899 = _1897 + _1864;
    float _1901 = fma(_1872, _1872, _1874);
    float _1903 = _1895 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    int _1905 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1907 = _1852 + _1905;
    int _1909 = _1907 + 1;
    int _1911 = _1866 + 104;
    uint _1913 = uint(int(uint(_1911) >> uint(2)));
    uint _1915 = uint(int(uint(int(_1913)) >> uint(2)));
    int _1917 = int(_1913) & 3;
    float _1919 = (*spvDescriptorSet0.vp_c15)._m0[int(_1915)][_1917];
    int _1921 = int(_1913) + 1;
    uint _1923 = uint(int(uint(_1921) >> uint(2)));
    int _1925 = _1921 & 3;
    float _1927 = (*spvDescriptorSet0.vp_c15)._m0[int(_1923)][_1925];
    float _1929 = trunc(_1903);
    int _1931 = int(_1929);
    float _1933 = fma(_1899, _1899, _1901);
    bool _1935 = _1909 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1937 = _1866 + 48;
    uint _1939 = uint(int(uint(_1937) >> uint(2)));
    uint _1941 = uint(int(uint(int(_1939)) >> uint(2)));
    int _1943 = int(_1939) & 3;
    float _1945 = (*spvDescriptorSet0.vp_c15)._m0[int(_1941)][_1943];
    int _1947 = int(_1939) + 1;
    uint _1949 = uint(int(uint(_1947) >> uint(2)));
    int _1951 = _1947 & 3;
    float _1953 = (*spvDescriptorSet0.vp_c15)._m0[int(_1949)][_1951];
    float _1955 = sqrt(_1933);
    int _1957 = _1866 + 64;
    uint _1959 = uint(int(uint(_1957) >> uint(2)));
    uint _1961 = uint(int(uint(int(_1959)) >> uint(2)));
    int _1963 = int(_1959) & 3;
    float _1965 = (*spvDescriptorSet0.vp_c15)._m0[int(_1961)][_1963];
    int _1967 = int(_1959) + 1;
    uint _1969 = uint(int(uint(_1967) >> uint(2)));
    int _1971 = _1967 & 3;
    float _1973 = (*spvDescriptorSet0.vp_c15)._m0[int(_1969)][_1971];
    int _1975 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1977 = _1931 + _1975;
    int _1979 = _1977 + 1;
    int _1981 = _1909 | _1979;
    int _1983 = _1866 + 72;
    uint _1985 = uint(int(uint(_1983) >> uint(2)));
    uint _1987 = uint(int(uint(int(_1985)) >> uint(2)));
    int _1989 = int(_1985) & 3;
    float _1991 = (*spvDescriptorSet0.vp_c15)._m0[int(_1987)][_1989];
    int _1993 = int(_1985) + 1;
    uint _1995 = uint(int(uint(_1993) >> uint(2)));
    int _1997 = _1993 & 3;
    float _1999 = (*spvDescriptorSet0.vp_c15)._m0[int(_1995)][_1997];
    bool _2001 = _1981 < 0;
    bool _2003 = _2001 || _1935;
    bool _2005 = _1979 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _2007 = _2005 || _2003;
    bool _2009 = _1955 > 0.0;
    int _2011 = _1866 + 56;
    uint _2013 = uint(int(uint(_2011) >> uint(2)));
    uint _2015 = uint(int(uint(int(_2013)) >> uint(2)));
    int _2017 = int(_2013) & 3;
    float _2019 = (*spvDescriptorSet0.vp_c15)._m0[int(_2015)][_2017];
    int _2021 = int(_2013) + 1;
    uint _2023 = uint(int(uint(_2021) >> uint(2)));
    int _2025 = _2021 & 3;
    float _2027 = (*spvDescriptorSet0.vp_c15)._m0[int(_2023)][_2025];
    int _2029 = _1866 + 80;
    uint _2031 = uint(int(uint(_2029) >> uint(2)));
    uint _2033 = uint(int(uint(int(_2031)) >> uint(2)));
    int _2035 = int(_2031) & 3;
    float _2037 = (*spvDescriptorSet0.vp_c15)._m0[int(_2033)][_2035];
    int _2039 = int(_2031) + 1;
    uint _2041 = uint(int(uint(_2039) >> uint(2)));
    int _2043 = _2039 & 3;
    float _2045 = (*spvDescriptorSet0.vp_c15)._m0[int(_2041)][_2043];
    float _2047 = _1804 * _1893;
    float _2049 = fma(_992, _1885, _2047);
    float _2051 = fma(_1390, _1919, _2049);
    float _2053 = _2051 + _1927;
    float _2055 = _1804 * _1953;
    int _2057 = as_type<int>(_1953);
    int _2059 = as_type<int>(_1955);
    int _2061 = as_type<int>(_1893);
    float _2063 = _1965;
    float _2065 = _1899;
    float _2067 = as_type<float>(_1856);
    float _2069 = _1903;
    float _2071 = as_type<float>(_1909);
    if (!_2007)
    {
        int _2073 = _1979 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _2075 = _2073 + _1909;
        _2057 = _2075;
    }
    int _2077 = _2057;
    float _2079 = fma(_992, _1945, _2055);
    float _2081 = 1.0 / _2053;
    if (!_2007)
    {
        int _2083 = _2077 << 2;
        _2059 = _2083;
    }
    int _2085 = _2059;
    float _2087 = _1804 * _1973;
    int _2089 = _2085;
    if (!_2007)
    {
        uint _2091 = uint(int(uint(_2077) >> uint(2)));
        _2061 = int(_2091);
    }
    int _2093 = _2061;
    if (!_2007)
    {
        int _2095 = 12 & _2085;
        _2089 = _2095;
    }
    int _2097 = _2089;
    float _2099 = fma(_992, _1965, _2087);
    float _2101 = _2099;
    if (!_2009)
    {
        _2063 = _1836;
    }
    float _2103 = _2063;
    float _2105 = fma(_1390, _1991, _2099);
    float _2107 = _1991;
    float _2109 = _2103;
    float _2111 = _2103;
    if (!_2009)
    {
        _2107 = _1842;
    }
    float _2113 = _2107;
    float _2115 = _2113;
    if (!_2009)
    {
        _2101 = _1864;
    }
    float _2117 = _2101;
    float _2119 = fma(_1390, _2019, _2079);
    bool _2121 = !_2009;
    float _2123 = _2117;
    float _2125 = _2117;
    if (!_2121)
    {
        float _2127 = _200 * _200;
        float _2129 = rsqrt(_1933);
        float _2131 = fma(_198, _198, _2127);
        float _2133 = fma(_202, _202, _2131);
        float _2135 = sqrt(_2133);
        float _2137 = _1872 * _2129;
        float _2139 = _1862 * _2129;
        float _2141 = _1899 * _2129;
        bool _2143 = _2135 > 0.0;
        float _2145 = _2135;
        _2065 = _2141;
        if (!_2143)
        {
            _2145 = _1842;
        }
        float _2147 = _2145;
        _2115 = _2147;
        if (!_2143)
        {
            _2109 = _1836;
        }
        float _2149 = _2109;
        _2111 = _2149;
        if (!_2143)
        {
            _2123 = _1864;
        }
        float _2151 = _2123;
        bool _2153 = !_2143;
        _2125 = _2151;
        if (!_2153)
        {
            float _2155 = rsqrt(_2133);
            float _2157 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2159 = _200 * _2155;
            float _2161 = _198 * _2155;
            float _2163 = _2139 * _2159;
            float _2165 = _202 * _2155;
            float _2167 = fma(_2137, _2161, _2163);
            float _2169 = _2157 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2171 = fma(_2141, _2165, _2167);
            float _2173 = _2171 * _2169;
            float _2175 = fma(_198, _2173, _1842);
            float _2177 = fma(_200, _2173, _1836);
            float _2179 = fma(_202, _2173, _1864);
            _2111 = _2177;
            _2115 = _2175;
            _2125 = _2179;
        }
    }
    float _2181 = _2111;
    float _2183 = _2115;
    float _2185 = _2065;
    float _2187 = _2125;
    float _2189 = _2185;
    if (!_2007)
    {
        int _2191 = _2093 << 4;
        int _2193 = _2191 + _2097;
        _2189 = as_type<float>(_2193);
    }
    float _2195 = _2189;
    int _2197 = _1866 + 88;
    uint _2199 = uint(int(uint(_2197) >> uint(2)));
    uint _2201 = uint(int(uint(int(_2199)) >> uint(2)));
    int _2203 = int(_2199) & 3;
    float _2205 = (*spvDescriptorSet0.vp_c15)._m0[int(_2201)][_2203];
    int _2207 = int(_2199) + 1;
    uint _2209 = uint(int(uint(_2207) >> uint(2)));
    int _2211 = _2207 & 3;
    float _2213 = (*spvDescriptorSet0.vp_c15)._m0[int(_2209)][_2211];
    float _2215 = _2119 + _2027;
    float _2217 = _2181 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2219 = _2181 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2221 = _2105 + _1999;
    float _2223 = _2181 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2225 = _2181 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2227 = fma(_2183, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2217);
    float _2229 = _2195;
    if (!_2007)
    {
        int _2231 = as_type<int>(_2195) + 400;
        uint _2233 = uint(int(uint(_2231) >> uint(2)));
        uint _2235 = uint(int(uint(int(_2233)) >> uint(2)));
        int _2237 = int(_2233) & 3;
        float _2239 = (*spvDescriptorSet0.vp_c15)._m0[int(_2235)][_2237];
        _2229 = _2239;
    }
    float _2241 = _2229;
    float _2243 = fma(_2183, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2219);
    float _2245 = _2215 * _2081;
    float _2247 = fma(_2183, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2223);
    float _2249 = fma(_2183, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2225);
    float _2251 = fma(_2187, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2227);
    float _2253 = fma(_2187, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2243);
    bool _2255 = _2245 >= 0.0;
    float _2257 = fma(_2187, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2247);
    float _2259 = _2251 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2261 = _2253 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2263 = _2221 * _2081;
    bool _2265 = _2245 <= 1.0;
    bool _2267 = _2265 && _2255;
    float _2269 = _2257 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2271 = _2261 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2273 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    bool _2275 = _2263 >= 0.0;
    bool _2277 = _2275 && _2267;
    float _2279 = _2269 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2281 = fma(_2187, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2249);
    float _2283 = fma(_2259, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2271);
    bool _2285 = _2263 <= 1.0;
    bool _2287 = _2285 && _2277;
    float _2289 = -_2279;
    float _2291 = fma(_2289, _2273, 1.0);
    float _2293 = _2281 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2295 = fma(_2269, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2283);
    float _2297 = _2261 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2299 = _2261 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2301 = _1804 * _2045;
    float _2303 = fma(_2293, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2295);
    float _2305 = log2(_2291);
    float _2307 = fma(_2259, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2297);
    float _2309 = fma(_2259, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2299);
    float _2311 = fma(_992, _2037, _2301);
    float _2313 = _2299;
    if (_2287)
    {
        float _2315 = float(_1856);
        _2067 = _2315;
    }
    float _2317 = _2067;
    float _2319 = fma(_2269, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2307);
    float _2321 = fma(_2269, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2309);
    float _2323 = 1.0 / _2303;
    float _2325 = fma(_2293, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2321);
    float _2327 = fma(_1390, _2205, _2311);
    float _2329 = fma(_2293, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2319);
    float _2331 = as_type<float>(_2097);
    float _2333 = _2329;
    float _2335 = _2325;
    if (!_2007)
    {
        float _2337 = floor(_1903);
        _2331 = _2337;
    }
    float _2339 = _2331;
    float _2341 = _2327 + _2213;
    float _2343 = _2305 * 0.693147182464599609375;
    float _2345 = _2341 * _2081;
    float _2347 = _2343 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2349 = _198;
    if (!_2007)
    {
        float _2351 = floor(_1834);
        _2349 = _2351;
    }
    float _2353 = _2349;
    float _2355 = _2329 * _2323;
    float _2357 = _2325 * _2323;
    float _2359 = fma(_2357, -0.5, 0.5);
    float _2361 = _2307;
    if (_2287)
    {
        float _2363 = rint(_2317);
        float _2365 = precise::max(_2363, 0.0);
        uint _2367 = uint(_2365);
        uint _2369 = clamp(_2367, 0u, 65535u);
        _2361 = as_type<float>(_2369);
    }
    float _2371 = _2361;
    float _2373 = _2339;
    if (!_2007)
    {
        float _2375 = -_2339;
        float _2377 = _1903 + _2375;
        _2373 = _2377;
    }
    float _2379 = _2373;
    float _2381 = _2241;
    if (!_2007)
    {
        float _2383 = rint(_2241);
        float _2385 = precise::max(_2383, 0.0);
        uint _2387 = uint(_2385);
        uint _2389 = clamp(_2387, 0u, 65535u);
        _2381 = as_type<float>(_2389);
    }
    float _2391 = _2381;
    float _2393 = fma(_2355, 0.5, 0.5);
    if (!_2007)
    {
        float _2395 = -_2353;
        float _2397 = _1834 + _2395;
        _2069 = _2397;
    }
    float _2399 = _2069;
    float _2401 = _2371;
    if (_2287)
    {
        float3 _7015 = float3(_2245, _2263, float(as_type<int>(_2371)));
        float3 _7019 = select(_7015, float3(0.0), isnan(_7015));
        float _2403 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _7019.xy, uint(rint(_7019.z)), _2345, level(0.0));
        _2401 = _2403;
    }
    float _2405 = _2401;
    float3 _7029 = float3(_2393, _2359, _2347);
    float _2407 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7029, float3(0.0), isnan(_7029)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7029, float3(0.0), isnan(_7029)), level(0.0)).x;
    float3 _7038 = float3(_2393, _2359, _2347);
    float4 _2410 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7038, float3(0.0), isnan(_7038)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7038, float3(0.0), isnan(_7038)), level(0.0)).xyzw;
    float _2412 = _2410.x;
    float _2414 = _2410.y;
    float _2416 = _2410.z;
    float _2418 = _2410.w;
    float _2420 = _2399;
    if (!_2007)
    {
        float3 _7061 = float3(_2399, _2379, float(as_type<int>(_2391)));
        float3 _7063 = select(_7061, float3(0.0), isnan(_7061));
        float _2422 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _7063.xy, uint(rint(_7063.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _7063.xy, uint(rint(_7063.z)), level(0.0)).x;
        _2420 = _2422;
    }
    float _2424 = _2420;
    if (_2007)
    {
        _2313 = 1.0;
    }
    float _2426 = _2313;
    float _2428 = _2426;
    if (!_2007)
    {
        int _2430 = _2077 << 4;
        int _2432 = _2430 + 2048;
        uint _2434 = uint(int(uint(_2432) >> uint(2)));
        uint _2436 = uint(int(uint(int(_2434)) >> uint(2)));
        int _2438 = int(_2434) & 3;
        float _2440 = (*spvDescriptorSet0.vp_c15)._m0[int(_2436)][_2438];
        int _2442 = int(_2434) + 1;
        uint _2444 = uint(int(uint(_2442) >> uint(2)));
        int _2446 = _2442 & 3;
        float _2448 = (*spvDescriptorSet0.vp_c15)._m0[int(_2444)][_2446];
        int _2450 = _2432 + 8;
        uint _2452 = uint(int(uint(_2450) >> uint(2)));
        uint _2454 = uint(int(uint(int(_2452)) >> uint(2)));
        int _2456 = int(_2452) & 3;
        float _2458 = (*spvDescriptorSet0.vp_c15)._m0[int(_2454)][_2456];
        int _2460 = int(_2452) + 1;
        uint _2462 = uint(int(uint(_2460) >> uint(2)));
        int _2464 = _2460 & 3;
        float _2466 = (*spvDescriptorSet0.vp_c15)._m0[int(_2462)][_2464];
        float _2468 = _1804 * _2448;
        float _2470 = fma(_992, _2440, _2468);
        float _2472 = fma(_1390, _2458, _2470);
        float _2474 = _2472 + _2466;
        float _2476 = precise::clamp(_2474, 0.0, 1.0);
        float _2478 = -_2476;
        float _2480 = _2478 + _2424;
        float _2482 = fma(_2480, 500.0, 1.5);
        float _2484 = exp2(_2482);
        float _2486 = 0.0 + _2484;
        float _2488 = precise::clamp(_2486, 0.0, 1.0);
        _1846 = _2484;
        _2428 = _2488;
    }
    float _2490 = _1846;
    float _2492 = _2428;
    float _2494 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2496 = _2181 + _2494;
    float _2498 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2500 = _2183 + _2498;
    float _2502 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2504 = _2187 + _2502;
    float _2506 = _2496 * _2496;
    float _2508 = fma(_2500, _2500, _2506);
    float _2510 = fma(_2504, _2504, _2508);
    float _2512 = rsqrt(_2510);
    float _2514 = _2512 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2516 = _2500 * _2514;
    float _2518 = _2504 * _2514;
    float _2520 = _2516 * _2516;
    float _2522 = _2518 * _2518;
    float _2524 = _2520 + _2522;
    float _2526 = sqrt(_2524);
    bool _2528 = _2526 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2530 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2532 = _2526 + _2530;
    float _2534 = _2512;
    float _2536 = _2532;
    float _2538 = _2496;
    float _2540 = _2514;
    if (_2528)
    {
        float _2542 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2534 = _2542;
    }
    float _2544 = _2534;
    float _2546 = _2544;
    if (_2528)
    {
        float _2548 = _2532 * _2544;
        _2536 = _2548;
    }
    float _2550 = _2536;
    if (_2528)
    {
        float _2552 = rsqrt(_2524);
        _2546 = _2552;
    }
    float _2554 = _2546;
    float _2556 = _2554;
    if (_2528)
    {
        float _2558 = _2550 * 0.15915493667125701904296875;
        _996 = _2558;
    }
    float _2560 = _996;
    float _2562 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2564 = _2504;
    float _2566 = _2560;
    if (_2528)
    {
        float _2568 = _2560 * 6.283185482025146484375;
        float _2570 = sin(_2568);
        _2564 = _2570;
    }
    float _2572 = _2564;
    float _2574 = precise::max(0.0, _2562);
    float _2576 = _2490;
    float _2578 = _2574;
    if (_2528)
    {
        float _2580 = _2560 * 6.283185482025146484375;
        float _2582 = cos(_2580);
        _2576 = _2582;
    }
    float _2584 = _2576;
    float _2586 = -_2514;
    float _2588 = -_2574;
    float _2590 = fma(_2496, _2586, _2588);
    if (_2528)
    {
        float _2592 = _2590 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2538 = _2592;
    }
    float _2594 = _2538;
    float _2596 = _2572;
    float _2598 = _2594;
    if (_2528)
    {
        float _2600 = fma(_2572, _2594, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2596 = _2600;
    }
    float _2602 = _2596;
    float _2604 = _2602;
    if (!_2528)
    {
        _2598 = _2518;
    }
    float _2606 = _2598;
    float _2608 = _2606;
    if (!_2528)
    {
        _2566 = _2520;
    }
    float _2610 = _2566;
    float _2612 = _2610;
    if (_2528)
    {
        float _2614 = _2554 * _2602;
        _2071 = _2614;
    }
    float _2616 = _2071;
    if (!_2528)
    {
        _2556 = _2516;
    }
    float _2618 = _2556;
    float _2620 = _2618;
    float _2622 = _2584;
    if (_2528)
    {
        float _2624 = _2584 + (-1.0);
        _2578 = _2624;
    }
    float _2626 = _2578;
    if (_2528)
    {
        float _2628 = _2516 * _2616;
        _2620 = _2628;
    }
    float _2630 = _2620;
    if (!_2528)
    {
        _2604 = _2590;
    }
    float _2632 = _2604;
    float _2634 = _2632;
    if (_2528)
    {
        float _2636 = _2518 * _2616;
        _2608 = _2636;
    }
    float _2638 = _2608;
    if (_2528)
    {
        float _2640 = _2626 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2540 = _2640;
    }
    float _2642 = _2540;
    if (_2528)
    {
        float _2644 = _2630 * _2630;
        _2612 = _2644;
    }
    float _2646 = _2612;
    float _2648 = sqrt(_2510);
    if (_2528)
    {
        float _2650 = fma(_2590, _2584, _2642);
        _2634 = _2650;
    }
    float _2652 = _2634;
    if (!_2528)
    {
        _2622 = _2522;
    }
    float _2654 = _2622;
    float _2656 = _2654;
    if (_2528)
    {
        float _2658 = _2638 * _2638;
        _2656 = _2658;
    }
    float _2660 = _2656;
    float _2662 = fma(_2652, _2652, _2646);
    float _2664 = _2662 + _2660;
    float _2666 = rsqrt(_2664);
    float _2668 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2670 = fma(_2648, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2668);
    float _2672 = precise::clamp(_2670, 0.0, 1.0);
    float _2674 = -_2672;
    float _2676 = _2674 + 1.0;
    float _2678 = _2666 * _2630;
    float _2680 = _2666 * _2652;
    float _2682 = _2666 * _2638;
    float _2684 = abs(_2676);
    float _2686 = log2(_2684);
    float _2688 = _2678 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2690 = -_2688;
    float _2692 = fma(_2680, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2690);
    float _2694 = -_2682;
    float _2696 = fma(_2694, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2692);
    float _2698 = fma(_2696, -0.5, 0.5);
    float _2700 = fma(_2696, 0.5, 0.5);
    float _2702 = _2686 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2704 = fma(_2700, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2706 = sqrt(_2698);
    float _2708 = fma(_2700, _2704, -0.212114393711090087890625);
    float _2710 = _2680 + 1.0;
    float _2712 = fma(_2700, _2708, 1.570728778839111328125);
    float _2714 = exp2(_2702);
    float _2716 = _2706 * 0.636619746685028076171875;
    float _2718 = -_2712;
    float _2720 = fma(_2716, _2718, 1.0);
    float _2722 = -_2680;
    float _2724 = fma(_2714, _2710, _2722);
    float _2726 = fma(_2724, 0.5, 0.5);
    float2 _7537 = float2(_2720, _2726);
    float3 _2730 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7537, float2(0.0), isnan(_7537)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7537, float2(0.0), isnan(_7537)), level(0.0)).xyz;
    float _2732 = _2730.x;
    float _2734 = _2730.y;
    float _2736 = _2730.z;
    float _2738 = abs(_1818);
    float _2740 = log2(_2738);
    float _2742 = _2261 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2744 = -_1772;
    float _2746 = _2744 + 1.0;
    float _2748 = fma(_2259, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2742);
    bool _2750 = _1818 <= 8000.0;
    bool _2752 = isnan(_1818);
    bool _2754 = _2750 || _2752;
    bool _2756 = isnan(8000.0);
    bool _2758 = _2754 || _2756;
    float _2760 = float(_2758);
    float _2762 = fma(_2269, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2748);
    float _2764 = fma(_2293, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2762);
    float _2766 = _2303 * 0.5;
    float _2768 = _2740 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    out.gl_Position.x = _2329;
    out.gl_Position.y = _2325;
    out.gl_Position.z = _2764;
    out.gl_Position.w = _2303;
    float _2770 = exp2(_2768);
    float _2772 = fma(_2770, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2774 = precise::clamp(_2772, 0.0, 1.0);
    float _2776 = fma(_2325, -0.5, _2766);
    float _2778 = _2766;
    float _2780 = _2764;
    if (!_2287)
    {
        _2778 = 1.0;
    }
    float _2782 = _2778;
    float _2784 = fma(_2774, -2.0, 3.0);
    float _2786 = _2774 * _2774;
    float _2788 = _2782;
    if (_2287)
    {
        bool _2790 = _2405 >= _2345;
        bool _2792 = isnan(_2405);
        bool _2794 = _2790 || _2792;
        bool _2796 = isnan(_2345);
        bool _2798 = _2794 || _2796;
        float _2800 = float(_2798);
        _2788 = _2800;
    }
    float _2802 = _2788;
    bool _2804 = _2648 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2806 = isnan(_2648);
    bool _2808 = _2804 || _2806;
    bool _2810 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2812 = _2808 || _2810;
    float _2814 = _2786 * _2784;
    float _2816 = _2686 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2818 = _2802 * _2492;
    float _2820 = _2329 + _2303;
    float _2822 = -_2814;
    float _2824 = _2822 + 1.0;
    float _2826 = exp2(_2816);
    float _2828 = fma(_2824, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2814);
    float _2830 = _2764 + _2303;
    float _2832 = _2820 * 0.5;
    float _2834 = _2760 * _2828;
    float _2836 = _2830 * 0.5;
    if (!_2812)
    {
        _2780 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2838 = _2780;
    float _2840 = _2834 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2842 = _2838;
    float _2844 = _2838;
    if (!_2812)
    {
        _2333 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2846 = _2333;
    out.m_95.x = _2832;
    out.m_95.y = _2776;
    out.m_95.z = _2836;
    out.m_95.w = _2303;
    float _2848 = _2846;
    float _2850 = _2846;
    if (!_2812)
    {
        _2335 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2852 = _2335;
    float _2854 = _2746 * _2840;
    float _2856 = precise::clamp(_2854, 0.0, 1.0);
    float _2858 = -_2826;
    float _2860 = _2858 + 1.0;
    float _2862 = -_2856;
    float _2864 = fma(_2862, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2866 = _2860 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2868 = -_2818;
    float _2870 = fma(_2868, _2864, 1.0);
    float _2872 = precise::clamp(_2870, 0.0, 1.0);
    float _2874 = _2866 * _2407;
    float _2876 = -_2866;
    float _2878 = _2876 + 1.0;
    float _2880 = _2872 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2882 = _2418 * _2874;
    float _2884 = _2418 * _2878;
    float _2886 = _2878;
    float _2888 = _2882;
    float _2890 = _2852;
    float _2892 = _2852;
    if (!_2812)
    {
        _2886 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2894 = _2886;
    out.m_97.x = _2880;
    float _2896 = _2736 * _2874;
    float _2898 = fma(_2732, _2882, _2412);
    float _2900 = fma(_2734, _2882, _2414);
    float _2902 = _2896;
    float _2904 = _2894;
    float _2906 = _2894;
    if (!_2812)
    {
        _2888 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2908 = _2888;
    float _2910 = fma(_2418, _2896, _2416);
    float _2912 = _2908;
    float _2914 = _2908;
    if (!_2812)
    {
        _2902 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2916 = _2902;
    out.m_99.x = _2898;
    out.m_99.y = _2900;
    out.m_99.z = _2910;
    out.m_99.w = _2884;
    bool _2918 = !_2812;
    float _2920 = _2916;
    float _2922 = _2916;
    if (!_2918)
    {
        bool _2924 = _2648 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2926 = isnan(_2648);
        bool _2928 = _2924 || _2926;
        bool _2930 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2932 = _2928 || _2930;
        if (!_2932)
        {
            float _2934 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2936 = _2648 + _2934;
            float _2938 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2940 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2938;
            float _2942 = 1.0 / _2940;
            float _2944 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2946 = _2944 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2948 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2950 = _2948 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2952 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2954 = _2952 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2956 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2958 = _2956 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2960 = _2936 * _2942;
            float _2962 = precise::clamp(_2960, 0.0, 1.0);
            float _2964 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2966 = _2964 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2968 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2970 = _2968 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2972 = fma(_2962, _2946, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2974 = fma(_2962, _2966, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2976 = fma(_2962, _2970, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2978 = fma(_2962, _2950, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2980 = fma(_2962, _2954, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2982 = fma(_2962, _2958, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2850 = _2976;
            _2914 = _2980;
            _2844 = _2974;
            _2922 = _2978;
            _2892 = _2972;
            _2906 = _2982;
            _2984 = true;
        }
        else
        {
            bool _2986 = _2648 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2988 = isnan(_2648);
            bool _2990 = _2986 || _2988;
            bool _2992 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2994 = _2990 || _2992;
            if (!_2994)
            {
                _2842 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2996 = _2842;
            _2844 = _2996;
            if (!_2994)
            {
                _2848 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2998 = _2848;
            _2850 = _2998;
            if (!_2994)
            {
                _2890 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3000 = _2890;
            _2892 = _3000;
            if (!_2994)
            {
                _2920 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3002 = _2920;
            _2922 = _3002;
            if (!_2994)
            {
                _2912 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3004 = _2912;
            _2914 = _3004;
            if (!_2994)
            {
                _2904 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3006 = _2904;
            bool _3008 = !_2994;
            _2906 = _3006;
            if (!_3008)
            {
                bool _3010 = _2648 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3012 = isnan(_2648);
                bool _3014 = _3010 || _3012;
                bool _3016 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3018 = _3014 || _3016;
                if (!_3018)
                {
                    float _3020 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3022 = _2648 + _3020;
                    float _3024 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3026 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3024;
                    float _3028 = 1.0 / _3026;
                    float _3030 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3032 = _3030 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3034 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3036 = _3034 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3038 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3040 = _3038 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3042 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3044 = _3042 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3046 = _3022 * _3028;
                    float _3048 = precise::clamp(_3046, 0.0, 1.0);
                    float _3050 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3052 = _3050 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3054 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3056 = _3054 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3058 = fma(_3048, _3032, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3060 = fma(_3048, _3052, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3062 = fma(_3048, _3056, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3064 = fma(_3048, _3036, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3066 = fma(_3048, _3040, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3068 = fma(_3048, _3044, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2850 = _3062;
                    _2914 = _3066;
                    _2844 = _3060;
                    _2922 = _3064;
                    _2892 = _3058;
                    _2906 = _3068;
                    _2984 = true;
                }
                else
                {
                    _2850 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2914 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2844 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2922 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2892 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2906 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2984 = false;
    float _3070 = _2850;
    float _3072 = _2914;
    float _3074 = _2844;
    float _3076 = _2922;
    float _3078 = _2892;
    float _3080 = _2906;
    float _3082 = fma(_1664, -0.5, 0.5);
    float _3084 = precise::clamp(_3082, 0.0, 1.0);
    float _3086 = -_3070;
    float _3088 = _3086 + _3072;
    float _3090 = -_3074;
    float _3092 = _3090 + _3076;
    float _3094 = -_3078;
    float _3096 = _3094 + _3080;
    bool _3098 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3100 = fma(_3084, _3088, _3070);
    float _3102 = fma(_3084, _3092, _3074);
    float _3104 = fma(_3084, _3096, _3078);
    float _3106 = _3100 * 0.586610972881317138671875;
    out.m_101.x = 0.0;
    float _3108 = fma(_3102, 0.298911988735198974609375, _3106);
    float _3110 = fma(_3104, 0.114477999508380889892578125, _3108);
    float _3112 = -_3110;
    float _3114 = _3102 + _3112;
    float _3116 = -_3110;
    float _3118 = _3100 + _3116;
    float _3120 = -_3110;
    float _3122 = _3104 + _3120;
    float _3124 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3126 = fma(_3114, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3110);
    float _3128 = fma(_3118, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3110);
    float _3130 = fma(_3122, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3110);
    out.m_61.x = _3124;
    out.m_103.x = _3126;
    out.m_103.y = _3128;
    out.m_103.z = _3130;
    if (!_3098)
    {
        return out;
    }
    float _3132 = -_2181;
    float _3134 = _3132 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3136 = -_2183;
    float _3138 = _3136 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3140 = -_2187;
    float _3142 = _3140 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3144 = _3134 * _3134;
    float _3146 = fma(_3138, _3138, _3144);
    float _3148 = fma(_3142, _3142, _3146);
    float _3150 = sqrt(_3148);
    float _3152 = rsqrt(_3148);
    float _3154 = -_3150;
    float _3156 = _3154 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3158 = _3156 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3160 = precise::clamp(_3158, 0.0, 1.0);
    float _3162 = _3138 * _3152;
    float _3164 = _3134 * _3152;
    float _3166 = abs(_3160);
    float _3168 = log2(_3166);
    float _3170 = _3142 * _3152;
    float _3172 = _3162 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3174 = _1664 * _3164;
    float _3176 = -_3164;
    float _3178 = -_3172;
    float _3180 = fma(_3176, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3178);
    float _3182 = fma(_1648, _3162, _3174);
    float _3184 = -_3170;
    float _3186 = fma(_3184, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3180);
    float _3188 = fma(_1678, _3170, _3182);
    float _3190 = precise::clamp(_3188, 0.0, 1.0);
    float _3192 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3194 = _3186 + _3192;
    float _3196 = _3168 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3198 = _3194 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3200 = precise::clamp(_3198, 0.0, 1.0);
    float _3202 = exp2(_3196);
    float _3204 = _3202 * _3200;
    float _3206 = _3190 * _3204;
    float _3208 = _3206 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3210 = _3206 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3212 = _3206 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_101.x = _3208;
    out.m_101.y = _3210;
    out.m_101.z = _3212;
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
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2984 = false;
    bool _1724 = false;
    bool _730 = false;
    bool _500 = false;
    bool _224 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _117 = in.m_58.w;
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
        out.m_61.x = 0.0;
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
        float _3269 = as_type<float>(_138);
        out.gl_Position.z = _3269;
    }
    if (!_126)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _142 = in.m_63.w;
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
        float _162 = float(_122);
        _158 = _162;
    }
    float _164 = _158;
    bool _166 = _156 >= _164;
    bool _168 = !_152;
    bool _170 = _166 || _168;
    if (_170)
    {
        _132 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _172 = _132;
    if (_170)
    {
        out.m_61.x = 0.0;
    }
    if (_170)
    {
        float _174 = _172 * 5.0;
        _140 = as_type<int>(_174);
    }
    int _176 = _140;
    if (_170)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3338 = as_type<float>(_176);
        out.gl_Position.z = _3338;
    }
    if (_170)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _178 = in.m_65.x;
    float _180 = in.m_65.y;
    float _182 = in.m_65.z;
    bool _184 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _186 = _180 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _188 = _180 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _190 = _180 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _192 = fma(_178, (*spvDescriptorSet0.vp_c10)._m0[4].x, _186);
    float _194 = fma(_178, (*spvDescriptorSet0.vp_c10)._m0[5].x, _188);
    float _196 = fma(_178, (*spvDescriptorSet0.vp_c10)._m0[6].x, _190);
    float _198 = fma(_182, (*spvDescriptorSet0.vp_c10)._m0[4].z, _192);
    float _200 = fma(_182, (*spvDescriptorSet0.vp_c10)._m0[5].z, _194);
    float _202 = fma(_182, (*spvDescriptorSet0.vp_c10)._m0[6].z, _196);
    bool _204 = !_184;
    float _222;
    if (!_204)
    {
        float _206 = in.m_67.x;
        float _208 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _210 = _206 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _212 = fma(_210, (*spvDescriptorSet0.vp_c9)._m0[12].x, _156);
        float _214 = _212 * _208;
        float _216 = floor(_214);
        float _218 = -_216;
        float _220 = _214 + _218;
        _222 = _220;
        _224 = true;
    }
    else
    {
        float _226 = float(_122);
        float _228 = 1.0 / _226;
        float _230 = _156 * _228;
        _222 = _230;
    }
    _224 = false;
    float _232 = _222;
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _236 = _232 + _234;
    float _238 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _240 = _232 + _238;
    float _242 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _244 = _232 + _242;
    float _246 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _248 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _246;
    float _250 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _252 = _250 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _254 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _256 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _254;
    float _258 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _260 = _258 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _262 = 1.0 / _248;
    bool _264 = _232 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _266 = isnan(_232);
    bool _268 = _264 || _266;
    bool _270 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _272 = _268 || _270;
    float _274 = float(_272);
    float _276 = 1.0 / _252;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _280 = _232 + _278;
    float _282 = 1.0 / _260;
    float _284 = _240 * _262;
    bool _286 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _288 = 1.0 / _256;
    float _290 = _236 * _276;
    bool _292 = _232 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _294 = isnan(_232);
    bool _296 = _292 || _294;
    bool _298 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _300 = _296 || _298;
    float _302 = float(_300);
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _306 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _304;
    bool _308 = _232 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _310 = isnan(_232);
    bool _312 = _308 || _310;
    bool _314 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _316 = _312 || _314;
    float _318 = float(_316);
    float _320 = fma(_306, _284, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _322 = _280 * _282;
    bool _324 = _232 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _326 = isnan(_232);
    bool _328 = _324 || _326;
    bool _330 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _332 = _328 || _330;
    float _334 = float(_332);
    float _336 = -_302;
    float _338 = _336 + 1.0;
    float _340 = -_318;
    float _342 = _340 + 1.0;
    float _344 = _334 * _338;
    float _346 = -_334;
    float _348 = _346 + 1.0;
    float _350 = _244 * _288;
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _354 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _352;
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _358 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _356;
    float _360 = _318 * _348;
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _364 = _362 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _366 = fma(_354, _284, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _368 = fma(_358, _284, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _370 = _232 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _372 = isnan(_232);
    bool _374 = _370 || _372;
    bool _376 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _378 = _374 || _376;
    float _380 = float(_378);
    float _382 = _274 * _342;
    float _384 = -_274;
    float _386 = _384 + 1.0;
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _390 = _388 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _394 = _392 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _396 = fma(_364, _290, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _398 = _380 * _386;
    float _400 = -_380;
    float _402 = _400 + 1.0;
    float _404 = fma(_390, _290, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _406 = fma(_394, _290, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _408 = _320 * _398;
    float _410 = _366 * _398;
    float _412 = _368 * _398;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _416 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _414;
    float _418 = fma(_402, (*spvDescriptorSet0.vp_c9)._m0[143].x, _408);
    float _420 = fma(_402, (*spvDescriptorSet0.vp_c9)._m0[143].y, _410);
    float _422 = fma(_402, (*spvDescriptorSet0.vp_c9)._m0[143].z, _412);
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _426 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _424;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _430 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _428;
    float _432 = fma(_404, _382, _418);
    float _434 = fma(_406, _382, _420);
    float _436 = fma(_416, _350, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _438 = fma(_396, _382, _422);
    float _440 = fma(_426, _350, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _444 = _442 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _448 = _446 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _450 = fma(_430, _350, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _454 = _452 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _456 = fma(_436, _360, _432);
    float _458 = fma(_444, _322, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _460 = fma(_448, _322, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _462 = fma(_440, _360, _434);
    float _464 = fma(_454, _322, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _466 = fma(_450, _360, _438);
    float _468 = fma(_458, _344, _456);
    float _470 = fma(_460, _344, _462);
    float _472 = fma(_464, _344, _466);
    float _474 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[147].x, _468);
    float _476 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[147].y, _470);
    float _478 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[147].z, _472);
    bool _480 = !_286;
    float _498;
    if (!_480)
    {
        float _482 = in.m_67.x;
        float _484 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _486 = _482 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _488 = fma(_486, (*spvDescriptorSet0.vp_c9)._m0[11].y, _156);
        float _490 = _488 * _484;
        float _492 = floor(_490);
        float _494 = -_492;
        float _496 = _490 + _494;
        _498 = _496;
        _500 = true;
    }
    else
    {
        float _502 = float(_122);
        float _504 = 1.0 / _502;
        float _506 = _156 * _504;
        _498 = _506;
    }
    _500 = false;
    float _508 = _498;
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _512 = _508 + _510;
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _516 = _514 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _520 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _518;
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _524 = _522 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _526 = _508 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _528 = isnan(_508);
    bool _530 = _526 || _528;
    bool _532 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _534 = _530 || _532;
    float _536 = float(_534);
    float _538 = 1.0 / _516;
    float _540 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _542 = _540 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _544 = _508 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _546 = isnan(_508);
    bool _548 = _544 || _546;
    bool _550 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _552 = _548 || _550;
    float _554 = float(_552);
    bool _556 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _558 = 1.0 / _524;
    float _560 = _520 * _538;
    bool _562 = _508 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _564 = isnan(_508);
    bool _566 = _562 || _564;
    bool _568 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _570 = _566 || _568;
    float _572 = float(_570);
    float _574 = 1.0 / _542;
    float _576 = -_536;
    float _578 = _576 + 1.0;
    float _580 = fma(_560, _512, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _584 = _582 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _586 = _508 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _588 = isnan(_508);
    bool _590 = _586 || _588;
    bool _592 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _594 = _590 || _592;
    float _596 = float(_594);
    float _598 = -_572;
    float _600 = _598 + 1.0;
    float _602 = _572 * _578;
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _606 = _604 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _608 = 1.0 / _584;
    float _610 = -_596;
    float _612 = _610 + 1.0;
    float _614 = _554 * _600;
    float _616 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _618 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _616;
    float _620 = _606 * _558;
    float _622 = _536 * _612;
    float _624 = _580 * _614;
    float _626 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _628 = _508 + _626;
    float _630 = -_554;
    float _632 = _630 + 1.0;
    bool _634 = _508 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _636 = isnan(_508);
    bool _638 = _634 || _636;
    bool _640 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _642 = _638 || _640;
    float _644 = float(_642);
    float _646 = _618 * _574;
    float _648 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _650 = _648 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _652 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _654 = _508 + _652;
    float _656 = fma(_620, _628, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _658 = fma(_632, (*spvDescriptorSet0.vp_c9)._m0[115].x, _624);
    float _660 = -_644;
    float _662 = _660 + 1.0;
    float _664 = _650 * _608;
    float _666 = fma(_646, _654, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _668 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _670 = _508 + _668;
    float _672 = fma(_656, _602, _658);
    float _674 = _596 * _662;
    float _676 = fma(_664, _670, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _678 = fma(_666, _622, _672);
    float _680 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _682 = fma(_676, _674, _678);
    float _684 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _686 = _680 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _688 = fma(_644, (*spvDescriptorSet0.vp_c9)._m0[119].x, _682);
    float _690 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _692 = _684 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _694 = _688 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _696 = in.m_69.x;
    float _698 = in.m_69.y;
    float _700 = in.m_69.z;
    float _702 = _690 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_71.x = _686;
    out.m_71.y = _692;
    out.m_71.z = _702;
    out.m_71.w = _694;
    float _704 = _478 * _700;
    float _706 = _476 * _698;
    float _708 = _474 * _696;
    bool _710 = !_556;
    float _728;
    if (!_710)
    {
        float _712 = in.m_67.x;
        float _714 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _716 = _712 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _718 = fma(_716, (*spvDescriptorSet0.vp_c9)._m0[11].w, _156);
        float _720 = _718 * _714;
        float _722 = floor(_720);
        float _724 = -_722;
        float _726 = _720 + _724;
        _728 = _726;
        _730 = true;
    }
    else
    {
        float _732 = float(_122);
        float _734 = 1.0 / _732;
        float _736 = _156 * _734;
        _728 = _736;
    }
    _730 = false;
    float _738 = _728;
    float _740 = in.m_67.w;
    float _742 = _704 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _744 = in.m_73.y;
    float _746 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _748 = log2(_746);
    float _750 = in.m_67.z;
    int _752 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _754 = _752 != 0;
    float _756 = in.m_75.x;
    float _758 = in.m_75.y;
    float _760 = in.m_75.z;
    int _762 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _764 = _762 != 0;
    int _766 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _768 = _766 != 0;
    float _770 = in.m_67.y;
    int _772 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _774 = _772 != 0;
    float _776 = in.m_67.x;
    float _778 = _748 * _156;
    out.m_77.x = 1.0;
    out.m_77.y = 1.0;
    out.m_77.z = 1.0;
    bool _780 = _740 > 0.5;
    float _782 = in.m_58.x;
    float _784 = in.m_58.y;
    float _786 = in.m_58.z;
    float _788 = -_744;
    float _790 = _788 + 1.0;
    float _792 = exp2(_778);
    float _794 = _750 * 2.0;
    float _796 = in.m_73.x;
    int _798 = _780 ? as_type<int>(_790) : as_type<int>(_744);
    float _800 = _708 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _802 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _804 = _802 != 0;
    int _806 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _808 = _806 != 0;
    int _810 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _812 = _810 != 0;
    float _814 = _706 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _816 = floor(_794);
    float _818 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _756);
    float _820 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _760);
    float _822 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _758);
    float _824 = _770 * 2.0;
    float _826 = _818 * _800;
    float _828 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _830 = _828 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _832 = _820 * _742;
    float _834 = _822 * _814;
    float _836 = _768 ? as_type<float>(_798) : _744;
    float _838 = 1.0 / _830;
    bool _840 = _770 > 0.5;
    float _842 = _784 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _844 = _784 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _846 = _784 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _848 = _776 * 2.0;
    float _850 = fma(_782, (*spvDescriptorSet0.vp_c10)._m0[5].x, _842);
    float _852 = fma(_782, (*spvDescriptorSet0.vp_c10)._m0[4].x, _844);
    float _854 = fma(_782, (*spvDescriptorSet0.vp_c10)._m0[6].x, _846);
    float _856 = floor(_824);
    float _858 = _744;
    float _860 = _852;
    float _862 = _750;
    if (_774)
    {
        float _864 = _840 ? _790 : _744;
        _858 = _864;
    }
    float _866 = _858;
    float _868 = _770 + _750;
    bool _870 = _816 > 0.0;
    float _872 = _776 + _750;
    float _874 = _868 + (-1.0);
    bool _876 = _816 >= 0.0;
    bool _878 = isnan(_816);
    bool _880 = _876 || _878;
    bool _882 = isnan(0.0);
    bool _884 = _880 || _882;
    float _886 = floor(_848);
    float _888 = _872 + (-1.0);
    float _890 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _892 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _890;
    float _894 = fma(_874, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _896 = _776 + _770;
    float _898 = -_792;
    float _900 = _898 + 1.0;
    float _902 = _892 * _838;
    float _904 = _896 + (-1.0);
    int _906 = _884 ? 0 : 1;
    float _908 = fma(_888, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _910 = _888;
    if (!_754)
    {
        _910 = _796;
    }
    float _912 = _910;
    float _914 = fma(_904, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _916 = ~_906;
    int _918 = _916 + 1;
    int _920 = _918 + 1;
    float _922 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _924 = _738 + _922;
    int _926 = _920;
    float _928 = _912;
    if (!_870)
    {
        int _930 = ~_906;
        int _932 = _930 + 1;
        _926 = _932;
    }
    int _934 = _926;
    float _936 = fma(_786, (*spvDescriptorSet0.vp_c10)._m0[5].z, _850);
    bool _938 = _856 >= 0.0;
    bool _940 = isnan(_856);
    bool _942 = _938 || _940;
    bool _944 = isnan(0.0);
    bool _946 = _942 || _944;
    float _948 = fma(_902, _924, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _950 = _886 >= 0.0;
    bool _952 = isnan(_886);
    bool _954 = _950 || _952;
    bool _956 = isnan(0.0);
    bool _958 = _954 || _956;
    float _960 = _770 + (-0.5);
    int _962 = _946 ? 0 : 1;
    float _964 = _936 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _966 = _958 ? 0 : 1;
    bool _968 = _856 > 0.0;
    float _970 = fma(_786, (*spvDescriptorSet0.vp_c10)._m0[6].z, _854);
    bool _972 = _886 > 0.0;
    float _974 = fma(_786, (*spvDescriptorSet0.vp_c10)._m0[4].z, _852);
    bool _976 = !_804;
    int _978 = _976 ? 0 : 1;
    float _980 = in.m_79.x;
    float _982 = in.m_79.y;
    float _984 = in.m_79.z;
    bool _986 = _972;
    int _988 = as_type<int>(_948);
    if (!_754)
    {
        _860 = _912;
    }
    float _990 = _860;
    float _992 = _974 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _994 = _990;
    float _996 = _992;
    if (_754)
    {
        _928 = _796;
    }
    float _998 = _928;
    bool _1000 = !_808;
    int _1002 = _1000 ? 0 : 1;
    int _1004 = abs(_978);
    int _1006 = 0;
    float _1008 = _998;
    if (_764)
    {
        float _1010 = -_998;
        float _1012 = _1010 + 1.0;
        _1006 = as_type<int>(_1012);
    }
    int _1014 = _1006;
    int _1016 = abs(_1002);
    float _1018 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1020 = 1.0 + _1018;
    int _1022 = ~_966;
    int _1024 = _1022 + 1;
    int _1026 = _1024 + 1;
    int _1028 = _1026;
    if (!_972)
    {
        int _1030 = ~_966;
        int _1032 = _1030 + 1;
        _1028 = _1032;
    }
    int _1034 = _1028;
    float _1036 = 1.0 / _1020;
    float _1038 = float(_1004);
    float _1040 = float(_934);
    bool _1042 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1044 = isnan(1.0);
    bool _1046 = _1042 || _1044;
    bool _1048 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1050 = _1046 || _1048;
    int _1052 = ~_962;
    int _1054 = _1052 + 1;
    int _1056 = _1054 + 1;
    float _1058 = _1038 * _1040;
    int _1060 = _1056;
    bool _1062 = _1050;
    if (!_968)
    {
        int _1064 = ~_962;
        int _1066 = _1064 + 1;
        _1060 = _1066;
    }
    int _1068 = _1060;
    bool _1070 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1072 = isnan(0.0);
    bool _1074 = _1070 || _1072;
    bool _1076 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1078 = _1074 || _1076;
    float _1080 = _1058 * (-2.0);
    float _1082 = float(_1016);
    float _1084 = float(_1034);
    float _1086 = fma(_1080, _980, _980);
    float _1088 = _1078 ? _900 : 0.0;
    bool _1090 = !_812;
    int _1092 = _1090 ? 0 : 1;
    float _1094 = _1082 * _1084;
    if (_754)
    {
        bool _1096 = _776 > 0.5;
        _986 = _1096;
    }
    bool _1098 = _986;
    float _1100 = _776 + (-0.5);
    int _1102 = abs(_1092);
    if (_1050)
    {
        float _1104 = _1088 * _1036;
        _160 = _1104;
    }
    float _1106 = _160;
    float _1108 = fma(_914, _1080, _914);
    float _1110 = fma(_1100, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1086);
    float _1112 = float(_1102);
    float _1114 = _1094 * (-2.0);
    float _1116 = float(_1068);
    float _1118 = fma(_1108, _1106, _1110);
    bool _1120 = _738 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1122 = isnan(_738);
    bool _1124 = _1120 || _1122;
    bool _1126 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1128 = _1124 || _1126;
    float _1130 = float(_1128);
    float _1132 = fma(_894, _1114, _894);
    bool _1134 = _758 != 0.0;
    bool _1136 = isnan(_758);
    bool _1138 = _1134 || _1136;
    bool _1140 = isnan(0.0);
    bool _1142 = _1138 || _1140;
    float _1144 = _1112 * _1116;
    bool _1146 = _738 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1148 = isnan(_738);
    bool _1150 = _1146 || _1148;
    bool _1152 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1154 = _1150 || _1152;
    float _1156 = float(_1154);
    float _1158 = _1118 * 0.15915493667125701904296875;
    bool _1160 = _756 == 0.0;
    bool _1162 = !_1142;
    bool _1164 = _1160 && _1162;
    float _1166 = in.m_81.x;
    float _1168 = in.m_81.y;
    float _1170 = in.m_81.z;
    float _1172 = fma(_1114, _982, _982);
    float _1174 = -_1130;
    float _1176 = _1174 + 1.0;
    float _1178 = _1144 * (-2.0);
    bool _1180 = _760 == 0.0;
    bool _1182 = _1180 && _1164;
    float _1184 = fma(_960, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1172);
    float _1186 = _1156 * _1176;
    float _1188 = fma(_1178, _984, _984);
    float _1190 = _750 + (-0.5);
    float _1192 = fma(_1132, _1106, _1184);
    float _1194 = _948 * _1186;
    float _1196 = fma(_908, _1178, _908);
    float _1198 = in.m_83.x;
    float _1200 = in.m_83.y;
    float _1202 = in.m_83.z;
    float _1204 = in.m_83.w;
    float _1206 = fma(_1190, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1188);
    float _1208 = _1206;
    float _1210 = _1188;
    if (_754)
    {
        float _1212 = -_998;
        float _1214 = _1212 + 1.0;
        _988 = as_type<int>(_1214);
    }
    int _1216 = _988;
    if (_764)
    {
        bool _1218 = _750 > 0.5;
        _1062 = _1218;
    }
    bool _1220 = _1062;
    float _1222 = -_1156;
    float _1224 = _1222 + 1.0;
    float _1226 = fma(_1196, _1106, _1206);
    float _1228 = _1226;
    if (!_764)
    {
        _862 = _998;
    }
    float _1230 = _862;
    float _1232 = _1192 * 0.15915493667125701904296875;
    float _1234 = _1230;
    if (_754)
    {
        float _1236 = _1098 ? as_type<float>(_1216) : _998;
        _994 = _1236;
    }
    float _1238 = _994;
    float _1240 = fma(_1224, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1194);
    if (_764)
    {
        float _1242 = _1220 ? as_type<float>(_1014) : _998;
        _1234 = _1242;
    }
    float _1244 = _1234;
    float _1246 = _1226 * 0.15915493667125701904296875;
    float _1248 = _1166;
    if (_1182)
    {
        _1208 = _1166;
    }
    float _1250 = _1208;
    float _1252 = _1158 * 6.283185482025146484375;
    float _1254 = sin(_1252);
    float _1256 = _1250;
    if (_1182)
    {
        _1210 = _1168;
    }
    float _1258 = _1210;
    float _1260 = fma(_1130, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1240);
    float _1262 = _1258;
    if (_1182)
    {
        _1008 = _1250;
    }
    float _1264 = _1008;
    float _1266 = _1264;
    if (!_1182)
    {
        _1256 = _1166;
    }
    float _1268 = _1256;
    if (_1182)
    {
        _1248 = _1258;
    }
    float _1270 = _1248;
    float _1272 = _1158 * 6.283185482025146484375;
    float _1274 = cos(_1272);
    float _1276 = _1270;
    if (!_1182)
    {
        _1262 = _1168;
    }
    float _1278 = _1262;
    if (!_1182)
    {
        float _1280 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1268);
        _1266 = _1280;
    }
    float _1282 = _1266;
    float _1284 = _1200 * _1170;
    float _1286 = _1202 * _1268;
    float _1288 = _1282;
    if (_1182)
    {
        _1228 = _1170;
    }
    float _1290 = _1228;
    float _1292 = _1290;
    if (!_1182)
    {
        float _1294 = fma(_758, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1278);
        _1276 = _1294;
    }
    float _1296 = _1276;
    float _1298 = _1198 * _1278;
    float _1300 = _1232 * 6.283185482025146484375;
    float _1302 = sin(_1300);
    float _1304 = -_1284;
    float _1306 = fma(_1202, _1278, _1304);
    if (!_1182)
    {
        float _1308 = fma(_760, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1170);
        _1292 = _1308;
    }
    float _1310 = _1292;
    float _1312 = -_1298;
    float _1314 = fma(_1200, _1268, _1312);
    float _1316 = _1232 * 6.283185482025146484375;
    float _1318 = cos(_1316);
    float _1320 = _1246 * 6.283185482025146484375;
    float _1322 = cos(_1320);
    float _1324 = -_1286;
    float _1326 = fma(_1198, _1170, _1324);
    float _1328 = _1254 * _1302;
    float _1330 = _1274 * _1302;
    float _1332 = _1326 * _1204;
    float _1334 = _1246 * 6.283185482025146484375;
    float _1336 = sin(_1334);
    float _1338 = _1274 * _1318;
    float _1340 = _1254 * _1318;
    float _1342 = _1274 * _1322;
    float _1344 = _1318 * _1322;
    float _1346 = _1254 * _1322;
    float _1348 = _1302 * _1322;
    float _1350 = _1342 * _834;
    float _1352 = _1346 * _834;
    float _1354 = fma(_1336, _1338, _1328);
    float _1356 = -_834;
    float _1358 = _1336 * _1356;
    float _1360 = -_1330;
    float _1362 = fma(_1336, _1340, _1360);
    float _1364 = -_1340;
    float _1366 = fma(_1336, _1330, _1364);
    float _1368 = fma(_1354, _826, _1350);
    float _1370 = fma(_1344, _826, _1358);
    float _1372 = fma(_1336, _1328, _1338);
    float _1374 = fma(_1362, _826, _1352);
    float _1376 = fma(_1366, _832, _1368);
    float _1378 = fma(_1348, _832, _1370);
    float _1380 = _1306 * _1204;
    float _1382 = fma(_1372, _832, _1374);
    float _1384 = _1376 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1386 = _1376 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1388 = _1314 * _1204;
    float _1390 = _970 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1392 = fma(_1378, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1384);
    float _1394 = fma(_1378, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1386);
    float _1396 = _1342 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1398 = _1342 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1400 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1392);
    float _1402 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1394);
    float _1404 = _1342 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1406 = -_1336;
    float _1408 = fma(_1406, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1396);
    float _1410 = _1400 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1412 = _1402 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1414 = -_1336;
    float _1416 = fma(_1414, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1398);
    float _1418 = -_1336;
    float _1420 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1404);
    float _1422 = _992 + _1410;
    float _1424 = _1390 + _1412;
    float _1426 = _1354 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1428 = _1354 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1430 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1432 = _1422 + _1430;
    float _1434 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1436 = _1424 + _1434;
    float _1438 = _1354 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1440 = fma(_1344, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1426);
    float _1442 = _1432 * _1432;
    float _1444 = _1436 * _1436;
    float _1446 = fma(_1344, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1428);
    float _1448 = fma(_1344, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1438);
    float _1450 = _1366 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1452 = _1442 + _1444;
    float _1454 = _1366 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1456 = _1366 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1458 = fma(_1346, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1408);
    float _1460 = sqrt(_1452);
    float _1462 = fma(_1346, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1416);
    float _1464 = fma(_1346, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1420);
    float _1466 = fma(_1348, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1456);
    float _1468 = _1458 * _1296;
    float _1470 = _1462 * _1296;
    float _1472 = _1464 * _1296;
    float _1474 = _1376 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1476 = fma(_1348, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1454);
    float _1478 = fma(_1348, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1450);
    float _1480 = fma(_1362, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1440);
    float _1482 = fma(_1378, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1474);
    float _1484 = fma(_1362, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1446);
    float _1486 = fma(_1362, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1448);
    float _1488 = fma(_1372, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1476);
    float _1490 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1482);
    bool _1492 = _1460 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1494 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1496 = _1458 * _1200;
    float _1498 = _1490 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1500 = _1462 * _1200;
    float _1502 = _1464 * _1200;
    float _1504 = fma(_1372, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1478);
    float _1506 = _964 + _1498;
    float _1508 = _1332 * _1458;
    float _1510 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1512 = _1332 * _1462;
    float _1514 = _1332 * _1464;
    float _1516 = fma(_1480, _1282, _1468);
    float _1518 = fma(_1484, _1282, _1470);
    float _1520 = fma(_1486, _1282, _1472);
    float _1522 = fma(_1480, _1198, _1496);
    float _1524 = _1496;
    float _1526 = _1442;
    float _1528 = _1422;
    float _1530 = _1424;
    float _1532 = _1518;
    if (!_1492)
    {
        _1288 = _1442;
    }
    float _1534 = _1288;
    float _1536 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1538 = fma(_1372, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1466);
    float _1540 = fma(_1380, _1480, _1508);
    float _1542 = _1534;
    if (!_1492)
    {
        _1524 = _1444;
    }
    float _1544 = _1524;
    float _1546 = _1544;
    if (!_1492)
    {
        _1526 = _1506;
    }
    float _1548 = _1526;
    bool _1550 = !_1492;
    float _1552 = _1548;
    if (!_1550)
    {
        float _1554 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1556 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1558 = _1460 + _1556;
        float _1560 = rsqrt(_1452);
        float _1562 = _1558 * _1554;
        float _1564 = _1506 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1566 = _1562 * 0.15915493667125701904296875;
        float _1568 = _1566 * 6.283185482025146484375;
        float _1570 = sin(_1568);
        float _1572 = _1566 * 6.283185482025146484375;
        float _1574 = cos(_1572);
        float _1576 = fma(_1570, _1564, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1578 = _1560 * _1576;
        float _1580 = _1574 + (-1.0);
        float _1582 = fma(_1432, _1578, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1584 = fma(_1436, _1578, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1586 = _1580 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1588 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1590 = _1582 + _1588;
        float _1592 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1594 = _1584 + _1592;
        float _1596 = fma(_1506, _1574, _1586);
        float _1598 = _1590 * _1590;
        float _1600 = _1594 * _1594;
        _1552 = _1596;
        _1542 = _1598;
        _1546 = _1600;
        _1528 = _1582;
        _1530 = _1584;
    }
    float _1602 = _1552;
    float _1604 = _1542;
    float _1606 = _1546;
    float _1608 = _1528;
    float _1610 = _1530;
    float _1612 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1614 = _1602 + _1612;
    float _1616 = _836 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1618 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1620 = fma(_1484, _1198, _1500);
    float _1622 = fma(_1380, _1484, _1512);
    float _1624 = fma(_1614, _1614, _1604);
    float _1626 = _866 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1628 = _1616 * _1536;
    float _1630 = fma(_1486, _1198, _1502);
    float _1632 = _1624 + _1606;
    float _1634 = _1238 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1636 = fma(_1380, _1486, _1514);
    float _1638 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1640 = _1634 * _1494;
    float _1642 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1644 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1646 = _1244 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1648 = fma(_1504, _1310, _1516);
    float _1650 = sqrt(_1632);
    float _1652 = _1638 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1654 = _1642 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1656 = fma(_1504, _1202, _1522);
    float _1658 = fma(_1388, _1504, _1540);
    float _1660 = _1644 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1662 = _1646 * _1618;
    float _1664 = fma(_1488, _1310, _1518);
    float _1666 = fma(_1488, _1202, _1620);
    float _1668 = fma(_1388, _1488, _1622);
    float _1670 = fma(_1538, _1202, _1630);
    float _1672 = _1626 * _1510;
    float _1674 = _1260 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1676 = fma(_1388, _1538, _1636);
    float _1678 = fma(_1538, _1310, _1520);
    out.m_85.x = _1656;
    out.m_85.y = _1666;
    out.m_85.z = _1670;
    bool _1680 = _1650 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1682 = isnan(_1650);
    bool _1684 = _1680 || _1682;
    bool _1686 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1688 = _1684 || _1686;
    out.m_87.x = _1652;
    out.m_87.y = _1654;
    out.m_87.z = _1660;
    out.m_87.w = _1674;
    out.m_89.x = _1640;
    out.m_89.y = _1672;
    out.m_89.z = _1662;
    out.m_89.w = _1628;
    out.m_91.x = _1658;
    out.m_91.y = _1668;
    out.m_91.z = _1676;
    if (!_1688)
    {
        _1532 = 1.0;
    }
    float _1690 = _1532;
    out.m_93.x = _1648;
    out.m_93.y = _1664;
    out.m_93.z = _1678;
    bool _1692 = !_1688;
    float _1694 = _1690;
    if (!_1692)
    {
        bool _1696 = _1650 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1698 = isnan(_1650);
        bool _1700 = _1696 || _1698;
        bool _1702 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1704 = _1700 || _1702;
        if (!_1704)
        {
            float _1706 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1708 = _1650 + _1706;
            float _1710 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1712 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1710;
            float _1714 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1716 = _1714 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1718 = 1.0 / _1712;
            float _1720 = _1708 * _1718;
            float _1722 = fma(_1720, _1716, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1694 = _1722;
            _1724 = true;
        }
        else
        {
            bool _1726 = _1650 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1728 = isnan(_1650);
            bool _1730 = _1726 || _1728;
            bool _1732 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1734 = _1730 || _1732;
            if (!_1734)
            {
                float _1736 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1738 = _1650 + _1736;
                float _1740 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1742 = _1740 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1744 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1746 = _1744 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1748 = 1.0 / _1742;
                float _1750 = _1738 * _1748;
                float _1752 = fma(_1750, _1746, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1694 = _1752;
                _1724 = true;
            }
            else
            {
                _1694 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1724 = false;
    float _1754 = _1694;
    float _1756 = fma(_992, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1758 = fma(_1390, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1760 = floor(_1756);
    float _1762 = floor(_1758);
    float _1764 = -_1760;
    float _1766 = _1756 + _1764;
    float _1768 = -_1762;
    float _1770 = _1758 + _1768;
    float2 _5942 = float2(_1766, _1770);
    float _1772 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5942, float2(0.0), isnan(_5942)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5942, float2(0.0), isnan(_5942)), level(0.0)).x;
    float _1774 = _964 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1776 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1778 = _1608 + _1776;
    float _1780 = fma(_992, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1774);
    float _1782 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1780);
    float _1784 = _964 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1786 = _1782 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1788 = fma(_992, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1784);
    float _1790 = 1.0 / _1786;
    float _1792 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1788);
    float _1794 = _1792 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1796 = _1794 + _1786;
    float _1798 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _1800 = _1796 * _1790;
    float _1802 = _1800 * 0.5;
    float _1804 = _964 + _1798;
    float _1806 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1808 = fma(_1802, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1806);
    float _1810 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1812 = _1602 + _1810;
    float _1814 = 1.0 / _1808;
    float _1816 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1818 = _1814 * _1816;
    float _1820 = _1804 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    bool _1822 = _1818 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1824 = fma(_992, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1820);
    bool _1826 = _1818 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _1828 = !_1822;
    int _1830 = _1828 ? 0 : 1;
    float _1832 = fma(_1390, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1824);
    float _1834 = _1832 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1836 = fma(_1812, _1754, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1838 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1840 = _1610 + _1838;
    float _1842 = fma(_1778, _1754, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    int _1844 = 2;
    float _1846 = _1804;
    if (!_1822)
    {
        _1844 = 1;
    }
    int _1848 = _1844;
    float _1850 = trunc(_1834);
    int _1852 = int(_1850);
    int _1854 = _1848;
    if (!_1826)
    {
        _1854 = _1830;
    }
    int _1856 = _1854;
    float _1858 = _1804 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1860 = -_964;
    float _1862 = _1860 + _1836;
    float _1864 = fma(_1840, _1754, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    int _1866 = _1856 << 6;
    float _1868 = fma(_992, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1858);
    float _1870 = -_992;
    float _1872 = _1870 + _1842;
    float _1874 = _1862 * _1862;
    int _1876 = _1866 + 96;
    uint _1879 = uint(int(uint(_1876) >> uint(2)));
    uint _1881 = uint(int(uint(int(_1879)) >> uint(2)));
    int _1883 = int(_1879) & 3;
    float _1885 = (*spvDescriptorSet0.vp_c15)._m0[int(_1881)][_1883];
    int _1887 = int(_1879) + 1;
    uint _1889 = uint(int(uint(_1887) >> uint(2)));
    int _1891 = _1887 & 3;
    float _1893 = (*spvDescriptorSet0.vp_c15)._m0[int(_1889)][_1891];
    float _1895 = fma(_1390, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1868);
    float _1897 = -_1390;
    float _1899 = _1897 + _1864;
    float _1901 = fma(_1872, _1872, _1874);
    float _1903 = _1895 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    int _1905 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1907 = _1852 + _1905;
    int _1909 = _1907 + 1;
    int _1911 = _1866 + 104;
    uint _1913 = uint(int(uint(_1911) >> uint(2)));
    uint _1915 = uint(int(uint(int(_1913)) >> uint(2)));
    int _1917 = int(_1913) & 3;
    float _1919 = (*spvDescriptorSet0.vp_c15)._m0[int(_1915)][_1917];
    int _1921 = int(_1913) + 1;
    uint _1923 = uint(int(uint(_1921) >> uint(2)));
    int _1925 = _1921 & 3;
    float _1927 = (*spvDescriptorSet0.vp_c15)._m0[int(_1923)][_1925];
    float _1929 = trunc(_1903);
    int _1931 = int(_1929);
    float _1933 = fma(_1899, _1899, _1901);
    bool _1935 = _1909 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1937 = _1866 + 48;
    uint _1939 = uint(int(uint(_1937) >> uint(2)));
    uint _1941 = uint(int(uint(int(_1939)) >> uint(2)));
    int _1943 = int(_1939) & 3;
    float _1945 = (*spvDescriptorSet0.vp_c15)._m0[int(_1941)][_1943];
    int _1947 = int(_1939) + 1;
    uint _1949 = uint(int(uint(_1947) >> uint(2)));
    int _1951 = _1947 & 3;
    float _1953 = (*spvDescriptorSet0.vp_c15)._m0[int(_1949)][_1951];
    float _1955 = sqrt(_1933);
    int _1957 = _1866 + 64;
    uint _1959 = uint(int(uint(_1957) >> uint(2)));
    uint _1961 = uint(int(uint(int(_1959)) >> uint(2)));
    int _1963 = int(_1959) & 3;
    float _1965 = (*spvDescriptorSet0.vp_c15)._m0[int(_1961)][_1963];
    int _1967 = int(_1959) + 1;
    uint _1969 = uint(int(uint(_1967) >> uint(2)));
    int _1971 = _1967 & 3;
    float _1973 = (*spvDescriptorSet0.vp_c15)._m0[int(_1969)][_1971];
    int _1975 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1977 = _1931 + _1975;
    int _1979 = _1977 + 1;
    int _1981 = _1909 | _1979;
    int _1983 = _1866 + 72;
    uint _1985 = uint(int(uint(_1983) >> uint(2)));
    uint _1987 = uint(int(uint(int(_1985)) >> uint(2)));
    int _1989 = int(_1985) & 3;
    float _1991 = (*spvDescriptorSet0.vp_c15)._m0[int(_1987)][_1989];
    int _1993 = int(_1985) + 1;
    uint _1995 = uint(int(uint(_1993) >> uint(2)));
    int _1997 = _1993 & 3;
    float _1999 = (*spvDescriptorSet0.vp_c15)._m0[int(_1995)][_1997];
    bool _2001 = _1981 < 0;
    bool _2003 = _2001 || _1935;
    bool _2005 = _1979 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _2007 = _2005 || _2003;
    bool _2009 = _1955 > 0.0;
    int _2011 = _1866 + 56;
    uint _2013 = uint(int(uint(_2011) >> uint(2)));
    uint _2015 = uint(int(uint(int(_2013)) >> uint(2)));
    int _2017 = int(_2013) & 3;
    float _2019 = (*spvDescriptorSet0.vp_c15)._m0[int(_2015)][_2017];
    int _2021 = int(_2013) + 1;
    uint _2023 = uint(int(uint(_2021) >> uint(2)));
    int _2025 = _2021 & 3;
    float _2027 = (*spvDescriptorSet0.vp_c15)._m0[int(_2023)][_2025];
    int _2029 = _1866 + 80;
    uint _2031 = uint(int(uint(_2029) >> uint(2)));
    uint _2033 = uint(int(uint(int(_2031)) >> uint(2)));
    int _2035 = int(_2031) & 3;
    float _2037 = (*spvDescriptorSet0.vp_c15)._m0[int(_2033)][_2035];
    int _2039 = int(_2031) + 1;
    uint _2041 = uint(int(uint(_2039) >> uint(2)));
    int _2043 = _2039 & 3;
    float _2045 = (*spvDescriptorSet0.vp_c15)._m0[int(_2041)][_2043];
    float _2047 = _1804 * _1893;
    float _2049 = fma(_992, _1885, _2047);
    float _2051 = fma(_1390, _1919, _2049);
    float _2053 = _2051 + _1927;
    float _2055 = _1804 * _1953;
    int _2057 = as_type<int>(_1953);
    int _2059 = as_type<int>(_1955);
    int _2061 = as_type<int>(_1893);
    float _2063 = _1965;
    float _2065 = _1899;
    float _2067 = as_type<float>(_1856);
    float _2069 = _1903;
    float _2071 = as_type<float>(_1909);
    if (!_2007)
    {
        int _2073 = _1979 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _2075 = _2073 + _1909;
        _2057 = _2075;
    }
    int _2077 = _2057;
    float _2079 = fma(_992, _1945, _2055);
    float _2081 = 1.0 / _2053;
    if (!_2007)
    {
        int _2083 = _2077 << 2;
        _2059 = _2083;
    }
    int _2085 = _2059;
    float _2087 = _1804 * _1973;
    int _2089 = _2085;
    if (!_2007)
    {
        uint _2091 = uint(int(uint(_2077) >> uint(2)));
        _2061 = int(_2091);
    }
    int _2093 = _2061;
    if (!_2007)
    {
        int _2095 = 12 & _2085;
        _2089 = _2095;
    }
    int _2097 = _2089;
    float _2099 = fma(_992, _1965, _2087);
    float _2101 = _2099;
    if (!_2009)
    {
        _2063 = _1836;
    }
    float _2103 = _2063;
    float _2105 = fma(_1390, _1991, _2099);
    float _2107 = _1991;
    float _2109 = _2103;
    float _2111 = _2103;
    if (!_2009)
    {
        _2107 = _1842;
    }
    float _2113 = _2107;
    float _2115 = _2113;
    if (!_2009)
    {
        _2101 = _1864;
    }
    float _2117 = _2101;
    float _2119 = fma(_1390, _2019, _2079);
    bool _2121 = !_2009;
    float _2123 = _2117;
    float _2125 = _2117;
    if (!_2121)
    {
        float _2127 = _200 * _200;
        float _2129 = rsqrt(_1933);
        float _2131 = fma(_198, _198, _2127);
        float _2133 = fma(_202, _202, _2131);
        float _2135 = sqrt(_2133);
        float _2137 = _1872 * _2129;
        float _2139 = _1862 * _2129;
        float _2141 = _1899 * _2129;
        bool _2143 = _2135 > 0.0;
        float _2145 = _2135;
        _2065 = _2141;
        if (!_2143)
        {
            _2145 = _1842;
        }
        float _2147 = _2145;
        _2115 = _2147;
        if (!_2143)
        {
            _2109 = _1836;
        }
        float _2149 = _2109;
        _2111 = _2149;
        if (!_2143)
        {
            _2123 = _1864;
        }
        float _2151 = _2123;
        bool _2153 = !_2143;
        _2125 = _2151;
        if (!_2153)
        {
            float _2155 = rsqrt(_2133);
            float _2157 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2159 = _200 * _2155;
            float _2161 = _198 * _2155;
            float _2163 = _2139 * _2159;
            float _2165 = _202 * _2155;
            float _2167 = fma(_2137, _2161, _2163);
            float _2169 = _2157 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2171 = fma(_2141, _2165, _2167);
            float _2173 = _2171 * _2169;
            float _2175 = fma(_198, _2173, _1842);
            float _2177 = fma(_200, _2173, _1836);
            float _2179 = fma(_202, _2173, _1864);
            _2111 = _2177;
            _2115 = _2175;
            _2125 = _2179;
        }
    }
    float _2181 = _2111;
    float _2183 = _2115;
    float _2185 = _2065;
    float _2187 = _2125;
    float _2189 = _2185;
    if (!_2007)
    {
        int _2191 = _2093 << 4;
        int _2193 = _2191 + _2097;
        _2189 = as_type<float>(_2193);
    }
    float _2195 = _2189;
    int _2197 = _1866 + 88;
    uint _2199 = uint(int(uint(_2197) >> uint(2)));
    uint _2201 = uint(int(uint(int(_2199)) >> uint(2)));
    int _2203 = int(_2199) & 3;
    float _2205 = (*spvDescriptorSet0.vp_c15)._m0[int(_2201)][_2203];
    int _2207 = int(_2199) + 1;
    uint _2209 = uint(int(uint(_2207) >> uint(2)));
    int _2211 = _2207 & 3;
    float _2213 = (*spvDescriptorSet0.vp_c15)._m0[int(_2209)][_2211];
    float _2215 = _2119 + _2027;
    float _2217 = _2181 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2219 = _2181 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2221 = _2105 + _1999;
    float _2223 = _2181 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2225 = _2181 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2227 = fma(_2183, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2217);
    float _2229 = _2195;
    if (!_2007)
    {
        int _2231 = as_type<int>(_2195) + 400;
        uint _2233 = uint(int(uint(_2231) >> uint(2)));
        uint _2235 = uint(int(uint(int(_2233)) >> uint(2)));
        int _2237 = int(_2233) & 3;
        float _2239 = (*spvDescriptorSet0.vp_c15)._m0[int(_2235)][_2237];
        _2229 = _2239;
    }
    float _2241 = _2229;
    float _2243 = fma(_2183, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2219);
    float _2245 = _2215 * _2081;
    float _2247 = fma(_2183, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2223);
    float _2249 = fma(_2183, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2225);
    float _2251 = fma(_2187, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2227);
    float _2253 = fma(_2187, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2243);
    bool _2255 = _2245 >= 0.0;
    float _2257 = fma(_2187, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2247);
    float _2259 = _2251 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2261 = _2253 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2263 = _2221 * _2081;
    bool _2265 = _2245 <= 1.0;
    bool _2267 = _2265 && _2255;
    float _2269 = _2257 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2271 = _2261 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2273 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    bool _2275 = _2263 >= 0.0;
    bool _2277 = _2275 && _2267;
    float _2279 = _2269 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2281 = fma(_2187, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2249);
    float _2283 = fma(_2259, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2271);
    bool _2285 = _2263 <= 1.0;
    bool _2287 = _2285 && _2277;
    float _2289 = -_2279;
    float _2291 = fma(_2289, _2273, 1.0);
    float _2293 = _2281 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2295 = fma(_2269, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2283);
    float _2297 = _2261 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2299 = _2261 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2301 = _1804 * _2045;
    float _2303 = fma(_2293, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2295);
    float _2305 = log2(_2291);
    float _2307 = fma(_2259, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2297);
    float _2309 = fma(_2259, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2299);
    float _2311 = fma(_992, _2037, _2301);
    float _2313 = _2299;
    if (_2287)
    {
        float _2315 = float(_1856);
        _2067 = _2315;
    }
    float _2317 = _2067;
    float _2319 = fma(_2269, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2307);
    float _2321 = fma(_2269, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2309);
    float _2323 = 1.0 / _2303;
    float _2325 = fma(_2293, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2321);
    float _2327 = fma(_1390, _2205, _2311);
    float _2329 = fma(_2293, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2319);
    float _2331 = as_type<float>(_2097);
    float _2333 = _2329;
    float _2335 = _2325;
    if (!_2007)
    {
        float _2337 = floor(_1903);
        _2331 = _2337;
    }
    float _2339 = _2331;
    float _2341 = _2327 + _2213;
    float _2343 = _2305 * 0.693147182464599609375;
    float _2345 = _2341 * _2081;
    float _2347 = _2343 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2349 = _198;
    if (!_2007)
    {
        float _2351 = floor(_1834);
        _2349 = _2351;
    }
    float _2353 = _2349;
    float _2355 = _2329 * _2323;
    float _2357 = _2325 * _2323;
    float _2359 = fma(_2357, -0.5, 0.5);
    float _2361 = _2307;
    if (_2287)
    {
        float _2363 = rint(_2317);
        float _2365 = precise::max(_2363, 0.0);
        uint _2367 = uint(_2365);
        uint _2369 = clamp(_2367, 0u, 65535u);
        _2361 = as_type<float>(_2369);
    }
    float _2371 = _2361;
    float _2373 = _2339;
    if (!_2007)
    {
        float _2375 = -_2339;
        float _2377 = _1903 + _2375;
        _2373 = _2377;
    }
    float _2379 = _2373;
    float _2381 = _2241;
    if (!_2007)
    {
        float _2383 = rint(_2241);
        float _2385 = precise::max(_2383, 0.0);
        uint _2387 = uint(_2385);
        uint _2389 = clamp(_2387, 0u, 65535u);
        _2381 = as_type<float>(_2389);
    }
    float _2391 = _2381;
    float _2393 = fma(_2355, 0.5, 0.5);
    if (!_2007)
    {
        float _2395 = -_2353;
        float _2397 = _1834 + _2395;
        _2069 = _2397;
    }
    float _2399 = _2069;
    float _2401 = _2371;
    if (_2287)
    {
        float3 _7015 = float3(_2245, _2263, float(as_type<int>(_2371)));
        float3 _7019 = select(_7015, float3(0.0), isnan(_7015));
        float _2403 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _7019.xy, uint(rint(_7019.z)), _2345, level(0.0));
        _2401 = _2403;
    }
    float _2405 = _2401;
    float3 _7029 = float3(_2393, _2359, _2347);
    float _2407 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7029, float3(0.0), isnan(_7029)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7029, float3(0.0), isnan(_7029)), level(0.0)).x;
    float3 _7038 = float3(_2393, _2359, _2347);
    float4 _2410 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7038, float3(0.0), isnan(_7038)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7038, float3(0.0), isnan(_7038)), level(0.0)).xyzw;
    float _2412 = _2410.x;
    float _2414 = _2410.y;
    float _2416 = _2410.z;
    float _2418 = _2410.w;
    float _2420 = _2399;
    if (!_2007)
    {
        float3 _7061 = float3(_2399, _2379, float(as_type<int>(_2391)));
        float3 _7063 = select(_7061, float3(0.0), isnan(_7061));
        float _2422 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _7063.xy, uint(rint(_7063.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _7063.xy, uint(rint(_7063.z)), level(0.0)).x;
        _2420 = _2422;
    }
    float _2424 = _2420;
    if (_2007)
    {
        _2313 = 1.0;
    }
    float _2426 = _2313;
    float _2428 = _2426;
    if (!_2007)
    {
        int _2430 = _2077 << 4;
        int _2432 = _2430 + 2048;
        uint _2434 = uint(int(uint(_2432) >> uint(2)));
        uint _2436 = uint(int(uint(int(_2434)) >> uint(2)));
        int _2438 = int(_2434) & 3;
        float _2440 = (*spvDescriptorSet0.vp_c15)._m0[int(_2436)][_2438];
        int _2442 = int(_2434) + 1;
        uint _2444 = uint(int(uint(_2442) >> uint(2)));
        int _2446 = _2442 & 3;
        float _2448 = (*spvDescriptorSet0.vp_c15)._m0[int(_2444)][_2446];
        int _2450 = _2432 + 8;
        uint _2452 = uint(int(uint(_2450) >> uint(2)));
        uint _2454 = uint(int(uint(int(_2452)) >> uint(2)));
        int _2456 = int(_2452) & 3;
        float _2458 = (*spvDescriptorSet0.vp_c15)._m0[int(_2454)][_2456];
        int _2460 = int(_2452) + 1;
        uint _2462 = uint(int(uint(_2460) >> uint(2)));
        int _2464 = _2460 & 3;
        float _2466 = (*spvDescriptorSet0.vp_c15)._m0[int(_2462)][_2464];
        float _2468 = _1804 * _2448;
        float _2470 = fma(_992, _2440, _2468);
        float _2472 = fma(_1390, _2458, _2470);
        float _2474 = _2472 + _2466;
        float _2476 = precise::clamp(_2474, 0.0, 1.0);
        float _2478 = -_2476;
        float _2480 = _2478 + _2424;
        float _2482 = fma(_2480, 500.0, 1.5);
        float _2484 = exp2(_2482);
        float _2486 = 0.0 + _2484;
        float _2488 = precise::clamp(_2486, 0.0, 1.0);
        _1846 = _2484;
        _2428 = _2488;
    }
    float _2490 = _1846;
    float _2492 = _2428;
    float _2494 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2496 = _2181 + _2494;
    float _2498 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2500 = _2183 + _2498;
    float _2502 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2504 = _2187 + _2502;
    float _2506 = _2496 * _2496;
    float _2508 = fma(_2500, _2500, _2506);
    float _2510 = fma(_2504, _2504, _2508);
    float _2512 = rsqrt(_2510);
    float _2514 = _2512 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2516 = _2500 * _2514;
    float _2518 = _2504 * _2514;
    float _2520 = _2516 * _2516;
    float _2522 = _2518 * _2518;
    float _2524 = _2520 + _2522;
    float _2526 = sqrt(_2524);
    bool _2528 = _2526 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2530 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2532 = _2526 + _2530;
    float _2534 = _2512;
    float _2536 = _2532;
    float _2538 = _2496;
    float _2540 = _2514;
    if (_2528)
    {
        float _2542 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2534 = _2542;
    }
    float _2544 = _2534;
    float _2546 = _2544;
    if (_2528)
    {
        float _2548 = _2532 * _2544;
        _2536 = _2548;
    }
    float _2550 = _2536;
    if (_2528)
    {
        float _2552 = rsqrt(_2524);
        _2546 = _2552;
    }
    float _2554 = _2546;
    float _2556 = _2554;
    if (_2528)
    {
        float _2558 = _2550 * 0.15915493667125701904296875;
        _996 = _2558;
    }
    float _2560 = _996;
    float _2562 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2564 = _2504;
    float _2566 = _2560;
    if (_2528)
    {
        float _2568 = _2560 * 6.283185482025146484375;
        float _2570 = sin(_2568);
        _2564 = _2570;
    }
    float _2572 = _2564;
    float _2574 = precise::max(0.0, _2562);
    float _2576 = _2490;
    float _2578 = _2574;
    if (_2528)
    {
        float _2580 = _2560 * 6.283185482025146484375;
        float _2582 = cos(_2580);
        _2576 = _2582;
    }
    float _2584 = _2576;
    float _2586 = -_2514;
    float _2588 = -_2574;
    float _2590 = fma(_2496, _2586, _2588);
    if (_2528)
    {
        float _2592 = _2590 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2538 = _2592;
    }
    float _2594 = _2538;
    float _2596 = _2572;
    float _2598 = _2594;
    if (_2528)
    {
        float _2600 = fma(_2572, _2594, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2596 = _2600;
    }
    float _2602 = _2596;
    float _2604 = _2602;
    if (!_2528)
    {
        _2598 = _2518;
    }
    float _2606 = _2598;
    float _2608 = _2606;
    if (!_2528)
    {
        _2566 = _2520;
    }
    float _2610 = _2566;
    float _2612 = _2610;
    if (_2528)
    {
        float _2614 = _2554 * _2602;
        _2071 = _2614;
    }
    float _2616 = _2071;
    if (!_2528)
    {
        _2556 = _2516;
    }
    float _2618 = _2556;
    float _2620 = _2618;
    float _2622 = _2584;
    if (_2528)
    {
        float _2624 = _2584 + (-1.0);
        _2578 = _2624;
    }
    float _2626 = _2578;
    if (_2528)
    {
        float _2628 = _2516 * _2616;
        _2620 = _2628;
    }
    float _2630 = _2620;
    if (!_2528)
    {
        _2604 = _2590;
    }
    float _2632 = _2604;
    float _2634 = _2632;
    if (_2528)
    {
        float _2636 = _2518 * _2616;
        _2608 = _2636;
    }
    float _2638 = _2608;
    if (_2528)
    {
        float _2640 = _2626 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2540 = _2640;
    }
    float _2642 = _2540;
    if (_2528)
    {
        float _2644 = _2630 * _2630;
        _2612 = _2644;
    }
    float _2646 = _2612;
    float _2648 = sqrt(_2510);
    if (_2528)
    {
        float _2650 = fma(_2590, _2584, _2642);
        _2634 = _2650;
    }
    float _2652 = _2634;
    if (!_2528)
    {
        _2622 = _2522;
    }
    float _2654 = _2622;
    float _2656 = _2654;
    if (_2528)
    {
        float _2658 = _2638 * _2638;
        _2656 = _2658;
    }
    float _2660 = _2656;
    float _2662 = fma(_2652, _2652, _2646);
    float _2664 = _2662 + _2660;
    float _2666 = rsqrt(_2664);
    float _2668 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2670 = fma(_2648, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2668);
    float _2672 = precise::clamp(_2670, 0.0, 1.0);
    float _2674 = -_2672;
    float _2676 = _2674 + 1.0;
    float _2678 = _2666 * _2630;
    float _2680 = _2666 * _2652;
    float _2682 = _2666 * _2638;
    float _2684 = abs(_2676);
    float _2686 = log2(_2684);
    float _2688 = _2678 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2690 = -_2688;
    float _2692 = fma(_2680, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2690);
    float _2694 = -_2682;
    float _2696 = fma(_2694, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2692);
    float _2698 = fma(_2696, -0.5, 0.5);
    float _2700 = fma(_2696, 0.5, 0.5);
    float _2702 = _2686 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2704 = fma(_2700, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2706 = sqrt(_2698);
    float _2708 = fma(_2700, _2704, -0.212114393711090087890625);
    float _2710 = _2680 + 1.0;
    float _2712 = fma(_2700, _2708, 1.570728778839111328125);
    float _2714 = exp2(_2702);
    float _2716 = _2706 * 0.636619746685028076171875;
    float _2718 = -_2712;
    float _2720 = fma(_2716, _2718, 1.0);
    float _2722 = -_2680;
    float _2724 = fma(_2714, _2710, _2722);
    float _2726 = fma(_2724, 0.5, 0.5);
    float2 _7537 = float2(_2720, _2726);
    float3 _2730 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7537, float2(0.0), isnan(_7537)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7537, float2(0.0), isnan(_7537)), level(0.0)).xyz;
    float _2732 = _2730.x;
    float _2734 = _2730.y;
    float _2736 = _2730.z;
    float _2738 = abs(_1818);
    float _2740 = log2(_2738);
    float _2742 = _2261 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2744 = -_1772;
    float _2746 = _2744 + 1.0;
    float _2748 = fma(_2259, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2742);
    bool _2750 = _1818 <= 8000.0;
    bool _2752 = isnan(_1818);
    bool _2754 = _2750 || _2752;
    bool _2756 = isnan(8000.0);
    bool _2758 = _2754 || _2756;
    float _2760 = float(_2758);
    float _2762 = fma(_2269, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2748);
    float _2764 = fma(_2293, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2762);
    float _2766 = _2303 * 0.5;
    float _2768 = _2740 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    out.gl_Position.x = _2329;
    out.gl_Position.y = _2325;
    out.gl_Position.z = _2764;
    out.gl_Position.w = _2303;
    float _2770 = exp2(_2768);
    float _2772 = fma(_2770, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2774 = precise::clamp(_2772, 0.0, 1.0);
    float _2776 = fma(_2325, -0.5, _2766);
    float _2778 = _2766;
    float _2780 = _2764;
    if (!_2287)
    {
        _2778 = 1.0;
    }
    float _2782 = _2778;
    float _2784 = fma(_2774, -2.0, 3.0);
    float _2786 = _2774 * _2774;
    float _2788 = _2782;
    if (_2287)
    {
        bool _2790 = _2405 >= _2345;
        bool _2792 = isnan(_2405);
        bool _2794 = _2790 || _2792;
        bool _2796 = isnan(_2345);
        bool _2798 = _2794 || _2796;
        float _2800 = float(_2798);
        _2788 = _2800;
    }
    float _2802 = _2788;
    bool _2804 = _2648 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2806 = isnan(_2648);
    bool _2808 = _2804 || _2806;
    bool _2810 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2812 = _2808 || _2810;
    float _2814 = _2786 * _2784;
    float _2816 = _2686 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2818 = _2802 * _2492;
    float _2820 = _2329 + _2303;
    float _2822 = -_2814;
    float _2824 = _2822 + 1.0;
    float _2826 = exp2(_2816);
    float _2828 = fma(_2824, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2814);
    float _2830 = _2764 + _2303;
    float _2832 = _2820 * 0.5;
    float _2834 = _2760 * _2828;
    float _2836 = _2830 * 0.5;
    if (!_2812)
    {
        _2780 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2838 = _2780;
    float _2840 = _2834 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2842 = _2838;
    float _2844 = _2838;
    if (!_2812)
    {
        _2333 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2846 = _2333;
    out.m_95.x = _2832;
    out.m_95.y = _2776;
    out.m_95.z = _2836;
    out.m_95.w = _2303;
    float _2848 = _2846;
    float _2850 = _2846;
    if (!_2812)
    {
        _2335 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2852 = _2335;
    float _2854 = _2746 * _2840;
    float _2856 = precise::clamp(_2854, 0.0, 1.0);
    float _2858 = -_2826;
    float _2860 = _2858 + 1.0;
    float _2862 = -_2856;
    float _2864 = fma(_2862, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2866 = _2860 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2868 = -_2818;
    float _2870 = fma(_2868, _2864, 1.0);
    float _2872 = precise::clamp(_2870, 0.0, 1.0);
    float _2874 = _2866 * _2407;
    float _2876 = -_2866;
    float _2878 = _2876 + 1.0;
    float _2880 = _2872 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2882 = _2418 * _2874;
    float _2884 = _2418 * _2878;
    float _2886 = _2878;
    float _2888 = _2882;
    float _2890 = _2852;
    float _2892 = _2852;
    if (!_2812)
    {
        _2886 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2894 = _2886;
    out.m_97.x = _2880;
    float _2896 = _2736 * _2874;
    float _2898 = fma(_2732, _2882, _2412);
    float _2900 = fma(_2734, _2882, _2414);
    float _2902 = _2896;
    float _2904 = _2894;
    float _2906 = _2894;
    if (!_2812)
    {
        _2888 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2908 = _2888;
    float _2910 = fma(_2418, _2896, _2416);
    float _2912 = _2908;
    float _2914 = _2908;
    if (!_2812)
    {
        _2902 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2916 = _2902;
    out.m_99.x = _2898;
    out.m_99.y = _2900;
    out.m_99.z = _2910;
    out.m_99.w = _2884;
    bool _2918 = !_2812;
    float _2920 = _2916;
    float _2922 = _2916;
    if (!_2918)
    {
        bool _2924 = _2648 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2926 = isnan(_2648);
        bool _2928 = _2924 || _2926;
        bool _2930 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2932 = _2928 || _2930;
        if (!_2932)
        {
            float _2934 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2936 = _2648 + _2934;
            float _2938 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2940 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2938;
            float _2942 = 1.0 / _2940;
            float _2944 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2946 = _2944 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2948 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2950 = _2948 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2952 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2954 = _2952 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2956 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2958 = _2956 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2960 = _2936 * _2942;
            float _2962 = precise::clamp(_2960, 0.0, 1.0);
            float _2964 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2966 = _2964 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2968 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2970 = _2968 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2972 = fma(_2962, _2946, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2974 = fma(_2962, _2966, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2976 = fma(_2962, _2970, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2978 = fma(_2962, _2950, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2980 = fma(_2962, _2954, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2982 = fma(_2962, _2958, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2850 = _2976;
            _2914 = _2980;
            _2844 = _2974;
            _2922 = _2978;
            _2892 = _2972;
            _2906 = _2982;
            _2984 = true;
        }
        else
        {
            bool _2986 = _2648 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2988 = isnan(_2648);
            bool _2990 = _2986 || _2988;
            bool _2992 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2994 = _2990 || _2992;
            if (!_2994)
            {
                _2842 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2996 = _2842;
            _2844 = _2996;
            if (!_2994)
            {
                _2848 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2998 = _2848;
            _2850 = _2998;
            if (!_2994)
            {
                _2890 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3000 = _2890;
            _2892 = _3000;
            if (!_2994)
            {
                _2920 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3002 = _2920;
            _2922 = _3002;
            if (!_2994)
            {
                _2912 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3004 = _2912;
            _2914 = _3004;
            if (!_2994)
            {
                _2904 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3006 = _2904;
            bool _3008 = !_2994;
            _2906 = _3006;
            if (!_3008)
            {
                bool _3010 = _2648 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3012 = isnan(_2648);
                bool _3014 = _3010 || _3012;
                bool _3016 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3018 = _3014 || _3016;
                if (!_3018)
                {
                    float _3020 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3022 = _2648 + _3020;
                    float _3024 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3026 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3024;
                    float _3028 = 1.0 / _3026;
                    float _3030 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3032 = _3030 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3034 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3036 = _3034 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3038 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3040 = _3038 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3042 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3044 = _3042 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3046 = _3022 * _3028;
                    float _3048 = precise::clamp(_3046, 0.0, 1.0);
                    float _3050 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3052 = _3050 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3054 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3056 = _3054 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3058 = fma(_3048, _3032, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3060 = fma(_3048, _3052, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3062 = fma(_3048, _3056, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3064 = fma(_3048, _3036, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3066 = fma(_3048, _3040, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3068 = fma(_3048, _3044, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2850 = _3062;
                    _2914 = _3066;
                    _2844 = _3060;
                    _2922 = _3064;
                    _2892 = _3058;
                    _2906 = _3068;
                    _2984 = true;
                }
                else
                {
                    _2850 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2914 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2844 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2922 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2892 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2906 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2984 = false;
    float _3070 = _2850;
    float _3072 = _2914;
    float _3074 = _2844;
    float _3076 = _2922;
    float _3078 = _2892;
    float _3080 = _2906;
    float _3082 = fma(_1664, -0.5, 0.5);
    float _3084 = precise::clamp(_3082, 0.0, 1.0);
    float _3086 = -_3070;
    float _3088 = _3086 + _3072;
    float _3090 = -_3074;
    float _3092 = _3090 + _3076;
    float _3094 = -_3078;
    float _3096 = _3094 + _3080;
    bool _3098 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3100 = fma(_3084, _3088, _3070);
    float _3102 = fma(_3084, _3092, _3074);
    float _3104 = fma(_3084, _3096, _3078);
    float _3106 = _3100 * 0.586610972881317138671875;
    out.m_101.x = 0.0;
    float _3108 = fma(_3102, 0.298911988735198974609375, _3106);
    float _3110 = fma(_3104, 0.114477999508380889892578125, _3108);
    float _3112 = -_3110;
    float _3114 = _3102 + _3112;
    float _3116 = -_3110;
    float _3118 = _3100 + _3116;
    float _3120 = -_3110;
    float _3122 = _3104 + _3120;
    float _3124 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3126 = fma(_3114, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3110);
    float _3128 = fma(_3118, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3110);
    float _3130 = fma(_3122, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3110);
    out.m_61.x = _3124;
    out.m_103.x = _3126;
    out.m_103.y = _3128;
    out.m_103.z = _3130;
    if (!_3098)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3132 = -_2181;
    float _3134 = _3132 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3136 = -_2183;
    float _3138 = _3136 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3140 = -_2187;
    float _3142 = _3140 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3144 = _3134 * _3134;
    float _3146 = fma(_3138, _3138, _3144);
    float _3148 = fma(_3142, _3142, _3146);
    float _3150 = sqrt(_3148);
    float _3152 = rsqrt(_3148);
    float _3154 = -_3150;
    float _3156 = _3154 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3158 = _3156 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3160 = precise::clamp(_3158, 0.0, 1.0);
    float _3162 = _3138 * _3152;
    float _3164 = _3134 * _3152;
    float _3166 = abs(_3160);
    float _3168 = log2(_3166);
    float _3170 = _3142 * _3152;
    float _3172 = _3162 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3174 = _1664 * _3164;
    float _3176 = -_3164;
    float _3178 = -_3172;
    float _3180 = fma(_3176, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3178);
    float _3182 = fma(_1648, _3162, _3174);
    float _3184 = -_3170;
    float _3186 = fma(_3184, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3180);
    float _3188 = fma(_1678, _3170, _3182);
    float _3190 = precise::clamp(_3188, 0.0, 1.0);
    float _3192 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3194 = _3186 + _3192;
    float _3196 = _3168 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3198 = _3194 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3200 = precise::clamp(_3198, 0.0, 1.0);
    float _3202 = exp2(_3196);
    float _3204 = _3202 * _3200;
    float _3206 = _3190 * _3204;
    float _3208 = _3206 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3210 = _3206 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3212 = _3206 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_101.x = _3208;
    out.m_101.y = _3210;
    out.m_101.z = _3212;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

