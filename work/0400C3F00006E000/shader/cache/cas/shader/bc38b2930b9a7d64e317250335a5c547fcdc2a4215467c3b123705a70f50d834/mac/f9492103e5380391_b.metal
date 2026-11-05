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
    constant _16* vp_c10 [[id(0)]];
    constant _16* vp_c8 [[id(1)]];
    constant _16* vp_c9 [[id(2)]];
    constant _16* vp_c13 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
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
    float4 m_61 [[user(locn0)]];
    float4 m_75 [[user(locn1)]];
    float4 m_73 [[user(locn2)]];
    float4 m_67 [[user(locn3)]];
    float4 m_83 [[user(locn4)]];
    float4 m_69 [[user(locn5)]];
    float4 m_57 [[user(locn6)]];
    float4 m_77 [[user(locn7)]];
    float4 m_79 [[user(locn8)]];
    float4 m_49 [[user(locn10)]];
    float4 m_81 [[user(locn11)]];
    float4 m_51 [[user(locn12)]];
    float4 m_71 [[user(locn13)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_63 [[attribute(1)]];
    float4 m_44 [[attribute(2)]];
    float4 m_46 [[attribute(3)]];
    float4 m_65 [[attribute(5)]];
    float4 m_59 [[attribute(6)]];
    float4 m_55 [[attribute(7)]];
    float4 m_53 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _430 = false;
    bool _310 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _97 = in.m_44.w;
    float _99 = in.m_46.w;
    float _101 = trunc(_97);
    int _104 = int(_101);
    float _106 = -_99;
    float _108 = _106 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_49.y = _108;
    bool _112 = _104 >= 1;
    float _114 = 0.0;
    float _116 = as_type<float>(_104);
    float _118 = _108;
    if (!_112)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _120 = _114;
    if (!_112)
    {
        out.m_51.x = 0.0;
    }
    int _122 = 0;
    if (!_112)
    {
        float _124 = _120 * 5.0;
        _122 = as_type<int>(_124);
    }
    int _126 = _122;
    int _128 = _126;
    if (!_112)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2174 = as_type<float>(_126);
        out.gl_Position.z = _2174;
    }
    if (!_112)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _130 = _99 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _132 = isnan(_99);
    bool _134 = _130 || _132;
    bool _136 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _138 = _134 || _136;
    float _140 = float(_104);
    bool _142 = _108 >= _140;
    bool _144 = !_138;
    bool _146 = _142 || _144;
    if (_146)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _148 = _116;
    if (_146)
    {
        out.m_51.x = 0.0;
    }
    if (_146)
    {
        float _150 = _148 * 5.0;
        _128 = as_type<int>(_150);
    }
    int _152 = _128;
    if (_146)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2229 = as_type<float>(_152);
        out.gl_Position.z = _2229;
    }
    if (_146)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _154 = in.m_53.z;
    float _156 = 1.0 / _140;
    float _158 = _108 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _160 = in.m_53.w;
    bool _162 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _164 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _166 = _162 || _164;
    bool _168 = isnan(1.0);
    bool _170 = _166 || _168;
    float _172 = in.m_55.w;
    float _174 = in.m_46.x;
    float _176 = in.m_46.y;
    float _178 = in.m_46.z;
    float _180 = in.m_44.x;
    float _182 = in.m_44.y;
    float _184 = in.m_44.z;
    float _186 = 0.0;
    float _188 = _158;
    if (!_170)
    {
        float _190 = _158 * _158;
        float _192 = _190 * 0.5;
        _186 = _192;
    }
    float _194 = _186;
    float _196 = _194;
    if (!_170)
    {
        float _198 = _194 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _196 = _198;
    }
    float _200 = _196;
    out.m_57.z = _154;
    out.m_57.w = _160;
    bool _202 = !_170;
    float _204 = _200;
    float _206 = _160;
    float _208 = _154;
    if (!_202)
    {
        float _210 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _212 = log2(_210);
        float _214 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _216 = _214 + 1.0;
        float _218 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _220 = _158 * _212;
        float _222 = 1.0 / _216;
        float _224 = _218 * 0.693147182464599609375;
        float _226 = exp2(_220);
        float _228 = 1.0 / _224;
        float _230 = _226 + (-1.0);
        float _232 = -_230;
        float _234 = fma(_232, _228, _158);
        float _236 = _234 * _222;
        float _238 = _236 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _204 = _238;
    }
    float _240 = _204;
    bool _242 = !_170;
    if (!_242)
    {
        float _244 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _246 = log2(_244);
        float _248 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _250 = _248 + 1.0;
        float _252 = 1.0 / _250;
        float _254 = _158 * _246;
        float _256 = exp2(_254);
        float _258 = -_256;
        float _260 = _258 + 1.0;
        float _262 = _260 * _252;
        _188 = _262;
    }
    float _264 = _188;
    bool _266 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _268 = _240 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _270 = _240 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _272 = _240 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _274 = fma(_264, _176, _268);
    float _276 = fma(_264, _174, _270);
    float _278 = fma(_264, _178, _272);
    float _280 = fma(_274, _172, _182);
    float _282 = fma(_276, _172, _180);
    float _284 = fma(_278, _172, _184);
    float _286 = _108 * _156;
    bool _288 = !_266;
    float _290 = _286;
    float _308;
    if (!_288)
    {
        float _292 = in.m_59.x;
        float _294 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _296 = _292 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _298 = fma(_296, (*spvDescriptorSet0.vp_c9)._m0[12].x, _108);
        float _300 = _298 * _294;
        float _302 = floor(_300);
        float _304 = -_302;
        float _306 = _300 + _304;
        _308 = _306;
        _310 = true;
    }
    else
    {
        _308 = _286;
    }
    _310 = false;
    float _312 = _308;
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _316 = _312 + _314;
    bool _318 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _320 = isnan(_312);
    bool _322 = _318 || _320;
    bool _324 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _326 = _322 || _324;
    float _328 = float(_326);
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _332 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _330;
    float _334 = 1.0 / _332;
    bool _336 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _338 = isnan(_312);
    bool _340 = _336 || _338;
    bool _342 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _344 = _340 || _342;
    float _346 = float(_344);
    float _348 = -_328;
    float _350 = _348 + 1.0;
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _354 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _352;
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _358 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _356;
    bool _360 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _364 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _362;
    float _366 = _346 * _350;
    float _368 = -_346;
    float _370 = _368 + 1.0;
    float _372 = _316 * _334;
    float _374 = in.m_55.x;
    float _376 = in.m_55.y;
    float _378 = in.m_55.z;
    float _380 = fma(_354, _372, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _382 = fma(_364, _372, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _384 = fma(_358, _372, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _386 = _380 * _366;
    float _388 = _382 * _366;
    float _390 = _384 * _366;
    float _392 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[143].x, _386);
    float _394 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[143].y, _388);
    float _396 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[143].z, _390);
    float _398 = fma(_328, (*spvDescriptorSet0.vp_c9)._m0[144].x, _392);
    float _400 = fma(_328, (*spvDescriptorSet0.vp_c9)._m0[144].y, _394);
    float _402 = fma(_328, (*spvDescriptorSet0.vp_c9)._m0[144].z, _396);
    float _404 = _398 * _374;
    float _406 = _400 * _376;
    float _408 = _402 * _378;
    bool _410 = !_360;
    float _428;
    if (!_410)
    {
        float _412 = in.m_59.x;
        float _414 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _416 = _412 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _418 = fma(_416, (*spvDescriptorSet0.vp_c9)._m0[11].y, _108);
        float _420 = _418 * _414;
        float _422 = floor(_420);
        float _424 = -_422;
        float _426 = _420 + _424;
        _428 = _426;
        _430 = true;
    }
    else
    {
        _428 = _286;
    }
    _430 = false;
    float _432 = _428;
    bool _434 = _432 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _436 = isnan(_432);
    bool _438 = _434 || _436;
    bool _440 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _442 = _438 || _440;
    float _444 = float(_442);
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _448 = _446 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _450 = _432 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _452 = isnan(_432);
    bool _454 = _450 || _452;
    bool _456 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _458 = _454 || _456;
    float _460 = float(_458);
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _464 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _462;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _468 = _432 + _466;
    float _470 = -_444;
    float _472 = _470 + 1.0;
    bool _474 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _476 = 1.0 / _448;
    float _478 = _460 * _472;
    float _480 = -_460;
    float _482 = _480 + 1.0;
    float _484 = _464 * _476;
    float _486 = fma(_484, _468, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _488 = _486 * _478;
    float _490 = fma(_482, (*spvDescriptorSet0.vp_c9)._m0[115].x, _488);
    float _492 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _494 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _496 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _498 = fma(_444, (*spvDescriptorSet0.vp_c9)._m0[116].x, _490);
    float _500 = _492 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _502 = _494 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _504 = _496 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _506 = _498 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_61.x = _500;
    out.m_61.y = _502;
    out.m_61.z = _504;
    out.m_61.w = _506;
    bool _508 = !_474;
    if (!_508)
    {
        float _510 = in.m_59.x;
        float _512 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _514 = _510 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _516 = fma(_514, (*spvDescriptorSet0.vp_c9)._m0[11].w, _108);
        float _518 = _516 * _512;
        float _520 = floor(_518);
        float _522 = -_520;
        float _524 = _518 + _522;
        _290 = _524;
    }
    float _526 = _290;
    float _528 = in.m_59.z;
    float _530 = in.m_59.w;
    float _532 = _280 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _534 = _280 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _536 = in.m_59.y;
    int _538 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _540 = _538 != 0;
    float _542 = _280 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _544 = fma(_282, (*spvDescriptorSet0.vp_c10)._m0[5].x, _532);
    float _546 = fma(_282, (*spvDescriptorSet0.vp_c10)._m0[6].x, _534);
    float _548 = fma(_282, (*spvDescriptorSet0.vp_c10)._m0[4].x, _542);
    float _550 = fma(_284, (*spvDescriptorSet0.vp_c10)._m0[5].z, _544);
    float _552 = fma(_284, (*spvDescriptorSet0.vp_c10)._m0[6].z, _546);
    float _554 = fma(_284, (*spvDescriptorSet0.vp_c10)._m0[4].z, _548);
    float _556 = _504;
    float _558 = _526;
    if (_540)
    {
        float _560 = in.m_59.x;
        _556 = _560;
    }
    float _562 = _556;
    float _564 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _566 = _528 * 2.0;
    float _568 = _536 * 2.0;
    float _570 = floor(_566);
    float _572 = floor(_568);
    bool _574 = _570 > 0.0;
    bool _576 = _570 >= 0.0;
    bool _578 = isnan(_570);
    bool _580 = _576 || _578;
    bool _582 = isnan(0.0);
    bool _584 = _580 || _582;
    float _586 = _536 + _528;
    int _588 = _584 ? 0 : 1;
    float _590 = _586 + (-1.0);
    bool _592 = _572 > 0.0;
    bool _594 = _572 >= 0.0;
    bool _596 = isnan(_572);
    bool _598 = _594 || _596;
    bool _600 = isnan(0.0);
    bool _602 = _598 || _600;
    float _604 = fma(_590, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _606 = _602 ? 0.0 : 1.4012984643248170709237295832899e-45;
    int _608 = ~_588;
    int _610 = _608 + 1;
    int _612 = _610 + 1;
    float _614 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    int _616 = ~as_type<int>(_606);
    int _618 = _616 + 1;
    int _620 = _618 + 1;
    int _622 = _612;
    int _624 = _620;
    bool _626 = _574;
    float _628 = _606;
    float _630 = _590;
    if (!_574)
    {
        int _632 = ~_588;
        int _634 = _632 + 1;
        _622 = _634;
    }
    int _636 = _622;
    if (!_592)
    {
        int _638 = ~as_type<int>(_606);
        int _640 = _638 + 1;
        _624 = _640;
    }
    int _642 = _624;
    if (_540)
    {
        _626 = false;
    }
    bool _644 = _626;
    bool _646 = _644;
    if (_540)
    {
        _628 = _536;
    }
    float _648 = _628;
    float _650 = _648;
    float _652 = _562;
    if (_540)
    {
        _630 = _562;
    }
    float _654 = _630;
    float _656 = _654;
    if (!_540)
    {
        float _658 = in.m_59.x;
        float _660 = _536 * 3.1415927410125732421875;
        float _662 = _660 * 0.15915493667125701904296875;
        float _664 = _662 * 6.283185482025146484375;
        float _666 = sin(_664);
        float _668 = _658 * 3.1415927410125732421875;
        float _670 = _668 * 0.15915493667125701904296875;
        float _672 = _670 * 6.283185482025146484375;
        float _674 = sin(_672);
        _656 = _674;
        _646 = true;
        _650 = _666;
        _652 = _658;
    }
    float _676 = _656;
    bool _678 = _646;
    float _680 = _650;
    float _682 = _652;
    float _684 = fma(_676, (*spvDescriptorSet0.vp_c9)._m0[93].z, _614);
    float _686 = _676 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _688 = _554 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _690 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _692 = _690 != 0;
    int _694 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _696 = _694 != 0;
    int _698 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _700 = _698 != 0;
    float _702 = -_564;
    float _704 = fma(_686, 2.0, _702);
    float _706 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _708 = _680 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _710 = _682 * 2.0;
    float _712 = fma(_680, (*spvDescriptorSet0.vp_c9)._m0[93].w, _706);
    float _714 = _550 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _716 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _718 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _720 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _722 = _714 + _720;
    float _724 = _706;
    float _726 = (*spvDescriptorSet0.vp_c9)._m0[93].w;
    if (_678)
    {
        _724 = _536;
    }
    float _728 = _724;
    float _730 = fma(_708, -2.0, _716);
    float _732 = _728;
    if (_678)
    {
        _726 = _682;
    }
    float _734 = _726;
    float _736 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _738 = log2(_736);
    float _740 = _734;
    if (!_678)
    {
        _732 = _682;
    }
    float _742 = _732;
    float _744 = _552 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _746 = _742;
    if (!_678)
    {
        _740 = _528;
    }
    float _748 = _740;
    float _750 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _752 = _688 + _750;
    float _754 = _722 * _722;
    float _756 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    float _758 = floor(_710);
    float _760 = fma(_742, (*spvDescriptorSet0.vp_c9)._m0[83].z, _718);
    float _762 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _764 = _744 + _762;
    float _766 = fma(_752, _752, _754);
    float _768 = fma(_748, (*spvDescriptorSet0.vp_c9)._m0[84].z, _756);
    float _770 = _748;
    if (_678)
    {
        _746 = _528;
    }
    float _772 = _746;
    float _774 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _776 = _772;
    if (_678)
    {
        _770 = _536;
    }
    float _778 = _770;
    float _780 = _536 + _682;
    float _782 = _778;
    if (!_678)
    {
        _776 = _536;
    }
    float _784 = _776;
    float _786 = fma(_764, _764, _766);
    float _788 = _780 + (-1.0);
    if (!_678)
    {
        _782 = _682;
    }
    float _790 = _782;
    float _792 = fma(_784, (*spvDescriptorSet0.vp_c9)._m0[83].w, _774);
    float _794 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _796 = sqrt(_786);
    float _798 = _790 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _800 = fma(_788, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _802 = _738 * _108;
    float _804 = -_794;
    float _806 = fma(_798, 2.0, _804);
    float _808 = _798;
    if (_678)
    {
        _808 = _528;
    }
    float _810 = _808;
    float _812 = _404 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _814 = _810;
    if (!_678)
    {
        _814 = _536;
    }
    float _816 = _814;
    float _818 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _820 = _758 > 0.0;
    float _822 = exp2(_802);
    bool _824 = _758 >= 0.0;
    bool _826 = isnan(_758);
    bool _828 = _824 || _826;
    bool _830 = isnan(0.0);
    bool _832 = _828 || _830;
    float _834 = _816 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _836 = !_692;
    int _838 = _836 ? 0 : 1;
    float _840 = _812 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _842 = fma(_834, -2.0, _818);
    int _844 = abs(_838);
    float _846 = _796 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _848 = float(_636);
    float _850 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _852 = 1.0 + _850;
    float _854 = float(_844);
    float _856 = rsqrt(_786);
    float _858 = precise::min(_840, _846);
    float _860 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[92].z, _684);
    bool _862 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _864 = isnan(1.0);
    bool _866 = _862 || _864;
    bool _868 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _870 = _866 || _868;
    float _872 = _854 * _848;
    float _874 = -_822;
    float _876 = _874 + 1.0;
    float _878 = in.m_63.x;
    float _880 = in.m_63.y;
    float _882 = in.m_63.z;
    bool _884 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _886 = isnan(0.0);
    bool _888 = _884 || _886;
    bool _890 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _892 = _888 || _890;
    float _894 = 1.0 / _852;
    bool _896 = !_700;
    int _898 = _896 ? 0 : 1;
    float _900 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[84].x, _768);
    float _902 = _892 ? _876 : 0.0;
    float _904 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[82].z, _760);
    int _906 = abs(_898);
    float _908 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[92].w, _712);
    int _910 = _832 ? 0 : 1;
    float _912 = _856 * _858;
    float _914 = float(_642);
    float _916 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[91].y, _730);
    float _918 = -_108;
    float _920 = fma(_918, (*spvDescriptorSet0.vp_c9)._m0[91].x, _704);
    float _922 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[82].w, _792);
    float _924 = -_108;
    float _926 = fma(_924, (*spvDescriptorSet0.vp_c9)._m0[81].x, _806);
    float _928 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[81].y, _842);
    float _930 = float(_906);
    if (_870)
    {
        float _932 = _902 * _894;
        _118 = _932;
    }
    float _934 = _118;
    int _936 = ~_910;
    int _938 = _936 + 1;
    int _940 = _938 + 1;
    float _942 = _722 * _912;
    int _944 = _940;
    if (!_820)
    {
        int _946 = ~_910;
        int _948 = _946 + 1;
        _944 = _948;
    }
    int _950 = _944;
    float _952 = _872 * (-2.0);
    float _954 = _752 * _912;
    float _956 = _930 * _914;
    float _958 = -_942;
    float _960 = _722 + _958;
    float _962 = fma(_800, _952, _800);
    float _964 = -_954;
    float _966 = _752 + _964;
    bool _968 = !_696;
    int _970 = _968 ? 0 : 1;
    float _972 = fma(_952, _878, _878);
    float _974 = _960 * _960;
    float _976 = _764 * _912;
    float _978 = _682 + (-0.5);
    int _980 = abs(_970);
    float _982 = fma(_966, _966, _974);
    float _984 = -_976;
    float _986 = _764 + _984;
    float _988 = fma(_978, (*spvDescriptorSet0.vp_c9)._m0[196].x, _972);
    float _990 = _528 + _682;
    float _992 = fma(_986, _986, _982);
    float _994 = _990 + (-1.0);
    float _996 = float(_980);
    float _998 = fma(_962, _934, _988);
    float _1000 = float(_950);
    float _1002 = fma(_994, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1004 = _956 * (-2.0);
    float _1006 = _998 * 0.15915493667125701904296875;
    float _1008 = sqrt(_992);
    float _1010 = _996 * _1000;
    float _1012 = _528 + (-0.5);
    float _1014 = fma(_1004, _882, _882);
    float _1016 = fma(_1002, _1004, _1002);
    float _1018 = _1010 * (-2.0);
    float _1020 = _536 + (-0.5);
    float _1022 = fma(_1012, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1014);
    float _1024 = _1006 * 6.283185482025146484375;
    float _1026 = sin(_1024);
    float _1028 = fma(_1018, _880, _880);
    float _1030 = fma(_604, _1018, _604);
    float _1032 = in.m_65.x;
    float _1034 = in.m_65.y;
    float _1036 = in.m_65.z;
    float _1038 = fma(_1016, _934, _1022);
    float _1040 = fma(_1020, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1028);
    float _1042 = _406 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1044 = _408 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1046 = _1038 * 0.15915493667125701904296875;
    float _1048 = fma(_1030, _934, _1040);
    float _1050 = _1006 * 6.283185482025146484375;
    float _1052 = cos(_1050);
    float _1054 = _856 * _1008;
    float _1056 = _1048 * 0.15915493667125701904296875;
    float _1058 = _1042 * _1054;
    float _1060 = _1044 * _1054;
    float _1062 = _812 * _1054;
    float _1064 = _1046 * 6.283185482025146484375;
    float _1066 = cos(_1064);
    bool _1068 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1070 = isnan(0.5);
    bool _1072 = _1068 || _1070;
    bool _1074 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1076 = _1072 || _1074;
    bool _1078 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1080 = isnan(0.5);
    bool _1082 = _1078 || _1080;
    bool _1084 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1086 = _1082 || _1084;
    float _1088 = _1056 * 6.283185482025146484375;
    float _1090 = sin(_1088);
    float _1092 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1034);
    float _1094 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1036);
    float _1096 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1032);
    float _1098 = _1058 * _1092;
    float _1100 = _1060 * _1094;
    float _1102 = _1056 * 6.283185482025146484375;
    float _1104 = cos(_1102);
    float _1106 = _1066 * _1098;
    float _1108 = _1046 * 6.283185482025146484375;
    float _1110 = sin(_1108);
    float _1112 = _1026 * _1090;
    float _1114 = _1052 * _1090;
    float _1116 = _1052 * _1104;
    float _1118 = _1062 * _1096;
    float _1120 = _1052 * _1106;
    float _1122 = _1026 * _1104;
    float _1124 = _1104 * _1066;
    float _1126 = _1026 * _1106;
    float _1128 = _1090 * _1066;
    float _1130 = fma(_1110, _1116, _1112);
    float _1132 = fma(_1110, _1112, _1116);
    float _1134 = fma(_1130, _1118, _1120);
    float _1136 = -_1098;
    float _1138 = _1110 * _1136;
    float _1140 = -_1122;
    float _1142 = fma(_1110, _1114, _1140);
    float _1144 = -_1114;
    float _1146 = fma(_1110, _1122, _1144);
    float _1148 = fma(_1124, _1118, _1138);
    float _1150 = fma(_1142, _1100, _1134);
    float _1152 = fma(_1146, _1118, _1126);
    float _1154 = fma(_1128, _1100, _1148);
    float _1156 = _1150 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1158 = fma(_1132, _1100, _1152);
    float _1160 = _1150 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1162 = _1150 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1164 = fma(_1154, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1156);
    float _1166 = -_976;
    float _1168 = _744 + _1166;
    float _1170 = fma(_1154, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1160);
    float _1172 = fma(_1154, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1162);
    float _1174 = fma(_1158, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1164);
    float _1176 = fma(_1158, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1170);
    float _1178 = fma(_1158, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1172);
    float _1180 = _1174 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1182 = _1176 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1184 = _1178 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1186 = _744 + _1180;
    float _1188 = _688 + _1182;
    float _1190 = -_954;
    float _1192 = _688 + _1190;
    float _1194 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1196 = _1186 + _1194;
    float _1198 = _714 + _1184;
    float _1200 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1202 = _1188 + _1200;
    float _1204 = _1196 * _1196;
    float _1206 = fma(_1202, _1202, _1204);
    float _1208 = -_942;
    float _1210 = _714 + _1208;
    float _1212 = sqrt(_1206);
    float _1214 = _1210 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1216 = fma(_1192, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1214);
    float _1218 = _1210 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1220 = fma(_1168, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1216);
    float _1222 = fma(_1192, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1218);
    float _1224 = _1220 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1226 = fma(_1168, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1222);
    bool _1228 = _1212 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1230 = 1.0 / _1224;
    float _1232 = _1226 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1234 = _1232 + _1224;
    float _1236 = _1178;
    float _1238 = _1232;
    float _1240 = _1220;
    float _1242 = _954;
    float _1244 = _976;
    if (!_1228)
    {
        _1236 = _1188;
    }
    float _1246 = _1236;
    float _1248 = _1246;
    if (!_1228)
    {
        _1238 = _1186;
    }
    float _1250 = _1238;
    float _1252 = _1250;
    if (!_1228)
    {
        _1240 = _1198;
    }
    float _1254 = _1240;
    bool _1256 = !_1228;
    float _1258 = _1254;
    if (!_1256)
    {
        float _1260 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1262 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1264 = _1212 + _1262;
        float _1266 = _1198 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1268 = rsqrt(_1206);
        float _1270 = _1264 * _1260;
        float _1272 = _1270 * 0.15915493667125701904296875;
        float _1274 = _1272 * 6.283185482025146484375;
        float _1276 = sin(_1274);
        float _1278 = _1272 * 6.283185482025146484375;
        float _1280 = cos(_1278);
        float _1282 = fma(_1276, _1266, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1284 = _1268 * _1282;
        float _1286 = _1280 + (-1.0);
        float _1288 = _1286 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1290 = fma(_1202, _1284, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1292 = fma(_1196, _1284, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1294 = fma(_1198, _1280, _1288);
        _1248 = _1290;
        _1258 = _1294;
        _1252 = _1292;
    }
    float _1296 = _1248;
    float _1298 = _1258;
    float _1300 = _1252;
    float _1302 = -_954;
    float _1304 = _1302 + _1296;
    float _1306 = -_942;
    float _1308 = _1306 + _1298;
    float _1310 = -_976;
    float _1312 = _1310 + _1300;
    float _1314 = _1234 * _1230;
    float _1316 = _1314 * 0.5;
    float _1318 = _1308;
    float _1320 = _1304;
    float _1322 = _1312;
    float _1324 = _1298;
    if (_1086)
    {
        _1242 = 1.0;
    }
    float _1326 = _1242;
    float _1328 = _1326;
    if (!_1076)
    {
        float _1330 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1332 = _1210 + _1330;
        float _1334 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1336 = _1192 + _1334;
        float _1338 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1340 = -_688;
        float _1342 = _1340 + _1296;
        float _1344 = _1332 * _1332;
        float _1346 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1348 = _1168 + _1346;
        float _1350 = -_744;
        float _1352 = _1350 + _1300;
        float _1354 = fma(_1336, _1336, _1344);
        float _1356 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1358 = fma(_1348, _1348, _1354);
        float _1360 = sqrt(_1358);
        float _1362 = _1338 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1364 = -_714;
        float _1366 = _1364 + _1298;
        float _1368 = precise::min(_1360, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1370 = _1368 * _1356;
        float _1372 = _1362 * _1370;
        float _1374 = fma(_1342, _1372, _1192);
        float _1376 = fma(_1366, _1372, _1210);
        float _1378 = fma(_1352, _1372, _1168);
        _1318 = _1376;
        _1320 = _1374;
        _1322 = _1378;
        _1244 = _1372;
    }
    float _1380 = _1318;
    float _1382 = _1320;
    float _1384 = _1322;
    float _1386 = _1244;
    float _1388 = _1386;
    if (!_1086)
    {
        float _1390 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1392 = _1390 * 0.15915493667125701904296875;
        float _1394 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1396 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1398 = fma(_1316, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1396);
        float _1400 = _1392 * 6.283185482025146484375;
        float _1402 = cos(_1400);
        float _1404 = _1394 * 0.15915493667125701904296875;
        float _1406 = _1392 * 6.283185482025146484375;
        float _1408 = sin(_1406);
        float _1410 = 1.0 / _1402;
        float _1412 = _1404 * 6.283185482025146484375;
        float _1414 = cos(_1412);
        float _1416 = _1408 * _1410;
        float _1418 = _1404 * 6.283185482025146484375;
        float _1420 = sin(_1418);
        float _1422 = _1414 * _1416;
        float _1424 = 1.0 / _1398;
        float _1426 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1428 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1426;
        float _1430 = 1.0 / _1422;
        float _1432 = 1.0 / _1428;
        float _1434 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1436 = _1424 * _1434;
        float _1438 = _1420 * _1430;
        float _1440 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1442 = fma(_1438, _1436, _1440);
        float _1444 = _1442 * _1432;
        float _1446 = precise::clamp(_1444, 0.0, 1.0);
        _1324 = _1404;
        _1388 = _1424;
        _1328 = _1446;
    }
    float _1448 = _1324;
    float _1450 = _1388;
    float _1452 = _1328;
    float _1454 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1456 = _1380 + _1454;
    float _1458 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1460 = _1382 + _1458;
    float _1462 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1464 = _1384 + _1462;
    float _1466 = _1456 * _1456;
    float _1468 = fma(_1460, _1460, _1466);
    float _1470 = fma(_1464, _1464, _1468);
    float _1472 = rsqrt(_1470);
    float _1474 = sqrt(_1470);
    float _1476 = _1472 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1478 = _1460 * _1476;
    float _1480 = _1464 * _1476;
    float _1482 = _1478 * _1478;
    float _1484 = _1480 * _1480;
    float _1486 = _1482 + _1484;
    float _1488 = sqrt(_1486);
    bool _1490 = _1488 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1492 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1494 = _1488 + _1492;
    float _1496 = _1464;
    float _1498 = _1466;
    float _1500 = _1494;
    float _1502 = _1448;
    float _1504 = _1476;
    if (_1490)
    {
        float _1506 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1496 = _1506;
    }
    float _1508 = _1496;
    if (_1490)
    {
        float _1510 = rsqrt(_1486);
        _1498 = _1510;
    }
    float _1512 = _1498;
    float _1514 = _1512;
    if (_1490)
    {
        float _1516 = _1494 * _1508;
        _1500 = _1516;
    }
    float _1518 = _1500;
    if (_1490)
    {
        float _1520 = _1518 * 0.15915493667125701904296875;
        _1502 = _1520;
    }
    float _1522 = _1502;
    float _1524 = _1472;
    if (_1490)
    {
        float _1526 = _1522 * 6.283185482025146484375;
        float _1528 = sin(_1526);
        _1524 = _1528;
    }
    float _1530 = _1524;
    float _1532 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1534 = precise::max(0.0, _1532);
    float _1536 = _1450;
    float _1538 = _1534;
    float _1540 = _1532;
    if (_1490)
    {
        float _1542 = _1522 * 6.283185482025146484375;
        float _1544 = cos(_1542);
        _1536 = _1544;
    }
    float _1546 = _1536;
    float _1548 = -_1476;
    float _1550 = -_1534;
    float _1552 = fma(_1456, _1548, _1550);
    float _1554 = _1552;
    if (_1490)
    {
        float _1556 = _1552 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1538 = _1556;
    }
    float _1558 = _1538;
    float _1560 = _1380 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1562 = _1530;
    float _1564 = _1558;
    if (_1490)
    {
        float _1566 = fma(_1530, _1558, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1562 = _1566;
    }
    float _1568 = _1562;
    float _1570 = _1568;
    if (!_1490)
    {
        _1564 = _1482;
    }
    float _1572 = _1564;
    float _1574 = _1572;
    float _1576 = _1546;
    if (_1490)
    {
        float _1578 = _1546 + (-1.0);
        _1540 = _1578;
    }
    float _1580 = _1540;
    float _1582 = _1580;
    if (_1490)
    {
        float _1584 = _1512 * _1568;
        _1504 = _1584;
    }
    float _1586 = _1504;
    if (!_1490)
    {
        _1570 = _1478;
    }
    float _1588 = _1570;
    float _1590 = _1588;
    if (_1490)
    {
        float _1592 = _1580 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1514 = _1592;
    }
    float _1594 = _1514;
    if (_1490)
    {
        float _1596 = _1478 * _1586;
        _1590 = _1596;
    }
    float _1598 = _1590;
    if (!_1490)
    {
        _1582 = _1480;
    }
    float _1600 = _1582;
    float _1602 = _1600;
    if (_1490)
    {
        float _1604 = _1480 * _1586;
        _1602 = _1604;
    }
    float _1606 = _1602;
    if (_1490)
    {
        float _1608 = fma(_1552, _1546, _1594);
        _1554 = _1608;
    }
    float _1610 = _1554;
    if (_1490)
    {
        float _1612 = _1598 * _1598;
        _1574 = _1612;
    }
    float _1614 = _1574;
    if (!_1490)
    {
        _1576 = _1484;
    }
    float _1616 = _1576;
    float _1618 = _1616;
    if (_1490)
    {
        float _1620 = _1606 * _1606;
        _1618 = _1620;
    }
    float _1622 = _1618;
    float _1624 = fma(_1610, _1610, _1614);
    float _1626 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1628 = _1624 + _1622;
    float _1630 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1560);
    float _1632 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1634 = fma(_1474, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1632);
    float _1636 = precise::clamp(_1634, 0.0, 1.0);
    float _1638 = _1380 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1640 = rsqrt(_1628);
    float _1642 = fma(_1384, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1630);
    float _1644 = _1380 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1646 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1638);
    float _1648 = -_1636;
    float _1650 = _1648 + 1.0;
    float _1652 = _1642 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1654 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1644);
    float _1656 = fma(_1384, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1646);
    float _1658 = _1380 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1660 = _1652 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1662 = abs(_1650);
    float _1664 = log2(_1662);
    float _1666 = fma(_1384, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1654);
    float _1668 = _1656 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1670 = -_1660;
    float _1672 = fma(_1670, _1626, 1.0);
    float _1674 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1658);
    float _1676 = _1666 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1678 = _1668 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1680 = _1640 * _1598;
    float _1682 = _1640 * _1610;
    float _1684 = fma(_1384, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1674);
    float _1686 = fma(_1676, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1678);
    float _1688 = _1680 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1690 = _1640 * _1606;
    float _1692 = _1684 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1694 = fma(_1652, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1686);
    float _1696 = -_1688;
    float _1698 = fma(_1682, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1696);
    float _1700 = _1664 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1702 = log2(_1672);
    float _1704 = fma(_1692, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1694);
    float _1706 = -_1690;
    float _1708 = fma(_1706, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1698);
    float _1710 = _1668 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1712 = _1668 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1714 = fma(_1708, -0.5, 0.5);
    float _1716 = fma(_1676, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1710);
    float _1718 = exp2(_1700);
    float _1720 = fma(_1708, 0.5, 0.5);
    float _1722 = fma(_1676, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1712);
    float _1724 = _1682 + 1.0;
    float _1726 = fma(_1652, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1716);
    float _1728 = fma(_1720, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1730 = fma(_1652, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1722);
    float _1732 = 1.0 / _1704;
    float _1734 = fma(_1720, _1728, -0.212114393711090087890625);
    float _1736 = _1702 * 0.693147182464599609375;
    float _1738 = fma(_1720, _1734, 1.570728778839111328125);
    float _1740 = _1736 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1742 = sqrt(_1714);
    float _1744 = -_1682;
    float _1746 = fma(_1718, _1724, _1744);
    float _1748 = fma(_1692, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1726);
    float _1750 = fma(_1692, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1730);
    float _1752 = fma(_1746, 0.5, 0.5);
    float _1754 = _1748 * _1732;
    float _1756 = _1750 * _1732;
    float _1758 = fma(_1754, 0.5, 0.5);
    float _1760 = fma(_1756, -0.5, 0.5);
    float _1762 = _1742 * 0.636619746685028076171875;
    float3 _4753 = float3(_1758, _1760, _1740);
    float _1764 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4753, float3(0.0), isnan(_4753)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4753, float3(0.0), isnan(_4753)), level(0.0)).x;
    float3 _4764 = float3(_1758, _1760, _1740);
    float4 _1767 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4764, float3(0.0), isnan(_4764)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4764, float3(0.0), isnan(_4764)), level(0.0)).xyzw;
    float _1769 = _1767.x;
    float _1771 = _1767.y;
    float _1773 = _1767.z;
    float _1775 = _1767.w;
    float _1777 = -_1738;
    float _1779 = fma(_1762, _1777, 1.0);
    float2 _4786 = float2(_1779, _1752);
    float3 _1783 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4786, float2(0.0), isnan(_4786)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4786, float2(0.0), isnan(_4786)), level(0.0)).xyz;
    float _1785 = _1783.x;
    float _1787 = _1783.y;
    float _1789 = _1783.z;
    float _1791 = _1664 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1793 = _1668 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1795 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1797 = _1795 != 0;
    out.m_67.x = _1192;
    out.m_67.y = _1210;
    out.m_67.z = _1168;
    float _1799 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1801 = _1799 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1803 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1805 = _528 > 0.5;
    float _1807 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1809 = _1807 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    int _1811 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1813 = _1811 != 0;
    float _1815 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1817 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1815;
    int _1819 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1821 = _1819 != 0;
    float _1823 = fma(_1676, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1793);
    int _1825 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1827 = _1825 != 0;
    float _1829 = _846;
    bool _1831 = _1805;
    if (_1797)
    {
        float _1833 = in.m_59.z;
        _1829 = _1833;
    }
    float _1835 = _1829;
    float _1837 = 1.0 / _1801;
    float _1839 = -_160;
    float _1841 = _1839 + 1.0;
    bool _1843 = _536 > 0.5;
    bool _1845 = _1843 && _1813;
    float _1847 = fma(_1652, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1823);
    bool _1849 = _530 > 0.5;
    float _1851 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1853 = _1851 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    int _1855 = _1805 ? as_type<int>(_1841) : as_type<int>(_160);
    out.m_69.w = _858;
    float _1857 = 1.0 / _1809;
    bool _1859 = _526 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1861 = isnan(_526);
    bool _1863 = _1859 || _1861;
    bool _1865 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1867 = _1863 || _1865;
    float _1869 = float(_1867);
    out.m_71.x = _1062;
    out.m_73.x = _1382;
    out.m_73.y = _1380;
    out.m_73.z = _1384;
    float _1871 = _1817 * _1837;
    bool _1873 = _526 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1875 = isnan(_526);
    bool _1877 = _1873 || _1875;
    bool _1879 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1881 = _1877 || _1879;
    float _1883 = float(_1881);
    float _1885 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _1887 = _526 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1889 = isnan(_526);
    bool _1891 = _1887 || _1889;
    bool _1893 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1895 = _1891 || _1893;
    float _1897 = float(_1895);
    float _1899 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1901 = _526 + _1899;
    float _1903 = -_1883;
    float _1905 = _1903 + 1.0;
    int _1907 = as_type<int>(_1905);
    if (_1797)
    {
        bool _1909 = _1835 > 0.5;
        _1831 = _1909;
    }
    bool _1911 = _1831;
    float _1913 = _1853 * _1857;
    float _1915 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1917 = _526 + _1915;
    float _1919 = -_1897;
    float _1921 = _1919 + 1.0;
    float _1923 = _1897 * _1905;
    float _1925 = fma(_1871, _1901, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1927 = fma(_1913, _1917, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1929 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _1931 = _1869 * _1921;
    if (_1797)
    {
        float _1933 = -_154;
        float _1935 = _1933 + 1.0;
        _1907 = as_type<int>(_1935);
    }
    int _1937 = _1907;
    float _1939 = _1821 ? as_type<float>(_1855) : _160;
    float _1941 = -_1869;
    float _1943 = _1941 + 1.0;
    float _1945 = _1925 * _1931;
    if (_1827)
    {
        float _1947 = _1849 ? _1841 : _160;
        _206 = _1947;
    }
    float _1949 = _206;
    float _1951 = _900 * (-0.15915493667125701904296875);
    float _1953 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _1955 = _1885 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1957 = _1885;
    if (!_1797)
    {
        _558 = _154;
    }
    float _1959 = _558;
    float _1961 = _1803 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1963 = _1959;
    if (_1797)
    {
        float _1965 = _1911 ? as_type<float>(_1937) : _154;
        _1963 = _1965;
    }
    float _1967 = _1963;
    float _1969 = fma(_1955, _1949, -0.5);
    if (!_1813)
    {
        _1957 = _154;
    }
    float _1971 = _1957;
    float _1973 = _1971;
    if (_1845)
    {
        float _1975 = -_154;
        float _1977 = _1975 + 1.0;
        _208 = _1977;
    }
    float _1979 = _208;
    float _1981 = _1951 * 6.283185482025146484375;
    float _1983 = sin(_1981);
    float _1985 = fma(_1943, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1945);
    float _1987 = _1929 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _1989 = fma(_1961, _1967, -0.5);
    if (_1813)
    {
        _1973 = _1979;
    }
    float _1991 = _1973;
    float _1993 = fma(_1927, _1923, _1985);
    float _1995 = fma(_1939, _1987, -0.5);
    float _1997 = _1951 * 6.283185482025146484375;
    float _1999 = cos(_1997);
    float _2001 = _1953 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _2003 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2005 = fma(_2001, _1991, -0.5);
    float _2007 = fma(_1883, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1993);
    float _2009 = _2003 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2011 = exp2(_1791);
    float _2013 = _1983 * _1969;
    float _2015 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2017 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2019 = fma(_860, _2005, _920);
    float _2021 = -_916;
    float _2023 = fma(_908, _1995, _2021);
    float _2025 = _2015 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2027 = _2017 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2029 = _1999 * _1969;
    float _2031 = -_2013;
    float _2033 = fma(_1999, _1989, _2031);
    float _2035 = _2007 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _2037 = _1452 > 0.0;
    bool _2039 = isnan(_1452);
    bool _2041 = _2037 || _2039;
    bool _2043 = isnan(0.0);
    bool _2045 = _2041 || _2043;
    float _2047 = fma(_1983, _1989, _2029);
    float _2049 = fma(_904, _2033, _926);
    float _2051 = _1704 * 0.5;
    out.m_75.x = _2009;
    out.m_75.y = _2025;
    out.m_75.z = _2027;
    out.m_75.w = _2035;
    float _2053 = -_2011;
    float _2055 = _2053 + 1.0;
    float _2057 = -_928;
    float _2059 = fma(_922, _2047, _2057);
    float _2061 = _2019 + 0.5;
    float _2063 = _2049 + 0.5;
    float _2065 = _2055 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2067 = _2023 + 0.5;
    float _2069 = _1452 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2071 = fma(_1692, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1847);
    float _2073 = _2059 + 0.5;
    float _2075 = _2069 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_77.x = _2061;
    out.m_77.y = _2067;
    float _2077 = _2071 + _1704;
    float _2079 = _1748 + _1704;
    out.m_79.z = _2063;
    out.m_79.w = _2073;
    float _2081 = _2077 * 0.5;
    float _2083 = _2079 * 0.5;
    float _2085 = fma(_1750, -0.5, _2051);
    out.gl_Position.x = _1748;
    out.gl_Position.y = _1750;
    out.gl_Position.z = _2071;
    out.gl_Position.w = _1704;
    out.m_81.x = _2083;
    out.m_81.y = _2085;
    out.m_81.z = _2081;
    out.m_81.w = _1704;
    out.m_51.x = _2075;
    float _2087 = _2065 * _1764;
    float _2089 = -_2065;
    float _2091 = _2089 + 1.0;
    float _2093 = _1775 * _2087;
    float _2095 = _1775 * _2091;
    float _2097 = _1789 * _2087;
    float _2099 = fma(_1785, _2093, _1769);
    float _2101 = fma(_1787, _2093, _1771);
    float _2103 = fma(_1775, _2097, _1773);
    out.m_83.x = _2099;
    out.m_83.y = _2101;
    out.m_83.z = _2103;
    out.m_83.w = _2095;
    if (_2045)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_51.x = 0.0;
    float _2105 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2105;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _430 = false;
    bool _310 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _97 = in.m_44.w;
    float _99 = in.m_46.w;
    float _101 = trunc(_97);
    int _104 = int(_101);
    float _106 = -_99;
    float _108 = _106 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_49.y = _108;
    bool _112 = _104 >= 1;
    float _114 = 0.0;
    float _116 = as_type<float>(_104);
    float _118 = _108;
    if (!_112)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _120 = _114;
    if (!_112)
    {
        out.m_51.x = 0.0;
    }
    int _122 = 0;
    if (!_112)
    {
        float _124 = _120 * 5.0;
        _122 = as_type<int>(_124);
    }
    int _126 = _122;
    int _128 = _126;
    if (!_112)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2174 = as_type<float>(_126);
        out.gl_Position.z = _2174;
    }
    if (!_112)
    {
        return out;
    }
    bool _130 = _99 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _132 = isnan(_99);
    bool _134 = _130 || _132;
    bool _136 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _138 = _134 || _136;
    float _140 = float(_104);
    bool _142 = _108 >= _140;
    bool _144 = !_138;
    bool _146 = _142 || _144;
    if (_146)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _148 = _116;
    if (_146)
    {
        out.m_51.x = 0.0;
    }
    if (_146)
    {
        float _150 = _148 * 5.0;
        _128 = as_type<int>(_150);
    }
    int _152 = _128;
    if (_146)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2229 = as_type<float>(_152);
        out.gl_Position.z = _2229;
    }
    if (_146)
    {
        return out;
    }
    float _154 = in.m_53.z;
    float _156 = 1.0 / _140;
    float _158 = _108 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _160 = in.m_53.w;
    bool _162 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _164 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _166 = _162 || _164;
    bool _168 = isnan(1.0);
    bool _170 = _166 || _168;
    float _172 = in.m_55.w;
    float _174 = in.m_46.x;
    float _176 = in.m_46.y;
    float _178 = in.m_46.z;
    float _180 = in.m_44.x;
    float _182 = in.m_44.y;
    float _184 = in.m_44.z;
    float _186 = 0.0;
    float _188 = _158;
    if (!_170)
    {
        float _190 = _158 * _158;
        float _192 = _190 * 0.5;
        _186 = _192;
    }
    float _194 = _186;
    float _196 = _194;
    if (!_170)
    {
        float _198 = _194 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _196 = _198;
    }
    float _200 = _196;
    out.m_57.z = _154;
    out.m_57.w = _160;
    bool _202 = !_170;
    float _204 = _200;
    float _206 = _160;
    float _208 = _154;
    if (!_202)
    {
        float _210 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _212 = log2(_210);
        float _214 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _216 = _214 + 1.0;
        float _218 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _220 = _158 * _212;
        float _222 = 1.0 / _216;
        float _224 = _218 * 0.693147182464599609375;
        float _226 = exp2(_220);
        float _228 = 1.0 / _224;
        float _230 = _226 + (-1.0);
        float _232 = -_230;
        float _234 = fma(_232, _228, _158);
        float _236 = _234 * _222;
        float _238 = _236 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _204 = _238;
    }
    float _240 = _204;
    bool _242 = !_170;
    if (!_242)
    {
        float _244 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _246 = log2(_244);
        float _248 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _250 = _248 + 1.0;
        float _252 = 1.0 / _250;
        float _254 = _158 * _246;
        float _256 = exp2(_254);
        float _258 = -_256;
        float _260 = _258 + 1.0;
        float _262 = _260 * _252;
        _188 = _262;
    }
    float _264 = _188;
    bool _266 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _268 = _240 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _270 = _240 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _272 = _240 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _274 = fma(_264, _176, _268);
    float _276 = fma(_264, _174, _270);
    float _278 = fma(_264, _178, _272);
    float _280 = fma(_274, _172, _182);
    float _282 = fma(_276, _172, _180);
    float _284 = fma(_278, _172, _184);
    float _286 = _108 * _156;
    bool _288 = !_266;
    float _290 = _286;
    float _308;
    if (!_288)
    {
        float _292 = in.m_59.x;
        float _294 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _296 = _292 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _298 = fma(_296, (*spvDescriptorSet0.vp_c9)._m0[12].x, _108);
        float _300 = _298 * _294;
        float _302 = floor(_300);
        float _304 = -_302;
        float _306 = _300 + _304;
        _308 = _306;
        _310 = true;
    }
    else
    {
        _308 = _286;
    }
    _310 = false;
    float _312 = _308;
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _316 = _312 + _314;
    bool _318 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _320 = isnan(_312);
    bool _322 = _318 || _320;
    bool _324 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _326 = _322 || _324;
    float _328 = float(_326);
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _332 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _330;
    float _334 = 1.0 / _332;
    bool _336 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _338 = isnan(_312);
    bool _340 = _336 || _338;
    bool _342 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _344 = _340 || _342;
    float _346 = float(_344);
    float _348 = -_328;
    float _350 = _348 + 1.0;
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _354 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _352;
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _358 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _356;
    bool _360 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _364 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _362;
    float _366 = _346 * _350;
    float _368 = -_346;
    float _370 = _368 + 1.0;
    float _372 = _316 * _334;
    float _374 = in.m_55.x;
    float _376 = in.m_55.y;
    float _378 = in.m_55.z;
    float _380 = fma(_354, _372, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _382 = fma(_364, _372, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _384 = fma(_358, _372, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _386 = _380 * _366;
    float _388 = _382 * _366;
    float _390 = _384 * _366;
    float _392 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[143].x, _386);
    float _394 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[143].y, _388);
    float _396 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[143].z, _390);
    float _398 = fma(_328, (*spvDescriptorSet0.vp_c9)._m0[144].x, _392);
    float _400 = fma(_328, (*spvDescriptorSet0.vp_c9)._m0[144].y, _394);
    float _402 = fma(_328, (*spvDescriptorSet0.vp_c9)._m0[144].z, _396);
    float _404 = _398 * _374;
    float _406 = _400 * _376;
    float _408 = _402 * _378;
    bool _410 = !_360;
    float _428;
    if (!_410)
    {
        float _412 = in.m_59.x;
        float _414 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _416 = _412 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _418 = fma(_416, (*spvDescriptorSet0.vp_c9)._m0[11].y, _108);
        float _420 = _418 * _414;
        float _422 = floor(_420);
        float _424 = -_422;
        float _426 = _420 + _424;
        _428 = _426;
        _430 = true;
    }
    else
    {
        _428 = _286;
    }
    _430 = false;
    float _432 = _428;
    bool _434 = _432 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _436 = isnan(_432);
    bool _438 = _434 || _436;
    bool _440 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _442 = _438 || _440;
    float _444 = float(_442);
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _448 = _446 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _450 = _432 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _452 = isnan(_432);
    bool _454 = _450 || _452;
    bool _456 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _458 = _454 || _456;
    float _460 = float(_458);
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _464 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _462;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _468 = _432 + _466;
    float _470 = -_444;
    float _472 = _470 + 1.0;
    bool _474 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _476 = 1.0 / _448;
    float _478 = _460 * _472;
    float _480 = -_460;
    float _482 = _480 + 1.0;
    float _484 = _464 * _476;
    float _486 = fma(_484, _468, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _488 = _486 * _478;
    float _490 = fma(_482, (*spvDescriptorSet0.vp_c9)._m0[115].x, _488);
    float _492 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _494 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _496 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _498 = fma(_444, (*spvDescriptorSet0.vp_c9)._m0[116].x, _490);
    float _500 = _492 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _502 = _494 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _504 = _496 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _506 = _498 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_61.x = _500;
    out.m_61.y = _502;
    out.m_61.z = _504;
    out.m_61.w = _506;
    bool _508 = !_474;
    if (!_508)
    {
        float _510 = in.m_59.x;
        float _512 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _514 = _510 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _516 = fma(_514, (*spvDescriptorSet0.vp_c9)._m0[11].w, _108);
        float _518 = _516 * _512;
        float _520 = floor(_518);
        float _522 = -_520;
        float _524 = _518 + _522;
        _290 = _524;
    }
    float _526 = _290;
    float _528 = in.m_59.z;
    float _530 = in.m_59.w;
    float _532 = _280 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _534 = _280 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _536 = in.m_59.y;
    int _538 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _540 = _538 != 0;
    float _542 = _280 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _544 = fma(_282, (*spvDescriptorSet0.vp_c10)._m0[5].x, _532);
    float _546 = fma(_282, (*spvDescriptorSet0.vp_c10)._m0[6].x, _534);
    float _548 = fma(_282, (*spvDescriptorSet0.vp_c10)._m0[4].x, _542);
    float _550 = fma(_284, (*spvDescriptorSet0.vp_c10)._m0[5].z, _544);
    float _552 = fma(_284, (*spvDescriptorSet0.vp_c10)._m0[6].z, _546);
    float _554 = fma(_284, (*spvDescriptorSet0.vp_c10)._m0[4].z, _548);
    float _556 = _504;
    float _558 = _526;
    if (_540)
    {
        float _560 = in.m_59.x;
        _556 = _560;
    }
    float _562 = _556;
    float _564 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _566 = _528 * 2.0;
    float _568 = _536 * 2.0;
    float _570 = floor(_566);
    float _572 = floor(_568);
    bool _574 = _570 > 0.0;
    bool _576 = _570 >= 0.0;
    bool _578 = isnan(_570);
    bool _580 = _576 || _578;
    bool _582 = isnan(0.0);
    bool _584 = _580 || _582;
    float _586 = _536 + _528;
    int _588 = _584 ? 0 : 1;
    float _590 = _586 + (-1.0);
    bool _592 = _572 > 0.0;
    bool _594 = _572 >= 0.0;
    bool _596 = isnan(_572);
    bool _598 = _594 || _596;
    bool _600 = isnan(0.0);
    bool _602 = _598 || _600;
    float _604 = fma(_590, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _606 = _602 ? 0.0 : 1.4012984643248170709237295832899e-45;
    int _608 = ~_588;
    int _610 = _608 + 1;
    int _612 = _610 + 1;
    float _614 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    int _616 = ~as_type<int>(_606);
    int _618 = _616 + 1;
    int _620 = _618 + 1;
    int _622 = _612;
    int _624 = _620;
    bool _626 = _574;
    float _628 = _606;
    float _630 = _590;
    if (!_574)
    {
        int _632 = ~_588;
        int _634 = _632 + 1;
        _622 = _634;
    }
    int _636 = _622;
    if (!_592)
    {
        int _638 = ~as_type<int>(_606);
        int _640 = _638 + 1;
        _624 = _640;
    }
    int _642 = _624;
    if (_540)
    {
        _626 = false;
    }
    bool _644 = _626;
    bool _646 = _644;
    if (_540)
    {
        _628 = _536;
    }
    float _648 = _628;
    float _650 = _648;
    float _652 = _562;
    if (_540)
    {
        _630 = _562;
    }
    float _654 = _630;
    float _656 = _654;
    if (!_540)
    {
        float _658 = in.m_59.x;
        float _660 = _536 * 3.1415927410125732421875;
        float _662 = _660 * 0.15915493667125701904296875;
        float _664 = _662 * 6.283185482025146484375;
        float _666 = sin(_664);
        float _668 = _658 * 3.1415927410125732421875;
        float _670 = _668 * 0.15915493667125701904296875;
        float _672 = _670 * 6.283185482025146484375;
        float _674 = sin(_672);
        _656 = _674;
        _646 = true;
        _650 = _666;
        _652 = _658;
    }
    float _676 = _656;
    bool _678 = _646;
    float _680 = _650;
    float _682 = _652;
    float _684 = fma(_676, (*spvDescriptorSet0.vp_c9)._m0[93].z, _614);
    float _686 = _676 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _688 = _554 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _690 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _692 = _690 != 0;
    int _694 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _696 = _694 != 0;
    int _698 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _700 = _698 != 0;
    float _702 = -_564;
    float _704 = fma(_686, 2.0, _702);
    float _706 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _708 = _680 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _710 = _682 * 2.0;
    float _712 = fma(_680, (*spvDescriptorSet0.vp_c9)._m0[93].w, _706);
    float _714 = _550 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _716 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _718 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _720 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _722 = _714 + _720;
    float _724 = _706;
    float _726 = (*spvDescriptorSet0.vp_c9)._m0[93].w;
    if (_678)
    {
        _724 = _536;
    }
    float _728 = _724;
    float _730 = fma(_708, -2.0, _716);
    float _732 = _728;
    if (_678)
    {
        _726 = _682;
    }
    float _734 = _726;
    float _736 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _738 = log2(_736);
    float _740 = _734;
    if (!_678)
    {
        _732 = _682;
    }
    float _742 = _732;
    float _744 = _552 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _746 = _742;
    if (!_678)
    {
        _740 = _528;
    }
    float _748 = _740;
    float _750 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _752 = _688 + _750;
    float _754 = _722 * _722;
    float _756 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    float _758 = floor(_710);
    float _760 = fma(_742, (*spvDescriptorSet0.vp_c9)._m0[83].z, _718);
    float _762 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _764 = _744 + _762;
    float _766 = fma(_752, _752, _754);
    float _768 = fma(_748, (*spvDescriptorSet0.vp_c9)._m0[84].z, _756);
    float _770 = _748;
    if (_678)
    {
        _746 = _528;
    }
    float _772 = _746;
    float _774 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _776 = _772;
    if (_678)
    {
        _770 = _536;
    }
    float _778 = _770;
    float _780 = _536 + _682;
    float _782 = _778;
    if (!_678)
    {
        _776 = _536;
    }
    float _784 = _776;
    float _786 = fma(_764, _764, _766);
    float _788 = _780 + (-1.0);
    if (!_678)
    {
        _782 = _682;
    }
    float _790 = _782;
    float _792 = fma(_784, (*spvDescriptorSet0.vp_c9)._m0[83].w, _774);
    float _794 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _796 = sqrt(_786);
    float _798 = _790 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _800 = fma(_788, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _802 = _738 * _108;
    float _804 = -_794;
    float _806 = fma(_798, 2.0, _804);
    float _808 = _798;
    if (_678)
    {
        _808 = _528;
    }
    float _810 = _808;
    float _812 = _404 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _814 = _810;
    if (!_678)
    {
        _814 = _536;
    }
    float _816 = _814;
    float _818 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _820 = _758 > 0.0;
    float _822 = exp2(_802);
    bool _824 = _758 >= 0.0;
    bool _826 = isnan(_758);
    bool _828 = _824 || _826;
    bool _830 = isnan(0.0);
    bool _832 = _828 || _830;
    float _834 = _816 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _836 = !_692;
    int _838 = _836 ? 0 : 1;
    float _840 = _812 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _842 = fma(_834, -2.0, _818);
    int _844 = abs(_838);
    float _846 = _796 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _848 = float(_636);
    float _850 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _852 = 1.0 + _850;
    float _854 = float(_844);
    float _856 = rsqrt(_786);
    float _858 = precise::min(_840, _846);
    float _860 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[92].z, _684);
    bool _862 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _864 = isnan(1.0);
    bool _866 = _862 || _864;
    bool _868 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _870 = _866 || _868;
    float _872 = _854 * _848;
    float _874 = -_822;
    float _876 = _874 + 1.0;
    float _878 = in.m_63.x;
    float _880 = in.m_63.y;
    float _882 = in.m_63.z;
    bool _884 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _886 = isnan(0.0);
    bool _888 = _884 || _886;
    bool _890 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _892 = _888 || _890;
    float _894 = 1.0 / _852;
    bool _896 = !_700;
    int _898 = _896 ? 0 : 1;
    float _900 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[84].x, _768);
    float _902 = _892 ? _876 : 0.0;
    float _904 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[82].z, _760);
    int _906 = abs(_898);
    float _908 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[92].w, _712);
    int _910 = _832 ? 0 : 1;
    float _912 = _856 * _858;
    float _914 = float(_642);
    float _916 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[91].y, _730);
    float _918 = -_108;
    float _920 = fma(_918, (*spvDescriptorSet0.vp_c9)._m0[91].x, _704);
    float _922 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[82].w, _792);
    float _924 = -_108;
    float _926 = fma(_924, (*spvDescriptorSet0.vp_c9)._m0[81].x, _806);
    float _928 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[81].y, _842);
    float _930 = float(_906);
    if (_870)
    {
        float _932 = _902 * _894;
        _118 = _932;
    }
    float _934 = _118;
    int _936 = ~_910;
    int _938 = _936 + 1;
    int _940 = _938 + 1;
    float _942 = _722 * _912;
    int _944 = _940;
    if (!_820)
    {
        int _946 = ~_910;
        int _948 = _946 + 1;
        _944 = _948;
    }
    int _950 = _944;
    float _952 = _872 * (-2.0);
    float _954 = _752 * _912;
    float _956 = _930 * _914;
    float _958 = -_942;
    float _960 = _722 + _958;
    float _962 = fma(_800, _952, _800);
    float _964 = -_954;
    float _966 = _752 + _964;
    bool _968 = !_696;
    int _970 = _968 ? 0 : 1;
    float _972 = fma(_952, _878, _878);
    float _974 = _960 * _960;
    float _976 = _764 * _912;
    float _978 = _682 + (-0.5);
    int _980 = abs(_970);
    float _982 = fma(_966, _966, _974);
    float _984 = -_976;
    float _986 = _764 + _984;
    float _988 = fma(_978, (*spvDescriptorSet0.vp_c9)._m0[196].x, _972);
    float _990 = _528 + _682;
    float _992 = fma(_986, _986, _982);
    float _994 = _990 + (-1.0);
    float _996 = float(_980);
    float _998 = fma(_962, _934, _988);
    float _1000 = float(_950);
    float _1002 = fma(_994, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1004 = _956 * (-2.0);
    float _1006 = _998 * 0.15915493667125701904296875;
    float _1008 = sqrt(_992);
    float _1010 = _996 * _1000;
    float _1012 = _528 + (-0.5);
    float _1014 = fma(_1004, _882, _882);
    float _1016 = fma(_1002, _1004, _1002);
    float _1018 = _1010 * (-2.0);
    float _1020 = _536 + (-0.5);
    float _1022 = fma(_1012, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1014);
    float _1024 = _1006 * 6.283185482025146484375;
    float _1026 = sin(_1024);
    float _1028 = fma(_1018, _880, _880);
    float _1030 = fma(_604, _1018, _604);
    float _1032 = in.m_65.x;
    float _1034 = in.m_65.y;
    float _1036 = in.m_65.z;
    float _1038 = fma(_1016, _934, _1022);
    float _1040 = fma(_1020, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1028);
    float _1042 = _406 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1044 = _408 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1046 = _1038 * 0.15915493667125701904296875;
    float _1048 = fma(_1030, _934, _1040);
    float _1050 = _1006 * 6.283185482025146484375;
    float _1052 = cos(_1050);
    float _1054 = _856 * _1008;
    float _1056 = _1048 * 0.15915493667125701904296875;
    float _1058 = _1042 * _1054;
    float _1060 = _1044 * _1054;
    float _1062 = _812 * _1054;
    float _1064 = _1046 * 6.283185482025146484375;
    float _1066 = cos(_1064);
    bool _1068 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1070 = isnan(0.5);
    bool _1072 = _1068 || _1070;
    bool _1074 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1076 = _1072 || _1074;
    bool _1078 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1080 = isnan(0.5);
    bool _1082 = _1078 || _1080;
    bool _1084 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1086 = _1082 || _1084;
    float _1088 = _1056 * 6.283185482025146484375;
    float _1090 = sin(_1088);
    float _1092 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1034);
    float _1094 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1036);
    float _1096 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1032);
    float _1098 = _1058 * _1092;
    float _1100 = _1060 * _1094;
    float _1102 = _1056 * 6.283185482025146484375;
    float _1104 = cos(_1102);
    float _1106 = _1066 * _1098;
    float _1108 = _1046 * 6.283185482025146484375;
    float _1110 = sin(_1108);
    float _1112 = _1026 * _1090;
    float _1114 = _1052 * _1090;
    float _1116 = _1052 * _1104;
    float _1118 = _1062 * _1096;
    float _1120 = _1052 * _1106;
    float _1122 = _1026 * _1104;
    float _1124 = _1104 * _1066;
    float _1126 = _1026 * _1106;
    float _1128 = _1090 * _1066;
    float _1130 = fma(_1110, _1116, _1112);
    float _1132 = fma(_1110, _1112, _1116);
    float _1134 = fma(_1130, _1118, _1120);
    float _1136 = -_1098;
    float _1138 = _1110 * _1136;
    float _1140 = -_1122;
    float _1142 = fma(_1110, _1114, _1140);
    float _1144 = -_1114;
    float _1146 = fma(_1110, _1122, _1144);
    float _1148 = fma(_1124, _1118, _1138);
    float _1150 = fma(_1142, _1100, _1134);
    float _1152 = fma(_1146, _1118, _1126);
    float _1154 = fma(_1128, _1100, _1148);
    float _1156 = _1150 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1158 = fma(_1132, _1100, _1152);
    float _1160 = _1150 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1162 = _1150 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1164 = fma(_1154, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1156);
    float _1166 = -_976;
    float _1168 = _744 + _1166;
    float _1170 = fma(_1154, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1160);
    float _1172 = fma(_1154, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1162);
    float _1174 = fma(_1158, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1164);
    float _1176 = fma(_1158, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1170);
    float _1178 = fma(_1158, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1172);
    float _1180 = _1174 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1182 = _1176 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1184 = _1178 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1186 = _744 + _1180;
    float _1188 = _688 + _1182;
    float _1190 = -_954;
    float _1192 = _688 + _1190;
    float _1194 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1196 = _1186 + _1194;
    float _1198 = _714 + _1184;
    float _1200 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1202 = _1188 + _1200;
    float _1204 = _1196 * _1196;
    float _1206 = fma(_1202, _1202, _1204);
    float _1208 = -_942;
    float _1210 = _714 + _1208;
    float _1212 = sqrt(_1206);
    float _1214 = _1210 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1216 = fma(_1192, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1214);
    float _1218 = _1210 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1220 = fma(_1168, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1216);
    float _1222 = fma(_1192, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1218);
    float _1224 = _1220 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1226 = fma(_1168, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1222);
    bool _1228 = _1212 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1230 = 1.0 / _1224;
    float _1232 = _1226 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1234 = _1232 + _1224;
    float _1236 = _1178;
    float _1238 = _1232;
    float _1240 = _1220;
    float _1242 = _954;
    float _1244 = _976;
    if (!_1228)
    {
        _1236 = _1188;
    }
    float _1246 = _1236;
    float _1248 = _1246;
    if (!_1228)
    {
        _1238 = _1186;
    }
    float _1250 = _1238;
    float _1252 = _1250;
    if (!_1228)
    {
        _1240 = _1198;
    }
    float _1254 = _1240;
    bool _1256 = !_1228;
    float _1258 = _1254;
    if (!_1256)
    {
        float _1260 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1262 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1264 = _1212 + _1262;
        float _1266 = _1198 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1268 = rsqrt(_1206);
        float _1270 = _1264 * _1260;
        float _1272 = _1270 * 0.15915493667125701904296875;
        float _1274 = _1272 * 6.283185482025146484375;
        float _1276 = sin(_1274);
        float _1278 = _1272 * 6.283185482025146484375;
        float _1280 = cos(_1278);
        float _1282 = fma(_1276, _1266, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1284 = _1268 * _1282;
        float _1286 = _1280 + (-1.0);
        float _1288 = _1286 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1290 = fma(_1202, _1284, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1292 = fma(_1196, _1284, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1294 = fma(_1198, _1280, _1288);
        _1248 = _1290;
        _1258 = _1294;
        _1252 = _1292;
    }
    float _1296 = _1248;
    float _1298 = _1258;
    float _1300 = _1252;
    float _1302 = -_954;
    float _1304 = _1302 + _1296;
    float _1306 = -_942;
    float _1308 = _1306 + _1298;
    float _1310 = -_976;
    float _1312 = _1310 + _1300;
    float _1314 = _1234 * _1230;
    float _1316 = _1314 * 0.5;
    float _1318 = _1308;
    float _1320 = _1304;
    float _1322 = _1312;
    float _1324 = _1298;
    if (_1086)
    {
        _1242 = 1.0;
    }
    float _1326 = _1242;
    float _1328 = _1326;
    if (!_1076)
    {
        float _1330 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1332 = _1210 + _1330;
        float _1334 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1336 = _1192 + _1334;
        float _1338 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1340 = -_688;
        float _1342 = _1340 + _1296;
        float _1344 = _1332 * _1332;
        float _1346 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1348 = _1168 + _1346;
        float _1350 = -_744;
        float _1352 = _1350 + _1300;
        float _1354 = fma(_1336, _1336, _1344);
        float _1356 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1358 = fma(_1348, _1348, _1354);
        float _1360 = sqrt(_1358);
        float _1362 = _1338 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1364 = -_714;
        float _1366 = _1364 + _1298;
        float _1368 = precise::min(_1360, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1370 = _1368 * _1356;
        float _1372 = _1362 * _1370;
        float _1374 = fma(_1342, _1372, _1192);
        float _1376 = fma(_1366, _1372, _1210);
        float _1378 = fma(_1352, _1372, _1168);
        _1318 = _1376;
        _1320 = _1374;
        _1322 = _1378;
        _1244 = _1372;
    }
    float _1380 = _1318;
    float _1382 = _1320;
    float _1384 = _1322;
    float _1386 = _1244;
    float _1388 = _1386;
    if (!_1086)
    {
        float _1390 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1392 = _1390 * 0.15915493667125701904296875;
        float _1394 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1396 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1398 = fma(_1316, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1396);
        float _1400 = _1392 * 6.283185482025146484375;
        float _1402 = cos(_1400);
        float _1404 = _1394 * 0.15915493667125701904296875;
        float _1406 = _1392 * 6.283185482025146484375;
        float _1408 = sin(_1406);
        float _1410 = 1.0 / _1402;
        float _1412 = _1404 * 6.283185482025146484375;
        float _1414 = cos(_1412);
        float _1416 = _1408 * _1410;
        float _1418 = _1404 * 6.283185482025146484375;
        float _1420 = sin(_1418);
        float _1422 = _1414 * _1416;
        float _1424 = 1.0 / _1398;
        float _1426 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1428 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1426;
        float _1430 = 1.0 / _1422;
        float _1432 = 1.0 / _1428;
        float _1434 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1436 = _1424 * _1434;
        float _1438 = _1420 * _1430;
        float _1440 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1442 = fma(_1438, _1436, _1440);
        float _1444 = _1442 * _1432;
        float _1446 = precise::clamp(_1444, 0.0, 1.0);
        _1324 = _1404;
        _1388 = _1424;
        _1328 = _1446;
    }
    float _1448 = _1324;
    float _1450 = _1388;
    float _1452 = _1328;
    float _1454 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1456 = _1380 + _1454;
    float _1458 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1460 = _1382 + _1458;
    float _1462 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1464 = _1384 + _1462;
    float _1466 = _1456 * _1456;
    float _1468 = fma(_1460, _1460, _1466);
    float _1470 = fma(_1464, _1464, _1468);
    float _1472 = rsqrt(_1470);
    float _1474 = sqrt(_1470);
    float _1476 = _1472 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1478 = _1460 * _1476;
    float _1480 = _1464 * _1476;
    float _1482 = _1478 * _1478;
    float _1484 = _1480 * _1480;
    float _1486 = _1482 + _1484;
    float _1488 = sqrt(_1486);
    bool _1490 = _1488 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1492 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1494 = _1488 + _1492;
    float _1496 = _1464;
    float _1498 = _1466;
    float _1500 = _1494;
    float _1502 = _1448;
    float _1504 = _1476;
    if (_1490)
    {
        float _1506 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1496 = _1506;
    }
    float _1508 = _1496;
    if (_1490)
    {
        float _1510 = rsqrt(_1486);
        _1498 = _1510;
    }
    float _1512 = _1498;
    float _1514 = _1512;
    if (_1490)
    {
        float _1516 = _1494 * _1508;
        _1500 = _1516;
    }
    float _1518 = _1500;
    if (_1490)
    {
        float _1520 = _1518 * 0.15915493667125701904296875;
        _1502 = _1520;
    }
    float _1522 = _1502;
    float _1524 = _1472;
    if (_1490)
    {
        float _1526 = _1522 * 6.283185482025146484375;
        float _1528 = sin(_1526);
        _1524 = _1528;
    }
    float _1530 = _1524;
    float _1532 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1534 = precise::max(0.0, _1532);
    float _1536 = _1450;
    float _1538 = _1534;
    float _1540 = _1532;
    if (_1490)
    {
        float _1542 = _1522 * 6.283185482025146484375;
        float _1544 = cos(_1542);
        _1536 = _1544;
    }
    float _1546 = _1536;
    float _1548 = -_1476;
    float _1550 = -_1534;
    float _1552 = fma(_1456, _1548, _1550);
    float _1554 = _1552;
    if (_1490)
    {
        float _1556 = _1552 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1538 = _1556;
    }
    float _1558 = _1538;
    float _1560 = _1380 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1562 = _1530;
    float _1564 = _1558;
    if (_1490)
    {
        float _1566 = fma(_1530, _1558, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1562 = _1566;
    }
    float _1568 = _1562;
    float _1570 = _1568;
    if (!_1490)
    {
        _1564 = _1482;
    }
    float _1572 = _1564;
    float _1574 = _1572;
    float _1576 = _1546;
    if (_1490)
    {
        float _1578 = _1546 + (-1.0);
        _1540 = _1578;
    }
    float _1580 = _1540;
    float _1582 = _1580;
    if (_1490)
    {
        float _1584 = _1512 * _1568;
        _1504 = _1584;
    }
    float _1586 = _1504;
    if (!_1490)
    {
        _1570 = _1478;
    }
    float _1588 = _1570;
    float _1590 = _1588;
    if (_1490)
    {
        float _1592 = _1580 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1514 = _1592;
    }
    float _1594 = _1514;
    if (_1490)
    {
        float _1596 = _1478 * _1586;
        _1590 = _1596;
    }
    float _1598 = _1590;
    if (!_1490)
    {
        _1582 = _1480;
    }
    float _1600 = _1582;
    float _1602 = _1600;
    if (_1490)
    {
        float _1604 = _1480 * _1586;
        _1602 = _1604;
    }
    float _1606 = _1602;
    if (_1490)
    {
        float _1608 = fma(_1552, _1546, _1594);
        _1554 = _1608;
    }
    float _1610 = _1554;
    if (_1490)
    {
        float _1612 = _1598 * _1598;
        _1574 = _1612;
    }
    float _1614 = _1574;
    if (!_1490)
    {
        _1576 = _1484;
    }
    float _1616 = _1576;
    float _1618 = _1616;
    if (_1490)
    {
        float _1620 = _1606 * _1606;
        _1618 = _1620;
    }
    float _1622 = _1618;
    float _1624 = fma(_1610, _1610, _1614);
    float _1626 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1628 = _1624 + _1622;
    float _1630 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1560);
    float _1632 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1634 = fma(_1474, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1632);
    float _1636 = precise::clamp(_1634, 0.0, 1.0);
    float _1638 = _1380 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1640 = rsqrt(_1628);
    float _1642 = fma(_1384, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1630);
    float _1644 = _1380 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1646 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1638);
    float _1648 = -_1636;
    float _1650 = _1648 + 1.0;
    float _1652 = _1642 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1654 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1644);
    float _1656 = fma(_1384, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1646);
    float _1658 = _1380 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1660 = _1652 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1662 = abs(_1650);
    float _1664 = log2(_1662);
    float _1666 = fma(_1384, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1654);
    float _1668 = _1656 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1670 = -_1660;
    float _1672 = fma(_1670, _1626, 1.0);
    float _1674 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1658);
    float _1676 = _1666 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1678 = _1668 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1680 = _1640 * _1598;
    float _1682 = _1640 * _1610;
    float _1684 = fma(_1384, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1674);
    float _1686 = fma(_1676, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1678);
    float _1688 = _1680 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1690 = _1640 * _1606;
    float _1692 = _1684 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1694 = fma(_1652, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1686);
    float _1696 = -_1688;
    float _1698 = fma(_1682, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1696);
    float _1700 = _1664 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1702 = log2(_1672);
    float _1704 = fma(_1692, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1694);
    float _1706 = -_1690;
    float _1708 = fma(_1706, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1698);
    float _1710 = _1668 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1712 = _1668 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1714 = fma(_1708, -0.5, 0.5);
    float _1716 = fma(_1676, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1710);
    float _1718 = exp2(_1700);
    float _1720 = fma(_1708, 0.5, 0.5);
    float _1722 = fma(_1676, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1712);
    float _1724 = _1682 + 1.0;
    float _1726 = fma(_1652, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1716);
    float _1728 = fma(_1720, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1730 = fma(_1652, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1722);
    float _1732 = 1.0 / _1704;
    float _1734 = fma(_1720, _1728, -0.212114393711090087890625);
    float _1736 = _1702 * 0.693147182464599609375;
    float _1738 = fma(_1720, _1734, 1.570728778839111328125);
    float _1740 = _1736 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1742 = sqrt(_1714);
    float _1744 = -_1682;
    float _1746 = fma(_1718, _1724, _1744);
    float _1748 = fma(_1692, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1726);
    float _1750 = fma(_1692, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1730);
    float _1752 = fma(_1746, 0.5, 0.5);
    float _1754 = _1748 * _1732;
    float _1756 = _1750 * _1732;
    float _1758 = fma(_1754, 0.5, 0.5);
    float _1760 = fma(_1756, -0.5, 0.5);
    float _1762 = _1742 * 0.636619746685028076171875;
    float3 _4753 = float3(_1758, _1760, _1740);
    float _1764 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4753, float3(0.0), isnan(_4753)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4753, float3(0.0), isnan(_4753)), level(0.0)).x;
    float3 _4764 = float3(_1758, _1760, _1740);
    float4 _1767 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4764, float3(0.0), isnan(_4764)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4764, float3(0.0), isnan(_4764)), level(0.0)).xyzw;
    float _1769 = _1767.x;
    float _1771 = _1767.y;
    float _1773 = _1767.z;
    float _1775 = _1767.w;
    float _1777 = -_1738;
    float _1779 = fma(_1762, _1777, 1.0);
    float2 _4786 = float2(_1779, _1752);
    float3 _1783 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4786, float2(0.0), isnan(_4786)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4786, float2(0.0), isnan(_4786)), level(0.0)).xyz;
    float _1785 = _1783.x;
    float _1787 = _1783.y;
    float _1789 = _1783.z;
    float _1791 = _1664 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1793 = _1668 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1795 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1797 = _1795 != 0;
    out.m_67.x = _1192;
    out.m_67.y = _1210;
    out.m_67.z = _1168;
    float _1799 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1801 = _1799 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1803 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1805 = _528 > 0.5;
    float _1807 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1809 = _1807 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    int _1811 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1813 = _1811 != 0;
    float _1815 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1817 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1815;
    int _1819 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1821 = _1819 != 0;
    float _1823 = fma(_1676, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1793);
    int _1825 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1827 = _1825 != 0;
    float _1829 = _846;
    bool _1831 = _1805;
    if (_1797)
    {
        float _1833 = in.m_59.z;
        _1829 = _1833;
    }
    float _1835 = _1829;
    float _1837 = 1.0 / _1801;
    float _1839 = -_160;
    float _1841 = _1839 + 1.0;
    bool _1843 = _536 > 0.5;
    bool _1845 = _1843 && _1813;
    float _1847 = fma(_1652, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1823);
    bool _1849 = _530 > 0.5;
    float _1851 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1853 = _1851 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    int _1855 = _1805 ? as_type<int>(_1841) : as_type<int>(_160);
    out.m_69.w = _858;
    float _1857 = 1.0 / _1809;
    bool _1859 = _526 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1861 = isnan(_526);
    bool _1863 = _1859 || _1861;
    bool _1865 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1867 = _1863 || _1865;
    float _1869 = float(_1867);
    out.m_71.x = _1062;
    out.m_73.x = _1382;
    out.m_73.y = _1380;
    out.m_73.z = _1384;
    float _1871 = _1817 * _1837;
    bool _1873 = _526 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1875 = isnan(_526);
    bool _1877 = _1873 || _1875;
    bool _1879 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1881 = _1877 || _1879;
    float _1883 = float(_1881);
    float _1885 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _1887 = _526 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1889 = isnan(_526);
    bool _1891 = _1887 || _1889;
    bool _1893 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1895 = _1891 || _1893;
    float _1897 = float(_1895);
    float _1899 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1901 = _526 + _1899;
    float _1903 = -_1883;
    float _1905 = _1903 + 1.0;
    int _1907 = as_type<int>(_1905);
    if (_1797)
    {
        bool _1909 = _1835 > 0.5;
        _1831 = _1909;
    }
    bool _1911 = _1831;
    float _1913 = _1853 * _1857;
    float _1915 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1917 = _526 + _1915;
    float _1919 = -_1897;
    float _1921 = _1919 + 1.0;
    float _1923 = _1897 * _1905;
    float _1925 = fma(_1871, _1901, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1927 = fma(_1913, _1917, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1929 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _1931 = _1869 * _1921;
    if (_1797)
    {
        float _1933 = -_154;
        float _1935 = _1933 + 1.0;
        _1907 = as_type<int>(_1935);
    }
    int _1937 = _1907;
    float _1939 = _1821 ? as_type<float>(_1855) : _160;
    float _1941 = -_1869;
    float _1943 = _1941 + 1.0;
    float _1945 = _1925 * _1931;
    if (_1827)
    {
        float _1947 = _1849 ? _1841 : _160;
        _206 = _1947;
    }
    float _1949 = _206;
    float _1951 = _900 * (-0.15915493667125701904296875);
    float _1953 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _1955 = _1885 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1957 = _1885;
    if (!_1797)
    {
        _558 = _154;
    }
    float _1959 = _558;
    float _1961 = _1803 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1963 = _1959;
    if (_1797)
    {
        float _1965 = _1911 ? as_type<float>(_1937) : _154;
        _1963 = _1965;
    }
    float _1967 = _1963;
    float _1969 = fma(_1955, _1949, -0.5);
    if (!_1813)
    {
        _1957 = _154;
    }
    float _1971 = _1957;
    float _1973 = _1971;
    if (_1845)
    {
        float _1975 = -_154;
        float _1977 = _1975 + 1.0;
        _208 = _1977;
    }
    float _1979 = _208;
    float _1981 = _1951 * 6.283185482025146484375;
    float _1983 = sin(_1981);
    float _1985 = fma(_1943, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1945);
    float _1987 = _1929 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _1989 = fma(_1961, _1967, -0.5);
    if (_1813)
    {
        _1973 = _1979;
    }
    float _1991 = _1973;
    float _1993 = fma(_1927, _1923, _1985);
    float _1995 = fma(_1939, _1987, -0.5);
    float _1997 = _1951 * 6.283185482025146484375;
    float _1999 = cos(_1997);
    float _2001 = _1953 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _2003 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2005 = fma(_2001, _1991, -0.5);
    float _2007 = fma(_1883, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1993);
    float _2009 = _2003 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2011 = exp2(_1791);
    float _2013 = _1983 * _1969;
    float _2015 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2017 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2019 = fma(_860, _2005, _920);
    float _2021 = -_916;
    float _2023 = fma(_908, _1995, _2021);
    float _2025 = _2015 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2027 = _2017 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2029 = _1999 * _1969;
    float _2031 = -_2013;
    float _2033 = fma(_1999, _1989, _2031);
    float _2035 = _2007 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _2037 = _1452 > 0.0;
    bool _2039 = isnan(_1452);
    bool _2041 = _2037 || _2039;
    bool _2043 = isnan(0.0);
    bool _2045 = _2041 || _2043;
    float _2047 = fma(_1983, _1989, _2029);
    float _2049 = fma(_904, _2033, _926);
    float _2051 = _1704 * 0.5;
    out.m_75.x = _2009;
    out.m_75.y = _2025;
    out.m_75.z = _2027;
    out.m_75.w = _2035;
    float _2053 = -_2011;
    float _2055 = _2053 + 1.0;
    float _2057 = -_928;
    float _2059 = fma(_922, _2047, _2057);
    float _2061 = _2019 + 0.5;
    float _2063 = _2049 + 0.5;
    float _2065 = _2055 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2067 = _2023 + 0.5;
    float _2069 = _1452 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2071 = fma(_1692, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1847);
    float _2073 = _2059 + 0.5;
    float _2075 = _2069 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_77.x = _2061;
    out.m_77.y = _2067;
    float _2077 = _2071 + _1704;
    float _2079 = _1748 + _1704;
    out.m_79.z = _2063;
    out.m_79.w = _2073;
    float _2081 = _2077 * 0.5;
    float _2083 = _2079 * 0.5;
    float _2085 = fma(_1750, -0.5, _2051);
    out.gl_Position.x = _1748;
    out.gl_Position.y = _1750;
    out.gl_Position.z = _2071;
    out.gl_Position.w = _1704;
    out.m_81.x = _2083;
    out.m_81.y = _2085;
    out.m_81.z = _2081;
    out.m_81.w = _1704;
    out.m_51.x = _2075;
    float _2087 = _2065 * _1764;
    float _2089 = -_2065;
    float _2091 = _2089 + 1.0;
    float _2093 = _1775 * _2087;
    float _2095 = _1775 * _2091;
    float _2097 = _1789 * _2087;
    float _2099 = fma(_1785, _2093, _1769);
    float _2101 = fma(_1787, _2093, _1771);
    float _2103 = fma(_1775, _2097, _1773);
    out.m_83.x = _2099;
    out.m_83.y = _2101;
    out.m_83.z = _2103;
    out.m_83.w = _2095;
    if (_2045)
    {
        return out;
    }
    out.m_51.x = 0.0;
    float _2105 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2105;
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
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _430 = false;
    bool _310 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _97 = in.m_44.w;
    float _99 = in.m_46.w;
    float _101 = trunc(_97);
    int _104 = int(_101);
    float _106 = -_99;
    float _108 = _106 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_49.y = _108;
    bool _112 = _104 >= 1;
    float _114 = 0.0;
    float _116 = as_type<float>(_104);
    float _118 = _108;
    if (!_112)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _120 = _114;
    if (!_112)
    {
        out.m_51.x = 0.0;
    }
    int _122 = 0;
    if (!_112)
    {
        float _124 = _120 * 5.0;
        _122 = as_type<int>(_124);
    }
    int _126 = _122;
    int _128 = _126;
    if (!_112)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2174 = as_type<float>(_126);
        out.gl_Position.z = _2174;
    }
    if (!_112)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _130 = _99 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _132 = isnan(_99);
    bool _134 = _130 || _132;
    bool _136 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _138 = _134 || _136;
    float _140 = float(_104);
    bool _142 = _108 >= _140;
    bool _144 = !_138;
    bool _146 = _142 || _144;
    if (_146)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _148 = _116;
    if (_146)
    {
        out.m_51.x = 0.0;
    }
    if (_146)
    {
        float _150 = _148 * 5.0;
        _128 = as_type<int>(_150);
    }
    int _152 = _128;
    if (_146)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2229 = as_type<float>(_152);
        out.gl_Position.z = _2229;
    }
    if (_146)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _154 = in.m_53.z;
    float _156 = 1.0 / _140;
    float _158 = _108 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _160 = in.m_53.w;
    bool _162 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _164 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _166 = _162 || _164;
    bool _168 = isnan(1.0);
    bool _170 = _166 || _168;
    float _172 = in.m_55.w;
    float _174 = in.m_46.x;
    float _176 = in.m_46.y;
    float _178 = in.m_46.z;
    float _180 = in.m_44.x;
    float _182 = in.m_44.y;
    float _184 = in.m_44.z;
    float _186 = 0.0;
    float _188 = _158;
    if (!_170)
    {
        float _190 = _158 * _158;
        float _192 = _190 * 0.5;
        _186 = _192;
    }
    float _194 = _186;
    float _196 = _194;
    if (!_170)
    {
        float _198 = _194 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _196 = _198;
    }
    float _200 = _196;
    out.m_57.z = _154;
    out.m_57.w = _160;
    bool _202 = !_170;
    float _204 = _200;
    float _206 = _160;
    float _208 = _154;
    if (!_202)
    {
        float _210 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _212 = log2(_210);
        float _214 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _216 = _214 + 1.0;
        float _218 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _220 = _158 * _212;
        float _222 = 1.0 / _216;
        float _224 = _218 * 0.693147182464599609375;
        float _226 = exp2(_220);
        float _228 = 1.0 / _224;
        float _230 = _226 + (-1.0);
        float _232 = -_230;
        float _234 = fma(_232, _228, _158);
        float _236 = _234 * _222;
        float _238 = _236 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _204 = _238;
    }
    float _240 = _204;
    bool _242 = !_170;
    if (!_242)
    {
        float _244 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _246 = log2(_244);
        float _248 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _250 = _248 + 1.0;
        float _252 = 1.0 / _250;
        float _254 = _158 * _246;
        float _256 = exp2(_254);
        float _258 = -_256;
        float _260 = _258 + 1.0;
        float _262 = _260 * _252;
        _188 = _262;
    }
    float _264 = _188;
    bool _266 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _268 = _240 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _270 = _240 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _272 = _240 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _274 = fma(_264, _176, _268);
    float _276 = fma(_264, _174, _270);
    float _278 = fma(_264, _178, _272);
    float _280 = fma(_274, _172, _182);
    float _282 = fma(_276, _172, _180);
    float _284 = fma(_278, _172, _184);
    float _286 = _108 * _156;
    bool _288 = !_266;
    float _290 = _286;
    float _308;
    if (!_288)
    {
        float _292 = in.m_59.x;
        float _294 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _296 = _292 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _298 = fma(_296, (*spvDescriptorSet0.vp_c9)._m0[12].x, _108);
        float _300 = _298 * _294;
        float _302 = floor(_300);
        float _304 = -_302;
        float _306 = _300 + _304;
        _308 = _306;
        _310 = true;
    }
    else
    {
        _308 = _286;
    }
    _310 = false;
    float _312 = _308;
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _316 = _312 + _314;
    bool _318 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _320 = isnan(_312);
    bool _322 = _318 || _320;
    bool _324 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _326 = _322 || _324;
    float _328 = float(_326);
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _332 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _330;
    float _334 = 1.0 / _332;
    bool _336 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _338 = isnan(_312);
    bool _340 = _336 || _338;
    bool _342 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _344 = _340 || _342;
    float _346 = float(_344);
    float _348 = -_328;
    float _350 = _348 + 1.0;
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _354 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _352;
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _358 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _356;
    bool _360 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _364 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _362;
    float _366 = _346 * _350;
    float _368 = -_346;
    float _370 = _368 + 1.0;
    float _372 = _316 * _334;
    float _374 = in.m_55.x;
    float _376 = in.m_55.y;
    float _378 = in.m_55.z;
    float _380 = fma(_354, _372, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _382 = fma(_364, _372, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _384 = fma(_358, _372, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _386 = _380 * _366;
    float _388 = _382 * _366;
    float _390 = _384 * _366;
    float _392 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[143].x, _386);
    float _394 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[143].y, _388);
    float _396 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[143].z, _390);
    float _398 = fma(_328, (*spvDescriptorSet0.vp_c9)._m0[144].x, _392);
    float _400 = fma(_328, (*spvDescriptorSet0.vp_c9)._m0[144].y, _394);
    float _402 = fma(_328, (*spvDescriptorSet0.vp_c9)._m0[144].z, _396);
    float _404 = _398 * _374;
    float _406 = _400 * _376;
    float _408 = _402 * _378;
    bool _410 = !_360;
    float _428;
    if (!_410)
    {
        float _412 = in.m_59.x;
        float _414 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _416 = _412 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _418 = fma(_416, (*spvDescriptorSet0.vp_c9)._m0[11].y, _108);
        float _420 = _418 * _414;
        float _422 = floor(_420);
        float _424 = -_422;
        float _426 = _420 + _424;
        _428 = _426;
        _430 = true;
    }
    else
    {
        _428 = _286;
    }
    _430 = false;
    float _432 = _428;
    bool _434 = _432 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _436 = isnan(_432);
    bool _438 = _434 || _436;
    bool _440 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _442 = _438 || _440;
    float _444 = float(_442);
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _448 = _446 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _450 = _432 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _452 = isnan(_432);
    bool _454 = _450 || _452;
    bool _456 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _458 = _454 || _456;
    float _460 = float(_458);
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _464 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _462;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _468 = _432 + _466;
    float _470 = -_444;
    float _472 = _470 + 1.0;
    bool _474 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _476 = 1.0 / _448;
    float _478 = _460 * _472;
    float _480 = -_460;
    float _482 = _480 + 1.0;
    float _484 = _464 * _476;
    float _486 = fma(_484, _468, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _488 = _486 * _478;
    float _490 = fma(_482, (*spvDescriptorSet0.vp_c9)._m0[115].x, _488);
    float _492 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _494 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _496 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _498 = fma(_444, (*spvDescriptorSet0.vp_c9)._m0[116].x, _490);
    float _500 = _492 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _502 = _494 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _504 = _496 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _506 = _498 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_61.x = _500;
    out.m_61.y = _502;
    out.m_61.z = _504;
    out.m_61.w = _506;
    bool _508 = !_474;
    if (!_508)
    {
        float _510 = in.m_59.x;
        float _512 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _514 = _510 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _516 = fma(_514, (*spvDescriptorSet0.vp_c9)._m0[11].w, _108);
        float _518 = _516 * _512;
        float _520 = floor(_518);
        float _522 = -_520;
        float _524 = _518 + _522;
        _290 = _524;
    }
    float _526 = _290;
    float _528 = in.m_59.z;
    float _530 = in.m_59.w;
    float _532 = _280 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _534 = _280 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _536 = in.m_59.y;
    int _538 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _540 = _538 != 0;
    float _542 = _280 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _544 = fma(_282, (*spvDescriptorSet0.vp_c10)._m0[5].x, _532);
    float _546 = fma(_282, (*spvDescriptorSet0.vp_c10)._m0[6].x, _534);
    float _548 = fma(_282, (*spvDescriptorSet0.vp_c10)._m0[4].x, _542);
    float _550 = fma(_284, (*spvDescriptorSet0.vp_c10)._m0[5].z, _544);
    float _552 = fma(_284, (*spvDescriptorSet0.vp_c10)._m0[6].z, _546);
    float _554 = fma(_284, (*spvDescriptorSet0.vp_c10)._m0[4].z, _548);
    float _556 = _504;
    float _558 = _526;
    if (_540)
    {
        float _560 = in.m_59.x;
        _556 = _560;
    }
    float _562 = _556;
    float _564 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _566 = _528 * 2.0;
    float _568 = _536 * 2.0;
    float _570 = floor(_566);
    float _572 = floor(_568);
    bool _574 = _570 > 0.0;
    bool _576 = _570 >= 0.0;
    bool _578 = isnan(_570);
    bool _580 = _576 || _578;
    bool _582 = isnan(0.0);
    bool _584 = _580 || _582;
    float _586 = _536 + _528;
    int _588 = _584 ? 0 : 1;
    float _590 = _586 + (-1.0);
    bool _592 = _572 > 0.0;
    bool _594 = _572 >= 0.0;
    bool _596 = isnan(_572);
    bool _598 = _594 || _596;
    bool _600 = isnan(0.0);
    bool _602 = _598 || _600;
    float _604 = fma(_590, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _606 = _602 ? 0.0 : 1.4012984643248170709237295832899e-45;
    int _608 = ~_588;
    int _610 = _608 + 1;
    int _612 = _610 + 1;
    float _614 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    int _616 = ~as_type<int>(_606);
    int _618 = _616 + 1;
    int _620 = _618 + 1;
    int _622 = _612;
    int _624 = _620;
    bool _626 = _574;
    float _628 = _606;
    float _630 = _590;
    if (!_574)
    {
        int _632 = ~_588;
        int _634 = _632 + 1;
        _622 = _634;
    }
    int _636 = _622;
    if (!_592)
    {
        int _638 = ~as_type<int>(_606);
        int _640 = _638 + 1;
        _624 = _640;
    }
    int _642 = _624;
    if (_540)
    {
        _626 = false;
    }
    bool _644 = _626;
    bool _646 = _644;
    if (_540)
    {
        _628 = _536;
    }
    float _648 = _628;
    float _650 = _648;
    float _652 = _562;
    if (_540)
    {
        _630 = _562;
    }
    float _654 = _630;
    float _656 = _654;
    if (!_540)
    {
        float _658 = in.m_59.x;
        float _660 = _536 * 3.1415927410125732421875;
        float _662 = _660 * 0.15915493667125701904296875;
        float _664 = _662 * 6.283185482025146484375;
        float _666 = sin(_664);
        float _668 = _658 * 3.1415927410125732421875;
        float _670 = _668 * 0.15915493667125701904296875;
        float _672 = _670 * 6.283185482025146484375;
        float _674 = sin(_672);
        _656 = _674;
        _646 = true;
        _650 = _666;
        _652 = _658;
    }
    float _676 = _656;
    bool _678 = _646;
    float _680 = _650;
    float _682 = _652;
    float _684 = fma(_676, (*spvDescriptorSet0.vp_c9)._m0[93].z, _614);
    float _686 = _676 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _688 = _554 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _690 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _692 = _690 != 0;
    int _694 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _696 = _694 != 0;
    int _698 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _700 = _698 != 0;
    float _702 = -_564;
    float _704 = fma(_686, 2.0, _702);
    float _706 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _708 = _680 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _710 = _682 * 2.0;
    float _712 = fma(_680, (*spvDescriptorSet0.vp_c9)._m0[93].w, _706);
    float _714 = _550 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _716 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _718 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _720 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _722 = _714 + _720;
    float _724 = _706;
    float _726 = (*spvDescriptorSet0.vp_c9)._m0[93].w;
    if (_678)
    {
        _724 = _536;
    }
    float _728 = _724;
    float _730 = fma(_708, -2.0, _716);
    float _732 = _728;
    if (_678)
    {
        _726 = _682;
    }
    float _734 = _726;
    float _736 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _738 = log2(_736);
    float _740 = _734;
    if (!_678)
    {
        _732 = _682;
    }
    float _742 = _732;
    float _744 = _552 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _746 = _742;
    if (!_678)
    {
        _740 = _528;
    }
    float _748 = _740;
    float _750 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _752 = _688 + _750;
    float _754 = _722 * _722;
    float _756 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    float _758 = floor(_710);
    float _760 = fma(_742, (*spvDescriptorSet0.vp_c9)._m0[83].z, _718);
    float _762 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _764 = _744 + _762;
    float _766 = fma(_752, _752, _754);
    float _768 = fma(_748, (*spvDescriptorSet0.vp_c9)._m0[84].z, _756);
    float _770 = _748;
    if (_678)
    {
        _746 = _528;
    }
    float _772 = _746;
    float _774 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _776 = _772;
    if (_678)
    {
        _770 = _536;
    }
    float _778 = _770;
    float _780 = _536 + _682;
    float _782 = _778;
    if (!_678)
    {
        _776 = _536;
    }
    float _784 = _776;
    float _786 = fma(_764, _764, _766);
    float _788 = _780 + (-1.0);
    if (!_678)
    {
        _782 = _682;
    }
    float _790 = _782;
    float _792 = fma(_784, (*spvDescriptorSet0.vp_c9)._m0[83].w, _774);
    float _794 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _796 = sqrt(_786);
    float _798 = _790 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _800 = fma(_788, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _802 = _738 * _108;
    float _804 = -_794;
    float _806 = fma(_798, 2.0, _804);
    float _808 = _798;
    if (_678)
    {
        _808 = _528;
    }
    float _810 = _808;
    float _812 = _404 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _814 = _810;
    if (!_678)
    {
        _814 = _536;
    }
    float _816 = _814;
    float _818 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _820 = _758 > 0.0;
    float _822 = exp2(_802);
    bool _824 = _758 >= 0.0;
    bool _826 = isnan(_758);
    bool _828 = _824 || _826;
    bool _830 = isnan(0.0);
    bool _832 = _828 || _830;
    float _834 = _816 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _836 = !_692;
    int _838 = _836 ? 0 : 1;
    float _840 = _812 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _842 = fma(_834, -2.0, _818);
    int _844 = abs(_838);
    float _846 = _796 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _848 = float(_636);
    float _850 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _852 = 1.0 + _850;
    float _854 = float(_844);
    float _856 = rsqrt(_786);
    float _858 = precise::min(_840, _846);
    float _860 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[92].z, _684);
    bool _862 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _864 = isnan(1.0);
    bool _866 = _862 || _864;
    bool _868 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _870 = _866 || _868;
    float _872 = _854 * _848;
    float _874 = -_822;
    float _876 = _874 + 1.0;
    float _878 = in.m_63.x;
    float _880 = in.m_63.y;
    float _882 = in.m_63.z;
    bool _884 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _886 = isnan(0.0);
    bool _888 = _884 || _886;
    bool _890 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _892 = _888 || _890;
    float _894 = 1.0 / _852;
    bool _896 = !_700;
    int _898 = _896 ? 0 : 1;
    float _900 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[84].x, _768);
    float _902 = _892 ? _876 : 0.0;
    float _904 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[82].z, _760);
    int _906 = abs(_898);
    float _908 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[92].w, _712);
    int _910 = _832 ? 0 : 1;
    float _912 = _856 * _858;
    float _914 = float(_642);
    float _916 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[91].y, _730);
    float _918 = -_108;
    float _920 = fma(_918, (*spvDescriptorSet0.vp_c9)._m0[91].x, _704);
    float _922 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[82].w, _792);
    float _924 = -_108;
    float _926 = fma(_924, (*spvDescriptorSet0.vp_c9)._m0[81].x, _806);
    float _928 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[81].y, _842);
    float _930 = float(_906);
    if (_870)
    {
        float _932 = _902 * _894;
        _118 = _932;
    }
    float _934 = _118;
    int _936 = ~_910;
    int _938 = _936 + 1;
    int _940 = _938 + 1;
    float _942 = _722 * _912;
    int _944 = _940;
    if (!_820)
    {
        int _946 = ~_910;
        int _948 = _946 + 1;
        _944 = _948;
    }
    int _950 = _944;
    float _952 = _872 * (-2.0);
    float _954 = _752 * _912;
    float _956 = _930 * _914;
    float _958 = -_942;
    float _960 = _722 + _958;
    float _962 = fma(_800, _952, _800);
    float _964 = -_954;
    float _966 = _752 + _964;
    bool _968 = !_696;
    int _970 = _968 ? 0 : 1;
    float _972 = fma(_952, _878, _878);
    float _974 = _960 * _960;
    float _976 = _764 * _912;
    float _978 = _682 + (-0.5);
    int _980 = abs(_970);
    float _982 = fma(_966, _966, _974);
    float _984 = -_976;
    float _986 = _764 + _984;
    float _988 = fma(_978, (*spvDescriptorSet0.vp_c9)._m0[196].x, _972);
    float _990 = _528 + _682;
    float _992 = fma(_986, _986, _982);
    float _994 = _990 + (-1.0);
    float _996 = float(_980);
    float _998 = fma(_962, _934, _988);
    float _1000 = float(_950);
    float _1002 = fma(_994, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1004 = _956 * (-2.0);
    float _1006 = _998 * 0.15915493667125701904296875;
    float _1008 = sqrt(_992);
    float _1010 = _996 * _1000;
    float _1012 = _528 + (-0.5);
    float _1014 = fma(_1004, _882, _882);
    float _1016 = fma(_1002, _1004, _1002);
    float _1018 = _1010 * (-2.0);
    float _1020 = _536 + (-0.5);
    float _1022 = fma(_1012, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1014);
    float _1024 = _1006 * 6.283185482025146484375;
    float _1026 = sin(_1024);
    float _1028 = fma(_1018, _880, _880);
    float _1030 = fma(_604, _1018, _604);
    float _1032 = in.m_65.x;
    float _1034 = in.m_65.y;
    float _1036 = in.m_65.z;
    float _1038 = fma(_1016, _934, _1022);
    float _1040 = fma(_1020, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1028);
    float _1042 = _406 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1044 = _408 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1046 = _1038 * 0.15915493667125701904296875;
    float _1048 = fma(_1030, _934, _1040);
    float _1050 = _1006 * 6.283185482025146484375;
    float _1052 = cos(_1050);
    float _1054 = _856 * _1008;
    float _1056 = _1048 * 0.15915493667125701904296875;
    float _1058 = _1042 * _1054;
    float _1060 = _1044 * _1054;
    float _1062 = _812 * _1054;
    float _1064 = _1046 * 6.283185482025146484375;
    float _1066 = cos(_1064);
    bool _1068 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1070 = isnan(0.5);
    bool _1072 = _1068 || _1070;
    bool _1074 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1076 = _1072 || _1074;
    bool _1078 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1080 = isnan(0.5);
    bool _1082 = _1078 || _1080;
    bool _1084 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1086 = _1082 || _1084;
    float _1088 = _1056 * 6.283185482025146484375;
    float _1090 = sin(_1088);
    float _1092 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1034);
    float _1094 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1036);
    float _1096 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1032);
    float _1098 = _1058 * _1092;
    float _1100 = _1060 * _1094;
    float _1102 = _1056 * 6.283185482025146484375;
    float _1104 = cos(_1102);
    float _1106 = _1066 * _1098;
    float _1108 = _1046 * 6.283185482025146484375;
    float _1110 = sin(_1108);
    float _1112 = _1026 * _1090;
    float _1114 = _1052 * _1090;
    float _1116 = _1052 * _1104;
    float _1118 = _1062 * _1096;
    float _1120 = _1052 * _1106;
    float _1122 = _1026 * _1104;
    float _1124 = _1104 * _1066;
    float _1126 = _1026 * _1106;
    float _1128 = _1090 * _1066;
    float _1130 = fma(_1110, _1116, _1112);
    float _1132 = fma(_1110, _1112, _1116);
    float _1134 = fma(_1130, _1118, _1120);
    float _1136 = -_1098;
    float _1138 = _1110 * _1136;
    float _1140 = -_1122;
    float _1142 = fma(_1110, _1114, _1140);
    float _1144 = -_1114;
    float _1146 = fma(_1110, _1122, _1144);
    float _1148 = fma(_1124, _1118, _1138);
    float _1150 = fma(_1142, _1100, _1134);
    float _1152 = fma(_1146, _1118, _1126);
    float _1154 = fma(_1128, _1100, _1148);
    float _1156 = _1150 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1158 = fma(_1132, _1100, _1152);
    float _1160 = _1150 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1162 = _1150 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1164 = fma(_1154, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1156);
    float _1166 = -_976;
    float _1168 = _744 + _1166;
    float _1170 = fma(_1154, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1160);
    float _1172 = fma(_1154, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1162);
    float _1174 = fma(_1158, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1164);
    float _1176 = fma(_1158, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1170);
    float _1178 = fma(_1158, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1172);
    float _1180 = _1174 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1182 = _1176 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1184 = _1178 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1186 = _744 + _1180;
    float _1188 = _688 + _1182;
    float _1190 = -_954;
    float _1192 = _688 + _1190;
    float _1194 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1196 = _1186 + _1194;
    float _1198 = _714 + _1184;
    float _1200 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1202 = _1188 + _1200;
    float _1204 = _1196 * _1196;
    float _1206 = fma(_1202, _1202, _1204);
    float _1208 = -_942;
    float _1210 = _714 + _1208;
    float _1212 = sqrt(_1206);
    float _1214 = _1210 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1216 = fma(_1192, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1214);
    float _1218 = _1210 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1220 = fma(_1168, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1216);
    float _1222 = fma(_1192, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1218);
    float _1224 = _1220 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1226 = fma(_1168, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1222);
    bool _1228 = _1212 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1230 = 1.0 / _1224;
    float _1232 = _1226 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1234 = _1232 + _1224;
    float _1236 = _1178;
    float _1238 = _1232;
    float _1240 = _1220;
    float _1242 = _954;
    float _1244 = _976;
    if (!_1228)
    {
        _1236 = _1188;
    }
    float _1246 = _1236;
    float _1248 = _1246;
    if (!_1228)
    {
        _1238 = _1186;
    }
    float _1250 = _1238;
    float _1252 = _1250;
    if (!_1228)
    {
        _1240 = _1198;
    }
    float _1254 = _1240;
    bool _1256 = !_1228;
    float _1258 = _1254;
    if (!_1256)
    {
        float _1260 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1262 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1264 = _1212 + _1262;
        float _1266 = _1198 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1268 = rsqrt(_1206);
        float _1270 = _1264 * _1260;
        float _1272 = _1270 * 0.15915493667125701904296875;
        float _1274 = _1272 * 6.283185482025146484375;
        float _1276 = sin(_1274);
        float _1278 = _1272 * 6.283185482025146484375;
        float _1280 = cos(_1278);
        float _1282 = fma(_1276, _1266, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1284 = _1268 * _1282;
        float _1286 = _1280 + (-1.0);
        float _1288 = _1286 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1290 = fma(_1202, _1284, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1292 = fma(_1196, _1284, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1294 = fma(_1198, _1280, _1288);
        _1248 = _1290;
        _1258 = _1294;
        _1252 = _1292;
    }
    float _1296 = _1248;
    float _1298 = _1258;
    float _1300 = _1252;
    float _1302 = -_954;
    float _1304 = _1302 + _1296;
    float _1306 = -_942;
    float _1308 = _1306 + _1298;
    float _1310 = -_976;
    float _1312 = _1310 + _1300;
    float _1314 = _1234 * _1230;
    float _1316 = _1314 * 0.5;
    float _1318 = _1308;
    float _1320 = _1304;
    float _1322 = _1312;
    float _1324 = _1298;
    if (_1086)
    {
        _1242 = 1.0;
    }
    float _1326 = _1242;
    float _1328 = _1326;
    if (!_1076)
    {
        float _1330 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1332 = _1210 + _1330;
        float _1334 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1336 = _1192 + _1334;
        float _1338 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1340 = -_688;
        float _1342 = _1340 + _1296;
        float _1344 = _1332 * _1332;
        float _1346 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1348 = _1168 + _1346;
        float _1350 = -_744;
        float _1352 = _1350 + _1300;
        float _1354 = fma(_1336, _1336, _1344);
        float _1356 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1358 = fma(_1348, _1348, _1354);
        float _1360 = sqrt(_1358);
        float _1362 = _1338 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1364 = -_714;
        float _1366 = _1364 + _1298;
        float _1368 = precise::min(_1360, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1370 = _1368 * _1356;
        float _1372 = _1362 * _1370;
        float _1374 = fma(_1342, _1372, _1192);
        float _1376 = fma(_1366, _1372, _1210);
        float _1378 = fma(_1352, _1372, _1168);
        _1318 = _1376;
        _1320 = _1374;
        _1322 = _1378;
        _1244 = _1372;
    }
    float _1380 = _1318;
    float _1382 = _1320;
    float _1384 = _1322;
    float _1386 = _1244;
    float _1388 = _1386;
    if (!_1086)
    {
        float _1390 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1392 = _1390 * 0.15915493667125701904296875;
        float _1394 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1396 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1398 = fma(_1316, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1396);
        float _1400 = _1392 * 6.283185482025146484375;
        float _1402 = cos(_1400);
        float _1404 = _1394 * 0.15915493667125701904296875;
        float _1406 = _1392 * 6.283185482025146484375;
        float _1408 = sin(_1406);
        float _1410 = 1.0 / _1402;
        float _1412 = _1404 * 6.283185482025146484375;
        float _1414 = cos(_1412);
        float _1416 = _1408 * _1410;
        float _1418 = _1404 * 6.283185482025146484375;
        float _1420 = sin(_1418);
        float _1422 = _1414 * _1416;
        float _1424 = 1.0 / _1398;
        float _1426 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1428 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1426;
        float _1430 = 1.0 / _1422;
        float _1432 = 1.0 / _1428;
        float _1434 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1436 = _1424 * _1434;
        float _1438 = _1420 * _1430;
        float _1440 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1442 = fma(_1438, _1436, _1440);
        float _1444 = _1442 * _1432;
        float _1446 = precise::clamp(_1444, 0.0, 1.0);
        _1324 = _1404;
        _1388 = _1424;
        _1328 = _1446;
    }
    float _1448 = _1324;
    float _1450 = _1388;
    float _1452 = _1328;
    float _1454 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1456 = _1380 + _1454;
    float _1458 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1460 = _1382 + _1458;
    float _1462 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1464 = _1384 + _1462;
    float _1466 = _1456 * _1456;
    float _1468 = fma(_1460, _1460, _1466);
    float _1470 = fma(_1464, _1464, _1468);
    float _1472 = rsqrt(_1470);
    float _1474 = sqrt(_1470);
    float _1476 = _1472 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1478 = _1460 * _1476;
    float _1480 = _1464 * _1476;
    float _1482 = _1478 * _1478;
    float _1484 = _1480 * _1480;
    float _1486 = _1482 + _1484;
    float _1488 = sqrt(_1486);
    bool _1490 = _1488 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1492 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1494 = _1488 + _1492;
    float _1496 = _1464;
    float _1498 = _1466;
    float _1500 = _1494;
    float _1502 = _1448;
    float _1504 = _1476;
    if (_1490)
    {
        float _1506 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1496 = _1506;
    }
    float _1508 = _1496;
    if (_1490)
    {
        float _1510 = rsqrt(_1486);
        _1498 = _1510;
    }
    float _1512 = _1498;
    float _1514 = _1512;
    if (_1490)
    {
        float _1516 = _1494 * _1508;
        _1500 = _1516;
    }
    float _1518 = _1500;
    if (_1490)
    {
        float _1520 = _1518 * 0.15915493667125701904296875;
        _1502 = _1520;
    }
    float _1522 = _1502;
    float _1524 = _1472;
    if (_1490)
    {
        float _1526 = _1522 * 6.283185482025146484375;
        float _1528 = sin(_1526);
        _1524 = _1528;
    }
    float _1530 = _1524;
    float _1532 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1534 = precise::max(0.0, _1532);
    float _1536 = _1450;
    float _1538 = _1534;
    float _1540 = _1532;
    if (_1490)
    {
        float _1542 = _1522 * 6.283185482025146484375;
        float _1544 = cos(_1542);
        _1536 = _1544;
    }
    float _1546 = _1536;
    float _1548 = -_1476;
    float _1550 = -_1534;
    float _1552 = fma(_1456, _1548, _1550);
    float _1554 = _1552;
    if (_1490)
    {
        float _1556 = _1552 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1538 = _1556;
    }
    float _1558 = _1538;
    float _1560 = _1380 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1562 = _1530;
    float _1564 = _1558;
    if (_1490)
    {
        float _1566 = fma(_1530, _1558, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1562 = _1566;
    }
    float _1568 = _1562;
    float _1570 = _1568;
    if (!_1490)
    {
        _1564 = _1482;
    }
    float _1572 = _1564;
    float _1574 = _1572;
    float _1576 = _1546;
    if (_1490)
    {
        float _1578 = _1546 + (-1.0);
        _1540 = _1578;
    }
    float _1580 = _1540;
    float _1582 = _1580;
    if (_1490)
    {
        float _1584 = _1512 * _1568;
        _1504 = _1584;
    }
    float _1586 = _1504;
    if (!_1490)
    {
        _1570 = _1478;
    }
    float _1588 = _1570;
    float _1590 = _1588;
    if (_1490)
    {
        float _1592 = _1580 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1514 = _1592;
    }
    float _1594 = _1514;
    if (_1490)
    {
        float _1596 = _1478 * _1586;
        _1590 = _1596;
    }
    float _1598 = _1590;
    if (!_1490)
    {
        _1582 = _1480;
    }
    float _1600 = _1582;
    float _1602 = _1600;
    if (_1490)
    {
        float _1604 = _1480 * _1586;
        _1602 = _1604;
    }
    float _1606 = _1602;
    if (_1490)
    {
        float _1608 = fma(_1552, _1546, _1594);
        _1554 = _1608;
    }
    float _1610 = _1554;
    if (_1490)
    {
        float _1612 = _1598 * _1598;
        _1574 = _1612;
    }
    float _1614 = _1574;
    if (!_1490)
    {
        _1576 = _1484;
    }
    float _1616 = _1576;
    float _1618 = _1616;
    if (_1490)
    {
        float _1620 = _1606 * _1606;
        _1618 = _1620;
    }
    float _1622 = _1618;
    float _1624 = fma(_1610, _1610, _1614);
    float _1626 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1628 = _1624 + _1622;
    float _1630 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1560);
    float _1632 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1634 = fma(_1474, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1632);
    float _1636 = precise::clamp(_1634, 0.0, 1.0);
    float _1638 = _1380 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1640 = rsqrt(_1628);
    float _1642 = fma(_1384, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1630);
    float _1644 = _1380 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1646 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1638);
    float _1648 = -_1636;
    float _1650 = _1648 + 1.0;
    float _1652 = _1642 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1654 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1644);
    float _1656 = fma(_1384, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1646);
    float _1658 = _1380 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1660 = _1652 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1662 = abs(_1650);
    float _1664 = log2(_1662);
    float _1666 = fma(_1384, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1654);
    float _1668 = _1656 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1670 = -_1660;
    float _1672 = fma(_1670, _1626, 1.0);
    float _1674 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1658);
    float _1676 = _1666 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1678 = _1668 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1680 = _1640 * _1598;
    float _1682 = _1640 * _1610;
    float _1684 = fma(_1384, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1674);
    float _1686 = fma(_1676, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1678);
    float _1688 = _1680 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1690 = _1640 * _1606;
    float _1692 = _1684 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1694 = fma(_1652, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1686);
    float _1696 = -_1688;
    float _1698 = fma(_1682, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1696);
    float _1700 = _1664 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1702 = log2(_1672);
    float _1704 = fma(_1692, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1694);
    float _1706 = -_1690;
    float _1708 = fma(_1706, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1698);
    float _1710 = _1668 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1712 = _1668 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1714 = fma(_1708, -0.5, 0.5);
    float _1716 = fma(_1676, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1710);
    float _1718 = exp2(_1700);
    float _1720 = fma(_1708, 0.5, 0.5);
    float _1722 = fma(_1676, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1712);
    float _1724 = _1682 + 1.0;
    float _1726 = fma(_1652, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1716);
    float _1728 = fma(_1720, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1730 = fma(_1652, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1722);
    float _1732 = 1.0 / _1704;
    float _1734 = fma(_1720, _1728, -0.212114393711090087890625);
    float _1736 = _1702 * 0.693147182464599609375;
    float _1738 = fma(_1720, _1734, 1.570728778839111328125);
    float _1740 = _1736 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1742 = sqrt(_1714);
    float _1744 = -_1682;
    float _1746 = fma(_1718, _1724, _1744);
    float _1748 = fma(_1692, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1726);
    float _1750 = fma(_1692, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1730);
    float _1752 = fma(_1746, 0.5, 0.5);
    float _1754 = _1748 * _1732;
    float _1756 = _1750 * _1732;
    float _1758 = fma(_1754, 0.5, 0.5);
    float _1760 = fma(_1756, -0.5, 0.5);
    float _1762 = _1742 * 0.636619746685028076171875;
    float3 _4753 = float3(_1758, _1760, _1740);
    float _1764 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4753, float3(0.0), isnan(_4753)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4753, float3(0.0), isnan(_4753)), level(0.0)).x;
    float3 _4764 = float3(_1758, _1760, _1740);
    float4 _1767 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4764, float3(0.0), isnan(_4764)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4764, float3(0.0), isnan(_4764)), level(0.0)).xyzw;
    float _1769 = _1767.x;
    float _1771 = _1767.y;
    float _1773 = _1767.z;
    float _1775 = _1767.w;
    float _1777 = -_1738;
    float _1779 = fma(_1762, _1777, 1.0);
    float2 _4786 = float2(_1779, _1752);
    float3 _1783 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4786, float2(0.0), isnan(_4786)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4786, float2(0.0), isnan(_4786)), level(0.0)).xyz;
    float _1785 = _1783.x;
    float _1787 = _1783.y;
    float _1789 = _1783.z;
    float _1791 = _1664 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1793 = _1668 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1795 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1797 = _1795 != 0;
    out.m_67.x = _1192;
    out.m_67.y = _1210;
    out.m_67.z = _1168;
    float _1799 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1801 = _1799 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1803 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1805 = _528 > 0.5;
    float _1807 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1809 = _1807 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    int _1811 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1813 = _1811 != 0;
    float _1815 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1817 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1815;
    int _1819 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1821 = _1819 != 0;
    float _1823 = fma(_1676, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1793);
    int _1825 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1827 = _1825 != 0;
    float _1829 = _846;
    bool _1831 = _1805;
    if (_1797)
    {
        float _1833 = in.m_59.z;
        _1829 = _1833;
    }
    float _1835 = _1829;
    float _1837 = 1.0 / _1801;
    float _1839 = -_160;
    float _1841 = _1839 + 1.0;
    bool _1843 = _536 > 0.5;
    bool _1845 = _1843 && _1813;
    float _1847 = fma(_1652, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1823);
    bool _1849 = _530 > 0.5;
    float _1851 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1853 = _1851 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    int _1855 = _1805 ? as_type<int>(_1841) : as_type<int>(_160);
    out.m_69.w = _858;
    float _1857 = 1.0 / _1809;
    bool _1859 = _526 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1861 = isnan(_526);
    bool _1863 = _1859 || _1861;
    bool _1865 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1867 = _1863 || _1865;
    float _1869 = float(_1867);
    out.m_71.x = _1062;
    out.m_73.x = _1382;
    out.m_73.y = _1380;
    out.m_73.z = _1384;
    float _1871 = _1817 * _1837;
    bool _1873 = _526 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1875 = isnan(_526);
    bool _1877 = _1873 || _1875;
    bool _1879 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1881 = _1877 || _1879;
    float _1883 = float(_1881);
    float _1885 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _1887 = _526 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1889 = isnan(_526);
    bool _1891 = _1887 || _1889;
    bool _1893 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1895 = _1891 || _1893;
    float _1897 = float(_1895);
    float _1899 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1901 = _526 + _1899;
    float _1903 = -_1883;
    float _1905 = _1903 + 1.0;
    int _1907 = as_type<int>(_1905);
    if (_1797)
    {
        bool _1909 = _1835 > 0.5;
        _1831 = _1909;
    }
    bool _1911 = _1831;
    float _1913 = _1853 * _1857;
    float _1915 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1917 = _526 + _1915;
    float _1919 = -_1897;
    float _1921 = _1919 + 1.0;
    float _1923 = _1897 * _1905;
    float _1925 = fma(_1871, _1901, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1927 = fma(_1913, _1917, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1929 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _1931 = _1869 * _1921;
    if (_1797)
    {
        float _1933 = -_154;
        float _1935 = _1933 + 1.0;
        _1907 = as_type<int>(_1935);
    }
    int _1937 = _1907;
    float _1939 = _1821 ? as_type<float>(_1855) : _160;
    float _1941 = -_1869;
    float _1943 = _1941 + 1.0;
    float _1945 = _1925 * _1931;
    if (_1827)
    {
        float _1947 = _1849 ? _1841 : _160;
        _206 = _1947;
    }
    float _1949 = _206;
    float _1951 = _900 * (-0.15915493667125701904296875);
    float _1953 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _1955 = _1885 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1957 = _1885;
    if (!_1797)
    {
        _558 = _154;
    }
    float _1959 = _558;
    float _1961 = _1803 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1963 = _1959;
    if (_1797)
    {
        float _1965 = _1911 ? as_type<float>(_1937) : _154;
        _1963 = _1965;
    }
    float _1967 = _1963;
    float _1969 = fma(_1955, _1949, -0.5);
    if (!_1813)
    {
        _1957 = _154;
    }
    float _1971 = _1957;
    float _1973 = _1971;
    if (_1845)
    {
        float _1975 = -_154;
        float _1977 = _1975 + 1.0;
        _208 = _1977;
    }
    float _1979 = _208;
    float _1981 = _1951 * 6.283185482025146484375;
    float _1983 = sin(_1981);
    float _1985 = fma(_1943, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1945);
    float _1987 = _1929 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _1989 = fma(_1961, _1967, -0.5);
    if (_1813)
    {
        _1973 = _1979;
    }
    float _1991 = _1973;
    float _1993 = fma(_1927, _1923, _1985);
    float _1995 = fma(_1939, _1987, -0.5);
    float _1997 = _1951 * 6.283185482025146484375;
    float _1999 = cos(_1997);
    float _2001 = _1953 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _2003 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2005 = fma(_2001, _1991, -0.5);
    float _2007 = fma(_1883, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1993);
    float _2009 = _2003 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2011 = exp2(_1791);
    float _2013 = _1983 * _1969;
    float _2015 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2017 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2019 = fma(_860, _2005, _920);
    float _2021 = -_916;
    float _2023 = fma(_908, _1995, _2021);
    float _2025 = _2015 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2027 = _2017 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2029 = _1999 * _1969;
    float _2031 = -_2013;
    float _2033 = fma(_1999, _1989, _2031);
    float _2035 = _2007 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _2037 = _1452 > 0.0;
    bool _2039 = isnan(_1452);
    bool _2041 = _2037 || _2039;
    bool _2043 = isnan(0.0);
    bool _2045 = _2041 || _2043;
    float _2047 = fma(_1983, _1989, _2029);
    float _2049 = fma(_904, _2033, _926);
    float _2051 = _1704 * 0.5;
    out.m_75.x = _2009;
    out.m_75.y = _2025;
    out.m_75.z = _2027;
    out.m_75.w = _2035;
    float _2053 = -_2011;
    float _2055 = _2053 + 1.0;
    float _2057 = -_928;
    float _2059 = fma(_922, _2047, _2057);
    float _2061 = _2019 + 0.5;
    float _2063 = _2049 + 0.5;
    float _2065 = _2055 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2067 = _2023 + 0.5;
    float _2069 = _1452 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2071 = fma(_1692, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1847);
    float _2073 = _2059 + 0.5;
    float _2075 = _2069 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_77.x = _2061;
    out.m_77.y = _2067;
    float _2077 = _2071 + _1704;
    float _2079 = _1748 + _1704;
    out.m_79.z = _2063;
    out.m_79.w = _2073;
    float _2081 = _2077 * 0.5;
    float _2083 = _2079 * 0.5;
    float _2085 = fma(_1750, -0.5, _2051);
    out.gl_Position.x = _1748;
    out.gl_Position.y = _1750;
    out.gl_Position.z = _2071;
    out.gl_Position.w = _1704;
    out.m_81.x = _2083;
    out.m_81.y = _2085;
    out.m_81.z = _2081;
    out.m_81.w = _1704;
    out.m_51.x = _2075;
    float _2087 = _2065 * _1764;
    float _2089 = -_2065;
    float _2091 = _2089 + 1.0;
    float _2093 = _1775 * _2087;
    float _2095 = _1775 * _2091;
    float _2097 = _1789 * _2087;
    float _2099 = fma(_1785, _2093, _1769);
    float _2101 = fma(_1787, _2093, _1771);
    float _2103 = fma(_1775, _2097, _1773);
    out.m_83.x = _2099;
    out.m_83.y = _2101;
    out.m_83.z = _2103;
    out.m_83.w = _2095;
    if (_2045)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_51.x = 0.0;
    float _2105 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2105;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

