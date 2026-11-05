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
    constant _16* vp_c8 [[id(0)]];
    constant _16* vp_c10 [[id(1)]];
    constant _16* vp_c9 [[id(2)]];
    constant _16* vp_c13 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    texture2d<float> vp_t_tcb_24 [[id(6)]];
    sampler vp_t_tcb_24Smplr [[id(7)]];
    texture3d<float> vp_t_tcb_32 [[id(8)]];
    sampler vp_t_tcb_32Smplr [[id(9)]];
    texture3d<float> vp_t_tcb_30 [[id(10)]];
    sampler vp_t_tcb_30Smplr [[id(11)]];
    texture2d<float> vp_t_tcb_1C [[id(12)]];
    sampler vp_t_tcb_1CSmplr [[id(13)]];
    sampler vp_t_tcb_24Smplr_w [[id(14)]];
    sampler vp_t_tcb_32Smplr_w [[id(15)]];
    sampler vp_t_tcb_30Smplr_w [[id(16)]];
    sampler vp_t_tcb_1CSmplr_w [[id(17)]];
    constant dm_border_t* dm_border [[id(18)]];
};

struct main0_out
{
    float4 m_59 [[user(locn0)]];
    float4 m_83 [[user(locn1)]];
    float4 m_93 [[user(locn2)]];
    float4 m_69 [[user(locn3)]];
    float4 m_71 [[user(locn4)]];
    float4 m_87 [[user(locn5)]];
    float4 m_73 [[user(locn6)]];
    float4 m_85 [[user(locn7)]];
    float4 m_79 [[user(locn8)]];
    float4 m_95 [[user(locn9)]];
    float4 m_91 [[user(locn10)]];
    float4 m_89 [[user(locn11)]];
    float4 m_49 [[user(locn12)]];
    float4 m_77 [[user(locn13)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_81 [[attribute(0)]];
    float4 m_61 [[attribute(1)]];
    float4 m_53 [[attribute(2)]];
    float4 m_46 [[attribute(3)]];
    float4 m_51 [[attribute(4)]];
    float4 m_75 [[attribute(5)]];
    float4 m_63 [[attribute(6)]];
    float4 m_55 [[attribute(7)]];
    float4 m_57 [[attribute(8)]];
    float4 m_65 [[attribute(10)]];
    float4 m_67 [[attribute(11)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2327 = false;
    bool _542 = false;
    bool _400 = false;
    bool _220 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _109 = in.m_46.w;
    float _111 = trunc(_109);
    int _114 = int(_111);
    bool _118 = _114 >= 1;
    float _120 = 0.0;
    if (!_118)
    {
        _120 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _122 = _120;
    float _124 = _122;
    if (!_118)
    {
        out.m_49.x = 0.0;
    }
    int _126 = 0;
    if (!_118)
    {
        float _128 = _122 * 5.0;
        _126 = as_type<int>(_128);
    }
    int _130 = _126;
    if (!_118)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2625 = as_type<float>(_130);
        out.gl_Position.z = _2625;
    }
    if (!_118)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _132 = in.m_51.w;
    bool _134 = _132 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _136 = isnan(_132);
    bool _138 = _134 || _136;
    bool _140 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _142 = _138 || _140;
    float _144 = -_132;
    float _146 = _144 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _148 = 0.0;
    float _150 = _146;
    if (_142)
    {
        float _152 = float(_114);
        _148 = _152;
    }
    float _154 = _148;
    bool _156 = _146 >= _154;
    bool _158 = !_142;
    bool _160 = _156 || _158;
    if (_160)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _162 = _124;
    if (_160)
    {
        out.m_49.x = 0.0;
    }
    int _164 = 0;
    if (_160)
    {
        float _166 = _162 * 5.0;
        _164 = as_type<int>(_166);
    }
    int _168 = _164;
    if (_160)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2694 = as_type<float>(_168);
        out.gl_Position.z = _2694;
    }
    if (_160)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _170 = in.m_53.x;
    float _172 = in.m_53.y;
    float _174 = in.m_53.z;
    bool _176 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _178 = _172 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _180 = _172 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _182 = _172 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _184 = fma(_170, (*spvDescriptorSet0.vp_c10)._m0[4].x, _178);
    float _186 = fma(_170, (*spvDescriptorSet0.vp_c10)._m0[5].x, _180);
    float _188 = fma(_170, (*spvDescriptorSet0.vp_c10)._m0[6].x, _182);
    float _190 = fma(_174, (*spvDescriptorSet0.vp_c10)._m0[4].z, _184);
    float _192 = fma(_174, (*spvDescriptorSet0.vp_c10)._m0[5].z, _186);
    float _194 = fma(_174, (*spvDescriptorSet0.vp_c10)._m0[6].z, _188);
    bool _196 = !_176;
    float _198 = _192;
    float _200 = _190;
    float _218;
    if (!_196)
    {
        float _202 = in.m_55.x;
        float _204 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _206 = _202 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _208 = fma(_206, (*spvDescriptorSet0.vp_c9)._m0[12].x, _146);
        float _210 = _208 * _204;
        float _212 = floor(_210);
        float _214 = -_212;
        float _216 = _210 + _214;
        _218 = _216;
        _220 = true;
    }
    else
    {
        float _222 = float(_114);
        float _224 = 1.0 / _222;
        float _226 = _146 * _224;
        _218 = _226;
    }
    _220 = false;
    float _228 = _218;
    float _230 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _232 = _228 + _230;
    bool _234 = _228 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _236 = isnan(_228);
    bool _238 = _234 || _236;
    bool _240 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _242 = _238 || _240;
    float _244 = float(_242);
    float _246 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _248 = _228 + _246;
    bool _250 = _228 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _252 = isnan(_228);
    bool _254 = _250 || _252;
    bool _256 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _258 = _254 || _256;
    float _260 = float(_258);
    float _262 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _264 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _262;
    float _266 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _268 = _266 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _270 = _228 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _272 = isnan(_228);
    bool _274 = _270 || _272;
    bool _276 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _278 = _274 || _276;
    float _280 = float(_278);
    float _282 = -_244;
    float _284 = _282 + 1.0;
    float _286 = 1.0 / _268;
    float _288 = _280 * _284;
    float _290 = -_280;
    float _292 = _290 + 1.0;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _296 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _294;
    bool _298 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _300 = 1.0 / _264;
    float _302 = _260 * _292;
    float _304 = -_260;
    float _306 = _304 + 1.0;
    float _308 = _248 * _286;
    float _310 = _232 * _300;
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _314 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _312;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _318 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _316;
    float _320 = fma(_296, _310, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _322 = fma(_314, _310, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _324 = fma(_318, _310, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _326 = in.m_57.x;
    float _328 = in.m_57.y;
    float _330 = in.m_57.z;
    float _332 = _320 * _302;
    float _334 = _322 * _302;
    float _336 = _324 * _302;
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _340 = _338 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _344 = _342 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _348 = _346 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _350 = fma(_306, (*spvDescriptorSet0.vp_c9)._m0[143].x, _332);
    float _352 = fma(_340, _308, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _354 = fma(_344, _308, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _356 = fma(_306, (*spvDescriptorSet0.vp_c9)._m0[143].y, _334);
    float _358 = fma(_348, _308, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _360 = fma(_306, (*spvDescriptorSet0.vp_c9)._m0[143].z, _336);
    float _362 = fma(_352, _288, _350);
    float _364 = fma(_354, _288, _356);
    float _366 = fma(_358, _288, _360);
    float _368 = fma(_244, (*spvDescriptorSet0.vp_c9)._m0[145].x, _362);
    float _370 = fma(_244, (*spvDescriptorSet0.vp_c9)._m0[145].y, _364);
    float _372 = fma(_244, (*spvDescriptorSet0.vp_c9)._m0[145].z, _366);
    float _374 = _368 * _326;
    float _376 = _370 * _328;
    float _378 = _372 * _330;
    bool _380 = !_298;
    float _398;
    if (!_380)
    {
        float _382 = in.m_55.x;
        float _384 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _386 = _382 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _388 = fma(_386, (*spvDescriptorSet0.vp_c9)._m0[11].y, _146);
        float _390 = _388 * _384;
        float _392 = floor(_390);
        float _394 = -_392;
        float _396 = _390 + _394;
        _398 = _396;
        _400 = true;
    }
    else
    {
        float _402 = float(_114);
        float _404 = 1.0 / _402;
        float _406 = _146 * _404;
        _398 = _406;
    }
    _400 = false;
    float _408 = _398;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _412 = _408 + _410;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _416 = _414 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _418 = _408 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _420 = isnan(_408);
    bool _422 = _418 || _420;
    bool _424 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _426 = _422 || _424;
    float _428 = float(_426);
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _432 = _430 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _434 = _408 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _436 = isnan(_408);
    bool _438 = _434 || _436;
    bool _440 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _442 = _438 || _440;
    float _444 = float(_442);
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _448 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _446;
    bool _450 = _408 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _452 = isnan(_408);
    bool _454 = _450 || _452;
    bool _456 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _458 = _454 || _456;
    float _460 = float(_458);
    float _462 = 1.0 / _416;
    float _464 = -_428;
    float _466 = _464 + 1.0;
    bool _468 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _470 = _444 * _466;
    float _472 = -_444;
    float _474 = _472 + 1.0;
    float _476 = 1.0 / _432;
    float _478 = _448 * _462;
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _482 = _480 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _484 = fma(_478, _412, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _486 = _482 * _476;
    float _488 = _484 * _470;
    float _490 = -_460;
    float _492 = _490 + 1.0;
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _496 = _408 + _494;
    float _498 = fma(_474, (*spvDescriptorSet0.vp_c9)._m0[115].x, _488);
    float _500 = _428 * _492;
    float _502 = fma(_486, _496, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _504 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _506 = fma(_502, _500, _498);
    float _508 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _510 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _512 = fma(_460, (*spvDescriptorSet0.vp_c9)._m0[117].x, _506);
    float _514 = _504 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _516 = _508 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _518 = _510 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _520 = _512 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_59.x = _514;
    out.m_59.y = _516;
    out.m_59.z = _518;
    out.m_59.w = _520;
    bool _522 = !_468;
    float _540;
    if (!_522)
    {
        float _524 = in.m_55.x;
        float _526 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _528 = _524 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _530 = fma(_528, (*spvDescriptorSet0.vp_c9)._m0[11].w, _146);
        float _532 = _530 * _526;
        float _534 = floor(_532);
        float _536 = -_534;
        float _538 = _532 + _536;
        _540 = _538;
        _542 = true;
    }
    else
    {
        float _544 = float(_114);
        float _546 = 1.0 / _544;
        float _548 = _146 * _546;
        _540 = _548;
    }
    _542 = false;
    float _550 = _540;
    float _552 = in.m_55.x;
    float _554 = in.m_55.y;
    float _556 = in.m_55.z;
    float _558 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _560 = log2(_558);
    float _562 = _374 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _564 = in.m_46.x;
    float _566 = in.m_46.y;
    float _568 = in.m_46.z;
    float _570 = _376 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _572 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _574 = _572 != 0;
    int _576 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _578 = _576 != 0;
    int _580 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _582 = _580 != 0;
    float _584 = _378 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _586 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _588 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _590 = isnan(1.0);
    bool _592 = _588 || _590;
    bool _594 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _596 = _592 || _594;
    float _598 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _600 = 1.0 + _598;
    float _602 = _560 * _146;
    float _604 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _606 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _608 = isnan(0.0);
    bool _610 = _606 || _608;
    bool _612 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _614 = _610 || _612;
    float _616 = 1.0 / _600;
    float _618 = _556 * 2.0;
    float _620 = _552 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _622 = _552 * 2.0;
    float _624 = _554 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _626 = floor(_618);
    float _628 = -_586;
    float _630 = fma(_620, 2.0, _628);
    float _632 = _566 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _634 = _554 + _556;
    float _636 = fma(_624, -2.0, _604);
    float _638 = _556 + _552;
    float _640 = fma(_564, (*spvDescriptorSet0.vp_c10)._m0[4].x, _632);
    float _642 = _634 + (-1.0);
    float _644 = exp2(_602);
    float _646 = _638 + (-1.0);
    float _648 = -_146;
    float _650 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[76].x, _630);
    float _652 = fma(_642, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _654 = fma(_646, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _656 = floor(_622);
    float _658 = _566 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _660 = _566 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _662 = _626 > 0.0;
    float _664 = fma(_564, (*spvDescriptorSet0.vp_c10)._m0[5].x, _658);
    float _666 = fma(_564, (*spvDescriptorSet0.vp_c10)._m0[6].x, _660);
    bool _668 = _626 >= 0.0;
    bool _670 = isnan(_626);
    bool _672 = _668 || _670;
    bool _674 = isnan(0.0);
    bool _676 = _672 || _674;
    float _678 = _554 * 2.0;
    float _680 = -_644;
    float _682 = _680 + 1.0;
    float _684 = floor(_678);
    float _686 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _688 = _614 ? _682 : 0.0;
    float _690 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _692 = _656 > 0.0;
    float _694 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _696 = fma(_556, (*spvDescriptorSet0.vp_c9)._m0[79].z, _686);
    float _698 = fma(_552, (*spvDescriptorSet0.vp_c9)._m0[78].z, _690);
    float _700 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[76].y, _636);
    float _702 = fma(_554, (*spvDescriptorSet0.vp_c9)._m0[78].w, _694);
    float _704 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[79].x, _696);
    float _706 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[77].z, _698);
    int _708 = _676 ? 0 : 1;
    float _710 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[77].w, _702);
    if (_596)
    {
        float _712 = _688 * _616;
        _150 = _712;
    }
    float _714 = _150;
    bool _716 = _656 >= 0.0;
    bool _718 = isnan(_656);
    bool _720 = _716 || _718;
    bool _722 = isnan(0.0);
    bool _724 = _720 || _722;
    float _726 = fma(_568, (*spvDescriptorSet0.vp_c10)._m0[5].z, _664);
    bool _728 = !_578;
    int _730 = _728 ? 0 : 1;
    float _732 = fma(_568, (*spvDescriptorSet0.vp_c10)._m0[4].z, _640);
    int _734 = _724 ? 0 : 1;
    float _736 = _726 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _738 = !_574;
    int _740 = _738 ? 0 : 1;
    float _742 = fma(_568, (*spvDescriptorSet0.vp_c10)._m0[6].z, _666);
    bool _744 = _684 > 0.0;
    float _746 = _732 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _748 = _684 >= 0.0;
    bool _750 = isnan(_684);
    bool _752 = _748 || _750;
    bool _754 = isnan(0.0);
    bool _756 = _752 || _754;
    float _758 = _742 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _760 = ~_708;
    int _762 = _760 + 1;
    int _764 = _762 + 1;
    float _766 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _768 = _746 + _766;
    int _770 = _764;
    if (!_662)
    {
        int _772 = ~_708;
        int _774 = _772 + 1;
        _770 = _774;
    }
    int _776 = _770;
    float _778 = _556 + (-0.5);
    int _780 = abs(_730);
    float _782 = in.m_61.x;
    float _784 = in.m_61.y;
    float _786 = in.m_61.z;
    int _788 = abs(_740);
    float _790 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _792 = _736 + _790;
    int _794 = ~_734;
    int _796 = _794 + 1;
    int _798 = _796 + 1;
    int _800 = _798;
    if (!_692)
    {
        int _802 = ~_734;
        int _804 = _802 + 1;
        _800 = _804;
    }
    int _806 = _800;
    float _808 = _792 * _792;
    float _810 = float(_780);
    float _812 = float(_806);
    float _814 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _816 = _758 + _814;
    float _818 = fma(_768, _768, _808);
    int _820 = _756 ? 0 : 1;
    float _822 = _810 * _812;
    float _824 = float(_788);
    float _826 = fma(_816, _816, _818);
    int _828 = ~_820;
    int _830 = _828 + 1;
    int _832 = _830 + 1;
    int _834 = _832;
    if (!_744)
    {
        int _836 = ~_820;
        int _838 = _836 + 1;
        _834 = _838;
    }
    int _840 = _834;
    float _842 = sqrt(_826);
    float _844 = float(_776);
    float _846 = _822 * (-2.0);
    bool _848 = !_582;
    int _850 = _848 ? 0 : 1;
    float _852 = _554 + (-0.5);
    float _854 = fma(_846, _784, _784);
    int _856 = abs(_850);
    float _858 = _824 * _844;
    float _860 = fma(_652, _846, _652);
    float _862 = fma(_852, (*spvDescriptorSet0.vp_c9)._m0[196].y, _854);
    float _864 = rsqrt(_826);
    float _866 = _554 + _552;
    float _868 = float(_840);
    float _870 = _562 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _872 = float(_856);
    float _874 = _842 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _876 = _866 + (-1.0);
    float _878 = _858 * (-2.0);
    float _880 = fma(_860, _714, _862);
    float _882 = _872 * _868;
    float _884 = precise::min(_870, _874);
    float _886 = fma(_876, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _888 = _552 + (-0.5);
    float _890 = fma(_878, _782, _782);
    float _892 = _880 * 0.15915493667125701904296875;
    float _894 = _882 * (-2.0);
    float _896 = fma(_886, _878, _886);
    float _898 = fma(_888, (*spvDescriptorSet0.vp_c9)._m0[196].x, _890);
    float _900 = _864 * _884;
    float _902 = fma(_654, _894, _654);
    float _904 = fma(_894, _786, _786);
    float _906 = fma(_896, _714, _898);
    float _908 = _792 * _900;
    float _910 = _768 * _900;
    float _912 = fma(_778, (*spvDescriptorSet0.vp_c9)._m0[196].z, _904);
    float _914 = _906 * 0.15915493667125701904296875;
    float _916 = -_908;
    float _918 = _792 + _916;
    float _920 = -_910;
    float _922 = _768 + _920;
    float _924 = fma(_902, _714, _912);
    float _926 = _816 * _900;
    float _928 = _918 * _918;
    float _930 = _892 * 6.283185482025146484375;
    float _932 = sin(_930);
    float _934 = _924 * 0.15915493667125701904296875;
    float _936 = -_926;
    float _938 = _816 + _936;
    float _940 = fma(_922, _922, _928);
    float _942 = in.m_63.x;
    float _944 = in.m_63.y;
    float _946 = in.m_63.z;
    float _948 = fma(_938, _938, _940);
    float _950 = _892 * 6.283185482025146484375;
    float _952 = cos(_950);
    float _954 = sqrt(_948);
    float _956 = _914 * 6.283185482025146484375;
    float _958 = cos(_956);
    float _960 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _944);
    float _962 = _914 * 6.283185482025146484375;
    float _964 = sin(_962);
    float _966 = _864 * _954;
    float _968 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _942);
    float _970 = _570 * _966;
    float _972 = _562 * _966;
    float _974 = _584 * _966;
    float _976 = _934 * 6.283185482025146484375;
    float _978 = cos(_976);
    float _980 = _958 * _952;
    float _982 = _958 * _932;
    float _984 = _970 * _960;
    float _986 = _972 * _968;
    float _988 = _934 * 6.283185482025146484375;
    float _990 = sin(_988);
    float _992 = _964 * _932;
    float _994 = _964 * _952;
    float _996 = _958 * _978;
    float _998 = _964 * _978;
    float _1000 = _952 * _978;
    float _1002 = _932 * _978;
    float _1004 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _946);
    float _1006 = _996 * _984;
    float _1008 = fma(_990, _980, _992);
    float _1010 = _974 * _1004;
    float _1012 = -_994;
    float _1014 = fma(_990, _982, _1012);
    float _1016 = -_984;
    float _1018 = _990 * _1016;
    float _1020 = fma(_1008, _986, _1006);
    float _1022 = -_982;
    float _1024 = fma(_990, _994, _1022);
    float _1026 = _998 * _984;
    float _1028 = fma(_1000, _986, _1018);
    float _1030 = fma(_1014, _1010, _1020);
    float _1032 = fma(_990, _992, _980);
    float _1034 = fma(_1024, _986, _1026);
    float _1036 = fma(_1002, _1010, _1028);
    float _1038 = _1030 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1040 = _1030 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1042 = fma(_1032, _1010, _1034);
    float _1044 = fma(_1036, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1038);
    float _1046 = fma(_1036, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1040);
    float _1048 = fma(_1042, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1044);
    float _1050 = fma(_1042, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1046);
    float _1052 = _1048 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1054 = _1050 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1056 = _758 + _1052;
    float _1058 = _746 + _1054;
    float _1060 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1062 = _1056 + _1060;
    float _1064 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1066 = _1058 + _1064;
    float _1068 = _1062 * _1062;
    float _1070 = fma(_1066, _1066, _1068);
    float _1072 = _1030 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1074 = -_926;
    float _1076 = _758 + _1074;
    float _1078 = sqrt(_1070);
    float _1080 = fma(_1036, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1072);
    float _1082 = -_908;
    float _1084 = _736 + _1082;
    float _1086 = -_910;
    float _1088 = _746 + _1086;
    float _1090 = fma(_1042, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1080);
    float _1092 = _1084 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1094 = _1090 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1096 = fma(_1088, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1092);
    float _1098 = _736 + _1094;
    float _1100 = fma(_1076, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1096);
    bool _1102 = _1078 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1104 = _1090;
    float _1106 = _1094;
    float _1108 = _1058;
    float _1110 = _1070;
    if (!_1102)
    {
        _1104 = _1058;
    }
    float _1112 = _1104;
    float _1114 = _1112;
    if (!_1102)
    {
        _1106 = _1056;
    }
    float _1116 = _1106;
    float _1118 = _1116;
    if (!_1102)
    {
        _1108 = _1098;
    }
    float _1120 = _1108;
    bool _1122 = !_1102;
    float _1124 = _1120;
    if (!_1122)
    {
        float _1126 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1128 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1130 = _1078 + _1128;
        float _1132 = _1098 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1134 = rsqrt(_1070);
        float _1136 = _1130 * _1126;
        float _1138 = _1136 * 0.15915493667125701904296875;
        float _1140 = _1138 * 6.283185482025146484375;
        float _1142 = cos(_1140);
        float _1144 = _1138 * 6.283185482025146484375;
        float _1146 = sin(_1144);
        float _1148 = _1142 + (-1.0);
        float _1150 = _1148 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1152 = fma(_1146, _1132, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1154 = fma(_1098, _1142, _1150);
        float _1156 = _1134 * _1152;
        float _1158 = fma(_1066, _1156, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1160 = fma(_1062, _1156, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1124 = _1154;
        _1114 = _1158;
        _1118 = _1160;
    }
    float _1162 = _1124;
    float _1164 = _1114;
    float _1166 = _1118;
    float _1168 = -_736;
    float _1170 = _1168 + _1162;
    float _1172 = -_746;
    float _1174 = _1172 + _1164;
    float _1176 = _1100 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1178 = -_758;
    float _1180 = _1178 + _1166;
    float _1182 = _1170 * _1170;
    float _1184 = 1.0 / _1176;
    float _1186 = -_926;
    float _1188 = _1186 + _1166;
    float _1190 = fma(_1174, _1174, _1182);
    float _1192 = _1084 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1194 = -_910;
    float _1196 = _1194 + _1164;
    float _1198 = fma(_1180, _1180, _1190);
    float _1200 = fma(_1088, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1192);
    bool _1202 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1204 = isnan(0.5);
    bool _1206 = _1202 || _1204;
    bool _1208 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1210 = _1206 || _1208;
    float _1212 = -_908;
    float _1214 = _1212 + _1162;
    float _1216 = sqrt(_1198);
    float _1218 = fma(_1076, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1200);
    bool _1220 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1222 = isnan(0.5);
    bool _1224 = _1220 || _1222;
    bool _1226 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1228 = _1224 || _1226;
    float _1230 = _1218 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1232 = _1230 + _1176;
    float _1234 = _1232 * _1184;
    float _1236 = _1234 * 0.5;
    bool _1238 = _1216 > 0.0;
    float _1240 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1242 = fma(_1236, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1240);
    float _1244 = 1.0 / _1242;
    float _1246 = _1216;
    float _1248 = _1196;
    float _1250 = _1214;
    float _1252 = _1170;
    float _1254 = _1242;
    if (!_1238)
    {
        _1246 = _1188;
    }
    float _1256 = _1246;
    bool _1258 = !_1238;
    float _1260 = _1256;
    if (!_1258)
    {
        float _1262 = _192 * _192;
        float _1264 = fma(_190, _190, _1262);
        float _1266 = fma(_194, _194, _1264);
        float _1268 = rsqrt(_1198);
        float _1270 = sqrt(_1266);
        float _1272 = _1174 * _1268;
        float _1274 = _1170 * _1268;
        bool _1276 = _1270 > 0.0;
        float _1278 = _1180 * _1268;
        float _1280 = _1268;
        _1254 = _1278;
        if (!_1276)
        {
            _1280 = _1188;
        }
        float _1282 = _1280;
        bool _1284 = !_1276;
        _1260 = _1282;
        if (!_1284)
        {
            float _1286 = rsqrt(_1266);
            float _1288 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1290 = _192 * _1286;
            float _1292 = _190 * _1286;
            float _1294 = _1274 * _1290;
            float _1296 = _194 * _1286;
            float _1298 = fma(_1272, _1292, _1294);
            float _1300 = _1288 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1302 = fma(_1278, _1296, _1298);
            float _1304 = _1302 * _1300;
            float _1306 = fma(_190, _1304, _1196);
            float _1308 = fma(_192, _1304, _1214);
            float _1310 = fma(_194, _1304, _1188);
            _1248 = _1306;
            _1250 = _1308;
            _1260 = _1310;
            _1252 = _1296;
        }
    }
    float _1312 = _1248;
    float _1314 = _1250;
    float _1316 = _1260;
    float _1318 = _1252;
    float _1320 = _1254;
    float _1322 = _1318;
    float _1324 = _1316;
    float _1326 = _1320;
    if (_1228)
    {
        _1322 = 1.0;
    }
    float _1328 = _1322;
    float _1330 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1332 = _1244 * _1330;
    float _1334 = _1328;
    if (_1210)
    {
        _198 = _1312;
    }
    float _1336 = _198;
    float _1338 = _1336;
    if (_1210)
    {
        _200 = _1314;
    }
    float _1340 = _200;
    float _1342 = _1340;
    if (!_1210)
    {
        float _1344 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1346 = _1084 + _1344;
        float _1348 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1350 = _1088 + _1348;
        float _1352 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1354 = -_1088;
        float _1356 = _1354 + _1312;
        float _1358 = _1346 * _1346;
        float _1360 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1362 = _1076 + _1360;
        float _1364 = -_1084;
        float _1366 = _1364 + _1314;
        float _1368 = fma(_1350, _1350, _1358);
        float _1370 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1372 = fma(_1362, _1362, _1368);
        float _1374 = sqrt(_1372);
        float _1376 = _1352 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1378 = -_1076;
        float _1380 = _1378 + _1316;
        float _1382 = precise::min(_1374, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1384 = _1382 * _1370;
        float _1386 = _1376 * _1384;
        float _1388 = fma(_1356, _1386, _1088);
        float _1390 = fma(_1366, _1386, _1084);
        float _1392 = fma(_1380, _1386, _1076);
        _1342 = _1390;
        _1338 = _1388;
        _1324 = _1392;
    }
    float _1394 = _1342;
    float _1396 = _1338;
    float _1398 = _1324;
    if (!_1228)
    {
        float _1400 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1402 = _1400 * 0.15915493667125701904296875;
        float _1404 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1406 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1408 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1406;
        float _1410 = _1402 * 6.283185482025146484375;
        float _1412 = cos(_1410);
        float _1414 = _1404 * 0.15915493667125701904296875;
        float _1416 = _1402 * 6.283185482025146484375;
        float _1418 = sin(_1416);
        float _1420 = 1.0 / _1412;
        float _1422 = _1414 * 6.283185482025146484375;
        float _1424 = cos(_1422);
        float _1426 = _1418 * _1420;
        float _1428 = _1414 * 6.283185482025146484375;
        float _1430 = sin(_1428);
        float _1432 = _1424 * _1426;
        float _1434 = 1.0 / _1408;
        float _1436 = 1.0 / _1432;
        float _1438 = _1430 * _1436;
        float _1440 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1442 = fma(_1332, _1438, _1440);
        float _1444 = _1442 * _1434;
        float _1446 = precise::clamp(_1444, 0.0, 1.0);
        _1334 = _1446;
    }
    float _1448 = _1334;
    float _1450 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1452 = _1394 + _1450;
    float _1454 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1456 = _1396 + _1454;
    float _1458 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1460 = _1398 + _1458;
    float _1462 = _1452 * _1452;
    float _1464 = fma(_1456, _1456, _1462);
    float _1466 = fma(_1460, _1460, _1464);
    float _1468 = rsqrt(_1466);
    float _1470 = _1468 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1472 = _1456 * _1470;
    float _1474 = _1460 * _1470;
    float _1476 = _1472 * _1472;
    float _1478 = _1474 * _1474;
    float _1480 = _1476 + _1478;
    float _1482 = sqrt(_1480);
    bool _1484 = _1482 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1486 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1488 = _1482 + _1486;
    float _1490 = _1464;
    float _1492 = _1488;
    float _1494 = _1452;
    float _1496 = _1470;
    if (_1484)
    {
        float _1498 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1490 = _1498;
    }
    float _1500 = _1490;
    float _1502 = _1500;
    if (_1484)
    {
        float _1504 = _1488 * _1500;
        _1492 = _1504;
    }
    float _1506 = _1492;
    if (_1484)
    {
        float _1508 = rsqrt(_1480);
        _1502 = _1508;
    }
    float _1510 = _1502;
    float _1512 = _1510;
    if (_1484)
    {
        float _1514 = _1506 * 0.15915493667125701904296875;
        _1326 = _1514;
    }
    float _1516 = _1326;
    float _1518 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1520 = _1468;
    float _1522 = _1516;
    if (_1484)
    {
        float _1524 = _1516 * 6.283185482025146484375;
        float _1526 = sin(_1524);
        _1520 = _1526;
    }
    float _1528 = _1520;
    float _1530 = precise::max(0.0, _1518);
    float _1532 = _1460;
    float _1534 = _1530;
    if (_1484)
    {
        float _1536 = _1516 * 6.283185482025146484375;
        float _1538 = cos(_1536);
        _1532 = _1538;
    }
    float _1540 = _1532;
    float _1542 = -_1470;
    float _1544 = -_1530;
    float _1546 = fma(_1452, _1542, _1544);
    if (_1484)
    {
        float _1548 = _1546 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1494 = _1548;
    }
    float _1550 = _1494;
    float _1552 = _1528;
    float _1554 = _1550;
    if (_1484)
    {
        float _1556 = fma(_1528, _1550, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1552 = _1556;
    }
    float _1558 = _1552;
    if (!_1484)
    {
        _1554 = _1546;
    }
    float _1560 = _1554;
    float _1562 = _1560;
    if (!_1484)
    {
        _1522 = _1474;
    }
    float _1564 = _1522;
    float _1566 = _1564;
    if (_1484)
    {
        float _1568 = _1510 * _1558;
        _1110 = _1568;
    }
    float _1570 = _1110;
    if (!_1484)
    {
        _1512 = _1472;
    }
    float _1572 = _1512;
    float _1574 = _1572;
    float _1576 = _1540;
    if (_1484)
    {
        float _1578 = _1540 + (-1.0);
        _1534 = _1578;
    }
    float _1580 = _1534;
    if (_1484)
    {
        float _1582 = _1472 * _1570;
        _1574 = _1582;
    }
    float _1584 = _1574;
    if (_1484)
    {
        float _1586 = _1474 * _1570;
        _1566 = _1586;
    }
    float _1588 = _1566;
    if (_1484)
    {
        float _1590 = _1580 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1496 = _1590;
    }
    float _1592 = _1496;
    float _1594 = sqrt(_1466);
    float _1596 = _1592;
    if (_1484)
    {
        float _1598 = fma(_1546, _1540, _1592);
        _1562 = _1598;
    }
    float _1600 = _1562;
    if (!_1484)
    {
        _1576 = _1476;
    }
    float _1602 = _1576;
    float _1604 = _1602;
    if (_1484)
    {
        float _1606 = _1584 * _1584;
        _1604 = _1606;
    }
    float _1608 = _1604;
    if (!_1484)
    {
        _1596 = _1478;
    }
    float _1610 = _1596;
    float _1612 = _1610;
    if (_1484)
    {
        float _1614 = _1588 * _1588;
        _1612 = _1614;
    }
    float _1616 = _1612;
    float _1618 = fma(_1088, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1620 = fma(_1600, _1600, _1608);
    float _1622 = _1394 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1624 = floor(_1618);
    float _1626 = _1620 + _1616;
    float _1628 = fma(_1396, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1622);
    float _1630 = _1394 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1632 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1634 = fma(_1594, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1632);
    float _1636 = precise::clamp(_1634, 0.0, 1.0);
    float _1638 = fma(_1398, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1628);
    float _1640 = rsqrt(_1626);
    float _1642 = -_1636;
    float _1644 = _1642 + 1.0;
    float _1646 = fma(_1076, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1648 = _1394 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1650 = _1638 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1652 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1654 = fma(_1396, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1630);
    float _1656 = fma(_1396, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1648);
    float _1658 = abs(_1644);
    float _1660 = log2(_1658);
    float _1662 = _1394 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1664 = _1650 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1666 = fma(_1398, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1656);
    float _1668 = fma(_1398, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1654);
    float _1670 = fma(_1396, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1662);
    float _1672 = -_1664;
    float _1674 = fma(_1672, _1652, 1.0);
    float _1676 = _1666 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1678 = _1640 * _1584;
    float _1680 = fma(_1398, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1670);
    float _1682 = _1640 * _1600;
    float _1684 = _1640 * _1588;
    float _1686 = _1678 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1688 = _1680 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1690 = floor(_1646);
    float _1692 = _1668 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1694 = -_1686;
    float _1696 = fma(_1682, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1694);
    float _1698 = _1688 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1700 = _1660 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1702 = -_1684;
    float _1704 = fma(_1702, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1696);
    float _1706 = fma(_1676, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1698);
    float _1708 = exp2(_1700);
    float _1710 = -_1624;
    float _1712 = _1618 + _1710;
    float _1714 = fma(_1704, -0.5, 0.5);
    float _1716 = fma(_1650, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1706);
    float _1718 = fma(_1692, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1716);
    float _1720 = log2(_1674);
    float _1722 = _1688 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1724 = fma(_1704, 0.5, 0.5);
    float _1726 = -_1690;
    float _1728 = _1646 + _1726;
    float _1730 = _1682 + 1.0;
    float _1732 = fma(_1676, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1722);
    float _1734 = fma(_1724, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1736 = 1.0 / _1718;
    float _1738 = _1688 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1740 = fma(_1650, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1732);
    float _1742 = fma(_1724, _1734, -0.212114393711090087890625);
    float _1744 = -_1682;
    float _1746 = fma(_1708, _1730, _1744);
    float _1748 = fma(_1676, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1738);
    float _1750 = fma(_1692, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1740);
    float _1752 = fma(_1724, _1742, 1.570728778839111328125);
    float _1754 = sqrt(_1714);
    float _1756 = fma(_1650, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1748);
    float _1758 = _1720 * 0.693147182464599609375;
    float2 _5210 = float2(_1712, _1728);
    float _1760 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5210, float2(0.0), isnan(_5210)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5210, float2(0.0), isnan(_5210)), level(0.0)).x;
    float _1762 = fma(_1746, 0.5, 0.5);
    float _1764 = fma(_1692, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1756);
    float _1766 = _1758 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1768 = _1750 * _1736;
    float _1770 = _1764 * _1736;
    float _1772 = fma(_1768, 0.5, 0.5);
    float _1774 = fma(_1770, -0.5, 0.5);
    float _1776 = _1754 * 0.636619746685028076171875;
    float3 _5245 = float3(_1772, _1774, _1766);
    float _1778 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5245, float3(0.0), isnan(_5245)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5245, float3(0.0), isnan(_5245)), level(0.0)).x;
    float _1780 = -_1752;
    float _1782 = fma(_1776, _1780, 1.0);
    float3 _5261 = float3(_1772, _1774, _1766);
    float4 _1785 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5261, float3(0.0), isnan(_5261)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5261, float3(0.0), isnan(_5261)), level(0.0)).xyzw;
    float _1787 = _1785.x;
    float _1789 = _1785.y;
    float _1791 = _1785.z;
    float _1793 = _1785.w;
    float2 _5277 = float2(_1782, _1762);
    float3 _1797 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5277, float2(0.0), isnan(_5277)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5277, float2(0.0), isnan(_5277)), level(0.0)).xyz;
    float _1799 = _1797.x;
    float _1801 = _1797.y;
    float _1803 = _1797.z;
    float _1805 = in.m_65.x;
    float _1807 = _1660 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1809 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1811 = _1809 != 0;
    float _1813 = in.m_65.y;
    bool _1815 = _554 > 0.5;
    float _1817 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1819 = _1817 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1821 = in.m_67.z;
    float _1823 = in.m_67.y;
    float _1825 = 1.0 / _1819;
    float _1827 = _704 * (-0.15915493667125701904296875);
    float _1829 = 0.0;
    float _1831 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    if (_1811)
    {
        float _1833 = in.m_55.x;
        _1829 = _1833;
    }
    float _1835 = _1829;
    int _1837 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1839 = _1837 != 0;
    float _1841 = _1688 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1843 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1845 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1843;
    float _1847 = in.m_67.w;
    float _1849 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1851 = fma(_1676, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1841);
    float _1853 = _1805;
    if (_1811)
    {
        _1831 = _1805;
    }
    float _1855 = _1831;
    out.m_69.x = _1088;
    out.m_69.y = _1084;
    out.m_69.z = _1076;
    float _1857 = fma(_1650, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1851);
    float _1859 = -_1813;
    float _1861 = _1859 + 1.0;
    float _1863 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    out.m_71.w = _884;
    float _1865 = _1813;
    float _1867 = _1855;
    if (_1839)
    {
        float _1869 = _1815 ? _1861 : _1813;
        _1865 = _1869;
    }
    float _1871 = _1865;
    out.m_73.z = _1821;
    float _1873 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1875 = _550 + _1873;
    bool _1877 = _944 != 0.0;
    bool _1879 = isnan(_944);
    bool _1881 = _1877 || _1879;
    bool _1883 = isnan(0.0);
    bool _1885 = _1881 || _1883;
    float _1887 = _1827 * 6.283185482025146484375;
    float _1889 = sin(_1887);
    out.m_73.y = _1823;
    float _1891 = _1014 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _1893 = _1835 > 0.5;
    bool _1895 = _1893 && _1811;
    float _1897 = _1845 * _1825;
    bool _1899 = _550 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1901 = isnan(_550);
    bool _1903 = _1899 || _1901;
    bool _1905 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1907 = _1903 || _1905;
    float _1909 = float(_1907);
    float _1911 = _1849 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1913 = _1827 * 6.283185482025146484375;
    float _1915 = cos(_1913);
    bool _1917 = _550 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1919 = isnan(_550);
    bool _1921 = _1917 || _1919;
    bool _1923 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1925 = _1921 || _1923;
    float _1927 = float(_1925);
    float _1929 = _1863 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1931 = -_1909;
    float _1933 = _1931 + 1.0;
    float _1935 = fma(_1897, _1875, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    out.m_73.w = _1847;
    bool _1937 = _942 == 0.0;
    bool _1939 = !_1885;
    bool _1941 = _1937 && _1939;
    float _1943 = _1927 * _1933;
    float _1945 = -_1927;
    float _1947 = _1945 + 1.0;
    if (_1895)
    {
        float _1949 = -_1855;
        float _1951 = _1949 + 1.0;
        _1867 = _1951;
    }
    float _1953 = _1867;
    bool _1955 = _946 == 0.0;
    bool _1957 = _1955 && _1941;
    float _1959 = _1935 * _1943;
    float _1961 = fma(_1002, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1891);
    float _1963 = exp2(_1807);
    if (_1811)
    {
        _1853 = _1953;
    }
    float _1965 = _1853;
    float _1967 = fma(_1911, _1871, -0.5);
    float _1969 = fma(_1947, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1959);
    float _1971 = in.m_67.x;
    float _1973 = _1889 * _1967;
    float _1975 = fma(_1929, _1965, -0.5);
    float _1977 = _1915 * _1967;
    float _1979 = in.m_75.x;
    float _1981 = in.m_75.y;
    float _1983 = in.m_75.z;
    float _1985 = fma(_1909, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1969);
    float _1987 = -_1973;
    float _1989 = fma(_1915, _1975, _1987);
    float _1991 = fma(_1889, _1975, _1977);
    out.m_77.x = _972;
    float _1993 = fma(_706, _1989, _650);
    float _1995 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1997 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1999 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2001 = -_700;
    float _2003 = fma(_710, _1991, _2001);
    float _2005 = -_1963;
    float _2007 = _2005 + 1.0;
    float _2009 = _1985 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2011 = _1999 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2013 = _1993 + 0.5;
    float _2015 = abs(_1332);
    float _2017 = log2(_2015);
    float _2019 = _2007 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2021 = _2003 + 0.5;
    float _2023 = _1995 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2025 = _1997 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_73.x = _1971;
    float _2027 = _1983;
    float _2029 = _1979;
    float _2031 = _1981;
    if (!_1957)
    {
        float _2033 = fma(_946, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1983);
        _2027 = _2033;
    }
    float _2035 = _2027;
    float _2037 = _996 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    if (!_1957)
    {
        float _2039 = fma(_942, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1979);
        _2029 = _2039;
    }
    float _2041 = _2029;
    float _2043 = _996 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    if (!_1957)
    {
        float _2045 = fma(_944, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1981);
        _2031 = _2045;
    }
    float _2047 = _2031;
    float _2049 = -_990;
    float _2051 = fma(_2049, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2037);
    float _2053 = _996 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2055 = _2017 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2057 = -_990;
    float _2059 = fma(_2057, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2043);
    float _2061 = _1008 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2063 = _1008 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2065 = fma(_998, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2051);
    float _2067 = exp2(_2055);
    float _2069 = fma(_998, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2059);
    float _2071 = -_990;
    float _2073 = fma(_2071, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2053);
    float _2075 = fma(_1000, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2061);
    float _2077 = fma(_1000, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2063);
    float _2079 = _1014 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2081 = _1014 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2083 = fma(_998, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2073);
    float _2085 = _2069 * _2047;
    float _2087 = fma(_1002, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2079);
    float _2089 = fma(_1002, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2081);
    float _2091 = fma(_1024, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2075);
    float _2093 = _2065 * _2047;
    float _2095 = _2083 * _2047;
    float _2097 = fma(_1032, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2089);
    float _2099 = fma(_2091, _2041, _2085);
    float _2101 = fma(_2067, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2103 = precise::clamp(_2101, 0.0, 1.0);
    float _2105 = fma(_1024, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2077);
    bool _2107 = _1332 <= 8000.0;
    bool _2109 = isnan(_1332);
    bool _2111 = _2107 || _2109;
    bool _2113 = isnan(8000.0);
    bool _2115 = _2111 || _2113;
    float _2117 = float(_2115);
    float _2119 = _1008 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2121 = fma(_2103, -2.0, 3.0);
    float _2123 = _2103 * _2103;
    float _2125 = fma(_2105, _2041, _2093);
    float _2127 = fma(_1000, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2119);
    out.m_79.x = _2013;
    out.m_79.y = _2021;
    float _2129 = _2123 * _2121;
    float _2131 = fma(_1032, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2087);
    float _2133 = fma(_1032, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1961);
    float _2135 = fma(_2097, _2035, _2125);
    float _2137 = -_2129;
    float _2139 = _2137 + 1.0;
    float _2141 = in.m_81.x;
    float _2143 = _1718 * 0.5;
    float _2145 = fma(_1024, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2127);
    float _2147 = fma(_2139, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2129);
    out.m_83.x = _2011;
    out.m_83.y = _2023;
    out.m_83.z = _2025;
    out.m_83.w = _2009;
    float _2149 = fma(_1764, -0.5, _2143);
    float _2151 = _2117 * _2147;
    float _2153 = fma(_2145, _2041, _2095);
    float _2155 = fma(_2131, _2035, _2099);
    out.m_85.x = _1396;
    out.m_85.y = _1394;
    out.m_85.z = _1398;
    float _2157 = _2151 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2159 = fma(_2133, _2035, _2153);
    bool _2161 = _1594 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2163 = isnan(_1594);
    bool _2165 = _2161 || _2163;
    bool _2167 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2169 = _2165 || _2167;
    float _2171 = fma(_1692, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1857);
    float _2173 = _1750 + _1718;
    out.m_87.x = _2155;
    out.m_87.y = _2135;
    out.m_87.z = _2159;
    float _2175 = _2171 + _1718;
    float _2177 = _2173 * 0.5;
    out.gl_Position.x = _1750;
    out.gl_Position.y = _1764;
    out.gl_Position.z = _2171;
    out.gl_Position.w = _1718;
    float _2179 = _2175 * 0.5;
    float _2181 = _2131;
    float _2183 = _1718;
    float _2185 = _2179;
    float _2187 = _2149;
    float _2189 = _2177;
    if (!_2169)
    {
        _2181 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2191 = _2181;
    out.m_89.x = _2177;
    out.m_89.y = _2149;
    out.m_89.z = _2179;
    out.m_89.w = _1718;
    float _2193 = _1448 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2195 = _2191;
    float _2197 = _2191;
    if (!_2169)
    {
        _2183 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2199 = _2183;
    float _2201 = _2199;
    float _2203 = _2199;
    if (!_2169)
    {
        _2185 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2205 = _2185;
    float _2207 = _2205;
    float _2209 = _2205;
    if (!_2169)
    {
        _2187 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2211 = _2187;
    float _2213 = _2211;
    float _2215 = _2211;
    if (!_2169)
    {
        _2189 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2217 = _2189;
    float _2219 = -_1760;
    float _2221 = _2219 + 1.0;
    float _2223 = _2221 * _2157;
    float _2225 = precise::clamp(_2223, 0.0, 1.0);
    float _2227 = -_2225;
    float _2229 = fma(_2227, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2231 = _2229 * _2141;
    float _2233 = _2019 * _1778;
    float _2235 = -_2019;
    float _2237 = _2235 + 1.0;
    float _2239 = _2231 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2241 = _1793 * _2233;
    float _2243 = _1793 * _2237;
    out.m_91.x = _2239;
    float _2245 = _1803 * _2233;
    float _2247 = fma(_1799, _2241, _1787);
    float _2249 = fma(_1801, _2241, _1789);
    float _2251 = _2241;
    float _2253 = _2217;
    float _2255 = _2217;
    if (!_2169)
    {
        _2251 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2257 = _2251;
    float _2259 = fma(_1793, _2245, _1791);
    out.m_93.x = _2247;
    out.m_93.y = _2249;
    out.m_93.z = _2259;
    out.m_93.w = _2243;
    bool _2261 = !_2169;
    float _2263 = _2257;
    float _2265 = _2257;
    if (!_2261)
    {
        bool _2267 = _1594 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2269 = isnan(_1594);
        bool _2271 = _2267 || _2269;
        bool _2273 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2275 = _2271 || _2273;
        if (!_2275)
        {
            float _2277 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2279 = _1594 + _2277;
            float _2281 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2283 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2281;
            float _2285 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2287 = _2285 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2289 = 1.0 / _2283;
            float _2291 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2293 = _2291 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2295 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2297 = _2295 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2299 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2301 = _2299 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2303 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2305 = _2303 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2307 = _2279 * _2289;
            float _2309 = precise::clamp(_2307, 0.0, 1.0);
            float _2311 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2313 = _2311 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2315 = fma(_2309, _2287, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2317 = fma(_2309, _2313, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2319 = fma(_2309, _2293, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2321 = fma(_2309, _2297, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2323 = fma(_2309, _2301, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2325 = fma(_2309, _2305, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2265 = _2319;
            _2215 = _2323;
            _2197 = _2315;
            _2209 = _2321;
            _2203 = _2317;
            _2255 = _2325;
            _2327 = true;
        }
        else
        {
            bool _2329 = _1594 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2331 = isnan(_1594);
            bool _2333 = _2329 || _2331;
            bool _2335 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2337 = _2333 || _2335;
            if (!_2337)
            {
                _2195 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2339 = _2195;
            _2197 = _2339;
            if (!_2337)
            {
                _2263 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2341 = _2263;
            _2265 = _2341;
            if (!_2337)
            {
                _2201 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2343 = _2201;
            _2203 = _2343;
            if (!_2337)
            {
                _2207 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2345 = _2207;
            _2209 = _2345;
            if (!_2337)
            {
                _2213 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2347 = _2213;
            _2215 = _2347;
            if (!_2337)
            {
                _2253 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2349 = _2253;
            bool _2351 = !_2337;
            _2255 = _2349;
            if (!_2351)
            {
                bool _2353 = _1594 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2355 = isnan(_1594);
                bool _2357 = _2353 || _2355;
                bool _2359 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2361 = _2357 || _2359;
                if (!_2361)
                {
                    float _2363 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2365 = _1594 + _2363;
                    float _2367 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2369 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2367;
                    float _2371 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2373 = _2371 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2375 = 1.0 / _2369;
                    float _2377 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2379 = _2377 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2381 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2383 = _2381 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2385 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2387 = _2385 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2389 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2391 = _2389 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2393 = _2365 * _2375;
                    float _2395 = precise::clamp(_2393, 0.0, 1.0);
                    float _2397 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2399 = _2397 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2401 = fma(_2395, _2373, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2403 = fma(_2395, _2399, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2405 = fma(_2395, _2379, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2407 = fma(_2395, _2383, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2409 = fma(_2395, _2387, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2411 = fma(_2395, _2391, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2265 = _2405;
                    _2215 = _2409;
                    _2197 = _2401;
                    _2209 = _2407;
                    _2203 = _2403;
                    _2255 = _2411;
                    _2327 = true;
                }
                else
                {
                    _2265 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2215 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2197 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2209 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2203 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2255 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2327 = false;
    float _2413 = _2265;
    float _2415 = _2215;
    float _2417 = _2197;
    float _2419 = _2209;
    float _2421 = _2203;
    float _2423 = _2255;
    float _2425 = fma(_2135, -0.5, 0.5);
    float _2427 = precise::clamp(_2425, 0.0, 1.0);
    float _2429 = -_2413;
    float _2431 = _2429 + _2415;
    float _2433 = _2193 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2435 = -_2417;
    float _2437 = _2435 + _2419;
    float _2439 = fma(_2427, _2431, _2413);
    out.m_95.x = 0.0;
    float _2441 = -_2421;
    float _2443 = _2441 + _2423;
    float _2445 = fma(_2427, _2437, _2417);
    float _2447 = _2439 * 0.586610972881317138671875;
    out.m_49.x = _2433;
    bool _2449 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2451 = fma(_2427, _2443, _2421);
    float _2453 = fma(_2445, 0.298911988735198974609375, _2447);
    bool _2455 = _1448 > 0.0;
    bool _2457 = isnan(_1448);
    bool _2459 = _2455 || _2457;
    bool _2461 = isnan(0.0);
    bool _2463 = _2459 || _2461;
    float _2465 = fma(_2451, 0.114477999508380889892578125, _2453);
    float _2467 = -_2465;
    float _2469 = _2445 + _2467;
    float _2471 = -_2465;
    float _2473 = _2439 + _2471;
    float _2475 = -_2465;
    float _2477 = _2451 + _2475;
    float _2479 = fma(_2469, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2465);
    float _2481 = fma(_2473, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2465);
    float _2483 = fma(_2477, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2465);
    bool _2485 = !_2449;
    if (!_2485)
    {
        float _2487 = -_1394;
        float _2489 = _2487 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2491 = -_1396;
        float _2493 = _2491 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2495 = -_1398;
        float _2497 = _2495 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2499 = _2489 * _2489;
        float _2501 = fma(_2493, _2493, _2499);
        float _2503 = fma(_2497, _2497, _2501);
        float _2505 = sqrt(_2503);
        float _2507 = rsqrt(_2503);
        float _2509 = -_2505;
        float _2511 = _2509 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2513 = _2511 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2515 = precise::clamp(_2513, 0.0, 1.0);
        float _2517 = _2493 * _2507;
        float _2519 = _2489 * _2507;
        float _2521 = abs(_2515);
        float _2523 = log2(_2521);
        float _2525 = _2497 * _2507;
        float _2527 = _2517 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2529 = _2135 * _2519;
        float _2531 = -_2519;
        float _2533 = -_2527;
        float _2535 = fma(_2531, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2533);
        float _2537 = fma(_2155, _2517, _2529);
        float _2539 = -_2525;
        float _2541 = fma(_2539, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2535);
        float _2543 = fma(_2159, _2525, _2537);
        float _2545 = precise::clamp(_2543, 0.0, 1.0);
        float _2547 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2549 = _2541 + _2547;
        float _2551 = _2523 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2553 = _2549 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2555 = precise::clamp(_2553, 0.0, 1.0);
        float _2557 = exp2(_2551);
        float _2559 = _2557 * _2555;
        float _2561 = _2545 * _2559;
        float _2563 = _2561 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2565 = _2561 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2567 = _2561 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_95.x = _2563;
        out.m_95.y = _2565;
        out.m_95.z = _2567;
    }
    out.m_71.x = _2479;
    out.m_71.y = _2481;
    out.m_71.z = _2483;
    if (_2463)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_49.x = 0.0;
    float _2569 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2569;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2327 = false;
    bool _542 = false;
    bool _400 = false;
    bool _220 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _109 = in.m_46.w;
    float _111 = trunc(_109);
    int _114 = int(_111);
    bool _118 = _114 >= 1;
    float _120 = 0.0;
    if (!_118)
    {
        _120 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _122 = _120;
    float _124 = _122;
    if (!_118)
    {
        out.m_49.x = 0.0;
    }
    int _126 = 0;
    if (!_118)
    {
        float _128 = _122 * 5.0;
        _126 = as_type<int>(_128);
    }
    int _130 = _126;
    if (!_118)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2625 = as_type<float>(_130);
        out.gl_Position.z = _2625;
    }
    if (!_118)
    {
        return out;
    }
    float _132 = in.m_51.w;
    bool _134 = _132 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _136 = isnan(_132);
    bool _138 = _134 || _136;
    bool _140 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _142 = _138 || _140;
    float _144 = -_132;
    float _146 = _144 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _148 = 0.0;
    float _150 = _146;
    if (_142)
    {
        float _152 = float(_114);
        _148 = _152;
    }
    float _154 = _148;
    bool _156 = _146 >= _154;
    bool _158 = !_142;
    bool _160 = _156 || _158;
    if (_160)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _162 = _124;
    if (_160)
    {
        out.m_49.x = 0.0;
    }
    int _164 = 0;
    if (_160)
    {
        float _166 = _162 * 5.0;
        _164 = as_type<int>(_166);
    }
    int _168 = _164;
    if (_160)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2694 = as_type<float>(_168);
        out.gl_Position.z = _2694;
    }
    if (_160)
    {
        return out;
    }
    float _170 = in.m_53.x;
    float _172 = in.m_53.y;
    float _174 = in.m_53.z;
    bool _176 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _178 = _172 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _180 = _172 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _182 = _172 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _184 = fma(_170, (*spvDescriptorSet0.vp_c10)._m0[4].x, _178);
    float _186 = fma(_170, (*spvDescriptorSet0.vp_c10)._m0[5].x, _180);
    float _188 = fma(_170, (*spvDescriptorSet0.vp_c10)._m0[6].x, _182);
    float _190 = fma(_174, (*spvDescriptorSet0.vp_c10)._m0[4].z, _184);
    float _192 = fma(_174, (*spvDescriptorSet0.vp_c10)._m0[5].z, _186);
    float _194 = fma(_174, (*spvDescriptorSet0.vp_c10)._m0[6].z, _188);
    bool _196 = !_176;
    float _198 = _192;
    float _200 = _190;
    float _218;
    if (!_196)
    {
        float _202 = in.m_55.x;
        float _204 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _206 = _202 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _208 = fma(_206, (*spvDescriptorSet0.vp_c9)._m0[12].x, _146);
        float _210 = _208 * _204;
        float _212 = floor(_210);
        float _214 = -_212;
        float _216 = _210 + _214;
        _218 = _216;
        _220 = true;
    }
    else
    {
        float _222 = float(_114);
        float _224 = 1.0 / _222;
        float _226 = _146 * _224;
        _218 = _226;
    }
    _220 = false;
    float _228 = _218;
    float _230 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _232 = _228 + _230;
    bool _234 = _228 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _236 = isnan(_228);
    bool _238 = _234 || _236;
    bool _240 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _242 = _238 || _240;
    float _244 = float(_242);
    float _246 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _248 = _228 + _246;
    bool _250 = _228 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _252 = isnan(_228);
    bool _254 = _250 || _252;
    bool _256 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _258 = _254 || _256;
    float _260 = float(_258);
    float _262 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _264 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _262;
    float _266 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _268 = _266 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _270 = _228 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _272 = isnan(_228);
    bool _274 = _270 || _272;
    bool _276 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _278 = _274 || _276;
    float _280 = float(_278);
    float _282 = -_244;
    float _284 = _282 + 1.0;
    float _286 = 1.0 / _268;
    float _288 = _280 * _284;
    float _290 = -_280;
    float _292 = _290 + 1.0;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _296 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _294;
    bool _298 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _300 = 1.0 / _264;
    float _302 = _260 * _292;
    float _304 = -_260;
    float _306 = _304 + 1.0;
    float _308 = _248 * _286;
    float _310 = _232 * _300;
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _314 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _312;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _318 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _316;
    float _320 = fma(_296, _310, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _322 = fma(_314, _310, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _324 = fma(_318, _310, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _326 = in.m_57.x;
    float _328 = in.m_57.y;
    float _330 = in.m_57.z;
    float _332 = _320 * _302;
    float _334 = _322 * _302;
    float _336 = _324 * _302;
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _340 = _338 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _344 = _342 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _348 = _346 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _350 = fma(_306, (*spvDescriptorSet0.vp_c9)._m0[143].x, _332);
    float _352 = fma(_340, _308, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _354 = fma(_344, _308, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _356 = fma(_306, (*spvDescriptorSet0.vp_c9)._m0[143].y, _334);
    float _358 = fma(_348, _308, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _360 = fma(_306, (*spvDescriptorSet0.vp_c9)._m0[143].z, _336);
    float _362 = fma(_352, _288, _350);
    float _364 = fma(_354, _288, _356);
    float _366 = fma(_358, _288, _360);
    float _368 = fma(_244, (*spvDescriptorSet0.vp_c9)._m0[145].x, _362);
    float _370 = fma(_244, (*spvDescriptorSet0.vp_c9)._m0[145].y, _364);
    float _372 = fma(_244, (*spvDescriptorSet0.vp_c9)._m0[145].z, _366);
    float _374 = _368 * _326;
    float _376 = _370 * _328;
    float _378 = _372 * _330;
    bool _380 = !_298;
    float _398;
    if (!_380)
    {
        float _382 = in.m_55.x;
        float _384 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _386 = _382 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _388 = fma(_386, (*spvDescriptorSet0.vp_c9)._m0[11].y, _146);
        float _390 = _388 * _384;
        float _392 = floor(_390);
        float _394 = -_392;
        float _396 = _390 + _394;
        _398 = _396;
        _400 = true;
    }
    else
    {
        float _402 = float(_114);
        float _404 = 1.0 / _402;
        float _406 = _146 * _404;
        _398 = _406;
    }
    _400 = false;
    float _408 = _398;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _412 = _408 + _410;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _416 = _414 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _418 = _408 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _420 = isnan(_408);
    bool _422 = _418 || _420;
    bool _424 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _426 = _422 || _424;
    float _428 = float(_426);
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _432 = _430 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _434 = _408 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _436 = isnan(_408);
    bool _438 = _434 || _436;
    bool _440 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _442 = _438 || _440;
    float _444 = float(_442);
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _448 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _446;
    bool _450 = _408 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _452 = isnan(_408);
    bool _454 = _450 || _452;
    bool _456 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _458 = _454 || _456;
    float _460 = float(_458);
    float _462 = 1.0 / _416;
    float _464 = -_428;
    float _466 = _464 + 1.0;
    bool _468 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _470 = _444 * _466;
    float _472 = -_444;
    float _474 = _472 + 1.0;
    float _476 = 1.0 / _432;
    float _478 = _448 * _462;
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _482 = _480 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _484 = fma(_478, _412, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _486 = _482 * _476;
    float _488 = _484 * _470;
    float _490 = -_460;
    float _492 = _490 + 1.0;
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _496 = _408 + _494;
    float _498 = fma(_474, (*spvDescriptorSet0.vp_c9)._m0[115].x, _488);
    float _500 = _428 * _492;
    float _502 = fma(_486, _496, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _504 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _506 = fma(_502, _500, _498);
    float _508 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _510 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _512 = fma(_460, (*spvDescriptorSet0.vp_c9)._m0[117].x, _506);
    float _514 = _504 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _516 = _508 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _518 = _510 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _520 = _512 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_59.x = _514;
    out.m_59.y = _516;
    out.m_59.z = _518;
    out.m_59.w = _520;
    bool _522 = !_468;
    float _540;
    if (!_522)
    {
        float _524 = in.m_55.x;
        float _526 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _528 = _524 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _530 = fma(_528, (*spvDescriptorSet0.vp_c9)._m0[11].w, _146);
        float _532 = _530 * _526;
        float _534 = floor(_532);
        float _536 = -_534;
        float _538 = _532 + _536;
        _540 = _538;
        _542 = true;
    }
    else
    {
        float _544 = float(_114);
        float _546 = 1.0 / _544;
        float _548 = _146 * _546;
        _540 = _548;
    }
    _542 = false;
    float _550 = _540;
    float _552 = in.m_55.x;
    float _554 = in.m_55.y;
    float _556 = in.m_55.z;
    float _558 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _560 = log2(_558);
    float _562 = _374 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _564 = in.m_46.x;
    float _566 = in.m_46.y;
    float _568 = in.m_46.z;
    float _570 = _376 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _572 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _574 = _572 != 0;
    int _576 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _578 = _576 != 0;
    int _580 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _582 = _580 != 0;
    float _584 = _378 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _586 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _588 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _590 = isnan(1.0);
    bool _592 = _588 || _590;
    bool _594 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _596 = _592 || _594;
    float _598 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _600 = 1.0 + _598;
    float _602 = _560 * _146;
    float _604 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _606 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _608 = isnan(0.0);
    bool _610 = _606 || _608;
    bool _612 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _614 = _610 || _612;
    float _616 = 1.0 / _600;
    float _618 = _556 * 2.0;
    float _620 = _552 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _622 = _552 * 2.0;
    float _624 = _554 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _626 = floor(_618);
    float _628 = -_586;
    float _630 = fma(_620, 2.0, _628);
    float _632 = _566 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _634 = _554 + _556;
    float _636 = fma(_624, -2.0, _604);
    float _638 = _556 + _552;
    float _640 = fma(_564, (*spvDescriptorSet0.vp_c10)._m0[4].x, _632);
    float _642 = _634 + (-1.0);
    float _644 = exp2(_602);
    float _646 = _638 + (-1.0);
    float _648 = -_146;
    float _650 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[76].x, _630);
    float _652 = fma(_642, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _654 = fma(_646, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _656 = floor(_622);
    float _658 = _566 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _660 = _566 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _662 = _626 > 0.0;
    float _664 = fma(_564, (*spvDescriptorSet0.vp_c10)._m0[5].x, _658);
    float _666 = fma(_564, (*spvDescriptorSet0.vp_c10)._m0[6].x, _660);
    bool _668 = _626 >= 0.0;
    bool _670 = isnan(_626);
    bool _672 = _668 || _670;
    bool _674 = isnan(0.0);
    bool _676 = _672 || _674;
    float _678 = _554 * 2.0;
    float _680 = -_644;
    float _682 = _680 + 1.0;
    float _684 = floor(_678);
    float _686 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _688 = _614 ? _682 : 0.0;
    float _690 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _692 = _656 > 0.0;
    float _694 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _696 = fma(_556, (*spvDescriptorSet0.vp_c9)._m0[79].z, _686);
    float _698 = fma(_552, (*spvDescriptorSet0.vp_c9)._m0[78].z, _690);
    float _700 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[76].y, _636);
    float _702 = fma(_554, (*spvDescriptorSet0.vp_c9)._m0[78].w, _694);
    float _704 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[79].x, _696);
    float _706 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[77].z, _698);
    int _708 = _676 ? 0 : 1;
    float _710 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[77].w, _702);
    if (_596)
    {
        float _712 = _688 * _616;
        _150 = _712;
    }
    float _714 = _150;
    bool _716 = _656 >= 0.0;
    bool _718 = isnan(_656);
    bool _720 = _716 || _718;
    bool _722 = isnan(0.0);
    bool _724 = _720 || _722;
    float _726 = fma(_568, (*spvDescriptorSet0.vp_c10)._m0[5].z, _664);
    bool _728 = !_578;
    int _730 = _728 ? 0 : 1;
    float _732 = fma(_568, (*spvDescriptorSet0.vp_c10)._m0[4].z, _640);
    int _734 = _724 ? 0 : 1;
    float _736 = _726 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _738 = !_574;
    int _740 = _738 ? 0 : 1;
    float _742 = fma(_568, (*spvDescriptorSet0.vp_c10)._m0[6].z, _666);
    bool _744 = _684 > 0.0;
    float _746 = _732 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _748 = _684 >= 0.0;
    bool _750 = isnan(_684);
    bool _752 = _748 || _750;
    bool _754 = isnan(0.0);
    bool _756 = _752 || _754;
    float _758 = _742 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _760 = ~_708;
    int _762 = _760 + 1;
    int _764 = _762 + 1;
    float _766 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _768 = _746 + _766;
    int _770 = _764;
    if (!_662)
    {
        int _772 = ~_708;
        int _774 = _772 + 1;
        _770 = _774;
    }
    int _776 = _770;
    float _778 = _556 + (-0.5);
    int _780 = abs(_730);
    float _782 = in.m_61.x;
    float _784 = in.m_61.y;
    float _786 = in.m_61.z;
    int _788 = abs(_740);
    float _790 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _792 = _736 + _790;
    int _794 = ~_734;
    int _796 = _794 + 1;
    int _798 = _796 + 1;
    int _800 = _798;
    if (!_692)
    {
        int _802 = ~_734;
        int _804 = _802 + 1;
        _800 = _804;
    }
    int _806 = _800;
    float _808 = _792 * _792;
    float _810 = float(_780);
    float _812 = float(_806);
    float _814 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _816 = _758 + _814;
    float _818 = fma(_768, _768, _808);
    int _820 = _756 ? 0 : 1;
    float _822 = _810 * _812;
    float _824 = float(_788);
    float _826 = fma(_816, _816, _818);
    int _828 = ~_820;
    int _830 = _828 + 1;
    int _832 = _830 + 1;
    int _834 = _832;
    if (!_744)
    {
        int _836 = ~_820;
        int _838 = _836 + 1;
        _834 = _838;
    }
    int _840 = _834;
    float _842 = sqrt(_826);
    float _844 = float(_776);
    float _846 = _822 * (-2.0);
    bool _848 = !_582;
    int _850 = _848 ? 0 : 1;
    float _852 = _554 + (-0.5);
    float _854 = fma(_846, _784, _784);
    int _856 = abs(_850);
    float _858 = _824 * _844;
    float _860 = fma(_652, _846, _652);
    float _862 = fma(_852, (*spvDescriptorSet0.vp_c9)._m0[196].y, _854);
    float _864 = rsqrt(_826);
    float _866 = _554 + _552;
    float _868 = float(_840);
    float _870 = _562 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _872 = float(_856);
    float _874 = _842 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _876 = _866 + (-1.0);
    float _878 = _858 * (-2.0);
    float _880 = fma(_860, _714, _862);
    float _882 = _872 * _868;
    float _884 = precise::min(_870, _874);
    float _886 = fma(_876, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _888 = _552 + (-0.5);
    float _890 = fma(_878, _782, _782);
    float _892 = _880 * 0.15915493667125701904296875;
    float _894 = _882 * (-2.0);
    float _896 = fma(_886, _878, _886);
    float _898 = fma(_888, (*spvDescriptorSet0.vp_c9)._m0[196].x, _890);
    float _900 = _864 * _884;
    float _902 = fma(_654, _894, _654);
    float _904 = fma(_894, _786, _786);
    float _906 = fma(_896, _714, _898);
    float _908 = _792 * _900;
    float _910 = _768 * _900;
    float _912 = fma(_778, (*spvDescriptorSet0.vp_c9)._m0[196].z, _904);
    float _914 = _906 * 0.15915493667125701904296875;
    float _916 = -_908;
    float _918 = _792 + _916;
    float _920 = -_910;
    float _922 = _768 + _920;
    float _924 = fma(_902, _714, _912);
    float _926 = _816 * _900;
    float _928 = _918 * _918;
    float _930 = _892 * 6.283185482025146484375;
    float _932 = sin(_930);
    float _934 = _924 * 0.15915493667125701904296875;
    float _936 = -_926;
    float _938 = _816 + _936;
    float _940 = fma(_922, _922, _928);
    float _942 = in.m_63.x;
    float _944 = in.m_63.y;
    float _946 = in.m_63.z;
    float _948 = fma(_938, _938, _940);
    float _950 = _892 * 6.283185482025146484375;
    float _952 = cos(_950);
    float _954 = sqrt(_948);
    float _956 = _914 * 6.283185482025146484375;
    float _958 = cos(_956);
    float _960 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _944);
    float _962 = _914 * 6.283185482025146484375;
    float _964 = sin(_962);
    float _966 = _864 * _954;
    float _968 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _942);
    float _970 = _570 * _966;
    float _972 = _562 * _966;
    float _974 = _584 * _966;
    float _976 = _934 * 6.283185482025146484375;
    float _978 = cos(_976);
    float _980 = _958 * _952;
    float _982 = _958 * _932;
    float _984 = _970 * _960;
    float _986 = _972 * _968;
    float _988 = _934 * 6.283185482025146484375;
    float _990 = sin(_988);
    float _992 = _964 * _932;
    float _994 = _964 * _952;
    float _996 = _958 * _978;
    float _998 = _964 * _978;
    float _1000 = _952 * _978;
    float _1002 = _932 * _978;
    float _1004 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _946);
    float _1006 = _996 * _984;
    float _1008 = fma(_990, _980, _992);
    float _1010 = _974 * _1004;
    float _1012 = -_994;
    float _1014 = fma(_990, _982, _1012);
    float _1016 = -_984;
    float _1018 = _990 * _1016;
    float _1020 = fma(_1008, _986, _1006);
    float _1022 = -_982;
    float _1024 = fma(_990, _994, _1022);
    float _1026 = _998 * _984;
    float _1028 = fma(_1000, _986, _1018);
    float _1030 = fma(_1014, _1010, _1020);
    float _1032 = fma(_990, _992, _980);
    float _1034 = fma(_1024, _986, _1026);
    float _1036 = fma(_1002, _1010, _1028);
    float _1038 = _1030 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1040 = _1030 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1042 = fma(_1032, _1010, _1034);
    float _1044 = fma(_1036, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1038);
    float _1046 = fma(_1036, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1040);
    float _1048 = fma(_1042, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1044);
    float _1050 = fma(_1042, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1046);
    float _1052 = _1048 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1054 = _1050 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1056 = _758 + _1052;
    float _1058 = _746 + _1054;
    float _1060 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1062 = _1056 + _1060;
    float _1064 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1066 = _1058 + _1064;
    float _1068 = _1062 * _1062;
    float _1070 = fma(_1066, _1066, _1068);
    float _1072 = _1030 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1074 = -_926;
    float _1076 = _758 + _1074;
    float _1078 = sqrt(_1070);
    float _1080 = fma(_1036, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1072);
    float _1082 = -_908;
    float _1084 = _736 + _1082;
    float _1086 = -_910;
    float _1088 = _746 + _1086;
    float _1090 = fma(_1042, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1080);
    float _1092 = _1084 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1094 = _1090 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1096 = fma(_1088, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1092);
    float _1098 = _736 + _1094;
    float _1100 = fma(_1076, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1096);
    bool _1102 = _1078 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1104 = _1090;
    float _1106 = _1094;
    float _1108 = _1058;
    float _1110 = _1070;
    if (!_1102)
    {
        _1104 = _1058;
    }
    float _1112 = _1104;
    float _1114 = _1112;
    if (!_1102)
    {
        _1106 = _1056;
    }
    float _1116 = _1106;
    float _1118 = _1116;
    if (!_1102)
    {
        _1108 = _1098;
    }
    float _1120 = _1108;
    bool _1122 = !_1102;
    float _1124 = _1120;
    if (!_1122)
    {
        float _1126 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1128 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1130 = _1078 + _1128;
        float _1132 = _1098 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1134 = rsqrt(_1070);
        float _1136 = _1130 * _1126;
        float _1138 = _1136 * 0.15915493667125701904296875;
        float _1140 = _1138 * 6.283185482025146484375;
        float _1142 = cos(_1140);
        float _1144 = _1138 * 6.283185482025146484375;
        float _1146 = sin(_1144);
        float _1148 = _1142 + (-1.0);
        float _1150 = _1148 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1152 = fma(_1146, _1132, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1154 = fma(_1098, _1142, _1150);
        float _1156 = _1134 * _1152;
        float _1158 = fma(_1066, _1156, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1160 = fma(_1062, _1156, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1124 = _1154;
        _1114 = _1158;
        _1118 = _1160;
    }
    float _1162 = _1124;
    float _1164 = _1114;
    float _1166 = _1118;
    float _1168 = -_736;
    float _1170 = _1168 + _1162;
    float _1172 = -_746;
    float _1174 = _1172 + _1164;
    float _1176 = _1100 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1178 = -_758;
    float _1180 = _1178 + _1166;
    float _1182 = _1170 * _1170;
    float _1184 = 1.0 / _1176;
    float _1186 = -_926;
    float _1188 = _1186 + _1166;
    float _1190 = fma(_1174, _1174, _1182);
    float _1192 = _1084 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1194 = -_910;
    float _1196 = _1194 + _1164;
    float _1198 = fma(_1180, _1180, _1190);
    float _1200 = fma(_1088, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1192);
    bool _1202 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1204 = isnan(0.5);
    bool _1206 = _1202 || _1204;
    bool _1208 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1210 = _1206 || _1208;
    float _1212 = -_908;
    float _1214 = _1212 + _1162;
    float _1216 = sqrt(_1198);
    float _1218 = fma(_1076, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1200);
    bool _1220 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1222 = isnan(0.5);
    bool _1224 = _1220 || _1222;
    bool _1226 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1228 = _1224 || _1226;
    float _1230 = _1218 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1232 = _1230 + _1176;
    float _1234 = _1232 * _1184;
    float _1236 = _1234 * 0.5;
    bool _1238 = _1216 > 0.0;
    float _1240 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1242 = fma(_1236, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1240);
    float _1244 = 1.0 / _1242;
    float _1246 = _1216;
    float _1248 = _1196;
    float _1250 = _1214;
    float _1252 = _1170;
    float _1254 = _1242;
    if (!_1238)
    {
        _1246 = _1188;
    }
    float _1256 = _1246;
    bool _1258 = !_1238;
    float _1260 = _1256;
    if (!_1258)
    {
        float _1262 = _192 * _192;
        float _1264 = fma(_190, _190, _1262);
        float _1266 = fma(_194, _194, _1264);
        float _1268 = rsqrt(_1198);
        float _1270 = sqrt(_1266);
        float _1272 = _1174 * _1268;
        float _1274 = _1170 * _1268;
        bool _1276 = _1270 > 0.0;
        float _1278 = _1180 * _1268;
        float _1280 = _1268;
        _1254 = _1278;
        if (!_1276)
        {
            _1280 = _1188;
        }
        float _1282 = _1280;
        bool _1284 = !_1276;
        _1260 = _1282;
        if (!_1284)
        {
            float _1286 = rsqrt(_1266);
            float _1288 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1290 = _192 * _1286;
            float _1292 = _190 * _1286;
            float _1294 = _1274 * _1290;
            float _1296 = _194 * _1286;
            float _1298 = fma(_1272, _1292, _1294);
            float _1300 = _1288 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1302 = fma(_1278, _1296, _1298);
            float _1304 = _1302 * _1300;
            float _1306 = fma(_190, _1304, _1196);
            float _1308 = fma(_192, _1304, _1214);
            float _1310 = fma(_194, _1304, _1188);
            _1248 = _1306;
            _1250 = _1308;
            _1260 = _1310;
            _1252 = _1296;
        }
    }
    float _1312 = _1248;
    float _1314 = _1250;
    float _1316 = _1260;
    float _1318 = _1252;
    float _1320 = _1254;
    float _1322 = _1318;
    float _1324 = _1316;
    float _1326 = _1320;
    if (_1228)
    {
        _1322 = 1.0;
    }
    float _1328 = _1322;
    float _1330 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1332 = _1244 * _1330;
    float _1334 = _1328;
    if (_1210)
    {
        _198 = _1312;
    }
    float _1336 = _198;
    float _1338 = _1336;
    if (_1210)
    {
        _200 = _1314;
    }
    float _1340 = _200;
    float _1342 = _1340;
    if (!_1210)
    {
        float _1344 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1346 = _1084 + _1344;
        float _1348 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1350 = _1088 + _1348;
        float _1352 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1354 = -_1088;
        float _1356 = _1354 + _1312;
        float _1358 = _1346 * _1346;
        float _1360 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1362 = _1076 + _1360;
        float _1364 = -_1084;
        float _1366 = _1364 + _1314;
        float _1368 = fma(_1350, _1350, _1358);
        float _1370 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1372 = fma(_1362, _1362, _1368);
        float _1374 = sqrt(_1372);
        float _1376 = _1352 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1378 = -_1076;
        float _1380 = _1378 + _1316;
        float _1382 = precise::min(_1374, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1384 = _1382 * _1370;
        float _1386 = _1376 * _1384;
        float _1388 = fma(_1356, _1386, _1088);
        float _1390 = fma(_1366, _1386, _1084);
        float _1392 = fma(_1380, _1386, _1076);
        _1342 = _1390;
        _1338 = _1388;
        _1324 = _1392;
    }
    float _1394 = _1342;
    float _1396 = _1338;
    float _1398 = _1324;
    if (!_1228)
    {
        float _1400 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1402 = _1400 * 0.15915493667125701904296875;
        float _1404 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1406 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1408 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1406;
        float _1410 = _1402 * 6.283185482025146484375;
        float _1412 = cos(_1410);
        float _1414 = _1404 * 0.15915493667125701904296875;
        float _1416 = _1402 * 6.283185482025146484375;
        float _1418 = sin(_1416);
        float _1420 = 1.0 / _1412;
        float _1422 = _1414 * 6.283185482025146484375;
        float _1424 = cos(_1422);
        float _1426 = _1418 * _1420;
        float _1428 = _1414 * 6.283185482025146484375;
        float _1430 = sin(_1428);
        float _1432 = _1424 * _1426;
        float _1434 = 1.0 / _1408;
        float _1436 = 1.0 / _1432;
        float _1438 = _1430 * _1436;
        float _1440 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1442 = fma(_1332, _1438, _1440);
        float _1444 = _1442 * _1434;
        float _1446 = precise::clamp(_1444, 0.0, 1.0);
        _1334 = _1446;
    }
    float _1448 = _1334;
    float _1450 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1452 = _1394 + _1450;
    float _1454 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1456 = _1396 + _1454;
    float _1458 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1460 = _1398 + _1458;
    float _1462 = _1452 * _1452;
    float _1464 = fma(_1456, _1456, _1462);
    float _1466 = fma(_1460, _1460, _1464);
    float _1468 = rsqrt(_1466);
    float _1470 = _1468 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1472 = _1456 * _1470;
    float _1474 = _1460 * _1470;
    float _1476 = _1472 * _1472;
    float _1478 = _1474 * _1474;
    float _1480 = _1476 + _1478;
    float _1482 = sqrt(_1480);
    bool _1484 = _1482 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1486 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1488 = _1482 + _1486;
    float _1490 = _1464;
    float _1492 = _1488;
    float _1494 = _1452;
    float _1496 = _1470;
    if (_1484)
    {
        float _1498 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1490 = _1498;
    }
    float _1500 = _1490;
    float _1502 = _1500;
    if (_1484)
    {
        float _1504 = _1488 * _1500;
        _1492 = _1504;
    }
    float _1506 = _1492;
    if (_1484)
    {
        float _1508 = rsqrt(_1480);
        _1502 = _1508;
    }
    float _1510 = _1502;
    float _1512 = _1510;
    if (_1484)
    {
        float _1514 = _1506 * 0.15915493667125701904296875;
        _1326 = _1514;
    }
    float _1516 = _1326;
    float _1518 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1520 = _1468;
    float _1522 = _1516;
    if (_1484)
    {
        float _1524 = _1516 * 6.283185482025146484375;
        float _1526 = sin(_1524);
        _1520 = _1526;
    }
    float _1528 = _1520;
    float _1530 = precise::max(0.0, _1518);
    float _1532 = _1460;
    float _1534 = _1530;
    if (_1484)
    {
        float _1536 = _1516 * 6.283185482025146484375;
        float _1538 = cos(_1536);
        _1532 = _1538;
    }
    float _1540 = _1532;
    float _1542 = -_1470;
    float _1544 = -_1530;
    float _1546 = fma(_1452, _1542, _1544);
    if (_1484)
    {
        float _1548 = _1546 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1494 = _1548;
    }
    float _1550 = _1494;
    float _1552 = _1528;
    float _1554 = _1550;
    if (_1484)
    {
        float _1556 = fma(_1528, _1550, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1552 = _1556;
    }
    float _1558 = _1552;
    if (!_1484)
    {
        _1554 = _1546;
    }
    float _1560 = _1554;
    float _1562 = _1560;
    if (!_1484)
    {
        _1522 = _1474;
    }
    float _1564 = _1522;
    float _1566 = _1564;
    if (_1484)
    {
        float _1568 = _1510 * _1558;
        _1110 = _1568;
    }
    float _1570 = _1110;
    if (!_1484)
    {
        _1512 = _1472;
    }
    float _1572 = _1512;
    float _1574 = _1572;
    float _1576 = _1540;
    if (_1484)
    {
        float _1578 = _1540 + (-1.0);
        _1534 = _1578;
    }
    float _1580 = _1534;
    if (_1484)
    {
        float _1582 = _1472 * _1570;
        _1574 = _1582;
    }
    float _1584 = _1574;
    if (_1484)
    {
        float _1586 = _1474 * _1570;
        _1566 = _1586;
    }
    float _1588 = _1566;
    if (_1484)
    {
        float _1590 = _1580 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1496 = _1590;
    }
    float _1592 = _1496;
    float _1594 = sqrt(_1466);
    float _1596 = _1592;
    if (_1484)
    {
        float _1598 = fma(_1546, _1540, _1592);
        _1562 = _1598;
    }
    float _1600 = _1562;
    if (!_1484)
    {
        _1576 = _1476;
    }
    float _1602 = _1576;
    float _1604 = _1602;
    if (_1484)
    {
        float _1606 = _1584 * _1584;
        _1604 = _1606;
    }
    float _1608 = _1604;
    if (!_1484)
    {
        _1596 = _1478;
    }
    float _1610 = _1596;
    float _1612 = _1610;
    if (_1484)
    {
        float _1614 = _1588 * _1588;
        _1612 = _1614;
    }
    float _1616 = _1612;
    float _1618 = fma(_1088, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1620 = fma(_1600, _1600, _1608);
    float _1622 = _1394 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1624 = floor(_1618);
    float _1626 = _1620 + _1616;
    float _1628 = fma(_1396, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1622);
    float _1630 = _1394 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1632 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1634 = fma(_1594, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1632);
    float _1636 = precise::clamp(_1634, 0.0, 1.0);
    float _1638 = fma(_1398, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1628);
    float _1640 = rsqrt(_1626);
    float _1642 = -_1636;
    float _1644 = _1642 + 1.0;
    float _1646 = fma(_1076, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1648 = _1394 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1650 = _1638 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1652 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1654 = fma(_1396, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1630);
    float _1656 = fma(_1396, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1648);
    float _1658 = abs(_1644);
    float _1660 = log2(_1658);
    float _1662 = _1394 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1664 = _1650 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1666 = fma(_1398, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1656);
    float _1668 = fma(_1398, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1654);
    float _1670 = fma(_1396, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1662);
    float _1672 = -_1664;
    float _1674 = fma(_1672, _1652, 1.0);
    float _1676 = _1666 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1678 = _1640 * _1584;
    float _1680 = fma(_1398, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1670);
    float _1682 = _1640 * _1600;
    float _1684 = _1640 * _1588;
    float _1686 = _1678 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1688 = _1680 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1690 = floor(_1646);
    float _1692 = _1668 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1694 = -_1686;
    float _1696 = fma(_1682, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1694);
    float _1698 = _1688 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1700 = _1660 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1702 = -_1684;
    float _1704 = fma(_1702, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1696);
    float _1706 = fma(_1676, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1698);
    float _1708 = exp2(_1700);
    float _1710 = -_1624;
    float _1712 = _1618 + _1710;
    float _1714 = fma(_1704, -0.5, 0.5);
    float _1716 = fma(_1650, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1706);
    float _1718 = fma(_1692, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1716);
    float _1720 = log2(_1674);
    float _1722 = _1688 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1724 = fma(_1704, 0.5, 0.5);
    float _1726 = -_1690;
    float _1728 = _1646 + _1726;
    float _1730 = _1682 + 1.0;
    float _1732 = fma(_1676, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1722);
    float _1734 = fma(_1724, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1736 = 1.0 / _1718;
    float _1738 = _1688 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1740 = fma(_1650, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1732);
    float _1742 = fma(_1724, _1734, -0.212114393711090087890625);
    float _1744 = -_1682;
    float _1746 = fma(_1708, _1730, _1744);
    float _1748 = fma(_1676, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1738);
    float _1750 = fma(_1692, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1740);
    float _1752 = fma(_1724, _1742, 1.570728778839111328125);
    float _1754 = sqrt(_1714);
    float _1756 = fma(_1650, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1748);
    float _1758 = _1720 * 0.693147182464599609375;
    float2 _5210 = float2(_1712, _1728);
    float _1760 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5210, float2(0.0), isnan(_5210)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5210, float2(0.0), isnan(_5210)), level(0.0)).x;
    float _1762 = fma(_1746, 0.5, 0.5);
    float _1764 = fma(_1692, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1756);
    float _1766 = _1758 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1768 = _1750 * _1736;
    float _1770 = _1764 * _1736;
    float _1772 = fma(_1768, 0.5, 0.5);
    float _1774 = fma(_1770, -0.5, 0.5);
    float _1776 = _1754 * 0.636619746685028076171875;
    float3 _5245 = float3(_1772, _1774, _1766);
    float _1778 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5245, float3(0.0), isnan(_5245)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5245, float3(0.0), isnan(_5245)), level(0.0)).x;
    float _1780 = -_1752;
    float _1782 = fma(_1776, _1780, 1.0);
    float3 _5261 = float3(_1772, _1774, _1766);
    float4 _1785 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5261, float3(0.0), isnan(_5261)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5261, float3(0.0), isnan(_5261)), level(0.0)).xyzw;
    float _1787 = _1785.x;
    float _1789 = _1785.y;
    float _1791 = _1785.z;
    float _1793 = _1785.w;
    float2 _5277 = float2(_1782, _1762);
    float3 _1797 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5277, float2(0.0), isnan(_5277)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5277, float2(0.0), isnan(_5277)), level(0.0)).xyz;
    float _1799 = _1797.x;
    float _1801 = _1797.y;
    float _1803 = _1797.z;
    float _1805 = in.m_65.x;
    float _1807 = _1660 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1809 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1811 = _1809 != 0;
    float _1813 = in.m_65.y;
    bool _1815 = _554 > 0.5;
    float _1817 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1819 = _1817 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1821 = in.m_67.z;
    float _1823 = in.m_67.y;
    float _1825 = 1.0 / _1819;
    float _1827 = _704 * (-0.15915493667125701904296875);
    float _1829 = 0.0;
    float _1831 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    if (_1811)
    {
        float _1833 = in.m_55.x;
        _1829 = _1833;
    }
    float _1835 = _1829;
    int _1837 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1839 = _1837 != 0;
    float _1841 = _1688 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1843 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1845 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1843;
    float _1847 = in.m_67.w;
    float _1849 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1851 = fma(_1676, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1841);
    float _1853 = _1805;
    if (_1811)
    {
        _1831 = _1805;
    }
    float _1855 = _1831;
    out.m_69.x = _1088;
    out.m_69.y = _1084;
    out.m_69.z = _1076;
    float _1857 = fma(_1650, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1851);
    float _1859 = -_1813;
    float _1861 = _1859 + 1.0;
    float _1863 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    out.m_71.w = _884;
    float _1865 = _1813;
    float _1867 = _1855;
    if (_1839)
    {
        float _1869 = _1815 ? _1861 : _1813;
        _1865 = _1869;
    }
    float _1871 = _1865;
    out.m_73.z = _1821;
    float _1873 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1875 = _550 + _1873;
    bool _1877 = _944 != 0.0;
    bool _1879 = isnan(_944);
    bool _1881 = _1877 || _1879;
    bool _1883 = isnan(0.0);
    bool _1885 = _1881 || _1883;
    float _1887 = _1827 * 6.283185482025146484375;
    float _1889 = sin(_1887);
    out.m_73.y = _1823;
    float _1891 = _1014 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _1893 = _1835 > 0.5;
    bool _1895 = _1893 && _1811;
    float _1897 = _1845 * _1825;
    bool _1899 = _550 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1901 = isnan(_550);
    bool _1903 = _1899 || _1901;
    bool _1905 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1907 = _1903 || _1905;
    float _1909 = float(_1907);
    float _1911 = _1849 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1913 = _1827 * 6.283185482025146484375;
    float _1915 = cos(_1913);
    bool _1917 = _550 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1919 = isnan(_550);
    bool _1921 = _1917 || _1919;
    bool _1923 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1925 = _1921 || _1923;
    float _1927 = float(_1925);
    float _1929 = _1863 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1931 = -_1909;
    float _1933 = _1931 + 1.0;
    float _1935 = fma(_1897, _1875, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    out.m_73.w = _1847;
    bool _1937 = _942 == 0.0;
    bool _1939 = !_1885;
    bool _1941 = _1937 && _1939;
    float _1943 = _1927 * _1933;
    float _1945 = -_1927;
    float _1947 = _1945 + 1.0;
    if (_1895)
    {
        float _1949 = -_1855;
        float _1951 = _1949 + 1.0;
        _1867 = _1951;
    }
    float _1953 = _1867;
    bool _1955 = _946 == 0.0;
    bool _1957 = _1955 && _1941;
    float _1959 = _1935 * _1943;
    float _1961 = fma(_1002, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1891);
    float _1963 = exp2(_1807);
    if (_1811)
    {
        _1853 = _1953;
    }
    float _1965 = _1853;
    float _1967 = fma(_1911, _1871, -0.5);
    float _1969 = fma(_1947, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1959);
    float _1971 = in.m_67.x;
    float _1973 = _1889 * _1967;
    float _1975 = fma(_1929, _1965, -0.5);
    float _1977 = _1915 * _1967;
    float _1979 = in.m_75.x;
    float _1981 = in.m_75.y;
    float _1983 = in.m_75.z;
    float _1985 = fma(_1909, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1969);
    float _1987 = -_1973;
    float _1989 = fma(_1915, _1975, _1987);
    float _1991 = fma(_1889, _1975, _1977);
    out.m_77.x = _972;
    float _1993 = fma(_706, _1989, _650);
    float _1995 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1997 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1999 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2001 = -_700;
    float _2003 = fma(_710, _1991, _2001);
    float _2005 = -_1963;
    float _2007 = _2005 + 1.0;
    float _2009 = _1985 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2011 = _1999 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2013 = _1993 + 0.5;
    float _2015 = abs(_1332);
    float _2017 = log2(_2015);
    float _2019 = _2007 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2021 = _2003 + 0.5;
    float _2023 = _1995 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2025 = _1997 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_73.x = _1971;
    float _2027 = _1983;
    float _2029 = _1979;
    float _2031 = _1981;
    if (!_1957)
    {
        float _2033 = fma(_946, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1983);
        _2027 = _2033;
    }
    float _2035 = _2027;
    float _2037 = _996 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    if (!_1957)
    {
        float _2039 = fma(_942, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1979);
        _2029 = _2039;
    }
    float _2041 = _2029;
    float _2043 = _996 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    if (!_1957)
    {
        float _2045 = fma(_944, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1981);
        _2031 = _2045;
    }
    float _2047 = _2031;
    float _2049 = -_990;
    float _2051 = fma(_2049, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2037);
    float _2053 = _996 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2055 = _2017 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2057 = -_990;
    float _2059 = fma(_2057, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2043);
    float _2061 = _1008 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2063 = _1008 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2065 = fma(_998, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2051);
    float _2067 = exp2(_2055);
    float _2069 = fma(_998, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2059);
    float _2071 = -_990;
    float _2073 = fma(_2071, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2053);
    float _2075 = fma(_1000, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2061);
    float _2077 = fma(_1000, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2063);
    float _2079 = _1014 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2081 = _1014 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2083 = fma(_998, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2073);
    float _2085 = _2069 * _2047;
    float _2087 = fma(_1002, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2079);
    float _2089 = fma(_1002, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2081);
    float _2091 = fma(_1024, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2075);
    float _2093 = _2065 * _2047;
    float _2095 = _2083 * _2047;
    float _2097 = fma(_1032, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2089);
    float _2099 = fma(_2091, _2041, _2085);
    float _2101 = fma(_2067, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2103 = precise::clamp(_2101, 0.0, 1.0);
    float _2105 = fma(_1024, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2077);
    bool _2107 = _1332 <= 8000.0;
    bool _2109 = isnan(_1332);
    bool _2111 = _2107 || _2109;
    bool _2113 = isnan(8000.0);
    bool _2115 = _2111 || _2113;
    float _2117 = float(_2115);
    float _2119 = _1008 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2121 = fma(_2103, -2.0, 3.0);
    float _2123 = _2103 * _2103;
    float _2125 = fma(_2105, _2041, _2093);
    float _2127 = fma(_1000, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2119);
    out.m_79.x = _2013;
    out.m_79.y = _2021;
    float _2129 = _2123 * _2121;
    float _2131 = fma(_1032, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2087);
    float _2133 = fma(_1032, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1961);
    float _2135 = fma(_2097, _2035, _2125);
    float _2137 = -_2129;
    float _2139 = _2137 + 1.0;
    float _2141 = in.m_81.x;
    float _2143 = _1718 * 0.5;
    float _2145 = fma(_1024, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2127);
    float _2147 = fma(_2139, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2129);
    out.m_83.x = _2011;
    out.m_83.y = _2023;
    out.m_83.z = _2025;
    out.m_83.w = _2009;
    float _2149 = fma(_1764, -0.5, _2143);
    float _2151 = _2117 * _2147;
    float _2153 = fma(_2145, _2041, _2095);
    float _2155 = fma(_2131, _2035, _2099);
    out.m_85.x = _1396;
    out.m_85.y = _1394;
    out.m_85.z = _1398;
    float _2157 = _2151 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2159 = fma(_2133, _2035, _2153);
    bool _2161 = _1594 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2163 = isnan(_1594);
    bool _2165 = _2161 || _2163;
    bool _2167 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2169 = _2165 || _2167;
    float _2171 = fma(_1692, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1857);
    float _2173 = _1750 + _1718;
    out.m_87.x = _2155;
    out.m_87.y = _2135;
    out.m_87.z = _2159;
    float _2175 = _2171 + _1718;
    float _2177 = _2173 * 0.5;
    out.gl_Position.x = _1750;
    out.gl_Position.y = _1764;
    out.gl_Position.z = _2171;
    out.gl_Position.w = _1718;
    float _2179 = _2175 * 0.5;
    float _2181 = _2131;
    float _2183 = _1718;
    float _2185 = _2179;
    float _2187 = _2149;
    float _2189 = _2177;
    if (!_2169)
    {
        _2181 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2191 = _2181;
    out.m_89.x = _2177;
    out.m_89.y = _2149;
    out.m_89.z = _2179;
    out.m_89.w = _1718;
    float _2193 = _1448 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2195 = _2191;
    float _2197 = _2191;
    if (!_2169)
    {
        _2183 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2199 = _2183;
    float _2201 = _2199;
    float _2203 = _2199;
    if (!_2169)
    {
        _2185 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2205 = _2185;
    float _2207 = _2205;
    float _2209 = _2205;
    if (!_2169)
    {
        _2187 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2211 = _2187;
    float _2213 = _2211;
    float _2215 = _2211;
    if (!_2169)
    {
        _2189 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2217 = _2189;
    float _2219 = -_1760;
    float _2221 = _2219 + 1.0;
    float _2223 = _2221 * _2157;
    float _2225 = precise::clamp(_2223, 0.0, 1.0);
    float _2227 = -_2225;
    float _2229 = fma(_2227, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2231 = _2229 * _2141;
    float _2233 = _2019 * _1778;
    float _2235 = -_2019;
    float _2237 = _2235 + 1.0;
    float _2239 = _2231 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2241 = _1793 * _2233;
    float _2243 = _1793 * _2237;
    out.m_91.x = _2239;
    float _2245 = _1803 * _2233;
    float _2247 = fma(_1799, _2241, _1787);
    float _2249 = fma(_1801, _2241, _1789);
    float _2251 = _2241;
    float _2253 = _2217;
    float _2255 = _2217;
    if (!_2169)
    {
        _2251 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2257 = _2251;
    float _2259 = fma(_1793, _2245, _1791);
    out.m_93.x = _2247;
    out.m_93.y = _2249;
    out.m_93.z = _2259;
    out.m_93.w = _2243;
    bool _2261 = !_2169;
    float _2263 = _2257;
    float _2265 = _2257;
    if (!_2261)
    {
        bool _2267 = _1594 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2269 = isnan(_1594);
        bool _2271 = _2267 || _2269;
        bool _2273 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2275 = _2271 || _2273;
        if (!_2275)
        {
            float _2277 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2279 = _1594 + _2277;
            float _2281 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2283 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2281;
            float _2285 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2287 = _2285 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2289 = 1.0 / _2283;
            float _2291 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2293 = _2291 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2295 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2297 = _2295 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2299 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2301 = _2299 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2303 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2305 = _2303 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2307 = _2279 * _2289;
            float _2309 = precise::clamp(_2307, 0.0, 1.0);
            float _2311 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2313 = _2311 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2315 = fma(_2309, _2287, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2317 = fma(_2309, _2313, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2319 = fma(_2309, _2293, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2321 = fma(_2309, _2297, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2323 = fma(_2309, _2301, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2325 = fma(_2309, _2305, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2265 = _2319;
            _2215 = _2323;
            _2197 = _2315;
            _2209 = _2321;
            _2203 = _2317;
            _2255 = _2325;
            _2327 = true;
        }
        else
        {
            bool _2329 = _1594 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2331 = isnan(_1594);
            bool _2333 = _2329 || _2331;
            bool _2335 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2337 = _2333 || _2335;
            if (!_2337)
            {
                _2195 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2339 = _2195;
            _2197 = _2339;
            if (!_2337)
            {
                _2263 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2341 = _2263;
            _2265 = _2341;
            if (!_2337)
            {
                _2201 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2343 = _2201;
            _2203 = _2343;
            if (!_2337)
            {
                _2207 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2345 = _2207;
            _2209 = _2345;
            if (!_2337)
            {
                _2213 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2347 = _2213;
            _2215 = _2347;
            if (!_2337)
            {
                _2253 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2349 = _2253;
            bool _2351 = !_2337;
            _2255 = _2349;
            if (!_2351)
            {
                bool _2353 = _1594 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2355 = isnan(_1594);
                bool _2357 = _2353 || _2355;
                bool _2359 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2361 = _2357 || _2359;
                if (!_2361)
                {
                    float _2363 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2365 = _1594 + _2363;
                    float _2367 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2369 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2367;
                    float _2371 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2373 = _2371 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2375 = 1.0 / _2369;
                    float _2377 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2379 = _2377 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2381 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2383 = _2381 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2385 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2387 = _2385 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2389 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2391 = _2389 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2393 = _2365 * _2375;
                    float _2395 = precise::clamp(_2393, 0.0, 1.0);
                    float _2397 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2399 = _2397 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2401 = fma(_2395, _2373, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2403 = fma(_2395, _2399, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2405 = fma(_2395, _2379, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2407 = fma(_2395, _2383, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2409 = fma(_2395, _2387, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2411 = fma(_2395, _2391, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2265 = _2405;
                    _2215 = _2409;
                    _2197 = _2401;
                    _2209 = _2407;
                    _2203 = _2403;
                    _2255 = _2411;
                    _2327 = true;
                }
                else
                {
                    _2265 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2215 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2197 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2209 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2203 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2255 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2327 = false;
    float _2413 = _2265;
    float _2415 = _2215;
    float _2417 = _2197;
    float _2419 = _2209;
    float _2421 = _2203;
    float _2423 = _2255;
    float _2425 = fma(_2135, -0.5, 0.5);
    float _2427 = precise::clamp(_2425, 0.0, 1.0);
    float _2429 = -_2413;
    float _2431 = _2429 + _2415;
    float _2433 = _2193 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2435 = -_2417;
    float _2437 = _2435 + _2419;
    float _2439 = fma(_2427, _2431, _2413);
    out.m_95.x = 0.0;
    float _2441 = -_2421;
    float _2443 = _2441 + _2423;
    float _2445 = fma(_2427, _2437, _2417);
    float _2447 = _2439 * 0.586610972881317138671875;
    out.m_49.x = _2433;
    bool _2449 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2451 = fma(_2427, _2443, _2421);
    float _2453 = fma(_2445, 0.298911988735198974609375, _2447);
    bool _2455 = _1448 > 0.0;
    bool _2457 = isnan(_1448);
    bool _2459 = _2455 || _2457;
    bool _2461 = isnan(0.0);
    bool _2463 = _2459 || _2461;
    float _2465 = fma(_2451, 0.114477999508380889892578125, _2453);
    float _2467 = -_2465;
    float _2469 = _2445 + _2467;
    float _2471 = -_2465;
    float _2473 = _2439 + _2471;
    float _2475 = -_2465;
    float _2477 = _2451 + _2475;
    float _2479 = fma(_2469, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2465);
    float _2481 = fma(_2473, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2465);
    float _2483 = fma(_2477, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2465);
    bool _2485 = !_2449;
    if (!_2485)
    {
        float _2487 = -_1394;
        float _2489 = _2487 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2491 = -_1396;
        float _2493 = _2491 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2495 = -_1398;
        float _2497 = _2495 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2499 = _2489 * _2489;
        float _2501 = fma(_2493, _2493, _2499);
        float _2503 = fma(_2497, _2497, _2501);
        float _2505 = sqrt(_2503);
        float _2507 = rsqrt(_2503);
        float _2509 = -_2505;
        float _2511 = _2509 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2513 = _2511 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2515 = precise::clamp(_2513, 0.0, 1.0);
        float _2517 = _2493 * _2507;
        float _2519 = _2489 * _2507;
        float _2521 = abs(_2515);
        float _2523 = log2(_2521);
        float _2525 = _2497 * _2507;
        float _2527 = _2517 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2529 = _2135 * _2519;
        float _2531 = -_2519;
        float _2533 = -_2527;
        float _2535 = fma(_2531, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2533);
        float _2537 = fma(_2155, _2517, _2529);
        float _2539 = -_2525;
        float _2541 = fma(_2539, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2535);
        float _2543 = fma(_2159, _2525, _2537);
        float _2545 = precise::clamp(_2543, 0.0, 1.0);
        float _2547 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2549 = _2541 + _2547;
        float _2551 = _2523 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2553 = _2549 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2555 = precise::clamp(_2553, 0.0, 1.0);
        float _2557 = exp2(_2551);
        float _2559 = _2557 * _2555;
        float _2561 = _2545 * _2559;
        float _2563 = _2561 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2565 = _2561 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2567 = _2561 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_95.x = _2563;
        out.m_95.y = _2565;
        out.m_95.z = _2567;
    }
    out.m_71.x = _2479;
    out.m_71.y = _2481;
    out.m_71.z = _2483;
    if (_2463)
    {
        return out;
    }
    out.m_49.x = 0.0;
    float _2569 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2569;
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
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2327 = false;
    bool _542 = false;
    bool _400 = false;
    bool _220 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _109 = in.m_46.w;
    float _111 = trunc(_109);
    int _114 = int(_111);
    bool _118 = _114 >= 1;
    float _120 = 0.0;
    if (!_118)
    {
        _120 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _122 = _120;
    float _124 = _122;
    if (!_118)
    {
        out.m_49.x = 0.0;
    }
    int _126 = 0;
    if (!_118)
    {
        float _128 = _122 * 5.0;
        _126 = as_type<int>(_128);
    }
    int _130 = _126;
    if (!_118)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2625 = as_type<float>(_130);
        out.gl_Position.z = _2625;
    }
    if (!_118)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _132 = in.m_51.w;
    bool _134 = _132 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _136 = isnan(_132);
    bool _138 = _134 || _136;
    bool _140 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _142 = _138 || _140;
    float _144 = -_132;
    float _146 = _144 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _148 = 0.0;
    float _150 = _146;
    if (_142)
    {
        float _152 = float(_114);
        _148 = _152;
    }
    float _154 = _148;
    bool _156 = _146 >= _154;
    bool _158 = !_142;
    bool _160 = _156 || _158;
    if (_160)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _162 = _124;
    if (_160)
    {
        out.m_49.x = 0.0;
    }
    int _164 = 0;
    if (_160)
    {
        float _166 = _162 * 5.0;
        _164 = as_type<int>(_166);
    }
    int _168 = _164;
    if (_160)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2694 = as_type<float>(_168);
        out.gl_Position.z = _2694;
    }
    if (_160)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _170 = in.m_53.x;
    float _172 = in.m_53.y;
    float _174 = in.m_53.z;
    bool _176 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _178 = _172 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _180 = _172 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _182 = _172 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _184 = fma(_170, (*spvDescriptorSet0.vp_c10)._m0[4].x, _178);
    float _186 = fma(_170, (*spvDescriptorSet0.vp_c10)._m0[5].x, _180);
    float _188 = fma(_170, (*spvDescriptorSet0.vp_c10)._m0[6].x, _182);
    float _190 = fma(_174, (*spvDescriptorSet0.vp_c10)._m0[4].z, _184);
    float _192 = fma(_174, (*spvDescriptorSet0.vp_c10)._m0[5].z, _186);
    float _194 = fma(_174, (*spvDescriptorSet0.vp_c10)._m0[6].z, _188);
    bool _196 = !_176;
    float _198 = _192;
    float _200 = _190;
    float _218;
    if (!_196)
    {
        float _202 = in.m_55.x;
        float _204 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _206 = _202 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _208 = fma(_206, (*spvDescriptorSet0.vp_c9)._m0[12].x, _146);
        float _210 = _208 * _204;
        float _212 = floor(_210);
        float _214 = -_212;
        float _216 = _210 + _214;
        _218 = _216;
        _220 = true;
    }
    else
    {
        float _222 = float(_114);
        float _224 = 1.0 / _222;
        float _226 = _146 * _224;
        _218 = _226;
    }
    _220 = false;
    float _228 = _218;
    float _230 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _232 = _228 + _230;
    bool _234 = _228 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _236 = isnan(_228);
    bool _238 = _234 || _236;
    bool _240 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _242 = _238 || _240;
    float _244 = float(_242);
    float _246 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _248 = _228 + _246;
    bool _250 = _228 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _252 = isnan(_228);
    bool _254 = _250 || _252;
    bool _256 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _258 = _254 || _256;
    float _260 = float(_258);
    float _262 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _264 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _262;
    float _266 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _268 = _266 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _270 = _228 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _272 = isnan(_228);
    bool _274 = _270 || _272;
    bool _276 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _278 = _274 || _276;
    float _280 = float(_278);
    float _282 = -_244;
    float _284 = _282 + 1.0;
    float _286 = 1.0 / _268;
    float _288 = _280 * _284;
    float _290 = -_280;
    float _292 = _290 + 1.0;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _296 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _294;
    bool _298 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _300 = 1.0 / _264;
    float _302 = _260 * _292;
    float _304 = -_260;
    float _306 = _304 + 1.0;
    float _308 = _248 * _286;
    float _310 = _232 * _300;
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _314 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _312;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _318 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _316;
    float _320 = fma(_296, _310, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _322 = fma(_314, _310, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _324 = fma(_318, _310, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _326 = in.m_57.x;
    float _328 = in.m_57.y;
    float _330 = in.m_57.z;
    float _332 = _320 * _302;
    float _334 = _322 * _302;
    float _336 = _324 * _302;
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _340 = _338 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _344 = _342 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _348 = _346 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _350 = fma(_306, (*spvDescriptorSet0.vp_c9)._m0[143].x, _332);
    float _352 = fma(_340, _308, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _354 = fma(_344, _308, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _356 = fma(_306, (*spvDescriptorSet0.vp_c9)._m0[143].y, _334);
    float _358 = fma(_348, _308, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _360 = fma(_306, (*spvDescriptorSet0.vp_c9)._m0[143].z, _336);
    float _362 = fma(_352, _288, _350);
    float _364 = fma(_354, _288, _356);
    float _366 = fma(_358, _288, _360);
    float _368 = fma(_244, (*spvDescriptorSet0.vp_c9)._m0[145].x, _362);
    float _370 = fma(_244, (*spvDescriptorSet0.vp_c9)._m0[145].y, _364);
    float _372 = fma(_244, (*spvDescriptorSet0.vp_c9)._m0[145].z, _366);
    float _374 = _368 * _326;
    float _376 = _370 * _328;
    float _378 = _372 * _330;
    bool _380 = !_298;
    float _398;
    if (!_380)
    {
        float _382 = in.m_55.x;
        float _384 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _386 = _382 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _388 = fma(_386, (*spvDescriptorSet0.vp_c9)._m0[11].y, _146);
        float _390 = _388 * _384;
        float _392 = floor(_390);
        float _394 = -_392;
        float _396 = _390 + _394;
        _398 = _396;
        _400 = true;
    }
    else
    {
        float _402 = float(_114);
        float _404 = 1.0 / _402;
        float _406 = _146 * _404;
        _398 = _406;
    }
    _400 = false;
    float _408 = _398;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _412 = _408 + _410;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _416 = _414 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _418 = _408 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _420 = isnan(_408);
    bool _422 = _418 || _420;
    bool _424 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _426 = _422 || _424;
    float _428 = float(_426);
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _432 = _430 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _434 = _408 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _436 = isnan(_408);
    bool _438 = _434 || _436;
    bool _440 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _442 = _438 || _440;
    float _444 = float(_442);
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _448 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _446;
    bool _450 = _408 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _452 = isnan(_408);
    bool _454 = _450 || _452;
    bool _456 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _458 = _454 || _456;
    float _460 = float(_458);
    float _462 = 1.0 / _416;
    float _464 = -_428;
    float _466 = _464 + 1.0;
    bool _468 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _470 = _444 * _466;
    float _472 = -_444;
    float _474 = _472 + 1.0;
    float _476 = 1.0 / _432;
    float _478 = _448 * _462;
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _482 = _480 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _484 = fma(_478, _412, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _486 = _482 * _476;
    float _488 = _484 * _470;
    float _490 = -_460;
    float _492 = _490 + 1.0;
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _496 = _408 + _494;
    float _498 = fma(_474, (*spvDescriptorSet0.vp_c9)._m0[115].x, _488);
    float _500 = _428 * _492;
    float _502 = fma(_486, _496, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _504 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _506 = fma(_502, _500, _498);
    float _508 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _510 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _512 = fma(_460, (*spvDescriptorSet0.vp_c9)._m0[117].x, _506);
    float _514 = _504 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _516 = _508 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _518 = _510 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _520 = _512 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_59.x = _514;
    out.m_59.y = _516;
    out.m_59.z = _518;
    out.m_59.w = _520;
    bool _522 = !_468;
    float _540;
    if (!_522)
    {
        float _524 = in.m_55.x;
        float _526 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _528 = _524 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _530 = fma(_528, (*spvDescriptorSet0.vp_c9)._m0[11].w, _146);
        float _532 = _530 * _526;
        float _534 = floor(_532);
        float _536 = -_534;
        float _538 = _532 + _536;
        _540 = _538;
        _542 = true;
    }
    else
    {
        float _544 = float(_114);
        float _546 = 1.0 / _544;
        float _548 = _146 * _546;
        _540 = _548;
    }
    _542 = false;
    float _550 = _540;
    float _552 = in.m_55.x;
    float _554 = in.m_55.y;
    float _556 = in.m_55.z;
    float _558 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _560 = log2(_558);
    float _562 = _374 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _564 = in.m_46.x;
    float _566 = in.m_46.y;
    float _568 = in.m_46.z;
    float _570 = _376 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _572 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _574 = _572 != 0;
    int _576 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _578 = _576 != 0;
    int _580 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _582 = _580 != 0;
    float _584 = _378 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _586 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _588 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _590 = isnan(1.0);
    bool _592 = _588 || _590;
    bool _594 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _596 = _592 || _594;
    float _598 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _600 = 1.0 + _598;
    float _602 = _560 * _146;
    float _604 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _606 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _608 = isnan(0.0);
    bool _610 = _606 || _608;
    bool _612 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _614 = _610 || _612;
    float _616 = 1.0 / _600;
    float _618 = _556 * 2.0;
    float _620 = _552 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _622 = _552 * 2.0;
    float _624 = _554 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _626 = floor(_618);
    float _628 = -_586;
    float _630 = fma(_620, 2.0, _628);
    float _632 = _566 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _634 = _554 + _556;
    float _636 = fma(_624, -2.0, _604);
    float _638 = _556 + _552;
    float _640 = fma(_564, (*spvDescriptorSet0.vp_c10)._m0[4].x, _632);
    float _642 = _634 + (-1.0);
    float _644 = exp2(_602);
    float _646 = _638 + (-1.0);
    float _648 = -_146;
    float _650 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[76].x, _630);
    float _652 = fma(_642, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _654 = fma(_646, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _656 = floor(_622);
    float _658 = _566 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _660 = _566 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _662 = _626 > 0.0;
    float _664 = fma(_564, (*spvDescriptorSet0.vp_c10)._m0[5].x, _658);
    float _666 = fma(_564, (*spvDescriptorSet0.vp_c10)._m0[6].x, _660);
    bool _668 = _626 >= 0.0;
    bool _670 = isnan(_626);
    bool _672 = _668 || _670;
    bool _674 = isnan(0.0);
    bool _676 = _672 || _674;
    float _678 = _554 * 2.0;
    float _680 = -_644;
    float _682 = _680 + 1.0;
    float _684 = floor(_678);
    float _686 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _688 = _614 ? _682 : 0.0;
    float _690 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _692 = _656 > 0.0;
    float _694 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _696 = fma(_556, (*spvDescriptorSet0.vp_c9)._m0[79].z, _686);
    float _698 = fma(_552, (*spvDescriptorSet0.vp_c9)._m0[78].z, _690);
    float _700 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[76].y, _636);
    float _702 = fma(_554, (*spvDescriptorSet0.vp_c9)._m0[78].w, _694);
    float _704 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[79].x, _696);
    float _706 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[77].z, _698);
    int _708 = _676 ? 0 : 1;
    float _710 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[77].w, _702);
    if (_596)
    {
        float _712 = _688 * _616;
        _150 = _712;
    }
    float _714 = _150;
    bool _716 = _656 >= 0.0;
    bool _718 = isnan(_656);
    bool _720 = _716 || _718;
    bool _722 = isnan(0.0);
    bool _724 = _720 || _722;
    float _726 = fma(_568, (*spvDescriptorSet0.vp_c10)._m0[5].z, _664);
    bool _728 = !_578;
    int _730 = _728 ? 0 : 1;
    float _732 = fma(_568, (*spvDescriptorSet0.vp_c10)._m0[4].z, _640);
    int _734 = _724 ? 0 : 1;
    float _736 = _726 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _738 = !_574;
    int _740 = _738 ? 0 : 1;
    float _742 = fma(_568, (*spvDescriptorSet0.vp_c10)._m0[6].z, _666);
    bool _744 = _684 > 0.0;
    float _746 = _732 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _748 = _684 >= 0.0;
    bool _750 = isnan(_684);
    bool _752 = _748 || _750;
    bool _754 = isnan(0.0);
    bool _756 = _752 || _754;
    float _758 = _742 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _760 = ~_708;
    int _762 = _760 + 1;
    int _764 = _762 + 1;
    float _766 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _768 = _746 + _766;
    int _770 = _764;
    if (!_662)
    {
        int _772 = ~_708;
        int _774 = _772 + 1;
        _770 = _774;
    }
    int _776 = _770;
    float _778 = _556 + (-0.5);
    int _780 = abs(_730);
    float _782 = in.m_61.x;
    float _784 = in.m_61.y;
    float _786 = in.m_61.z;
    int _788 = abs(_740);
    float _790 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _792 = _736 + _790;
    int _794 = ~_734;
    int _796 = _794 + 1;
    int _798 = _796 + 1;
    int _800 = _798;
    if (!_692)
    {
        int _802 = ~_734;
        int _804 = _802 + 1;
        _800 = _804;
    }
    int _806 = _800;
    float _808 = _792 * _792;
    float _810 = float(_780);
    float _812 = float(_806);
    float _814 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _816 = _758 + _814;
    float _818 = fma(_768, _768, _808);
    int _820 = _756 ? 0 : 1;
    float _822 = _810 * _812;
    float _824 = float(_788);
    float _826 = fma(_816, _816, _818);
    int _828 = ~_820;
    int _830 = _828 + 1;
    int _832 = _830 + 1;
    int _834 = _832;
    if (!_744)
    {
        int _836 = ~_820;
        int _838 = _836 + 1;
        _834 = _838;
    }
    int _840 = _834;
    float _842 = sqrt(_826);
    float _844 = float(_776);
    float _846 = _822 * (-2.0);
    bool _848 = !_582;
    int _850 = _848 ? 0 : 1;
    float _852 = _554 + (-0.5);
    float _854 = fma(_846, _784, _784);
    int _856 = abs(_850);
    float _858 = _824 * _844;
    float _860 = fma(_652, _846, _652);
    float _862 = fma(_852, (*spvDescriptorSet0.vp_c9)._m0[196].y, _854);
    float _864 = rsqrt(_826);
    float _866 = _554 + _552;
    float _868 = float(_840);
    float _870 = _562 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _872 = float(_856);
    float _874 = _842 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _876 = _866 + (-1.0);
    float _878 = _858 * (-2.0);
    float _880 = fma(_860, _714, _862);
    float _882 = _872 * _868;
    float _884 = precise::min(_870, _874);
    float _886 = fma(_876, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _888 = _552 + (-0.5);
    float _890 = fma(_878, _782, _782);
    float _892 = _880 * 0.15915493667125701904296875;
    float _894 = _882 * (-2.0);
    float _896 = fma(_886, _878, _886);
    float _898 = fma(_888, (*spvDescriptorSet0.vp_c9)._m0[196].x, _890);
    float _900 = _864 * _884;
    float _902 = fma(_654, _894, _654);
    float _904 = fma(_894, _786, _786);
    float _906 = fma(_896, _714, _898);
    float _908 = _792 * _900;
    float _910 = _768 * _900;
    float _912 = fma(_778, (*spvDescriptorSet0.vp_c9)._m0[196].z, _904);
    float _914 = _906 * 0.15915493667125701904296875;
    float _916 = -_908;
    float _918 = _792 + _916;
    float _920 = -_910;
    float _922 = _768 + _920;
    float _924 = fma(_902, _714, _912);
    float _926 = _816 * _900;
    float _928 = _918 * _918;
    float _930 = _892 * 6.283185482025146484375;
    float _932 = sin(_930);
    float _934 = _924 * 0.15915493667125701904296875;
    float _936 = -_926;
    float _938 = _816 + _936;
    float _940 = fma(_922, _922, _928);
    float _942 = in.m_63.x;
    float _944 = in.m_63.y;
    float _946 = in.m_63.z;
    float _948 = fma(_938, _938, _940);
    float _950 = _892 * 6.283185482025146484375;
    float _952 = cos(_950);
    float _954 = sqrt(_948);
    float _956 = _914 * 6.283185482025146484375;
    float _958 = cos(_956);
    float _960 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _944);
    float _962 = _914 * 6.283185482025146484375;
    float _964 = sin(_962);
    float _966 = _864 * _954;
    float _968 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _942);
    float _970 = _570 * _966;
    float _972 = _562 * _966;
    float _974 = _584 * _966;
    float _976 = _934 * 6.283185482025146484375;
    float _978 = cos(_976);
    float _980 = _958 * _952;
    float _982 = _958 * _932;
    float _984 = _970 * _960;
    float _986 = _972 * _968;
    float _988 = _934 * 6.283185482025146484375;
    float _990 = sin(_988);
    float _992 = _964 * _932;
    float _994 = _964 * _952;
    float _996 = _958 * _978;
    float _998 = _964 * _978;
    float _1000 = _952 * _978;
    float _1002 = _932 * _978;
    float _1004 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _946);
    float _1006 = _996 * _984;
    float _1008 = fma(_990, _980, _992);
    float _1010 = _974 * _1004;
    float _1012 = -_994;
    float _1014 = fma(_990, _982, _1012);
    float _1016 = -_984;
    float _1018 = _990 * _1016;
    float _1020 = fma(_1008, _986, _1006);
    float _1022 = -_982;
    float _1024 = fma(_990, _994, _1022);
    float _1026 = _998 * _984;
    float _1028 = fma(_1000, _986, _1018);
    float _1030 = fma(_1014, _1010, _1020);
    float _1032 = fma(_990, _992, _980);
    float _1034 = fma(_1024, _986, _1026);
    float _1036 = fma(_1002, _1010, _1028);
    float _1038 = _1030 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1040 = _1030 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1042 = fma(_1032, _1010, _1034);
    float _1044 = fma(_1036, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1038);
    float _1046 = fma(_1036, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1040);
    float _1048 = fma(_1042, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1044);
    float _1050 = fma(_1042, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1046);
    float _1052 = _1048 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1054 = _1050 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1056 = _758 + _1052;
    float _1058 = _746 + _1054;
    float _1060 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1062 = _1056 + _1060;
    float _1064 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1066 = _1058 + _1064;
    float _1068 = _1062 * _1062;
    float _1070 = fma(_1066, _1066, _1068);
    float _1072 = _1030 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1074 = -_926;
    float _1076 = _758 + _1074;
    float _1078 = sqrt(_1070);
    float _1080 = fma(_1036, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1072);
    float _1082 = -_908;
    float _1084 = _736 + _1082;
    float _1086 = -_910;
    float _1088 = _746 + _1086;
    float _1090 = fma(_1042, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1080);
    float _1092 = _1084 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1094 = _1090 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1096 = fma(_1088, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1092);
    float _1098 = _736 + _1094;
    float _1100 = fma(_1076, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1096);
    bool _1102 = _1078 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1104 = _1090;
    float _1106 = _1094;
    float _1108 = _1058;
    float _1110 = _1070;
    if (!_1102)
    {
        _1104 = _1058;
    }
    float _1112 = _1104;
    float _1114 = _1112;
    if (!_1102)
    {
        _1106 = _1056;
    }
    float _1116 = _1106;
    float _1118 = _1116;
    if (!_1102)
    {
        _1108 = _1098;
    }
    float _1120 = _1108;
    bool _1122 = !_1102;
    float _1124 = _1120;
    if (!_1122)
    {
        float _1126 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1128 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1130 = _1078 + _1128;
        float _1132 = _1098 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1134 = rsqrt(_1070);
        float _1136 = _1130 * _1126;
        float _1138 = _1136 * 0.15915493667125701904296875;
        float _1140 = _1138 * 6.283185482025146484375;
        float _1142 = cos(_1140);
        float _1144 = _1138 * 6.283185482025146484375;
        float _1146 = sin(_1144);
        float _1148 = _1142 + (-1.0);
        float _1150 = _1148 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1152 = fma(_1146, _1132, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1154 = fma(_1098, _1142, _1150);
        float _1156 = _1134 * _1152;
        float _1158 = fma(_1066, _1156, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1160 = fma(_1062, _1156, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1124 = _1154;
        _1114 = _1158;
        _1118 = _1160;
    }
    float _1162 = _1124;
    float _1164 = _1114;
    float _1166 = _1118;
    float _1168 = -_736;
    float _1170 = _1168 + _1162;
    float _1172 = -_746;
    float _1174 = _1172 + _1164;
    float _1176 = _1100 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1178 = -_758;
    float _1180 = _1178 + _1166;
    float _1182 = _1170 * _1170;
    float _1184 = 1.0 / _1176;
    float _1186 = -_926;
    float _1188 = _1186 + _1166;
    float _1190 = fma(_1174, _1174, _1182);
    float _1192 = _1084 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1194 = -_910;
    float _1196 = _1194 + _1164;
    float _1198 = fma(_1180, _1180, _1190);
    float _1200 = fma(_1088, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1192);
    bool _1202 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1204 = isnan(0.5);
    bool _1206 = _1202 || _1204;
    bool _1208 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1210 = _1206 || _1208;
    float _1212 = -_908;
    float _1214 = _1212 + _1162;
    float _1216 = sqrt(_1198);
    float _1218 = fma(_1076, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1200);
    bool _1220 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1222 = isnan(0.5);
    bool _1224 = _1220 || _1222;
    bool _1226 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1228 = _1224 || _1226;
    float _1230 = _1218 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1232 = _1230 + _1176;
    float _1234 = _1232 * _1184;
    float _1236 = _1234 * 0.5;
    bool _1238 = _1216 > 0.0;
    float _1240 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1242 = fma(_1236, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1240);
    float _1244 = 1.0 / _1242;
    float _1246 = _1216;
    float _1248 = _1196;
    float _1250 = _1214;
    float _1252 = _1170;
    float _1254 = _1242;
    if (!_1238)
    {
        _1246 = _1188;
    }
    float _1256 = _1246;
    bool _1258 = !_1238;
    float _1260 = _1256;
    if (!_1258)
    {
        float _1262 = _192 * _192;
        float _1264 = fma(_190, _190, _1262);
        float _1266 = fma(_194, _194, _1264);
        float _1268 = rsqrt(_1198);
        float _1270 = sqrt(_1266);
        float _1272 = _1174 * _1268;
        float _1274 = _1170 * _1268;
        bool _1276 = _1270 > 0.0;
        float _1278 = _1180 * _1268;
        float _1280 = _1268;
        _1254 = _1278;
        if (!_1276)
        {
            _1280 = _1188;
        }
        float _1282 = _1280;
        bool _1284 = !_1276;
        _1260 = _1282;
        if (!_1284)
        {
            float _1286 = rsqrt(_1266);
            float _1288 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1290 = _192 * _1286;
            float _1292 = _190 * _1286;
            float _1294 = _1274 * _1290;
            float _1296 = _194 * _1286;
            float _1298 = fma(_1272, _1292, _1294);
            float _1300 = _1288 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1302 = fma(_1278, _1296, _1298);
            float _1304 = _1302 * _1300;
            float _1306 = fma(_190, _1304, _1196);
            float _1308 = fma(_192, _1304, _1214);
            float _1310 = fma(_194, _1304, _1188);
            _1248 = _1306;
            _1250 = _1308;
            _1260 = _1310;
            _1252 = _1296;
        }
    }
    float _1312 = _1248;
    float _1314 = _1250;
    float _1316 = _1260;
    float _1318 = _1252;
    float _1320 = _1254;
    float _1322 = _1318;
    float _1324 = _1316;
    float _1326 = _1320;
    if (_1228)
    {
        _1322 = 1.0;
    }
    float _1328 = _1322;
    float _1330 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1332 = _1244 * _1330;
    float _1334 = _1328;
    if (_1210)
    {
        _198 = _1312;
    }
    float _1336 = _198;
    float _1338 = _1336;
    if (_1210)
    {
        _200 = _1314;
    }
    float _1340 = _200;
    float _1342 = _1340;
    if (!_1210)
    {
        float _1344 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1346 = _1084 + _1344;
        float _1348 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1350 = _1088 + _1348;
        float _1352 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1354 = -_1088;
        float _1356 = _1354 + _1312;
        float _1358 = _1346 * _1346;
        float _1360 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1362 = _1076 + _1360;
        float _1364 = -_1084;
        float _1366 = _1364 + _1314;
        float _1368 = fma(_1350, _1350, _1358);
        float _1370 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1372 = fma(_1362, _1362, _1368);
        float _1374 = sqrt(_1372);
        float _1376 = _1352 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1378 = -_1076;
        float _1380 = _1378 + _1316;
        float _1382 = precise::min(_1374, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1384 = _1382 * _1370;
        float _1386 = _1376 * _1384;
        float _1388 = fma(_1356, _1386, _1088);
        float _1390 = fma(_1366, _1386, _1084);
        float _1392 = fma(_1380, _1386, _1076);
        _1342 = _1390;
        _1338 = _1388;
        _1324 = _1392;
    }
    float _1394 = _1342;
    float _1396 = _1338;
    float _1398 = _1324;
    if (!_1228)
    {
        float _1400 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1402 = _1400 * 0.15915493667125701904296875;
        float _1404 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1406 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1408 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1406;
        float _1410 = _1402 * 6.283185482025146484375;
        float _1412 = cos(_1410);
        float _1414 = _1404 * 0.15915493667125701904296875;
        float _1416 = _1402 * 6.283185482025146484375;
        float _1418 = sin(_1416);
        float _1420 = 1.0 / _1412;
        float _1422 = _1414 * 6.283185482025146484375;
        float _1424 = cos(_1422);
        float _1426 = _1418 * _1420;
        float _1428 = _1414 * 6.283185482025146484375;
        float _1430 = sin(_1428);
        float _1432 = _1424 * _1426;
        float _1434 = 1.0 / _1408;
        float _1436 = 1.0 / _1432;
        float _1438 = _1430 * _1436;
        float _1440 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1442 = fma(_1332, _1438, _1440);
        float _1444 = _1442 * _1434;
        float _1446 = precise::clamp(_1444, 0.0, 1.0);
        _1334 = _1446;
    }
    float _1448 = _1334;
    float _1450 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1452 = _1394 + _1450;
    float _1454 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1456 = _1396 + _1454;
    float _1458 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1460 = _1398 + _1458;
    float _1462 = _1452 * _1452;
    float _1464 = fma(_1456, _1456, _1462);
    float _1466 = fma(_1460, _1460, _1464);
    float _1468 = rsqrt(_1466);
    float _1470 = _1468 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1472 = _1456 * _1470;
    float _1474 = _1460 * _1470;
    float _1476 = _1472 * _1472;
    float _1478 = _1474 * _1474;
    float _1480 = _1476 + _1478;
    float _1482 = sqrt(_1480);
    bool _1484 = _1482 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1486 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1488 = _1482 + _1486;
    float _1490 = _1464;
    float _1492 = _1488;
    float _1494 = _1452;
    float _1496 = _1470;
    if (_1484)
    {
        float _1498 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1490 = _1498;
    }
    float _1500 = _1490;
    float _1502 = _1500;
    if (_1484)
    {
        float _1504 = _1488 * _1500;
        _1492 = _1504;
    }
    float _1506 = _1492;
    if (_1484)
    {
        float _1508 = rsqrt(_1480);
        _1502 = _1508;
    }
    float _1510 = _1502;
    float _1512 = _1510;
    if (_1484)
    {
        float _1514 = _1506 * 0.15915493667125701904296875;
        _1326 = _1514;
    }
    float _1516 = _1326;
    float _1518 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1520 = _1468;
    float _1522 = _1516;
    if (_1484)
    {
        float _1524 = _1516 * 6.283185482025146484375;
        float _1526 = sin(_1524);
        _1520 = _1526;
    }
    float _1528 = _1520;
    float _1530 = precise::max(0.0, _1518);
    float _1532 = _1460;
    float _1534 = _1530;
    if (_1484)
    {
        float _1536 = _1516 * 6.283185482025146484375;
        float _1538 = cos(_1536);
        _1532 = _1538;
    }
    float _1540 = _1532;
    float _1542 = -_1470;
    float _1544 = -_1530;
    float _1546 = fma(_1452, _1542, _1544);
    if (_1484)
    {
        float _1548 = _1546 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1494 = _1548;
    }
    float _1550 = _1494;
    float _1552 = _1528;
    float _1554 = _1550;
    if (_1484)
    {
        float _1556 = fma(_1528, _1550, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1552 = _1556;
    }
    float _1558 = _1552;
    if (!_1484)
    {
        _1554 = _1546;
    }
    float _1560 = _1554;
    float _1562 = _1560;
    if (!_1484)
    {
        _1522 = _1474;
    }
    float _1564 = _1522;
    float _1566 = _1564;
    if (_1484)
    {
        float _1568 = _1510 * _1558;
        _1110 = _1568;
    }
    float _1570 = _1110;
    if (!_1484)
    {
        _1512 = _1472;
    }
    float _1572 = _1512;
    float _1574 = _1572;
    float _1576 = _1540;
    if (_1484)
    {
        float _1578 = _1540 + (-1.0);
        _1534 = _1578;
    }
    float _1580 = _1534;
    if (_1484)
    {
        float _1582 = _1472 * _1570;
        _1574 = _1582;
    }
    float _1584 = _1574;
    if (_1484)
    {
        float _1586 = _1474 * _1570;
        _1566 = _1586;
    }
    float _1588 = _1566;
    if (_1484)
    {
        float _1590 = _1580 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1496 = _1590;
    }
    float _1592 = _1496;
    float _1594 = sqrt(_1466);
    float _1596 = _1592;
    if (_1484)
    {
        float _1598 = fma(_1546, _1540, _1592);
        _1562 = _1598;
    }
    float _1600 = _1562;
    if (!_1484)
    {
        _1576 = _1476;
    }
    float _1602 = _1576;
    float _1604 = _1602;
    if (_1484)
    {
        float _1606 = _1584 * _1584;
        _1604 = _1606;
    }
    float _1608 = _1604;
    if (!_1484)
    {
        _1596 = _1478;
    }
    float _1610 = _1596;
    float _1612 = _1610;
    if (_1484)
    {
        float _1614 = _1588 * _1588;
        _1612 = _1614;
    }
    float _1616 = _1612;
    float _1618 = fma(_1088, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1620 = fma(_1600, _1600, _1608);
    float _1622 = _1394 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1624 = floor(_1618);
    float _1626 = _1620 + _1616;
    float _1628 = fma(_1396, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1622);
    float _1630 = _1394 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1632 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1634 = fma(_1594, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1632);
    float _1636 = precise::clamp(_1634, 0.0, 1.0);
    float _1638 = fma(_1398, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1628);
    float _1640 = rsqrt(_1626);
    float _1642 = -_1636;
    float _1644 = _1642 + 1.0;
    float _1646 = fma(_1076, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1648 = _1394 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1650 = _1638 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1652 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1654 = fma(_1396, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1630);
    float _1656 = fma(_1396, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1648);
    float _1658 = abs(_1644);
    float _1660 = log2(_1658);
    float _1662 = _1394 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1664 = _1650 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1666 = fma(_1398, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1656);
    float _1668 = fma(_1398, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1654);
    float _1670 = fma(_1396, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1662);
    float _1672 = -_1664;
    float _1674 = fma(_1672, _1652, 1.0);
    float _1676 = _1666 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1678 = _1640 * _1584;
    float _1680 = fma(_1398, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1670);
    float _1682 = _1640 * _1600;
    float _1684 = _1640 * _1588;
    float _1686 = _1678 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1688 = _1680 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1690 = floor(_1646);
    float _1692 = _1668 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1694 = -_1686;
    float _1696 = fma(_1682, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1694);
    float _1698 = _1688 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1700 = _1660 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1702 = -_1684;
    float _1704 = fma(_1702, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1696);
    float _1706 = fma(_1676, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1698);
    float _1708 = exp2(_1700);
    float _1710 = -_1624;
    float _1712 = _1618 + _1710;
    float _1714 = fma(_1704, -0.5, 0.5);
    float _1716 = fma(_1650, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1706);
    float _1718 = fma(_1692, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1716);
    float _1720 = log2(_1674);
    float _1722 = _1688 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1724 = fma(_1704, 0.5, 0.5);
    float _1726 = -_1690;
    float _1728 = _1646 + _1726;
    float _1730 = _1682 + 1.0;
    float _1732 = fma(_1676, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1722);
    float _1734 = fma(_1724, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1736 = 1.0 / _1718;
    float _1738 = _1688 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1740 = fma(_1650, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1732);
    float _1742 = fma(_1724, _1734, -0.212114393711090087890625);
    float _1744 = -_1682;
    float _1746 = fma(_1708, _1730, _1744);
    float _1748 = fma(_1676, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1738);
    float _1750 = fma(_1692, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1740);
    float _1752 = fma(_1724, _1742, 1.570728778839111328125);
    float _1754 = sqrt(_1714);
    float _1756 = fma(_1650, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1748);
    float _1758 = _1720 * 0.693147182464599609375;
    float2 _5210 = float2(_1712, _1728);
    float _1760 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5210, float2(0.0), isnan(_5210)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5210, float2(0.0), isnan(_5210)), level(0.0)).x;
    float _1762 = fma(_1746, 0.5, 0.5);
    float _1764 = fma(_1692, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1756);
    float _1766 = _1758 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1768 = _1750 * _1736;
    float _1770 = _1764 * _1736;
    float _1772 = fma(_1768, 0.5, 0.5);
    float _1774 = fma(_1770, -0.5, 0.5);
    float _1776 = _1754 * 0.636619746685028076171875;
    float3 _5245 = float3(_1772, _1774, _1766);
    float _1778 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5245, float3(0.0), isnan(_5245)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5245, float3(0.0), isnan(_5245)), level(0.0)).x;
    float _1780 = -_1752;
    float _1782 = fma(_1776, _1780, 1.0);
    float3 _5261 = float3(_1772, _1774, _1766);
    float4 _1785 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5261, float3(0.0), isnan(_5261)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5261, float3(0.0), isnan(_5261)), level(0.0)).xyzw;
    float _1787 = _1785.x;
    float _1789 = _1785.y;
    float _1791 = _1785.z;
    float _1793 = _1785.w;
    float2 _5277 = float2(_1782, _1762);
    float3 _1797 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5277, float2(0.0), isnan(_5277)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5277, float2(0.0), isnan(_5277)), level(0.0)).xyz;
    float _1799 = _1797.x;
    float _1801 = _1797.y;
    float _1803 = _1797.z;
    float _1805 = in.m_65.x;
    float _1807 = _1660 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1809 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1811 = _1809 != 0;
    float _1813 = in.m_65.y;
    bool _1815 = _554 > 0.5;
    float _1817 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1819 = _1817 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1821 = in.m_67.z;
    float _1823 = in.m_67.y;
    float _1825 = 1.0 / _1819;
    float _1827 = _704 * (-0.15915493667125701904296875);
    float _1829 = 0.0;
    float _1831 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    if (_1811)
    {
        float _1833 = in.m_55.x;
        _1829 = _1833;
    }
    float _1835 = _1829;
    int _1837 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1839 = _1837 != 0;
    float _1841 = _1688 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1843 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1845 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1843;
    float _1847 = in.m_67.w;
    float _1849 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1851 = fma(_1676, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1841);
    float _1853 = _1805;
    if (_1811)
    {
        _1831 = _1805;
    }
    float _1855 = _1831;
    out.m_69.x = _1088;
    out.m_69.y = _1084;
    out.m_69.z = _1076;
    float _1857 = fma(_1650, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1851);
    float _1859 = -_1813;
    float _1861 = _1859 + 1.0;
    float _1863 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    out.m_71.w = _884;
    float _1865 = _1813;
    float _1867 = _1855;
    if (_1839)
    {
        float _1869 = _1815 ? _1861 : _1813;
        _1865 = _1869;
    }
    float _1871 = _1865;
    out.m_73.z = _1821;
    float _1873 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1875 = _550 + _1873;
    bool _1877 = _944 != 0.0;
    bool _1879 = isnan(_944);
    bool _1881 = _1877 || _1879;
    bool _1883 = isnan(0.0);
    bool _1885 = _1881 || _1883;
    float _1887 = _1827 * 6.283185482025146484375;
    float _1889 = sin(_1887);
    out.m_73.y = _1823;
    float _1891 = _1014 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _1893 = _1835 > 0.5;
    bool _1895 = _1893 && _1811;
    float _1897 = _1845 * _1825;
    bool _1899 = _550 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1901 = isnan(_550);
    bool _1903 = _1899 || _1901;
    bool _1905 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1907 = _1903 || _1905;
    float _1909 = float(_1907);
    float _1911 = _1849 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1913 = _1827 * 6.283185482025146484375;
    float _1915 = cos(_1913);
    bool _1917 = _550 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1919 = isnan(_550);
    bool _1921 = _1917 || _1919;
    bool _1923 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1925 = _1921 || _1923;
    float _1927 = float(_1925);
    float _1929 = _1863 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1931 = -_1909;
    float _1933 = _1931 + 1.0;
    float _1935 = fma(_1897, _1875, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    out.m_73.w = _1847;
    bool _1937 = _942 == 0.0;
    bool _1939 = !_1885;
    bool _1941 = _1937 && _1939;
    float _1943 = _1927 * _1933;
    float _1945 = -_1927;
    float _1947 = _1945 + 1.0;
    if (_1895)
    {
        float _1949 = -_1855;
        float _1951 = _1949 + 1.0;
        _1867 = _1951;
    }
    float _1953 = _1867;
    bool _1955 = _946 == 0.0;
    bool _1957 = _1955 && _1941;
    float _1959 = _1935 * _1943;
    float _1961 = fma(_1002, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1891);
    float _1963 = exp2(_1807);
    if (_1811)
    {
        _1853 = _1953;
    }
    float _1965 = _1853;
    float _1967 = fma(_1911, _1871, -0.5);
    float _1969 = fma(_1947, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1959);
    float _1971 = in.m_67.x;
    float _1973 = _1889 * _1967;
    float _1975 = fma(_1929, _1965, -0.5);
    float _1977 = _1915 * _1967;
    float _1979 = in.m_75.x;
    float _1981 = in.m_75.y;
    float _1983 = in.m_75.z;
    float _1985 = fma(_1909, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1969);
    float _1987 = -_1973;
    float _1989 = fma(_1915, _1975, _1987);
    float _1991 = fma(_1889, _1975, _1977);
    out.m_77.x = _972;
    float _1993 = fma(_706, _1989, _650);
    float _1995 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1997 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1999 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2001 = -_700;
    float _2003 = fma(_710, _1991, _2001);
    float _2005 = -_1963;
    float _2007 = _2005 + 1.0;
    float _2009 = _1985 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2011 = _1999 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2013 = _1993 + 0.5;
    float _2015 = abs(_1332);
    float _2017 = log2(_2015);
    float _2019 = _2007 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2021 = _2003 + 0.5;
    float _2023 = _1995 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2025 = _1997 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_73.x = _1971;
    float _2027 = _1983;
    float _2029 = _1979;
    float _2031 = _1981;
    if (!_1957)
    {
        float _2033 = fma(_946, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1983);
        _2027 = _2033;
    }
    float _2035 = _2027;
    float _2037 = _996 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    if (!_1957)
    {
        float _2039 = fma(_942, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1979);
        _2029 = _2039;
    }
    float _2041 = _2029;
    float _2043 = _996 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    if (!_1957)
    {
        float _2045 = fma(_944, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1981);
        _2031 = _2045;
    }
    float _2047 = _2031;
    float _2049 = -_990;
    float _2051 = fma(_2049, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2037);
    float _2053 = _996 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2055 = _2017 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2057 = -_990;
    float _2059 = fma(_2057, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2043);
    float _2061 = _1008 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2063 = _1008 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2065 = fma(_998, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2051);
    float _2067 = exp2(_2055);
    float _2069 = fma(_998, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2059);
    float _2071 = -_990;
    float _2073 = fma(_2071, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2053);
    float _2075 = fma(_1000, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2061);
    float _2077 = fma(_1000, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2063);
    float _2079 = _1014 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2081 = _1014 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2083 = fma(_998, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2073);
    float _2085 = _2069 * _2047;
    float _2087 = fma(_1002, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2079);
    float _2089 = fma(_1002, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2081);
    float _2091 = fma(_1024, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2075);
    float _2093 = _2065 * _2047;
    float _2095 = _2083 * _2047;
    float _2097 = fma(_1032, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2089);
    float _2099 = fma(_2091, _2041, _2085);
    float _2101 = fma(_2067, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2103 = precise::clamp(_2101, 0.0, 1.0);
    float _2105 = fma(_1024, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2077);
    bool _2107 = _1332 <= 8000.0;
    bool _2109 = isnan(_1332);
    bool _2111 = _2107 || _2109;
    bool _2113 = isnan(8000.0);
    bool _2115 = _2111 || _2113;
    float _2117 = float(_2115);
    float _2119 = _1008 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2121 = fma(_2103, -2.0, 3.0);
    float _2123 = _2103 * _2103;
    float _2125 = fma(_2105, _2041, _2093);
    float _2127 = fma(_1000, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2119);
    out.m_79.x = _2013;
    out.m_79.y = _2021;
    float _2129 = _2123 * _2121;
    float _2131 = fma(_1032, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2087);
    float _2133 = fma(_1032, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1961);
    float _2135 = fma(_2097, _2035, _2125);
    float _2137 = -_2129;
    float _2139 = _2137 + 1.0;
    float _2141 = in.m_81.x;
    float _2143 = _1718 * 0.5;
    float _2145 = fma(_1024, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2127);
    float _2147 = fma(_2139, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2129);
    out.m_83.x = _2011;
    out.m_83.y = _2023;
    out.m_83.z = _2025;
    out.m_83.w = _2009;
    float _2149 = fma(_1764, -0.5, _2143);
    float _2151 = _2117 * _2147;
    float _2153 = fma(_2145, _2041, _2095);
    float _2155 = fma(_2131, _2035, _2099);
    out.m_85.x = _1396;
    out.m_85.y = _1394;
    out.m_85.z = _1398;
    float _2157 = _2151 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2159 = fma(_2133, _2035, _2153);
    bool _2161 = _1594 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2163 = isnan(_1594);
    bool _2165 = _2161 || _2163;
    bool _2167 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2169 = _2165 || _2167;
    float _2171 = fma(_1692, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1857);
    float _2173 = _1750 + _1718;
    out.m_87.x = _2155;
    out.m_87.y = _2135;
    out.m_87.z = _2159;
    float _2175 = _2171 + _1718;
    float _2177 = _2173 * 0.5;
    out.gl_Position.x = _1750;
    out.gl_Position.y = _1764;
    out.gl_Position.z = _2171;
    out.gl_Position.w = _1718;
    float _2179 = _2175 * 0.5;
    float _2181 = _2131;
    float _2183 = _1718;
    float _2185 = _2179;
    float _2187 = _2149;
    float _2189 = _2177;
    if (!_2169)
    {
        _2181 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2191 = _2181;
    out.m_89.x = _2177;
    out.m_89.y = _2149;
    out.m_89.z = _2179;
    out.m_89.w = _1718;
    float _2193 = _1448 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2195 = _2191;
    float _2197 = _2191;
    if (!_2169)
    {
        _2183 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2199 = _2183;
    float _2201 = _2199;
    float _2203 = _2199;
    if (!_2169)
    {
        _2185 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2205 = _2185;
    float _2207 = _2205;
    float _2209 = _2205;
    if (!_2169)
    {
        _2187 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2211 = _2187;
    float _2213 = _2211;
    float _2215 = _2211;
    if (!_2169)
    {
        _2189 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2217 = _2189;
    float _2219 = -_1760;
    float _2221 = _2219 + 1.0;
    float _2223 = _2221 * _2157;
    float _2225 = precise::clamp(_2223, 0.0, 1.0);
    float _2227 = -_2225;
    float _2229 = fma(_2227, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2231 = _2229 * _2141;
    float _2233 = _2019 * _1778;
    float _2235 = -_2019;
    float _2237 = _2235 + 1.0;
    float _2239 = _2231 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2241 = _1793 * _2233;
    float _2243 = _1793 * _2237;
    out.m_91.x = _2239;
    float _2245 = _1803 * _2233;
    float _2247 = fma(_1799, _2241, _1787);
    float _2249 = fma(_1801, _2241, _1789);
    float _2251 = _2241;
    float _2253 = _2217;
    float _2255 = _2217;
    if (!_2169)
    {
        _2251 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2257 = _2251;
    float _2259 = fma(_1793, _2245, _1791);
    out.m_93.x = _2247;
    out.m_93.y = _2249;
    out.m_93.z = _2259;
    out.m_93.w = _2243;
    bool _2261 = !_2169;
    float _2263 = _2257;
    float _2265 = _2257;
    if (!_2261)
    {
        bool _2267 = _1594 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2269 = isnan(_1594);
        bool _2271 = _2267 || _2269;
        bool _2273 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2275 = _2271 || _2273;
        if (!_2275)
        {
            float _2277 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2279 = _1594 + _2277;
            float _2281 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2283 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2281;
            float _2285 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2287 = _2285 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2289 = 1.0 / _2283;
            float _2291 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2293 = _2291 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2295 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2297 = _2295 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2299 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2301 = _2299 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2303 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2305 = _2303 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2307 = _2279 * _2289;
            float _2309 = precise::clamp(_2307, 0.0, 1.0);
            float _2311 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2313 = _2311 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2315 = fma(_2309, _2287, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2317 = fma(_2309, _2313, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2319 = fma(_2309, _2293, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2321 = fma(_2309, _2297, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2323 = fma(_2309, _2301, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2325 = fma(_2309, _2305, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2265 = _2319;
            _2215 = _2323;
            _2197 = _2315;
            _2209 = _2321;
            _2203 = _2317;
            _2255 = _2325;
            _2327 = true;
        }
        else
        {
            bool _2329 = _1594 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2331 = isnan(_1594);
            bool _2333 = _2329 || _2331;
            bool _2335 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2337 = _2333 || _2335;
            if (!_2337)
            {
                _2195 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2339 = _2195;
            _2197 = _2339;
            if (!_2337)
            {
                _2263 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2341 = _2263;
            _2265 = _2341;
            if (!_2337)
            {
                _2201 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2343 = _2201;
            _2203 = _2343;
            if (!_2337)
            {
                _2207 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2345 = _2207;
            _2209 = _2345;
            if (!_2337)
            {
                _2213 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2347 = _2213;
            _2215 = _2347;
            if (!_2337)
            {
                _2253 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2349 = _2253;
            bool _2351 = !_2337;
            _2255 = _2349;
            if (!_2351)
            {
                bool _2353 = _1594 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2355 = isnan(_1594);
                bool _2357 = _2353 || _2355;
                bool _2359 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2361 = _2357 || _2359;
                if (!_2361)
                {
                    float _2363 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2365 = _1594 + _2363;
                    float _2367 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2369 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2367;
                    float _2371 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2373 = _2371 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2375 = 1.0 / _2369;
                    float _2377 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2379 = _2377 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2381 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2383 = _2381 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2385 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2387 = _2385 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2389 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2391 = _2389 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2393 = _2365 * _2375;
                    float _2395 = precise::clamp(_2393, 0.0, 1.0);
                    float _2397 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2399 = _2397 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2401 = fma(_2395, _2373, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2403 = fma(_2395, _2399, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2405 = fma(_2395, _2379, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2407 = fma(_2395, _2383, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2409 = fma(_2395, _2387, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2411 = fma(_2395, _2391, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2265 = _2405;
                    _2215 = _2409;
                    _2197 = _2401;
                    _2209 = _2407;
                    _2203 = _2403;
                    _2255 = _2411;
                    _2327 = true;
                }
                else
                {
                    _2265 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2215 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2197 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2209 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2203 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2255 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2327 = false;
    float _2413 = _2265;
    float _2415 = _2215;
    float _2417 = _2197;
    float _2419 = _2209;
    float _2421 = _2203;
    float _2423 = _2255;
    float _2425 = fma(_2135, -0.5, 0.5);
    float _2427 = precise::clamp(_2425, 0.0, 1.0);
    float _2429 = -_2413;
    float _2431 = _2429 + _2415;
    float _2433 = _2193 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2435 = -_2417;
    float _2437 = _2435 + _2419;
    float _2439 = fma(_2427, _2431, _2413);
    out.m_95.x = 0.0;
    float _2441 = -_2421;
    float _2443 = _2441 + _2423;
    float _2445 = fma(_2427, _2437, _2417);
    float _2447 = _2439 * 0.586610972881317138671875;
    out.m_49.x = _2433;
    bool _2449 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2451 = fma(_2427, _2443, _2421);
    float _2453 = fma(_2445, 0.298911988735198974609375, _2447);
    bool _2455 = _1448 > 0.0;
    bool _2457 = isnan(_1448);
    bool _2459 = _2455 || _2457;
    bool _2461 = isnan(0.0);
    bool _2463 = _2459 || _2461;
    float _2465 = fma(_2451, 0.114477999508380889892578125, _2453);
    float _2467 = -_2465;
    float _2469 = _2445 + _2467;
    float _2471 = -_2465;
    float _2473 = _2439 + _2471;
    float _2475 = -_2465;
    float _2477 = _2451 + _2475;
    float _2479 = fma(_2469, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2465);
    float _2481 = fma(_2473, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2465);
    float _2483 = fma(_2477, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2465);
    bool _2485 = !_2449;
    if (!_2485)
    {
        float _2487 = -_1394;
        float _2489 = _2487 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2491 = -_1396;
        float _2493 = _2491 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2495 = -_1398;
        float _2497 = _2495 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2499 = _2489 * _2489;
        float _2501 = fma(_2493, _2493, _2499);
        float _2503 = fma(_2497, _2497, _2501);
        float _2505 = sqrt(_2503);
        float _2507 = rsqrt(_2503);
        float _2509 = -_2505;
        float _2511 = _2509 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2513 = _2511 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2515 = precise::clamp(_2513, 0.0, 1.0);
        float _2517 = _2493 * _2507;
        float _2519 = _2489 * _2507;
        float _2521 = abs(_2515);
        float _2523 = log2(_2521);
        float _2525 = _2497 * _2507;
        float _2527 = _2517 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2529 = _2135 * _2519;
        float _2531 = -_2519;
        float _2533 = -_2527;
        float _2535 = fma(_2531, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2533);
        float _2537 = fma(_2155, _2517, _2529);
        float _2539 = -_2525;
        float _2541 = fma(_2539, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2535);
        float _2543 = fma(_2159, _2525, _2537);
        float _2545 = precise::clamp(_2543, 0.0, 1.0);
        float _2547 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2549 = _2541 + _2547;
        float _2551 = _2523 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2553 = _2549 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2555 = precise::clamp(_2553, 0.0, 1.0);
        float _2557 = exp2(_2551);
        float _2559 = _2557 * _2555;
        float _2561 = _2545 * _2559;
        float _2563 = _2561 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2565 = _2561 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2567 = _2561 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_95.x = _2563;
        out.m_95.y = _2565;
        out.m_95.z = _2567;
    }
    out.m_71.x = _2479;
    out.m_71.y = _2481;
    out.m_71.z = _2483;
    if (_2463)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_49.x = 0.0;
    float _2569 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2569;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

