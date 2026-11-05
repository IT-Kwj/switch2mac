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
    constant _16* vp_c9 [[id(0)]];
    constant _16* vp_c15 [[id(1)]];
    constant _16* vp_c8 [[id(2)]];
    constant _16* vp_c10 [[id(3)]];
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
    float4 m_69 [[user(locn0)]];
    float4 m_81 [[user(locn1)]];
    float4 m_85 [[user(locn2)]];
    float4 m_91 [[user(locn3)]];
    float4 m_99 [[user(locn4)]];
    float4 m_61 [[user(locn5)]];
    float4 m_87 [[user(locn6)]];
    float4 m_83 [[user(locn7)]];
    float4 m_89 [[user(locn8)]];
    float4 m_79 [[user(locn9)]];
    float4 m_97 [[user(locn10)]];
    float4 m_93 [[user(locn11)]];
    float4 m_95 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_58 [[attribute(2)]];
    float4 m_63 [[attribute(3)]];
    float4 m_77 [[attribute(4)]];
    float4 m_73 [[attribute(5)]];
    float4 m_65 [[attribute(6)]];
    float4 m_67 [[attribute(7)]];
    float4 m_75 [[attribute(8)]];
    float4 m_71 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4542 = false;
    bool _3359 = false;
    bool _532 = false;
    bool _416 = false;
    bool _194 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _113 = in.m_58.w;
    float _115 = trunc(_113);
    int _118 = int(_115);
    bool _122 = _118 >= 1;
    float _124 = 0.0;
    if (!_122)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _126 = _124;
    float _128 = _126;
    if (!_122)
    {
        out.m_61.x = 0.0;
    }
    int _130 = 0;
    if (!_122)
    {
        float _132 = _126 * 5.0;
        _130 = as_type<int>(_132);
    }
    int _134 = _130;
    if (!_122)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4774 = as_type<float>(_134);
        out.gl_Position.z = _4774;
    }
    if (!_122)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _136 = in.m_63.w;
    bool _138 = _136 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _140 = isnan(_136);
    bool _142 = _138 || _140;
    bool _144 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _146 = _142 || _144;
    float _148 = -_136;
    float _150 = _148 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_146)
    {
        float _152 = float(_118);
        _128 = _152;
    }
    float _154 = _128;
    bool _156 = _150 >= _154;
    bool _158 = !_146;
    bool _160 = _156 || _158;
    float _162 = _154;
    if (_160)
    {
        _162 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _164 = _162;
    if (_160)
    {
        out.m_61.x = 0.0;
    }
    int _166 = 0;
    if (_160)
    {
        float _168 = _164 * 5.0;
        _166 = as_type<int>(_168);
    }
    int _170 = _166;
    if (_160)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4843 = as_type<float>(_170);
        out.gl_Position.z = _4843;
    }
    if (_160)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _172 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _174 = !_172;
    float _192;
    if (!_174)
    {
        float _176 = in.m_65.x;
        float _178 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _180 = _176 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _182 = fma(_180, (*spvDescriptorSet0.vp_c9)._m0[12].x, _150);
        float _184 = _182 * _178;
        float _186 = floor(_184);
        float _188 = -_186;
        float _190 = _184 + _188;
        _192 = _190;
        _194 = true;
    }
    else
    {
        float _196 = float(_118);
        float _198 = 1.0 / _196;
        float _200 = _150 * _198;
        _192 = _200;
    }
    _194 = false;
    float _202 = _192;
    float _204 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _206 = _202 + _204;
    float _208 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _210 = _202 + _208;
    float _212 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _214 = _202 + _212;
    float _216 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _218 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _216;
    float _220 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _222 = _220 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _224 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _226 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _224;
    float _228 = 1.0 / _218;
    bool _230 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _232 = 1.0 / _222;
    float _234 = 1.0 / _226;
    float _236 = _214 * _228;
    float _238 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _240 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _238;
    float _242 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _244 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _242;
    float _246 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _248 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _246;
    float _250 = _206 * _232;
    bool _252 = _202 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _254 = isnan(_202);
    bool _256 = _252 || _254;
    bool _258 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _260 = _256 || _258;
    float _262 = float(_260);
    float _264 = fma(_240, _236, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _266 = _202 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _268 = isnan(_202);
    bool _270 = _266 || _268;
    bool _272 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _274 = _270 || _272;
    float _276 = float(_274);
    float _278 = fma(_248, _236, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _280 = fma(_244, _236, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _282 = _210 * _234;
    bool _284 = _202 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _286 = isnan(_202);
    bool _288 = _284 || _286;
    bool _290 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _292 = _288 || _290;
    float _294 = float(_292);
    float _296 = -_262;
    float _298 = _296 + 1.0;
    float _300 = -_276;
    float _302 = _300 + 1.0;
    float _304 = _294 * _298;
    bool _306 = _202 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _308 = isnan(_202);
    bool _310 = _306 || _308;
    bool _312 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _314 = _310 || _312;
    float _316 = float(_314);
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _320 = _318 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _322 = -_294;
    float _324 = _322 + 1.0;
    float _326 = _316 * _302;
    float _328 = -_316;
    float _330 = _328 + 1.0;
    float _332 = _276 * _324;
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _336 = _334 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _338 = _264 * _326;
    float _340 = _278 * _326;
    float _342 = _280 * _326;
    float _344 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _346 = _344 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _348 = fma(_330, (*spvDescriptorSet0.vp_c9)._m0[143].x, _340);
    float _350 = fma(_330, (*spvDescriptorSet0.vp_c9)._m0[143].y, _342);
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _354 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _352;
    float _356 = fma(_320, _250, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _358 = fma(_336, _250, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _360 = fma(_346, _250, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _362 = fma(_330, (*spvDescriptorSet0.vp_c9)._m0[143].z, _338);
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _366 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _364;
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _370 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _368;
    float _372 = fma(_356, _332, _348);
    float _374 = fma(_354, _282, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _376 = fma(_366, _282, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _378 = fma(_370, _282, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _380 = fma(_358, _332, _350);
    float _382 = fma(_360, _332, _362);
    float _384 = fma(_374, _304, _372);
    float _386 = fma(_376, _304, _380);
    float _388 = fma(_378, _304, _382);
    float _390 = fma(_262, (*spvDescriptorSet0.vp_c9)._m0[146].x, _384);
    float _392 = fma(_262, (*spvDescriptorSet0.vp_c9)._m0[146].y, _386);
    float _394 = fma(_262, (*spvDescriptorSet0.vp_c9)._m0[146].z, _388);
    bool _396 = !_230;
    float _414;
    if (!_396)
    {
        float _398 = in.m_65.x;
        float _400 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _402 = _398 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _404 = fma(_402, (*spvDescriptorSet0.vp_c9)._m0[11].y, _150);
        float _406 = _404 * _400;
        float _408 = floor(_406);
        float _410 = -_408;
        float _412 = _406 + _410;
        _414 = _412;
        _416 = true;
    }
    else
    {
        float _418 = float(_118);
        float _420 = 1.0 / _418;
        float _422 = _150 * _420;
        _414 = _422;
    }
    _416 = false;
    float _424 = _414;
    float _426 = in.m_67.x;
    float _428 = in.m_67.y;
    float _430 = in.m_67.z;
    bool _432 = _424 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _434 = isnan(_424);
    bool _436 = _432 || _434;
    bool _438 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _440 = _436 || _438;
    float _442 = float(_440);
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _446 = _444 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _448 = _424 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _450 = isnan(_424);
    bool _452 = _448 || _450;
    bool _454 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _456 = _452 || _454;
    float _458 = float(_456);
    float _460 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _462 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _460;
    float _464 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _466 = _424 + _464;
    float _468 = 1.0 / _446;
    float _470 = -_442;
    float _472 = _470 + 1.0;
    bool _474 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _476 = _458 * _472;
    float _478 = -_458;
    float _480 = _478 + 1.0;
    float _482 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _484 = _462 * _468;
    float _486 = _394 * _430;
    float _488 = _482 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _490 = fma(_484, _466, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _492 = _490 * _476;
    float _494 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _496 = fma(_480, (*spvDescriptorSet0.vp_c9)._m0[115].x, _492);
    float _498 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _500 = _494 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _502 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[116].x, _496);
    float _504 = _392 * _428;
    float _506 = _498 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _508 = _390 * _426;
    float _510 = _502 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_69.x = _506;
    out.m_69.y = _500;
    out.m_69.z = _488;
    out.m_69.w = _510;
    bool _512 = !_474;
    float _530;
    if (!_512)
    {
        float _514 = in.m_65.x;
        float _516 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _518 = _514 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _520 = fma(_518, (*spvDescriptorSet0.vp_c9)._m0[11].w, _150);
        float _522 = _520 * _516;
        float _524 = floor(_522);
        float _526 = -_524;
        float _528 = _522 + _526;
        _530 = _528;
        _532 = true;
    }
    else
    {
        float _534 = float(_118);
        float _536 = 1.0 / _534;
        float _538 = _150 * _536;
        _530 = _538;
    }
    _532 = false;
    float _540 = _530;
    float _542 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _544 = int(_542);
    float _546 = float(_118);
    float _548 = in.m_65.x;
    float _550 = _504 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _552 = _486 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _554 = in.m_65.y;
    float _556 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _558 = int(_556);
    float _560 = in.m_65.z;
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _564 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _562;
    float _566 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _568 = in.m_71.x;
    float _570 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _572 = float(_544);
    float _574 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _576 = int(_574);
    float _578 = float(uint(_558));
    float _580 = 1.0 / _572;
    float _582 = fma(_548, (*spvDescriptorSet0.vp_c9)._m0[78].z, _566);
    float _584 = fma(_548, (*spvDescriptorSet0.vp_c9)._m0[88].z, _570);
    float _586 = 1.0 / _578;
    float _588 = float(_576);
    int _590 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _592 = _590 != 0;
    float _594 = _150 * _580;
    float _596 = 1.0 / _588;
    int _598 = as_type<int>(_586) + (-2);
    float _600 = trunc(_594);
    int _602 = int(_600);
    float _604 = in.m_65.w;
    float _606 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _608 = int(_606);
    float _610 = _150 * _596;
    int _612 = ~_558;
    int _614 = _612 + 1;
    float _616 = float(uint(_602));
    float _618 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _620 = int(_618);
    float _622 = as_type<float>(_598) * _616;
    float _624 = float(uint(_608));
    float _626 = trunc(_622);
    float _628 = precise::max(_626, 0.0);
    uint _631 = uint(_628);
    int _633 = ~_608;
    int _635 = _633 + 1;
    bool _637 = _604 > 0.5;
    float _639 = _604;
    bool _641 = _592;
    float _643 = _568;
    if (_592)
    {
        _639 = 1.0;
    }
    float _645 = _639;
    float _647 = _645;
    if (!_592)
    {
        _647 = 1.2345600128173828125;
    }
    float _649 = _647;
    float _651 = 1.0 / _624;
    float _653 = float(_620);
    int _655 = ~_608;
    int _657 = _655 + 1;
    int _659 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _661 = _659 != 0;
    float _663 = trunc(_610);
    int _665 = int(_663);
    int _667 = _614 * int(_631);
    int _669 = _667 + _602;
    int _671 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _673 = _671 != 0;
    float _675 = float(uint(_669));
    int _677 = as_type<int>(_651) + (-2);
    float _679 = 1.0 / _653;
    int _681 = 0;
    float _683 = _675;
    float _685 = _649;
    if (_673)
    {
        float _687 = -_568;
        float _689 = _687 + 1.0;
        _681 = as_type<int>(_689);
    }
    int _691 = _681;
    float _693 = float(uint(_665));
    float _695 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _697 = int(_695);
    float _699 = as_type<float>(_598) * _675;
    float _701 = _693;
    float _703 = _699;
    if (_592)
    {
        _683 = _548;
    }
    float _705 = _683;
    float _707 = as_type<float>(_677) * _693;
    float _709 = _705;
    if (_592)
    {
        _701 = 1.0;
    }
    float _711 = _701;
    float _713 = _711;
    if (!_592)
    {
        _713 = 7.345489978790283203125;
    }
    float _715 = _713;
    float _717 = trunc(_699);
    float _719 = precise::max(_717, 0.0);
    uint _721 = uint(_719);
    if (!_592)
    {
        _709 = _554;
    }
    float _723 = _709;
    float _725 = _150 * _679;
    float _727 = _715 * _548;
    float _729 = _723 * _649;
    float _731 = _723;
    if (_592)
    {
        _731 = _548;
    }
    float _733 = _731;
    float _735 = trunc(_707);
    float _737 = precise::max(_735, 0.0);
    uint _739 = uint(_737);
    float _741 = _733;
    if (_592)
    {
        _685 = 1.0;
    }
    float _743 = _685;
    float _745 = _743;
    if (!_592)
    {
        _741 = _560;
    }
    float _747 = _741;
    if (!_592)
    {
        _745 = 5.839270114898681640625;
    }
    float _749 = _745;
    float _751 = _749;
    if (_661)
    {
        bool _753 = _548 > 0.5;
        _641 = _753;
    }
    bool _755 = _641;
    float _757 = floor(_727);
    int _759 = int(_631) + int(_721);
    float _761 = _747 * _749;
    float _763 = float(_602);
    if (!_661)
    {
        _703 = _568;
    }
    float _765 = _703;
    float _767 = float(uint(_697));
    int _769 = _635 * int(_739);
    int _771 = _769 + _665;
    int _773 = ~_558;
    int _775 = _773 + 1;
    float _777 = floor(_729);
    int _779 = _771;
    float _781 = _765;
    if (!_673)
    {
        _751 = _568;
    }
    float _783 = _751;
    float _785 = float(uint(_771));
    float _787 = _783;
    if (_661)
    {
        float _789 = -_568;
        float _791 = _789 + 1.0;
        _779 = as_type<int>(_791);
    }
    int _793 = _779;
    int _795 = _775 * _759;
    int _797 = _795 + _602;
    float _799 = -_757;
    float _801 = _727 + _799;
    float _803 = float(_558);
    float _805 = as_type<float>(_677) * _785;
    if (_661)
    {
        float _807 = _755 ? as_type<float>(_793) : _568;
        _781 = _807;
    }
    float _809 = _781;
    float _811 = 1.0 / _767;
    bool _813 = uint(_797) >= uint(_558);
    bool _815 = _763 >= _803;
    bool _817 = isnan(_763);
    bool _819 = _815 || _817;
    bool _821 = isnan(_803);
    bool _823 = _819 || _821;
    float _825 = float(_823);
    bool _827 = !_813;
    int _829 = _827 ? 0 : (-1);
    float _831 = -_777;
    float _833 = _729 + _831;
    float _835 = trunc(_805);
    float _837 = precise::max(_835, 0.0);
    uint _839 = uint(_837);
    bool _841 = _560 > 0.5;
    int _843 = _558 + (-1);
    int _845 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _847 = _845 != 0;
    int _849 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _851 = _849 != 0;
    int _853 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _855 = _853 != 0;
    bool _857 = _558 == 0;
    float _859 = trunc(_825);
    int _861 = int(_859);
    if (_673)
    {
        float _863 = _841 ? as_type<float>(_691) : _568;
        _787 = _863;
    }
    float _865 = _787;
    int _867 = as_type<int>(_811) + (-2);
    int _869 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _871 = _869 != 0;
    float _873 = trunc(_725);
    int _875 = int(_873);
    int _877 = int(_739) + int(_839);
    int _879 = ~_759;
    int _881 = _879 + _829;
    int _883 = _881 + 1;
    float _885 = float(_608);
    int _887 = _657 * _877;
    int _889 = _887 + _665;
    float _891 = float(_665);
    int _893 = _558 * _883;
    int _895 = _893 + _602;
    float _897 = 1.0 / _546;
    int _899 = ~_861;
    int _901 = _899 + 1;
    int _903 = _901 + 1;
    float _905 = _885 * _833;
    bool _907 = !_851;
    int _909 = _907 ? 0 : 1;
    bool _911 = !_857;
    int _913 = _911 ? _895 : (-1);
    float _915 = float(uint(_875));
    float _917 = floor(_761);
    bool _919 = _891 >= _885;
    bool _921 = isnan(_891);
    bool _923 = _919 || _921;
    bool _925 = isnan(_885);
    bool _927 = _923 || _925;
    float _929 = float(_927);
    int _931 = _913 * _903;
    bool _933 = !_871;
    int _935 = _933 ? 0 : 1;
    float _937 = as_type<float>(_867) * _915;
    int _939 = abs(_909);
    int _941 = _861 * _843;
    int _943 = _941 + _931;
    float _945 = _801 * _803;
    float _947 = _150 * _803;
    bool _949 = uint(_889) >= uint(_608);
    float _951 = in.m_71.y;
    float _953 = trunc(_929);
    int _955 = int(_953);
    float _957 = _947 * _897;
    bool _959 = !_949;
    int _961 = _959 ? 0 : (-1);
    int _963 = _943 * _939;
    bool _965 = !_847;
    int _967 = _965 ? 0 : 1;
    float _969 = -_917;
    float _971 = _761 + _969;
    int _973 = ~_877;
    int _975 = _973 + _961;
    int _977 = _975 + 1;
    float _979 = _150 * _897;
    float _981 = trunc(_937);
    float _983 = precise::max(_981, 0.0);
    uint _985 = uint(_983);
    int _987 = abs(_935);
    int _989 = _608 * _977;
    int _991 = _989 + _665;
    int _993 = ~_697;
    int _995 = _993 + 1;
    bool _997 = _608 == 0;
    float _999 = trunc(_957);
    int _1001 = int(_999);
    int _1003 = abs(_967);
    int _1005 = ~_955;
    int _1007 = _1005 + 1;
    int _1009 = _1007 + 1;
    bool _1011 = !_997;
    int _1013 = _1011 ? _991 : (-1);
    float _1015 = trunc(_945);
    int _1017 = int(_1015);
    int _1019 = _995 * int(_985);
    int _1021 = _1019 + _875;
    int _1023 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1025 = _1023 != 0;
    int _1027 = _1009 * _1013;
    int _1029 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1031 = _1029 != 0;
    float _1033 = float(uint(_1021));
    int _1035 = _1001 * _1003;
    int _1037 = _1035 + _963;
    bool _1039 = !_855;
    int _1041 = _1039 ? 0 : 1;
    float _1043 = -_951;
    float _1045 = _1043 + 1.0;
    bool _1047 = !_1025;
    int _1049 = _1047 ? 0 : 1;
    float _1051 = as_type<float>(_867) * _1033;
    bool _1053 = _554 > 0.5;
    float _1055 = trunc(_905);
    int _1057 = int(_1055);
    bool _1059 = !_1031;
    int _1061 = _1059 ? 0 : 1;
    int _1063 = _1017 * _987;
    int _1065 = _1063 + _602;
    int _1067 = abs(_1049);
    int _1069 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1071 = _1069 != 0;
    int _1073 = _1053 ? as_type<int>(_1045) : as_type<int>(_951);
    float _1075 = trunc(_1051);
    float _1077 = precise::max(_1075, 0.0);
    uint _1079 = uint(_1077);
    int _1081 = _608 + (-1);
    int _1083 = abs(_1041);
    int _1085 = _637 ? as_type<int>(_1045) : as_type<int>(_951);
    int _1087 = _955 * _1081;
    int _1089 = _1087 + _1027;
    float _1091 = _1071 ? as_type<float>(_1073) : _951;
    int _1093 = _1065 * _1083;
    int _1095 = _1093 + _1037;
    int _1097 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1099 = _1097 != 0;
    int _1101 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1103 = _1101 != 0;
    int _1105 = _1057 * _1067;
    int _1107 = _1105 + _665;
    int _1109 = abs(_1061);
    bool _1111 = !_1103;
    int _1113 = _1111 ? 0 : 1;
    int _1115 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1117 = _1115 != 0;
    int _1119 = abs(_1113);
    float _1121 = _979 * _885;
    float _1123 = _1117 ? as_type<float>(_1085) : _951;
    float _1125 = trunc(_1121);
    int _1127 = int(_1125);
    int _1129 = int(_985) + int(_1079);
    int _1131 = _1089 * _1119;
    int _1133 = ~_697;
    int _1135 = _1133 + 1;
    int _1137 = _1017 * _1109;
    int _1139 = _1137 + _1095;
    bool _1141 = !_1099;
    int _1143 = _1141 ? 0 : 1;
    int _1145 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1147 = _1145 != 0;
    int _1149 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1151 = _1149 != 0;
    int _1153 = _1135 * _1129;
    int _1155 = _1153 + _875;
    int _1157 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1159 = _1157 != 0;
    float _1161 = float(_697);
    float _1163 = float(_875);
    int _1165 = abs(_1143);
    bool _1167 = !_1159;
    int _1169 = _1167 ? 0 : 1;
    bool _1171 = uint(_1155) >= uint(_697);
    int _1173 = _1127 * _1165;
    int _1175 = _1173 + _1131;
    bool _1177 = _1163 >= _1161;
    bool _1179 = isnan(_1163);
    bool _1181 = _1177 || _1179;
    bool _1183 = isnan(_1161);
    bool _1185 = _1181 || _1183;
    float _1187 = float(_1185);
    float _1189 = _979 * _1161;
    bool _1191 = !_1147;
    int _1193 = _1191 ? 0 : 1;
    float _1195 = _1161 * _971;
    float _1197 = float(uint(_1139));
    int _1199 = abs(_1193);
    float _1201 = trunc(_1187);
    int _1203 = int(_1201);
    bool _1205 = !_1151;
    int _1207 = _1205 ? 0 : 1;
    float _1209 = as_type<float>(_598) * _1197;
    bool _1211 = !_1171;
    int _1213 = _1211 ? 0 : (-1);
    int _1215 = abs(_1207);
    float _1217 = trunc(_1209);
    float _1219 = precise::max(_1217, 0.0);
    uint _1221 = uint(_1219);
    int _1223 = ~_1129;
    int _1225 = _1223 + _1213;
    int _1227 = _1225 + 1;
    int _1229 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1231 = _1229 != 0;
    int _1233 = _1107 * _1199;
    int _1235 = _1233 + _1175;
    int _1237 = _697 * _1227;
    int _1239 = _1237 + _875;
    int _1241 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1243 = _1241 != 0;
    int _1245 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1247 = _1245 != 0;
    float _1249 = trunc(_1189);
    int _1251 = int(_1249);
    bool _1253 = _697 == 0;
    int _1255 = _1057 * _1215;
    int _1257 = _1255 + _1235;
    int _1259 = ~_558;
    int _1261 = _1259 + 1;
    int _1263 = ~_1203;
    int _1265 = _1263 + 1;
    int _1267 = _1265 + 1;
    bool _1269 = !_1253;
    int _1271 = _1269 ? _1239 : (-1);
    bool _1273 = !_1247;
    int _1275 = _1273 ? 0 : 1;
    int _1277 = _1267 * _1271;
    bool _1279 = !_1243;
    int _1281 = _1279 ? 0 : 1;
    int _1283 = _1261 * int(_1221);
    int _1285 = _1283 + _1139;
    int _1287 = _697 + (-1);
    float _1289 = trunc(_1195);
    int _1291 = int(_1289);
    int _1293 = abs(_1275);
    float _1295 = float(uint(_1285));
    int _1297 = _1203 * _1287;
    int _1299 = _1297 + _1277;
    float _1301 = float(uint(_1257));
    int _1303 = abs(_1281);
    float _1305 = as_type<float>(_598) * _1295;
    float _1307 = as_type<float>(_677) * _1301;
    bool _1309 = !_1231;
    int _1311 = _1309 ? 0 : 1;
    int _1313 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1315 = _1313 != 0;
    int _1317 = _1299 * _1293;
    float _1319 = trunc(_1307);
    float _1321 = precise::max(_1319, 0.0);
    uint _1323 = uint(_1321);
    int _1325 = abs(_1311);
    bool _1327 = _560 > 0.5;
    int _1329 = _1251 * _1303;
    int _1331 = _1329 + _1317;
    float _1333 = float(uint(_1065));
    float _1335 = trunc(_1305);
    float _1337 = precise::max(_1335, 0.0);
    uint _1339 = uint(_1337);
    int _1341 = abs(_1169);
    int _1343 = ~_608;
    int _1345 = _1343 + 1;
    float _1347 = as_type<float>(_598) * _1333;
    float _1349 = _951;
    if (_1315)
    {
        float _1351 = _1327 ? _1045 : _951;
        _1349 = _1351;
    }
    float _1353 = _1349;
    int _1355 = _1291 * _1341;
    int _1357 = _1355 + _875;
    int _1359 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1361 = _1359 != 0;
    float _1363 = trunc(_1347);
    float _1365 = precise::max(_1363, 0.0);
    uint _1367 = uint(_1365);
    int _1369 = _1357 * _1325;
    int _1371 = _1369 + _1331;
    bool _1373 = !_1361;
    int _1375 = _1373 ? 0 : 1;
    int _1377 = ~_558;
    int _1379 = _1377 + 1;
    int _1381 = _1345 * int(_1323);
    int _1383 = _1381 + _1257;
    int _1385 = abs(_1375);
    int _1387 = int(_1221) + int(_1339);
    float _1389 = float(uint(_1107));
    int _1391 = _1291 * _1385;
    int _1393 = _1391 + _1371;
    int _1395 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1397 = _1395 != 0;
    int _1399 = _1379 * _1387;
    int _1401 = _1399 + _1139;
    float _1403 = float(uint(_1383));
    float _1405 = as_type<float>(_677) * _1389;
    int _1407 = ~_558;
    int _1409 = _1407 + 1;
    float _1411 = float(uint(_1393));
    float _1413 = as_type<float>(_677) * _1403;
    float _1415 = trunc(_1405);
    float _1417 = precise::max(_1415, 0.0);
    uint _1419 = uint(_1417);
    bool _1421 = uint(_1401) >= uint(_558);
    int _1423 = _1409 * int(_1367);
    int _1425 = _1423 + _1065;
    bool _1427 = _608 == 0;
    int _1429 = _1379;
    if (_1397)
    {
        float _1431 = -_568;
        float _1433 = _1431 + 1.0;
        _1429 = as_type<int>(_1433);
    }
    int _1435 = _1429;
    int _1437 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1439 = _1437 != 0;
    float _1441 = trunc(_1413);
    float _1443 = precise::max(_1441, 0.0);
    uint _1445 = uint(_1443);
    float _1447 = float(uint(_1425));
    bool _1449 = !_1421;
    int _1451 = _1449 ? 0 : (-1);
    if (_1397)
    {
        float _1453 = _1053 ? as_type<float>(_1435) : _568;
        _643 = _1453;
    }
    float _1455 = _643;
    float _1457 = as_type<float>(_598) * _1447;
    float _1459 = as_type<float>(_867) * _1411;
    int _1461 = ~_1387;
    int _1463 = _1461 + _1451;
    int _1465 = _1463 + 1;
    float _1467 = float(uint(_1357));
    int _1469 = _1345 * int(_1419);
    int _1471 = _1469 + _1107;
    float _1473 = trunc(_1457);
    float _1475 = precise::max(_1473, 0.0);
    uint _1477 = uint(_1475);
    int _1479 = _558 * _1465;
    int _1481 = _1479 + _1139;
    int _1483 = int(_1323) + int(_1445);
    float _1485 = as_type<float>(_867) * _1467;
    int _1487 = ~_608;
    int _1489 = _1487 + 1;
    float _1491 = float(uint(_1471));
    float _1493 = trunc(_1459);
    float _1495 = precise::max(_1493, 0.0);
    uint _1497 = uint(_1495);
    int _1499 = ~_697;
    int _1501 = _1499 + 1;
    bool _1503 = _558 == 0;
    float _1505 = as_type<float>(_677) * _1491;
    bool _1507 = !_1503;
    int _1509 = _1507 ? _1481 : (-1);
    float _1511 = trunc(_1485);
    float _1513 = precise::max(_1511, 0.0);
    uint _1515 = uint(_1513);
    int _1517 = ~_697;
    int _1519 = _1517 + 1;
    int _1521 = _1489 * _1483;
    int _1523 = _1521 + _1257;
    int _1525 = _1509 & 3;
    bool _1527 = _1525 != 0;
    int _1529 = _1509 & 3;
    bool _1531 = _1529 != 0;
    int _1533 = _1501 * int(_1497);
    int _1535 = _1533 + _1393;
    bool _1537 = uint(_1525) > 1u;
    float _1539 = trunc(_1505);
    float _1541 = precise::max(_1539, 0.0);
    uint _1543 = uint(_1541);
    int _1545 = int(_1367) + int(_1477);
    float _1547 = float(uint(_1535));
    int _1549 = _1531 ? 0 : 1;
    int _1551 = _1519 * int(_1515);
    int _1553 = _1551 + _1357;
    bool _1555 = uint(_1523) >= uint(_608);
    float _1557 = as_type<float>(_867) * _1547;
    int _1559 = ~_558;
    int _1561 = _1559 + 1;
    bool _1563 = !_1555;
    int _1565 = _1563 ? 0 : (-1);
    float _1567 = trunc(_1557);
    float _1569 = precise::max(_1567, 0.0);
    uint _1571 = uint(_1569);
    float _1573 = float(uint(_1553));
    int _1575 = ~_1483;
    int _1577 = _1575 + _1565;
    int _1579 = _1577 + 1;
    float _1581 = as_type<float>(_867) * _1573;
    int _1583 = ~_1549;
    int _1585 = _1583 + 1;
    int _1587 = _1585 + 1;
    int _1589 = _608 * _1579;
    int _1591 = _1589 + _1257;
    int _1593 = _1587;
    int _1595 = _1561;
    if (!_1537)
    {
        int _1597 = ~_1549;
        int _1599 = _1597 + 1;
        _1593 = _1599;
    }
    int _1601 = _1593;
    int _1603 = _1561 * _1545;
    int _1605 = _1603 + _1065;
    bool _1607 = _1525 != 3;
    float _1609 = trunc(_1581);
    float _1611 = precise::max(_1609, 0.0);
    uint _1613 = uint(_1611);
    bool _1615 = uint(_1525) >= 2u;
    int _1617 = ~_697;
    int _1619 = _1617 + 1;
    int _1621 = _1615 ? 0 : 1;
    bool _1623 = uint(_1605) >= uint(_558);
    int _1625 = int(_1497) + int(_1571);
    bool _1627 = !_1427;
    int _1629 = _1627 ? _1591 : (-1);
    bool _1631 = !_1623;
    int _1633 = _1631 ? 0 : (-1);
    int _1635 = _1619 * _1625;
    int _1637 = _1635 + _1393;
    int _1639 = ~_1621;
    int _1641 = _1639 + 1;
    int _1643 = _1641 + 1;
    int _1645 = _1629 & 3;
    bool _1647 = _1645 != 0;
    int _1649 = _1643;
    if (_1607)
    {
        int _1651 = ~_1621;
        int _1653 = _1651 + 1;
        _1649 = _1653;
    }
    int _1655 = _1649;
    int _1657 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1659 = _1657 != 0;
    int _1661 = _1647 ? 0 : 1;
    bool _1663 = uint(_1637) >= uint(_697);
    bool _1665 = !_1659;
    int _1667 = _1665 ? 0 : 1;
    bool _1669 = uint(_1645) >= 2u;
    bool _1671 = !_1663;
    int _1673 = _1671 ? 0 : (-1);
    int _1675 = _1669 ? 0 : 1;
    bool _1677 = _1645 != 3;
    bool _1679 = uint(_1645) > 1u;
    int _1681 = ~_1625;
    int _1683 = _1681 + _1673;
    int _1685 = _1683 + 1;
    int _1687 = int(_1419) + int(_1543);
    int _1689 = ~_608;
    int _1691 = _1689 + 1;
    int _1693 = _697 * _1685;
    int _1695 = _1693 + _1393;
    int _1697 = ~_1675;
    int _1699 = _1697 + 1;
    int _1701 = _1699 + 1;
    int _1703 = ~_1661;
    int _1705 = _1703 + 1;
    int _1707 = _1705 + 1;
    int _1709 = _1691 * _1687;
    int _1711 = _1709 + _1107;
    bool _1713 = !_1253;
    int _1715 = _1713 ? _1695 : (-1);
    int _1717 = _1701;
    int _1719 = _1707;
    if (_1677)
    {
        int _1721 = ~_1675;
        int _1723 = _1721 + 1;
        _1717 = _1723;
    }
    int _1725 = _1717;
    bool _1727 = uint(_1711) >= uint(_608);
    float _1729 = _554 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    if (!_1679)
    {
        int _1731 = ~_1661;
        int _1733 = _1731 + 1;
        _1719 = _1733;
    }
    int _1735 = _1719;
    int _1737 = _1715 & 3;
    bool _1739 = _1737 != 0;
    float _1741 = in.m_73.x;
    float _1743 = in.m_73.y;
    float _1745 = in.m_73.z;
    int _1747 = int(_1515) + int(_1613);
    bool _1749 = !_1727;
    int _1751 = _1749 ? 0 : (-1);
    int _1753 = int(_1613);
    if (_1439)
    {
        _1753 = 0;
    }
    int _1755 = _1753;
    int _1757 = _1755;
    if (_1439)
    {
        _1595 = 0;
    }
    int _1759 = _1595;
    bool _1761 = uint(_1737) >= 2u;
    int _1763 = _1759;
    if (!_1439)
    {
        _1757 = 1;
    }
    int _1765 = _1757;
    if (!_1439)
    {
        _1763 = 2;
    }
    int _1767 = _1763;
    bool _1769 = _1737 != 3;
    int _1771 = _1761 ? 0 : 1;
    int _1773 = ~_697;
    int _1775 = _1773 + 1;
    bool _1777 = uint(_1737) > 1u;
    int _1779 = _1739 ? 0 : 1;
    int _1781 = _1775 * _1747;
    int _1783 = _1781 + _1357;
    int _1785 = ~_1771;
    int _1787 = _1785 + 1;
    int _1789 = _1787 + 1;
    bool _1791 = uint(_1783) >= uint(_697);
    int _1793 = _1789;
    if (_1769)
    {
        int _1795 = ~_1771;
        int _1797 = _1795 + 1;
        _1793 = _1797;
    }
    int _1799 = _1793;
    float _1801 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1803 = _548 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1805 = ~_1779;
    int _1807 = _1805 + 1;
    int _1809 = _1807 + 1;
    int _1811 = _1809;
    if (!_1777)
    {
        int _1813 = ~_1779;
        int _1815 = _1813 + 1;
        _1811 = _1815;
    }
    int _1817 = _1811;
    float _1819 = -_1801;
    float _1821 = fma(_1803, 2.0, _1819);
    bool _1823 = !_1791;
    int _1825 = _1823 ? 0 : (-1);
    bool _1827 = _1765 != 1;
    int _1829 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1831 = _1829 != 0;
    float _1833 = in.m_58.x;
    float _1835 = in.m_58.y;
    float _1837 = in.m_58.z;
    int _1839 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _1841 = _1839 != 0;
    float _1843 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1845 = fma(_1729, -2.0, _1843);
    float _1847 = _508 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1849 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1743);
    float _1851 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1853 = 0.0;
    if (!_1827)
    {
        _1853 = _554;
    }
    float _1855 = _1853;
    float _1857 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1741);
    float _1859 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1861 = _1849 * _550;
    float _1863 = _1857 * _1847;
    float _1865 = fma(_554, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1859);
    float _1867 = 0.0;
    float _1869 = _1855;
    if (!_1827)
    {
        _1867 = _1855;
    }
    float _1871 = _1867;
    float _1873 = fma(_554, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1851);
    float _1875 = _1871;
    if (_1827)
    {
        _1869 = _554;
    }
    float _1877 = _1869;
    float _1879 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1881 = _1879 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1883 = in.m_75.x;
    float _1885 = in.m_75.y;
    float _1887 = in.m_75.z;
    float _1889 = in.m_75.w;
    float _1891 = 0.0;
    float _1893 = _1877;
    if (!_1827)
    {
        _1891 = _1871;
    }
    float _1895 = _1891;
    float _1897 = _1835 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1899 = 1.0 / _1881;
    float _1901 = 0.0;
    float _1903 = _1895;
    if (!_1827)
    {
        _1901 = _560;
    }
    float _1905 = _1901;
    float _1907 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1745);
    float _1909 = 0.0;
    float _1911 = _1905;
    if (!_1827)
    {
        _1909 = _560;
    }
    float _1913 = _1909;
    float _1915 = fma(_1833, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1897);
    float _1917 = _1913;
    if (_1827)
    {
        _1903 = _548;
    }
    float _1919 = _1903;
    float _1921 = _1907 * _552;
    if (_1827)
    {
        _1875 = _548;
    }
    float _1923 = _1875;
    float _1925 = fma(_1837, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1915);
    if (_1827)
    {
        _1911 = _1877;
    }
    float _1927 = _1911;
    float _1929 = _1835 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    if (_1827)
    {
        _1917 = _1877;
    }
    float _1931 = _1917;
    float _1933 = _1835 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _1935 = _1767 != 2;
    float _1937 = fma(_1833, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1929);
    float _1939 = _1861 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1941 = fma(_1833, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1933);
    float _1943 = _564 * _1899;
    float _1945 = fma(_1837, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1937);
    int _1947 = ~_1545;
    int _1949 = _1947 + _1633;
    int _1951 = _1949 + 1;
    float _1953 = fma(_1837, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1941);
    float _1955 = _1885 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1957 = in.m_77.x;
    float _1959 = in.m_77.y;
    float _1961 = in.m_77.z;
    float _1963 = _1885 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1965 = _1885 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1967 = fma(_1883, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1955);
    float _1969 = 0.0;
    if (_1935)
    {
        _1969 = _548;
    }
    float _1971 = _1969;
    float _1973 = fma(_1883, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1963);
    float _1975 = _1971;
    if (!_1935)
    {
        _1975 = _560;
    }
    float _1977 = _1975;
    float _1979 = fma(_1887, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1967);
    if (!_1935)
    {
        _1893 = _548;
    }
    float _1981 = _1893;
    float _1983 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1985 = _540 + _1983;
    bool _1987 = _1743 != 0.0;
    bool _1989 = isnan(_1743);
    bool _1991 = _1987 || _1989;
    bool _1993 = isnan(0.0);
    bool _1995 = _1991 || _1993;
    float _1997 = fma(_1883, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1965);
    bool _1999 = _540 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2001 = isnan(_540);
    bool _2003 = _1999 || _2001;
    bool _2005 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2007 = _2003 || _2005;
    float _2009 = float(_2007);
    float _2011 = fma(_1943, _1985, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _2013 = _1741 == 0.0;
    bool _2015 = !_1995;
    bool _2017 = _2013 && _2015;
    float _2019 = fma(_1887, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1973);
    bool _2021 = _540 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2023 = isnan(_540);
    bool _2025 = _2021 || _2023;
    bool _2027 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2029 = _2025 || _2027;
    float _2031 = float(_2029);
    float _2033 = -_2009;
    float _2035 = _2033 + 1.0;
    bool _2037 = _1745 == 0.0;
    bool _2039 = _2037 && _2017;
    float _2041 = fma(_1887, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1997);
    float _2043 = _1861 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2045 = _2031 * _2035;
    float _2047 = _1861 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2049 = -_2031;
    float _2051 = _2049 + 1.0;
    out.m_79.x = _2019;
    out.m_79.y = _2041;
    out.m_79.z = _1979;
    float _2053 = _2011 * _2045;
    float _2055 = fma(_1863, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1939);
    int _2057 = ~_1687;
    int _2059 = _2057 + _1751;
    int _2061 = _2059 + 1;
    int _2063 = _558 * _1951;
    int _2065 = _2063 + _1065;
    float _2067 = fma(_2051, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2053);
    int _2069 = ~_1747;
    int _2071 = _2069 + _1825;
    int _2073 = _2071 + 1;
    float _2075 = _1953 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2077 = _2051;
    float _2079 = _2041;
    if (_2039)
    {
        _2077 = _1961;
    }
    float _2081 = _2077;
    int _2083 = _608 * _2061;
    int _2085 = _2083 + _1107;
    int _2087 = abs(_1667);
    float _2089 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2091 = int(_2089);
    float _2093 = fma(_1863, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2043);
    float _2095 = fma(_1863, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2047);
    float _2097 = fma(_1921, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2055);
    float _2099 = _2095;
    float _2101 = _2081;
    float _2103 = _2093;
    if (_2039)
    {
        _2079 = _1959;
    }
    float _2105 = _2079;
    float _2107 = fma(_1921, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2093);
    float _2109 = fma(_1921, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2095);
    float _2111 = _2105;
    if (_2039)
    {
        _2099 = _2081;
    }
    float _2113 = _2099;
    float _2115 = _2113;
    if (!_2039)
    {
        float _2117 = fma(_1743, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1959);
        _2111 = _2117;
    }
    float _2119 = _2111;
    if (!_2039)
    {
        _2101 = _1961;
    }
    float _2121 = _2101;
    float _2123 = fma(_2009, (*spvDescriptorSet0.vp_c9)._m0[132].x, _2067);
    int _2125 = _1509 >> 31;
    float _2127 = _1887 * _1957;
    if (_2039)
    {
        _2103 = _1957;
    }
    float _2129 = _2103;
    float _2131 = _1885 * _2121;
    int _2133 = _2125 & 3;
    float _2135 = _2129;
    if (!_2039)
    {
        float _2137 = fma(_1741, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1957);
        _2135 = _2137;
    }
    float _2139 = _2135;
    if (!_2039)
    {
        float _2141 = fma(_1745, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2121);
        _2115 = _2141;
    }
    float _2143 = _2115;
    float _2145 = -_2131;
    float _2147 = fma(_1887, _1959, _2145);
    int _2149 = _1509 + _2133;
    float _2151 = _1883 * _1959;
    int _2153 = _1629 >> 31;
    float _2155 = -_2127;
    float _2157 = fma(_1883, _2121, _2155);
    int _2159 = _2149 >> 2;
    float _2161 = -_2151;
    float _2163 = fma(_1885, _1957, _2161);
    int _2165 = _1715 >> 31;
    float _2167 = _2119 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2169 = _2153 & 3;
    float _2171 = _2157 * _1889;
    int _2173 = _2159 << 4;
    int _2175 = _2173 + 368;
    float _2177 = _2163 * _1889;
    int _2179 = _2165 & 3;
    float _2181 = _2119 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    uint _2183 = uint(int(uint(_2175) >> uint(2)));
    uint _2185 = uint(int(uint(int(_2183)) >> uint(2)));
    int _2187 = int(_2183) & 3;
    float _2189 = (*spvDescriptorSet0.vp_c9)._m0[int(_2185)][_2187];
    int _2191 = int(_2183) + 1;
    uint _2193 = uint(int(uint(_2191) >> uint(2)));
    int _2195 = _2191 & 3;
    float _2197 = (*spvDescriptorSet0.vp_c9)._m0[int(_2193)][_2195];
    int _2199 = _1629 + _2169;
    float _2201 = fma(_2139, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2181);
    int _2203 = _1715 + _2179;
    float _2205 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    int _2207 = _2199 >> 2;
    float _2209 = _1977 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    int _2211 = _697 * _2073;
    int _2213 = _2211 + _1357;
    int _2215 = _2207 << 4;
    int _2217 = _2215 + 512;
    float _2219 = -_2205;
    float _2221 = fma(_2209, 2.0, _2219);
    int _2223 = _2203 >> 2;
    float _2225 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    uint _2227 = uint(int(uint(_2217) >> uint(2)));
    uint _2229 = uint(int(uint(int(_2227)) >> uint(2)));
    int _2231 = int(_2227) & 3;
    float _2233 = (*spvDescriptorSet0.vp_c9)._m0[int(_2229)][_2231];
    int _2235 = int(_2227) + 1;
    uint _2237 = uint(int(uint(_2235) >> uint(2)));
    int _2239 = _2235 & 3;
    float _2241 = (*spvDescriptorSet0.vp_c9)._m0[int(_2237)][_2239];
    int _2243 = _2223 << 4;
    int _2245 = _2243 + 656;
    float _2247 = fma(_1923, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2225);
    int _2249 = _1629 & 3;
    bool _2251 = _2249 != 0;
    float _2253 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2255 = fma(_2139, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2167);
    int _2257 = abs(_1601);
    float _2259 = _1945 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    uint _2261 = uint(int(uint(_2245) >> uint(2)));
    uint _2263 = uint(int(uint(int(_2261)) >> uint(2)));
    int _2265 = int(_2261) & 3;
    float _2267 = (*spvDescriptorSet0.vp_c9)._m0[int(_2263)][_2265];
    int _2269 = int(_2261) + 1;
    uint _2271 = uint(int(uint(_2269) >> uint(2)));
    int _2273 = _2269 & 3;
    float _2275 = (*spvDescriptorSet0.vp_c9)._m0[int(_2271)][_2273];
    bool _2277 = !_2251;
    int _2279 = _2277 ? 0 : 1;
    float _2281 = fma(_1931, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2253);
    int _2283 = _1715 & 3;
    bool _2285 = _2283 != 0;
    float _2287 = _2147 * _1889;
    float _2289 = _2119 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2291 = abs(_2279);
    float _2293 = _2107 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _2295 = _2245 + 8;
    uint _2297 = uint(int(uint(_2295) >> uint(2)));
    uint _2299 = uint(int(uint(int(_2297)) >> uint(2)));
    int _2301 = int(_2297) & 3;
    float _2303 = (*spvDescriptorSet0.vp_c9)._m0[int(_2299)][_2301];
    int _2305 = int(_2297) + 1;
    uint _2307 = uint(int(uint(_2305) >> uint(2)));
    int _2309 = _2305 & 3;
    float _2311 = (*spvDescriptorSet0.vp_c9)._m0[int(_2307)][_2309];
    bool _2313 = !_2285;
    int _2315 = _2313 ? 0 : 1;
    float _2317 = fma(_2139, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2289);
    bool _2319 = _1525 != 3;
    int _2321 = ~_2291;
    int _2323 = _2321 + 1;
    int _2325 = _2323 + 1;
    bool _2327 = !_2319;
    int _2329 = _2327 ? 0 : (-1);
    int _2331 = _2175 + 8;
    uint _2333 = uint(int(uint(_2331) >> uint(2)));
    uint _2335 = uint(int(uint(int(_2333)) >> uint(2)));
    int _2337 = int(_2333) & 3;
    float _2339 = (*spvDescriptorSet0.vp_c9)._m0[int(_2335)][_2337];
    int _2341 = int(_2333) + 1;
    uint _2343 = uint(int(uint(_2341) >> uint(2)));
    int _2345 = _2341 & 3;
    float _2347 = (*spvDescriptorSet0.vp_c9)._m0[int(_2343)][_2345];
    bool _2349 = _1645 != 3;
    float _2351 = _1927 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _2353 = ~_2257;
    int _2355 = _2353 + 1;
    int _2357 = _2355 + 1;
    bool _2359 = !_1527;
    int _2361 = _2359 ? 0 : 1;
    bool _2363 = !_2349;
    int _2365 = _2363 ? 0 : (-1);
    int _2367 = _2217 + 8;
    uint _2369 = uint(int(uint(_2367) >> uint(2)));
    uint _2371 = uint(int(uint(int(_2369)) >> uint(2)));
    int _2373 = int(_2369) & 3;
    float _2375 = (*spvDescriptorSet0.vp_c9)._m0[int(_2371)][_2373];
    int _2377 = int(_2369) + 1;
    uint _2379 = uint(int(uint(_2377) >> uint(2)));
    int _2381 = _2377 & 3;
    float _2383 = (*spvDescriptorSet0.vp_c9)._m0[int(_2379)][_2381];
    int _2385 = abs(_2361);
    int _2387 = _2357 * as_type<int>(_2197);
    int _2389 = abs(_1735);
    int _2391 = abs(_1817);
    int _2393 = ~_2389;
    int _2395 = _2393 + 1;
    int _2397 = _2395 + 1;
    int _2399 = ~_2391;
    int _2401 = _2399 + 1;
    int _2403 = _2401 + 1;
    int _2405 = ~_2385;
    int _2407 = _2405 + 1;
    int _2409 = _2407 + 1;
    bool _2411 = _1737 != 3;
    int _2413 = abs(_2329);
    int _2415 = _2397 * as_type<int>(_2241);
    int _2417 = abs(_2315);
    int _2419 = _2409 * as_type<int>(_2189);
    int _2421 = _2419 + _2387;
    int _2423 = abs(_1725);
    int _2425 = _2325 * as_type<int>(_2233);
    int _2427 = _2425 + _2415;
    int _2429 = abs(_1799);
    float _2431 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2433 = int(_2431);
    int _2435 = ~_2417;
    int _2437 = _2435 + 1;
    int _2439 = _2437 + 1;
    int _2441 = _2403 * as_type<int>(_2275);
    int _2443 = abs(_1655);
    int _2445 = ~_2429;
    int _2447 = _2445 + 1;
    int _2449 = _2447 + 1;
    int _2451 = _2439 * as_type<int>(_2267);
    int _2453 = _2451 + _2441;
    int _2455 = ~_2443;
    int _2457 = _2455 + 1;
    int _2459 = _2457 + 1;
    float _2461 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _2463 = int(_2461);
    int _2465 = abs(_2365);
    int _2467 = _2449 * as_type<int>(_2303);
    int _2469 = _2467 + _2453;
    bool _2471 = !_2411;
    int _2473 = _2471 ? 0 : (-1);
    int _2475 = ~_2423;
    int _2477 = _2475 + 1;
    int _2479 = _2477 + 1;
    int _2481 = ~_2413;
    int _2483 = _2481 + 1;
    int _2485 = _2483 + 1;
    int _2487 = _2459 * as_type<int>(_2339);
    int _2489 = _2487 + _2421;
    int _2491 = abs(_2473);
    int _2493 = _2485 * as_type<int>(_2347);
    int _2495 = _2493 + _2489;
    int _2497 = ~_2491;
    int _2499 = _2497 + 1;
    int _2501 = _2499 + 1;
    float _2503 = float(uint(_2433));
    int _2505 = _2479 * as_type<int>(_2375);
    int _2507 = _2505 + _2427;
    int _2509 = ~_2465;
    int _2511 = _2509 + 1;
    int _2513 = _2511 + 1;
    int _2515 = _2501 * as_type<int>(_2311);
    int _2517 = _2515 + _2469;
    bool _2519 = !_1831;
    int _2521 = _2519 ? 0 : 1;
    float _2523 = _2109 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2525 = float(uint(_2091));
    float _2527 = 1.0 / _2503;
    int _2529 = abs(_2521);
    float _2531 = _2097 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    int _2533 = _2513 * as_type<int>(_2383);
    int _2535 = _2533 + _2507;
    float _2537 = _2075 + _2523;
    int _2539 = ~_2087;
    int _2541 = _2539 + 1;
    int _2543 = _2541 + 1;
    float _2545 = 1.0 / _2525;
    int _2547 = ~_2529;
    int _2549 = _2547 + 1;
    int _2551 = _2549 + 1;
    bool _2553 = !_1427;
    int _2555 = _2553 ? _2085 : (-1);
    int _2557 = _2495 * _2543;
    bool _2559 = !_1841;
    int _2561 = _2559 ? 0 : 1;
    int _2563 = _2551 * _2535;
    bool _2565 = !_1503;
    int _2567 = _2565 ? _2065 : (-1);
    float _2569 = float(uint(_2463));
    int _2571 = _2555 * _2529;
    int _2573 = _2571 + _2563;
    int _2575 = abs(_2561);
    int _2577 = _2567 * _2087;
    int _2579 = _2577 + _2557;
    int _2581 = abs(_2091);
    float _2583 = _1925 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _2585 = ~_2575;
    int _2587 = _2585 + 1;
    int _2589 = _2587 + 1;
    float _2591 = 1.0 / _2569;
    int _2593 = as_type<int>(_2527) + (-2);
    float _2595 = _2583 + _2531;
    float _2597 = float(uint(_2573));
    int _2599 = _2589 * _2517;
    float _2601 = float(uint(_2581));
    float _2603 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2605 = _2595 + _2603;
    int _2607 = abs(_2433);
    float _2609 = as_type<float>(_2593) * _2597;
    int _2611 = as_type<int>(_2545) + (-2);
    float _2613 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2615 = _2537 + _2613;
    float _2617 = float(uint(_2579));
    float _2619 = 1.0 / _2601;
    bool _2621 = !_1253;
    int _2623 = _2621 ? _2213 : (-1);
    float _2625 = _2605 * _2605;
    float _2627 = float(uint(_2607));
    float _2629 = as_type<float>(_2611) * _2617;
    float _2631 = _2615 * _2615;
    int _2633 = _2623 * _2575;
    int _2635 = _2633 + _2599;
    int _2637 = as_type<int>(_2591) + (-2);
    float _2639 = trunc(_2609);
    float _2641 = precise::max(_2639, 0.0);
    uint _2643 = uint(_2641);
    float _2645 = _2625 + _2631;
    float _2647 = float(uint(_2635));
    float _2649 = _1919 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _2651 = abs(_2463);
    float _2653 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _2655 = abs(_2579);
    float _2657 = 1.0 / _2627;
    float _2659 = as_type<float>(_2637) * _2647;
    int _2661 = ~_2433;
    int _2663 = _2661 + 1;
    float _2665 = fma(_2351, -2.0, _2653);
    float _2667 = float(uint(_2651));
    int _2669 = as_type<int>(_2619) + (-2);
    float _2671 = trunc(_2629);
    float _2673 = precise::max(_2671, 0.0);
    uint _2675 = uint(_2673);
    float _2677 = float(uint(_2655));
    int _2679 = _2663 * int(_2643);
    int _2681 = _2679 + _2573;
    int _2683 = abs(_2573);
    float _2685 = as_type<float>(_2669) * _2677;
    int _2687 = ~_2091;
    int _2689 = _2687 + 1;
    float _2691 = sqrt(_2645);
    float _2693 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _2695 = as_type<int>(_2657) + (-2);
    float _2697 = float(uint(_2683));
    float _2699 = -_2693;
    float _2701 = fma(_2649, 2.0, _2699);
    float _2703 = float(uint(_2681));
    float _2705 = 1.0 / _2667;
    int _2707 = _2689 * int(_2675);
    int _2709 = _2707 + _2579;
    float _2711 = as_type<float>(_2695) * _2697;
    float _2713 = as_type<float>(_2593) * _2703;
    int _2715 = abs(_2635);
    float _2717 = float(uint(_2709));
    float _2719 = trunc(_2659);
    float _2721 = precise::max(_2719, 0.0);
    uint _2723 = uint(_2721);
    bool _2725 = _2691 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2727 = as_type<float>(_2611) * _2717;
    int _2729 = ~_2463;
    int _2731 = _2729 + 1;
    float _2733 = _1981 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _2735 = float(uint(_2715));
    float _2737 = trunc(_2685);
    float _2739 = precise::max(_2737, 0.0);
    uint _2741 = uint(_2739);
    int _2743 = as_type<int>(_2705) + (-2);
    float _2745 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _2747 = ~_2581;
    int _2749 = _2747 + 1;
    float _2751 = _2259 + _2293;
    float _2753 = as_type<float>(_2743) * _2735;
    float _2755 = fma(_2733, -2.0, _2745);
    float _2757 = trunc(_2711);
    float _2759 = precise::max(_2757, 0.0);
    uint _2761 = uint(_2759);
    int _2763 = _2731 * int(_2723);
    int _2765 = _2763 + _2635;
    float _2767 = float(uint(_2765));
    float _2769 = trunc(_2713);
    float _2771 = precise::max(_2769, 0.0);
    uint _2773 = uint(_2771);
    int _2775 = _2749 * int(_2741);
    int _2777 = _2775 + _2655;
    float _2779 = trunc(_2753);
    float _2781 = precise::max(_2779, 0.0);
    uint _2783 = uint(_2781);
    float _2785 = trunc(_2727);
    float _2787 = precise::max(_2785, 0.0);
    uint _2789 = uint(_2787);
    int _2791 = ~_2607;
    int _2793 = _2791 + 1;
    float _2795 = float(uint(_2777));
    bool _2797 = !_2725;
    float _2799 = _2751;
    float _2801 = _2625;
    float _2803 = _2631;
    float _2805 = _2537;
    float _2807 = _2595;
    if (!_2797)
    {
        float _2809 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2811 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2813 = _2691 + _2811;
        float _2815 = rsqrt(_2645);
        float _2817 = _2813 * _2809;
        float _2819 = _2751 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2821 = _2817 * 0.15915493667125701904296875;
        float _2823 = _2821 * 6.283185482025146484375;
        float _2825 = sin(_2823);
        float _2827 = _2821 * 6.283185482025146484375;
        float _2829 = cos(_2827);
        float _2831 = fma(_2825, _2819, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2833 = _2815 * _2831;
        float _2835 = _2829 + (-1.0);
        float _2837 = fma(_2605, _2833, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2839 = fma(_2615, _2833, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2841 = _2835 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2843 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2845 = _2837 + _2843;
        float _2847 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2849 = _2839 + _2847;
        float _2851 = fma(_2751, _2829, _2841);
        float _2853 = _2845 * _2845;
        float _2855 = _2849 * _2849;
        _2799 = _2851;
        _2801 = _2853;
        _2803 = _2855;
        _2805 = _2839;
        _2807 = _2837;
    }
    float _2857 = _2799;
    float _2859 = _2801;
    float _2861 = _2803;
    float _2863 = _2805;
    float _2865 = _2807;
    int _2867 = _2793 * int(_2761);
    int _2869 = _2867 + _2683;
    float _2871 = as_type<float>(_2637) * _2767;
    float _2873 = as_type<float>(_2669) * _2795;
    int _2875 = ~_2651;
    int _2877 = _2875 + 1;
    float _2879 = _2171 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2881 = _2171 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2883 = _2171 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2885 = float(uint(_2869));
    int _2887 = _2877 * int(_2783);
    int _2889 = _2887 + _2715;
    float _2891 = trunc(_2873);
    float _2893 = precise::max(_2891, 0.0);
    uint _2895 = uint(_2893);
    float _2897 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2899 = _2857 + _2897;
    int _2901 = int(_2675) + int(_2789);
    float _2903 = as_type<float>(_2695) * _2885;
    float _2905 = float(uint(_2889));
    float _2907 = fma(_2899, _2899, _2859);
    int _2909 = ~_2091;
    int _2911 = _2909 + 1;
    float _2913 = -_150;
    float _2915 = fma(_2913, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1821);
    float _2917 = trunc(_2871);
    float _2919 = precise::max(_2917, 0.0);
    uint _2921 = uint(_2919);
    float _2923 = as_type<float>(_2743) * _2905;
    int _2925 = int(_2643) + int(_2773);
    float _2927 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[77].z, _582);
    int _2929 = ~_2433;
    int _2931 = _2929 + 1;
    float _2933 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1845);
    int _2935 = ~_2581;
    int _2937 = _2935 + 1;
    float _2939 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1865);
    float _2941 = trunc(_2903);
    float _2943 = precise::max(_2941, 0.0);
    uint _2945 = uint(_2943);
    int _2947 = int(_2741) + int(_2895);
    float _2949 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[87].z, _584);
    int _2951 = ~_2463;
    int _2953 = _2951 + 1;
    float _2955 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1873);
    float _2957 = -_150;
    float _2959 = fma(_2957, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2221);
    float _2961 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2247);
    float _2963 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2281);
    float _2965 = trunc(_2923);
    float _2967 = precise::max(_2965, 0.0);
    uint _2969 = uint(_2967);
    int _2971 = int(_2723) + int(_2921);
    float _2973 = -_150;
    float _2975 = fma(_2973, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2701);
    float _2977 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2665);
    int _2979 = _2911 * _2901;
    int _2981 = _2979 + _2579;
    float _2983 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2755);
    int _2985 = _2953 * _2971;
    int _2987 = _2985 + _2635;
    int _2989 = ~_2607;
    int _2991 = _2989 + 1;
    int _2993 = _2931 * _2925;
    int _2995 = _2993 + _2573;
    int _2997 = int(_2761) + int(_2945);
    int _2999 = _2937 * _2947;
    int _3001 = _2999 + _2655;
    bool _3003 = uint(_2981) >= uint(_2091);
    float _3005 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _3007 = uint(_2987) >= uint(_2463);
    int _3009 = _2991 * _2997;
    int _3011 = _3009 + _2683;
    bool _3013 = uint(_2995) >= uint(_2433);
    float _3015 = _2907 + _2861;
    bool _3017 = uint(_3001) >= uint(_2581);
    float _3019 = fma(_2287, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2879);
    bool _3021 = !_3003;
    int _3023 = _3021 ? 0 : (-1);
    float _3025 = fma(_2287, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2881);
    bool _3027 = !_3007;
    int _3029 = _3027 ? 0 : (-1);
    float _3031 = sqrt(_3015);
    int _3033 = int(_2783) + int(_2969);
    float _3035 = fma(_2287, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2883);
    int _3037 = ~_2651;
    int _3039 = _3037 + 1;
    float _3041 = fma(_2143, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2255);
    bool _3043 = uint(_3011) >= uint(_2607);
    float _3045 = _3005 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _3047 = !_3013;
    int _3049 = _3047 ? 0 : (-1);
    int _3051 = _3039 * _3033;
    int _3053 = _3051 + _2715;
    int _3055 = ~_2901;
    int _3057 = _3055 + _3023;
    int _3059 = _3057 + 1;
    float _3061 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _3063 = ~_2971;
    int _3065 = _3063 + _3029;
    int _3067 = _3065 + 1;
    float _3069 = fma(_3045, _809, -0.5);
    int _3071 = ~_2925;
    int _3073 = _3071 + _3049;
    int _3075 = _3073 + 1;
    int _3077 = _2091 * _3059;
    int _3079 = _3077 + _2579;
    bool _3081 = _2091 == 0;
    int _3083 = _2463 * _3067;
    int _3085 = _3083 + _2635;
    bool _3087 = uint(_3053) >= uint(_2651);
    float _3089 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _3091 = _2579 ^ _2091;
    int _3093 = _2433 * _3075;
    int _3095 = _3093 + _2573;
    bool _3097 = _2433 == 0;
    float _3099 = fma(_2143, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2201);
    bool _3101 = _2091 == 0;
    bool _3103 = !_3017;
    int _3105 = _3103 ? 0 : (-1);
    float _3107 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _3109 = !_3081;
    int _3111 = _3109 ? _3079 : (-1);
    bool _3113 = _2433 == 0;
    int _3115 = _2573 ^ _2433;
    bool _3117 = !_3043;
    int _3119 = _3117 ? 0 : (-1);
    float _3121 = _3089 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _3123 = _2463 == 0;
    bool _3125 = _2463 == 0;
    float _3127 = fma(_3121, _865, -0.5);
    int _3129 = _2635 ^ _2463;
    uint _3131 = uint(int(uint(_3091) >> uint(31)));
    bool _3133 = !_3097;
    int _3135 = _3133 ? _3095 : (-1);
    float _3137 = float(_3111);
    int _3139 = ~_3105;
    int _3141 = _2947 + _3139;
    int _3143 = _3141 + 1;
    int _3145 = ~_3119;
    int _3147 = _2997 + _3145;
    int _3149 = _3147 + 1;
    float _3151 = fma(_3045, _3137, _2915);
    uint _3153 = uint(int(uint(_3115) >> uint(31)));
    float _3155 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _3157 = ~int(_3131);
    int _3159 = _3157 + 1;
    float _3161 = _3061 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _3163 = float(_3135);
    float _3165 = fma(_2927, _3069, _3151);
    bool _3167 = !_3087;
    int _3169 = _3167 ? 0 : (-1);
    float _3171 = fma(_3161, _1455, -0.5);
    uint _3173 = uint(int(uint(_3129) >> uint(31)));
    float _3175 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _3177 = !_3123;
    int _3179 = _3177 ? _3085 : (-1);
    float _3181 = fma(_3121, _3163, _2975);
    int _3183 = ~int(_3153);
    int _3185 = _3183 + 1;
    int _3187 = _3143 ^ _3159;
    float _3189 = fma(_2961, _3127, _3181);
    int _3191 = ~_3169;
    int _3193 = _3033 + _3191;
    int _3195 = _3193 + 1;
    float _3197 = _3107 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _3199 = ~int(_3173);
    int _3201 = _3199 + 1;
    float _3203 = float(_3179);
    int _3205 = _3149 ^ _3185;
    int _3207 = ~_3159;
    int _3209 = _3207 + _3187;
    int _3211 = _3209 + 1;
    float _3213 = fma(_3161, _3203, _2959);
    int _3215 = _3195 ^ _3201;
    int _3217 = ~_3185;
    int _3219 = _3217 + _3205;
    int _3221 = _3219 + 1;
    float _3223 = fma(_2949, _3171, _3213);
    bool _3225 = !_3101;
    int _3227 = _3225 ? _3211 : (-1);
    float _3229 = _3155 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _3231 = ~_3201;
    int _3233 = _3231 + _3215;
    int _3235 = _3233 + 1;
    float _3237 = _3175 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    bool _3239 = !_3113;
    int _3241 = _3239 ? _3221 : (-1);
    float _3243 = fma(_1091, _3197, -0.5);
    float _3245 = float(_3227);
    bool _3247 = !_3125;
    int _3249 = _3247 ? _3235 : (-1);
    float _3251 = float(_3241);
    float _3253 = -_2933;
    float _3255 = fma(_3197, _3245, _3253);
    float _3257 = float(_3249);
    float _3259 = fma(_1123, _3229, -0.5);
    float _3261 = fma(_3237, _1353, -0.5);
    float _3263 = -_2977;
    float _3265 = fma(_3229, _3251, _3263);
    float _3267 = fma(_2939, _3243, _3255);
    float _3269 = -_2983;
    float _3271 = fma(_3237, _3257, _3269);
    float _3273 = fma(_2963, _3259, _3265);
    float _3275 = fma(_2955, _3261, _3271);
    float _3277 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _3279 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _3281 = fma(_2177, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3019);
    float _3283 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _3285 = fma(_2177, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3025);
    float _3287 = fma(_2177, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3035);
    float _3289 = _3277 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3291 = _3279 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3293 = _3283 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3295 = _2123 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _3297 = fma(_2143, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2317);
    float _3299 = _3223 + 0.5;
    float _3301 = _3165 + 0.5;
    float _3303 = _3189 + 0.5;
    float _3305 = _3267 + 0.5;
    float _3307 = _3273 + 0.5;
    float _3309 = _3275 + 0.5;
    out.m_81.x = _3289;
    out.m_81.y = _3291;
    out.m_81.z = _3293;
    out.m_81.w = _3295;
    bool _3311 = _3031 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _3313 = isnan(_3031);
    bool _3315 = _3311 || _3313;
    bool _3317 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _3319 = _3315 || _3317;
    out.m_83.x = _3281;
    out.m_83.y = _3285;
    out.m_83.z = _3287;
    out.m_85.x = _3301;
    out.m_85.y = _3305;
    out.m_85.z = _3303;
    out.m_85.w = _3307;
    out.m_87.x = _3299;
    out.m_87.y = _3309;
    float _3321 = _3151;
    int _3323 = as_type<int>(_2865);
    if (!_3319)
    {
        _3321 = 1.0;
    }
    float _3325 = _3321;
    out.m_89.x = _3297;
    out.m_89.y = _3041;
    out.m_89.z = _3099;
    bool _3327 = !_3319;
    float _3329 = _3325;
    if (!_3327)
    {
        bool _3331 = _3031 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _3333 = isnan(_3031);
        bool _3335 = _3331 || _3333;
        bool _3337 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _3339 = _3335 || _3337;
        if (!_3339)
        {
            float _3341 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3343 = _3031 + _3341;
            float _3345 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3347 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _3345;
            float _3349 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _3351 = _3349 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _3353 = 1.0 / _3347;
            float _3355 = _3343 * _3353;
            float _3357 = fma(_3355, _3351, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _3329 = _3357;
            _3359 = true;
        }
        else
        {
            bool _3361 = _3031 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _3363 = isnan(_3031);
            bool _3365 = _3361 || _3363;
            bool _3367 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _3369 = _3365 || _3367;
            if (!_3369)
            {
                float _3371 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3373 = _3031 + _3371;
                float _3375 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3377 = _3375 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _3379 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _3381 = _3379 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _3383 = 1.0 / _3377;
                float _3385 = _3373 * _3383;
                float _3387 = fma(_3385, _3381, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _3329 = _3387;
                _3359 = true;
            }
            else
            {
                _3329 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _3359 = false;
    float _3389 = _3329;
    float _3391 = fma(_2583, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _3393 = fma(_2075, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _3395 = floor(_3391);
    float _3397 = floor(_3393);
    float _3399 = -_3395;
    float _3401 = _3391 + _3399;
    float _3403 = -_3397;
    float _3405 = _3393 + _3403;
    float2 _9624 = float2(_3401, _3405);
    float _3407 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_9624, float2(0.0), isnan(_9624)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_9624, float2(0.0), isnan(_9624)), level(0.0)).x;
    float _3409 = _2259 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3411 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _3413 = _2863 + _3411;
    float _3415 = fma(_2583, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3409);
    float _3417 = fma(_3413, _3389, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _3419 = fma(_2075, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3415);
    float _3421 = _2259 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3423 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    bool _3425 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _3427 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _3429 = _3425 || _3427;
    bool _3431 = isnan(0.5);
    bool _3433 = _3429 || _3431;
    float _3435 = _3419 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3437 = fma(_2583, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3421);
    float _3439 = _2259 + _3423;
    float _3441 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _3443 = _2857 + _3441;
    float _3445 = 1.0 / _3435;
    float _3447 = fma(_2075, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3437);
    float _3449 = _3439 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _3451 = fma(_3443, _3389, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _3453 = _3447 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3455 = fma(_2583, (*spvDescriptorSet0.vp_c15)._m0[126].x, _3449);
    float _3457 = _3453 + _3435;
    float _3459 = fma(_2075, (*spvDescriptorSet0.vp_c15)._m0[126].z, _3455);
    float _3461 = _3459 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _3463 = _3457 * _3445;
    float _3465 = _3463 * 0.5;
    float _3467 = trunc(_3461);
    int _3469 = int(_3467);
    float _3471 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3473 = fma(_3465, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3471);
    float _3475 = 1.0 / _3473;
    int _3477 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _3479 = _3469 + _3477;
    int _3481 = _3479 + 1;
    float _3483 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _3485 = _2865 + _3483;
    float _3487 = fma(_3485, _3389, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _3489 = _3389;
    float _3491 = _3485;
    int _3493 = 2;
    if (_3433)
    {
        _3489 = _3451;
    }
    float _3495 = _3489;
    float _3497 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3499 = _3475 * _3497;
    float _3501 = _3439 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _3503 = _3495;
    if (_3433)
    {
        _3491 = _3487;
    }
    float _3505 = _3491;
    bool _3507 = _3499 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _3509 = fma(_2583, (*spvDescriptorSet0.vp_c15)._m0[127].x, _3501);
    bool _3511 = _3499 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _3513 = !_3507;
    int _3515 = _3513 ? 0 : 1;
    float _3517 = fma(_2075, (*spvDescriptorSet0.vp_c15)._m0[127].z, _3509);
    float _3519 = _3517 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _3521 = _3505;
    if (!_3507)
    {
        _3493 = 1;
    }
    int _3523 = _3493;
    float _3525 = trunc(_3519);
    int _3527 = int(_3525);
    int _3529 = _3523;
    if (!_3511)
    {
        _3529 = _3515;
    }
    int _3531 = _3529;
    bool _3533 = _3481 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _3535 = _3531 << 6;
    int _3537 = _3535 + 48;
    uint _3539 = uint(int(uint(_3537) >> uint(2)));
    uint _3541 = uint(int(uint(int(_3539)) >> uint(2)));
    int _3543 = int(_3539) & 3;
    float _3545 = (*spvDescriptorSet0.vp_c15)._m0[int(_3541)][_3543];
    int _3547 = int(_3539) + 1;
    uint _3549 = uint(int(uint(_3547) >> uint(2)));
    int _3551 = _3547 & 3;
    float _3553 = (*spvDescriptorSet0.vp_c15)._m0[int(_3549)][_3551];
    int _3555 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _3557 = _3527 + _3555;
    int _3559 = _3557 + 1;
    int _3561 = _3535 + 56;
    uint _3563 = uint(int(uint(_3561) >> uint(2)));
    uint _3565 = uint(int(uint(int(_3563)) >> uint(2)));
    int _3567 = int(_3563) & 3;
    float _3569 = (*spvDescriptorSet0.vp_c15)._m0[int(_3565)][_3567];
    int _3571 = int(_3563) + 1;
    uint _3573 = uint(int(uint(_3571) >> uint(2)));
    int _3575 = _3571 & 3;
    float _3577 = (*spvDescriptorSet0.vp_c15)._m0[int(_3573)][_3575];
    int _3579 = _3481 | _3559;
    bool _3581 = _3579 < 0;
    bool _3583 = _3581 || _3533;
    int _3585 = _3535 + 64;
    uint _3587 = uint(int(uint(_3585) >> uint(2)));
    uint _3589 = uint(int(uint(int(_3587)) >> uint(2)));
    int _3591 = int(_3587) & 3;
    float _3593 = (*spvDescriptorSet0.vp_c15)._m0[int(_3589)][_3591];
    int _3595 = int(_3587) + 1;
    uint _3597 = uint(int(uint(_3595) >> uint(2)));
    int _3599 = _3595 & 3;
    float _3601 = (*spvDescriptorSet0.vp_c15)._m0[int(_3597)][_3599];
    float _3603 = as_type<float>(_3579);
    if (_3433)
    {
        _3603 = _3417;
    }
    float _3605 = _3603;
    bool _3607 = _3559 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _3609 = _3607 || _3583;
    int _3611 = _3535 + 72;
    uint _3613 = uint(int(uint(_3611) >> uint(2)));
    uint _3615 = uint(int(uint(int(_3613)) >> uint(2)));
    int _3617 = int(_3613) & 3;
    float _3619 = (*spvDescriptorSet0.vp_c15)._m0[int(_3615)][_3617];
    int _3621 = int(_3613) + 1;
    uint _3623 = uint(int(uint(_3621) >> uint(2)));
    int _3625 = _3621 & 3;
    float _3627 = (*spvDescriptorSet0.vp_c15)._m0[int(_3623)][_3625];
    int _3629 = _3535 + 96;
    uint _3631 = uint(int(uint(_3629) >> uint(2)));
    uint _3633 = uint(int(uint(int(_3631)) >> uint(2)));
    int _3635 = int(_3631) & 3;
    float _3637 = (*spvDescriptorSet0.vp_c15)._m0[int(_3633)][_3635];
    int _3639 = int(_3631) + 1;
    uint _3641 = uint(int(uint(_3639) >> uint(2)));
    int _3643 = _3639 & 3;
    float _3645 = (*spvDescriptorSet0.vp_c15)._m0[int(_3641)][_3643];
    int _3647 = _3535 + 104;
    uint _3649 = uint(int(uint(_3647) >> uint(2)));
    uint _3651 = uint(int(uint(int(_3649)) >> uint(2)));
    int _3653 = int(_3649) & 3;
    float _3655 = (*spvDescriptorSet0.vp_c15)._m0[int(_3651)][_3653];
    int _3657 = int(_3649) + 1;
    uint _3659 = uint(int(uint(_3657) >> uint(2)));
    int _3661 = _3657 & 3;
    float _3663 = (*spvDescriptorSet0.vp_c15)._m0[int(_3659)][_3661];
    float _3665 = _3605;
    if (!_3433)
    {
        float _3667 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _3669 = _2259 + _3667;
        float _3671 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _3673 = _2583 + _3671;
        float _3675 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3677 = _3669 * _3669;
        float _3679 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _3681 = _2075 + _3679;
        float _3683 = fma(_3673, _3673, _3677);
        float _3685 = -_2259;
        float _3687 = _3685 + _3451;
        float _3689 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3691 = -_2075;
        float _3693 = _3691 + _3417;
        float _3695 = fma(_3681, _3681, _3683);
        float _3697 = sqrt(_3695);
        float _3699 = _3675 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3701 = precise::min(_3697, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3703 = _3701 * _3689;
        float _3705 = _3699 * _3703;
        float _3707 = -_2583;
        float _3709 = _3707 + _3487;
        float _3711 = fma(_3687, _3705, _2259);
        float _3713 = fma(_3709, _3705, _2583);
        float _3715 = fma(_3693, _3705, _2075);
        _3503 = _3711;
        _3521 = _3713;
        _3665 = _3715;
        _3323 = as_type<int>(_3705);
    }
    float _3717 = _3503;
    float _3719 = _3521;
    float _3721 = _3665;
    int _3723 = _3323;
    float _3725 = _3439 * _3645;
    float _3727 = _3717 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    int _3729 = _3723;
    int _3731 = as_type<int>(_3727);
    if (!_3609)
    {
        int _3733 = _3559 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _3735 = _3733 + _3481;
        _3729 = _3735;
    }
    int _3737 = _3729;
    float _3739 = _3439 * _3553;
    float _3741 = fma(_2583, _3637, _3725);
    float _3743 = fma(_3719, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3727);
    float _3745 = _3439 * _3601;
    float _3747 = fma(_2583, _3545, _3739);
    float _3749 = fma(_2075, _3655, _3741);
    float _3751 = fma(_3721, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3743);
    float _3753 = fma(_2583, _3593, _3745);
    int _3755 = as_type<int>(_3741);
    float _3757 = as_type<float>(_3737);
    if (!_3609)
    {
        int _3759 = _3737 << 2;
        _3755 = _3759;
    }
    int _3761 = _3755;
    float _3763 = _3751 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3765 = _3749 + _3663;
    float _3767 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    int _3769 = _3535 + 80;
    uint _3771 = uint(int(uint(_3769) >> uint(2)));
    uint _3773 = uint(int(uint(int(_3771)) >> uint(2)));
    int _3775 = int(_3771) & 3;
    float _3777 = (*spvDescriptorSet0.vp_c15)._m0[int(_3773)][_3775];
    int _3779 = int(_3771) + 1;
    uint _3781 = uint(int(uint(_3779) >> uint(2)));
    int _3783 = _3779 & 3;
    float _3785 = (*spvDescriptorSet0.vp_c15)._m0[int(_3781)][_3783];
    float _3787 = _3763 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    int _3789 = _3761;
    int _3791 = as_type<int>(_3767);
    if (!_3609)
    {
        uint _3793 = uint(int(uint(_3737) >> uint(2)));
        _3731 = int(_3793);
    }
    int _3795 = _3731;
    float _3797 = fma(_2075, _3569, _3747);
    if (!_3609)
    {
        int _3799 = 12 & _3761;
        _3789 = _3799;
    }
    int _3801 = _3789;
    float _3803 = 1.0 / _3765;
    float _3805 = -_3787;
    float _3807 = fma(_3805, _3767, 1.0);
    float _3809 = fma(_2075, _3619, _3753);
    if (!_3609)
    {
        int _3811 = _3795 << 4;
        int _3813 = _3811 + _3801;
        _3791 = _3813;
    }
    int _3815 = _3791;
    int _3817 = _3535 + 88;
    uint _3819 = uint(int(uint(_3817) >> uint(2)));
    uint _3821 = uint(int(uint(int(_3819)) >> uint(2)));
    int _3823 = int(_3819) & 3;
    float _3825 = (*spvDescriptorSet0.vp_c15)._m0[int(_3821)][_3823];
    int _3827 = int(_3819) + 1;
    uint _3829 = uint(int(uint(_3827) >> uint(2)));
    int _3831 = _3827 & 3;
    float _3833 = (*spvDescriptorSet0.vp_c15)._m0[int(_3829)][_3831];
    float _3835 = _3797 + _3577;
    float _3837 = _3717 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3839 = _3717 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3841 = _3809 + _3627;
    float _3843 = _3717 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3845 = fma(_3719, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3837);
    float _3847 = fma(_3719, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3839);
    float _3849 = as_type<float>(_3001);
    if (!_3609)
    {
        int _3851 = _3815 + 400;
        uint _3853 = uint(int(uint(_3851) >> uint(2)));
        uint _3855 = uint(int(uint(int(_3853)) >> uint(2)));
        int _3857 = int(_3853) & 3;
        float _3859 = (*spvDescriptorSet0.vp_c15)._m0[int(_3855)][_3857];
        _3849 = _3859;
    }
    float _3861 = _3849;
    float _3863 = fma(_3719, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3843);
    float _3865 = fma(_3721, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3845);
    float _3867 = fma(_3721, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3847);
    float _3869 = _3835 * _3803;
    float _3871 = fma(_3721, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3863);
    float _3873 = _3865 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3875 = _3867 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3877 = _3841 * _3803;
    bool _3879 = _3869 >= 0.0;
    float _3881 = _3871 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3883 = _3875 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3885 = _3417;
    float _3887 = _3803;
    if (!_3609)
    {
        float _3889 = floor(_3519);
        _3885 = _3889;
    }
    float _3891 = _3885;
    bool _3893 = _3869 <= 1.0;
    bool _3895 = _3893 && _3879;
    float _3897 = _3875 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3899 = fma(_3873, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3883);
    float _3901 = _3875 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    bool _3903 = _3877 >= 0.0;
    bool _3905 = _3903 && _3895;
    float _3907 = fma(_3763, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3899);
    float _3909 = log2(_3807);
    bool _3911 = _3877 <= 1.0;
    bool _3913 = _3911 && _3905;
    float _3915 = fma(_3873, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3901);
    float _3917 = fma(_3881, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3907);
    float _3919 = fma(_3873, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3897);
    float _3921 = 1.0 / _3917;
    float _3923 = fma(_3763, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3919);
    float _3925 = _3891;
    if (!_3609)
    {
        float _3927 = -_3891;
        float _3929 = _3519 + _3927;
        _3925 = _3929;
    }
    float _3931 = _3925;
    float _3933 = _3439 * _3785;
    float _3935 = fma(_3881, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3923);
    float _3937 = _3785;
    if (_3913)
    {
        float _3939 = float(_3531);
        _3937 = _3939;
    }
    float _3941 = _3937;
    float _3943 = fma(_3763, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3915);
    float _3945 = _3835;
    if (!_3609)
    {
        float _3947 = floor(_3461);
        _3945 = _3947;
    }
    float _3949 = _3945;
    float _3951 = fma(_2583, _3777, _3933);
    float _3953 = _3909 * 0.693147182464599609375;
    float _3955 = fma(_3881, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3943);
    float _3957 = fma(_2075, _3825, _3951);
    float _3959 = _3953 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3961 = _3915;
    if (_3913)
    {
        float _3963 = rint(_3941);
        float _3965 = precise::max(_3963, 0.0);
        uint _3967 = uint(_3965);
        uint _3969 = clamp(_3967, 0u, 65535u);
        _3961 = as_type<float>(_3969);
    }
    float _3971 = _3961;
    float _3973 = _3957 + _3833;
    float _3975 = _3955 * _3921;
    float _3977 = _3935 * _3921;
    float _3979 = _3973 * _3803;
    float _3981 = fma(_3975, 0.5, 0.5);
    float _3983 = fma(_3977, -0.5, 0.5);
    float _3985 = _3923;
    float _3987 = _3979;
    if (!_3609)
    {
        float _3989 = rint(_3861);
        float _3991 = precise::max(_3989, 0.0);
        uint _3993 = uint(_3991);
        uint _3995 = clamp(_3993, 0u, 65535u);
        _3985 = as_type<float>(_3995);
    }
    float _3997 = _3985;
    float _3999 = _3949;
    if (!_3609)
    {
        float _4001 = -_3949;
        float _4003 = _3461 + _4001;
        _3999 = _4003;
    }
    float _4005 = _3999;
    float _4007 = _3877;
    if (_3913)
    {
        float3 _10649 = float3(_3869, _3877, float(as_type<int>(_3971)));
        float3 _10653 = select(_10649, float3(0.0), isnan(_10649));
        float _4009 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _10653.xy, uint(rint(_10653.z)), _3979, level(0.0));
        _4007 = _4009;
    }
    float _4011 = _4007;
    float3 _10663 = float3(_3981, _3983, _3959);
    float _4013 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_10663, float3(0.0), isnan(_10663)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_10663, float3(0.0), isnan(_10663)), level(0.0)).x;
    float3 _10672 = float3(_3981, _3983, _3959);
    float4 _4016 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_10672, float3(0.0), isnan(_10672)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_10672, float3(0.0), isnan(_10672)), level(0.0)).xyzw;
    float _4018 = _4016.x;
    float _4020 = _4016.y;
    float _4022 = _4016.z;
    float _4024 = _4016.w;
    float _4026 = _4005;
    float _4028 = _3997;
    if (!_3609)
    {
        float3 _10696 = float3(_4005, _3931, float(as_type<int>(_3997)));
        float3 _10698 = select(_10696, float3(0.0), isnan(_10696));
        float _4030 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _10698.xy, uint(rint(_10698.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _10698.xy, uint(rint(_10698.z)), level(0.0)).x;
        _4026 = _4030;
    }
    float _4032 = _4026;
    if (_3609)
    {
        _3887 = 1.0;
    }
    float _4034 = _3887;
    float _4036 = _4034;
    float _4038 = _4032;
    if (!_3609)
    {
        int _4040 = _3737 << 4;
        int _4042 = _4040 + 2048;
        uint _4044 = uint(int(uint(_4042) >> uint(2)));
        uint _4046 = uint(int(uint(int(_4044)) >> uint(2)));
        int _4048 = int(_4044) & 3;
        float _4050 = (*spvDescriptorSet0.vp_c15)._m0[int(_4046)][_4048];
        int _4052 = int(_4044) + 1;
        uint _4054 = uint(int(uint(_4052) >> uint(2)));
        int _4056 = _4052 & 3;
        float _4058 = (*spvDescriptorSet0.vp_c15)._m0[int(_4054)][_4056];
        int _4060 = _4042 + 8;
        uint _4062 = uint(int(uint(_4060) >> uint(2)));
        uint _4064 = uint(int(uint(int(_4062)) >> uint(2)));
        int _4066 = int(_4062) & 3;
        float _4068 = (*spvDescriptorSet0.vp_c15)._m0[int(_4064)][_4066];
        int _4070 = int(_4062) + 1;
        uint _4072 = uint(int(uint(_4070) >> uint(2)));
        int _4074 = _4070 & 3;
        float _4076 = (*spvDescriptorSet0.vp_c15)._m0[int(_4072)][_4074];
        float _4078 = _3439 * _4058;
        float _4080 = fma(_2583, _4050, _4078);
        float _4082 = fma(_2075, _4068, _4080);
        float _4084 = _4082 + _4076;
        float _4086 = precise::clamp(_4084, 0.0, 1.0);
        float _4088 = -_4086;
        float _4090 = _4088 + _4032;
        float _4092 = fma(_4090, 500.0, 1.5);
        float _4094 = exp2(_4092);
        float _4096 = 0.0 + _4094;
        float _4098 = precise::clamp(_4096, 0.0, 1.0);
        _3757 = as_type<float>(_4042);
        _4036 = _4098;
    }
    float _4100 = _3757;
    float _4102 = _4036;
    float _4104 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4106 = _3717 + _4104;
    float _4108 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4110 = _3719 + _4108;
    float _4112 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4114 = _3721 + _4112;
    float _4116 = _4106 * _4106;
    float _4118 = fma(_4110, _4110, _4116);
    float _4120 = fma(_4114, _4114, _4118);
    float _4122 = rsqrt(_4120);
    float _4124 = _4122 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4126 = _4110 * _4124;
    float _4128 = _4114 * _4124;
    float _4130 = _4126 * _4126;
    float _4132 = _4128 * _4128;
    float _4134 = _4130 + _4132;
    float _4136 = sqrt(_4134);
    bool _4138 = _4136 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4140 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4142 = _4136 + _4140;
    float _4144 = _4122;
    float _4146 = _4100;
    float _4148 = _4142;
    float _4150 = _4124;
    if (_4138)
    {
        float _4152 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4144 = _4152;
    }
    float _4154 = _4144;
    if (_4138)
    {
        float _4156 = rsqrt(_4134);
        _4146 = _4156;
    }
    float _4158 = _4146;
    float _4160 = _4158;
    if (_4138)
    {
        float _4162 = _4142 * _4154;
        _4148 = _4162;
    }
    float _4164 = _4148;
    if (_4138)
    {
        float _4166 = _4164 * 0.15915493667125701904296875;
        _4038 = _4166;
    }
    float _4168 = _4038;
    float _4170 = _4154;
    if (_4138)
    {
        float _4172 = _4168 * 6.283185482025146484375;
        float _4174 = sin(_4172);
        _4170 = _4174;
    }
    float _4176 = _4170;
    float _4178 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4180 = precise::max(0.0, _4178);
    float _4182 = _4114;
    float _4184 = _4180;
    if (_4138)
    {
        float _4186 = _4168 * 6.283185482025146484375;
        float _4188 = cos(_4186);
        _4182 = _4188;
    }
    float _4190 = _4182;
    float _4192 = -_4124;
    float _4194 = -_4180;
    float _4196 = fma(_4106, _4192, _4194);
    float _4198 = _4196;
    if (_4138)
    {
        float _4200 = _4196 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4184 = _4200;
    }
    float _4202 = _4184;
    float _4204 = _4176;
    float _4206 = _4202;
    if (_4138)
    {
        float _4208 = fma(_4176, _4202, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4028 = _4208;
    }
    float _4210 = _4028;
    float _4212 = _4210;
    if (!_4138)
    {
        _4204 = _4126;
    }
    float _4214 = _4204;
    float _4216 = _4214;
    if (_4138)
    {
        float _4218 = _4190 + (-1.0);
        _4206 = _4218;
    }
    float _4220 = _4206;
    float _4222 = _4220;
    if (_4138)
    {
        float _4224 = _4158 * _4210;
        _4150 = _4224;
    }
    float _4226 = _4150;
    if (!_4138)
    {
        _4212 = _4130;
    }
    float _4228 = _4212;
    float _4230 = _4228;
    if (_4138)
    {
        float _4232 = _4220 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4160 = _4232;
    }
    float _4234 = _4160;
    float _4236 = _4234;
    if (_4138)
    {
        float _4238 = _4126 * _4226;
        _4216 = _4238;
    }
    float _4240 = _4216;
    if (!_4138)
    {
        _4222 = _4128;
    }
    float _4242 = _4222;
    float _4244 = _4242;
    if (_4138)
    {
        float _4246 = _4128 * _4226;
        _4244 = _4246;
    }
    float _4248 = _4244;
    if (_4138)
    {
        float _4250 = fma(_4196, _4190, _4234);
        _4198 = _4250;
    }
    float _4252 = _4198;
    if (_4138)
    {
        float _4254 = _4240 * _4240;
        _4230 = _4254;
    }
    float _4256 = _4230;
    if (!_4138)
    {
        _4236 = _4132;
    }
    float _4258 = _4236;
    float _4260 = sqrt(_4120);
    float _4262 = _4258;
    if (_4138)
    {
        float _4264 = _4248 * _4248;
        _4262 = _4264;
    }
    float _4266 = _4262;
    float _4268 = fma(_4252, _4252, _4256);
    float _4270 = _4268 + _4266;
    float _4272 = rsqrt(_4270);
    float _4274 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4276 = fma(_4260, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4274);
    float _4278 = precise::clamp(_4276, 0.0, 1.0);
    float _4280 = -_4278;
    float _4282 = _4280 + 1.0;
    float _4284 = _4272 * _4240;
    float _4286 = abs(_4282);
    float _4288 = log2(_4286);
    float _4290 = _4272 * _4252;
    float _4292 = _4272 * _4248;
    float _4294 = _4284 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4296 = -_4294;
    float _4298 = fma(_4290, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4296);
    float _4300 = -_4292;
    float _4302 = fma(_4300, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4298);
    float _4304 = fma(_4302, -0.5, 0.5);
    float _4306 = _4288 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4308 = fma(_4302, 0.5, 0.5);
    float _4310 = _4290 + 1.0;
    float _4312 = exp2(_4306);
    float _4314 = fma(_4308, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4316 = fma(_4308, _4314, -0.212114393711090087890625);
    float _4318 = sqrt(_4304);
    float _4320 = fma(_4308, _4316, 1.570728778839111328125);
    float _4322 = -_4290;
    float _4324 = fma(_4312, _4310, _4322);
    float _4326 = fma(_4324, 0.5, 0.5);
    float _4328 = _4318 * 0.636619746685028076171875;
    float _4330 = -_4320;
    float _4332 = fma(_4328, _4330, 1.0);
    float2 _11165 = float2(_4332, _4326);
    float3 _4336 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_11165, float2(0.0), isnan(_11165)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_11165, float2(0.0), isnan(_11165)), level(0.0)).xyz;
    float _4338 = _4336.x;
    float _4340 = _4336.y;
    float _4342 = _4336.z;
    float _4344 = abs(_3499);
    float _4346 = log2(_4344);
    float _4348 = _4288 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4350 = -_3407;
    float _4352 = _4350 + 1.0;
    float _4354 = exp2(_4348);
    float _4356 = _4346 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _4358 = _3875 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4360 = fma(_3873, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4358);
    float _4362 = exp2(_4356);
    float _4364 = -_4354;
    float _4366 = _4364 + 1.0;
    float _4368 = _4366 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4370 = _4368 * _4013;
    float _4372 = fma(_4362, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4374 = precise::clamp(_4372, 0.0, 1.0);
    float _4376 = fma(_4374, -2.0, 3.0);
    float _4378 = _4374 * _4374;
    float _4380 = fma(_3763, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4360);
    bool _4382 = _3499 <= 8000.0;
    bool _4384 = isnan(_3499);
    bool _4386 = _4382 || _4384;
    bool _4388 = isnan(8000.0);
    bool _4390 = _4386 || _4388;
    float _4392 = float(_4390);
    float _4394 = _4378 * _4376;
    float _4396 = fma(_3881, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4380);
    float _4398 = -_4394;
    float _4400 = _4398 + 1.0;
    out.gl_Position.x = _3955;
    out.gl_Position.y = _3935;
    out.gl_Position.z = _4396;
    out.gl_Position.w = _3917;
    float _4402 = fma(_4400, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4394);
    float _4404 = _4396 + _3917;
    float _4406 = _4392 * _4402;
    float _4408 = _4404 * 0.5;
    float _4410 = _4404;
    if (!_3913)
    {
        _4410 = 1.0;
    }
    float _4412 = _4410;
    float _4414 = _4406 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _4416 = _4412;
    if (_3913)
    {
        bool _4418 = _4011 >= _3979;
        bool _4420 = isnan(_4011);
        bool _4422 = _4418 || _4420;
        bool _4424 = isnan(_3979);
        bool _4426 = _4422 || _4424;
        float _4428 = float(_4426);
        _4416 = _4428;
    }
    float _4430 = _4416;
    out.m_91.z = _4408;
    out.m_91.w = _3917;
    bool _4432 = _4260 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4434 = isnan(_4260);
    bool _4436 = _4432 || _4434;
    bool _4438 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4440 = _4436 || _4438;
    float _4442 = _4352 * _4414;
    float _4444 = precise::clamp(_4442, 0.0, 1.0);
    float _4446 = _4024 * _4370;
    float _4448 = _4430 * _4102;
    float _4450 = -_4368;
    float _4452 = _4450 + 1.0;
    float _4454 = -_4444;
    float _4456 = fma(_4454, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4458 = _4024 * _4452;
    float _4460 = -_4448;
    float _4462 = fma(_4460, _4456, 1.0);
    float _4464 = precise::clamp(_4462, 0.0, 1.0);
    float _4466 = _4464 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _4468 = _4452;
    float _4470 = _4464;
    if (!_4440)
    {
        _4468 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4472 = _4468;
    float _4474 = _4472;
    float _4476 = _4472;
    if (!_4440)
    {
        _3987 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4478 = _3987;
    out.m_93.x = _4466;
    float _4480 = _4478;
    float _4482 = _4478;
    if (!_4440)
    {
        _4470 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4484 = _4470;
    float _4486 = _4342 * _4370;
    float _4488 = fma(_4338, _4446, _4018);
    float _4490 = fma(_4340, _4446, _4020);
    float _4492 = fma(_4024, _4486, _4022);
    out.m_95.x = _4488;
    out.m_95.y = _4490;
    out.m_95.z = _4492;
    out.m_95.w = _4458;
    bool _4494 = !_4440;
    float _4496 = _4484;
    float _4498 = _4484;
    if (!_4494)
    {
        bool _4500 = _4260 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4502 = isnan(_4260);
        bool _4504 = _4500 || _4502;
        bool _4506 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4508 = _4504 || _4506;
        if (!_4508)
        {
            float _4510 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4512 = _4260 + _4510;
            float _4514 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4516 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4514;
            float _4518 = 1.0 / _4516;
            float _4520 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4522 = _4520 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4524 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4526 = _4524 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4528 = _4512 * _4518;
            float _4530 = precise::clamp(_4528, 0.0, 1.0);
            float _4532 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4534 = _4532 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4536 = fma(_4530, _4526, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4538 = fma(_4530, _4534, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4540 = fma(_4530, _4522, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            _4482 = _4540;
            _4476 = _4538;
            _4498 = _4536;
            _4542 = true;
        }
        else
        {
            bool _4544 = _4260 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4546 = isnan(_4260);
            bool _4548 = _4544 || _4546;
            bool _4550 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4552 = _4548 || _4550;
            if (!_4552)
            {
                _4474 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4554 = _4474;
            _4476 = _4554;
            if (!_4552)
            {
                _4480 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4556 = _4480;
            _4482 = _4556;
            if (!_4552)
            {
                _4496 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4558 = _4496;
            bool _4560 = !_4552;
            _4498 = _4558;
            if (!_4560)
            {
                bool _4562 = _4260 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4564 = isnan(_4260);
                bool _4566 = _4562 || _4564;
                bool _4568 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4570 = _4566 || _4568;
                if (!_4570)
                {
                    float _4572 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4574 = _4260 + _4572;
                    float _4576 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4578 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4576;
                    float _4580 = 1.0 / _4578;
                    float _4582 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4584 = _4582 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4586 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4588 = _4586 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4590 = _4574 * _4580;
                    float _4592 = precise::clamp(_4590, 0.0, 1.0);
                    float _4594 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4596 = _4594 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4598 = fma(_4592, _4588, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4600 = fma(_4592, _4596, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4602 = fma(_4592, _4584, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    _4482 = _4602;
                    _4476 = _4600;
                    _4498 = _4598;
                    _4542 = true;
                }
                else
                {
                    _4482 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4476 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4498 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _4542 = false;
    float _4604 = _4482;
    float _4606 = _4476;
    float _4608 = _4498;
    float _4610 = _4604 * 0.586610972881317138671875;
    bool _4612 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_61.x = 1.0;
    float _4614 = fma(_4606, 0.298911988735198974609375, _4610);
    out.m_97.x = 0.0;
    float _4616 = fma(_4608, 0.114477999508380889892578125, _4614);
    float _4618 = -_4616;
    float _4620 = _4618 + _4606;
    float _4622 = -_4616;
    float _4624 = _4622 + _4604;
    float _4626 = -_4616;
    float _4628 = _4626 + _4608;
    float _4630 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4632 = fma(_4620, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4616);
    float _4634 = fma(_4624, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4616);
    float _4636 = fma(_4628, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4616);
    out.m_93.w = _4630;
    out.m_99.x = _4632;
    out.m_99.y = _4634;
    out.m_99.z = _4636;
    if (!_4612)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _4638 = -_3717;
    float _4640 = _4638 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _4642 = -_3719;
    float _4644 = _4642 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _4646 = -_3721;
    float _4648 = _4646 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _4650 = _4640 * _4640;
    float _4652 = fma(_4644, _4644, _4650);
    float _4654 = fma(_4648, _4648, _4652);
    float _4656 = sqrt(_4654);
    float _4658 = rsqrt(_4654);
    float _4660 = -_4656;
    float _4662 = _4660 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4664 = _4662 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _4666 = precise::clamp(_4664, 0.0, 1.0);
    float _4668 = _4644 * _4658;
    float _4670 = _4640 * _4658;
    float _4672 = abs(_4666);
    float _4674 = log2(_4672);
    float _4676 = _4648 * _4658;
    float _4678 = _4668 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _4680 = _3041 * _4670;
    float _4682 = -_4670;
    float _4684 = -_4678;
    float _4686 = fma(_4682, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4684);
    float _4688 = fma(_3297, _4668, _4680);
    float _4690 = -_4676;
    float _4692 = fma(_4690, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4686);
    float _4694 = fma(_3099, _4676, _4688);
    float _4696 = precise::clamp(_4694, 0.0, 1.0);
    float _4698 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _4700 = _4692 + _4698;
    float _4702 = _4674 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _4704 = _4700 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _4706 = precise::clamp(_4704, 0.0, 1.0);
    float _4708 = exp2(_4702);
    float _4710 = _4708 * _4706;
    float _4712 = _4696 * _4710;
    float _4714 = _4712 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4716 = _4712 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4718 = _4712 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_97.x = _4714;
    out.m_97.y = _4716;
    out.m_97.z = _4718;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4542 = false;
    bool _3359 = false;
    bool _532 = false;
    bool _416 = false;
    bool _194 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _113 = in.m_58.w;
    float _115 = trunc(_113);
    int _118 = int(_115);
    bool _122 = _118 >= 1;
    float _124 = 0.0;
    if (!_122)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _126 = _124;
    float _128 = _126;
    if (!_122)
    {
        out.m_61.x = 0.0;
    }
    int _130 = 0;
    if (!_122)
    {
        float _132 = _126 * 5.0;
        _130 = as_type<int>(_132);
    }
    int _134 = _130;
    if (!_122)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4774 = as_type<float>(_134);
        out.gl_Position.z = _4774;
    }
    if (!_122)
    {
        return out;
    }
    float _136 = in.m_63.w;
    bool _138 = _136 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _140 = isnan(_136);
    bool _142 = _138 || _140;
    bool _144 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _146 = _142 || _144;
    float _148 = -_136;
    float _150 = _148 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_146)
    {
        float _152 = float(_118);
        _128 = _152;
    }
    float _154 = _128;
    bool _156 = _150 >= _154;
    bool _158 = !_146;
    bool _160 = _156 || _158;
    float _162 = _154;
    if (_160)
    {
        _162 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _164 = _162;
    if (_160)
    {
        out.m_61.x = 0.0;
    }
    int _166 = 0;
    if (_160)
    {
        float _168 = _164 * 5.0;
        _166 = as_type<int>(_168);
    }
    int _170 = _166;
    if (_160)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4843 = as_type<float>(_170);
        out.gl_Position.z = _4843;
    }
    if (_160)
    {
        return out;
    }
    bool _172 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _174 = !_172;
    float _192;
    if (!_174)
    {
        float _176 = in.m_65.x;
        float _178 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _180 = _176 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _182 = fma(_180, (*spvDescriptorSet0.vp_c9)._m0[12].x, _150);
        float _184 = _182 * _178;
        float _186 = floor(_184);
        float _188 = -_186;
        float _190 = _184 + _188;
        _192 = _190;
        _194 = true;
    }
    else
    {
        float _196 = float(_118);
        float _198 = 1.0 / _196;
        float _200 = _150 * _198;
        _192 = _200;
    }
    _194 = false;
    float _202 = _192;
    float _204 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _206 = _202 + _204;
    float _208 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _210 = _202 + _208;
    float _212 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _214 = _202 + _212;
    float _216 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _218 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _216;
    float _220 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _222 = _220 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _224 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _226 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _224;
    float _228 = 1.0 / _218;
    bool _230 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _232 = 1.0 / _222;
    float _234 = 1.0 / _226;
    float _236 = _214 * _228;
    float _238 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _240 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _238;
    float _242 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _244 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _242;
    float _246 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _248 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _246;
    float _250 = _206 * _232;
    bool _252 = _202 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _254 = isnan(_202);
    bool _256 = _252 || _254;
    bool _258 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _260 = _256 || _258;
    float _262 = float(_260);
    float _264 = fma(_240, _236, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _266 = _202 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _268 = isnan(_202);
    bool _270 = _266 || _268;
    bool _272 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _274 = _270 || _272;
    float _276 = float(_274);
    float _278 = fma(_248, _236, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _280 = fma(_244, _236, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _282 = _210 * _234;
    bool _284 = _202 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _286 = isnan(_202);
    bool _288 = _284 || _286;
    bool _290 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _292 = _288 || _290;
    float _294 = float(_292);
    float _296 = -_262;
    float _298 = _296 + 1.0;
    float _300 = -_276;
    float _302 = _300 + 1.0;
    float _304 = _294 * _298;
    bool _306 = _202 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _308 = isnan(_202);
    bool _310 = _306 || _308;
    bool _312 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _314 = _310 || _312;
    float _316 = float(_314);
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _320 = _318 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _322 = -_294;
    float _324 = _322 + 1.0;
    float _326 = _316 * _302;
    float _328 = -_316;
    float _330 = _328 + 1.0;
    float _332 = _276 * _324;
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _336 = _334 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _338 = _264 * _326;
    float _340 = _278 * _326;
    float _342 = _280 * _326;
    float _344 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _346 = _344 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _348 = fma(_330, (*spvDescriptorSet0.vp_c9)._m0[143].x, _340);
    float _350 = fma(_330, (*spvDescriptorSet0.vp_c9)._m0[143].y, _342);
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _354 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _352;
    float _356 = fma(_320, _250, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _358 = fma(_336, _250, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _360 = fma(_346, _250, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _362 = fma(_330, (*spvDescriptorSet0.vp_c9)._m0[143].z, _338);
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _366 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _364;
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _370 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _368;
    float _372 = fma(_356, _332, _348);
    float _374 = fma(_354, _282, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _376 = fma(_366, _282, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _378 = fma(_370, _282, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _380 = fma(_358, _332, _350);
    float _382 = fma(_360, _332, _362);
    float _384 = fma(_374, _304, _372);
    float _386 = fma(_376, _304, _380);
    float _388 = fma(_378, _304, _382);
    float _390 = fma(_262, (*spvDescriptorSet0.vp_c9)._m0[146].x, _384);
    float _392 = fma(_262, (*spvDescriptorSet0.vp_c9)._m0[146].y, _386);
    float _394 = fma(_262, (*spvDescriptorSet0.vp_c9)._m0[146].z, _388);
    bool _396 = !_230;
    float _414;
    if (!_396)
    {
        float _398 = in.m_65.x;
        float _400 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _402 = _398 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _404 = fma(_402, (*spvDescriptorSet0.vp_c9)._m0[11].y, _150);
        float _406 = _404 * _400;
        float _408 = floor(_406);
        float _410 = -_408;
        float _412 = _406 + _410;
        _414 = _412;
        _416 = true;
    }
    else
    {
        float _418 = float(_118);
        float _420 = 1.0 / _418;
        float _422 = _150 * _420;
        _414 = _422;
    }
    _416 = false;
    float _424 = _414;
    float _426 = in.m_67.x;
    float _428 = in.m_67.y;
    float _430 = in.m_67.z;
    bool _432 = _424 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _434 = isnan(_424);
    bool _436 = _432 || _434;
    bool _438 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _440 = _436 || _438;
    float _442 = float(_440);
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _446 = _444 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _448 = _424 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _450 = isnan(_424);
    bool _452 = _448 || _450;
    bool _454 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _456 = _452 || _454;
    float _458 = float(_456);
    float _460 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _462 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _460;
    float _464 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _466 = _424 + _464;
    float _468 = 1.0 / _446;
    float _470 = -_442;
    float _472 = _470 + 1.0;
    bool _474 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _476 = _458 * _472;
    float _478 = -_458;
    float _480 = _478 + 1.0;
    float _482 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _484 = _462 * _468;
    float _486 = _394 * _430;
    float _488 = _482 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _490 = fma(_484, _466, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _492 = _490 * _476;
    float _494 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _496 = fma(_480, (*spvDescriptorSet0.vp_c9)._m0[115].x, _492);
    float _498 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _500 = _494 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _502 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[116].x, _496);
    float _504 = _392 * _428;
    float _506 = _498 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _508 = _390 * _426;
    float _510 = _502 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_69.x = _506;
    out.m_69.y = _500;
    out.m_69.z = _488;
    out.m_69.w = _510;
    bool _512 = !_474;
    float _530;
    if (!_512)
    {
        float _514 = in.m_65.x;
        float _516 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _518 = _514 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _520 = fma(_518, (*spvDescriptorSet0.vp_c9)._m0[11].w, _150);
        float _522 = _520 * _516;
        float _524 = floor(_522);
        float _526 = -_524;
        float _528 = _522 + _526;
        _530 = _528;
        _532 = true;
    }
    else
    {
        float _534 = float(_118);
        float _536 = 1.0 / _534;
        float _538 = _150 * _536;
        _530 = _538;
    }
    _532 = false;
    float _540 = _530;
    float _542 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _544 = int(_542);
    float _546 = float(_118);
    float _548 = in.m_65.x;
    float _550 = _504 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _552 = _486 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _554 = in.m_65.y;
    float _556 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _558 = int(_556);
    float _560 = in.m_65.z;
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _564 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _562;
    float _566 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _568 = in.m_71.x;
    float _570 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _572 = float(_544);
    float _574 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _576 = int(_574);
    float _578 = float(uint(_558));
    float _580 = 1.0 / _572;
    float _582 = fma(_548, (*spvDescriptorSet0.vp_c9)._m0[78].z, _566);
    float _584 = fma(_548, (*spvDescriptorSet0.vp_c9)._m0[88].z, _570);
    float _586 = 1.0 / _578;
    float _588 = float(_576);
    int _590 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _592 = _590 != 0;
    float _594 = _150 * _580;
    float _596 = 1.0 / _588;
    int _598 = as_type<int>(_586) + (-2);
    float _600 = trunc(_594);
    int _602 = int(_600);
    float _604 = in.m_65.w;
    float _606 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _608 = int(_606);
    float _610 = _150 * _596;
    int _612 = ~_558;
    int _614 = _612 + 1;
    float _616 = float(uint(_602));
    float _618 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _620 = int(_618);
    float _622 = as_type<float>(_598) * _616;
    float _624 = float(uint(_608));
    float _626 = trunc(_622);
    float _628 = precise::max(_626, 0.0);
    uint _631 = uint(_628);
    int _633 = ~_608;
    int _635 = _633 + 1;
    bool _637 = _604 > 0.5;
    float _639 = _604;
    bool _641 = _592;
    float _643 = _568;
    if (_592)
    {
        _639 = 1.0;
    }
    float _645 = _639;
    float _647 = _645;
    if (!_592)
    {
        _647 = 1.2345600128173828125;
    }
    float _649 = _647;
    float _651 = 1.0 / _624;
    float _653 = float(_620);
    int _655 = ~_608;
    int _657 = _655 + 1;
    int _659 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _661 = _659 != 0;
    float _663 = trunc(_610);
    int _665 = int(_663);
    int _667 = _614 * int(_631);
    int _669 = _667 + _602;
    int _671 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _673 = _671 != 0;
    float _675 = float(uint(_669));
    int _677 = as_type<int>(_651) + (-2);
    float _679 = 1.0 / _653;
    int _681 = 0;
    float _683 = _675;
    float _685 = _649;
    if (_673)
    {
        float _687 = -_568;
        float _689 = _687 + 1.0;
        _681 = as_type<int>(_689);
    }
    int _691 = _681;
    float _693 = float(uint(_665));
    float _695 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _697 = int(_695);
    float _699 = as_type<float>(_598) * _675;
    float _701 = _693;
    float _703 = _699;
    if (_592)
    {
        _683 = _548;
    }
    float _705 = _683;
    float _707 = as_type<float>(_677) * _693;
    float _709 = _705;
    if (_592)
    {
        _701 = 1.0;
    }
    float _711 = _701;
    float _713 = _711;
    if (!_592)
    {
        _713 = 7.345489978790283203125;
    }
    float _715 = _713;
    float _717 = trunc(_699);
    float _719 = precise::max(_717, 0.0);
    uint _721 = uint(_719);
    if (!_592)
    {
        _709 = _554;
    }
    float _723 = _709;
    float _725 = _150 * _679;
    float _727 = _715 * _548;
    float _729 = _723 * _649;
    float _731 = _723;
    if (_592)
    {
        _731 = _548;
    }
    float _733 = _731;
    float _735 = trunc(_707);
    float _737 = precise::max(_735, 0.0);
    uint _739 = uint(_737);
    float _741 = _733;
    if (_592)
    {
        _685 = 1.0;
    }
    float _743 = _685;
    float _745 = _743;
    if (!_592)
    {
        _741 = _560;
    }
    float _747 = _741;
    if (!_592)
    {
        _745 = 5.839270114898681640625;
    }
    float _749 = _745;
    float _751 = _749;
    if (_661)
    {
        bool _753 = _548 > 0.5;
        _641 = _753;
    }
    bool _755 = _641;
    float _757 = floor(_727);
    int _759 = int(_631) + int(_721);
    float _761 = _747 * _749;
    float _763 = float(_602);
    if (!_661)
    {
        _703 = _568;
    }
    float _765 = _703;
    float _767 = float(uint(_697));
    int _769 = _635 * int(_739);
    int _771 = _769 + _665;
    int _773 = ~_558;
    int _775 = _773 + 1;
    float _777 = floor(_729);
    int _779 = _771;
    float _781 = _765;
    if (!_673)
    {
        _751 = _568;
    }
    float _783 = _751;
    float _785 = float(uint(_771));
    float _787 = _783;
    if (_661)
    {
        float _789 = -_568;
        float _791 = _789 + 1.0;
        _779 = as_type<int>(_791);
    }
    int _793 = _779;
    int _795 = _775 * _759;
    int _797 = _795 + _602;
    float _799 = -_757;
    float _801 = _727 + _799;
    float _803 = float(_558);
    float _805 = as_type<float>(_677) * _785;
    if (_661)
    {
        float _807 = _755 ? as_type<float>(_793) : _568;
        _781 = _807;
    }
    float _809 = _781;
    float _811 = 1.0 / _767;
    bool _813 = uint(_797) >= uint(_558);
    bool _815 = _763 >= _803;
    bool _817 = isnan(_763);
    bool _819 = _815 || _817;
    bool _821 = isnan(_803);
    bool _823 = _819 || _821;
    float _825 = float(_823);
    bool _827 = !_813;
    int _829 = _827 ? 0 : (-1);
    float _831 = -_777;
    float _833 = _729 + _831;
    float _835 = trunc(_805);
    float _837 = precise::max(_835, 0.0);
    uint _839 = uint(_837);
    bool _841 = _560 > 0.5;
    int _843 = _558 + (-1);
    int _845 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _847 = _845 != 0;
    int _849 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _851 = _849 != 0;
    int _853 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _855 = _853 != 0;
    bool _857 = _558 == 0;
    float _859 = trunc(_825);
    int _861 = int(_859);
    if (_673)
    {
        float _863 = _841 ? as_type<float>(_691) : _568;
        _787 = _863;
    }
    float _865 = _787;
    int _867 = as_type<int>(_811) + (-2);
    int _869 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _871 = _869 != 0;
    float _873 = trunc(_725);
    int _875 = int(_873);
    int _877 = int(_739) + int(_839);
    int _879 = ~_759;
    int _881 = _879 + _829;
    int _883 = _881 + 1;
    float _885 = float(_608);
    int _887 = _657 * _877;
    int _889 = _887 + _665;
    float _891 = float(_665);
    int _893 = _558 * _883;
    int _895 = _893 + _602;
    float _897 = 1.0 / _546;
    int _899 = ~_861;
    int _901 = _899 + 1;
    int _903 = _901 + 1;
    float _905 = _885 * _833;
    bool _907 = !_851;
    int _909 = _907 ? 0 : 1;
    bool _911 = !_857;
    int _913 = _911 ? _895 : (-1);
    float _915 = float(uint(_875));
    float _917 = floor(_761);
    bool _919 = _891 >= _885;
    bool _921 = isnan(_891);
    bool _923 = _919 || _921;
    bool _925 = isnan(_885);
    bool _927 = _923 || _925;
    float _929 = float(_927);
    int _931 = _913 * _903;
    bool _933 = !_871;
    int _935 = _933 ? 0 : 1;
    float _937 = as_type<float>(_867) * _915;
    int _939 = abs(_909);
    int _941 = _861 * _843;
    int _943 = _941 + _931;
    float _945 = _801 * _803;
    float _947 = _150 * _803;
    bool _949 = uint(_889) >= uint(_608);
    float _951 = in.m_71.y;
    float _953 = trunc(_929);
    int _955 = int(_953);
    float _957 = _947 * _897;
    bool _959 = !_949;
    int _961 = _959 ? 0 : (-1);
    int _963 = _943 * _939;
    bool _965 = !_847;
    int _967 = _965 ? 0 : 1;
    float _969 = -_917;
    float _971 = _761 + _969;
    int _973 = ~_877;
    int _975 = _973 + _961;
    int _977 = _975 + 1;
    float _979 = _150 * _897;
    float _981 = trunc(_937);
    float _983 = precise::max(_981, 0.0);
    uint _985 = uint(_983);
    int _987 = abs(_935);
    int _989 = _608 * _977;
    int _991 = _989 + _665;
    int _993 = ~_697;
    int _995 = _993 + 1;
    bool _997 = _608 == 0;
    float _999 = trunc(_957);
    int _1001 = int(_999);
    int _1003 = abs(_967);
    int _1005 = ~_955;
    int _1007 = _1005 + 1;
    int _1009 = _1007 + 1;
    bool _1011 = !_997;
    int _1013 = _1011 ? _991 : (-1);
    float _1015 = trunc(_945);
    int _1017 = int(_1015);
    int _1019 = _995 * int(_985);
    int _1021 = _1019 + _875;
    int _1023 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1025 = _1023 != 0;
    int _1027 = _1009 * _1013;
    int _1029 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1031 = _1029 != 0;
    float _1033 = float(uint(_1021));
    int _1035 = _1001 * _1003;
    int _1037 = _1035 + _963;
    bool _1039 = !_855;
    int _1041 = _1039 ? 0 : 1;
    float _1043 = -_951;
    float _1045 = _1043 + 1.0;
    bool _1047 = !_1025;
    int _1049 = _1047 ? 0 : 1;
    float _1051 = as_type<float>(_867) * _1033;
    bool _1053 = _554 > 0.5;
    float _1055 = trunc(_905);
    int _1057 = int(_1055);
    bool _1059 = !_1031;
    int _1061 = _1059 ? 0 : 1;
    int _1063 = _1017 * _987;
    int _1065 = _1063 + _602;
    int _1067 = abs(_1049);
    int _1069 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1071 = _1069 != 0;
    int _1073 = _1053 ? as_type<int>(_1045) : as_type<int>(_951);
    float _1075 = trunc(_1051);
    float _1077 = precise::max(_1075, 0.0);
    uint _1079 = uint(_1077);
    int _1081 = _608 + (-1);
    int _1083 = abs(_1041);
    int _1085 = _637 ? as_type<int>(_1045) : as_type<int>(_951);
    int _1087 = _955 * _1081;
    int _1089 = _1087 + _1027;
    float _1091 = _1071 ? as_type<float>(_1073) : _951;
    int _1093 = _1065 * _1083;
    int _1095 = _1093 + _1037;
    int _1097 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1099 = _1097 != 0;
    int _1101 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1103 = _1101 != 0;
    int _1105 = _1057 * _1067;
    int _1107 = _1105 + _665;
    int _1109 = abs(_1061);
    bool _1111 = !_1103;
    int _1113 = _1111 ? 0 : 1;
    int _1115 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1117 = _1115 != 0;
    int _1119 = abs(_1113);
    float _1121 = _979 * _885;
    float _1123 = _1117 ? as_type<float>(_1085) : _951;
    float _1125 = trunc(_1121);
    int _1127 = int(_1125);
    int _1129 = int(_985) + int(_1079);
    int _1131 = _1089 * _1119;
    int _1133 = ~_697;
    int _1135 = _1133 + 1;
    int _1137 = _1017 * _1109;
    int _1139 = _1137 + _1095;
    bool _1141 = !_1099;
    int _1143 = _1141 ? 0 : 1;
    int _1145 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1147 = _1145 != 0;
    int _1149 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1151 = _1149 != 0;
    int _1153 = _1135 * _1129;
    int _1155 = _1153 + _875;
    int _1157 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1159 = _1157 != 0;
    float _1161 = float(_697);
    float _1163 = float(_875);
    int _1165 = abs(_1143);
    bool _1167 = !_1159;
    int _1169 = _1167 ? 0 : 1;
    bool _1171 = uint(_1155) >= uint(_697);
    int _1173 = _1127 * _1165;
    int _1175 = _1173 + _1131;
    bool _1177 = _1163 >= _1161;
    bool _1179 = isnan(_1163);
    bool _1181 = _1177 || _1179;
    bool _1183 = isnan(_1161);
    bool _1185 = _1181 || _1183;
    float _1187 = float(_1185);
    float _1189 = _979 * _1161;
    bool _1191 = !_1147;
    int _1193 = _1191 ? 0 : 1;
    float _1195 = _1161 * _971;
    float _1197 = float(uint(_1139));
    int _1199 = abs(_1193);
    float _1201 = trunc(_1187);
    int _1203 = int(_1201);
    bool _1205 = !_1151;
    int _1207 = _1205 ? 0 : 1;
    float _1209 = as_type<float>(_598) * _1197;
    bool _1211 = !_1171;
    int _1213 = _1211 ? 0 : (-1);
    int _1215 = abs(_1207);
    float _1217 = trunc(_1209);
    float _1219 = precise::max(_1217, 0.0);
    uint _1221 = uint(_1219);
    int _1223 = ~_1129;
    int _1225 = _1223 + _1213;
    int _1227 = _1225 + 1;
    int _1229 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1231 = _1229 != 0;
    int _1233 = _1107 * _1199;
    int _1235 = _1233 + _1175;
    int _1237 = _697 * _1227;
    int _1239 = _1237 + _875;
    int _1241 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1243 = _1241 != 0;
    int _1245 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1247 = _1245 != 0;
    float _1249 = trunc(_1189);
    int _1251 = int(_1249);
    bool _1253 = _697 == 0;
    int _1255 = _1057 * _1215;
    int _1257 = _1255 + _1235;
    int _1259 = ~_558;
    int _1261 = _1259 + 1;
    int _1263 = ~_1203;
    int _1265 = _1263 + 1;
    int _1267 = _1265 + 1;
    bool _1269 = !_1253;
    int _1271 = _1269 ? _1239 : (-1);
    bool _1273 = !_1247;
    int _1275 = _1273 ? 0 : 1;
    int _1277 = _1267 * _1271;
    bool _1279 = !_1243;
    int _1281 = _1279 ? 0 : 1;
    int _1283 = _1261 * int(_1221);
    int _1285 = _1283 + _1139;
    int _1287 = _697 + (-1);
    float _1289 = trunc(_1195);
    int _1291 = int(_1289);
    int _1293 = abs(_1275);
    float _1295 = float(uint(_1285));
    int _1297 = _1203 * _1287;
    int _1299 = _1297 + _1277;
    float _1301 = float(uint(_1257));
    int _1303 = abs(_1281);
    float _1305 = as_type<float>(_598) * _1295;
    float _1307 = as_type<float>(_677) * _1301;
    bool _1309 = !_1231;
    int _1311 = _1309 ? 0 : 1;
    int _1313 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1315 = _1313 != 0;
    int _1317 = _1299 * _1293;
    float _1319 = trunc(_1307);
    float _1321 = precise::max(_1319, 0.0);
    uint _1323 = uint(_1321);
    int _1325 = abs(_1311);
    bool _1327 = _560 > 0.5;
    int _1329 = _1251 * _1303;
    int _1331 = _1329 + _1317;
    float _1333 = float(uint(_1065));
    float _1335 = trunc(_1305);
    float _1337 = precise::max(_1335, 0.0);
    uint _1339 = uint(_1337);
    int _1341 = abs(_1169);
    int _1343 = ~_608;
    int _1345 = _1343 + 1;
    float _1347 = as_type<float>(_598) * _1333;
    float _1349 = _951;
    if (_1315)
    {
        float _1351 = _1327 ? _1045 : _951;
        _1349 = _1351;
    }
    float _1353 = _1349;
    int _1355 = _1291 * _1341;
    int _1357 = _1355 + _875;
    int _1359 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1361 = _1359 != 0;
    float _1363 = trunc(_1347);
    float _1365 = precise::max(_1363, 0.0);
    uint _1367 = uint(_1365);
    int _1369 = _1357 * _1325;
    int _1371 = _1369 + _1331;
    bool _1373 = !_1361;
    int _1375 = _1373 ? 0 : 1;
    int _1377 = ~_558;
    int _1379 = _1377 + 1;
    int _1381 = _1345 * int(_1323);
    int _1383 = _1381 + _1257;
    int _1385 = abs(_1375);
    int _1387 = int(_1221) + int(_1339);
    float _1389 = float(uint(_1107));
    int _1391 = _1291 * _1385;
    int _1393 = _1391 + _1371;
    int _1395 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1397 = _1395 != 0;
    int _1399 = _1379 * _1387;
    int _1401 = _1399 + _1139;
    float _1403 = float(uint(_1383));
    float _1405 = as_type<float>(_677) * _1389;
    int _1407 = ~_558;
    int _1409 = _1407 + 1;
    float _1411 = float(uint(_1393));
    float _1413 = as_type<float>(_677) * _1403;
    float _1415 = trunc(_1405);
    float _1417 = precise::max(_1415, 0.0);
    uint _1419 = uint(_1417);
    bool _1421 = uint(_1401) >= uint(_558);
    int _1423 = _1409 * int(_1367);
    int _1425 = _1423 + _1065;
    bool _1427 = _608 == 0;
    int _1429 = _1379;
    if (_1397)
    {
        float _1431 = -_568;
        float _1433 = _1431 + 1.0;
        _1429 = as_type<int>(_1433);
    }
    int _1435 = _1429;
    int _1437 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1439 = _1437 != 0;
    float _1441 = trunc(_1413);
    float _1443 = precise::max(_1441, 0.0);
    uint _1445 = uint(_1443);
    float _1447 = float(uint(_1425));
    bool _1449 = !_1421;
    int _1451 = _1449 ? 0 : (-1);
    if (_1397)
    {
        float _1453 = _1053 ? as_type<float>(_1435) : _568;
        _643 = _1453;
    }
    float _1455 = _643;
    float _1457 = as_type<float>(_598) * _1447;
    float _1459 = as_type<float>(_867) * _1411;
    int _1461 = ~_1387;
    int _1463 = _1461 + _1451;
    int _1465 = _1463 + 1;
    float _1467 = float(uint(_1357));
    int _1469 = _1345 * int(_1419);
    int _1471 = _1469 + _1107;
    float _1473 = trunc(_1457);
    float _1475 = precise::max(_1473, 0.0);
    uint _1477 = uint(_1475);
    int _1479 = _558 * _1465;
    int _1481 = _1479 + _1139;
    int _1483 = int(_1323) + int(_1445);
    float _1485 = as_type<float>(_867) * _1467;
    int _1487 = ~_608;
    int _1489 = _1487 + 1;
    float _1491 = float(uint(_1471));
    float _1493 = trunc(_1459);
    float _1495 = precise::max(_1493, 0.0);
    uint _1497 = uint(_1495);
    int _1499 = ~_697;
    int _1501 = _1499 + 1;
    bool _1503 = _558 == 0;
    float _1505 = as_type<float>(_677) * _1491;
    bool _1507 = !_1503;
    int _1509 = _1507 ? _1481 : (-1);
    float _1511 = trunc(_1485);
    float _1513 = precise::max(_1511, 0.0);
    uint _1515 = uint(_1513);
    int _1517 = ~_697;
    int _1519 = _1517 + 1;
    int _1521 = _1489 * _1483;
    int _1523 = _1521 + _1257;
    int _1525 = _1509 & 3;
    bool _1527 = _1525 != 0;
    int _1529 = _1509 & 3;
    bool _1531 = _1529 != 0;
    int _1533 = _1501 * int(_1497);
    int _1535 = _1533 + _1393;
    bool _1537 = uint(_1525) > 1u;
    float _1539 = trunc(_1505);
    float _1541 = precise::max(_1539, 0.0);
    uint _1543 = uint(_1541);
    int _1545 = int(_1367) + int(_1477);
    float _1547 = float(uint(_1535));
    int _1549 = _1531 ? 0 : 1;
    int _1551 = _1519 * int(_1515);
    int _1553 = _1551 + _1357;
    bool _1555 = uint(_1523) >= uint(_608);
    float _1557 = as_type<float>(_867) * _1547;
    int _1559 = ~_558;
    int _1561 = _1559 + 1;
    bool _1563 = !_1555;
    int _1565 = _1563 ? 0 : (-1);
    float _1567 = trunc(_1557);
    float _1569 = precise::max(_1567, 0.0);
    uint _1571 = uint(_1569);
    float _1573 = float(uint(_1553));
    int _1575 = ~_1483;
    int _1577 = _1575 + _1565;
    int _1579 = _1577 + 1;
    float _1581 = as_type<float>(_867) * _1573;
    int _1583 = ~_1549;
    int _1585 = _1583 + 1;
    int _1587 = _1585 + 1;
    int _1589 = _608 * _1579;
    int _1591 = _1589 + _1257;
    int _1593 = _1587;
    int _1595 = _1561;
    if (!_1537)
    {
        int _1597 = ~_1549;
        int _1599 = _1597 + 1;
        _1593 = _1599;
    }
    int _1601 = _1593;
    int _1603 = _1561 * _1545;
    int _1605 = _1603 + _1065;
    bool _1607 = _1525 != 3;
    float _1609 = trunc(_1581);
    float _1611 = precise::max(_1609, 0.0);
    uint _1613 = uint(_1611);
    bool _1615 = uint(_1525) >= 2u;
    int _1617 = ~_697;
    int _1619 = _1617 + 1;
    int _1621 = _1615 ? 0 : 1;
    bool _1623 = uint(_1605) >= uint(_558);
    int _1625 = int(_1497) + int(_1571);
    bool _1627 = !_1427;
    int _1629 = _1627 ? _1591 : (-1);
    bool _1631 = !_1623;
    int _1633 = _1631 ? 0 : (-1);
    int _1635 = _1619 * _1625;
    int _1637 = _1635 + _1393;
    int _1639 = ~_1621;
    int _1641 = _1639 + 1;
    int _1643 = _1641 + 1;
    int _1645 = _1629 & 3;
    bool _1647 = _1645 != 0;
    int _1649 = _1643;
    if (_1607)
    {
        int _1651 = ~_1621;
        int _1653 = _1651 + 1;
        _1649 = _1653;
    }
    int _1655 = _1649;
    int _1657 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1659 = _1657 != 0;
    int _1661 = _1647 ? 0 : 1;
    bool _1663 = uint(_1637) >= uint(_697);
    bool _1665 = !_1659;
    int _1667 = _1665 ? 0 : 1;
    bool _1669 = uint(_1645) >= 2u;
    bool _1671 = !_1663;
    int _1673 = _1671 ? 0 : (-1);
    int _1675 = _1669 ? 0 : 1;
    bool _1677 = _1645 != 3;
    bool _1679 = uint(_1645) > 1u;
    int _1681 = ~_1625;
    int _1683 = _1681 + _1673;
    int _1685 = _1683 + 1;
    int _1687 = int(_1419) + int(_1543);
    int _1689 = ~_608;
    int _1691 = _1689 + 1;
    int _1693 = _697 * _1685;
    int _1695 = _1693 + _1393;
    int _1697 = ~_1675;
    int _1699 = _1697 + 1;
    int _1701 = _1699 + 1;
    int _1703 = ~_1661;
    int _1705 = _1703 + 1;
    int _1707 = _1705 + 1;
    int _1709 = _1691 * _1687;
    int _1711 = _1709 + _1107;
    bool _1713 = !_1253;
    int _1715 = _1713 ? _1695 : (-1);
    int _1717 = _1701;
    int _1719 = _1707;
    if (_1677)
    {
        int _1721 = ~_1675;
        int _1723 = _1721 + 1;
        _1717 = _1723;
    }
    int _1725 = _1717;
    bool _1727 = uint(_1711) >= uint(_608);
    float _1729 = _554 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    if (!_1679)
    {
        int _1731 = ~_1661;
        int _1733 = _1731 + 1;
        _1719 = _1733;
    }
    int _1735 = _1719;
    int _1737 = _1715 & 3;
    bool _1739 = _1737 != 0;
    float _1741 = in.m_73.x;
    float _1743 = in.m_73.y;
    float _1745 = in.m_73.z;
    int _1747 = int(_1515) + int(_1613);
    bool _1749 = !_1727;
    int _1751 = _1749 ? 0 : (-1);
    int _1753 = int(_1613);
    if (_1439)
    {
        _1753 = 0;
    }
    int _1755 = _1753;
    int _1757 = _1755;
    if (_1439)
    {
        _1595 = 0;
    }
    int _1759 = _1595;
    bool _1761 = uint(_1737) >= 2u;
    int _1763 = _1759;
    if (!_1439)
    {
        _1757 = 1;
    }
    int _1765 = _1757;
    if (!_1439)
    {
        _1763 = 2;
    }
    int _1767 = _1763;
    bool _1769 = _1737 != 3;
    int _1771 = _1761 ? 0 : 1;
    int _1773 = ~_697;
    int _1775 = _1773 + 1;
    bool _1777 = uint(_1737) > 1u;
    int _1779 = _1739 ? 0 : 1;
    int _1781 = _1775 * _1747;
    int _1783 = _1781 + _1357;
    int _1785 = ~_1771;
    int _1787 = _1785 + 1;
    int _1789 = _1787 + 1;
    bool _1791 = uint(_1783) >= uint(_697);
    int _1793 = _1789;
    if (_1769)
    {
        int _1795 = ~_1771;
        int _1797 = _1795 + 1;
        _1793 = _1797;
    }
    int _1799 = _1793;
    float _1801 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1803 = _548 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1805 = ~_1779;
    int _1807 = _1805 + 1;
    int _1809 = _1807 + 1;
    int _1811 = _1809;
    if (!_1777)
    {
        int _1813 = ~_1779;
        int _1815 = _1813 + 1;
        _1811 = _1815;
    }
    int _1817 = _1811;
    float _1819 = -_1801;
    float _1821 = fma(_1803, 2.0, _1819);
    bool _1823 = !_1791;
    int _1825 = _1823 ? 0 : (-1);
    bool _1827 = _1765 != 1;
    int _1829 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1831 = _1829 != 0;
    float _1833 = in.m_58.x;
    float _1835 = in.m_58.y;
    float _1837 = in.m_58.z;
    int _1839 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _1841 = _1839 != 0;
    float _1843 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1845 = fma(_1729, -2.0, _1843);
    float _1847 = _508 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1849 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1743);
    float _1851 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1853 = 0.0;
    if (!_1827)
    {
        _1853 = _554;
    }
    float _1855 = _1853;
    float _1857 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1741);
    float _1859 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1861 = _1849 * _550;
    float _1863 = _1857 * _1847;
    float _1865 = fma(_554, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1859);
    float _1867 = 0.0;
    float _1869 = _1855;
    if (!_1827)
    {
        _1867 = _1855;
    }
    float _1871 = _1867;
    float _1873 = fma(_554, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1851);
    float _1875 = _1871;
    if (_1827)
    {
        _1869 = _554;
    }
    float _1877 = _1869;
    float _1879 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1881 = _1879 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1883 = in.m_75.x;
    float _1885 = in.m_75.y;
    float _1887 = in.m_75.z;
    float _1889 = in.m_75.w;
    float _1891 = 0.0;
    float _1893 = _1877;
    if (!_1827)
    {
        _1891 = _1871;
    }
    float _1895 = _1891;
    float _1897 = _1835 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1899 = 1.0 / _1881;
    float _1901 = 0.0;
    float _1903 = _1895;
    if (!_1827)
    {
        _1901 = _560;
    }
    float _1905 = _1901;
    float _1907 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1745);
    float _1909 = 0.0;
    float _1911 = _1905;
    if (!_1827)
    {
        _1909 = _560;
    }
    float _1913 = _1909;
    float _1915 = fma(_1833, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1897);
    float _1917 = _1913;
    if (_1827)
    {
        _1903 = _548;
    }
    float _1919 = _1903;
    float _1921 = _1907 * _552;
    if (_1827)
    {
        _1875 = _548;
    }
    float _1923 = _1875;
    float _1925 = fma(_1837, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1915);
    if (_1827)
    {
        _1911 = _1877;
    }
    float _1927 = _1911;
    float _1929 = _1835 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    if (_1827)
    {
        _1917 = _1877;
    }
    float _1931 = _1917;
    float _1933 = _1835 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _1935 = _1767 != 2;
    float _1937 = fma(_1833, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1929);
    float _1939 = _1861 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1941 = fma(_1833, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1933);
    float _1943 = _564 * _1899;
    float _1945 = fma(_1837, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1937);
    int _1947 = ~_1545;
    int _1949 = _1947 + _1633;
    int _1951 = _1949 + 1;
    float _1953 = fma(_1837, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1941);
    float _1955 = _1885 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1957 = in.m_77.x;
    float _1959 = in.m_77.y;
    float _1961 = in.m_77.z;
    float _1963 = _1885 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1965 = _1885 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1967 = fma(_1883, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1955);
    float _1969 = 0.0;
    if (_1935)
    {
        _1969 = _548;
    }
    float _1971 = _1969;
    float _1973 = fma(_1883, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1963);
    float _1975 = _1971;
    if (!_1935)
    {
        _1975 = _560;
    }
    float _1977 = _1975;
    float _1979 = fma(_1887, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1967);
    if (!_1935)
    {
        _1893 = _548;
    }
    float _1981 = _1893;
    float _1983 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1985 = _540 + _1983;
    bool _1987 = _1743 != 0.0;
    bool _1989 = isnan(_1743);
    bool _1991 = _1987 || _1989;
    bool _1993 = isnan(0.0);
    bool _1995 = _1991 || _1993;
    float _1997 = fma(_1883, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1965);
    bool _1999 = _540 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2001 = isnan(_540);
    bool _2003 = _1999 || _2001;
    bool _2005 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2007 = _2003 || _2005;
    float _2009 = float(_2007);
    float _2011 = fma(_1943, _1985, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _2013 = _1741 == 0.0;
    bool _2015 = !_1995;
    bool _2017 = _2013 && _2015;
    float _2019 = fma(_1887, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1973);
    bool _2021 = _540 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2023 = isnan(_540);
    bool _2025 = _2021 || _2023;
    bool _2027 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2029 = _2025 || _2027;
    float _2031 = float(_2029);
    float _2033 = -_2009;
    float _2035 = _2033 + 1.0;
    bool _2037 = _1745 == 0.0;
    bool _2039 = _2037 && _2017;
    float _2041 = fma(_1887, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1997);
    float _2043 = _1861 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2045 = _2031 * _2035;
    float _2047 = _1861 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2049 = -_2031;
    float _2051 = _2049 + 1.0;
    out.m_79.x = _2019;
    out.m_79.y = _2041;
    out.m_79.z = _1979;
    float _2053 = _2011 * _2045;
    float _2055 = fma(_1863, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1939);
    int _2057 = ~_1687;
    int _2059 = _2057 + _1751;
    int _2061 = _2059 + 1;
    int _2063 = _558 * _1951;
    int _2065 = _2063 + _1065;
    float _2067 = fma(_2051, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2053);
    int _2069 = ~_1747;
    int _2071 = _2069 + _1825;
    int _2073 = _2071 + 1;
    float _2075 = _1953 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2077 = _2051;
    float _2079 = _2041;
    if (_2039)
    {
        _2077 = _1961;
    }
    float _2081 = _2077;
    int _2083 = _608 * _2061;
    int _2085 = _2083 + _1107;
    int _2087 = abs(_1667);
    float _2089 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2091 = int(_2089);
    float _2093 = fma(_1863, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2043);
    float _2095 = fma(_1863, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2047);
    float _2097 = fma(_1921, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2055);
    float _2099 = _2095;
    float _2101 = _2081;
    float _2103 = _2093;
    if (_2039)
    {
        _2079 = _1959;
    }
    float _2105 = _2079;
    float _2107 = fma(_1921, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2093);
    float _2109 = fma(_1921, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2095);
    float _2111 = _2105;
    if (_2039)
    {
        _2099 = _2081;
    }
    float _2113 = _2099;
    float _2115 = _2113;
    if (!_2039)
    {
        float _2117 = fma(_1743, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1959);
        _2111 = _2117;
    }
    float _2119 = _2111;
    if (!_2039)
    {
        _2101 = _1961;
    }
    float _2121 = _2101;
    float _2123 = fma(_2009, (*spvDescriptorSet0.vp_c9)._m0[132].x, _2067);
    int _2125 = _1509 >> 31;
    float _2127 = _1887 * _1957;
    if (_2039)
    {
        _2103 = _1957;
    }
    float _2129 = _2103;
    float _2131 = _1885 * _2121;
    int _2133 = _2125 & 3;
    float _2135 = _2129;
    if (!_2039)
    {
        float _2137 = fma(_1741, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1957);
        _2135 = _2137;
    }
    float _2139 = _2135;
    if (!_2039)
    {
        float _2141 = fma(_1745, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2121);
        _2115 = _2141;
    }
    float _2143 = _2115;
    float _2145 = -_2131;
    float _2147 = fma(_1887, _1959, _2145);
    int _2149 = _1509 + _2133;
    float _2151 = _1883 * _1959;
    int _2153 = _1629 >> 31;
    float _2155 = -_2127;
    float _2157 = fma(_1883, _2121, _2155);
    int _2159 = _2149 >> 2;
    float _2161 = -_2151;
    float _2163 = fma(_1885, _1957, _2161);
    int _2165 = _1715 >> 31;
    float _2167 = _2119 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2169 = _2153 & 3;
    float _2171 = _2157 * _1889;
    int _2173 = _2159 << 4;
    int _2175 = _2173 + 368;
    float _2177 = _2163 * _1889;
    int _2179 = _2165 & 3;
    float _2181 = _2119 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    uint _2183 = uint(int(uint(_2175) >> uint(2)));
    uint _2185 = uint(int(uint(int(_2183)) >> uint(2)));
    int _2187 = int(_2183) & 3;
    float _2189 = (*spvDescriptorSet0.vp_c9)._m0[int(_2185)][_2187];
    int _2191 = int(_2183) + 1;
    uint _2193 = uint(int(uint(_2191) >> uint(2)));
    int _2195 = _2191 & 3;
    float _2197 = (*spvDescriptorSet0.vp_c9)._m0[int(_2193)][_2195];
    int _2199 = _1629 + _2169;
    float _2201 = fma(_2139, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2181);
    int _2203 = _1715 + _2179;
    float _2205 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    int _2207 = _2199 >> 2;
    float _2209 = _1977 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    int _2211 = _697 * _2073;
    int _2213 = _2211 + _1357;
    int _2215 = _2207 << 4;
    int _2217 = _2215 + 512;
    float _2219 = -_2205;
    float _2221 = fma(_2209, 2.0, _2219);
    int _2223 = _2203 >> 2;
    float _2225 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    uint _2227 = uint(int(uint(_2217) >> uint(2)));
    uint _2229 = uint(int(uint(int(_2227)) >> uint(2)));
    int _2231 = int(_2227) & 3;
    float _2233 = (*spvDescriptorSet0.vp_c9)._m0[int(_2229)][_2231];
    int _2235 = int(_2227) + 1;
    uint _2237 = uint(int(uint(_2235) >> uint(2)));
    int _2239 = _2235 & 3;
    float _2241 = (*spvDescriptorSet0.vp_c9)._m0[int(_2237)][_2239];
    int _2243 = _2223 << 4;
    int _2245 = _2243 + 656;
    float _2247 = fma(_1923, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2225);
    int _2249 = _1629 & 3;
    bool _2251 = _2249 != 0;
    float _2253 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2255 = fma(_2139, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2167);
    int _2257 = abs(_1601);
    float _2259 = _1945 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    uint _2261 = uint(int(uint(_2245) >> uint(2)));
    uint _2263 = uint(int(uint(int(_2261)) >> uint(2)));
    int _2265 = int(_2261) & 3;
    float _2267 = (*spvDescriptorSet0.vp_c9)._m0[int(_2263)][_2265];
    int _2269 = int(_2261) + 1;
    uint _2271 = uint(int(uint(_2269) >> uint(2)));
    int _2273 = _2269 & 3;
    float _2275 = (*spvDescriptorSet0.vp_c9)._m0[int(_2271)][_2273];
    bool _2277 = !_2251;
    int _2279 = _2277 ? 0 : 1;
    float _2281 = fma(_1931, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2253);
    int _2283 = _1715 & 3;
    bool _2285 = _2283 != 0;
    float _2287 = _2147 * _1889;
    float _2289 = _2119 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2291 = abs(_2279);
    float _2293 = _2107 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _2295 = _2245 + 8;
    uint _2297 = uint(int(uint(_2295) >> uint(2)));
    uint _2299 = uint(int(uint(int(_2297)) >> uint(2)));
    int _2301 = int(_2297) & 3;
    float _2303 = (*spvDescriptorSet0.vp_c9)._m0[int(_2299)][_2301];
    int _2305 = int(_2297) + 1;
    uint _2307 = uint(int(uint(_2305) >> uint(2)));
    int _2309 = _2305 & 3;
    float _2311 = (*spvDescriptorSet0.vp_c9)._m0[int(_2307)][_2309];
    bool _2313 = !_2285;
    int _2315 = _2313 ? 0 : 1;
    float _2317 = fma(_2139, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2289);
    bool _2319 = _1525 != 3;
    int _2321 = ~_2291;
    int _2323 = _2321 + 1;
    int _2325 = _2323 + 1;
    bool _2327 = !_2319;
    int _2329 = _2327 ? 0 : (-1);
    int _2331 = _2175 + 8;
    uint _2333 = uint(int(uint(_2331) >> uint(2)));
    uint _2335 = uint(int(uint(int(_2333)) >> uint(2)));
    int _2337 = int(_2333) & 3;
    float _2339 = (*spvDescriptorSet0.vp_c9)._m0[int(_2335)][_2337];
    int _2341 = int(_2333) + 1;
    uint _2343 = uint(int(uint(_2341) >> uint(2)));
    int _2345 = _2341 & 3;
    float _2347 = (*spvDescriptorSet0.vp_c9)._m0[int(_2343)][_2345];
    bool _2349 = _1645 != 3;
    float _2351 = _1927 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _2353 = ~_2257;
    int _2355 = _2353 + 1;
    int _2357 = _2355 + 1;
    bool _2359 = !_1527;
    int _2361 = _2359 ? 0 : 1;
    bool _2363 = !_2349;
    int _2365 = _2363 ? 0 : (-1);
    int _2367 = _2217 + 8;
    uint _2369 = uint(int(uint(_2367) >> uint(2)));
    uint _2371 = uint(int(uint(int(_2369)) >> uint(2)));
    int _2373 = int(_2369) & 3;
    float _2375 = (*spvDescriptorSet0.vp_c9)._m0[int(_2371)][_2373];
    int _2377 = int(_2369) + 1;
    uint _2379 = uint(int(uint(_2377) >> uint(2)));
    int _2381 = _2377 & 3;
    float _2383 = (*spvDescriptorSet0.vp_c9)._m0[int(_2379)][_2381];
    int _2385 = abs(_2361);
    int _2387 = _2357 * as_type<int>(_2197);
    int _2389 = abs(_1735);
    int _2391 = abs(_1817);
    int _2393 = ~_2389;
    int _2395 = _2393 + 1;
    int _2397 = _2395 + 1;
    int _2399 = ~_2391;
    int _2401 = _2399 + 1;
    int _2403 = _2401 + 1;
    int _2405 = ~_2385;
    int _2407 = _2405 + 1;
    int _2409 = _2407 + 1;
    bool _2411 = _1737 != 3;
    int _2413 = abs(_2329);
    int _2415 = _2397 * as_type<int>(_2241);
    int _2417 = abs(_2315);
    int _2419 = _2409 * as_type<int>(_2189);
    int _2421 = _2419 + _2387;
    int _2423 = abs(_1725);
    int _2425 = _2325 * as_type<int>(_2233);
    int _2427 = _2425 + _2415;
    int _2429 = abs(_1799);
    float _2431 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2433 = int(_2431);
    int _2435 = ~_2417;
    int _2437 = _2435 + 1;
    int _2439 = _2437 + 1;
    int _2441 = _2403 * as_type<int>(_2275);
    int _2443 = abs(_1655);
    int _2445 = ~_2429;
    int _2447 = _2445 + 1;
    int _2449 = _2447 + 1;
    int _2451 = _2439 * as_type<int>(_2267);
    int _2453 = _2451 + _2441;
    int _2455 = ~_2443;
    int _2457 = _2455 + 1;
    int _2459 = _2457 + 1;
    float _2461 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _2463 = int(_2461);
    int _2465 = abs(_2365);
    int _2467 = _2449 * as_type<int>(_2303);
    int _2469 = _2467 + _2453;
    bool _2471 = !_2411;
    int _2473 = _2471 ? 0 : (-1);
    int _2475 = ~_2423;
    int _2477 = _2475 + 1;
    int _2479 = _2477 + 1;
    int _2481 = ~_2413;
    int _2483 = _2481 + 1;
    int _2485 = _2483 + 1;
    int _2487 = _2459 * as_type<int>(_2339);
    int _2489 = _2487 + _2421;
    int _2491 = abs(_2473);
    int _2493 = _2485 * as_type<int>(_2347);
    int _2495 = _2493 + _2489;
    int _2497 = ~_2491;
    int _2499 = _2497 + 1;
    int _2501 = _2499 + 1;
    float _2503 = float(uint(_2433));
    int _2505 = _2479 * as_type<int>(_2375);
    int _2507 = _2505 + _2427;
    int _2509 = ~_2465;
    int _2511 = _2509 + 1;
    int _2513 = _2511 + 1;
    int _2515 = _2501 * as_type<int>(_2311);
    int _2517 = _2515 + _2469;
    bool _2519 = !_1831;
    int _2521 = _2519 ? 0 : 1;
    float _2523 = _2109 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2525 = float(uint(_2091));
    float _2527 = 1.0 / _2503;
    int _2529 = abs(_2521);
    float _2531 = _2097 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    int _2533 = _2513 * as_type<int>(_2383);
    int _2535 = _2533 + _2507;
    float _2537 = _2075 + _2523;
    int _2539 = ~_2087;
    int _2541 = _2539 + 1;
    int _2543 = _2541 + 1;
    float _2545 = 1.0 / _2525;
    int _2547 = ~_2529;
    int _2549 = _2547 + 1;
    int _2551 = _2549 + 1;
    bool _2553 = !_1427;
    int _2555 = _2553 ? _2085 : (-1);
    int _2557 = _2495 * _2543;
    bool _2559 = !_1841;
    int _2561 = _2559 ? 0 : 1;
    int _2563 = _2551 * _2535;
    bool _2565 = !_1503;
    int _2567 = _2565 ? _2065 : (-1);
    float _2569 = float(uint(_2463));
    int _2571 = _2555 * _2529;
    int _2573 = _2571 + _2563;
    int _2575 = abs(_2561);
    int _2577 = _2567 * _2087;
    int _2579 = _2577 + _2557;
    int _2581 = abs(_2091);
    float _2583 = _1925 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _2585 = ~_2575;
    int _2587 = _2585 + 1;
    int _2589 = _2587 + 1;
    float _2591 = 1.0 / _2569;
    int _2593 = as_type<int>(_2527) + (-2);
    float _2595 = _2583 + _2531;
    float _2597 = float(uint(_2573));
    int _2599 = _2589 * _2517;
    float _2601 = float(uint(_2581));
    float _2603 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2605 = _2595 + _2603;
    int _2607 = abs(_2433);
    float _2609 = as_type<float>(_2593) * _2597;
    int _2611 = as_type<int>(_2545) + (-2);
    float _2613 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2615 = _2537 + _2613;
    float _2617 = float(uint(_2579));
    float _2619 = 1.0 / _2601;
    bool _2621 = !_1253;
    int _2623 = _2621 ? _2213 : (-1);
    float _2625 = _2605 * _2605;
    float _2627 = float(uint(_2607));
    float _2629 = as_type<float>(_2611) * _2617;
    float _2631 = _2615 * _2615;
    int _2633 = _2623 * _2575;
    int _2635 = _2633 + _2599;
    int _2637 = as_type<int>(_2591) + (-2);
    float _2639 = trunc(_2609);
    float _2641 = precise::max(_2639, 0.0);
    uint _2643 = uint(_2641);
    float _2645 = _2625 + _2631;
    float _2647 = float(uint(_2635));
    float _2649 = _1919 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _2651 = abs(_2463);
    float _2653 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _2655 = abs(_2579);
    float _2657 = 1.0 / _2627;
    float _2659 = as_type<float>(_2637) * _2647;
    int _2661 = ~_2433;
    int _2663 = _2661 + 1;
    float _2665 = fma(_2351, -2.0, _2653);
    float _2667 = float(uint(_2651));
    int _2669 = as_type<int>(_2619) + (-2);
    float _2671 = trunc(_2629);
    float _2673 = precise::max(_2671, 0.0);
    uint _2675 = uint(_2673);
    float _2677 = float(uint(_2655));
    int _2679 = _2663 * int(_2643);
    int _2681 = _2679 + _2573;
    int _2683 = abs(_2573);
    float _2685 = as_type<float>(_2669) * _2677;
    int _2687 = ~_2091;
    int _2689 = _2687 + 1;
    float _2691 = sqrt(_2645);
    float _2693 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _2695 = as_type<int>(_2657) + (-2);
    float _2697 = float(uint(_2683));
    float _2699 = -_2693;
    float _2701 = fma(_2649, 2.0, _2699);
    float _2703 = float(uint(_2681));
    float _2705 = 1.0 / _2667;
    int _2707 = _2689 * int(_2675);
    int _2709 = _2707 + _2579;
    float _2711 = as_type<float>(_2695) * _2697;
    float _2713 = as_type<float>(_2593) * _2703;
    int _2715 = abs(_2635);
    float _2717 = float(uint(_2709));
    float _2719 = trunc(_2659);
    float _2721 = precise::max(_2719, 0.0);
    uint _2723 = uint(_2721);
    bool _2725 = _2691 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2727 = as_type<float>(_2611) * _2717;
    int _2729 = ~_2463;
    int _2731 = _2729 + 1;
    float _2733 = _1981 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _2735 = float(uint(_2715));
    float _2737 = trunc(_2685);
    float _2739 = precise::max(_2737, 0.0);
    uint _2741 = uint(_2739);
    int _2743 = as_type<int>(_2705) + (-2);
    float _2745 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _2747 = ~_2581;
    int _2749 = _2747 + 1;
    float _2751 = _2259 + _2293;
    float _2753 = as_type<float>(_2743) * _2735;
    float _2755 = fma(_2733, -2.0, _2745);
    float _2757 = trunc(_2711);
    float _2759 = precise::max(_2757, 0.0);
    uint _2761 = uint(_2759);
    int _2763 = _2731 * int(_2723);
    int _2765 = _2763 + _2635;
    float _2767 = float(uint(_2765));
    float _2769 = trunc(_2713);
    float _2771 = precise::max(_2769, 0.0);
    uint _2773 = uint(_2771);
    int _2775 = _2749 * int(_2741);
    int _2777 = _2775 + _2655;
    float _2779 = trunc(_2753);
    float _2781 = precise::max(_2779, 0.0);
    uint _2783 = uint(_2781);
    float _2785 = trunc(_2727);
    float _2787 = precise::max(_2785, 0.0);
    uint _2789 = uint(_2787);
    int _2791 = ~_2607;
    int _2793 = _2791 + 1;
    float _2795 = float(uint(_2777));
    bool _2797 = !_2725;
    float _2799 = _2751;
    float _2801 = _2625;
    float _2803 = _2631;
    float _2805 = _2537;
    float _2807 = _2595;
    if (!_2797)
    {
        float _2809 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2811 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2813 = _2691 + _2811;
        float _2815 = rsqrt(_2645);
        float _2817 = _2813 * _2809;
        float _2819 = _2751 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2821 = _2817 * 0.15915493667125701904296875;
        float _2823 = _2821 * 6.283185482025146484375;
        float _2825 = sin(_2823);
        float _2827 = _2821 * 6.283185482025146484375;
        float _2829 = cos(_2827);
        float _2831 = fma(_2825, _2819, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2833 = _2815 * _2831;
        float _2835 = _2829 + (-1.0);
        float _2837 = fma(_2605, _2833, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2839 = fma(_2615, _2833, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2841 = _2835 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2843 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2845 = _2837 + _2843;
        float _2847 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2849 = _2839 + _2847;
        float _2851 = fma(_2751, _2829, _2841);
        float _2853 = _2845 * _2845;
        float _2855 = _2849 * _2849;
        _2799 = _2851;
        _2801 = _2853;
        _2803 = _2855;
        _2805 = _2839;
        _2807 = _2837;
    }
    float _2857 = _2799;
    float _2859 = _2801;
    float _2861 = _2803;
    float _2863 = _2805;
    float _2865 = _2807;
    int _2867 = _2793 * int(_2761);
    int _2869 = _2867 + _2683;
    float _2871 = as_type<float>(_2637) * _2767;
    float _2873 = as_type<float>(_2669) * _2795;
    int _2875 = ~_2651;
    int _2877 = _2875 + 1;
    float _2879 = _2171 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2881 = _2171 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2883 = _2171 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2885 = float(uint(_2869));
    int _2887 = _2877 * int(_2783);
    int _2889 = _2887 + _2715;
    float _2891 = trunc(_2873);
    float _2893 = precise::max(_2891, 0.0);
    uint _2895 = uint(_2893);
    float _2897 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2899 = _2857 + _2897;
    int _2901 = int(_2675) + int(_2789);
    float _2903 = as_type<float>(_2695) * _2885;
    float _2905 = float(uint(_2889));
    float _2907 = fma(_2899, _2899, _2859);
    int _2909 = ~_2091;
    int _2911 = _2909 + 1;
    float _2913 = -_150;
    float _2915 = fma(_2913, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1821);
    float _2917 = trunc(_2871);
    float _2919 = precise::max(_2917, 0.0);
    uint _2921 = uint(_2919);
    float _2923 = as_type<float>(_2743) * _2905;
    int _2925 = int(_2643) + int(_2773);
    float _2927 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[77].z, _582);
    int _2929 = ~_2433;
    int _2931 = _2929 + 1;
    float _2933 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1845);
    int _2935 = ~_2581;
    int _2937 = _2935 + 1;
    float _2939 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1865);
    float _2941 = trunc(_2903);
    float _2943 = precise::max(_2941, 0.0);
    uint _2945 = uint(_2943);
    int _2947 = int(_2741) + int(_2895);
    float _2949 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[87].z, _584);
    int _2951 = ~_2463;
    int _2953 = _2951 + 1;
    float _2955 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1873);
    float _2957 = -_150;
    float _2959 = fma(_2957, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2221);
    float _2961 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2247);
    float _2963 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2281);
    float _2965 = trunc(_2923);
    float _2967 = precise::max(_2965, 0.0);
    uint _2969 = uint(_2967);
    int _2971 = int(_2723) + int(_2921);
    float _2973 = -_150;
    float _2975 = fma(_2973, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2701);
    float _2977 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2665);
    int _2979 = _2911 * _2901;
    int _2981 = _2979 + _2579;
    float _2983 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2755);
    int _2985 = _2953 * _2971;
    int _2987 = _2985 + _2635;
    int _2989 = ~_2607;
    int _2991 = _2989 + 1;
    int _2993 = _2931 * _2925;
    int _2995 = _2993 + _2573;
    int _2997 = int(_2761) + int(_2945);
    int _2999 = _2937 * _2947;
    int _3001 = _2999 + _2655;
    bool _3003 = uint(_2981) >= uint(_2091);
    float _3005 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _3007 = uint(_2987) >= uint(_2463);
    int _3009 = _2991 * _2997;
    int _3011 = _3009 + _2683;
    bool _3013 = uint(_2995) >= uint(_2433);
    float _3015 = _2907 + _2861;
    bool _3017 = uint(_3001) >= uint(_2581);
    float _3019 = fma(_2287, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2879);
    bool _3021 = !_3003;
    int _3023 = _3021 ? 0 : (-1);
    float _3025 = fma(_2287, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2881);
    bool _3027 = !_3007;
    int _3029 = _3027 ? 0 : (-1);
    float _3031 = sqrt(_3015);
    int _3033 = int(_2783) + int(_2969);
    float _3035 = fma(_2287, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2883);
    int _3037 = ~_2651;
    int _3039 = _3037 + 1;
    float _3041 = fma(_2143, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2255);
    bool _3043 = uint(_3011) >= uint(_2607);
    float _3045 = _3005 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _3047 = !_3013;
    int _3049 = _3047 ? 0 : (-1);
    int _3051 = _3039 * _3033;
    int _3053 = _3051 + _2715;
    int _3055 = ~_2901;
    int _3057 = _3055 + _3023;
    int _3059 = _3057 + 1;
    float _3061 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _3063 = ~_2971;
    int _3065 = _3063 + _3029;
    int _3067 = _3065 + 1;
    float _3069 = fma(_3045, _809, -0.5);
    int _3071 = ~_2925;
    int _3073 = _3071 + _3049;
    int _3075 = _3073 + 1;
    int _3077 = _2091 * _3059;
    int _3079 = _3077 + _2579;
    bool _3081 = _2091 == 0;
    int _3083 = _2463 * _3067;
    int _3085 = _3083 + _2635;
    bool _3087 = uint(_3053) >= uint(_2651);
    float _3089 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _3091 = _2579 ^ _2091;
    int _3093 = _2433 * _3075;
    int _3095 = _3093 + _2573;
    bool _3097 = _2433 == 0;
    float _3099 = fma(_2143, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2201);
    bool _3101 = _2091 == 0;
    bool _3103 = !_3017;
    int _3105 = _3103 ? 0 : (-1);
    float _3107 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _3109 = !_3081;
    int _3111 = _3109 ? _3079 : (-1);
    bool _3113 = _2433 == 0;
    int _3115 = _2573 ^ _2433;
    bool _3117 = !_3043;
    int _3119 = _3117 ? 0 : (-1);
    float _3121 = _3089 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _3123 = _2463 == 0;
    bool _3125 = _2463 == 0;
    float _3127 = fma(_3121, _865, -0.5);
    int _3129 = _2635 ^ _2463;
    uint _3131 = uint(int(uint(_3091) >> uint(31)));
    bool _3133 = !_3097;
    int _3135 = _3133 ? _3095 : (-1);
    float _3137 = float(_3111);
    int _3139 = ~_3105;
    int _3141 = _2947 + _3139;
    int _3143 = _3141 + 1;
    int _3145 = ~_3119;
    int _3147 = _2997 + _3145;
    int _3149 = _3147 + 1;
    float _3151 = fma(_3045, _3137, _2915);
    uint _3153 = uint(int(uint(_3115) >> uint(31)));
    float _3155 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _3157 = ~int(_3131);
    int _3159 = _3157 + 1;
    float _3161 = _3061 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _3163 = float(_3135);
    float _3165 = fma(_2927, _3069, _3151);
    bool _3167 = !_3087;
    int _3169 = _3167 ? 0 : (-1);
    float _3171 = fma(_3161, _1455, -0.5);
    uint _3173 = uint(int(uint(_3129) >> uint(31)));
    float _3175 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _3177 = !_3123;
    int _3179 = _3177 ? _3085 : (-1);
    float _3181 = fma(_3121, _3163, _2975);
    int _3183 = ~int(_3153);
    int _3185 = _3183 + 1;
    int _3187 = _3143 ^ _3159;
    float _3189 = fma(_2961, _3127, _3181);
    int _3191 = ~_3169;
    int _3193 = _3033 + _3191;
    int _3195 = _3193 + 1;
    float _3197 = _3107 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _3199 = ~int(_3173);
    int _3201 = _3199 + 1;
    float _3203 = float(_3179);
    int _3205 = _3149 ^ _3185;
    int _3207 = ~_3159;
    int _3209 = _3207 + _3187;
    int _3211 = _3209 + 1;
    float _3213 = fma(_3161, _3203, _2959);
    int _3215 = _3195 ^ _3201;
    int _3217 = ~_3185;
    int _3219 = _3217 + _3205;
    int _3221 = _3219 + 1;
    float _3223 = fma(_2949, _3171, _3213);
    bool _3225 = !_3101;
    int _3227 = _3225 ? _3211 : (-1);
    float _3229 = _3155 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _3231 = ~_3201;
    int _3233 = _3231 + _3215;
    int _3235 = _3233 + 1;
    float _3237 = _3175 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    bool _3239 = !_3113;
    int _3241 = _3239 ? _3221 : (-1);
    float _3243 = fma(_1091, _3197, -0.5);
    float _3245 = float(_3227);
    bool _3247 = !_3125;
    int _3249 = _3247 ? _3235 : (-1);
    float _3251 = float(_3241);
    float _3253 = -_2933;
    float _3255 = fma(_3197, _3245, _3253);
    float _3257 = float(_3249);
    float _3259 = fma(_1123, _3229, -0.5);
    float _3261 = fma(_3237, _1353, -0.5);
    float _3263 = -_2977;
    float _3265 = fma(_3229, _3251, _3263);
    float _3267 = fma(_2939, _3243, _3255);
    float _3269 = -_2983;
    float _3271 = fma(_3237, _3257, _3269);
    float _3273 = fma(_2963, _3259, _3265);
    float _3275 = fma(_2955, _3261, _3271);
    float _3277 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _3279 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _3281 = fma(_2177, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3019);
    float _3283 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _3285 = fma(_2177, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3025);
    float _3287 = fma(_2177, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3035);
    float _3289 = _3277 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3291 = _3279 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3293 = _3283 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3295 = _2123 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _3297 = fma(_2143, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2317);
    float _3299 = _3223 + 0.5;
    float _3301 = _3165 + 0.5;
    float _3303 = _3189 + 0.5;
    float _3305 = _3267 + 0.5;
    float _3307 = _3273 + 0.5;
    float _3309 = _3275 + 0.5;
    out.m_81.x = _3289;
    out.m_81.y = _3291;
    out.m_81.z = _3293;
    out.m_81.w = _3295;
    bool _3311 = _3031 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _3313 = isnan(_3031);
    bool _3315 = _3311 || _3313;
    bool _3317 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _3319 = _3315 || _3317;
    out.m_83.x = _3281;
    out.m_83.y = _3285;
    out.m_83.z = _3287;
    out.m_85.x = _3301;
    out.m_85.y = _3305;
    out.m_85.z = _3303;
    out.m_85.w = _3307;
    out.m_87.x = _3299;
    out.m_87.y = _3309;
    float _3321 = _3151;
    int _3323 = as_type<int>(_2865);
    if (!_3319)
    {
        _3321 = 1.0;
    }
    float _3325 = _3321;
    out.m_89.x = _3297;
    out.m_89.y = _3041;
    out.m_89.z = _3099;
    bool _3327 = !_3319;
    float _3329 = _3325;
    if (!_3327)
    {
        bool _3331 = _3031 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _3333 = isnan(_3031);
        bool _3335 = _3331 || _3333;
        bool _3337 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _3339 = _3335 || _3337;
        if (!_3339)
        {
            float _3341 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3343 = _3031 + _3341;
            float _3345 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3347 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _3345;
            float _3349 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _3351 = _3349 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _3353 = 1.0 / _3347;
            float _3355 = _3343 * _3353;
            float _3357 = fma(_3355, _3351, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _3329 = _3357;
            _3359 = true;
        }
        else
        {
            bool _3361 = _3031 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _3363 = isnan(_3031);
            bool _3365 = _3361 || _3363;
            bool _3367 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _3369 = _3365 || _3367;
            if (!_3369)
            {
                float _3371 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3373 = _3031 + _3371;
                float _3375 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3377 = _3375 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _3379 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _3381 = _3379 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _3383 = 1.0 / _3377;
                float _3385 = _3373 * _3383;
                float _3387 = fma(_3385, _3381, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _3329 = _3387;
                _3359 = true;
            }
            else
            {
                _3329 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _3359 = false;
    float _3389 = _3329;
    float _3391 = fma(_2583, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _3393 = fma(_2075, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _3395 = floor(_3391);
    float _3397 = floor(_3393);
    float _3399 = -_3395;
    float _3401 = _3391 + _3399;
    float _3403 = -_3397;
    float _3405 = _3393 + _3403;
    float2 _9624 = float2(_3401, _3405);
    float _3407 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_9624, float2(0.0), isnan(_9624)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_9624, float2(0.0), isnan(_9624)), level(0.0)).x;
    float _3409 = _2259 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3411 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _3413 = _2863 + _3411;
    float _3415 = fma(_2583, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3409);
    float _3417 = fma(_3413, _3389, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _3419 = fma(_2075, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3415);
    float _3421 = _2259 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3423 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    bool _3425 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _3427 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _3429 = _3425 || _3427;
    bool _3431 = isnan(0.5);
    bool _3433 = _3429 || _3431;
    float _3435 = _3419 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3437 = fma(_2583, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3421);
    float _3439 = _2259 + _3423;
    float _3441 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _3443 = _2857 + _3441;
    float _3445 = 1.0 / _3435;
    float _3447 = fma(_2075, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3437);
    float _3449 = _3439 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _3451 = fma(_3443, _3389, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _3453 = _3447 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3455 = fma(_2583, (*spvDescriptorSet0.vp_c15)._m0[126].x, _3449);
    float _3457 = _3453 + _3435;
    float _3459 = fma(_2075, (*spvDescriptorSet0.vp_c15)._m0[126].z, _3455);
    float _3461 = _3459 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _3463 = _3457 * _3445;
    float _3465 = _3463 * 0.5;
    float _3467 = trunc(_3461);
    int _3469 = int(_3467);
    float _3471 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3473 = fma(_3465, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3471);
    float _3475 = 1.0 / _3473;
    int _3477 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _3479 = _3469 + _3477;
    int _3481 = _3479 + 1;
    float _3483 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _3485 = _2865 + _3483;
    float _3487 = fma(_3485, _3389, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _3489 = _3389;
    float _3491 = _3485;
    int _3493 = 2;
    if (_3433)
    {
        _3489 = _3451;
    }
    float _3495 = _3489;
    float _3497 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3499 = _3475 * _3497;
    float _3501 = _3439 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _3503 = _3495;
    if (_3433)
    {
        _3491 = _3487;
    }
    float _3505 = _3491;
    bool _3507 = _3499 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _3509 = fma(_2583, (*spvDescriptorSet0.vp_c15)._m0[127].x, _3501);
    bool _3511 = _3499 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _3513 = !_3507;
    int _3515 = _3513 ? 0 : 1;
    float _3517 = fma(_2075, (*spvDescriptorSet0.vp_c15)._m0[127].z, _3509);
    float _3519 = _3517 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _3521 = _3505;
    if (!_3507)
    {
        _3493 = 1;
    }
    int _3523 = _3493;
    float _3525 = trunc(_3519);
    int _3527 = int(_3525);
    int _3529 = _3523;
    if (!_3511)
    {
        _3529 = _3515;
    }
    int _3531 = _3529;
    bool _3533 = _3481 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _3535 = _3531 << 6;
    int _3537 = _3535 + 48;
    uint _3539 = uint(int(uint(_3537) >> uint(2)));
    uint _3541 = uint(int(uint(int(_3539)) >> uint(2)));
    int _3543 = int(_3539) & 3;
    float _3545 = (*spvDescriptorSet0.vp_c15)._m0[int(_3541)][_3543];
    int _3547 = int(_3539) + 1;
    uint _3549 = uint(int(uint(_3547) >> uint(2)));
    int _3551 = _3547 & 3;
    float _3553 = (*spvDescriptorSet0.vp_c15)._m0[int(_3549)][_3551];
    int _3555 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _3557 = _3527 + _3555;
    int _3559 = _3557 + 1;
    int _3561 = _3535 + 56;
    uint _3563 = uint(int(uint(_3561) >> uint(2)));
    uint _3565 = uint(int(uint(int(_3563)) >> uint(2)));
    int _3567 = int(_3563) & 3;
    float _3569 = (*spvDescriptorSet0.vp_c15)._m0[int(_3565)][_3567];
    int _3571 = int(_3563) + 1;
    uint _3573 = uint(int(uint(_3571) >> uint(2)));
    int _3575 = _3571 & 3;
    float _3577 = (*spvDescriptorSet0.vp_c15)._m0[int(_3573)][_3575];
    int _3579 = _3481 | _3559;
    bool _3581 = _3579 < 0;
    bool _3583 = _3581 || _3533;
    int _3585 = _3535 + 64;
    uint _3587 = uint(int(uint(_3585) >> uint(2)));
    uint _3589 = uint(int(uint(int(_3587)) >> uint(2)));
    int _3591 = int(_3587) & 3;
    float _3593 = (*spvDescriptorSet0.vp_c15)._m0[int(_3589)][_3591];
    int _3595 = int(_3587) + 1;
    uint _3597 = uint(int(uint(_3595) >> uint(2)));
    int _3599 = _3595 & 3;
    float _3601 = (*spvDescriptorSet0.vp_c15)._m0[int(_3597)][_3599];
    float _3603 = as_type<float>(_3579);
    if (_3433)
    {
        _3603 = _3417;
    }
    float _3605 = _3603;
    bool _3607 = _3559 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _3609 = _3607 || _3583;
    int _3611 = _3535 + 72;
    uint _3613 = uint(int(uint(_3611) >> uint(2)));
    uint _3615 = uint(int(uint(int(_3613)) >> uint(2)));
    int _3617 = int(_3613) & 3;
    float _3619 = (*spvDescriptorSet0.vp_c15)._m0[int(_3615)][_3617];
    int _3621 = int(_3613) + 1;
    uint _3623 = uint(int(uint(_3621) >> uint(2)));
    int _3625 = _3621 & 3;
    float _3627 = (*spvDescriptorSet0.vp_c15)._m0[int(_3623)][_3625];
    int _3629 = _3535 + 96;
    uint _3631 = uint(int(uint(_3629) >> uint(2)));
    uint _3633 = uint(int(uint(int(_3631)) >> uint(2)));
    int _3635 = int(_3631) & 3;
    float _3637 = (*spvDescriptorSet0.vp_c15)._m0[int(_3633)][_3635];
    int _3639 = int(_3631) + 1;
    uint _3641 = uint(int(uint(_3639) >> uint(2)));
    int _3643 = _3639 & 3;
    float _3645 = (*spvDescriptorSet0.vp_c15)._m0[int(_3641)][_3643];
    int _3647 = _3535 + 104;
    uint _3649 = uint(int(uint(_3647) >> uint(2)));
    uint _3651 = uint(int(uint(int(_3649)) >> uint(2)));
    int _3653 = int(_3649) & 3;
    float _3655 = (*spvDescriptorSet0.vp_c15)._m0[int(_3651)][_3653];
    int _3657 = int(_3649) + 1;
    uint _3659 = uint(int(uint(_3657) >> uint(2)));
    int _3661 = _3657 & 3;
    float _3663 = (*spvDescriptorSet0.vp_c15)._m0[int(_3659)][_3661];
    float _3665 = _3605;
    if (!_3433)
    {
        float _3667 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _3669 = _2259 + _3667;
        float _3671 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _3673 = _2583 + _3671;
        float _3675 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3677 = _3669 * _3669;
        float _3679 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _3681 = _2075 + _3679;
        float _3683 = fma(_3673, _3673, _3677);
        float _3685 = -_2259;
        float _3687 = _3685 + _3451;
        float _3689 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3691 = -_2075;
        float _3693 = _3691 + _3417;
        float _3695 = fma(_3681, _3681, _3683);
        float _3697 = sqrt(_3695);
        float _3699 = _3675 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3701 = precise::min(_3697, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3703 = _3701 * _3689;
        float _3705 = _3699 * _3703;
        float _3707 = -_2583;
        float _3709 = _3707 + _3487;
        float _3711 = fma(_3687, _3705, _2259);
        float _3713 = fma(_3709, _3705, _2583);
        float _3715 = fma(_3693, _3705, _2075);
        _3503 = _3711;
        _3521 = _3713;
        _3665 = _3715;
        _3323 = as_type<int>(_3705);
    }
    float _3717 = _3503;
    float _3719 = _3521;
    float _3721 = _3665;
    int _3723 = _3323;
    float _3725 = _3439 * _3645;
    float _3727 = _3717 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    int _3729 = _3723;
    int _3731 = as_type<int>(_3727);
    if (!_3609)
    {
        int _3733 = _3559 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _3735 = _3733 + _3481;
        _3729 = _3735;
    }
    int _3737 = _3729;
    float _3739 = _3439 * _3553;
    float _3741 = fma(_2583, _3637, _3725);
    float _3743 = fma(_3719, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3727);
    float _3745 = _3439 * _3601;
    float _3747 = fma(_2583, _3545, _3739);
    float _3749 = fma(_2075, _3655, _3741);
    float _3751 = fma(_3721, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3743);
    float _3753 = fma(_2583, _3593, _3745);
    int _3755 = as_type<int>(_3741);
    float _3757 = as_type<float>(_3737);
    if (!_3609)
    {
        int _3759 = _3737 << 2;
        _3755 = _3759;
    }
    int _3761 = _3755;
    float _3763 = _3751 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3765 = _3749 + _3663;
    float _3767 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    int _3769 = _3535 + 80;
    uint _3771 = uint(int(uint(_3769) >> uint(2)));
    uint _3773 = uint(int(uint(int(_3771)) >> uint(2)));
    int _3775 = int(_3771) & 3;
    float _3777 = (*spvDescriptorSet0.vp_c15)._m0[int(_3773)][_3775];
    int _3779 = int(_3771) + 1;
    uint _3781 = uint(int(uint(_3779) >> uint(2)));
    int _3783 = _3779 & 3;
    float _3785 = (*spvDescriptorSet0.vp_c15)._m0[int(_3781)][_3783];
    float _3787 = _3763 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    int _3789 = _3761;
    int _3791 = as_type<int>(_3767);
    if (!_3609)
    {
        uint _3793 = uint(int(uint(_3737) >> uint(2)));
        _3731 = int(_3793);
    }
    int _3795 = _3731;
    float _3797 = fma(_2075, _3569, _3747);
    if (!_3609)
    {
        int _3799 = 12 & _3761;
        _3789 = _3799;
    }
    int _3801 = _3789;
    float _3803 = 1.0 / _3765;
    float _3805 = -_3787;
    float _3807 = fma(_3805, _3767, 1.0);
    float _3809 = fma(_2075, _3619, _3753);
    if (!_3609)
    {
        int _3811 = _3795 << 4;
        int _3813 = _3811 + _3801;
        _3791 = _3813;
    }
    int _3815 = _3791;
    int _3817 = _3535 + 88;
    uint _3819 = uint(int(uint(_3817) >> uint(2)));
    uint _3821 = uint(int(uint(int(_3819)) >> uint(2)));
    int _3823 = int(_3819) & 3;
    float _3825 = (*spvDescriptorSet0.vp_c15)._m0[int(_3821)][_3823];
    int _3827 = int(_3819) + 1;
    uint _3829 = uint(int(uint(_3827) >> uint(2)));
    int _3831 = _3827 & 3;
    float _3833 = (*spvDescriptorSet0.vp_c15)._m0[int(_3829)][_3831];
    float _3835 = _3797 + _3577;
    float _3837 = _3717 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3839 = _3717 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3841 = _3809 + _3627;
    float _3843 = _3717 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3845 = fma(_3719, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3837);
    float _3847 = fma(_3719, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3839);
    float _3849 = as_type<float>(_3001);
    if (!_3609)
    {
        int _3851 = _3815 + 400;
        uint _3853 = uint(int(uint(_3851) >> uint(2)));
        uint _3855 = uint(int(uint(int(_3853)) >> uint(2)));
        int _3857 = int(_3853) & 3;
        float _3859 = (*spvDescriptorSet0.vp_c15)._m0[int(_3855)][_3857];
        _3849 = _3859;
    }
    float _3861 = _3849;
    float _3863 = fma(_3719, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3843);
    float _3865 = fma(_3721, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3845);
    float _3867 = fma(_3721, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3847);
    float _3869 = _3835 * _3803;
    float _3871 = fma(_3721, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3863);
    float _3873 = _3865 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3875 = _3867 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3877 = _3841 * _3803;
    bool _3879 = _3869 >= 0.0;
    float _3881 = _3871 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3883 = _3875 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3885 = _3417;
    float _3887 = _3803;
    if (!_3609)
    {
        float _3889 = floor(_3519);
        _3885 = _3889;
    }
    float _3891 = _3885;
    bool _3893 = _3869 <= 1.0;
    bool _3895 = _3893 && _3879;
    float _3897 = _3875 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3899 = fma(_3873, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3883);
    float _3901 = _3875 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    bool _3903 = _3877 >= 0.0;
    bool _3905 = _3903 && _3895;
    float _3907 = fma(_3763, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3899);
    float _3909 = log2(_3807);
    bool _3911 = _3877 <= 1.0;
    bool _3913 = _3911 && _3905;
    float _3915 = fma(_3873, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3901);
    float _3917 = fma(_3881, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3907);
    float _3919 = fma(_3873, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3897);
    float _3921 = 1.0 / _3917;
    float _3923 = fma(_3763, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3919);
    float _3925 = _3891;
    if (!_3609)
    {
        float _3927 = -_3891;
        float _3929 = _3519 + _3927;
        _3925 = _3929;
    }
    float _3931 = _3925;
    float _3933 = _3439 * _3785;
    float _3935 = fma(_3881, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3923);
    float _3937 = _3785;
    if (_3913)
    {
        float _3939 = float(_3531);
        _3937 = _3939;
    }
    float _3941 = _3937;
    float _3943 = fma(_3763, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3915);
    float _3945 = _3835;
    if (!_3609)
    {
        float _3947 = floor(_3461);
        _3945 = _3947;
    }
    float _3949 = _3945;
    float _3951 = fma(_2583, _3777, _3933);
    float _3953 = _3909 * 0.693147182464599609375;
    float _3955 = fma(_3881, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3943);
    float _3957 = fma(_2075, _3825, _3951);
    float _3959 = _3953 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3961 = _3915;
    if (_3913)
    {
        float _3963 = rint(_3941);
        float _3965 = precise::max(_3963, 0.0);
        uint _3967 = uint(_3965);
        uint _3969 = clamp(_3967, 0u, 65535u);
        _3961 = as_type<float>(_3969);
    }
    float _3971 = _3961;
    float _3973 = _3957 + _3833;
    float _3975 = _3955 * _3921;
    float _3977 = _3935 * _3921;
    float _3979 = _3973 * _3803;
    float _3981 = fma(_3975, 0.5, 0.5);
    float _3983 = fma(_3977, -0.5, 0.5);
    float _3985 = _3923;
    float _3987 = _3979;
    if (!_3609)
    {
        float _3989 = rint(_3861);
        float _3991 = precise::max(_3989, 0.0);
        uint _3993 = uint(_3991);
        uint _3995 = clamp(_3993, 0u, 65535u);
        _3985 = as_type<float>(_3995);
    }
    float _3997 = _3985;
    float _3999 = _3949;
    if (!_3609)
    {
        float _4001 = -_3949;
        float _4003 = _3461 + _4001;
        _3999 = _4003;
    }
    float _4005 = _3999;
    float _4007 = _3877;
    if (_3913)
    {
        float3 _10649 = float3(_3869, _3877, float(as_type<int>(_3971)));
        float3 _10653 = select(_10649, float3(0.0), isnan(_10649));
        float _4009 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _10653.xy, uint(rint(_10653.z)), _3979, level(0.0));
        _4007 = _4009;
    }
    float _4011 = _4007;
    float3 _10663 = float3(_3981, _3983, _3959);
    float _4013 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_10663, float3(0.0), isnan(_10663)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_10663, float3(0.0), isnan(_10663)), level(0.0)).x;
    float3 _10672 = float3(_3981, _3983, _3959);
    float4 _4016 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_10672, float3(0.0), isnan(_10672)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_10672, float3(0.0), isnan(_10672)), level(0.0)).xyzw;
    float _4018 = _4016.x;
    float _4020 = _4016.y;
    float _4022 = _4016.z;
    float _4024 = _4016.w;
    float _4026 = _4005;
    float _4028 = _3997;
    if (!_3609)
    {
        float3 _10696 = float3(_4005, _3931, float(as_type<int>(_3997)));
        float3 _10698 = select(_10696, float3(0.0), isnan(_10696));
        float _4030 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _10698.xy, uint(rint(_10698.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _10698.xy, uint(rint(_10698.z)), level(0.0)).x;
        _4026 = _4030;
    }
    float _4032 = _4026;
    if (_3609)
    {
        _3887 = 1.0;
    }
    float _4034 = _3887;
    float _4036 = _4034;
    float _4038 = _4032;
    if (!_3609)
    {
        int _4040 = _3737 << 4;
        int _4042 = _4040 + 2048;
        uint _4044 = uint(int(uint(_4042) >> uint(2)));
        uint _4046 = uint(int(uint(int(_4044)) >> uint(2)));
        int _4048 = int(_4044) & 3;
        float _4050 = (*spvDescriptorSet0.vp_c15)._m0[int(_4046)][_4048];
        int _4052 = int(_4044) + 1;
        uint _4054 = uint(int(uint(_4052) >> uint(2)));
        int _4056 = _4052 & 3;
        float _4058 = (*spvDescriptorSet0.vp_c15)._m0[int(_4054)][_4056];
        int _4060 = _4042 + 8;
        uint _4062 = uint(int(uint(_4060) >> uint(2)));
        uint _4064 = uint(int(uint(int(_4062)) >> uint(2)));
        int _4066 = int(_4062) & 3;
        float _4068 = (*spvDescriptorSet0.vp_c15)._m0[int(_4064)][_4066];
        int _4070 = int(_4062) + 1;
        uint _4072 = uint(int(uint(_4070) >> uint(2)));
        int _4074 = _4070 & 3;
        float _4076 = (*spvDescriptorSet0.vp_c15)._m0[int(_4072)][_4074];
        float _4078 = _3439 * _4058;
        float _4080 = fma(_2583, _4050, _4078);
        float _4082 = fma(_2075, _4068, _4080);
        float _4084 = _4082 + _4076;
        float _4086 = precise::clamp(_4084, 0.0, 1.0);
        float _4088 = -_4086;
        float _4090 = _4088 + _4032;
        float _4092 = fma(_4090, 500.0, 1.5);
        float _4094 = exp2(_4092);
        float _4096 = 0.0 + _4094;
        float _4098 = precise::clamp(_4096, 0.0, 1.0);
        _3757 = as_type<float>(_4042);
        _4036 = _4098;
    }
    float _4100 = _3757;
    float _4102 = _4036;
    float _4104 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4106 = _3717 + _4104;
    float _4108 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4110 = _3719 + _4108;
    float _4112 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4114 = _3721 + _4112;
    float _4116 = _4106 * _4106;
    float _4118 = fma(_4110, _4110, _4116);
    float _4120 = fma(_4114, _4114, _4118);
    float _4122 = rsqrt(_4120);
    float _4124 = _4122 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4126 = _4110 * _4124;
    float _4128 = _4114 * _4124;
    float _4130 = _4126 * _4126;
    float _4132 = _4128 * _4128;
    float _4134 = _4130 + _4132;
    float _4136 = sqrt(_4134);
    bool _4138 = _4136 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4140 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4142 = _4136 + _4140;
    float _4144 = _4122;
    float _4146 = _4100;
    float _4148 = _4142;
    float _4150 = _4124;
    if (_4138)
    {
        float _4152 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4144 = _4152;
    }
    float _4154 = _4144;
    if (_4138)
    {
        float _4156 = rsqrt(_4134);
        _4146 = _4156;
    }
    float _4158 = _4146;
    float _4160 = _4158;
    if (_4138)
    {
        float _4162 = _4142 * _4154;
        _4148 = _4162;
    }
    float _4164 = _4148;
    if (_4138)
    {
        float _4166 = _4164 * 0.15915493667125701904296875;
        _4038 = _4166;
    }
    float _4168 = _4038;
    float _4170 = _4154;
    if (_4138)
    {
        float _4172 = _4168 * 6.283185482025146484375;
        float _4174 = sin(_4172);
        _4170 = _4174;
    }
    float _4176 = _4170;
    float _4178 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4180 = precise::max(0.0, _4178);
    float _4182 = _4114;
    float _4184 = _4180;
    if (_4138)
    {
        float _4186 = _4168 * 6.283185482025146484375;
        float _4188 = cos(_4186);
        _4182 = _4188;
    }
    float _4190 = _4182;
    float _4192 = -_4124;
    float _4194 = -_4180;
    float _4196 = fma(_4106, _4192, _4194);
    float _4198 = _4196;
    if (_4138)
    {
        float _4200 = _4196 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4184 = _4200;
    }
    float _4202 = _4184;
    float _4204 = _4176;
    float _4206 = _4202;
    if (_4138)
    {
        float _4208 = fma(_4176, _4202, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4028 = _4208;
    }
    float _4210 = _4028;
    float _4212 = _4210;
    if (!_4138)
    {
        _4204 = _4126;
    }
    float _4214 = _4204;
    float _4216 = _4214;
    if (_4138)
    {
        float _4218 = _4190 + (-1.0);
        _4206 = _4218;
    }
    float _4220 = _4206;
    float _4222 = _4220;
    if (_4138)
    {
        float _4224 = _4158 * _4210;
        _4150 = _4224;
    }
    float _4226 = _4150;
    if (!_4138)
    {
        _4212 = _4130;
    }
    float _4228 = _4212;
    float _4230 = _4228;
    if (_4138)
    {
        float _4232 = _4220 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4160 = _4232;
    }
    float _4234 = _4160;
    float _4236 = _4234;
    if (_4138)
    {
        float _4238 = _4126 * _4226;
        _4216 = _4238;
    }
    float _4240 = _4216;
    if (!_4138)
    {
        _4222 = _4128;
    }
    float _4242 = _4222;
    float _4244 = _4242;
    if (_4138)
    {
        float _4246 = _4128 * _4226;
        _4244 = _4246;
    }
    float _4248 = _4244;
    if (_4138)
    {
        float _4250 = fma(_4196, _4190, _4234);
        _4198 = _4250;
    }
    float _4252 = _4198;
    if (_4138)
    {
        float _4254 = _4240 * _4240;
        _4230 = _4254;
    }
    float _4256 = _4230;
    if (!_4138)
    {
        _4236 = _4132;
    }
    float _4258 = _4236;
    float _4260 = sqrt(_4120);
    float _4262 = _4258;
    if (_4138)
    {
        float _4264 = _4248 * _4248;
        _4262 = _4264;
    }
    float _4266 = _4262;
    float _4268 = fma(_4252, _4252, _4256);
    float _4270 = _4268 + _4266;
    float _4272 = rsqrt(_4270);
    float _4274 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4276 = fma(_4260, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4274);
    float _4278 = precise::clamp(_4276, 0.0, 1.0);
    float _4280 = -_4278;
    float _4282 = _4280 + 1.0;
    float _4284 = _4272 * _4240;
    float _4286 = abs(_4282);
    float _4288 = log2(_4286);
    float _4290 = _4272 * _4252;
    float _4292 = _4272 * _4248;
    float _4294 = _4284 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4296 = -_4294;
    float _4298 = fma(_4290, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4296);
    float _4300 = -_4292;
    float _4302 = fma(_4300, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4298);
    float _4304 = fma(_4302, -0.5, 0.5);
    float _4306 = _4288 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4308 = fma(_4302, 0.5, 0.5);
    float _4310 = _4290 + 1.0;
    float _4312 = exp2(_4306);
    float _4314 = fma(_4308, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4316 = fma(_4308, _4314, -0.212114393711090087890625);
    float _4318 = sqrt(_4304);
    float _4320 = fma(_4308, _4316, 1.570728778839111328125);
    float _4322 = -_4290;
    float _4324 = fma(_4312, _4310, _4322);
    float _4326 = fma(_4324, 0.5, 0.5);
    float _4328 = _4318 * 0.636619746685028076171875;
    float _4330 = -_4320;
    float _4332 = fma(_4328, _4330, 1.0);
    float2 _11165 = float2(_4332, _4326);
    float3 _4336 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_11165, float2(0.0), isnan(_11165)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_11165, float2(0.0), isnan(_11165)), level(0.0)).xyz;
    float _4338 = _4336.x;
    float _4340 = _4336.y;
    float _4342 = _4336.z;
    float _4344 = abs(_3499);
    float _4346 = log2(_4344);
    float _4348 = _4288 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4350 = -_3407;
    float _4352 = _4350 + 1.0;
    float _4354 = exp2(_4348);
    float _4356 = _4346 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _4358 = _3875 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4360 = fma(_3873, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4358);
    float _4362 = exp2(_4356);
    float _4364 = -_4354;
    float _4366 = _4364 + 1.0;
    float _4368 = _4366 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4370 = _4368 * _4013;
    float _4372 = fma(_4362, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4374 = precise::clamp(_4372, 0.0, 1.0);
    float _4376 = fma(_4374, -2.0, 3.0);
    float _4378 = _4374 * _4374;
    float _4380 = fma(_3763, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4360);
    bool _4382 = _3499 <= 8000.0;
    bool _4384 = isnan(_3499);
    bool _4386 = _4382 || _4384;
    bool _4388 = isnan(8000.0);
    bool _4390 = _4386 || _4388;
    float _4392 = float(_4390);
    float _4394 = _4378 * _4376;
    float _4396 = fma(_3881, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4380);
    float _4398 = -_4394;
    float _4400 = _4398 + 1.0;
    out.gl_Position.x = _3955;
    out.gl_Position.y = _3935;
    out.gl_Position.z = _4396;
    out.gl_Position.w = _3917;
    float _4402 = fma(_4400, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4394);
    float _4404 = _4396 + _3917;
    float _4406 = _4392 * _4402;
    float _4408 = _4404 * 0.5;
    float _4410 = _4404;
    if (!_3913)
    {
        _4410 = 1.0;
    }
    float _4412 = _4410;
    float _4414 = _4406 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _4416 = _4412;
    if (_3913)
    {
        bool _4418 = _4011 >= _3979;
        bool _4420 = isnan(_4011);
        bool _4422 = _4418 || _4420;
        bool _4424 = isnan(_3979);
        bool _4426 = _4422 || _4424;
        float _4428 = float(_4426);
        _4416 = _4428;
    }
    float _4430 = _4416;
    out.m_91.z = _4408;
    out.m_91.w = _3917;
    bool _4432 = _4260 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4434 = isnan(_4260);
    bool _4436 = _4432 || _4434;
    bool _4438 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4440 = _4436 || _4438;
    float _4442 = _4352 * _4414;
    float _4444 = precise::clamp(_4442, 0.0, 1.0);
    float _4446 = _4024 * _4370;
    float _4448 = _4430 * _4102;
    float _4450 = -_4368;
    float _4452 = _4450 + 1.0;
    float _4454 = -_4444;
    float _4456 = fma(_4454, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4458 = _4024 * _4452;
    float _4460 = -_4448;
    float _4462 = fma(_4460, _4456, 1.0);
    float _4464 = precise::clamp(_4462, 0.0, 1.0);
    float _4466 = _4464 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _4468 = _4452;
    float _4470 = _4464;
    if (!_4440)
    {
        _4468 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4472 = _4468;
    float _4474 = _4472;
    float _4476 = _4472;
    if (!_4440)
    {
        _3987 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4478 = _3987;
    out.m_93.x = _4466;
    float _4480 = _4478;
    float _4482 = _4478;
    if (!_4440)
    {
        _4470 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4484 = _4470;
    float _4486 = _4342 * _4370;
    float _4488 = fma(_4338, _4446, _4018);
    float _4490 = fma(_4340, _4446, _4020);
    float _4492 = fma(_4024, _4486, _4022);
    out.m_95.x = _4488;
    out.m_95.y = _4490;
    out.m_95.z = _4492;
    out.m_95.w = _4458;
    bool _4494 = !_4440;
    float _4496 = _4484;
    float _4498 = _4484;
    if (!_4494)
    {
        bool _4500 = _4260 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4502 = isnan(_4260);
        bool _4504 = _4500 || _4502;
        bool _4506 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4508 = _4504 || _4506;
        if (!_4508)
        {
            float _4510 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4512 = _4260 + _4510;
            float _4514 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4516 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4514;
            float _4518 = 1.0 / _4516;
            float _4520 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4522 = _4520 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4524 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4526 = _4524 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4528 = _4512 * _4518;
            float _4530 = precise::clamp(_4528, 0.0, 1.0);
            float _4532 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4534 = _4532 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4536 = fma(_4530, _4526, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4538 = fma(_4530, _4534, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4540 = fma(_4530, _4522, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            _4482 = _4540;
            _4476 = _4538;
            _4498 = _4536;
            _4542 = true;
        }
        else
        {
            bool _4544 = _4260 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4546 = isnan(_4260);
            bool _4548 = _4544 || _4546;
            bool _4550 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4552 = _4548 || _4550;
            if (!_4552)
            {
                _4474 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4554 = _4474;
            _4476 = _4554;
            if (!_4552)
            {
                _4480 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4556 = _4480;
            _4482 = _4556;
            if (!_4552)
            {
                _4496 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4558 = _4496;
            bool _4560 = !_4552;
            _4498 = _4558;
            if (!_4560)
            {
                bool _4562 = _4260 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4564 = isnan(_4260);
                bool _4566 = _4562 || _4564;
                bool _4568 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4570 = _4566 || _4568;
                if (!_4570)
                {
                    float _4572 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4574 = _4260 + _4572;
                    float _4576 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4578 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4576;
                    float _4580 = 1.0 / _4578;
                    float _4582 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4584 = _4582 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4586 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4588 = _4586 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4590 = _4574 * _4580;
                    float _4592 = precise::clamp(_4590, 0.0, 1.0);
                    float _4594 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4596 = _4594 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4598 = fma(_4592, _4588, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4600 = fma(_4592, _4596, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4602 = fma(_4592, _4584, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    _4482 = _4602;
                    _4476 = _4600;
                    _4498 = _4598;
                    _4542 = true;
                }
                else
                {
                    _4482 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4476 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4498 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _4542 = false;
    float _4604 = _4482;
    float _4606 = _4476;
    float _4608 = _4498;
    float _4610 = _4604 * 0.586610972881317138671875;
    bool _4612 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_61.x = 1.0;
    float _4614 = fma(_4606, 0.298911988735198974609375, _4610);
    out.m_97.x = 0.0;
    float _4616 = fma(_4608, 0.114477999508380889892578125, _4614);
    float _4618 = -_4616;
    float _4620 = _4618 + _4606;
    float _4622 = -_4616;
    float _4624 = _4622 + _4604;
    float _4626 = -_4616;
    float _4628 = _4626 + _4608;
    float _4630 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4632 = fma(_4620, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4616);
    float _4634 = fma(_4624, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4616);
    float _4636 = fma(_4628, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4616);
    out.m_93.w = _4630;
    out.m_99.x = _4632;
    out.m_99.y = _4634;
    out.m_99.z = _4636;
    if (!_4612)
    {
        return out;
    }
    float _4638 = -_3717;
    float _4640 = _4638 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _4642 = -_3719;
    float _4644 = _4642 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _4646 = -_3721;
    float _4648 = _4646 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _4650 = _4640 * _4640;
    float _4652 = fma(_4644, _4644, _4650);
    float _4654 = fma(_4648, _4648, _4652);
    float _4656 = sqrt(_4654);
    float _4658 = rsqrt(_4654);
    float _4660 = -_4656;
    float _4662 = _4660 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4664 = _4662 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _4666 = precise::clamp(_4664, 0.0, 1.0);
    float _4668 = _4644 * _4658;
    float _4670 = _4640 * _4658;
    float _4672 = abs(_4666);
    float _4674 = log2(_4672);
    float _4676 = _4648 * _4658;
    float _4678 = _4668 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _4680 = _3041 * _4670;
    float _4682 = -_4670;
    float _4684 = -_4678;
    float _4686 = fma(_4682, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4684);
    float _4688 = fma(_3297, _4668, _4680);
    float _4690 = -_4676;
    float _4692 = fma(_4690, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4686);
    float _4694 = fma(_3099, _4676, _4688);
    float _4696 = precise::clamp(_4694, 0.0, 1.0);
    float _4698 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _4700 = _4692 + _4698;
    float _4702 = _4674 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _4704 = _4700 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _4706 = precise::clamp(_4704, 0.0, 1.0);
    float _4708 = exp2(_4702);
    float _4710 = _4708 * _4706;
    float _4712 = _4696 * _4710;
    float _4714 = _4712 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4716 = _4712 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4718 = _4712 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_97.x = _4714;
    out.m_97.y = _4716;
    out.m_97.z = _4718;
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
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4542 = false;
    bool _3359 = false;
    bool _532 = false;
    bool _416 = false;
    bool _194 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _113 = in.m_58.w;
    float _115 = trunc(_113);
    int _118 = int(_115);
    bool _122 = _118 >= 1;
    float _124 = 0.0;
    if (!_122)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _126 = _124;
    float _128 = _126;
    if (!_122)
    {
        out.m_61.x = 0.0;
    }
    int _130 = 0;
    if (!_122)
    {
        float _132 = _126 * 5.0;
        _130 = as_type<int>(_132);
    }
    int _134 = _130;
    if (!_122)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4774 = as_type<float>(_134);
        out.gl_Position.z = _4774;
    }
    if (!_122)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _136 = in.m_63.w;
    bool _138 = _136 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _140 = isnan(_136);
    bool _142 = _138 || _140;
    bool _144 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _146 = _142 || _144;
    float _148 = -_136;
    float _150 = _148 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_146)
    {
        float _152 = float(_118);
        _128 = _152;
    }
    float _154 = _128;
    bool _156 = _150 >= _154;
    bool _158 = !_146;
    bool _160 = _156 || _158;
    float _162 = _154;
    if (_160)
    {
        _162 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _164 = _162;
    if (_160)
    {
        out.m_61.x = 0.0;
    }
    int _166 = 0;
    if (_160)
    {
        float _168 = _164 * 5.0;
        _166 = as_type<int>(_168);
    }
    int _170 = _166;
    if (_160)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4843 = as_type<float>(_170);
        out.gl_Position.z = _4843;
    }
    if (_160)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _172 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _174 = !_172;
    float _192;
    if (!_174)
    {
        float _176 = in.m_65.x;
        float _178 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _180 = _176 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _182 = fma(_180, (*spvDescriptorSet0.vp_c9)._m0[12].x, _150);
        float _184 = _182 * _178;
        float _186 = floor(_184);
        float _188 = -_186;
        float _190 = _184 + _188;
        _192 = _190;
        _194 = true;
    }
    else
    {
        float _196 = float(_118);
        float _198 = 1.0 / _196;
        float _200 = _150 * _198;
        _192 = _200;
    }
    _194 = false;
    float _202 = _192;
    float _204 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _206 = _202 + _204;
    float _208 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _210 = _202 + _208;
    float _212 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _214 = _202 + _212;
    float _216 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _218 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _216;
    float _220 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _222 = _220 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _224 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _226 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _224;
    float _228 = 1.0 / _218;
    bool _230 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _232 = 1.0 / _222;
    float _234 = 1.0 / _226;
    float _236 = _214 * _228;
    float _238 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _240 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _238;
    float _242 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _244 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _242;
    float _246 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _248 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _246;
    float _250 = _206 * _232;
    bool _252 = _202 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _254 = isnan(_202);
    bool _256 = _252 || _254;
    bool _258 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _260 = _256 || _258;
    float _262 = float(_260);
    float _264 = fma(_240, _236, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _266 = _202 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _268 = isnan(_202);
    bool _270 = _266 || _268;
    bool _272 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _274 = _270 || _272;
    float _276 = float(_274);
    float _278 = fma(_248, _236, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _280 = fma(_244, _236, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _282 = _210 * _234;
    bool _284 = _202 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _286 = isnan(_202);
    bool _288 = _284 || _286;
    bool _290 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _292 = _288 || _290;
    float _294 = float(_292);
    float _296 = -_262;
    float _298 = _296 + 1.0;
    float _300 = -_276;
    float _302 = _300 + 1.0;
    float _304 = _294 * _298;
    bool _306 = _202 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _308 = isnan(_202);
    bool _310 = _306 || _308;
    bool _312 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _314 = _310 || _312;
    float _316 = float(_314);
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _320 = _318 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _322 = -_294;
    float _324 = _322 + 1.0;
    float _326 = _316 * _302;
    float _328 = -_316;
    float _330 = _328 + 1.0;
    float _332 = _276 * _324;
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _336 = _334 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _338 = _264 * _326;
    float _340 = _278 * _326;
    float _342 = _280 * _326;
    float _344 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _346 = _344 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _348 = fma(_330, (*spvDescriptorSet0.vp_c9)._m0[143].x, _340);
    float _350 = fma(_330, (*spvDescriptorSet0.vp_c9)._m0[143].y, _342);
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _354 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _352;
    float _356 = fma(_320, _250, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _358 = fma(_336, _250, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _360 = fma(_346, _250, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _362 = fma(_330, (*spvDescriptorSet0.vp_c9)._m0[143].z, _338);
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _366 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _364;
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _370 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _368;
    float _372 = fma(_356, _332, _348);
    float _374 = fma(_354, _282, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _376 = fma(_366, _282, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _378 = fma(_370, _282, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _380 = fma(_358, _332, _350);
    float _382 = fma(_360, _332, _362);
    float _384 = fma(_374, _304, _372);
    float _386 = fma(_376, _304, _380);
    float _388 = fma(_378, _304, _382);
    float _390 = fma(_262, (*spvDescriptorSet0.vp_c9)._m0[146].x, _384);
    float _392 = fma(_262, (*spvDescriptorSet0.vp_c9)._m0[146].y, _386);
    float _394 = fma(_262, (*spvDescriptorSet0.vp_c9)._m0[146].z, _388);
    bool _396 = !_230;
    float _414;
    if (!_396)
    {
        float _398 = in.m_65.x;
        float _400 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _402 = _398 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _404 = fma(_402, (*spvDescriptorSet0.vp_c9)._m0[11].y, _150);
        float _406 = _404 * _400;
        float _408 = floor(_406);
        float _410 = -_408;
        float _412 = _406 + _410;
        _414 = _412;
        _416 = true;
    }
    else
    {
        float _418 = float(_118);
        float _420 = 1.0 / _418;
        float _422 = _150 * _420;
        _414 = _422;
    }
    _416 = false;
    float _424 = _414;
    float _426 = in.m_67.x;
    float _428 = in.m_67.y;
    float _430 = in.m_67.z;
    bool _432 = _424 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _434 = isnan(_424);
    bool _436 = _432 || _434;
    bool _438 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _440 = _436 || _438;
    float _442 = float(_440);
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _446 = _444 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _448 = _424 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _450 = isnan(_424);
    bool _452 = _448 || _450;
    bool _454 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _456 = _452 || _454;
    float _458 = float(_456);
    float _460 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _462 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _460;
    float _464 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _466 = _424 + _464;
    float _468 = 1.0 / _446;
    float _470 = -_442;
    float _472 = _470 + 1.0;
    bool _474 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _476 = _458 * _472;
    float _478 = -_458;
    float _480 = _478 + 1.0;
    float _482 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _484 = _462 * _468;
    float _486 = _394 * _430;
    float _488 = _482 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _490 = fma(_484, _466, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _492 = _490 * _476;
    float _494 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _496 = fma(_480, (*spvDescriptorSet0.vp_c9)._m0[115].x, _492);
    float _498 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _500 = _494 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _502 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[116].x, _496);
    float _504 = _392 * _428;
    float _506 = _498 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _508 = _390 * _426;
    float _510 = _502 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_69.x = _506;
    out.m_69.y = _500;
    out.m_69.z = _488;
    out.m_69.w = _510;
    bool _512 = !_474;
    float _530;
    if (!_512)
    {
        float _514 = in.m_65.x;
        float _516 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _518 = _514 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _520 = fma(_518, (*spvDescriptorSet0.vp_c9)._m0[11].w, _150);
        float _522 = _520 * _516;
        float _524 = floor(_522);
        float _526 = -_524;
        float _528 = _522 + _526;
        _530 = _528;
        _532 = true;
    }
    else
    {
        float _534 = float(_118);
        float _536 = 1.0 / _534;
        float _538 = _150 * _536;
        _530 = _538;
    }
    _532 = false;
    float _540 = _530;
    float _542 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _544 = int(_542);
    float _546 = float(_118);
    float _548 = in.m_65.x;
    float _550 = _504 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _552 = _486 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _554 = in.m_65.y;
    float _556 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _558 = int(_556);
    float _560 = in.m_65.z;
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _564 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _562;
    float _566 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _568 = in.m_71.x;
    float _570 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _572 = float(_544);
    float _574 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _576 = int(_574);
    float _578 = float(uint(_558));
    float _580 = 1.0 / _572;
    float _582 = fma(_548, (*spvDescriptorSet0.vp_c9)._m0[78].z, _566);
    float _584 = fma(_548, (*spvDescriptorSet0.vp_c9)._m0[88].z, _570);
    float _586 = 1.0 / _578;
    float _588 = float(_576);
    int _590 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _592 = _590 != 0;
    float _594 = _150 * _580;
    float _596 = 1.0 / _588;
    int _598 = as_type<int>(_586) + (-2);
    float _600 = trunc(_594);
    int _602 = int(_600);
    float _604 = in.m_65.w;
    float _606 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _608 = int(_606);
    float _610 = _150 * _596;
    int _612 = ~_558;
    int _614 = _612 + 1;
    float _616 = float(uint(_602));
    float _618 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _620 = int(_618);
    float _622 = as_type<float>(_598) * _616;
    float _624 = float(uint(_608));
    float _626 = trunc(_622);
    float _628 = precise::max(_626, 0.0);
    uint _631 = uint(_628);
    int _633 = ~_608;
    int _635 = _633 + 1;
    bool _637 = _604 > 0.5;
    float _639 = _604;
    bool _641 = _592;
    float _643 = _568;
    if (_592)
    {
        _639 = 1.0;
    }
    float _645 = _639;
    float _647 = _645;
    if (!_592)
    {
        _647 = 1.2345600128173828125;
    }
    float _649 = _647;
    float _651 = 1.0 / _624;
    float _653 = float(_620);
    int _655 = ~_608;
    int _657 = _655 + 1;
    int _659 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _661 = _659 != 0;
    float _663 = trunc(_610);
    int _665 = int(_663);
    int _667 = _614 * int(_631);
    int _669 = _667 + _602;
    int _671 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _673 = _671 != 0;
    float _675 = float(uint(_669));
    int _677 = as_type<int>(_651) + (-2);
    float _679 = 1.0 / _653;
    int _681 = 0;
    float _683 = _675;
    float _685 = _649;
    if (_673)
    {
        float _687 = -_568;
        float _689 = _687 + 1.0;
        _681 = as_type<int>(_689);
    }
    int _691 = _681;
    float _693 = float(uint(_665));
    float _695 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _697 = int(_695);
    float _699 = as_type<float>(_598) * _675;
    float _701 = _693;
    float _703 = _699;
    if (_592)
    {
        _683 = _548;
    }
    float _705 = _683;
    float _707 = as_type<float>(_677) * _693;
    float _709 = _705;
    if (_592)
    {
        _701 = 1.0;
    }
    float _711 = _701;
    float _713 = _711;
    if (!_592)
    {
        _713 = 7.345489978790283203125;
    }
    float _715 = _713;
    float _717 = trunc(_699);
    float _719 = precise::max(_717, 0.0);
    uint _721 = uint(_719);
    if (!_592)
    {
        _709 = _554;
    }
    float _723 = _709;
    float _725 = _150 * _679;
    float _727 = _715 * _548;
    float _729 = _723 * _649;
    float _731 = _723;
    if (_592)
    {
        _731 = _548;
    }
    float _733 = _731;
    float _735 = trunc(_707);
    float _737 = precise::max(_735, 0.0);
    uint _739 = uint(_737);
    float _741 = _733;
    if (_592)
    {
        _685 = 1.0;
    }
    float _743 = _685;
    float _745 = _743;
    if (!_592)
    {
        _741 = _560;
    }
    float _747 = _741;
    if (!_592)
    {
        _745 = 5.839270114898681640625;
    }
    float _749 = _745;
    float _751 = _749;
    if (_661)
    {
        bool _753 = _548 > 0.5;
        _641 = _753;
    }
    bool _755 = _641;
    float _757 = floor(_727);
    int _759 = int(_631) + int(_721);
    float _761 = _747 * _749;
    float _763 = float(_602);
    if (!_661)
    {
        _703 = _568;
    }
    float _765 = _703;
    float _767 = float(uint(_697));
    int _769 = _635 * int(_739);
    int _771 = _769 + _665;
    int _773 = ~_558;
    int _775 = _773 + 1;
    float _777 = floor(_729);
    int _779 = _771;
    float _781 = _765;
    if (!_673)
    {
        _751 = _568;
    }
    float _783 = _751;
    float _785 = float(uint(_771));
    float _787 = _783;
    if (_661)
    {
        float _789 = -_568;
        float _791 = _789 + 1.0;
        _779 = as_type<int>(_791);
    }
    int _793 = _779;
    int _795 = _775 * _759;
    int _797 = _795 + _602;
    float _799 = -_757;
    float _801 = _727 + _799;
    float _803 = float(_558);
    float _805 = as_type<float>(_677) * _785;
    if (_661)
    {
        float _807 = _755 ? as_type<float>(_793) : _568;
        _781 = _807;
    }
    float _809 = _781;
    float _811 = 1.0 / _767;
    bool _813 = uint(_797) >= uint(_558);
    bool _815 = _763 >= _803;
    bool _817 = isnan(_763);
    bool _819 = _815 || _817;
    bool _821 = isnan(_803);
    bool _823 = _819 || _821;
    float _825 = float(_823);
    bool _827 = !_813;
    int _829 = _827 ? 0 : (-1);
    float _831 = -_777;
    float _833 = _729 + _831;
    float _835 = trunc(_805);
    float _837 = precise::max(_835, 0.0);
    uint _839 = uint(_837);
    bool _841 = _560 > 0.5;
    int _843 = _558 + (-1);
    int _845 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _847 = _845 != 0;
    int _849 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _851 = _849 != 0;
    int _853 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _855 = _853 != 0;
    bool _857 = _558 == 0;
    float _859 = trunc(_825);
    int _861 = int(_859);
    if (_673)
    {
        float _863 = _841 ? as_type<float>(_691) : _568;
        _787 = _863;
    }
    float _865 = _787;
    int _867 = as_type<int>(_811) + (-2);
    int _869 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _871 = _869 != 0;
    float _873 = trunc(_725);
    int _875 = int(_873);
    int _877 = int(_739) + int(_839);
    int _879 = ~_759;
    int _881 = _879 + _829;
    int _883 = _881 + 1;
    float _885 = float(_608);
    int _887 = _657 * _877;
    int _889 = _887 + _665;
    float _891 = float(_665);
    int _893 = _558 * _883;
    int _895 = _893 + _602;
    float _897 = 1.0 / _546;
    int _899 = ~_861;
    int _901 = _899 + 1;
    int _903 = _901 + 1;
    float _905 = _885 * _833;
    bool _907 = !_851;
    int _909 = _907 ? 0 : 1;
    bool _911 = !_857;
    int _913 = _911 ? _895 : (-1);
    float _915 = float(uint(_875));
    float _917 = floor(_761);
    bool _919 = _891 >= _885;
    bool _921 = isnan(_891);
    bool _923 = _919 || _921;
    bool _925 = isnan(_885);
    bool _927 = _923 || _925;
    float _929 = float(_927);
    int _931 = _913 * _903;
    bool _933 = !_871;
    int _935 = _933 ? 0 : 1;
    float _937 = as_type<float>(_867) * _915;
    int _939 = abs(_909);
    int _941 = _861 * _843;
    int _943 = _941 + _931;
    float _945 = _801 * _803;
    float _947 = _150 * _803;
    bool _949 = uint(_889) >= uint(_608);
    float _951 = in.m_71.y;
    float _953 = trunc(_929);
    int _955 = int(_953);
    float _957 = _947 * _897;
    bool _959 = !_949;
    int _961 = _959 ? 0 : (-1);
    int _963 = _943 * _939;
    bool _965 = !_847;
    int _967 = _965 ? 0 : 1;
    float _969 = -_917;
    float _971 = _761 + _969;
    int _973 = ~_877;
    int _975 = _973 + _961;
    int _977 = _975 + 1;
    float _979 = _150 * _897;
    float _981 = trunc(_937);
    float _983 = precise::max(_981, 0.0);
    uint _985 = uint(_983);
    int _987 = abs(_935);
    int _989 = _608 * _977;
    int _991 = _989 + _665;
    int _993 = ~_697;
    int _995 = _993 + 1;
    bool _997 = _608 == 0;
    float _999 = trunc(_957);
    int _1001 = int(_999);
    int _1003 = abs(_967);
    int _1005 = ~_955;
    int _1007 = _1005 + 1;
    int _1009 = _1007 + 1;
    bool _1011 = !_997;
    int _1013 = _1011 ? _991 : (-1);
    float _1015 = trunc(_945);
    int _1017 = int(_1015);
    int _1019 = _995 * int(_985);
    int _1021 = _1019 + _875;
    int _1023 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1025 = _1023 != 0;
    int _1027 = _1009 * _1013;
    int _1029 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1031 = _1029 != 0;
    float _1033 = float(uint(_1021));
    int _1035 = _1001 * _1003;
    int _1037 = _1035 + _963;
    bool _1039 = !_855;
    int _1041 = _1039 ? 0 : 1;
    float _1043 = -_951;
    float _1045 = _1043 + 1.0;
    bool _1047 = !_1025;
    int _1049 = _1047 ? 0 : 1;
    float _1051 = as_type<float>(_867) * _1033;
    bool _1053 = _554 > 0.5;
    float _1055 = trunc(_905);
    int _1057 = int(_1055);
    bool _1059 = !_1031;
    int _1061 = _1059 ? 0 : 1;
    int _1063 = _1017 * _987;
    int _1065 = _1063 + _602;
    int _1067 = abs(_1049);
    int _1069 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1071 = _1069 != 0;
    int _1073 = _1053 ? as_type<int>(_1045) : as_type<int>(_951);
    float _1075 = trunc(_1051);
    float _1077 = precise::max(_1075, 0.0);
    uint _1079 = uint(_1077);
    int _1081 = _608 + (-1);
    int _1083 = abs(_1041);
    int _1085 = _637 ? as_type<int>(_1045) : as_type<int>(_951);
    int _1087 = _955 * _1081;
    int _1089 = _1087 + _1027;
    float _1091 = _1071 ? as_type<float>(_1073) : _951;
    int _1093 = _1065 * _1083;
    int _1095 = _1093 + _1037;
    int _1097 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1099 = _1097 != 0;
    int _1101 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1103 = _1101 != 0;
    int _1105 = _1057 * _1067;
    int _1107 = _1105 + _665;
    int _1109 = abs(_1061);
    bool _1111 = !_1103;
    int _1113 = _1111 ? 0 : 1;
    int _1115 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1117 = _1115 != 0;
    int _1119 = abs(_1113);
    float _1121 = _979 * _885;
    float _1123 = _1117 ? as_type<float>(_1085) : _951;
    float _1125 = trunc(_1121);
    int _1127 = int(_1125);
    int _1129 = int(_985) + int(_1079);
    int _1131 = _1089 * _1119;
    int _1133 = ~_697;
    int _1135 = _1133 + 1;
    int _1137 = _1017 * _1109;
    int _1139 = _1137 + _1095;
    bool _1141 = !_1099;
    int _1143 = _1141 ? 0 : 1;
    int _1145 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1147 = _1145 != 0;
    int _1149 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1151 = _1149 != 0;
    int _1153 = _1135 * _1129;
    int _1155 = _1153 + _875;
    int _1157 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1159 = _1157 != 0;
    float _1161 = float(_697);
    float _1163 = float(_875);
    int _1165 = abs(_1143);
    bool _1167 = !_1159;
    int _1169 = _1167 ? 0 : 1;
    bool _1171 = uint(_1155) >= uint(_697);
    int _1173 = _1127 * _1165;
    int _1175 = _1173 + _1131;
    bool _1177 = _1163 >= _1161;
    bool _1179 = isnan(_1163);
    bool _1181 = _1177 || _1179;
    bool _1183 = isnan(_1161);
    bool _1185 = _1181 || _1183;
    float _1187 = float(_1185);
    float _1189 = _979 * _1161;
    bool _1191 = !_1147;
    int _1193 = _1191 ? 0 : 1;
    float _1195 = _1161 * _971;
    float _1197 = float(uint(_1139));
    int _1199 = abs(_1193);
    float _1201 = trunc(_1187);
    int _1203 = int(_1201);
    bool _1205 = !_1151;
    int _1207 = _1205 ? 0 : 1;
    float _1209 = as_type<float>(_598) * _1197;
    bool _1211 = !_1171;
    int _1213 = _1211 ? 0 : (-1);
    int _1215 = abs(_1207);
    float _1217 = trunc(_1209);
    float _1219 = precise::max(_1217, 0.0);
    uint _1221 = uint(_1219);
    int _1223 = ~_1129;
    int _1225 = _1223 + _1213;
    int _1227 = _1225 + 1;
    int _1229 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1231 = _1229 != 0;
    int _1233 = _1107 * _1199;
    int _1235 = _1233 + _1175;
    int _1237 = _697 * _1227;
    int _1239 = _1237 + _875;
    int _1241 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1243 = _1241 != 0;
    int _1245 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1247 = _1245 != 0;
    float _1249 = trunc(_1189);
    int _1251 = int(_1249);
    bool _1253 = _697 == 0;
    int _1255 = _1057 * _1215;
    int _1257 = _1255 + _1235;
    int _1259 = ~_558;
    int _1261 = _1259 + 1;
    int _1263 = ~_1203;
    int _1265 = _1263 + 1;
    int _1267 = _1265 + 1;
    bool _1269 = !_1253;
    int _1271 = _1269 ? _1239 : (-1);
    bool _1273 = !_1247;
    int _1275 = _1273 ? 0 : 1;
    int _1277 = _1267 * _1271;
    bool _1279 = !_1243;
    int _1281 = _1279 ? 0 : 1;
    int _1283 = _1261 * int(_1221);
    int _1285 = _1283 + _1139;
    int _1287 = _697 + (-1);
    float _1289 = trunc(_1195);
    int _1291 = int(_1289);
    int _1293 = abs(_1275);
    float _1295 = float(uint(_1285));
    int _1297 = _1203 * _1287;
    int _1299 = _1297 + _1277;
    float _1301 = float(uint(_1257));
    int _1303 = abs(_1281);
    float _1305 = as_type<float>(_598) * _1295;
    float _1307 = as_type<float>(_677) * _1301;
    bool _1309 = !_1231;
    int _1311 = _1309 ? 0 : 1;
    int _1313 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1315 = _1313 != 0;
    int _1317 = _1299 * _1293;
    float _1319 = trunc(_1307);
    float _1321 = precise::max(_1319, 0.0);
    uint _1323 = uint(_1321);
    int _1325 = abs(_1311);
    bool _1327 = _560 > 0.5;
    int _1329 = _1251 * _1303;
    int _1331 = _1329 + _1317;
    float _1333 = float(uint(_1065));
    float _1335 = trunc(_1305);
    float _1337 = precise::max(_1335, 0.0);
    uint _1339 = uint(_1337);
    int _1341 = abs(_1169);
    int _1343 = ~_608;
    int _1345 = _1343 + 1;
    float _1347 = as_type<float>(_598) * _1333;
    float _1349 = _951;
    if (_1315)
    {
        float _1351 = _1327 ? _1045 : _951;
        _1349 = _1351;
    }
    float _1353 = _1349;
    int _1355 = _1291 * _1341;
    int _1357 = _1355 + _875;
    int _1359 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1361 = _1359 != 0;
    float _1363 = trunc(_1347);
    float _1365 = precise::max(_1363, 0.0);
    uint _1367 = uint(_1365);
    int _1369 = _1357 * _1325;
    int _1371 = _1369 + _1331;
    bool _1373 = !_1361;
    int _1375 = _1373 ? 0 : 1;
    int _1377 = ~_558;
    int _1379 = _1377 + 1;
    int _1381 = _1345 * int(_1323);
    int _1383 = _1381 + _1257;
    int _1385 = abs(_1375);
    int _1387 = int(_1221) + int(_1339);
    float _1389 = float(uint(_1107));
    int _1391 = _1291 * _1385;
    int _1393 = _1391 + _1371;
    int _1395 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1397 = _1395 != 0;
    int _1399 = _1379 * _1387;
    int _1401 = _1399 + _1139;
    float _1403 = float(uint(_1383));
    float _1405 = as_type<float>(_677) * _1389;
    int _1407 = ~_558;
    int _1409 = _1407 + 1;
    float _1411 = float(uint(_1393));
    float _1413 = as_type<float>(_677) * _1403;
    float _1415 = trunc(_1405);
    float _1417 = precise::max(_1415, 0.0);
    uint _1419 = uint(_1417);
    bool _1421 = uint(_1401) >= uint(_558);
    int _1423 = _1409 * int(_1367);
    int _1425 = _1423 + _1065;
    bool _1427 = _608 == 0;
    int _1429 = _1379;
    if (_1397)
    {
        float _1431 = -_568;
        float _1433 = _1431 + 1.0;
        _1429 = as_type<int>(_1433);
    }
    int _1435 = _1429;
    int _1437 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1439 = _1437 != 0;
    float _1441 = trunc(_1413);
    float _1443 = precise::max(_1441, 0.0);
    uint _1445 = uint(_1443);
    float _1447 = float(uint(_1425));
    bool _1449 = !_1421;
    int _1451 = _1449 ? 0 : (-1);
    if (_1397)
    {
        float _1453 = _1053 ? as_type<float>(_1435) : _568;
        _643 = _1453;
    }
    float _1455 = _643;
    float _1457 = as_type<float>(_598) * _1447;
    float _1459 = as_type<float>(_867) * _1411;
    int _1461 = ~_1387;
    int _1463 = _1461 + _1451;
    int _1465 = _1463 + 1;
    float _1467 = float(uint(_1357));
    int _1469 = _1345 * int(_1419);
    int _1471 = _1469 + _1107;
    float _1473 = trunc(_1457);
    float _1475 = precise::max(_1473, 0.0);
    uint _1477 = uint(_1475);
    int _1479 = _558 * _1465;
    int _1481 = _1479 + _1139;
    int _1483 = int(_1323) + int(_1445);
    float _1485 = as_type<float>(_867) * _1467;
    int _1487 = ~_608;
    int _1489 = _1487 + 1;
    float _1491 = float(uint(_1471));
    float _1493 = trunc(_1459);
    float _1495 = precise::max(_1493, 0.0);
    uint _1497 = uint(_1495);
    int _1499 = ~_697;
    int _1501 = _1499 + 1;
    bool _1503 = _558 == 0;
    float _1505 = as_type<float>(_677) * _1491;
    bool _1507 = !_1503;
    int _1509 = _1507 ? _1481 : (-1);
    float _1511 = trunc(_1485);
    float _1513 = precise::max(_1511, 0.0);
    uint _1515 = uint(_1513);
    int _1517 = ~_697;
    int _1519 = _1517 + 1;
    int _1521 = _1489 * _1483;
    int _1523 = _1521 + _1257;
    int _1525 = _1509 & 3;
    bool _1527 = _1525 != 0;
    int _1529 = _1509 & 3;
    bool _1531 = _1529 != 0;
    int _1533 = _1501 * int(_1497);
    int _1535 = _1533 + _1393;
    bool _1537 = uint(_1525) > 1u;
    float _1539 = trunc(_1505);
    float _1541 = precise::max(_1539, 0.0);
    uint _1543 = uint(_1541);
    int _1545 = int(_1367) + int(_1477);
    float _1547 = float(uint(_1535));
    int _1549 = _1531 ? 0 : 1;
    int _1551 = _1519 * int(_1515);
    int _1553 = _1551 + _1357;
    bool _1555 = uint(_1523) >= uint(_608);
    float _1557 = as_type<float>(_867) * _1547;
    int _1559 = ~_558;
    int _1561 = _1559 + 1;
    bool _1563 = !_1555;
    int _1565 = _1563 ? 0 : (-1);
    float _1567 = trunc(_1557);
    float _1569 = precise::max(_1567, 0.0);
    uint _1571 = uint(_1569);
    float _1573 = float(uint(_1553));
    int _1575 = ~_1483;
    int _1577 = _1575 + _1565;
    int _1579 = _1577 + 1;
    float _1581 = as_type<float>(_867) * _1573;
    int _1583 = ~_1549;
    int _1585 = _1583 + 1;
    int _1587 = _1585 + 1;
    int _1589 = _608 * _1579;
    int _1591 = _1589 + _1257;
    int _1593 = _1587;
    int _1595 = _1561;
    if (!_1537)
    {
        int _1597 = ~_1549;
        int _1599 = _1597 + 1;
        _1593 = _1599;
    }
    int _1601 = _1593;
    int _1603 = _1561 * _1545;
    int _1605 = _1603 + _1065;
    bool _1607 = _1525 != 3;
    float _1609 = trunc(_1581);
    float _1611 = precise::max(_1609, 0.0);
    uint _1613 = uint(_1611);
    bool _1615 = uint(_1525) >= 2u;
    int _1617 = ~_697;
    int _1619 = _1617 + 1;
    int _1621 = _1615 ? 0 : 1;
    bool _1623 = uint(_1605) >= uint(_558);
    int _1625 = int(_1497) + int(_1571);
    bool _1627 = !_1427;
    int _1629 = _1627 ? _1591 : (-1);
    bool _1631 = !_1623;
    int _1633 = _1631 ? 0 : (-1);
    int _1635 = _1619 * _1625;
    int _1637 = _1635 + _1393;
    int _1639 = ~_1621;
    int _1641 = _1639 + 1;
    int _1643 = _1641 + 1;
    int _1645 = _1629 & 3;
    bool _1647 = _1645 != 0;
    int _1649 = _1643;
    if (_1607)
    {
        int _1651 = ~_1621;
        int _1653 = _1651 + 1;
        _1649 = _1653;
    }
    int _1655 = _1649;
    int _1657 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1659 = _1657 != 0;
    int _1661 = _1647 ? 0 : 1;
    bool _1663 = uint(_1637) >= uint(_697);
    bool _1665 = !_1659;
    int _1667 = _1665 ? 0 : 1;
    bool _1669 = uint(_1645) >= 2u;
    bool _1671 = !_1663;
    int _1673 = _1671 ? 0 : (-1);
    int _1675 = _1669 ? 0 : 1;
    bool _1677 = _1645 != 3;
    bool _1679 = uint(_1645) > 1u;
    int _1681 = ~_1625;
    int _1683 = _1681 + _1673;
    int _1685 = _1683 + 1;
    int _1687 = int(_1419) + int(_1543);
    int _1689 = ~_608;
    int _1691 = _1689 + 1;
    int _1693 = _697 * _1685;
    int _1695 = _1693 + _1393;
    int _1697 = ~_1675;
    int _1699 = _1697 + 1;
    int _1701 = _1699 + 1;
    int _1703 = ~_1661;
    int _1705 = _1703 + 1;
    int _1707 = _1705 + 1;
    int _1709 = _1691 * _1687;
    int _1711 = _1709 + _1107;
    bool _1713 = !_1253;
    int _1715 = _1713 ? _1695 : (-1);
    int _1717 = _1701;
    int _1719 = _1707;
    if (_1677)
    {
        int _1721 = ~_1675;
        int _1723 = _1721 + 1;
        _1717 = _1723;
    }
    int _1725 = _1717;
    bool _1727 = uint(_1711) >= uint(_608);
    float _1729 = _554 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    if (!_1679)
    {
        int _1731 = ~_1661;
        int _1733 = _1731 + 1;
        _1719 = _1733;
    }
    int _1735 = _1719;
    int _1737 = _1715 & 3;
    bool _1739 = _1737 != 0;
    float _1741 = in.m_73.x;
    float _1743 = in.m_73.y;
    float _1745 = in.m_73.z;
    int _1747 = int(_1515) + int(_1613);
    bool _1749 = !_1727;
    int _1751 = _1749 ? 0 : (-1);
    int _1753 = int(_1613);
    if (_1439)
    {
        _1753 = 0;
    }
    int _1755 = _1753;
    int _1757 = _1755;
    if (_1439)
    {
        _1595 = 0;
    }
    int _1759 = _1595;
    bool _1761 = uint(_1737) >= 2u;
    int _1763 = _1759;
    if (!_1439)
    {
        _1757 = 1;
    }
    int _1765 = _1757;
    if (!_1439)
    {
        _1763 = 2;
    }
    int _1767 = _1763;
    bool _1769 = _1737 != 3;
    int _1771 = _1761 ? 0 : 1;
    int _1773 = ~_697;
    int _1775 = _1773 + 1;
    bool _1777 = uint(_1737) > 1u;
    int _1779 = _1739 ? 0 : 1;
    int _1781 = _1775 * _1747;
    int _1783 = _1781 + _1357;
    int _1785 = ~_1771;
    int _1787 = _1785 + 1;
    int _1789 = _1787 + 1;
    bool _1791 = uint(_1783) >= uint(_697);
    int _1793 = _1789;
    if (_1769)
    {
        int _1795 = ~_1771;
        int _1797 = _1795 + 1;
        _1793 = _1797;
    }
    int _1799 = _1793;
    float _1801 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1803 = _548 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1805 = ~_1779;
    int _1807 = _1805 + 1;
    int _1809 = _1807 + 1;
    int _1811 = _1809;
    if (!_1777)
    {
        int _1813 = ~_1779;
        int _1815 = _1813 + 1;
        _1811 = _1815;
    }
    int _1817 = _1811;
    float _1819 = -_1801;
    float _1821 = fma(_1803, 2.0, _1819);
    bool _1823 = !_1791;
    int _1825 = _1823 ? 0 : (-1);
    bool _1827 = _1765 != 1;
    int _1829 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1831 = _1829 != 0;
    float _1833 = in.m_58.x;
    float _1835 = in.m_58.y;
    float _1837 = in.m_58.z;
    int _1839 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _1841 = _1839 != 0;
    float _1843 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1845 = fma(_1729, -2.0, _1843);
    float _1847 = _508 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1849 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1743);
    float _1851 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1853 = 0.0;
    if (!_1827)
    {
        _1853 = _554;
    }
    float _1855 = _1853;
    float _1857 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1741);
    float _1859 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1861 = _1849 * _550;
    float _1863 = _1857 * _1847;
    float _1865 = fma(_554, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1859);
    float _1867 = 0.0;
    float _1869 = _1855;
    if (!_1827)
    {
        _1867 = _1855;
    }
    float _1871 = _1867;
    float _1873 = fma(_554, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1851);
    float _1875 = _1871;
    if (_1827)
    {
        _1869 = _554;
    }
    float _1877 = _1869;
    float _1879 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1881 = _1879 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1883 = in.m_75.x;
    float _1885 = in.m_75.y;
    float _1887 = in.m_75.z;
    float _1889 = in.m_75.w;
    float _1891 = 0.0;
    float _1893 = _1877;
    if (!_1827)
    {
        _1891 = _1871;
    }
    float _1895 = _1891;
    float _1897 = _1835 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1899 = 1.0 / _1881;
    float _1901 = 0.0;
    float _1903 = _1895;
    if (!_1827)
    {
        _1901 = _560;
    }
    float _1905 = _1901;
    float _1907 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1745);
    float _1909 = 0.0;
    float _1911 = _1905;
    if (!_1827)
    {
        _1909 = _560;
    }
    float _1913 = _1909;
    float _1915 = fma(_1833, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1897);
    float _1917 = _1913;
    if (_1827)
    {
        _1903 = _548;
    }
    float _1919 = _1903;
    float _1921 = _1907 * _552;
    if (_1827)
    {
        _1875 = _548;
    }
    float _1923 = _1875;
    float _1925 = fma(_1837, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1915);
    if (_1827)
    {
        _1911 = _1877;
    }
    float _1927 = _1911;
    float _1929 = _1835 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    if (_1827)
    {
        _1917 = _1877;
    }
    float _1931 = _1917;
    float _1933 = _1835 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _1935 = _1767 != 2;
    float _1937 = fma(_1833, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1929);
    float _1939 = _1861 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1941 = fma(_1833, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1933);
    float _1943 = _564 * _1899;
    float _1945 = fma(_1837, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1937);
    int _1947 = ~_1545;
    int _1949 = _1947 + _1633;
    int _1951 = _1949 + 1;
    float _1953 = fma(_1837, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1941);
    float _1955 = _1885 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1957 = in.m_77.x;
    float _1959 = in.m_77.y;
    float _1961 = in.m_77.z;
    float _1963 = _1885 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1965 = _1885 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1967 = fma(_1883, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1955);
    float _1969 = 0.0;
    if (_1935)
    {
        _1969 = _548;
    }
    float _1971 = _1969;
    float _1973 = fma(_1883, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1963);
    float _1975 = _1971;
    if (!_1935)
    {
        _1975 = _560;
    }
    float _1977 = _1975;
    float _1979 = fma(_1887, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1967);
    if (!_1935)
    {
        _1893 = _548;
    }
    float _1981 = _1893;
    float _1983 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1985 = _540 + _1983;
    bool _1987 = _1743 != 0.0;
    bool _1989 = isnan(_1743);
    bool _1991 = _1987 || _1989;
    bool _1993 = isnan(0.0);
    bool _1995 = _1991 || _1993;
    float _1997 = fma(_1883, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1965);
    bool _1999 = _540 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2001 = isnan(_540);
    bool _2003 = _1999 || _2001;
    bool _2005 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2007 = _2003 || _2005;
    float _2009 = float(_2007);
    float _2011 = fma(_1943, _1985, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _2013 = _1741 == 0.0;
    bool _2015 = !_1995;
    bool _2017 = _2013 && _2015;
    float _2019 = fma(_1887, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1973);
    bool _2021 = _540 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2023 = isnan(_540);
    bool _2025 = _2021 || _2023;
    bool _2027 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2029 = _2025 || _2027;
    float _2031 = float(_2029);
    float _2033 = -_2009;
    float _2035 = _2033 + 1.0;
    bool _2037 = _1745 == 0.0;
    bool _2039 = _2037 && _2017;
    float _2041 = fma(_1887, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1997);
    float _2043 = _1861 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2045 = _2031 * _2035;
    float _2047 = _1861 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2049 = -_2031;
    float _2051 = _2049 + 1.0;
    out.m_79.x = _2019;
    out.m_79.y = _2041;
    out.m_79.z = _1979;
    float _2053 = _2011 * _2045;
    float _2055 = fma(_1863, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1939);
    int _2057 = ~_1687;
    int _2059 = _2057 + _1751;
    int _2061 = _2059 + 1;
    int _2063 = _558 * _1951;
    int _2065 = _2063 + _1065;
    float _2067 = fma(_2051, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2053);
    int _2069 = ~_1747;
    int _2071 = _2069 + _1825;
    int _2073 = _2071 + 1;
    float _2075 = _1953 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2077 = _2051;
    float _2079 = _2041;
    if (_2039)
    {
        _2077 = _1961;
    }
    float _2081 = _2077;
    int _2083 = _608 * _2061;
    int _2085 = _2083 + _1107;
    int _2087 = abs(_1667);
    float _2089 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2091 = int(_2089);
    float _2093 = fma(_1863, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2043);
    float _2095 = fma(_1863, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2047);
    float _2097 = fma(_1921, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2055);
    float _2099 = _2095;
    float _2101 = _2081;
    float _2103 = _2093;
    if (_2039)
    {
        _2079 = _1959;
    }
    float _2105 = _2079;
    float _2107 = fma(_1921, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2093);
    float _2109 = fma(_1921, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2095);
    float _2111 = _2105;
    if (_2039)
    {
        _2099 = _2081;
    }
    float _2113 = _2099;
    float _2115 = _2113;
    if (!_2039)
    {
        float _2117 = fma(_1743, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1959);
        _2111 = _2117;
    }
    float _2119 = _2111;
    if (!_2039)
    {
        _2101 = _1961;
    }
    float _2121 = _2101;
    float _2123 = fma(_2009, (*spvDescriptorSet0.vp_c9)._m0[132].x, _2067);
    int _2125 = _1509 >> 31;
    float _2127 = _1887 * _1957;
    if (_2039)
    {
        _2103 = _1957;
    }
    float _2129 = _2103;
    float _2131 = _1885 * _2121;
    int _2133 = _2125 & 3;
    float _2135 = _2129;
    if (!_2039)
    {
        float _2137 = fma(_1741, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1957);
        _2135 = _2137;
    }
    float _2139 = _2135;
    if (!_2039)
    {
        float _2141 = fma(_1745, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2121);
        _2115 = _2141;
    }
    float _2143 = _2115;
    float _2145 = -_2131;
    float _2147 = fma(_1887, _1959, _2145);
    int _2149 = _1509 + _2133;
    float _2151 = _1883 * _1959;
    int _2153 = _1629 >> 31;
    float _2155 = -_2127;
    float _2157 = fma(_1883, _2121, _2155);
    int _2159 = _2149 >> 2;
    float _2161 = -_2151;
    float _2163 = fma(_1885, _1957, _2161);
    int _2165 = _1715 >> 31;
    float _2167 = _2119 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2169 = _2153 & 3;
    float _2171 = _2157 * _1889;
    int _2173 = _2159 << 4;
    int _2175 = _2173 + 368;
    float _2177 = _2163 * _1889;
    int _2179 = _2165 & 3;
    float _2181 = _2119 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    uint _2183 = uint(int(uint(_2175) >> uint(2)));
    uint _2185 = uint(int(uint(int(_2183)) >> uint(2)));
    int _2187 = int(_2183) & 3;
    float _2189 = (*spvDescriptorSet0.vp_c9)._m0[int(_2185)][_2187];
    int _2191 = int(_2183) + 1;
    uint _2193 = uint(int(uint(_2191) >> uint(2)));
    int _2195 = _2191 & 3;
    float _2197 = (*spvDescriptorSet0.vp_c9)._m0[int(_2193)][_2195];
    int _2199 = _1629 + _2169;
    float _2201 = fma(_2139, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2181);
    int _2203 = _1715 + _2179;
    float _2205 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    int _2207 = _2199 >> 2;
    float _2209 = _1977 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    int _2211 = _697 * _2073;
    int _2213 = _2211 + _1357;
    int _2215 = _2207 << 4;
    int _2217 = _2215 + 512;
    float _2219 = -_2205;
    float _2221 = fma(_2209, 2.0, _2219);
    int _2223 = _2203 >> 2;
    float _2225 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    uint _2227 = uint(int(uint(_2217) >> uint(2)));
    uint _2229 = uint(int(uint(int(_2227)) >> uint(2)));
    int _2231 = int(_2227) & 3;
    float _2233 = (*spvDescriptorSet0.vp_c9)._m0[int(_2229)][_2231];
    int _2235 = int(_2227) + 1;
    uint _2237 = uint(int(uint(_2235) >> uint(2)));
    int _2239 = _2235 & 3;
    float _2241 = (*spvDescriptorSet0.vp_c9)._m0[int(_2237)][_2239];
    int _2243 = _2223 << 4;
    int _2245 = _2243 + 656;
    float _2247 = fma(_1923, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2225);
    int _2249 = _1629 & 3;
    bool _2251 = _2249 != 0;
    float _2253 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2255 = fma(_2139, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2167);
    int _2257 = abs(_1601);
    float _2259 = _1945 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    uint _2261 = uint(int(uint(_2245) >> uint(2)));
    uint _2263 = uint(int(uint(int(_2261)) >> uint(2)));
    int _2265 = int(_2261) & 3;
    float _2267 = (*spvDescriptorSet0.vp_c9)._m0[int(_2263)][_2265];
    int _2269 = int(_2261) + 1;
    uint _2271 = uint(int(uint(_2269) >> uint(2)));
    int _2273 = _2269 & 3;
    float _2275 = (*spvDescriptorSet0.vp_c9)._m0[int(_2271)][_2273];
    bool _2277 = !_2251;
    int _2279 = _2277 ? 0 : 1;
    float _2281 = fma(_1931, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2253);
    int _2283 = _1715 & 3;
    bool _2285 = _2283 != 0;
    float _2287 = _2147 * _1889;
    float _2289 = _2119 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2291 = abs(_2279);
    float _2293 = _2107 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _2295 = _2245 + 8;
    uint _2297 = uint(int(uint(_2295) >> uint(2)));
    uint _2299 = uint(int(uint(int(_2297)) >> uint(2)));
    int _2301 = int(_2297) & 3;
    float _2303 = (*spvDescriptorSet0.vp_c9)._m0[int(_2299)][_2301];
    int _2305 = int(_2297) + 1;
    uint _2307 = uint(int(uint(_2305) >> uint(2)));
    int _2309 = _2305 & 3;
    float _2311 = (*spvDescriptorSet0.vp_c9)._m0[int(_2307)][_2309];
    bool _2313 = !_2285;
    int _2315 = _2313 ? 0 : 1;
    float _2317 = fma(_2139, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2289);
    bool _2319 = _1525 != 3;
    int _2321 = ~_2291;
    int _2323 = _2321 + 1;
    int _2325 = _2323 + 1;
    bool _2327 = !_2319;
    int _2329 = _2327 ? 0 : (-1);
    int _2331 = _2175 + 8;
    uint _2333 = uint(int(uint(_2331) >> uint(2)));
    uint _2335 = uint(int(uint(int(_2333)) >> uint(2)));
    int _2337 = int(_2333) & 3;
    float _2339 = (*spvDescriptorSet0.vp_c9)._m0[int(_2335)][_2337];
    int _2341 = int(_2333) + 1;
    uint _2343 = uint(int(uint(_2341) >> uint(2)));
    int _2345 = _2341 & 3;
    float _2347 = (*spvDescriptorSet0.vp_c9)._m0[int(_2343)][_2345];
    bool _2349 = _1645 != 3;
    float _2351 = _1927 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _2353 = ~_2257;
    int _2355 = _2353 + 1;
    int _2357 = _2355 + 1;
    bool _2359 = !_1527;
    int _2361 = _2359 ? 0 : 1;
    bool _2363 = !_2349;
    int _2365 = _2363 ? 0 : (-1);
    int _2367 = _2217 + 8;
    uint _2369 = uint(int(uint(_2367) >> uint(2)));
    uint _2371 = uint(int(uint(int(_2369)) >> uint(2)));
    int _2373 = int(_2369) & 3;
    float _2375 = (*spvDescriptorSet0.vp_c9)._m0[int(_2371)][_2373];
    int _2377 = int(_2369) + 1;
    uint _2379 = uint(int(uint(_2377) >> uint(2)));
    int _2381 = _2377 & 3;
    float _2383 = (*spvDescriptorSet0.vp_c9)._m0[int(_2379)][_2381];
    int _2385 = abs(_2361);
    int _2387 = _2357 * as_type<int>(_2197);
    int _2389 = abs(_1735);
    int _2391 = abs(_1817);
    int _2393 = ~_2389;
    int _2395 = _2393 + 1;
    int _2397 = _2395 + 1;
    int _2399 = ~_2391;
    int _2401 = _2399 + 1;
    int _2403 = _2401 + 1;
    int _2405 = ~_2385;
    int _2407 = _2405 + 1;
    int _2409 = _2407 + 1;
    bool _2411 = _1737 != 3;
    int _2413 = abs(_2329);
    int _2415 = _2397 * as_type<int>(_2241);
    int _2417 = abs(_2315);
    int _2419 = _2409 * as_type<int>(_2189);
    int _2421 = _2419 + _2387;
    int _2423 = abs(_1725);
    int _2425 = _2325 * as_type<int>(_2233);
    int _2427 = _2425 + _2415;
    int _2429 = abs(_1799);
    float _2431 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2433 = int(_2431);
    int _2435 = ~_2417;
    int _2437 = _2435 + 1;
    int _2439 = _2437 + 1;
    int _2441 = _2403 * as_type<int>(_2275);
    int _2443 = abs(_1655);
    int _2445 = ~_2429;
    int _2447 = _2445 + 1;
    int _2449 = _2447 + 1;
    int _2451 = _2439 * as_type<int>(_2267);
    int _2453 = _2451 + _2441;
    int _2455 = ~_2443;
    int _2457 = _2455 + 1;
    int _2459 = _2457 + 1;
    float _2461 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _2463 = int(_2461);
    int _2465 = abs(_2365);
    int _2467 = _2449 * as_type<int>(_2303);
    int _2469 = _2467 + _2453;
    bool _2471 = !_2411;
    int _2473 = _2471 ? 0 : (-1);
    int _2475 = ~_2423;
    int _2477 = _2475 + 1;
    int _2479 = _2477 + 1;
    int _2481 = ~_2413;
    int _2483 = _2481 + 1;
    int _2485 = _2483 + 1;
    int _2487 = _2459 * as_type<int>(_2339);
    int _2489 = _2487 + _2421;
    int _2491 = abs(_2473);
    int _2493 = _2485 * as_type<int>(_2347);
    int _2495 = _2493 + _2489;
    int _2497 = ~_2491;
    int _2499 = _2497 + 1;
    int _2501 = _2499 + 1;
    float _2503 = float(uint(_2433));
    int _2505 = _2479 * as_type<int>(_2375);
    int _2507 = _2505 + _2427;
    int _2509 = ~_2465;
    int _2511 = _2509 + 1;
    int _2513 = _2511 + 1;
    int _2515 = _2501 * as_type<int>(_2311);
    int _2517 = _2515 + _2469;
    bool _2519 = !_1831;
    int _2521 = _2519 ? 0 : 1;
    float _2523 = _2109 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2525 = float(uint(_2091));
    float _2527 = 1.0 / _2503;
    int _2529 = abs(_2521);
    float _2531 = _2097 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    int _2533 = _2513 * as_type<int>(_2383);
    int _2535 = _2533 + _2507;
    float _2537 = _2075 + _2523;
    int _2539 = ~_2087;
    int _2541 = _2539 + 1;
    int _2543 = _2541 + 1;
    float _2545 = 1.0 / _2525;
    int _2547 = ~_2529;
    int _2549 = _2547 + 1;
    int _2551 = _2549 + 1;
    bool _2553 = !_1427;
    int _2555 = _2553 ? _2085 : (-1);
    int _2557 = _2495 * _2543;
    bool _2559 = !_1841;
    int _2561 = _2559 ? 0 : 1;
    int _2563 = _2551 * _2535;
    bool _2565 = !_1503;
    int _2567 = _2565 ? _2065 : (-1);
    float _2569 = float(uint(_2463));
    int _2571 = _2555 * _2529;
    int _2573 = _2571 + _2563;
    int _2575 = abs(_2561);
    int _2577 = _2567 * _2087;
    int _2579 = _2577 + _2557;
    int _2581 = abs(_2091);
    float _2583 = _1925 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _2585 = ~_2575;
    int _2587 = _2585 + 1;
    int _2589 = _2587 + 1;
    float _2591 = 1.0 / _2569;
    int _2593 = as_type<int>(_2527) + (-2);
    float _2595 = _2583 + _2531;
    float _2597 = float(uint(_2573));
    int _2599 = _2589 * _2517;
    float _2601 = float(uint(_2581));
    float _2603 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2605 = _2595 + _2603;
    int _2607 = abs(_2433);
    float _2609 = as_type<float>(_2593) * _2597;
    int _2611 = as_type<int>(_2545) + (-2);
    float _2613 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2615 = _2537 + _2613;
    float _2617 = float(uint(_2579));
    float _2619 = 1.0 / _2601;
    bool _2621 = !_1253;
    int _2623 = _2621 ? _2213 : (-1);
    float _2625 = _2605 * _2605;
    float _2627 = float(uint(_2607));
    float _2629 = as_type<float>(_2611) * _2617;
    float _2631 = _2615 * _2615;
    int _2633 = _2623 * _2575;
    int _2635 = _2633 + _2599;
    int _2637 = as_type<int>(_2591) + (-2);
    float _2639 = trunc(_2609);
    float _2641 = precise::max(_2639, 0.0);
    uint _2643 = uint(_2641);
    float _2645 = _2625 + _2631;
    float _2647 = float(uint(_2635));
    float _2649 = _1919 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _2651 = abs(_2463);
    float _2653 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _2655 = abs(_2579);
    float _2657 = 1.0 / _2627;
    float _2659 = as_type<float>(_2637) * _2647;
    int _2661 = ~_2433;
    int _2663 = _2661 + 1;
    float _2665 = fma(_2351, -2.0, _2653);
    float _2667 = float(uint(_2651));
    int _2669 = as_type<int>(_2619) + (-2);
    float _2671 = trunc(_2629);
    float _2673 = precise::max(_2671, 0.0);
    uint _2675 = uint(_2673);
    float _2677 = float(uint(_2655));
    int _2679 = _2663 * int(_2643);
    int _2681 = _2679 + _2573;
    int _2683 = abs(_2573);
    float _2685 = as_type<float>(_2669) * _2677;
    int _2687 = ~_2091;
    int _2689 = _2687 + 1;
    float _2691 = sqrt(_2645);
    float _2693 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _2695 = as_type<int>(_2657) + (-2);
    float _2697 = float(uint(_2683));
    float _2699 = -_2693;
    float _2701 = fma(_2649, 2.0, _2699);
    float _2703 = float(uint(_2681));
    float _2705 = 1.0 / _2667;
    int _2707 = _2689 * int(_2675);
    int _2709 = _2707 + _2579;
    float _2711 = as_type<float>(_2695) * _2697;
    float _2713 = as_type<float>(_2593) * _2703;
    int _2715 = abs(_2635);
    float _2717 = float(uint(_2709));
    float _2719 = trunc(_2659);
    float _2721 = precise::max(_2719, 0.0);
    uint _2723 = uint(_2721);
    bool _2725 = _2691 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2727 = as_type<float>(_2611) * _2717;
    int _2729 = ~_2463;
    int _2731 = _2729 + 1;
    float _2733 = _1981 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _2735 = float(uint(_2715));
    float _2737 = trunc(_2685);
    float _2739 = precise::max(_2737, 0.0);
    uint _2741 = uint(_2739);
    int _2743 = as_type<int>(_2705) + (-2);
    float _2745 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _2747 = ~_2581;
    int _2749 = _2747 + 1;
    float _2751 = _2259 + _2293;
    float _2753 = as_type<float>(_2743) * _2735;
    float _2755 = fma(_2733, -2.0, _2745);
    float _2757 = trunc(_2711);
    float _2759 = precise::max(_2757, 0.0);
    uint _2761 = uint(_2759);
    int _2763 = _2731 * int(_2723);
    int _2765 = _2763 + _2635;
    float _2767 = float(uint(_2765));
    float _2769 = trunc(_2713);
    float _2771 = precise::max(_2769, 0.0);
    uint _2773 = uint(_2771);
    int _2775 = _2749 * int(_2741);
    int _2777 = _2775 + _2655;
    float _2779 = trunc(_2753);
    float _2781 = precise::max(_2779, 0.0);
    uint _2783 = uint(_2781);
    float _2785 = trunc(_2727);
    float _2787 = precise::max(_2785, 0.0);
    uint _2789 = uint(_2787);
    int _2791 = ~_2607;
    int _2793 = _2791 + 1;
    float _2795 = float(uint(_2777));
    bool _2797 = !_2725;
    float _2799 = _2751;
    float _2801 = _2625;
    float _2803 = _2631;
    float _2805 = _2537;
    float _2807 = _2595;
    if (!_2797)
    {
        float _2809 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2811 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2813 = _2691 + _2811;
        float _2815 = rsqrt(_2645);
        float _2817 = _2813 * _2809;
        float _2819 = _2751 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2821 = _2817 * 0.15915493667125701904296875;
        float _2823 = _2821 * 6.283185482025146484375;
        float _2825 = sin(_2823);
        float _2827 = _2821 * 6.283185482025146484375;
        float _2829 = cos(_2827);
        float _2831 = fma(_2825, _2819, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2833 = _2815 * _2831;
        float _2835 = _2829 + (-1.0);
        float _2837 = fma(_2605, _2833, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2839 = fma(_2615, _2833, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2841 = _2835 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2843 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2845 = _2837 + _2843;
        float _2847 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2849 = _2839 + _2847;
        float _2851 = fma(_2751, _2829, _2841);
        float _2853 = _2845 * _2845;
        float _2855 = _2849 * _2849;
        _2799 = _2851;
        _2801 = _2853;
        _2803 = _2855;
        _2805 = _2839;
        _2807 = _2837;
    }
    float _2857 = _2799;
    float _2859 = _2801;
    float _2861 = _2803;
    float _2863 = _2805;
    float _2865 = _2807;
    int _2867 = _2793 * int(_2761);
    int _2869 = _2867 + _2683;
    float _2871 = as_type<float>(_2637) * _2767;
    float _2873 = as_type<float>(_2669) * _2795;
    int _2875 = ~_2651;
    int _2877 = _2875 + 1;
    float _2879 = _2171 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2881 = _2171 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2883 = _2171 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2885 = float(uint(_2869));
    int _2887 = _2877 * int(_2783);
    int _2889 = _2887 + _2715;
    float _2891 = trunc(_2873);
    float _2893 = precise::max(_2891, 0.0);
    uint _2895 = uint(_2893);
    float _2897 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2899 = _2857 + _2897;
    int _2901 = int(_2675) + int(_2789);
    float _2903 = as_type<float>(_2695) * _2885;
    float _2905 = float(uint(_2889));
    float _2907 = fma(_2899, _2899, _2859);
    int _2909 = ~_2091;
    int _2911 = _2909 + 1;
    float _2913 = -_150;
    float _2915 = fma(_2913, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1821);
    float _2917 = trunc(_2871);
    float _2919 = precise::max(_2917, 0.0);
    uint _2921 = uint(_2919);
    float _2923 = as_type<float>(_2743) * _2905;
    int _2925 = int(_2643) + int(_2773);
    float _2927 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[77].z, _582);
    int _2929 = ~_2433;
    int _2931 = _2929 + 1;
    float _2933 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1845);
    int _2935 = ~_2581;
    int _2937 = _2935 + 1;
    float _2939 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1865);
    float _2941 = trunc(_2903);
    float _2943 = precise::max(_2941, 0.0);
    uint _2945 = uint(_2943);
    int _2947 = int(_2741) + int(_2895);
    float _2949 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[87].z, _584);
    int _2951 = ~_2463;
    int _2953 = _2951 + 1;
    float _2955 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1873);
    float _2957 = -_150;
    float _2959 = fma(_2957, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2221);
    float _2961 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2247);
    float _2963 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2281);
    float _2965 = trunc(_2923);
    float _2967 = precise::max(_2965, 0.0);
    uint _2969 = uint(_2967);
    int _2971 = int(_2723) + int(_2921);
    float _2973 = -_150;
    float _2975 = fma(_2973, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2701);
    float _2977 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2665);
    int _2979 = _2911 * _2901;
    int _2981 = _2979 + _2579;
    float _2983 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2755);
    int _2985 = _2953 * _2971;
    int _2987 = _2985 + _2635;
    int _2989 = ~_2607;
    int _2991 = _2989 + 1;
    int _2993 = _2931 * _2925;
    int _2995 = _2993 + _2573;
    int _2997 = int(_2761) + int(_2945);
    int _2999 = _2937 * _2947;
    int _3001 = _2999 + _2655;
    bool _3003 = uint(_2981) >= uint(_2091);
    float _3005 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _3007 = uint(_2987) >= uint(_2463);
    int _3009 = _2991 * _2997;
    int _3011 = _3009 + _2683;
    bool _3013 = uint(_2995) >= uint(_2433);
    float _3015 = _2907 + _2861;
    bool _3017 = uint(_3001) >= uint(_2581);
    float _3019 = fma(_2287, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2879);
    bool _3021 = !_3003;
    int _3023 = _3021 ? 0 : (-1);
    float _3025 = fma(_2287, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2881);
    bool _3027 = !_3007;
    int _3029 = _3027 ? 0 : (-1);
    float _3031 = sqrt(_3015);
    int _3033 = int(_2783) + int(_2969);
    float _3035 = fma(_2287, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2883);
    int _3037 = ~_2651;
    int _3039 = _3037 + 1;
    float _3041 = fma(_2143, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2255);
    bool _3043 = uint(_3011) >= uint(_2607);
    float _3045 = _3005 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _3047 = !_3013;
    int _3049 = _3047 ? 0 : (-1);
    int _3051 = _3039 * _3033;
    int _3053 = _3051 + _2715;
    int _3055 = ~_2901;
    int _3057 = _3055 + _3023;
    int _3059 = _3057 + 1;
    float _3061 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _3063 = ~_2971;
    int _3065 = _3063 + _3029;
    int _3067 = _3065 + 1;
    float _3069 = fma(_3045, _809, -0.5);
    int _3071 = ~_2925;
    int _3073 = _3071 + _3049;
    int _3075 = _3073 + 1;
    int _3077 = _2091 * _3059;
    int _3079 = _3077 + _2579;
    bool _3081 = _2091 == 0;
    int _3083 = _2463 * _3067;
    int _3085 = _3083 + _2635;
    bool _3087 = uint(_3053) >= uint(_2651);
    float _3089 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _3091 = _2579 ^ _2091;
    int _3093 = _2433 * _3075;
    int _3095 = _3093 + _2573;
    bool _3097 = _2433 == 0;
    float _3099 = fma(_2143, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2201);
    bool _3101 = _2091 == 0;
    bool _3103 = !_3017;
    int _3105 = _3103 ? 0 : (-1);
    float _3107 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _3109 = !_3081;
    int _3111 = _3109 ? _3079 : (-1);
    bool _3113 = _2433 == 0;
    int _3115 = _2573 ^ _2433;
    bool _3117 = !_3043;
    int _3119 = _3117 ? 0 : (-1);
    float _3121 = _3089 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _3123 = _2463 == 0;
    bool _3125 = _2463 == 0;
    float _3127 = fma(_3121, _865, -0.5);
    int _3129 = _2635 ^ _2463;
    uint _3131 = uint(int(uint(_3091) >> uint(31)));
    bool _3133 = !_3097;
    int _3135 = _3133 ? _3095 : (-1);
    float _3137 = float(_3111);
    int _3139 = ~_3105;
    int _3141 = _2947 + _3139;
    int _3143 = _3141 + 1;
    int _3145 = ~_3119;
    int _3147 = _2997 + _3145;
    int _3149 = _3147 + 1;
    float _3151 = fma(_3045, _3137, _2915);
    uint _3153 = uint(int(uint(_3115) >> uint(31)));
    float _3155 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _3157 = ~int(_3131);
    int _3159 = _3157 + 1;
    float _3161 = _3061 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _3163 = float(_3135);
    float _3165 = fma(_2927, _3069, _3151);
    bool _3167 = !_3087;
    int _3169 = _3167 ? 0 : (-1);
    float _3171 = fma(_3161, _1455, -0.5);
    uint _3173 = uint(int(uint(_3129) >> uint(31)));
    float _3175 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _3177 = !_3123;
    int _3179 = _3177 ? _3085 : (-1);
    float _3181 = fma(_3121, _3163, _2975);
    int _3183 = ~int(_3153);
    int _3185 = _3183 + 1;
    int _3187 = _3143 ^ _3159;
    float _3189 = fma(_2961, _3127, _3181);
    int _3191 = ~_3169;
    int _3193 = _3033 + _3191;
    int _3195 = _3193 + 1;
    float _3197 = _3107 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _3199 = ~int(_3173);
    int _3201 = _3199 + 1;
    float _3203 = float(_3179);
    int _3205 = _3149 ^ _3185;
    int _3207 = ~_3159;
    int _3209 = _3207 + _3187;
    int _3211 = _3209 + 1;
    float _3213 = fma(_3161, _3203, _2959);
    int _3215 = _3195 ^ _3201;
    int _3217 = ~_3185;
    int _3219 = _3217 + _3205;
    int _3221 = _3219 + 1;
    float _3223 = fma(_2949, _3171, _3213);
    bool _3225 = !_3101;
    int _3227 = _3225 ? _3211 : (-1);
    float _3229 = _3155 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _3231 = ~_3201;
    int _3233 = _3231 + _3215;
    int _3235 = _3233 + 1;
    float _3237 = _3175 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    bool _3239 = !_3113;
    int _3241 = _3239 ? _3221 : (-1);
    float _3243 = fma(_1091, _3197, -0.5);
    float _3245 = float(_3227);
    bool _3247 = !_3125;
    int _3249 = _3247 ? _3235 : (-1);
    float _3251 = float(_3241);
    float _3253 = -_2933;
    float _3255 = fma(_3197, _3245, _3253);
    float _3257 = float(_3249);
    float _3259 = fma(_1123, _3229, -0.5);
    float _3261 = fma(_3237, _1353, -0.5);
    float _3263 = -_2977;
    float _3265 = fma(_3229, _3251, _3263);
    float _3267 = fma(_2939, _3243, _3255);
    float _3269 = -_2983;
    float _3271 = fma(_3237, _3257, _3269);
    float _3273 = fma(_2963, _3259, _3265);
    float _3275 = fma(_2955, _3261, _3271);
    float _3277 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _3279 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _3281 = fma(_2177, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3019);
    float _3283 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _3285 = fma(_2177, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3025);
    float _3287 = fma(_2177, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3035);
    float _3289 = _3277 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3291 = _3279 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3293 = _3283 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3295 = _2123 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _3297 = fma(_2143, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2317);
    float _3299 = _3223 + 0.5;
    float _3301 = _3165 + 0.5;
    float _3303 = _3189 + 0.5;
    float _3305 = _3267 + 0.5;
    float _3307 = _3273 + 0.5;
    float _3309 = _3275 + 0.5;
    out.m_81.x = _3289;
    out.m_81.y = _3291;
    out.m_81.z = _3293;
    out.m_81.w = _3295;
    bool _3311 = _3031 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _3313 = isnan(_3031);
    bool _3315 = _3311 || _3313;
    bool _3317 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _3319 = _3315 || _3317;
    out.m_83.x = _3281;
    out.m_83.y = _3285;
    out.m_83.z = _3287;
    out.m_85.x = _3301;
    out.m_85.y = _3305;
    out.m_85.z = _3303;
    out.m_85.w = _3307;
    out.m_87.x = _3299;
    out.m_87.y = _3309;
    float _3321 = _3151;
    int _3323 = as_type<int>(_2865);
    if (!_3319)
    {
        _3321 = 1.0;
    }
    float _3325 = _3321;
    out.m_89.x = _3297;
    out.m_89.y = _3041;
    out.m_89.z = _3099;
    bool _3327 = !_3319;
    float _3329 = _3325;
    if (!_3327)
    {
        bool _3331 = _3031 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _3333 = isnan(_3031);
        bool _3335 = _3331 || _3333;
        bool _3337 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _3339 = _3335 || _3337;
        if (!_3339)
        {
            float _3341 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3343 = _3031 + _3341;
            float _3345 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3347 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _3345;
            float _3349 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _3351 = _3349 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _3353 = 1.0 / _3347;
            float _3355 = _3343 * _3353;
            float _3357 = fma(_3355, _3351, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _3329 = _3357;
            _3359 = true;
        }
        else
        {
            bool _3361 = _3031 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _3363 = isnan(_3031);
            bool _3365 = _3361 || _3363;
            bool _3367 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _3369 = _3365 || _3367;
            if (!_3369)
            {
                float _3371 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3373 = _3031 + _3371;
                float _3375 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3377 = _3375 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _3379 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _3381 = _3379 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _3383 = 1.0 / _3377;
                float _3385 = _3373 * _3383;
                float _3387 = fma(_3385, _3381, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _3329 = _3387;
                _3359 = true;
            }
            else
            {
                _3329 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _3359 = false;
    float _3389 = _3329;
    float _3391 = fma(_2583, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _3393 = fma(_2075, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _3395 = floor(_3391);
    float _3397 = floor(_3393);
    float _3399 = -_3395;
    float _3401 = _3391 + _3399;
    float _3403 = -_3397;
    float _3405 = _3393 + _3403;
    float2 _9624 = float2(_3401, _3405);
    float _3407 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_9624, float2(0.0), isnan(_9624)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_9624, float2(0.0), isnan(_9624)), level(0.0)).x;
    float _3409 = _2259 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3411 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _3413 = _2863 + _3411;
    float _3415 = fma(_2583, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3409);
    float _3417 = fma(_3413, _3389, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _3419 = fma(_2075, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3415);
    float _3421 = _2259 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3423 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    bool _3425 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _3427 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _3429 = _3425 || _3427;
    bool _3431 = isnan(0.5);
    bool _3433 = _3429 || _3431;
    float _3435 = _3419 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3437 = fma(_2583, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3421);
    float _3439 = _2259 + _3423;
    float _3441 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _3443 = _2857 + _3441;
    float _3445 = 1.0 / _3435;
    float _3447 = fma(_2075, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3437);
    float _3449 = _3439 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _3451 = fma(_3443, _3389, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _3453 = _3447 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3455 = fma(_2583, (*spvDescriptorSet0.vp_c15)._m0[126].x, _3449);
    float _3457 = _3453 + _3435;
    float _3459 = fma(_2075, (*spvDescriptorSet0.vp_c15)._m0[126].z, _3455);
    float _3461 = _3459 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _3463 = _3457 * _3445;
    float _3465 = _3463 * 0.5;
    float _3467 = trunc(_3461);
    int _3469 = int(_3467);
    float _3471 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3473 = fma(_3465, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3471);
    float _3475 = 1.0 / _3473;
    int _3477 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _3479 = _3469 + _3477;
    int _3481 = _3479 + 1;
    float _3483 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _3485 = _2865 + _3483;
    float _3487 = fma(_3485, _3389, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _3489 = _3389;
    float _3491 = _3485;
    int _3493 = 2;
    if (_3433)
    {
        _3489 = _3451;
    }
    float _3495 = _3489;
    float _3497 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3499 = _3475 * _3497;
    float _3501 = _3439 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _3503 = _3495;
    if (_3433)
    {
        _3491 = _3487;
    }
    float _3505 = _3491;
    bool _3507 = _3499 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _3509 = fma(_2583, (*spvDescriptorSet0.vp_c15)._m0[127].x, _3501);
    bool _3511 = _3499 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _3513 = !_3507;
    int _3515 = _3513 ? 0 : 1;
    float _3517 = fma(_2075, (*spvDescriptorSet0.vp_c15)._m0[127].z, _3509);
    float _3519 = _3517 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _3521 = _3505;
    if (!_3507)
    {
        _3493 = 1;
    }
    int _3523 = _3493;
    float _3525 = trunc(_3519);
    int _3527 = int(_3525);
    int _3529 = _3523;
    if (!_3511)
    {
        _3529 = _3515;
    }
    int _3531 = _3529;
    bool _3533 = _3481 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _3535 = _3531 << 6;
    int _3537 = _3535 + 48;
    uint _3539 = uint(int(uint(_3537) >> uint(2)));
    uint _3541 = uint(int(uint(int(_3539)) >> uint(2)));
    int _3543 = int(_3539) & 3;
    float _3545 = (*spvDescriptorSet0.vp_c15)._m0[int(_3541)][_3543];
    int _3547 = int(_3539) + 1;
    uint _3549 = uint(int(uint(_3547) >> uint(2)));
    int _3551 = _3547 & 3;
    float _3553 = (*spvDescriptorSet0.vp_c15)._m0[int(_3549)][_3551];
    int _3555 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _3557 = _3527 + _3555;
    int _3559 = _3557 + 1;
    int _3561 = _3535 + 56;
    uint _3563 = uint(int(uint(_3561) >> uint(2)));
    uint _3565 = uint(int(uint(int(_3563)) >> uint(2)));
    int _3567 = int(_3563) & 3;
    float _3569 = (*spvDescriptorSet0.vp_c15)._m0[int(_3565)][_3567];
    int _3571 = int(_3563) + 1;
    uint _3573 = uint(int(uint(_3571) >> uint(2)));
    int _3575 = _3571 & 3;
    float _3577 = (*spvDescriptorSet0.vp_c15)._m0[int(_3573)][_3575];
    int _3579 = _3481 | _3559;
    bool _3581 = _3579 < 0;
    bool _3583 = _3581 || _3533;
    int _3585 = _3535 + 64;
    uint _3587 = uint(int(uint(_3585) >> uint(2)));
    uint _3589 = uint(int(uint(int(_3587)) >> uint(2)));
    int _3591 = int(_3587) & 3;
    float _3593 = (*spvDescriptorSet0.vp_c15)._m0[int(_3589)][_3591];
    int _3595 = int(_3587) + 1;
    uint _3597 = uint(int(uint(_3595) >> uint(2)));
    int _3599 = _3595 & 3;
    float _3601 = (*spvDescriptorSet0.vp_c15)._m0[int(_3597)][_3599];
    float _3603 = as_type<float>(_3579);
    if (_3433)
    {
        _3603 = _3417;
    }
    float _3605 = _3603;
    bool _3607 = _3559 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _3609 = _3607 || _3583;
    int _3611 = _3535 + 72;
    uint _3613 = uint(int(uint(_3611) >> uint(2)));
    uint _3615 = uint(int(uint(int(_3613)) >> uint(2)));
    int _3617 = int(_3613) & 3;
    float _3619 = (*spvDescriptorSet0.vp_c15)._m0[int(_3615)][_3617];
    int _3621 = int(_3613) + 1;
    uint _3623 = uint(int(uint(_3621) >> uint(2)));
    int _3625 = _3621 & 3;
    float _3627 = (*spvDescriptorSet0.vp_c15)._m0[int(_3623)][_3625];
    int _3629 = _3535 + 96;
    uint _3631 = uint(int(uint(_3629) >> uint(2)));
    uint _3633 = uint(int(uint(int(_3631)) >> uint(2)));
    int _3635 = int(_3631) & 3;
    float _3637 = (*spvDescriptorSet0.vp_c15)._m0[int(_3633)][_3635];
    int _3639 = int(_3631) + 1;
    uint _3641 = uint(int(uint(_3639) >> uint(2)));
    int _3643 = _3639 & 3;
    float _3645 = (*spvDescriptorSet0.vp_c15)._m0[int(_3641)][_3643];
    int _3647 = _3535 + 104;
    uint _3649 = uint(int(uint(_3647) >> uint(2)));
    uint _3651 = uint(int(uint(int(_3649)) >> uint(2)));
    int _3653 = int(_3649) & 3;
    float _3655 = (*spvDescriptorSet0.vp_c15)._m0[int(_3651)][_3653];
    int _3657 = int(_3649) + 1;
    uint _3659 = uint(int(uint(_3657) >> uint(2)));
    int _3661 = _3657 & 3;
    float _3663 = (*spvDescriptorSet0.vp_c15)._m0[int(_3659)][_3661];
    float _3665 = _3605;
    if (!_3433)
    {
        float _3667 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _3669 = _2259 + _3667;
        float _3671 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _3673 = _2583 + _3671;
        float _3675 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3677 = _3669 * _3669;
        float _3679 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _3681 = _2075 + _3679;
        float _3683 = fma(_3673, _3673, _3677);
        float _3685 = -_2259;
        float _3687 = _3685 + _3451;
        float _3689 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3691 = -_2075;
        float _3693 = _3691 + _3417;
        float _3695 = fma(_3681, _3681, _3683);
        float _3697 = sqrt(_3695);
        float _3699 = _3675 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3701 = precise::min(_3697, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3703 = _3701 * _3689;
        float _3705 = _3699 * _3703;
        float _3707 = -_2583;
        float _3709 = _3707 + _3487;
        float _3711 = fma(_3687, _3705, _2259);
        float _3713 = fma(_3709, _3705, _2583);
        float _3715 = fma(_3693, _3705, _2075);
        _3503 = _3711;
        _3521 = _3713;
        _3665 = _3715;
        _3323 = as_type<int>(_3705);
    }
    float _3717 = _3503;
    float _3719 = _3521;
    float _3721 = _3665;
    int _3723 = _3323;
    float _3725 = _3439 * _3645;
    float _3727 = _3717 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    int _3729 = _3723;
    int _3731 = as_type<int>(_3727);
    if (!_3609)
    {
        int _3733 = _3559 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _3735 = _3733 + _3481;
        _3729 = _3735;
    }
    int _3737 = _3729;
    float _3739 = _3439 * _3553;
    float _3741 = fma(_2583, _3637, _3725);
    float _3743 = fma(_3719, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3727);
    float _3745 = _3439 * _3601;
    float _3747 = fma(_2583, _3545, _3739);
    float _3749 = fma(_2075, _3655, _3741);
    float _3751 = fma(_3721, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3743);
    float _3753 = fma(_2583, _3593, _3745);
    int _3755 = as_type<int>(_3741);
    float _3757 = as_type<float>(_3737);
    if (!_3609)
    {
        int _3759 = _3737 << 2;
        _3755 = _3759;
    }
    int _3761 = _3755;
    float _3763 = _3751 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3765 = _3749 + _3663;
    float _3767 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    int _3769 = _3535 + 80;
    uint _3771 = uint(int(uint(_3769) >> uint(2)));
    uint _3773 = uint(int(uint(int(_3771)) >> uint(2)));
    int _3775 = int(_3771) & 3;
    float _3777 = (*spvDescriptorSet0.vp_c15)._m0[int(_3773)][_3775];
    int _3779 = int(_3771) + 1;
    uint _3781 = uint(int(uint(_3779) >> uint(2)));
    int _3783 = _3779 & 3;
    float _3785 = (*spvDescriptorSet0.vp_c15)._m0[int(_3781)][_3783];
    float _3787 = _3763 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    int _3789 = _3761;
    int _3791 = as_type<int>(_3767);
    if (!_3609)
    {
        uint _3793 = uint(int(uint(_3737) >> uint(2)));
        _3731 = int(_3793);
    }
    int _3795 = _3731;
    float _3797 = fma(_2075, _3569, _3747);
    if (!_3609)
    {
        int _3799 = 12 & _3761;
        _3789 = _3799;
    }
    int _3801 = _3789;
    float _3803 = 1.0 / _3765;
    float _3805 = -_3787;
    float _3807 = fma(_3805, _3767, 1.0);
    float _3809 = fma(_2075, _3619, _3753);
    if (!_3609)
    {
        int _3811 = _3795 << 4;
        int _3813 = _3811 + _3801;
        _3791 = _3813;
    }
    int _3815 = _3791;
    int _3817 = _3535 + 88;
    uint _3819 = uint(int(uint(_3817) >> uint(2)));
    uint _3821 = uint(int(uint(int(_3819)) >> uint(2)));
    int _3823 = int(_3819) & 3;
    float _3825 = (*spvDescriptorSet0.vp_c15)._m0[int(_3821)][_3823];
    int _3827 = int(_3819) + 1;
    uint _3829 = uint(int(uint(_3827) >> uint(2)));
    int _3831 = _3827 & 3;
    float _3833 = (*spvDescriptorSet0.vp_c15)._m0[int(_3829)][_3831];
    float _3835 = _3797 + _3577;
    float _3837 = _3717 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3839 = _3717 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3841 = _3809 + _3627;
    float _3843 = _3717 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3845 = fma(_3719, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3837);
    float _3847 = fma(_3719, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3839);
    float _3849 = as_type<float>(_3001);
    if (!_3609)
    {
        int _3851 = _3815 + 400;
        uint _3853 = uint(int(uint(_3851) >> uint(2)));
        uint _3855 = uint(int(uint(int(_3853)) >> uint(2)));
        int _3857 = int(_3853) & 3;
        float _3859 = (*spvDescriptorSet0.vp_c15)._m0[int(_3855)][_3857];
        _3849 = _3859;
    }
    float _3861 = _3849;
    float _3863 = fma(_3719, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3843);
    float _3865 = fma(_3721, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3845);
    float _3867 = fma(_3721, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3847);
    float _3869 = _3835 * _3803;
    float _3871 = fma(_3721, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3863);
    float _3873 = _3865 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3875 = _3867 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3877 = _3841 * _3803;
    bool _3879 = _3869 >= 0.0;
    float _3881 = _3871 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3883 = _3875 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3885 = _3417;
    float _3887 = _3803;
    if (!_3609)
    {
        float _3889 = floor(_3519);
        _3885 = _3889;
    }
    float _3891 = _3885;
    bool _3893 = _3869 <= 1.0;
    bool _3895 = _3893 && _3879;
    float _3897 = _3875 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3899 = fma(_3873, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3883);
    float _3901 = _3875 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    bool _3903 = _3877 >= 0.0;
    bool _3905 = _3903 && _3895;
    float _3907 = fma(_3763, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3899);
    float _3909 = log2(_3807);
    bool _3911 = _3877 <= 1.0;
    bool _3913 = _3911 && _3905;
    float _3915 = fma(_3873, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3901);
    float _3917 = fma(_3881, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3907);
    float _3919 = fma(_3873, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3897);
    float _3921 = 1.0 / _3917;
    float _3923 = fma(_3763, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3919);
    float _3925 = _3891;
    if (!_3609)
    {
        float _3927 = -_3891;
        float _3929 = _3519 + _3927;
        _3925 = _3929;
    }
    float _3931 = _3925;
    float _3933 = _3439 * _3785;
    float _3935 = fma(_3881, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3923);
    float _3937 = _3785;
    if (_3913)
    {
        float _3939 = float(_3531);
        _3937 = _3939;
    }
    float _3941 = _3937;
    float _3943 = fma(_3763, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3915);
    float _3945 = _3835;
    if (!_3609)
    {
        float _3947 = floor(_3461);
        _3945 = _3947;
    }
    float _3949 = _3945;
    float _3951 = fma(_2583, _3777, _3933);
    float _3953 = _3909 * 0.693147182464599609375;
    float _3955 = fma(_3881, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3943);
    float _3957 = fma(_2075, _3825, _3951);
    float _3959 = _3953 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3961 = _3915;
    if (_3913)
    {
        float _3963 = rint(_3941);
        float _3965 = precise::max(_3963, 0.0);
        uint _3967 = uint(_3965);
        uint _3969 = clamp(_3967, 0u, 65535u);
        _3961 = as_type<float>(_3969);
    }
    float _3971 = _3961;
    float _3973 = _3957 + _3833;
    float _3975 = _3955 * _3921;
    float _3977 = _3935 * _3921;
    float _3979 = _3973 * _3803;
    float _3981 = fma(_3975, 0.5, 0.5);
    float _3983 = fma(_3977, -0.5, 0.5);
    float _3985 = _3923;
    float _3987 = _3979;
    if (!_3609)
    {
        float _3989 = rint(_3861);
        float _3991 = precise::max(_3989, 0.0);
        uint _3993 = uint(_3991);
        uint _3995 = clamp(_3993, 0u, 65535u);
        _3985 = as_type<float>(_3995);
    }
    float _3997 = _3985;
    float _3999 = _3949;
    if (!_3609)
    {
        float _4001 = -_3949;
        float _4003 = _3461 + _4001;
        _3999 = _4003;
    }
    float _4005 = _3999;
    float _4007 = _3877;
    if (_3913)
    {
        float3 _10649 = float3(_3869, _3877, float(as_type<int>(_3971)));
        float3 _10653 = select(_10649, float3(0.0), isnan(_10649));
        float _4009 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _10653.xy, uint(rint(_10653.z)), _3979, level(0.0));
        _4007 = _4009;
    }
    float _4011 = _4007;
    float3 _10663 = float3(_3981, _3983, _3959);
    float _4013 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_10663, float3(0.0), isnan(_10663)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_10663, float3(0.0), isnan(_10663)), level(0.0)).x;
    float3 _10672 = float3(_3981, _3983, _3959);
    float4 _4016 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_10672, float3(0.0), isnan(_10672)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_10672, float3(0.0), isnan(_10672)), level(0.0)).xyzw;
    float _4018 = _4016.x;
    float _4020 = _4016.y;
    float _4022 = _4016.z;
    float _4024 = _4016.w;
    float _4026 = _4005;
    float _4028 = _3997;
    if (!_3609)
    {
        float3 _10696 = float3(_4005, _3931, float(as_type<int>(_3997)));
        float3 _10698 = select(_10696, float3(0.0), isnan(_10696));
        float _4030 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _10698.xy, uint(rint(_10698.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _10698.xy, uint(rint(_10698.z)), level(0.0)).x;
        _4026 = _4030;
    }
    float _4032 = _4026;
    if (_3609)
    {
        _3887 = 1.0;
    }
    float _4034 = _3887;
    float _4036 = _4034;
    float _4038 = _4032;
    if (!_3609)
    {
        int _4040 = _3737 << 4;
        int _4042 = _4040 + 2048;
        uint _4044 = uint(int(uint(_4042) >> uint(2)));
        uint _4046 = uint(int(uint(int(_4044)) >> uint(2)));
        int _4048 = int(_4044) & 3;
        float _4050 = (*spvDescriptorSet0.vp_c15)._m0[int(_4046)][_4048];
        int _4052 = int(_4044) + 1;
        uint _4054 = uint(int(uint(_4052) >> uint(2)));
        int _4056 = _4052 & 3;
        float _4058 = (*spvDescriptorSet0.vp_c15)._m0[int(_4054)][_4056];
        int _4060 = _4042 + 8;
        uint _4062 = uint(int(uint(_4060) >> uint(2)));
        uint _4064 = uint(int(uint(int(_4062)) >> uint(2)));
        int _4066 = int(_4062) & 3;
        float _4068 = (*spvDescriptorSet0.vp_c15)._m0[int(_4064)][_4066];
        int _4070 = int(_4062) + 1;
        uint _4072 = uint(int(uint(_4070) >> uint(2)));
        int _4074 = _4070 & 3;
        float _4076 = (*spvDescriptorSet0.vp_c15)._m0[int(_4072)][_4074];
        float _4078 = _3439 * _4058;
        float _4080 = fma(_2583, _4050, _4078);
        float _4082 = fma(_2075, _4068, _4080);
        float _4084 = _4082 + _4076;
        float _4086 = precise::clamp(_4084, 0.0, 1.0);
        float _4088 = -_4086;
        float _4090 = _4088 + _4032;
        float _4092 = fma(_4090, 500.0, 1.5);
        float _4094 = exp2(_4092);
        float _4096 = 0.0 + _4094;
        float _4098 = precise::clamp(_4096, 0.0, 1.0);
        _3757 = as_type<float>(_4042);
        _4036 = _4098;
    }
    float _4100 = _3757;
    float _4102 = _4036;
    float _4104 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4106 = _3717 + _4104;
    float _4108 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4110 = _3719 + _4108;
    float _4112 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4114 = _3721 + _4112;
    float _4116 = _4106 * _4106;
    float _4118 = fma(_4110, _4110, _4116);
    float _4120 = fma(_4114, _4114, _4118);
    float _4122 = rsqrt(_4120);
    float _4124 = _4122 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4126 = _4110 * _4124;
    float _4128 = _4114 * _4124;
    float _4130 = _4126 * _4126;
    float _4132 = _4128 * _4128;
    float _4134 = _4130 + _4132;
    float _4136 = sqrt(_4134);
    bool _4138 = _4136 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4140 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4142 = _4136 + _4140;
    float _4144 = _4122;
    float _4146 = _4100;
    float _4148 = _4142;
    float _4150 = _4124;
    if (_4138)
    {
        float _4152 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4144 = _4152;
    }
    float _4154 = _4144;
    if (_4138)
    {
        float _4156 = rsqrt(_4134);
        _4146 = _4156;
    }
    float _4158 = _4146;
    float _4160 = _4158;
    if (_4138)
    {
        float _4162 = _4142 * _4154;
        _4148 = _4162;
    }
    float _4164 = _4148;
    if (_4138)
    {
        float _4166 = _4164 * 0.15915493667125701904296875;
        _4038 = _4166;
    }
    float _4168 = _4038;
    float _4170 = _4154;
    if (_4138)
    {
        float _4172 = _4168 * 6.283185482025146484375;
        float _4174 = sin(_4172);
        _4170 = _4174;
    }
    float _4176 = _4170;
    float _4178 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4180 = precise::max(0.0, _4178);
    float _4182 = _4114;
    float _4184 = _4180;
    if (_4138)
    {
        float _4186 = _4168 * 6.283185482025146484375;
        float _4188 = cos(_4186);
        _4182 = _4188;
    }
    float _4190 = _4182;
    float _4192 = -_4124;
    float _4194 = -_4180;
    float _4196 = fma(_4106, _4192, _4194);
    float _4198 = _4196;
    if (_4138)
    {
        float _4200 = _4196 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4184 = _4200;
    }
    float _4202 = _4184;
    float _4204 = _4176;
    float _4206 = _4202;
    if (_4138)
    {
        float _4208 = fma(_4176, _4202, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4028 = _4208;
    }
    float _4210 = _4028;
    float _4212 = _4210;
    if (!_4138)
    {
        _4204 = _4126;
    }
    float _4214 = _4204;
    float _4216 = _4214;
    if (_4138)
    {
        float _4218 = _4190 + (-1.0);
        _4206 = _4218;
    }
    float _4220 = _4206;
    float _4222 = _4220;
    if (_4138)
    {
        float _4224 = _4158 * _4210;
        _4150 = _4224;
    }
    float _4226 = _4150;
    if (!_4138)
    {
        _4212 = _4130;
    }
    float _4228 = _4212;
    float _4230 = _4228;
    if (_4138)
    {
        float _4232 = _4220 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4160 = _4232;
    }
    float _4234 = _4160;
    float _4236 = _4234;
    if (_4138)
    {
        float _4238 = _4126 * _4226;
        _4216 = _4238;
    }
    float _4240 = _4216;
    if (!_4138)
    {
        _4222 = _4128;
    }
    float _4242 = _4222;
    float _4244 = _4242;
    if (_4138)
    {
        float _4246 = _4128 * _4226;
        _4244 = _4246;
    }
    float _4248 = _4244;
    if (_4138)
    {
        float _4250 = fma(_4196, _4190, _4234);
        _4198 = _4250;
    }
    float _4252 = _4198;
    if (_4138)
    {
        float _4254 = _4240 * _4240;
        _4230 = _4254;
    }
    float _4256 = _4230;
    if (!_4138)
    {
        _4236 = _4132;
    }
    float _4258 = _4236;
    float _4260 = sqrt(_4120);
    float _4262 = _4258;
    if (_4138)
    {
        float _4264 = _4248 * _4248;
        _4262 = _4264;
    }
    float _4266 = _4262;
    float _4268 = fma(_4252, _4252, _4256);
    float _4270 = _4268 + _4266;
    float _4272 = rsqrt(_4270);
    float _4274 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4276 = fma(_4260, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4274);
    float _4278 = precise::clamp(_4276, 0.0, 1.0);
    float _4280 = -_4278;
    float _4282 = _4280 + 1.0;
    float _4284 = _4272 * _4240;
    float _4286 = abs(_4282);
    float _4288 = log2(_4286);
    float _4290 = _4272 * _4252;
    float _4292 = _4272 * _4248;
    float _4294 = _4284 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4296 = -_4294;
    float _4298 = fma(_4290, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4296);
    float _4300 = -_4292;
    float _4302 = fma(_4300, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4298);
    float _4304 = fma(_4302, -0.5, 0.5);
    float _4306 = _4288 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4308 = fma(_4302, 0.5, 0.5);
    float _4310 = _4290 + 1.0;
    float _4312 = exp2(_4306);
    float _4314 = fma(_4308, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4316 = fma(_4308, _4314, -0.212114393711090087890625);
    float _4318 = sqrt(_4304);
    float _4320 = fma(_4308, _4316, 1.570728778839111328125);
    float _4322 = -_4290;
    float _4324 = fma(_4312, _4310, _4322);
    float _4326 = fma(_4324, 0.5, 0.5);
    float _4328 = _4318 * 0.636619746685028076171875;
    float _4330 = -_4320;
    float _4332 = fma(_4328, _4330, 1.0);
    float2 _11165 = float2(_4332, _4326);
    float3 _4336 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_11165, float2(0.0), isnan(_11165)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_11165, float2(0.0), isnan(_11165)), level(0.0)).xyz;
    float _4338 = _4336.x;
    float _4340 = _4336.y;
    float _4342 = _4336.z;
    float _4344 = abs(_3499);
    float _4346 = log2(_4344);
    float _4348 = _4288 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4350 = -_3407;
    float _4352 = _4350 + 1.0;
    float _4354 = exp2(_4348);
    float _4356 = _4346 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _4358 = _3875 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4360 = fma(_3873, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4358);
    float _4362 = exp2(_4356);
    float _4364 = -_4354;
    float _4366 = _4364 + 1.0;
    float _4368 = _4366 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4370 = _4368 * _4013;
    float _4372 = fma(_4362, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4374 = precise::clamp(_4372, 0.0, 1.0);
    float _4376 = fma(_4374, -2.0, 3.0);
    float _4378 = _4374 * _4374;
    float _4380 = fma(_3763, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4360);
    bool _4382 = _3499 <= 8000.0;
    bool _4384 = isnan(_3499);
    bool _4386 = _4382 || _4384;
    bool _4388 = isnan(8000.0);
    bool _4390 = _4386 || _4388;
    float _4392 = float(_4390);
    float _4394 = _4378 * _4376;
    float _4396 = fma(_3881, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4380);
    float _4398 = -_4394;
    float _4400 = _4398 + 1.0;
    out.gl_Position.x = _3955;
    out.gl_Position.y = _3935;
    out.gl_Position.z = _4396;
    out.gl_Position.w = _3917;
    float _4402 = fma(_4400, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4394);
    float _4404 = _4396 + _3917;
    float _4406 = _4392 * _4402;
    float _4408 = _4404 * 0.5;
    float _4410 = _4404;
    if (!_3913)
    {
        _4410 = 1.0;
    }
    float _4412 = _4410;
    float _4414 = _4406 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _4416 = _4412;
    if (_3913)
    {
        bool _4418 = _4011 >= _3979;
        bool _4420 = isnan(_4011);
        bool _4422 = _4418 || _4420;
        bool _4424 = isnan(_3979);
        bool _4426 = _4422 || _4424;
        float _4428 = float(_4426);
        _4416 = _4428;
    }
    float _4430 = _4416;
    out.m_91.z = _4408;
    out.m_91.w = _3917;
    bool _4432 = _4260 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4434 = isnan(_4260);
    bool _4436 = _4432 || _4434;
    bool _4438 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4440 = _4436 || _4438;
    float _4442 = _4352 * _4414;
    float _4444 = precise::clamp(_4442, 0.0, 1.0);
    float _4446 = _4024 * _4370;
    float _4448 = _4430 * _4102;
    float _4450 = -_4368;
    float _4452 = _4450 + 1.0;
    float _4454 = -_4444;
    float _4456 = fma(_4454, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4458 = _4024 * _4452;
    float _4460 = -_4448;
    float _4462 = fma(_4460, _4456, 1.0);
    float _4464 = precise::clamp(_4462, 0.0, 1.0);
    float _4466 = _4464 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _4468 = _4452;
    float _4470 = _4464;
    if (!_4440)
    {
        _4468 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4472 = _4468;
    float _4474 = _4472;
    float _4476 = _4472;
    if (!_4440)
    {
        _3987 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4478 = _3987;
    out.m_93.x = _4466;
    float _4480 = _4478;
    float _4482 = _4478;
    if (!_4440)
    {
        _4470 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4484 = _4470;
    float _4486 = _4342 * _4370;
    float _4488 = fma(_4338, _4446, _4018);
    float _4490 = fma(_4340, _4446, _4020);
    float _4492 = fma(_4024, _4486, _4022);
    out.m_95.x = _4488;
    out.m_95.y = _4490;
    out.m_95.z = _4492;
    out.m_95.w = _4458;
    bool _4494 = !_4440;
    float _4496 = _4484;
    float _4498 = _4484;
    if (!_4494)
    {
        bool _4500 = _4260 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4502 = isnan(_4260);
        bool _4504 = _4500 || _4502;
        bool _4506 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4508 = _4504 || _4506;
        if (!_4508)
        {
            float _4510 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4512 = _4260 + _4510;
            float _4514 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4516 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4514;
            float _4518 = 1.0 / _4516;
            float _4520 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4522 = _4520 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4524 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4526 = _4524 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4528 = _4512 * _4518;
            float _4530 = precise::clamp(_4528, 0.0, 1.0);
            float _4532 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4534 = _4532 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4536 = fma(_4530, _4526, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4538 = fma(_4530, _4534, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4540 = fma(_4530, _4522, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            _4482 = _4540;
            _4476 = _4538;
            _4498 = _4536;
            _4542 = true;
        }
        else
        {
            bool _4544 = _4260 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4546 = isnan(_4260);
            bool _4548 = _4544 || _4546;
            bool _4550 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4552 = _4548 || _4550;
            if (!_4552)
            {
                _4474 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4554 = _4474;
            _4476 = _4554;
            if (!_4552)
            {
                _4480 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4556 = _4480;
            _4482 = _4556;
            if (!_4552)
            {
                _4496 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4558 = _4496;
            bool _4560 = !_4552;
            _4498 = _4558;
            if (!_4560)
            {
                bool _4562 = _4260 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4564 = isnan(_4260);
                bool _4566 = _4562 || _4564;
                bool _4568 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4570 = _4566 || _4568;
                if (!_4570)
                {
                    float _4572 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4574 = _4260 + _4572;
                    float _4576 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4578 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4576;
                    float _4580 = 1.0 / _4578;
                    float _4582 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4584 = _4582 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4586 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4588 = _4586 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4590 = _4574 * _4580;
                    float _4592 = precise::clamp(_4590, 0.0, 1.0);
                    float _4594 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4596 = _4594 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4598 = fma(_4592, _4588, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4600 = fma(_4592, _4596, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4602 = fma(_4592, _4584, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    _4482 = _4602;
                    _4476 = _4600;
                    _4498 = _4598;
                    _4542 = true;
                }
                else
                {
                    _4482 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4476 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4498 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _4542 = false;
    float _4604 = _4482;
    float _4606 = _4476;
    float _4608 = _4498;
    float _4610 = _4604 * 0.586610972881317138671875;
    bool _4612 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_61.x = 1.0;
    float _4614 = fma(_4606, 0.298911988735198974609375, _4610);
    out.m_97.x = 0.0;
    float _4616 = fma(_4608, 0.114477999508380889892578125, _4614);
    float _4618 = -_4616;
    float _4620 = _4618 + _4606;
    float _4622 = -_4616;
    float _4624 = _4622 + _4604;
    float _4626 = -_4616;
    float _4628 = _4626 + _4608;
    float _4630 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4632 = fma(_4620, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4616);
    float _4634 = fma(_4624, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4616);
    float _4636 = fma(_4628, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4616);
    out.m_93.w = _4630;
    out.m_99.x = _4632;
    out.m_99.y = _4634;
    out.m_99.z = _4636;
    if (!_4612)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _4638 = -_3717;
    float _4640 = _4638 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _4642 = -_3719;
    float _4644 = _4642 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _4646 = -_3721;
    float _4648 = _4646 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _4650 = _4640 * _4640;
    float _4652 = fma(_4644, _4644, _4650);
    float _4654 = fma(_4648, _4648, _4652);
    float _4656 = sqrt(_4654);
    float _4658 = rsqrt(_4654);
    float _4660 = -_4656;
    float _4662 = _4660 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4664 = _4662 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _4666 = precise::clamp(_4664, 0.0, 1.0);
    float _4668 = _4644 * _4658;
    float _4670 = _4640 * _4658;
    float _4672 = abs(_4666);
    float _4674 = log2(_4672);
    float _4676 = _4648 * _4658;
    float _4678 = _4668 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _4680 = _3041 * _4670;
    float _4682 = -_4670;
    float _4684 = -_4678;
    float _4686 = fma(_4682, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4684);
    float _4688 = fma(_3297, _4668, _4680);
    float _4690 = -_4676;
    float _4692 = fma(_4690, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4686);
    float _4694 = fma(_3099, _4676, _4688);
    float _4696 = precise::clamp(_4694, 0.0, 1.0);
    float _4698 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _4700 = _4692 + _4698;
    float _4702 = _4674 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _4704 = _4700 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _4706 = precise::clamp(_4704, 0.0, 1.0);
    float _4708 = exp2(_4702);
    float _4710 = _4708 * _4706;
    float _4712 = _4696 * _4710;
    float _4714 = _4712 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4716 = _4712 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4718 = _4712 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_97.x = _4714;
    out.m_97.y = _4716;
    out.m_97.z = _4718;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

