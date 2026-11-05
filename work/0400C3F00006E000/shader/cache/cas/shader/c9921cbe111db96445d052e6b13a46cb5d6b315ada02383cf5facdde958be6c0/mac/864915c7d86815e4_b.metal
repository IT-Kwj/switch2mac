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
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c13 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    texture2d<float> vp_t_tcb_28 [[id(6)]];
    sampler vp_t_tcb_28Smplr [[id(7)]];
    texture2d<float> vp_t_tcb_24 [[id(8)]];
    sampler vp_t_tcb_24Smplr [[id(9)]];
    texture3d<float> vp_t_tcb_32 [[id(10)]];
    sampler vp_t_tcb_32Smplr [[id(11)]];
    texture3d<float> vp_t_tcb_30 [[id(12)]];
    sampler vp_t_tcb_30Smplr [[id(13)]];
    texture2d<float> vp_t_tcb_1C [[id(14)]];
    sampler vp_t_tcb_1CSmplr [[id(15)]];
    sampler vp_t_tcb_28Smplr_w [[id(16)]];
    sampler vp_t_tcb_24Smplr_w [[id(17)]];
    sampler vp_t_tcb_32Smplr_w [[id(18)]];
    sampler vp_t_tcb_30Smplr_w [[id(19)]];
    sampler vp_t_tcb_1CSmplr_w [[id(20)]];
    constant dm_border_t* dm_border [[id(21)]];
};

