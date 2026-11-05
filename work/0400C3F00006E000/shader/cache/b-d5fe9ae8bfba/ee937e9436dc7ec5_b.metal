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
    constant _16* vp_c7 [[id(4)]];
    constant _16* vp_c13 [[id(5)]];
    texture3d<float> vp_t_tcb_32 [[id(6)]];
    sampler vp_t_tcb_32Smplr [[id(7)]];
    texture3d<float> vp_t_tcb_30 [[id(8)]];
    sampler vp_t_tcb_30Smplr [[id(9)]];
    texture2d<float> vp_t_tcb_1C [[id(10)]];
    sampler vp_t_tcb_1CSmplr [[id(11)]];
    sampler vp_t_tcb_32Smplr_w [[id(12)]];
    sampler vp_t_tcb_30Smplr_w [[id(13)]];
    sampler vp_t_tcb_1CSmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_77 [[user(locn0)]];
    float4 m_89 [[user(locn2)]];
    float4 m_79 [[user(locn3)]];
    float4 m_75 [[user(locn4)]];
    float4 m_83 [[user(locn5)]];
    float4 m_47 [[user(locn6)]];
    float4 m_71 [[user(locn7)]];
    float4 m_81 [[user(locn8)]];
    float4 m_87 [[user(locn9)]];
    float4 m_85 [[user(locn10)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_53 [[attribute(1)]];
    float4 m_55 [[attribute(2)]];
    float4 m_57 [[attribute(3)]];
    float4 m_63 [[attribute(4)]];
    float4 m_51 [[attribute(5)]];
    float4 m_44 [[attribute(6)]];
    float4 m_49 [[attribute(7)]];
    float4 m_73 [[attribute(8)]];
    float4 m_65 [[attribute(9)]];
    float4 m_59 [[attribute(10)]];
    float4 m_61 [[attribute(11)]];
    float4 m_69 [[attribute(12)]];
    float4 m_67 [[attribute(13)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2753 = false;
    bool _524 = false;
    bool _344 = false;
    bool _230 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _103 = in.m_44.w;
    float _105 = trunc(_103);
    int _108 = int(_105);
    bool _112 = _108 >= 1;
    float _114 = 0.0;
    if (!_112)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _116 = _114;
    float _118 = _116;
    if (!_112)
    {
        out.m_47.x = 0.0;
    }
    int _120 = 0;
    if (!_112)
    {
        float _122 = _116 * 5.0;
        _120 = as_type<int>(_122);
    }
    int _124 = _120;
    int _126 = _124;
    if (!_112)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3058 = as_type<float>(_124);
        out.gl_Position.z = _3058;
    }
    if (!_112)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _128 = in.m_49.w;
    bool _130 = _128 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _132 = isnan(_128);
    bool _134 = _130 || _132;
    bool _136 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _138 = _134 || _136;
    float _140 = -_128;
    float _142 = _140 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _144 = 0.0;
    float _146 = _142;
    if (_138)
    {
        float _148 = float(_108);
        _144 = _148;
    }
    float _150 = _144;
    bool _152 = _142 >= _150;
    bool _154 = !_138;
    bool _156 = _152 || _154;
    if (_156)
    {
        _118 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _158 = _118;
    if (_156)
    {
        out.m_47.x = 0.0;
    }
    if (_156)
    {
        float _160 = _158 * 5.0;
        _126 = as_type<int>(_160);
    }
    int _162 = _126;
    if (_156)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3127 = as_type<float>(_162);
        out.gl_Position.z = _3127;
    }
    if (_156)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _164 = in.m_51.x;
    float _166 = in.m_51.y;
    float _168 = in.m_51.z;
    bool _170 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _172 = in.m_53.x;
    float _174 = in.m_53.y;
    float _176 = in.m_53.z;
    float _178 = in.m_55.x;
    float _180 = in.m_55.y;
    float _182 = in.m_55.z;
    float _184 = in.m_57.x;
    float _186 = in.m_57.y;
    float _188 = in.m_57.z;
    float _190 = _166 * _174;
    float _192 = _166 * _180;
    float _194 = fma(_164, _172, _190);
    float _196 = _166 * _186;
    float _198 = fma(_164, _178, _192);
    float _200 = fma(_168, _176, _194);
    float _202 = fma(_164, _184, _196);
    float _204 = fma(_168, _182, _198);
    float _206 = fma(_168, _188, _202);
    bool _208 = !_170;
    float _210 = _176;
    float _228;
    if (!_208)
    {
        float _212 = in.m_59.x;
        float _214 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _216 = _212 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _218 = fma(_216, (*spvDescriptorSet0.vp_c9)._m0[12].x, _142);
        float _220 = _218 * _214;
        float _222 = floor(_220);
        float _224 = -_222;
        float _226 = _220 + _224;
        _228 = _226;
        _230 = true;
    }
    else
    {
        float _232 = float(_108);
        float _234 = 1.0 / _232;
        float _236 = _142 * _234;
        _228 = _236;
    }
    _230 = false;
    float _238 = _228;
    float _240 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _242 = _238 + _240;
    bool _244 = _238 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _246 = isnan(_238);
    bool _248 = _244 || _246;
    bool _250 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _252 = _248 || _250;
    float _254 = float(_252);
    float _256 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _258 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _256;
    bool _260 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _262 = 1.0 / _258;
    float _264 = -_254;
    float _266 = _264 + 1.0;
    float _268 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _270 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _268;
    float _272 = _242 * _262;
    bool _274 = _238 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _276 = isnan(_238);
    bool _278 = _274 || _276;
    bool _280 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _282 = _278 || _280;
    float _284 = float(_282);
    float _286 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _288 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _286;
    float _290 = fma(_270, _272, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _292 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _294 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _292;
    float _296 = _284 * _266;
    float _298 = fma(_288, _272, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _300 = fma(_294, _272, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _302 = -_284;
    float _304 = _302 + 1.0;
    float _306 = _290 * _296;
    float _308 = _298 * _296;
    float _310 = _300 * _296;
    float _312 = fma(_304, (*spvDescriptorSet0.vp_c9)._m0[143].z, _306);
    float _314 = fma(_304, (*spvDescriptorSet0.vp_c9)._m0[143].x, _308);
    float _316 = fma(_304, (*spvDescriptorSet0.vp_c9)._m0[143].y, _310);
    float _318 = fma(_254, (*spvDescriptorSet0.vp_c9)._m0[144].z, _312);
    float _320 = fma(_254, (*spvDescriptorSet0.vp_c9)._m0[144].x, _314);
    float _322 = fma(_254, (*spvDescriptorSet0.vp_c9)._m0[144].y, _316);
    bool _324 = !_260;
    float _342;
    if (!_324)
    {
        float _326 = in.m_59.x;
        float _328 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _330 = _326 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _332 = fma(_330, (*spvDescriptorSet0.vp_c9)._m0[11].x, _142);
        float _334 = _332 * _328;
        float _336 = floor(_334);
        float _338 = -_336;
        float _340 = _334 + _338;
        _342 = _340;
        _344 = true;
    }
    else
    {
        float _346 = float(_108);
        float _348 = 1.0 / _346;
        float _350 = _142 * _348;
        _342 = _350;
    }
    _344 = false;
    float _352 = _342;
    float _354 = in.m_61.x;
    float _356 = in.m_61.y;
    float _358 = in.m_61.z;
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _362 = _352 + _360;
    bool _364 = _352 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _366 = isnan(_352);
    bool _368 = _364 || _366;
    bool _370 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _372 = _368 || _370;
    float _374 = float(_372);
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _378 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _376;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _382 = _380 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _384 = 1.0 / _378;
    bool _386 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _388 = 1.0 / _382;
    float _390 = -_374;
    float _392 = _390 + 1.0;
    float _394 = _318 * _358;
    float _396 = _362 * _384;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _400 = _352 + _398;
    bool _402 = _352 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _404 = isnan(_352);
    bool _406 = _402 || _404;
    bool _408 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _410 = _406 || _408;
    float _412 = float(_410);
    float _414 = _322 * _356;
    bool _416 = _352 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _418 = isnan(_352);
    bool _420 = _416 || _418;
    bool _422 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _424 = _420 || _422;
    float _426 = float(_424);
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _430 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _428;
    float _432 = _320 * _354;
    float _434 = _400 * _388;
    float _436 = _426 * _392;
    float _438 = -_426;
    float _440 = _438 + 1.0;
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _444 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _442;
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _448 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _446;
    float _450 = fma(_430, _396, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _452 = _412 * _440;
    float _454 = fma(_444, _396, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _456 = fma(_448, _396, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _458 = -_412;
    float _460 = _458 + 1.0;
    float _462 = _450 * _452;
    float _464 = _454 * _452;
    float _466 = _456 * _452;
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _470 = _468 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _474 = _472 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _478 = _476 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _480 = fma(_460, (*spvDescriptorSet0.vp_c9)._m0[107].x, _464);
    float _482 = fma(_460, (*spvDescriptorSet0.vp_c9)._m0[107].y, _466);
    float _484 = fma(_470, _434, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _486 = fma(_474, _434, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _488 = fma(_478, _434, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _490 = fma(_460, (*spvDescriptorSet0.vp_c9)._m0[107].z, _462);
    float _492 = fma(_484, _436, _480);
    float _494 = fma(_486, _436, _482);
    float _496 = fma(_488, _436, _490);
    float _498 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[109].x, _492);
    float _500 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[109].y, _494);
    float _502 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[109].z, _496);
    bool _504 = !_386;
    float _522;
    if (!_504)
    {
        float _506 = in.m_59.x;
        float _508 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _510 = _506 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _512 = fma(_510, (*spvDescriptorSet0.vp_c9)._m0[11].y, _142);
        float _514 = _512 * _508;
        float _516 = floor(_514);
        float _518 = -_516;
        float _520 = _514 + _518;
        _522 = _520;
        _524 = true;
    }
    else
    {
        float _526 = float(_108);
        float _528 = 1.0 / _526;
        float _530 = _142 * _528;
        _522 = _530;
    }
    _524 = false;
    float _532 = _522;
    float _534 = in.m_44.x;
    float _536 = in.m_44.y;
    float _538 = in.m_44.z;
    float _540 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _542 = log2(_540);
    float _544 = in.m_59.z;
    int _546 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _548 = _546 != 0;
    float _550 = _414 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _552 = in.m_59.x;
    int _554 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _556 = _554 != 0;
    int _558 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _560 = _558 != 0;
    int _562 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _564 = _562 != 0;
    float _566 = _432 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _568 = _394 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _570 = in.m_59.y;
    float _572 = in.m_57.w;
    float _574 = _542 * _142;
    float _576 = _174 * _536;
    float _578 = _180 * _536;
    float _580 = _186 * _536;
    float _582 = fma(_172, _534, _576);
    float _584 = fma(_178, _534, _578);
    float _586 = fma(_184, _534, _580);
    float _588 = _544 * 2.0;
    float _590 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _592 = _552 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _594 = fma(_176, _538, _582);
    float _596 = _570 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _598 = -_590;
    float _600 = fma(_592, 2.0, _598);
    float _602 = floor(_588);
    float _604 = _570 + _544;
    float _606 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _608 = _552 * 2.0;
    float _610 = _604 + (-1.0);
    float _612 = fma(_596, -2.0, _606);
    float _614 = fma(_182, _538, _584);
    float _616 = floor(_608);
    float _618 = fma(_188, _538, _586);
    float _620 = fma(_610, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _622 = _552 + _570;
    float _624 = _570 * 2.0;
    float _626 = in.m_55.w;
    float _628 = _608;
    if (!_548)
    {
        _210 = _570;
    }
    float _630 = _210;
    float _632 = _622 + (-1.0);
    float _634 = floor(_624);
    bool _636 = _602 > 0.0;
    float _638 = in.m_53.w;
    bool _640 = _602 >= 0.0;
    bool _642 = isnan(_602);
    bool _644 = _640 || _642;
    bool _646 = isnan(0.0);
    bool _648 = _644 || _646;
    float _650 = fma(_632, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _652 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[76].y, _612);
    float _654 = _632;
    float _656 = _630;
    if (!_548)
    {
        _628 = _544;
    }
    float _658 = _628;
    float _660 = exp2(_574);
    float _662 = _658;
    if (!_548)
    {
        _654 = _544;
    }
    float _664 = _654;
    float _666 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _668 = _664;
    if (_548)
    {
        _656 = _552;
    }
    float _670 = _656;
    if (_548)
    {
        _662 = _570;
    }
    float _672 = _662;
    if (_548)
    {
        _668 = _570;
    }
    float _674 = _668;
    bool _676 = _616 > 0.0;
    float _678 = _672 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _680 = _616 >= 0.0;
    bool _682 = isnan(_616);
    bool _684 = _680 || _682;
    bool _686 = isnan(0.0);
    bool _688 = _684 || _686;
    float _690 = fma(_674, (*spvDescriptorSet0.vp_c9)._m0[83].w, _666);
    float _692 = _614 + _626;
    float _694 = _618 + _572;
    int _696 = _648 ? 0 : 1;
    float _698 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _700 = _634 > 0.0;
    float _702 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _704 = float(_108);
    float _706 = fma(_670, (*spvDescriptorSet0.vp_c9)._m0[83].z, _698);
    float _708 = _670 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _710 = 1.0 / _704;
    int _712 = _688 ? 0 : 1;
    float _714 = -_702;
    float _716 = fma(_708, 2.0, _714);
    bool _718 = _634 >= 0.0;
    bool _720 = isnan(_634);
    bool _722 = _718 || _720;
    bool _724 = isnan(0.0);
    bool _726 = _722 || _724;
    float _728 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _730 = _594 + _638;
    float _732 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[82].w, _690);
    int _734 = _726 ? 0 : 1;
    float _736 = fma(_678, -2.0, _728);
    float _738 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _740 = 1.0 + _738;
    int _742 = ~_734;
    int _744 = _742 + 1;
    int _746 = _744 + 1;
    float _748 = -_660;
    float _750 = _748 + 1.0;
    int _752 = _746;
    if (!_700)
    {
        int _754 = ~_734;
        int _756 = _754 + 1;
        _752 = _756;
    }
    int _758 = _752;
    float _760 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _762 = in.m_63.x;
    float _764 = in.m_63.y;
    float _766 = in.m_63.z;
    float _768 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[82].z, _706);
    float _770 = fma(_570, (*spvDescriptorSet0.vp_c9)._m0[78].w, _760);
    bool _772 = !_556;
    int _774 = _772 ? 0 : 1;
    float _776 = _710 * _142;
    int _778 = ~_696;
    int _780 = _778 + 1;
    int _782 = _780 + 1;
    float _784 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _786 = _782;
    if (!_636)
    {
        int _788 = ~_696;
        int _790 = _788 + 1;
        _786 = _790;
    }
    int _792 = _786;
    float _794 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[77].w, _770);
    int _796 = abs(_774);
    float _798 = fma(_552, (*spvDescriptorSet0.vp_c9)._m0[78].z, _784);
    int _800 = ~_712;
    int _802 = _800 + 1;
    int _804 = _802 + 1;
    int _806 = _804;
    if (!_676)
    {
        int _808 = ~_712;
        int _810 = _808 + 1;
        _806 = _810;
    }
    int _812 = _806;
    float _814 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[77].z, _798);
    float _816 = 1.0 / _740;
    float _818 = float(_792);
    float _820 = -_142;
    float _822 = fma(_820, (*spvDescriptorSet0.vp_c9)._m0[76].x, _600);
    bool _824 = !_560;
    int _826 = _824 ? 0 : 1;
    float _828 = -_730;
    float _830 = _828 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    bool _832 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _834 = isnan(1.0);
    bool _836 = _832 || _834;
    bool _838 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _840 = _836 || _838;
    int _842 = abs(_826);
    float _844 = -_694;
    float _846 = _844 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _848 = float(_796);
    float _850 = -_142;
    float _852 = fma(_850, (*spvDescriptorSet0.vp_c9)._m0[81].x, _716);
    bool _854 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _856 = isnan(0.0);
    bool _858 = _854 || _856;
    bool _860 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _862 = _858 || _860;
    float _864 = -_692;
    float _866 = _864 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _868 = float(_842);
    float _870 = _848 * _818;
    float _872 = float(_812);
    float _874 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[81].y, _736);
    float _876 = _862 ? _750 : 0.0;
    float _878 = _870 * (-2.0);
    float _880 = _552 + (-0.5);
    float _882 = _868 * _872;
    float _884 = float(_758);
    float _886 = fma(_878, _762, _762);
    bool _888 = !_564;
    int _890 = _888 ? 0 : 1;
    if (_840)
    {
        float _892 = _876 * _816;
        _146 = _892;
    }
    float _894 = _146;
    float _896 = _866 * _866;
    float _898 = fma(_650, _878, _650);
    int _900 = abs(_890);
    float _902 = _882 * (-2.0);
    float _904 = fma(_830, _830, _896);
    float _906 = fma(_880, (*spvDescriptorSet0.vp_c9)._m0[196].x, _886);
    float _908 = fma(_620, _902, _620);
    float _910 = fma(_902, _764, _764);
    float _912 = _570 + (-0.5);
    float _914 = fma(_846, _846, _904);
    float _916 = float(_900);
    float _918 = fma(_898, _894, _906);
    float _920 = fma(_912, (*spvDescriptorSet0.vp_c9)._m0[196].y, _910);
    float _922 = _552 + _544;
    float _924 = _916 * _884;
    float _926 = rsqrt(_914);
    float _928 = fma(_908, _894, _920);
    float _930 = _922 + (-1.0);
    float _932 = _924 * (-2.0);
    float _934 = _918 * 0.15915493667125701904296875;
    float _936 = _928 * 0.15915493667125701904296875;
    float _938 = fma(_930, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _940 = fma(_932, _766, _766);
    float _942 = _544 + (-0.5);
    float _944 = _934 * 6.283185482025146484375;
    float _946 = sin(_944);
    float _948 = fma(_938, _932, _938);
    float _950 = fma(_942, (*spvDescriptorSet0.vp_c9)._m0[196].z, _940);
    float _952 = in.m_65.x;
    float _954 = in.m_65.y;
    float _956 = in.m_65.z;
    float _958 = fma(_948, _894, _950);
    float _960 = _830 * _926;
    float _962 = _846 * _926;
    float _964 = _866 * _926;
    float _966 = _958 * 0.15915493667125701904296875;
    float _968 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _970 = _960 * _968;
    float _972 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _974 = _962 * _972;
    float _976 = _934 * 6.283185482025146484375;
    float _978 = cos(_976);
    float _980 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _982 = -_970;
    float _984 = fma(_962, _980, _982);
    float _986 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _988 = -_974;
    float _990 = fma(_964, _986, _988);
    float _992 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _994 = _964 * _992;
    float _996 = _984 * _984;
    float _998 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1000 = -_994;
    float _1002 = fma(_960, _998, _1000);
    float _1004 = _936 * 6.283185482025146484375;
    float _1006 = sin(_1004);
    float _1008 = fma(_990, _990, _996);
    float _1010 = fma(_1002, _1002, _1008);
    float _1012 = _936 * 6.283185482025146484375;
    float _1014 = cos(_1012);
    float _1016 = _966 * 6.283185482025146484375;
    float _1018 = cos(_1016);
    float _1020 = _946 * _1006;
    float _1022 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _954);
    float _1024 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _952);
    float _1026 = _966 * 6.283185482025146484375;
    float _1028 = sin(_1026);
    float _1030 = _946 * _1014;
    float _1032 = _550 * _1022;
    float _1034 = _566 * _1024;
    float _1036 = _978 * _1006;
    float _1038 = _978 * _1014;
    float _1040 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _956);
    float _1042 = rsqrt(_1010);
    float _1044 = _978 * _1018;
    float _1046 = _946 * _1018;
    float _1048 = _1014 * _1018;
    float _1050 = _1006 * _1018;
    float _1052 = _568 * _1040;
    float _1054 = -_1036;
    float _1056 = fma(_1028, _1030, _1054);
    float _1058 = -_1030;
    float _1060 = fma(_1028, _1036, _1058);
    float _1062 = fma(_1028, _1038, _1020);
    float _1064 = _1044 * _1032;
    float _1066 = -_1032;
    float _1068 = _1028 * _1066;
    float _1070 = fma(_1028, _1020, _1038);
    float _1072 = _1046 * _1032;
    float _1074 = fma(_1062, _1034, _1064);
    float _1076 = _990 * _1042;
    float _1078 = _984 * _1042;
    float _1080 = fma(_1048, _1034, _1068);
    float _1082 = _1002 * _1042;
    float _1084 = _964 * _1076;
    float _1086 = _962 * _1078;
    float _1088 = fma(_1060, _1052, _1074);
    float _1090 = fma(_1056, _1034, _1072);
    float _1092 = -_1084;
    float _1094 = fma(_960, _1078, _1092);
    float _1096 = -_1086;
    float _1098 = fma(_964, _1082, _1096);
    float _1100 = fma(_1050, _1052, _1080);
    float _1102 = fma(_1070, _1052, _1090);
    float _1104 = _1094 * _1088;
    float _1106 = _1098 * _1088;
    float _1108 = _960 * _1082;
    float _1110 = fma(_1082, _1100, _1104);
    float _1112 = fma(_1076, _1100, _1106);
    float _1114 = -_1108;
    float _1116 = fma(_962, _1076, _1114);
    float _1118 = fma(_962, _1102, _1110);
    float _1120 = fma(_960, _1102, _1112);
    float _1122 = _1116 * _1088;
    float _1124 = _694 + _1118;
    float _1126 = _730 + _1120;
    float _1128 = fma(_1078, _1100, _1122);
    float _1130 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1132 = _1124 + _1130;
    float _1134 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1136 = _1126 + _1134;
    float _1138 = fma(_964, _1102, _1128);
    float _1140 = _1132 * _1132;
    float _1142 = _692 + _1138;
    float _1144 = fma(_1136, _1136, _1140);
    float _1146 = sqrt(_1144);
    bool _1148 = _1146 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1150 = _1104;
    float _1152 = _1126;
    float _1154 = _1124;
    float _1156 = _1100;
    float _1158 = _954;
    float _1160 = _952;
    if (!_1148)
    {
        _1150 = _1142;
    }
    float _1162 = _1150;
    bool _1164 = !_1148;
    float _1166 = _1162;
    if (!_1164)
    {
        float _1168 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1170 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1172 = _1146 + _1170;
        float _1174 = rsqrt(_1144);
        float _1176 = _1172 * _1168;
        float _1178 = _1142 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1180 = _1176 * 0.15915493667125701904296875;
        float _1182 = _1180 * 6.283185482025146484375;
        float _1184 = cos(_1182);
        float _1186 = _1180 * 6.283185482025146484375;
        float _1188 = sin(_1186);
        float _1190 = _1184 + (-1.0);
        float _1192 = fma(_1188, _1178, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1194 = _1190 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1196 = _1174 * _1192;
        float _1198 = fma(_1142, _1184, _1194);
        float _1200 = fma(_1136, _1196, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1202 = fma(_1132, _1196, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1166 = _1198;
        _1152 = _1200;
        _1154 = _1202;
        _1156 = _1190;
    }
    float _1204 = _1166;
    float _1206 = _1152;
    float _1208 = _1154;
    float _1210 = _1156;
    float _1212 = -_692;
    float _1214 = _1212 + _1204;
    float _1216 = -_730;
    float _1218 = _1216 + _1206;
    float _1220 = -_694;
    float _1222 = _1220 + _1208;
    float _1224 = _1214 * _1214;
    bool _1226 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1228 = isnan(0.5);
    bool _1230 = _1226 || _1228;
    bool _1232 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1234 = _1230 || _1232;
    float _1236 = fma(_1218, _1218, _1224);
    float _1238 = fma(_1222, _1222, _1236);
    float _1240 = sqrt(_1238);
    bool _1242 = _1240 > 0.0;
    bool _1244 = !_1242;
    float _1246 = _1206;
    float _1248 = _1204;
    float _1250 = _1208;
    float _1252 = _1210;
    if (!_1244)
    {
        float _1254 = _204 * _204;
        float _1256 = fma(_200, _200, _1254);
        float _1258 = fma(_206, _206, _1256);
        float _1260 = rsqrt(_1238);
        float _1262 = sqrt(_1258);
        float _1264 = _1218 * _1260;
        float _1266 = _1214 * _1260;
        float _1268 = _1222 * _1260;
        bool _1270 = _1262 > 0.0;
        bool _1272 = !_1270;
        _1252 = _1258;
        if (!_1272)
        {
            float _1274 = rsqrt(_1258);
            float _1276 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1278 = _204 * _1274;
            float _1280 = _200 * _1274;
            float _1282 = _1266 * _1278;
            float _1284 = _206 * _1274;
            float _1286 = fma(_1264, _1280, _1282);
            float _1288 = _1276 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1290 = fma(_1268, _1284, _1286);
            float _1292 = _1290 * _1288;
            float _1294 = fma(_200, _1292, _1206);
            float _1296 = fma(_204, _1292, _1204);
            float _1298 = fma(_206, _1292, _1208);
            _1246 = _1294;
            _1248 = _1296;
            _1250 = _1298;
            _1252 = _1274;
        }
    }
    float _1300 = _1246;
    float _1302 = _1248;
    float _1304 = _1250;
    float _1306 = _1252;
    float _1308 = _1302;
    float _1310 = _1300;
    float _1312 = _1304;
    if (!_1234)
    {
        float _1314 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1316 = _692 + _1314;
        float _1318 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1320 = _730 + _1318;
        float _1322 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1324 = -_730;
        float _1326 = _1324 + _1300;
        float _1328 = _1316 * _1316;
        float _1330 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1332 = _694 + _1330;
        float _1334 = fma(_1320, _1320, _1328);
        float _1336 = fma(_1332, _1332, _1334);
        float _1338 = sqrt(_1336);
        float _1340 = precise::min(_1338, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1342 = _1340 * _1322;
        float _1344 = -_692;
        float _1346 = _1344 + _1302;
        float _1348 = -_694;
        float _1350 = _1348 + _1304;
        float _1352 = fma(_1326, _1342, _730);
        float _1354 = fma(_1346, _1342, _692);
        float _1356 = fma(_1350, _1342, _694);
        _1308 = _1354;
        _1310 = _1352;
        _1312 = _1356;
    }
    float _1358 = _1308;
    float _1360 = _1310;
    float _1362 = _1312;
    float _1364 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1366 = _1358 + _1364;
    float _1368 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1370 = _1360 + _1368;
    float _1372 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1374 = _1362 + _1372;
    float _1376 = _1366 * _1366;
    float _1378 = fma(_1370, _1370, _1376);
    float _1380 = fma(_1374, _1374, _1378);
    float _1382 = rsqrt(_1380);
    float _1384 = sqrt(_1380);
    float _1386 = _1382 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1388 = _1370 * _1386;
    float _1390 = _1374 * _1386;
    float _1392 = _1388 * _1388;
    float _1394 = _1390 * _1390;
    float _1396 = _1392 + _1394;
    float _1398 = sqrt(_1396);
    bool _1400 = _1398 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1402 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1404 = _1398 + _1402;
    float _1406 = _1374;
    float _1408 = _1382;
    float _1410 = _1404;
    float _1412 = _1376;
    float _1414 = _1366;
    if (_1400)
    {
        float _1416 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1406 = _1416;
    }
    float _1418 = _1406;
    if (_1400)
    {
        float _1420 = rsqrt(_1396);
        _1408 = _1420;
    }
    float _1422 = _1408;
    float _1424 = _1422;
    if (_1400)
    {
        float _1426 = _1404 * _1418;
        _1410 = _1426;
    }
    float _1428 = _1410;
    if (_1400)
    {
        float _1430 = _1428 * 0.15915493667125701904296875;
        _1412 = _1430;
    }
    float _1432 = _1412;
    float _1434 = _1418;
    float _1436 = _1432;
    if (_1400)
    {
        float _1438 = _1432 * 6.283185482025146484375;
        float _1440 = sin(_1438);
        _1434 = _1440;
    }
    float _1442 = _1434;
    float _1444 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1446 = precise::max(0.0, _1444);
    float _1448 = _1306;
    float _1450 = _1446;
    if (_1400)
    {
        float _1452 = _1432 * 6.283185482025146484375;
        float _1454 = cos(_1452);
        _1448 = _1454;
    }
    float _1456 = _1448;
    float _1458 = -_1386;
    float _1460 = -_1446;
    float _1462 = fma(_1366, _1458, _1460);
    if (_1400)
    {
        float _1464 = _1462 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1450 = _1464;
    }
    float _1466 = _1450;
    float _1468 = _1442;
    float _1470 = _1466;
    if (_1400)
    {
        float _1472 = fma(_1442, _1466, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1414 = _1472;
    }
    float _1474 = _1414;
    float _1476 = _1474;
    if (!_1400)
    {
        _1468 = _1388;
    }
    float _1478 = _1468;
    float _1480 = _1478;
    float _1482 = _1456;
    if (_1400)
    {
        float _1484 = _1456 + (-1.0);
        _1470 = _1484;
    }
    float _1486 = _1470;
    float _1488 = 0.0;
    float _1490 = _1486;
    if (_1400)
    {
        float _1492 = _1422 * _1474;
        _1488 = _1492;
    }
    float _1494 = _1488;
    if (!_1400)
    {
        _1476 = _1462;
    }
    float _1496 = _1476;
    float _1498 = _1496;
    if (_1400)
    {
        float _1500 = _1486 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1436 = _1500;
    }
    float _1502 = _1436;
    if (_1400)
    {
        float _1504 = _1388 * _1494;
        _1480 = _1504;
    }
    float _1506 = _1480;
    if (!_1400)
    {
        _1490 = _1390;
    }
    float _1508 = _1490;
    float _1510 = _1508;
    if (_1400)
    {
        float _1512 = _1390 * _1494;
        _1510 = _1512;
    }
    float _1514 = _1510;
    if (!_1400)
    {
        _1424 = _1392;
    }
    float _1516 = _1424;
    float _1518 = _1516;
    if (_1400)
    {
        float _1520 = fma(_1462, _1456, _1502);
        _1498 = _1520;
    }
    float _1522 = _1498;
    if (_1400)
    {
        float _1524 = _1506 * _1506;
        _1518 = _1524;
    }
    float _1526 = _1518;
    if (!_1400)
    {
        _1482 = _1394;
    }
    float _1528 = _1482;
    float _1530 = _1528;
    if (_1400)
    {
        float _1532 = _1514 * _1514;
        _1530 = _1532;
    }
    float _1534 = _1530;
    float _1536 = fma(_1522, _1522, _1526);
    float _1538 = _1358 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1540 = _1358 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1542 = _1358 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1544 = _1536 + _1534;
    float _1546 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1548 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1550 = fma(_1384, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1548);
    float _1552 = precise::clamp(_1550, 0.0, 1.0);
    float _1554 = _1358 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1556 = rsqrt(_1544);
    float _1558 = fma(_1360, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1538);
    float _1560 = -_1552;
    float _1562 = _1560 + 1.0;
    float _1564 = fma(_1360, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1540);
    float _1566 = fma(_1360, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1554);
    float _1568 = fma(_1362, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1558);
    float _1570 = fma(_1360, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1542);
    float _1572 = fma(_1362, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1564);
    float _1574 = abs(_1562);
    float _1576 = log2(_1574);
    float _1578 = fma(_1362, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1566);
    float _1580 = _1568 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1582 = _1572 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1584 = fma(_1362, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1570);
    float _1586 = _1578 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1588 = _1580 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1590 = _1556 * _1506;
    float _1592 = _1586 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1594 = -_1588;
    float _1596 = fma(_1594, _1546, 1.0);
    float _1598 = _1556 * _1522;
    float _1600 = _1590 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1602 = fma(_1582, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1592);
    float _1604 = _1556 * _1514;
    float _1606 = _1584 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1608 = -_1600;
    float _1610 = fma(_1598, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1608);
    float _1612 = _1576 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1614 = fma(_1580, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1602);
    float _1616 = log2(_1596);
    float _1618 = -_1604;
    float _1620 = fma(_1618, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1610);
    float _1622 = _1586 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1624 = fma(_1606, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1614);
    float _1626 = _1586 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1628 = fma(_1620, -0.5, 0.5);
    float _1630 = fma(_1620, 0.5, 0.5);
    float _1632 = fma(_1582, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1622);
    float _1634 = exp2(_1612);
    float _1636 = fma(_1582, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1626);
    float _1638 = fma(_1630, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1640 = _1598 + 1.0;
    float _1642 = fma(_1580, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1632);
    float _1644 = fma(_1580, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1636);
    float _1646 = fma(_1630, _1638, -0.212114393711090087890625);
    float _1648 = 1.0 / _1624;
    float _1650 = fma(_1630, _1646, 1.570728778839111328125);
    float _1652 = sqrt(_1628);
    float _1654 = -_1598;
    float _1656 = fma(_1634, _1640, _1654);
    float _1658 = fma(_1606, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1642);
    float _1660 = fma(_1606, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1644);
    float _1662 = _1616 * 0.693147182464599609375;
    float _1664 = _1658 * _1648;
    float _1666 = _1660 * _1648;
    float _1668 = _1662 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1670 = fma(_1664, 0.5, 0.5);
    float _1672 = fma(_1666, -0.5, 0.5);
    float _1674 = _1652 * 0.636619746685028076171875;
    float3 _5482 = float3(_1670, _1672, _1668);
    float _1676 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5482, float3(0.0), isnan(_5482)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5482, float3(0.0), isnan(_5482)), level(0.0)).x;
    float _1678 = -_1650;
    float _1680 = fma(_1674, _1678, 1.0);
    float _1682 = fma(_1656, 0.5, 0.5);
    float3 _5500 = float3(_1670, _1672, _1668);
    float4 _1685 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5500, float3(0.0), isnan(_5500)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5500, float3(0.0), isnan(_5500)), level(0.0)).xyzw;
    float _1687 = _1685.x;
    float _1689 = _1685.y;
    float _1691 = _1685.z;
    float _1693 = _1685.w;
    float2 _5517 = float2(_1680, _1682);
    float3 _1697 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5517, float2(0.0), isnan(_5517)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5517, float2(0.0), isnan(_5517)), level(0.0)).xyz;
    float _1699 = _1697.x;
    float _1701 = _1697.y;
    float _1703 = _1697.z;
    float _1705 = in.m_67.y;
    float _1707 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1709 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1711 = _1709 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1713 = in.m_67.w;
    float _1715 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1717 = _1715 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1719 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1721 = _1719 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1723 = in.m_59.w;
    float _1725 = 1.0 / _1711;
    bool _1727 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _1729 = _1576 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1731 = in.m_67.x;
    int _1733 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1735 = _1733 != 0;
    float _1737 = _500 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1739 = in.m_67.z;
    float _1741 = 1.0 / _1717;
    float _1743 = _498 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1745 = in.m_69.y;
    int _1747 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1749 = _1747 != 0;
    float _1751 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1753 = _1751 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1755 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1757 = _1755 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1759 = 1.0 / _1721;
    bool _1761 = _570 > 0.5;
    out.m_71.y = _1705;
    float _1763 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1765 = _1763 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    out.m_71.w = _1713;
    bool _1767 = _1723 > 0.5;
    float _1769 = 1.0 / _1753;
    float _1771 = _1723;
    bool _1773 = _1727;
    bool _1775 = _1767;
    float _1777 = _1624;
    float _1779 = _1660;
    float _1781 = _1658;
    if (_1727)
    {
        _1771 = _776;
    }
    float _1783 = _1771;
    float _1785 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1787 = _1785 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    out.m_71.x = _1731;
    int _1789 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1791 = _1789 != 0;
    float _1793 = _502 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _1795 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1797 = _1795 != 0;
    float _1799 = 1.0 / _1757;
    float _1801 = _1783;
    if (!_1727)
    {
        _1801 = _776;
    }
    float _1803 = _1801;
    float _1805 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1807 = _1805 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1809 = -_1745;
    float _1811 = _1809 + 1.0;
    float _1813 = _1745;
    int _1815 = as_type<int>(_1811);
    if (_1735)
    {
        bool _1817 = _552 > 0.5;
        _1773 = _1817;
    }
    bool _1819 = _1773;
    float _1821 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1823 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1821;
    out.m_71.z = _1739;
    float _1825 = 1.0 / _1765;
    float _1827 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1829 = _1827 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1831 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1833 = _1831 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1835 = _1823 * _1741;
    float _1837 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1839 = _1837 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    int _1841 = _1767 ? as_type<int>(_1811) : as_type<int>(_1745);
    float _1843 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1845 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1843;
    if (_1749)
    {
        bool _1847 = _544 > 0.5;
        _1775 = _1847;
    }
    bool _1849 = _1775;
    float _1851 = 1.0 / _1787;
    float _1853 = _1833 * _1759;
    float _1855 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1857 = _1855 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    float _1859 = _1845 * _1725;
    float _1861 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _1863 = _1861 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _1865 = in.m_69.x;
    float _1867 = 1.0 / _1829;
    float _1869 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _1871 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _1869;
    float _1873 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _1875 = _1873 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1877 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1879 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _1877;
    bool _1881 = _532 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1883 = isnan(_532);
    bool _1885 = _1881 || _1883;
    bool _1887 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1889 = _1885 || _1887;
    float _1891 = float(_1889);
    float _1893 = _1871 * _1769;
    float _1895 = _1879 * _1799;
    float _1897 = 1.0 / _1807;
    float _1899 = _1875 * _1825;
    float _1901 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1903 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _1901;
    float _1905 = _1863 * _1851;
    float _1907 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _1909 = _1907 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1911 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _1913 = _1911 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1915 = -_1891;
    float _1917 = _1915 + 1.0;
    float _1919 = 1.0 / _1839;
    float _1921 = _1903 * _1867;
    float _1923 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1925 = _532 + _1923;
    bool _1927 = _532 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1929 = isnan(_532);
    bool _1931 = _1927 || _1929;
    bool _1933 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1935 = _1931 || _1933;
    float _1937 = float(_1935);
    float _1939 = fma(_1853, _1925, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    bool _1941 = _532 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1943 = isnan(_532);
    bool _1945 = _1941 || _1943;
    bool _1947 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1949 = _1945 || _1947;
    float _1951 = float(_1949);
    float _1953 = 1.0 / _1857;
    float _1955 = _1909 * _1897;
    float _1957 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1959 = _532 + _1957;
    float _1961 = -_1951;
    float _1963 = _1961 + 1.0;
    float _1965 = fma(_1859, _1959, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1967 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1969 = _532 + _1967;
    float _1971 = _1913 * _1919;
    float _1973 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1975 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _1973;
    bool _1977 = _532 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _1979 = isnan(_532);
    bool _1981 = _1977 || _1979;
    bool _1983 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _1985 = _1981 || _1983;
    float _1987 = float(_1985);
    float _1989 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1991 = _532 + _1989;
    float _1993 = fma(_1905, _1969, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _1995 = _1951 * _1917;
    float _1997 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1999 = fma(_1835, _1991, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _2001 = _1975 * _1953;
    float _2003 = -_1987;
    float _2005 = _2003 + 1.0;
    float _2007 = _1891 * _2005;
    float _2009 = _1891;
    float _2011 = _1951;
    int _2013 = as_type<int>(_1999);
    float _2015 = _1965;
    float _2017 = _1987;
    if (!_1735)
    {
        _2009 = _1865;
    }
    float _2019 = _2009;
    float _2021 = exp2(_1729);
    bool _2023 = _532 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _2025 = isnan(_532);
    bool _2027 = _2023 || _2025;
    bool _2029 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _2031 = _2027 || _2029;
    float _2033 = float(_2031);
    float _2035 = _2019;
    if (!_1735)
    {
        _2011 = _2019;
    }
    float _2037 = _2011;
    float _2039 = _2037;
    if (_1735)
    {
        _2035 = _1865;
    }
    float _2041 = _2035;
    float _2043 = _1937 * _1963;
    float _2045 = -_1937;
    float _2047 = _2045 + 1.0;
    float _2049 = _1791 ? as_type<float>(_1841) : _1745;
    float _2051 = _1707 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (_1797)
    {
        float _2053 = _1761 ? _1811 : _1745;
        _1813 = _2053;
    }
    float _2055 = _1813;
    float _2057 = _2055;
    if (_1735)
    {
        float _2059 = -_2041;
        float _2061 = _2059 + 1.0;
        _1815 = as_type<int>(_2061);
    }
    int _2063 = _1815;
    float _2065 = _2033 * _2047;
    float _2067 = _1997 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2069 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _2071 = _1803 + _2069;
    float _2073 = fma(_2051, _2055, -0.5);
    if (_1735)
    {
        float _2075 = _1819 ? as_type<float>(_2063) : _2041;
        _2039 = _2075;
    }
    float _2077 = _2039;
    float _2079 = _1999 * _2065;
    float _2081 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _2083 = _1803 + _2081;
    if (_1749)
    {
        float _2085 = -_2041;
        float _2087 = _2085 + 1.0;
        _2013 = as_type<int>(_2087);
    }
    int _2089 = _2013;
    if (!_1749)
    {
        _2057 = _2041;
    }
    float _2091 = _2057;
    float _2093 = -_652;
    float _2095 = fma(_794, _2073, _2093);
    float _2097 = fma(_1899, _2083, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    float _2099 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _2101 = _1803 + _2099;
    float _2103 = _2091;
    if (_1749)
    {
        float _2105 = _1849 ? as_type<float>(_2089) : _2041;
        _2103 = _2105;
    }
    float _2107 = _2103;
    float _2109 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _2111 = _1803 + _2109;
    float _2113 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _2115 = _1803 + _2113;
    float _2117 = fma(_2001, _2101, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _2119 = fma(_2049, _2067, -0.5);
    float _2121 = -_2033;
    float _2123 = _2121 + 1.0;
    float _2125 = fma(_1895, _2111, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    bool _2127 = _1803 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _2129 = isnan(_1803);
    bool _2131 = _2127 || _2129;
    bool _2133 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _2135 = _2131 || _2133;
    float _2137 = float(_2135);
    float _2139 = fma(_1921, _2115, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    float _2141 = _692 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2143 = _692 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2145 = fma(_1893, _2071, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    float _2147 = fma(_2123, (*spvDescriptorSet0.vp_c9)._m0[115].x, _2079);
    float _2149 = -_874;
    float _2151 = fma(_732, _2119, _2149);
    bool _2153 = _1803 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _2155 = isnan(_1803);
    bool _2157 = _2153 || _2155;
    bool _2159 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _2161 = _2157 || _2159;
    float _2163 = float(_2161);
    float _2165 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _2167 = _1803 + _2165;
    float _2169 = fma(_730, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2141);
    float _2171 = -_2137;
    float _2173 = _2171 + 1.0;
    float _2175 = fma(_730, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2143);
    float _2177 = fma(_1939, _2043, _2147);
    float _2179 = fma(_1971, _2167, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    bool _2181 = _1803 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _2183 = isnan(_1803);
    bool _2185 = _2181 || _2183;
    bool _2187 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _2189 = _2185 || _2187;
    float _2191 = float(_2189);
    float _2193 = _2163 * _2173;
    float _2195 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _2197 = _1803 + _2195;
    float _2199 = fma(_694, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2175);
    float _2201 = -_2163;
    float _2203 = _2201 + 1.0;
    float _2205 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2207 = _2145 * _2193;
    float _2209 = fma(_1955, _2197, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _2211 = -_2191;
    float _2213 = _2211 + 1.0;
    float _2215 = _2199 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    bool _2217 = _1803 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _2219 = isnan(_1803);
    bool _2221 = _2217 || _2219;
    bool _2223 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _2225 = _2221 || _2223;
    float _2227 = float(_2225);
    float _2229 = fma(_2203, (*spvDescriptorSet0.vp_c9)._m0[151].x, _2207);
    float _2231 = _2137 * _2213;
    float _2233 = 1.0 / _2215;
    bool _2235 = _1803 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _2237 = isnan(_1803);
    bool _2239 = _2235 || _2237;
    bool _2241 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _2243 = _2239 || _2241;
    float _2245 = float(_2243);
    float _2247 = -_2227;
    float _2249 = _2247 + 1.0;
    bool _2251 = _1803 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _2253 = isnan(_1803);
    bool _2255 = _2251 || _2253;
    bool _2257 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _2259 = _2255 || _2257;
    float _2261 = float(_2259);
    float _2263 = fma(_694, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2169);
    bool _2265 = _1803 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _2267 = isnan(_1803);
    bool _2269 = _2265 || _2267;
    bool _2271 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _2273 = _2269 || _2271;
    float _2275 = float(_2273);
    float _2277 = -_2245;
    float _2279 = _2277 + 1.0;
    bool _2281 = _1803 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _2283 = isnan(_1803);
    bool _2285 = _2281 || _2283;
    bool _2287 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _2289 = _2285 || _2287;
    float _2291 = float(_2289);
    float _2293 = _2191 * _2249;
    float _2295 = -_2261;
    float _2297 = _2295 + 1.0;
    float _2299 = fma(_2097, _2231, _2229);
    float _2301 = _2263 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _2303 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2305 = isnan(0.5);
    bool _2307 = _2303 || _2305;
    bool _2309 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2311 = _2307 || _2309;
    float _2313 = _2227 * _2279;
    float _2315 = _2245 * _2297;
    float _2317 = fma(_2125, _2293, _2299);
    float _2319 = -_2291;
    float _2321 = _2319 + 1.0;
    float _2323 = _2205 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2325 = _2301 + _2215;
    float _2327 = fma(_2179, _2313, _2317);
    float _2329 = -_2275;
    float _2331 = _2329 + 1.0;
    float _2333 = _2275 * _2321;
    float _2335 = fma(_2323, _2077, -0.5);
    float _2337 = _2325 * _2233;
    float _2339 = _2337 * 0.5;
    float _2341 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2343 = in.m_73.x;
    float _2345 = in.m_73.y;
    float _2347 = in.m_73.z;
    float _2349 = fma(_1965, _1995, _2177);
    bool _2351 = _954 != 0.0;
    bool _2353 = isnan(_954);
    bool _2355 = _2351 || _2353;
    bool _2357 = isnan(0.0);
    bool _2359 = _2355 || _2357;
    float _2361 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2363 = fma(_2339, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2361);
    if (!_2311)
    {
        _2015 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _2365 = _2015;
    float _2367 = fma(_1993, _2007, _2349);
    bool _2369 = _952 == 0.0;
    bool _2371 = !_2359;
    bool _2373 = _2369 && _2371;
    float _2375 = fma(_814, _2335, _822);
    float _2377 = _2095 + 0.5;
    float _2379 = fma(_1987, (*spvDescriptorSet0.vp_c9)._m0[119].x, _2367);
    float _2381 = 1.0 / _2363;
    if (!_2311)
    {
        float _2383 = -_2365;
        float _2385 = _2383 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _2017 = _2385;
    }
    float _2387 = _2017;
    bool _2389 = _956 == 0.0;
    bool _2391 = _2389 && _2373;
    float _2393 = _2261 * _2331;
    float _2395 = fma(_2139, _2315, _2327);
    float _2397 = _2341 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2399 = -_2021;
    float _2401 = _2399 + 1.0;
    float _2403 = _1793 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2405 = _2367;
    if (!_2311)
    {
        float _2407 = 1.0 / _2387;
        _2405 = _2407;
    }
    float _2409 = _2405;
    float _2411 = fma(_2397, _2107, -0.5);
    float _2413 = fma(_2209, _2393, _2395);
    float _2415 = _1743 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2417 = _2379 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2419 = fma(_768, _2411, _852);
    float _2421 = _2375 + 0.5;
    float _2423 = _2345;
    float _2425 = _2343;
    float _2427 = _2347;
    if (!_2391)
    {
        float _2429 = fma(_954, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2345);
        _2423 = _2429;
    }
    float _2431 = _2423;
    float _2433 = _2381;
    if (!_2311)
    {
        float _2435 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2437 = -_2365;
        float _2439 = fma(_2381, _2435, _2437);
        _1158 = _2439;
    }
    float _2441 = _1158;
    if (!_2391)
    {
        float _2443 = fma(_952, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2343);
        _2425 = _2443;
    }
    float _2445 = _2425;
    float _2447 = _2151 + 0.5;
    float _2449 = _2419 + 0.5;
    if (_2311)
    {
        _1160 = 1.0;
    }
    float _2451 = _1160;
    float _2453 = _1044 * _1116;
    float _2455 = _2451;
    if (!_2391)
    {
        float _2457 = fma(_956, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2347);
        _2427 = _2457;
    }
    float _2459 = _2427;
    float _2461 = _1062 * _1098;
    if (!_2311)
    {
        float _2463 = _2441 * _2409;
        float _2465 = precise::clamp(_2463, 0.0, 1.0);
        _2455 = _2465;
    }
    float _2467 = _2455;
    float _2469 = _1044 * _1098;
    out.m_75.x = _2421;
    out.m_75.y = _2377;
    out.m_75.z = _2449;
    out.m_75.w = _2447;
    float _2471 = _1044 * _1094;
    float _2473 = fma(_1048, _1076, _2461);
    float _2475 = fma(_2117, _2333, _2413);
    float _2477 = -_1028;
    float _2479 = fma(_2477, _1078, _2453);
    float _2481 = _1060 * _1098;
    float _2483 = _2401 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2485 = fma(_2291, (*spvDescriptorSet0.vp_c9)._m0[158].x, _2475);
    float _2487 = _1737 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2489 = _1062 * _1116;
    float _2491 = _1062 * _1094;
    float _2493 = _1060 * _1116;
    float _2495 = fma(_1046, _964, _2479);
    float _2497 = fma(_1048, _1078, _2489);
    float _2499 = -_1028;
    float _2501 = fma(_2499, _1076, _2469);
    float _2503 = -_1028;
    float _2505 = fma(_2503, _1082, _2471);
    float _2507 = _1060 * _1094;
    float _2509 = fma(_1048, _1082, _2491);
    float _2511 = fma(_1046, _960, _2501);
    float _2513 = fma(_1046, _962, _2505);
    float _2515 = fma(_1056, _960, _2473);
    out.m_77.x = _2415;
    out.m_77.y = _2487;
    out.m_77.z = _2403;
    out.m_77.w = _2417;
    float _2517 = _2511 * _2431;
    float _2519 = fma(_1056, _964, _2497);
    float _2521 = _2495 * _2431;
    float _2523 = fma(_1050, _1082, _2507);
    float _2525 = fma(_2515, _2445, _2517);
    float _2527 = _2515;
    float _2529 = _2519;
    if (!_2311)
    {
        _2527 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _2531 = _2527;
    float _2533 = fma(_1056, _962, _2509);
    float _2535 = _2513 * _2431;
    float _2537 = fma(_2519, _2445, _2521);
    float _2539 = fma(_1070, _962, _2523);
    float _2541 = _2531;
    if (!_2311)
    {
        float _2543 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2545 = -_2531;
        float _2547 = fma(_2381, _2543, _2545);
        _2433 = _2547;
    }
    float _2549 = _2433;
    float _2551 = _2549;
    if (!_2311)
    {
        float _2553 = -_2531;
        float _2555 = _2553 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _2541 = _2555;
    }
    float _2557 = _2541;
    float _2559 = fma(_2533, _2445, _2535);
    float _2561 = fma(_1050, _1076, _2481);
    float _2563 = fma(_1050, _1078, _2493);
    float _2565 = _1586 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_79.x = _2485;
    float _2567 = fma(_1070, _960, _2561);
    float _2569 = fma(_1070, _964, _2563);
    float _2571 = _2557;
    if (!_2311)
    {
        float _2573 = 1.0 / _2557;
        _2571 = _2573;
    }
    float _2575 = _2571;
    float _2577 = fma(_1582, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2565);
    float _2579 = fma(_2567, _2459, _2525);
    float _2581 = fma(_2569, _2459, _2537);
    float _2583 = fma(_2539, _2459, _2559);
    float _2585 = fma(_1580, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2577);
    bool _2587 = _1384 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2589 = isnan(_1384);
    bool _2591 = _2587 || _2589;
    bool _2593 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2595 = _2591 || _2593;
    float _2597 = _1658 + _1624;
    float _2599 = _1624 * 0.5;
    out.m_81.x = _2579;
    out.m_81.y = _2581;
    out.m_81.z = _2583;
    float _2601 = fma(_1606, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2585);
    float _2603 = _2483 * _1676;
    float _2605 = -_2483;
    float _2607 = _2605 + 1.0;
    float _2609 = _2601 + _1624;
    out.gl_Position.x = _1658;
    out.gl_Position.y = _1660;
    out.gl_Position.z = _2601;
    out.gl_Position.w = _1624;
    float _2611 = _2599;
    float _2613 = _2601;
    if (!_2311)
    {
        float _2615 = _2549 * _2575;
        float _2617 = precise::clamp(_2615, 0.0, 1.0);
        _2551 = _2617;
    }
    float _2619 = _2551;
    float _2621 = _1693 * _2603;
    float _2623 = _1693 * _2607;
    float _2625 = _2609 * 0.5;
    float _2627 = _2597 * 0.5;
    float _2629 = _1703 * _2603;
    float _2631 = fma(_1699, _2621, _1687);
    float _2633 = fma(_1701, _2621, _1689);
    float _2635 = fma(_1660, -0.5, _2599);
    float _2637 = fma(_1693, _2629, _1691);
    if (!_2595)
    {
        _2529 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2639 = _2529;
    float _2641 = _2639;
    float _2643 = _2639;
    if (!_2595)
    {
        _2611 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2645 = _2611;
    out.m_83.x = _2627;
    out.m_83.y = _2635;
    out.m_83.z = _2625;
    out.m_83.w = _1624;
    float _2647 = _2645;
    float _2649 = _2645;
    if (_2311)
    {
        _1777 = 1.0;
    }
    float _2651 = _1777;
    float _2653 = _2651;
    if (!_2311)
    {
        float _2655 = -_2619;
        float _2657 = _2655 + 1.0;
        _2653 = _2657;
    }
    float _2659 = _2653;
    if (!_2595)
    {
        _2613 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2661 = _2613;
    out.m_85.x = _2631;
    out.m_85.y = _2633;
    out.m_85.z = _2637;
    out.m_85.w = _2623;
    float _2663 = _2661;
    float _2665 = _2661;
    if (!_2595)
    {
        _1779 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2667 = _1779;
    float _2669 = _2467 * _2659;
    float _2671 = _2669;
    float _2673 = _2667;
    float _2675 = _2667;
    if (!_2595)
    {
        _1781 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2677 = _1781;
    float _2679 = _2669 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2681 = _2677;
    float _2683 = _2677;
    if (!_2595)
    {
        _2671 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2685 = _2671;
    bool _2687 = !_2595;
    float _2689 = _2685;
    float _2691 = _2685;
    if (!_2687)
    {
        bool _2693 = _1384 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2695 = isnan(_1384);
        bool _2697 = _2693 || _2695;
        bool _2699 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2701 = _2697 || _2699;
        if (!_2701)
        {
            float _2703 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2705 = _1384 + _2703;
            float _2707 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2709 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2707;
            float _2711 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2713 = _2711 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2715 = 1.0 / _2709;
            float _2717 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2719 = _2717 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2721 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2723 = _2721 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2725 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2727 = _2725 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2729 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2731 = _2729 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2733 = _2705 * _2715;
            float _2735 = precise::clamp(_2733, 0.0, 1.0);
            float _2737 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2739 = _2737 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2741 = fma(_2735, _2713, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2743 = fma(_2735, _2739, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2745 = fma(_2735, _2719, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2747 = fma(_2735, _2723, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2749 = fma(_2735, _2727, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2751 = fma(_2735, _2731, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2675 = _2745;
            _2649 = _2749;
            _2665 = _2741;
            _2643 = _2747;
            _2683 = _2743;
            _2691 = _2751;
            _2753 = true;
        }
        else
        {
            bool _2755 = _1384 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2757 = isnan(_1384);
            bool _2759 = _2755 || _2757;
            bool _2761 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2763 = _2759 || _2761;
            if (!_2763)
            {
                _2663 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2765 = _2663;
            _2665 = _2765;
            if (!_2763)
            {
                _2673 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2767 = _2673;
            _2675 = _2767;
            if (!_2763)
            {
                _2681 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2769 = _2681;
            _2683 = _2769;
            if (!_2763)
            {
                _2641 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2771 = _2641;
            _2643 = _2771;
            if (!_2763)
            {
                _2647 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2773 = _2647;
            _2649 = _2773;
            if (!_2763)
            {
                _2689 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2775 = _2689;
            bool _2777 = !_2763;
            _2691 = _2775;
            if (!_2777)
            {
                bool _2779 = _1384 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2781 = isnan(_1384);
                bool _2783 = _2779 || _2781;
                bool _2785 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2787 = _2783 || _2785;
                if (!_2787)
                {
                    float _2789 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2791 = _1384 + _2789;
                    float _2793 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2795 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2793;
                    float _2797 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2799 = _2797 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2801 = 1.0 / _2795;
                    float _2803 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2805 = _2803 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2807 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2809 = _2807 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2811 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2813 = _2811 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2815 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2817 = _2815 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2819 = _2791 * _2801;
                    float _2821 = precise::clamp(_2819, 0.0, 1.0);
                    float _2823 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2825 = _2823 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2827 = fma(_2821, _2799, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2829 = fma(_2821, _2825, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2831 = fma(_2821, _2805, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2833 = fma(_2821, _2809, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2835 = fma(_2821, _2813, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2837 = fma(_2821, _2817, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2675 = _2831;
                    _2649 = _2835;
                    _2665 = _2827;
                    _2643 = _2833;
                    _2683 = _2829;
                    _2691 = _2837;
                    _2753 = true;
                }
                else
                {
                    _2675 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2649 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2665 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2643 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2683 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2691 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2753 = false;
    float _2839 = _2675;
    float _2841 = _2649;
    float _2843 = _2665;
    float _2845 = _2643;
    float _2847 = _2683;
    float _2849 = _2691;
    float _2851 = _2679 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2853 = fma(_2581, -0.5, 0.5);
    float _2855 = precise::clamp(_2853, 0.0, 1.0);
    float _2857 = -_2839;
    float _2859 = _2857 + _2841;
    float _2861 = -_2843;
    float _2863 = _2861 + _2845;
    out.m_47.x = _2851;
    float _2865 = -_2847;
    float _2867 = _2865 + _2849;
    float _2869 = fma(_2855, _2859, _2839);
    float _2871 = fma(_2855, _2863, _2843);
    bool _2873 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2875 = _2869 * 0.586610972881317138671875;
    float _2877 = fma(_2855, _2867, _2847);
    out.m_87.x = 0.0;
    bool _2879 = _2467 > 0.0;
    bool _2881 = isnan(_2467);
    bool _2883 = _2879 || _2881;
    bool _2885 = isnan(0.0);
    bool _2887 = _2883 || _2885;
    float _2889 = fma(_2871, 0.298911988735198974609375, _2875);
    bool _2891 = _2659 <= 0.0;
    bool _2893 = !_2887;
    bool _2895 = _2891 || _2893;
    float _2897 = fma(_2877, 0.114477999508380889892578125, _2889);
    float _2899 = -_2897;
    float _2901 = _2871 + _2899;
    float _2903 = -_2897;
    float _2905 = _2869 + _2903;
    float _2907 = -_2897;
    float _2909 = _2877 + _2907;
    float _2911 = fma(_2901, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2897);
    float _2913 = fma(_2905, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2897);
    float _2915 = fma(_2909, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2897);
    bool _2917 = !_2873;
    if (!_2917)
    {
        float _2919 = -_1358;
        float _2921 = _2919 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2923 = -_1360;
        float _2925 = _2923 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2927 = -_1362;
        float _2929 = _2927 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2931 = _2921 * _2921;
        float _2933 = fma(_2925, _2925, _2931);
        float _2935 = fma(_2929, _2929, _2933);
        float _2937 = sqrt(_2935);
        float _2939 = rsqrt(_2935);
        float _2941 = -_2937;
        float _2943 = _2941 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2945 = _2943 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2947 = precise::clamp(_2945, 0.0, 1.0);
        float _2949 = _2925 * _2939;
        float _2951 = _2921 * _2939;
        float _2953 = abs(_2947);
        float _2955 = log2(_2953);
        float _2957 = _2929 * _2939;
        float _2959 = _2949 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2961 = _2581 * _2951;
        float _2963 = -_2951;
        float _2965 = -_2959;
        float _2967 = fma(_2963, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2965);
        float _2969 = fma(_2579, _2949, _2961);
        float _2971 = -_2957;
        float _2973 = fma(_2971, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2967);
        float _2975 = fma(_2583, _2957, _2969);
        float _2977 = precise::clamp(_2975, 0.0, 1.0);
        float _2979 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2981 = _2973 + _2979;
        float _2983 = _2955 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2985 = _2981 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2987 = precise::clamp(_2985, 0.0, 1.0);
        float _2989 = exp2(_2983);
        float _2991 = _2989 * _2987;
        float _2993 = _2977 * _2991;
        float _2995 = _2993 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2997 = _2993 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2999 = _2993 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_87.x = _2995;
        out.m_87.y = _2997;
        out.m_87.z = _2999;
    }
    out.m_89.x = _2911;
    out.m_89.y = _2913;
    out.m_89.z = _2915;
    if (!_2895)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _3001 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3001;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2753 = false;
    bool _524 = false;
    bool _344 = false;
    bool _230 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _103 = in.m_44.w;
    float _105 = trunc(_103);
    int _108 = int(_105);
    bool _112 = _108 >= 1;
    float _114 = 0.0;
    if (!_112)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _116 = _114;
    float _118 = _116;
    if (!_112)
    {
        out.m_47.x = 0.0;
    }
    int _120 = 0;
    if (!_112)
    {
        float _122 = _116 * 5.0;
        _120 = as_type<int>(_122);
    }
    int _124 = _120;
    int _126 = _124;
    if (!_112)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3058 = as_type<float>(_124);
        out.gl_Position.z = _3058;
    }
    if (!_112)
    {
        return out;
    }
    float _128 = in.m_49.w;
    bool _130 = _128 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _132 = isnan(_128);
    bool _134 = _130 || _132;
    bool _136 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _138 = _134 || _136;
    float _140 = -_128;
    float _142 = _140 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _144 = 0.0;
    float _146 = _142;
    if (_138)
    {
        float _148 = float(_108);
        _144 = _148;
    }
    float _150 = _144;
    bool _152 = _142 >= _150;
    bool _154 = !_138;
    bool _156 = _152 || _154;
    if (_156)
    {
        _118 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _158 = _118;
    if (_156)
    {
        out.m_47.x = 0.0;
    }
    if (_156)
    {
        float _160 = _158 * 5.0;
        _126 = as_type<int>(_160);
    }
    int _162 = _126;
    if (_156)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3127 = as_type<float>(_162);
        out.gl_Position.z = _3127;
    }
    if (_156)
    {
        return out;
    }
    float _164 = in.m_51.x;
    float _166 = in.m_51.y;
    float _168 = in.m_51.z;
    bool _170 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _172 = in.m_53.x;
    float _174 = in.m_53.y;
    float _176 = in.m_53.z;
    float _178 = in.m_55.x;
    float _180 = in.m_55.y;
    float _182 = in.m_55.z;
    float _184 = in.m_57.x;
    float _186 = in.m_57.y;
    float _188 = in.m_57.z;
    float _190 = _166 * _174;
    float _192 = _166 * _180;
    float _194 = fma(_164, _172, _190);
    float _196 = _166 * _186;
    float _198 = fma(_164, _178, _192);
    float _200 = fma(_168, _176, _194);
    float _202 = fma(_164, _184, _196);
    float _204 = fma(_168, _182, _198);
    float _206 = fma(_168, _188, _202);
    bool _208 = !_170;
    float _210 = _176;
    float _228;
    if (!_208)
    {
        float _212 = in.m_59.x;
        float _214 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _216 = _212 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _218 = fma(_216, (*spvDescriptorSet0.vp_c9)._m0[12].x, _142);
        float _220 = _218 * _214;
        float _222 = floor(_220);
        float _224 = -_222;
        float _226 = _220 + _224;
        _228 = _226;
        _230 = true;
    }
    else
    {
        float _232 = float(_108);
        float _234 = 1.0 / _232;
        float _236 = _142 * _234;
        _228 = _236;
    }
    _230 = false;
    float _238 = _228;
    float _240 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _242 = _238 + _240;
    bool _244 = _238 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _246 = isnan(_238);
    bool _248 = _244 || _246;
    bool _250 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _252 = _248 || _250;
    float _254 = float(_252);
    float _256 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _258 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _256;
    bool _260 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _262 = 1.0 / _258;
    float _264 = -_254;
    float _266 = _264 + 1.0;
    float _268 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _270 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _268;
    float _272 = _242 * _262;
    bool _274 = _238 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _276 = isnan(_238);
    bool _278 = _274 || _276;
    bool _280 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _282 = _278 || _280;
    float _284 = float(_282);
    float _286 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _288 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _286;
    float _290 = fma(_270, _272, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _292 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _294 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _292;
    float _296 = _284 * _266;
    float _298 = fma(_288, _272, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _300 = fma(_294, _272, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _302 = -_284;
    float _304 = _302 + 1.0;
    float _306 = _290 * _296;
    float _308 = _298 * _296;
    float _310 = _300 * _296;
    float _312 = fma(_304, (*spvDescriptorSet0.vp_c9)._m0[143].z, _306);
    float _314 = fma(_304, (*spvDescriptorSet0.vp_c9)._m0[143].x, _308);
    float _316 = fma(_304, (*spvDescriptorSet0.vp_c9)._m0[143].y, _310);
    float _318 = fma(_254, (*spvDescriptorSet0.vp_c9)._m0[144].z, _312);
    float _320 = fma(_254, (*spvDescriptorSet0.vp_c9)._m0[144].x, _314);
    float _322 = fma(_254, (*spvDescriptorSet0.vp_c9)._m0[144].y, _316);
    bool _324 = !_260;
    float _342;
    if (!_324)
    {
        float _326 = in.m_59.x;
        float _328 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _330 = _326 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _332 = fma(_330, (*spvDescriptorSet0.vp_c9)._m0[11].x, _142);
        float _334 = _332 * _328;
        float _336 = floor(_334);
        float _338 = -_336;
        float _340 = _334 + _338;
        _342 = _340;
        _344 = true;
    }
    else
    {
        float _346 = float(_108);
        float _348 = 1.0 / _346;
        float _350 = _142 * _348;
        _342 = _350;
    }
    _344 = false;
    float _352 = _342;
    float _354 = in.m_61.x;
    float _356 = in.m_61.y;
    float _358 = in.m_61.z;
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _362 = _352 + _360;
    bool _364 = _352 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _366 = isnan(_352);
    bool _368 = _364 || _366;
    bool _370 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _372 = _368 || _370;
    float _374 = float(_372);
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _378 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _376;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _382 = _380 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _384 = 1.0 / _378;
    bool _386 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _388 = 1.0 / _382;
    float _390 = -_374;
    float _392 = _390 + 1.0;
    float _394 = _318 * _358;
    float _396 = _362 * _384;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _400 = _352 + _398;
    bool _402 = _352 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _404 = isnan(_352);
    bool _406 = _402 || _404;
    bool _408 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _410 = _406 || _408;
    float _412 = float(_410);
    float _414 = _322 * _356;
    bool _416 = _352 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _418 = isnan(_352);
    bool _420 = _416 || _418;
    bool _422 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _424 = _420 || _422;
    float _426 = float(_424);
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _430 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _428;
    float _432 = _320 * _354;
    float _434 = _400 * _388;
    float _436 = _426 * _392;
    float _438 = -_426;
    float _440 = _438 + 1.0;
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _444 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _442;
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _448 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _446;
    float _450 = fma(_430, _396, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _452 = _412 * _440;
    float _454 = fma(_444, _396, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _456 = fma(_448, _396, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _458 = -_412;
    float _460 = _458 + 1.0;
    float _462 = _450 * _452;
    float _464 = _454 * _452;
    float _466 = _456 * _452;
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _470 = _468 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _474 = _472 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _478 = _476 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _480 = fma(_460, (*spvDescriptorSet0.vp_c9)._m0[107].x, _464);
    float _482 = fma(_460, (*spvDescriptorSet0.vp_c9)._m0[107].y, _466);
    float _484 = fma(_470, _434, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _486 = fma(_474, _434, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _488 = fma(_478, _434, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _490 = fma(_460, (*spvDescriptorSet0.vp_c9)._m0[107].z, _462);
    float _492 = fma(_484, _436, _480);
    float _494 = fma(_486, _436, _482);
    float _496 = fma(_488, _436, _490);
    float _498 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[109].x, _492);
    float _500 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[109].y, _494);
    float _502 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[109].z, _496);
    bool _504 = !_386;
    float _522;
    if (!_504)
    {
        float _506 = in.m_59.x;
        float _508 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _510 = _506 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _512 = fma(_510, (*spvDescriptorSet0.vp_c9)._m0[11].y, _142);
        float _514 = _512 * _508;
        float _516 = floor(_514);
        float _518 = -_516;
        float _520 = _514 + _518;
        _522 = _520;
        _524 = true;
    }
    else
    {
        float _526 = float(_108);
        float _528 = 1.0 / _526;
        float _530 = _142 * _528;
        _522 = _530;
    }
    _524 = false;
    float _532 = _522;
    float _534 = in.m_44.x;
    float _536 = in.m_44.y;
    float _538 = in.m_44.z;
    float _540 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _542 = log2(_540);
    float _544 = in.m_59.z;
    int _546 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _548 = _546 != 0;
    float _550 = _414 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _552 = in.m_59.x;
    int _554 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _556 = _554 != 0;
    int _558 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _560 = _558 != 0;
    int _562 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _564 = _562 != 0;
    float _566 = _432 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _568 = _394 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _570 = in.m_59.y;
    float _572 = in.m_57.w;
    float _574 = _542 * _142;
    float _576 = _174 * _536;
    float _578 = _180 * _536;
    float _580 = _186 * _536;
    float _582 = fma(_172, _534, _576);
    float _584 = fma(_178, _534, _578);
    float _586 = fma(_184, _534, _580);
    float _588 = _544 * 2.0;
    float _590 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _592 = _552 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _594 = fma(_176, _538, _582);
    float _596 = _570 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _598 = -_590;
    float _600 = fma(_592, 2.0, _598);
    float _602 = floor(_588);
    float _604 = _570 + _544;
    float _606 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _608 = _552 * 2.0;
    float _610 = _604 + (-1.0);
    float _612 = fma(_596, -2.0, _606);
    float _614 = fma(_182, _538, _584);
    float _616 = floor(_608);
    float _618 = fma(_188, _538, _586);
    float _620 = fma(_610, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _622 = _552 + _570;
    float _624 = _570 * 2.0;
    float _626 = in.m_55.w;
    float _628 = _608;
    if (!_548)
    {
        _210 = _570;
    }
    float _630 = _210;
    float _632 = _622 + (-1.0);
    float _634 = floor(_624);
    bool _636 = _602 > 0.0;
    float _638 = in.m_53.w;
    bool _640 = _602 >= 0.0;
    bool _642 = isnan(_602);
    bool _644 = _640 || _642;
    bool _646 = isnan(0.0);
    bool _648 = _644 || _646;
    float _650 = fma(_632, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _652 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[76].y, _612);
    float _654 = _632;
    float _656 = _630;
    if (!_548)
    {
        _628 = _544;
    }
    float _658 = _628;
    float _660 = exp2(_574);
    float _662 = _658;
    if (!_548)
    {
        _654 = _544;
    }
    float _664 = _654;
    float _666 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _668 = _664;
    if (_548)
    {
        _656 = _552;
    }
    float _670 = _656;
    if (_548)
    {
        _662 = _570;
    }
    float _672 = _662;
    if (_548)
    {
        _668 = _570;
    }
    float _674 = _668;
    bool _676 = _616 > 0.0;
    float _678 = _672 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _680 = _616 >= 0.0;
    bool _682 = isnan(_616);
    bool _684 = _680 || _682;
    bool _686 = isnan(0.0);
    bool _688 = _684 || _686;
    float _690 = fma(_674, (*spvDescriptorSet0.vp_c9)._m0[83].w, _666);
    float _692 = _614 + _626;
    float _694 = _618 + _572;
    int _696 = _648 ? 0 : 1;
    float _698 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _700 = _634 > 0.0;
    float _702 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _704 = float(_108);
    float _706 = fma(_670, (*spvDescriptorSet0.vp_c9)._m0[83].z, _698);
    float _708 = _670 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _710 = 1.0 / _704;
    int _712 = _688 ? 0 : 1;
    float _714 = -_702;
    float _716 = fma(_708, 2.0, _714);
    bool _718 = _634 >= 0.0;
    bool _720 = isnan(_634);
    bool _722 = _718 || _720;
    bool _724 = isnan(0.0);
    bool _726 = _722 || _724;
    float _728 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _730 = _594 + _638;
    float _732 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[82].w, _690);
    int _734 = _726 ? 0 : 1;
    float _736 = fma(_678, -2.0, _728);
    float _738 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _740 = 1.0 + _738;
    int _742 = ~_734;
    int _744 = _742 + 1;
    int _746 = _744 + 1;
    float _748 = -_660;
    float _750 = _748 + 1.0;
    int _752 = _746;
    if (!_700)
    {
        int _754 = ~_734;
        int _756 = _754 + 1;
        _752 = _756;
    }
    int _758 = _752;
    float _760 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _762 = in.m_63.x;
    float _764 = in.m_63.y;
    float _766 = in.m_63.z;
    float _768 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[82].z, _706);
    float _770 = fma(_570, (*spvDescriptorSet0.vp_c9)._m0[78].w, _760);
    bool _772 = !_556;
    int _774 = _772 ? 0 : 1;
    float _776 = _710 * _142;
    int _778 = ~_696;
    int _780 = _778 + 1;
    int _782 = _780 + 1;
    float _784 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _786 = _782;
    if (!_636)
    {
        int _788 = ~_696;
        int _790 = _788 + 1;
        _786 = _790;
    }
    int _792 = _786;
    float _794 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[77].w, _770);
    int _796 = abs(_774);
    float _798 = fma(_552, (*spvDescriptorSet0.vp_c9)._m0[78].z, _784);
    int _800 = ~_712;
    int _802 = _800 + 1;
    int _804 = _802 + 1;
    int _806 = _804;
    if (!_676)
    {
        int _808 = ~_712;
        int _810 = _808 + 1;
        _806 = _810;
    }
    int _812 = _806;
    float _814 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[77].z, _798);
    float _816 = 1.0 / _740;
    float _818 = float(_792);
    float _820 = -_142;
    float _822 = fma(_820, (*spvDescriptorSet0.vp_c9)._m0[76].x, _600);
    bool _824 = !_560;
    int _826 = _824 ? 0 : 1;
    float _828 = -_730;
    float _830 = _828 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    bool _832 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _834 = isnan(1.0);
    bool _836 = _832 || _834;
    bool _838 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _840 = _836 || _838;
    int _842 = abs(_826);
    float _844 = -_694;
    float _846 = _844 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _848 = float(_796);
    float _850 = -_142;
    float _852 = fma(_850, (*spvDescriptorSet0.vp_c9)._m0[81].x, _716);
    bool _854 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _856 = isnan(0.0);
    bool _858 = _854 || _856;
    bool _860 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _862 = _858 || _860;
    float _864 = -_692;
    float _866 = _864 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _868 = float(_842);
    float _870 = _848 * _818;
    float _872 = float(_812);
    float _874 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[81].y, _736);
    float _876 = _862 ? _750 : 0.0;
    float _878 = _870 * (-2.0);
    float _880 = _552 + (-0.5);
    float _882 = _868 * _872;
    float _884 = float(_758);
    float _886 = fma(_878, _762, _762);
    bool _888 = !_564;
    int _890 = _888 ? 0 : 1;
    if (_840)
    {
        float _892 = _876 * _816;
        _146 = _892;
    }
    float _894 = _146;
    float _896 = _866 * _866;
    float _898 = fma(_650, _878, _650);
    int _900 = abs(_890);
    float _902 = _882 * (-2.0);
    float _904 = fma(_830, _830, _896);
    float _906 = fma(_880, (*spvDescriptorSet0.vp_c9)._m0[196].x, _886);
    float _908 = fma(_620, _902, _620);
    float _910 = fma(_902, _764, _764);
    float _912 = _570 + (-0.5);
    float _914 = fma(_846, _846, _904);
    float _916 = float(_900);
    float _918 = fma(_898, _894, _906);
    float _920 = fma(_912, (*spvDescriptorSet0.vp_c9)._m0[196].y, _910);
    float _922 = _552 + _544;
    float _924 = _916 * _884;
    float _926 = rsqrt(_914);
    float _928 = fma(_908, _894, _920);
    float _930 = _922 + (-1.0);
    float _932 = _924 * (-2.0);
    float _934 = _918 * 0.15915493667125701904296875;
    float _936 = _928 * 0.15915493667125701904296875;
    float _938 = fma(_930, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _940 = fma(_932, _766, _766);
    float _942 = _544 + (-0.5);
    float _944 = _934 * 6.283185482025146484375;
    float _946 = sin(_944);
    float _948 = fma(_938, _932, _938);
    float _950 = fma(_942, (*spvDescriptorSet0.vp_c9)._m0[196].z, _940);
    float _952 = in.m_65.x;
    float _954 = in.m_65.y;
    float _956 = in.m_65.z;
    float _958 = fma(_948, _894, _950);
    float _960 = _830 * _926;
    float _962 = _846 * _926;
    float _964 = _866 * _926;
    float _966 = _958 * 0.15915493667125701904296875;
    float _968 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _970 = _960 * _968;
    float _972 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _974 = _962 * _972;
    float _976 = _934 * 6.283185482025146484375;
    float _978 = cos(_976);
    float _980 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _982 = -_970;
    float _984 = fma(_962, _980, _982);
    float _986 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _988 = -_974;
    float _990 = fma(_964, _986, _988);
    float _992 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _994 = _964 * _992;
    float _996 = _984 * _984;
    float _998 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1000 = -_994;
    float _1002 = fma(_960, _998, _1000);
    float _1004 = _936 * 6.283185482025146484375;
    float _1006 = sin(_1004);
    float _1008 = fma(_990, _990, _996);
    float _1010 = fma(_1002, _1002, _1008);
    float _1012 = _936 * 6.283185482025146484375;
    float _1014 = cos(_1012);
    float _1016 = _966 * 6.283185482025146484375;
    float _1018 = cos(_1016);
    float _1020 = _946 * _1006;
    float _1022 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _954);
    float _1024 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _952);
    float _1026 = _966 * 6.283185482025146484375;
    float _1028 = sin(_1026);
    float _1030 = _946 * _1014;
    float _1032 = _550 * _1022;
    float _1034 = _566 * _1024;
    float _1036 = _978 * _1006;
    float _1038 = _978 * _1014;
    float _1040 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _956);
    float _1042 = rsqrt(_1010);
    float _1044 = _978 * _1018;
    float _1046 = _946 * _1018;
    float _1048 = _1014 * _1018;
    float _1050 = _1006 * _1018;
    float _1052 = _568 * _1040;
    float _1054 = -_1036;
    float _1056 = fma(_1028, _1030, _1054);
    float _1058 = -_1030;
    float _1060 = fma(_1028, _1036, _1058);
    float _1062 = fma(_1028, _1038, _1020);
    float _1064 = _1044 * _1032;
    float _1066 = -_1032;
    float _1068 = _1028 * _1066;
    float _1070 = fma(_1028, _1020, _1038);
    float _1072 = _1046 * _1032;
    float _1074 = fma(_1062, _1034, _1064);
    float _1076 = _990 * _1042;
    float _1078 = _984 * _1042;
    float _1080 = fma(_1048, _1034, _1068);
    float _1082 = _1002 * _1042;
    float _1084 = _964 * _1076;
    float _1086 = _962 * _1078;
    float _1088 = fma(_1060, _1052, _1074);
    float _1090 = fma(_1056, _1034, _1072);
    float _1092 = -_1084;
    float _1094 = fma(_960, _1078, _1092);
    float _1096 = -_1086;
    float _1098 = fma(_964, _1082, _1096);
    float _1100 = fma(_1050, _1052, _1080);
    float _1102 = fma(_1070, _1052, _1090);
    float _1104 = _1094 * _1088;
    float _1106 = _1098 * _1088;
    float _1108 = _960 * _1082;
    float _1110 = fma(_1082, _1100, _1104);
    float _1112 = fma(_1076, _1100, _1106);
    float _1114 = -_1108;
    float _1116 = fma(_962, _1076, _1114);
    float _1118 = fma(_962, _1102, _1110);
    float _1120 = fma(_960, _1102, _1112);
    float _1122 = _1116 * _1088;
    float _1124 = _694 + _1118;
    float _1126 = _730 + _1120;
    float _1128 = fma(_1078, _1100, _1122);
    float _1130 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1132 = _1124 + _1130;
    float _1134 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1136 = _1126 + _1134;
    float _1138 = fma(_964, _1102, _1128);
    float _1140 = _1132 * _1132;
    float _1142 = _692 + _1138;
    float _1144 = fma(_1136, _1136, _1140);
    float _1146 = sqrt(_1144);
    bool _1148 = _1146 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1150 = _1104;
    float _1152 = _1126;
    float _1154 = _1124;
    float _1156 = _1100;
    float _1158 = _954;
    float _1160 = _952;
    if (!_1148)
    {
        _1150 = _1142;
    }
    float _1162 = _1150;
    bool _1164 = !_1148;
    float _1166 = _1162;
    if (!_1164)
    {
        float _1168 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1170 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1172 = _1146 + _1170;
        float _1174 = rsqrt(_1144);
        float _1176 = _1172 * _1168;
        float _1178 = _1142 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1180 = _1176 * 0.15915493667125701904296875;
        float _1182 = _1180 * 6.283185482025146484375;
        float _1184 = cos(_1182);
        float _1186 = _1180 * 6.283185482025146484375;
        float _1188 = sin(_1186);
        float _1190 = _1184 + (-1.0);
        float _1192 = fma(_1188, _1178, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1194 = _1190 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1196 = _1174 * _1192;
        float _1198 = fma(_1142, _1184, _1194);
        float _1200 = fma(_1136, _1196, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1202 = fma(_1132, _1196, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1166 = _1198;
        _1152 = _1200;
        _1154 = _1202;
        _1156 = _1190;
    }
    float _1204 = _1166;
    float _1206 = _1152;
    float _1208 = _1154;
    float _1210 = _1156;
    float _1212 = -_692;
    float _1214 = _1212 + _1204;
    float _1216 = -_730;
    float _1218 = _1216 + _1206;
    float _1220 = -_694;
    float _1222 = _1220 + _1208;
    float _1224 = _1214 * _1214;
    bool _1226 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1228 = isnan(0.5);
    bool _1230 = _1226 || _1228;
    bool _1232 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1234 = _1230 || _1232;
    float _1236 = fma(_1218, _1218, _1224);
    float _1238 = fma(_1222, _1222, _1236);
    float _1240 = sqrt(_1238);
    bool _1242 = _1240 > 0.0;
    bool _1244 = !_1242;
    float _1246 = _1206;
    float _1248 = _1204;
    float _1250 = _1208;
    float _1252 = _1210;
    if (!_1244)
    {
        float _1254 = _204 * _204;
        float _1256 = fma(_200, _200, _1254);
        float _1258 = fma(_206, _206, _1256);
        float _1260 = rsqrt(_1238);
        float _1262 = sqrt(_1258);
        float _1264 = _1218 * _1260;
        float _1266 = _1214 * _1260;
        float _1268 = _1222 * _1260;
        bool _1270 = _1262 > 0.0;
        bool _1272 = !_1270;
        _1252 = _1258;
        if (!_1272)
        {
            float _1274 = rsqrt(_1258);
            float _1276 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1278 = _204 * _1274;
            float _1280 = _200 * _1274;
            float _1282 = _1266 * _1278;
            float _1284 = _206 * _1274;
            float _1286 = fma(_1264, _1280, _1282);
            float _1288 = _1276 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1290 = fma(_1268, _1284, _1286);
            float _1292 = _1290 * _1288;
            float _1294 = fma(_200, _1292, _1206);
            float _1296 = fma(_204, _1292, _1204);
            float _1298 = fma(_206, _1292, _1208);
            _1246 = _1294;
            _1248 = _1296;
            _1250 = _1298;
            _1252 = _1274;
        }
    }
    float _1300 = _1246;
    float _1302 = _1248;
    float _1304 = _1250;
    float _1306 = _1252;
    float _1308 = _1302;
    float _1310 = _1300;
    float _1312 = _1304;
    if (!_1234)
    {
        float _1314 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1316 = _692 + _1314;
        float _1318 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1320 = _730 + _1318;
        float _1322 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1324 = -_730;
        float _1326 = _1324 + _1300;
        float _1328 = _1316 * _1316;
        float _1330 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1332 = _694 + _1330;
        float _1334 = fma(_1320, _1320, _1328);
        float _1336 = fma(_1332, _1332, _1334);
        float _1338 = sqrt(_1336);
        float _1340 = precise::min(_1338, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1342 = _1340 * _1322;
        float _1344 = -_692;
        float _1346 = _1344 + _1302;
        float _1348 = -_694;
        float _1350 = _1348 + _1304;
        float _1352 = fma(_1326, _1342, _730);
        float _1354 = fma(_1346, _1342, _692);
        float _1356 = fma(_1350, _1342, _694);
        _1308 = _1354;
        _1310 = _1352;
        _1312 = _1356;
    }
    float _1358 = _1308;
    float _1360 = _1310;
    float _1362 = _1312;
    float _1364 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1366 = _1358 + _1364;
    float _1368 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1370 = _1360 + _1368;
    float _1372 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1374 = _1362 + _1372;
    float _1376 = _1366 * _1366;
    float _1378 = fma(_1370, _1370, _1376);
    float _1380 = fma(_1374, _1374, _1378);
    float _1382 = rsqrt(_1380);
    float _1384 = sqrt(_1380);
    float _1386 = _1382 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1388 = _1370 * _1386;
    float _1390 = _1374 * _1386;
    float _1392 = _1388 * _1388;
    float _1394 = _1390 * _1390;
    float _1396 = _1392 + _1394;
    float _1398 = sqrt(_1396);
    bool _1400 = _1398 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1402 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1404 = _1398 + _1402;
    float _1406 = _1374;
    float _1408 = _1382;
    float _1410 = _1404;
    float _1412 = _1376;
    float _1414 = _1366;
    if (_1400)
    {
        float _1416 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1406 = _1416;
    }
    float _1418 = _1406;
    if (_1400)
    {
        float _1420 = rsqrt(_1396);
        _1408 = _1420;
    }
    float _1422 = _1408;
    float _1424 = _1422;
    if (_1400)
    {
        float _1426 = _1404 * _1418;
        _1410 = _1426;
    }
    float _1428 = _1410;
    if (_1400)
    {
        float _1430 = _1428 * 0.15915493667125701904296875;
        _1412 = _1430;
    }
    float _1432 = _1412;
    float _1434 = _1418;
    float _1436 = _1432;
    if (_1400)
    {
        float _1438 = _1432 * 6.283185482025146484375;
        float _1440 = sin(_1438);
        _1434 = _1440;
    }
    float _1442 = _1434;
    float _1444 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1446 = precise::max(0.0, _1444);
    float _1448 = _1306;
    float _1450 = _1446;
    if (_1400)
    {
        float _1452 = _1432 * 6.283185482025146484375;
        float _1454 = cos(_1452);
        _1448 = _1454;
    }
    float _1456 = _1448;
    float _1458 = -_1386;
    float _1460 = -_1446;
    float _1462 = fma(_1366, _1458, _1460);
    if (_1400)
    {
        float _1464 = _1462 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1450 = _1464;
    }
    float _1466 = _1450;
    float _1468 = _1442;
    float _1470 = _1466;
    if (_1400)
    {
        float _1472 = fma(_1442, _1466, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1414 = _1472;
    }
    float _1474 = _1414;
    float _1476 = _1474;
    if (!_1400)
    {
        _1468 = _1388;
    }
    float _1478 = _1468;
    float _1480 = _1478;
    float _1482 = _1456;
    if (_1400)
    {
        float _1484 = _1456 + (-1.0);
        _1470 = _1484;
    }
    float _1486 = _1470;
    float _1488 = 0.0;
    float _1490 = _1486;
    if (_1400)
    {
        float _1492 = _1422 * _1474;
        _1488 = _1492;
    }
    float _1494 = _1488;
    if (!_1400)
    {
        _1476 = _1462;
    }
    float _1496 = _1476;
    float _1498 = _1496;
    if (_1400)
    {
        float _1500 = _1486 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1436 = _1500;
    }
    float _1502 = _1436;
    if (_1400)
    {
        float _1504 = _1388 * _1494;
        _1480 = _1504;
    }
    float _1506 = _1480;
    if (!_1400)
    {
        _1490 = _1390;
    }
    float _1508 = _1490;
    float _1510 = _1508;
    if (_1400)
    {
        float _1512 = _1390 * _1494;
        _1510 = _1512;
    }
    float _1514 = _1510;
    if (!_1400)
    {
        _1424 = _1392;
    }
    float _1516 = _1424;
    float _1518 = _1516;
    if (_1400)
    {
        float _1520 = fma(_1462, _1456, _1502);
        _1498 = _1520;
    }
    float _1522 = _1498;
    if (_1400)
    {
        float _1524 = _1506 * _1506;
        _1518 = _1524;
    }
    float _1526 = _1518;
    if (!_1400)
    {
        _1482 = _1394;
    }
    float _1528 = _1482;
    float _1530 = _1528;
    if (_1400)
    {
        float _1532 = _1514 * _1514;
        _1530 = _1532;
    }
    float _1534 = _1530;
    float _1536 = fma(_1522, _1522, _1526);
    float _1538 = _1358 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1540 = _1358 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1542 = _1358 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1544 = _1536 + _1534;
    float _1546 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1548 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1550 = fma(_1384, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1548);
    float _1552 = precise::clamp(_1550, 0.0, 1.0);
    float _1554 = _1358 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1556 = rsqrt(_1544);
    float _1558 = fma(_1360, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1538);
    float _1560 = -_1552;
    float _1562 = _1560 + 1.0;
    float _1564 = fma(_1360, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1540);
    float _1566 = fma(_1360, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1554);
    float _1568 = fma(_1362, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1558);
    float _1570 = fma(_1360, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1542);
    float _1572 = fma(_1362, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1564);
    float _1574 = abs(_1562);
    float _1576 = log2(_1574);
    float _1578 = fma(_1362, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1566);
    float _1580 = _1568 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1582 = _1572 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1584 = fma(_1362, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1570);
    float _1586 = _1578 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1588 = _1580 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1590 = _1556 * _1506;
    float _1592 = _1586 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1594 = -_1588;
    float _1596 = fma(_1594, _1546, 1.0);
    float _1598 = _1556 * _1522;
    float _1600 = _1590 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1602 = fma(_1582, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1592);
    float _1604 = _1556 * _1514;
    float _1606 = _1584 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1608 = -_1600;
    float _1610 = fma(_1598, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1608);
    float _1612 = _1576 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1614 = fma(_1580, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1602);
    float _1616 = log2(_1596);
    float _1618 = -_1604;
    float _1620 = fma(_1618, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1610);
    float _1622 = _1586 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1624 = fma(_1606, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1614);
    float _1626 = _1586 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1628 = fma(_1620, -0.5, 0.5);
    float _1630 = fma(_1620, 0.5, 0.5);
    float _1632 = fma(_1582, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1622);
    float _1634 = exp2(_1612);
    float _1636 = fma(_1582, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1626);
    float _1638 = fma(_1630, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1640 = _1598 + 1.0;
    float _1642 = fma(_1580, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1632);
    float _1644 = fma(_1580, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1636);
    float _1646 = fma(_1630, _1638, -0.212114393711090087890625);
    float _1648 = 1.0 / _1624;
    float _1650 = fma(_1630, _1646, 1.570728778839111328125);
    float _1652 = sqrt(_1628);
    float _1654 = -_1598;
    float _1656 = fma(_1634, _1640, _1654);
    float _1658 = fma(_1606, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1642);
    float _1660 = fma(_1606, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1644);
    float _1662 = _1616 * 0.693147182464599609375;
    float _1664 = _1658 * _1648;
    float _1666 = _1660 * _1648;
    float _1668 = _1662 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1670 = fma(_1664, 0.5, 0.5);
    float _1672 = fma(_1666, -0.5, 0.5);
    float _1674 = _1652 * 0.636619746685028076171875;
    float3 _5482 = float3(_1670, _1672, _1668);
    float _1676 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5482, float3(0.0), isnan(_5482)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5482, float3(0.0), isnan(_5482)), level(0.0)).x;
    float _1678 = -_1650;
    float _1680 = fma(_1674, _1678, 1.0);
    float _1682 = fma(_1656, 0.5, 0.5);
    float3 _5500 = float3(_1670, _1672, _1668);
    float4 _1685 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5500, float3(0.0), isnan(_5500)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5500, float3(0.0), isnan(_5500)), level(0.0)).xyzw;
    float _1687 = _1685.x;
    float _1689 = _1685.y;
    float _1691 = _1685.z;
    float _1693 = _1685.w;
    float2 _5517 = float2(_1680, _1682);
    float3 _1697 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5517, float2(0.0), isnan(_5517)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5517, float2(0.0), isnan(_5517)), level(0.0)).xyz;
    float _1699 = _1697.x;
    float _1701 = _1697.y;
    float _1703 = _1697.z;
    float _1705 = in.m_67.y;
    float _1707 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1709 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1711 = _1709 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1713 = in.m_67.w;
    float _1715 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1717 = _1715 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1719 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1721 = _1719 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1723 = in.m_59.w;
    float _1725 = 1.0 / _1711;
    bool _1727 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _1729 = _1576 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1731 = in.m_67.x;
    int _1733 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1735 = _1733 != 0;
    float _1737 = _500 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1739 = in.m_67.z;
    float _1741 = 1.0 / _1717;
    float _1743 = _498 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1745 = in.m_69.y;
    int _1747 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1749 = _1747 != 0;
    float _1751 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1753 = _1751 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1755 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1757 = _1755 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1759 = 1.0 / _1721;
    bool _1761 = _570 > 0.5;
    out.m_71.y = _1705;
    float _1763 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1765 = _1763 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    out.m_71.w = _1713;
    bool _1767 = _1723 > 0.5;
    float _1769 = 1.0 / _1753;
    float _1771 = _1723;
    bool _1773 = _1727;
    bool _1775 = _1767;
    float _1777 = _1624;
    float _1779 = _1660;
    float _1781 = _1658;
    if (_1727)
    {
        _1771 = _776;
    }
    float _1783 = _1771;
    float _1785 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1787 = _1785 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    out.m_71.x = _1731;
    int _1789 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1791 = _1789 != 0;
    float _1793 = _502 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _1795 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1797 = _1795 != 0;
    float _1799 = 1.0 / _1757;
    float _1801 = _1783;
    if (!_1727)
    {
        _1801 = _776;
    }
    float _1803 = _1801;
    float _1805 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1807 = _1805 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1809 = -_1745;
    float _1811 = _1809 + 1.0;
    float _1813 = _1745;
    int _1815 = as_type<int>(_1811);
    if (_1735)
    {
        bool _1817 = _552 > 0.5;
        _1773 = _1817;
    }
    bool _1819 = _1773;
    float _1821 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1823 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1821;
    out.m_71.z = _1739;
    float _1825 = 1.0 / _1765;
    float _1827 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1829 = _1827 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1831 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1833 = _1831 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1835 = _1823 * _1741;
    float _1837 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1839 = _1837 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    int _1841 = _1767 ? as_type<int>(_1811) : as_type<int>(_1745);
    float _1843 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1845 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1843;
    if (_1749)
    {
        bool _1847 = _544 > 0.5;
        _1775 = _1847;
    }
    bool _1849 = _1775;
    float _1851 = 1.0 / _1787;
    float _1853 = _1833 * _1759;
    float _1855 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1857 = _1855 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    float _1859 = _1845 * _1725;
    float _1861 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _1863 = _1861 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _1865 = in.m_69.x;
    float _1867 = 1.0 / _1829;
    float _1869 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _1871 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _1869;
    float _1873 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _1875 = _1873 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1877 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1879 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _1877;
    bool _1881 = _532 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1883 = isnan(_532);
    bool _1885 = _1881 || _1883;
    bool _1887 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1889 = _1885 || _1887;
    float _1891 = float(_1889);
    float _1893 = _1871 * _1769;
    float _1895 = _1879 * _1799;
    float _1897 = 1.0 / _1807;
    float _1899 = _1875 * _1825;
    float _1901 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1903 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _1901;
    float _1905 = _1863 * _1851;
    float _1907 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _1909 = _1907 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1911 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _1913 = _1911 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1915 = -_1891;
    float _1917 = _1915 + 1.0;
    float _1919 = 1.0 / _1839;
    float _1921 = _1903 * _1867;
    float _1923 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1925 = _532 + _1923;
    bool _1927 = _532 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1929 = isnan(_532);
    bool _1931 = _1927 || _1929;
    bool _1933 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1935 = _1931 || _1933;
    float _1937 = float(_1935);
    float _1939 = fma(_1853, _1925, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    bool _1941 = _532 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1943 = isnan(_532);
    bool _1945 = _1941 || _1943;
    bool _1947 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1949 = _1945 || _1947;
    float _1951 = float(_1949);
    float _1953 = 1.0 / _1857;
    float _1955 = _1909 * _1897;
    float _1957 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1959 = _532 + _1957;
    float _1961 = -_1951;
    float _1963 = _1961 + 1.0;
    float _1965 = fma(_1859, _1959, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1967 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1969 = _532 + _1967;
    float _1971 = _1913 * _1919;
    float _1973 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1975 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _1973;
    bool _1977 = _532 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _1979 = isnan(_532);
    bool _1981 = _1977 || _1979;
    bool _1983 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _1985 = _1981 || _1983;
    float _1987 = float(_1985);
    float _1989 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1991 = _532 + _1989;
    float _1993 = fma(_1905, _1969, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _1995 = _1951 * _1917;
    float _1997 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1999 = fma(_1835, _1991, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _2001 = _1975 * _1953;
    float _2003 = -_1987;
    float _2005 = _2003 + 1.0;
    float _2007 = _1891 * _2005;
    float _2009 = _1891;
    float _2011 = _1951;
    int _2013 = as_type<int>(_1999);
    float _2015 = _1965;
    float _2017 = _1987;
    if (!_1735)
    {
        _2009 = _1865;
    }
    float _2019 = _2009;
    float _2021 = exp2(_1729);
    bool _2023 = _532 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _2025 = isnan(_532);
    bool _2027 = _2023 || _2025;
    bool _2029 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _2031 = _2027 || _2029;
    float _2033 = float(_2031);
    float _2035 = _2019;
    if (!_1735)
    {
        _2011 = _2019;
    }
    float _2037 = _2011;
    float _2039 = _2037;
    if (_1735)
    {
        _2035 = _1865;
    }
    float _2041 = _2035;
    float _2043 = _1937 * _1963;
    float _2045 = -_1937;
    float _2047 = _2045 + 1.0;
    float _2049 = _1791 ? as_type<float>(_1841) : _1745;
    float _2051 = _1707 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (_1797)
    {
        float _2053 = _1761 ? _1811 : _1745;
        _1813 = _2053;
    }
    float _2055 = _1813;
    float _2057 = _2055;
    if (_1735)
    {
        float _2059 = -_2041;
        float _2061 = _2059 + 1.0;
        _1815 = as_type<int>(_2061);
    }
    int _2063 = _1815;
    float _2065 = _2033 * _2047;
    float _2067 = _1997 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2069 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _2071 = _1803 + _2069;
    float _2073 = fma(_2051, _2055, -0.5);
    if (_1735)
    {
        float _2075 = _1819 ? as_type<float>(_2063) : _2041;
        _2039 = _2075;
    }
    float _2077 = _2039;
    float _2079 = _1999 * _2065;
    float _2081 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _2083 = _1803 + _2081;
    if (_1749)
    {
        float _2085 = -_2041;
        float _2087 = _2085 + 1.0;
        _2013 = as_type<int>(_2087);
    }
    int _2089 = _2013;
    if (!_1749)
    {
        _2057 = _2041;
    }
    float _2091 = _2057;
    float _2093 = -_652;
    float _2095 = fma(_794, _2073, _2093);
    float _2097 = fma(_1899, _2083, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    float _2099 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _2101 = _1803 + _2099;
    float _2103 = _2091;
    if (_1749)
    {
        float _2105 = _1849 ? as_type<float>(_2089) : _2041;
        _2103 = _2105;
    }
    float _2107 = _2103;
    float _2109 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _2111 = _1803 + _2109;
    float _2113 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _2115 = _1803 + _2113;
    float _2117 = fma(_2001, _2101, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _2119 = fma(_2049, _2067, -0.5);
    float _2121 = -_2033;
    float _2123 = _2121 + 1.0;
    float _2125 = fma(_1895, _2111, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    bool _2127 = _1803 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _2129 = isnan(_1803);
    bool _2131 = _2127 || _2129;
    bool _2133 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _2135 = _2131 || _2133;
    float _2137 = float(_2135);
    float _2139 = fma(_1921, _2115, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    float _2141 = _692 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2143 = _692 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2145 = fma(_1893, _2071, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    float _2147 = fma(_2123, (*spvDescriptorSet0.vp_c9)._m0[115].x, _2079);
    float _2149 = -_874;
    float _2151 = fma(_732, _2119, _2149);
    bool _2153 = _1803 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _2155 = isnan(_1803);
    bool _2157 = _2153 || _2155;
    bool _2159 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _2161 = _2157 || _2159;
    float _2163 = float(_2161);
    float _2165 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _2167 = _1803 + _2165;
    float _2169 = fma(_730, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2141);
    float _2171 = -_2137;
    float _2173 = _2171 + 1.0;
    float _2175 = fma(_730, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2143);
    float _2177 = fma(_1939, _2043, _2147);
    float _2179 = fma(_1971, _2167, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    bool _2181 = _1803 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _2183 = isnan(_1803);
    bool _2185 = _2181 || _2183;
    bool _2187 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _2189 = _2185 || _2187;
    float _2191 = float(_2189);
    float _2193 = _2163 * _2173;
    float _2195 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _2197 = _1803 + _2195;
    float _2199 = fma(_694, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2175);
    float _2201 = -_2163;
    float _2203 = _2201 + 1.0;
    float _2205 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2207 = _2145 * _2193;
    float _2209 = fma(_1955, _2197, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _2211 = -_2191;
    float _2213 = _2211 + 1.0;
    float _2215 = _2199 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    bool _2217 = _1803 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _2219 = isnan(_1803);
    bool _2221 = _2217 || _2219;
    bool _2223 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _2225 = _2221 || _2223;
    float _2227 = float(_2225);
    float _2229 = fma(_2203, (*spvDescriptorSet0.vp_c9)._m0[151].x, _2207);
    float _2231 = _2137 * _2213;
    float _2233 = 1.0 / _2215;
    bool _2235 = _1803 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _2237 = isnan(_1803);
    bool _2239 = _2235 || _2237;
    bool _2241 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _2243 = _2239 || _2241;
    float _2245 = float(_2243);
    float _2247 = -_2227;
    float _2249 = _2247 + 1.0;
    bool _2251 = _1803 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _2253 = isnan(_1803);
    bool _2255 = _2251 || _2253;
    bool _2257 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _2259 = _2255 || _2257;
    float _2261 = float(_2259);
    float _2263 = fma(_694, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2169);
    bool _2265 = _1803 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _2267 = isnan(_1803);
    bool _2269 = _2265 || _2267;
    bool _2271 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _2273 = _2269 || _2271;
    float _2275 = float(_2273);
    float _2277 = -_2245;
    float _2279 = _2277 + 1.0;
    bool _2281 = _1803 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _2283 = isnan(_1803);
    bool _2285 = _2281 || _2283;
    bool _2287 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _2289 = _2285 || _2287;
    float _2291 = float(_2289);
    float _2293 = _2191 * _2249;
    float _2295 = -_2261;
    float _2297 = _2295 + 1.0;
    float _2299 = fma(_2097, _2231, _2229);
    float _2301 = _2263 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _2303 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2305 = isnan(0.5);
    bool _2307 = _2303 || _2305;
    bool _2309 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2311 = _2307 || _2309;
    float _2313 = _2227 * _2279;
    float _2315 = _2245 * _2297;
    float _2317 = fma(_2125, _2293, _2299);
    float _2319 = -_2291;
    float _2321 = _2319 + 1.0;
    float _2323 = _2205 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2325 = _2301 + _2215;
    float _2327 = fma(_2179, _2313, _2317);
    float _2329 = -_2275;
    float _2331 = _2329 + 1.0;
    float _2333 = _2275 * _2321;
    float _2335 = fma(_2323, _2077, -0.5);
    float _2337 = _2325 * _2233;
    float _2339 = _2337 * 0.5;
    float _2341 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2343 = in.m_73.x;
    float _2345 = in.m_73.y;
    float _2347 = in.m_73.z;
    float _2349 = fma(_1965, _1995, _2177);
    bool _2351 = _954 != 0.0;
    bool _2353 = isnan(_954);
    bool _2355 = _2351 || _2353;
    bool _2357 = isnan(0.0);
    bool _2359 = _2355 || _2357;
    float _2361 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2363 = fma(_2339, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2361);
    if (!_2311)
    {
        _2015 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _2365 = _2015;
    float _2367 = fma(_1993, _2007, _2349);
    bool _2369 = _952 == 0.0;
    bool _2371 = !_2359;
    bool _2373 = _2369 && _2371;
    float _2375 = fma(_814, _2335, _822);
    float _2377 = _2095 + 0.5;
    float _2379 = fma(_1987, (*spvDescriptorSet0.vp_c9)._m0[119].x, _2367);
    float _2381 = 1.0 / _2363;
    if (!_2311)
    {
        float _2383 = -_2365;
        float _2385 = _2383 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _2017 = _2385;
    }
    float _2387 = _2017;
    bool _2389 = _956 == 0.0;
    bool _2391 = _2389 && _2373;
    float _2393 = _2261 * _2331;
    float _2395 = fma(_2139, _2315, _2327);
    float _2397 = _2341 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2399 = -_2021;
    float _2401 = _2399 + 1.0;
    float _2403 = _1793 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2405 = _2367;
    if (!_2311)
    {
        float _2407 = 1.0 / _2387;
        _2405 = _2407;
    }
    float _2409 = _2405;
    float _2411 = fma(_2397, _2107, -0.5);
    float _2413 = fma(_2209, _2393, _2395);
    float _2415 = _1743 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2417 = _2379 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2419 = fma(_768, _2411, _852);
    float _2421 = _2375 + 0.5;
    float _2423 = _2345;
    float _2425 = _2343;
    float _2427 = _2347;
    if (!_2391)
    {
        float _2429 = fma(_954, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2345);
        _2423 = _2429;
    }
    float _2431 = _2423;
    float _2433 = _2381;
    if (!_2311)
    {
        float _2435 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2437 = -_2365;
        float _2439 = fma(_2381, _2435, _2437);
        _1158 = _2439;
    }
    float _2441 = _1158;
    if (!_2391)
    {
        float _2443 = fma(_952, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2343);
        _2425 = _2443;
    }
    float _2445 = _2425;
    float _2447 = _2151 + 0.5;
    float _2449 = _2419 + 0.5;
    if (_2311)
    {
        _1160 = 1.0;
    }
    float _2451 = _1160;
    float _2453 = _1044 * _1116;
    float _2455 = _2451;
    if (!_2391)
    {
        float _2457 = fma(_956, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2347);
        _2427 = _2457;
    }
    float _2459 = _2427;
    float _2461 = _1062 * _1098;
    if (!_2311)
    {
        float _2463 = _2441 * _2409;
        float _2465 = precise::clamp(_2463, 0.0, 1.0);
        _2455 = _2465;
    }
    float _2467 = _2455;
    float _2469 = _1044 * _1098;
    out.m_75.x = _2421;
    out.m_75.y = _2377;
    out.m_75.z = _2449;
    out.m_75.w = _2447;
    float _2471 = _1044 * _1094;
    float _2473 = fma(_1048, _1076, _2461);
    float _2475 = fma(_2117, _2333, _2413);
    float _2477 = -_1028;
    float _2479 = fma(_2477, _1078, _2453);
    float _2481 = _1060 * _1098;
    float _2483 = _2401 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2485 = fma(_2291, (*spvDescriptorSet0.vp_c9)._m0[158].x, _2475);
    float _2487 = _1737 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2489 = _1062 * _1116;
    float _2491 = _1062 * _1094;
    float _2493 = _1060 * _1116;
    float _2495 = fma(_1046, _964, _2479);
    float _2497 = fma(_1048, _1078, _2489);
    float _2499 = -_1028;
    float _2501 = fma(_2499, _1076, _2469);
    float _2503 = -_1028;
    float _2505 = fma(_2503, _1082, _2471);
    float _2507 = _1060 * _1094;
    float _2509 = fma(_1048, _1082, _2491);
    float _2511 = fma(_1046, _960, _2501);
    float _2513 = fma(_1046, _962, _2505);
    float _2515 = fma(_1056, _960, _2473);
    out.m_77.x = _2415;
    out.m_77.y = _2487;
    out.m_77.z = _2403;
    out.m_77.w = _2417;
    float _2517 = _2511 * _2431;
    float _2519 = fma(_1056, _964, _2497);
    float _2521 = _2495 * _2431;
    float _2523 = fma(_1050, _1082, _2507);
    float _2525 = fma(_2515, _2445, _2517);
    float _2527 = _2515;
    float _2529 = _2519;
    if (!_2311)
    {
        _2527 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _2531 = _2527;
    float _2533 = fma(_1056, _962, _2509);
    float _2535 = _2513 * _2431;
    float _2537 = fma(_2519, _2445, _2521);
    float _2539 = fma(_1070, _962, _2523);
    float _2541 = _2531;
    if (!_2311)
    {
        float _2543 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2545 = -_2531;
        float _2547 = fma(_2381, _2543, _2545);
        _2433 = _2547;
    }
    float _2549 = _2433;
    float _2551 = _2549;
    if (!_2311)
    {
        float _2553 = -_2531;
        float _2555 = _2553 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _2541 = _2555;
    }
    float _2557 = _2541;
    float _2559 = fma(_2533, _2445, _2535);
    float _2561 = fma(_1050, _1076, _2481);
    float _2563 = fma(_1050, _1078, _2493);
    float _2565 = _1586 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_79.x = _2485;
    float _2567 = fma(_1070, _960, _2561);
    float _2569 = fma(_1070, _964, _2563);
    float _2571 = _2557;
    if (!_2311)
    {
        float _2573 = 1.0 / _2557;
        _2571 = _2573;
    }
    float _2575 = _2571;
    float _2577 = fma(_1582, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2565);
    float _2579 = fma(_2567, _2459, _2525);
    float _2581 = fma(_2569, _2459, _2537);
    float _2583 = fma(_2539, _2459, _2559);
    float _2585 = fma(_1580, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2577);
    bool _2587 = _1384 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2589 = isnan(_1384);
    bool _2591 = _2587 || _2589;
    bool _2593 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2595 = _2591 || _2593;
    float _2597 = _1658 + _1624;
    float _2599 = _1624 * 0.5;
    out.m_81.x = _2579;
    out.m_81.y = _2581;
    out.m_81.z = _2583;
    float _2601 = fma(_1606, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2585);
    float _2603 = _2483 * _1676;
    float _2605 = -_2483;
    float _2607 = _2605 + 1.0;
    float _2609 = _2601 + _1624;
    out.gl_Position.x = _1658;
    out.gl_Position.y = _1660;
    out.gl_Position.z = _2601;
    out.gl_Position.w = _1624;
    float _2611 = _2599;
    float _2613 = _2601;
    if (!_2311)
    {
        float _2615 = _2549 * _2575;
        float _2617 = precise::clamp(_2615, 0.0, 1.0);
        _2551 = _2617;
    }
    float _2619 = _2551;
    float _2621 = _1693 * _2603;
    float _2623 = _1693 * _2607;
    float _2625 = _2609 * 0.5;
    float _2627 = _2597 * 0.5;
    float _2629 = _1703 * _2603;
    float _2631 = fma(_1699, _2621, _1687);
    float _2633 = fma(_1701, _2621, _1689);
    float _2635 = fma(_1660, -0.5, _2599);
    float _2637 = fma(_1693, _2629, _1691);
    if (!_2595)
    {
        _2529 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2639 = _2529;
    float _2641 = _2639;
    float _2643 = _2639;
    if (!_2595)
    {
        _2611 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2645 = _2611;
    out.m_83.x = _2627;
    out.m_83.y = _2635;
    out.m_83.z = _2625;
    out.m_83.w = _1624;
    float _2647 = _2645;
    float _2649 = _2645;
    if (_2311)
    {
        _1777 = 1.0;
    }
    float _2651 = _1777;
    float _2653 = _2651;
    if (!_2311)
    {
        float _2655 = -_2619;
        float _2657 = _2655 + 1.0;
        _2653 = _2657;
    }
    float _2659 = _2653;
    if (!_2595)
    {
        _2613 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2661 = _2613;
    out.m_85.x = _2631;
    out.m_85.y = _2633;
    out.m_85.z = _2637;
    out.m_85.w = _2623;
    float _2663 = _2661;
    float _2665 = _2661;
    if (!_2595)
    {
        _1779 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2667 = _1779;
    float _2669 = _2467 * _2659;
    float _2671 = _2669;
    float _2673 = _2667;
    float _2675 = _2667;
    if (!_2595)
    {
        _1781 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2677 = _1781;
    float _2679 = _2669 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2681 = _2677;
    float _2683 = _2677;
    if (!_2595)
    {
        _2671 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2685 = _2671;
    bool _2687 = !_2595;
    float _2689 = _2685;
    float _2691 = _2685;
    if (!_2687)
    {
        bool _2693 = _1384 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2695 = isnan(_1384);
        bool _2697 = _2693 || _2695;
        bool _2699 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2701 = _2697 || _2699;
        if (!_2701)
        {
            float _2703 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2705 = _1384 + _2703;
            float _2707 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2709 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2707;
            float _2711 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2713 = _2711 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2715 = 1.0 / _2709;
            float _2717 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2719 = _2717 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2721 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2723 = _2721 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2725 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2727 = _2725 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2729 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2731 = _2729 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2733 = _2705 * _2715;
            float _2735 = precise::clamp(_2733, 0.0, 1.0);
            float _2737 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2739 = _2737 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2741 = fma(_2735, _2713, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2743 = fma(_2735, _2739, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2745 = fma(_2735, _2719, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2747 = fma(_2735, _2723, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2749 = fma(_2735, _2727, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2751 = fma(_2735, _2731, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2675 = _2745;
            _2649 = _2749;
            _2665 = _2741;
            _2643 = _2747;
            _2683 = _2743;
            _2691 = _2751;
            _2753 = true;
        }
        else
        {
            bool _2755 = _1384 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2757 = isnan(_1384);
            bool _2759 = _2755 || _2757;
            bool _2761 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2763 = _2759 || _2761;
            if (!_2763)
            {
                _2663 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2765 = _2663;
            _2665 = _2765;
            if (!_2763)
            {
                _2673 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2767 = _2673;
            _2675 = _2767;
            if (!_2763)
            {
                _2681 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2769 = _2681;
            _2683 = _2769;
            if (!_2763)
            {
                _2641 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2771 = _2641;
            _2643 = _2771;
            if (!_2763)
            {
                _2647 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2773 = _2647;
            _2649 = _2773;
            if (!_2763)
            {
                _2689 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2775 = _2689;
            bool _2777 = !_2763;
            _2691 = _2775;
            if (!_2777)
            {
                bool _2779 = _1384 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2781 = isnan(_1384);
                bool _2783 = _2779 || _2781;
                bool _2785 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2787 = _2783 || _2785;
                if (!_2787)
                {
                    float _2789 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2791 = _1384 + _2789;
                    float _2793 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2795 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2793;
                    float _2797 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2799 = _2797 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2801 = 1.0 / _2795;
                    float _2803 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2805 = _2803 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2807 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2809 = _2807 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2811 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2813 = _2811 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2815 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2817 = _2815 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2819 = _2791 * _2801;
                    float _2821 = precise::clamp(_2819, 0.0, 1.0);
                    float _2823 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2825 = _2823 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2827 = fma(_2821, _2799, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2829 = fma(_2821, _2825, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2831 = fma(_2821, _2805, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2833 = fma(_2821, _2809, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2835 = fma(_2821, _2813, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2837 = fma(_2821, _2817, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2675 = _2831;
                    _2649 = _2835;
                    _2665 = _2827;
                    _2643 = _2833;
                    _2683 = _2829;
                    _2691 = _2837;
                    _2753 = true;
                }
                else
                {
                    _2675 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2649 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2665 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2643 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2683 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2691 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2753 = false;
    float _2839 = _2675;
    float _2841 = _2649;
    float _2843 = _2665;
    float _2845 = _2643;
    float _2847 = _2683;
    float _2849 = _2691;
    float _2851 = _2679 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2853 = fma(_2581, -0.5, 0.5);
    float _2855 = precise::clamp(_2853, 0.0, 1.0);
    float _2857 = -_2839;
    float _2859 = _2857 + _2841;
    float _2861 = -_2843;
    float _2863 = _2861 + _2845;
    out.m_47.x = _2851;
    float _2865 = -_2847;
    float _2867 = _2865 + _2849;
    float _2869 = fma(_2855, _2859, _2839);
    float _2871 = fma(_2855, _2863, _2843);
    bool _2873 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2875 = _2869 * 0.586610972881317138671875;
    float _2877 = fma(_2855, _2867, _2847);
    out.m_87.x = 0.0;
    bool _2879 = _2467 > 0.0;
    bool _2881 = isnan(_2467);
    bool _2883 = _2879 || _2881;
    bool _2885 = isnan(0.0);
    bool _2887 = _2883 || _2885;
    float _2889 = fma(_2871, 0.298911988735198974609375, _2875);
    bool _2891 = _2659 <= 0.0;
    bool _2893 = !_2887;
    bool _2895 = _2891 || _2893;
    float _2897 = fma(_2877, 0.114477999508380889892578125, _2889);
    float _2899 = -_2897;
    float _2901 = _2871 + _2899;
    float _2903 = -_2897;
    float _2905 = _2869 + _2903;
    float _2907 = -_2897;
    float _2909 = _2877 + _2907;
    float _2911 = fma(_2901, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2897);
    float _2913 = fma(_2905, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2897);
    float _2915 = fma(_2909, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2897);
    bool _2917 = !_2873;
    if (!_2917)
    {
        float _2919 = -_1358;
        float _2921 = _2919 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2923 = -_1360;
        float _2925 = _2923 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2927 = -_1362;
        float _2929 = _2927 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2931 = _2921 * _2921;
        float _2933 = fma(_2925, _2925, _2931);
        float _2935 = fma(_2929, _2929, _2933);
        float _2937 = sqrt(_2935);
        float _2939 = rsqrt(_2935);
        float _2941 = -_2937;
        float _2943 = _2941 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2945 = _2943 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2947 = precise::clamp(_2945, 0.0, 1.0);
        float _2949 = _2925 * _2939;
        float _2951 = _2921 * _2939;
        float _2953 = abs(_2947);
        float _2955 = log2(_2953);
        float _2957 = _2929 * _2939;
        float _2959 = _2949 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2961 = _2581 * _2951;
        float _2963 = -_2951;
        float _2965 = -_2959;
        float _2967 = fma(_2963, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2965);
        float _2969 = fma(_2579, _2949, _2961);
        float _2971 = -_2957;
        float _2973 = fma(_2971, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2967);
        float _2975 = fma(_2583, _2957, _2969);
        float _2977 = precise::clamp(_2975, 0.0, 1.0);
        float _2979 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2981 = _2973 + _2979;
        float _2983 = _2955 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2985 = _2981 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2987 = precise::clamp(_2985, 0.0, 1.0);
        float _2989 = exp2(_2983);
        float _2991 = _2989 * _2987;
        float _2993 = _2977 * _2991;
        float _2995 = _2993 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2997 = _2993 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2999 = _2993 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_87.x = _2995;
        out.m_87.y = _2997;
        out.m_87.z = _2999;
    }
    out.m_89.x = _2911;
    out.m_89.y = _2913;
    out.m_89.z = _2915;
    if (!_2895)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _3001 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3001;
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
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2753 = false;
    bool _524 = false;
    bool _344 = false;
    bool _230 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _103 = in.m_44.w;
    float _105 = trunc(_103);
    int _108 = int(_105);
    bool _112 = _108 >= 1;
    float _114 = 0.0;
    if (!_112)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _116 = _114;
    float _118 = _116;
    if (!_112)
    {
        out.m_47.x = 0.0;
    }
    int _120 = 0;
    if (!_112)
    {
        float _122 = _116 * 5.0;
        _120 = as_type<int>(_122);
    }
    int _124 = _120;
    int _126 = _124;
    if (!_112)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3058 = as_type<float>(_124);
        out.gl_Position.z = _3058;
    }
    if (!_112)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _128 = in.m_49.w;
    bool _130 = _128 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _132 = isnan(_128);
    bool _134 = _130 || _132;
    bool _136 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _138 = _134 || _136;
    float _140 = -_128;
    float _142 = _140 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _144 = 0.0;
    float _146 = _142;
    if (_138)
    {
        float _148 = float(_108);
        _144 = _148;
    }
    float _150 = _144;
    bool _152 = _142 >= _150;
    bool _154 = !_138;
    bool _156 = _152 || _154;
    if (_156)
    {
        _118 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _158 = _118;
    if (_156)
    {
        out.m_47.x = 0.0;
    }
    if (_156)
    {
        float _160 = _158 * 5.0;
        _126 = as_type<int>(_160);
    }
    int _162 = _126;
    if (_156)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3127 = as_type<float>(_162);
        out.gl_Position.z = _3127;
    }
    if (_156)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _164 = in.m_51.x;
    float _166 = in.m_51.y;
    float _168 = in.m_51.z;
    bool _170 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _172 = in.m_53.x;
    float _174 = in.m_53.y;
    float _176 = in.m_53.z;
    float _178 = in.m_55.x;
    float _180 = in.m_55.y;
    float _182 = in.m_55.z;
    float _184 = in.m_57.x;
    float _186 = in.m_57.y;
    float _188 = in.m_57.z;
    float _190 = _166 * _174;
    float _192 = _166 * _180;
    float _194 = fma(_164, _172, _190);
    float _196 = _166 * _186;
    float _198 = fma(_164, _178, _192);
    float _200 = fma(_168, _176, _194);
    float _202 = fma(_164, _184, _196);
    float _204 = fma(_168, _182, _198);
    float _206 = fma(_168, _188, _202);
    bool _208 = !_170;
    float _210 = _176;
    float _228;
    if (!_208)
    {
        float _212 = in.m_59.x;
        float _214 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _216 = _212 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _218 = fma(_216, (*spvDescriptorSet0.vp_c9)._m0[12].x, _142);
        float _220 = _218 * _214;
        float _222 = floor(_220);
        float _224 = -_222;
        float _226 = _220 + _224;
        _228 = _226;
        _230 = true;
    }
    else
    {
        float _232 = float(_108);
        float _234 = 1.0 / _232;
        float _236 = _142 * _234;
        _228 = _236;
    }
    _230 = false;
    float _238 = _228;
    float _240 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _242 = _238 + _240;
    bool _244 = _238 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _246 = isnan(_238);
    bool _248 = _244 || _246;
    bool _250 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _252 = _248 || _250;
    float _254 = float(_252);
    float _256 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _258 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _256;
    bool _260 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _262 = 1.0 / _258;
    float _264 = -_254;
    float _266 = _264 + 1.0;
    float _268 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _270 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _268;
    float _272 = _242 * _262;
    bool _274 = _238 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _276 = isnan(_238);
    bool _278 = _274 || _276;
    bool _280 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _282 = _278 || _280;
    float _284 = float(_282);
    float _286 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _288 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _286;
    float _290 = fma(_270, _272, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _292 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _294 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _292;
    float _296 = _284 * _266;
    float _298 = fma(_288, _272, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _300 = fma(_294, _272, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _302 = -_284;
    float _304 = _302 + 1.0;
    float _306 = _290 * _296;
    float _308 = _298 * _296;
    float _310 = _300 * _296;
    float _312 = fma(_304, (*spvDescriptorSet0.vp_c9)._m0[143].z, _306);
    float _314 = fma(_304, (*spvDescriptorSet0.vp_c9)._m0[143].x, _308);
    float _316 = fma(_304, (*spvDescriptorSet0.vp_c9)._m0[143].y, _310);
    float _318 = fma(_254, (*spvDescriptorSet0.vp_c9)._m0[144].z, _312);
    float _320 = fma(_254, (*spvDescriptorSet0.vp_c9)._m0[144].x, _314);
    float _322 = fma(_254, (*spvDescriptorSet0.vp_c9)._m0[144].y, _316);
    bool _324 = !_260;
    float _342;
    if (!_324)
    {
        float _326 = in.m_59.x;
        float _328 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _330 = _326 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _332 = fma(_330, (*spvDescriptorSet0.vp_c9)._m0[11].x, _142);
        float _334 = _332 * _328;
        float _336 = floor(_334);
        float _338 = -_336;
        float _340 = _334 + _338;
        _342 = _340;
        _344 = true;
    }
    else
    {
        float _346 = float(_108);
        float _348 = 1.0 / _346;
        float _350 = _142 * _348;
        _342 = _350;
    }
    _344 = false;
    float _352 = _342;
    float _354 = in.m_61.x;
    float _356 = in.m_61.y;
    float _358 = in.m_61.z;
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _362 = _352 + _360;
    bool _364 = _352 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _366 = isnan(_352);
    bool _368 = _364 || _366;
    bool _370 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _372 = _368 || _370;
    float _374 = float(_372);
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _378 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _376;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _382 = _380 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _384 = 1.0 / _378;
    bool _386 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _388 = 1.0 / _382;
    float _390 = -_374;
    float _392 = _390 + 1.0;
    float _394 = _318 * _358;
    float _396 = _362 * _384;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _400 = _352 + _398;
    bool _402 = _352 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _404 = isnan(_352);
    bool _406 = _402 || _404;
    bool _408 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _410 = _406 || _408;
    float _412 = float(_410);
    float _414 = _322 * _356;
    bool _416 = _352 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _418 = isnan(_352);
    bool _420 = _416 || _418;
    bool _422 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _424 = _420 || _422;
    float _426 = float(_424);
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _430 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _428;
    float _432 = _320 * _354;
    float _434 = _400 * _388;
    float _436 = _426 * _392;
    float _438 = -_426;
    float _440 = _438 + 1.0;
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _444 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _442;
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _448 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _446;
    float _450 = fma(_430, _396, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _452 = _412 * _440;
    float _454 = fma(_444, _396, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _456 = fma(_448, _396, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _458 = -_412;
    float _460 = _458 + 1.0;
    float _462 = _450 * _452;
    float _464 = _454 * _452;
    float _466 = _456 * _452;
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _470 = _468 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _474 = _472 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _478 = _476 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _480 = fma(_460, (*spvDescriptorSet0.vp_c9)._m0[107].x, _464);
    float _482 = fma(_460, (*spvDescriptorSet0.vp_c9)._m0[107].y, _466);
    float _484 = fma(_470, _434, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _486 = fma(_474, _434, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _488 = fma(_478, _434, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _490 = fma(_460, (*spvDescriptorSet0.vp_c9)._m0[107].z, _462);
    float _492 = fma(_484, _436, _480);
    float _494 = fma(_486, _436, _482);
    float _496 = fma(_488, _436, _490);
    float _498 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[109].x, _492);
    float _500 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[109].y, _494);
    float _502 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[109].z, _496);
    bool _504 = !_386;
    float _522;
    if (!_504)
    {
        float _506 = in.m_59.x;
        float _508 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _510 = _506 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _512 = fma(_510, (*spvDescriptorSet0.vp_c9)._m0[11].y, _142);
        float _514 = _512 * _508;
        float _516 = floor(_514);
        float _518 = -_516;
        float _520 = _514 + _518;
        _522 = _520;
        _524 = true;
    }
    else
    {
        float _526 = float(_108);
        float _528 = 1.0 / _526;
        float _530 = _142 * _528;
        _522 = _530;
    }
    _524 = false;
    float _532 = _522;
    float _534 = in.m_44.x;
    float _536 = in.m_44.y;
    float _538 = in.m_44.z;
    float _540 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _542 = log2(_540);
    float _544 = in.m_59.z;
    int _546 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _548 = _546 != 0;
    float _550 = _414 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _552 = in.m_59.x;
    int _554 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _556 = _554 != 0;
    int _558 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _560 = _558 != 0;
    int _562 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _564 = _562 != 0;
    float _566 = _432 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _568 = _394 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _570 = in.m_59.y;
    float _572 = in.m_57.w;
    float _574 = _542 * _142;
    float _576 = _174 * _536;
    float _578 = _180 * _536;
    float _580 = _186 * _536;
    float _582 = fma(_172, _534, _576);
    float _584 = fma(_178, _534, _578);
    float _586 = fma(_184, _534, _580);
    float _588 = _544 * 2.0;
    float _590 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _592 = _552 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _594 = fma(_176, _538, _582);
    float _596 = _570 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _598 = -_590;
    float _600 = fma(_592, 2.0, _598);
    float _602 = floor(_588);
    float _604 = _570 + _544;
    float _606 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _608 = _552 * 2.0;
    float _610 = _604 + (-1.0);
    float _612 = fma(_596, -2.0, _606);
    float _614 = fma(_182, _538, _584);
    float _616 = floor(_608);
    float _618 = fma(_188, _538, _586);
    float _620 = fma(_610, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _622 = _552 + _570;
    float _624 = _570 * 2.0;
    float _626 = in.m_55.w;
    float _628 = _608;
    if (!_548)
    {
        _210 = _570;
    }
    float _630 = _210;
    float _632 = _622 + (-1.0);
    float _634 = floor(_624);
    bool _636 = _602 > 0.0;
    float _638 = in.m_53.w;
    bool _640 = _602 >= 0.0;
    bool _642 = isnan(_602);
    bool _644 = _640 || _642;
    bool _646 = isnan(0.0);
    bool _648 = _644 || _646;
    float _650 = fma(_632, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _652 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[76].y, _612);
    float _654 = _632;
    float _656 = _630;
    if (!_548)
    {
        _628 = _544;
    }
    float _658 = _628;
    float _660 = exp2(_574);
    float _662 = _658;
    if (!_548)
    {
        _654 = _544;
    }
    float _664 = _654;
    float _666 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _668 = _664;
    if (_548)
    {
        _656 = _552;
    }
    float _670 = _656;
    if (_548)
    {
        _662 = _570;
    }
    float _672 = _662;
    if (_548)
    {
        _668 = _570;
    }
    float _674 = _668;
    bool _676 = _616 > 0.0;
    float _678 = _672 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _680 = _616 >= 0.0;
    bool _682 = isnan(_616);
    bool _684 = _680 || _682;
    bool _686 = isnan(0.0);
    bool _688 = _684 || _686;
    float _690 = fma(_674, (*spvDescriptorSet0.vp_c9)._m0[83].w, _666);
    float _692 = _614 + _626;
    float _694 = _618 + _572;
    int _696 = _648 ? 0 : 1;
    float _698 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _700 = _634 > 0.0;
    float _702 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _704 = float(_108);
    float _706 = fma(_670, (*spvDescriptorSet0.vp_c9)._m0[83].z, _698);
    float _708 = _670 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _710 = 1.0 / _704;
    int _712 = _688 ? 0 : 1;
    float _714 = -_702;
    float _716 = fma(_708, 2.0, _714);
    bool _718 = _634 >= 0.0;
    bool _720 = isnan(_634);
    bool _722 = _718 || _720;
    bool _724 = isnan(0.0);
    bool _726 = _722 || _724;
    float _728 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _730 = _594 + _638;
    float _732 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[82].w, _690);
    int _734 = _726 ? 0 : 1;
    float _736 = fma(_678, -2.0, _728);
    float _738 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _740 = 1.0 + _738;
    int _742 = ~_734;
    int _744 = _742 + 1;
    int _746 = _744 + 1;
    float _748 = -_660;
    float _750 = _748 + 1.0;
    int _752 = _746;
    if (!_700)
    {
        int _754 = ~_734;
        int _756 = _754 + 1;
        _752 = _756;
    }
    int _758 = _752;
    float _760 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _762 = in.m_63.x;
    float _764 = in.m_63.y;
    float _766 = in.m_63.z;
    float _768 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[82].z, _706);
    float _770 = fma(_570, (*spvDescriptorSet0.vp_c9)._m0[78].w, _760);
    bool _772 = !_556;
    int _774 = _772 ? 0 : 1;
    float _776 = _710 * _142;
    int _778 = ~_696;
    int _780 = _778 + 1;
    int _782 = _780 + 1;
    float _784 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _786 = _782;
    if (!_636)
    {
        int _788 = ~_696;
        int _790 = _788 + 1;
        _786 = _790;
    }
    int _792 = _786;
    float _794 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[77].w, _770);
    int _796 = abs(_774);
    float _798 = fma(_552, (*spvDescriptorSet0.vp_c9)._m0[78].z, _784);
    int _800 = ~_712;
    int _802 = _800 + 1;
    int _804 = _802 + 1;
    int _806 = _804;
    if (!_676)
    {
        int _808 = ~_712;
        int _810 = _808 + 1;
        _806 = _810;
    }
    int _812 = _806;
    float _814 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[77].z, _798);
    float _816 = 1.0 / _740;
    float _818 = float(_792);
    float _820 = -_142;
    float _822 = fma(_820, (*spvDescriptorSet0.vp_c9)._m0[76].x, _600);
    bool _824 = !_560;
    int _826 = _824 ? 0 : 1;
    float _828 = -_730;
    float _830 = _828 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    bool _832 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _834 = isnan(1.0);
    bool _836 = _832 || _834;
    bool _838 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _840 = _836 || _838;
    int _842 = abs(_826);
    float _844 = -_694;
    float _846 = _844 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _848 = float(_796);
    float _850 = -_142;
    float _852 = fma(_850, (*spvDescriptorSet0.vp_c9)._m0[81].x, _716);
    bool _854 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _856 = isnan(0.0);
    bool _858 = _854 || _856;
    bool _860 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _862 = _858 || _860;
    float _864 = -_692;
    float _866 = _864 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _868 = float(_842);
    float _870 = _848 * _818;
    float _872 = float(_812);
    float _874 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[81].y, _736);
    float _876 = _862 ? _750 : 0.0;
    float _878 = _870 * (-2.0);
    float _880 = _552 + (-0.5);
    float _882 = _868 * _872;
    float _884 = float(_758);
    float _886 = fma(_878, _762, _762);
    bool _888 = !_564;
    int _890 = _888 ? 0 : 1;
    if (_840)
    {
        float _892 = _876 * _816;
        _146 = _892;
    }
    float _894 = _146;
    float _896 = _866 * _866;
    float _898 = fma(_650, _878, _650);
    int _900 = abs(_890);
    float _902 = _882 * (-2.0);
    float _904 = fma(_830, _830, _896);
    float _906 = fma(_880, (*spvDescriptorSet0.vp_c9)._m0[196].x, _886);
    float _908 = fma(_620, _902, _620);
    float _910 = fma(_902, _764, _764);
    float _912 = _570 + (-0.5);
    float _914 = fma(_846, _846, _904);
    float _916 = float(_900);
    float _918 = fma(_898, _894, _906);
    float _920 = fma(_912, (*spvDescriptorSet0.vp_c9)._m0[196].y, _910);
    float _922 = _552 + _544;
    float _924 = _916 * _884;
    float _926 = rsqrt(_914);
    float _928 = fma(_908, _894, _920);
    float _930 = _922 + (-1.0);
    float _932 = _924 * (-2.0);
    float _934 = _918 * 0.15915493667125701904296875;
    float _936 = _928 * 0.15915493667125701904296875;
    float _938 = fma(_930, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _940 = fma(_932, _766, _766);
    float _942 = _544 + (-0.5);
    float _944 = _934 * 6.283185482025146484375;
    float _946 = sin(_944);
    float _948 = fma(_938, _932, _938);
    float _950 = fma(_942, (*spvDescriptorSet0.vp_c9)._m0[196].z, _940);
    float _952 = in.m_65.x;
    float _954 = in.m_65.y;
    float _956 = in.m_65.z;
    float _958 = fma(_948, _894, _950);
    float _960 = _830 * _926;
    float _962 = _846 * _926;
    float _964 = _866 * _926;
    float _966 = _958 * 0.15915493667125701904296875;
    float _968 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _970 = _960 * _968;
    float _972 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _974 = _962 * _972;
    float _976 = _934 * 6.283185482025146484375;
    float _978 = cos(_976);
    float _980 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _982 = -_970;
    float _984 = fma(_962, _980, _982);
    float _986 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _988 = -_974;
    float _990 = fma(_964, _986, _988);
    float _992 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _994 = _964 * _992;
    float _996 = _984 * _984;
    float _998 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1000 = -_994;
    float _1002 = fma(_960, _998, _1000);
    float _1004 = _936 * 6.283185482025146484375;
    float _1006 = sin(_1004);
    float _1008 = fma(_990, _990, _996);
    float _1010 = fma(_1002, _1002, _1008);
    float _1012 = _936 * 6.283185482025146484375;
    float _1014 = cos(_1012);
    float _1016 = _966 * 6.283185482025146484375;
    float _1018 = cos(_1016);
    float _1020 = _946 * _1006;
    float _1022 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _954);
    float _1024 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _952);
    float _1026 = _966 * 6.283185482025146484375;
    float _1028 = sin(_1026);
    float _1030 = _946 * _1014;
    float _1032 = _550 * _1022;
    float _1034 = _566 * _1024;
    float _1036 = _978 * _1006;
    float _1038 = _978 * _1014;
    float _1040 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _956);
    float _1042 = rsqrt(_1010);
    float _1044 = _978 * _1018;
    float _1046 = _946 * _1018;
    float _1048 = _1014 * _1018;
    float _1050 = _1006 * _1018;
    float _1052 = _568 * _1040;
    float _1054 = -_1036;
    float _1056 = fma(_1028, _1030, _1054);
    float _1058 = -_1030;
    float _1060 = fma(_1028, _1036, _1058);
    float _1062 = fma(_1028, _1038, _1020);
    float _1064 = _1044 * _1032;
    float _1066 = -_1032;
    float _1068 = _1028 * _1066;
    float _1070 = fma(_1028, _1020, _1038);
    float _1072 = _1046 * _1032;
    float _1074 = fma(_1062, _1034, _1064);
    float _1076 = _990 * _1042;
    float _1078 = _984 * _1042;
    float _1080 = fma(_1048, _1034, _1068);
    float _1082 = _1002 * _1042;
    float _1084 = _964 * _1076;
    float _1086 = _962 * _1078;
    float _1088 = fma(_1060, _1052, _1074);
    float _1090 = fma(_1056, _1034, _1072);
    float _1092 = -_1084;
    float _1094 = fma(_960, _1078, _1092);
    float _1096 = -_1086;
    float _1098 = fma(_964, _1082, _1096);
    float _1100 = fma(_1050, _1052, _1080);
    float _1102 = fma(_1070, _1052, _1090);
    float _1104 = _1094 * _1088;
    float _1106 = _1098 * _1088;
    float _1108 = _960 * _1082;
    float _1110 = fma(_1082, _1100, _1104);
    float _1112 = fma(_1076, _1100, _1106);
    float _1114 = -_1108;
    float _1116 = fma(_962, _1076, _1114);
    float _1118 = fma(_962, _1102, _1110);
    float _1120 = fma(_960, _1102, _1112);
    float _1122 = _1116 * _1088;
    float _1124 = _694 + _1118;
    float _1126 = _730 + _1120;
    float _1128 = fma(_1078, _1100, _1122);
    float _1130 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1132 = _1124 + _1130;
    float _1134 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1136 = _1126 + _1134;
    float _1138 = fma(_964, _1102, _1128);
    float _1140 = _1132 * _1132;
    float _1142 = _692 + _1138;
    float _1144 = fma(_1136, _1136, _1140);
    float _1146 = sqrt(_1144);
    bool _1148 = _1146 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1150 = _1104;
    float _1152 = _1126;
    float _1154 = _1124;
    float _1156 = _1100;
    float _1158 = _954;
    float _1160 = _952;
    if (!_1148)
    {
        _1150 = _1142;
    }
    float _1162 = _1150;
    bool _1164 = !_1148;
    float _1166 = _1162;
    if (!_1164)
    {
        float _1168 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1170 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1172 = _1146 + _1170;
        float _1174 = rsqrt(_1144);
        float _1176 = _1172 * _1168;
        float _1178 = _1142 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1180 = _1176 * 0.15915493667125701904296875;
        float _1182 = _1180 * 6.283185482025146484375;
        float _1184 = cos(_1182);
        float _1186 = _1180 * 6.283185482025146484375;
        float _1188 = sin(_1186);
        float _1190 = _1184 + (-1.0);
        float _1192 = fma(_1188, _1178, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1194 = _1190 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1196 = _1174 * _1192;
        float _1198 = fma(_1142, _1184, _1194);
        float _1200 = fma(_1136, _1196, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1202 = fma(_1132, _1196, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1166 = _1198;
        _1152 = _1200;
        _1154 = _1202;
        _1156 = _1190;
    }
    float _1204 = _1166;
    float _1206 = _1152;
    float _1208 = _1154;
    float _1210 = _1156;
    float _1212 = -_692;
    float _1214 = _1212 + _1204;
    float _1216 = -_730;
    float _1218 = _1216 + _1206;
    float _1220 = -_694;
    float _1222 = _1220 + _1208;
    float _1224 = _1214 * _1214;
    bool _1226 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1228 = isnan(0.5);
    bool _1230 = _1226 || _1228;
    bool _1232 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1234 = _1230 || _1232;
    float _1236 = fma(_1218, _1218, _1224);
    float _1238 = fma(_1222, _1222, _1236);
    float _1240 = sqrt(_1238);
    bool _1242 = _1240 > 0.0;
    bool _1244 = !_1242;
    float _1246 = _1206;
    float _1248 = _1204;
    float _1250 = _1208;
    float _1252 = _1210;
    if (!_1244)
    {
        float _1254 = _204 * _204;
        float _1256 = fma(_200, _200, _1254);
        float _1258 = fma(_206, _206, _1256);
        float _1260 = rsqrt(_1238);
        float _1262 = sqrt(_1258);
        float _1264 = _1218 * _1260;
        float _1266 = _1214 * _1260;
        float _1268 = _1222 * _1260;
        bool _1270 = _1262 > 0.0;
        bool _1272 = !_1270;
        _1252 = _1258;
        if (!_1272)
        {
            float _1274 = rsqrt(_1258);
            float _1276 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1278 = _204 * _1274;
            float _1280 = _200 * _1274;
            float _1282 = _1266 * _1278;
            float _1284 = _206 * _1274;
            float _1286 = fma(_1264, _1280, _1282);
            float _1288 = _1276 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1290 = fma(_1268, _1284, _1286);
            float _1292 = _1290 * _1288;
            float _1294 = fma(_200, _1292, _1206);
            float _1296 = fma(_204, _1292, _1204);
            float _1298 = fma(_206, _1292, _1208);
            _1246 = _1294;
            _1248 = _1296;
            _1250 = _1298;
            _1252 = _1274;
        }
    }
    float _1300 = _1246;
    float _1302 = _1248;
    float _1304 = _1250;
    float _1306 = _1252;
    float _1308 = _1302;
    float _1310 = _1300;
    float _1312 = _1304;
    if (!_1234)
    {
        float _1314 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1316 = _692 + _1314;
        float _1318 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1320 = _730 + _1318;
        float _1322 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1324 = -_730;
        float _1326 = _1324 + _1300;
        float _1328 = _1316 * _1316;
        float _1330 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1332 = _694 + _1330;
        float _1334 = fma(_1320, _1320, _1328);
        float _1336 = fma(_1332, _1332, _1334);
        float _1338 = sqrt(_1336);
        float _1340 = precise::min(_1338, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1342 = _1340 * _1322;
        float _1344 = -_692;
        float _1346 = _1344 + _1302;
        float _1348 = -_694;
        float _1350 = _1348 + _1304;
        float _1352 = fma(_1326, _1342, _730);
        float _1354 = fma(_1346, _1342, _692);
        float _1356 = fma(_1350, _1342, _694);
        _1308 = _1354;
        _1310 = _1352;
        _1312 = _1356;
    }
    float _1358 = _1308;
    float _1360 = _1310;
    float _1362 = _1312;
    float _1364 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1366 = _1358 + _1364;
    float _1368 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1370 = _1360 + _1368;
    float _1372 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1374 = _1362 + _1372;
    float _1376 = _1366 * _1366;
    float _1378 = fma(_1370, _1370, _1376);
    float _1380 = fma(_1374, _1374, _1378);
    float _1382 = rsqrt(_1380);
    float _1384 = sqrt(_1380);
    float _1386 = _1382 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1388 = _1370 * _1386;
    float _1390 = _1374 * _1386;
    float _1392 = _1388 * _1388;
    float _1394 = _1390 * _1390;
    float _1396 = _1392 + _1394;
    float _1398 = sqrt(_1396);
    bool _1400 = _1398 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1402 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1404 = _1398 + _1402;
    float _1406 = _1374;
    float _1408 = _1382;
    float _1410 = _1404;
    float _1412 = _1376;
    float _1414 = _1366;
    if (_1400)
    {
        float _1416 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1406 = _1416;
    }
    float _1418 = _1406;
    if (_1400)
    {
        float _1420 = rsqrt(_1396);
        _1408 = _1420;
    }
    float _1422 = _1408;
    float _1424 = _1422;
    if (_1400)
    {
        float _1426 = _1404 * _1418;
        _1410 = _1426;
    }
    float _1428 = _1410;
    if (_1400)
    {
        float _1430 = _1428 * 0.15915493667125701904296875;
        _1412 = _1430;
    }
    float _1432 = _1412;
    float _1434 = _1418;
    float _1436 = _1432;
    if (_1400)
    {
        float _1438 = _1432 * 6.283185482025146484375;
        float _1440 = sin(_1438);
        _1434 = _1440;
    }
    float _1442 = _1434;
    float _1444 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1446 = precise::max(0.0, _1444);
    float _1448 = _1306;
    float _1450 = _1446;
    if (_1400)
    {
        float _1452 = _1432 * 6.283185482025146484375;
        float _1454 = cos(_1452);
        _1448 = _1454;
    }
    float _1456 = _1448;
    float _1458 = -_1386;
    float _1460 = -_1446;
    float _1462 = fma(_1366, _1458, _1460);
    if (_1400)
    {
        float _1464 = _1462 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1450 = _1464;
    }
    float _1466 = _1450;
    float _1468 = _1442;
    float _1470 = _1466;
    if (_1400)
    {
        float _1472 = fma(_1442, _1466, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1414 = _1472;
    }
    float _1474 = _1414;
    float _1476 = _1474;
    if (!_1400)
    {
        _1468 = _1388;
    }
    float _1478 = _1468;
    float _1480 = _1478;
    float _1482 = _1456;
    if (_1400)
    {
        float _1484 = _1456 + (-1.0);
        _1470 = _1484;
    }
    float _1486 = _1470;
    float _1488 = 0.0;
    float _1490 = _1486;
    if (_1400)
    {
        float _1492 = _1422 * _1474;
        _1488 = _1492;
    }
    float _1494 = _1488;
    if (!_1400)
    {
        _1476 = _1462;
    }
    float _1496 = _1476;
    float _1498 = _1496;
    if (_1400)
    {
        float _1500 = _1486 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1436 = _1500;
    }
    float _1502 = _1436;
    if (_1400)
    {
        float _1504 = _1388 * _1494;
        _1480 = _1504;
    }
    float _1506 = _1480;
    if (!_1400)
    {
        _1490 = _1390;
    }
    float _1508 = _1490;
    float _1510 = _1508;
    if (_1400)
    {
        float _1512 = _1390 * _1494;
        _1510 = _1512;
    }
    float _1514 = _1510;
    if (!_1400)
    {
        _1424 = _1392;
    }
    float _1516 = _1424;
    float _1518 = _1516;
    if (_1400)
    {
        float _1520 = fma(_1462, _1456, _1502);
        _1498 = _1520;
    }
    float _1522 = _1498;
    if (_1400)
    {
        float _1524 = _1506 * _1506;
        _1518 = _1524;
    }
    float _1526 = _1518;
    if (!_1400)
    {
        _1482 = _1394;
    }
    float _1528 = _1482;
    float _1530 = _1528;
    if (_1400)
    {
        float _1532 = _1514 * _1514;
        _1530 = _1532;
    }
    float _1534 = _1530;
    float _1536 = fma(_1522, _1522, _1526);
    float _1538 = _1358 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1540 = _1358 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1542 = _1358 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1544 = _1536 + _1534;
    float _1546 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1548 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1550 = fma(_1384, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1548);
    float _1552 = precise::clamp(_1550, 0.0, 1.0);
    float _1554 = _1358 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1556 = rsqrt(_1544);
    float _1558 = fma(_1360, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1538);
    float _1560 = -_1552;
    float _1562 = _1560 + 1.0;
    float _1564 = fma(_1360, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1540);
    float _1566 = fma(_1360, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1554);
    float _1568 = fma(_1362, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1558);
    float _1570 = fma(_1360, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1542);
    float _1572 = fma(_1362, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1564);
    float _1574 = abs(_1562);
    float _1576 = log2(_1574);
    float _1578 = fma(_1362, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1566);
    float _1580 = _1568 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1582 = _1572 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1584 = fma(_1362, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1570);
    float _1586 = _1578 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1588 = _1580 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1590 = _1556 * _1506;
    float _1592 = _1586 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1594 = -_1588;
    float _1596 = fma(_1594, _1546, 1.0);
    float _1598 = _1556 * _1522;
    float _1600 = _1590 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1602 = fma(_1582, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1592);
    float _1604 = _1556 * _1514;
    float _1606 = _1584 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1608 = -_1600;
    float _1610 = fma(_1598, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1608);
    float _1612 = _1576 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1614 = fma(_1580, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1602);
    float _1616 = log2(_1596);
    float _1618 = -_1604;
    float _1620 = fma(_1618, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1610);
    float _1622 = _1586 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1624 = fma(_1606, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1614);
    float _1626 = _1586 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1628 = fma(_1620, -0.5, 0.5);
    float _1630 = fma(_1620, 0.5, 0.5);
    float _1632 = fma(_1582, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1622);
    float _1634 = exp2(_1612);
    float _1636 = fma(_1582, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1626);
    float _1638 = fma(_1630, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1640 = _1598 + 1.0;
    float _1642 = fma(_1580, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1632);
    float _1644 = fma(_1580, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1636);
    float _1646 = fma(_1630, _1638, -0.212114393711090087890625);
    float _1648 = 1.0 / _1624;
    float _1650 = fma(_1630, _1646, 1.570728778839111328125);
    float _1652 = sqrt(_1628);
    float _1654 = -_1598;
    float _1656 = fma(_1634, _1640, _1654);
    float _1658 = fma(_1606, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1642);
    float _1660 = fma(_1606, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1644);
    float _1662 = _1616 * 0.693147182464599609375;
    float _1664 = _1658 * _1648;
    float _1666 = _1660 * _1648;
    float _1668 = _1662 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1670 = fma(_1664, 0.5, 0.5);
    float _1672 = fma(_1666, -0.5, 0.5);
    float _1674 = _1652 * 0.636619746685028076171875;
    float3 _5482 = float3(_1670, _1672, _1668);
    float _1676 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5482, float3(0.0), isnan(_5482)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5482, float3(0.0), isnan(_5482)), level(0.0)).x;
    float _1678 = -_1650;
    float _1680 = fma(_1674, _1678, 1.0);
    float _1682 = fma(_1656, 0.5, 0.5);
    float3 _5500 = float3(_1670, _1672, _1668);
    float4 _1685 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5500, float3(0.0), isnan(_5500)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5500, float3(0.0), isnan(_5500)), level(0.0)).xyzw;
    float _1687 = _1685.x;
    float _1689 = _1685.y;
    float _1691 = _1685.z;
    float _1693 = _1685.w;
    float2 _5517 = float2(_1680, _1682);
    float3 _1697 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5517, float2(0.0), isnan(_5517)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5517, float2(0.0), isnan(_5517)), level(0.0)).xyz;
    float _1699 = _1697.x;
    float _1701 = _1697.y;
    float _1703 = _1697.z;
    float _1705 = in.m_67.y;
    float _1707 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1709 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1711 = _1709 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1713 = in.m_67.w;
    float _1715 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1717 = _1715 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1719 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1721 = _1719 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1723 = in.m_59.w;
    float _1725 = 1.0 / _1711;
    bool _1727 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _1729 = _1576 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1731 = in.m_67.x;
    int _1733 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1735 = _1733 != 0;
    float _1737 = _500 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1739 = in.m_67.z;
    float _1741 = 1.0 / _1717;
    float _1743 = _498 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1745 = in.m_69.y;
    int _1747 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1749 = _1747 != 0;
    float _1751 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1753 = _1751 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1755 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1757 = _1755 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1759 = 1.0 / _1721;
    bool _1761 = _570 > 0.5;
    out.m_71.y = _1705;
    float _1763 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1765 = _1763 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    out.m_71.w = _1713;
    bool _1767 = _1723 > 0.5;
    float _1769 = 1.0 / _1753;
    float _1771 = _1723;
    bool _1773 = _1727;
    bool _1775 = _1767;
    float _1777 = _1624;
    float _1779 = _1660;
    float _1781 = _1658;
    if (_1727)
    {
        _1771 = _776;
    }
    float _1783 = _1771;
    float _1785 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1787 = _1785 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    out.m_71.x = _1731;
    int _1789 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1791 = _1789 != 0;
    float _1793 = _502 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _1795 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1797 = _1795 != 0;
    float _1799 = 1.0 / _1757;
    float _1801 = _1783;
    if (!_1727)
    {
        _1801 = _776;
    }
    float _1803 = _1801;
    float _1805 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1807 = _1805 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1809 = -_1745;
    float _1811 = _1809 + 1.0;
    float _1813 = _1745;
    int _1815 = as_type<int>(_1811);
    if (_1735)
    {
        bool _1817 = _552 > 0.5;
        _1773 = _1817;
    }
    bool _1819 = _1773;
    float _1821 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1823 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1821;
    out.m_71.z = _1739;
    float _1825 = 1.0 / _1765;
    float _1827 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1829 = _1827 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1831 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1833 = _1831 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1835 = _1823 * _1741;
    float _1837 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1839 = _1837 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    int _1841 = _1767 ? as_type<int>(_1811) : as_type<int>(_1745);
    float _1843 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1845 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1843;
    if (_1749)
    {
        bool _1847 = _544 > 0.5;
        _1775 = _1847;
    }
    bool _1849 = _1775;
    float _1851 = 1.0 / _1787;
    float _1853 = _1833 * _1759;
    float _1855 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1857 = _1855 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    float _1859 = _1845 * _1725;
    float _1861 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _1863 = _1861 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _1865 = in.m_69.x;
    float _1867 = 1.0 / _1829;
    float _1869 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _1871 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _1869;
    float _1873 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _1875 = _1873 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1877 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1879 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _1877;
    bool _1881 = _532 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1883 = isnan(_532);
    bool _1885 = _1881 || _1883;
    bool _1887 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1889 = _1885 || _1887;
    float _1891 = float(_1889);
    float _1893 = _1871 * _1769;
    float _1895 = _1879 * _1799;
    float _1897 = 1.0 / _1807;
    float _1899 = _1875 * _1825;
    float _1901 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1903 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _1901;
    float _1905 = _1863 * _1851;
    float _1907 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _1909 = _1907 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1911 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _1913 = _1911 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1915 = -_1891;
    float _1917 = _1915 + 1.0;
    float _1919 = 1.0 / _1839;
    float _1921 = _1903 * _1867;
    float _1923 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1925 = _532 + _1923;
    bool _1927 = _532 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1929 = isnan(_532);
    bool _1931 = _1927 || _1929;
    bool _1933 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1935 = _1931 || _1933;
    float _1937 = float(_1935);
    float _1939 = fma(_1853, _1925, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    bool _1941 = _532 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1943 = isnan(_532);
    bool _1945 = _1941 || _1943;
    bool _1947 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1949 = _1945 || _1947;
    float _1951 = float(_1949);
    float _1953 = 1.0 / _1857;
    float _1955 = _1909 * _1897;
    float _1957 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1959 = _532 + _1957;
    float _1961 = -_1951;
    float _1963 = _1961 + 1.0;
    float _1965 = fma(_1859, _1959, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1967 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1969 = _532 + _1967;
    float _1971 = _1913 * _1919;
    float _1973 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1975 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _1973;
    bool _1977 = _532 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _1979 = isnan(_532);
    bool _1981 = _1977 || _1979;
    bool _1983 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _1985 = _1981 || _1983;
    float _1987 = float(_1985);
    float _1989 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1991 = _532 + _1989;
    float _1993 = fma(_1905, _1969, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _1995 = _1951 * _1917;
    float _1997 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1999 = fma(_1835, _1991, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _2001 = _1975 * _1953;
    float _2003 = -_1987;
    float _2005 = _2003 + 1.0;
    float _2007 = _1891 * _2005;
    float _2009 = _1891;
    float _2011 = _1951;
    int _2013 = as_type<int>(_1999);
    float _2015 = _1965;
    float _2017 = _1987;
    if (!_1735)
    {
        _2009 = _1865;
    }
    float _2019 = _2009;
    float _2021 = exp2(_1729);
    bool _2023 = _532 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _2025 = isnan(_532);
    bool _2027 = _2023 || _2025;
    bool _2029 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _2031 = _2027 || _2029;
    float _2033 = float(_2031);
    float _2035 = _2019;
    if (!_1735)
    {
        _2011 = _2019;
    }
    float _2037 = _2011;
    float _2039 = _2037;
    if (_1735)
    {
        _2035 = _1865;
    }
    float _2041 = _2035;
    float _2043 = _1937 * _1963;
    float _2045 = -_1937;
    float _2047 = _2045 + 1.0;
    float _2049 = _1791 ? as_type<float>(_1841) : _1745;
    float _2051 = _1707 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (_1797)
    {
        float _2053 = _1761 ? _1811 : _1745;
        _1813 = _2053;
    }
    float _2055 = _1813;
    float _2057 = _2055;
    if (_1735)
    {
        float _2059 = -_2041;
        float _2061 = _2059 + 1.0;
        _1815 = as_type<int>(_2061);
    }
    int _2063 = _1815;
    float _2065 = _2033 * _2047;
    float _2067 = _1997 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2069 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _2071 = _1803 + _2069;
    float _2073 = fma(_2051, _2055, -0.5);
    if (_1735)
    {
        float _2075 = _1819 ? as_type<float>(_2063) : _2041;
        _2039 = _2075;
    }
    float _2077 = _2039;
    float _2079 = _1999 * _2065;
    float _2081 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _2083 = _1803 + _2081;
    if (_1749)
    {
        float _2085 = -_2041;
        float _2087 = _2085 + 1.0;
        _2013 = as_type<int>(_2087);
    }
    int _2089 = _2013;
    if (!_1749)
    {
        _2057 = _2041;
    }
    float _2091 = _2057;
    float _2093 = -_652;
    float _2095 = fma(_794, _2073, _2093);
    float _2097 = fma(_1899, _2083, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    float _2099 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _2101 = _1803 + _2099;
    float _2103 = _2091;
    if (_1749)
    {
        float _2105 = _1849 ? as_type<float>(_2089) : _2041;
        _2103 = _2105;
    }
    float _2107 = _2103;
    float _2109 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _2111 = _1803 + _2109;
    float _2113 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _2115 = _1803 + _2113;
    float _2117 = fma(_2001, _2101, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _2119 = fma(_2049, _2067, -0.5);
    float _2121 = -_2033;
    float _2123 = _2121 + 1.0;
    float _2125 = fma(_1895, _2111, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    bool _2127 = _1803 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _2129 = isnan(_1803);
    bool _2131 = _2127 || _2129;
    bool _2133 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _2135 = _2131 || _2133;
    float _2137 = float(_2135);
    float _2139 = fma(_1921, _2115, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    float _2141 = _692 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2143 = _692 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2145 = fma(_1893, _2071, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    float _2147 = fma(_2123, (*spvDescriptorSet0.vp_c9)._m0[115].x, _2079);
    float _2149 = -_874;
    float _2151 = fma(_732, _2119, _2149);
    bool _2153 = _1803 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _2155 = isnan(_1803);
    bool _2157 = _2153 || _2155;
    bool _2159 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _2161 = _2157 || _2159;
    float _2163 = float(_2161);
    float _2165 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _2167 = _1803 + _2165;
    float _2169 = fma(_730, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2141);
    float _2171 = -_2137;
    float _2173 = _2171 + 1.0;
    float _2175 = fma(_730, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2143);
    float _2177 = fma(_1939, _2043, _2147);
    float _2179 = fma(_1971, _2167, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    bool _2181 = _1803 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _2183 = isnan(_1803);
    bool _2185 = _2181 || _2183;
    bool _2187 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _2189 = _2185 || _2187;
    float _2191 = float(_2189);
    float _2193 = _2163 * _2173;
    float _2195 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _2197 = _1803 + _2195;
    float _2199 = fma(_694, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2175);
    float _2201 = -_2163;
    float _2203 = _2201 + 1.0;
    float _2205 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2207 = _2145 * _2193;
    float _2209 = fma(_1955, _2197, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _2211 = -_2191;
    float _2213 = _2211 + 1.0;
    float _2215 = _2199 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    bool _2217 = _1803 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _2219 = isnan(_1803);
    bool _2221 = _2217 || _2219;
    bool _2223 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _2225 = _2221 || _2223;
    float _2227 = float(_2225);
    float _2229 = fma(_2203, (*spvDescriptorSet0.vp_c9)._m0[151].x, _2207);
    float _2231 = _2137 * _2213;
    float _2233 = 1.0 / _2215;
    bool _2235 = _1803 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _2237 = isnan(_1803);
    bool _2239 = _2235 || _2237;
    bool _2241 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _2243 = _2239 || _2241;
    float _2245 = float(_2243);
    float _2247 = -_2227;
    float _2249 = _2247 + 1.0;
    bool _2251 = _1803 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _2253 = isnan(_1803);
    bool _2255 = _2251 || _2253;
    bool _2257 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _2259 = _2255 || _2257;
    float _2261 = float(_2259);
    float _2263 = fma(_694, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2169);
    bool _2265 = _1803 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _2267 = isnan(_1803);
    bool _2269 = _2265 || _2267;
    bool _2271 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _2273 = _2269 || _2271;
    float _2275 = float(_2273);
    float _2277 = -_2245;
    float _2279 = _2277 + 1.0;
    bool _2281 = _1803 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _2283 = isnan(_1803);
    bool _2285 = _2281 || _2283;
    bool _2287 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _2289 = _2285 || _2287;
    float _2291 = float(_2289);
    float _2293 = _2191 * _2249;
    float _2295 = -_2261;
    float _2297 = _2295 + 1.0;
    float _2299 = fma(_2097, _2231, _2229);
    float _2301 = _2263 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _2303 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2305 = isnan(0.5);
    bool _2307 = _2303 || _2305;
    bool _2309 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2311 = _2307 || _2309;
    float _2313 = _2227 * _2279;
    float _2315 = _2245 * _2297;
    float _2317 = fma(_2125, _2293, _2299);
    float _2319 = -_2291;
    float _2321 = _2319 + 1.0;
    float _2323 = _2205 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2325 = _2301 + _2215;
    float _2327 = fma(_2179, _2313, _2317);
    float _2329 = -_2275;
    float _2331 = _2329 + 1.0;
    float _2333 = _2275 * _2321;
    float _2335 = fma(_2323, _2077, -0.5);
    float _2337 = _2325 * _2233;
    float _2339 = _2337 * 0.5;
    float _2341 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2343 = in.m_73.x;
    float _2345 = in.m_73.y;
    float _2347 = in.m_73.z;
    float _2349 = fma(_1965, _1995, _2177);
    bool _2351 = _954 != 0.0;
    bool _2353 = isnan(_954);
    bool _2355 = _2351 || _2353;
    bool _2357 = isnan(0.0);
    bool _2359 = _2355 || _2357;
    float _2361 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2363 = fma(_2339, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2361);
    if (!_2311)
    {
        _2015 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _2365 = _2015;
    float _2367 = fma(_1993, _2007, _2349);
    bool _2369 = _952 == 0.0;
    bool _2371 = !_2359;
    bool _2373 = _2369 && _2371;
    float _2375 = fma(_814, _2335, _822);
    float _2377 = _2095 + 0.5;
    float _2379 = fma(_1987, (*spvDescriptorSet0.vp_c9)._m0[119].x, _2367);
    float _2381 = 1.0 / _2363;
    if (!_2311)
    {
        float _2383 = -_2365;
        float _2385 = _2383 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _2017 = _2385;
    }
    float _2387 = _2017;
    bool _2389 = _956 == 0.0;
    bool _2391 = _2389 && _2373;
    float _2393 = _2261 * _2331;
    float _2395 = fma(_2139, _2315, _2327);
    float _2397 = _2341 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2399 = -_2021;
    float _2401 = _2399 + 1.0;
    float _2403 = _1793 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2405 = _2367;
    if (!_2311)
    {
        float _2407 = 1.0 / _2387;
        _2405 = _2407;
    }
    float _2409 = _2405;
    float _2411 = fma(_2397, _2107, -0.5);
    float _2413 = fma(_2209, _2393, _2395);
    float _2415 = _1743 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2417 = _2379 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2419 = fma(_768, _2411, _852);
    float _2421 = _2375 + 0.5;
    float _2423 = _2345;
    float _2425 = _2343;
    float _2427 = _2347;
    if (!_2391)
    {
        float _2429 = fma(_954, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2345);
        _2423 = _2429;
    }
    float _2431 = _2423;
    float _2433 = _2381;
    if (!_2311)
    {
        float _2435 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2437 = -_2365;
        float _2439 = fma(_2381, _2435, _2437);
        _1158 = _2439;
    }
    float _2441 = _1158;
    if (!_2391)
    {
        float _2443 = fma(_952, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2343);
        _2425 = _2443;
    }
    float _2445 = _2425;
    float _2447 = _2151 + 0.5;
    float _2449 = _2419 + 0.5;
    if (_2311)
    {
        _1160 = 1.0;
    }
    float _2451 = _1160;
    float _2453 = _1044 * _1116;
    float _2455 = _2451;
    if (!_2391)
    {
        float _2457 = fma(_956, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2347);
        _2427 = _2457;
    }
    float _2459 = _2427;
    float _2461 = _1062 * _1098;
    if (!_2311)
    {
        float _2463 = _2441 * _2409;
        float _2465 = precise::clamp(_2463, 0.0, 1.0);
        _2455 = _2465;
    }
    float _2467 = _2455;
    float _2469 = _1044 * _1098;
    out.m_75.x = _2421;
    out.m_75.y = _2377;
    out.m_75.z = _2449;
    out.m_75.w = _2447;
    float _2471 = _1044 * _1094;
    float _2473 = fma(_1048, _1076, _2461);
    float _2475 = fma(_2117, _2333, _2413);
    float _2477 = -_1028;
    float _2479 = fma(_2477, _1078, _2453);
    float _2481 = _1060 * _1098;
    float _2483 = _2401 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2485 = fma(_2291, (*spvDescriptorSet0.vp_c9)._m0[158].x, _2475);
    float _2487 = _1737 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2489 = _1062 * _1116;
    float _2491 = _1062 * _1094;
    float _2493 = _1060 * _1116;
    float _2495 = fma(_1046, _964, _2479);
    float _2497 = fma(_1048, _1078, _2489);
    float _2499 = -_1028;
    float _2501 = fma(_2499, _1076, _2469);
    float _2503 = -_1028;
    float _2505 = fma(_2503, _1082, _2471);
    float _2507 = _1060 * _1094;
    float _2509 = fma(_1048, _1082, _2491);
    float _2511 = fma(_1046, _960, _2501);
    float _2513 = fma(_1046, _962, _2505);
    float _2515 = fma(_1056, _960, _2473);
    out.m_77.x = _2415;
    out.m_77.y = _2487;
    out.m_77.z = _2403;
    out.m_77.w = _2417;
    float _2517 = _2511 * _2431;
    float _2519 = fma(_1056, _964, _2497);
    float _2521 = _2495 * _2431;
    float _2523 = fma(_1050, _1082, _2507);
    float _2525 = fma(_2515, _2445, _2517);
    float _2527 = _2515;
    float _2529 = _2519;
    if (!_2311)
    {
        _2527 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _2531 = _2527;
    float _2533 = fma(_1056, _962, _2509);
    float _2535 = _2513 * _2431;
    float _2537 = fma(_2519, _2445, _2521);
    float _2539 = fma(_1070, _962, _2523);
    float _2541 = _2531;
    if (!_2311)
    {
        float _2543 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2545 = -_2531;
        float _2547 = fma(_2381, _2543, _2545);
        _2433 = _2547;
    }
    float _2549 = _2433;
    float _2551 = _2549;
    if (!_2311)
    {
        float _2553 = -_2531;
        float _2555 = _2553 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _2541 = _2555;
    }
    float _2557 = _2541;
    float _2559 = fma(_2533, _2445, _2535);
    float _2561 = fma(_1050, _1076, _2481);
    float _2563 = fma(_1050, _1078, _2493);
    float _2565 = _1586 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_79.x = _2485;
    float _2567 = fma(_1070, _960, _2561);
    float _2569 = fma(_1070, _964, _2563);
    float _2571 = _2557;
    if (!_2311)
    {
        float _2573 = 1.0 / _2557;
        _2571 = _2573;
    }
    float _2575 = _2571;
    float _2577 = fma(_1582, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2565);
    float _2579 = fma(_2567, _2459, _2525);
    float _2581 = fma(_2569, _2459, _2537);
    float _2583 = fma(_2539, _2459, _2559);
    float _2585 = fma(_1580, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2577);
    bool _2587 = _1384 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2589 = isnan(_1384);
    bool _2591 = _2587 || _2589;
    bool _2593 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2595 = _2591 || _2593;
    float _2597 = _1658 + _1624;
    float _2599 = _1624 * 0.5;
    out.m_81.x = _2579;
    out.m_81.y = _2581;
    out.m_81.z = _2583;
    float _2601 = fma(_1606, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2585);
    float _2603 = _2483 * _1676;
    float _2605 = -_2483;
    float _2607 = _2605 + 1.0;
    float _2609 = _2601 + _1624;
    out.gl_Position.x = _1658;
    out.gl_Position.y = _1660;
    out.gl_Position.z = _2601;
    out.gl_Position.w = _1624;
    float _2611 = _2599;
    float _2613 = _2601;
    if (!_2311)
    {
        float _2615 = _2549 * _2575;
        float _2617 = precise::clamp(_2615, 0.0, 1.0);
        _2551 = _2617;
    }
    float _2619 = _2551;
    float _2621 = _1693 * _2603;
    float _2623 = _1693 * _2607;
    float _2625 = _2609 * 0.5;
    float _2627 = _2597 * 0.5;
    float _2629 = _1703 * _2603;
    float _2631 = fma(_1699, _2621, _1687);
    float _2633 = fma(_1701, _2621, _1689);
    float _2635 = fma(_1660, -0.5, _2599);
    float _2637 = fma(_1693, _2629, _1691);
    if (!_2595)
    {
        _2529 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2639 = _2529;
    float _2641 = _2639;
    float _2643 = _2639;
    if (!_2595)
    {
        _2611 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2645 = _2611;
    out.m_83.x = _2627;
    out.m_83.y = _2635;
    out.m_83.z = _2625;
    out.m_83.w = _1624;
    float _2647 = _2645;
    float _2649 = _2645;
    if (_2311)
    {
        _1777 = 1.0;
    }
    float _2651 = _1777;
    float _2653 = _2651;
    if (!_2311)
    {
        float _2655 = -_2619;
        float _2657 = _2655 + 1.0;
        _2653 = _2657;
    }
    float _2659 = _2653;
    if (!_2595)
    {
        _2613 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2661 = _2613;
    out.m_85.x = _2631;
    out.m_85.y = _2633;
    out.m_85.z = _2637;
    out.m_85.w = _2623;
    float _2663 = _2661;
    float _2665 = _2661;
    if (!_2595)
    {
        _1779 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2667 = _1779;
    float _2669 = _2467 * _2659;
    float _2671 = _2669;
    float _2673 = _2667;
    float _2675 = _2667;
    if (!_2595)
    {
        _1781 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2677 = _1781;
    float _2679 = _2669 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2681 = _2677;
    float _2683 = _2677;
    if (!_2595)
    {
        _2671 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2685 = _2671;
    bool _2687 = !_2595;
    float _2689 = _2685;
    float _2691 = _2685;
    if (!_2687)
    {
        bool _2693 = _1384 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2695 = isnan(_1384);
        bool _2697 = _2693 || _2695;
        bool _2699 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2701 = _2697 || _2699;
        if (!_2701)
        {
            float _2703 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2705 = _1384 + _2703;
            float _2707 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2709 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2707;
            float _2711 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2713 = _2711 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2715 = 1.0 / _2709;
            float _2717 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2719 = _2717 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2721 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2723 = _2721 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2725 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2727 = _2725 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2729 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2731 = _2729 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2733 = _2705 * _2715;
            float _2735 = precise::clamp(_2733, 0.0, 1.0);
            float _2737 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2739 = _2737 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2741 = fma(_2735, _2713, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2743 = fma(_2735, _2739, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2745 = fma(_2735, _2719, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2747 = fma(_2735, _2723, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2749 = fma(_2735, _2727, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2751 = fma(_2735, _2731, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2675 = _2745;
            _2649 = _2749;
            _2665 = _2741;
            _2643 = _2747;
            _2683 = _2743;
            _2691 = _2751;
            _2753 = true;
        }
        else
        {
            bool _2755 = _1384 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2757 = isnan(_1384);
            bool _2759 = _2755 || _2757;
            bool _2761 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2763 = _2759 || _2761;
            if (!_2763)
            {
                _2663 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2765 = _2663;
            _2665 = _2765;
            if (!_2763)
            {
                _2673 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2767 = _2673;
            _2675 = _2767;
            if (!_2763)
            {
                _2681 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2769 = _2681;
            _2683 = _2769;
            if (!_2763)
            {
                _2641 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2771 = _2641;
            _2643 = _2771;
            if (!_2763)
            {
                _2647 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2773 = _2647;
            _2649 = _2773;
            if (!_2763)
            {
                _2689 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2775 = _2689;
            bool _2777 = !_2763;
            _2691 = _2775;
            if (!_2777)
            {
                bool _2779 = _1384 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2781 = isnan(_1384);
                bool _2783 = _2779 || _2781;
                bool _2785 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2787 = _2783 || _2785;
                if (!_2787)
                {
                    float _2789 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2791 = _1384 + _2789;
                    float _2793 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2795 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2793;
                    float _2797 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2799 = _2797 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2801 = 1.0 / _2795;
                    float _2803 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2805 = _2803 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2807 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2809 = _2807 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2811 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2813 = _2811 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2815 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2817 = _2815 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2819 = _2791 * _2801;
                    float _2821 = precise::clamp(_2819, 0.0, 1.0);
                    float _2823 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2825 = _2823 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2827 = fma(_2821, _2799, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2829 = fma(_2821, _2825, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2831 = fma(_2821, _2805, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2833 = fma(_2821, _2809, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2835 = fma(_2821, _2813, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2837 = fma(_2821, _2817, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2675 = _2831;
                    _2649 = _2835;
                    _2665 = _2827;
                    _2643 = _2833;
                    _2683 = _2829;
                    _2691 = _2837;
                    _2753 = true;
                }
                else
                {
                    _2675 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2649 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2665 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2643 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2683 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2691 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2753 = false;
    float _2839 = _2675;
    float _2841 = _2649;
    float _2843 = _2665;
    float _2845 = _2643;
    float _2847 = _2683;
    float _2849 = _2691;
    float _2851 = _2679 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2853 = fma(_2581, -0.5, 0.5);
    float _2855 = precise::clamp(_2853, 0.0, 1.0);
    float _2857 = -_2839;
    float _2859 = _2857 + _2841;
    float _2861 = -_2843;
    float _2863 = _2861 + _2845;
    out.m_47.x = _2851;
    float _2865 = -_2847;
    float _2867 = _2865 + _2849;
    float _2869 = fma(_2855, _2859, _2839);
    float _2871 = fma(_2855, _2863, _2843);
    bool _2873 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2875 = _2869 * 0.586610972881317138671875;
    float _2877 = fma(_2855, _2867, _2847);
    out.m_87.x = 0.0;
    bool _2879 = _2467 > 0.0;
    bool _2881 = isnan(_2467);
    bool _2883 = _2879 || _2881;
    bool _2885 = isnan(0.0);
    bool _2887 = _2883 || _2885;
    float _2889 = fma(_2871, 0.298911988735198974609375, _2875);
    bool _2891 = _2659 <= 0.0;
    bool _2893 = !_2887;
    bool _2895 = _2891 || _2893;
    float _2897 = fma(_2877, 0.114477999508380889892578125, _2889);
    float _2899 = -_2897;
    float _2901 = _2871 + _2899;
    float _2903 = -_2897;
    float _2905 = _2869 + _2903;
    float _2907 = -_2897;
    float _2909 = _2877 + _2907;
    float _2911 = fma(_2901, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2897);
    float _2913 = fma(_2905, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2897);
    float _2915 = fma(_2909, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2897);
    bool _2917 = !_2873;
    if (!_2917)
    {
        float _2919 = -_1358;
        float _2921 = _2919 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2923 = -_1360;
        float _2925 = _2923 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2927 = -_1362;
        float _2929 = _2927 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2931 = _2921 * _2921;
        float _2933 = fma(_2925, _2925, _2931);
        float _2935 = fma(_2929, _2929, _2933);
        float _2937 = sqrt(_2935);
        float _2939 = rsqrt(_2935);
        float _2941 = -_2937;
        float _2943 = _2941 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2945 = _2943 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2947 = precise::clamp(_2945, 0.0, 1.0);
        float _2949 = _2925 * _2939;
        float _2951 = _2921 * _2939;
        float _2953 = abs(_2947);
        float _2955 = log2(_2953);
        float _2957 = _2929 * _2939;
        float _2959 = _2949 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2961 = _2581 * _2951;
        float _2963 = -_2951;
        float _2965 = -_2959;
        float _2967 = fma(_2963, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2965);
        float _2969 = fma(_2579, _2949, _2961);
        float _2971 = -_2957;
        float _2973 = fma(_2971, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2967);
        float _2975 = fma(_2583, _2957, _2969);
        float _2977 = precise::clamp(_2975, 0.0, 1.0);
        float _2979 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2981 = _2973 + _2979;
        float _2983 = _2955 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2985 = _2981 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2987 = precise::clamp(_2985, 0.0, 1.0);
        float _2989 = exp2(_2983);
        float _2991 = _2989 * _2987;
        float _2993 = _2977 * _2991;
        float _2995 = _2993 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2997 = _2993 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2999 = _2993 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_87.x = _2995;
        out.m_87.y = _2997;
        out.m_87.z = _2999;
    }
    out.m_89.x = _2911;
    out.m_89.y = _2913;
    out.m_89.z = _2915;
    if (!_2895)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _3001 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3001;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

