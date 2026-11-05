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
    float4 m_81 [[user(locn0)]];
    float4 m_77 [[user(locn1)]];
    float4 m_59 [[user(locn2)]];
    float4 m_101 [[user(locn3)]];
    float4 m_87 [[user(locn4)]];
    float4 m_83 [[user(locn5)]];
    float4 m_91 [[user(locn6)]];
    float4 m_89 [[user(locn7)]];
    float4 m_93 [[user(locn8)]];
    float4 m_73 [[user(locn9)]];
    float4 m_85 [[user(locn10)]];
    float4 m_99 [[user(locn11)]];
    float4 m_95 [[user(locn12)]];
    float4 m_97 [[user(locn13)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_65 [[attribute(1)]];
    float4 m_56 [[attribute(2)]];
    float4 m_61 [[attribute(3)]];
    float4 m_75 [[attribute(4)]];
    float4 m_69 [[attribute(5)]];
    float4 m_63 [[attribute(6)]];
    float4 m_67 [[attribute(7)]];
    float4 m_79 [[attribute(8)]];
    float4 m_71 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2452 = false;
    bool _198 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _115 = in.m_56.w;
    float _117 = trunc(_115);
    int _120 = int(_117);
    bool _124 = _120 >= 1;
    float _126 = 0.0;
    if (!_124)
    {
        _126 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _128 = _126;
    float _130 = _128;
    if (!_124)
    {
        out.m_59.x = 0.0;
    }
    int _132 = 0;
    if (!_124)
    {
        float _134 = _128 * 5.0;
        _132 = as_type<int>(_134);
    }
    int _136 = _132;
    int _138 = _136;
    if (!_124)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2737 = as_type<float>(_136);
        out.gl_Position.z = _2737;
    }
    if (!_124)
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
        float _158 = float(_120);
        _130 = _158;
    }
    float _160 = _130;
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
    if (_166)
    {
        float _172 = _170 * 5.0;
        _138 = as_type<int>(_172);
    }
    int _174 = _138;
    if (_166)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2807 = as_type<float>(_174);
        out.gl_Position.z = _2807;
    }
    if (_166)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _176 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _178 = !_176;
    float _196;
    if (!_178)
    {
        float _180 = in.m_63.x;
        float _182 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _184 = _180 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _186 = fma(_184, (*spvDescriptorSet0.vp_c9)._m0[12].x, _154);
        float _188 = _186 * _182;
        float _190 = floor(_188);
        float _192 = -_190;
        float _194 = _188 + _192;
        _196 = _194;
        _198 = true;
    }
    else
    {
        float _200 = float(_120);
        float _202 = 1.0 / _200;
        float _204 = _154 * _202;
        _196 = _204;
    }
    _198 = false;
    float _206 = _196;
    float _208 = in.m_56.x;
    float _210 = in.m_56.y;
    float _212 = in.m_56.z;
    float _214 = _210 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _216 = _210 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _218 = fma(_208, (*spvDescriptorSet0.vp_c10)._m0[4].x, _214);
    float _220 = fma(_208, (*spvDescriptorSet0.vp_c10)._m0[6].x, _216);
    float _222 = fma(_212, (*spvDescriptorSet0.vp_c10)._m0[4].z, _218);
    float _224 = fma(_212, (*spvDescriptorSet0.vp_c10)._m0[6].z, _220);
    float _226 = _222 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _228 = _224 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _230 = fma(_226, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _232 = fma(_228, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _234 = floor(_230);
    float _236 = floor(_232);
    float _238 = -_234;
    float _240 = _230 + _238;
    float _242 = -_236;
    float _244 = _232 + _242;
    float2 _2934 = float2(_240, _244);
    float _246 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_2934, float2(0.0), isnan(_2934)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_2934, float2(0.0), isnan(_2934)), level(0.0)).x;
    float _248 = in.m_63.z;
    float _250 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _252 = log2(_250);
    float _254 = _210 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _256 = in.m_63.y;
    float _258 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _260 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _258;
    float _262 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _264 = _262 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _266 = in.m_63.x;
    float _268 = 1.0 / _260;
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _272 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _270;
    float _274 = fma(_208, (*spvDescriptorSet0.vp_c10)._m0[5].x, _254);
    float _276 = 1.0 / _264;
    float _278 = _252 * _154;
    float _280 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _282 = _206 + _280;
    float _284 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _286 = 1.0 + _284;
    int _288 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _290 = _288 != 0;
    int _292 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _294 = _292 != 0;
    int _296 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _298 = _296 != 0;
    float _300 = fma(_212, (*spvDescriptorSet0.vp_c10)._m0[5].z, _274);
    float _302 = _248 * 2.0;
    float _304 = exp2(_278);
    float _306 = _282 * _268;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _310 = _206 + _308;
    float _312 = _256 + _248;
    float _314 = _300 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _316 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _318 = isnan(1.0);
    bool _320 = _316 || _318;
    bool _322 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _324 = _320 || _322;
    float _326 = _312 + (-1.0);
    float _328 = 1.0 / _272;
    float _330 = _310 * _276;
    float _332 = _266 + _256;
    float _334 = fma(_326, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _336 = _256 * 2.0;
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _340 = _206 + _338;
    bool _342 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _344 = isnan(0.0);
    bool _346 = _342 || _344;
    bool _348 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _350 = _346 || _348;
    float _352 = floor(_302);
    float _354 = -_304;
    float _356 = _354 + 1.0;
    float _358 = _350 ? _356 : 0.0;
    float _360 = 1.0 / _286;
    float _362 = _266 + _248;
    float _364 = _340 * _328;
    float _366 = _362 + (-1.0);
    float _368 = _332 + (-1.0);
    float _370 = floor(_336);
    float _372 = _266 * 2.0;
    float _374 = fma(_368, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _376 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _378 = _352 > 0.0;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _382 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _380;
    bool _384 = _352 >= 0.0;
    bool _386 = isnan(_352);
    bool _388 = _384 || _386;
    bool _390 = isnan(0.0);
    bool _392 = _388 || _390;
    float _394 = floor(_372);
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _398 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _396;
    float _400 = _228;
    int _402 = as_type<int>(_248);
    if (_324)
    {
        float _404 = _358 * _360;
        _156 = _404;
    }
    float _406 = _156;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _410 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _408;
    bool _412 = _206 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _414 = isnan(_206);
    bool _416 = _412 || _414;
    bool _418 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _420 = _416 || _418;
    float _422 = float(_420);
    float _424 = fma(_398, _306, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _426 = _206 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _428 = isnan(_206);
    bool _430 = _426 || _428;
    bool _432 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _434 = _430 || _432;
    float _436 = float(_434);
    float _438 = fma(_410, _306, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    int _440 = _392 ? 0 : 1;
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _444 = _442 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _446 = _370 > 0.0;
    float _448 = -_436;
    float _450 = _448 + 1.0;
    float _452 = fma(_444, _330, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _454 = _394 > 0.0;
    bool _456 = _394 >= 0.0;
    bool _458 = isnan(_394);
    bool _460 = _456 || _458;
    bool _462 = isnan(0.0);
    bool _464 = _460 || _462;
    float _466 = fma(_382, _306, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _470 = _468 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _472 = _206 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _474 = isnan(_206);
    bool _476 = _472 || _474;
    bool _478 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _480 = _476 || _478;
    float _482 = float(_480);
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _486 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _484;
    int _488 = _464 ? 0 : 1;
    float _490 = fma(_470, _330, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _492 = _370 >= 0.0;
    bool _494 = isnan(_370);
    bool _496 = _492 || _494;
    bool _498 = isnan(0.0);
    bool _500 = _496 || _498;
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _504 = _502 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    bool _506 = _206 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _508 = isnan(_206);
    bool _510 = _506 || _508;
    bool _512 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _514 = _510 || _512;
    float _516 = float(_514);
    float _518 = _422 * _450;
    float _520 = -_422;
    float _522 = _520 + 1.0;
    float _524 = fma(_504, _330, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _526 = _516 * _522;
    float _528 = -_516;
    float _530 = _528 + 1.0;
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _534 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _532;
    int _536 = ~_488;
    int _538 = _536 + 1;
    int _540 = _538 + 1;
    float _542 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _544 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _542;
    float _546 = _482 * _530;
    float _548 = fma(_486, _364, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _550 = fma(_534, _364, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _552 = fma(_544, _364, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _554 = _438 * _546;
    float _556 = _466 * _546;
    int _558 = _500 ? 0 : 1;
    float _560 = -_482;
    float _562 = _560 + 1.0;
    float _564 = _424 * _546;
    int _566 = _540;
    if (!_454)
    {
        int _568 = ~_488;
        int _570 = _568 + 1;
        _566 = _570;
    }
    int _572 = _566;
    int _574 = ~_558;
    int _576 = _574 + 1;
    int _578 = _576 + 1;
    float _580 = fma(_562, (*spvDescriptorSet0.vp_c9)._m0[143].x, _556);
    int _582 = _578;
    if (!_446)
    {
        int _584 = ~_558;
        int _586 = _584 + 1;
        _582 = _586;
    }
    int _588 = _582;
    float _590 = fma(_562, (*spvDescriptorSet0.vp_c9)._m0[143].y, _564);
    float _592 = fma(_562, (*spvDescriptorSet0.vp_c9)._m0[143].z, _554);
    bool _594 = !_290;
    int _596 = _594 ? 0 : 1;
    float _598 = _314 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _600 = fma(_490, _526, _580);
    bool _602 = !_294;
    int _604 = _602 ? 0 : 1;
    float _606 = fma(_452, _526, _590);
    int _608 = abs(_596);
    float _610 = fma(_226, (*spvDescriptorSet0.vp_c8)._m0[11].x, _598);
    int _612 = ~_440;
    int _614 = _612 + 1;
    int _616 = _614 + 1;
    float _618 = in.m_65.x;
    float _620 = in.m_65.y;
    float _622 = in.m_65.z;
    int _624 = _616;
    if (!_378)
    {
        int _626 = ~_440;
        int _628 = _626 + 1;
        _624 = _628;
    }
    int _630 = _624;
    float _632 = fma(_524, _526, _592);
    int _634 = abs(_604);
    float _636 = fma(_548, _518, _600);
    float _638 = float(_608);
    float _640 = fma(_228, (*spvDescriptorSet0.vp_c8)._m0[11].z, _610);
    float _642 = float(_630);
    float _644 = _314 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _646 = _640 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _648 = float(_572);
    float _650 = _638 * _642;
    float _652 = fma(_226, (*spvDescriptorSet0.vp_c8)._m0[10].x, _644);
    float _654 = 1.0 / _646;
    float _656 = float(_634);
    float _658 = fma(_552, _518, _632);
    float _660 = fma(_228, (*spvDescriptorSet0.vp_c8)._m0[10].z, _652);
    float _662 = fma(_550, _518, _606);
    float _664 = _650 * (-2.0);
    float _666 = _656 * _648;
    float _668 = _660 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _670 = !_298;
    int _672 = _670 ? 0 : 1;
    float _674 = fma(_374, _664, _374);
    float _676 = _266 + (-0.5);
    float _678 = _668 + _646;
    float _680 = fma(_664, _618, _618);
    float _682 = _666 * (-2.0);
    int _684 = abs(_672);
    float _686 = _678 * _654;
    float _688 = _686 * 0.5;
    float _690 = fma(_676, (*spvDescriptorSet0.vp_c9)._m0[196].x, _680);
    float _692 = float(_588);
    float _694 = in.m_67.x;
    float _696 = in.m_67.y;
    float _698 = in.m_67.z;
    float _700 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _702 = fma(_688, (*spvDescriptorSet0.vp_c8)._m0[30].w, _700);
    float _704 = fma(_674, _406, _690);
    float _706 = float(_684);
    float _708 = _256 + (-0.5);
    float _710 = fma(_682, _620, _620);
    float _712 = in.m_69.x;
    float _714 = in.m_69.y;
    float _716 = in.m_69.z;
    float _718 = 1.0 / _702;
    float _720 = _706 * _692;
    float _722 = fma(_334, _682, _334);
    float _724 = fma(_708, (*spvDescriptorSet0.vp_c9)._m0[196].y, _710);
    float _726 = fma(_436, (*spvDescriptorSet0.vp_c9)._m0[146].x, _636);
    float _728 = _720 * (-2.0);
    float _730 = fma(_436, (*spvDescriptorSet0.vp_c9)._m0[146].y, _662);
    float _732 = fma(_722, _406, _724);
    float _734 = fma(_436, (*spvDescriptorSet0.vp_c9)._m0[146].z, _658);
    float _736 = fma(_376, _728, _376);
    float _738 = fma(_728, _622, _622);
    float _740 = _248 + (-0.5);
    float _742 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _744 = _704 * 0.15915493667125701904296875;
    float _746 = _732 * 0.15915493667125701904296875;
    float _748 = fma(_740, (*spvDescriptorSet0.vp_c9)._m0[196].z, _738);
    float _750 = _314 + _742;
    float _752 = _734 * _698;
    float _754 = _726 * _694;
    float _756 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _758 = _718 * _756;
    float _760 = fma(_736, _406, _748);
    float _762 = _744 * 6.283185482025146484375;
    float _764 = sin(_762);
    float _766 = _754 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _768 = _760 * 0.15915493667125701904296875;
    bool _770 = _758 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _772 = _750 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    bool _774 = _758 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _776 = _730 * _696;
    float _778 = _744 * 6.283185482025146484375;
    float _780 = cos(_778);
    float _782 = fma(_226, (*spvDescriptorSet0.vp_c15)._m0[126].x, _772);
    float _784 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _712);
    float _786 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _714);
    float _788 = _776 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _790 = fma(_228, (*spvDescriptorSet0.vp_c15)._m0[126].z, _782);
    float _792 = _784 * _766;
    bool _794 = !_770;
    int _796 = _794 ? 0 : 1;
    float _798 = _746 * 6.283185482025146484375;
    float _800 = sin(_798);
    float _802 = _786 * _788;
    float _804 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _716);
    float _806 = _752 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _808 = _790 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    int _810 = 2;
    if (!_770)
    {
        _810 = 1;
    }
    int _812 = _810;
    float _814 = _804 * _806;
    float _816 = _746 * 6.283185482025146484375;
    float _818 = cos(_816);
    int _820 = _812;
    if (!_774)
    {
        _820 = _796;
    }
    int _822 = _820;
    bool _824 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _826 = isnan(0.5);
    bool _828 = _824 || _826;
    bool _830 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _832 = _828 || _830;
    int _834 = _822 << 6;
    float _836 = _768 * 6.283185482025146484375;
    float _838 = cos(_836);
    float _840 = _750 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _842 = _780 * _800;
    float _844 = _764 * _800;
    float _846 = fma(_226, (*spvDescriptorSet0.vp_c15)._m0[127].x, _840);
    float _848 = _768 * 6.283185482025146484375;
    float _850 = sin(_848);
    float _852 = _764 * _818;
    float _854 = _780 * _818;
    float _856 = fma(_228, (*spvDescriptorSet0.vp_c15)._m0[127].z, _846);
    float _858 = _856 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _860 = _780 * _838;
    float _862 = _818 * _838;
    float _864 = _764 * _838;
    float _866 = trunc(_808);
    int _868 = int(_866);
    float _870 = _860 * _802;
    float _872 = _800 * _838;
    int _874 = _834 + 48;
    uint _877 = uint(int(uint(_874) >> uint(2)));
    uint _879 = uint(int(uint(int(_877)) >> uint(2)));
    int _881 = int(_877) & 3;
    float _883 = (*spvDescriptorSet0.vp_c15)._m0[int(_879)][_881];
    int _885 = int(_877) + 1;
    uint _887 = uint(int(uint(_885) >> uint(2)));
    int _889 = _885 & 3;
    float _891 = (*spvDescriptorSet0.vp_c15)._m0[int(_887)][_889];
    float _893 = _864 * _802;
    float _895 = -_842;
    float _897 = fma(_850, _852, _895);
    float _899 = -_852;
    float _901 = fma(_850, _842, _899);
    float _903 = fma(_850, _854, _844);
    float _905 = trunc(_858);
    int _907 = int(_905);
    float _909 = -_802;
    float _911 = _850 * _909;
    float _913 = fma(_850, _844, _854);
    int _915 = _834 + 96;
    uint _917 = uint(int(uint(_915) >> uint(2)));
    uint _919 = uint(int(uint(int(_917)) >> uint(2)));
    int _921 = int(_917) & 3;
    float _923 = (*spvDescriptorSet0.vp_c15)._m0[int(_919)][_921];
    int _925 = int(_917) + 1;
    uint _927 = uint(int(uint(_925) >> uint(2)));
    int _929 = _925 & 3;
    float _931 = (*spvDescriptorSet0.vp_c15)._m0[int(_927)][_929];
    float _933 = fma(_903, _792, _870);
    float _935 = fma(_862, _792, _911);
    float _937 = fma(_897, _792, _893);
    float _939 = fma(_901, _814, _933);
    float _941 = fma(_872, _814, _935);
    float _943 = fma(_913, _814, _937);
    int _945 = _834 + 104;
    uint _947 = uint(int(uint(_945) >> uint(2)));
    uint _949 = uint(int(uint(int(_947)) >> uint(2)));
    int _951 = int(_947) & 3;
    float _953 = (*spvDescriptorSet0.vp_c15)._m0[int(_949)][_951];
    int _955 = int(_947) + 1;
    uint _957 = uint(int(uint(_955) >> uint(2)));
    int _959 = _955 & 3;
    float _961 = (*spvDescriptorSet0.vp_c15)._m0[int(_957)][_959];
    float _963 = _939 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _965 = _939 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    int _967 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _969 = _868 + _967;
    int _971 = _969 + 1;
    float _973 = fma(_941, (*spvDescriptorSet0.vp_c10)._m0[10].x, _963);
    int _975 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _977 = _907 + _975;
    int _979 = _977 + 1;
    float _981 = fma(_941, (*spvDescriptorSet0.vp_c10)._m0[8].x, _965);
    int _983 = _834 + 64;
    uint _985 = uint(int(uint(_983) >> uint(2)));
    uint _987 = uint(int(uint(int(_985)) >> uint(2)));
    int _989 = int(_985) & 3;
    float _991 = (*spvDescriptorSet0.vp_c15)._m0[int(_987)][_989];
    int _993 = int(_985) + 1;
    uint _995 = uint(int(uint(_993) >> uint(2)));
    int _997 = _993 & 3;
    float _999 = (*spvDescriptorSet0.vp_c15)._m0[int(_995)][_997];
    float _1001 = fma(_943, (*spvDescriptorSet0.vp_c10)._m0[10].z, _973);
    int _1003 = _971 | _979;
    float _1005 = fma(_943, (*spvDescriptorSet0.vp_c10)._m0[8].z, _981);
    bool _1007 = _971 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1009 = _228 + _1001;
    float _1011 = _226 + _1005;
    int _1013 = _834 + 56;
    uint _1015 = uint(int(uint(_1013) >> uint(2)));
    uint _1017 = uint(int(uint(int(_1015)) >> uint(2)));
    int _1019 = int(_1015) & 3;
    float _1021 = (*spvDescriptorSet0.vp_c15)._m0[int(_1017)][_1019];
    int _1023 = int(_1015) + 1;
    uint _1025 = uint(int(uint(_1023) >> uint(2)));
    int _1027 = _1023 & 3;
    float _1029 = (*spvDescriptorSet0.vp_c15)._m0[int(_1025)][_1027];
    bool _1031 = _1003 < 0;
    bool _1033 = _1031 || _1007;
    float _1035 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1037 = _1009 + _1035;
    float _1039 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1041 = _1011 + _1039;
    bool _1043 = _979 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1045 = _1043 || _1033;
    float _1047 = _1037 * _1037;
    int _1049 = _834 + 72;
    uint _1051 = uint(int(uint(_1049) >> uint(2)));
    uint _1053 = uint(int(uint(int(_1051)) >> uint(2)));
    int _1055 = int(_1051) & 3;
    float _1057 = (*spvDescriptorSet0.vp_c15)._m0[int(_1053)][_1055];
    int _1059 = int(_1051) + 1;
    uint _1061 = uint(int(uint(_1059) >> uint(2)));
    int _1063 = _1059 & 3;
    float _1065 = (*spvDescriptorSet0.vp_c15)._m0[int(_1061)][_1063];
    float _1067 = fma(_1041, _1041, _1047);
    float _1069 = sqrt(_1067);
    int _1071 = _834 + 80;
    uint _1073 = uint(int(uint(_1071) >> uint(2)));
    uint _1075 = uint(int(uint(int(_1073)) >> uint(2)));
    int _1077 = int(_1073) & 3;
    float _1079 = (*spvDescriptorSet0.vp_c15)._m0[int(_1075)][_1077];
    int _1081 = int(_1073) + 1;
    uint _1083 = uint(int(uint(_1081) >> uint(2)));
    int _1085 = _1081 & 3;
    float _1087 = (*spvDescriptorSet0.vp_c15)._m0[int(_1083)][_1085];
    float _1089 = _750 * _891;
    float _1091 = _750 * _931;
    float _1093 = _939 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    int _1095 = as_type<int>(_939);
    int _1097 = as_type<int>(_1093);
    float _1099 = _1009;
    float _1101 = _1037;
    float _1103 = as_type<float>(_822);
    float _1105 = as_type<float>(_979);
    if (!_1045)
    {
        int _1107 = _979 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1109 = _1107 + _971;
        _1095 = _1109;
    }
    int _1111 = _1095;
    float _1113 = fma(_226, _923, _1091);
    float _1115 = fma(_226, _883, _1089);
    bool _1117 = _1069 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1119 = fma(_941, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1093);
    float _1121 = fma(_228, _953, _1113);
    float _1123 = _1089;
    float _1125 = _1121;
    float _1127 = _961;
    if (!_1045)
    {
        float _1129 = floor(_808);
        _1123 = _1129;
    }
    float _1131 = _1123;
    if (!_1045)
    {
        int _1133 = _1111 << 2;
        _1097 = _1133;
    }
    int _1135 = _1097;
    float _1137 = fma(_943, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1119);
    float _1139 = _1121 + _961;
    int _1141 = _1135;
    if (!_1045)
    {
        int _1143 = 12 & _1135;
        _1141 = _1143;
    }
    int _1145 = _1141;
    float _1147 = _314 + _1137;
    float _1149 = _750 * _999;
    float _1151 = 1.0 / _1139;
    int _1153 = as_type<int>(_991);
    if (!_1117)
    {
        _1125 = _1011;
    }
    float _1155 = _1125;
    float _1157 = fma(_226, _991, _1149);
    float _1159 = _1155;
    if (!_1045)
    {
        uint _1161 = uint(int(uint(_1111) >> uint(2)));
        _1153 = int(_1161);
    }
    int _1163 = _1153;
    int _1165 = _1163;
    if (!_1117)
    {
        _1127 = _1147;
    }
    float _1167 = _1127;
    float _1169 = fma(_228, _1021, _1115);
    float _1171 = _1167;
    float _1173 = _1021;
    if (!_1045)
    {
        int _1175 = _1163 << 4;
        int _1177 = _1175 + _1145;
        _1165 = _1177;
    }
    int _1179 = _1165;
    float _1181 = _1169 + _1029;
    float _1183 = fma(_228, _1057, _1157);
    float _1185 = _1183 + _1065;
    bool _1187 = !_1117;
    if (!_1187)
    {
        float _1189 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1191 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1193 = _1069 + _1191;
        float _1195 = _1147 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1197 = rsqrt(_1067);
        float _1199 = _1193 * _1189;
        float _1201 = _1199 * 0.15915493667125701904296875;
        float _1203 = _1201 * 6.283185482025146484375;
        float _1205 = cos(_1203);
        float _1207 = _1201 * 6.283185482025146484375;
        float _1209 = sin(_1207);
        float _1211 = _1205 + (-1.0);
        float _1213 = fma(_1209, _1195, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1215 = _1211 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1217 = _1197 * _1213;
        float _1219 = fma(_1147, _1205, _1215);
        float _1221 = fma(_1041, _1217, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1223 = fma(_1037, _1217, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1099 = _1223;
        _1171 = _1219;
        _1159 = _1221;
        _1173 = _1201;
    }
    float _1225 = _1099;
    float _1227 = _1171;
    float _1229 = _1159;
    float _1231 = _1173;
    float _1233 = _1231;
    float _1235 = _1227;
    float _1237 = _1229;
    if (_832)
    {
        _1101 = _1225;
    }
    float _1239 = _1101;
    float _1241 = _1239;
    if (!_832)
    {
        float _1243 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1245 = _314 + _1243;
        float _1247 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1249 = _226 + _1247;
        float _1251 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1253 = -_314;
        float _1255 = _1253 + _1227;
        float _1257 = _1245 * _1245;
        float _1259 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1261 = _228 + _1259;
        float _1263 = -_226;
        float _1265 = _1263 + _1229;
        float _1267 = -_228;
        float _1269 = _1267 + _1225;
        float _1271 = fma(_1249, _1249, _1257);
        float _1273 = fma(_1261, _1261, _1271);
        float _1275 = sqrt(_1273);
        float _1277 = precise::min(_1275, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1279 = _1277 * _1251;
        float _1281 = fma(_1255, _1279, _314);
        float _1283 = fma(_1265, _1279, _226);
        float _1285 = fma(_1269, _1279, _228);
        _1233 = _1251;
        _1235 = _1281;
        _1237 = _1283;
        _1241 = _1285;
    }
    float _1287 = _1233;
    float _1289 = _1235;
    float _1291 = _1237;
    float _1293 = _1241;
    float _1295 = _1287;
    if (!_1045)
    {
        int _1297 = _1179 + 400;
        uint _1299 = uint(int(uint(_1297) >> uint(2)));
        uint _1301 = uint(int(uint(int(_1299)) >> uint(2)));
        int _1303 = int(_1299) & 3;
        float _1305 = (*spvDescriptorSet0.vp_c15)._m0[int(_1301)][_1303];
        _1295 = _1305;
    }
    float _1307 = _1295;
    float _1309 = _1289 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1311 = _1181 * _1151;
    float _1313 = _1289 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1315 = _1289 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1317 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1309);
    float _1319 = _1185 * _1151;
    float _1321 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1313);
    int _1323 = _834 + 88;
    uint _1325 = uint(int(uint(_1323) >> uint(2)));
    uint _1327 = uint(int(uint(int(_1325)) >> uint(2)));
    int _1329 = int(_1325) & 3;
    float _1331 = (*spvDescriptorSet0.vp_c15)._m0[int(_1327)][_1329];
    int _1333 = int(_1325) + 1;
    uint _1335 = uint(int(uint(_1333) >> uint(2)));
    int _1337 = _1333 & 3;
    float _1339 = (*spvDescriptorSet0.vp_c15)._m0[int(_1335)][_1337];
    float _1341 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1315);
    float _1343 = fma(_1293, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1317);
    bool _1345 = _1311 >= 0.0;
    float _1347 = fma(_1293, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1321);
    float _1349 = _1289 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1351 = fma(_1293, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1341);
    float _1353 = _1343 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _1355 = _1311 <= 1.0;
    bool _1357 = _1355 && _1345;
    float _1359 = _1347 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1361 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1349);
    float _1363 = _1351 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1365 = _1353 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1367 = _1319 >= 0.0;
    bool _1369 = _1367 && _1357;
    float _1371 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1373 = _1359 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1375 = fma(_1293, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1361);
    float _1377 = fma(_1363, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1365);
    bool _1379 = _1319 <= 1.0;
    bool _1381 = _1379 && _1369;
    float _1383 = -_1373;
    float _1385 = fma(_1383, _1371, 1.0);
    float _1387 = _1375 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1389 = fma(_1359, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1377);
    float _1391 = _1183;
    float _1393 = _1347;
    if (!_1045)
    {
        float _1395 = floor(_858);
        _1391 = _1395;
    }
    float _1397 = _1391;
    float _1399 = _1353 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1401 = _1353 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1403 = fma(_1387, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1389);
    float _1405 = _750 * _1087;
    float _1407 = fma(_1363, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1399);
    float _1409 = fma(_1363, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1401);
    if (!_1045)
    {
        float _1411 = -_1131;
        float _1413 = _808 + _1411;
        _1393 = _1413;
    }
    float _1415 = _1393;
    float _1417 = 1.0 / _1403;
    if (_1381)
    {
        float _1419 = float(_822);
        _1103 = _1419;
    }
    float _1421 = _1103;
    float _1423 = fma(_226, _1079, _1405);
    float _1425 = fma(_1359, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1407);
    float _1427 = fma(_1359, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1409);
    float _1429 = fma(_1387, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1425);
    float _1431 = log2(_1385);
    float _1433 = fma(_1387, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1427);
    float _1435 = _1421;
    float _1437 = _1425;
    if (_1381)
    {
        float _1439 = rint(_1421);
        float _1441 = precise::max(_1439, 0.0);
        uint _1443 = uint(_1441);
        uint _1445 = clamp(_1443, 0u, 65535u);
        _1435 = as_type<float>(_1445);
    }
    float _1447 = _1435;
    float _1449 = fma(_228, _1331, _1423);
    float _1451 = _1331;
    if (!_1045)
    {
        float _1453 = -_1397;
        float _1455 = _858 + _1453;
        _1451 = _1455;
    }
    float _1457 = _1451;
    float _1459 = _1429 * _1417;
    float _1461 = _1433 * _1417;
    float _1463 = _1449 + _1339;
    float _1465 = _1307;
    if (!_1045)
    {
        float _1467 = rint(_1307);
        float _1469 = precise::max(_1467, 0.0);
        uint _1471 = uint(_1469);
        uint _1473 = clamp(_1471, 0u, 65535u);
        _1465 = as_type<float>(_1473);
    }
    float _1475 = _1465;
    float _1477 = _1431 * 0.693147182464599609375;
    float _1479 = _1463 * _1151;
    float _1481 = fma(_1459, 0.5, 0.5);
    float _1483 = fma(_1461, -0.5, 0.5);
    float _1485 = _1477 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1487 = _808;
    if (_1381)
    {
        float3 _4925 = float3(_1311, _1319, float(as_type<int>(_1447)));
        float3 _4929 = select(_4925, float3(0.0), isnan(_4925));
        float _1489 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _4929.xy, uint(rint(_4929.z)), _1479, level(0.0));
        _1487 = _1489;
    }
    float _1491 = _1487;
    float3 _4939 = float3(_1481, _1483, _1485);
    float _1493 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4939, float3(0.0), isnan(_4939)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4939, float3(0.0), isnan(_4939)), level(0.0)).x;
    float3 _4948 = float3(_1481, _1483, _1485);
    float4 _1496 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4948, float3(0.0), isnan(_4948)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4948, float3(0.0), isnan(_4948)), level(0.0)).xyzw;
    float _1498 = _1496.x;
    float _1500 = _1496.y;
    float _1502 = _1496.z;
    float _1504 = _1496.w;
    float _1506 = _1011;
    if (!_1045)
    {
        float3 _4971 = float3(_1415, _1457, float(as_type<int>(_1475)));
        float3 _4973 = select(_4971, float3(0.0), isnan(_4971));
        float _1508 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _4973.xy, uint(rint(_4973.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _4973.xy, uint(rint(_4973.z)), level(0.0)).x;
        _1506 = _1508;
    }
    float _1510 = _1506;
    if (_1045)
    {
        _1437 = 1.0;
    }
    float _1512 = _1437;
    float _1514 = _1512;
    if (!_1045)
    {
        int _1516 = _1111 << 4;
        int _1518 = _1516 + 2048;
        uint _1520 = uint(int(uint(_1518) >> uint(2)));
        uint _1522 = uint(int(uint(int(_1520)) >> uint(2)));
        int _1524 = int(_1520) & 3;
        float _1526 = (*spvDescriptorSet0.vp_c15)._m0[int(_1522)][_1524];
        int _1528 = int(_1520) + 1;
        uint _1530 = uint(int(uint(_1528) >> uint(2)));
        int _1532 = _1528 & 3;
        float _1534 = (*spvDescriptorSet0.vp_c15)._m0[int(_1530)][_1532];
        int _1536 = _1518 + 8;
        uint _1538 = uint(int(uint(_1536) >> uint(2)));
        uint _1540 = uint(int(uint(int(_1538)) >> uint(2)));
        int _1542 = int(_1538) & 3;
        float _1544 = (*spvDescriptorSet0.vp_c15)._m0[int(_1540)][_1542];
        int _1546 = int(_1538) + 1;
        uint _1548 = uint(int(uint(_1546) >> uint(2)));
        int _1550 = _1546 & 3;
        float _1552 = (*spvDescriptorSet0.vp_c15)._m0[int(_1548)][_1550];
        float _1554 = _750 * _1534;
        float _1556 = fma(_226, _1526, _1554);
        float _1558 = fma(_228, _1544, _1556);
        float _1560 = _1558 + _1552;
        float _1562 = precise::clamp(_1560, 0.0, 1.0);
        float _1564 = -_1562;
        float _1566 = _1564 + _1510;
        float _1568 = fma(_1566, 500.0, 1.5);
        float _1570 = exp2(_1568);
        float _1572 = 0.0 + _1570;
        float _1574 = precise::clamp(_1572, 0.0, 1.0);
        _1514 = _1574;
    }
    float _1576 = _1514;
    float _1578 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1580 = _1289 + _1578;
    float _1582 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1584 = _1291 + _1582;
    float _1586 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1588 = _1293 + _1586;
    float _1590 = _1580 * _1580;
    float _1592 = fma(_1584, _1584, _1590);
    float _1594 = fma(_1588, _1588, _1592);
    float _1596 = rsqrt(_1594);
    float _1598 = sqrt(_1594);
    float _1600 = _1596 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1602 = _1584 * _1600;
    float _1604 = _1588 * _1600;
    float _1606 = _1602 * _1602;
    float _1608 = _1604 * _1604;
    float _1610 = _1606 + _1608;
    float _1612 = sqrt(_1610);
    bool _1614 = _1612 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1616 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1618 = _1612 + _1616;
    float _1620 = _1447;
    float _1622 = _1610;
    float _1624 = _1618;
    float _1626 = _1580;
    float _1628 = _1600;
    float _1630 = _1602;
    float _1632 = _1606;
    float _1634 = _1608;
    if (_1614)
    {
        float _1636 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1620 = _1636;
    }
    float _1638 = _1620;
    if (_1614)
    {
        float _1640 = rsqrt(_1610);
        _1622 = _1640;
    }
    float _1642 = _1622;
    if (_1614)
    {
        float _1644 = _1618 * _1638;
        _1624 = _1644;
    }
    float _1646 = _1624;
    if (_1614)
    {
        float _1648 = _1646 * 0.15915493667125701904296875;
        _400 = _1648;
    }
    float _1650 = _400;
    float _1652 = _1311;
    if (_1614)
    {
        float _1654 = _1650 * 6.283185482025146484375;
        float _1656 = sin(_1654);
        _1652 = _1656;
    }
    float _1658 = _1652;
    float _1660 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1662 = precise::max(0.0, _1660);
    float _1664 = _1638;
    if (_1614)
    {
        float _1666 = _1650 * 6.283185482025146484375;
        float _1668 = cos(_1666);
        _1664 = _1668;
    }
    float _1670 = _1664;
    float _1672 = -_1600;
    float _1674 = -_1662;
    float _1676 = fma(_1580, _1672, _1674);
    float _1678 = _1676;
    if (_1614)
    {
        float _1680 = _1676 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1626 = _1680;
    }
    float _1682 = _1626;
    float _1684 = _1658;
    float _1686 = _1682;
    if (_1614)
    {
        float _1688 = fma(_1658, _1682, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1684 = _1688;
    }
    float _1690 = _1684;
    float _1692 = _1690;
    if (_1614)
    {
        float _1694 = _1670 + (-1.0);
        _1686 = _1694;
    }
    float _1696 = _1686;
    float _1698 = _1696;
    if (_1614)
    {
        float _1700 = _1642 * _1690;
        _1628 = _1700;
    }
    float _1702 = _1628;
    if (_1614)
    {
        float _1704 = _1696 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1692 = _1704;
    }
    float _1706 = _1692;
    if (_1614)
    {
        float _1708 = _1602 * _1702;
        _1630 = _1708;
    }
    float _1710 = _1630;
    if (!_1614)
    {
        _1698 = _1604;
    }
    float _1712 = _1698;
    float _1714 = _1712;
    if (_1614)
    {
        float _1716 = _1604 * _1702;
        _1714 = _1716;
    }
    float _1718 = _1714;
    if (_1614)
    {
        float _1720 = fma(_1676, _1670, _1706);
        _1678 = _1720;
    }
    float _1722 = _1678;
    if (_1614)
    {
        float _1724 = _1710 * _1710;
        _1632 = _1724;
    }
    float _1726 = _1632;
    if (_1614)
    {
        float _1728 = _1718 * _1718;
        _1634 = _1728;
    }
    float _1730 = _1634;
    float _1732 = fma(_1722, _1722, _1726);
    float _1734 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1736 = fma(_1598, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1734);
    float _1738 = precise::clamp(_1736, 0.0, 1.0);
    float _1740 = _1732 + _1730;
    float _1742 = -_1738;
    float _1744 = _1742 + 1.0;
    float _1746 = rsqrt(_1740);
    float _1748 = abs(_1744);
    float _1750 = log2(_1748);
    float _1752 = _1746 * _1710;
    float _1754 = _1746 * _1722;
    float _1756 = _1746 * _1718;
    float _1758 = _1752 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1760 = -_1758;
    float _1762 = fma(_1754, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1760);
    float _1764 = _1750 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1766 = -_1756;
    float _1768 = fma(_1766, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1762);
    float _1770 = exp2(_1764);
    float _1772 = fma(_1768, -0.5, 0.5);
    float _1774 = fma(_1768, 0.5, 0.5);
    float _1776 = fma(_1774, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1778 = sqrt(_1772);
    float _1780 = fma(_1774, _1776, -0.212114393711090087890625);
    float _1782 = _1754 + 1.0;
    float _1784 = fma(_1774, _1780, 1.570728778839111328125);
    float _1786 = -_1754;
    float _1788 = fma(_1770, _1782, _1786);
    float _1790 = fma(_1788, 0.5, 0.5);
    float _1792 = _1778 * 0.636619746685028076171875;
    float _1794 = -_1784;
    float _1796 = fma(_1792, _1794, 1.0);
    float2 _5418 = float2(_1796, _1790);
    float3 _1800 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5418, float2(0.0), isnan(_5418)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5418, float2(0.0), isnan(_5418)), level(0.0)).xyz;
    float _1802 = _1800.x;
    float _1804 = _1800.y;
    float _1806 = _1800.z;
    float _1808 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _1810 = in.m_71.y;
    float _1812 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1814 = _256 > 0.5;
    float _1816 = _1808 * _266;
    float _1818 = in.m_63.w;
    int _1820 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1822 = _1820 != 0;
    float _1824 = -_246;
    float _1826 = _1824 + 1.0;
    int _1828 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1830 = _1828 != 0;
    float _1832 = in.m_71.x;
    float _1834 = trunc(_1816);
    int _1836 = int(_1834);
    int _1838 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1840 = _1838 != 0;
    int _1842 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1844 = _1842 != 0;
    out.m_73.x = _1291;
    out.m_73.y = _1289;
    out.m_73.z = _1293;
    float _1846 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1848 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1850 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1852 = -_1810;
    float _1854 = _1852 + 1.0;
    int _1856 = _1836 << 4;
    int _1858 = _1856 + 1712;
    bool _1860 = _1818 > 0.5;
    uint _1862 = uint(int(uint(_1858) >> uint(2)));
    uint _1864 = uint(int(uint(int(_1862)) >> uint(2)));
    int _1866 = int(_1862) & 3;
    float _1868 = (*spvDescriptorSet0.vp_c9)._m0[int(_1864)][_1866];
    int _1870 = int(_1862) + 1;
    uint _1872 = uint(int(uint(_1870) >> uint(2)));
    int _1874 = _1870 & 3;
    float _1876 = (*spvDescriptorSet0.vp_c9)._m0[int(_1872)][_1874];
    float _1878 = 0.0;
    bool _1880 = _1860;
    float _1882 = _1810;
    bool _1884 = _1844;
    float _1886 = _1854;
    if (!_1822)
    {
        _1878 = _1832;
    }
    float _1888 = _1878;
    int _1890 = _1860 ? as_type<int>(_1854) : as_type<int>(_1810);
    int _1892 = _1858 + 8;
    uint _1894 = uint(int(uint(_1892) >> uint(2)));
    uint _1896 = uint(int(uint(int(_1894)) >> uint(2)));
    int _1898 = int(_1894) & 3;
    float _1900 = (*spvDescriptorSet0.vp_c9)._m0[int(_1896)][_1898];
    float _1902 = in.m_75.x;
    float _1904 = in.m_75.y;
    float _1906 = in.m_75.z;
    float _1908 = _1840 ? as_type<float>(_1890) : _1810;
    bool _1910 = _714 != 0.0;
    bool _1912 = isnan(_714);
    bool _1914 = _1910 || _1912;
    bool _1916 = isnan(0.0);
    bool _1918 = _1914 || _1916;
    float _1920 = _1888;
    if (_1822)
    {
        bool _1922 = _266 > 0.5;
        _1880 = _1922;
    }
    bool _1924 = _1880;
    float _1926 = _1908 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _1928 = _712 == 0.0;
    bool _1930 = !_1918;
    bool _1932 = _1928 && _1930;
    float _1934 = _1848 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1936 = _1850 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1938 = _716 == 0.0;
    bool _1940 = _1938 && _1932;
    float _1942 = 0.0;
    if (!_1822)
    {
        _1942 = _1888;
    }
    float _1944 = _1942;
    float _1946 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _1948 = as_type<int>(_1946);
    float _1950 = _1944;
    if (_1822)
    {
        _1920 = _1832;
    }
    float _1952 = _1920;
    float _1954 = _1952;
    if (_1844)
    {
        float _1956 = _1814 ? _1854 : _1810;
        _1882 = _1956;
    }
    float _1958 = _1882;
    float _1960 = _1946 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_1830)
    {
        bool _1962 = _248 > 0.5;
        _1884 = _1962;
    }
    bool _1964 = _1884;
    if (_1822)
    {
        float _1966 = -_1952;
        float _1968 = _1966 + 1.0;
        _402 = as_type<int>(_1968);
    }
    int _1970 = _402;
    if (_1830)
    {
        float _1972 = -_1952;
        float _1974 = _1972 + 1.0;
        _1948 = as_type<int>(_1974);
    }
    int _1976 = _1948;
    float _1978 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    out.m_77.x = _1934;
    out.m_77.y = _1936;
    out.m_77.z = _1960;
    if (_1940)
    {
        _1886 = _1902;
    }
    float _1980 = _1886;
    float _1982 = _1980;
    if (_1822)
    {
        float _1984 = _1924 ? as_type<float>(_1970) : _1952;
        _1950 = _1984;
    }
    float _1986 = _1950;
    float _1988 = in.m_79.x;
    float _1990 = in.m_79.y;
    float _1992 = in.m_79.z;
    float _1994 = in.m_79.w;
    if (_1940)
    {
        _1105 = _1980;
    }
    float _1996 = _1105;
    float _1998 = _1996;
    if (!_1940)
    {
        _1982 = _1902;
    }
    float _2000 = _1982;
    float _2002 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2004 = 0.0;
    if (_1940)
    {
        _2004 = _1904;
    }
    float _2006 = _2004;
    float _2008 = _2006;
    if (!_1940)
    {
        float _2010 = fma(_712, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2000);
        _1998 = _2010;
    }
    float _2012 = _1998;
    if (_1830)
    {
        float _2014 = _1964 ? as_type<float>(_1976) : _1952;
        _1954 = _2014;
    }
    float _2016 = _1954;
    float _2018 = _1868 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2020 = abs(_758);
    float _2022 = log2(_2020);
    float _2024 = 0.0;
    if (_1940)
    {
        _2024 = _2006;
    }
    float _2026 = _2024;
    float _2028 = _1876 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2030 = _2026;
    if (!_1940)
    {
        _2008 = _1904;
    }
    float _2032 = _2008;
    float _2034 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2036 = 0.0;
    if (_1940)
    {
        _2036 = _1906;
    }
    float _2038 = _2036;
    float _2040 = _1900 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2042 = _2018 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2044 = _2028 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2046 = _2038;
    if (!_1940)
    {
        float _2048 = fma(_714, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2032);
        _2030 = _2048;
    }
    float _2050 = _2030;
    float _2052 = _2040 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2054 = 0.0;
    if (_1940)
    {
        _2054 = _2038;
    }
    float _2056 = _2054;
    float _2058 = _1958 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2060 = _1986 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2062 = _2016 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2064 = _2056;
    if (!_1940)
    {
        _2046 = _1906;
    }
    float _2066 = _2046;
    out.m_81.x = _2042;
    out.m_81.y = _2044;
    out.m_81.z = _2052;
    out.m_81.w = _2034;
    float _2068 = _1926 * _2002;
    float _2070 = _2058 * _1978;
    float _2072 = _2060 * _1812;
    float _2074 = _2062 * _1846;
    float _2076 = _1990 * _2066;
    if (!_1940)
    {
        float _2078 = fma(_716, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2066);
        _2064 = _2078;
    }
    float _2080 = _2064;
    bool _2082 = _758 <= 8000.0;
    bool _2084 = isnan(_758);
    bool _2086 = _2082 || _2084;
    bool _2088 = isnan(8000.0);
    bool _2090 = _2086 || _2088;
    float _2092 = float(_2090);
    out.m_83.x = _2072;
    out.m_83.y = _2070;
    out.m_83.z = _2074;
    out.m_83.w = _2068;
    float _2094 = -_2076;
    float _2096 = fma(_1992, _2032, _2094);
    float _2098 = -_1990;
    float _2100 = _850 * _2098;
    float _2102 = _1992 * _2000;
    float _2104 = _2022 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2106 = _1988 * _2032;
    float _2108 = fma(_862, _1988, _2100);
    float _2110 = -_2102;
    float _2112 = fma(_1988, _2066, _2110);
    float _2114 = -_2106;
    float _2116 = fma(_1990, _2000, _2114);
    float _2118 = _2096 * _1994;
    float _2120 = _2112 * _1994;
    float _2122 = exp2(_2104);
    float _2124 = _2116 * _1994;
    float _2126 = -_2050;
    float _2128 = _850 * _2126;
    float _2130 = -_2120;
    float _2132 = _850 * _2130;
    float _2134 = _860 * _1990;
    float _2136 = _860 * _2050;
    float _2138 = fma(_862, _2012, _2128);
    float _2140 = fma(_862, _2118, _2132);
    float _2142 = _860 * _2120;
    float _2144 = _864 * _1990;
    float _2146 = fma(_903, _2012, _2136);
    float _2148 = fma(_903, _1988, _2134);
    float _2150 = fma(_903, _2118, _2142);
    float _2152 = _864 * _2120;
    float _2154 = fma(_872, _2080, _2138);
    float _2156 = fma(_2122, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2158 = precise::clamp(_2156, 0.0, 1.0);
    float _2160 = fma(_897, _1988, _2144);
    float _2162 = fma(_897, _2118, _2152);
    float _2164 = fma(_901, _1992, _2148);
    float _2166 = fma(_872, _1992, _2108);
    float _2168 = fma(_913, _1992, _2160);
    float _2170 = fma(_901, _2080, _2146);
    float _2172 = fma(_2158, -2.0, 3.0);
    float _2174 = fma(_872, _2124, _2140);
    float _2176 = fma(_901, _2124, _2150);
    float _2178 = fma(_913, _2124, _2162);
    float _2180 = _2158 * _2158;
    float _2182 = _2164 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2184 = _2164 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2186 = _2164 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2188 = _2180 * _2172;
    float _2190 = fma(_2166, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2182);
    float _2192 = _2176 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2194 = fma(_2166, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2184);
    float _2196 = _2176 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2198 = _864 * _2050;
    float _2200 = fma(_2166, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2186);
    float _2202 = fma(_2174, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2192);
    float _2204 = fma(_2168, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2190);
    float _2206 = fma(_2174, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2196);
    float _2208 = fma(_2168, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2194);
    float _2210 = _2170 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2212 = _2170 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2214 = fma(_897, _2012, _2198);
    float _2216 = _2170 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2218 = fma(_2178, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2202);
    float _2220 = fma(_2168, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2200);
    float _2222 = fma(_2178, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2206);
    float _2224 = fma(_2154, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2210);
    float _2226 = fma(_2154, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2212);
    float _2228 = fma(_913, _2080, _2214);
    float _2230 = fma(_2154, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2216);
    float _2232 = -_2188;
    float _2234 = _2232 + 1.0;
    float _2236 = _1353 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_85.x = _2220;
    out.m_85.y = _2204;
    out.m_85.z = _2208;
    float _2238 = fma(_2228, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2230);
    float _2240 = _1750 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2242 = fma(_2234, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2188);
    float _2244 = fma(_1363, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2236);
    float _2246 = _2176 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2248 = _2092 * _2242;
    float _2250 = exp2(_2240);
    float _2252 = fma(_1359, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2244);
    float _2254 = _2248 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2256 = _2220;
    if (!_1381)
    {
        _2256 = 1.0;
    }
    float _2258 = _2256;
    float _2260 = fma(_1387, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2252);
    float _2262 = _2258;
    if (_1381)
    {
        bool _2264 = _1491 >= _1479;
        bool _2266 = isnan(_1491);
        bool _2268 = _2264 || _2266;
        bool _2270 = isnan(_1479);
        bool _2272 = _2268 || _2270;
        float _2274 = float(_2272);
        _2262 = _2274;
    }
    float _2276 = _2262;
    float _2278 = _1826 * _2254;
    float _2280 = precise::clamp(_2278, 0.0, 1.0);
    out.m_87.x = 1.0;
    out.m_87.y = 1.0;
    out.m_87.z = 1.0;
    float _2282 = fma(_2174, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2246);
    float _2284 = _2260 + _1403;
    float _2286 = _2276 * _1576;
    float _2288 = fma(_2228, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2224);
    float _2290 = fma(_2178, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2282);
    float _2292 = fma(_2228, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2226);
    float _2294 = -_2250;
    float _2296 = _2294 + 1.0;
    float _2298 = _2284 * 0.5;
    out.m_89.x = _2218;
    out.m_89.y = _2222;
    out.m_89.z = _2290;
    bool _2300 = _1598 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2302 = isnan(_1598);
    bool _2304 = _2300 || _2302;
    bool _2306 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2308 = _2304 || _2306;
    float _2310 = _2296 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2312 = -_2280;
    float _2314 = fma(_2312, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.gl_Position.x = _1429;
    out.gl_Position.y = _1433;
    out.gl_Position.z = _2260;
    out.gl_Position.w = _1403;
    float _2316 = _2310 * _1493;
    float _2318 = -_2286;
    float _2320 = fma(_2318, _2314, 1.0);
    float _2322 = precise::clamp(_2320, 0.0, 1.0);
    float _2324 = -_2310;
    float _2326 = _2324 + 1.0;
    out.m_91.z = _2298;
    out.m_91.w = _1403;
    float _2328 = _1504 * _2316;
    float _2330 = _1504 * _2326;
    out.m_93.x = _2288;
    out.m_93.y = _2292;
    out.m_93.z = _2238;
    float _2332 = _2280;
    float _2334 = _2326;
    float _2336 = _2322;
    float _2338 = _2316;
    float _2340 = _2328;
    if (!_2308)
    {
        _2332 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2342 = _2332;
    float _2344 = _2342;
    float _2346 = _2342;
    if (!_2308)
    {
        _2334 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2348 = _2334;
    float _2350 = _1806 * _2316;
    float _2352 = fma(_1802, _2328, _1498);
    float _2354 = fma(_1804, _2328, _1500);
    float _2356 = _2322 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2358 = fma(_1504, _2350, _1502);
    float _2360 = _2350;
    float _2362 = _2348;
    float _2364 = _2348;
    if (!_2308)
    {
        _2336 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2366 = _2336;
    float _2368 = _2366;
    float _2370 = _2366;
    if (!_2308)
    {
        _2360 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2372 = _2360;
    out.m_95.x = _2356;
    float _2374 = _2372;
    float _2376 = _2372;
    if (!_2308)
    {
        _2338 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2378 = _2338;
    float _2380 = _2378;
    float _2382 = _2378;
    if (!_2308)
    {
        _2340 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2384 = _2340;
    out.m_97.x = _2352;
    out.m_97.y = _2354;
    out.m_97.z = _2358;
    out.m_97.w = _2330;
    bool _2386 = !_2308;
    float _2388 = _2384;
    float _2390 = _2384;
    if (!_2386)
    {
        bool _2392 = _1598 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2394 = isnan(_1598);
        bool _2396 = _2392 || _2394;
        bool _2398 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2400 = _2396 || _2398;
        if (!_2400)
        {
            float _2402 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2404 = _1598 + _2402;
            float _2406 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2408 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2406;
            float _2410 = 1.0 / _2408;
            float _2412 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2414 = _2412 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2416 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2418 = _2416 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2420 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2422 = _2420 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2424 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2426 = _2424 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2428 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2430 = _2428 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2432 = _2404 * _2410;
            float _2434 = precise::clamp(_2432, 0.0, 1.0);
            float _2436 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2438 = _2436 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2440 = fma(_2434, _2414, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2442 = fma(_2434, _2438, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2444 = fma(_2434, _2418, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2446 = fma(_2434, _2422, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2448 = fma(_2434, _2426, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2450 = fma(_2434, _2430, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2364 = _2442;
            _2382 = _2448;
            _2346 = _2440;
            _2376 = _2446;
            _2370 = _2444;
            _2390 = _2450;
            _2452 = true;
        }
        else
        {
            bool _2454 = _1598 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2456 = isnan(_1598);
            bool _2458 = _2454 || _2456;
            bool _2460 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2462 = _2458 || _2460;
            if (!_2462)
            {
                _2344 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2464 = _2344;
            _2346 = _2464;
            if (!_2462)
            {
                _2362 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2466 = _2362;
            _2364 = _2466;
            if (!_2462)
            {
                _2368 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2468 = _2368;
            _2370 = _2468;
            if (!_2462)
            {
                _2374 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2470 = _2374;
            _2376 = _2470;
            if (!_2462)
            {
                _2380 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2472 = _2380;
            _2382 = _2472;
            if (!_2462)
            {
                _2388 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2474 = _2388;
            bool _2476 = !_2462;
            _2390 = _2474;
            if (!_2476)
            {
                bool _2478 = _1598 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2480 = isnan(_1598);
                bool _2482 = _2478 || _2480;
                bool _2484 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2486 = _2482 || _2484;
                if (!_2486)
                {
                    float _2488 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2490 = _1598 + _2488;
                    float _2492 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2494 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2492;
                    float _2496 = 1.0 / _2494;
                    float _2498 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2500 = _2498 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2502 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2504 = _2502 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2506 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2508 = _2506 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2510 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2512 = _2510 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2514 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2516 = _2514 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2518 = _2490 * _2496;
                    float _2520 = precise::clamp(_2518, 0.0, 1.0);
                    float _2522 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2524 = _2522 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2526 = fma(_2520, _2500, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2528 = fma(_2520, _2524, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2530 = fma(_2520, _2504, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2532 = fma(_2520, _2508, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2534 = fma(_2520, _2512, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2536 = fma(_2520, _2516, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2364 = _2528;
                    _2382 = _2534;
                    _2346 = _2526;
                    _2376 = _2532;
                    _2370 = _2530;
                    _2390 = _2536;
                    _2452 = true;
                }
                else
                {
                    _2364 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2382 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2346 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2376 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2370 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2390 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2452 = false;
    float _2538 = _2364;
    float _2540 = _2382;
    float _2542 = _2346;
    float _2544 = _2376;
    float _2546 = _2370;
    float _2548 = _2390;
    float _2550 = fma(_2292, -0.5, 0.5);
    float _2552 = precise::clamp(_2550, 0.0, 1.0);
    float _2554 = -_2538;
    float _2556 = _2554 + _2540;
    float _2558 = -_2542;
    float _2560 = _2558 + _2544;
    float _2562 = -_2546;
    float _2564 = _2562 + _2548;
    bool _2566 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2568 = fma(_2552, _2556, _2538);
    float _2570 = fma(_2552, _2560, _2542);
    float _2572 = fma(_2552, _2564, _2546);
    float _2574 = _2568 * 0.586610972881317138671875;
    out.m_99.x = 0.0;
    float _2576 = fma(_2570, 0.298911988735198974609375, _2574);
    float _2578 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2580 = fma(_2572, 0.114477999508380889892578125, _2576);
    out.m_59.x = _2578;
    float _2582 = -_2580;
    float _2584 = _2570 + _2582;
    float _2586 = -_2580;
    float _2588 = _2568 + _2586;
    float _2590 = -_2580;
    float _2592 = _2572 + _2590;
    float _2594 = fma(_2584, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2580);
    float _2596 = fma(_2588, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2580);
    float _2598 = fma(_2592, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2580);
    out.m_101.x = _2594;
    out.m_101.y = _2596;
    out.m_101.z = _2598;
    if (!_2566)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2600 = -_1289;
    float _2602 = _2600 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2604 = -_1291;
    float _2606 = _2604 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2608 = -_1293;
    float _2610 = _2608 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2612 = _2602 * _2602;
    float _2614 = fma(_2606, _2606, _2612);
    float _2616 = fma(_2610, _2610, _2614);
    float _2618 = sqrt(_2616);
    float _2620 = rsqrt(_2616);
    float _2622 = -_2618;
    float _2624 = _2622 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2626 = _2624 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2628 = precise::clamp(_2626, 0.0, 1.0);
    float _2630 = _2606 * _2620;
    float _2632 = _2602 * _2620;
    float _2634 = abs(_2628);
    float _2636 = log2(_2634);
    float _2638 = _2610 * _2620;
    float _2640 = _2630 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2642 = _2292 * _2632;
    float _2644 = -_2632;
    float _2646 = -_2640;
    float _2648 = fma(_2644, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2646);
    float _2650 = fma(_2288, _2630, _2642);
    float _2652 = -_2638;
    float _2654 = fma(_2652, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2648);
    float _2656 = fma(_2238, _2638, _2650);
    float _2658 = precise::clamp(_2656, 0.0, 1.0);
    float _2660 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2662 = _2654 + _2660;
    float _2664 = _2636 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2666 = _2662 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2668 = precise::clamp(_2666, 0.0, 1.0);
    float _2670 = exp2(_2664);
    float _2672 = _2670 * _2668;
    float _2674 = _2658 * _2672;
    float _2676 = _2674 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2678 = _2674 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2680 = _2674 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_99.x = _2676;
    out.m_99.y = _2678;
    out.m_99.z = _2680;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2452 = false;
    bool _198 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _115 = in.m_56.w;
    float _117 = trunc(_115);
    int _120 = int(_117);
    bool _124 = _120 >= 1;
    float _126 = 0.0;
    if (!_124)
    {
        _126 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _128 = _126;
    float _130 = _128;
    if (!_124)
    {
        out.m_59.x = 0.0;
    }
    int _132 = 0;
    if (!_124)
    {
        float _134 = _128 * 5.0;
        _132 = as_type<int>(_134);
    }
    int _136 = _132;
    int _138 = _136;
    if (!_124)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2737 = as_type<float>(_136);
        out.gl_Position.z = _2737;
    }
    if (!_124)
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
        float _158 = float(_120);
        _130 = _158;
    }
    float _160 = _130;
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
    if (_166)
    {
        float _172 = _170 * 5.0;
        _138 = as_type<int>(_172);
    }
    int _174 = _138;
    if (_166)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2807 = as_type<float>(_174);
        out.gl_Position.z = _2807;
    }
    if (_166)
    {
        return out;
    }
    bool _176 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _178 = !_176;
    float _196;
    if (!_178)
    {
        float _180 = in.m_63.x;
        float _182 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _184 = _180 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _186 = fma(_184, (*spvDescriptorSet0.vp_c9)._m0[12].x, _154);
        float _188 = _186 * _182;
        float _190 = floor(_188);
        float _192 = -_190;
        float _194 = _188 + _192;
        _196 = _194;
        _198 = true;
    }
    else
    {
        float _200 = float(_120);
        float _202 = 1.0 / _200;
        float _204 = _154 * _202;
        _196 = _204;
    }
    _198 = false;
    float _206 = _196;
    float _208 = in.m_56.x;
    float _210 = in.m_56.y;
    float _212 = in.m_56.z;
    float _214 = _210 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _216 = _210 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _218 = fma(_208, (*spvDescriptorSet0.vp_c10)._m0[4].x, _214);
    float _220 = fma(_208, (*spvDescriptorSet0.vp_c10)._m0[6].x, _216);
    float _222 = fma(_212, (*spvDescriptorSet0.vp_c10)._m0[4].z, _218);
    float _224 = fma(_212, (*spvDescriptorSet0.vp_c10)._m0[6].z, _220);
    float _226 = _222 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _228 = _224 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _230 = fma(_226, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _232 = fma(_228, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _234 = floor(_230);
    float _236 = floor(_232);
    float _238 = -_234;
    float _240 = _230 + _238;
    float _242 = -_236;
    float _244 = _232 + _242;
    float2 _2934 = float2(_240, _244);
    float _246 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_2934, float2(0.0), isnan(_2934)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_2934, float2(0.0), isnan(_2934)), level(0.0)).x;
    float _248 = in.m_63.z;
    float _250 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _252 = log2(_250);
    float _254 = _210 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _256 = in.m_63.y;
    float _258 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _260 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _258;
    float _262 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _264 = _262 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _266 = in.m_63.x;
    float _268 = 1.0 / _260;
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _272 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _270;
    float _274 = fma(_208, (*spvDescriptorSet0.vp_c10)._m0[5].x, _254);
    float _276 = 1.0 / _264;
    float _278 = _252 * _154;
    float _280 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _282 = _206 + _280;
    float _284 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _286 = 1.0 + _284;
    int _288 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _290 = _288 != 0;
    int _292 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _294 = _292 != 0;
    int _296 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _298 = _296 != 0;
    float _300 = fma(_212, (*spvDescriptorSet0.vp_c10)._m0[5].z, _274);
    float _302 = _248 * 2.0;
    float _304 = exp2(_278);
    float _306 = _282 * _268;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _310 = _206 + _308;
    float _312 = _256 + _248;
    float _314 = _300 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _316 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _318 = isnan(1.0);
    bool _320 = _316 || _318;
    bool _322 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _324 = _320 || _322;
    float _326 = _312 + (-1.0);
    float _328 = 1.0 / _272;
    float _330 = _310 * _276;
    float _332 = _266 + _256;
    float _334 = fma(_326, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _336 = _256 * 2.0;
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _340 = _206 + _338;
    bool _342 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _344 = isnan(0.0);
    bool _346 = _342 || _344;
    bool _348 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _350 = _346 || _348;
    float _352 = floor(_302);
    float _354 = -_304;
    float _356 = _354 + 1.0;
    float _358 = _350 ? _356 : 0.0;
    float _360 = 1.0 / _286;
    float _362 = _266 + _248;
    float _364 = _340 * _328;
    float _366 = _362 + (-1.0);
    float _368 = _332 + (-1.0);
    float _370 = floor(_336);
    float _372 = _266 * 2.0;
    float _374 = fma(_368, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _376 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _378 = _352 > 0.0;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _382 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _380;
    bool _384 = _352 >= 0.0;
    bool _386 = isnan(_352);
    bool _388 = _384 || _386;
    bool _390 = isnan(0.0);
    bool _392 = _388 || _390;
    float _394 = floor(_372);
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _398 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _396;
    float _400 = _228;
    int _402 = as_type<int>(_248);
    if (_324)
    {
        float _404 = _358 * _360;
        _156 = _404;
    }
    float _406 = _156;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _410 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _408;
    bool _412 = _206 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _414 = isnan(_206);
    bool _416 = _412 || _414;
    bool _418 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _420 = _416 || _418;
    float _422 = float(_420);
    float _424 = fma(_398, _306, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _426 = _206 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _428 = isnan(_206);
    bool _430 = _426 || _428;
    bool _432 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _434 = _430 || _432;
    float _436 = float(_434);
    float _438 = fma(_410, _306, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    int _440 = _392 ? 0 : 1;
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _444 = _442 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _446 = _370 > 0.0;
    float _448 = -_436;
    float _450 = _448 + 1.0;
    float _452 = fma(_444, _330, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _454 = _394 > 0.0;
    bool _456 = _394 >= 0.0;
    bool _458 = isnan(_394);
    bool _460 = _456 || _458;
    bool _462 = isnan(0.0);
    bool _464 = _460 || _462;
    float _466 = fma(_382, _306, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _470 = _468 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _472 = _206 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _474 = isnan(_206);
    bool _476 = _472 || _474;
    bool _478 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _480 = _476 || _478;
    float _482 = float(_480);
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _486 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _484;
    int _488 = _464 ? 0 : 1;
    float _490 = fma(_470, _330, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _492 = _370 >= 0.0;
    bool _494 = isnan(_370);
    bool _496 = _492 || _494;
    bool _498 = isnan(0.0);
    bool _500 = _496 || _498;
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _504 = _502 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    bool _506 = _206 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _508 = isnan(_206);
    bool _510 = _506 || _508;
    bool _512 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _514 = _510 || _512;
    float _516 = float(_514);
    float _518 = _422 * _450;
    float _520 = -_422;
    float _522 = _520 + 1.0;
    float _524 = fma(_504, _330, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _526 = _516 * _522;
    float _528 = -_516;
    float _530 = _528 + 1.0;
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _534 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _532;
    int _536 = ~_488;
    int _538 = _536 + 1;
    int _540 = _538 + 1;
    float _542 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _544 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _542;
    float _546 = _482 * _530;
    float _548 = fma(_486, _364, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _550 = fma(_534, _364, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _552 = fma(_544, _364, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _554 = _438 * _546;
    float _556 = _466 * _546;
    int _558 = _500 ? 0 : 1;
    float _560 = -_482;
    float _562 = _560 + 1.0;
    float _564 = _424 * _546;
    int _566 = _540;
    if (!_454)
    {
        int _568 = ~_488;
        int _570 = _568 + 1;
        _566 = _570;
    }
    int _572 = _566;
    int _574 = ~_558;
    int _576 = _574 + 1;
    int _578 = _576 + 1;
    float _580 = fma(_562, (*spvDescriptorSet0.vp_c9)._m0[143].x, _556);
    int _582 = _578;
    if (!_446)
    {
        int _584 = ~_558;
        int _586 = _584 + 1;
        _582 = _586;
    }
    int _588 = _582;
    float _590 = fma(_562, (*spvDescriptorSet0.vp_c9)._m0[143].y, _564);
    float _592 = fma(_562, (*spvDescriptorSet0.vp_c9)._m0[143].z, _554);
    bool _594 = !_290;
    int _596 = _594 ? 0 : 1;
    float _598 = _314 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _600 = fma(_490, _526, _580);
    bool _602 = !_294;
    int _604 = _602 ? 0 : 1;
    float _606 = fma(_452, _526, _590);
    int _608 = abs(_596);
    float _610 = fma(_226, (*spvDescriptorSet0.vp_c8)._m0[11].x, _598);
    int _612 = ~_440;
    int _614 = _612 + 1;
    int _616 = _614 + 1;
    float _618 = in.m_65.x;
    float _620 = in.m_65.y;
    float _622 = in.m_65.z;
    int _624 = _616;
    if (!_378)
    {
        int _626 = ~_440;
        int _628 = _626 + 1;
        _624 = _628;
    }
    int _630 = _624;
    float _632 = fma(_524, _526, _592);
    int _634 = abs(_604);
    float _636 = fma(_548, _518, _600);
    float _638 = float(_608);
    float _640 = fma(_228, (*spvDescriptorSet0.vp_c8)._m0[11].z, _610);
    float _642 = float(_630);
    float _644 = _314 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _646 = _640 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _648 = float(_572);
    float _650 = _638 * _642;
    float _652 = fma(_226, (*spvDescriptorSet0.vp_c8)._m0[10].x, _644);
    float _654 = 1.0 / _646;
    float _656 = float(_634);
    float _658 = fma(_552, _518, _632);
    float _660 = fma(_228, (*spvDescriptorSet0.vp_c8)._m0[10].z, _652);
    float _662 = fma(_550, _518, _606);
    float _664 = _650 * (-2.0);
    float _666 = _656 * _648;
    float _668 = _660 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _670 = !_298;
    int _672 = _670 ? 0 : 1;
    float _674 = fma(_374, _664, _374);
    float _676 = _266 + (-0.5);
    float _678 = _668 + _646;
    float _680 = fma(_664, _618, _618);
    float _682 = _666 * (-2.0);
    int _684 = abs(_672);
    float _686 = _678 * _654;
    float _688 = _686 * 0.5;
    float _690 = fma(_676, (*spvDescriptorSet0.vp_c9)._m0[196].x, _680);
    float _692 = float(_588);
    float _694 = in.m_67.x;
    float _696 = in.m_67.y;
    float _698 = in.m_67.z;
    float _700 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _702 = fma(_688, (*spvDescriptorSet0.vp_c8)._m0[30].w, _700);
    float _704 = fma(_674, _406, _690);
    float _706 = float(_684);
    float _708 = _256 + (-0.5);
    float _710 = fma(_682, _620, _620);
    float _712 = in.m_69.x;
    float _714 = in.m_69.y;
    float _716 = in.m_69.z;
    float _718 = 1.0 / _702;
    float _720 = _706 * _692;
    float _722 = fma(_334, _682, _334);
    float _724 = fma(_708, (*spvDescriptorSet0.vp_c9)._m0[196].y, _710);
    float _726 = fma(_436, (*spvDescriptorSet0.vp_c9)._m0[146].x, _636);
    float _728 = _720 * (-2.0);
    float _730 = fma(_436, (*spvDescriptorSet0.vp_c9)._m0[146].y, _662);
    float _732 = fma(_722, _406, _724);
    float _734 = fma(_436, (*spvDescriptorSet0.vp_c9)._m0[146].z, _658);
    float _736 = fma(_376, _728, _376);
    float _738 = fma(_728, _622, _622);
    float _740 = _248 + (-0.5);
    float _742 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _744 = _704 * 0.15915493667125701904296875;
    float _746 = _732 * 0.15915493667125701904296875;
    float _748 = fma(_740, (*spvDescriptorSet0.vp_c9)._m0[196].z, _738);
    float _750 = _314 + _742;
    float _752 = _734 * _698;
    float _754 = _726 * _694;
    float _756 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _758 = _718 * _756;
    float _760 = fma(_736, _406, _748);
    float _762 = _744 * 6.283185482025146484375;
    float _764 = sin(_762);
    float _766 = _754 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _768 = _760 * 0.15915493667125701904296875;
    bool _770 = _758 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _772 = _750 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    bool _774 = _758 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _776 = _730 * _696;
    float _778 = _744 * 6.283185482025146484375;
    float _780 = cos(_778);
    float _782 = fma(_226, (*spvDescriptorSet0.vp_c15)._m0[126].x, _772);
    float _784 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _712);
    float _786 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _714);
    float _788 = _776 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _790 = fma(_228, (*spvDescriptorSet0.vp_c15)._m0[126].z, _782);
    float _792 = _784 * _766;
    bool _794 = !_770;
    int _796 = _794 ? 0 : 1;
    float _798 = _746 * 6.283185482025146484375;
    float _800 = sin(_798);
    float _802 = _786 * _788;
    float _804 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _716);
    float _806 = _752 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _808 = _790 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    int _810 = 2;
    if (!_770)
    {
        _810 = 1;
    }
    int _812 = _810;
    float _814 = _804 * _806;
    float _816 = _746 * 6.283185482025146484375;
    float _818 = cos(_816);
    int _820 = _812;
    if (!_774)
    {
        _820 = _796;
    }
    int _822 = _820;
    bool _824 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _826 = isnan(0.5);
    bool _828 = _824 || _826;
    bool _830 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _832 = _828 || _830;
    int _834 = _822 << 6;
    float _836 = _768 * 6.283185482025146484375;
    float _838 = cos(_836);
    float _840 = _750 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _842 = _780 * _800;
    float _844 = _764 * _800;
    float _846 = fma(_226, (*spvDescriptorSet0.vp_c15)._m0[127].x, _840);
    float _848 = _768 * 6.283185482025146484375;
    float _850 = sin(_848);
    float _852 = _764 * _818;
    float _854 = _780 * _818;
    float _856 = fma(_228, (*spvDescriptorSet0.vp_c15)._m0[127].z, _846);
    float _858 = _856 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _860 = _780 * _838;
    float _862 = _818 * _838;
    float _864 = _764 * _838;
    float _866 = trunc(_808);
    int _868 = int(_866);
    float _870 = _860 * _802;
    float _872 = _800 * _838;
    int _874 = _834 + 48;
    uint _877 = uint(int(uint(_874) >> uint(2)));
    uint _879 = uint(int(uint(int(_877)) >> uint(2)));
    int _881 = int(_877) & 3;
    float _883 = (*spvDescriptorSet0.vp_c15)._m0[int(_879)][_881];
    int _885 = int(_877) + 1;
    uint _887 = uint(int(uint(_885) >> uint(2)));
    int _889 = _885 & 3;
    float _891 = (*spvDescriptorSet0.vp_c15)._m0[int(_887)][_889];
    float _893 = _864 * _802;
    float _895 = -_842;
    float _897 = fma(_850, _852, _895);
    float _899 = -_852;
    float _901 = fma(_850, _842, _899);
    float _903 = fma(_850, _854, _844);
    float _905 = trunc(_858);
    int _907 = int(_905);
    float _909 = -_802;
    float _911 = _850 * _909;
    float _913 = fma(_850, _844, _854);
    int _915 = _834 + 96;
    uint _917 = uint(int(uint(_915) >> uint(2)));
    uint _919 = uint(int(uint(int(_917)) >> uint(2)));
    int _921 = int(_917) & 3;
    float _923 = (*spvDescriptorSet0.vp_c15)._m0[int(_919)][_921];
    int _925 = int(_917) + 1;
    uint _927 = uint(int(uint(_925) >> uint(2)));
    int _929 = _925 & 3;
    float _931 = (*spvDescriptorSet0.vp_c15)._m0[int(_927)][_929];
    float _933 = fma(_903, _792, _870);
    float _935 = fma(_862, _792, _911);
    float _937 = fma(_897, _792, _893);
    float _939 = fma(_901, _814, _933);
    float _941 = fma(_872, _814, _935);
    float _943 = fma(_913, _814, _937);
    int _945 = _834 + 104;
    uint _947 = uint(int(uint(_945) >> uint(2)));
    uint _949 = uint(int(uint(int(_947)) >> uint(2)));
    int _951 = int(_947) & 3;
    float _953 = (*spvDescriptorSet0.vp_c15)._m0[int(_949)][_951];
    int _955 = int(_947) + 1;
    uint _957 = uint(int(uint(_955) >> uint(2)));
    int _959 = _955 & 3;
    float _961 = (*spvDescriptorSet0.vp_c15)._m0[int(_957)][_959];
    float _963 = _939 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _965 = _939 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    int _967 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _969 = _868 + _967;
    int _971 = _969 + 1;
    float _973 = fma(_941, (*spvDescriptorSet0.vp_c10)._m0[10].x, _963);
    int _975 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _977 = _907 + _975;
    int _979 = _977 + 1;
    float _981 = fma(_941, (*spvDescriptorSet0.vp_c10)._m0[8].x, _965);
    int _983 = _834 + 64;
    uint _985 = uint(int(uint(_983) >> uint(2)));
    uint _987 = uint(int(uint(int(_985)) >> uint(2)));
    int _989 = int(_985) & 3;
    float _991 = (*spvDescriptorSet0.vp_c15)._m0[int(_987)][_989];
    int _993 = int(_985) + 1;
    uint _995 = uint(int(uint(_993) >> uint(2)));
    int _997 = _993 & 3;
    float _999 = (*spvDescriptorSet0.vp_c15)._m0[int(_995)][_997];
    float _1001 = fma(_943, (*spvDescriptorSet0.vp_c10)._m0[10].z, _973);
    int _1003 = _971 | _979;
    float _1005 = fma(_943, (*spvDescriptorSet0.vp_c10)._m0[8].z, _981);
    bool _1007 = _971 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1009 = _228 + _1001;
    float _1011 = _226 + _1005;
    int _1013 = _834 + 56;
    uint _1015 = uint(int(uint(_1013) >> uint(2)));
    uint _1017 = uint(int(uint(int(_1015)) >> uint(2)));
    int _1019 = int(_1015) & 3;
    float _1021 = (*spvDescriptorSet0.vp_c15)._m0[int(_1017)][_1019];
    int _1023 = int(_1015) + 1;
    uint _1025 = uint(int(uint(_1023) >> uint(2)));
    int _1027 = _1023 & 3;
    float _1029 = (*spvDescriptorSet0.vp_c15)._m0[int(_1025)][_1027];
    bool _1031 = _1003 < 0;
    bool _1033 = _1031 || _1007;
    float _1035 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1037 = _1009 + _1035;
    float _1039 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1041 = _1011 + _1039;
    bool _1043 = _979 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1045 = _1043 || _1033;
    float _1047 = _1037 * _1037;
    int _1049 = _834 + 72;
    uint _1051 = uint(int(uint(_1049) >> uint(2)));
    uint _1053 = uint(int(uint(int(_1051)) >> uint(2)));
    int _1055 = int(_1051) & 3;
    float _1057 = (*spvDescriptorSet0.vp_c15)._m0[int(_1053)][_1055];
    int _1059 = int(_1051) + 1;
    uint _1061 = uint(int(uint(_1059) >> uint(2)));
    int _1063 = _1059 & 3;
    float _1065 = (*spvDescriptorSet0.vp_c15)._m0[int(_1061)][_1063];
    float _1067 = fma(_1041, _1041, _1047);
    float _1069 = sqrt(_1067);
    int _1071 = _834 + 80;
    uint _1073 = uint(int(uint(_1071) >> uint(2)));
    uint _1075 = uint(int(uint(int(_1073)) >> uint(2)));
    int _1077 = int(_1073) & 3;
    float _1079 = (*spvDescriptorSet0.vp_c15)._m0[int(_1075)][_1077];
    int _1081 = int(_1073) + 1;
    uint _1083 = uint(int(uint(_1081) >> uint(2)));
    int _1085 = _1081 & 3;
    float _1087 = (*spvDescriptorSet0.vp_c15)._m0[int(_1083)][_1085];
    float _1089 = _750 * _891;
    float _1091 = _750 * _931;
    float _1093 = _939 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    int _1095 = as_type<int>(_939);
    int _1097 = as_type<int>(_1093);
    float _1099 = _1009;
    float _1101 = _1037;
    float _1103 = as_type<float>(_822);
    float _1105 = as_type<float>(_979);
    if (!_1045)
    {
        int _1107 = _979 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1109 = _1107 + _971;
        _1095 = _1109;
    }
    int _1111 = _1095;
    float _1113 = fma(_226, _923, _1091);
    float _1115 = fma(_226, _883, _1089);
    bool _1117 = _1069 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1119 = fma(_941, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1093);
    float _1121 = fma(_228, _953, _1113);
    float _1123 = _1089;
    float _1125 = _1121;
    float _1127 = _961;
    if (!_1045)
    {
        float _1129 = floor(_808);
        _1123 = _1129;
    }
    float _1131 = _1123;
    if (!_1045)
    {
        int _1133 = _1111 << 2;
        _1097 = _1133;
    }
    int _1135 = _1097;
    float _1137 = fma(_943, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1119);
    float _1139 = _1121 + _961;
    int _1141 = _1135;
    if (!_1045)
    {
        int _1143 = 12 & _1135;
        _1141 = _1143;
    }
    int _1145 = _1141;
    float _1147 = _314 + _1137;
    float _1149 = _750 * _999;
    float _1151 = 1.0 / _1139;
    int _1153 = as_type<int>(_991);
    if (!_1117)
    {
        _1125 = _1011;
    }
    float _1155 = _1125;
    float _1157 = fma(_226, _991, _1149);
    float _1159 = _1155;
    if (!_1045)
    {
        uint _1161 = uint(int(uint(_1111) >> uint(2)));
        _1153 = int(_1161);
    }
    int _1163 = _1153;
    int _1165 = _1163;
    if (!_1117)
    {
        _1127 = _1147;
    }
    float _1167 = _1127;
    float _1169 = fma(_228, _1021, _1115);
    float _1171 = _1167;
    float _1173 = _1021;
    if (!_1045)
    {
        int _1175 = _1163 << 4;
        int _1177 = _1175 + _1145;
        _1165 = _1177;
    }
    int _1179 = _1165;
    float _1181 = _1169 + _1029;
    float _1183 = fma(_228, _1057, _1157);
    float _1185 = _1183 + _1065;
    bool _1187 = !_1117;
    if (!_1187)
    {
        float _1189 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1191 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1193 = _1069 + _1191;
        float _1195 = _1147 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1197 = rsqrt(_1067);
        float _1199 = _1193 * _1189;
        float _1201 = _1199 * 0.15915493667125701904296875;
        float _1203 = _1201 * 6.283185482025146484375;
        float _1205 = cos(_1203);
        float _1207 = _1201 * 6.283185482025146484375;
        float _1209 = sin(_1207);
        float _1211 = _1205 + (-1.0);
        float _1213 = fma(_1209, _1195, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1215 = _1211 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1217 = _1197 * _1213;
        float _1219 = fma(_1147, _1205, _1215);
        float _1221 = fma(_1041, _1217, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1223 = fma(_1037, _1217, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1099 = _1223;
        _1171 = _1219;
        _1159 = _1221;
        _1173 = _1201;
    }
    float _1225 = _1099;
    float _1227 = _1171;
    float _1229 = _1159;
    float _1231 = _1173;
    float _1233 = _1231;
    float _1235 = _1227;
    float _1237 = _1229;
    if (_832)
    {
        _1101 = _1225;
    }
    float _1239 = _1101;
    float _1241 = _1239;
    if (!_832)
    {
        float _1243 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1245 = _314 + _1243;
        float _1247 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1249 = _226 + _1247;
        float _1251 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1253 = -_314;
        float _1255 = _1253 + _1227;
        float _1257 = _1245 * _1245;
        float _1259 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1261 = _228 + _1259;
        float _1263 = -_226;
        float _1265 = _1263 + _1229;
        float _1267 = -_228;
        float _1269 = _1267 + _1225;
        float _1271 = fma(_1249, _1249, _1257);
        float _1273 = fma(_1261, _1261, _1271);
        float _1275 = sqrt(_1273);
        float _1277 = precise::min(_1275, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1279 = _1277 * _1251;
        float _1281 = fma(_1255, _1279, _314);
        float _1283 = fma(_1265, _1279, _226);
        float _1285 = fma(_1269, _1279, _228);
        _1233 = _1251;
        _1235 = _1281;
        _1237 = _1283;
        _1241 = _1285;
    }
    float _1287 = _1233;
    float _1289 = _1235;
    float _1291 = _1237;
    float _1293 = _1241;
    float _1295 = _1287;
    if (!_1045)
    {
        int _1297 = _1179 + 400;
        uint _1299 = uint(int(uint(_1297) >> uint(2)));
        uint _1301 = uint(int(uint(int(_1299)) >> uint(2)));
        int _1303 = int(_1299) & 3;
        float _1305 = (*spvDescriptorSet0.vp_c15)._m0[int(_1301)][_1303];
        _1295 = _1305;
    }
    float _1307 = _1295;
    float _1309 = _1289 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1311 = _1181 * _1151;
    float _1313 = _1289 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1315 = _1289 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1317 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1309);
    float _1319 = _1185 * _1151;
    float _1321 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1313);
    int _1323 = _834 + 88;
    uint _1325 = uint(int(uint(_1323) >> uint(2)));
    uint _1327 = uint(int(uint(int(_1325)) >> uint(2)));
    int _1329 = int(_1325) & 3;
    float _1331 = (*spvDescriptorSet0.vp_c15)._m0[int(_1327)][_1329];
    int _1333 = int(_1325) + 1;
    uint _1335 = uint(int(uint(_1333) >> uint(2)));
    int _1337 = _1333 & 3;
    float _1339 = (*spvDescriptorSet0.vp_c15)._m0[int(_1335)][_1337];
    float _1341 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1315);
    float _1343 = fma(_1293, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1317);
    bool _1345 = _1311 >= 0.0;
    float _1347 = fma(_1293, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1321);
    float _1349 = _1289 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1351 = fma(_1293, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1341);
    float _1353 = _1343 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _1355 = _1311 <= 1.0;
    bool _1357 = _1355 && _1345;
    float _1359 = _1347 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1361 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1349);
    float _1363 = _1351 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1365 = _1353 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1367 = _1319 >= 0.0;
    bool _1369 = _1367 && _1357;
    float _1371 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1373 = _1359 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1375 = fma(_1293, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1361);
    float _1377 = fma(_1363, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1365);
    bool _1379 = _1319 <= 1.0;
    bool _1381 = _1379 && _1369;
    float _1383 = -_1373;
    float _1385 = fma(_1383, _1371, 1.0);
    float _1387 = _1375 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1389 = fma(_1359, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1377);
    float _1391 = _1183;
    float _1393 = _1347;
    if (!_1045)
    {
        float _1395 = floor(_858);
        _1391 = _1395;
    }
    float _1397 = _1391;
    float _1399 = _1353 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1401 = _1353 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1403 = fma(_1387, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1389);
    float _1405 = _750 * _1087;
    float _1407 = fma(_1363, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1399);
    float _1409 = fma(_1363, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1401);
    if (!_1045)
    {
        float _1411 = -_1131;
        float _1413 = _808 + _1411;
        _1393 = _1413;
    }
    float _1415 = _1393;
    float _1417 = 1.0 / _1403;
    if (_1381)
    {
        float _1419 = float(_822);
        _1103 = _1419;
    }
    float _1421 = _1103;
    float _1423 = fma(_226, _1079, _1405);
    float _1425 = fma(_1359, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1407);
    float _1427 = fma(_1359, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1409);
    float _1429 = fma(_1387, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1425);
    float _1431 = log2(_1385);
    float _1433 = fma(_1387, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1427);
    float _1435 = _1421;
    float _1437 = _1425;
    if (_1381)
    {
        float _1439 = rint(_1421);
        float _1441 = precise::max(_1439, 0.0);
        uint _1443 = uint(_1441);
        uint _1445 = clamp(_1443, 0u, 65535u);
        _1435 = as_type<float>(_1445);
    }
    float _1447 = _1435;
    float _1449 = fma(_228, _1331, _1423);
    float _1451 = _1331;
    if (!_1045)
    {
        float _1453 = -_1397;
        float _1455 = _858 + _1453;
        _1451 = _1455;
    }
    float _1457 = _1451;
    float _1459 = _1429 * _1417;
    float _1461 = _1433 * _1417;
    float _1463 = _1449 + _1339;
    float _1465 = _1307;
    if (!_1045)
    {
        float _1467 = rint(_1307);
        float _1469 = precise::max(_1467, 0.0);
        uint _1471 = uint(_1469);
        uint _1473 = clamp(_1471, 0u, 65535u);
        _1465 = as_type<float>(_1473);
    }
    float _1475 = _1465;
    float _1477 = _1431 * 0.693147182464599609375;
    float _1479 = _1463 * _1151;
    float _1481 = fma(_1459, 0.5, 0.5);
    float _1483 = fma(_1461, -0.5, 0.5);
    float _1485 = _1477 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1487 = _808;
    if (_1381)
    {
        float3 _4925 = float3(_1311, _1319, float(as_type<int>(_1447)));
        float3 _4929 = select(_4925, float3(0.0), isnan(_4925));
        float _1489 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _4929.xy, uint(rint(_4929.z)), _1479, level(0.0));
        _1487 = _1489;
    }
    float _1491 = _1487;
    float3 _4939 = float3(_1481, _1483, _1485);
    float _1493 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4939, float3(0.0), isnan(_4939)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4939, float3(0.0), isnan(_4939)), level(0.0)).x;
    float3 _4948 = float3(_1481, _1483, _1485);
    float4 _1496 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4948, float3(0.0), isnan(_4948)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4948, float3(0.0), isnan(_4948)), level(0.0)).xyzw;
    float _1498 = _1496.x;
    float _1500 = _1496.y;
    float _1502 = _1496.z;
    float _1504 = _1496.w;
    float _1506 = _1011;
    if (!_1045)
    {
        float3 _4971 = float3(_1415, _1457, float(as_type<int>(_1475)));
        float3 _4973 = select(_4971, float3(0.0), isnan(_4971));
        float _1508 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _4973.xy, uint(rint(_4973.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _4973.xy, uint(rint(_4973.z)), level(0.0)).x;
        _1506 = _1508;
    }
    float _1510 = _1506;
    if (_1045)
    {
        _1437 = 1.0;
    }
    float _1512 = _1437;
    float _1514 = _1512;
    if (!_1045)
    {
        int _1516 = _1111 << 4;
        int _1518 = _1516 + 2048;
        uint _1520 = uint(int(uint(_1518) >> uint(2)));
        uint _1522 = uint(int(uint(int(_1520)) >> uint(2)));
        int _1524 = int(_1520) & 3;
        float _1526 = (*spvDescriptorSet0.vp_c15)._m0[int(_1522)][_1524];
        int _1528 = int(_1520) + 1;
        uint _1530 = uint(int(uint(_1528) >> uint(2)));
        int _1532 = _1528 & 3;
        float _1534 = (*spvDescriptorSet0.vp_c15)._m0[int(_1530)][_1532];
        int _1536 = _1518 + 8;
        uint _1538 = uint(int(uint(_1536) >> uint(2)));
        uint _1540 = uint(int(uint(int(_1538)) >> uint(2)));
        int _1542 = int(_1538) & 3;
        float _1544 = (*spvDescriptorSet0.vp_c15)._m0[int(_1540)][_1542];
        int _1546 = int(_1538) + 1;
        uint _1548 = uint(int(uint(_1546) >> uint(2)));
        int _1550 = _1546 & 3;
        float _1552 = (*spvDescriptorSet0.vp_c15)._m0[int(_1548)][_1550];
        float _1554 = _750 * _1534;
        float _1556 = fma(_226, _1526, _1554);
        float _1558 = fma(_228, _1544, _1556);
        float _1560 = _1558 + _1552;
        float _1562 = precise::clamp(_1560, 0.0, 1.0);
        float _1564 = -_1562;
        float _1566 = _1564 + _1510;
        float _1568 = fma(_1566, 500.0, 1.5);
        float _1570 = exp2(_1568);
        float _1572 = 0.0 + _1570;
        float _1574 = precise::clamp(_1572, 0.0, 1.0);
        _1514 = _1574;
    }
    float _1576 = _1514;
    float _1578 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1580 = _1289 + _1578;
    float _1582 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1584 = _1291 + _1582;
    float _1586 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1588 = _1293 + _1586;
    float _1590 = _1580 * _1580;
    float _1592 = fma(_1584, _1584, _1590);
    float _1594 = fma(_1588, _1588, _1592);
    float _1596 = rsqrt(_1594);
    float _1598 = sqrt(_1594);
    float _1600 = _1596 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1602 = _1584 * _1600;
    float _1604 = _1588 * _1600;
    float _1606 = _1602 * _1602;
    float _1608 = _1604 * _1604;
    float _1610 = _1606 + _1608;
    float _1612 = sqrt(_1610);
    bool _1614 = _1612 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1616 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1618 = _1612 + _1616;
    float _1620 = _1447;
    float _1622 = _1610;
    float _1624 = _1618;
    float _1626 = _1580;
    float _1628 = _1600;
    float _1630 = _1602;
    float _1632 = _1606;
    float _1634 = _1608;
    if (_1614)
    {
        float _1636 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1620 = _1636;
    }
    float _1638 = _1620;
    if (_1614)
    {
        float _1640 = rsqrt(_1610);
        _1622 = _1640;
    }
    float _1642 = _1622;
    if (_1614)
    {
        float _1644 = _1618 * _1638;
        _1624 = _1644;
    }
    float _1646 = _1624;
    if (_1614)
    {
        float _1648 = _1646 * 0.15915493667125701904296875;
        _400 = _1648;
    }
    float _1650 = _400;
    float _1652 = _1311;
    if (_1614)
    {
        float _1654 = _1650 * 6.283185482025146484375;
        float _1656 = sin(_1654);
        _1652 = _1656;
    }
    float _1658 = _1652;
    float _1660 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1662 = precise::max(0.0, _1660);
    float _1664 = _1638;
    if (_1614)
    {
        float _1666 = _1650 * 6.283185482025146484375;
        float _1668 = cos(_1666);
        _1664 = _1668;
    }
    float _1670 = _1664;
    float _1672 = -_1600;
    float _1674 = -_1662;
    float _1676 = fma(_1580, _1672, _1674);
    float _1678 = _1676;
    if (_1614)
    {
        float _1680 = _1676 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1626 = _1680;
    }
    float _1682 = _1626;
    float _1684 = _1658;
    float _1686 = _1682;
    if (_1614)
    {
        float _1688 = fma(_1658, _1682, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1684 = _1688;
    }
    float _1690 = _1684;
    float _1692 = _1690;
    if (_1614)
    {
        float _1694 = _1670 + (-1.0);
        _1686 = _1694;
    }
    float _1696 = _1686;
    float _1698 = _1696;
    if (_1614)
    {
        float _1700 = _1642 * _1690;
        _1628 = _1700;
    }
    float _1702 = _1628;
    if (_1614)
    {
        float _1704 = _1696 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1692 = _1704;
    }
    float _1706 = _1692;
    if (_1614)
    {
        float _1708 = _1602 * _1702;
        _1630 = _1708;
    }
    float _1710 = _1630;
    if (!_1614)
    {
        _1698 = _1604;
    }
    float _1712 = _1698;
    float _1714 = _1712;
    if (_1614)
    {
        float _1716 = _1604 * _1702;
        _1714 = _1716;
    }
    float _1718 = _1714;
    if (_1614)
    {
        float _1720 = fma(_1676, _1670, _1706);
        _1678 = _1720;
    }
    float _1722 = _1678;
    if (_1614)
    {
        float _1724 = _1710 * _1710;
        _1632 = _1724;
    }
    float _1726 = _1632;
    if (_1614)
    {
        float _1728 = _1718 * _1718;
        _1634 = _1728;
    }
    float _1730 = _1634;
    float _1732 = fma(_1722, _1722, _1726);
    float _1734 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1736 = fma(_1598, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1734);
    float _1738 = precise::clamp(_1736, 0.0, 1.0);
    float _1740 = _1732 + _1730;
    float _1742 = -_1738;
    float _1744 = _1742 + 1.0;
    float _1746 = rsqrt(_1740);
    float _1748 = abs(_1744);
    float _1750 = log2(_1748);
    float _1752 = _1746 * _1710;
    float _1754 = _1746 * _1722;
    float _1756 = _1746 * _1718;
    float _1758 = _1752 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1760 = -_1758;
    float _1762 = fma(_1754, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1760);
    float _1764 = _1750 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1766 = -_1756;
    float _1768 = fma(_1766, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1762);
    float _1770 = exp2(_1764);
    float _1772 = fma(_1768, -0.5, 0.5);
    float _1774 = fma(_1768, 0.5, 0.5);
    float _1776 = fma(_1774, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1778 = sqrt(_1772);
    float _1780 = fma(_1774, _1776, -0.212114393711090087890625);
    float _1782 = _1754 + 1.0;
    float _1784 = fma(_1774, _1780, 1.570728778839111328125);
    float _1786 = -_1754;
    float _1788 = fma(_1770, _1782, _1786);
    float _1790 = fma(_1788, 0.5, 0.5);
    float _1792 = _1778 * 0.636619746685028076171875;
    float _1794 = -_1784;
    float _1796 = fma(_1792, _1794, 1.0);
    float2 _5418 = float2(_1796, _1790);
    float3 _1800 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5418, float2(0.0), isnan(_5418)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5418, float2(0.0), isnan(_5418)), level(0.0)).xyz;
    float _1802 = _1800.x;
    float _1804 = _1800.y;
    float _1806 = _1800.z;
    float _1808 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _1810 = in.m_71.y;
    float _1812 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1814 = _256 > 0.5;
    float _1816 = _1808 * _266;
    float _1818 = in.m_63.w;
    int _1820 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1822 = _1820 != 0;
    float _1824 = -_246;
    float _1826 = _1824 + 1.0;
    int _1828 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1830 = _1828 != 0;
    float _1832 = in.m_71.x;
    float _1834 = trunc(_1816);
    int _1836 = int(_1834);
    int _1838 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1840 = _1838 != 0;
    int _1842 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1844 = _1842 != 0;
    out.m_73.x = _1291;
    out.m_73.y = _1289;
    out.m_73.z = _1293;
    float _1846 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1848 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1850 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1852 = -_1810;
    float _1854 = _1852 + 1.0;
    int _1856 = _1836 << 4;
    int _1858 = _1856 + 1712;
    bool _1860 = _1818 > 0.5;
    uint _1862 = uint(int(uint(_1858) >> uint(2)));
    uint _1864 = uint(int(uint(int(_1862)) >> uint(2)));
    int _1866 = int(_1862) & 3;
    float _1868 = (*spvDescriptorSet0.vp_c9)._m0[int(_1864)][_1866];
    int _1870 = int(_1862) + 1;
    uint _1872 = uint(int(uint(_1870) >> uint(2)));
    int _1874 = _1870 & 3;
    float _1876 = (*spvDescriptorSet0.vp_c9)._m0[int(_1872)][_1874];
    float _1878 = 0.0;
    bool _1880 = _1860;
    float _1882 = _1810;
    bool _1884 = _1844;
    float _1886 = _1854;
    if (!_1822)
    {
        _1878 = _1832;
    }
    float _1888 = _1878;
    int _1890 = _1860 ? as_type<int>(_1854) : as_type<int>(_1810);
    int _1892 = _1858 + 8;
    uint _1894 = uint(int(uint(_1892) >> uint(2)));
    uint _1896 = uint(int(uint(int(_1894)) >> uint(2)));
    int _1898 = int(_1894) & 3;
    float _1900 = (*spvDescriptorSet0.vp_c9)._m0[int(_1896)][_1898];
    float _1902 = in.m_75.x;
    float _1904 = in.m_75.y;
    float _1906 = in.m_75.z;
    float _1908 = _1840 ? as_type<float>(_1890) : _1810;
    bool _1910 = _714 != 0.0;
    bool _1912 = isnan(_714);
    bool _1914 = _1910 || _1912;
    bool _1916 = isnan(0.0);
    bool _1918 = _1914 || _1916;
    float _1920 = _1888;
    if (_1822)
    {
        bool _1922 = _266 > 0.5;
        _1880 = _1922;
    }
    bool _1924 = _1880;
    float _1926 = _1908 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _1928 = _712 == 0.0;
    bool _1930 = !_1918;
    bool _1932 = _1928 && _1930;
    float _1934 = _1848 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1936 = _1850 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1938 = _716 == 0.0;
    bool _1940 = _1938 && _1932;
    float _1942 = 0.0;
    if (!_1822)
    {
        _1942 = _1888;
    }
    float _1944 = _1942;
    float _1946 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _1948 = as_type<int>(_1946);
    float _1950 = _1944;
    if (_1822)
    {
        _1920 = _1832;
    }
    float _1952 = _1920;
    float _1954 = _1952;
    if (_1844)
    {
        float _1956 = _1814 ? _1854 : _1810;
        _1882 = _1956;
    }
    float _1958 = _1882;
    float _1960 = _1946 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_1830)
    {
        bool _1962 = _248 > 0.5;
        _1884 = _1962;
    }
    bool _1964 = _1884;
    if (_1822)
    {
        float _1966 = -_1952;
        float _1968 = _1966 + 1.0;
        _402 = as_type<int>(_1968);
    }
    int _1970 = _402;
    if (_1830)
    {
        float _1972 = -_1952;
        float _1974 = _1972 + 1.0;
        _1948 = as_type<int>(_1974);
    }
    int _1976 = _1948;
    float _1978 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    out.m_77.x = _1934;
    out.m_77.y = _1936;
    out.m_77.z = _1960;
    if (_1940)
    {
        _1886 = _1902;
    }
    float _1980 = _1886;
    float _1982 = _1980;
    if (_1822)
    {
        float _1984 = _1924 ? as_type<float>(_1970) : _1952;
        _1950 = _1984;
    }
    float _1986 = _1950;
    float _1988 = in.m_79.x;
    float _1990 = in.m_79.y;
    float _1992 = in.m_79.z;
    float _1994 = in.m_79.w;
    if (_1940)
    {
        _1105 = _1980;
    }
    float _1996 = _1105;
    float _1998 = _1996;
    if (!_1940)
    {
        _1982 = _1902;
    }
    float _2000 = _1982;
    float _2002 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2004 = 0.0;
    if (_1940)
    {
        _2004 = _1904;
    }
    float _2006 = _2004;
    float _2008 = _2006;
    if (!_1940)
    {
        float _2010 = fma(_712, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2000);
        _1998 = _2010;
    }
    float _2012 = _1998;
    if (_1830)
    {
        float _2014 = _1964 ? as_type<float>(_1976) : _1952;
        _1954 = _2014;
    }
    float _2016 = _1954;
    float _2018 = _1868 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2020 = abs(_758);
    float _2022 = log2(_2020);
    float _2024 = 0.0;
    if (_1940)
    {
        _2024 = _2006;
    }
    float _2026 = _2024;
    float _2028 = _1876 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2030 = _2026;
    if (!_1940)
    {
        _2008 = _1904;
    }
    float _2032 = _2008;
    float _2034 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2036 = 0.0;
    if (_1940)
    {
        _2036 = _1906;
    }
    float _2038 = _2036;
    float _2040 = _1900 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2042 = _2018 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2044 = _2028 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2046 = _2038;
    if (!_1940)
    {
        float _2048 = fma(_714, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2032);
        _2030 = _2048;
    }
    float _2050 = _2030;
    float _2052 = _2040 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2054 = 0.0;
    if (_1940)
    {
        _2054 = _2038;
    }
    float _2056 = _2054;
    float _2058 = _1958 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2060 = _1986 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2062 = _2016 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2064 = _2056;
    if (!_1940)
    {
        _2046 = _1906;
    }
    float _2066 = _2046;
    out.m_81.x = _2042;
    out.m_81.y = _2044;
    out.m_81.z = _2052;
    out.m_81.w = _2034;
    float _2068 = _1926 * _2002;
    float _2070 = _2058 * _1978;
    float _2072 = _2060 * _1812;
    float _2074 = _2062 * _1846;
    float _2076 = _1990 * _2066;
    if (!_1940)
    {
        float _2078 = fma(_716, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2066);
        _2064 = _2078;
    }
    float _2080 = _2064;
    bool _2082 = _758 <= 8000.0;
    bool _2084 = isnan(_758);
    bool _2086 = _2082 || _2084;
    bool _2088 = isnan(8000.0);
    bool _2090 = _2086 || _2088;
    float _2092 = float(_2090);
    out.m_83.x = _2072;
    out.m_83.y = _2070;
    out.m_83.z = _2074;
    out.m_83.w = _2068;
    float _2094 = -_2076;
    float _2096 = fma(_1992, _2032, _2094);
    float _2098 = -_1990;
    float _2100 = _850 * _2098;
    float _2102 = _1992 * _2000;
    float _2104 = _2022 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2106 = _1988 * _2032;
    float _2108 = fma(_862, _1988, _2100);
    float _2110 = -_2102;
    float _2112 = fma(_1988, _2066, _2110);
    float _2114 = -_2106;
    float _2116 = fma(_1990, _2000, _2114);
    float _2118 = _2096 * _1994;
    float _2120 = _2112 * _1994;
    float _2122 = exp2(_2104);
    float _2124 = _2116 * _1994;
    float _2126 = -_2050;
    float _2128 = _850 * _2126;
    float _2130 = -_2120;
    float _2132 = _850 * _2130;
    float _2134 = _860 * _1990;
    float _2136 = _860 * _2050;
    float _2138 = fma(_862, _2012, _2128);
    float _2140 = fma(_862, _2118, _2132);
    float _2142 = _860 * _2120;
    float _2144 = _864 * _1990;
    float _2146 = fma(_903, _2012, _2136);
    float _2148 = fma(_903, _1988, _2134);
    float _2150 = fma(_903, _2118, _2142);
    float _2152 = _864 * _2120;
    float _2154 = fma(_872, _2080, _2138);
    float _2156 = fma(_2122, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2158 = precise::clamp(_2156, 0.0, 1.0);
    float _2160 = fma(_897, _1988, _2144);
    float _2162 = fma(_897, _2118, _2152);
    float _2164 = fma(_901, _1992, _2148);
    float _2166 = fma(_872, _1992, _2108);
    float _2168 = fma(_913, _1992, _2160);
    float _2170 = fma(_901, _2080, _2146);
    float _2172 = fma(_2158, -2.0, 3.0);
    float _2174 = fma(_872, _2124, _2140);
    float _2176 = fma(_901, _2124, _2150);
    float _2178 = fma(_913, _2124, _2162);
    float _2180 = _2158 * _2158;
    float _2182 = _2164 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2184 = _2164 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2186 = _2164 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2188 = _2180 * _2172;
    float _2190 = fma(_2166, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2182);
    float _2192 = _2176 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2194 = fma(_2166, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2184);
    float _2196 = _2176 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2198 = _864 * _2050;
    float _2200 = fma(_2166, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2186);
    float _2202 = fma(_2174, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2192);
    float _2204 = fma(_2168, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2190);
    float _2206 = fma(_2174, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2196);
    float _2208 = fma(_2168, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2194);
    float _2210 = _2170 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2212 = _2170 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2214 = fma(_897, _2012, _2198);
    float _2216 = _2170 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2218 = fma(_2178, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2202);
    float _2220 = fma(_2168, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2200);
    float _2222 = fma(_2178, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2206);
    float _2224 = fma(_2154, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2210);
    float _2226 = fma(_2154, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2212);
    float _2228 = fma(_913, _2080, _2214);
    float _2230 = fma(_2154, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2216);
    float _2232 = -_2188;
    float _2234 = _2232 + 1.0;
    float _2236 = _1353 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_85.x = _2220;
    out.m_85.y = _2204;
    out.m_85.z = _2208;
    float _2238 = fma(_2228, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2230);
    float _2240 = _1750 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2242 = fma(_2234, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2188);
    float _2244 = fma(_1363, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2236);
    float _2246 = _2176 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2248 = _2092 * _2242;
    float _2250 = exp2(_2240);
    float _2252 = fma(_1359, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2244);
    float _2254 = _2248 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2256 = _2220;
    if (!_1381)
    {
        _2256 = 1.0;
    }
    float _2258 = _2256;
    float _2260 = fma(_1387, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2252);
    float _2262 = _2258;
    if (_1381)
    {
        bool _2264 = _1491 >= _1479;
        bool _2266 = isnan(_1491);
        bool _2268 = _2264 || _2266;
        bool _2270 = isnan(_1479);
        bool _2272 = _2268 || _2270;
        float _2274 = float(_2272);
        _2262 = _2274;
    }
    float _2276 = _2262;
    float _2278 = _1826 * _2254;
    float _2280 = precise::clamp(_2278, 0.0, 1.0);
    out.m_87.x = 1.0;
    out.m_87.y = 1.0;
    out.m_87.z = 1.0;
    float _2282 = fma(_2174, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2246);
    float _2284 = _2260 + _1403;
    float _2286 = _2276 * _1576;
    float _2288 = fma(_2228, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2224);
    float _2290 = fma(_2178, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2282);
    float _2292 = fma(_2228, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2226);
    float _2294 = -_2250;
    float _2296 = _2294 + 1.0;
    float _2298 = _2284 * 0.5;
    out.m_89.x = _2218;
    out.m_89.y = _2222;
    out.m_89.z = _2290;
    bool _2300 = _1598 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2302 = isnan(_1598);
    bool _2304 = _2300 || _2302;
    bool _2306 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2308 = _2304 || _2306;
    float _2310 = _2296 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2312 = -_2280;
    float _2314 = fma(_2312, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.gl_Position.x = _1429;
    out.gl_Position.y = _1433;
    out.gl_Position.z = _2260;
    out.gl_Position.w = _1403;
    float _2316 = _2310 * _1493;
    float _2318 = -_2286;
    float _2320 = fma(_2318, _2314, 1.0);
    float _2322 = precise::clamp(_2320, 0.0, 1.0);
    float _2324 = -_2310;
    float _2326 = _2324 + 1.0;
    out.m_91.z = _2298;
    out.m_91.w = _1403;
    float _2328 = _1504 * _2316;
    float _2330 = _1504 * _2326;
    out.m_93.x = _2288;
    out.m_93.y = _2292;
    out.m_93.z = _2238;
    float _2332 = _2280;
    float _2334 = _2326;
    float _2336 = _2322;
    float _2338 = _2316;
    float _2340 = _2328;
    if (!_2308)
    {
        _2332 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2342 = _2332;
    float _2344 = _2342;
    float _2346 = _2342;
    if (!_2308)
    {
        _2334 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2348 = _2334;
    float _2350 = _1806 * _2316;
    float _2352 = fma(_1802, _2328, _1498);
    float _2354 = fma(_1804, _2328, _1500);
    float _2356 = _2322 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2358 = fma(_1504, _2350, _1502);
    float _2360 = _2350;
    float _2362 = _2348;
    float _2364 = _2348;
    if (!_2308)
    {
        _2336 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2366 = _2336;
    float _2368 = _2366;
    float _2370 = _2366;
    if (!_2308)
    {
        _2360 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2372 = _2360;
    out.m_95.x = _2356;
    float _2374 = _2372;
    float _2376 = _2372;
    if (!_2308)
    {
        _2338 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2378 = _2338;
    float _2380 = _2378;
    float _2382 = _2378;
    if (!_2308)
    {
        _2340 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2384 = _2340;
    out.m_97.x = _2352;
    out.m_97.y = _2354;
    out.m_97.z = _2358;
    out.m_97.w = _2330;
    bool _2386 = !_2308;
    float _2388 = _2384;
    float _2390 = _2384;
    if (!_2386)
    {
        bool _2392 = _1598 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2394 = isnan(_1598);
        bool _2396 = _2392 || _2394;
        bool _2398 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2400 = _2396 || _2398;
        if (!_2400)
        {
            float _2402 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2404 = _1598 + _2402;
            float _2406 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2408 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2406;
            float _2410 = 1.0 / _2408;
            float _2412 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2414 = _2412 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2416 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2418 = _2416 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2420 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2422 = _2420 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2424 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2426 = _2424 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2428 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2430 = _2428 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2432 = _2404 * _2410;
            float _2434 = precise::clamp(_2432, 0.0, 1.0);
            float _2436 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2438 = _2436 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2440 = fma(_2434, _2414, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2442 = fma(_2434, _2438, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2444 = fma(_2434, _2418, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2446 = fma(_2434, _2422, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2448 = fma(_2434, _2426, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2450 = fma(_2434, _2430, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2364 = _2442;
            _2382 = _2448;
            _2346 = _2440;
            _2376 = _2446;
            _2370 = _2444;
            _2390 = _2450;
            _2452 = true;
        }
        else
        {
            bool _2454 = _1598 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2456 = isnan(_1598);
            bool _2458 = _2454 || _2456;
            bool _2460 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2462 = _2458 || _2460;
            if (!_2462)
            {
                _2344 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2464 = _2344;
            _2346 = _2464;
            if (!_2462)
            {
                _2362 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2466 = _2362;
            _2364 = _2466;
            if (!_2462)
            {
                _2368 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2468 = _2368;
            _2370 = _2468;
            if (!_2462)
            {
                _2374 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2470 = _2374;
            _2376 = _2470;
            if (!_2462)
            {
                _2380 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2472 = _2380;
            _2382 = _2472;
            if (!_2462)
            {
                _2388 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2474 = _2388;
            bool _2476 = !_2462;
            _2390 = _2474;
            if (!_2476)
            {
                bool _2478 = _1598 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2480 = isnan(_1598);
                bool _2482 = _2478 || _2480;
                bool _2484 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2486 = _2482 || _2484;
                if (!_2486)
                {
                    float _2488 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2490 = _1598 + _2488;
                    float _2492 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2494 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2492;
                    float _2496 = 1.0 / _2494;
                    float _2498 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2500 = _2498 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2502 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2504 = _2502 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2506 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2508 = _2506 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2510 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2512 = _2510 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2514 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2516 = _2514 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2518 = _2490 * _2496;
                    float _2520 = precise::clamp(_2518, 0.0, 1.0);
                    float _2522 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2524 = _2522 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2526 = fma(_2520, _2500, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2528 = fma(_2520, _2524, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2530 = fma(_2520, _2504, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2532 = fma(_2520, _2508, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2534 = fma(_2520, _2512, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2536 = fma(_2520, _2516, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2364 = _2528;
                    _2382 = _2534;
                    _2346 = _2526;
                    _2376 = _2532;
                    _2370 = _2530;
                    _2390 = _2536;
                    _2452 = true;
                }
                else
                {
                    _2364 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2382 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2346 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2376 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2370 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2390 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2452 = false;
    float _2538 = _2364;
    float _2540 = _2382;
    float _2542 = _2346;
    float _2544 = _2376;
    float _2546 = _2370;
    float _2548 = _2390;
    float _2550 = fma(_2292, -0.5, 0.5);
    float _2552 = precise::clamp(_2550, 0.0, 1.0);
    float _2554 = -_2538;
    float _2556 = _2554 + _2540;
    float _2558 = -_2542;
    float _2560 = _2558 + _2544;
    float _2562 = -_2546;
    float _2564 = _2562 + _2548;
    bool _2566 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2568 = fma(_2552, _2556, _2538);
    float _2570 = fma(_2552, _2560, _2542);
    float _2572 = fma(_2552, _2564, _2546);
    float _2574 = _2568 * 0.586610972881317138671875;
    out.m_99.x = 0.0;
    float _2576 = fma(_2570, 0.298911988735198974609375, _2574);
    float _2578 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2580 = fma(_2572, 0.114477999508380889892578125, _2576);
    out.m_59.x = _2578;
    float _2582 = -_2580;
    float _2584 = _2570 + _2582;
    float _2586 = -_2580;
    float _2588 = _2568 + _2586;
    float _2590 = -_2580;
    float _2592 = _2572 + _2590;
    float _2594 = fma(_2584, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2580);
    float _2596 = fma(_2588, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2580);
    float _2598 = fma(_2592, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2580);
    out.m_101.x = _2594;
    out.m_101.y = _2596;
    out.m_101.z = _2598;
    if (!_2566)
    {
        return out;
    }
    float _2600 = -_1289;
    float _2602 = _2600 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2604 = -_1291;
    float _2606 = _2604 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2608 = -_1293;
    float _2610 = _2608 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2612 = _2602 * _2602;
    float _2614 = fma(_2606, _2606, _2612);
    float _2616 = fma(_2610, _2610, _2614);
    float _2618 = sqrt(_2616);
    float _2620 = rsqrt(_2616);
    float _2622 = -_2618;
    float _2624 = _2622 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2626 = _2624 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2628 = precise::clamp(_2626, 0.0, 1.0);
    float _2630 = _2606 * _2620;
    float _2632 = _2602 * _2620;
    float _2634 = abs(_2628);
    float _2636 = log2(_2634);
    float _2638 = _2610 * _2620;
    float _2640 = _2630 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2642 = _2292 * _2632;
    float _2644 = -_2632;
    float _2646 = -_2640;
    float _2648 = fma(_2644, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2646);
    float _2650 = fma(_2288, _2630, _2642);
    float _2652 = -_2638;
    float _2654 = fma(_2652, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2648);
    float _2656 = fma(_2238, _2638, _2650);
    float _2658 = precise::clamp(_2656, 0.0, 1.0);
    float _2660 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2662 = _2654 + _2660;
    float _2664 = _2636 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2666 = _2662 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2668 = precise::clamp(_2666, 0.0, 1.0);
    float _2670 = exp2(_2664);
    float _2672 = _2670 * _2668;
    float _2674 = _2658 * _2672;
    float _2676 = _2674 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2678 = _2674 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2680 = _2674 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_99.x = _2676;
    out.m_99.y = _2678;
    out.m_99.z = _2680;
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
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2452 = false;
    bool _198 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _115 = in.m_56.w;
    float _117 = trunc(_115);
    int _120 = int(_117);
    bool _124 = _120 >= 1;
    float _126 = 0.0;
    if (!_124)
    {
        _126 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _128 = _126;
    float _130 = _128;
    if (!_124)
    {
        out.m_59.x = 0.0;
    }
    int _132 = 0;
    if (!_124)
    {
        float _134 = _128 * 5.0;
        _132 = as_type<int>(_134);
    }
    int _136 = _132;
    int _138 = _136;
    if (!_124)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2737 = as_type<float>(_136);
        out.gl_Position.z = _2737;
    }
    if (!_124)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _158 = float(_120);
        _130 = _158;
    }
    float _160 = _130;
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
    if (_166)
    {
        float _172 = _170 * 5.0;
        _138 = as_type<int>(_172);
    }
    int _174 = _138;
    if (_166)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2807 = as_type<float>(_174);
        out.gl_Position.z = _2807;
    }
    if (_166)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _176 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _178 = !_176;
    float _196;
    if (!_178)
    {
        float _180 = in.m_63.x;
        float _182 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _184 = _180 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _186 = fma(_184, (*spvDescriptorSet0.vp_c9)._m0[12].x, _154);
        float _188 = _186 * _182;
        float _190 = floor(_188);
        float _192 = -_190;
        float _194 = _188 + _192;
        _196 = _194;
        _198 = true;
    }
    else
    {
        float _200 = float(_120);
        float _202 = 1.0 / _200;
        float _204 = _154 * _202;
        _196 = _204;
    }
    _198 = false;
    float _206 = _196;
    float _208 = in.m_56.x;
    float _210 = in.m_56.y;
    float _212 = in.m_56.z;
    float _214 = _210 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _216 = _210 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _218 = fma(_208, (*spvDescriptorSet0.vp_c10)._m0[4].x, _214);
    float _220 = fma(_208, (*spvDescriptorSet0.vp_c10)._m0[6].x, _216);
    float _222 = fma(_212, (*spvDescriptorSet0.vp_c10)._m0[4].z, _218);
    float _224 = fma(_212, (*spvDescriptorSet0.vp_c10)._m0[6].z, _220);
    float _226 = _222 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _228 = _224 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _230 = fma(_226, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _232 = fma(_228, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _234 = floor(_230);
    float _236 = floor(_232);
    float _238 = -_234;
    float _240 = _230 + _238;
    float _242 = -_236;
    float _244 = _232 + _242;
    float2 _2934 = float2(_240, _244);
    float _246 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_2934, float2(0.0), isnan(_2934)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_2934, float2(0.0), isnan(_2934)), level(0.0)).x;
    float _248 = in.m_63.z;
    float _250 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _252 = log2(_250);
    float _254 = _210 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _256 = in.m_63.y;
    float _258 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _260 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _258;
    float _262 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _264 = _262 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _266 = in.m_63.x;
    float _268 = 1.0 / _260;
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _272 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _270;
    float _274 = fma(_208, (*spvDescriptorSet0.vp_c10)._m0[5].x, _254);
    float _276 = 1.0 / _264;
    float _278 = _252 * _154;
    float _280 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _282 = _206 + _280;
    float _284 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _286 = 1.0 + _284;
    int _288 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _290 = _288 != 0;
    int _292 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _294 = _292 != 0;
    int _296 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _298 = _296 != 0;
    float _300 = fma(_212, (*spvDescriptorSet0.vp_c10)._m0[5].z, _274);
    float _302 = _248 * 2.0;
    float _304 = exp2(_278);
    float _306 = _282 * _268;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _310 = _206 + _308;
    float _312 = _256 + _248;
    float _314 = _300 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _316 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _318 = isnan(1.0);
    bool _320 = _316 || _318;
    bool _322 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _324 = _320 || _322;
    float _326 = _312 + (-1.0);
    float _328 = 1.0 / _272;
    float _330 = _310 * _276;
    float _332 = _266 + _256;
    float _334 = fma(_326, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _336 = _256 * 2.0;
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _340 = _206 + _338;
    bool _342 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _344 = isnan(0.0);
    bool _346 = _342 || _344;
    bool _348 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _350 = _346 || _348;
    float _352 = floor(_302);
    float _354 = -_304;
    float _356 = _354 + 1.0;
    float _358 = _350 ? _356 : 0.0;
    float _360 = 1.0 / _286;
    float _362 = _266 + _248;
    float _364 = _340 * _328;
    float _366 = _362 + (-1.0);
    float _368 = _332 + (-1.0);
    float _370 = floor(_336);
    float _372 = _266 * 2.0;
    float _374 = fma(_368, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _376 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _378 = _352 > 0.0;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _382 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _380;
    bool _384 = _352 >= 0.0;
    bool _386 = isnan(_352);
    bool _388 = _384 || _386;
    bool _390 = isnan(0.0);
    bool _392 = _388 || _390;
    float _394 = floor(_372);
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _398 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _396;
    float _400 = _228;
    int _402 = as_type<int>(_248);
    if (_324)
    {
        float _404 = _358 * _360;
        _156 = _404;
    }
    float _406 = _156;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _410 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _408;
    bool _412 = _206 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _414 = isnan(_206);
    bool _416 = _412 || _414;
    bool _418 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _420 = _416 || _418;
    float _422 = float(_420);
    float _424 = fma(_398, _306, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _426 = _206 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _428 = isnan(_206);
    bool _430 = _426 || _428;
    bool _432 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _434 = _430 || _432;
    float _436 = float(_434);
    float _438 = fma(_410, _306, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    int _440 = _392 ? 0 : 1;
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _444 = _442 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _446 = _370 > 0.0;
    float _448 = -_436;
    float _450 = _448 + 1.0;
    float _452 = fma(_444, _330, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _454 = _394 > 0.0;
    bool _456 = _394 >= 0.0;
    bool _458 = isnan(_394);
    bool _460 = _456 || _458;
    bool _462 = isnan(0.0);
    bool _464 = _460 || _462;
    float _466 = fma(_382, _306, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _470 = _468 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _472 = _206 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _474 = isnan(_206);
    bool _476 = _472 || _474;
    bool _478 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _480 = _476 || _478;
    float _482 = float(_480);
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _486 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _484;
    int _488 = _464 ? 0 : 1;
    float _490 = fma(_470, _330, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _492 = _370 >= 0.0;
    bool _494 = isnan(_370);
    bool _496 = _492 || _494;
    bool _498 = isnan(0.0);
    bool _500 = _496 || _498;
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _504 = _502 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    bool _506 = _206 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _508 = isnan(_206);
    bool _510 = _506 || _508;
    bool _512 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _514 = _510 || _512;
    float _516 = float(_514);
    float _518 = _422 * _450;
    float _520 = -_422;
    float _522 = _520 + 1.0;
    float _524 = fma(_504, _330, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _526 = _516 * _522;
    float _528 = -_516;
    float _530 = _528 + 1.0;
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _534 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _532;
    int _536 = ~_488;
    int _538 = _536 + 1;
    int _540 = _538 + 1;
    float _542 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _544 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _542;
    float _546 = _482 * _530;
    float _548 = fma(_486, _364, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _550 = fma(_534, _364, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _552 = fma(_544, _364, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _554 = _438 * _546;
    float _556 = _466 * _546;
    int _558 = _500 ? 0 : 1;
    float _560 = -_482;
    float _562 = _560 + 1.0;
    float _564 = _424 * _546;
    int _566 = _540;
    if (!_454)
    {
        int _568 = ~_488;
        int _570 = _568 + 1;
        _566 = _570;
    }
    int _572 = _566;
    int _574 = ~_558;
    int _576 = _574 + 1;
    int _578 = _576 + 1;
    float _580 = fma(_562, (*spvDescriptorSet0.vp_c9)._m0[143].x, _556);
    int _582 = _578;
    if (!_446)
    {
        int _584 = ~_558;
        int _586 = _584 + 1;
        _582 = _586;
    }
    int _588 = _582;
    float _590 = fma(_562, (*spvDescriptorSet0.vp_c9)._m0[143].y, _564);
    float _592 = fma(_562, (*spvDescriptorSet0.vp_c9)._m0[143].z, _554);
    bool _594 = !_290;
    int _596 = _594 ? 0 : 1;
    float _598 = _314 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _600 = fma(_490, _526, _580);
    bool _602 = !_294;
    int _604 = _602 ? 0 : 1;
    float _606 = fma(_452, _526, _590);
    int _608 = abs(_596);
    float _610 = fma(_226, (*spvDescriptorSet0.vp_c8)._m0[11].x, _598);
    int _612 = ~_440;
    int _614 = _612 + 1;
    int _616 = _614 + 1;
    float _618 = in.m_65.x;
    float _620 = in.m_65.y;
    float _622 = in.m_65.z;
    int _624 = _616;
    if (!_378)
    {
        int _626 = ~_440;
        int _628 = _626 + 1;
        _624 = _628;
    }
    int _630 = _624;
    float _632 = fma(_524, _526, _592);
    int _634 = abs(_604);
    float _636 = fma(_548, _518, _600);
    float _638 = float(_608);
    float _640 = fma(_228, (*spvDescriptorSet0.vp_c8)._m0[11].z, _610);
    float _642 = float(_630);
    float _644 = _314 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _646 = _640 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _648 = float(_572);
    float _650 = _638 * _642;
    float _652 = fma(_226, (*spvDescriptorSet0.vp_c8)._m0[10].x, _644);
    float _654 = 1.0 / _646;
    float _656 = float(_634);
    float _658 = fma(_552, _518, _632);
    float _660 = fma(_228, (*spvDescriptorSet0.vp_c8)._m0[10].z, _652);
    float _662 = fma(_550, _518, _606);
    float _664 = _650 * (-2.0);
    float _666 = _656 * _648;
    float _668 = _660 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _670 = !_298;
    int _672 = _670 ? 0 : 1;
    float _674 = fma(_374, _664, _374);
    float _676 = _266 + (-0.5);
    float _678 = _668 + _646;
    float _680 = fma(_664, _618, _618);
    float _682 = _666 * (-2.0);
    int _684 = abs(_672);
    float _686 = _678 * _654;
    float _688 = _686 * 0.5;
    float _690 = fma(_676, (*spvDescriptorSet0.vp_c9)._m0[196].x, _680);
    float _692 = float(_588);
    float _694 = in.m_67.x;
    float _696 = in.m_67.y;
    float _698 = in.m_67.z;
    float _700 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _702 = fma(_688, (*spvDescriptorSet0.vp_c8)._m0[30].w, _700);
    float _704 = fma(_674, _406, _690);
    float _706 = float(_684);
    float _708 = _256 + (-0.5);
    float _710 = fma(_682, _620, _620);
    float _712 = in.m_69.x;
    float _714 = in.m_69.y;
    float _716 = in.m_69.z;
    float _718 = 1.0 / _702;
    float _720 = _706 * _692;
    float _722 = fma(_334, _682, _334);
    float _724 = fma(_708, (*spvDescriptorSet0.vp_c9)._m0[196].y, _710);
    float _726 = fma(_436, (*spvDescriptorSet0.vp_c9)._m0[146].x, _636);
    float _728 = _720 * (-2.0);
    float _730 = fma(_436, (*spvDescriptorSet0.vp_c9)._m0[146].y, _662);
    float _732 = fma(_722, _406, _724);
    float _734 = fma(_436, (*spvDescriptorSet0.vp_c9)._m0[146].z, _658);
    float _736 = fma(_376, _728, _376);
    float _738 = fma(_728, _622, _622);
    float _740 = _248 + (-0.5);
    float _742 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _744 = _704 * 0.15915493667125701904296875;
    float _746 = _732 * 0.15915493667125701904296875;
    float _748 = fma(_740, (*spvDescriptorSet0.vp_c9)._m0[196].z, _738);
    float _750 = _314 + _742;
    float _752 = _734 * _698;
    float _754 = _726 * _694;
    float _756 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _758 = _718 * _756;
    float _760 = fma(_736, _406, _748);
    float _762 = _744 * 6.283185482025146484375;
    float _764 = sin(_762);
    float _766 = _754 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _768 = _760 * 0.15915493667125701904296875;
    bool _770 = _758 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _772 = _750 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    bool _774 = _758 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _776 = _730 * _696;
    float _778 = _744 * 6.283185482025146484375;
    float _780 = cos(_778);
    float _782 = fma(_226, (*spvDescriptorSet0.vp_c15)._m0[126].x, _772);
    float _784 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _712);
    float _786 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _714);
    float _788 = _776 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _790 = fma(_228, (*spvDescriptorSet0.vp_c15)._m0[126].z, _782);
    float _792 = _784 * _766;
    bool _794 = !_770;
    int _796 = _794 ? 0 : 1;
    float _798 = _746 * 6.283185482025146484375;
    float _800 = sin(_798);
    float _802 = _786 * _788;
    float _804 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _716);
    float _806 = _752 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _808 = _790 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    int _810 = 2;
    if (!_770)
    {
        _810 = 1;
    }
    int _812 = _810;
    float _814 = _804 * _806;
    float _816 = _746 * 6.283185482025146484375;
    float _818 = cos(_816);
    int _820 = _812;
    if (!_774)
    {
        _820 = _796;
    }
    int _822 = _820;
    bool _824 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _826 = isnan(0.5);
    bool _828 = _824 || _826;
    bool _830 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _832 = _828 || _830;
    int _834 = _822 << 6;
    float _836 = _768 * 6.283185482025146484375;
    float _838 = cos(_836);
    float _840 = _750 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _842 = _780 * _800;
    float _844 = _764 * _800;
    float _846 = fma(_226, (*spvDescriptorSet0.vp_c15)._m0[127].x, _840);
    float _848 = _768 * 6.283185482025146484375;
    float _850 = sin(_848);
    float _852 = _764 * _818;
    float _854 = _780 * _818;
    float _856 = fma(_228, (*spvDescriptorSet0.vp_c15)._m0[127].z, _846);
    float _858 = _856 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _860 = _780 * _838;
    float _862 = _818 * _838;
    float _864 = _764 * _838;
    float _866 = trunc(_808);
    int _868 = int(_866);
    float _870 = _860 * _802;
    float _872 = _800 * _838;
    int _874 = _834 + 48;
    uint _877 = uint(int(uint(_874) >> uint(2)));
    uint _879 = uint(int(uint(int(_877)) >> uint(2)));
    int _881 = int(_877) & 3;
    float _883 = (*spvDescriptorSet0.vp_c15)._m0[int(_879)][_881];
    int _885 = int(_877) + 1;
    uint _887 = uint(int(uint(_885) >> uint(2)));
    int _889 = _885 & 3;
    float _891 = (*spvDescriptorSet0.vp_c15)._m0[int(_887)][_889];
    float _893 = _864 * _802;
    float _895 = -_842;
    float _897 = fma(_850, _852, _895);
    float _899 = -_852;
    float _901 = fma(_850, _842, _899);
    float _903 = fma(_850, _854, _844);
    float _905 = trunc(_858);
    int _907 = int(_905);
    float _909 = -_802;
    float _911 = _850 * _909;
    float _913 = fma(_850, _844, _854);
    int _915 = _834 + 96;
    uint _917 = uint(int(uint(_915) >> uint(2)));
    uint _919 = uint(int(uint(int(_917)) >> uint(2)));
    int _921 = int(_917) & 3;
    float _923 = (*spvDescriptorSet0.vp_c15)._m0[int(_919)][_921];
    int _925 = int(_917) + 1;
    uint _927 = uint(int(uint(_925) >> uint(2)));
    int _929 = _925 & 3;
    float _931 = (*spvDescriptorSet0.vp_c15)._m0[int(_927)][_929];
    float _933 = fma(_903, _792, _870);
    float _935 = fma(_862, _792, _911);
    float _937 = fma(_897, _792, _893);
    float _939 = fma(_901, _814, _933);
    float _941 = fma(_872, _814, _935);
    float _943 = fma(_913, _814, _937);
    int _945 = _834 + 104;
    uint _947 = uint(int(uint(_945) >> uint(2)));
    uint _949 = uint(int(uint(int(_947)) >> uint(2)));
    int _951 = int(_947) & 3;
    float _953 = (*spvDescriptorSet0.vp_c15)._m0[int(_949)][_951];
    int _955 = int(_947) + 1;
    uint _957 = uint(int(uint(_955) >> uint(2)));
    int _959 = _955 & 3;
    float _961 = (*spvDescriptorSet0.vp_c15)._m0[int(_957)][_959];
    float _963 = _939 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _965 = _939 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    int _967 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _969 = _868 + _967;
    int _971 = _969 + 1;
    float _973 = fma(_941, (*spvDescriptorSet0.vp_c10)._m0[10].x, _963);
    int _975 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _977 = _907 + _975;
    int _979 = _977 + 1;
    float _981 = fma(_941, (*spvDescriptorSet0.vp_c10)._m0[8].x, _965);
    int _983 = _834 + 64;
    uint _985 = uint(int(uint(_983) >> uint(2)));
    uint _987 = uint(int(uint(int(_985)) >> uint(2)));
    int _989 = int(_985) & 3;
    float _991 = (*spvDescriptorSet0.vp_c15)._m0[int(_987)][_989];
    int _993 = int(_985) + 1;
    uint _995 = uint(int(uint(_993) >> uint(2)));
    int _997 = _993 & 3;
    float _999 = (*spvDescriptorSet0.vp_c15)._m0[int(_995)][_997];
    float _1001 = fma(_943, (*spvDescriptorSet0.vp_c10)._m0[10].z, _973);
    int _1003 = _971 | _979;
    float _1005 = fma(_943, (*spvDescriptorSet0.vp_c10)._m0[8].z, _981);
    bool _1007 = _971 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1009 = _228 + _1001;
    float _1011 = _226 + _1005;
    int _1013 = _834 + 56;
    uint _1015 = uint(int(uint(_1013) >> uint(2)));
    uint _1017 = uint(int(uint(int(_1015)) >> uint(2)));
    int _1019 = int(_1015) & 3;
    float _1021 = (*spvDescriptorSet0.vp_c15)._m0[int(_1017)][_1019];
    int _1023 = int(_1015) + 1;
    uint _1025 = uint(int(uint(_1023) >> uint(2)));
    int _1027 = _1023 & 3;
    float _1029 = (*spvDescriptorSet0.vp_c15)._m0[int(_1025)][_1027];
    bool _1031 = _1003 < 0;
    bool _1033 = _1031 || _1007;
    float _1035 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1037 = _1009 + _1035;
    float _1039 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1041 = _1011 + _1039;
    bool _1043 = _979 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1045 = _1043 || _1033;
    float _1047 = _1037 * _1037;
    int _1049 = _834 + 72;
    uint _1051 = uint(int(uint(_1049) >> uint(2)));
    uint _1053 = uint(int(uint(int(_1051)) >> uint(2)));
    int _1055 = int(_1051) & 3;
    float _1057 = (*spvDescriptorSet0.vp_c15)._m0[int(_1053)][_1055];
    int _1059 = int(_1051) + 1;
    uint _1061 = uint(int(uint(_1059) >> uint(2)));
    int _1063 = _1059 & 3;
    float _1065 = (*spvDescriptorSet0.vp_c15)._m0[int(_1061)][_1063];
    float _1067 = fma(_1041, _1041, _1047);
    float _1069 = sqrt(_1067);
    int _1071 = _834 + 80;
    uint _1073 = uint(int(uint(_1071) >> uint(2)));
    uint _1075 = uint(int(uint(int(_1073)) >> uint(2)));
    int _1077 = int(_1073) & 3;
    float _1079 = (*spvDescriptorSet0.vp_c15)._m0[int(_1075)][_1077];
    int _1081 = int(_1073) + 1;
    uint _1083 = uint(int(uint(_1081) >> uint(2)));
    int _1085 = _1081 & 3;
    float _1087 = (*spvDescriptorSet0.vp_c15)._m0[int(_1083)][_1085];
    float _1089 = _750 * _891;
    float _1091 = _750 * _931;
    float _1093 = _939 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    int _1095 = as_type<int>(_939);
    int _1097 = as_type<int>(_1093);
    float _1099 = _1009;
    float _1101 = _1037;
    float _1103 = as_type<float>(_822);
    float _1105 = as_type<float>(_979);
    if (!_1045)
    {
        int _1107 = _979 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1109 = _1107 + _971;
        _1095 = _1109;
    }
    int _1111 = _1095;
    float _1113 = fma(_226, _923, _1091);
    float _1115 = fma(_226, _883, _1089);
    bool _1117 = _1069 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1119 = fma(_941, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1093);
    float _1121 = fma(_228, _953, _1113);
    float _1123 = _1089;
    float _1125 = _1121;
    float _1127 = _961;
    if (!_1045)
    {
        float _1129 = floor(_808);
        _1123 = _1129;
    }
    float _1131 = _1123;
    if (!_1045)
    {
        int _1133 = _1111 << 2;
        _1097 = _1133;
    }
    int _1135 = _1097;
    float _1137 = fma(_943, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1119);
    float _1139 = _1121 + _961;
    int _1141 = _1135;
    if (!_1045)
    {
        int _1143 = 12 & _1135;
        _1141 = _1143;
    }
    int _1145 = _1141;
    float _1147 = _314 + _1137;
    float _1149 = _750 * _999;
    float _1151 = 1.0 / _1139;
    int _1153 = as_type<int>(_991);
    if (!_1117)
    {
        _1125 = _1011;
    }
    float _1155 = _1125;
    float _1157 = fma(_226, _991, _1149);
    float _1159 = _1155;
    if (!_1045)
    {
        uint _1161 = uint(int(uint(_1111) >> uint(2)));
        _1153 = int(_1161);
    }
    int _1163 = _1153;
    int _1165 = _1163;
    if (!_1117)
    {
        _1127 = _1147;
    }
    float _1167 = _1127;
    float _1169 = fma(_228, _1021, _1115);
    float _1171 = _1167;
    float _1173 = _1021;
    if (!_1045)
    {
        int _1175 = _1163 << 4;
        int _1177 = _1175 + _1145;
        _1165 = _1177;
    }
    int _1179 = _1165;
    float _1181 = _1169 + _1029;
    float _1183 = fma(_228, _1057, _1157);
    float _1185 = _1183 + _1065;
    bool _1187 = !_1117;
    if (!_1187)
    {
        float _1189 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1191 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1193 = _1069 + _1191;
        float _1195 = _1147 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1197 = rsqrt(_1067);
        float _1199 = _1193 * _1189;
        float _1201 = _1199 * 0.15915493667125701904296875;
        float _1203 = _1201 * 6.283185482025146484375;
        float _1205 = cos(_1203);
        float _1207 = _1201 * 6.283185482025146484375;
        float _1209 = sin(_1207);
        float _1211 = _1205 + (-1.0);
        float _1213 = fma(_1209, _1195, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1215 = _1211 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1217 = _1197 * _1213;
        float _1219 = fma(_1147, _1205, _1215);
        float _1221 = fma(_1041, _1217, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1223 = fma(_1037, _1217, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1099 = _1223;
        _1171 = _1219;
        _1159 = _1221;
        _1173 = _1201;
    }
    float _1225 = _1099;
    float _1227 = _1171;
    float _1229 = _1159;
    float _1231 = _1173;
    float _1233 = _1231;
    float _1235 = _1227;
    float _1237 = _1229;
    if (_832)
    {
        _1101 = _1225;
    }
    float _1239 = _1101;
    float _1241 = _1239;
    if (!_832)
    {
        float _1243 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1245 = _314 + _1243;
        float _1247 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1249 = _226 + _1247;
        float _1251 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1253 = -_314;
        float _1255 = _1253 + _1227;
        float _1257 = _1245 * _1245;
        float _1259 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1261 = _228 + _1259;
        float _1263 = -_226;
        float _1265 = _1263 + _1229;
        float _1267 = -_228;
        float _1269 = _1267 + _1225;
        float _1271 = fma(_1249, _1249, _1257);
        float _1273 = fma(_1261, _1261, _1271);
        float _1275 = sqrt(_1273);
        float _1277 = precise::min(_1275, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1279 = _1277 * _1251;
        float _1281 = fma(_1255, _1279, _314);
        float _1283 = fma(_1265, _1279, _226);
        float _1285 = fma(_1269, _1279, _228);
        _1233 = _1251;
        _1235 = _1281;
        _1237 = _1283;
        _1241 = _1285;
    }
    float _1287 = _1233;
    float _1289 = _1235;
    float _1291 = _1237;
    float _1293 = _1241;
    float _1295 = _1287;
    if (!_1045)
    {
        int _1297 = _1179 + 400;
        uint _1299 = uint(int(uint(_1297) >> uint(2)));
        uint _1301 = uint(int(uint(int(_1299)) >> uint(2)));
        int _1303 = int(_1299) & 3;
        float _1305 = (*spvDescriptorSet0.vp_c15)._m0[int(_1301)][_1303];
        _1295 = _1305;
    }
    float _1307 = _1295;
    float _1309 = _1289 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1311 = _1181 * _1151;
    float _1313 = _1289 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1315 = _1289 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1317 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1309);
    float _1319 = _1185 * _1151;
    float _1321 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1313);
    int _1323 = _834 + 88;
    uint _1325 = uint(int(uint(_1323) >> uint(2)));
    uint _1327 = uint(int(uint(int(_1325)) >> uint(2)));
    int _1329 = int(_1325) & 3;
    float _1331 = (*spvDescriptorSet0.vp_c15)._m0[int(_1327)][_1329];
    int _1333 = int(_1325) + 1;
    uint _1335 = uint(int(uint(_1333) >> uint(2)));
    int _1337 = _1333 & 3;
    float _1339 = (*spvDescriptorSet0.vp_c15)._m0[int(_1335)][_1337];
    float _1341 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1315);
    float _1343 = fma(_1293, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1317);
    bool _1345 = _1311 >= 0.0;
    float _1347 = fma(_1293, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1321);
    float _1349 = _1289 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1351 = fma(_1293, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1341);
    float _1353 = _1343 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _1355 = _1311 <= 1.0;
    bool _1357 = _1355 && _1345;
    float _1359 = _1347 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1361 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1349);
    float _1363 = _1351 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1365 = _1353 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1367 = _1319 >= 0.0;
    bool _1369 = _1367 && _1357;
    float _1371 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1373 = _1359 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1375 = fma(_1293, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1361);
    float _1377 = fma(_1363, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1365);
    bool _1379 = _1319 <= 1.0;
    bool _1381 = _1379 && _1369;
    float _1383 = -_1373;
    float _1385 = fma(_1383, _1371, 1.0);
    float _1387 = _1375 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1389 = fma(_1359, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1377);
    float _1391 = _1183;
    float _1393 = _1347;
    if (!_1045)
    {
        float _1395 = floor(_858);
        _1391 = _1395;
    }
    float _1397 = _1391;
    float _1399 = _1353 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1401 = _1353 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1403 = fma(_1387, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1389);
    float _1405 = _750 * _1087;
    float _1407 = fma(_1363, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1399);
    float _1409 = fma(_1363, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1401);
    if (!_1045)
    {
        float _1411 = -_1131;
        float _1413 = _808 + _1411;
        _1393 = _1413;
    }
    float _1415 = _1393;
    float _1417 = 1.0 / _1403;
    if (_1381)
    {
        float _1419 = float(_822);
        _1103 = _1419;
    }
    float _1421 = _1103;
    float _1423 = fma(_226, _1079, _1405);
    float _1425 = fma(_1359, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1407);
    float _1427 = fma(_1359, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1409);
    float _1429 = fma(_1387, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1425);
    float _1431 = log2(_1385);
    float _1433 = fma(_1387, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1427);
    float _1435 = _1421;
    float _1437 = _1425;
    if (_1381)
    {
        float _1439 = rint(_1421);
        float _1441 = precise::max(_1439, 0.0);
        uint _1443 = uint(_1441);
        uint _1445 = clamp(_1443, 0u, 65535u);
        _1435 = as_type<float>(_1445);
    }
    float _1447 = _1435;
    float _1449 = fma(_228, _1331, _1423);
    float _1451 = _1331;
    if (!_1045)
    {
        float _1453 = -_1397;
        float _1455 = _858 + _1453;
        _1451 = _1455;
    }
    float _1457 = _1451;
    float _1459 = _1429 * _1417;
    float _1461 = _1433 * _1417;
    float _1463 = _1449 + _1339;
    float _1465 = _1307;
    if (!_1045)
    {
        float _1467 = rint(_1307);
        float _1469 = precise::max(_1467, 0.0);
        uint _1471 = uint(_1469);
        uint _1473 = clamp(_1471, 0u, 65535u);
        _1465 = as_type<float>(_1473);
    }
    float _1475 = _1465;
    float _1477 = _1431 * 0.693147182464599609375;
    float _1479 = _1463 * _1151;
    float _1481 = fma(_1459, 0.5, 0.5);
    float _1483 = fma(_1461, -0.5, 0.5);
    float _1485 = _1477 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1487 = _808;
    if (_1381)
    {
        float3 _4925 = float3(_1311, _1319, float(as_type<int>(_1447)));
        float3 _4929 = select(_4925, float3(0.0), isnan(_4925));
        float _1489 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _4929.xy, uint(rint(_4929.z)), _1479, level(0.0));
        _1487 = _1489;
    }
    float _1491 = _1487;
    float3 _4939 = float3(_1481, _1483, _1485);
    float _1493 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4939, float3(0.0), isnan(_4939)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4939, float3(0.0), isnan(_4939)), level(0.0)).x;
    float3 _4948 = float3(_1481, _1483, _1485);
    float4 _1496 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4948, float3(0.0), isnan(_4948)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4948, float3(0.0), isnan(_4948)), level(0.0)).xyzw;
    float _1498 = _1496.x;
    float _1500 = _1496.y;
    float _1502 = _1496.z;
    float _1504 = _1496.w;
    float _1506 = _1011;
    if (!_1045)
    {
        float3 _4971 = float3(_1415, _1457, float(as_type<int>(_1475)));
        float3 _4973 = select(_4971, float3(0.0), isnan(_4971));
        float _1508 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _4973.xy, uint(rint(_4973.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _4973.xy, uint(rint(_4973.z)), level(0.0)).x;
        _1506 = _1508;
    }
    float _1510 = _1506;
    if (_1045)
    {
        _1437 = 1.0;
    }
    float _1512 = _1437;
    float _1514 = _1512;
    if (!_1045)
    {
        int _1516 = _1111 << 4;
        int _1518 = _1516 + 2048;
        uint _1520 = uint(int(uint(_1518) >> uint(2)));
        uint _1522 = uint(int(uint(int(_1520)) >> uint(2)));
        int _1524 = int(_1520) & 3;
        float _1526 = (*spvDescriptorSet0.vp_c15)._m0[int(_1522)][_1524];
        int _1528 = int(_1520) + 1;
        uint _1530 = uint(int(uint(_1528) >> uint(2)));
        int _1532 = _1528 & 3;
        float _1534 = (*spvDescriptorSet0.vp_c15)._m0[int(_1530)][_1532];
        int _1536 = _1518 + 8;
        uint _1538 = uint(int(uint(_1536) >> uint(2)));
        uint _1540 = uint(int(uint(int(_1538)) >> uint(2)));
        int _1542 = int(_1538) & 3;
        float _1544 = (*spvDescriptorSet0.vp_c15)._m0[int(_1540)][_1542];
        int _1546 = int(_1538) + 1;
        uint _1548 = uint(int(uint(_1546) >> uint(2)));
        int _1550 = _1546 & 3;
        float _1552 = (*spvDescriptorSet0.vp_c15)._m0[int(_1548)][_1550];
        float _1554 = _750 * _1534;
        float _1556 = fma(_226, _1526, _1554);
        float _1558 = fma(_228, _1544, _1556);
        float _1560 = _1558 + _1552;
        float _1562 = precise::clamp(_1560, 0.0, 1.0);
        float _1564 = -_1562;
        float _1566 = _1564 + _1510;
        float _1568 = fma(_1566, 500.0, 1.5);
        float _1570 = exp2(_1568);
        float _1572 = 0.0 + _1570;
        float _1574 = precise::clamp(_1572, 0.0, 1.0);
        _1514 = _1574;
    }
    float _1576 = _1514;
    float _1578 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1580 = _1289 + _1578;
    float _1582 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1584 = _1291 + _1582;
    float _1586 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1588 = _1293 + _1586;
    float _1590 = _1580 * _1580;
    float _1592 = fma(_1584, _1584, _1590);
    float _1594 = fma(_1588, _1588, _1592);
    float _1596 = rsqrt(_1594);
    float _1598 = sqrt(_1594);
    float _1600 = _1596 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1602 = _1584 * _1600;
    float _1604 = _1588 * _1600;
    float _1606 = _1602 * _1602;
    float _1608 = _1604 * _1604;
    float _1610 = _1606 + _1608;
    float _1612 = sqrt(_1610);
    bool _1614 = _1612 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1616 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1618 = _1612 + _1616;
    float _1620 = _1447;
    float _1622 = _1610;
    float _1624 = _1618;
    float _1626 = _1580;
    float _1628 = _1600;
    float _1630 = _1602;
    float _1632 = _1606;
    float _1634 = _1608;
    if (_1614)
    {
        float _1636 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1620 = _1636;
    }
    float _1638 = _1620;
    if (_1614)
    {
        float _1640 = rsqrt(_1610);
        _1622 = _1640;
    }
    float _1642 = _1622;
    if (_1614)
    {
        float _1644 = _1618 * _1638;
        _1624 = _1644;
    }
    float _1646 = _1624;
    if (_1614)
    {
        float _1648 = _1646 * 0.15915493667125701904296875;
        _400 = _1648;
    }
    float _1650 = _400;
    float _1652 = _1311;
    if (_1614)
    {
        float _1654 = _1650 * 6.283185482025146484375;
        float _1656 = sin(_1654);
        _1652 = _1656;
    }
    float _1658 = _1652;
    float _1660 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1662 = precise::max(0.0, _1660);
    float _1664 = _1638;
    if (_1614)
    {
        float _1666 = _1650 * 6.283185482025146484375;
        float _1668 = cos(_1666);
        _1664 = _1668;
    }
    float _1670 = _1664;
    float _1672 = -_1600;
    float _1674 = -_1662;
    float _1676 = fma(_1580, _1672, _1674);
    float _1678 = _1676;
    if (_1614)
    {
        float _1680 = _1676 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1626 = _1680;
    }
    float _1682 = _1626;
    float _1684 = _1658;
    float _1686 = _1682;
    if (_1614)
    {
        float _1688 = fma(_1658, _1682, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1684 = _1688;
    }
    float _1690 = _1684;
    float _1692 = _1690;
    if (_1614)
    {
        float _1694 = _1670 + (-1.0);
        _1686 = _1694;
    }
    float _1696 = _1686;
    float _1698 = _1696;
    if (_1614)
    {
        float _1700 = _1642 * _1690;
        _1628 = _1700;
    }
    float _1702 = _1628;
    if (_1614)
    {
        float _1704 = _1696 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1692 = _1704;
    }
    float _1706 = _1692;
    if (_1614)
    {
        float _1708 = _1602 * _1702;
        _1630 = _1708;
    }
    float _1710 = _1630;
    if (!_1614)
    {
        _1698 = _1604;
    }
    float _1712 = _1698;
    float _1714 = _1712;
    if (_1614)
    {
        float _1716 = _1604 * _1702;
        _1714 = _1716;
    }
    float _1718 = _1714;
    if (_1614)
    {
        float _1720 = fma(_1676, _1670, _1706);
        _1678 = _1720;
    }
    float _1722 = _1678;
    if (_1614)
    {
        float _1724 = _1710 * _1710;
        _1632 = _1724;
    }
    float _1726 = _1632;
    if (_1614)
    {
        float _1728 = _1718 * _1718;
        _1634 = _1728;
    }
    float _1730 = _1634;
    float _1732 = fma(_1722, _1722, _1726);
    float _1734 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1736 = fma(_1598, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1734);
    float _1738 = precise::clamp(_1736, 0.0, 1.0);
    float _1740 = _1732 + _1730;
    float _1742 = -_1738;
    float _1744 = _1742 + 1.0;
    float _1746 = rsqrt(_1740);
    float _1748 = abs(_1744);
    float _1750 = log2(_1748);
    float _1752 = _1746 * _1710;
    float _1754 = _1746 * _1722;
    float _1756 = _1746 * _1718;
    float _1758 = _1752 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1760 = -_1758;
    float _1762 = fma(_1754, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1760);
    float _1764 = _1750 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1766 = -_1756;
    float _1768 = fma(_1766, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1762);
    float _1770 = exp2(_1764);
    float _1772 = fma(_1768, -0.5, 0.5);
    float _1774 = fma(_1768, 0.5, 0.5);
    float _1776 = fma(_1774, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1778 = sqrt(_1772);
    float _1780 = fma(_1774, _1776, -0.212114393711090087890625);
    float _1782 = _1754 + 1.0;
    float _1784 = fma(_1774, _1780, 1.570728778839111328125);
    float _1786 = -_1754;
    float _1788 = fma(_1770, _1782, _1786);
    float _1790 = fma(_1788, 0.5, 0.5);
    float _1792 = _1778 * 0.636619746685028076171875;
    float _1794 = -_1784;
    float _1796 = fma(_1792, _1794, 1.0);
    float2 _5418 = float2(_1796, _1790);
    float3 _1800 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5418, float2(0.0), isnan(_5418)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5418, float2(0.0), isnan(_5418)), level(0.0)).xyz;
    float _1802 = _1800.x;
    float _1804 = _1800.y;
    float _1806 = _1800.z;
    float _1808 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _1810 = in.m_71.y;
    float _1812 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1814 = _256 > 0.5;
    float _1816 = _1808 * _266;
    float _1818 = in.m_63.w;
    int _1820 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1822 = _1820 != 0;
    float _1824 = -_246;
    float _1826 = _1824 + 1.0;
    int _1828 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1830 = _1828 != 0;
    float _1832 = in.m_71.x;
    float _1834 = trunc(_1816);
    int _1836 = int(_1834);
    int _1838 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1840 = _1838 != 0;
    int _1842 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1844 = _1842 != 0;
    out.m_73.x = _1291;
    out.m_73.y = _1289;
    out.m_73.z = _1293;
    float _1846 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1848 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1850 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1852 = -_1810;
    float _1854 = _1852 + 1.0;
    int _1856 = _1836 << 4;
    int _1858 = _1856 + 1712;
    bool _1860 = _1818 > 0.5;
    uint _1862 = uint(int(uint(_1858) >> uint(2)));
    uint _1864 = uint(int(uint(int(_1862)) >> uint(2)));
    int _1866 = int(_1862) & 3;
    float _1868 = (*spvDescriptorSet0.vp_c9)._m0[int(_1864)][_1866];
    int _1870 = int(_1862) + 1;
    uint _1872 = uint(int(uint(_1870) >> uint(2)));
    int _1874 = _1870 & 3;
    float _1876 = (*spvDescriptorSet0.vp_c9)._m0[int(_1872)][_1874];
    float _1878 = 0.0;
    bool _1880 = _1860;
    float _1882 = _1810;
    bool _1884 = _1844;
    float _1886 = _1854;
    if (!_1822)
    {
        _1878 = _1832;
    }
    float _1888 = _1878;
    int _1890 = _1860 ? as_type<int>(_1854) : as_type<int>(_1810);
    int _1892 = _1858 + 8;
    uint _1894 = uint(int(uint(_1892) >> uint(2)));
    uint _1896 = uint(int(uint(int(_1894)) >> uint(2)));
    int _1898 = int(_1894) & 3;
    float _1900 = (*spvDescriptorSet0.vp_c9)._m0[int(_1896)][_1898];
    float _1902 = in.m_75.x;
    float _1904 = in.m_75.y;
    float _1906 = in.m_75.z;
    float _1908 = _1840 ? as_type<float>(_1890) : _1810;
    bool _1910 = _714 != 0.0;
    bool _1912 = isnan(_714);
    bool _1914 = _1910 || _1912;
    bool _1916 = isnan(0.0);
    bool _1918 = _1914 || _1916;
    float _1920 = _1888;
    if (_1822)
    {
        bool _1922 = _266 > 0.5;
        _1880 = _1922;
    }
    bool _1924 = _1880;
    float _1926 = _1908 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _1928 = _712 == 0.0;
    bool _1930 = !_1918;
    bool _1932 = _1928 && _1930;
    float _1934 = _1848 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1936 = _1850 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1938 = _716 == 0.0;
    bool _1940 = _1938 && _1932;
    float _1942 = 0.0;
    if (!_1822)
    {
        _1942 = _1888;
    }
    float _1944 = _1942;
    float _1946 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _1948 = as_type<int>(_1946);
    float _1950 = _1944;
    if (_1822)
    {
        _1920 = _1832;
    }
    float _1952 = _1920;
    float _1954 = _1952;
    if (_1844)
    {
        float _1956 = _1814 ? _1854 : _1810;
        _1882 = _1956;
    }
    float _1958 = _1882;
    float _1960 = _1946 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_1830)
    {
        bool _1962 = _248 > 0.5;
        _1884 = _1962;
    }
    bool _1964 = _1884;
    if (_1822)
    {
        float _1966 = -_1952;
        float _1968 = _1966 + 1.0;
        _402 = as_type<int>(_1968);
    }
    int _1970 = _402;
    if (_1830)
    {
        float _1972 = -_1952;
        float _1974 = _1972 + 1.0;
        _1948 = as_type<int>(_1974);
    }
    int _1976 = _1948;
    float _1978 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    out.m_77.x = _1934;
    out.m_77.y = _1936;
    out.m_77.z = _1960;
    if (_1940)
    {
        _1886 = _1902;
    }
    float _1980 = _1886;
    float _1982 = _1980;
    if (_1822)
    {
        float _1984 = _1924 ? as_type<float>(_1970) : _1952;
        _1950 = _1984;
    }
    float _1986 = _1950;
    float _1988 = in.m_79.x;
    float _1990 = in.m_79.y;
    float _1992 = in.m_79.z;
    float _1994 = in.m_79.w;
    if (_1940)
    {
        _1105 = _1980;
    }
    float _1996 = _1105;
    float _1998 = _1996;
    if (!_1940)
    {
        _1982 = _1902;
    }
    float _2000 = _1982;
    float _2002 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2004 = 0.0;
    if (_1940)
    {
        _2004 = _1904;
    }
    float _2006 = _2004;
    float _2008 = _2006;
    if (!_1940)
    {
        float _2010 = fma(_712, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2000);
        _1998 = _2010;
    }
    float _2012 = _1998;
    if (_1830)
    {
        float _2014 = _1964 ? as_type<float>(_1976) : _1952;
        _1954 = _2014;
    }
    float _2016 = _1954;
    float _2018 = _1868 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2020 = abs(_758);
    float _2022 = log2(_2020);
    float _2024 = 0.0;
    if (_1940)
    {
        _2024 = _2006;
    }
    float _2026 = _2024;
    float _2028 = _1876 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2030 = _2026;
    if (!_1940)
    {
        _2008 = _1904;
    }
    float _2032 = _2008;
    float _2034 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2036 = 0.0;
    if (_1940)
    {
        _2036 = _1906;
    }
    float _2038 = _2036;
    float _2040 = _1900 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2042 = _2018 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2044 = _2028 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2046 = _2038;
    if (!_1940)
    {
        float _2048 = fma(_714, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2032);
        _2030 = _2048;
    }
    float _2050 = _2030;
    float _2052 = _2040 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2054 = 0.0;
    if (_1940)
    {
        _2054 = _2038;
    }
    float _2056 = _2054;
    float _2058 = _1958 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2060 = _1986 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2062 = _2016 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2064 = _2056;
    if (!_1940)
    {
        _2046 = _1906;
    }
    float _2066 = _2046;
    out.m_81.x = _2042;
    out.m_81.y = _2044;
    out.m_81.z = _2052;
    out.m_81.w = _2034;
    float _2068 = _1926 * _2002;
    float _2070 = _2058 * _1978;
    float _2072 = _2060 * _1812;
    float _2074 = _2062 * _1846;
    float _2076 = _1990 * _2066;
    if (!_1940)
    {
        float _2078 = fma(_716, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2066);
        _2064 = _2078;
    }
    float _2080 = _2064;
    bool _2082 = _758 <= 8000.0;
    bool _2084 = isnan(_758);
    bool _2086 = _2082 || _2084;
    bool _2088 = isnan(8000.0);
    bool _2090 = _2086 || _2088;
    float _2092 = float(_2090);
    out.m_83.x = _2072;
    out.m_83.y = _2070;
    out.m_83.z = _2074;
    out.m_83.w = _2068;
    float _2094 = -_2076;
    float _2096 = fma(_1992, _2032, _2094);
    float _2098 = -_1990;
    float _2100 = _850 * _2098;
    float _2102 = _1992 * _2000;
    float _2104 = _2022 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2106 = _1988 * _2032;
    float _2108 = fma(_862, _1988, _2100);
    float _2110 = -_2102;
    float _2112 = fma(_1988, _2066, _2110);
    float _2114 = -_2106;
    float _2116 = fma(_1990, _2000, _2114);
    float _2118 = _2096 * _1994;
    float _2120 = _2112 * _1994;
    float _2122 = exp2(_2104);
    float _2124 = _2116 * _1994;
    float _2126 = -_2050;
    float _2128 = _850 * _2126;
    float _2130 = -_2120;
    float _2132 = _850 * _2130;
    float _2134 = _860 * _1990;
    float _2136 = _860 * _2050;
    float _2138 = fma(_862, _2012, _2128);
    float _2140 = fma(_862, _2118, _2132);
    float _2142 = _860 * _2120;
    float _2144 = _864 * _1990;
    float _2146 = fma(_903, _2012, _2136);
    float _2148 = fma(_903, _1988, _2134);
    float _2150 = fma(_903, _2118, _2142);
    float _2152 = _864 * _2120;
    float _2154 = fma(_872, _2080, _2138);
    float _2156 = fma(_2122, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2158 = precise::clamp(_2156, 0.0, 1.0);
    float _2160 = fma(_897, _1988, _2144);
    float _2162 = fma(_897, _2118, _2152);
    float _2164 = fma(_901, _1992, _2148);
    float _2166 = fma(_872, _1992, _2108);
    float _2168 = fma(_913, _1992, _2160);
    float _2170 = fma(_901, _2080, _2146);
    float _2172 = fma(_2158, -2.0, 3.0);
    float _2174 = fma(_872, _2124, _2140);
    float _2176 = fma(_901, _2124, _2150);
    float _2178 = fma(_913, _2124, _2162);
    float _2180 = _2158 * _2158;
    float _2182 = _2164 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2184 = _2164 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2186 = _2164 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2188 = _2180 * _2172;
    float _2190 = fma(_2166, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2182);
    float _2192 = _2176 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2194 = fma(_2166, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2184);
    float _2196 = _2176 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2198 = _864 * _2050;
    float _2200 = fma(_2166, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2186);
    float _2202 = fma(_2174, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2192);
    float _2204 = fma(_2168, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2190);
    float _2206 = fma(_2174, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2196);
    float _2208 = fma(_2168, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2194);
    float _2210 = _2170 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2212 = _2170 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2214 = fma(_897, _2012, _2198);
    float _2216 = _2170 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2218 = fma(_2178, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2202);
    float _2220 = fma(_2168, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2200);
    float _2222 = fma(_2178, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2206);
    float _2224 = fma(_2154, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2210);
    float _2226 = fma(_2154, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2212);
    float _2228 = fma(_913, _2080, _2214);
    float _2230 = fma(_2154, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2216);
    float _2232 = -_2188;
    float _2234 = _2232 + 1.0;
    float _2236 = _1353 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_85.x = _2220;
    out.m_85.y = _2204;
    out.m_85.z = _2208;
    float _2238 = fma(_2228, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2230);
    float _2240 = _1750 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2242 = fma(_2234, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2188);
    float _2244 = fma(_1363, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2236);
    float _2246 = _2176 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2248 = _2092 * _2242;
    float _2250 = exp2(_2240);
    float _2252 = fma(_1359, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2244);
    float _2254 = _2248 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2256 = _2220;
    if (!_1381)
    {
        _2256 = 1.0;
    }
    float _2258 = _2256;
    float _2260 = fma(_1387, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2252);
    float _2262 = _2258;
    if (_1381)
    {
        bool _2264 = _1491 >= _1479;
        bool _2266 = isnan(_1491);
        bool _2268 = _2264 || _2266;
        bool _2270 = isnan(_1479);
        bool _2272 = _2268 || _2270;
        float _2274 = float(_2272);
        _2262 = _2274;
    }
    float _2276 = _2262;
    float _2278 = _1826 * _2254;
    float _2280 = precise::clamp(_2278, 0.0, 1.0);
    out.m_87.x = 1.0;
    out.m_87.y = 1.0;
    out.m_87.z = 1.0;
    float _2282 = fma(_2174, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2246);
    float _2284 = _2260 + _1403;
    float _2286 = _2276 * _1576;
    float _2288 = fma(_2228, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2224);
    float _2290 = fma(_2178, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2282);
    float _2292 = fma(_2228, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2226);
    float _2294 = -_2250;
    float _2296 = _2294 + 1.0;
    float _2298 = _2284 * 0.5;
    out.m_89.x = _2218;
    out.m_89.y = _2222;
    out.m_89.z = _2290;
    bool _2300 = _1598 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2302 = isnan(_1598);
    bool _2304 = _2300 || _2302;
    bool _2306 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2308 = _2304 || _2306;
    float _2310 = _2296 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2312 = -_2280;
    float _2314 = fma(_2312, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.gl_Position.x = _1429;
    out.gl_Position.y = _1433;
    out.gl_Position.z = _2260;
    out.gl_Position.w = _1403;
    float _2316 = _2310 * _1493;
    float _2318 = -_2286;
    float _2320 = fma(_2318, _2314, 1.0);
    float _2322 = precise::clamp(_2320, 0.0, 1.0);
    float _2324 = -_2310;
    float _2326 = _2324 + 1.0;
    out.m_91.z = _2298;
    out.m_91.w = _1403;
    float _2328 = _1504 * _2316;
    float _2330 = _1504 * _2326;
    out.m_93.x = _2288;
    out.m_93.y = _2292;
    out.m_93.z = _2238;
    float _2332 = _2280;
    float _2334 = _2326;
    float _2336 = _2322;
    float _2338 = _2316;
    float _2340 = _2328;
    if (!_2308)
    {
        _2332 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2342 = _2332;
    float _2344 = _2342;
    float _2346 = _2342;
    if (!_2308)
    {
        _2334 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2348 = _2334;
    float _2350 = _1806 * _2316;
    float _2352 = fma(_1802, _2328, _1498);
    float _2354 = fma(_1804, _2328, _1500);
    float _2356 = _2322 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2358 = fma(_1504, _2350, _1502);
    float _2360 = _2350;
    float _2362 = _2348;
    float _2364 = _2348;
    if (!_2308)
    {
        _2336 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2366 = _2336;
    float _2368 = _2366;
    float _2370 = _2366;
    if (!_2308)
    {
        _2360 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2372 = _2360;
    out.m_95.x = _2356;
    float _2374 = _2372;
    float _2376 = _2372;
    if (!_2308)
    {
        _2338 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2378 = _2338;
    float _2380 = _2378;
    float _2382 = _2378;
    if (!_2308)
    {
        _2340 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2384 = _2340;
    out.m_97.x = _2352;
    out.m_97.y = _2354;
    out.m_97.z = _2358;
    out.m_97.w = _2330;
    bool _2386 = !_2308;
    float _2388 = _2384;
    float _2390 = _2384;
    if (!_2386)
    {
        bool _2392 = _1598 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2394 = isnan(_1598);
        bool _2396 = _2392 || _2394;
        bool _2398 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2400 = _2396 || _2398;
        if (!_2400)
        {
            float _2402 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2404 = _1598 + _2402;
            float _2406 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2408 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2406;
            float _2410 = 1.0 / _2408;
            float _2412 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2414 = _2412 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2416 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2418 = _2416 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2420 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2422 = _2420 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2424 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2426 = _2424 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2428 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2430 = _2428 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2432 = _2404 * _2410;
            float _2434 = precise::clamp(_2432, 0.0, 1.0);
            float _2436 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2438 = _2436 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2440 = fma(_2434, _2414, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2442 = fma(_2434, _2438, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2444 = fma(_2434, _2418, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2446 = fma(_2434, _2422, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2448 = fma(_2434, _2426, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2450 = fma(_2434, _2430, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2364 = _2442;
            _2382 = _2448;
            _2346 = _2440;
            _2376 = _2446;
            _2370 = _2444;
            _2390 = _2450;
            _2452 = true;
        }
        else
        {
            bool _2454 = _1598 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2456 = isnan(_1598);
            bool _2458 = _2454 || _2456;
            bool _2460 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2462 = _2458 || _2460;
            if (!_2462)
            {
                _2344 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2464 = _2344;
            _2346 = _2464;
            if (!_2462)
            {
                _2362 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2466 = _2362;
            _2364 = _2466;
            if (!_2462)
            {
                _2368 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2468 = _2368;
            _2370 = _2468;
            if (!_2462)
            {
                _2374 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2470 = _2374;
            _2376 = _2470;
            if (!_2462)
            {
                _2380 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2472 = _2380;
            _2382 = _2472;
            if (!_2462)
            {
                _2388 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2474 = _2388;
            bool _2476 = !_2462;
            _2390 = _2474;
            if (!_2476)
            {
                bool _2478 = _1598 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2480 = isnan(_1598);
                bool _2482 = _2478 || _2480;
                bool _2484 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2486 = _2482 || _2484;
                if (!_2486)
                {
                    float _2488 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2490 = _1598 + _2488;
                    float _2492 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2494 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2492;
                    float _2496 = 1.0 / _2494;
                    float _2498 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2500 = _2498 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2502 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2504 = _2502 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2506 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2508 = _2506 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2510 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2512 = _2510 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2514 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2516 = _2514 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2518 = _2490 * _2496;
                    float _2520 = precise::clamp(_2518, 0.0, 1.0);
                    float _2522 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2524 = _2522 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2526 = fma(_2520, _2500, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2528 = fma(_2520, _2524, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2530 = fma(_2520, _2504, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2532 = fma(_2520, _2508, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2534 = fma(_2520, _2512, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2536 = fma(_2520, _2516, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2364 = _2528;
                    _2382 = _2534;
                    _2346 = _2526;
                    _2376 = _2532;
                    _2370 = _2530;
                    _2390 = _2536;
                    _2452 = true;
                }
                else
                {
                    _2364 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2382 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2346 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2376 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2370 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2390 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2452 = false;
    float _2538 = _2364;
    float _2540 = _2382;
    float _2542 = _2346;
    float _2544 = _2376;
    float _2546 = _2370;
    float _2548 = _2390;
    float _2550 = fma(_2292, -0.5, 0.5);
    float _2552 = precise::clamp(_2550, 0.0, 1.0);
    float _2554 = -_2538;
    float _2556 = _2554 + _2540;
    float _2558 = -_2542;
    float _2560 = _2558 + _2544;
    float _2562 = -_2546;
    float _2564 = _2562 + _2548;
    bool _2566 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2568 = fma(_2552, _2556, _2538);
    float _2570 = fma(_2552, _2560, _2542);
    float _2572 = fma(_2552, _2564, _2546);
    float _2574 = _2568 * 0.586610972881317138671875;
    out.m_99.x = 0.0;
    float _2576 = fma(_2570, 0.298911988735198974609375, _2574);
    float _2578 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2580 = fma(_2572, 0.114477999508380889892578125, _2576);
    out.m_59.x = _2578;
    float _2582 = -_2580;
    float _2584 = _2570 + _2582;
    float _2586 = -_2580;
    float _2588 = _2568 + _2586;
    float _2590 = -_2580;
    float _2592 = _2572 + _2590;
    float _2594 = fma(_2584, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2580);
    float _2596 = fma(_2588, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2580);
    float _2598 = fma(_2592, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2580);
    out.m_101.x = _2594;
    out.m_101.y = _2596;
    out.m_101.z = _2598;
    if (!_2566)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2600 = -_1289;
    float _2602 = _2600 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2604 = -_1291;
    float _2606 = _2604 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2608 = -_1293;
    float _2610 = _2608 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2612 = _2602 * _2602;
    float _2614 = fma(_2606, _2606, _2612);
    float _2616 = fma(_2610, _2610, _2614);
    float _2618 = sqrt(_2616);
    float _2620 = rsqrt(_2616);
    float _2622 = -_2618;
    float _2624 = _2622 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2626 = _2624 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2628 = precise::clamp(_2626, 0.0, 1.0);
    float _2630 = _2606 * _2620;
    float _2632 = _2602 * _2620;
    float _2634 = abs(_2628);
    float _2636 = log2(_2634);
    float _2638 = _2610 * _2620;
    float _2640 = _2630 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2642 = _2292 * _2632;
    float _2644 = -_2632;
    float _2646 = -_2640;
    float _2648 = fma(_2644, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2646);
    float _2650 = fma(_2288, _2630, _2642);
    float _2652 = -_2638;
    float _2654 = fma(_2652, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2648);
    float _2656 = fma(_2238, _2638, _2650);
    float _2658 = precise::clamp(_2656, 0.0, 1.0);
    float _2660 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2662 = _2654 + _2660;
    float _2664 = _2636 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2666 = _2662 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2668 = precise::clamp(_2666, 0.0, 1.0);
    float _2670 = exp2(_2664);
    float _2672 = _2670 * _2668;
    float _2674 = _2658 * _2672;
    float _2676 = _2674 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2678 = _2674 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2680 = _2674 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_99.x = _2676;
    out.m_99.y = _2678;
    out.m_99.z = _2680;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

