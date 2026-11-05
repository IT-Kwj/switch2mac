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
    constant _16* vp_c9 [[id(0)]];
    constant _16* vp_c10 [[id(1)]];
    constant _16* vp_c8 [[id(2)]];
    constant _16* vp_c7 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
    constant _16* vp_c13 [[id(5)]];
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
    float4 m_71 [[user(locn0)]];
    float4 m_73 [[user(locn1)]];
    float4 m_97 [[user(locn2)]];
    float4 m_79 [[user(locn3)]];
    float4 m_51 [[user(locn4)]];
    float4 m_91 [[user(locn5)]];
    float4 m_53 [[user(locn6)]];
    float4 m_81 [[user(locn7)]];
    float4 m_93 [[user(locn8)]];
    float4 m_85 [[user(locn9)]];
    float4 m_95 [[user(locn10)]];
    float4 m_89 [[user(locn11)]];
    float4 m_87 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_83 [[attribute(0)]];
    float4 m_57 [[attribute(1)]];
    float4 m_59 [[attribute(2)]];
    float4 m_61 [[attribute(3)]];
    float4 m_67 [[attribute(4)]];
    float4 m_55 [[attribute(5)]];
    float4 m_46 [[attribute(6)]];
    float4 m_48 [[attribute(7)]];
    float4 m_77 [[attribute(8)]];
    float4 m_69 [[attribute(9)]];
    float4 m_63 [[attribute(10)]];
    float4 m_65 [[attribute(11)]];
    float4 m_75 [[attribute(13)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3092 = false;
    bool _550 = false;
    bool _400 = false;
    bool _238 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _111 = in.m_46.w;
    float _113 = in.m_48.w;
    float _115 = trunc(_111);
    int _118 = int(_115);
    float _120 = -_113;
    float _122 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _122;
    bool _126 = _118 >= 1;
    float _128 = 0.0;
    float _130 = _113;
    float _132 = _122;
    if (!_126)
    {
        _128 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _134 = _128;
    if (!_126)
    {
        out.m_53.x = 0.0;
    }
    int _136 = 0;
    if (!_126)
    {
        float _138 = _134 * 5.0;
        _136 = as_type<int>(_138);
    }
    int _140 = _136;
    int _142 = _140;
    if (!_126)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3402 = as_type<float>(_140);
        out.gl_Position.z = _3402;
    }
    if (!_126)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _144 = _113 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _146 = isnan(_113);
    bool _148 = _144 || _146;
    bool _150 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _152 = _148 || _150;
    float _154 = float(_118);
    bool _156 = _122 >= _154;
    bool _158 = !_152;
    bool _160 = _156 || _158;
    if (_160)
    {
        _130 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _162 = _130;
    if (_160)
    {
        out.m_53.x = 0.0;
    }
    if (_160)
    {
        float _164 = _162 * 5.0;
        _142 = as_type<int>(_164);
    }
    int _166 = _142;
    if (_160)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3457 = as_type<float>(_166);
        out.gl_Position.z = _3457;
    }
    if (_160)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _168 = in.m_55.x;
    float _170 = in.m_55.y;
    float _172 = in.m_55.z;
    float _174 = 1.0 / _154;
    bool _176 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _178 = in.m_57.x;
    float _180 = in.m_57.y;
    float _182 = in.m_57.z;
    float _184 = in.m_59.x;
    float _186 = in.m_59.y;
    float _188 = in.m_59.z;
    float _190 = in.m_61.x;
    float _192 = in.m_61.y;
    float _194 = in.m_61.z;
    float _196 = _122 * _174;
    float _198 = _170 * _180;
    float _200 = _170 * _186;
    float _202 = fma(_168, _178, _198);
    float _204 = _170 * _192;
    float _206 = fma(_168, _184, _200);
    float _208 = fma(_172, _182, _202);
    float _210 = fma(_168, _190, _204);
    float _212 = fma(_172, _188, _206);
    float _214 = fma(_172, _194, _210);
    bool _216 = !_176;
    float _218 = _196;
    float _236;
    if (!_216)
    {
        float _220 = in.m_63.x;
        float _222 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _224 = _220 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _226 = fma(_224, (*spvDescriptorSet0.vp_c9)._m0[12].x, _122);
        float _228 = _226 * _222;
        float _230 = floor(_228);
        float _232 = -_230;
        float _234 = _228 + _232;
        _236 = _234;
        _238 = true;
    }
    else
    {
        _236 = _196;
    }
    _238 = false;
    float _240 = _236;
    float _242 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _244 = _240 + _242;
    bool _246 = _240 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _248 = isnan(_240);
    bool _250 = _246 || _248;
    bool _252 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _254 = _250 || _252;
    float _256 = float(_254);
    float _258 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _260 = _240 + _258;
    bool _262 = _240 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _264 = isnan(_240);
    bool _266 = _262 || _264;
    bool _268 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _270 = _266 || _268;
    float _272 = float(_270);
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _276 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _274;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _280 = _278 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _282 = _240 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _284 = isnan(_240);
    bool _286 = _282 || _284;
    bool _288 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _290 = _286 || _288;
    float _292 = float(_290);
    float _294 = 1.0 / _276;
    float _296 = -_292;
    float _298 = _296 + 1.0;
    bool _300 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _302 = _272 * _298;
    float _304 = -_272;
    float _306 = _304 + 1.0;
    float _308 = 1.0 / _280;
    float _310 = _244 * _294;
    float _312 = -_256;
    float _314 = _312 + 1.0;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _318 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _316;
    float _320 = _292 * _314;
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _324 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _322;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _328 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _326;
    float _330 = fma(_318, _310, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _332 = _260 * _308;
    float _334 = fma(_324, _310, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _336 = fma(_328, _310, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _338 = _330 * _302;
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _342 = _340 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _344 = _334 * _302;
    float _346 = _336 * _302;
    float _348 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _350 = _348 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _354 = _352 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _356 = fma(_306, (*spvDescriptorSet0.vp_c9)._m0[143].x, _344);
    float _358 = fma(_306, (*spvDescriptorSet0.vp_c9)._m0[143].y, _338);
    float _360 = fma(_350, _332, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _362 = fma(_342, _332, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _364 = fma(_354, _332, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _366 = fma(_306, (*spvDescriptorSet0.vp_c9)._m0[143].z, _346);
    float _368 = fma(_360, _320, _356);
    float _370 = fma(_362, _320, _358);
    float _372 = fma(_364, _320, _366);
    float _374 = fma(_256, (*spvDescriptorSet0.vp_c9)._m0[145].x, _368);
    float _376 = fma(_256, (*spvDescriptorSet0.vp_c9)._m0[145].y, _370);
    float _378 = fma(_256, (*spvDescriptorSet0.vp_c9)._m0[145].z, _372);
    bool _380 = !_300;
    float _398;
    if (!_380)
    {
        float _382 = in.m_63.x;
        float _384 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _386 = _382 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _388 = fma(_386, (*spvDescriptorSet0.vp_c9)._m0[11].y, _122);
        float _390 = _388 * _384;
        float _392 = floor(_390);
        float _394 = -_392;
        float _396 = _390 + _394;
        _398 = _396;
        _400 = true;
    }
    else
    {
        _398 = _196;
    }
    _400 = false;
    float _402 = _398;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _406 = _402 + _404;
    float _408 = in.m_65.x;
    float _410 = in.m_65.y;
    float _412 = in.m_65.z;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _416 = _414 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _418 = _402 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _420 = isnan(_402);
    bool _422 = _418 || _420;
    bool _424 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _426 = _422 || _424;
    float _428 = float(_426);
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _432 = _430 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _434 = _402 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _436 = isnan(_402);
    bool _438 = _434 || _436;
    bool _440 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _442 = _438 || _440;
    float _444 = float(_442);
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _448 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _446;
    bool _450 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _452 = 1.0 / _416;
    float _454 = -_428;
    float _456 = _454 + 1.0;
    float _458 = _444 * _456;
    float _460 = -_444;
    float _462 = _460 + 1.0;
    float _464 = 1.0 / _432;
    float _466 = _448 * _452;
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _470 = _468 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _472 = _378 * _412;
    float _474 = _376 * _410;
    float _476 = fma(_466, _406, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _478 = _402 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _480 = isnan(_402);
    bool _482 = _478 || _480;
    bool _484 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _486 = _482 || _484;
    float _488 = float(_486);
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _492 = _402 + _490;
    float _494 = _374 * _408;
    float _496 = _476 * _458;
    float _498 = _470 * _464;
    float _500 = -_488;
    float _502 = _500 + 1.0;
    float _504 = fma(_462, (*spvDescriptorSet0.vp_c9)._m0[115].x, _496);
    float _506 = fma(_498, _492, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _508 = _428 * _502;
    float _510 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _512 = fma(_506, _508, _504);
    float _514 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _516 = _510 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _518 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _520 = fma(_488, (*spvDescriptorSet0.vp_c9)._m0[117].x, _512);
    float _522 = _514 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _524 = _518 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _526 = _520 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _528 = !_450;
    float _530 = _526;
    float _548;
    if (!_528)
    {
        float _532 = in.m_63.x;
        float _534 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _536 = _532 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _538 = fma(_536, (*spvDescriptorSet0.vp_c9)._m0[11].w, _122);
        float _540 = _538 * _534;
        float _542 = floor(_540);
        float _544 = -_542;
        float _546 = _540 + _544;
        _548 = _546;
        _550 = true;
    }
    else
    {
        _548 = _196;
    }
    _550 = false;
    float _552 = _548;
    float _554 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _556 = _552 + _554;
    float _558 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _560 = _558 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _564 = _562 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _566 = _552 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _568 = isnan(_552);
    bool _570 = _566 || _568;
    bool _572 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _574 = _570 || _572;
    float _576 = float(_574);
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _580 = _578 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _582 = _552 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _584 = isnan(_552);
    bool _586 = _582 || _584;
    bool _588 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _590 = _586 || _588;
    float _592 = float(_590);
    float _594 = 1.0 / _560;
    float _596 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _598 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _596;
    float _600 = -_576;
    float _602 = _600 + 1.0;
    bool _604 = _552 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _606 = isnan(_552);
    bool _608 = _604 || _606;
    bool _610 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _612 = _608 || _610;
    float _614 = float(_612);
    bool _616 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _618 = 1.0 / _564;
    float _620 = 1.0 / _580;
    float _622 = _598 * _594;
    float _624 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _626 = _624 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _628 = _592 * _602;
    float _630 = -_592;
    float _632 = _630 + 1.0;
    float _634 = fma(_622, _556, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _638 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _636;
    float _640 = _614 * _632;
    float _642 = _626 * _618;
    float _644 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _646 = _552 + _644;
    bool _648 = _552 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _650 = isnan(_552);
    bool _652 = _648 || _650;
    bool _654 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _656 = _652 || _654;
    float _658 = float(_656);
    float _660 = _634 * _640;
    float _662 = -_614;
    float _664 = _662 + 1.0;
    float _666 = fma(_642, _646, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _668 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _670 = _552 + _668;
    float _672 = _638 * _620;
    float _674 = -_658;
    float _676 = _674 + 1.0;
    float _678 = fma(_664, (*spvDescriptorSet0.vp_c9)._m0[131].x, _660);
    float _680 = fma(_672, _670, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _682 = _576 * _676;
    float _684 = fma(_666, _628, _678);
    float _686 = fma(_680, _682, _684);
    float _688 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _690 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _692 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _694 = fma(_658, (*spvDescriptorSet0.vp_c9)._m0[134].x, _686);
    float _696 = _690 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _698 = _688 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _700 = _692 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _702 = _694 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _704 = !_616;
    if (!_704)
    {
        float _706 = in.m_63.x;
        float _708 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _710 = _706 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _712 = fma(_710, (*spvDescriptorSet0.vp_c9)._m0[14].x, _122);
        float _714 = _712 * _708;
        float _716 = floor(_714);
        float _718 = -_716;
        float _720 = _714 + _718;
        _218 = _720;
    }
    float _722 = _218;
    float _724 = in.m_46.x;
    float _726 = in.m_46.y;
    float _728 = in.m_46.z;
    float _730 = _494 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _732 = in.m_63.x;
    float _734 = in.m_63.y;
    float _736 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _738 = _736 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _740 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _742 = in.m_63.z;
    float _744 = 1.0 / _738;
    float _746 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _748 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _750 = _748 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _752 = _472 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _754 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _756 = _754 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _758 = 1.0 / _750;
    float _760 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _762 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _760;
    float _764 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _766 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _764;
    float _768 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _770 = _768 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _772 = _186 * _726;
    float _774 = _180 * _726;
    float _776 = _192 * _726;
    float _778 = fma(_184, _724, _772);
    float _780 = _732 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _782 = fma(_178, _724, _774);
    float _784 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _786 = _784 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _788 = fma(_190, _724, _776);
    float _790 = -_740;
    float _792 = fma(_780, 2.0, _790);
    float _794 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _796 = _794 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _798 = 1.0 / _786;
    float _800 = _734 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _802 = fma(_182, _728, _782);
    float _804 = fma(_188, _728, _778);
    float _806 = fma(_800, -2.0, _746);
    float _808 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _810 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _808;
    float _812 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _814 = _812 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _816 = 1.0 / _796;
    float _818 = fma(_194, _728, _788);
    float _820 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _822 = _820 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _824 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _826 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _824;
    int _828 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _830 = _828 != 0;
    int _832 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _834 = _832 != 0;
    int _836 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _838 = _836 != 0;
    float _840 = 1.0 / _814;
    float _842 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _844 = _842 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _846 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _848 = _846 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _850 = _822 * _798;
    bool _852 = !_834;
    int _854 = _852 ? 0 : 1;
    float _856 = in.m_61.w;
    float _858 = _848 * _758;
    float _860 = _734 + _732;
    float _862 = 1.0 / _844;
    float _864 = _762 * _816;
    bool _866 = !_830;
    int _868 = _866 ? 0 : 1;
    float _870 = in.m_57.w;
    float _872 = _860 + (-1.0);
    bool _874 = !_838;
    int _876 = _874 ? 0 : 1;
    float _878 = _826 * _744;
    float _880 = 1.0 / _756;
    float _882 = _732 * 2.0;
    float _884 = _770 * _840;
    bool _886 = _722 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _888 = isnan(_722);
    bool _890 = _886 || _888;
    bool _892 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _894 = _890 || _892;
    float _896 = float(_894);
    float _898 = in.m_59.w;
    bool _900 = _722 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _902 = isnan(_722);
    bool _904 = _900 || _902;
    bool _906 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _908 = _904 || _906;
    float _910 = float(_908);
    float _912 = _766 * _862;
    float _914 = _742 * 2.0;
    float _916 = floor(_882);
    float _918 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _920 = _818 + _856;
    float _922 = _810 * _880;
    float _924 = floor(_914);
    float _926 = _734 + _742;
    float _928 = _802 + _870;
    float _930 = fma(_732, (*spvDescriptorSet0.vp_c9)._m0[78].z, _918);
    float _932 = fma(_872, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _934 = _742 + _732;
    float _936 = _926 + (-1.0);
    float _938 = _734 * 2.0;
    bool _940 = _916 > 0.0;
    float _942 = _934 + (-1.0);
    bool _944 = _916 >= 0.0;
    bool _946 = isnan(_916);
    bool _948 = _944 || _946;
    bool _950 = isnan(0.0);
    bool _952 = _948 || _950;
    float _954 = fma(_936, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _956 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _958 = _722 + _956;
    float _960 = fma(_942, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _962 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _964 = _962 != 0;
    int _966 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _968 = _966 != 0;
    int _970 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _972 = _970 != 0;
    float _974 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _976 = _722 + _974;
    bool _978 = _924 > 0.0;
    float _980 = fma(_878, _958, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _982 = _924 >= 0.0;
    bool _984 = isnan(_924);
    bool _986 = _982 || _984;
    bool _988 = isnan(0.0);
    bool _990 = _986 || _988;
    float _992 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _994 = log2(_992);
    int _996 = _952 ? 0 : 1;
    float _998 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1000 = _722 + _998;
    int _1002 = _990 ? 0 : 1;
    float _1004 = fma(_858, _976, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    bool _1006 = !_964;
    int _1008 = _1006 ? 0 : 1;
    float _1010 = -_896;
    float _1012 = _1010 + 1.0;
    int _1014 = ~_1002;
    int _1016 = _1014 + 1;
    int _1018 = _1016 + 1;
    float _1020 = floor(_938);
    int _1022 = ~_996;
    int _1024 = _1022 + 1;
    int _1026 = _1024 + 1;
    float _1028 = fma(_922, _1000, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    int _1030 = _1018;
    int _1032 = _1026;
    if (!_978)
    {
        int _1034 = ~_1002;
        int _1036 = _1034 + 1;
        _1030 = _1036;
    }
    int _1038 = _1030;
    float _1040 = _804 + _898;
    if (!_940)
    {
        int _1042 = ~_996;
        int _1044 = _1042 + 1;
        _1032 = _1044;
    }
    int _1046 = _1032;
    bool _1048 = _722 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1050 = isnan(_722);
    bool _1052 = _1048 || _1050;
    bool _1054 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1056 = _1052 || _1054;
    float _1058 = float(_1056);
    float _1060 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1062 = int(_1060);
    int _1064 = abs(_1008);
    float _1066 = _994 * _122;
    float _1068 = float(_1038);
    float _1070 = _1058 * _1012;
    bool _1072 = _722 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1074 = isnan(_722);
    bool _1076 = _1072 || _1074;
    bool _1078 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1080 = _1076 || _1078;
    float _1082 = float(_1080);
    float _1084 = -_1058;
    float _1086 = _1084 + 1.0;
    bool _1088 = _722 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1090 = isnan(_722);
    bool _1092 = _1088 || _1090;
    bool _1094 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1096 = _1092 || _1094;
    float _1098 = float(_1096);
    float _1100 = exp2(_1066);
    float _1102 = float(_1064);
    float _1104 = _1082 * _1086;
    float _1106 = -_1082;
    float _1108 = _1106 + 1.0;
    bool _1110 = _722 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1112 = isnan(_722);
    bool _1114 = _1110 || _1112;
    bool _1116 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1118 = _1114 || _1116;
    float _1120 = float(_1118);
    float _1122 = -_1098;
    float _1124 = _1122 + 1.0;
    bool _1126 = _1020 > 0.0;
    float _1128 = _1102 * _1068;
    bool _1130 = _1020 >= 0.0;
    bool _1132 = isnan(_1020);
    bool _1134 = _1130 || _1132;
    bool _1136 = isnan(0.0);
    bool _1138 = _1134 || _1136;
    float _1140 = _1120 * _1124;
    float _1142 = -_1120;
    float _1144 = _1142 + 1.0;
    float _1146 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1148 = int(_1146);
    float _1150 = float(_1062);
    float _1152 = _1098 * _1108;
    bool _1154 = _722 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1156 = isnan(_722);
    bool _1158 = _1154 || _1156;
    bool _1160 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1162 = _1158 || _1160;
    float _1164 = float(_1162);
    float _1166 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1168 = 1.0 + _1166;
    float _1170 = in.m_67.x;
    float _1172 = in.m_67.y;
    float _1174 = in.m_67.z;
    bool _1176 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1178 = isnan(1.0);
    bool _1180 = _1176 || _1178;
    bool _1182 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1184 = _1180 || _1182;
    float _1186 = 1.0 / _1150;
    float _1188 = _1164 * _1144;
    float _1190 = -_1164;
    float _1192 = _1190 + 1.0;
    float _1194 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1196 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1198 = isnan(0.0);
    bool _1200 = _1196 || _1198;
    bool _1202 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1204 = _1200 || _1202;
    float _1206 = _910 * _1192;
    float _1208 = fma(_734, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1194);
    float _1210 = 1.0 / _1168;
    float _1212 = -_1100;
    float _1214 = _1212 + 1.0;
    float _1216 = -_122;
    float _1218 = fma(_1216, (*spvDescriptorSet0.vp_c9)._m0[76].x, _792);
    float _1220 = float(_1148);
    float _1222 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1208);
    bool _1224 = !_968;
    int _1226 = _1224 ? 0 : 1;
    float _1228 = _980 * _1206;
    float _1230 = _1204 ? _1214 : 0.0;
    float _1232 = _1186 * _122;
    float _1234 = _1220 * _122;
    float _1236 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].z, _930);
    float _1238 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[76].y, _806);
    bool _1240 = !_972;
    int _1242 = _1240 ? 0 : 1;
    int _1244 = abs(_1226);
    if (_1184)
    {
        float _1246 = _1230 * _1210;
        _132 = _1246;
    }
    float _1248 = _132;
    float _1250 = _1128 * (-2.0);
    int _1252 = _1138 ? 0 : 1;
    int _1254 = abs(_1242);
    float _1256 = fma(_932, _1250, _932);
    float _1258 = fma(_1250, _1170, _1170);
    float _1260 = _732 + (-0.5);
    float _1262 = float(_1046);
    float _1264 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1266 = _928 + _1264;
    float _1268 = float(_1244);
    float _1270 = fma(_1260, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1258);
    int _1272 = ~_1252;
    int _1274 = _1272 + 1;
    int _1276 = _1274 + 1;
    float _1278 = -_910;
    float _1280 = _1278 + 1.0;
    int _1282 = _1276;
    if (!_1126)
    {
        int _1284 = ~_1252;
        int _1286 = _1284 + 1;
        _1282 = _1286;
    }
    int _1288 = _1282;
    float _1290 = _1268 * _1262;
    float _1292 = fma(_1256, _1248, _1270);
    float _1294 = float(_1288);
    float _1296 = _1290 * (-2.0);
    float _1298 = float(_1254);
    float _1300 = fma(_1280, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1228);
    float _1302 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1304 = _1040 + _1302;
    float _1306 = fma(_1296, _1172, _1172);
    float _1308 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1310 = _920 + _1308;
    float _1312 = _1298 * _1294;
    float _1314 = _734 + (-0.5);
    float _1316 = _1304 * _1304;
    float _1318 = _1292 * 0.15915493667125701904296875;
    float _1320 = _1312 * (-2.0);
    float _1322 = fma(_1314, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1306);
    float _1324 = fma(_1266, _1266, _1316);
    float _1326 = _742 + (-0.5);
    float _1328 = fma(_1320, _1174, _1174);
    float _1330 = fma(_1004, _1188, _1300);
    float _1332 = fma(_1310, _1310, _1324);
    float _1334 = fma(_954, _1296, _954);
    float _1336 = fma(_1326, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1328);
    float _1338 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1340 = _722 + _1338;
    float _1342 = fma(_1028, _1140, _1330);
    float _1344 = in.m_69.x;
    float _1346 = in.m_69.y;
    float _1348 = in.m_69.z;
    float _1350 = fma(_960, _1320, _960);
    float _1352 = fma(_850, _1340, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1354 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1356 = _722 + _1354;
    float _1358 = fma(_1334, _1248, _1322);
    float _1360 = fma(_1350, _1248, _1336);
    float _1362 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1364 = _722 + _1362;
    bool _1366 = _722 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1368 = isnan(_722);
    bool _1370 = _1366 || _1368;
    bool _1372 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1374 = _1370 || _1372;
    float _1376 = float(_1374);
    float _1378 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1380 = _722 + _1378;
    float _1382 = fma(_864, _1356, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1384 = fma(_1352, _1152, _1342);
    float _1386 = _1358 * 0.15915493667125701904296875;
    float _1388 = _1360 * 0.15915493667125701904296875;
    float _1390 = rsqrt(_1332);
    float _1392 = fma(_884, _1364, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1394 = -_1376;
    float _1396 = _1394 + 1.0;
    float _1398 = fma(_1382, _1104, _1384);
    float _1400 = fma(_912, _1380, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1402 = _896 * _1396;
    float _1404 = fma(_1392, _1070, _1398);
    float _1406 = _1318 * 6.283185482025146484375;
    float _1408 = sin(_1406);
    float _1410 = fma(_1400, _1402, _1404);
    float _1412 = _474 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1414 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1344);
    float _1416 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1346);
    float _1418 = fma(_1376, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1410);
    float _1420 = _1386 * 6.283185482025146484375;
    float _1422 = sin(_1420);
    float _1424 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1348);
    float _1426 = _730 * _1414;
    float _1428 = _1418 * _1390;
    float _1430 = _1412 * _1416;
    float _1432 = -(*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _1434 = _1432 + (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _1436 = _752 * _1424;
    float _1438 = abs((*spvDescriptorSet0.vp_c7)._m0[2].z);
    float _1440 = precise::max((*spvDescriptorSet0.vp_c9)._m0[191].x, _1438);
    float _1442 = _1386 * 6.283185482025146484375;
    float _1444 = cos(_1442);
    float _1446 = abs(_1310);
    float _1448 = _1446 * _1428;
    float _1450 = abs(_1266);
    float _1452 = _1450 * _1428;
    float _1454 = abs(_1304);
    float _1456 = _1454 * _1428;
    float _1458 = _1388 * 6.283185482025146484375;
    float _1460 = cos(_1458);
    float _1462 = _1408 * _1422;
    float _1464 = _1318 * 6.283185482025146484375;
    float _1466 = cos(_1464);
    float _1468 = _1408 * _1444;
    float _1470 = _1388 * 6.283185482025146484375;
    float _1472 = sin(_1470);
    float _1474 = _1408 * _1460;
    float _1476 = _1444 * _1460;
    float _1478 = _1422 * _1460;
    float _1480 = _1466 * _1444;
    float _1482 = _1466 * _1422;
    float _1484 = _1466 * _1460;
    float _1486 = _1474 * _1430;
    float _1488 = precise::min(_1440, (*spvDescriptorSet0.vp_c9)._m0[191].y);
    float _1490 = fma(_1472, _1480, _1462);
    float _1492 = fma(_1472, _1462, _1480);
    float _1494 = _1484 * _1430;
    float _1496 = 1.0 / _1434;
    float _1498 = -_1482;
    float _1500 = fma(_1472, _1468, _1498);
    float _1502 = -_1430;
    float _1504 = _1472 * _1502;
    float _1506 = -_1468;
    float _1508 = fma(_1472, _1482, _1506);
    float _1510 = fma(_1490, _1426, _1494);
    float _1512 = fma(_1500, _1426, _1486);
    float _1514 = fma(_1476, _1426, _1504);
    float _1516 = abs((*spvDescriptorSet0.vp_c7)._m0[2].x);
    float _1518 = precise::max((*spvDescriptorSet0.vp_c9)._m0[191].x, _1516);
    float _1520 = fma(_1508, _1436, _1510);
    float _1522 = -(*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _1524 = _1488 + _1522;
    float _1526 = fma(_1478, _1436, _1514);
    float _1528 = precise::min(_1518, (*spvDescriptorSet0.vp_c9)._m0[191].y);
    float _1530 = _1520 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1532 = fma(_1492, _1436, _1512);
    float _1534 = _1520 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1536 = _1524 * _1496;
    float _1538 = fma(_1526, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1530);
    float _1540 = -(*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _1542 = _1528 + _1540;
    float _1544 = fma(_1448, _1536, 1.0);
    float _1546 = fma(_1526, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1534);
    float _1548 = fma(_1532, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1538);
    float _1550 = _1542 * _1496;
    float _1552 = fma(_1532, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1546);
    float _1554 = _1548 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1556 = fma(_1452, _1550, 0.9900000095367431640625);
    float _1558 = _1552 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1560 = fma(_1554, _1544, _920);
    float _1562 = fma(_1558, _1556, _928);
    float _1564 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1566 = _1560 + _1564;
    float _1568 = (*spvDescriptorSet0.vp_c7)._m0[2].y * 0.25;
    float _1570 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1572 = _1562 + _1570;
    float _1574 = _1566 * _1566;
    float _1576 = abs(_1568);
    float _1578 = precise::max(_1576, (*spvDescriptorSet0.vp_c9)._m0[191].x);
    float _1580 = fma(_1572, _1572, _1574);
    float _1582 = precise::min(_1578, (*spvDescriptorSet0.vp_c9)._m0[191].y);
    float _1584 = sqrt(_1580);
    float _1586 = -(*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _1588 = _1582 + _1586;
    float _1590 = _1520 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1592 = _1588 * _1496;
    float _1594 = fma(_1526, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1590);
    float _1596 = _1040 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1598 = _1040 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1600 = fma(_1456, _1592, 1.0);
    float _1602 = fma(_1532, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1594);
    float _1604 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1596);
    bool _1606 = _1584 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1608 = _1602 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1610 = fma(_920, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1604);
    float _1612 = fma(_1608, _1600, _1040);
    float _1614 = _1610 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1616 = _1608;
    float _1618 = _1600;
    float _1620 = _1560;
    float _1622 = _1598;
    if (!_1606)
    {
        _1616 = _1560;
    }
    float _1624 = _1616;
    float _1626 = _1624;
    if (!_1606)
    {
        _1618 = _1562;
    }
    float _1628 = _1618;
    float _1630 = _1628;
    if (!_1606)
    {
        _1620 = _1612;
    }
    float _1632 = _1620;
    bool _1634 = !_1606;
    float _1636 = _1632;
    if (!_1634)
    {
        float _1638 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1640 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1642 = _1584 + _1640;
        float _1644 = _1612 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1646 = rsqrt(_1580);
        float _1648 = _1642 * _1638;
        float _1650 = _1648 * 0.15915493667125701904296875;
        float _1652 = _1650 * 6.283185482025146484375;
        float _1654 = cos(_1652);
        float _1656 = _1650 * 6.283185482025146484375;
        float _1658 = sin(_1656);
        float _1660 = _1654 + (-1.0);
        float _1662 = _1660 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1664 = fma(_1658, _1644, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1666 = fma(_1612, _1654, _1662);
        float _1668 = _1646 * _1664;
        float _1670 = fma(_1572, _1668, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1672 = fma(_1566, _1668, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1636 = _1666;
        _1630 = _1670;
        _1626 = _1672;
    }
    float _1674 = _1636;
    float _1676 = _1630;
    float _1678 = _1626;
    float _1680 = -_1040;
    float _1682 = _1680 + _1674;
    float _1684 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1598);
    float _1686 = -_928;
    float _1688 = _1686 + _1676;
    float _1690 = 1.0 / _1614;
    float _1692 = _1682 * _1682;
    float _1694 = fma(_920, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1684);
    float _1696 = -_920;
    float _1698 = _1696 + _1678;
    bool _1700 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1702 = isnan(0.5);
    bool _1704 = _1700 || _1702;
    bool _1706 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1708 = _1704 || _1706;
    float _1710 = fma(_1688, _1688, _1692);
    float _1712 = _1694 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1714 = fma(_1698, _1698, _1710);
    float _1716 = _1712 + _1614;
    float _1718 = sqrt(_1714);
    float _1720 = _1716 * _1690;
    float _1722 = _1720 * 0.5;
    float _1724 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1726 = fma(_1722, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1724);
    float _1728 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _1730 = _1722;
    float _1732 = _1674;
    float _1734 = _1676;
    float _1736 = _1698;
    if (_1708)
    {
        _1728 = 1.0;
    }
    float _1738 = _1728;
    float _1740 = 1.0 / _1726;
    bool _1742 = _1718 > 0.0;
    float _1744 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1746 = _1740 * _1744;
    float _1748 = _1718;
    float _1750 = _1738;
    if (!_1742)
    {
        _1730 = _1678;
    }
    float _1752 = _1730;
    bool _1754 = !_1742;
    float _1756 = _1752;
    if (!_1754)
    {
        float _1758 = _212 * _212;
        float _1760 = fma(_208, _208, _1758);
        float _1762 = fma(_214, _214, _1760);
        float _1764 = rsqrt(_1714);
        float _1766 = sqrt(_1762);
        float _1768 = _1688 * _1764;
        float _1770 = _1682 * _1764;
        float _1772 = _1698 * _1764;
        bool _1774 = _1766 > 0.0;
        float _1776 = _1766;
        _1748 = _1764;
        _1622 = _1772;
        if (!_1774)
        {
            _1776 = _1678;
        }
        float _1778 = _1776;
        bool _1780 = !_1774;
        _1756 = _1778;
        if (!_1780)
        {
            float _1782 = rsqrt(_1762);
            float _1784 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1786 = _212 * _1782;
            float _1788 = _208 * _1782;
            float _1790 = _214 * _1782;
            float _1792 = _1770 * _1786;
            float _1794 = fma(_1768, _1788, _1792);
            float _1796 = _1784 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1798 = fma(_1772, _1790, _1794);
            float _1800 = _1798 * _1796;
            float _1802 = fma(_208, _1800, _1676);
            float _1804 = fma(_212, _1800, _1674);
            float _1806 = fma(_214, _1800, _1678);
            _1732 = _1804;
            _1734 = _1802;
            _1756 = _1806;
            _1736 = _1794;
            _1748 = _1792;
        }
    }
    float _1808 = _1732;
    float _1810 = _1734;
    float _1812 = _1756;
    float _1814 = _1736;
    float _1816 = _1748;
    float _1818 = _1622;
    float _1820 = _1814;
    float _1822 = _1818;
    if (!_1708)
    {
        float _1824 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1826 = _1824 * 0.15915493667125701904296875;
        float _1828 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1830 = _1826 * 6.283185482025146484375;
        float _1832 = cos(_1830);
        float _1834 = _1828 * 0.15915493667125701904296875;
        float _1836 = _1826 * 6.283185482025146484375;
        float _1838 = sin(_1836);
        float _1840 = 1.0 / _1832;
        float _1842 = _1834 * 6.283185482025146484375;
        float _1844 = cos(_1842);
        float _1846 = _1838 * _1840;
        float _1848 = _1834 * 6.283185482025146484375;
        float _1850 = sin(_1848);
        float _1852 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1854 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1852;
        float _1856 = _1844 * _1846;
        float _1858 = 1.0 / _1854;
        float _1860 = 1.0 / _1856;
        float _1862 = _1850 * _1860;
        float _1864 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1866 = fma(_1746, _1862, _1864);
        float _1868 = _1866 * _1858;
        float _1870 = precise::clamp(_1868, 0.0, 1.0);
        _1820 = _1826;
        _1750 = _1870;
    }
    float _1872 = _1820;
    float _1874 = _1750;
    float _1876 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1878 = _1808 + _1876;
    float _1880 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1882 = _1810 + _1880;
    float _1884 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1886 = _1812 + _1884;
    float _1888 = _1808 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1890 = _1878 * _1878;
    float _1892 = fma(_1810, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1888);
    float _1894 = fma(_1882, _1882, _1890);
    float _1896 = fma(_1812, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1892);
    float _1898 = fma(_1886, _1886, _1894);
    float _1900 = _1896 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1902 = rsqrt(_1898);
    float _1904 = sqrt(_1898);
    float _1906 = _1902 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1908 = _1882 * _1906;
    float _1910 = _1886 * _1906;
    float _1912 = _1908 * _1908;
    float _1914 = _1910 * _1910;
    float _1916 = _1912 + _1914;
    float _1918 = sqrt(_1916);
    bool _1920 = _1918 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1922 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1924 = _1918 + _1922;
    float _1926 = _1872;
    float _1928 = _1924;
    float _1930 = _1908;
    float _1932 = _1910;
    float _1934 = _1912;
    float _1936 = _1914;
    if (_1920)
    {
        float _1938 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1926 = _1938;
    }
    float _1940 = _1926;
    if (_1920)
    {
        float _1942 = _1924 * _1940;
        _1928 = _1942;
    }
    float _1944 = _1928;
    if (_1920)
    {
        float _1946 = _1944 * 0.15915493667125701904296875;
        _1822 = _1946;
    }
    float _1948 = _1822;
    float _1950 = _1816;
    float _1952 = _1948;
    if (_1920)
    {
        float _1954 = _1948 * 6.283185482025146484375;
        float _1956 = sin(_1954);
        _1950 = _1956;
    }
    float _1958 = _1950;
    float _1960 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1962 = precise::max(0.0, _1960);
    float _1964 = _1940;
    float _1966 = _1962;
    if (_1920)
    {
        float _1968 = _1948 * 6.283185482025146484375;
        float _1970 = cos(_1968);
        _1964 = _1970;
    }
    float _1972 = _1964;
    float _1974 = -_1906;
    float _1976 = -_1962;
    float _1978 = fma(_1878, _1974, _1976);
    float _1980 = _1960;
    if (_1920)
    {
        float _1982 = rsqrt(_1916);
        _1980 = _1982;
    }
    float _1984 = _1980;
    if (_1920)
    {
        float _1986 = _1978 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1966 = _1986;
    }
    float _1988 = _1966;
    float _1990 = fma(_928, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1992 = _1988;
    float _1994 = _1958;
    if (_1920)
    {
        float _1996 = fma(_1958, _1988, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1992 = _1996;
    }
    float _1998 = _1992;
    if (_1920)
    {
        float _2000 = _1972 + (-1.0);
        _1994 = _2000;
    }
    float _2002 = _1994;
    float _2004 = floor(_1990);
    float _2006 = _2002;
    if (_1920)
    {
        float _2008 = _2002 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2006 = _2008;
    }
    float _2010 = _2006;
    float _2012 = _1984;
    if (_1920)
    {
        float _2014 = _1984 * _1998;
        _1952 = _2014;
    }
    float _2016 = _1952;
    if (!_1920)
    {
        _2012 = _1978;
    }
    float _2018 = _2012;
    float _2020 = _2018;
    if (_1920)
    {
        float _2022 = fma(_1978, _1972, _2010);
        _2020 = _2022;
    }
    float _2024 = _2020;
    if (_1920)
    {
        float _2026 = _1908 * _2016;
        _1930 = _2026;
    }
    float _2028 = _1930;
    if (_1920)
    {
        float _2030 = _1910 * _2016;
        _1932 = _2030;
    }
    float _2032 = _1932;
    float _2034 = _1808 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1920)
    {
        float _2036 = _2028 * _2028;
        _1934 = _2036;
    }
    float _2038 = _1934;
    if (_1920)
    {
        float _2040 = _2032 * _2032;
        _1936 = _2040;
    }
    float _2042 = _1936;
    float _2044 = fma(_920, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2046 = fma(_2024, _2024, _2038);
    float _2048 = _1808 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2050 = fma(_1810, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2034);
    float _2052 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2054 = fma(_1904, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2052);
    float _2056 = precise::clamp(_2054, 0.0, 1.0);
    float _2058 = _2046 + _2042;
    float _2060 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2062 = _1808 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2064 = fma(_1810, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2048);
    float _2066 = fma(_1812, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2050);
    float _2068 = -_2056;
    float _2070 = _2068 + 1.0;
    float _2072 = fma(_1810, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2062);
    float _2074 = rsqrt(_2058);
    float _2076 = fma(_1812, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2064);
    float _2078 = _2066 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2080 = fma(_1812, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2072);
    float _2082 = _2076 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2084 = _2080 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2086 = _2078 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2088 = abs(_2070);
    float _2090 = log2(_2088);
    float _2092 = _2084 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2094 = -_2086;
    float _2096 = fma(_2094, _2060, 1.0);
    float _2098 = _2084 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2100 = fma(_2082, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2092);
    float _2102 = _2074 * _2028;
    float _2104 = _2074 * _2032;
    float _2106 = floor(_2044);
    float _2108 = fma(_2078, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2100);
    float _2110 = _2074 * _2024;
    float _2112 = fma(_1900, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2108);
    float _2114 = _2102 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2116 = _2090 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2118 = log2(_2096);
    float _2120 = _2110 + 1.0;
    float _2122 = -_2114;
    float _2124 = fma(_2110, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2122);
    float _2126 = -_2104;
    float _2128 = fma(_2126, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2124);
    float _2130 = -_2004;
    float _2132 = _1990 + _2130;
    float _2134 = 1.0 / _2112;
    float _2136 = _2084 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2138 = fma(_2128, -0.5, 0.5);
    float _2140 = -_2106;
    float _2142 = _2044 + _2140;
    float _2144 = fma(_2128, 0.5, 0.5);
    float _2146 = fma(_2082, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2136);
    float _2148 = fma(_2082, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2098);
    float _2150 = exp2(_2116);
    float _2152 = fma(_2078, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2146);
    float _2154 = fma(_2144, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2156 = fma(_2078, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2148);
    float _2158 = _2118 * 0.693147182464599609375;
    float _2160 = fma(_1900, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2152);
    float _2162 = fma(_2144, _2154, -0.212114393711090087890625);
    float _2164 = fma(_1900, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2156);
    float _2166 = sqrt(_2138);
    float _2168 = _2160 * _2134;
    float _2170 = fma(_2144, _2162, 1.570728778839111328125);
    float _2172 = _2164 * _2134;
    float _2174 = _2158 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2176 = fma(_2168, 0.5, 0.5);
    float _2178 = -_2110;
    float _2180 = fma(_2150, _2120, _2178);
    float2 _6604 = float2(_2132, _2142);
    float _2182 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6604, float2(0.0), isnan(_6604)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6604, float2(0.0), isnan(_6604)), level(0.0)).x;
    float _2184 = fma(_2180, 0.5, 0.5);
    float _2186 = _2166 * 0.636619746685028076171875;
    float _2188 = fma(_2172, -0.5, 0.5);
    float _2190 = -_2170;
    float _2192 = fma(_2186, _2190, 1.0);
    float3 _6627 = float3(_2176, _2188, _2174);
    float _2194 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6627, float3(0.0), isnan(_6627)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6627, float3(0.0), isnan(_6627)), level(0.0)).x;
    float3 _6638 = float3(_2176, _2188, _2174);
    float4 _2197 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6638, float3(0.0), isnan(_6638)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6638, float3(0.0), isnan(_6638)), level(0.0)).xyzw;
    float _2199 = _2197.x;
    float _2201 = _2197.y;
    float _2203 = _2197.z;
    float _2205 = _2197.w;
    float2 _6654 = float2(_2192, _2184);
    float3 _2209 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6654, float2(0.0), isnan(_6654)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6654, float2(0.0), isnan(_6654)), level(0.0)).xyz;
    float _2211 = _2209.x;
    float _2213 = _2209.y;
    float _2215 = _2209.z;
    float _2217 = float(uint(_1148));
    float _2219 = trunc(_1232);
    int _2221 = int(_2219);
    bool _2223 = _1148 == 0;
    float _2225 = _1234 * _174;
    int _2227 = abs(_868);
    out.m_71.x = _516;
    out.m_71.y = _522;
    out.m_71.z = _524;
    out.m_71.w = _526;
    int _2229 = abs(_876);
    float _2231 = _2090 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2233 = 1.0 / _2217;
    int _2235 = ~_1148;
    int _2237 = _2235 + 1;
    out.m_73.x = _696;
    out.m_73.y = _700;
    out.m_73.z = _698;
    out.m_73.w = _702;
    int _2239 = ~_1148;
    int _2241 = _2239 + 1;
    float _2243 = float(uint(_2221));
    float _2245 = trunc(_2225);
    int _2247 = int(_2245);
    int _2249 = ~_1148;
    int _2251 = _2249 + 1;
    int _2253 = as_type<int>(_2233) + (-2);
    float _2255 = exp2(_2231);
    int _2257 = ~_1148;
    int _2259 = _2257 + 1;
    float _2261 = as_type<float>(_2253) * _2243;
    float _2263 = trunc(_2261);
    float _2265 = precise::max(_2263, 0.0);
    uint _2268 = uint(_2265);
    float _2270 = -_2255;
    float _2272 = _2270 + 1.0;
    float _2274 = _2272 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _2276 = _2237 * int(_2268);
    int _2278 = _2276 + _2221;
    float _2280 = float(uint(_2278));
    float _2282 = as_type<float>(_2253) * _2280;
    int _2284 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2286 = _2284 != 0;
    float _2288 = trunc(_2282);
    float _2290 = precise::max(_2288, 0.0);
    uint _2292 = uint(_2290);
    bool _2294 = !_2286;
    float _2296 = _2294 ? 7.345489978790283203125 : 1.0;
    float _2298 = _2296 * _732;
    float _2300 = floor(_2298);
    int _2302 = int(_2268) + int(_2292);
    float _2304 = float(_2221);
    int _2306 = _2241 * _2302;
    int _2308 = _2306 + _2221;
    bool _2310 = _2304 >= _1220;
    bool _2312 = isnan(_2304);
    bool _2314 = _2310 || _2312;
    bool _2316 = isnan(_1220);
    bool _2318 = _2314 || _2316;
    float _2320 = float(_2318);
    int _2322 = _1148 + (-1);
    bool _2324 = uint(_2308) >= uint(_1148);
    float _2326 = -_2300;
    float _2328 = _2298 + _2326;
    float _2330 = trunc(_2320);
    int _2332 = int(_2330);
    bool _2334 = !_2324;
    int _2336 = _2334 ? 0 : (-1);
    float _2338 = _2328 * _1220;
    int _2340 = ~_2302;
    int _2342 = _2340 + _2336;
    int _2344 = _2342 + 1;
    int _2346 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2348 = _2346 != 0;
    float _2350 = trunc(_2338);
    int _2352 = int(_2350);
    int _2354 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2356 = _2354 != 0;
    int _2358 = _1148 * _2344;
    int _2360 = _2358 + _2221;
    bool _2362 = !_2348;
    int _2364 = _2362 ? 0 : 1;
    int _2366 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2368 = _2366 != 0;
    int _2370 = ~_2332;
    int _2372 = _2370 + 1;
    int _2374 = _2372 + 1;
    bool _2376 = !_2223;
    int _2378 = _2376 ? _2360 : (-1);
    int _2380 = abs(_854);
    int _2382 = abs(_2364);
    int _2384 = _2378 * _2374;
    float _2386 = in.m_75.y;
    int _2388 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2390 = _2388 != 0;
    int _2392 = _2332 * _2322;
    int _2394 = _2392 + _2384;
    int _2396 = _2352 * _2382;
    int _2398 = _2396 + _2221;
    bool _2400 = !_2368;
    int _2402 = _2400 ? 0 : 1;
    int _2404 = _2394 * _2380;
    float _2406 = in.m_75.x;
    int _2408 = abs(_2402);
    int _2410 = _2247 * _2227;
    int _2412 = _2410 + _2404;
    bool _2414 = _734 > 0.5;
    float _2416 = as_type<float>(_2404);
    float _2418 = _2386;
    if (_2356)
    {
        float _2420 = in.m_63.x;
        _2416 = _2420;
    }
    float _2422 = _2416;
    int _2424 = ~_1148;
    int _2426 = _2424 + 1;
    int _2428 = _2398 * _2229;
    int _2430 = _2428 + _2412;
    int _2432 = _2352 * _2408;
    int _2434 = _2432 + _2430;
    int _2436 = ~_1148;
    int _2438 = _2436 + 1;
    float _2440 = float(uint(_2434));
    float _2442 = as_type<float>(_2253) * _2440;
    float _2444 = trunc(_2442);
    float _2446 = precise::max(_2444, 0.0);
    uint _2448 = uint(_2446);
    float _2450 = _2406;
    if (_2356)
    {
        _530 = _2406;
    }
    float _2452 = _530;
    float _2454 = float(uint(_2398));
    int _2456 = _2438 * int(_2448);
    int _2458 = _2456 + _2434;
    float _2460 = float(uint(_2458));
    float _2462 = as_type<float>(_2253) * _2460;
    float _2464 = as_type<float>(_2253) * _2454;
    float _2466 = -_2386;
    float _2468 = _2466 + 1.0;
    float _2470 = trunc(_2462);
    float _2472 = precise::max(_2470, 0.0);
    uint _2474 = uint(_2472);
    float _2476 = _2452;
    if (_2390)
    {
        float _2478 = _2414 ? _2468 : _2386;
        _2418 = _2478;
    }
    float _2480 = _2418;
    bool _2482 = _2422 > 0.5;
    bool _2484 = _2482 && _2356;
    bool _2486 = _1346 != 0.0;
    bool _2488 = isnan(_1346);
    bool _2490 = _2486 || _2488;
    bool _2492 = isnan(0.0);
    bool _2494 = _2490 || _2492;
    float _2496 = fma(_2480, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _2498 = trunc(_2464);
    float _2500 = precise::max(_2498, 0.0);
    uint _2502 = uint(_2500);
    bool _2504 = _1344 == 0.0;
    bool _2506 = !_2494;
    bool _2508 = _2504 && _2506;
    float _2510 = -_1238;
    float _2512 = fma(_1222, _2496, _2510);
    bool _2514 = _1348 == 0.0;
    bool _2516 = _2514 && _2508;
    int _2518 = int(_2448) + int(_2474);
    if (_2484)
    {
        float _2520 = -_2452;
        float _2522 = _2520 + 1.0;
        _2476 = _2522;
    }
    float _2524 = _2476;
    float _2526 = in.m_77.x;
    float _2528 = in.m_77.y;
    float _2530 = in.m_77.z;
    int _2532 = _2251 * _2518;
    int _2534 = _2532 + _2434;
    if (_2356)
    {
        _2450 = _2524;
    }
    float _2536 = _2450;
    int _2538 = _2426 * int(_2502);
    int _2540 = _2538 + _2398;
    out.m_79.x = 1.0;
    out.m_79.y = 1.0;
    out.m_79.z = 1.0;
    bool _2542 = uint(_2534) >= uint(_1148);
    float _2544 = fma(_2536, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _2546 = float(uint(_2540));
    float _2548 = abs(_1746);
    float _2550 = log2(_2548);
    bool _2552 = !_2542;
    int _2554 = _2552 ? 0 : (-1);
    float _2556 = fma(_1236, _2544, _1218);
    float _2558 = as_type<float>(_2253) * _2546;
    int _2560 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2562 = _2560 != 0;
    int _2564 = ~_2518;
    int _2566 = _2564 + _2554;
    int _2568 = _2566 + 1;
    float _2570 = _2512 + 0.5;
    float _2572 = trunc(_2558);
    float _2574 = precise::max(_2572, 0.0);
    uint _2576 = uint(_2574);
    float _2578 = _2556 + 0.5;
    float _2580 = _1484 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2582 = _2526;
    float _2584 = _2528;
    float _2586 = _2530;
    if (!_2516)
    {
        float _2588 = fma(_1344, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2526);
        _2582 = _2588;
    }
    float _2590 = _2582;
    if (!_2516)
    {
        float _2592 = fma(_1346, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2528);
        _2584 = _2592;
    }
    float _2594 = _2584;
    out.m_81.x = _2578;
    out.m_81.y = _2570;
    float _2596 = _1508 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2598 = _2550 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _2600 = _1148 * _2568;
    int _2602 = _2600 + _2434;
    float _2604 = _1484 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    if (!_2516)
    {
        float _2606 = fma(_1348, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2530);
        _2586 = _2606;
    }
    float _2608 = _2586;
    float _2610 = exp2(_2598);
    float _2612 = _1508 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2614 = !_2223;
    int _2616 = _2614 ? _2602 : (-1);
    float _2618 = _1508 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2620 = int(_2502) + int(_2576);
    float _2622 = -_1472;
    float _2624 = fma(_2622, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2604);
    int _2626 = _2616 >> 31;
    float _2628 = _1484 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2630 = _2616 & 3;
    bool _2632 = _2630 != 0;
    float _2634 = -_1472;
    float _2636 = fma(_2634, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2580);
    int _2638 = _2626 & 3;
    int _2640 = _2259 * _2620;
    int _2642 = _2640 + _2398;
    float _2644 = -_1472;
    float _2646 = fma(_2644, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2628);
    float _2648 = fma(_1474, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2636);
    int _2650 = _2616 + _2638;
    float _2652 = _1490 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2654 = fma(_2610, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2656 = precise::clamp(_2654, 0.0, 1.0);
    float _2658 = fma(_1474, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2624);
    int _2660 = _2650 >> 2;
    float _2662 = _1490 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2664 = _1490 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2666 = uint(_2642) >= uint(_1148);
    float _2668 = fma(_1476, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2652);
    int _2670 = _2660 << 4;
    int _2672 = _2670 + 368;
    float _2674 = fma(_1476, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2662);
    float _2676 = fma(_1476, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2664);
    float _2678 = fma(_1478, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2596);
    uint _2680 = uint(int(uint(_2672) >> uint(2)));
    uint _2682 = uint(int(uint(int(_2680)) >> uint(2)));
    int _2684 = int(_2680) & 3;
    float _2686 = (*spvDescriptorSet0.vp_c9)._m0[int(_2682)][_2684];
    int _2688 = int(_2680) + 1;
    uint _2690 = uint(int(uint(_2688) >> uint(2)));
    int _2692 = _2688 & 3;
    float _2694 = (*spvDescriptorSet0.vp_c9)._m0[int(_2690)][_2692];
    float _2696 = _2648 * _2594;
    float _2698 = _2658 * _2594;
    int _2700 = _2616 & 3;
    bool _2702 = _2700 != 0;
    float _2704 = fma(_2656, -2.0, 3.0);
    float _2706 = _2656 * _2656;
    int _2708 = _2632 ? 0 : 1;
    float _2710 = fma(_1478, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2612);
    int _2712 = _2672 + 8;
    uint _2714 = uint(int(uint(_2712) >> uint(2)));
    uint _2716 = uint(int(uint(int(_2714)) >> uint(2)));
    int _2718 = int(_2714) & 3;
    float _2720 = (*spvDescriptorSet0.vp_c9)._m0[int(_2716)][_2718];
    int _2722 = int(_2714) + 1;
    uint _2724 = uint(int(uint(_2722) >> uint(2)));
    int _2726 = _2722 & 3;
    float _2728 = (*spvDescriptorSet0.vp_c9)._m0[int(_2724)][_2726];
    bool _2730 = uint(_2700) > 1u;
    float _2732 = fma(_1500, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2668);
    bool _2734 = _2700 != 3;
    float _2736 = fma(_1474, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2646);
    bool _2738 = !_2666;
    int _2740 = _2738 ? 0 : (-1);
    float _2742 = fma(_1500, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2674);
    bool _2744 = uint(_2700) >= 2u;
    float _2746 = _2736 * _2594;
    int _2748 = ~_2708;
    int _2750 = _2748 + 1;
    int _2752 = _2750 + 1;
    float _2754 = fma(_1500, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2676);
    int _2756 = ~_2620;
    int _2758 = _2756 + _2740;
    int _2760 = _2758 + 1;
    float _2762 = fma(_2742, _2590, _2698);
    bool _2764 = !_2702;
    int _2766 = _2764 ? 0 : 1;
    float _2768 = fma(_1492, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2678);
    int _2770 = _2752;
    if (!_2730)
    {
        int _2772 = ~_2708;
        int _2774 = _2772 + 1;
        _2770 = _2774;
    }
    int _2776 = _2770;
    float _2778 = fma(_2732, _2590, _2696);
    int _2780 = _2744 ? 0 : 1;
    float _2782 = _2706 * _2704;
    bool _2784 = _2700 != 3;
    float _2786 = fma(_2754, _2590, _2746);
    int _2788 = abs(_2776);
    float _2790 = fma(_2768, _2608, _2762);
    int _2792 = abs(_2766);
    float _2794 = in.m_83.x;
    int _2796 = ~_2780;
    int _2798 = _2796 + 1;
    int _2800 = _2798 + 1;
    float _2802 = fma(_1478, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2618);
    bool _2804 = !_2784;
    int _2806 = _2804 ? 0 : (-1);
    int _2808 = _1148 * _2760;
    int _2810 = _2808 + _2398;
    int _2812 = _2800;
    if (_2734)
    {
        int _2814 = ~_2780;
        int _2816 = _2814 + 1;
        _2812 = _2816;
    }
    int _2818 = _2812;
    float _2820 = fma(_1492, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2710);
    int _2822 = ~_2788;
    int _2824 = _2822 + 1;
    int _2826 = _2824 + 1;
    float _2828 = fma(_1492, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2802);
    bool _2830 = !_2562;
    int _2832 = _2830 ? 0 : 1;
    float _2834 = fma(_2820, _2608, _2778);
    int _2836 = abs(_2806);
    float _2838 = _2112 * 0.5;
    int _2840 = abs(_2818);
    float _2842 = fma(_2828, _2608, _2786);
    int _2844 = ~_2792;
    int _2846 = _2844 + 1;
    int _2848 = _2846 + 1;
    int _2850 = _2826 * as_type<int>(_2694);
    int _2852 = abs(_2832);
    float _2854 = -_2182;
    float _2856 = _2854 + 1.0;
    int _2858 = _2848 * as_type<int>(_2686);
    int _2860 = _2858 + _2850;
    int _2862 = ~_2840;
    int _2864 = _2862 + 1;
    int _2866 = _2864 + 1;
    float _2868 = _2274 * _2194;
    int _2870 = ~_2836;
    int _2872 = _2870 + 1;
    int _2874 = _2872 + 1;
    float _2876 = -_2274;
    float _2878 = _2876 + 1.0;
    int _2880 = _2866 * as_type<int>(_2720);
    int _2882 = _2880 + _2860;
    bool _2884 = _1746 <= 8000.0;
    bool _2886 = isnan(_1746);
    bool _2888 = _2884 || _2886;
    bool _2890 = isnan(8000.0);
    bool _2892 = _2888 || _2890;
    float _2894 = float(_2892);
    float _2896 = _2084 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2898 = ~_2852;
    int _2900 = _2898 + 1;
    int _2902 = _2900 + 1;
    int _2904 = _2874 * as_type<int>(_2728);
    int _2906 = _2904 + _2882;
    float _2908 = -_2782;
    float _2910 = _2908 + 1.0;
    bool _2912 = !_2223;
    int _2914 = _2912 ? _2810 : (-1);
    float _2916 = fma(_2082, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2896);
    int _2918 = _2906 * _2902;
    float _2920 = fma(_2910, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2782);
    float _2922 = _2215 * _2868;
    float _2924 = fma(_2078, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2916);
    int _2926 = _2914 * _2852;
    int _2928 = _2926 + _2918;
    float _2930 = _2894 * _2920;
    float _2932 = fma(_2164, -0.5, _2838);
    float _2934 = fma(_1900, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2924);
    float _2936 = _2930 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2938 = _2205 * _2878;
    float _2940 = fma(_2205, _2922, _2203);
    out.m_85.x = _2834;
    out.m_85.y = _2790;
    out.m_85.z = _2842;
    float _2942 = _2856 * _2936;
    float _2944 = precise::clamp(_2942, 0.0, 1.0);
    bool _2946 = _1904 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2948 = isnan(_1904);
    bool _2950 = _2946 || _2948;
    bool _2952 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2954 = _2950 || _2952;
    float _2956 = _2934 + _2112;
    out.gl_Position.x = _2160;
    out.gl_Position.y = _2164;
    out.gl_Position.z = _2934;
    out.gl_Position.w = _2112;
    float _2958 = -_2944;
    float _2960 = fma(_2958, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2962 = _2205 * _2868;
    float _2964 = _2160 + _2112;
    float _2966 = _2960 * _2794;
    float _2968 = fma(_2211, _2962, _2199);
    float _2970 = fma(_2213, _2962, _2201);
    float _2972 = _2956 * 0.5;
    float _2974 = _2966 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2976 = _2964 * 0.5;
    float _2978 = float(_2928);
    out.m_87.x = _2968;
    out.m_87.y = _2970;
    out.m_87.z = _2940;
    out.m_87.w = _2938;
    float _2980 = _1874 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2982 = _2966;
    float _2984 = _2978;
    float _2986 = _2112;
    float _2988 = _2972;
    float _2990 = _2932;
    float _2992 = _2976;
    if (!_2954)
    {
        _2982 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2994 = _2982;
    out.m_89.x = _2974;
    out.m_91.x = _2976;
    out.m_91.y = _2932;
    out.m_91.z = _2972;
    out.m_91.w = _2112;
    out.m_93.x = _2978;
    float _2996 = _2994;
    float _2998 = _2994;
    if (!_2954)
    {
        _2984 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3000 = _2984;
    float _3002 = _3000;
    float _3004 = _3000;
    if (!_2954)
    {
        _2986 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3006 = _2986;
    float _3008 = _3006;
    float _3010 = _3006;
    if (!_2954)
    {
        _2988 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3012 = _2988;
    float _3014 = _3012;
    float _3016 = _3012;
    if (!_2954)
    {
        _2990 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3018 = _2990;
    float _3020 = _3018;
    float _3022 = _3018;
    if (!_2954)
    {
        _2992 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3024 = _2992;
    bool _3026 = !_2954;
    float _3028 = _3024;
    float _3030 = _3024;
    if (!_3026)
    {
        bool _3032 = _1904 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3034 = isnan(_1904);
        bool _3036 = _3032 || _3034;
        bool _3038 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3040 = _3036 || _3038;
        if (!_3040)
        {
            float _3042 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3044 = _1904 + _3042;
            float _3046 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3048 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3046;
            float _3050 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3052 = _3050 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3054 = 1.0 / _3048;
            float _3056 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3058 = _3056 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3060 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3062 = _3060 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3064 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3066 = _3064 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3068 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3070 = _3068 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3072 = _3044 * _3054;
            float _3074 = precise::clamp(_3072, 0.0, 1.0);
            float _3076 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3078 = _3076 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3080 = fma(_3074, _3052, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3082 = fma(_3074, _3078, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3084 = fma(_3074, _3058, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3086 = fma(_3074, _3062, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3088 = fma(_3074, _3066, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3090 = fma(_3074, _3070, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3004 = _3084;
            _3022 = _3088;
            _2998 = _3080;
            _3016 = _3086;
            _3010 = _3082;
            _3030 = _3090;
            _3092 = true;
        }
        else
        {
            bool _3094 = _1904 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3096 = isnan(_1904);
            bool _3098 = _3094 || _3096;
            bool _3100 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3102 = _3098 || _3100;
            if (!_3102)
            {
                _2996 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3104 = _2996;
            _2998 = _3104;
            if (!_3102)
            {
                _3002 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3106 = _3002;
            _3004 = _3106;
            if (!_3102)
            {
                _3008 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3108 = _3008;
            _3010 = _3108;
            if (!_3102)
            {
                _3014 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3110 = _3014;
            _3016 = _3110;
            if (!_3102)
            {
                _3020 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3112 = _3020;
            _3022 = _3112;
            if (!_3102)
            {
                _3028 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3114 = _3028;
            bool _3116 = !_3102;
            _3030 = _3114;
            if (!_3116)
            {
                bool _3118 = _1904 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3120 = isnan(_1904);
                bool _3122 = _3118 || _3120;
                bool _3124 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3126 = _3122 || _3124;
                if (!_3126)
                {
                    float _3128 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3130 = _1904 + _3128;
                    float _3132 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3134 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3132;
                    float _3136 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3138 = _3136 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3140 = 1.0 / _3134;
                    float _3142 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3144 = _3142 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3146 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3148 = _3146 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3150 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3152 = _3150 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3154 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3156 = _3154 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3158 = _3130 * _3140;
                    float _3160 = precise::clamp(_3158, 0.0, 1.0);
                    float _3162 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3164 = _3162 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3166 = fma(_3160, _3138, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3168 = fma(_3160, _3164, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3170 = fma(_3160, _3144, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3172 = fma(_3160, _3148, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3174 = fma(_3160, _3152, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3176 = fma(_3160, _3156, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3004 = _3170;
                    _3022 = _3174;
                    _2998 = _3166;
                    _3016 = _3172;
                    _3010 = _3168;
                    _3030 = _3176;
                    _3092 = true;
                }
                else
                {
                    _3004 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3022 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2998 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3016 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3010 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3030 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3092 = false;
    float _3178 = _3004;
    float _3180 = _3022;
    float _3182 = _2998;
    float _3184 = _3016;
    float _3186 = _3010;
    float _3188 = _3030;
    float _3190 = fma(_2790, -0.5, 0.5);
    float _3192 = precise::clamp(_3190, 0.0, 1.0);
    float _3194 = -_3178;
    float _3196 = _3194 + _3180;
    float _3198 = _2980 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3200 = -_3182;
    float _3202 = _3200 + _3184;
    float _3204 = fma(_3192, _3196, _3178);
    out.m_95.x = 0.0;
    float _3206 = -_3186;
    float _3208 = _3206 + _3188;
    float _3210 = fma(_3192, _3202, _3182);
    float _3212 = _3204 * 0.586610972881317138671875;
    out.m_53.x = _3198;
    bool _3214 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3216 = fma(_3192, _3208, _3186);
    float _3218 = fma(_3210, 0.298911988735198974609375, _3212);
    bool _3220 = _1874 > 0.0;
    bool _3222 = isnan(_1874);
    bool _3224 = _3220 || _3222;
    bool _3226 = isnan(0.0);
    bool _3228 = _3224 || _3226;
    float _3230 = fma(_3216, 0.114477999508380889892578125, _3218);
    float _3232 = -_3230;
    float _3234 = _3210 + _3232;
    float _3236 = -_3230;
    float _3238 = _3204 + _3236;
    float _3240 = -_3230;
    float _3242 = _3216 + _3240;
    float _3244 = fma(_3234, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3230);
    float _3246 = fma(_3238, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3230);
    float _3248 = fma(_3242, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3230);
    bool _3250 = !_3214;
    if (!_3250)
    {
        float _3252 = -_1808;
        float _3254 = _3252 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3256 = -_1810;
        float _3258 = _3256 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3260 = -_1812;
        float _3262 = _3260 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3264 = _3254 * _3254;
        float _3266 = fma(_3258, _3258, _3264);
        float _3268 = fma(_3262, _3262, _3266);
        float _3270 = sqrt(_3268);
        float _3272 = rsqrt(_3268);
        float _3274 = -_3270;
        float _3276 = _3274 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3278 = _3276 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3280 = precise::clamp(_3278, 0.0, 1.0);
        float _3282 = _3258 * _3272;
        float _3284 = _3254 * _3272;
        float _3286 = abs(_3280);
        float _3288 = log2(_3286);
        float _3290 = _3262 * _3272;
        float _3292 = _3282 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3294 = _2790 * _3284;
        float _3296 = -_3284;
        float _3298 = -_3292;
        float _3300 = fma(_3296, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3298);
        float _3302 = fma(_2834, _3282, _3294);
        float _3304 = -_3290;
        float _3306 = fma(_3304, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3300);
        float _3308 = fma(_2842, _3290, _3302);
        float _3310 = precise::clamp(_3308, 0.0, 1.0);
        float _3312 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3314 = _3306 + _3312;
        float _3316 = _3288 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3318 = _3314 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3320 = precise::clamp(_3318, 0.0, 1.0);
        float _3322 = exp2(_3316);
        float _3324 = _3322 * _3320;
        float _3326 = _3310 * _3324;
        float _3328 = _3326 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3330 = _3326 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3332 = _3326 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_95.x = _3328;
        out.m_95.y = _3330;
        out.m_95.z = _3332;
    }
    out.m_97.x = _3244;
    out.m_97.y = _3246;
    out.m_97.z = _3248;
    if (_3228)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_53.x = 0.0;
    float _3334 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3334;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3092 = false;
    bool _550 = false;
    bool _400 = false;
    bool _238 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _111 = in.m_46.w;
    float _113 = in.m_48.w;
    float _115 = trunc(_111);
    int _118 = int(_115);
    float _120 = -_113;
    float _122 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _122;
    bool _126 = _118 >= 1;
    float _128 = 0.0;
    float _130 = _113;
    float _132 = _122;
    if (!_126)
    {
        _128 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _134 = _128;
    if (!_126)
    {
        out.m_53.x = 0.0;
    }
    int _136 = 0;
    if (!_126)
    {
        float _138 = _134 * 5.0;
        _136 = as_type<int>(_138);
    }
    int _140 = _136;
    int _142 = _140;
    if (!_126)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3402 = as_type<float>(_140);
        out.gl_Position.z = _3402;
    }
    if (!_126)
    {
        return out;
    }
    bool _144 = _113 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _146 = isnan(_113);
    bool _148 = _144 || _146;
    bool _150 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _152 = _148 || _150;
    float _154 = float(_118);
    bool _156 = _122 >= _154;
    bool _158 = !_152;
    bool _160 = _156 || _158;
    if (_160)
    {
        _130 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _162 = _130;
    if (_160)
    {
        out.m_53.x = 0.0;
    }
    if (_160)
    {
        float _164 = _162 * 5.0;
        _142 = as_type<int>(_164);
    }
    int _166 = _142;
    if (_160)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3457 = as_type<float>(_166);
        out.gl_Position.z = _3457;
    }
    if (_160)
    {
        return out;
    }
    float _168 = in.m_55.x;
    float _170 = in.m_55.y;
    float _172 = in.m_55.z;
    float _174 = 1.0 / _154;
    bool _176 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _178 = in.m_57.x;
    float _180 = in.m_57.y;
    float _182 = in.m_57.z;
    float _184 = in.m_59.x;
    float _186 = in.m_59.y;
    float _188 = in.m_59.z;
    float _190 = in.m_61.x;
    float _192 = in.m_61.y;
    float _194 = in.m_61.z;
    float _196 = _122 * _174;
    float _198 = _170 * _180;
    float _200 = _170 * _186;
    float _202 = fma(_168, _178, _198);
    float _204 = _170 * _192;
    float _206 = fma(_168, _184, _200);
    float _208 = fma(_172, _182, _202);
    float _210 = fma(_168, _190, _204);
    float _212 = fma(_172, _188, _206);
    float _214 = fma(_172, _194, _210);
    bool _216 = !_176;
    float _218 = _196;
    float _236;
    if (!_216)
    {
        float _220 = in.m_63.x;
        float _222 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _224 = _220 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _226 = fma(_224, (*spvDescriptorSet0.vp_c9)._m0[12].x, _122);
        float _228 = _226 * _222;
        float _230 = floor(_228);
        float _232 = -_230;
        float _234 = _228 + _232;
        _236 = _234;
        _238 = true;
    }
    else
    {
        _236 = _196;
    }
    _238 = false;
    float _240 = _236;
    float _242 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _244 = _240 + _242;
    bool _246 = _240 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _248 = isnan(_240);
    bool _250 = _246 || _248;
    bool _252 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _254 = _250 || _252;
    float _256 = float(_254);
    float _258 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _260 = _240 + _258;
    bool _262 = _240 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _264 = isnan(_240);
    bool _266 = _262 || _264;
    bool _268 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _270 = _266 || _268;
    float _272 = float(_270);
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _276 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _274;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _280 = _278 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _282 = _240 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _284 = isnan(_240);
    bool _286 = _282 || _284;
    bool _288 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _290 = _286 || _288;
    float _292 = float(_290);
    float _294 = 1.0 / _276;
    float _296 = -_292;
    float _298 = _296 + 1.0;
    bool _300 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _302 = _272 * _298;
    float _304 = -_272;
    float _306 = _304 + 1.0;
    float _308 = 1.0 / _280;
    float _310 = _244 * _294;
    float _312 = -_256;
    float _314 = _312 + 1.0;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _318 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _316;
    float _320 = _292 * _314;
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _324 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _322;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _328 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _326;
    float _330 = fma(_318, _310, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _332 = _260 * _308;
    float _334 = fma(_324, _310, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _336 = fma(_328, _310, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _338 = _330 * _302;
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _342 = _340 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _344 = _334 * _302;
    float _346 = _336 * _302;
    float _348 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _350 = _348 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _354 = _352 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _356 = fma(_306, (*spvDescriptorSet0.vp_c9)._m0[143].x, _344);
    float _358 = fma(_306, (*spvDescriptorSet0.vp_c9)._m0[143].y, _338);
    float _360 = fma(_350, _332, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _362 = fma(_342, _332, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _364 = fma(_354, _332, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _366 = fma(_306, (*spvDescriptorSet0.vp_c9)._m0[143].z, _346);
    float _368 = fma(_360, _320, _356);
    float _370 = fma(_362, _320, _358);
    float _372 = fma(_364, _320, _366);
    float _374 = fma(_256, (*spvDescriptorSet0.vp_c9)._m0[145].x, _368);
    float _376 = fma(_256, (*spvDescriptorSet0.vp_c9)._m0[145].y, _370);
    float _378 = fma(_256, (*spvDescriptorSet0.vp_c9)._m0[145].z, _372);
    bool _380 = !_300;
    float _398;
    if (!_380)
    {
        float _382 = in.m_63.x;
        float _384 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _386 = _382 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _388 = fma(_386, (*spvDescriptorSet0.vp_c9)._m0[11].y, _122);
        float _390 = _388 * _384;
        float _392 = floor(_390);
        float _394 = -_392;
        float _396 = _390 + _394;
        _398 = _396;
        _400 = true;
    }
    else
    {
        _398 = _196;
    }
    _400 = false;
    float _402 = _398;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _406 = _402 + _404;
    float _408 = in.m_65.x;
    float _410 = in.m_65.y;
    float _412 = in.m_65.z;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _416 = _414 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _418 = _402 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _420 = isnan(_402);
    bool _422 = _418 || _420;
    bool _424 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _426 = _422 || _424;
    float _428 = float(_426);
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _432 = _430 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _434 = _402 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _436 = isnan(_402);
    bool _438 = _434 || _436;
    bool _440 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _442 = _438 || _440;
    float _444 = float(_442);
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _448 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _446;
    bool _450 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _452 = 1.0 / _416;
    float _454 = -_428;
    float _456 = _454 + 1.0;
    float _458 = _444 * _456;
    float _460 = -_444;
    float _462 = _460 + 1.0;
    float _464 = 1.0 / _432;
    float _466 = _448 * _452;
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _470 = _468 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _472 = _378 * _412;
    float _474 = _376 * _410;
    float _476 = fma(_466, _406, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _478 = _402 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _480 = isnan(_402);
    bool _482 = _478 || _480;
    bool _484 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _486 = _482 || _484;
    float _488 = float(_486);
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _492 = _402 + _490;
    float _494 = _374 * _408;
    float _496 = _476 * _458;
    float _498 = _470 * _464;
    float _500 = -_488;
    float _502 = _500 + 1.0;
    float _504 = fma(_462, (*spvDescriptorSet0.vp_c9)._m0[115].x, _496);
    float _506 = fma(_498, _492, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _508 = _428 * _502;
    float _510 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _512 = fma(_506, _508, _504);
    float _514 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _516 = _510 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _518 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _520 = fma(_488, (*spvDescriptorSet0.vp_c9)._m0[117].x, _512);
    float _522 = _514 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _524 = _518 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _526 = _520 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _528 = !_450;
    float _530 = _526;
    float _548;
    if (!_528)
    {
        float _532 = in.m_63.x;
        float _534 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _536 = _532 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _538 = fma(_536, (*spvDescriptorSet0.vp_c9)._m0[11].w, _122);
        float _540 = _538 * _534;
        float _542 = floor(_540);
        float _544 = -_542;
        float _546 = _540 + _544;
        _548 = _546;
        _550 = true;
    }
    else
    {
        _548 = _196;
    }
    _550 = false;
    float _552 = _548;
    float _554 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _556 = _552 + _554;
    float _558 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _560 = _558 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _564 = _562 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _566 = _552 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _568 = isnan(_552);
    bool _570 = _566 || _568;
    bool _572 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _574 = _570 || _572;
    float _576 = float(_574);
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _580 = _578 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _582 = _552 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _584 = isnan(_552);
    bool _586 = _582 || _584;
    bool _588 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _590 = _586 || _588;
    float _592 = float(_590);
    float _594 = 1.0 / _560;
    float _596 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _598 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _596;
    float _600 = -_576;
    float _602 = _600 + 1.0;
    bool _604 = _552 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _606 = isnan(_552);
    bool _608 = _604 || _606;
    bool _610 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _612 = _608 || _610;
    float _614 = float(_612);
    bool _616 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _618 = 1.0 / _564;
    float _620 = 1.0 / _580;
    float _622 = _598 * _594;
    float _624 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _626 = _624 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _628 = _592 * _602;
    float _630 = -_592;
    float _632 = _630 + 1.0;
    float _634 = fma(_622, _556, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _638 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _636;
    float _640 = _614 * _632;
    float _642 = _626 * _618;
    float _644 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _646 = _552 + _644;
    bool _648 = _552 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _650 = isnan(_552);
    bool _652 = _648 || _650;
    bool _654 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _656 = _652 || _654;
    float _658 = float(_656);
    float _660 = _634 * _640;
    float _662 = -_614;
    float _664 = _662 + 1.0;
    float _666 = fma(_642, _646, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _668 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _670 = _552 + _668;
    float _672 = _638 * _620;
    float _674 = -_658;
    float _676 = _674 + 1.0;
    float _678 = fma(_664, (*spvDescriptorSet0.vp_c9)._m0[131].x, _660);
    float _680 = fma(_672, _670, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _682 = _576 * _676;
    float _684 = fma(_666, _628, _678);
    float _686 = fma(_680, _682, _684);
    float _688 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _690 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _692 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _694 = fma(_658, (*spvDescriptorSet0.vp_c9)._m0[134].x, _686);
    float _696 = _690 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _698 = _688 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _700 = _692 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _702 = _694 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _704 = !_616;
    if (!_704)
    {
        float _706 = in.m_63.x;
        float _708 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _710 = _706 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _712 = fma(_710, (*spvDescriptorSet0.vp_c9)._m0[14].x, _122);
        float _714 = _712 * _708;
        float _716 = floor(_714);
        float _718 = -_716;
        float _720 = _714 + _718;
        _218 = _720;
    }
    float _722 = _218;
    float _724 = in.m_46.x;
    float _726 = in.m_46.y;
    float _728 = in.m_46.z;
    float _730 = _494 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _732 = in.m_63.x;
    float _734 = in.m_63.y;
    float _736 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _738 = _736 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _740 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _742 = in.m_63.z;
    float _744 = 1.0 / _738;
    float _746 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _748 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _750 = _748 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _752 = _472 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _754 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _756 = _754 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _758 = 1.0 / _750;
    float _760 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _762 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _760;
    float _764 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _766 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _764;
    float _768 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _770 = _768 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _772 = _186 * _726;
    float _774 = _180 * _726;
    float _776 = _192 * _726;
    float _778 = fma(_184, _724, _772);
    float _780 = _732 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _782 = fma(_178, _724, _774);
    float _784 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _786 = _784 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _788 = fma(_190, _724, _776);
    float _790 = -_740;
    float _792 = fma(_780, 2.0, _790);
    float _794 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _796 = _794 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _798 = 1.0 / _786;
    float _800 = _734 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _802 = fma(_182, _728, _782);
    float _804 = fma(_188, _728, _778);
    float _806 = fma(_800, -2.0, _746);
    float _808 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _810 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _808;
    float _812 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _814 = _812 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _816 = 1.0 / _796;
    float _818 = fma(_194, _728, _788);
    float _820 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _822 = _820 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _824 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _826 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _824;
    int _828 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _830 = _828 != 0;
    int _832 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _834 = _832 != 0;
    int _836 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _838 = _836 != 0;
    float _840 = 1.0 / _814;
    float _842 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _844 = _842 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _846 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _848 = _846 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _850 = _822 * _798;
    bool _852 = !_834;
    int _854 = _852 ? 0 : 1;
    float _856 = in.m_61.w;
    float _858 = _848 * _758;
    float _860 = _734 + _732;
    float _862 = 1.0 / _844;
    float _864 = _762 * _816;
    bool _866 = !_830;
    int _868 = _866 ? 0 : 1;
    float _870 = in.m_57.w;
    float _872 = _860 + (-1.0);
    bool _874 = !_838;
    int _876 = _874 ? 0 : 1;
    float _878 = _826 * _744;
    float _880 = 1.0 / _756;
    float _882 = _732 * 2.0;
    float _884 = _770 * _840;
    bool _886 = _722 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _888 = isnan(_722);
    bool _890 = _886 || _888;
    bool _892 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _894 = _890 || _892;
    float _896 = float(_894);
    float _898 = in.m_59.w;
    bool _900 = _722 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _902 = isnan(_722);
    bool _904 = _900 || _902;
    bool _906 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _908 = _904 || _906;
    float _910 = float(_908);
    float _912 = _766 * _862;
    float _914 = _742 * 2.0;
    float _916 = floor(_882);
    float _918 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _920 = _818 + _856;
    float _922 = _810 * _880;
    float _924 = floor(_914);
    float _926 = _734 + _742;
    float _928 = _802 + _870;
    float _930 = fma(_732, (*spvDescriptorSet0.vp_c9)._m0[78].z, _918);
    float _932 = fma(_872, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _934 = _742 + _732;
    float _936 = _926 + (-1.0);
    float _938 = _734 * 2.0;
    bool _940 = _916 > 0.0;
    float _942 = _934 + (-1.0);
    bool _944 = _916 >= 0.0;
    bool _946 = isnan(_916);
    bool _948 = _944 || _946;
    bool _950 = isnan(0.0);
    bool _952 = _948 || _950;
    float _954 = fma(_936, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _956 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _958 = _722 + _956;
    float _960 = fma(_942, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _962 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _964 = _962 != 0;
    int _966 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _968 = _966 != 0;
    int _970 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _972 = _970 != 0;
    float _974 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _976 = _722 + _974;
    bool _978 = _924 > 0.0;
    float _980 = fma(_878, _958, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _982 = _924 >= 0.0;
    bool _984 = isnan(_924);
    bool _986 = _982 || _984;
    bool _988 = isnan(0.0);
    bool _990 = _986 || _988;
    float _992 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _994 = log2(_992);
    int _996 = _952 ? 0 : 1;
    float _998 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1000 = _722 + _998;
    int _1002 = _990 ? 0 : 1;
    float _1004 = fma(_858, _976, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    bool _1006 = !_964;
    int _1008 = _1006 ? 0 : 1;
    float _1010 = -_896;
    float _1012 = _1010 + 1.0;
    int _1014 = ~_1002;
    int _1016 = _1014 + 1;
    int _1018 = _1016 + 1;
    float _1020 = floor(_938);
    int _1022 = ~_996;
    int _1024 = _1022 + 1;
    int _1026 = _1024 + 1;
    float _1028 = fma(_922, _1000, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    int _1030 = _1018;
    int _1032 = _1026;
    if (!_978)
    {
        int _1034 = ~_1002;
        int _1036 = _1034 + 1;
        _1030 = _1036;
    }
    int _1038 = _1030;
    float _1040 = _804 + _898;
    if (!_940)
    {
        int _1042 = ~_996;
        int _1044 = _1042 + 1;
        _1032 = _1044;
    }
    int _1046 = _1032;
    bool _1048 = _722 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1050 = isnan(_722);
    bool _1052 = _1048 || _1050;
    bool _1054 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1056 = _1052 || _1054;
    float _1058 = float(_1056);
    float _1060 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1062 = int(_1060);
    int _1064 = abs(_1008);
    float _1066 = _994 * _122;
    float _1068 = float(_1038);
    float _1070 = _1058 * _1012;
    bool _1072 = _722 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1074 = isnan(_722);
    bool _1076 = _1072 || _1074;
    bool _1078 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1080 = _1076 || _1078;
    float _1082 = float(_1080);
    float _1084 = -_1058;
    float _1086 = _1084 + 1.0;
    bool _1088 = _722 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1090 = isnan(_722);
    bool _1092 = _1088 || _1090;
    bool _1094 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1096 = _1092 || _1094;
    float _1098 = float(_1096);
    float _1100 = exp2(_1066);
    float _1102 = float(_1064);
    float _1104 = _1082 * _1086;
    float _1106 = -_1082;
    float _1108 = _1106 + 1.0;
    bool _1110 = _722 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1112 = isnan(_722);
    bool _1114 = _1110 || _1112;
    bool _1116 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1118 = _1114 || _1116;
    float _1120 = float(_1118);
    float _1122 = -_1098;
    float _1124 = _1122 + 1.0;
    bool _1126 = _1020 > 0.0;
    float _1128 = _1102 * _1068;
    bool _1130 = _1020 >= 0.0;
    bool _1132 = isnan(_1020);
    bool _1134 = _1130 || _1132;
    bool _1136 = isnan(0.0);
    bool _1138 = _1134 || _1136;
    float _1140 = _1120 * _1124;
    float _1142 = -_1120;
    float _1144 = _1142 + 1.0;
    float _1146 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1148 = int(_1146);
    float _1150 = float(_1062);
    float _1152 = _1098 * _1108;
    bool _1154 = _722 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1156 = isnan(_722);
    bool _1158 = _1154 || _1156;
    bool _1160 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1162 = _1158 || _1160;
    float _1164 = float(_1162);
    float _1166 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1168 = 1.0 + _1166;
    float _1170 = in.m_67.x;
    float _1172 = in.m_67.y;
    float _1174 = in.m_67.z;
    bool _1176 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1178 = isnan(1.0);
    bool _1180 = _1176 || _1178;
    bool _1182 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1184 = _1180 || _1182;
    float _1186 = 1.0 / _1150;
    float _1188 = _1164 * _1144;
    float _1190 = -_1164;
    float _1192 = _1190 + 1.0;
    float _1194 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1196 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1198 = isnan(0.0);
    bool _1200 = _1196 || _1198;
    bool _1202 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1204 = _1200 || _1202;
    float _1206 = _910 * _1192;
    float _1208 = fma(_734, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1194);
    float _1210 = 1.0 / _1168;
    float _1212 = -_1100;
    float _1214 = _1212 + 1.0;
    float _1216 = -_122;
    float _1218 = fma(_1216, (*spvDescriptorSet0.vp_c9)._m0[76].x, _792);
    float _1220 = float(_1148);
    float _1222 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1208);
    bool _1224 = !_968;
    int _1226 = _1224 ? 0 : 1;
    float _1228 = _980 * _1206;
    float _1230 = _1204 ? _1214 : 0.0;
    float _1232 = _1186 * _122;
    float _1234 = _1220 * _122;
    float _1236 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].z, _930);
    float _1238 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[76].y, _806);
    bool _1240 = !_972;
    int _1242 = _1240 ? 0 : 1;
    int _1244 = abs(_1226);
    if (_1184)
    {
        float _1246 = _1230 * _1210;
        _132 = _1246;
    }
    float _1248 = _132;
    float _1250 = _1128 * (-2.0);
    int _1252 = _1138 ? 0 : 1;
    int _1254 = abs(_1242);
    float _1256 = fma(_932, _1250, _932);
    float _1258 = fma(_1250, _1170, _1170);
    float _1260 = _732 + (-0.5);
    float _1262 = float(_1046);
    float _1264 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1266 = _928 + _1264;
    float _1268 = float(_1244);
    float _1270 = fma(_1260, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1258);
    int _1272 = ~_1252;
    int _1274 = _1272 + 1;
    int _1276 = _1274 + 1;
    float _1278 = -_910;
    float _1280 = _1278 + 1.0;
    int _1282 = _1276;
    if (!_1126)
    {
        int _1284 = ~_1252;
        int _1286 = _1284 + 1;
        _1282 = _1286;
    }
    int _1288 = _1282;
    float _1290 = _1268 * _1262;
    float _1292 = fma(_1256, _1248, _1270);
    float _1294 = float(_1288);
    float _1296 = _1290 * (-2.0);
    float _1298 = float(_1254);
    float _1300 = fma(_1280, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1228);
    float _1302 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1304 = _1040 + _1302;
    float _1306 = fma(_1296, _1172, _1172);
    float _1308 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1310 = _920 + _1308;
    float _1312 = _1298 * _1294;
    float _1314 = _734 + (-0.5);
    float _1316 = _1304 * _1304;
    float _1318 = _1292 * 0.15915493667125701904296875;
    float _1320 = _1312 * (-2.0);
    float _1322 = fma(_1314, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1306);
    float _1324 = fma(_1266, _1266, _1316);
    float _1326 = _742 + (-0.5);
    float _1328 = fma(_1320, _1174, _1174);
    float _1330 = fma(_1004, _1188, _1300);
    float _1332 = fma(_1310, _1310, _1324);
    float _1334 = fma(_954, _1296, _954);
    float _1336 = fma(_1326, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1328);
    float _1338 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1340 = _722 + _1338;
    float _1342 = fma(_1028, _1140, _1330);
    float _1344 = in.m_69.x;
    float _1346 = in.m_69.y;
    float _1348 = in.m_69.z;
    float _1350 = fma(_960, _1320, _960);
    float _1352 = fma(_850, _1340, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1354 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1356 = _722 + _1354;
    float _1358 = fma(_1334, _1248, _1322);
    float _1360 = fma(_1350, _1248, _1336);
    float _1362 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1364 = _722 + _1362;
    bool _1366 = _722 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1368 = isnan(_722);
    bool _1370 = _1366 || _1368;
    bool _1372 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1374 = _1370 || _1372;
    float _1376 = float(_1374);
    float _1378 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1380 = _722 + _1378;
    float _1382 = fma(_864, _1356, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1384 = fma(_1352, _1152, _1342);
    float _1386 = _1358 * 0.15915493667125701904296875;
    float _1388 = _1360 * 0.15915493667125701904296875;
    float _1390 = rsqrt(_1332);
    float _1392 = fma(_884, _1364, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1394 = -_1376;
    float _1396 = _1394 + 1.0;
    float _1398 = fma(_1382, _1104, _1384);
    float _1400 = fma(_912, _1380, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1402 = _896 * _1396;
    float _1404 = fma(_1392, _1070, _1398);
    float _1406 = _1318 * 6.283185482025146484375;
    float _1408 = sin(_1406);
    float _1410 = fma(_1400, _1402, _1404);
    float _1412 = _474 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1414 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1344);
    float _1416 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1346);
    float _1418 = fma(_1376, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1410);
    float _1420 = _1386 * 6.283185482025146484375;
    float _1422 = sin(_1420);
    float _1424 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1348);
    float _1426 = _730 * _1414;
    float _1428 = _1418 * _1390;
    float _1430 = _1412 * _1416;
    float _1432 = -(*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _1434 = _1432 + (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _1436 = _752 * _1424;
    float _1438 = abs((*spvDescriptorSet0.vp_c7)._m0[2].z);
    float _1440 = precise::max((*spvDescriptorSet0.vp_c9)._m0[191].x, _1438);
    float _1442 = _1386 * 6.283185482025146484375;
    float _1444 = cos(_1442);
    float _1446 = abs(_1310);
    float _1448 = _1446 * _1428;
    float _1450 = abs(_1266);
    float _1452 = _1450 * _1428;
    float _1454 = abs(_1304);
    float _1456 = _1454 * _1428;
    float _1458 = _1388 * 6.283185482025146484375;
    float _1460 = cos(_1458);
    float _1462 = _1408 * _1422;
    float _1464 = _1318 * 6.283185482025146484375;
    float _1466 = cos(_1464);
    float _1468 = _1408 * _1444;
    float _1470 = _1388 * 6.283185482025146484375;
    float _1472 = sin(_1470);
    float _1474 = _1408 * _1460;
    float _1476 = _1444 * _1460;
    float _1478 = _1422 * _1460;
    float _1480 = _1466 * _1444;
    float _1482 = _1466 * _1422;
    float _1484 = _1466 * _1460;
    float _1486 = _1474 * _1430;
    float _1488 = precise::min(_1440, (*spvDescriptorSet0.vp_c9)._m0[191].y);
    float _1490 = fma(_1472, _1480, _1462);
    float _1492 = fma(_1472, _1462, _1480);
    float _1494 = _1484 * _1430;
    float _1496 = 1.0 / _1434;
    float _1498 = -_1482;
    float _1500 = fma(_1472, _1468, _1498);
    float _1502 = -_1430;
    float _1504 = _1472 * _1502;
    float _1506 = -_1468;
    float _1508 = fma(_1472, _1482, _1506);
    float _1510 = fma(_1490, _1426, _1494);
    float _1512 = fma(_1500, _1426, _1486);
    float _1514 = fma(_1476, _1426, _1504);
    float _1516 = abs((*spvDescriptorSet0.vp_c7)._m0[2].x);
    float _1518 = precise::max((*spvDescriptorSet0.vp_c9)._m0[191].x, _1516);
    float _1520 = fma(_1508, _1436, _1510);
    float _1522 = -(*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _1524 = _1488 + _1522;
    float _1526 = fma(_1478, _1436, _1514);
    float _1528 = precise::min(_1518, (*spvDescriptorSet0.vp_c9)._m0[191].y);
    float _1530 = _1520 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1532 = fma(_1492, _1436, _1512);
    float _1534 = _1520 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1536 = _1524 * _1496;
    float _1538 = fma(_1526, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1530);
    float _1540 = -(*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _1542 = _1528 + _1540;
    float _1544 = fma(_1448, _1536, 1.0);
    float _1546 = fma(_1526, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1534);
    float _1548 = fma(_1532, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1538);
    float _1550 = _1542 * _1496;
    float _1552 = fma(_1532, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1546);
    float _1554 = _1548 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1556 = fma(_1452, _1550, 0.9900000095367431640625);
    float _1558 = _1552 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1560 = fma(_1554, _1544, _920);
    float _1562 = fma(_1558, _1556, _928);
    float _1564 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1566 = _1560 + _1564;
    float _1568 = (*spvDescriptorSet0.vp_c7)._m0[2].y * 0.25;
    float _1570 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1572 = _1562 + _1570;
    float _1574 = _1566 * _1566;
    float _1576 = abs(_1568);
    float _1578 = precise::max(_1576, (*spvDescriptorSet0.vp_c9)._m0[191].x);
    float _1580 = fma(_1572, _1572, _1574);
    float _1582 = precise::min(_1578, (*spvDescriptorSet0.vp_c9)._m0[191].y);
    float _1584 = sqrt(_1580);
    float _1586 = -(*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _1588 = _1582 + _1586;
    float _1590 = _1520 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1592 = _1588 * _1496;
    float _1594 = fma(_1526, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1590);
    float _1596 = _1040 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1598 = _1040 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1600 = fma(_1456, _1592, 1.0);
    float _1602 = fma(_1532, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1594);
    float _1604 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1596);
    bool _1606 = _1584 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1608 = _1602 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1610 = fma(_920, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1604);
    float _1612 = fma(_1608, _1600, _1040);
    float _1614 = _1610 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1616 = _1608;
    float _1618 = _1600;
    float _1620 = _1560;
    float _1622 = _1598;
    if (!_1606)
    {
        _1616 = _1560;
    }
    float _1624 = _1616;
    float _1626 = _1624;
    if (!_1606)
    {
        _1618 = _1562;
    }
    float _1628 = _1618;
    float _1630 = _1628;
    if (!_1606)
    {
        _1620 = _1612;
    }
    float _1632 = _1620;
    bool _1634 = !_1606;
    float _1636 = _1632;
    if (!_1634)
    {
        float _1638 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1640 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1642 = _1584 + _1640;
        float _1644 = _1612 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1646 = rsqrt(_1580);
        float _1648 = _1642 * _1638;
        float _1650 = _1648 * 0.15915493667125701904296875;
        float _1652 = _1650 * 6.283185482025146484375;
        float _1654 = cos(_1652);
        float _1656 = _1650 * 6.283185482025146484375;
        float _1658 = sin(_1656);
        float _1660 = _1654 + (-1.0);
        float _1662 = _1660 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1664 = fma(_1658, _1644, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1666 = fma(_1612, _1654, _1662);
        float _1668 = _1646 * _1664;
        float _1670 = fma(_1572, _1668, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1672 = fma(_1566, _1668, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1636 = _1666;
        _1630 = _1670;
        _1626 = _1672;
    }
    float _1674 = _1636;
    float _1676 = _1630;
    float _1678 = _1626;
    float _1680 = -_1040;
    float _1682 = _1680 + _1674;
    float _1684 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1598);
    float _1686 = -_928;
    float _1688 = _1686 + _1676;
    float _1690 = 1.0 / _1614;
    float _1692 = _1682 * _1682;
    float _1694 = fma(_920, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1684);
    float _1696 = -_920;
    float _1698 = _1696 + _1678;
    bool _1700 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1702 = isnan(0.5);
    bool _1704 = _1700 || _1702;
    bool _1706 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1708 = _1704 || _1706;
    float _1710 = fma(_1688, _1688, _1692);
    float _1712 = _1694 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1714 = fma(_1698, _1698, _1710);
    float _1716 = _1712 + _1614;
    float _1718 = sqrt(_1714);
    float _1720 = _1716 * _1690;
    float _1722 = _1720 * 0.5;
    float _1724 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1726 = fma(_1722, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1724);
    float _1728 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _1730 = _1722;
    float _1732 = _1674;
    float _1734 = _1676;
    float _1736 = _1698;
    if (_1708)
    {
        _1728 = 1.0;
    }
    float _1738 = _1728;
    float _1740 = 1.0 / _1726;
    bool _1742 = _1718 > 0.0;
    float _1744 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1746 = _1740 * _1744;
    float _1748 = _1718;
    float _1750 = _1738;
    if (!_1742)
    {
        _1730 = _1678;
    }
    float _1752 = _1730;
    bool _1754 = !_1742;
    float _1756 = _1752;
    if (!_1754)
    {
        float _1758 = _212 * _212;
        float _1760 = fma(_208, _208, _1758);
        float _1762 = fma(_214, _214, _1760);
        float _1764 = rsqrt(_1714);
        float _1766 = sqrt(_1762);
        float _1768 = _1688 * _1764;
        float _1770 = _1682 * _1764;
        float _1772 = _1698 * _1764;
        bool _1774 = _1766 > 0.0;
        float _1776 = _1766;
        _1748 = _1764;
        _1622 = _1772;
        if (!_1774)
        {
            _1776 = _1678;
        }
        float _1778 = _1776;
        bool _1780 = !_1774;
        _1756 = _1778;
        if (!_1780)
        {
            float _1782 = rsqrt(_1762);
            float _1784 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1786 = _212 * _1782;
            float _1788 = _208 * _1782;
            float _1790 = _214 * _1782;
            float _1792 = _1770 * _1786;
            float _1794 = fma(_1768, _1788, _1792);
            float _1796 = _1784 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1798 = fma(_1772, _1790, _1794);
            float _1800 = _1798 * _1796;
            float _1802 = fma(_208, _1800, _1676);
            float _1804 = fma(_212, _1800, _1674);
            float _1806 = fma(_214, _1800, _1678);
            _1732 = _1804;
            _1734 = _1802;
            _1756 = _1806;
            _1736 = _1794;
            _1748 = _1792;
        }
    }
    float _1808 = _1732;
    float _1810 = _1734;
    float _1812 = _1756;
    float _1814 = _1736;
    float _1816 = _1748;
    float _1818 = _1622;
    float _1820 = _1814;
    float _1822 = _1818;
    if (!_1708)
    {
        float _1824 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1826 = _1824 * 0.15915493667125701904296875;
        float _1828 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1830 = _1826 * 6.283185482025146484375;
        float _1832 = cos(_1830);
        float _1834 = _1828 * 0.15915493667125701904296875;
        float _1836 = _1826 * 6.283185482025146484375;
        float _1838 = sin(_1836);
        float _1840 = 1.0 / _1832;
        float _1842 = _1834 * 6.283185482025146484375;
        float _1844 = cos(_1842);
        float _1846 = _1838 * _1840;
        float _1848 = _1834 * 6.283185482025146484375;
        float _1850 = sin(_1848);
        float _1852 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1854 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1852;
        float _1856 = _1844 * _1846;
        float _1858 = 1.0 / _1854;
        float _1860 = 1.0 / _1856;
        float _1862 = _1850 * _1860;
        float _1864 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1866 = fma(_1746, _1862, _1864);
        float _1868 = _1866 * _1858;
        float _1870 = precise::clamp(_1868, 0.0, 1.0);
        _1820 = _1826;
        _1750 = _1870;
    }
    float _1872 = _1820;
    float _1874 = _1750;
    float _1876 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1878 = _1808 + _1876;
    float _1880 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1882 = _1810 + _1880;
    float _1884 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1886 = _1812 + _1884;
    float _1888 = _1808 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1890 = _1878 * _1878;
    float _1892 = fma(_1810, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1888);
    float _1894 = fma(_1882, _1882, _1890);
    float _1896 = fma(_1812, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1892);
    float _1898 = fma(_1886, _1886, _1894);
    float _1900 = _1896 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1902 = rsqrt(_1898);
    float _1904 = sqrt(_1898);
    float _1906 = _1902 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1908 = _1882 * _1906;
    float _1910 = _1886 * _1906;
    float _1912 = _1908 * _1908;
    float _1914 = _1910 * _1910;
    float _1916 = _1912 + _1914;
    float _1918 = sqrt(_1916);
    bool _1920 = _1918 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1922 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1924 = _1918 + _1922;
    float _1926 = _1872;
    float _1928 = _1924;
    float _1930 = _1908;
    float _1932 = _1910;
    float _1934 = _1912;
    float _1936 = _1914;
    if (_1920)
    {
        float _1938 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1926 = _1938;
    }
    float _1940 = _1926;
    if (_1920)
    {
        float _1942 = _1924 * _1940;
        _1928 = _1942;
    }
    float _1944 = _1928;
    if (_1920)
    {
        float _1946 = _1944 * 0.15915493667125701904296875;
        _1822 = _1946;
    }
    float _1948 = _1822;
    float _1950 = _1816;
    float _1952 = _1948;
    if (_1920)
    {
        float _1954 = _1948 * 6.283185482025146484375;
        float _1956 = sin(_1954);
        _1950 = _1956;
    }
    float _1958 = _1950;
    float _1960 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1962 = precise::max(0.0, _1960);
    float _1964 = _1940;
    float _1966 = _1962;
    if (_1920)
    {
        float _1968 = _1948 * 6.283185482025146484375;
        float _1970 = cos(_1968);
        _1964 = _1970;
    }
    float _1972 = _1964;
    float _1974 = -_1906;
    float _1976 = -_1962;
    float _1978 = fma(_1878, _1974, _1976);
    float _1980 = _1960;
    if (_1920)
    {
        float _1982 = rsqrt(_1916);
        _1980 = _1982;
    }
    float _1984 = _1980;
    if (_1920)
    {
        float _1986 = _1978 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1966 = _1986;
    }
    float _1988 = _1966;
    float _1990 = fma(_928, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1992 = _1988;
    float _1994 = _1958;
    if (_1920)
    {
        float _1996 = fma(_1958, _1988, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1992 = _1996;
    }
    float _1998 = _1992;
    if (_1920)
    {
        float _2000 = _1972 + (-1.0);
        _1994 = _2000;
    }
    float _2002 = _1994;
    float _2004 = floor(_1990);
    float _2006 = _2002;
    if (_1920)
    {
        float _2008 = _2002 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2006 = _2008;
    }
    float _2010 = _2006;
    float _2012 = _1984;
    if (_1920)
    {
        float _2014 = _1984 * _1998;
        _1952 = _2014;
    }
    float _2016 = _1952;
    if (!_1920)
    {
        _2012 = _1978;
    }
    float _2018 = _2012;
    float _2020 = _2018;
    if (_1920)
    {
        float _2022 = fma(_1978, _1972, _2010);
        _2020 = _2022;
    }
    float _2024 = _2020;
    if (_1920)
    {
        float _2026 = _1908 * _2016;
        _1930 = _2026;
    }
    float _2028 = _1930;
    if (_1920)
    {
        float _2030 = _1910 * _2016;
        _1932 = _2030;
    }
    float _2032 = _1932;
    float _2034 = _1808 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1920)
    {
        float _2036 = _2028 * _2028;
        _1934 = _2036;
    }
    float _2038 = _1934;
    if (_1920)
    {
        float _2040 = _2032 * _2032;
        _1936 = _2040;
    }
    float _2042 = _1936;
    float _2044 = fma(_920, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2046 = fma(_2024, _2024, _2038);
    float _2048 = _1808 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2050 = fma(_1810, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2034);
    float _2052 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2054 = fma(_1904, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2052);
    float _2056 = precise::clamp(_2054, 0.0, 1.0);
    float _2058 = _2046 + _2042;
    float _2060 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2062 = _1808 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2064 = fma(_1810, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2048);
    float _2066 = fma(_1812, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2050);
    float _2068 = -_2056;
    float _2070 = _2068 + 1.0;
    float _2072 = fma(_1810, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2062);
    float _2074 = rsqrt(_2058);
    float _2076 = fma(_1812, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2064);
    float _2078 = _2066 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2080 = fma(_1812, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2072);
    float _2082 = _2076 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2084 = _2080 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2086 = _2078 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2088 = abs(_2070);
    float _2090 = log2(_2088);
    float _2092 = _2084 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2094 = -_2086;
    float _2096 = fma(_2094, _2060, 1.0);
    float _2098 = _2084 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2100 = fma(_2082, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2092);
    float _2102 = _2074 * _2028;
    float _2104 = _2074 * _2032;
    float _2106 = floor(_2044);
    float _2108 = fma(_2078, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2100);
    float _2110 = _2074 * _2024;
    float _2112 = fma(_1900, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2108);
    float _2114 = _2102 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2116 = _2090 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2118 = log2(_2096);
    float _2120 = _2110 + 1.0;
    float _2122 = -_2114;
    float _2124 = fma(_2110, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2122);
    float _2126 = -_2104;
    float _2128 = fma(_2126, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2124);
    float _2130 = -_2004;
    float _2132 = _1990 + _2130;
    float _2134 = 1.0 / _2112;
    float _2136 = _2084 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2138 = fma(_2128, -0.5, 0.5);
    float _2140 = -_2106;
    float _2142 = _2044 + _2140;
    float _2144 = fma(_2128, 0.5, 0.5);
    float _2146 = fma(_2082, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2136);
    float _2148 = fma(_2082, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2098);
    float _2150 = exp2(_2116);
    float _2152 = fma(_2078, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2146);
    float _2154 = fma(_2144, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2156 = fma(_2078, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2148);
    float _2158 = _2118 * 0.693147182464599609375;
    float _2160 = fma(_1900, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2152);
    float _2162 = fma(_2144, _2154, -0.212114393711090087890625);
    float _2164 = fma(_1900, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2156);
    float _2166 = sqrt(_2138);
    float _2168 = _2160 * _2134;
    float _2170 = fma(_2144, _2162, 1.570728778839111328125);
    float _2172 = _2164 * _2134;
    float _2174 = _2158 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2176 = fma(_2168, 0.5, 0.5);
    float _2178 = -_2110;
    float _2180 = fma(_2150, _2120, _2178);
    float2 _6604 = float2(_2132, _2142);
    float _2182 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6604, float2(0.0), isnan(_6604)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6604, float2(0.0), isnan(_6604)), level(0.0)).x;
    float _2184 = fma(_2180, 0.5, 0.5);
    float _2186 = _2166 * 0.636619746685028076171875;
    float _2188 = fma(_2172, -0.5, 0.5);
    float _2190 = -_2170;
    float _2192 = fma(_2186, _2190, 1.0);
    float3 _6627 = float3(_2176, _2188, _2174);
    float _2194 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6627, float3(0.0), isnan(_6627)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6627, float3(0.0), isnan(_6627)), level(0.0)).x;
    float3 _6638 = float3(_2176, _2188, _2174);
    float4 _2197 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6638, float3(0.0), isnan(_6638)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6638, float3(0.0), isnan(_6638)), level(0.0)).xyzw;
    float _2199 = _2197.x;
    float _2201 = _2197.y;
    float _2203 = _2197.z;
    float _2205 = _2197.w;
    float2 _6654 = float2(_2192, _2184);
    float3 _2209 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6654, float2(0.0), isnan(_6654)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6654, float2(0.0), isnan(_6654)), level(0.0)).xyz;
    float _2211 = _2209.x;
    float _2213 = _2209.y;
    float _2215 = _2209.z;
    float _2217 = float(uint(_1148));
    float _2219 = trunc(_1232);
    int _2221 = int(_2219);
    bool _2223 = _1148 == 0;
    float _2225 = _1234 * _174;
    int _2227 = abs(_868);
    out.m_71.x = _516;
    out.m_71.y = _522;
    out.m_71.z = _524;
    out.m_71.w = _526;
    int _2229 = abs(_876);
    float _2231 = _2090 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2233 = 1.0 / _2217;
    int _2235 = ~_1148;
    int _2237 = _2235 + 1;
    out.m_73.x = _696;
    out.m_73.y = _700;
    out.m_73.z = _698;
    out.m_73.w = _702;
    int _2239 = ~_1148;
    int _2241 = _2239 + 1;
    float _2243 = float(uint(_2221));
    float _2245 = trunc(_2225);
    int _2247 = int(_2245);
    int _2249 = ~_1148;
    int _2251 = _2249 + 1;
    int _2253 = as_type<int>(_2233) + (-2);
    float _2255 = exp2(_2231);
    int _2257 = ~_1148;
    int _2259 = _2257 + 1;
    float _2261 = as_type<float>(_2253) * _2243;
    float _2263 = trunc(_2261);
    float _2265 = precise::max(_2263, 0.0);
    uint _2268 = uint(_2265);
    float _2270 = -_2255;
    float _2272 = _2270 + 1.0;
    float _2274 = _2272 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _2276 = _2237 * int(_2268);
    int _2278 = _2276 + _2221;
    float _2280 = float(uint(_2278));
    float _2282 = as_type<float>(_2253) * _2280;
    int _2284 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2286 = _2284 != 0;
    float _2288 = trunc(_2282);
    float _2290 = precise::max(_2288, 0.0);
    uint _2292 = uint(_2290);
    bool _2294 = !_2286;
    float _2296 = _2294 ? 7.345489978790283203125 : 1.0;
    float _2298 = _2296 * _732;
    float _2300 = floor(_2298);
    int _2302 = int(_2268) + int(_2292);
    float _2304 = float(_2221);
    int _2306 = _2241 * _2302;
    int _2308 = _2306 + _2221;
    bool _2310 = _2304 >= _1220;
    bool _2312 = isnan(_2304);
    bool _2314 = _2310 || _2312;
    bool _2316 = isnan(_1220);
    bool _2318 = _2314 || _2316;
    float _2320 = float(_2318);
    int _2322 = _1148 + (-1);
    bool _2324 = uint(_2308) >= uint(_1148);
    float _2326 = -_2300;
    float _2328 = _2298 + _2326;
    float _2330 = trunc(_2320);
    int _2332 = int(_2330);
    bool _2334 = !_2324;
    int _2336 = _2334 ? 0 : (-1);
    float _2338 = _2328 * _1220;
    int _2340 = ~_2302;
    int _2342 = _2340 + _2336;
    int _2344 = _2342 + 1;
    int _2346 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2348 = _2346 != 0;
    float _2350 = trunc(_2338);
    int _2352 = int(_2350);
    int _2354 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2356 = _2354 != 0;
    int _2358 = _1148 * _2344;
    int _2360 = _2358 + _2221;
    bool _2362 = !_2348;
    int _2364 = _2362 ? 0 : 1;
    int _2366 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2368 = _2366 != 0;
    int _2370 = ~_2332;
    int _2372 = _2370 + 1;
    int _2374 = _2372 + 1;
    bool _2376 = !_2223;
    int _2378 = _2376 ? _2360 : (-1);
    int _2380 = abs(_854);
    int _2382 = abs(_2364);
    int _2384 = _2378 * _2374;
    float _2386 = in.m_75.y;
    int _2388 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2390 = _2388 != 0;
    int _2392 = _2332 * _2322;
    int _2394 = _2392 + _2384;
    int _2396 = _2352 * _2382;
    int _2398 = _2396 + _2221;
    bool _2400 = !_2368;
    int _2402 = _2400 ? 0 : 1;
    int _2404 = _2394 * _2380;
    float _2406 = in.m_75.x;
    int _2408 = abs(_2402);
    int _2410 = _2247 * _2227;
    int _2412 = _2410 + _2404;
    bool _2414 = _734 > 0.5;
    float _2416 = as_type<float>(_2404);
    float _2418 = _2386;
    if (_2356)
    {
        float _2420 = in.m_63.x;
        _2416 = _2420;
    }
    float _2422 = _2416;
    int _2424 = ~_1148;
    int _2426 = _2424 + 1;
    int _2428 = _2398 * _2229;
    int _2430 = _2428 + _2412;
    int _2432 = _2352 * _2408;
    int _2434 = _2432 + _2430;
    int _2436 = ~_1148;
    int _2438 = _2436 + 1;
    float _2440 = float(uint(_2434));
    float _2442 = as_type<float>(_2253) * _2440;
    float _2444 = trunc(_2442);
    float _2446 = precise::max(_2444, 0.0);
    uint _2448 = uint(_2446);
    float _2450 = _2406;
    if (_2356)
    {
        _530 = _2406;
    }
    float _2452 = _530;
    float _2454 = float(uint(_2398));
    int _2456 = _2438 * int(_2448);
    int _2458 = _2456 + _2434;
    float _2460 = float(uint(_2458));
    float _2462 = as_type<float>(_2253) * _2460;
    float _2464 = as_type<float>(_2253) * _2454;
    float _2466 = -_2386;
    float _2468 = _2466 + 1.0;
    float _2470 = trunc(_2462);
    float _2472 = precise::max(_2470, 0.0);
    uint _2474 = uint(_2472);
    float _2476 = _2452;
    if (_2390)
    {
        float _2478 = _2414 ? _2468 : _2386;
        _2418 = _2478;
    }
    float _2480 = _2418;
    bool _2482 = _2422 > 0.5;
    bool _2484 = _2482 && _2356;
    bool _2486 = _1346 != 0.0;
    bool _2488 = isnan(_1346);
    bool _2490 = _2486 || _2488;
    bool _2492 = isnan(0.0);
    bool _2494 = _2490 || _2492;
    float _2496 = fma(_2480, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _2498 = trunc(_2464);
    float _2500 = precise::max(_2498, 0.0);
    uint _2502 = uint(_2500);
    bool _2504 = _1344 == 0.0;
    bool _2506 = !_2494;
    bool _2508 = _2504 && _2506;
    float _2510 = -_1238;
    float _2512 = fma(_1222, _2496, _2510);
    bool _2514 = _1348 == 0.0;
    bool _2516 = _2514 && _2508;
    int _2518 = int(_2448) + int(_2474);
    if (_2484)
    {
        float _2520 = -_2452;
        float _2522 = _2520 + 1.0;
        _2476 = _2522;
    }
    float _2524 = _2476;
    float _2526 = in.m_77.x;
    float _2528 = in.m_77.y;
    float _2530 = in.m_77.z;
    int _2532 = _2251 * _2518;
    int _2534 = _2532 + _2434;
    if (_2356)
    {
        _2450 = _2524;
    }
    float _2536 = _2450;
    int _2538 = _2426 * int(_2502);
    int _2540 = _2538 + _2398;
    out.m_79.x = 1.0;
    out.m_79.y = 1.0;
    out.m_79.z = 1.0;
    bool _2542 = uint(_2534) >= uint(_1148);
    float _2544 = fma(_2536, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _2546 = float(uint(_2540));
    float _2548 = abs(_1746);
    float _2550 = log2(_2548);
    bool _2552 = !_2542;
    int _2554 = _2552 ? 0 : (-1);
    float _2556 = fma(_1236, _2544, _1218);
    float _2558 = as_type<float>(_2253) * _2546;
    int _2560 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2562 = _2560 != 0;
    int _2564 = ~_2518;
    int _2566 = _2564 + _2554;
    int _2568 = _2566 + 1;
    float _2570 = _2512 + 0.5;
    float _2572 = trunc(_2558);
    float _2574 = precise::max(_2572, 0.0);
    uint _2576 = uint(_2574);
    float _2578 = _2556 + 0.5;
    float _2580 = _1484 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2582 = _2526;
    float _2584 = _2528;
    float _2586 = _2530;
    if (!_2516)
    {
        float _2588 = fma(_1344, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2526);
        _2582 = _2588;
    }
    float _2590 = _2582;
    if (!_2516)
    {
        float _2592 = fma(_1346, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2528);
        _2584 = _2592;
    }
    float _2594 = _2584;
    out.m_81.x = _2578;
    out.m_81.y = _2570;
    float _2596 = _1508 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2598 = _2550 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _2600 = _1148 * _2568;
    int _2602 = _2600 + _2434;
    float _2604 = _1484 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    if (!_2516)
    {
        float _2606 = fma(_1348, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2530);
        _2586 = _2606;
    }
    float _2608 = _2586;
    float _2610 = exp2(_2598);
    float _2612 = _1508 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2614 = !_2223;
    int _2616 = _2614 ? _2602 : (-1);
    float _2618 = _1508 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2620 = int(_2502) + int(_2576);
    float _2622 = -_1472;
    float _2624 = fma(_2622, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2604);
    int _2626 = _2616 >> 31;
    float _2628 = _1484 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2630 = _2616 & 3;
    bool _2632 = _2630 != 0;
    float _2634 = -_1472;
    float _2636 = fma(_2634, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2580);
    int _2638 = _2626 & 3;
    int _2640 = _2259 * _2620;
    int _2642 = _2640 + _2398;
    float _2644 = -_1472;
    float _2646 = fma(_2644, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2628);
    float _2648 = fma(_1474, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2636);
    int _2650 = _2616 + _2638;
    float _2652 = _1490 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2654 = fma(_2610, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2656 = precise::clamp(_2654, 0.0, 1.0);
    float _2658 = fma(_1474, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2624);
    int _2660 = _2650 >> 2;
    float _2662 = _1490 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2664 = _1490 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2666 = uint(_2642) >= uint(_1148);
    float _2668 = fma(_1476, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2652);
    int _2670 = _2660 << 4;
    int _2672 = _2670 + 368;
    float _2674 = fma(_1476, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2662);
    float _2676 = fma(_1476, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2664);
    float _2678 = fma(_1478, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2596);
    uint _2680 = uint(int(uint(_2672) >> uint(2)));
    uint _2682 = uint(int(uint(int(_2680)) >> uint(2)));
    int _2684 = int(_2680) & 3;
    float _2686 = (*spvDescriptorSet0.vp_c9)._m0[int(_2682)][_2684];
    int _2688 = int(_2680) + 1;
    uint _2690 = uint(int(uint(_2688) >> uint(2)));
    int _2692 = _2688 & 3;
    float _2694 = (*spvDescriptorSet0.vp_c9)._m0[int(_2690)][_2692];
    float _2696 = _2648 * _2594;
    float _2698 = _2658 * _2594;
    int _2700 = _2616 & 3;
    bool _2702 = _2700 != 0;
    float _2704 = fma(_2656, -2.0, 3.0);
    float _2706 = _2656 * _2656;
    int _2708 = _2632 ? 0 : 1;
    float _2710 = fma(_1478, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2612);
    int _2712 = _2672 + 8;
    uint _2714 = uint(int(uint(_2712) >> uint(2)));
    uint _2716 = uint(int(uint(int(_2714)) >> uint(2)));
    int _2718 = int(_2714) & 3;
    float _2720 = (*spvDescriptorSet0.vp_c9)._m0[int(_2716)][_2718];
    int _2722 = int(_2714) + 1;
    uint _2724 = uint(int(uint(_2722) >> uint(2)));
    int _2726 = _2722 & 3;
    float _2728 = (*spvDescriptorSet0.vp_c9)._m0[int(_2724)][_2726];
    bool _2730 = uint(_2700) > 1u;
    float _2732 = fma(_1500, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2668);
    bool _2734 = _2700 != 3;
    float _2736 = fma(_1474, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2646);
    bool _2738 = !_2666;
    int _2740 = _2738 ? 0 : (-1);
    float _2742 = fma(_1500, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2674);
    bool _2744 = uint(_2700) >= 2u;
    float _2746 = _2736 * _2594;
    int _2748 = ~_2708;
    int _2750 = _2748 + 1;
    int _2752 = _2750 + 1;
    float _2754 = fma(_1500, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2676);
    int _2756 = ~_2620;
    int _2758 = _2756 + _2740;
    int _2760 = _2758 + 1;
    float _2762 = fma(_2742, _2590, _2698);
    bool _2764 = !_2702;
    int _2766 = _2764 ? 0 : 1;
    float _2768 = fma(_1492, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2678);
    int _2770 = _2752;
    if (!_2730)
    {
        int _2772 = ~_2708;
        int _2774 = _2772 + 1;
        _2770 = _2774;
    }
    int _2776 = _2770;
    float _2778 = fma(_2732, _2590, _2696);
    int _2780 = _2744 ? 0 : 1;
    float _2782 = _2706 * _2704;
    bool _2784 = _2700 != 3;
    float _2786 = fma(_2754, _2590, _2746);
    int _2788 = abs(_2776);
    float _2790 = fma(_2768, _2608, _2762);
    int _2792 = abs(_2766);
    float _2794 = in.m_83.x;
    int _2796 = ~_2780;
    int _2798 = _2796 + 1;
    int _2800 = _2798 + 1;
    float _2802 = fma(_1478, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2618);
    bool _2804 = !_2784;
    int _2806 = _2804 ? 0 : (-1);
    int _2808 = _1148 * _2760;
    int _2810 = _2808 + _2398;
    int _2812 = _2800;
    if (_2734)
    {
        int _2814 = ~_2780;
        int _2816 = _2814 + 1;
        _2812 = _2816;
    }
    int _2818 = _2812;
    float _2820 = fma(_1492, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2710);
    int _2822 = ~_2788;
    int _2824 = _2822 + 1;
    int _2826 = _2824 + 1;
    float _2828 = fma(_1492, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2802);
    bool _2830 = !_2562;
    int _2832 = _2830 ? 0 : 1;
    float _2834 = fma(_2820, _2608, _2778);
    int _2836 = abs(_2806);
    float _2838 = _2112 * 0.5;
    int _2840 = abs(_2818);
    float _2842 = fma(_2828, _2608, _2786);
    int _2844 = ~_2792;
    int _2846 = _2844 + 1;
    int _2848 = _2846 + 1;
    int _2850 = _2826 * as_type<int>(_2694);
    int _2852 = abs(_2832);
    float _2854 = -_2182;
    float _2856 = _2854 + 1.0;
    int _2858 = _2848 * as_type<int>(_2686);
    int _2860 = _2858 + _2850;
    int _2862 = ~_2840;
    int _2864 = _2862 + 1;
    int _2866 = _2864 + 1;
    float _2868 = _2274 * _2194;
    int _2870 = ~_2836;
    int _2872 = _2870 + 1;
    int _2874 = _2872 + 1;
    float _2876 = -_2274;
    float _2878 = _2876 + 1.0;
    int _2880 = _2866 * as_type<int>(_2720);
    int _2882 = _2880 + _2860;
    bool _2884 = _1746 <= 8000.0;
    bool _2886 = isnan(_1746);
    bool _2888 = _2884 || _2886;
    bool _2890 = isnan(8000.0);
    bool _2892 = _2888 || _2890;
    float _2894 = float(_2892);
    float _2896 = _2084 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2898 = ~_2852;
    int _2900 = _2898 + 1;
    int _2902 = _2900 + 1;
    int _2904 = _2874 * as_type<int>(_2728);
    int _2906 = _2904 + _2882;
    float _2908 = -_2782;
    float _2910 = _2908 + 1.0;
    bool _2912 = !_2223;
    int _2914 = _2912 ? _2810 : (-1);
    float _2916 = fma(_2082, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2896);
    int _2918 = _2906 * _2902;
    float _2920 = fma(_2910, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2782);
    float _2922 = _2215 * _2868;
    float _2924 = fma(_2078, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2916);
    int _2926 = _2914 * _2852;
    int _2928 = _2926 + _2918;
    float _2930 = _2894 * _2920;
    float _2932 = fma(_2164, -0.5, _2838);
    float _2934 = fma(_1900, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2924);
    float _2936 = _2930 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2938 = _2205 * _2878;
    float _2940 = fma(_2205, _2922, _2203);
    out.m_85.x = _2834;
    out.m_85.y = _2790;
    out.m_85.z = _2842;
    float _2942 = _2856 * _2936;
    float _2944 = precise::clamp(_2942, 0.0, 1.0);
    bool _2946 = _1904 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2948 = isnan(_1904);
    bool _2950 = _2946 || _2948;
    bool _2952 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2954 = _2950 || _2952;
    float _2956 = _2934 + _2112;
    out.gl_Position.x = _2160;
    out.gl_Position.y = _2164;
    out.gl_Position.z = _2934;
    out.gl_Position.w = _2112;
    float _2958 = -_2944;
    float _2960 = fma(_2958, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2962 = _2205 * _2868;
    float _2964 = _2160 + _2112;
    float _2966 = _2960 * _2794;
    float _2968 = fma(_2211, _2962, _2199);
    float _2970 = fma(_2213, _2962, _2201);
    float _2972 = _2956 * 0.5;
    float _2974 = _2966 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2976 = _2964 * 0.5;
    float _2978 = float(_2928);
    out.m_87.x = _2968;
    out.m_87.y = _2970;
    out.m_87.z = _2940;
    out.m_87.w = _2938;
    float _2980 = _1874 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2982 = _2966;
    float _2984 = _2978;
    float _2986 = _2112;
    float _2988 = _2972;
    float _2990 = _2932;
    float _2992 = _2976;
    if (!_2954)
    {
        _2982 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2994 = _2982;
    out.m_89.x = _2974;
    out.m_91.x = _2976;
    out.m_91.y = _2932;
    out.m_91.z = _2972;
    out.m_91.w = _2112;
    out.m_93.x = _2978;
    float _2996 = _2994;
    float _2998 = _2994;
    if (!_2954)
    {
        _2984 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3000 = _2984;
    float _3002 = _3000;
    float _3004 = _3000;
    if (!_2954)
    {
        _2986 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3006 = _2986;
    float _3008 = _3006;
    float _3010 = _3006;
    if (!_2954)
    {
        _2988 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3012 = _2988;
    float _3014 = _3012;
    float _3016 = _3012;
    if (!_2954)
    {
        _2990 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3018 = _2990;
    float _3020 = _3018;
    float _3022 = _3018;
    if (!_2954)
    {
        _2992 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3024 = _2992;
    bool _3026 = !_2954;
    float _3028 = _3024;
    float _3030 = _3024;
    if (!_3026)
    {
        bool _3032 = _1904 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3034 = isnan(_1904);
        bool _3036 = _3032 || _3034;
        bool _3038 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3040 = _3036 || _3038;
        if (!_3040)
        {
            float _3042 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3044 = _1904 + _3042;
            float _3046 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3048 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3046;
            float _3050 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3052 = _3050 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3054 = 1.0 / _3048;
            float _3056 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3058 = _3056 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3060 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3062 = _3060 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3064 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3066 = _3064 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3068 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3070 = _3068 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3072 = _3044 * _3054;
            float _3074 = precise::clamp(_3072, 0.0, 1.0);
            float _3076 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3078 = _3076 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3080 = fma(_3074, _3052, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3082 = fma(_3074, _3078, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3084 = fma(_3074, _3058, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3086 = fma(_3074, _3062, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3088 = fma(_3074, _3066, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3090 = fma(_3074, _3070, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3004 = _3084;
            _3022 = _3088;
            _2998 = _3080;
            _3016 = _3086;
            _3010 = _3082;
            _3030 = _3090;
            _3092 = true;
        }
        else
        {
            bool _3094 = _1904 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3096 = isnan(_1904);
            bool _3098 = _3094 || _3096;
            bool _3100 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3102 = _3098 || _3100;
            if (!_3102)
            {
                _2996 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3104 = _2996;
            _2998 = _3104;
            if (!_3102)
            {
                _3002 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3106 = _3002;
            _3004 = _3106;
            if (!_3102)
            {
                _3008 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3108 = _3008;
            _3010 = _3108;
            if (!_3102)
            {
                _3014 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3110 = _3014;
            _3016 = _3110;
            if (!_3102)
            {
                _3020 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3112 = _3020;
            _3022 = _3112;
            if (!_3102)
            {
                _3028 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3114 = _3028;
            bool _3116 = !_3102;
            _3030 = _3114;
            if (!_3116)
            {
                bool _3118 = _1904 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3120 = isnan(_1904);
                bool _3122 = _3118 || _3120;
                bool _3124 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3126 = _3122 || _3124;
                if (!_3126)
                {
                    float _3128 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3130 = _1904 + _3128;
                    float _3132 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3134 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3132;
                    float _3136 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3138 = _3136 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3140 = 1.0 / _3134;
                    float _3142 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3144 = _3142 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3146 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3148 = _3146 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3150 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3152 = _3150 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3154 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3156 = _3154 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3158 = _3130 * _3140;
                    float _3160 = precise::clamp(_3158, 0.0, 1.0);
                    float _3162 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3164 = _3162 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3166 = fma(_3160, _3138, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3168 = fma(_3160, _3164, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3170 = fma(_3160, _3144, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3172 = fma(_3160, _3148, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3174 = fma(_3160, _3152, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3176 = fma(_3160, _3156, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3004 = _3170;
                    _3022 = _3174;
                    _2998 = _3166;
                    _3016 = _3172;
                    _3010 = _3168;
                    _3030 = _3176;
                    _3092 = true;
                }
                else
                {
                    _3004 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3022 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2998 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3016 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3010 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3030 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3092 = false;
    float _3178 = _3004;
    float _3180 = _3022;
    float _3182 = _2998;
    float _3184 = _3016;
    float _3186 = _3010;
    float _3188 = _3030;
    float _3190 = fma(_2790, -0.5, 0.5);
    float _3192 = precise::clamp(_3190, 0.0, 1.0);
    float _3194 = -_3178;
    float _3196 = _3194 + _3180;
    float _3198 = _2980 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3200 = -_3182;
    float _3202 = _3200 + _3184;
    float _3204 = fma(_3192, _3196, _3178);
    out.m_95.x = 0.0;
    float _3206 = -_3186;
    float _3208 = _3206 + _3188;
    float _3210 = fma(_3192, _3202, _3182);
    float _3212 = _3204 * 0.586610972881317138671875;
    out.m_53.x = _3198;
    bool _3214 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3216 = fma(_3192, _3208, _3186);
    float _3218 = fma(_3210, 0.298911988735198974609375, _3212);
    bool _3220 = _1874 > 0.0;
    bool _3222 = isnan(_1874);
    bool _3224 = _3220 || _3222;
    bool _3226 = isnan(0.0);
    bool _3228 = _3224 || _3226;
    float _3230 = fma(_3216, 0.114477999508380889892578125, _3218);
    float _3232 = -_3230;
    float _3234 = _3210 + _3232;
    float _3236 = -_3230;
    float _3238 = _3204 + _3236;
    float _3240 = -_3230;
    float _3242 = _3216 + _3240;
    float _3244 = fma(_3234, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3230);
    float _3246 = fma(_3238, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3230);
    float _3248 = fma(_3242, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3230);
    bool _3250 = !_3214;
    if (!_3250)
    {
        float _3252 = -_1808;
        float _3254 = _3252 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3256 = -_1810;
        float _3258 = _3256 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3260 = -_1812;
        float _3262 = _3260 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3264 = _3254 * _3254;
        float _3266 = fma(_3258, _3258, _3264);
        float _3268 = fma(_3262, _3262, _3266);
        float _3270 = sqrt(_3268);
        float _3272 = rsqrt(_3268);
        float _3274 = -_3270;
        float _3276 = _3274 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3278 = _3276 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3280 = precise::clamp(_3278, 0.0, 1.0);
        float _3282 = _3258 * _3272;
        float _3284 = _3254 * _3272;
        float _3286 = abs(_3280);
        float _3288 = log2(_3286);
        float _3290 = _3262 * _3272;
        float _3292 = _3282 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3294 = _2790 * _3284;
        float _3296 = -_3284;
        float _3298 = -_3292;
        float _3300 = fma(_3296, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3298);
        float _3302 = fma(_2834, _3282, _3294);
        float _3304 = -_3290;
        float _3306 = fma(_3304, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3300);
        float _3308 = fma(_2842, _3290, _3302);
        float _3310 = precise::clamp(_3308, 0.0, 1.0);
        float _3312 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3314 = _3306 + _3312;
        float _3316 = _3288 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3318 = _3314 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3320 = precise::clamp(_3318, 0.0, 1.0);
        float _3322 = exp2(_3316);
        float _3324 = _3322 * _3320;
        float _3326 = _3310 * _3324;
        float _3328 = _3326 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3330 = _3326 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3332 = _3326 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_95.x = _3328;
        out.m_95.y = _3330;
        out.m_95.z = _3332;
    }
    out.m_97.x = _3244;
    out.m_97.y = _3246;
    out.m_97.z = _3248;
    if (_3228)
    {
        return out;
    }
    out.m_53.x = 0.0;
    float _3334 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3334;
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
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3092 = false;
    bool _550 = false;
    bool _400 = false;
    bool _238 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _111 = in.m_46.w;
    float _113 = in.m_48.w;
    float _115 = trunc(_111);
    int _118 = int(_115);
    float _120 = -_113;
    float _122 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _122;
    bool _126 = _118 >= 1;
    float _128 = 0.0;
    float _130 = _113;
    float _132 = _122;
    if (!_126)
    {
        _128 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _134 = _128;
    if (!_126)
    {
        out.m_53.x = 0.0;
    }
    int _136 = 0;
    if (!_126)
    {
        float _138 = _134 * 5.0;
        _136 = as_type<int>(_138);
    }
    int _140 = _136;
    int _142 = _140;
    if (!_126)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3402 = as_type<float>(_140);
        out.gl_Position.z = _3402;
    }
    if (!_126)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _144 = _113 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _146 = isnan(_113);
    bool _148 = _144 || _146;
    bool _150 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _152 = _148 || _150;
    float _154 = float(_118);
    bool _156 = _122 >= _154;
    bool _158 = !_152;
    bool _160 = _156 || _158;
    if (_160)
    {
        _130 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _162 = _130;
    if (_160)
    {
        out.m_53.x = 0.0;
    }
    if (_160)
    {
        float _164 = _162 * 5.0;
        _142 = as_type<int>(_164);
    }
    int _166 = _142;
    if (_160)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3457 = as_type<float>(_166);
        out.gl_Position.z = _3457;
    }
    if (_160)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _168 = in.m_55.x;
    float _170 = in.m_55.y;
    float _172 = in.m_55.z;
    float _174 = 1.0 / _154;
    bool _176 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _178 = in.m_57.x;
    float _180 = in.m_57.y;
    float _182 = in.m_57.z;
    float _184 = in.m_59.x;
    float _186 = in.m_59.y;
    float _188 = in.m_59.z;
    float _190 = in.m_61.x;
    float _192 = in.m_61.y;
    float _194 = in.m_61.z;
    float _196 = _122 * _174;
    float _198 = _170 * _180;
    float _200 = _170 * _186;
    float _202 = fma(_168, _178, _198);
    float _204 = _170 * _192;
    float _206 = fma(_168, _184, _200);
    float _208 = fma(_172, _182, _202);
    float _210 = fma(_168, _190, _204);
    float _212 = fma(_172, _188, _206);
    float _214 = fma(_172, _194, _210);
    bool _216 = !_176;
    float _218 = _196;
    float _236;
    if (!_216)
    {
        float _220 = in.m_63.x;
        float _222 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _224 = _220 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _226 = fma(_224, (*spvDescriptorSet0.vp_c9)._m0[12].x, _122);
        float _228 = _226 * _222;
        float _230 = floor(_228);
        float _232 = -_230;
        float _234 = _228 + _232;
        _236 = _234;
        _238 = true;
    }
    else
    {
        _236 = _196;
    }
    _238 = false;
    float _240 = _236;
    float _242 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _244 = _240 + _242;
    bool _246 = _240 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _248 = isnan(_240);
    bool _250 = _246 || _248;
    bool _252 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _254 = _250 || _252;
    float _256 = float(_254);
    float _258 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _260 = _240 + _258;
    bool _262 = _240 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _264 = isnan(_240);
    bool _266 = _262 || _264;
    bool _268 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _270 = _266 || _268;
    float _272 = float(_270);
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _276 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _274;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _280 = _278 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _282 = _240 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _284 = isnan(_240);
    bool _286 = _282 || _284;
    bool _288 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _290 = _286 || _288;
    float _292 = float(_290);
    float _294 = 1.0 / _276;
    float _296 = -_292;
    float _298 = _296 + 1.0;
    bool _300 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _302 = _272 * _298;
    float _304 = -_272;
    float _306 = _304 + 1.0;
    float _308 = 1.0 / _280;
    float _310 = _244 * _294;
    float _312 = -_256;
    float _314 = _312 + 1.0;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _318 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _316;
    float _320 = _292 * _314;
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _324 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _322;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _328 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _326;
    float _330 = fma(_318, _310, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _332 = _260 * _308;
    float _334 = fma(_324, _310, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _336 = fma(_328, _310, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _338 = _330 * _302;
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _342 = _340 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _344 = _334 * _302;
    float _346 = _336 * _302;
    float _348 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _350 = _348 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _354 = _352 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _356 = fma(_306, (*spvDescriptorSet0.vp_c9)._m0[143].x, _344);
    float _358 = fma(_306, (*spvDescriptorSet0.vp_c9)._m0[143].y, _338);
    float _360 = fma(_350, _332, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _362 = fma(_342, _332, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _364 = fma(_354, _332, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _366 = fma(_306, (*spvDescriptorSet0.vp_c9)._m0[143].z, _346);
    float _368 = fma(_360, _320, _356);
    float _370 = fma(_362, _320, _358);
    float _372 = fma(_364, _320, _366);
    float _374 = fma(_256, (*spvDescriptorSet0.vp_c9)._m0[145].x, _368);
    float _376 = fma(_256, (*spvDescriptorSet0.vp_c9)._m0[145].y, _370);
    float _378 = fma(_256, (*spvDescriptorSet0.vp_c9)._m0[145].z, _372);
    bool _380 = !_300;
    float _398;
    if (!_380)
    {
        float _382 = in.m_63.x;
        float _384 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _386 = _382 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _388 = fma(_386, (*spvDescriptorSet0.vp_c9)._m0[11].y, _122);
        float _390 = _388 * _384;
        float _392 = floor(_390);
        float _394 = -_392;
        float _396 = _390 + _394;
        _398 = _396;
        _400 = true;
    }
    else
    {
        _398 = _196;
    }
    _400 = false;
    float _402 = _398;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _406 = _402 + _404;
    float _408 = in.m_65.x;
    float _410 = in.m_65.y;
    float _412 = in.m_65.z;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _416 = _414 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _418 = _402 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _420 = isnan(_402);
    bool _422 = _418 || _420;
    bool _424 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _426 = _422 || _424;
    float _428 = float(_426);
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _432 = _430 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _434 = _402 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _436 = isnan(_402);
    bool _438 = _434 || _436;
    bool _440 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _442 = _438 || _440;
    float _444 = float(_442);
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _448 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _446;
    bool _450 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _452 = 1.0 / _416;
    float _454 = -_428;
    float _456 = _454 + 1.0;
    float _458 = _444 * _456;
    float _460 = -_444;
    float _462 = _460 + 1.0;
    float _464 = 1.0 / _432;
    float _466 = _448 * _452;
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _470 = _468 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _472 = _378 * _412;
    float _474 = _376 * _410;
    float _476 = fma(_466, _406, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _478 = _402 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _480 = isnan(_402);
    bool _482 = _478 || _480;
    bool _484 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _486 = _482 || _484;
    float _488 = float(_486);
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _492 = _402 + _490;
    float _494 = _374 * _408;
    float _496 = _476 * _458;
    float _498 = _470 * _464;
    float _500 = -_488;
    float _502 = _500 + 1.0;
    float _504 = fma(_462, (*spvDescriptorSet0.vp_c9)._m0[115].x, _496);
    float _506 = fma(_498, _492, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _508 = _428 * _502;
    float _510 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _512 = fma(_506, _508, _504);
    float _514 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _516 = _510 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _518 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _520 = fma(_488, (*spvDescriptorSet0.vp_c9)._m0[117].x, _512);
    float _522 = _514 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _524 = _518 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _526 = _520 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _528 = !_450;
    float _530 = _526;
    float _548;
    if (!_528)
    {
        float _532 = in.m_63.x;
        float _534 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _536 = _532 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _538 = fma(_536, (*spvDescriptorSet0.vp_c9)._m0[11].w, _122);
        float _540 = _538 * _534;
        float _542 = floor(_540);
        float _544 = -_542;
        float _546 = _540 + _544;
        _548 = _546;
        _550 = true;
    }
    else
    {
        _548 = _196;
    }
    _550 = false;
    float _552 = _548;
    float _554 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _556 = _552 + _554;
    float _558 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _560 = _558 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _564 = _562 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _566 = _552 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _568 = isnan(_552);
    bool _570 = _566 || _568;
    bool _572 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _574 = _570 || _572;
    float _576 = float(_574);
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _580 = _578 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _582 = _552 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _584 = isnan(_552);
    bool _586 = _582 || _584;
    bool _588 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _590 = _586 || _588;
    float _592 = float(_590);
    float _594 = 1.0 / _560;
    float _596 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _598 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _596;
    float _600 = -_576;
    float _602 = _600 + 1.0;
    bool _604 = _552 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _606 = isnan(_552);
    bool _608 = _604 || _606;
    bool _610 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _612 = _608 || _610;
    float _614 = float(_612);
    bool _616 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _618 = 1.0 / _564;
    float _620 = 1.0 / _580;
    float _622 = _598 * _594;
    float _624 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _626 = _624 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _628 = _592 * _602;
    float _630 = -_592;
    float _632 = _630 + 1.0;
    float _634 = fma(_622, _556, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _638 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _636;
    float _640 = _614 * _632;
    float _642 = _626 * _618;
    float _644 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _646 = _552 + _644;
    bool _648 = _552 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _650 = isnan(_552);
    bool _652 = _648 || _650;
    bool _654 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _656 = _652 || _654;
    float _658 = float(_656);
    float _660 = _634 * _640;
    float _662 = -_614;
    float _664 = _662 + 1.0;
    float _666 = fma(_642, _646, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _668 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _670 = _552 + _668;
    float _672 = _638 * _620;
    float _674 = -_658;
    float _676 = _674 + 1.0;
    float _678 = fma(_664, (*spvDescriptorSet0.vp_c9)._m0[131].x, _660);
    float _680 = fma(_672, _670, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _682 = _576 * _676;
    float _684 = fma(_666, _628, _678);
    float _686 = fma(_680, _682, _684);
    float _688 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _690 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _692 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _694 = fma(_658, (*spvDescriptorSet0.vp_c9)._m0[134].x, _686);
    float _696 = _690 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _698 = _688 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _700 = _692 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _702 = _694 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _704 = !_616;
    if (!_704)
    {
        float _706 = in.m_63.x;
        float _708 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _710 = _706 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _712 = fma(_710, (*spvDescriptorSet0.vp_c9)._m0[14].x, _122);
        float _714 = _712 * _708;
        float _716 = floor(_714);
        float _718 = -_716;
        float _720 = _714 + _718;
        _218 = _720;
    }
    float _722 = _218;
    float _724 = in.m_46.x;
    float _726 = in.m_46.y;
    float _728 = in.m_46.z;
    float _730 = _494 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _732 = in.m_63.x;
    float _734 = in.m_63.y;
    float _736 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _738 = _736 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _740 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _742 = in.m_63.z;
    float _744 = 1.0 / _738;
    float _746 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _748 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _750 = _748 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _752 = _472 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _754 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _756 = _754 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _758 = 1.0 / _750;
    float _760 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _762 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _760;
    float _764 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _766 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _764;
    float _768 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _770 = _768 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _772 = _186 * _726;
    float _774 = _180 * _726;
    float _776 = _192 * _726;
    float _778 = fma(_184, _724, _772);
    float _780 = _732 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _782 = fma(_178, _724, _774);
    float _784 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _786 = _784 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _788 = fma(_190, _724, _776);
    float _790 = -_740;
    float _792 = fma(_780, 2.0, _790);
    float _794 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _796 = _794 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _798 = 1.0 / _786;
    float _800 = _734 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _802 = fma(_182, _728, _782);
    float _804 = fma(_188, _728, _778);
    float _806 = fma(_800, -2.0, _746);
    float _808 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _810 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _808;
    float _812 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _814 = _812 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _816 = 1.0 / _796;
    float _818 = fma(_194, _728, _788);
    float _820 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _822 = _820 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _824 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _826 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _824;
    int _828 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _830 = _828 != 0;
    int _832 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _834 = _832 != 0;
    int _836 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _838 = _836 != 0;
    float _840 = 1.0 / _814;
    float _842 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _844 = _842 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _846 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _848 = _846 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _850 = _822 * _798;
    bool _852 = !_834;
    int _854 = _852 ? 0 : 1;
    float _856 = in.m_61.w;
    float _858 = _848 * _758;
    float _860 = _734 + _732;
    float _862 = 1.0 / _844;
    float _864 = _762 * _816;
    bool _866 = !_830;
    int _868 = _866 ? 0 : 1;
    float _870 = in.m_57.w;
    float _872 = _860 + (-1.0);
    bool _874 = !_838;
    int _876 = _874 ? 0 : 1;
    float _878 = _826 * _744;
    float _880 = 1.0 / _756;
    float _882 = _732 * 2.0;
    float _884 = _770 * _840;
    bool _886 = _722 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _888 = isnan(_722);
    bool _890 = _886 || _888;
    bool _892 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _894 = _890 || _892;
    float _896 = float(_894);
    float _898 = in.m_59.w;
    bool _900 = _722 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _902 = isnan(_722);
    bool _904 = _900 || _902;
    bool _906 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _908 = _904 || _906;
    float _910 = float(_908);
    float _912 = _766 * _862;
    float _914 = _742 * 2.0;
    float _916 = floor(_882);
    float _918 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _920 = _818 + _856;
    float _922 = _810 * _880;
    float _924 = floor(_914);
    float _926 = _734 + _742;
    float _928 = _802 + _870;
    float _930 = fma(_732, (*spvDescriptorSet0.vp_c9)._m0[78].z, _918);
    float _932 = fma(_872, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _934 = _742 + _732;
    float _936 = _926 + (-1.0);
    float _938 = _734 * 2.0;
    bool _940 = _916 > 0.0;
    float _942 = _934 + (-1.0);
    bool _944 = _916 >= 0.0;
    bool _946 = isnan(_916);
    bool _948 = _944 || _946;
    bool _950 = isnan(0.0);
    bool _952 = _948 || _950;
    float _954 = fma(_936, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _956 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _958 = _722 + _956;
    float _960 = fma(_942, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _962 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _964 = _962 != 0;
    int _966 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _968 = _966 != 0;
    int _970 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _972 = _970 != 0;
    float _974 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _976 = _722 + _974;
    bool _978 = _924 > 0.0;
    float _980 = fma(_878, _958, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _982 = _924 >= 0.0;
    bool _984 = isnan(_924);
    bool _986 = _982 || _984;
    bool _988 = isnan(0.0);
    bool _990 = _986 || _988;
    float _992 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _994 = log2(_992);
    int _996 = _952 ? 0 : 1;
    float _998 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1000 = _722 + _998;
    int _1002 = _990 ? 0 : 1;
    float _1004 = fma(_858, _976, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    bool _1006 = !_964;
    int _1008 = _1006 ? 0 : 1;
    float _1010 = -_896;
    float _1012 = _1010 + 1.0;
    int _1014 = ~_1002;
    int _1016 = _1014 + 1;
    int _1018 = _1016 + 1;
    float _1020 = floor(_938);
    int _1022 = ~_996;
    int _1024 = _1022 + 1;
    int _1026 = _1024 + 1;
    float _1028 = fma(_922, _1000, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    int _1030 = _1018;
    int _1032 = _1026;
    if (!_978)
    {
        int _1034 = ~_1002;
        int _1036 = _1034 + 1;
        _1030 = _1036;
    }
    int _1038 = _1030;
    float _1040 = _804 + _898;
    if (!_940)
    {
        int _1042 = ~_996;
        int _1044 = _1042 + 1;
        _1032 = _1044;
    }
    int _1046 = _1032;
    bool _1048 = _722 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1050 = isnan(_722);
    bool _1052 = _1048 || _1050;
    bool _1054 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1056 = _1052 || _1054;
    float _1058 = float(_1056);
    float _1060 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1062 = int(_1060);
    int _1064 = abs(_1008);
    float _1066 = _994 * _122;
    float _1068 = float(_1038);
    float _1070 = _1058 * _1012;
    bool _1072 = _722 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1074 = isnan(_722);
    bool _1076 = _1072 || _1074;
    bool _1078 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1080 = _1076 || _1078;
    float _1082 = float(_1080);
    float _1084 = -_1058;
    float _1086 = _1084 + 1.0;
    bool _1088 = _722 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1090 = isnan(_722);
    bool _1092 = _1088 || _1090;
    bool _1094 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1096 = _1092 || _1094;
    float _1098 = float(_1096);
    float _1100 = exp2(_1066);
    float _1102 = float(_1064);
    float _1104 = _1082 * _1086;
    float _1106 = -_1082;
    float _1108 = _1106 + 1.0;
    bool _1110 = _722 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1112 = isnan(_722);
    bool _1114 = _1110 || _1112;
    bool _1116 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1118 = _1114 || _1116;
    float _1120 = float(_1118);
    float _1122 = -_1098;
    float _1124 = _1122 + 1.0;
    bool _1126 = _1020 > 0.0;
    float _1128 = _1102 * _1068;
    bool _1130 = _1020 >= 0.0;
    bool _1132 = isnan(_1020);
    bool _1134 = _1130 || _1132;
    bool _1136 = isnan(0.0);
    bool _1138 = _1134 || _1136;
    float _1140 = _1120 * _1124;
    float _1142 = -_1120;
    float _1144 = _1142 + 1.0;
    float _1146 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1148 = int(_1146);
    float _1150 = float(_1062);
    float _1152 = _1098 * _1108;
    bool _1154 = _722 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1156 = isnan(_722);
    bool _1158 = _1154 || _1156;
    bool _1160 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1162 = _1158 || _1160;
    float _1164 = float(_1162);
    float _1166 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1168 = 1.0 + _1166;
    float _1170 = in.m_67.x;
    float _1172 = in.m_67.y;
    float _1174 = in.m_67.z;
    bool _1176 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1178 = isnan(1.0);
    bool _1180 = _1176 || _1178;
    bool _1182 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1184 = _1180 || _1182;
    float _1186 = 1.0 / _1150;
    float _1188 = _1164 * _1144;
    float _1190 = -_1164;
    float _1192 = _1190 + 1.0;
    float _1194 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1196 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1198 = isnan(0.0);
    bool _1200 = _1196 || _1198;
    bool _1202 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1204 = _1200 || _1202;
    float _1206 = _910 * _1192;
    float _1208 = fma(_734, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1194);
    float _1210 = 1.0 / _1168;
    float _1212 = -_1100;
    float _1214 = _1212 + 1.0;
    float _1216 = -_122;
    float _1218 = fma(_1216, (*spvDescriptorSet0.vp_c9)._m0[76].x, _792);
    float _1220 = float(_1148);
    float _1222 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1208);
    bool _1224 = !_968;
    int _1226 = _1224 ? 0 : 1;
    float _1228 = _980 * _1206;
    float _1230 = _1204 ? _1214 : 0.0;
    float _1232 = _1186 * _122;
    float _1234 = _1220 * _122;
    float _1236 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].z, _930);
    float _1238 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[76].y, _806);
    bool _1240 = !_972;
    int _1242 = _1240 ? 0 : 1;
    int _1244 = abs(_1226);
    if (_1184)
    {
        float _1246 = _1230 * _1210;
        _132 = _1246;
    }
    float _1248 = _132;
    float _1250 = _1128 * (-2.0);
    int _1252 = _1138 ? 0 : 1;
    int _1254 = abs(_1242);
    float _1256 = fma(_932, _1250, _932);
    float _1258 = fma(_1250, _1170, _1170);
    float _1260 = _732 + (-0.5);
    float _1262 = float(_1046);
    float _1264 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1266 = _928 + _1264;
    float _1268 = float(_1244);
    float _1270 = fma(_1260, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1258);
    int _1272 = ~_1252;
    int _1274 = _1272 + 1;
    int _1276 = _1274 + 1;
    float _1278 = -_910;
    float _1280 = _1278 + 1.0;
    int _1282 = _1276;
    if (!_1126)
    {
        int _1284 = ~_1252;
        int _1286 = _1284 + 1;
        _1282 = _1286;
    }
    int _1288 = _1282;
    float _1290 = _1268 * _1262;
    float _1292 = fma(_1256, _1248, _1270);
    float _1294 = float(_1288);
    float _1296 = _1290 * (-2.0);
    float _1298 = float(_1254);
    float _1300 = fma(_1280, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1228);
    float _1302 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1304 = _1040 + _1302;
    float _1306 = fma(_1296, _1172, _1172);
    float _1308 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1310 = _920 + _1308;
    float _1312 = _1298 * _1294;
    float _1314 = _734 + (-0.5);
    float _1316 = _1304 * _1304;
    float _1318 = _1292 * 0.15915493667125701904296875;
    float _1320 = _1312 * (-2.0);
    float _1322 = fma(_1314, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1306);
    float _1324 = fma(_1266, _1266, _1316);
    float _1326 = _742 + (-0.5);
    float _1328 = fma(_1320, _1174, _1174);
    float _1330 = fma(_1004, _1188, _1300);
    float _1332 = fma(_1310, _1310, _1324);
    float _1334 = fma(_954, _1296, _954);
    float _1336 = fma(_1326, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1328);
    float _1338 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1340 = _722 + _1338;
    float _1342 = fma(_1028, _1140, _1330);
    float _1344 = in.m_69.x;
    float _1346 = in.m_69.y;
    float _1348 = in.m_69.z;
    float _1350 = fma(_960, _1320, _960);
    float _1352 = fma(_850, _1340, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1354 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1356 = _722 + _1354;
    float _1358 = fma(_1334, _1248, _1322);
    float _1360 = fma(_1350, _1248, _1336);
    float _1362 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1364 = _722 + _1362;
    bool _1366 = _722 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1368 = isnan(_722);
    bool _1370 = _1366 || _1368;
    bool _1372 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1374 = _1370 || _1372;
    float _1376 = float(_1374);
    float _1378 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1380 = _722 + _1378;
    float _1382 = fma(_864, _1356, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1384 = fma(_1352, _1152, _1342);
    float _1386 = _1358 * 0.15915493667125701904296875;
    float _1388 = _1360 * 0.15915493667125701904296875;
    float _1390 = rsqrt(_1332);
    float _1392 = fma(_884, _1364, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1394 = -_1376;
    float _1396 = _1394 + 1.0;
    float _1398 = fma(_1382, _1104, _1384);
    float _1400 = fma(_912, _1380, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1402 = _896 * _1396;
    float _1404 = fma(_1392, _1070, _1398);
    float _1406 = _1318 * 6.283185482025146484375;
    float _1408 = sin(_1406);
    float _1410 = fma(_1400, _1402, _1404);
    float _1412 = _474 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1414 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1344);
    float _1416 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1346);
    float _1418 = fma(_1376, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1410);
    float _1420 = _1386 * 6.283185482025146484375;
    float _1422 = sin(_1420);
    float _1424 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1348);
    float _1426 = _730 * _1414;
    float _1428 = _1418 * _1390;
    float _1430 = _1412 * _1416;
    float _1432 = -(*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _1434 = _1432 + (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _1436 = _752 * _1424;
    float _1438 = abs((*spvDescriptorSet0.vp_c7)._m0[2].z);
    float _1440 = precise::max((*spvDescriptorSet0.vp_c9)._m0[191].x, _1438);
    float _1442 = _1386 * 6.283185482025146484375;
    float _1444 = cos(_1442);
    float _1446 = abs(_1310);
    float _1448 = _1446 * _1428;
    float _1450 = abs(_1266);
    float _1452 = _1450 * _1428;
    float _1454 = abs(_1304);
    float _1456 = _1454 * _1428;
    float _1458 = _1388 * 6.283185482025146484375;
    float _1460 = cos(_1458);
    float _1462 = _1408 * _1422;
    float _1464 = _1318 * 6.283185482025146484375;
    float _1466 = cos(_1464);
    float _1468 = _1408 * _1444;
    float _1470 = _1388 * 6.283185482025146484375;
    float _1472 = sin(_1470);
    float _1474 = _1408 * _1460;
    float _1476 = _1444 * _1460;
    float _1478 = _1422 * _1460;
    float _1480 = _1466 * _1444;
    float _1482 = _1466 * _1422;
    float _1484 = _1466 * _1460;
    float _1486 = _1474 * _1430;
    float _1488 = precise::min(_1440, (*spvDescriptorSet0.vp_c9)._m0[191].y);
    float _1490 = fma(_1472, _1480, _1462);
    float _1492 = fma(_1472, _1462, _1480);
    float _1494 = _1484 * _1430;
    float _1496 = 1.0 / _1434;
    float _1498 = -_1482;
    float _1500 = fma(_1472, _1468, _1498);
    float _1502 = -_1430;
    float _1504 = _1472 * _1502;
    float _1506 = -_1468;
    float _1508 = fma(_1472, _1482, _1506);
    float _1510 = fma(_1490, _1426, _1494);
    float _1512 = fma(_1500, _1426, _1486);
    float _1514 = fma(_1476, _1426, _1504);
    float _1516 = abs((*spvDescriptorSet0.vp_c7)._m0[2].x);
    float _1518 = precise::max((*spvDescriptorSet0.vp_c9)._m0[191].x, _1516);
    float _1520 = fma(_1508, _1436, _1510);
    float _1522 = -(*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _1524 = _1488 + _1522;
    float _1526 = fma(_1478, _1436, _1514);
    float _1528 = precise::min(_1518, (*spvDescriptorSet0.vp_c9)._m0[191].y);
    float _1530 = _1520 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1532 = fma(_1492, _1436, _1512);
    float _1534 = _1520 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1536 = _1524 * _1496;
    float _1538 = fma(_1526, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1530);
    float _1540 = -(*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _1542 = _1528 + _1540;
    float _1544 = fma(_1448, _1536, 1.0);
    float _1546 = fma(_1526, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1534);
    float _1548 = fma(_1532, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1538);
    float _1550 = _1542 * _1496;
    float _1552 = fma(_1532, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1546);
    float _1554 = _1548 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1556 = fma(_1452, _1550, 0.9900000095367431640625);
    float _1558 = _1552 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1560 = fma(_1554, _1544, _920);
    float _1562 = fma(_1558, _1556, _928);
    float _1564 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1566 = _1560 + _1564;
    float _1568 = (*spvDescriptorSet0.vp_c7)._m0[2].y * 0.25;
    float _1570 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1572 = _1562 + _1570;
    float _1574 = _1566 * _1566;
    float _1576 = abs(_1568);
    float _1578 = precise::max(_1576, (*spvDescriptorSet0.vp_c9)._m0[191].x);
    float _1580 = fma(_1572, _1572, _1574);
    float _1582 = precise::min(_1578, (*spvDescriptorSet0.vp_c9)._m0[191].y);
    float _1584 = sqrt(_1580);
    float _1586 = -(*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _1588 = _1582 + _1586;
    float _1590 = _1520 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1592 = _1588 * _1496;
    float _1594 = fma(_1526, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1590);
    float _1596 = _1040 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1598 = _1040 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1600 = fma(_1456, _1592, 1.0);
    float _1602 = fma(_1532, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1594);
    float _1604 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1596);
    bool _1606 = _1584 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1608 = _1602 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1610 = fma(_920, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1604);
    float _1612 = fma(_1608, _1600, _1040);
    float _1614 = _1610 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1616 = _1608;
    float _1618 = _1600;
    float _1620 = _1560;
    float _1622 = _1598;
    if (!_1606)
    {
        _1616 = _1560;
    }
    float _1624 = _1616;
    float _1626 = _1624;
    if (!_1606)
    {
        _1618 = _1562;
    }
    float _1628 = _1618;
    float _1630 = _1628;
    if (!_1606)
    {
        _1620 = _1612;
    }
    float _1632 = _1620;
    bool _1634 = !_1606;
    float _1636 = _1632;
    if (!_1634)
    {
        float _1638 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1640 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1642 = _1584 + _1640;
        float _1644 = _1612 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1646 = rsqrt(_1580);
        float _1648 = _1642 * _1638;
        float _1650 = _1648 * 0.15915493667125701904296875;
        float _1652 = _1650 * 6.283185482025146484375;
        float _1654 = cos(_1652);
        float _1656 = _1650 * 6.283185482025146484375;
        float _1658 = sin(_1656);
        float _1660 = _1654 + (-1.0);
        float _1662 = _1660 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1664 = fma(_1658, _1644, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1666 = fma(_1612, _1654, _1662);
        float _1668 = _1646 * _1664;
        float _1670 = fma(_1572, _1668, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1672 = fma(_1566, _1668, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1636 = _1666;
        _1630 = _1670;
        _1626 = _1672;
    }
    float _1674 = _1636;
    float _1676 = _1630;
    float _1678 = _1626;
    float _1680 = -_1040;
    float _1682 = _1680 + _1674;
    float _1684 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1598);
    float _1686 = -_928;
    float _1688 = _1686 + _1676;
    float _1690 = 1.0 / _1614;
    float _1692 = _1682 * _1682;
    float _1694 = fma(_920, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1684);
    float _1696 = -_920;
    float _1698 = _1696 + _1678;
    bool _1700 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1702 = isnan(0.5);
    bool _1704 = _1700 || _1702;
    bool _1706 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1708 = _1704 || _1706;
    float _1710 = fma(_1688, _1688, _1692);
    float _1712 = _1694 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1714 = fma(_1698, _1698, _1710);
    float _1716 = _1712 + _1614;
    float _1718 = sqrt(_1714);
    float _1720 = _1716 * _1690;
    float _1722 = _1720 * 0.5;
    float _1724 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1726 = fma(_1722, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1724);
    float _1728 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _1730 = _1722;
    float _1732 = _1674;
    float _1734 = _1676;
    float _1736 = _1698;
    if (_1708)
    {
        _1728 = 1.0;
    }
    float _1738 = _1728;
    float _1740 = 1.0 / _1726;
    bool _1742 = _1718 > 0.0;
    float _1744 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1746 = _1740 * _1744;
    float _1748 = _1718;
    float _1750 = _1738;
    if (!_1742)
    {
        _1730 = _1678;
    }
    float _1752 = _1730;
    bool _1754 = !_1742;
    float _1756 = _1752;
    if (!_1754)
    {
        float _1758 = _212 * _212;
        float _1760 = fma(_208, _208, _1758);
        float _1762 = fma(_214, _214, _1760);
        float _1764 = rsqrt(_1714);
        float _1766 = sqrt(_1762);
        float _1768 = _1688 * _1764;
        float _1770 = _1682 * _1764;
        float _1772 = _1698 * _1764;
        bool _1774 = _1766 > 0.0;
        float _1776 = _1766;
        _1748 = _1764;
        _1622 = _1772;
        if (!_1774)
        {
            _1776 = _1678;
        }
        float _1778 = _1776;
        bool _1780 = !_1774;
        _1756 = _1778;
        if (!_1780)
        {
            float _1782 = rsqrt(_1762);
            float _1784 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1786 = _212 * _1782;
            float _1788 = _208 * _1782;
            float _1790 = _214 * _1782;
            float _1792 = _1770 * _1786;
            float _1794 = fma(_1768, _1788, _1792);
            float _1796 = _1784 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1798 = fma(_1772, _1790, _1794);
            float _1800 = _1798 * _1796;
            float _1802 = fma(_208, _1800, _1676);
            float _1804 = fma(_212, _1800, _1674);
            float _1806 = fma(_214, _1800, _1678);
            _1732 = _1804;
            _1734 = _1802;
            _1756 = _1806;
            _1736 = _1794;
            _1748 = _1792;
        }
    }
    float _1808 = _1732;
    float _1810 = _1734;
    float _1812 = _1756;
    float _1814 = _1736;
    float _1816 = _1748;
    float _1818 = _1622;
    float _1820 = _1814;
    float _1822 = _1818;
    if (!_1708)
    {
        float _1824 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1826 = _1824 * 0.15915493667125701904296875;
        float _1828 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1830 = _1826 * 6.283185482025146484375;
        float _1832 = cos(_1830);
        float _1834 = _1828 * 0.15915493667125701904296875;
        float _1836 = _1826 * 6.283185482025146484375;
        float _1838 = sin(_1836);
        float _1840 = 1.0 / _1832;
        float _1842 = _1834 * 6.283185482025146484375;
        float _1844 = cos(_1842);
        float _1846 = _1838 * _1840;
        float _1848 = _1834 * 6.283185482025146484375;
        float _1850 = sin(_1848);
        float _1852 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1854 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1852;
        float _1856 = _1844 * _1846;
        float _1858 = 1.0 / _1854;
        float _1860 = 1.0 / _1856;
        float _1862 = _1850 * _1860;
        float _1864 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1866 = fma(_1746, _1862, _1864);
        float _1868 = _1866 * _1858;
        float _1870 = precise::clamp(_1868, 0.0, 1.0);
        _1820 = _1826;
        _1750 = _1870;
    }
    float _1872 = _1820;
    float _1874 = _1750;
    float _1876 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1878 = _1808 + _1876;
    float _1880 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1882 = _1810 + _1880;
    float _1884 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1886 = _1812 + _1884;
    float _1888 = _1808 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1890 = _1878 * _1878;
    float _1892 = fma(_1810, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1888);
    float _1894 = fma(_1882, _1882, _1890);
    float _1896 = fma(_1812, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1892);
    float _1898 = fma(_1886, _1886, _1894);
    float _1900 = _1896 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1902 = rsqrt(_1898);
    float _1904 = sqrt(_1898);
    float _1906 = _1902 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1908 = _1882 * _1906;
    float _1910 = _1886 * _1906;
    float _1912 = _1908 * _1908;
    float _1914 = _1910 * _1910;
    float _1916 = _1912 + _1914;
    float _1918 = sqrt(_1916);
    bool _1920 = _1918 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1922 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1924 = _1918 + _1922;
    float _1926 = _1872;
    float _1928 = _1924;
    float _1930 = _1908;
    float _1932 = _1910;
    float _1934 = _1912;
    float _1936 = _1914;
    if (_1920)
    {
        float _1938 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1926 = _1938;
    }
    float _1940 = _1926;
    if (_1920)
    {
        float _1942 = _1924 * _1940;
        _1928 = _1942;
    }
    float _1944 = _1928;
    if (_1920)
    {
        float _1946 = _1944 * 0.15915493667125701904296875;
        _1822 = _1946;
    }
    float _1948 = _1822;
    float _1950 = _1816;
    float _1952 = _1948;
    if (_1920)
    {
        float _1954 = _1948 * 6.283185482025146484375;
        float _1956 = sin(_1954);
        _1950 = _1956;
    }
    float _1958 = _1950;
    float _1960 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1962 = precise::max(0.0, _1960);
    float _1964 = _1940;
    float _1966 = _1962;
    if (_1920)
    {
        float _1968 = _1948 * 6.283185482025146484375;
        float _1970 = cos(_1968);
        _1964 = _1970;
    }
    float _1972 = _1964;
    float _1974 = -_1906;
    float _1976 = -_1962;
    float _1978 = fma(_1878, _1974, _1976);
    float _1980 = _1960;
    if (_1920)
    {
        float _1982 = rsqrt(_1916);
        _1980 = _1982;
    }
    float _1984 = _1980;
    if (_1920)
    {
        float _1986 = _1978 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1966 = _1986;
    }
    float _1988 = _1966;
    float _1990 = fma(_928, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1992 = _1988;
    float _1994 = _1958;
    if (_1920)
    {
        float _1996 = fma(_1958, _1988, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1992 = _1996;
    }
    float _1998 = _1992;
    if (_1920)
    {
        float _2000 = _1972 + (-1.0);
        _1994 = _2000;
    }
    float _2002 = _1994;
    float _2004 = floor(_1990);
    float _2006 = _2002;
    if (_1920)
    {
        float _2008 = _2002 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2006 = _2008;
    }
    float _2010 = _2006;
    float _2012 = _1984;
    if (_1920)
    {
        float _2014 = _1984 * _1998;
        _1952 = _2014;
    }
    float _2016 = _1952;
    if (!_1920)
    {
        _2012 = _1978;
    }
    float _2018 = _2012;
    float _2020 = _2018;
    if (_1920)
    {
        float _2022 = fma(_1978, _1972, _2010);
        _2020 = _2022;
    }
    float _2024 = _2020;
    if (_1920)
    {
        float _2026 = _1908 * _2016;
        _1930 = _2026;
    }
    float _2028 = _1930;
    if (_1920)
    {
        float _2030 = _1910 * _2016;
        _1932 = _2030;
    }
    float _2032 = _1932;
    float _2034 = _1808 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1920)
    {
        float _2036 = _2028 * _2028;
        _1934 = _2036;
    }
    float _2038 = _1934;
    if (_1920)
    {
        float _2040 = _2032 * _2032;
        _1936 = _2040;
    }
    float _2042 = _1936;
    float _2044 = fma(_920, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2046 = fma(_2024, _2024, _2038);
    float _2048 = _1808 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2050 = fma(_1810, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2034);
    float _2052 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2054 = fma(_1904, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2052);
    float _2056 = precise::clamp(_2054, 0.0, 1.0);
    float _2058 = _2046 + _2042;
    float _2060 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2062 = _1808 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2064 = fma(_1810, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2048);
    float _2066 = fma(_1812, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2050);
    float _2068 = -_2056;
    float _2070 = _2068 + 1.0;
    float _2072 = fma(_1810, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2062);
    float _2074 = rsqrt(_2058);
    float _2076 = fma(_1812, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2064);
    float _2078 = _2066 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2080 = fma(_1812, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2072);
    float _2082 = _2076 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2084 = _2080 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2086 = _2078 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2088 = abs(_2070);
    float _2090 = log2(_2088);
    float _2092 = _2084 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2094 = -_2086;
    float _2096 = fma(_2094, _2060, 1.0);
    float _2098 = _2084 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2100 = fma(_2082, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2092);
    float _2102 = _2074 * _2028;
    float _2104 = _2074 * _2032;
    float _2106 = floor(_2044);
    float _2108 = fma(_2078, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2100);
    float _2110 = _2074 * _2024;
    float _2112 = fma(_1900, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2108);
    float _2114 = _2102 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2116 = _2090 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2118 = log2(_2096);
    float _2120 = _2110 + 1.0;
    float _2122 = -_2114;
    float _2124 = fma(_2110, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2122);
    float _2126 = -_2104;
    float _2128 = fma(_2126, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2124);
    float _2130 = -_2004;
    float _2132 = _1990 + _2130;
    float _2134 = 1.0 / _2112;
    float _2136 = _2084 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2138 = fma(_2128, -0.5, 0.5);
    float _2140 = -_2106;
    float _2142 = _2044 + _2140;
    float _2144 = fma(_2128, 0.5, 0.5);
    float _2146 = fma(_2082, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2136);
    float _2148 = fma(_2082, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2098);
    float _2150 = exp2(_2116);
    float _2152 = fma(_2078, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2146);
    float _2154 = fma(_2144, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2156 = fma(_2078, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2148);
    float _2158 = _2118 * 0.693147182464599609375;
    float _2160 = fma(_1900, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2152);
    float _2162 = fma(_2144, _2154, -0.212114393711090087890625);
    float _2164 = fma(_1900, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2156);
    float _2166 = sqrt(_2138);
    float _2168 = _2160 * _2134;
    float _2170 = fma(_2144, _2162, 1.570728778839111328125);
    float _2172 = _2164 * _2134;
    float _2174 = _2158 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2176 = fma(_2168, 0.5, 0.5);
    float _2178 = -_2110;
    float _2180 = fma(_2150, _2120, _2178);
    float2 _6604 = float2(_2132, _2142);
    float _2182 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6604, float2(0.0), isnan(_6604)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6604, float2(0.0), isnan(_6604)), level(0.0)).x;
    float _2184 = fma(_2180, 0.5, 0.5);
    float _2186 = _2166 * 0.636619746685028076171875;
    float _2188 = fma(_2172, -0.5, 0.5);
    float _2190 = -_2170;
    float _2192 = fma(_2186, _2190, 1.0);
    float3 _6627 = float3(_2176, _2188, _2174);
    float _2194 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6627, float3(0.0), isnan(_6627)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6627, float3(0.0), isnan(_6627)), level(0.0)).x;
    float3 _6638 = float3(_2176, _2188, _2174);
    float4 _2197 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6638, float3(0.0), isnan(_6638)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6638, float3(0.0), isnan(_6638)), level(0.0)).xyzw;
    float _2199 = _2197.x;
    float _2201 = _2197.y;
    float _2203 = _2197.z;
    float _2205 = _2197.w;
    float2 _6654 = float2(_2192, _2184);
    float3 _2209 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6654, float2(0.0), isnan(_6654)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6654, float2(0.0), isnan(_6654)), level(0.0)).xyz;
    float _2211 = _2209.x;
    float _2213 = _2209.y;
    float _2215 = _2209.z;
    float _2217 = float(uint(_1148));
    float _2219 = trunc(_1232);
    int _2221 = int(_2219);
    bool _2223 = _1148 == 0;
    float _2225 = _1234 * _174;
    int _2227 = abs(_868);
    out.m_71.x = _516;
    out.m_71.y = _522;
    out.m_71.z = _524;
    out.m_71.w = _526;
    int _2229 = abs(_876);
    float _2231 = _2090 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2233 = 1.0 / _2217;
    int _2235 = ~_1148;
    int _2237 = _2235 + 1;
    out.m_73.x = _696;
    out.m_73.y = _700;
    out.m_73.z = _698;
    out.m_73.w = _702;
    int _2239 = ~_1148;
    int _2241 = _2239 + 1;
    float _2243 = float(uint(_2221));
    float _2245 = trunc(_2225);
    int _2247 = int(_2245);
    int _2249 = ~_1148;
    int _2251 = _2249 + 1;
    int _2253 = as_type<int>(_2233) + (-2);
    float _2255 = exp2(_2231);
    int _2257 = ~_1148;
    int _2259 = _2257 + 1;
    float _2261 = as_type<float>(_2253) * _2243;
    float _2263 = trunc(_2261);
    float _2265 = precise::max(_2263, 0.0);
    uint _2268 = uint(_2265);
    float _2270 = -_2255;
    float _2272 = _2270 + 1.0;
    float _2274 = _2272 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _2276 = _2237 * int(_2268);
    int _2278 = _2276 + _2221;
    float _2280 = float(uint(_2278));
    float _2282 = as_type<float>(_2253) * _2280;
    int _2284 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2286 = _2284 != 0;
    float _2288 = trunc(_2282);
    float _2290 = precise::max(_2288, 0.0);
    uint _2292 = uint(_2290);
    bool _2294 = !_2286;
    float _2296 = _2294 ? 7.345489978790283203125 : 1.0;
    float _2298 = _2296 * _732;
    float _2300 = floor(_2298);
    int _2302 = int(_2268) + int(_2292);
    float _2304 = float(_2221);
    int _2306 = _2241 * _2302;
    int _2308 = _2306 + _2221;
    bool _2310 = _2304 >= _1220;
    bool _2312 = isnan(_2304);
    bool _2314 = _2310 || _2312;
    bool _2316 = isnan(_1220);
    bool _2318 = _2314 || _2316;
    float _2320 = float(_2318);
    int _2322 = _1148 + (-1);
    bool _2324 = uint(_2308) >= uint(_1148);
    float _2326 = -_2300;
    float _2328 = _2298 + _2326;
    float _2330 = trunc(_2320);
    int _2332 = int(_2330);
    bool _2334 = !_2324;
    int _2336 = _2334 ? 0 : (-1);
    float _2338 = _2328 * _1220;
    int _2340 = ~_2302;
    int _2342 = _2340 + _2336;
    int _2344 = _2342 + 1;
    int _2346 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2348 = _2346 != 0;
    float _2350 = trunc(_2338);
    int _2352 = int(_2350);
    int _2354 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2356 = _2354 != 0;
    int _2358 = _1148 * _2344;
    int _2360 = _2358 + _2221;
    bool _2362 = !_2348;
    int _2364 = _2362 ? 0 : 1;
    int _2366 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2368 = _2366 != 0;
    int _2370 = ~_2332;
    int _2372 = _2370 + 1;
    int _2374 = _2372 + 1;
    bool _2376 = !_2223;
    int _2378 = _2376 ? _2360 : (-1);
    int _2380 = abs(_854);
    int _2382 = abs(_2364);
    int _2384 = _2378 * _2374;
    float _2386 = in.m_75.y;
    int _2388 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2390 = _2388 != 0;
    int _2392 = _2332 * _2322;
    int _2394 = _2392 + _2384;
    int _2396 = _2352 * _2382;
    int _2398 = _2396 + _2221;
    bool _2400 = !_2368;
    int _2402 = _2400 ? 0 : 1;
    int _2404 = _2394 * _2380;
    float _2406 = in.m_75.x;
    int _2408 = abs(_2402);
    int _2410 = _2247 * _2227;
    int _2412 = _2410 + _2404;
    bool _2414 = _734 > 0.5;
    float _2416 = as_type<float>(_2404);
    float _2418 = _2386;
    if (_2356)
    {
        float _2420 = in.m_63.x;
        _2416 = _2420;
    }
    float _2422 = _2416;
    int _2424 = ~_1148;
    int _2426 = _2424 + 1;
    int _2428 = _2398 * _2229;
    int _2430 = _2428 + _2412;
    int _2432 = _2352 * _2408;
    int _2434 = _2432 + _2430;
    int _2436 = ~_1148;
    int _2438 = _2436 + 1;
    float _2440 = float(uint(_2434));
    float _2442 = as_type<float>(_2253) * _2440;
    float _2444 = trunc(_2442);
    float _2446 = precise::max(_2444, 0.0);
    uint _2448 = uint(_2446);
    float _2450 = _2406;
    if (_2356)
    {
        _530 = _2406;
    }
    float _2452 = _530;
    float _2454 = float(uint(_2398));
    int _2456 = _2438 * int(_2448);
    int _2458 = _2456 + _2434;
    float _2460 = float(uint(_2458));
    float _2462 = as_type<float>(_2253) * _2460;
    float _2464 = as_type<float>(_2253) * _2454;
    float _2466 = -_2386;
    float _2468 = _2466 + 1.0;
    float _2470 = trunc(_2462);
    float _2472 = precise::max(_2470, 0.0);
    uint _2474 = uint(_2472);
    float _2476 = _2452;
    if (_2390)
    {
        float _2478 = _2414 ? _2468 : _2386;
        _2418 = _2478;
    }
    float _2480 = _2418;
    bool _2482 = _2422 > 0.5;
    bool _2484 = _2482 && _2356;
    bool _2486 = _1346 != 0.0;
    bool _2488 = isnan(_1346);
    bool _2490 = _2486 || _2488;
    bool _2492 = isnan(0.0);
    bool _2494 = _2490 || _2492;
    float _2496 = fma(_2480, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _2498 = trunc(_2464);
    float _2500 = precise::max(_2498, 0.0);
    uint _2502 = uint(_2500);
    bool _2504 = _1344 == 0.0;
    bool _2506 = !_2494;
    bool _2508 = _2504 && _2506;
    float _2510 = -_1238;
    float _2512 = fma(_1222, _2496, _2510);
    bool _2514 = _1348 == 0.0;
    bool _2516 = _2514 && _2508;
    int _2518 = int(_2448) + int(_2474);
    if (_2484)
    {
        float _2520 = -_2452;
        float _2522 = _2520 + 1.0;
        _2476 = _2522;
    }
    float _2524 = _2476;
    float _2526 = in.m_77.x;
    float _2528 = in.m_77.y;
    float _2530 = in.m_77.z;
    int _2532 = _2251 * _2518;
    int _2534 = _2532 + _2434;
    if (_2356)
    {
        _2450 = _2524;
    }
    float _2536 = _2450;
    int _2538 = _2426 * int(_2502);
    int _2540 = _2538 + _2398;
    out.m_79.x = 1.0;
    out.m_79.y = 1.0;
    out.m_79.z = 1.0;
    bool _2542 = uint(_2534) >= uint(_1148);
    float _2544 = fma(_2536, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _2546 = float(uint(_2540));
    float _2548 = abs(_1746);
    float _2550 = log2(_2548);
    bool _2552 = !_2542;
    int _2554 = _2552 ? 0 : (-1);
    float _2556 = fma(_1236, _2544, _1218);
    float _2558 = as_type<float>(_2253) * _2546;
    int _2560 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2562 = _2560 != 0;
    int _2564 = ~_2518;
    int _2566 = _2564 + _2554;
    int _2568 = _2566 + 1;
    float _2570 = _2512 + 0.5;
    float _2572 = trunc(_2558);
    float _2574 = precise::max(_2572, 0.0);
    uint _2576 = uint(_2574);
    float _2578 = _2556 + 0.5;
    float _2580 = _1484 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2582 = _2526;
    float _2584 = _2528;
    float _2586 = _2530;
    if (!_2516)
    {
        float _2588 = fma(_1344, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2526);
        _2582 = _2588;
    }
    float _2590 = _2582;
    if (!_2516)
    {
        float _2592 = fma(_1346, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2528);
        _2584 = _2592;
    }
    float _2594 = _2584;
    out.m_81.x = _2578;
    out.m_81.y = _2570;
    float _2596 = _1508 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2598 = _2550 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _2600 = _1148 * _2568;
    int _2602 = _2600 + _2434;
    float _2604 = _1484 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    if (!_2516)
    {
        float _2606 = fma(_1348, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2530);
        _2586 = _2606;
    }
    float _2608 = _2586;
    float _2610 = exp2(_2598);
    float _2612 = _1508 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2614 = !_2223;
    int _2616 = _2614 ? _2602 : (-1);
    float _2618 = _1508 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2620 = int(_2502) + int(_2576);
    float _2622 = -_1472;
    float _2624 = fma(_2622, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2604);
    int _2626 = _2616 >> 31;
    float _2628 = _1484 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2630 = _2616 & 3;
    bool _2632 = _2630 != 0;
    float _2634 = -_1472;
    float _2636 = fma(_2634, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2580);
    int _2638 = _2626 & 3;
    int _2640 = _2259 * _2620;
    int _2642 = _2640 + _2398;
    float _2644 = -_1472;
    float _2646 = fma(_2644, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2628);
    float _2648 = fma(_1474, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2636);
    int _2650 = _2616 + _2638;
    float _2652 = _1490 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2654 = fma(_2610, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2656 = precise::clamp(_2654, 0.0, 1.0);
    float _2658 = fma(_1474, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2624);
    int _2660 = _2650 >> 2;
    float _2662 = _1490 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2664 = _1490 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2666 = uint(_2642) >= uint(_1148);
    float _2668 = fma(_1476, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2652);
    int _2670 = _2660 << 4;
    int _2672 = _2670 + 368;
    float _2674 = fma(_1476, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2662);
    float _2676 = fma(_1476, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2664);
    float _2678 = fma(_1478, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2596);
    uint _2680 = uint(int(uint(_2672) >> uint(2)));
    uint _2682 = uint(int(uint(int(_2680)) >> uint(2)));
    int _2684 = int(_2680) & 3;
    float _2686 = (*spvDescriptorSet0.vp_c9)._m0[int(_2682)][_2684];
    int _2688 = int(_2680) + 1;
    uint _2690 = uint(int(uint(_2688) >> uint(2)));
    int _2692 = _2688 & 3;
    float _2694 = (*spvDescriptorSet0.vp_c9)._m0[int(_2690)][_2692];
    float _2696 = _2648 * _2594;
    float _2698 = _2658 * _2594;
    int _2700 = _2616 & 3;
    bool _2702 = _2700 != 0;
    float _2704 = fma(_2656, -2.0, 3.0);
    float _2706 = _2656 * _2656;
    int _2708 = _2632 ? 0 : 1;
    float _2710 = fma(_1478, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2612);
    int _2712 = _2672 + 8;
    uint _2714 = uint(int(uint(_2712) >> uint(2)));
    uint _2716 = uint(int(uint(int(_2714)) >> uint(2)));
    int _2718 = int(_2714) & 3;
    float _2720 = (*spvDescriptorSet0.vp_c9)._m0[int(_2716)][_2718];
    int _2722 = int(_2714) + 1;
    uint _2724 = uint(int(uint(_2722) >> uint(2)));
    int _2726 = _2722 & 3;
    float _2728 = (*spvDescriptorSet0.vp_c9)._m0[int(_2724)][_2726];
    bool _2730 = uint(_2700) > 1u;
    float _2732 = fma(_1500, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2668);
    bool _2734 = _2700 != 3;
    float _2736 = fma(_1474, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2646);
    bool _2738 = !_2666;
    int _2740 = _2738 ? 0 : (-1);
    float _2742 = fma(_1500, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2674);
    bool _2744 = uint(_2700) >= 2u;
    float _2746 = _2736 * _2594;
    int _2748 = ~_2708;
    int _2750 = _2748 + 1;
    int _2752 = _2750 + 1;
    float _2754 = fma(_1500, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2676);
    int _2756 = ~_2620;
    int _2758 = _2756 + _2740;
    int _2760 = _2758 + 1;
    float _2762 = fma(_2742, _2590, _2698);
    bool _2764 = !_2702;
    int _2766 = _2764 ? 0 : 1;
    float _2768 = fma(_1492, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2678);
    int _2770 = _2752;
    if (!_2730)
    {
        int _2772 = ~_2708;
        int _2774 = _2772 + 1;
        _2770 = _2774;
    }
    int _2776 = _2770;
    float _2778 = fma(_2732, _2590, _2696);
    int _2780 = _2744 ? 0 : 1;
    float _2782 = _2706 * _2704;
    bool _2784 = _2700 != 3;
    float _2786 = fma(_2754, _2590, _2746);
    int _2788 = abs(_2776);
    float _2790 = fma(_2768, _2608, _2762);
    int _2792 = abs(_2766);
    float _2794 = in.m_83.x;
    int _2796 = ~_2780;
    int _2798 = _2796 + 1;
    int _2800 = _2798 + 1;
    float _2802 = fma(_1478, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2618);
    bool _2804 = !_2784;
    int _2806 = _2804 ? 0 : (-1);
    int _2808 = _1148 * _2760;
    int _2810 = _2808 + _2398;
    int _2812 = _2800;
    if (_2734)
    {
        int _2814 = ~_2780;
        int _2816 = _2814 + 1;
        _2812 = _2816;
    }
    int _2818 = _2812;
    float _2820 = fma(_1492, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2710);
    int _2822 = ~_2788;
    int _2824 = _2822 + 1;
    int _2826 = _2824 + 1;
    float _2828 = fma(_1492, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2802);
    bool _2830 = !_2562;
    int _2832 = _2830 ? 0 : 1;
    float _2834 = fma(_2820, _2608, _2778);
    int _2836 = abs(_2806);
    float _2838 = _2112 * 0.5;
    int _2840 = abs(_2818);
    float _2842 = fma(_2828, _2608, _2786);
    int _2844 = ~_2792;
    int _2846 = _2844 + 1;
    int _2848 = _2846 + 1;
    int _2850 = _2826 * as_type<int>(_2694);
    int _2852 = abs(_2832);
    float _2854 = -_2182;
    float _2856 = _2854 + 1.0;
    int _2858 = _2848 * as_type<int>(_2686);
    int _2860 = _2858 + _2850;
    int _2862 = ~_2840;
    int _2864 = _2862 + 1;
    int _2866 = _2864 + 1;
    float _2868 = _2274 * _2194;
    int _2870 = ~_2836;
    int _2872 = _2870 + 1;
    int _2874 = _2872 + 1;
    float _2876 = -_2274;
    float _2878 = _2876 + 1.0;
    int _2880 = _2866 * as_type<int>(_2720);
    int _2882 = _2880 + _2860;
    bool _2884 = _1746 <= 8000.0;
    bool _2886 = isnan(_1746);
    bool _2888 = _2884 || _2886;
    bool _2890 = isnan(8000.0);
    bool _2892 = _2888 || _2890;
    float _2894 = float(_2892);
    float _2896 = _2084 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2898 = ~_2852;
    int _2900 = _2898 + 1;
    int _2902 = _2900 + 1;
    int _2904 = _2874 * as_type<int>(_2728);
    int _2906 = _2904 + _2882;
    float _2908 = -_2782;
    float _2910 = _2908 + 1.0;
    bool _2912 = !_2223;
    int _2914 = _2912 ? _2810 : (-1);
    float _2916 = fma(_2082, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2896);
    int _2918 = _2906 * _2902;
    float _2920 = fma(_2910, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2782);
    float _2922 = _2215 * _2868;
    float _2924 = fma(_2078, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2916);
    int _2926 = _2914 * _2852;
    int _2928 = _2926 + _2918;
    float _2930 = _2894 * _2920;
    float _2932 = fma(_2164, -0.5, _2838);
    float _2934 = fma(_1900, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2924);
    float _2936 = _2930 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2938 = _2205 * _2878;
    float _2940 = fma(_2205, _2922, _2203);
    out.m_85.x = _2834;
    out.m_85.y = _2790;
    out.m_85.z = _2842;
    float _2942 = _2856 * _2936;
    float _2944 = precise::clamp(_2942, 0.0, 1.0);
    bool _2946 = _1904 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2948 = isnan(_1904);
    bool _2950 = _2946 || _2948;
    bool _2952 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2954 = _2950 || _2952;
    float _2956 = _2934 + _2112;
    out.gl_Position.x = _2160;
    out.gl_Position.y = _2164;
    out.gl_Position.z = _2934;
    out.gl_Position.w = _2112;
    float _2958 = -_2944;
    float _2960 = fma(_2958, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2962 = _2205 * _2868;
    float _2964 = _2160 + _2112;
    float _2966 = _2960 * _2794;
    float _2968 = fma(_2211, _2962, _2199);
    float _2970 = fma(_2213, _2962, _2201);
    float _2972 = _2956 * 0.5;
    float _2974 = _2966 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2976 = _2964 * 0.5;
    float _2978 = float(_2928);
    out.m_87.x = _2968;
    out.m_87.y = _2970;
    out.m_87.z = _2940;
    out.m_87.w = _2938;
    float _2980 = _1874 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2982 = _2966;
    float _2984 = _2978;
    float _2986 = _2112;
    float _2988 = _2972;
    float _2990 = _2932;
    float _2992 = _2976;
    if (!_2954)
    {
        _2982 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2994 = _2982;
    out.m_89.x = _2974;
    out.m_91.x = _2976;
    out.m_91.y = _2932;
    out.m_91.z = _2972;
    out.m_91.w = _2112;
    out.m_93.x = _2978;
    float _2996 = _2994;
    float _2998 = _2994;
    if (!_2954)
    {
        _2984 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3000 = _2984;
    float _3002 = _3000;
    float _3004 = _3000;
    if (!_2954)
    {
        _2986 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3006 = _2986;
    float _3008 = _3006;
    float _3010 = _3006;
    if (!_2954)
    {
        _2988 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3012 = _2988;
    float _3014 = _3012;
    float _3016 = _3012;
    if (!_2954)
    {
        _2990 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3018 = _2990;
    float _3020 = _3018;
    float _3022 = _3018;
    if (!_2954)
    {
        _2992 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3024 = _2992;
    bool _3026 = !_2954;
    float _3028 = _3024;
    float _3030 = _3024;
    if (!_3026)
    {
        bool _3032 = _1904 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3034 = isnan(_1904);
        bool _3036 = _3032 || _3034;
        bool _3038 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3040 = _3036 || _3038;
        if (!_3040)
        {
            float _3042 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3044 = _1904 + _3042;
            float _3046 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3048 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3046;
            float _3050 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3052 = _3050 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3054 = 1.0 / _3048;
            float _3056 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3058 = _3056 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3060 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3062 = _3060 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3064 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3066 = _3064 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3068 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3070 = _3068 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3072 = _3044 * _3054;
            float _3074 = precise::clamp(_3072, 0.0, 1.0);
            float _3076 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3078 = _3076 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3080 = fma(_3074, _3052, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3082 = fma(_3074, _3078, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3084 = fma(_3074, _3058, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3086 = fma(_3074, _3062, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3088 = fma(_3074, _3066, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3090 = fma(_3074, _3070, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3004 = _3084;
            _3022 = _3088;
            _2998 = _3080;
            _3016 = _3086;
            _3010 = _3082;
            _3030 = _3090;
            _3092 = true;
        }
        else
        {
            bool _3094 = _1904 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3096 = isnan(_1904);
            bool _3098 = _3094 || _3096;
            bool _3100 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3102 = _3098 || _3100;
            if (!_3102)
            {
                _2996 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3104 = _2996;
            _2998 = _3104;
            if (!_3102)
            {
                _3002 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3106 = _3002;
            _3004 = _3106;
            if (!_3102)
            {
                _3008 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3108 = _3008;
            _3010 = _3108;
            if (!_3102)
            {
                _3014 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3110 = _3014;
            _3016 = _3110;
            if (!_3102)
            {
                _3020 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3112 = _3020;
            _3022 = _3112;
            if (!_3102)
            {
                _3028 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3114 = _3028;
            bool _3116 = !_3102;
            _3030 = _3114;
            if (!_3116)
            {
                bool _3118 = _1904 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3120 = isnan(_1904);
                bool _3122 = _3118 || _3120;
                bool _3124 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3126 = _3122 || _3124;
                if (!_3126)
                {
                    float _3128 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3130 = _1904 + _3128;
                    float _3132 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3134 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3132;
                    float _3136 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3138 = _3136 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3140 = 1.0 / _3134;
                    float _3142 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3144 = _3142 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3146 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3148 = _3146 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3150 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3152 = _3150 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3154 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3156 = _3154 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3158 = _3130 * _3140;
                    float _3160 = precise::clamp(_3158, 0.0, 1.0);
                    float _3162 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3164 = _3162 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3166 = fma(_3160, _3138, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3168 = fma(_3160, _3164, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3170 = fma(_3160, _3144, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3172 = fma(_3160, _3148, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3174 = fma(_3160, _3152, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3176 = fma(_3160, _3156, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3004 = _3170;
                    _3022 = _3174;
                    _2998 = _3166;
                    _3016 = _3172;
                    _3010 = _3168;
                    _3030 = _3176;
                    _3092 = true;
                }
                else
                {
                    _3004 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3022 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2998 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3016 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3010 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3030 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3092 = false;
    float _3178 = _3004;
    float _3180 = _3022;
    float _3182 = _2998;
    float _3184 = _3016;
    float _3186 = _3010;
    float _3188 = _3030;
    float _3190 = fma(_2790, -0.5, 0.5);
    float _3192 = precise::clamp(_3190, 0.0, 1.0);
    float _3194 = -_3178;
    float _3196 = _3194 + _3180;
    float _3198 = _2980 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3200 = -_3182;
    float _3202 = _3200 + _3184;
    float _3204 = fma(_3192, _3196, _3178);
    out.m_95.x = 0.0;
    float _3206 = -_3186;
    float _3208 = _3206 + _3188;
    float _3210 = fma(_3192, _3202, _3182);
    float _3212 = _3204 * 0.586610972881317138671875;
    out.m_53.x = _3198;
    bool _3214 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3216 = fma(_3192, _3208, _3186);
    float _3218 = fma(_3210, 0.298911988735198974609375, _3212);
    bool _3220 = _1874 > 0.0;
    bool _3222 = isnan(_1874);
    bool _3224 = _3220 || _3222;
    bool _3226 = isnan(0.0);
    bool _3228 = _3224 || _3226;
    float _3230 = fma(_3216, 0.114477999508380889892578125, _3218);
    float _3232 = -_3230;
    float _3234 = _3210 + _3232;
    float _3236 = -_3230;
    float _3238 = _3204 + _3236;
    float _3240 = -_3230;
    float _3242 = _3216 + _3240;
    float _3244 = fma(_3234, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3230);
    float _3246 = fma(_3238, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3230);
    float _3248 = fma(_3242, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3230);
    bool _3250 = !_3214;
    if (!_3250)
    {
        float _3252 = -_1808;
        float _3254 = _3252 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3256 = -_1810;
        float _3258 = _3256 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3260 = -_1812;
        float _3262 = _3260 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3264 = _3254 * _3254;
        float _3266 = fma(_3258, _3258, _3264);
        float _3268 = fma(_3262, _3262, _3266);
        float _3270 = sqrt(_3268);
        float _3272 = rsqrt(_3268);
        float _3274 = -_3270;
        float _3276 = _3274 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3278 = _3276 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3280 = precise::clamp(_3278, 0.0, 1.0);
        float _3282 = _3258 * _3272;
        float _3284 = _3254 * _3272;
        float _3286 = abs(_3280);
        float _3288 = log2(_3286);
        float _3290 = _3262 * _3272;
        float _3292 = _3282 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3294 = _2790 * _3284;
        float _3296 = -_3284;
        float _3298 = -_3292;
        float _3300 = fma(_3296, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3298);
        float _3302 = fma(_2834, _3282, _3294);
        float _3304 = -_3290;
        float _3306 = fma(_3304, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3300);
        float _3308 = fma(_2842, _3290, _3302);
        float _3310 = precise::clamp(_3308, 0.0, 1.0);
        float _3312 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3314 = _3306 + _3312;
        float _3316 = _3288 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3318 = _3314 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3320 = precise::clamp(_3318, 0.0, 1.0);
        float _3322 = exp2(_3316);
        float _3324 = _3322 * _3320;
        float _3326 = _3310 * _3324;
        float _3328 = _3326 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3330 = _3326 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3332 = _3326 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_95.x = _3328;
        out.m_95.y = _3330;
        out.m_95.z = _3332;
    }
    out.m_97.x = _3244;
    out.m_97.y = _3246;
    out.m_97.z = _3248;
    if (_3228)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_53.x = 0.0;
    float _3334 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3334;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