struct main0_out
{
    float4 m_67 [[user(locn0)]];
    float4 m_77 [[user(locn1)]];
    float4 m_75 [[user(locn2)]];
    float4 m_85 [[user(locn3)]];
    float4 m_93 [[user(locn4)]];
    float4 m_51 [[user(locn5)]];
    float4 m_83 [[user(locn6)]];
    float4 m_91 [[user(locn7)]];
    float4 m_87 [[user(locn8)]];
    float4 m_89 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_71 [[attribute(0)]];
    float4 m_57 [[attribute(1)]];
    float4 m_59 [[attribute(2)]];
    float4 m_61 [[attribute(3)]];
    float4 m_73 [[attribute(4)]];
    float4 m_55 [[attribute(5)]];
    float4 m_48 [[attribute(6)]];
    float4 m_53 [[attribute(7)]];
    float4 m_81 [[attribute(8)]];
    float4 m_79 [[attribute(9)]];
    float4 m_63 [[attribute(10)]];
    float4 m_65 [[attribute(11)]];
    float4 m_69 [[attribute(13)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2447 = false;
    bool _596 = false;
    bool _404 = false;
    bool _236 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _107 = in.m_48.w;
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
        out.m_51.x = 0.0;
    }
    int _124 = 0;
    if (!_116)
    {
        float _126 = _120 * 5.0;
        _124 = as_type<int>(_126);
    }
    int _128 = _124;
    int _130 = _128;
    if (!_116)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2752 = as_type<float>(_128);
        out.gl_Position.z = _2752;
    }
    if (!_116)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _132 = in.m_53.w;
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
        float _152 = float(_112);
        _148 = _152;
    }
    float _154 = _148;
    bool _156 = _146 >= _154;
    bool _158 = !_142;
    bool _160 = _156 || _158;
    if (_160)
    {
        _122 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _162 = _122;
    if (_160)
    {
        out.m_51.x = 0.0;
    }
    if (_160)
    {
        float _164 = _162 * 5.0;
        _130 = as_type<int>(_164);
    }
    int _166 = _130;
    if (_160)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2821 = as_type<float>(_166);
        out.gl_Position.z = _2821;
    }
    if (_160)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _168 = in.m_55.x;
    float _170 = in.m_55.y;
    float _172 = in.m_55.z;
    bool _174 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _176 = in.m_57.x;
    float _178 = in.m_57.y;
    float _180 = in.m_57.z;
    float _182 = in.m_59.x;
    float _184 = in.m_59.y;
    float _186 = in.m_59.z;
    float _188 = in.m_61.x;
    float _190 = in.m_61.y;
    float _192 = in.m_61.z;
    float _194 = _170 * _178;
    float _196 = _170 * _184;
    float _198 = fma(_168, _176, _194);
    float _200 = _170 * _190;
    float _202 = fma(_168, _182, _196);
    float _204 = fma(_168, _188, _200);
    float _206 = fma(_172, _180, _198);
    float _208 = fma(_172, _186, _202);
    float _210 = fma(_172, _192, _204);
    bool _212 = !_174;
    float _214 = _206;
    float _216 = _208;
    float _234;
    if (!_212)
    {
        float _218 = in.m_63.x;
        float _220 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _222 = _218 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _224 = fma(_222, (*spvDescriptorSet0.vp_c9)._m0[12].x, _146);
        float _226 = _224 * _220;
        float _228 = floor(_226);
        float _230 = -_228;
        float _232 = _226 + _230;
        _234 = _232;
        _236 = true;
    }
    else
    {
        float _238 = float(_112);
        float _240 = 1.0 / _238;
        float _242 = _146 * _240;
        _234 = _242;
    }
    _236 = false;
    float _244 = _234;
    float _246 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _248 = _244 + _246;
    bool _250 = _244 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _252 = isnan(_244);
    bool _254 = _250 || _252;
    bool _256 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _258 = _254 || _256;
    float _260 = float(_258);
    float _262 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _264 = _244 + _262;
    bool _266 = _244 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _268 = isnan(_244);
    bool _270 = _266 || _268;
    bool _272 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _274 = _270 || _272;
    float _276 = float(_274);
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _280 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _278;
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _284 = _282 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _286 = _244 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _288 = isnan(_244);
    bool _290 = _286 || _288;
    bool _292 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _294 = _290 || _292;
    float _296 = float(_294);
    float _298 = -_260;
    float _300 = _298 + 1.0;
    float _302 = 1.0 / _284;
    float _304 = _296 * _300;
    float _306 = -_296;
    float _308 = _306 + 1.0;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _312 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _310;
    bool _314 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _316 = 1.0 / _280;
    float _318 = _276 * _308;
    float _320 = -_276;
    float _322 = _320 + 1.0;
    float _324 = _264 * _302;
    float _326 = _248 * _316;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _330 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _328;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _334 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _332;
    float _336 = fma(_312, _326, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _338 = fma(_330, _326, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _340 = fma(_334, _326, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _342 = _336 * _318;
    float _344 = _338 * _318;
    float _346 = _340 * _318;
    float _348 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _350 = _348 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _354 = _352 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _358 = _356 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _360 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[143].x, _342);
    float _362 = fma(_350, _324, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _364 = fma(_354, _324, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _366 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[143].y, _344);
    float _368 = fma(_358, _324, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _370 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[143].z, _346);
    float _372 = fma(_362, _304, _360);
    float _374 = fma(_364, _304, _366);
    float _376 = fma(_368, _304, _370);
    float _378 = fma(_260, (*spvDescriptorSet0.vp_c9)._m0[145].x, _372);
    float _380 = fma(_260, (*spvDescriptorSet0.vp_c9)._m0[145].y, _374);
    float _382 = fma(_260, (*spvDescriptorSet0.vp_c9)._m0[145].z, _376);
    bool _384 = !_314;
    float _402;
    if (!_384)
    {
        float _386 = in.m_63.x;
        float _388 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _390 = _386 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _392 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[11].y, _146);
        float _394 = _392 * _388;
        float _396 = floor(_394);
        float _398 = -_396;
        float _400 = _394 + _398;
        _402 = _400;
        _404 = true;
    }
    else
    {
        float _406 = float(_112);
        float _408 = 1.0 / _406;
        float _410 = _146 * _408;
        _402 = _410;
    }
    _404 = false;
    float _412 = _402;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _416 = _412 + _414;
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _420 = _418 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _424 = _422 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _426 = _412 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _428 = isnan(_412);
    bool _430 = _426 || _428;
    bool _432 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _434 = _430 || _432;
    float _436 = float(_434);
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _440 = _438 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _442 = _412 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _444 = isnan(_412);
    bool _446 = _442 || _444;
    bool _448 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _450 = _446 || _448;
    float _452 = float(_450);
    float _454 = 1.0 / _420;
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _458 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _456;
    float _460 = -_436;
    float _462 = _460 + 1.0;
    bool _464 = _412 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _466 = isnan(_412);
    bool _468 = _464 || _466;
    bool _470 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _472 = _468 || _470;
    float _474 = float(_472);
    bool _476 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _478 = 1.0 / _424;
    float _480 = 1.0 / _440;
    float _482 = _458 * _454;
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _486 = _484 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _488 = _452 * _462;
    float _490 = -_452;
    float _492 = _490 + 1.0;
    float _494 = fma(_482, _416, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _498 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _496;
    float _500 = _474 * _492;
    float _502 = _486 * _478;
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _506 = _412 + _504;
    bool _508 = _412 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _510 = isnan(_412);
    bool _512 = _508 || _510;
    bool _514 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _516 = _512 || _514;
    float _518 = float(_516);
    float _520 = _494 * _500;
    float _522 = -_474;
    float _524 = _522 + 1.0;
    float _526 = fma(_502, _506, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _530 = _412 + _528;
    float _532 = _498 * _480;
    float _534 = -_518;
    float _536 = _534 + 1.0;
    float _538 = fma(_524, (*spvDescriptorSet0.vp_c9)._m0[115].x, _520);
    float _540 = fma(_532, _530, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _542 = _436 * _536;
    float _544 = fma(_526, _488, _538);
    float _546 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _548 = fma(_540, _542, _544);
    float _550 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _552 = _546 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _554 = fma(_518, (*spvDescriptorSet0.vp_c9)._m0[118].x, _548);
    float _556 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _558 = _550 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _560 = _554 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _562 = in.m_65.x;
    float _564 = in.m_65.y;
    float _566 = in.m_65.z;
    float _568 = _556 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_67.x = _558;
    out.m_67.y = _568;
    out.m_67.z = _552;
    out.m_67.w = _560;
    float _570 = _382 * _566;
    float _572 = _380 * _564;
    float _574 = _378 * _562;
    bool _576 = !_476;
    float _594;
    if (!_576)
    {
        float _578 = in.m_63.x;
        float _580 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _582 = _578 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _584 = fma(_582, (*spvDescriptorSet0.vp_c9)._m0[11].w, _146);
        float _586 = _584 * _580;
        float _588 = floor(_586);
        float _590 = -_588;
        float _592 = _586 + _590;
        _594 = _592;
        _596 = true;
    }
    else
    {
        float _598 = float(_112);
        float _600 = 1.0 / _598;
        float _602 = _146 * _600;
        _594 = _602;
    }
    _596 = false;
    float _604 = _594;
    float _606 = in.m_48.x;
    float _608 = in.m_48.y;
    float _610 = in.m_48.z;
    float _612 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _614 = log2(_612);
    float _616 = in.m_69.y;
    int _618 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _620 = _618 != 0;
    float _622 = in.m_63.y;
    float _624 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _626 = _624 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _628 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _630 = _628 != 0;
    float _632 = in.m_63.x;
    float _634 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _636 = in.m_63.z;
    int _638 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _640 = _638 != 0;
    int _642 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _644 = _642 != 0;
    int _646 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _648 = _646 != 0;
    float _650 = _614 * _146;
    float _652 = in.m_69.x;
    float _654 = 1.0 / _626;
    float _656 = _178 * _608;
    float _658 = in.m_71.y;
    float _660 = _190 * _608;
    float _662 = fma(_176, _606, _656);
    float _664 = -_616;
    float _666 = _664 + 1.0;
    float _668 = fma(_188, _606, _660);
    float _670 = exp2(_650);
    bool _672 = _622 > 0.5;
    float _674 = fma(_180, _610, _662);
    float _676 = fma(_192, _610, _668);
    float _678 = _632 * 2.0;
    float _680 = _616;
    float _682 = _606;
    if (_620)
    {
        float _684 = _672 ? _666 : _616;
        _680 = _684;
    }
    float _686 = _680;
    float _688 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _690 = 1.0 + _688;
    bool _692 = _632 > 0.5;
    bool _694 = _692 && _630;
    float _696 = _636 * 2.0;
    bool _698 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _700 = isnan(1.0);
    bool _702 = _698 || _700;
    bool _704 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _706 = _702 || _704;
    float _708 = _622 + _636;
    float _710 = 1.0 / _690;
    float _712 = _690;
    if (_630)
    {
        _682 = _652;
    }
    float _714 = _682;
    float _716 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _718 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _716;
    float _720 = _708 + (-1.0);
    float _722 = in.m_57.w;
    float _724 = _608 + _658;
    float _726 = _718 * _654;
    float _728 = floor(_696);
    float _730 = _714;
    if (!_630)
    {
        _712 = _652;
    }
    float _732 = _712;
    float _734 = _732;
    if (_694)
    {
        float _736 = -_714;
        float _738 = _736 + 1.0;
        _730 = _738;
    }
    float _740 = _730;
    float _742 = _622 * 2.0;
    float _744 = fma(_720, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _746 = -_670;
    float _748 = _746 + 1.0;
    float _750 = in.m_61.w;
    int _752 = as_type<int>(_744);
    if (_630)
    {
        _734 = _740;
    }
    float _754 = _734;
    float _756 = floor(_678);
    bool _758 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _760 = isnan(0.0);
    bool _762 = _758 || _760;
    bool _764 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _766 = _762 || _764;
    float _768 = _632 + _622;
    float _770 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _772 = _724 + _770;
    float _774 = _766 ? _748 : 0.0;
    float _776 = _768 + (-1.0);
    float _778 = _754 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _780 = floor(_742);
    bool _782 = _728 > 0.0;
    float _784 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _786 = _728 >= 0.0;
    bool _788 = isnan(_728);
    bool _790 = _786 || _788;
    bool _792 = isnan(0.0);
    bool _794 = _790 || _792;
    float _796 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _798 = _604 + _796;
    bool _800 = _604 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _802 = isnan(_604);
    bool _804 = _800 || _802;
    bool _806 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _808 = _804 || _806;
    float _810 = float(_808);
    if (_706)
    {
        float _812 = _774 * _710;
        _150 = _812;
    }
    float _814 = _150;
    bool _816 = _604 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _818 = isnan(_604);
    bool _820 = _816 || _818;
    bool _822 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _824 = _820 || _822;
    float _826 = float(_824);
    float _828 = fma(_726, _798, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _830 = _756 >= 0.0;
    bool _832 = isnan(_756);
    bool _834 = _830 || _832;
    bool _836 = isnan(0.0);
    bool _838 = _834 || _836;
    float _840 = -_810;
    float _842 = _840 + 1.0;
    bool _844 = _756 > 0.0;
    float _846 = _674 + _722;
    int _848 = _794 ? 0 : 1;
    float _850 = _826 * _842;
    int _852 = _838 ? 0 : 1;
    float _854 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _856 = _846 + _854;
    bool _858 = _780 > 0.0;
    float _860 = _828 * _850;
    bool _862 = _780 >= 0.0;
    bool _864 = isnan(_780);
    bool _866 = _862 || _864;
    bool _868 = isnan(0.0);
    bool _870 = _866 || _868;
    float _872 = -_826;
    float _874 = _872 + 1.0;
    float _876 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _878 = ~_848;
    int _880 = _878 + 1;
    int _882 = _880 + 1;
    float _884 = _676 + _750;
    int _886 = _882;
    if (!_782)
    {
        int _888 = ~_848;
        int _890 = _888 + 1;
        _886 = _890;
    }
    int _892 = _886;
    float _894 = fma(_874, (*spvDescriptorSet0.vp_c9)._m0[131].x, _860);
    float _896 = _772 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _898 = _870 ? 0 : 1;
    float _900 = _622 + (-0.5);
    bool _902 = !_640;
    int _904 = _902 ? 0 : 1;
    float _906 = fma(_856, (*spvDescriptorSet0.vp_c8)._m0[28].x, _896);
    int _908 = ~_852;
    int _910 = _908 + 1;
    int _912 = _910 + 1;
    int _914 = _912;
    if (!_844)
    {
        int _916 = ~_852;
        int _918 = _916 + 1;
        _914 = _918;
    }
    int _920 = _914;
    float _922 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _924 = _884 + _922;
    int _926 = ~_898;
    int _928 = _926 + 1;
    int _930 = _928 + 1;
    int _932 = abs(_904);
    float _934 = fma(_924, (*spvDescriptorSet0.vp_c8)._m0[28].z, _906);
    int _936 = _930;
    if (!_858)
    {
        int _938 = ~_898;
        int _940 = _938 + 1;
        _936 = _940;
    }
    int _942 = _936;
    float _944 = _686 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _946 = fma(_810, (*spvDescriptorSet0.vp_c9)._m0[132].x, _894);
    bool _948 = !_644;
    int _950 = _948 ? 0 : 1;
    float _952 = float(_932);
    float _954 = _944 * _876;
    float _956 = float(_892);
    float _958 = _778 * _634;
    float _960 = _946 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _962 = abs(_950);
    float _964 = _952 * _956;
    bool _966 = _934 >= 0.0;
    float _968 = in.m_73.x;
    float _970 = in.m_73.y;
    float _972 = in.m_73.z;
    float _974 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _976 = _772 * _772;
    float _978 = float(_920);
    float _980 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _982 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _984 = fma(_856, _856, _976);
    float _986 = float(_962);
    float _988 = _574 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    out.m_75.x = _958;
    out.m_75.y = _954;
    float _990 = fma(_924, _924, _984);
    float _992 = _964 * (-2.0);
    float _994 = _986 * _978;
    float _996 = _980 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _998 = rsqrt(_990);
    float _1000 = _974 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1002 = _982 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1004 = _978;
    if (_966)
    {
        _1004 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1006 = _1004;
    float _1008 = fma(_784, _992, _784);
    float _1010 = _994 * (-2.0);
    if (_966)
    {
        out.m_51.x = 0.0;
    }
    float _1012 = fma(_992, _968, _968);
    float _1014 = fma(_744, _1010, _744);
    out.m_77.x = _996;
    out.m_77.y = _1000;
    out.m_77.z = _1002;
    out.m_77.w = _960;
    float _1016 = _632 + (-0.5);
    float _1018 = fma(_1010, _970, _970);
    if (_966)
    {
        float _1020 = _1006 * 5.0;
        _752 = as_type<int>(_1020);
    }
    int _1022 = _752;
    float _1024 = _988 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _1026 = fma(_1016, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1012);
    if (_966)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4150 = as_type<float>(_1022);
        out.gl_Position.z = _4150;
    }
    float _1028 = fma(_1008, _814, _1026);
    bool _1030 = !_648;
    int _1032 = _1030 ? 0 : 1;
    float _1034 = _1024 * _998;
    int _1036 = abs(_1032);
    float _1038 = _856 * _1034;
    float _1040 = _772 * _1034;
    float _1042 = float(_1036);
    if (_966)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1044 = -_1040;
    float _1046 = _724 + _1044;
    float _1048 = _924 * _1034;
    float _1050 = -_1038;
    float _1052 = _846 + _1050;
    float _1054 = fma(_900, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1018);
    float _1056 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1058 = _1046 + _1056;
    float _1060 = -_1048;
    float _1062 = _884 + _1060;
    float _1064 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1066 = _1052 + _1064;
    float _1068 = float(_942);
    float _1070 = _1058 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1072 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1074 = _1062 + _1072;
    float _1076 = -_1040;
    float _1078 = _772 + _1076;
    float _1080 = _632 + _636;
    float _1082 = fma(_1066, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1070);
    float _1084 = _1042 * _1068;
    float _1086 = fma(_1014, _814, _1054);
    float _1088 = -_1038;
    float _1090 = _856 + _1088;
    float _1092 = fma(_1074, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1082);
    float _1094 = _1078 * _1078;
    float _1096 = _1080 + (-1.0);
    float _1098 = _1084 * (-2.0);
    bool _1100 = _1092 >= 0.0;
    float _1102 = fma(_1090, _1090, _1094);
    float _1104 = -_1048;
    float _1106 = _924 + _1104;
    float _1108 = fma(_1096, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1110 = fma(_1098, _972, _972);
    float _1112 = _636 + (-0.5);
    float _1114 = _1086 * 0.15915493667125701904296875;
    float _1116 = fma(_1106, _1106, _1102);
    float _1118 = fma(_1108, _1098, _1108);
    float _1120 = fma(_1112, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1110);
    float _1122 = _1114 * 6.283185482025146484375;
    float _1124 = sin(_1122);
    float _1126 = _1028 * 0.15915493667125701904296875;
    float _1128 = _1110;
    if (_1100)
    {
        _1128 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1130 = _1128;
    float _1132 = fma(_1118, _814, _1120);
    int _1134 = as_type<int>(_1130);
    if (_1100)
    {
        out.m_51.x = 0.0;
    }
    float _1136 = _1114 * 6.283185482025146484375;
    float _1138 = cos(_1136);
    if (_1100)
    {
        float _1140 = _1130 * 5.0;
        _1134 = as_type<int>(_1140);
    }
    int _1142 = _1134;
    if (_1100)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4341 = as_type<float>(_1142);
        out.gl_Position.z = _4341;
    }
    float _1144 = sqrt(_1116);
    float _1146 = _1126 * 6.283185482025146484375;
    float _1148 = sin(_1146);
    float _1150 = _1126 * 6.283185482025146484375;
    float _1152 = cos(_1150);
    float _1154 = _1132 * 0.15915493667125701904296875;
    if (_1100)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1156 = in.m_79.x;
    float _1158 = in.m_79.y;
    float _1160 = in.m_79.z;
    float _1162 = _1154 * 6.283185482025146484375;
    float _1164 = cos(_1162);
    float _1166 = _998 * _1144;
    float _1168 = _572 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1170 = _1148 * _1124;
    float _1172 = _1148 * _1138;
    float _1174 = _570 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1176 = _1166 * _1168;
    float _1178 = _1154 * 6.283185482025146484375;
    float _1180 = sin(_1178);
    float _1182 = _1152 * _1138;
    float _1184 = _1152 * _1124;
    float _1186 = _988 * _1166;
    float _1188 = _1148 * _1164;
    float _1190 = _1152 * _1164;
    float _1192 = _1138 * _1164;
    float _1194 = _1124 * _1164;
    float _1196 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1158);
    float _1198 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1156);
    float _1200 = _1196 * _1176;
    float _1202 = _1166 * _1174;
    float _1204 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1160);
    float _1206 = _1198 * _1186;
    float _1208 = fma(_1180, _1182, _1170);
    float _1210 = _1190 * _1200;
    float _1212 = _1204 * _1202;
    float _1214 = -_1172;
    float _1216 = fma(_1180, _1184, _1214);
    float _1218 = -_1200;
    float _1220 = _1180 * _1218;
    float _1222 = fma(_1208, _1206, _1210);
    float _1224 = -_1184;
    float _1226 = fma(_1180, _1172, _1224);
    float _1228 = _1188 * _1200;
    float _1230 = fma(_1192, _1206, _1220);
    float _1232 = fma(_1216, _1212, _1222);
    float _1234 = fma(_1180, _1170, _1182);
    float _1236 = fma(_1226, _1206, _1228);
    float _1238 = fma(_1194, _1212, _1230);
    float _1240 = _1232 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1242 = _1232 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1244 = fma(_1234, _1212, _1236);
    float _1246 = _1232 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1248 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1240);
    float _1250 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1242);
    float _1252 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1246);
    float _1254 = fma(_1244, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1248);
    float _1256 = fma(_1244, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1250);
    float _1258 = fma(_1244, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1252);
    float _1260 = _1254 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1262 = _1256 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1264 = _1258 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1266 = _884 + _1260;
    float _1268 = _846 + _1262;
    float _1270 = _724 + _1264;
    float _1272 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1274 = _1266 + _1272;
    float _1276 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1278 = _1268 + _1276;
    float _1280 = _1274 * _1274;
    float _1282 = fma(_1278, _1278, _1280);
    float _1284 = sqrt(_1282);
    bool _1286 = _1284 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1288 = _1244;
    float _1290 = _1268;
    float _1292 = _1266;
    float _1294 = _1166;
    if (!_1286)
    {
        _1288 = _1268;
    }
    float _1296 = _1288;
    float _1298 = _1296;
    if (!_1286)
    {
        _1290 = _1266;
    }
    float _1300 = _1290;
    float _1302 = _1300;
    if (!_1286)
    {
        _1292 = _1270;
    }
    float _1304 = _1292;
    bool _1306 = !_1286;
    float _1308 = _1304;
    if (!_1306)
    {
        float _1310 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1312 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1314 = _1284 + _1312;
        float _1316 = rsqrt(_1282);
        float _1318 = _1314 * _1310;
        float _1320 = _1270 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1322 = _1318 * 0.15915493667125701904296875;
        float _1324 = _1322 * 6.283185482025146484375;
        float _1326 = cos(_1324);
        float _1328 = _1322 * 6.283185482025146484375;
        float _1330 = sin(_1328);
        float _1332 = _1326 + (-1.0);
        float _1334 = fma(_1330, _1320, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1336 = _1332 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1338 = _1316 * _1334;
        float _1340 = fma(_1270, _1326, _1336);
        float _1342 = fma(_1278, _1338, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1344 = fma(_1274, _1338, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1298 = _1342;
        _1302 = _1344;
        _1308 = _1340;
    }
    float _1346 = _1298;
    float _1348 = _1302;
    float _1350 = _1308;
    float _1352 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _1354 = _1346 + _1352;
    float _1356 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _1358 = _1348 + _1356;
    float _1360 = fma(_1354, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _1362 = fma(_1358, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _4701 = float2(_1360, _1362);
    float _1364 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_4701, float2(0.0), isnan(_4701)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_4701, float2(0.0), isnan(_4701)), level(0.0)).x;
    float _1366 = -_724;
    float _1368 = _1366 + _1350;
    float _1370 = -_846;
    float _1372 = _1370 + _1346;
    float _1374 = -_884;
    float _1376 = _1374 + _1348;
    bool _1378 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1380 = isnan(0.5);
    bool _1382 = _1378 || _1380;
    bool _1384 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1386 = _1382 || _1384;
    bool _1388 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1390 = isnan(0.5);
    bool _1392 = _1388 || _1390;
    bool _1394 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1396 = _1392 || _1394;
    float _1398 = fma(_1364, 100.0, _724);
    float _1400 = _1368 * _1368;
    float _1402 = fma(_1364, 100.0, _1350);
    float _1404 = -_1040;
    float _1406 = _1404 + _1398;
    float _1408 = fma(_1372, _1372, _1400);
    float _1410 = _1406 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1412 = _1406 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1414 = fma(_1376, _1376, _1408);
    float _1416 = fma(_1052, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1410);
    float _1418 = sqrt(_1414);
    float _1420 = fma(_1062, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1416);
    float _1422 = _1420 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1424 = fma(_1052, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1412);
    float _1426 = 1.0 / _1422;
    float _1428 = fma(_1062, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1424);
    float _1430 = _1428 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1432 = _1418 > 0.0;
    float _1434 = _1430 + _1422;
    float _1436 = _1434 * _1426;
    float _1438 = _1436 * 0.5;
    float _1440 = _1350;
    float _1442 = _1438;
    float _1444 = _1348;
    float _1446 = _1398;
    if (!_1432)
    {
        _1440 = _1402;
    }
    float _1448 = _1440;
    float _1450 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1452 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1450);
    float _1454 = _1448;
    if (!_1432)
    {
        _1442 = _1346;
    }
    float _1456 = _1442;
    float _1458 = 1.0 / _1452;
    bool _1460 = !_1432;
    float _1462 = _1456;
    if (!_1460)
    {
        float _1464 = _208 * _208;
        float _1466 = rsqrt(_1414);
        float _1468 = fma(_206, _206, _1464);
        float _1470 = fma(_210, _210, _1468);
        float _1472 = sqrt(_1470);
        float _1474 = _1372 * _1466;
        float _1476 = _1368 * _1466;
        float _1478 = _1376 * _1466;
        bool _1480 = _1472 > 0.0;
        float _1482 = _1468;
        float _1484 = _1466;
        if (!_1480)
        {
            _1482 = _1346;
        }
        float _1486 = _1482;
        _1462 = _1486;
        if (!_1480)
        {
            _1484 = _1402;
        }
        float _1488 = _1484;
        bool _1490 = !_1480;
        _1454 = _1488;
        if (!_1490)
        {
            float _1492 = rsqrt(_1470);
            float _1494 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1496 = _208 * _1492;
            float _1498 = _206 * _1492;
            float _1500 = _210 * _1492;
            float _1502 = _1476 * _1496;
            float _1504 = fma(_1474, _1498, _1502);
            float _1506 = _1494 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1508 = fma(_1478, _1500, _1504);
            float _1510 = _1508 * _1506;
            float _1512 = fma(_206, _1510, _1346);
            float _1514 = fma(_208, _1510, _1402);
            float _1516 = fma(_210, _1510, _1348);
            _1462 = _1512;
            _1444 = _1516;
            _1454 = _1514;
        }
    }
    float _1518 = _1462;
    float _1520 = _1444;
    float _1522 = _1454;
    float _1524 = -_1038;
    float _1526 = _1524 + _1518;
    float _1528 = -_1048;
    float _1530 = _1528 + _1520;
    float _1532 = -_1040;
    float _1534 = _1532 + _1522;
    float _1536 = _1534;
    float _1538 = _1526;
    float _1540 = _1530;
    if (_1396)
    {
        _214 = 1.0;
    }
    float _1542 = _214;
    float _1544 = _1542;
    if (!_1386)
    {
        float _1546 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1548 = _1406 + _1546;
        float _1550 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1552 = -_884;
        float _1554 = _1552 + _1520;
        float _1556 = -_1398;
        float _1558 = _1556 + _1522;
        float _1560 = _1548 * _1548;
        float _1562 = fma(_1066, _1066, _1560);
        float _1564 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1566 = fma(_1074, _1074, _1562);
        float _1568 = 1.0 / _1166;
        float _1570 = sqrt(_1566);
        float _1572 = _1564 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1574 = precise::min(_1570, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1576 = _1574 * _1550;
        float _1578 = -_846;
        float _1580 = _1578 + _1518;
        float _1582 = _1576 * _1568;
        float _1584 = _1572 * _1582;
        float _1586 = _1554 * _1582;
        float _1588 = fma(_1558, _1584, _1406);
        float _1590 = fma(_1580, _1584, _1052);
        float _1592 = fma(_1572, _1586, _1062);
        _1446 = _1558;
        _1536 = _1588;
        _1538 = _1590;
        _1540 = _1592;
        _216 = _1560;
        _1294 = _1568;
    }
    float _1594 = _1446;
    float _1596 = _1536;
    float _1598 = _1538;
    float _1600 = _1540;
    float _1602 = _216;
    float _1604 = _1294;
    float _1606 = _1604;
    float _1608 = _1594;
    float _1610 = _1602;
    if (_1396)
    {
        _1606 = 1.0;
    }
    float _1612 = _1606;
    float _1614 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1616 = _1458 * _1614;
    float _1618 = _1612;
    if (!_1396)
    {
        float _1620 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1622 = _1620 * 0.15915493667125701904296875;
        float _1624 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1626 = _1622 * 6.283185482025146484375;
        float _1628 = cos(_1626);
        float _1630 = _1624 * 0.15915493667125701904296875;
        float _1632 = _1622 * 6.283185482025146484375;
        float _1634 = sin(_1632);
        float _1636 = 1.0 / _1628;
        float _1638 = _1630 * 6.283185482025146484375;
        float _1640 = cos(_1638);
        float _1642 = _1634 * _1636;
        float _1644 = _1630 * 6.283185482025146484375;
        float _1646 = sin(_1644);
        float _1648 = _1640 * _1642;
        float _1650 = 1.0 / _1648;
        float _1652 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1654 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1652;
        float _1656 = 1.0 / _1654;
        float _1658 = _1646 * _1650;
        float _1660 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1662 = fma(_1616, _1658, _1660);
        float _1664 = _1662 * _1656;
        float _1666 = precise::clamp(_1664, 0.0, 1.0);
        _1608 = _1630;
        _1610 = _1662;
        _1544 = _1666;
    }
    float _1668 = _1608;
    float _1670 = _1610;
    float _1672 = _1544;
    float _1674 = _1668;
    float _1676 = _1670;
    if (!_1396)
    {
        float _1678 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1680 = _1678 * 0.15915493667125701904296875;
        float _1682 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1684 = _1680 * 6.283185482025146484375;
        float _1686 = cos(_1684);
        float _1688 = _1682 * 0.15915493667125701904296875;
        float _1690 = _1680 * 6.283185482025146484375;
        float _1692 = sin(_1690);
        float _1694 = 1.0 / _1686;
        float _1696 = _1688 * 6.283185482025146484375;
        float _1698 = cos(_1696);
        float _1700 = _1692 * _1694;
        float _1702 = _1688 * 6.283185482025146484375;
        float _1704 = sin(_1702);
        float _1706 = _1698 * _1700;
        float _1708 = 1.0 / _1706;
        float _1710 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1712 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1710;
        float _1714 = 1.0 / _1712;
        float _1716 = _1704 * _1708;
        float _1718 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1720 = fma(_1616, _1716, _1718);
        float _1722 = _1720 * _1714;
        float _1724 = precise::clamp(_1722, 0.0, 1.0);
        float _1726 = -_1724;
        float _1728 = _1726 + 1.0;
        _1674 = _1694;
        _1676 = _1716;
        _1618 = _1728;
    }
    float _1730 = _1674;
    float _1732 = _1676;
    float _1734 = _1618;
    float _1736 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1738 = _1596 + _1736;
    float _1740 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1742 = _1598 + _1740;
    float _1744 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1746 = _1600 + _1744;
    float _1748 = _1738 * _1738;
    float _1750 = _1596 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1752 = fma(_1742, _1742, _1748);
    float _1754 = fma(_1052, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1756 = fma(_1598, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1750);
    float _1758 = fma(_1746, _1746, _1752);
    float _1760 = fma(_1600, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1756);
    float _1762 = rsqrt(_1758);
    float _1764 = _1760 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1766 = sqrt(_1758);
    float _1768 = _1762 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1770 = _1742 * _1768;
    float _1772 = _1746 * _1768;
    float _1774 = _1770 * _1770;
    float _1776 = _1772 * _1772;
    float _1778 = _1774 + _1776;
    float _1780 = sqrt(_1778);
    bool _1782 = _1780 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1784 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1786 = _1780 + _1784;
    float _1788 = _1762;
    float _1790 = _1732;
    float _1792 = _1786;
    float _1794 = _1730;
    float _1796 = _1738;
    float _1798 = _1778;
    if (_1782)
    {
        float _1800 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1788 = _1800;
    }
    float _1802 = _1788;
    if (_1782)
    {
        float _1804 = rsqrt(_1778);
        _1790 = _1804;
    }
    float _1806 = _1790;
    float _1808 = _1806;
    if (_1782)
    {
        float _1810 = _1786 * _1802;
        _1792 = _1810;
    }
    float _1812 = _1792;
    if (_1782)
    {
        float _1814 = _1812 * 0.15915493667125701904296875;
        _1794 = _1814;
    }
    float _1816 = _1794;
    float _1818 = _1746;
    float _1820 = _1816;
    if (_1782)
    {
        float _1822 = _1816 * 6.283185482025146484375;
        float _1824 = sin(_1822);
        _1818 = _1824;
    }
    float _1826 = _1818;
    float _1828 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1830 = precise::max(0.0, _1828);
    float _1832 = _1802;
    float _1834 = _1830;
    if (_1782)
    {
        float _1836 = _1816 * 6.283185482025146484375;
        float _1838 = cos(_1836);
        _1832 = _1838;
    }
    float _1840 = _1832;
    float _1842 = -_1768;
    float _1844 = -_1830;
    float _1846 = fma(_1738, _1842, _1844);
    if (_1782)
    {
        float _1848 = _1846 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1796 = _1848;
    }
    float _1850 = _1796;
    float _1852 = _1850;
    if (!_1782)
    {
        _1820 = _1770;
    }
    float _1854 = _1820;
    float _1856 = _1826;
    float _1858 = _1854;
    if (_1782)
    {
        float _1860 = fma(_1826, _1850, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1856 = _1860;
    }
    float _1862 = _1856;
    float _1864 = _1862;
    float _1866 = _1840;
    if (_1782)
    {
        float _1868 = _1840 + (-1.0);
        _1834 = _1868;
    }
    float _1870 = _1834;
    float _1872 = _1870;
    if (_1782)
    {
        float _1874 = _1806 * _1862;
        _1852 = _1874;
    }
    float _1876 = _1852;
    if (!_1782)
    {
        _1808 = _1846;
    }
    float _1878 = _1808;
    float _1880 = _1878;
    if (_1782)
    {
        float _1882 = _1870 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1798 = _1882;
    }
    float _1884 = _1798;
    if (_1782)
    {
        float _1886 = _1770 * _1876;
        _1858 = _1886;
    }
    float _1888 = _1858;
    if (!_1782)
    {
        _1872 = _1772;
    }
    float _1890 = _1872;
    float _1892 = _1890;
    if (_1782)
    {
        float _1894 = _1772 * _1876;
        _1892 = _1894;
    }
    float _1896 = _1892;
    if (!_1782)
    {
        _1864 = _1774;
    }
    float _1898 = _1864;
    float _1900 = _1898;
    if (_1782)
    {
        float _1902 = fma(_1846, _1840, _1884);
        _1880 = _1902;
    }
    float _1904 = _1880;
    if (_1782)
    {
        float _1906 = _1888 * _1888;
        _1900 = _1906;
    }
    float _1908 = _1900;
    if (!_1782)
    {
        _1866 = _1776;
    }
    float _1910 = _1866;
    float _1912 = _1910;
    if (_1782)
    {
        float _1914 = _1896 * _1896;
        _1912 = _1914;
    }
    float _1916 = _1912;
    float _1918 = fma(_1904, _1904, _1908);
    float _1920 = _1596 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1922 = _1596 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1924 = floor(_1754);
    float _1926 = _1918 + _1916;
    float _1928 = fma(_1598, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1920);
    float _1930 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1932 = fma(_1766, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1930);
    float _1934 = precise::clamp(_1932, 0.0, 1.0);
    float _1936 = fma(_1598, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1922);
    float _1938 = fma(_1600, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1928);
    float _1940 = rsqrt(_1926);
    float _1942 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1944 = _1938 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1946 = -_1934;
    float _1948 = _1946 + 1.0;
    float _1950 = fma(_1600, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1936);
    float _1952 = _1944 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1954 = -_1924;
    float _1956 = _1754 + _1954;
    float _1958 = abs(_1948);
    float _1960 = log2(_1958);
    float _1962 = -_1952;
    float _1964 = fma(_1962, _1942, 1.0);
    float _1966 = _1596 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1968 = fma(_1062, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1970 = _1950 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1972 = _1940 * _1888;
    float _1974 = _1940 * _1904;
    float _1976 = _1940 * _1896;
    float _1978 = fma(_1598, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1966);
    float _1980 = _1972 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1982 = floor(_1968);
    float _1984 = _1970 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1986 = fma(_1600, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1978);
    float _1988 = -_1980;
    float _1990 = fma(_1974, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1988);
    float _1992 = _1960 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1994 = _1986 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1996 = _1970 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1998 = -_1976;
    float _2000 = fma(_1998, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1990);
    float _2002 = log2(_1964);
    float _2004 = fma(_1994, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1984);
    float _2006 = fma(_1994, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1996);
    float _2008 = fma(_2000, -0.5, 0.5);
    float _2010 = fma(_2000, 0.5, 0.5);
    float _2012 = _1974 + 1.0;
    float _2014 = fma(_1944, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2006);
    float _2016 = -_1982;
    float _2018 = _1968 + _2016;
    float _2020 = exp2(_1992);
    float _2022 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2014);
    float _2024 = _1970 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2026 = fma(_1944, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2004);
    float _2028 = fma(_2010, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2030 = fma(_1994, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2024);
    float _2032 = 1.0 / _2022;
    float _2034 = _2002 * 0.693147182464599609375;
    float _2036 = fma(_2010, _2028, -0.212114393711090087890625);
    float _2038 = fma(_1944, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2030);
    float _2040 = sqrt(_2008);
    float _2042 = -_1974;
    float _2044 = fma(_2020, _2012, _2042);
    float _2046 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2026);
    float _2048 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2038);
    float2 _5761 = float2(_1956, _2018);
    float _2050 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5761, float2(0.0), isnan(_5761)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5761, float2(0.0), isnan(_5761)), level(0.0)).x;
    float _2052 = fma(_2010, _2036, 1.570728778839111328125);
    float _2054 = _2034 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2056 = _2046 * _2032;
    float _2058 = _2048 * _2032;
    float _2060 = fma(_2056, 0.5, 0.5);
    float _2062 = fma(_2058, -0.5, 0.5);
    float _2064 = _2040 * 0.636619746685028076171875;
    float3 _5791 = float3(_2060, _2062, _2054);
    float _2066 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5791, float3(0.0), isnan(_5791)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5791, float3(0.0), isnan(_5791)), level(0.0)).x;
    float _2068 = -_2052;
    float _2070 = fma(_2064, _2068, 1.0);
    float _2072 = fma(_2044, 0.5, 0.5);
    float3 _5809 = float3(_2060, _2062, _2054);
    float4 _2075 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5809, float3(0.0), isnan(_5809)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5809, float3(0.0), isnan(_5809)), level(0.0)).xyzw;
    float _2077 = _2075.x;
    float _2079 = _2075.y;
    float _2081 = _2075.z;
    float _2083 = _2075.w;
    float2 _5825 = float2(_2070, _2072);
    float3 _2087 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5825, float2(0.0), isnan(_5825)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5825, float2(0.0), isnan(_5825)), level(0.0)).xyz;
    float _2089 = _2087.x;
    float _2091 = _2087.y;
    float _2093 = _2087.z;
    float _2095 = in.m_81.x;
    float _2097 = in.m_81.y;
    float _2099 = in.m_81.z;
    bool _2101 = _1158 != 0.0;
    bool _2103 = isnan(_1158);
    bool _2105 = _2101 || _2103;
    bool _2107 = isnan(0.0);
    bool _2109 = _2105 || _2107;
    float _2111 = _1208 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2113 = _1208 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2115 = _1190 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _2117 = _1156 == 0.0;
    bool _2119 = !_2109;
    bool _2121 = _2117 && _2119;
    float _2123 = _1208 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2125 = fma(_1192, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2111);
    float _2127 = _1190 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2129 = _1160 == 0.0;
    bool _2131 = _2129 && _2121;
    float _2133 = _1190 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2135 = -_1180;
    float _2137 = fma(_2135, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2115);
    float _2139 = -_1180;
    float _2141 = fma(_2139, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2127);
    float _2143 = fma(_1192, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2113);
    float _2145 = -_1180;
    float _2147 = fma(_2145, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2133);
    float _2149 = _1216 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2151 = fma(_1192, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2123);
    float _2153 = _1216 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2155 = _1216 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2157 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2149);
    float _2159 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2125);
    float _2161 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2143);
    float _2163 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2151);
    float _2165 = fma(_1188, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2141);
    float _2167 = _2095;
    float _2169 = _2097;
    float _2171 = _2099;
    float _2173 = _2022;
    float _2175 = _2048;
    if (!_2131)
    {
        float _2177 = fma(_1156, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2095);
        _2167 = _2177;
    }
    float _2179 = _2167;
    if (!_2131)
    {
        float _2181 = fma(_1158, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2097);
        _2169 = _2181;
    }
    float _2183 = _2169;
    float _2185 = abs(_1616);
    float _2187 = log2(_2185);
    float _2189 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2153);
    float _2191 = fma(_1188, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2137);
    float _2193 = fma(_1188, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2147);
    float _2195 = _2165 * _2183;
    if (!_2131)
    {
        float _2197 = fma(_1160, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2099);
        _2171 = _2197;
    }
    float _2199 = _2171;
    float _2201 = _2191 * _2183;
    float _2203 = _2193 * _2183;
    float _2205 = fma(_1234, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2157);
    float _2207 = fma(_2159, _2179, _2195);
    float _2209 = fma(_2161, _2179, _2201);
    float _2211 = fma(_2163, _2179, _2203);
    float _2213 = fma(_2205, _2199, _2207);
    float _2215 = _1960 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2217 = _2187 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2219 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2155);
    float _2221 = fma(_1234, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2189);
    float _2223 = _1970 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2225 = in.m_71.x;
    float _2227 = exp2(_2215);
    float _2229 = fma(_1234, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2219);
    float _2231 = fma(_2221, _2199, _2209);
    float _2233 = fma(_1994, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2223);
    bool _2235 = _1616 <= 8000.0;
    bool _2237 = isnan(_1616);
    bool _2239 = _2235 || _2237;
    bool _2241 = isnan(8000.0);
    bool _2243 = _2239 || _2241;
    float _2245 = float(_2243);
    float _2247 = fma(_2229, _2199, _2211);
    float _2249 = _2022 * 0.5;
    float _2251 = fma(_1944, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2233);
    float _2253 = exp2(_2217);
    out.m_83.x = _2213;
    out.m_83.y = _2231;
    out.m_83.z = _2247;
    float _2255 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2251);
    bool _2257 = _1766 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2259 = isnan(_1766);
    bool _2261 = _2257 || _2259;
    bool _2263 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2265 = _2261 || _2263;
    float _2267 = -_2227;
    float _2269 = _2267 + 1.0;
    out.gl_Position.x = _2046;
    out.gl_Position.y = _2048;
    out.gl_Position.z = _2255;
    out.gl_Position.w = _2022;
    float _2271 = fma(_2253, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2273 = precise::clamp(_2271, 0.0, 1.0);
    float _2275 = _2046 + _2022;
    float _2277 = fma(_2273, -2.0, 3.0);
    float _2279 = _2273 * _2273;
    float _2281 = _2275 * 0.5;
    float _2283 = _1672 * _1734;
    float _2285 = _2279 * _2277;
    float _2287 = -_2285;
    float _2289 = _2287 + 1.0;
    float _2291 = fma(_2289, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2285);
    float _2293 = _2255 + _2022;
    float _2295 = fma(_2048, -0.5, _2249);
    float _2297 = _2269 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2299 = _2245 * _2291;
    float _2301 = _2293 * 0.5;
    float _2303 = _2255;
    float _2305 = _2283;
    if (!_2265)
    {
        _2173 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2307 = _2173;
    float _2309 = _2299 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2311 = _2307;
    float _2313 = _2307;
    if (!_2265)
    {
        _2303 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2315 = _2303;
    out.m_85.x = _2281;
    out.m_85.y = _2295;
    out.m_85.z = _2301;
    out.m_85.w = _2022;
    float _2317 = _2315;
    float _2319 = _2315;
    if (!_2265)
    {
        _2175 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2321 = _2175;
    float _2323 = -_2050;
    float _2325 = _2323 + 1.0;
    float _2327 = _2325 * _2309;
    float _2329 = precise::clamp(_2327, 0.0, 1.0);
    float _2331 = -_2329;
    float _2333 = fma(_2331, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2335 = _2333 * _2225;
    float _2337 = _2297 * _2066;
    float _2339 = -_2297;
    float _2341 = _2339 + 1.0;
    float _2343 = _2335 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2345 = _2083 * _2337;
    float _2347 = _2083 * _2341;
    out.m_87.x = _2343;
    float _2349 = _2093 * _2337;
    float _2351 = fma(_2089, _2345, _2077);
    float _2353 = fma(_2091, _2345, _2079);
    float _2355 = _2079;
    float _2357 = _2077;
    float _2359 = _2321;
    float _2361 = _2321;
    if (!_2265)
    {
        _2355 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2363 = _2355;
    float _2365 = fma(_2083, _2349, _2081);
    float _2367 = _2283 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2369 = _2363;
    float _2371 = _2363;
    if (!_2265)
    {
        _2357 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2373 = _2357;
    float _2375 = _2373;
    float _2377 = _2373;
    if (!_2265)
    {
        _2305 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2379 = _2305;
    out.m_89.x = _2351;
    out.m_89.y = _2353;
    out.m_89.z = _2365;
    out.m_89.w = _2347;
    bool _2381 = !_2265;
    float _2383 = _2379;
    float _2385 = _2379;
    if (!_2381)
    {
        bool _2387 = _1766 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2389 = isnan(_1766);
        bool _2391 = _2387 || _2389;
        bool _2393 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2395 = _2391 || _2393;
        if (!_2395)
        {
            float _2397 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2399 = _1766 + _2397;
            float _2401 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2403 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2401;
            float _2405 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2407 = _2405 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2409 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2411 = _2409 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2413 = 1.0 / _2403;
            float _2415 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2417 = _2415 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2419 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2421 = _2419 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2423 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2425 = _2423 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2427 = _2399 * _2413;
            float _2429 = precise::clamp(_2427, 0.0, 1.0);
            float _2431 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2433 = _2431 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2435 = fma(_2429, _2407, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2437 = fma(_2429, _2411, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2439 = fma(_2429, _2417, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2441 = fma(_2429, _2433, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2443 = fma(_2429, _2421, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2445 = fma(_2429, _2425, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2377 = _2439;
            _2361 = _2435;
            _2371 = _2437;
            _2319 = _2443;
            _2313 = _2441;
            _2385 = _2445;
            _2447 = true;
        }
        else
        {
            bool _2449 = _1766 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2451 = isnan(_1766);
            bool _2453 = _2449 || _2451;
            bool _2455 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2457 = _2453 || _2455;
            if (!_2457)
            {
                _2369 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2459 = _2369;
            _2371 = _2459;
            if (!_2457)
            {
                _2375 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2461 = _2375;
            _2377 = _2461;
            if (!_2457)
            {
                _2311 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2463 = _2311;
            _2313 = _2463;
            if (!_2457)
            {
                _2317 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2465 = _2317;
            _2319 = _2465;
            if (!_2457)
            {
                _2359 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2467 = _2359;
            _2361 = _2467;
            if (!_2457)
            {
                _2383 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2469 = _2383;
            bool _2471 = !_2457;
            _2385 = _2469;
            if (!_2471)
            {
                bool _2473 = _1766 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2475 = isnan(_1766);
                bool _2477 = _2473 || _2475;
                bool _2479 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2481 = _2477 || _2479;
                if (!_2481)
                {
                    float _2483 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2485 = _1766 + _2483;
                    float _2487 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2489 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2487;
                    float _2491 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2493 = _2491 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2495 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2497 = _2495 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2499 = 1.0 / _2489;
                    float _2501 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2503 = _2501 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2505 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2507 = _2505 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2509 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2511 = _2509 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2513 = _2485 * _2499;
                    float _2515 = precise::clamp(_2513, 0.0, 1.0);
                    float _2517 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2519 = _2517 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2521 = fma(_2515, _2493, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2523 = fma(_2515, _2497, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2525 = fma(_2515, _2503, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2527 = fma(_2515, _2519, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2529 = fma(_2515, _2507, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2531 = fma(_2515, _2511, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2377 = _2525;
                    _2361 = _2521;
                    _2371 = _2523;
                    _2319 = _2529;
                    _2313 = _2527;
                    _2385 = _2531;
                    _2447 = true;
                }
                else
                {
                    _2377 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2361 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2371 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2319 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2313 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2385 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2447 = false;
    float _2533 = _2377;
    float _2535 = _2361;
    float _2537 = _2371;
    float _2539 = _2319;
    float _2541 = _2313;
    float _2543 = _2385;
    float _2545 = fma(_2231, -0.5, 0.5);
    float _2547 = precise::clamp(_2545, 0.0, 1.0);
    float _2549 = -_2533;
    float _2551 = _2549 + _2535;
    float _2553 = -_2537;
    float _2555 = _2553 + _2539;
    out.m_91.x = 0.0;
    float _2557 = -_2541;
    float _2559 = _2557 + _2543;
    float _2561 = fma(_2547, _2551, _2533);
    float _2563 = fma(_2547, _2555, _2537);
    bool _2565 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2567 = _2561 * 0.586610972881317138671875;
    float _2569 = fma(_2547, _2559, _2541);
    float _2571 = _2367 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2573 = fma(_2563, 0.298911988735198974609375, _2567);
    bool _2575 = _1672 > 0.0;
    bool _2577 = isnan(_1672);
    bool _2579 = _2575 || _2577;
    bool _2581 = isnan(0.0);
    bool _2583 = _2579 || _2581;
    float _2585 = fma(_2569, 0.114477999508380889892578125, _2573);
    out.m_51.x = _2571;
    bool _2587 = _1734 <= 0.0;
    bool _2589 = !_2583;
    bool _2591 = _2587 || _2589;
    float _2593 = -_2585;
    float _2595 = _2563 + _2593;
    float _2597 = -_2585;
    float _2599 = _2569 + _2597;
    float _2601 = fma(_2595, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2585);
    float _2603 = -_2585;
    float _2605 = _2561 + _2603;
    float _2607 = fma(_2605, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2585);
    float _2609 = fma(_2599, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2585);
    bool _2611 = !_2565;
    if (!_2611)
    {
        float _2613 = -_1596;
        float _2615 = _2613 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2617 = -_1598;
        float _2619 = _2617 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2621 = -_1600;
        float _2623 = _2621 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2625 = _2615 * _2615;
        float _2627 = fma(_2619, _2619, _2625);
        float _2629 = fma(_2623, _2623, _2627);
        float _2631 = sqrt(_2629);
        float _2633 = rsqrt(_2629);
        float _2635 = -_2631;
        float _2637 = _2635 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2639 = _2637 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2641 = precise::clamp(_2639, 0.0, 1.0);
        float _2643 = _2619 * _2633;
        float _2645 = _2615 * _2633;
        float _2647 = abs(_2641);
        float _2649 = log2(_2647);
        float _2651 = _2623 * _2633;
        float _2653 = _2643 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2655 = _2231 * _2645;
        float _2657 = -_2645;
        float _2659 = -_2653;
        float _2661 = fma(_2657, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2659);
        float _2663 = fma(_2213, _2643, _2655);
        float _2665 = -_2651;
        float _2667 = fma(_2665, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2661);
        float _2669 = fma(_2247, _2651, _2663);
        float _2671 = precise::clamp(_2669, 0.0, 1.0);
        float _2673 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2675 = _2667 + _2673;
        float _2677 = _2649 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2679 = _2675 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2681 = precise::clamp(_2679, 0.0, 1.0);
        float _2683 = exp2(_2677);
        float _2685 = _2683 * _2681;
        float _2687 = _2671 * _2685;
        float _2689 = _2687 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2691 = _2687 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2693 = _2687 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_91.x = _2689;
        out.m_91.y = _2691;
        out.m_91.z = _2693;
    }
    out.m_93.x = _2601;
    out.m_93.y = _2607;
    out.m_93.z = _2609;
    if (!_2591)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2695 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_51.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2695;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2447 = false;
    bool _596 = false;
    bool _404 = false;
    bool _236 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _107 = in.m_48.w;
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
        out.m_51.x = 0.0;
    }
    int _124 = 0;
    if (!_116)
    {
        float _126 = _120 * 5.0;
        _124 = as_type<int>(_126);
    }
    int _128 = _124;
    int _130 = _128;
    if (!_116)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2752 = as_type<float>(_128);
        out.gl_Position.z = _2752;
    }
    if (!_116)
    {
        return out;
    }
    float _132 = in.m_53.w;
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
        float _152 = float(_112);
        _148 = _152;
    }
    float _154 = _148;
    bool _156 = _146 >= _154;
    bool _158 = !_142;
    bool _160 = _156 || _158;
    if (_160)
    {
        _122 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _162 = _122;
    if (_160)
    {
        out.m_51.x = 0.0;
    }
    if (_160)
    {
        float _164 = _162 * 5.0;
        _130 = as_type<int>(_164);
    }
    int _166 = _130;
    if (_160)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2821 = as_type<float>(_166);
        out.gl_Position.z = _2821;
    }
    if (_160)
    {
        return out;
    }
    float _168 = in.m_55.x;
    float _170 = in.m_55.y;
    float _172 = in.m_55.z;
    bool _174 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _176 = in.m_57.x;
    float _178 = in.m_57.y;
    float _180 = in.m_57.z;
    float _182 = in.m_59.x;
    float _184 = in.m_59.y;
    float _186 = in.m_59.z;
    float _188 = in.m_61.x;
    float _190 = in.m_61.y;
    float _192 = in.m_61.z;
    float _194 = _170 * _178;
    float _196 = _170 * _184;
    float _198 = fma(_168, _176, _194);
    float _200 = _170 * _190;
    float _202 = fma(_168, _182, _196);
    float _204 = fma(_168, _188, _200);
    float _206 = fma(_172, _180, _198);
    float _208 = fma(_172, _186, _202);
    float _210 = fma(_172, _192, _204);
    bool _212 = !_174;
    float _214 = _206;
    float _216 = _208;
    float _234;
    if (!_212)
    {
        float _218 = in.m_63.x;
        float _220 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _222 = _218 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _224 = fma(_222, (*spvDescriptorSet0.vp_c9)._m0[12].x, _146);
        float _226 = _224 * _220;
        float _228 = floor(_226);
        float _230 = -_228;
        float _232 = _226 + _230;
        _234 = _232;
        _236 = true;
    }
    else
    {
        float _238 = float(_112);
        float _240 = 1.0 / _238;
        float _242 = _146 * _240;
        _234 = _242;
    }
    _236 = false;
    float _244 = _234;
    float _246 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _248 = _244 + _246;
    bool _250 = _244 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _252 = isnan(_244);
    bool _254 = _250 || _252;
    bool _256 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _258 = _254 || _256;
    float _260 = float(_258);
    float _262 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _264 = _244 + _262;
    bool _266 = _244 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _268 = isnan(_244);
    bool _270 = _266 || _268;
    bool _272 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _274 = _270 || _272;
    float _276 = float(_274);
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _280 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _278;
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _284 = _282 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _286 = _244 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _288 = isnan(_244);
    bool _290 = _286 || _288;
    bool _292 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _294 = _290 || _292;
    float _296 = float(_294);
    float _298 = -_260;
    float _300 = _298 + 1.0;
    float _302 = 1.0 / _284;
    float _304 = _296 * _300;
    float _306 = -_296;
    float _308 = _306 + 1.0;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _312 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _310;
    bool _314 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _316 = 1.0 / _280;
    float _318 = _276 * _308;
    float _320 = -_276;
    float _322 = _320 + 1.0;
    float _324 = _264 * _302;
    float _326 = _248 * _316;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _330 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _328;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _334 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _332;
    float _336 = fma(_312, _326, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _338 = fma(_330, _326, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _340 = fma(_334, _326, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _342 = _336 * _318;
    float _344 = _338 * _318;
    float _346 = _340 * _318;
    float _348 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _350 = _348 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _354 = _352 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _358 = _356 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _360 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[143].x, _342);
    float _362 = fma(_350, _324, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _364 = fma(_354, _324, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _366 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[143].y, _344);
    float _368 = fma(_358, _324, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _370 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[143].z, _346);
    float _372 = fma(_362, _304, _360);
    float _374 = fma(_364, _304, _366);
    float _376 = fma(_368, _304, _370);
    float _378 = fma(_260, (*spvDescriptorSet0.vp_c9)._m0[145].x, _372);
    float _380 = fma(_260, (*spvDescriptorSet0.vp_c9)._m0[145].y, _374);
    float _382 = fma(_260, (*spvDescriptorSet0.vp_c9)._m0[145].z, _376);
    bool _384 = !_314;
    float _402;
    if (!_384)
    {
        float _386 = in.m_63.x;
        float _388 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _390 = _386 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _392 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[11].y, _146);
        float _394 = _392 * _388;
        float _396 = floor(_394);
        float _398 = -_396;
        float _400 = _394 + _398;
        _402 = _400;
        _404 = true;
    }
    else
    {
        float _406 = float(_112);
        float _408 = 1.0 / _406;
        float _410 = _146 * _408;
        _402 = _410;
    }
    _404 = false;
    float _412 = _402;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _416 = _412 + _414;
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _420 = _418 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _424 = _422 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _426 = _412 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _428 = isnan(_412);
    bool _430 = _426 || _428;
    bool _432 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _434 = _430 || _432;
    float _436 = float(_434);
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _440 = _438 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _442 = _412 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _444 = isnan(_412);
    bool _446 = _442 || _444;
    bool _448 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _450 = _446 || _448;
    float _452 = float(_450);
    float _454 = 1.0 / _420;
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _458 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _456;
    float _460 = -_436;
    float _462 = _460 + 1.0;
    bool _464 = _412 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _466 = isnan(_412);
    bool _468 = _464 || _466;
    bool _470 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _472 = _468 || _470;
    float _474 = float(_472);
    bool _476 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _478 = 1.0 / _424;
    float _480 = 1.0 / _440;
    float _482 = _458 * _454;
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _486 = _484 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _488 = _452 * _462;
    float _490 = -_452;
    float _492 = _490 + 1.0;
    float _494 = fma(_482, _416, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _498 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _496;
    float _500 = _474 * _492;
    float _502 = _486 * _478;
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _506 = _412 + _504;
    bool _508 = _412 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _510 = isnan(_412);
    bool _512 = _508 || _510;
    bool _514 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _516 = _512 || _514;
    float _518 = float(_516);
    float _520 = _494 * _500;
    float _522 = -_474;
    float _524 = _522 + 1.0;
    float _526 = fma(_502, _506, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _530 = _412 + _528;
    float _532 = _498 * _480;
    float _534 = -_518;
    float _536 = _534 + 1.0;
    float _538 = fma(_524, (*spvDescriptorSet0.vp_c9)._m0[115].x, _520);
    float _540 = fma(_532, _530, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _542 = _436 * _536;
    float _544 = fma(_526, _488, _538);
    float _546 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _548 = fma(_540, _542, _544);
    float _550 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _552 = _546 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _554 = fma(_518, (*spvDescriptorSet0.vp_c9)._m0[118].x, _548);
    float _556 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _558 = _550 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _560 = _554 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _562 = in.m_65.x;
    float _564 = in.m_65.y;
    float _566 = in.m_65.z;
    float _568 = _556 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_67.x = _558;
    out.m_67.y = _568;
    out.m_67.z = _552;
    out.m_67.w = _560;
    float _570 = _382 * _566;
    float _572 = _380 * _564;
    float _574 = _378 * _562;
    bool _576 = !_476;
    float _594;
    if (!_576)
    {
        float _578 = in.m_63.x;
        float _580 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _582 = _578 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _584 = fma(_582, (*spvDescriptorSet0.vp_c9)._m0[11].w, _146);
        float _586 = _584 * _580;
        float _588 = floor(_586);
        float _590 = -_588;
        float _592 = _586 + _590;
        _594 = _592;
        _596 = true;
    }
    else
    {
        float _598 = float(_112);
        float _600 = 1.0 / _598;
        float _602 = _146 * _600;
        _594 = _602;
    }
    _596 = false;
    float _604 = _594;
    float _606 = in.m_48.x;
    float _608 = in.m_48.y;
    float _610 = in.m_48.z;
    float _612 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _614 = log2(_612);
    float _616 = in.m_69.y;
    int _618 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _620 = _618 != 0;
    float _622 = in.m_63.y;
    float _624 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _626 = _624 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _628 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _630 = _628 != 0;
    float _632 = in.m_63.x;
    float _634 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _636 = in.m_63.z;
    int _638 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _640 = _638 != 0;
    int _642 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _644 = _642 != 0;
    int _646 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _648 = _646 != 0;
    float _650 = _614 * _146;
    float _652 = in.m_69.x;
    float _654 = 1.0 / _626;
    float _656 = _178 * _608;
    float _658 = in.m_71.y;
    float _660 = _190 * _608;
    float _662 = fma(_176, _606, _656);
    float _664 = -_616;
    float _666 = _664 + 1.0;
    float _668 = fma(_188, _606, _660);
    float _670 = exp2(_650);
    bool _672 = _622 > 0.5;
    float _674 = fma(_180, _610, _662);
    float _676 = fma(_192, _610, _668);
    float _678 = _632 * 2.0;
    float _680 = _616;
    float _682 = _606;
    if (_620)
    {
        float _684 = _672 ? _666 : _616;
        _680 = _684;
    }
    float _686 = _680;
    float _688 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _690 = 1.0 + _688;
    bool _692 = _632 > 0.5;
    bool _694 = _692 && _630;
    float _696 = _636 * 2.0;
    bool _698 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _700 = isnan(1.0);
    bool _702 = _698 || _700;
    bool _704 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _706 = _702 || _704;
    float _708 = _622 + _636;
    float _710 = 1.0 / _690;
    float _712 = _690;
    if (_630)
    {
        _682 = _652;
    }
    float _714 = _682;
    float _716 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _718 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _716;
    float _720 = _708 + (-1.0);
    float _722 = in.m_57.w;
    float _724 = _608 + _658;
    float _726 = _718 * _654;
    float _728 = floor(_696);
    float _730 = _714;
    if (!_630)
    {
        _712 = _652;
    }
    float _732 = _712;
    float _734 = _732;
    if (_694)
    {
        float _736 = -_714;
        float _738 = _736 + 1.0;
        _730 = _738;
    }
    float _740 = _730;
    float _742 = _622 * 2.0;
    float _744 = fma(_720, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _746 = -_670;
    float _748 = _746 + 1.0;
    float _750 = in.m_61.w;
    int _752 = as_type<int>(_744);
    if (_630)
    {
        _734 = _740;
    }
    float _754 = _734;
    float _756 = floor(_678);
    bool _758 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _760 = isnan(0.0);
    bool _762 = _758 || _760;
    bool _764 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _766 = _762 || _764;
    float _768 = _632 + _622;
    float _770 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _772 = _724 + _770;
    float _774 = _766 ? _748 : 0.0;
    float _776 = _768 + (-1.0);
    float _778 = _754 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _780 = floor(_742);
    bool _782 = _728 > 0.0;
    float _784 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _786 = _728 >= 0.0;
    bool _788 = isnan(_728);
    bool _790 = _786 || _788;
    bool _792 = isnan(0.0);
    bool _794 = _790 || _792;
    float _796 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _798 = _604 + _796;
    bool _800 = _604 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _802 = isnan(_604);
    bool _804 = _800 || _802;
    bool _806 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _808 = _804 || _806;
    float _810 = float(_808);
    if (_706)
    {
        float _812 = _774 * _710;
        _150 = _812;
    }
    float _814 = _150;
    bool _816 = _604 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _818 = isnan(_604);
    bool _820 = _816 || _818;
    bool _822 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _824 = _820 || _822;
    float _826 = float(_824);
    float _828 = fma(_726, _798, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _830 = _756 >= 0.0;
    bool _832 = isnan(_756);
    bool _834 = _830 || _832;
    bool _836 = isnan(0.0);
    bool _838 = _834 || _836;
    float _840 = -_810;
    float _842 = _840 + 1.0;
    bool _844 = _756 > 0.0;
    float _846 = _674 + _722;
    int _848 = _794 ? 0 : 1;
    float _850 = _826 * _842;
    int _852 = _838 ? 0 : 1;
    float _854 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _856 = _846 + _854;
    bool _858 = _780 > 0.0;
    float _860 = _828 * _850;
    bool _862 = _780 >= 0.0;
    bool _864 = isnan(_780);
    bool _866 = _862 || _864;
    bool _868 = isnan(0.0);
    bool _870 = _866 || _868;
    float _872 = -_826;
    float _874 = _872 + 1.0;
    float _876 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _878 = ~_848;
    int _880 = _878 + 1;
    int _882 = _880 + 1;
    float _884 = _676 + _750;
    int _886 = _882;
    if (!_782)
    {
        int _888 = ~_848;
        int _890 = _888 + 1;
        _886 = _890;
    }
    int _892 = _886;
    float _894 = fma(_874, (*spvDescriptorSet0.vp_c9)._m0[131].x, _860);
    float _896 = _772 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _898 = _870 ? 0 : 1;
    float _900 = _622 + (-0.5);
    bool _902 = !_640;
    int _904 = _902 ? 0 : 1;
    float _906 = fma(_856, (*spvDescriptorSet0.vp_c8)._m0[28].x, _896);
    int _908 = ~_852;
    int _910 = _908 + 1;
    int _912 = _910 + 1;
    int _914 = _912;
    if (!_844)
    {
        int _916 = ~_852;
        int _918 = _916 + 1;
        _914 = _918;
    }
    int _920 = _914;
    float _922 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _924 = _884 + _922;
    int _926 = ~_898;
    int _928 = _926 + 1;
    int _930 = _928 + 1;
    int _932 = abs(_904);
    float _934 = fma(_924, (*spvDescriptorSet0.vp_c8)._m0[28].z, _906);
    int _936 = _930;
    if (!_858)
    {
        int _938 = ~_898;
        int _940 = _938 + 1;
        _936 = _940;
    }
    int _942 = _936;
    float _944 = _686 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _946 = fma(_810, (*spvDescriptorSet0.vp_c9)._m0[132].x, _894);
    bool _948 = !_644;
    int _950 = _948 ? 0 : 1;
    float _952 = float(_932);
    float _954 = _944 * _876;
    float _956 = float(_892);
    float _958 = _778 * _634;
    float _960 = _946 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _962 = abs(_950);
    float _964 = _952 * _956;
    bool _966 = _934 >= 0.0;
    float _968 = in.m_73.x;
    float _970 = in.m_73.y;
    float _972 = in.m_73.z;
    float _974 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _976 = _772 * _772;
    float _978 = float(_920);
    float _980 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _982 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _984 = fma(_856, _856, _976);
    float _986 = float(_962);
    float _988 = _574 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    out.m_75.x = _958;
    out.m_75.y = _954;
    float _990 = fma(_924, _924, _984);
    float _992 = _964 * (-2.0);
    float _994 = _986 * _978;
    float _996 = _980 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _998 = rsqrt(_990);
    float _1000 = _974 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1002 = _982 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1004 = _978;
    if (_966)
    {
        _1004 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1006 = _1004;
    float _1008 = fma(_784, _992, _784);
    float _1010 = _994 * (-2.0);
    if (_966)
    {
        out.m_51.x = 0.0;
    }
    float _1012 = fma(_992, _968, _968);
    float _1014 = fma(_744, _1010, _744);
    out.m_77.x = _996;
    out.m_77.y = _1000;
    out.m_77.z = _1002;
    out.m_77.w = _960;
    float _1016 = _632 + (-0.5);
    float _1018 = fma(_1010, _970, _970);
    if (_966)
    {
        float _1020 = _1006 * 5.0;
        _752 = as_type<int>(_1020);
    }
    int _1022 = _752;
    float _1024 = _988 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _1026 = fma(_1016, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1012);
    if (_966)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4150 = as_type<float>(_1022);
        out.gl_Position.z = _4150;
    }
    float _1028 = fma(_1008, _814, _1026);
    bool _1030 = !_648;
    int _1032 = _1030 ? 0 : 1;
    float _1034 = _1024 * _998;
    int _1036 = abs(_1032);
    float _1038 = _856 * _1034;
    float _1040 = _772 * _1034;
    float _1042 = float(_1036);
    if (_966)
    {
        return out;
    }
    float _1044 = -_1040;
    float _1046 = _724 + _1044;
    float _1048 = _924 * _1034;
    float _1050 = -_1038;
    float _1052 = _846 + _1050;
    float _1054 = fma(_900, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1018);
    float _1056 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1058 = _1046 + _1056;
    float _1060 = -_1048;
    float _1062 = _884 + _1060;
    float _1064 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1066 = _1052 + _1064;
    float _1068 = float(_942);
    float _1070 = _1058 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1072 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1074 = _1062 + _1072;
    float _1076 = -_1040;
    float _1078 = _772 + _1076;
    float _1080 = _632 + _636;
    float _1082 = fma(_1066, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1070);
    float _1084 = _1042 * _1068;
    float _1086 = fma(_1014, _814, _1054);
    float _1088 = -_1038;
    float _1090 = _856 + _1088;
    float _1092 = fma(_1074, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1082);
    float _1094 = _1078 * _1078;
    float _1096 = _1080 + (-1.0);
    float _1098 = _1084 * (-2.0);
    bool _1100 = _1092 >= 0.0;
    float _1102 = fma(_1090, _1090, _1094);
    float _1104 = -_1048;
    float _1106 = _924 + _1104;
    float _1108 = fma(_1096, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1110 = fma(_1098, _972, _972);
    float _1112 = _636 + (-0.5);
    float _1114 = _1086 * 0.15915493667125701904296875;
    float _1116 = fma(_1106, _1106, _1102);
    float _1118 = fma(_1108, _1098, _1108);
    float _1120 = fma(_1112, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1110);
    float _1122 = _1114 * 6.283185482025146484375;
    float _1124 = sin(_1122);
    float _1126 = _1028 * 0.15915493667125701904296875;
    float _1128 = _1110;
    if (_1100)
    {
        _1128 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1130 = _1128;
    float _1132 = fma(_1118, _814, _1120);
    int _1134 = as_type<int>(_1130);
    if (_1100)
    {
        out.m_51.x = 0.0;
    }
    float _1136 = _1114 * 6.283185482025146484375;
    float _1138 = cos(_1136);
    if (_1100)
    {
        float _1140 = _1130 * 5.0;
        _1134 = as_type<int>(_1140);
    }
    int _1142 = _1134;
    if (_1100)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4341 = as_type<float>(_1142);
        out.gl_Position.z = _4341;
    }
    float _1144 = sqrt(_1116);
    float _1146 = _1126 * 6.283185482025146484375;
    float _1148 = sin(_1146);
    float _1150 = _1126 * 6.283185482025146484375;
    float _1152 = cos(_1150);
    float _1154 = _1132 * 0.15915493667125701904296875;
    if (_1100)
    {
        return out;
    }
    float _1156 = in.m_79.x;
    float _1158 = in.m_79.y;
    float _1160 = in.m_79.z;
    float _1162 = _1154 * 6.283185482025146484375;
    float _1164 = cos(_1162);
    float _1166 = _998 * _1144;
    float _1168 = _572 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1170 = _1148 * _1124;
    float _1172 = _1148 * _1138;
    float _1174 = _570 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1176 = _1166 * _1168;
    float _1178 = _1154 * 6.283185482025146484375;
    float _1180 = sin(_1178);
    float _1182 = _1152 * _1138;
    float _1184 = _1152 * _1124;
    float _1186 = _988 * _1166;
    float _1188 = _1148 * _1164;
    float _1190 = _1152 * _1164;
    float _1192 = _1138 * _1164;
    float _1194 = _1124 * _1164;
    float _1196 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1158);
    float _1198 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1156);
    float _1200 = _1196 * _1176;
    float _1202 = _1166 * _1174;
    float _1204 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1160);
    float _1206 = _1198 * _1186;
    float _1208 = fma(_1180, _1182, _1170);
    float _1210 = _1190 * _1200;
    float _1212 = _1204 * _1202;
    float _1214 = -_1172;
    float _1216 = fma(_1180, _1184, _1214);
    float _1218 = -_1200;
    float _1220 = _1180 * _1218;
    float _1222 = fma(_1208, _1206, _1210);
    float _1224 = -_1184;
    float _1226 = fma(_1180, _1172, _1224);
    float _1228 = _1188 * _1200;
    float _1230 = fma(_1192, _1206, _1220);
    float _1232 = fma(_1216, _1212, _1222);
    float _1234 = fma(_1180, _1170, _1182);
    float _1236 = fma(_1226, _1206, _1228);
    float _1238 = fma(_1194, _1212, _1230);
    float _1240 = _1232 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1242 = _1232 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1244 = fma(_1234, _1212, _1236);
    float _1246 = _1232 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1248 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1240);
    float _1250 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1242);
    float _1252 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1246);
    float _1254 = fma(_1244, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1248);
    float _1256 = fma(_1244, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1250);
    float _1258 = fma(_1244, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1252);
    float _1260 = _1254 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1262 = _1256 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1264 = _1258 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1266 = _884 + _1260;
    float _1268 = _846 + _1262;
    float _1270 = _724 + _1264;
    float _1272 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1274 = _1266 + _1272;
    float _1276 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1278 = _1268 + _1276;
    float _1280 = _1274 * _1274;
    float _1282 = fma(_1278, _1278, _1280);
    float _1284 = sqrt(_1282);
    bool _1286 = _1284 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1288 = _1244;
    float _1290 = _1268;
    float _1292 = _1266;
    float _1294 = _1166;
    if (!_1286)
    {
        _1288 = _1268;
    }
    float _1296 = _1288;
    float _1298 = _1296;
    if (!_1286)
    {
        _1290 = _1266;
    }
    float _1300 = _1290;
    float _1302 = _1300;
    if (!_1286)
    {
        _1292 = _1270;
    }
    float _1304 = _1292;
    bool _1306 = !_1286;
    float _1308 = _1304;
    if (!_1306)
    {
        float _1310 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1312 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1314 = _1284 + _1312;
        float _1316 = rsqrt(_1282);
        float _1318 = _1314 * _1310;
        float _1320 = _1270 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1322 = _1318 * 0.15915493667125701904296875;
        float _1324 = _1322 * 6.283185482025146484375;
        float _1326 = cos(_1324);
        float _1328 = _1322 * 6.283185482025146484375;
        float _1330 = sin(_1328);
        float _1332 = _1326 + (-1.0);
        float _1334 = fma(_1330, _1320, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1336 = _1332 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1338 = _1316 * _1334;
        float _1340 = fma(_1270, _1326, _1336);
        float _1342 = fma(_1278, _1338, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1344 = fma(_1274, _1338, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1298 = _1342;
        _1302 = _1344;
        _1308 = _1340;
    }
    float _1346 = _1298;
    float _1348 = _1302;
    float _1350 = _1308;
    float _1352 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _1354 = _1346 + _1352;
    float _1356 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _1358 = _1348 + _1356;
    float _1360 = fma(_1354, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _1362 = fma(_1358, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _4701 = float2(_1360, _1362);
    float _1364 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_4701, float2(0.0), isnan(_4701)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_4701, float2(0.0), isnan(_4701)), level(0.0)).x;
    float _1366 = -_724;
    float _1368 = _1366 + _1350;
    float _1370 = -_846;
    float _1372 = _1370 + _1346;
    float _1374 = -_884;
    float _1376 = _1374 + _1348;
    bool _1378 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1380 = isnan(0.5);
    bool _1382 = _1378 || _1380;
    bool _1384 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1386 = _1382 || _1384;
    bool _1388 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1390 = isnan(0.5);
    bool _1392 = _1388 || _1390;
    bool _1394 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1396 = _1392 || _1394;
    float _1398 = fma(_1364, 100.0, _724);
    float _1400 = _1368 * _1368;
    float _1402 = fma(_1364, 100.0, _1350);
    float _1404 = -_1040;
    float _1406 = _1404 + _1398;
    float _1408 = fma(_1372, _1372, _1400);
    float _1410 = _1406 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1412 = _1406 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1414 = fma(_1376, _1376, _1408);
    float _1416 = fma(_1052, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1410);
    float _1418 = sqrt(_1414);
    float _1420 = fma(_1062, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1416);
    float _1422 = _1420 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1424 = fma(_1052, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1412);
    float _1426 = 1.0 / _1422;
    float _1428 = fma(_1062, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1424);
    float _1430 = _1428 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1432 = _1418 > 0.0;
    float _1434 = _1430 + _1422;
    float _1436 = _1434 * _1426;
    float _1438 = _1436 * 0.5;
    float _1440 = _1350;
    float _1442 = _1438;
    float _1444 = _1348;
    float _1446 = _1398;
    if (!_1432)
    {
        _1440 = _1402;
    }
    float _1448 = _1440;
    float _1450 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1452 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1450);
    float _1454 = _1448;
    if (!_1432)
    {
        _1442 = _1346;
    }
    float _1456 = _1442;
    float _1458 = 1.0 / _1452;
    bool _1460 = !_1432;
    float _1462 = _1456;
    if (!_1460)
    {
        float _1464 = _208 * _208;
        float _1466 = rsqrt(_1414);
        float _1468 = fma(_206, _206, _1464);
        float _1470 = fma(_210, _210, _1468);
        float _1472 = sqrt(_1470);
        float _1474 = _1372 * _1466;
        float _1476 = _1368 * _1466;
        float _1478 = _1376 * _1466;
        bool _1480 = _1472 > 0.0;
        float _1482 = _1468;
        float _1484 = _1466;
        if (!_1480)
        {
            _1482 = _1346;
        }
        float _1486 = _1482;
        _1462 = _1486;
        if (!_1480)
        {
            _1484 = _1402;
        }
        float _1488 = _1484;
        bool _1490 = !_1480;
        _1454 = _1488;
        if (!_1490)
        {
            float _1492 = rsqrt(_1470);
            float _1494 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1496 = _208 * _1492;
            float _1498 = _206 * _1492;
            float _1500 = _210 * _1492;
            float _1502 = _1476 * _1496;
            float _1504 = fma(_1474, _1498, _1502);
            float _1506 = _1494 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1508 = fma(_1478, _1500, _1504);
            float _1510 = _1508 * _1506;
            float _1512 = fma(_206, _1510, _1346);
            float _1514 = fma(_208, _1510, _1402);
            float _1516 = fma(_210, _1510, _1348);
            _1462 = _1512;
            _1444 = _1516;
            _1454 = _1514;
        }
    }
    float _1518 = _1462;
    float _1520 = _1444;
    float _1522 = _1454;
    float _1524 = -_1038;
    float _1526 = _1524 + _1518;
    float _1528 = -_1048;
    float _1530 = _1528 + _1520;
    float _1532 = -_1040;
    float _1534 = _1532 + _1522;
    float _1536 = _1534;
    float _1538 = _1526;
    float _1540 = _1530;
    if (_1396)
    {
        _214 = 1.0;
    }
    float _1542 = _214;
    float _1544 = _1542;
    if (!_1386)
    {
        float _1546 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1548 = _1406 + _1546;
        float _1550 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1552 = -_884;
        float _1554 = _1552 + _1520;
        float _1556 = -_1398;
        float _1558 = _1556 + _1522;
        float _1560 = _1548 * _1548;
        float _1562 = fma(_1066, _1066, _1560);
        float _1564 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1566 = fma(_1074, _1074, _1562);
        float _1568 = 1.0 / _1166;
        float _1570 = sqrt(_1566);
        float _1572 = _1564 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1574 = precise::min(_1570, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1576 = _1574 * _1550;
        float _1578 = -_846;
        float _1580 = _1578 + _1518;
        float _1582 = _1576 * _1568;
        float _1584 = _1572 * _1582;
        float _1586 = _1554 * _1582;
        float _1588 = fma(_1558, _1584, _1406);
        float _1590 = fma(_1580, _1584, _1052);
        float _1592 = fma(_1572, _1586, _1062);
        _1446 = _1558;
        _1536 = _1588;
        _1538 = _1590;
        _1540 = _1592;
        _216 = _1560;
        _1294 = _1568;
    }
    float _1594 = _1446;
    float _1596 = _1536;
    float _1598 = _1538;
    float _1600 = _1540;
    float _1602 = _216;
    float _1604 = _1294;
    float _1606 = _1604;
    float _1608 = _1594;
    float _1610 = _1602;
    if (_1396)
    {
        _1606 = 1.0;
    }
    float _1612 = _1606;
    float _1614 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1616 = _1458 * _1614;
    float _1618 = _1612;
    if (!_1396)
    {
        float _1620 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1622 = _1620 * 0.15915493667125701904296875;
        float _1624 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1626 = _1622 * 6.283185482025146484375;
        float _1628 = cos(_1626);
        float _1630 = _1624 * 0.15915493667125701904296875;
        float _1632 = _1622 * 6.283185482025146484375;
        float _1634 = sin(_1632);
        float _1636 = 1.0 / _1628;
        float _1638 = _1630 * 6.283185482025146484375;
        float _1640 = cos(_1638);
        float _1642 = _1634 * _1636;
        float _1644 = _1630 * 6.283185482025146484375;
        float _1646 = sin(_1644);
        float _1648 = _1640 * _1642;
        float _1650 = 1.0 / _1648;
        float _1652 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1654 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1652;
        float _1656 = 1.0 / _1654;
        float _1658 = _1646 * _1650;
        float _1660 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1662 = fma(_1616, _1658, _1660);
        float _1664 = _1662 * _1656;
        float _1666 = precise::clamp(_1664, 0.0, 1.0);
        _1608 = _1630;
        _1610 = _1662;
        _1544 = _1666;
    }
    float _1668 = _1608;
    float _1670 = _1610;
    float _1672 = _1544;
    float _1674 = _1668;
    float _1676 = _1670;
    if (!_1396)
    {
        float _1678 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1680 = _1678 * 0.15915493667125701904296875;
        float _1682 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1684 = _1680 * 6.283185482025146484375;
        float _1686 = cos(_1684);
        float _1688 = _1682 * 0.15915493667125701904296875;
        float _1690 = _1680 * 6.283185482025146484375;
        float _1692 = sin(_1690);
        float _1694 = 1.0 / _1686;
        float _1696 = _1688 * 6.283185482025146484375;
        float _1698 = cos(_1696);
        float _1700 = _1692 * _1694;
        float _1702 = _1688 * 6.283185482025146484375;
        float _1704 = sin(_1702);
        float _1706 = _1698 * _1700;
        float _1708 = 1.0 / _1706;
        float _1710 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1712 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1710;
        float _1714 = 1.0 / _1712;
        float _1716 = _1704 * _1708;
        float _1718 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1720 = fma(_1616, _1716, _1718);
        float _1722 = _1720 * _1714;
        float _1724 = precise::clamp(_1722, 0.0, 1.0);
        float _1726 = -_1724;
        float _1728 = _1726 + 1.0;
        _1674 = _1694;
        _1676 = _1716;
        _1618 = _1728;
    }
    float _1730 = _1674;
    float _1732 = _1676;
    float _1734 = _1618;
    float _1736 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1738 = _1596 + _1736;
    float _1740 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1742 = _1598 + _1740;
    float _1744 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1746 = _1600 + _1744;
    float _1748 = _1738 * _1738;
    float _1750 = _1596 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1752 = fma(_1742, _1742, _1748);
    float _1754 = fma(_1052, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1756 = fma(_1598, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1750);
    float _1758 = fma(_1746, _1746, _1752);
    float _1760 = fma(_1600, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1756);
    float _1762 = rsqrt(_1758);
    float _1764 = _1760 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1766 = sqrt(_1758);
    float _1768 = _1762 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1770 = _1742 * _1768;
    float _1772 = _1746 * _1768;
    float _1774 = _1770 * _1770;
    float _1776 = _1772 * _1772;
    float _1778 = _1774 + _1776;
    float _1780 = sqrt(_1778);
    bool _1782 = _1780 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1784 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1786 = _1780 + _1784;
    float _1788 = _1762;
    float _1790 = _1732;
    float _1792 = _1786;
    float _1794 = _1730;
    float _1796 = _1738;
    float _1798 = _1778;
    if (_1782)
    {
        float _1800 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1788 = _1800;
    }
    float _1802 = _1788;
    if (_1782)
    {
        float _1804 = rsqrt(_1778);
        _1790 = _1804;
    }
    float _1806 = _1790;
    float _1808 = _1806;
    if (_1782)
    {
        float _1810 = _1786 * _1802;
        _1792 = _1810;
    }
    float _1812 = _1792;
    if (_1782)
    {
        float _1814 = _1812 * 0.15915493667125701904296875;
        _1794 = _1814;
    }
    float _1816 = _1794;
    float _1818 = _1746;
    float _1820 = _1816;
    if (_1782)
    {
        float _1822 = _1816 * 6.283185482025146484375;
        float _1824 = sin(_1822);
        _1818 = _1824;
    }
    float _1826 = _1818;
    float _1828 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1830 = precise::max(0.0, _1828);
    float _1832 = _1802;
    float _1834 = _1830;
    if (_1782)
    {
        float _1836 = _1816 * 6.283185482025146484375;
        float _1838 = cos(_1836);
        _1832 = _1838;
    }
    float _1840 = _1832;
    float _1842 = -_1768;
    float _1844 = -_1830;
    float _1846 = fma(_1738, _1842, _1844);
    if (_1782)
    {
        float _1848 = _1846 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1796 = _1848;
    }
    float _1850 = _1796;
    float _1852 = _1850;
    if (!_1782)
    {
        _1820 = _1770;
    }
    float _1854 = _1820;
    float _1856 = _1826;
    float _1858 = _1854;
    if (_1782)
    {
        float _1860 = fma(_1826, _1850, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1856 = _1860;
    }
    float _1862 = _1856;
    float _1864 = _1862;
    float _1866 = _1840;
    if (_1782)
    {
        float _1868 = _1840 + (-1.0);
        _1834 = _1868;
    }
    float _1870 = _1834;
    float _1872 = _1870;
    if (_1782)
    {
        float _1874 = _1806 * _1862;
        _1852 = _1874;
    }
    float _1876 = _1852;
    if (!_1782)
    {
        _1808 = _1846;
    }
    float _1878 = _1808;
    float _1880 = _1878;
    if (_1782)
    {
        float _1882 = _1870 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1798 = _1882;
    }
    float _1884 = _1798;
    if (_1782)
    {
        float _1886 = _1770 * _1876;
        _1858 = _1886;
    }
    float _1888 = _1858;
    if (!_1782)
    {
        _1872 = _1772;
    }
    float _1890 = _1872;
    float _1892 = _1890;
    if (_1782)
    {
        float _1894 = _1772 * _1876;
        _1892 = _1894;
    }
    float _1896 = _1892;
    if (!_1782)
    {
        _1864 = _1774;
    }
    float _1898 = _1864;
    float _1900 = _1898;
    if (_1782)
    {
        float _1902 = fma(_1846, _1840, _1884);
        _1880 = _1902;
    }
    float _1904 = _1880;
    if (_1782)
    {
        float _1906 = _1888 * _1888;
        _1900 = _1906;
    }
    float _1908 = _1900;
    if (!_1782)
    {
        _1866 = _1776;
    }
    float _1910 = _1866;
    float _1912 = _1910;
    if (_1782)
    {
        float _1914 = _1896 * _1896;
        _1912 = _1914;
    }
    float _1916 = _1912;
    float _1918 = fma(_1904, _1904, _1908);
    float _1920 = _1596 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1922 = _1596 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1924 = floor(_1754);
    float _1926 = _1918 + _1916;
    float _1928 = fma(_1598, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1920);
    float _1930 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1932 = fma(_1766, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1930);
    float _1934 = precise::clamp(_1932, 0.0, 1.0);
    float _1936 = fma(_1598, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1922);
    float _1938 = fma(_1600, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1928);
    float _1940 = rsqrt(_1926);
    float _1942 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1944 = _1938 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1946 = -_1934;
    float _1948 = _1946 + 1.0;
    float _1950 = fma(_1600, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1936);
    float _1952 = _1944 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1954 = -_1924;
    float _1956 = _1754 + _1954;
    float _1958 = abs(_1948);
    float _1960 = log2(_1958);
    float _1962 = -_1952;
    float _1964 = fma(_1962, _1942, 1.0);
    float _1966 = _1596 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1968 = fma(_1062, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1970 = _1950 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1972 = _1940 * _1888;
    float _1974 = _1940 * _1904;
    float _1976 = _1940 * _1896;
    float _1978 = fma(_1598, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1966);
    float _1980 = _1972 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1982 = floor(_1968);
    float _1984 = _1970 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1986 = fma(_1600, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1978);
    float _1988 = -_1980;
    float _1990 = fma(_1974, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1988);
    float _1992 = _1960 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1994 = _1986 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1996 = _1970 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1998 = -_1976;
    float _2000 = fma(_1998, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1990);
    float _2002 = log2(_1964);
    float _2004 = fma(_1994, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1984);
    float _2006 = fma(_1994, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1996);
    float _2008 = fma(_2000, -0.5, 0.5);
    float _2010 = fma(_2000, 0.5, 0.5);
    float _2012 = _1974 + 1.0;
    float _2014 = fma(_1944, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2006);
    float _2016 = -_1982;
    float _2018 = _1968 + _2016;
    float _2020 = exp2(_1992);
    float _2022 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2014);
    float _2024 = _1970 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2026 = fma(_1944, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2004);
    float _2028 = fma(_2010, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2030 = fma(_1994, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2024);
    float _2032 = 1.0 / _2022;
    float _2034 = _2002 * 0.693147182464599609375;
    float _2036 = fma(_2010, _2028, -0.212114393711090087890625);
    float _2038 = fma(_1944, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2030);
    float _2040 = sqrt(_2008);
    float _2042 = -_1974;
    float _2044 = fma(_2020, _2012, _2042);
    float _2046 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2026);
    float _2048 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2038);
    float2 _5761 = float2(_1956, _2018);
    float _2050 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5761, float2(0.0), isnan(_5761)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5761, float2(0.0), isnan(_5761)), level(0.0)).x;
    float _2052 = fma(_2010, _2036, 1.570728778839111328125);
    float _2054 = _2034 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2056 = _2046 * _2032;
    float _2058 = _2048 * _2032;
    float _2060 = fma(_2056, 0.5, 0.5);
    float _2062 = fma(_2058, -0.5, 0.5);
    float _2064 = _2040 * 0.636619746685028076171875;
    float3 _5791 = float3(_2060, _2062, _2054);
    float _2066 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5791, float3(0.0), isnan(_5791)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5791, float3(0.0), isnan(_5791)), level(0.0)).x;
    float _2068 = -_2052;
    float _2070 = fma(_2064, _2068, 1.0);
    float _2072 = fma(_2044, 0.5, 0.5);
    float3 _5809 = float3(_2060, _2062, _2054);
    float4 _2075 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5809, float3(0.0), isnan(_5809)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5809, float3(0.0), isnan(_5809)), level(0.0)).xyzw;
    float _2077 = _2075.x;
    float _2079 = _2075.y;
    float _2081 = _2075.z;
    float _2083 = _2075.w;
    float2 _5825 = float2(_2070, _2072);
    float3 _2087 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5825, float2(0.0), isnan(_5825)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5825, float2(0.0), isnan(_5825)), level(0.0)).xyz;
    float _2089 = _2087.x;
    float _2091 = _2087.y;
    float _2093 = _2087.z;
    float _2095 = in.m_81.x;
    float _2097 = in.m_81.y;
    float _2099 = in.m_81.z;
    bool _2101 = _1158 != 0.0;
    bool _2103 = isnan(_1158);
    bool _2105 = _2101 || _2103;
    bool _2107 = isnan(0.0);
    bool _2109 = _2105 || _2107;
    float _2111 = _1208 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2113 = _1208 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2115 = _1190 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _2117 = _1156 == 0.0;
    bool _2119 = !_2109;
    bool _2121 = _2117 && _2119;
    float _2123 = _1208 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2125 = fma(_1192, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2111);
    float _2127 = _1190 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2129 = _1160 == 0.0;
    bool _2131 = _2129 && _2121;
    float _2133 = _1190 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2135 = -_1180;
    float _2137 = fma(_2135, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2115);
    float _2139 = -_1180;
    float _2141 = fma(_2139, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2127);
    float _2143 = fma(_1192, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2113);
    float _2145 = -_1180;
    float _2147 = fma(_2145, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2133);
    float _2149 = _1216 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2151 = fma(_1192, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2123);
    float _2153 = _1216 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2155 = _1216 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2157 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2149);
    float _2159 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2125);
    float _2161 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2143);
    float _2163 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2151);
    float _2165 = fma(_1188, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2141);
    float _2167 = _2095;
    float _2169 = _2097;
    float _2171 = _2099;
    float _2173 = _2022;
    float _2175 = _2048;
    if (!_2131)
    {
        float _2177 = fma(_1156, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2095);
        _2167 = _2177;
    }
    float _2179 = _2167;
    if (!_2131)
    {
        float _2181 = fma(_1158, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2097);
        _2169 = _2181;
    }
    float _2183 = _2169;
    float _2185 = abs(_1616);
    float _2187 = log2(_2185);
    float _2189 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2153);
    float _2191 = fma(_1188, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2137);
    float _2193 = fma(_1188, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2147);
    float _2195 = _2165 * _2183;
    if (!_2131)
    {
        float _2197 = fma(_1160, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2099);
        _2171 = _2197;
    }
    float _2199 = _2171;
    float _2201 = _2191 * _2183;
    float _2203 = _2193 * _2183;
    float _2205 = fma(_1234, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2157);
    float _2207 = fma(_2159, _2179, _2195);
    float _2209 = fma(_2161, _2179, _2201);
    float _2211 = fma(_2163, _2179, _2203);
    float _2213 = fma(_2205, _2199, _2207);
    float _2215 = _1960 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2217 = _2187 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2219 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2155);
    float _2221 = fma(_1234, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2189);
    float _2223 = _1970 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2225 = in.m_71.x;
    float _2227 = exp2(_2215);
    float _2229 = fma(_1234, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2219);
    float _2231 = fma(_2221, _2199, _2209);
    float _2233 = fma(_1994, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2223);
    bool _2235 = _1616 <= 8000.0;
    bool _2237 = isnan(_1616);
    bool _2239 = _2235 || _2237;
    bool _2241 = isnan(8000.0);
    bool _2243 = _2239 || _2241;
    float _2245 = float(_2243);
    float _2247 = fma(_2229, _2199, _2211);
    float _2249 = _2022 * 0.5;
    float _2251 = fma(_1944, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2233);
    float _2253 = exp2(_2217);
    out.m_83.x = _2213;
    out.m_83.y = _2231;
    out.m_83.z = _2247;
    float _2255 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2251);
    bool _2257 = _1766 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2259 = isnan(_1766);
    bool _2261 = _2257 || _2259;
    bool _2263 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2265 = _2261 || _2263;
    float _2267 = -_2227;
    float _2269 = _2267 + 1.0;
    out.gl_Position.x = _2046;
    out.gl_Position.y = _2048;
    out.gl_Position.z = _2255;
    out.gl_Position.w = _2022;
    float _2271 = fma(_2253, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2273 = precise::clamp(_2271, 0.0, 1.0);
    float _2275 = _2046 + _2022;
    float _2277 = fma(_2273, -2.0, 3.0);
    float _2279 = _2273 * _2273;
    float _2281 = _2275 * 0.5;
    float _2283 = _1672 * _1734;
    float _2285 = _2279 * _2277;
    float _2287 = -_2285;
    float _2289 = _2287 + 1.0;
    float _2291 = fma(_2289, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2285);
    float _2293 = _2255 + _2022;
    float _2295 = fma(_2048, -0.5, _2249);
    float _2297 = _2269 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2299 = _2245 * _2291;
    float _2301 = _2293 * 0.5;
    float _2303 = _2255;
    float _2305 = _2283;
    if (!_2265)
    {
        _2173 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2307 = _2173;
    float _2309 = _2299 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2311 = _2307;
    float _2313 = _2307;
    if (!_2265)
    {
        _2303 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2315 = _2303;
    out.m_85.x = _2281;
    out.m_85.y = _2295;
    out.m_85.z = _2301;
    out.m_85.w = _2022;
    float _2317 = _2315;
    float _2319 = _2315;
    if (!_2265)
    {
        _2175 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2321 = _2175;
    float _2323 = -_2050;
    float _2325 = _2323 + 1.0;
    float _2327 = _2325 * _2309;
    float _2329 = precise::clamp(_2327, 0.0, 1.0);
    float _2331 = -_2329;
    float _2333 = fma(_2331, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2335 = _2333 * _2225;
    float _2337 = _2297 * _2066;
    float _2339 = -_2297;
    float _2341 = _2339 + 1.0;
    float _2343 = _2335 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2345 = _2083 * _2337;
    float _2347 = _2083 * _2341;
    out.m_87.x = _2343;
    float _2349 = _2093 * _2337;
    float _2351 = fma(_2089, _2345, _2077);
    float _2353 = fma(_2091, _2345, _2079);
    float _2355 = _2079;
    float _2357 = _2077;
    float _2359 = _2321;
    float _2361 = _2321;
    if (!_2265)
    {
        _2355 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2363 = _2355;
    float _2365 = fma(_2083, _2349, _2081);
    float _2367 = _2283 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2369 = _2363;
    float _2371 = _2363;
    if (!_2265)
    {
        _2357 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2373 = _2357;
    float _2375 = _2373;
    float _2377 = _2373;
    if (!_2265)
    {
        _2305 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2379 = _2305;
    out.m_89.x = _2351;
    out.m_89.y = _2353;
    out.m_89.z = _2365;
    out.m_89.w = _2347;
    bool _2381 = !_2265;
    float _2383 = _2379;
    float _2385 = _2379;
    if (!_2381)
    {
        bool _2387 = _1766 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2389 = isnan(_1766);
        bool _2391 = _2387 || _2389;
        bool _2393 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2395 = _2391 || _2393;
        if (!_2395)
        {
            float _2397 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2399 = _1766 + _2397;
            float _2401 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2403 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2401;
            float _2405 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2407 = _2405 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2409 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2411 = _2409 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2413 = 1.0 / _2403;
            float _2415 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2417 = _2415 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2419 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2421 = _2419 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2423 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2425 = _2423 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2427 = _2399 * _2413;
            float _2429 = precise::clamp(_2427, 0.0, 1.0);
            float _2431 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2433 = _2431 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2435 = fma(_2429, _2407, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2437 = fma(_2429, _2411, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2439 = fma(_2429, _2417, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2441 = fma(_2429, _2433, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2443 = fma(_2429, _2421, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2445 = fma(_2429, _2425, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2377 = _2439;
            _2361 = _2435;
            _2371 = _2437;
            _2319 = _2443;
            _2313 = _2441;
            _2385 = _2445;
            _2447 = true;
        }
        else
        {
            bool _2449 = _1766 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2451 = isnan(_1766);
            bool _2453 = _2449 || _2451;
            bool _2455 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2457 = _2453 || _2455;
            if (!_2457)
            {
                _2369 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2459 = _2369;
            _2371 = _2459;
            if (!_2457)
            {
                _2375 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2461 = _2375;
            _2377 = _2461;
            if (!_2457)
            {
                _2311 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2463 = _2311;
            _2313 = _2463;
            if (!_2457)
            {
                _2317 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2465 = _2317;
            _2319 = _2465;
            if (!_2457)
            {
                _2359 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2467 = _2359;
            _2361 = _2467;
            if (!_2457)
            {
                _2383 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2469 = _2383;
            bool _2471 = !_2457;
            _2385 = _2469;
            if (!_2471)
            {
                bool _2473 = _1766 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2475 = isnan(_1766);
                bool _2477 = _2473 || _2475;
                bool _2479 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2481 = _2477 || _2479;
                if (!_2481)
                {
                    float _2483 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2485 = _1766 + _2483;
                    float _2487 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2489 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2487;
                    float _2491 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2493 = _2491 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2495 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2497 = _2495 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2499 = 1.0 / _2489;
                    float _2501 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2503 = _2501 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2505 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2507 = _2505 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2509 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2511 = _2509 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2513 = _2485 * _2499;
                    float _2515 = precise::clamp(_2513, 0.0, 1.0);
                    float _2517 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2519 = _2517 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2521 = fma(_2515, _2493, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2523 = fma(_2515, _2497, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2525 = fma(_2515, _2503, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2527 = fma(_2515, _2519, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2529 = fma(_2515, _2507, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2531 = fma(_2515, _2511, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2377 = _2525;
                    _2361 = _2521;
                    _2371 = _2523;
                    _2319 = _2529;
                    _2313 = _2527;
                    _2385 = _2531;
                    _2447 = true;
                }
                else
                {
                    _2377 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2361 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2371 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2319 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2313 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2385 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2447 = false;
    float _2533 = _2377;
    float _2535 = _2361;
    float _2537 = _2371;
    float _2539 = _2319;
    float _2541 = _2313;
    float _2543 = _2385;
    float _2545 = fma(_2231, -0.5, 0.5);
    float _2547 = precise::clamp(_2545, 0.0, 1.0);
    float _2549 = -_2533;
    float _2551 = _2549 + _2535;
    float _2553 = -_2537;
    float _2555 = _2553 + _2539;
    out.m_91.x = 0.0;
    float _2557 = -_2541;
    float _2559 = _2557 + _2543;
    float _2561 = fma(_2547, _2551, _2533);
    float _2563 = fma(_2547, _2555, _2537);
    bool _2565 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2567 = _2561 * 0.586610972881317138671875;
    float _2569 = fma(_2547, _2559, _2541);
    float _2571 = _2367 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2573 = fma(_2563, 0.298911988735198974609375, _2567);
    bool _2575 = _1672 > 0.0;
    bool _2577 = isnan(_1672);
    bool _2579 = _2575 || _2577;
    bool _2581 = isnan(0.0);
    bool _2583 = _2579 || _2581;
    float _2585 = fma(_2569, 0.114477999508380889892578125, _2573);
    out.m_51.x = _2571;
    bool _2587 = _1734 <= 0.0;
    bool _2589 = !_2583;
    bool _2591 = _2587 || _2589;
    float _2593 = -_2585;
    float _2595 = _2563 + _2593;
    float _2597 = -_2585;
    float _2599 = _2569 + _2597;
    float _2601 = fma(_2595, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2585);
    float _2603 = -_2585;
    float _2605 = _2561 + _2603;
    float _2607 = fma(_2605, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2585);
    float _2609 = fma(_2599, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2585);
    bool _2611 = !_2565;
    if (!_2611)
    {
        float _2613 = -_1596;
        float _2615 = _2613 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2617 = -_1598;
        float _2619 = _2617 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2621 = -_1600;
        float _2623 = _2621 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2625 = _2615 * _2615;
        float _2627 = fma(_2619, _2619, _2625);
        float _2629 = fma(_2623, _2623, _2627);
        float _2631 = sqrt(_2629);
        float _2633 = rsqrt(_2629);
        float _2635 = -_2631;
        float _2637 = _2635 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2639 = _2637 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2641 = precise::clamp(_2639, 0.0, 1.0);
        float _2643 = _2619 * _2633;
        float _2645 = _2615 * _2633;
        float _2647 = abs(_2641);
        float _2649 = log2(_2647);
        float _2651 = _2623 * _2633;
        float _2653 = _2643 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2655 = _2231 * _2645;
        float _2657 = -_2645;
        float _2659 = -_2653;
        float _2661 = fma(_2657, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2659);
        float _2663 = fma(_2213, _2643, _2655);
        float _2665 = -_2651;
        float _2667 = fma(_2665, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2661);
        float _2669 = fma(_2247, _2651, _2663);
        float _2671 = precise::clamp(_2669, 0.0, 1.0);
        float _2673 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2675 = _2667 + _2673;
        float _2677 = _2649 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2679 = _2675 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2681 = precise::clamp(_2679, 0.0, 1.0);
        float _2683 = exp2(_2677);
        float _2685 = _2683 * _2681;
        float _2687 = _2671 * _2685;
        float _2689 = _2687 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2691 = _2687 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2693 = _2687 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_91.x = _2689;
        out.m_91.y = _2691;
        out.m_91.z = _2693;
    }
    out.m_93.x = _2601;
    out.m_93.y = _2607;
    out.m_93.z = _2609;
    if (!_2591)
    {
        return out;
    }
    float _2695 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_51.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2695;
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
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2447 = false;
    bool _596 = false;
    bool _404 = false;
    bool _236 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _107 = in.m_48.w;
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
        out.m_51.x = 0.0;
    }
    int _124 = 0;
    if (!_116)
    {
        float _126 = _120 * 5.0;
        _124 = as_type<int>(_126);
    }
    int _128 = _124;
    int _130 = _128;
    if (!_116)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2752 = as_type<float>(_128);
        out.gl_Position.z = _2752;
    }
    if (!_116)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _132 = in.m_53.w;
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
        float _152 = float(_112);
        _148 = _152;
    }
    float _154 = _148;
    bool _156 = _146 >= _154;
    bool _158 = !_142;
    bool _160 = _156 || _158;
    if (_160)
    {
        _122 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _162 = _122;
    if (_160)
    {
        out.m_51.x = 0.0;
    }
    if (_160)
    {
        float _164 = _162 * 5.0;
        _130 = as_type<int>(_164);
    }
    int _166 = _130;
    if (_160)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2821 = as_type<float>(_166);
        out.gl_Position.z = _2821;
    }
    if (_160)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _168 = in.m_55.x;
    float _170 = in.m_55.y;
    float _172 = in.m_55.z;
    bool _174 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _176 = in.m_57.x;
    float _178 = in.m_57.y;
    float _180 = in.m_57.z;
    float _182 = in.m_59.x;
    float _184 = in.m_59.y;
    float _186 = in.m_59.z;
    float _188 = in.m_61.x;
    float _190 = in.m_61.y;
    float _192 = in.m_61.z;
    float _194 = _170 * _178;
    float _196 = _170 * _184;
    float _198 = fma(_168, _176, _194);
    float _200 = _170 * _190;
    float _202 = fma(_168, _182, _196);
    float _204 = fma(_168, _188, _200);
    float _206 = fma(_172, _180, _198);
    float _208 = fma(_172, _186, _202);
    float _210 = fma(_172, _192, _204);
    bool _212 = !_174;
    float _214 = _206;
    float _216 = _208;
    float _234;
    if (!_212)
    {
        float _218 = in.m_63.x;
        float _220 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _222 = _218 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _224 = fma(_222, (*spvDescriptorSet0.vp_c9)._m0[12].x, _146);
        float _226 = _224 * _220;
        float _228 = floor(_226);
        float _230 = -_228;
        float _232 = _226 + _230;
        _234 = _232;
        _236 = true;
    }
    else
    {
        float _238 = float(_112);
        float _240 = 1.0 / _238;
        float _242 = _146 * _240;
        _234 = _242;
    }
    _236 = false;
    float _244 = _234;
    float _246 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _248 = _244 + _246;
    bool _250 = _244 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _252 = isnan(_244);
    bool _254 = _250 || _252;
    bool _256 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _258 = _254 || _256;
    float _260 = float(_258);
    float _262 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _264 = _244 + _262;
    bool _266 = _244 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _268 = isnan(_244);
    bool _270 = _266 || _268;
    bool _272 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _274 = _270 || _272;
    float _276 = float(_274);
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _280 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _278;
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _284 = _282 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _286 = _244 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _288 = isnan(_244);
    bool _290 = _286 || _288;
    bool _292 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _294 = _290 || _292;
    float _296 = float(_294);
    float _298 = -_260;
    float _300 = _298 + 1.0;
    float _302 = 1.0 / _284;
    float _304 = _296 * _300;
    float _306 = -_296;
    float _308 = _306 + 1.0;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _312 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _310;
    bool _314 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _316 = 1.0 / _280;
    float _318 = _276 * _308;
    float _320 = -_276;
    float _322 = _320 + 1.0;
    float _324 = _264 * _302;
    float _326 = _248 * _316;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _330 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _328;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _334 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _332;
    float _336 = fma(_312, _326, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _338 = fma(_330, _326, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _340 = fma(_334, _326, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _342 = _336 * _318;
    float _344 = _338 * _318;
    float _346 = _340 * _318;
    float _348 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _350 = _348 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _354 = _352 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _358 = _356 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _360 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[143].x, _342);
    float _362 = fma(_350, _324, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _364 = fma(_354, _324, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _366 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[143].y, _344);
    float _368 = fma(_358, _324, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _370 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[143].z, _346);
    float _372 = fma(_362, _304, _360);
    float _374 = fma(_364, _304, _366);
    float _376 = fma(_368, _304, _370);
    float _378 = fma(_260, (*spvDescriptorSet0.vp_c9)._m0[145].x, _372);
    float _380 = fma(_260, (*spvDescriptorSet0.vp_c9)._m0[145].y, _374);
    float _382 = fma(_260, (*spvDescriptorSet0.vp_c9)._m0[145].z, _376);
    bool _384 = !_314;
    float _402;
    if (!_384)
    {
        float _386 = in.m_63.x;
        float _388 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _390 = _386 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _392 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[11].y, _146);
        float _394 = _392 * _388;
        float _396 = floor(_394);
        float _398 = -_396;
        float _400 = _394 + _398;
        _402 = _400;
        _404 = true;
    }
    else
    {
        float _406 = float(_112);
        float _408 = 1.0 / _406;
        float _410 = _146 * _408;
        _402 = _410;
    }
    _404 = false;
    float _412 = _402;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _416 = _412 + _414;
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _420 = _418 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _424 = _422 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _426 = _412 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _428 = isnan(_412);
    bool _430 = _426 || _428;
    bool _432 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _434 = _430 || _432;
    float _436 = float(_434);
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _440 = _438 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _442 = _412 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _444 = isnan(_412);
    bool _446 = _442 || _444;
    bool _448 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _450 = _446 || _448;
    float _452 = float(_450);
    float _454 = 1.0 / _420;
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _458 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _456;
    float _460 = -_436;
    float _462 = _460 + 1.0;
    bool _464 = _412 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _466 = isnan(_412);
    bool _468 = _464 || _466;
    bool _470 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _472 = _468 || _470;
    float _474 = float(_472);
    bool _476 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _478 = 1.0 / _424;
    float _480 = 1.0 / _440;
    float _482 = _458 * _454;
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _486 = _484 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _488 = _452 * _462;
    float _490 = -_452;
    float _492 = _490 + 1.0;
    float _494 = fma(_482, _416, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _498 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _496;
    float _500 = _474 * _492;
    float _502 = _486 * _478;
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _506 = _412 + _504;
    bool _508 = _412 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _510 = isnan(_412);
    bool _512 = _508 || _510;
    bool _514 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _516 = _512 || _514;
    float _518 = float(_516);
    float _520 = _494 * _500;
    float _522 = -_474;
    float _524 = _522 + 1.0;
    float _526 = fma(_502, _506, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _530 = _412 + _528;
    float _532 = _498 * _480;
    float _534 = -_518;
    float _536 = _534 + 1.0;
    float _538 = fma(_524, (*spvDescriptorSet0.vp_c9)._m0[115].x, _520);
    float _540 = fma(_532, _530, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _542 = _436 * _536;
    float _544 = fma(_526, _488, _538);
    float _546 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _548 = fma(_540, _542, _544);
    float _550 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _552 = _546 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _554 = fma(_518, (*spvDescriptorSet0.vp_c9)._m0[118].x, _548);
    float _556 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _558 = _550 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _560 = _554 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _562 = in.m_65.x;
    float _564 = in.m_65.y;
    float _566 = in.m_65.z;
    float _568 = _556 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_67.x = _558;
    out.m_67.y = _568;
    out.m_67.z = _552;
    out.m_67.w = _560;
    float _570 = _382 * _566;
    float _572 = _380 * _564;
    float _574 = _378 * _562;
    bool _576 = !_476;
    float _594;
    if (!_576)
    {
        float _578 = in.m_63.x;
        float _580 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _582 = _578 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _584 = fma(_582, (*spvDescriptorSet0.vp_c9)._m0[11].w, _146);
        float _586 = _584 * _580;
        float _588 = floor(_586);
        float _590 = -_588;
        float _592 = _586 + _590;
        _594 = _592;
        _596 = true;
    }
    else
    {
        float _598 = float(_112);
        float _600 = 1.0 / _598;
        float _602 = _146 * _600;
        _594 = _602;
    }
    _596 = false;
    float _604 = _594;
    float _606 = in.m_48.x;
    float _608 = in.m_48.y;
    float _610 = in.m_48.z;
    float _612 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _614 = log2(_612);
    float _616 = in.m_69.y;
    int _618 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _620 = _618 != 0;
    float _622 = in.m_63.y;
    float _624 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _626 = _624 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _628 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _630 = _628 != 0;
    float _632 = in.m_63.x;
    float _634 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _636 = in.m_63.z;
    int _638 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _640 = _638 != 0;
    int _642 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _644 = _642 != 0;
    int _646 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _648 = _646 != 0;
    float _650 = _614 * _146;
    float _652 = in.m_69.x;
    float _654 = 1.0 / _626;
    float _656 = _178 * _608;
    float _658 = in.m_71.y;
    float _660 = _190 * _608;
    float _662 = fma(_176, _606, _656);
    float _664 = -_616;
    float _666 = _664 + 1.0;
    float _668 = fma(_188, _606, _660);
    float _670 = exp2(_650);
    bool _672 = _622 > 0.5;
    float _674 = fma(_180, _610, _662);
    float _676 = fma(_192, _610, _668);
    float _678 = _632 * 2.0;
    float _680 = _616;
    float _682 = _606;
    if (_620)
    {
        float _684 = _672 ? _666 : _616;
        _680 = _684;
    }
    float _686 = _680;
    float _688 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _690 = 1.0 + _688;
    bool _692 = _632 > 0.5;
    bool _694 = _692 && _630;
    float _696 = _636 * 2.0;
    bool _698 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _700 = isnan(1.0);
    bool _702 = _698 || _700;
    bool _704 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _706 = _702 || _704;
    float _708 = _622 + _636;
    float _710 = 1.0 / _690;
    float _712 = _690;
    if (_630)
    {
        _682 = _652;
    }
    float _714 = _682;
    float _716 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _718 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _716;
    float _720 = _708 + (-1.0);
    float _722 = in.m_57.w;
    float _724 = _608 + _658;
    float _726 = _718 * _654;
    float _728 = floor(_696);
    float _730 = _714;
    if (!_630)
    {
        _712 = _652;
    }
    float _732 = _712;
    float _734 = _732;
    if (_694)
    {
        float _736 = -_714;
        float _738 = _736 + 1.0;
        _730 = _738;
    }
    float _740 = _730;
    float _742 = _622 * 2.0;
    float _744 = fma(_720, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _746 = -_670;
    float _748 = _746 + 1.0;
    float _750 = in.m_61.w;
    int _752 = as_type<int>(_744);
    if (_630)
    {
        _734 = _740;
    }
    float _754 = _734;
    float _756 = floor(_678);
    bool _758 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _760 = isnan(0.0);
    bool _762 = _758 || _760;
    bool _764 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _766 = _762 || _764;
    float _768 = _632 + _622;
    float _770 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _772 = _724 + _770;
    float _774 = _766 ? _748 : 0.0;
    float _776 = _768 + (-1.0);
    float _778 = _754 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _780 = floor(_742);
    bool _782 = _728 > 0.0;
    float _784 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _786 = _728 >= 0.0;
    bool _788 = isnan(_728);
    bool _790 = _786 || _788;
    bool _792 = isnan(0.0);
    bool _794 = _790 || _792;
    float _796 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _798 = _604 + _796;
    bool _800 = _604 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _802 = isnan(_604);
    bool _804 = _800 || _802;
    bool _806 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _808 = _804 || _806;
    float _810 = float(_808);
    if (_706)
    {
        float _812 = _774 * _710;
        _150 = _812;
    }
    float _814 = _150;
    bool _816 = _604 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _818 = isnan(_604);
    bool _820 = _816 || _818;
    bool _822 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _824 = _820 || _822;
    float _826 = float(_824);
    float _828 = fma(_726, _798, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _830 = _756 >= 0.0;
    bool _832 = isnan(_756);
    bool _834 = _830 || _832;
    bool _836 = isnan(0.0);
    bool _838 = _834 || _836;
    float _840 = -_810;
    float _842 = _840 + 1.0;
    bool _844 = _756 > 0.0;
    float _846 = _674 + _722;
    int _848 = _794 ? 0 : 1;
    float _850 = _826 * _842;
    int _852 = _838 ? 0 : 1;
    float _854 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _856 = _846 + _854;
    bool _858 = _780 > 0.0;
    float _860 = _828 * _850;
    bool _862 = _780 >= 0.0;
    bool _864 = isnan(_780);
    bool _866 = _862 || _864;
    bool _868 = isnan(0.0);
    bool _870 = _866 || _868;
    float _872 = -_826;
    float _874 = _872 + 1.0;
    float _876 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _878 = ~_848;
    int _880 = _878 + 1;
    int _882 = _880 + 1;
    float _884 = _676 + _750;
    int _886 = _882;
    if (!_782)
    {
        int _888 = ~_848;
        int _890 = _888 + 1;
        _886 = _890;
    }
    int _892 = _886;
    float _894 = fma(_874, (*spvDescriptorSet0.vp_c9)._m0[131].x, _860);
    float _896 = _772 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _898 = _870 ? 0 : 1;
    float _900 = _622 + (-0.5);
    bool _902 = !_640;
    int _904 = _902 ? 0 : 1;
    float _906 = fma(_856, (*spvDescriptorSet0.vp_c8)._m0[28].x, _896);
    int _908 = ~_852;
    int _910 = _908 + 1;
    int _912 = _910 + 1;
    int _914 = _912;
    if (!_844)
    {
        int _916 = ~_852;
        int _918 = _916 + 1;
        _914 = _918;
    }
    int _920 = _914;
    float _922 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _924 = _884 + _922;
    int _926 = ~_898;
    int _928 = _926 + 1;
    int _930 = _928 + 1;
    int _932 = abs(_904);
    float _934 = fma(_924, (*spvDescriptorSet0.vp_c8)._m0[28].z, _906);
    int _936 = _930;
    if (!_858)
    {
        int _938 = ~_898;
        int _940 = _938 + 1;
        _936 = _940;
    }
    int _942 = _936;
    float _944 = _686 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _946 = fma(_810, (*spvDescriptorSet0.vp_c9)._m0[132].x, _894);
    bool _948 = !_644;
    int _950 = _948 ? 0 : 1;
    float _952 = float(_932);
    float _954 = _944 * _876;
    float _956 = float(_892);
    float _958 = _778 * _634;
    float _960 = _946 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _962 = abs(_950);
    float _964 = _952 * _956;
    bool _966 = _934 >= 0.0;
    float _968 = in.m_73.x;
    float _970 = in.m_73.y;
    float _972 = in.m_73.z;
    float _974 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _976 = _772 * _772;
    float _978 = float(_920);
    float _980 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _982 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _984 = fma(_856, _856, _976);
    float _986 = float(_962);
    float _988 = _574 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    out.m_75.x = _958;
    out.m_75.y = _954;
    float _990 = fma(_924, _924, _984);
    float _992 = _964 * (-2.0);
    float _994 = _986 * _978;
    float _996 = _980 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _998 = rsqrt(_990);
    float _1000 = _974 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1002 = _982 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1004 = _978;
    if (_966)
    {
        _1004 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1006 = _1004;
    float _1008 = fma(_784, _992, _784);
    float _1010 = _994 * (-2.0);
    if (_966)
    {
        out.m_51.x = 0.0;
    }
    float _1012 = fma(_992, _968, _968);
    float _1014 = fma(_744, _1010, _744);
    out.m_77.x = _996;
    out.m_77.y = _1000;
    out.m_77.z = _1002;
    out.m_77.w = _960;
    float _1016 = _632 + (-0.5);
    float _1018 = fma(_1010, _970, _970);
    if (_966)
    {
        float _1020 = _1006 * 5.0;
        _752 = as_type<int>(_1020);
    }
    int _1022 = _752;
    float _1024 = _988 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _1026 = fma(_1016, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1012);
    if (_966)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4150 = as_type<float>(_1022);
        out.gl_Position.z = _4150;
    }
    float _1028 = fma(_1008, _814, _1026);
    bool _1030 = !_648;
    int _1032 = _1030 ? 0 : 1;
    float _1034 = _1024 * _998;
    int _1036 = abs(_1032);
    float _1038 = _856 * _1034;
    float _1040 = _772 * _1034;
    float _1042 = float(_1036);
    if (_966)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1044 = -_1040;
    float _1046 = _724 + _1044;
    float _1048 = _924 * _1034;
    float _1050 = -_1038;
    float _1052 = _846 + _1050;
    float _1054 = fma(_900, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1018);
    float _1056 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1058 = _1046 + _1056;
    float _1060 = -_1048;
    float _1062 = _884 + _1060;
    float _1064 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1066 = _1052 + _1064;
    float _1068 = float(_942);
    float _1070 = _1058 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1072 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1074 = _1062 + _1072;
    float _1076 = -_1040;
    float _1078 = _772 + _1076;
    float _1080 = _632 + _636;
    float _1082 = fma(_1066, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1070);
    float _1084 = _1042 * _1068;
    float _1086 = fma(_1014, _814, _1054);
    float _1088 = -_1038;
    float _1090 = _856 + _1088;
    float _1092 = fma(_1074, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1082);
    float _1094 = _1078 * _1078;
    float _1096 = _1080 + (-1.0);
    float _1098 = _1084 * (-2.0);
    bool _1100 = _1092 >= 0.0;
    float _1102 = fma(_1090, _1090, _1094);
    float _1104 = -_1048;
    float _1106 = _924 + _1104;
    float _1108 = fma(_1096, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1110 = fma(_1098, _972, _972);
    float _1112 = _636 + (-0.5);
    float _1114 = _1086 * 0.15915493667125701904296875;
    float _1116 = fma(_1106, _1106, _1102);
    float _1118 = fma(_1108, _1098, _1108);
    float _1120 = fma(_1112, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1110);
    float _1122 = _1114 * 6.283185482025146484375;
    float _1124 = sin(_1122);
    float _1126 = _1028 * 0.15915493667125701904296875;
    float _1128 = _1110;
    if (_1100)
    {
        _1128 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1130 = _1128;
    float _1132 = fma(_1118, _814, _1120);
    int _1134 = as_type<int>(_1130);
    if (_1100)
    {
        out.m_51.x = 0.0;
    }
    float _1136 = _1114 * 6.283185482025146484375;
    float _1138 = cos(_1136);
    if (_1100)
    {
        float _1140 = _1130 * 5.0;
        _1134 = as_type<int>(_1140);
    }
    int _1142 = _1134;
    if (_1100)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4341 = as_type<float>(_1142);
        out.gl_Position.z = _4341;
    }
    float _1144 = sqrt(_1116);
    float _1146 = _1126 * 6.283185482025146484375;
    float _1148 = sin(_1146);
    float _1150 = _1126 * 6.283185482025146484375;
    float _1152 = cos(_1150);
    float _1154 = _1132 * 0.15915493667125701904296875;
    if (_1100)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1156 = in.m_79.x;
    float _1158 = in.m_79.y;
    float _1160 = in.m_79.z;
    float _1162 = _1154 * 6.283185482025146484375;
    float _1164 = cos(_1162);
    float _1166 = _998 * _1144;
    float _1168 = _572 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1170 = _1148 * _1124;
    float _1172 = _1148 * _1138;
    float _1174 = _570 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1176 = _1166 * _1168;
    float _1178 = _1154 * 6.283185482025146484375;
    float _1180 = sin(_1178);
    float _1182 = _1152 * _1138;
    float _1184 = _1152 * _1124;
    float _1186 = _988 * _1166;
    float _1188 = _1148 * _1164;
    float _1190 = _1152 * _1164;
    float _1192 = _1138 * _1164;
    float _1194 = _1124 * _1164;
    float _1196 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1158);
    float _1198 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1156);
    float _1200 = _1196 * _1176;
    float _1202 = _1166 * _1174;
    float _1204 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1160);
    float _1206 = _1198 * _1186;
    float _1208 = fma(_1180, _1182, _1170);
    float _1210 = _1190 * _1200;
    float _1212 = _1204 * _1202;
    float _1214 = -_1172;
    float _1216 = fma(_1180, _1184, _1214);
    float _1218 = -_1200;
    float _1220 = _1180 * _1218;
    float _1222 = fma(_1208, _1206, _1210);
    float _1224 = -_1184;
    float _1226 = fma(_1180, _1172, _1224);
    float _1228 = _1188 * _1200;
    float _1230 = fma(_1192, _1206, _1220);
    float _1232 = fma(_1216, _1212, _1222);
    float _1234 = fma(_1180, _1170, _1182);
    float _1236 = fma(_1226, _1206, _1228);
    float _1238 = fma(_1194, _1212, _1230);
    float _1240 = _1232 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1242 = _1232 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1244 = fma(_1234, _1212, _1236);
    float _1246 = _1232 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1248 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1240);
    float _1250 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1242);
    float _1252 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1246);
    float _1254 = fma(_1244, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1248);
    float _1256 = fma(_1244, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1250);
    float _1258 = fma(_1244, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1252);
    float _1260 = _1254 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1262 = _1256 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1264 = _1258 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1266 = _884 + _1260;
    float _1268 = _846 + _1262;
    float _1270 = _724 + _1264;
    float _1272 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1274 = _1266 + _1272;
    float _1276 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1278 = _1268 + _1276;
    float _1280 = _1274 * _1274;
    float _1282 = fma(_1278, _1278, _1280);
    float _1284 = sqrt(_1282);
    bool _1286 = _1284 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1288 = _1244;
    float _1290 = _1268;
    float _1292 = _1266;
    float _1294 = _1166;
    if (!_1286)
    {
        _1288 = _1268;
    }
    float _1296 = _1288;
    float _1298 = _1296;
    if (!_1286)
    {
        _1290 = _1266;
    }
    float _1300 = _1290;
    float _1302 = _1300;
    if (!_1286)
    {
        _1292 = _1270;
    }
    float _1304 = _1292;
    bool _1306 = !_1286;
    float _1308 = _1304;
    if (!_1306)
    {
        float _1310 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1312 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1314 = _1284 + _1312;
        float _1316 = rsqrt(_1282);
        float _1318 = _1314 * _1310;
        float _1320 = _1270 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1322 = _1318 * 0.15915493667125701904296875;
        float _1324 = _1322 * 6.283185482025146484375;
        float _1326 = cos(_1324);
        float _1328 = _1322 * 6.283185482025146484375;
        float _1330 = sin(_1328);
        float _1332 = _1326 + (-1.0);
        float _1334 = fma(_1330, _1320, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1336 = _1332 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1338 = _1316 * _1334;
        float _1340 = fma(_1270, _1326, _1336);
        float _1342 = fma(_1278, _1338, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1344 = fma(_1274, _1338, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1298 = _1342;
        _1302 = _1344;
        _1308 = _1340;
    }
    float _1346 = _1298;
    float _1348 = _1302;
    float _1350 = _1308;
    float _1352 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _1354 = _1346 + _1352;
    float _1356 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _1358 = _1348 + _1356;
    float _1360 = fma(_1354, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _1362 = fma(_1358, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _4701 = float2(_1360, _1362);
    float _1364 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_4701, float2(0.0), isnan(_4701)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_4701, float2(0.0), isnan(_4701)), level(0.0)).x;
    float _1366 = -_724;
    float _1368 = _1366 + _1350;
    float _1370 = -_846;
    float _1372 = _1370 + _1346;
    float _1374 = -_884;
    float _1376 = _1374 + _1348;
    bool _1378 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1380 = isnan(0.5);
    bool _1382 = _1378 || _1380;
    bool _1384 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1386 = _1382 || _1384;
    bool _1388 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1390 = isnan(0.5);
    bool _1392 = _1388 || _1390;
    bool _1394 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1396 = _1392 || _1394;
    float _1398 = fma(_1364, 100.0, _724);
    float _1400 = _1368 * _1368;
    float _1402 = fma(_1364, 100.0, _1350);
    float _1404 = -_1040;
    float _1406 = _1404 + _1398;
    float _1408 = fma(_1372, _1372, _1400);
    float _1410 = _1406 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1412 = _1406 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1414 = fma(_1376, _1376, _1408);
    float _1416 = fma(_1052, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1410);
    float _1418 = sqrt(_1414);
    float _1420 = fma(_1062, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1416);
    float _1422 = _1420 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1424 = fma(_1052, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1412);
    float _1426 = 1.0 / _1422;
    float _1428 = fma(_1062, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1424);
    float _1430 = _1428 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1432 = _1418 > 0.0;
    float _1434 = _1430 + _1422;
    float _1436 = _1434 * _1426;
    float _1438 = _1436 * 0.5;
    float _1440 = _1350;
    float _1442 = _1438;
    float _1444 = _1348;
    float _1446 = _1398;
    if (!_1432)
    {
        _1440 = _1402;
    }
    float _1448 = _1440;
    float _1450 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1452 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1450);
    float _1454 = _1448;
    if (!_1432)
    {
        _1442 = _1346;
    }
    float _1456 = _1442;
    float _1458 = 1.0 / _1452;
    bool _1460 = !_1432;
    float _1462 = _1456;
    if (!_1460)
    {
        float _1464 = _208 * _208;
        float _1466 = rsqrt(_1414);
        float _1468 = fma(_206, _206, _1464);
        float _1470 = fma(_210, _210, _1468);
        float _1472 = sqrt(_1470);
        float _1474 = _1372 * _1466;
        float _1476 = _1368 * _1466;
        float _1478 = _1376 * _1466;
        bool _1480 = _1472 > 0.0;
        float _1482 = _1468;
        float _1484 = _1466;
        if (!_1480)
        {
            _1482 = _1346;
        }
        float _1486 = _1482;
        _1462 = _1486;
        if (!_1480)
        {
            _1484 = _1402;
        }
        float _1488 = _1484;
        bool _1490 = !_1480;
        _1454 = _1488;
        if (!_1490)
        {
            float _1492 = rsqrt(_1470);
            float _1494 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1496 = _208 * _1492;
            float _1498 = _206 * _1492;
            float _1500 = _210 * _1492;
            float _1502 = _1476 * _1496;
            float _1504 = fma(_1474, _1498, _1502);
            float _1506 = _1494 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1508 = fma(_1478, _1500, _1504);
            float _1510 = _1508 * _1506;
            float _1512 = fma(_206, _1510, _1346);
            float _1514 = fma(_208, _1510, _1402);
            float _1516 = fma(_210, _1510, _1348);
            _1462 = _1512;
            _1444 = _1516;
            _1454 = _1514;
        }
    }
    float _1518 = _1462;
    float _1520 = _1444;
    float _1522 = _1454;
    float _1524 = -_1038;
    float _1526 = _1524 + _1518;
    float _1528 = -_1048;
    float _1530 = _1528 + _1520;
    float _1532 = -_1040;
    float _1534 = _1532 + _1522;
    float _1536 = _1534;
    float _1538 = _1526;
    float _1540 = _1530;
    if (_1396)
    {
        _214 = 1.0;
    }
    float _1542 = _214;
    float _1544 = _1542;
    if (!_1386)
    {
        float _1546 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1548 = _1406 + _1546;
        float _1550 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1552 = -_884;
        float _1554 = _1552 + _1520;
        float _1556 = -_1398;
        float _1558 = _1556 + _1522;
        float _1560 = _1548 * _1548;
        float _1562 = fma(_1066, _1066, _1560);
        float _1564 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1566 = fma(_1074, _1074, _1562);
        float _1568 = 1.0 / _1166;
        float _1570 = sqrt(_1566);
        float _1572 = _1564 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1574 = precise::min(_1570, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1576 = _1574 * _1550;
        float _1578 = -_846;
        float _1580 = _1578 + _1518;
        float _1582 = _1576 * _1568;
        float _1584 = _1572 * _1582;
        float _1586 = _1554 * _1582;
        float _1588 = fma(_1558, _1584, _1406);
        float _1590 = fma(_1580, _1584, _1052);
        float _1592 = fma(_1572, _1586, _1062);
        _1446 = _1558;
        _1536 = _1588;
        _1538 = _1590;
        _1540 = _1592;
        _216 = _1560;
        _1294 = _1568;
    }
    float _1594 = _1446;
    float _1596 = _1536;
    float _1598 = _1538;
    float _1600 = _1540;
    float _1602 = _216;
    float _1604 = _1294;
    float _1606 = _1604;
    float _1608 = _1594;
    float _1610 = _1602;
    if (_1396)
    {
        _1606 = 1.0;
    }
    float _1612 = _1606;
    float _1614 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1616 = _1458 * _1614;
    float _1618 = _1612;
    if (!_1396)
    {
        float _1620 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1622 = _1620 * 0.15915493667125701904296875;
        float _1624 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1626 = _1622 * 6.283185482025146484375;
        float _1628 = cos(_1626);
        float _1630 = _1624 * 0.15915493667125701904296875;
        float _1632 = _1622 * 6.283185482025146484375;
        float _1634 = sin(_1632);
        float _1636 = 1.0 / _1628;
        float _1638 = _1630 * 6.283185482025146484375;
        float _1640 = cos(_1638);
        float _1642 = _1634 * _1636;
        float _1644 = _1630 * 6.283185482025146484375;
        float _1646 = sin(_1644);
        float _1648 = _1640 * _1642;
        float _1650 = 1.0 / _1648;
        float _1652 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1654 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1652;
        float _1656 = 1.0 / _1654;
        float _1658 = _1646 * _1650;
        float _1660 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1662 = fma(_1616, _1658, _1660);
        float _1664 = _1662 * _1656;
        float _1666 = precise::clamp(_1664, 0.0, 1.0);
        _1608 = _1630;
        _1610 = _1662;
        _1544 = _1666;
    }
    float _1668 = _1608;
    float _1670 = _1610;
    float _1672 = _1544;
    float _1674 = _1668;
    float _1676 = _1670;
    if (!_1396)
    {
        float _1678 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1680 = _1678 * 0.15915493667125701904296875;
        float _1682 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1684 = _1680 * 6.283185482025146484375;
        float _1686 = cos(_1684);
        float _1688 = _1682 * 0.15915493667125701904296875;
        float _1690 = _1680 * 6.283185482025146484375;
        float _1692 = sin(_1690);
        float _1694 = 1.0 / _1686;
        float _1696 = _1688 * 6.283185482025146484375;
        float _1698 = cos(_1696);
        float _1700 = _1692 * _1694;
        float _1702 = _1688 * 6.283185482025146484375;
        float _1704 = sin(_1702);
        float _1706 = _1698 * _1700;
        float _1708 = 1.0 / _1706;
        float _1710 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1712 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1710;
        float _1714 = 1.0 / _1712;
        float _1716 = _1704 * _1708;
        float _1718 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1720 = fma(_1616, _1716, _1718);
        float _1722 = _1720 * _1714;
        float _1724 = precise::clamp(_1722, 0.0, 1.0);
        float _1726 = -_1724;
        float _1728 = _1726 + 1.0;
        _1674 = _1694;
        _1676 = _1716;
        _1618 = _1728;
    }
    float _1730 = _1674;
    float _1732 = _1676;
    float _1734 = _1618;
    float _1736 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1738 = _1596 + _1736;
    float _1740 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1742 = _1598 + _1740;
    float _1744 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1746 = _1600 + _1744;
    float _1748 = _1738 * _1738;
    float _1750 = _1596 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1752 = fma(_1742, _1742, _1748);
    float _1754 = fma(_1052, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1756 = fma(_1598, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1750);
    float _1758 = fma(_1746, _1746, _1752);
    float _1760 = fma(_1600, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1756);
    float _1762 = rsqrt(_1758);
    float _1764 = _1760 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1766 = sqrt(_1758);
    float _1768 = _1762 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1770 = _1742 * _1768;
    float _1772 = _1746 * _1768;
    float _1774 = _1770 * _1770;
    float _1776 = _1772 * _1772;
    float _1778 = _1774 + _1776;
    float _1780 = sqrt(_1778);
    bool _1782 = _1780 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1784 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1786 = _1780 + _1784;
    float _1788 = _1762;
    float _1790 = _1732;
    float _1792 = _1786;
    float _1794 = _1730;
    float _1796 = _1738;
    float _1798 = _1778;
    if (_1782)
    {
        float _1800 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1788 = _1800;
    }
    float _1802 = _1788;
    if (_1782)
    {
        float _1804 = rsqrt(_1778);
        _1790 = _1804;
    }
    float _1806 = _1790;
    float _1808 = _1806;
    if (_1782)
    {
        float _1810 = _1786 * _1802;
        _1792 = _1810;
    }
    float _1812 = _1792;
    if (_1782)
    {
        float _1814 = _1812 * 0.15915493667125701904296875;
        _1794 = _1814;
    }
    float _1816 = _1794;
    float _1818 = _1746;
    float _1820 = _1816;
    if (_1782)
    {
        float _1822 = _1816 * 6.283185482025146484375;
        float _1824 = sin(_1822);
        _1818 = _1824;
    }
    float _1826 = _1818;
    float _1828 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1830 = precise::max(0.0, _1828);
    float _1832 = _1802;
    float _1834 = _1830;
    if (_1782)
    {
        float _1836 = _1816 * 6.283185482025146484375;
        float _1838 = cos(_1836);
        _1832 = _1838;
    }
    float _1840 = _1832;
    float _1842 = -_1768;
    float _1844 = -_1830;
    float _1846 = fma(_1738, _1842, _1844);
    if (_1782)
    {
        float _1848 = _1846 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1796 = _1848;
    }
    float _1850 = _1796;
    float _1852 = _1850;
    if (!_1782)
    {
        _1820 = _1770;
    }
    float _1854 = _1820;
    float _1856 = _1826;
    float _1858 = _1854;
    if (_1782)
    {
        float _1860 = fma(_1826, _1850, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1856 = _1860;
    }
    float _1862 = _1856;
    float _1864 = _1862;
    float _1866 = _1840;
    if (_1782)
    {
        float _1868 = _1840 + (-1.0);
        _1834 = _1868;
    }
    float _1870 = _1834;
    float _1872 = _1870;
    if (_1782)
    {
        float _1874 = _1806 * _1862;
        _1852 = _1874;
    }
    float _1876 = _1852;
    if (!_1782)
    {
        _1808 = _1846;
    }
    float _1878 = _1808;
    float _1880 = _1878;
    if (_1782)
    {
        float _1882 = _1870 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1798 = _1882;
    }
    float _1884 = _1798;
    if (_1782)
    {
        float _1886 = _1770 * _1876;
        _1858 = _1886;
    }
    float _1888 = _1858;
    if (!_1782)
    {
        _1872 = _1772;
    }
    float _1890 = _1872;
    float _1892 = _1890;
    if (_1782)
    {
        float _1894 = _1772 * _1876;
        _1892 = _1894;
    }
    float _1896 = _1892;
    if (!_1782)
    {
        _1864 = _1774;
    }
    float _1898 = _1864;
    float _1900 = _1898;
    if (_1782)
    {
        float _1902 = fma(_1846, _1840, _1884);
        _1880 = _1902;
    }
    float _1904 = _1880;
    if (_1782)
    {
        float _1906 = _1888 * _1888;
        _1900 = _1906;
    }
    float _1908 = _1900;
    if (!_1782)
    {
        _1866 = _1776;
    }
    float _1910 = _1866;
    float _1912 = _1910;
    if (_1782)
    {
        float _1914 = _1896 * _1896;
        _1912 = _1914;
    }
    float _1916 = _1912;
    float _1918 = fma(_1904, _1904, _1908);
    float _1920 = _1596 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1922 = _1596 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1924 = floor(_1754);
    float _1926 = _1918 + _1916;
    float _1928 = fma(_1598, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1920);
    float _1930 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1932 = fma(_1766, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1930);
    float _1934 = precise::clamp(_1932, 0.0, 1.0);
    float _1936 = fma(_1598, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1922);
    float _1938 = fma(_1600, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1928);
    float _1940 = rsqrt(_1926);
    float _1942 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1944 = _1938 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1946 = -_1934;
    float _1948 = _1946 + 1.0;
    float _1950 = fma(_1600, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1936);
    float _1952 = _1944 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1954 = -_1924;
    float _1956 = _1754 + _1954;
    float _1958 = abs(_1948);
    float _1960 = log2(_1958);
    float _1962 = -_1952;
    float _1964 = fma(_1962, _1942, 1.0);
    float _1966 = _1596 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1968 = fma(_1062, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1970 = _1950 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1972 = _1940 * _1888;
    float _1974 = _1940 * _1904;
    float _1976 = _1940 * _1896;
    float _1978 = fma(_1598, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1966);
    float _1980 = _1972 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1982 = floor(_1968);
    float _1984 = _1970 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1986 = fma(_1600, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1978);
    float _1988 = -_1980;
    float _1990 = fma(_1974, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1988);
    float _1992 = _1960 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1994 = _1986 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1996 = _1970 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1998 = -_1976;
    float _2000 = fma(_1998, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1990);
    float _2002 = log2(_1964);
    float _2004 = fma(_1994, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1984);
    float _2006 = fma(_1994, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1996);
    float _2008 = fma(_2000, -0.5, 0.5);
    float _2010 = fma(_2000, 0.5, 0.5);
    float _2012 = _1974 + 1.0;
    float _2014 = fma(_1944, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2006);
    float _2016 = -_1982;
    float _2018 = _1968 + _2016;
    float _2020 = exp2(_1992);
    float _2022 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2014);
    float _2024 = _1970 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2026 = fma(_1944, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2004);
    float _2028 = fma(_2010, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2030 = fma(_1994, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2024);
    float _2032 = 1.0 / _2022;
    float _2034 = _2002 * 0.693147182464599609375;
    float _2036 = fma(_2010, _2028, -0.212114393711090087890625);
    float _2038 = fma(_1944, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2030);
    float _2040 = sqrt(_2008);
    float _2042 = -_1974;
    float _2044 = fma(_2020, _2012, _2042);
    float _2046 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2026);
    float _2048 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2038);
    float2 _5761 = float2(_1956, _2018);
    float _2050 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5761, float2(0.0), isnan(_5761)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5761, float2(0.0), isnan(_5761)), level(0.0)).x;
    float _2052 = fma(_2010, _2036, 1.570728778839111328125);
    float _2054 = _2034 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2056 = _2046 * _2032;
    float _2058 = _2048 * _2032;
    float _2060 = fma(_2056, 0.5, 0.5);
    float _2062 = fma(_2058, -0.5, 0.5);
    float _2064 = _2040 * 0.636619746685028076171875;
    float3 _5791 = float3(_2060, _2062, _2054);
    float _2066 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5791, float3(0.0), isnan(_5791)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5791, float3(0.0), isnan(_5791)), level(0.0)).x;
    float _2068 = -_2052;
    float _2070 = fma(_2064, _2068, 1.0);
    float _2072 = fma(_2044, 0.5, 0.5);
    float3 _5809 = float3(_2060, _2062, _2054);
    float4 _2075 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5809, float3(0.0), isnan(_5809)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5809, float3(0.0), isnan(_5809)), level(0.0)).xyzw;
    float _2077 = _2075.x;
    float _2079 = _2075.y;
    float _2081 = _2075.z;
    float _2083 = _2075.w;
    float2 _5825 = float2(_2070, _2072);
    float3 _2087 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5825, float2(0.0), isnan(_5825)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5825, float2(0.0), isnan(_5825)), level(0.0)).xyz;
    float _2089 = _2087.x;
    float _2091 = _2087.y;
    float _2093 = _2087.z;
    float _2095 = in.m_81.x;
    float _2097 = in.m_81.y;
    float _2099 = in.m_81.z;
    bool _2101 = _1158 != 0.0;
    bool _2103 = isnan(_1158);
    bool _2105 = _2101 || _2103;
    bool _2107 = isnan(0.0);
    bool _2109 = _2105 || _2107;
    float _2111 = _1208 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2113 = _1208 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2115 = _1190 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _2117 = _1156 == 0.0;
    bool _2119 = !_2109;
    bool _2121 = _2117 && _2119;
    float _2123 = _1208 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2125 = fma(_1192, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2111);
    float _2127 = _1190 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2129 = _1160 == 0.0;
    bool _2131 = _2129 && _2121;
    float _2133 = _1190 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2135 = -_1180;
    float _2137 = fma(_2135, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2115);
    float _2139 = -_1180;
    float _2141 = fma(_2139, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2127);
    float _2143 = fma(_1192, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2113);
    float _2145 = -_1180;
    float _2147 = fma(_2145, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2133);
    float _2149 = _1216 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2151 = fma(_1192, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2123);
    float _2153 = _1216 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2155 = _1216 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2157 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2149);
    float _2159 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2125);
    float _2161 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2143);
    float _2163 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2151);
    float _2165 = fma(_1188, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2141);
    float _2167 = _2095;
    float _2169 = _2097;
    float _2171 = _2099;
    float _2173 = _2022;
    float _2175 = _2048;
    if (!_2131)
    {
        float _2177 = fma(_1156, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2095);
        _2167 = _2177;
    }
    float _2179 = _2167;
    if (!_2131)
    {
        float _2181 = fma(_1158, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2097);
        _2169 = _2181;
    }
    float _2183 = _2169;
    float _2185 = abs(_1616);
    float _2187 = log2(_2185);
    float _2189 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2153);
    float _2191 = fma(_1188, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2137);
    float _2193 = fma(_1188, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2147);
    float _2195 = _2165 * _2183;
    if (!_2131)
    {
        float _2197 = fma(_1160, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2099);
        _2171 = _2197;
    }
    float _2199 = _2171;
    float _2201 = _2191 * _2183;
    float _2203 = _2193 * _2183;
    float _2205 = fma(_1234, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2157);
    float _2207 = fma(_2159, _2179, _2195);
    float _2209 = fma(_2161, _2179, _2201);
    float _2211 = fma(_2163, _2179, _2203);
    float _2213 = fma(_2205, _2199, _2207);
    float _2215 = _1960 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2217 = _2187 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2219 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2155);
    float _2221 = fma(_1234, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2189);
    float _2223 = _1970 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2225 = in.m_71.x;
    float _2227 = exp2(_2215);
    float _2229 = fma(_1234, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2219);
    float _2231 = fma(_2221, _2199, _2209);
    float _2233 = fma(_1994, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2223);
    bool _2235 = _1616 <= 8000.0;
    bool _2237 = isnan(_1616);
    bool _2239 = _2235 || _2237;
    bool _2241 = isnan(8000.0);
    bool _2243 = _2239 || _2241;
    float _2245 = float(_2243);
    float _2247 = fma(_2229, _2199, _2211);
    float _2249 = _2022 * 0.5;
    float _2251 = fma(_1944, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2233);
    float _2253 = exp2(_2217);
    out.m_83.x = _2213;
    out.m_83.y = _2231;
    out.m_83.z = _2247;
    float _2255 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2251);
    bool _2257 = _1766 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2259 = isnan(_1766);
    bool _2261 = _2257 || _2259;
    bool _2263 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2265 = _2261 || _2263;
    float _2267 = -_2227;
    float _2269 = _2267 + 1.0;
    out.gl_Position.x = _2046;
    out.gl_Position.y = _2048;
    out.gl_Position.z = _2255;
    out.gl_Position.w = _2022;
    float _2271 = fma(_2253, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2273 = precise::clamp(_2271, 0.0, 1.0);
    float _2275 = _2046 + _2022;
    float _2277 = fma(_2273, -2.0, 3.0);
    float _2279 = _2273 * _2273;
    float _2281 = _2275 * 0.5;
    float _2283 = _1672 * _1734;
    float _2285 = _2279 * _2277;
    float _2287 = -_2285;
    float _2289 = _2287 + 1.0;
    float _2291 = fma(_2289, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2285);
    float _2293 = _2255 + _2022;
    float _2295 = fma(_2048, -0.5, _2249);
    float _2297 = _2269 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2299 = _2245 * _2291;
    float _2301 = _2293 * 0.5;
    float _2303 = _2255;
    float _2305 = _2283;
    if (!_2265)
    {
        _2173 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2307 = _2173;
    float _2309 = _2299 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2311 = _2307;
    float _2313 = _2307;
    if (!_2265)
    {
        _2303 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2315 = _2303;
    out.m_85.x = _2281;
    out.m_85.y = _2295;
    out.m_85.z = _2301;
    out.m_85.w = _2022;
    float _2317 = _2315;
    float _2319 = _2315;
    if (!_2265)
    {
        _2175 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2321 = _2175;
    float _2323 = -_2050;
    float _2325 = _2323 + 1.0;
    float _2327 = _2325 * _2309;
    float _2329 = precise::clamp(_2327, 0.0, 1.0);
    float _2331 = -_2329;
    float _2333 = fma(_2331, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2335 = _2333 * _2225;
    float _2337 = _2297 * _2066;
    float _2339 = -_2297;
    float _2341 = _2339 + 1.0;
    float _2343 = _2335 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2345 = _2083 * _2337;
    float _2347 = _2083 * _2341;
    out.m_87.x = _2343;
    float _2349 = _2093 * _2337;
    float _2351 = fma(_2089, _2345, _2077);
    float _2353 = fma(_2091, _2345, _2079);
    float _2355 = _2079;
    float _2357 = _2077;
    float _2359 = _2321;
    float _2361 = _2321;
    if (!_2265)
    {
        _2355 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2363 = _2355;
    float _2365 = fma(_2083, _2349, _2081);
    float _2367 = _2283 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2369 = _2363;
    float _2371 = _2363;
    if (!_2265)
    {
        _2357 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2373 = _2357;
    float _2375 = _2373;
    float _2377 = _2373;
    if (!_2265)
    {
        _2305 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2379 = _2305;
    out.m_89.x = _2351;
    out.m_89.y = _2353;
    out.m_89.z = _2365;
    out.m_89.w = _2347;
    bool _2381 = !_2265;
    float _2383 = _2379;
    float _2385 = _2379;
    if (!_2381)
    {
        bool _2387 = _1766 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2389 = isnan(_1766);
        bool _2391 = _2387 || _2389;
        bool _2393 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2395 = _2391 || _2393;
        if (!_2395)
        {
            float _2397 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2399 = _1766 + _2397;
            float _2401 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2403 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2401;
            float _2405 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2407 = _2405 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2409 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2411 = _2409 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2413 = 1.0 / _2403;
            float _2415 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2417 = _2415 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2419 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2421 = _2419 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2423 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2425 = _2423 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2427 = _2399 * _2413;
            float _2429 = precise::clamp(_2427, 0.0, 1.0);
            float _2431 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2433 = _2431 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2435 = fma(_2429, _2407, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2437 = fma(_2429, _2411, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2439 = fma(_2429, _2417, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2441 = fma(_2429, _2433, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2443 = fma(_2429, _2421, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2445 = fma(_2429, _2425, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2377 = _2439;
            _2361 = _2435;
            _2371 = _2437;
            _2319 = _2443;
            _2313 = _2441;
            _2385 = _2445;
            _2447 = true;
        }
        else
        {
            bool _2449 = _1766 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2451 = isnan(_1766);
            bool _2453 = _2449 || _2451;
            bool _2455 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2457 = _2453 || _2455;
            if (!_2457)
            {
                _2369 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2459 = _2369;
            _2371 = _2459;
            if (!_2457)
            {
                _2375 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2461 = _2375;
            _2377 = _2461;
            if (!_2457)
            {
                _2311 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2463 = _2311;
            _2313 = _2463;
            if (!_2457)
            {
                _2317 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2465 = _2317;
            _2319 = _2465;
            if (!_2457)
            {
                _2359 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2467 = _2359;
            _2361 = _2467;
            if (!_2457)
            {
                _2383 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2469 = _2383;
            bool _2471 = !_2457;
            _2385 = _2469;
            if (!_2471)
            {
                bool _2473 = _1766 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2475 = isnan(_1766);
                bool _2477 = _2473 || _2475;
                bool _2479 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2481 = _2477 || _2479;
                if (!_2481)
                {
                    float _2483 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2485 = _1766 + _2483;
                    float _2487 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2489 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2487;
                    float _2491 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2493 = _2491 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2495 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2497 = _2495 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2499 = 1.0 / _2489;
                    float _2501 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2503 = _2501 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2505 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2507 = _2505 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2509 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2511 = _2509 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2513 = _2485 * _2499;
                    float _2515 = precise::clamp(_2513, 0.0, 1.0);
                    float _2517 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2519 = _2517 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2521 = fma(_2515, _2493, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2523 = fma(_2515, _2497, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2525 = fma(_2515, _2503, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2527 = fma(_2515, _2519, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2529 = fma(_2515, _2507, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2531 = fma(_2515, _2511, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2377 = _2525;
                    _2361 = _2521;
                    _2371 = _2523;
                    _2319 = _2529;
                    _2313 = _2527;
                    _2385 = _2531;
                    _2447 = true;
                }
                else
                {
                    _2377 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2361 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2371 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2319 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2313 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2385 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2447 = false;
    float _2533 = _2377;
    float _2535 = _2361;
    float _2537 = _2371;
    float _2539 = _2319;
    float _2541 = _2313;
    float _2543 = _2385;
    float _2545 = fma(_2231, -0.5, 0.5);
    float _2547 = precise::clamp(_2545, 0.0, 1.0);
    float _2549 = -_2533;
    float _2551 = _2549 + _2535;
    float _2553 = -_2537;
    float _2555 = _2553 + _2539;
    out.m_91.x = 0.0;
    float _2557 = -_2541;
    float _2559 = _2557 + _2543;
    float _2561 = fma(_2547, _2551, _2533);
    float _2563 = fma(_2547, _2555, _2537);
    bool _2565 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2567 = _2561 * 0.586610972881317138671875;
    float _2569 = fma(_2547, _2559, _2541);
    float _2571 = _2367 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2573 = fma(_2563, 0.298911988735198974609375, _2567);
    bool _2575 = _1672 > 0.0;
    bool _2577 = isnan(_1672);
    bool _2579 = _2575 || _2577;
    bool _2581 = isnan(0.0);
    bool _2583 = _2579 || _2581;
    float _2585 = fma(_2569, 0.114477999508380889892578125, _2573);
    out.m_51.x = _2571;
    bool _2587 = _1734 <= 0.0;
    bool _2589 = !_2583;
    bool _2591 = _2587 || _2589;
    float _2593 = -_2585;
    float _2595 = _2563 + _2593;
    float _2597 = -_2585;
    float _2599 = _2569 + _2597;
    float _2601 = fma(_2595, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2585);
    float _2603 = -_2585;
    float _2605 = _2561 + _2603;
    float _2607 = fma(_2605, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2585);
    float _2609 = fma(_2599, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2585);
    bool _2611 = !_2565;
    if (!_2611)
    {
        float _2613 = -_1596;
        float _2615 = _2613 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2617 = -_1598;
        float _2619 = _2617 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2621 = -_1600;
        float _2623 = _2621 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2625 = _2615 * _2615;
        float _2627 = fma(_2619, _2619, _2625);
        float _2629 = fma(_2623, _2623, _2627);
        float _2631 = sqrt(_2629);
        float _2633 = rsqrt(_2629);
        float _2635 = -_2631;
        float _2637 = _2635 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2639 = _2637 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2641 = precise::clamp(_2639, 0.0, 1.0);
        float _2643 = _2619 * _2633;
        float _2645 = _2615 * _2633;
        float _2647 = abs(_2641);
        float _2649 = log2(_2647);
        float _2651 = _2623 * _2633;
        float _2653 = _2643 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2655 = _2231 * _2645;
        float _2657 = -_2645;
        float _2659 = -_2653;
        float _2661 = fma(_2657, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2659);
        float _2663 = fma(_2213, _2643, _2655);
        float _2665 = -_2651;
        float _2667 = fma(_2665, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2661);
        float _2669 = fma(_2247, _2651, _2663);
        float _2671 = precise::clamp(_2669, 0.0, 1.0);
        float _2673 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2675 = _2667 + _2673;
        float _2677 = _2649 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2679 = _2675 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2681 = precise::clamp(_2679, 0.0, 1.0);
        float _2683 = exp2(_2677);
        float _2685 = _2683 * _2681;
        float _2687 = _2671 * _2685;
        float _2689 = _2687 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2691 = _2687 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2693 = _2687 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_91.x = _2689;
        out.m_91.y = _2691;
        out.m_91.z = _2693;
    }
    out.m_93.x = _2601;
    out.m_93.y = _2607;
    out.m_93.z = _2609;
    if (!_2591)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2695 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_51.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2695;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

