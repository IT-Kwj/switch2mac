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
    constant _16* vp_c16 [[id(4)]];
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
    float4 m_55 [[user(locn0)]];
    float4 m_65 [[user(locn1)]];
    float4 m_67 [[user(locn2)]];
    float4 m_71 [[user(locn3)]];
    float4 m_47 [[user(locn4)]];
    float4 m_61 [[user(locn5)]];
    float4 m_69 [[user(locn6)]];
    float4 m_63 [[user(locn7)]];
    float4 m_73 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_59 [[attribute(5)]];
    float4 m_51 [[attribute(6)]];
    float4 m_53 [[attribute(7)]];
    float4 m_57 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1734 = false;
    bool _518 = false;
    bool _376 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _87 = in.m_44.w;
    float _89 = trunc(_87);
    int _92 = int(_89);
    bool _96 = _92 >= 1;
    float _98 = 0.0;
    if (!_96)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _100 = _98;
    float _102 = _100;
    if (!_96)
    {
        out.m_47.x = 0.0;
    }
    int _104 = 0;
    if (!_96)
    {
        float _106 = _100 * 5.0;
        _104 = as_type<int>(_106);
    }
    int _108 = _104;
    int _110 = _108;
    if (!_96)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2222 = as_type<float>(_108);
        out.gl_Position.z = _2222;
    }
    if (!_96)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _112 = in.m_49.w;
    bool _114 = _112 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _116 = isnan(_112);
    bool _118 = _114 || _116;
    bool _120 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _122 = _118 || _120;
    float _124 = -_112;
    float _126 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_122)
    {
        float _128 = float(_92);
        _102 = _128;
    }
    float _130 = _102;
    bool _132 = _126 >= _130;
    bool _134 = !_122;
    bool _136 = _132 || _134;
    float _138 = _130;
    if (_136)
    {
        _138 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _138;
    if (_136)
    {
        out.m_47.x = 0.0;
    }
    if (_136)
    {
        float _142 = _140 * 5.0;
        _110 = as_type<int>(_142);
    }
    int _144 = _110;
    if (_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2291 = as_type<float>(_144);
        out.gl_Position.z = _2291;
    }
    if (_136)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _146 = in.m_51.x;
    float _148 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _150 = _126 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    bool _152 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _154 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _156 = _152 || _154;
    bool _158 = isnan(1.0);
    bool _160 = _156 || _158;
    int _162 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _164 = _162 != 0;
    float _166 = _150 * _148;
    float _168 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[20].x, _166);
    float _170 = in.m_49.x;
    float _172 = in.m_49.y;
    float _174 = in.m_49.z;
    float _176 = _168 * 6.283185482025146484375;
    float _178 = floor(_168);
    float _180 = _176 * 0.15915493667125701904296875;
    float _182 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _184 = 0.0;
    float _186 = _182;
    float _188 = _146;
    if (!_160)
    {
        float _190 = _182 * _182;
        float _192 = _190 * 0.5;
        _184 = _192;
    }
    float _194 = _184;
    float _196 = _180 * 6.283185482025146484375;
    float _198 = cos(_196);
    float _200 = _194;
    if (!_160)
    {
        float _202 = _194 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _200 = _202;
    }
    float _204 = _200;
    float _206 = -_178;
    float _208 = _168 + _206;
    bool _210 = !_160;
    float _212 = _204;
    if (!_210)
    {
        float _214 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _216 = log2(_214);
        float _218 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _220 = _218 + 1.0;
        float _222 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _224 = _182 * _216;
        float _226 = 1.0 / _220;
        float _228 = _222 * 0.693147182464599609375;
        float _230 = exp2(_224);
        float _232 = 1.0 / _228;
        float _234 = _230 + (-1.0);
        float _236 = -_234;
        float _238 = fma(_236, _232, _182);
        float _240 = _238 * _226;
        float _242 = _240 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _212 = _242;
    }
    float _244 = _212;
    bool _246 = !_160;
    if (!_246)
    {
        float _248 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _250 = log2(_248);
        float _252 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _254 = _252 + 1.0;
        float _256 = 1.0 / _254;
        float _258 = _182 * _250;
        float _260 = exp2(_258);
        float _262 = -_260;
        float _264 = _262 + 1.0;
        float _266 = _264 * _256;
        _186 = _266;
    }
    float _268 = _186;
    float _270 = in.m_53.w;
    int _272 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _274 = _272 != 0;
    int _276 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _278 = _276 != 0;
    float _280 = -_208;
    float _282 = fma(_280, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _284 = _208 < 0.5;
    float _286 = float(_284);
    float _288 = fma(_198, 0.5, 0.5);
    float _290 = in.m_44.x;
    float _292 = in.m_44.y;
    float _294 = in.m_44.z;
    bool _296 = !_274;
    int _298 = _296 ? 0 : 1;
    float _300 = _244 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _302 = -_286;
    float _304 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _306 = !_164;
    int _308 = _306 ? 0 : 1;
    float _310 = -_288;
    float _312 = fma(_310, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _314 = abs(_298);
    float _316 = fma(_268, _170, _300);
    int _318 = abs(_308);
    float _320 = _244 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _322 = !_278;
    int _324 = _322 ? 0 : 1;
    float _326 = fma(_268, _172, _320);
    bool _328 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _330 = abs(_324);
    float _332 = _244 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _334 = float(_314);
    float _336 = float(_318);
    float _338 = fma(_268, _174, _332);
    float _340 = abs(_282);
    float _342 = _334 * _340;
    float _344 = fma(_316, _270, _290);
    float _346 = float(_330);
    float _348 = fma(_336, _312, _342);
    float _350 = fma(_326, _270, _292);
    float _352 = fma(_338, _270, _294);
    float _354 = abs(_304);
    float _356 = fma(_346, _354, _348);
    bool _358 = !_328;
    float _374;
    if (!_358)
    {
        float _360 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _362 = _146 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _364 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[12].x, _126);
        float _366 = _364 * _360;
        float _368 = floor(_366);
        float _370 = -_368;
        float _372 = _366 + _370;
        _374 = _372;
        _376 = true;
    }
    else
    {
        float _378 = float(_92);
        float _380 = 1.0 / _378;
        float _382 = _126 * _380;
        _374 = _382;
    }
    _376 = false;
    float _384 = _374;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _388 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _386;
    float _390 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _392 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _394 = _384 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _396 = isnan(_384);
    bool _398 = _394 || _396;
    bool _400 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _402 = _398 || _400;
    float _404 = float(_402);
    float _406 = 1.0 / _388;
    float _408 = _390 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _410 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _414 = _384 + _412;
    float _416 = _392 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _418 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _420 = _410 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _422 = -_404;
    float _424 = _422 + 1.0;
    bool _426 = _384 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _428 = isnan(_384);
    bool _430 = _426 || _428;
    bool _432 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _434 = _430 || _432;
    float _436 = float(_434);
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _440 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _438;
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _444 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _442;
    out.m_55.x = _408;
    out.m_55.y = _420;
    out.m_55.z = _416;
    out.m_55.w = _418;
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _448 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _446;
    float _450 = _414 * _406;
    float _452 = _436 * _424;
    float _454 = in.m_53.x;
    float _456 = in.m_53.y;
    float _458 = in.m_53.z;
    bool _460 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _462 = fma(_440, _450, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _464 = fma(_444, _450, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _466 = fma(_448, _450, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _468 = -_436;
    float _470 = _468 + 1.0;
    float _472 = _462 * _452;
    float _474 = _464 * _452;
    float _476 = _466 * _452;
    float _478 = fma(_470, (*spvDescriptorSet0.vp_c9)._m0[143].x, _472);
    float _480 = fma(_470, (*spvDescriptorSet0.vp_c9)._m0[143].y, _474);
    float _482 = fma(_470, (*spvDescriptorSet0.vp_c9)._m0[143].z, _476);
    float _484 = fma(_404, (*spvDescriptorSet0.vp_c9)._m0[144].x, _478);
    float _486 = fma(_404, (*spvDescriptorSet0.vp_c9)._m0[144].y, _480);
    float _488 = fma(_404, (*spvDescriptorSet0.vp_c9)._m0[144].z, _482);
    float _490 = _484 * _454;
    float _492 = _486 * _456;
    float _494 = _488 * _458;
    bool _496 = !_460;
    bool _498 = _460;
    int _500 = as_type<int>(_458);
    float _516;
    if (!_496)
    {
        float _502 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _504 = _146 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _506 = fma(_504, (*spvDescriptorSet0.vp_c9)._m0[11].z, _126);
        float _508 = _506 * _502;
        float _510 = floor(_508);
        float _512 = -_510;
        float _514 = _508 + _512;
        _516 = _514;
        _518 = true;
    }
    else
    {
        float _520 = float(_92);
        float _522 = 1.0 / _520;
        float _524 = _126 * _522;
        _516 = _524;
    }
    _518 = false;
    float _526 = _516;
    float _528 = in.m_57.x;
    float _530 = _356 * _494;
    float _532 = _356 * _490;
    float _534 = in.m_51.w;
    int _536 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _538 = _536 != 0;
    float _540 = _356 * _492;
    int _542 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _544 = _542 != 0;
    float _546 = in.m_57.y;
    int _548 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _550 = _548 != 0;
    float _552 = _350 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _554 = in.m_51.z;
    float _556 = fma(_344, (*spvDescriptorSet0.vp_c10)._m0[6].x, _552);
    float _558 = in.m_51.y;
    float _560 = _532 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    if (_538)
    {
        bool _562 = _146 > 0.5;
        _498 = _562;
    }
    bool _564 = _498;
    float _566 = in.m_59.x;
    float _568 = in.m_59.y;
    float _570 = in.m_59.z;
    float _572 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _574 = _530 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _576 = _528;
    if (_538)
    {
        float _578 = -_528;
        float _580 = _578 + 1.0;
        _500 = as_type<int>(_580);
    }
    int _582 = _500;
    float _584 = 0.0;
    if (!_538)
    {
        _584 = _528;
    }
    float _586 = _584;
    float _588 = _540 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _590 = _534 > 0.5;
    float _592 = _586;
    if (_538)
    {
        float _594 = _564 ? as_type<float>(_582) : _528;
        _592 = _594;
    }
    float _596 = _592;
    float _598 = -_546;
    float _600 = _598 + 1.0;
    float _602 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _604 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _602;
    float _606 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _608 = _606 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _610 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _612 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _610;
    bool _614 = _554 > 0.5;
    float _616 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _618 = _616 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    int _620 = _590 ? as_type<int>(_600) : as_type<int>(_546);
    float _622 = 1.0 / _604;
    bool _624 = _558 > 0.5;
    float _626 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _628 = _614 ? as_type<int>(_600) : as_type<int>(_546);
    float _630 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _566);
    int _632 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _634 = _632 != 0;
    int _636 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _638 = _636 != 0;
    int _640 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _642 = _640 != 0;
    float _644 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _646 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _644;
    int _648 = _624 ? as_type<int>(_600) : as_type<int>(_546);
    float _650 = 1.0 / _608;
    float _652 = _550 ? as_type<float>(_628) : _546;
    float _654 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _568);
    float _656 = _638 ? as_type<float>(_620) : _546;
    float _658 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _570);
    float _660 = _634 ? as_type<float>(_648) : _546;
    float _662 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _664 = _662 + (*spvDescriptorSet0.vp_c9)._m0[129].w;
    int _666 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _668 = _666 != 0;
    float _670 = _560 * _630;
    int _672 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _674 = _672 != 0;
    float _676 = _350 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _678 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _680 = _678 != 0;
    float _682 = _350 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _684 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _686 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _684;
    float _688 = fma(_344, (*spvDescriptorSet0.vp_c10)._m0[4].x, _676);
    float _690 = _146 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _692 = fma(_344, (*spvDescriptorSet0.vp_c10)._m0[5].x, _682);
    float _694 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _696 = _694 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _698 = fma(_352, (*spvDescriptorSet0.vp_c10)._m0[4].z, _688);
    float _700 = 1.0 / _686;
    float _702 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _704 = _526 + _702;
    float _706 = -_572;
    float _708 = fma(_690, 2.0, _706);
    float _710 = _574 * _658;
    float _712 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _714 = _526 + _712;
    float _716 = _588 * _654;
    float _718 = _558 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _720 = 1.0 / _696;
    float _722 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _724 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _722;
    float _726 = _714 * _650;
    float _728 = fma(_718, -2.0, _626);
    float _730 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _732 = _730 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _734 = 1.0 / _646;
    float _736 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _738 = _526 + _736;
    float _740 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _742 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _740;
    float _744 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _746 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _744;
    float _748 = _738 * _622;
    float _750 = _642 ? as_type<float>(_628) : _546;
    float _752 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _754 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _752;
    float _756 = _704 * _720;
    float _758 = 1.0 / _664;
    float _760 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _762 = _526 + _760;
    float _764 = fma(_612, _748, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _766 = fma(_724, _748, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _768 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _770 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _768;
    float _772 = _762 * _700;
    float _774 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _776 = _526 + _774;
    float _778 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _780 = _526 + _778;
    float _782 = fma(_770, _748, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _784 = _776 * _734;
    float _786 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _788 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _790 = _788 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _792 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _794 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _792;
    float _796 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _798 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _796;
    float _800 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _802 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _800;
    float _804 = _780 * _758;
    float _806 = fma(_618, _726, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _808 = fma(_732, _726, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _810 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _812 = fma(_790, _726, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _814 = fma(_794, _772, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _816 = fma(_742, _772, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _818 = fma(_798, _772, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _820 = fma(_802, _784, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    float _822 = fma(_746, _784, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    float _824 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _826 = _824 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _828 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _830 = _828 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _832 = fma(_754, _784, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    bool _834 = _526 >= (*spvDescriptorSet0.vp_c9)._m0[129].w;
    bool _836 = isnan(_526);
    bool _838 = _834 || _836;
    bool _840 = isnan((*spvDescriptorSet0.vp_c9)._m0[129].w);
    bool _842 = _838 || _840;
    float _844 = float(_842);
    float _846 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _848 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _850 = _848 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _852 = -(*spvDescriptorSet0.vp_c9)._m0[128].x;
    float _854 = _852 + (*spvDescriptorSet0.vp_c9)._m0[129].x;
    float _856 = -(*spvDescriptorSet0.vp_c9)._m0[128].y;
    float _858 = _856 + (*spvDescriptorSet0.vp_c9)._m0[129].y;
    float _860 = fma(_352, (*spvDescriptorSet0.vp_c10)._m0[5].z, _692);
    bool _862 = _526 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _864 = isnan(_526);
    bool _866 = _862 || _864;
    bool _868 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _870 = _866 || _868;
    float _872 = float(_870);
    float _874 = -(*spvDescriptorSet0.vp_c9)._m0[128].z;
    float _876 = _874 + (*spvDescriptorSet0.vp_c9)._m0[129].z;
    float _878 = fma(_352, (*spvDescriptorSet0.vp_c10)._m0[6].z, _556);
    float _880 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _882 = fma(_826, _756, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _884 = fma(_830, _756, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _886 = fma(_850, _756, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _888 = -_844;
    float _890 = _888 + 1.0;
    float _892 = fma(_854, _804, (*spvDescriptorSet0.vp_c9)._m0[128].x);
    float _894 = fma(_858, _804, (*spvDescriptorSet0.vp_c9)._m0[128].y);
    float _896 = fma(_876, _804, (*spvDescriptorSet0.vp_c9)._m0[128].z);
    bool _898 = _526 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _900 = isnan(_526);
    bool _902 = _898 || _900;
    bool _904 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _906 = _902 || _904;
    float _908 = float(_906);
    float _910 = -_872;
    float _912 = _910 + 1.0;
    bool _914 = _526 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _916 = isnan(_526);
    bool _918 = _914 || _916;
    bool _920 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _922 = _918 || _920;
    float _924 = float(_922);
    float _926 = _872 * _890;
    float _928 = _786 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _930 = _810 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _932 = _908 * _912;
    float _934 = -_908;
    float _936 = _934 + 1.0;
    bool _938 = _526 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _940 = isnan(_526);
    bool _942 = _938 || _940;
    bool _944 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _946 = _942 || _944;
    float _948 = float(_946);
    float _950 = -_924;
    float _952 = _950 + 1.0;
    float _954 = _846 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _956 = _924 * _936;
    bool _958 = _526 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _960 = isnan(_526);
    bool _962 = _958 || _960;
    bool _964 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _966 = _962 || _964;
    float _968 = float(_966);
    float _970 = _880 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _972 = _948 * _952;
    float _974 = -_948;
    float _976 = _974 + 1.0;
    bool _978 = _526 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _980 = isnan(_526);
    bool _982 = _978 || _980;
    bool _984 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _986 = _982 || _984;
    float _988 = float(_986);
    float _990 = fma(_750, _970, -0.5);
    float _992 = _716 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _994 = _968 * _976;
    float _996 = -_968;
    float _998 = _996 + 1.0;
    float _1000 = _716 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1002 = _716 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1004 = fma(_652, _954, -0.5);
    float _1006 = _988 * _998;
    float _1008 = fma(_670, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1000);
    float _1010 = fma(_670, (*spvDescriptorSet0.vp_c8)._m0[25].x, _992);
    float _1012 = fma(_670, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1002);
    float _1014 = fma(_660, _928, -0.5);
    float _1016 = fma(_656, _930, -0.5);
    float _1018 = _764 * _1006;
    float _1020 = _782 * _1006;
    float _1022 = fma(_710, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1008);
    float _1024 = fma(_710, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1010);
    float _1026 = fma(_710, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1012);
    float _1028 = -_988;
    float _1030 = _1028 + 1.0;
    float _1032 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1034 = as_type<int>(_880);
    float _1036 = _766;
    float _1038 = _670;
    float _1040 = _1008;
    int _1042 = as_type<int>(_1020);
    float _1044 = _1006;
    float _1046 = _882;
    float _1048 = _932;
    float _1050 = _1004;
    if (_544)
    {
        float _1052 = -_528;
        float _1054 = _1052 + 1.0;
        _1034 = as_type<int>(_1054);
    }
    int _1056 = _1034;
    int _1058 = 0;
    int _1060 = _1056;
    if (_668)
    {
        float _1062 = -_528;
        float _1064 = _1062 + 1.0;
        _1058 = as_type<int>(_1064);
    }
    int _1066 = _1058;
    float _1068 = _766 * _1006;
    float _1070 = _1068;
    if (!_544)
    {
        _1036 = _528;
    }
    float _1072 = _1036;
    float _1074 = fma(_1030, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1018);
    float _1076 = _1072;
    if (!_668)
    {
        _1038 = _528;
    }
    float _1078 = _1038;
    float _1080 = fma(_1030, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1068);
    float _1082 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1084 = _1078;
    if (_544)
    {
        float _1086 = _614 ? as_type<float>(_1056) : _528;
        _1076 = _1086;
    }
    float _1088 = _1076;
    if (_674)
    {
        float _1090 = -_528;
        float _1092 = _1090 + 1.0;
        _1060 = as_type<int>(_1092);
    }
    int _1094 = _1060;
    int _1096 = _1094;
    if (_668)
    {
        float _1098 = _624 ? as_type<float>(_1066) : _528;
        _1084 = _1098;
    }
    float _1100 = _1084;
    float _1102 = fma(_1030, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1020);
    if (!_674)
    {
        _1040 = _528;
    }
    float _1104 = _1040;
    float _1106 = _1104;
    if (_674)
    {
        float _1108 = _624 ? as_type<float>(_1094) : _528;
        _1106 = _1108;
    }
    float _1110 = _1106;
    float _1112 = (*spvDescriptorSet0.vp_c9)._m0[94].z + (*spvDescriptorSet0.vp_c9)._m0[94].y;
    if (_680)
    {
        _1096 = 0;
    }
    int _1114 = _1096;
    int _1116 = _1114;
    if (_680)
    {
        _1042 = 0;
    }
    int _1118 = _1042;
    int _1120 = _1118;
    if (_680)
    {
        _1044 = _146;
    }
    float _1122 = _1044;
    float _1124 = _1122;
    if (_680)
    {
        _1070 = _558;
    }
    float _1126 = _1070;
    float _1128 = _1126;
    if (_680)
    {
        _576 = _554;
    }
    float _1130 = _576;
    float _1132 = _1130;
    if (!_680)
    {
        float _1134 = _146 * 3.1415927410125732421875;
        float _1136 = _1134 * 0.15915493667125701904296875;
        float _1138 = _558 * 3.1415927410125732421875;
        float _1140 = _1138 * 0.15915493667125701904296875;
        float _1142 = _554 * 3.1415927410125732421875;
        float _1144 = _1136 * 6.283185482025146484375;
        float _1146 = sin(_1144);
        float _1148 = _1142 * 0.15915493667125701904296875;
        float _1150 = _1140 * 6.283185482025146484375;
        float _1152 = sin(_1150);
        float _1154 = _1148 * 6.283185482025146484375;
        float _1156 = sin(_1154);
        _1116 = 1;
        _1120 = 2;
        _1132 = _1156;
        _1124 = _1146;
        _1128 = _1152;
    }
    int _1158 = _1116;
    int _1160 = _1120;
    float _1162 = _1132;
    float _1164 = _1124;
    float _1166 = _1128;
    bool _1168 = _1158 != 1;
    float _1170 = fma(_806, _994, _1074);
    bool _1172 = _1160 != 2;
    float _1174 = _1032 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1176 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _1178 = fma(_1162, (*spvDescriptorSet0.vp_c9)._m0[94].z, _1112);
    float _1180 = fma(_808, _994, _1080);
    float _1182 = fma(_1174, _596, -0.5);
    float _1184 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _1186 = _1082 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1188 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _1190 = fma(_554, (*spvDescriptorSet0.vp_c9)._m0[79].z, _1184);
    float _1192 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _1194 = fma(_1164, (*spvDescriptorSet0.vp_c9)._m0[93].z, _1188);
    float _1196 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[79].x, _1190);
    float _1198 = _1164 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _1200 = fma(_812, _994, _1102);
    float _1202 = fma(_1166, (*spvDescriptorSet0.vp_c9)._m0[93].w, _1192);
    float _1204 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1206 = _1176 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _1208 = _1166 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _1210 = _1196 * (-0.15915493667125701904296875);
    float _1212 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _1214 = fma(_1186, _1088, -0.5);
    float _1216 = fma(_1206, _1110, -0.5);
    float _1218 = _1210 * 6.283185482025146484375;
    float _1220 = sin(_1218);
    float _1222 = fma(_1208, -2.0, _1212);
    float _1224 = _1024 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1226 = fma(_814, _972, _1170);
    float _1228 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _1230 = fma(_818, _972, _1200);
    float _1232 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[94].x, _1178);
    float _1234 = _1210 * 6.283185482025146484375;
    float _1236 = cos(_1234);
    float _1238 = -_1228;
    float _1240 = fma(_1198, 2.0, _1238);
    float _1242 = _1204 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1244 = _698 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1246 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1248 = _1022 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1250 = fma(_1242, _1100, -0.5);
    float _1252 = fma(_816, _972, _1180);
    float _1254 = _1220 * _1014;
    float _1256 = fma(_882, _956, _1226);
    float _1258 = _1232 * (-0.15915493667125701904296875);
    float _1260 = fma(_886, _956, _1230);
    float _1262 = fma(_884, _956, _1252);
    float _1264 = -_126;
    float _1266 = fma(_1264, (*spvDescriptorSet0.vp_c9)._m0[76].x, _708);
    float _1268 = _1258 * 6.283185482025146484375;
    float _1270 = sin(_1268);
    float _1272 = _1236 * _1014;
    float _1274 = -_1254;
    float _1276 = fma(_1236, _1182, _1274);
    float _1278 = fma(_820, _932, _1256);
    float _1280 = fma(_1220, _1182, _1272);
    float _1282 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1284 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1246);
    float _1286 = _1258 * 6.283185482025146484375;
    float _1288 = cos(_1286);
    float _1290 = fma(_558, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1282);
    float _1292 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1284);
    float _1294 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[76].y, _728);
    float _1296 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1298 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1290);
    float _1300 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1302 = fma(_822, _932, _1262);
    float _1304 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1296);
    float _1306 = -_1294;
    float _1308 = fma(_1298, _1280, _1306);
    float _1310 = _1298;
    float _1312 = _1292;
    float _1314 = _1256;
    float _1316 = _1270;
    if (!_1168)
    {
        _1310 = _146;
    }
    float _1318 = _1310;
    float _1320 = fma(_832, _932, _1260);
    float _1322 = fma(_558, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1300);
    float _1324 = fma(_892, _926, _1278);
    float _1326 = _1318;
    float _1328 = _1320;
    if (!_1168)
    {
        _1046 = _1318;
    }
    float _1330 = _1046;
    float _1332 = fma(_894, _926, _1302);
    float _1334 = _1330;
    if (_1168)
    {
        _1326 = _146;
    }
    float _1336 = _1326;
    float _1338 = fma(_896, _926, _1320);
    if (!_1168)
    {
        _188 = _558;
    }
    float _1340 = _188;
    float _1342 = _878 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1344 = _1026 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1346 = _1340;
    if (!_1168)
    {
        _1048 = _1340;
    }
    float _1348 = _1048;
    float _1350 = _1288 * _1004;
    float _1352 = _1348;
    if (_1168)
    {
        _1346 = _558;
    }
    float _1354 = _1346;
    float _1356 = _1270 * _1004;
    float _1358 = fma(_1292, _1276, _1266);
    if (!_1168)
    {
        _1050 = _1348;
    }
    float _1360 = _1050;
    float _1362 = -_1356;
    float _1364 = fma(_1288, _1216, _1362);
    float _1366 = _1360;
    if (_1168)
    {
        _1334 = _554;
    }
    float _1368 = _1334;
    float _1370 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    float _1372 = _1368;
    if (_1168)
    {
        _1352 = _1336;
    }
    float _1374 = _1352;
    float _1376 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    if (!_1168)
    {
        _1312 = _554;
    }
    float _1378 = _1312;
    float _1380 = _1244 + _1248;
    float _1382 = _1342 + _1344;
    float _1384 = fma(_1368, (*spvDescriptorSet0.vp_c9)._m0[84].z, _1370);
    float _1386 = _1378;
    float _1388 = _1380;
    float _1390 = _1382;
    if (!_1168)
    {
        _1314 = _1378;
    }
    float _1392 = _1314;
    float _1394 = fma(_1374, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1376);
    float _1396 = _1392;
    if (_1168)
    {
        _1386 = _1354;
    }
    float _1398 = _1386;
    float _1400 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1402 = _1380 + _1400;
    float _1404 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1406 = _1382 + _1404;
    float _1408 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1410 = fma(_1270, _1216, _1350);
    if (_1172)
    {
        _1316 = _1354;
    }
    float _1412 = _1316;
    float _1414 = _1402 * _1402;
    float _1416 = _1412;
    float _1418 = _1414;
    if (_1168)
    {
        _1366 = _1336;
    }
    float _1420 = _1366;
    float _1422 = fma(_1398, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1408);
    if (!_1172)
    {
        _1416 = _1336;
    }
    float _1424 = _1416;
    float _1426 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[92].w, _1202);
    if (_1172)
    {
        _1372 = _1336;
    }
    float _1428 = _1372;
    float _1430 = _1406 * _1406;
    float _1432 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[91].y, _1222);
    float _1434 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[92].z, _1194);
    float _1436 = -_126;
    float _1438 = fma(_1436, (*spvDescriptorSet0.vp_c9)._m0[91].x, _1240);
    float _1440 = _1428;
    float _1442 = _1430;
    if (_1172)
    {
        _1328 = _554;
    }
    float _1444 = _1328;
    float _1446 = _1414 + _1430;
    float _1448 = _1444;
    if (_1168)
    {
        _1396 = _1354;
    }
    float _1450 = _1396;
    float _1452 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[84].x, _1384);
    if (!_1172)
    {
        _1448 = _1354;
    }
    float _1454 = _1448;
    float _1456 = -_1432;
    float _1458 = fma(_1426, _1410, _1456);
    if (!_1172)
    {
        _1440 = _554;
    }
    float _1460 = _1440;
    float _1462 = fma(_1434, _1364, _1438);
    float _1464 = sqrt(_1446);
    float _1466 = fma(_844, (*spvDescriptorSet0.vp_c9)._m0[129].y, _1332);
    float _1468 = fma(_844, (*spvDescriptorSet0.vp_c9)._m0[129].x, _1324);
    float _1470 = _1452 * (-0.15915493667125701904296875);
    float _1472 = (*spvDescriptorSet0.vp_c9)._m0[89].z + (*spvDescriptorSet0.vp_c9)._m0[89].y;
    float _1474 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1476 = _1420 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1478 = fma(_1454, (*spvDescriptorSet0.vp_c9)._m0[89].z, _1472);
    float _1480 = -_1474;
    float _1482 = fma(_1476, 2.0, _1480);
    float _1484 = _1450 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1486 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1488 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[89].x, _1478);
    float _1490 = _1460 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1492 = fma(_1484, -2.0, _1486);
    float _1494 = _1470 * 6.283185482025146484375;
    float _1496 = sin(_1494);
    float _1498 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1500 = _1488 * (-0.15915493667125701904296875);
    bool _1502 = _1464 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1504 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1506 = _1424 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1508 = -_1498;
    float _1510 = fma(_1490, 2.0, _1508);
    float _1512 = _860 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1514 = _1470 * 6.283185482025146484375;
    float _1516 = cos(_1514);
    float _1518 = fma(_1506, -2.0, _1504);
    float _1520 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1492);
    float _1522 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1304);
    float _1524 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1322);
    float _1526 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1394);
    float _1528 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1422);
    float _1530 = _1500 * 6.283185482025146484375;
    float _1532 = sin(_1530);
    float _1534 = -_126;
    float _1536 = fma(_1534, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1482);
    float _1538 = -_126;
    float _1540 = fma(_1538, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1510);
    float _1542 = _1496 * _1016;
    float _1544 = _1512 + _1224;
    float _1546 = fma(_844, (*spvDescriptorSet0.vp_c9)._m0[129].z, _1338);
    float _1548 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1518);
    float _1550 = _1500 * 6.283185482025146484375;
    float _1552 = cos(_1550);
    float _1554 = _1516 * _1016;
    bool _1556 = !_1502;
    float _1558 = _1544;
    float _1560 = _1462;
    if (!_1556)
    {
        float _1562 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1564 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1566 = _1464 + _1564;
        float _1568 = _1544 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1570 = rsqrt(_1446);
        float _1572 = _1566 * _1562;
        float _1574 = _1572 * 0.15915493667125701904296875;
        float _1576 = _1574 * 6.283185482025146484375;
        float _1578 = sin(_1576);
        float _1580 = _1574 * 6.283185482025146484375;
        float _1582 = cos(_1580);
        float _1584 = fma(_1578, _1568, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1586 = _1570 * _1584;
        float _1588 = _1582 + (-1.0);
        float _1590 = fma(_1402, _1586, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1592 = fma(_1406, _1586, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1594 = _1588 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1596 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1598 = _1590 + _1596;
        float _1600 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1602 = _1592 + _1600;
        float _1604 = fma(_1544, _1582, _1594);
        float _1606 = _1598 * _1598;
        float _1608 = _1602 * _1602;
        _1558 = _1604;
        _1418 = _1606;
        _1442 = _1608;
        _1388 = _1590;
        _1390 = _1592;
    }
    float _1610 = _1558;
    float _1612 = _1418;
    float _1614 = _1442;
    float _1616 = _1388;
    float _1618 = _1390;
    float _1620 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1622 = _1610 + _1620;
    float _1624 = _1532 * _990;
    float _1626 = _1552 * _990;
    float _1628 = -_1542;
    float _1630 = fma(_1516, _1214, _1628);
    float _1632 = fma(_1622, _1622, _1612);
    float _1634 = fma(_1496, _1214, _1554);
    float _1636 = fma(_1532, _1250, _1626);
    float _1638 = -_1624;
    float _1640 = fma(_1552, _1250, _1638);
    float _1642 = _1632 + _1614;
    float _1644 = fma(_1526, _1630, _1536);
    float _1646 = -_1548;
    float _1648 = fma(_1524, _1636, _1646);
    float _1650 = -_1520;
    float _1652 = fma(_1528, _1634, _1650);
    float _1654 = fma(_1522, _1640, _1540);
    float _1656 = _1468 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1658 = sqrt(_1642);
    float _1660 = _1466 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1662 = _1546 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1664 = _1358 + 0.5;
    float _1666 = _1308 + 0.5;
    float _1668 = _1462 + 0.5;
    float _1670 = _1458 + 0.5;
    float _1672 = _1656 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1674 = _1660 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1676 = _1662 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1678 = _1644 + 0.5;
    float _1680 = _1652 + 0.5;
    float _1682 = _1654 + 0.5;
    float _1684 = _1648 + 0.5;
    out.m_61.x = 1.0;
    out.m_61.y = 1.0;
    out.m_61.z = 1.0;
    bool _1686 = _1658 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1688 = isnan(_1658);
    bool _1690 = _1686 || _1688;
    bool _1692 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1694 = _1690 || _1692;
    out.m_63.x = _1668;
    out.m_63.y = _1670;
    out.m_65.x = _1672;
    out.m_65.y = _1674;
    out.m_65.z = _1676;
    out.m_67.x = _1664;
    out.m_67.y = _1666;
    out.m_67.z = _1678;
    out.m_67.w = _1680;
    float _1696 = _1648;
    float _1698 = _1680;
    if (!_1694)
    {
        _1560 = 1.0;
    }
    float _1700 = _1560;
    out.m_69.x = _1682;
    out.m_69.y = _1684;
    bool _1702 = !_1694;
    float _1704 = _1700;
    if (!_1702)
    {
        bool _1706 = _1658 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1708 = isnan(_1658);
        bool _1710 = _1706 || _1708;
        bool _1712 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1714 = _1710 || _1712;
        if (!_1714)
        {
            float _1716 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1718 = _1658 + _1716;
            float _1720 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1722 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1720;
            float _1724 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1726 = _1724 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1728 = 1.0 / _1722;
            float _1730 = _1718 * _1728;
            float _1732 = fma(_1730, _1726, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1704 = _1732;
            _1734 = true;
        }
        else
        {
            bool _1736 = _1658 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1738 = isnan(_1658);
            bool _1740 = _1736 || _1738;
            bool _1742 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1744 = _1740 || _1742;
            if (!_1744)
            {
                float _1746 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1748 = _1658 + _1746;
                float _1750 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1752 = _1750 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1754 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1756 = _1754 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1758 = 1.0 / _1752;
                float _1760 = _1748 * _1758;
                float _1762 = fma(_1760, _1756, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1704 = _1762;
                _1734 = true;
            }
            else
            {
                _1704 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1734 = false;
    float _1764 = _1704;
    float _1766 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1768 = _1610 + _1766;
    float _1770 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1772 = _1616 + _1770;
    float _1774 = fma(_1768, _1764, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1776 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1778 = _1618 + _1776;
    float _1780 = fma(_1772, _1764, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1782 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1784 = _1774 + _1782;
    float _1786 = fma(_1778, _1764, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1788 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1790 = _1780 + _1788;
    float _1792 = _1784 * _1784;
    float _1794 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1796 = _1786 + _1794;
    float _1798 = fma(_1790, _1790, _1792);
    float _1800 = fma(_1796, _1796, _1798);
    float _1802 = rsqrt(_1800);
    float _1804 = _1802 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1806 = _1790 * _1804;
    float _1808 = _1796 * _1804;
    float _1810 = _1806 * _1806;
    float _1812 = _1808 * _1808;
    float _1814 = _1810 + _1812;
    float _1816 = sqrt(_1814);
    bool _1818 = _1816 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1820 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1822 = _1816 + _1820;
    float _1824 = _1796;
    float _1826 = _1814;
    float _1828 = _1822;
    float _1830 = _1784;
    float _1832 = _1806;
    if (_1818)
    {
        float _1834 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1824 = _1834;
    }
    float _1836 = _1824;
    if (_1818)
    {
        float _1838 = rsqrt(_1814);
        _1826 = _1838;
    }
    float _1840 = _1826;
    if (_1818)
    {
        float _1842 = _1822 * _1836;
        _1828 = _1842;
    }
    float _1844 = _1828;
    if (_1818)
    {
        float _1846 = _1844 * 0.15915493667125701904296875;
        _1696 = _1846;
    }
    float _1848 = _1696;
    float _1850 = _1802;
    if (_1818)
    {
        float _1852 = _1848 * 6.283185482025146484375;
        float _1854 = sin(_1852);
        _1850 = _1854;
    }
    float _1856 = _1850;
    float _1858 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1860 = precise::max(0.0, _1858);
    float _1862 = _1674;
    float _1864 = _1860;
    float _1866 = _1858;
    if (_1818)
    {
        float _1868 = _1848 * 6.283185482025146484375;
        float _1870 = cos(_1868);
        _1862 = _1870;
    }
    float _1872 = _1862;
    float _1874 = -_1804;
    float _1876 = -_1860;
    float _1878 = fma(_1784, _1874, _1876);
    if (!_1818)
    {
        _1864 = _1808;
    }
    float _1880 = _1864;
    float _1882 = _1880;
    if (_1818)
    {
        float _1884 = _1878 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1866 = _1884;
    }
    float _1886 = _1866;
    float _1888 = _1856;
    float _1890 = _1886;
    if (_1818)
    {
        float _1892 = fma(_1856, _1886, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1888 = _1892;
    }
    float _1894 = _1888;
    float _1896 = _1894;
    if (_1818)
    {
        float _1898 = _1872 + (-1.0);
        _1890 = _1898;
    }
    float _1900 = _1890;
    float _1902 = _1900;
    if (_1818)
    {
        float _1904 = _1840 * _1894;
        _1698 = _1904;
    }
    float _1906 = _1698;
    if (!_1818)
    {
        _1896 = _1878;
    }
    float _1908 = _1896;
    float _1910 = sqrt(_1800);
    float _1912 = _1908;
    if (_1818)
    {
        float _1914 = _1900 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1830 = _1914;
    }
    float _1916 = _1830;
    float _1918 = _1916;
    if (_1818)
    {
        float _1920 = _1806 * _1906;
        _1832 = _1920;
    }
    float _1922 = _1832;
    if (!_1818)
    {
        _1902 = _1810;
    }
    float _1924 = _1902;
    float _1926 = _1924;
    if (_1818)
    {
        float _1928 = _1808 * _1906;
        _1882 = _1928;
    }
    float _1930 = _1882;
    if (_1818)
    {
        float _1932 = fma(_1878, _1872, _1916);
        _1912 = _1932;
    }
    float _1934 = _1912;
    if (_1818)
    {
        float _1936 = _1922 * _1922;
        _1926 = _1936;
    }
    float _1938 = _1926;
    if (!_1818)
    {
        _1918 = _1812;
    }
    float _1940 = _1918;
    float _1942 = _1940;
    if (_1818)
    {
        float _1944 = _1930 * _1930;
        _1942 = _1944;
    }
    float _1946 = _1942;
    float _1948 = fma(_1934, _1934, _1938);
    float _1950 = _1774 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1952 = _1948 + _1946;
    float _1954 = fma(_1780, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1950);
    float _1956 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1958 = fma(_1910, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1956);
    float _1960 = precise::clamp(_1958, 0.0, 1.0);
    float _1962 = _1774 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1964 = rsqrt(_1952);
    float _1966 = fma(_1786, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1954);
    float _1968 = -_1960;
    float _1970 = _1968 + 1.0;
    float _1972 = _1774 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1974 = fma(_1780, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1962);
    float _1976 = _1966 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1978 = _1774 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1980 = fma(_1780, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1972);
    float _1982 = abs(_1970);
    float _1984 = log2(_1982);
    float _1986 = fma(_1786, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1974);
    float _1988 = fma(_1780, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1978);
    float _1990 = fma(_1786, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1980);
    float _1992 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1994 = _1986 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1996 = fma(_1786, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1988);
    float _1998 = _1990 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2000 = _1964 * _1922;
    float _2002 = _1994 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2004 = _1964 * _1934;
    float _2006 = _1976 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2008 = _2000 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2010 = fma(_1998, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2002);
    float _2012 = _1964 * _1930;
    float _2014 = _1996 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2016 = _1984 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2018 = -_2008;
    float _2020 = fma(_2004, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2018);
    float _2022 = fma(_1976, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2010);
    float _2024 = -_2006;
    float _2026 = fma(_2024, _1992, 1.0);
    float _2028 = _1994 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2030 = -_2012;
    float _2032 = fma(_2030, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2020);
    float _2034 = exp2(_2016);
    float _2036 = fma(_2014, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2022);
    float _2038 = _1994 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2040 = fma(_2032, -0.5, 0.5);
    float _2042 = fma(_1998, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2028);
    float _2044 = fma(_2032, 0.5, 0.5);
    float _2046 = fma(_1998, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2038);
    float _2048 = _2004 + 1.0;
    float _2050 = log2(_2026);
    float _2052 = fma(_1976, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2042);
    float _2054 = fma(_1976, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2046);
    float _2056 = fma(_2044, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2058 = fma(_2044, _2056, -0.212114393711090087890625);
    float _2060 = 1.0 / _2036;
    float _2062 = -_2004;
    float _2064 = fma(_2034, _2048, _2062);
    float _2066 = fma(_2014, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2054);
    float _2068 = fma(_2014, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2052);
    float _2070 = fma(_2044, _2058, 1.570728778839111328125);
    float _2072 = fma(_2064, 0.5, 0.5);
    float _2074 = sqrt(_2040);
    float _2076 = _2050 * 0.693147182464599609375;
    float _2078 = _2066 * _2060;
    float _2080 = _2068 * _2060;
    float _2082 = _2076 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2084 = fma(_2078, 0.5, 0.5);
    float _2086 = fma(_2080, -0.5, 0.5);
    float _2088 = _2074 * 0.636619746685028076171875;
    float3 _5547 = float3(_2084, _2086, _2082);
    float _2090 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5547, float3(0.0), isnan(_5547)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5547, float3(0.0), isnan(_5547)), level(0.0)).x;
    float3 _5558 = float3(_2084, _2086, _2082);
    float4 _2093 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5558, float3(0.0), isnan(_5558)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5558, float3(0.0), isnan(_5558)), level(0.0)).xyzw;
    float _2095 = _2093.x;
    float _2097 = _2093.y;
    float _2099 = _2093.z;
    float _2101 = _2093.w;
    float _2103 = -_2070;
    float _2105 = fma(_2088, _2103, 1.0);
    float2 _5580 = float2(_2105, _2072);
    float3 _2109 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5580, float2(0.0), isnan(_5580)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5580, float2(0.0), isnan(_5580)), level(0.0)).xyz;
    float _2111 = _2109.x;
    float _2113 = _2109.y;
    float _2115 = _2109.z;
    float _2117 = _1984 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2119 = _1994 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2121 = fma(_1998, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2119);
    float _2123 = exp2(_2117);
    float _2125 = _2036 * 0.5;
    float _2127 = fma(_1976, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2121);
    float _2129 = fma(_2068, -0.5, _2125);
    float _2131 = _2066 + _2036;
    float _2133 = fma(_2014, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2127);
    float _2135 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2137 = _2131 * 0.5;
    float _2139 = _2133 + _2036;
    out.gl_Position.x = _2066;
    out.gl_Position.y = _2068;
    out.gl_Position.z = _2133;
    out.gl_Position.w = _2036;
    float _2141 = _2139 * 0.5;
    float _2143 = -_2123;
    float _2145 = _2143 + 1.0;
    out.m_47.x = _2135;
    float _2147 = _2145 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_71.x = _2137;
    out.m_71.y = _2129;
    out.m_71.z = _2141;
    out.m_71.w = _2036;
    float _2149 = -_2147;
    float _2151 = _2149 + 1.0;
    float _2153 = _2147 * _2090;
    float _2155 = _2101 * _2153;
    float _2157 = _2115 * _2153;
    float _2159 = fma(_2111, _2155, _2095);
    float _2161 = fma(_2113, _2155, _2097);
    float _2163 = _2101 * _2151;
    float _2165 = fma(_2101, _2157, _2099);
    out.m_73.x = _2159;
    out.m_73.y = _2161;
    out.m_73.z = _2165;
    out.m_73.w = _2163;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1734 = false;
    bool _518 = false;
    bool _376 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _87 = in.m_44.w;
    float _89 = trunc(_87);
    int _92 = int(_89);
    bool _96 = _92 >= 1;
    float _98 = 0.0;
    if (!_96)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _100 = _98;
    float _102 = _100;
    if (!_96)
    {
        out.m_47.x = 0.0;
    }
    int _104 = 0;
    if (!_96)
    {
        float _106 = _100 * 5.0;
        _104 = as_type<int>(_106);
    }
    int _108 = _104;
    int _110 = _108;
    if (!_96)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2222 = as_type<float>(_108);
        out.gl_Position.z = _2222;
    }
    if (!_96)
    {
        return out;
    }
    float _112 = in.m_49.w;
    bool _114 = _112 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _116 = isnan(_112);
    bool _118 = _114 || _116;
    bool _120 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _122 = _118 || _120;
    float _124 = -_112;
    float _126 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_122)
    {
        float _128 = float(_92);
        _102 = _128;
    }
    float _130 = _102;
    bool _132 = _126 >= _130;
    bool _134 = !_122;
    bool _136 = _132 || _134;
    float _138 = _130;
    if (_136)
    {
        _138 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _138;
    if (_136)
    {
        out.m_47.x = 0.0;
    }
    if (_136)
    {
        float _142 = _140 * 5.0;
        _110 = as_type<int>(_142);
    }
    int _144 = _110;
    if (_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2291 = as_type<float>(_144);
        out.gl_Position.z = _2291;
    }
    if (_136)
    {
        return out;
    }
    float _146 = in.m_51.x;
    float _148 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _150 = _126 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    bool _152 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _154 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _156 = _152 || _154;
    bool _158 = isnan(1.0);
    bool _160 = _156 || _158;
    int _162 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _164 = _162 != 0;
    float _166 = _150 * _148;
    float _168 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[20].x, _166);
    float _170 = in.m_49.x;
    float _172 = in.m_49.y;
    float _174 = in.m_49.z;
    float _176 = _168 * 6.283185482025146484375;
    float _178 = floor(_168);
    float _180 = _176 * 0.15915493667125701904296875;
    float _182 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _184 = 0.0;
    float _186 = _182;
    float _188 = _146;
    if (!_160)
    {
        float _190 = _182 * _182;
        float _192 = _190 * 0.5;
        _184 = _192;
    }
    float _194 = _184;
    float _196 = _180 * 6.283185482025146484375;
    float _198 = cos(_196);
    float _200 = _194;
    if (!_160)
    {
        float _202 = _194 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _200 = _202;
    }
    float _204 = _200;
    float _206 = -_178;
    float _208 = _168 + _206;
    bool _210 = !_160;
    float _212 = _204;
    if (!_210)
    {
        float _214 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _216 = log2(_214);
        float _218 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _220 = _218 + 1.0;
        float _222 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _224 = _182 * _216;
        float _226 = 1.0 / _220;
        float _228 = _222 * 0.693147182464599609375;
        float _230 = exp2(_224);
        float _232 = 1.0 / _228;
        float _234 = _230 + (-1.0);
        float _236 = -_234;
        float _238 = fma(_236, _232, _182);
        float _240 = _238 * _226;
        float _242 = _240 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _212 = _242;
    }
    float _244 = _212;
    bool _246 = !_160;
    if (!_246)
    {
        float _248 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _250 = log2(_248);
        float _252 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _254 = _252 + 1.0;
        float _256 = 1.0 / _254;
        float _258 = _182 * _250;
        float _260 = exp2(_258);
        float _262 = -_260;
        float _264 = _262 + 1.0;
        float _266 = _264 * _256;
        _186 = _266;
    }
    float _268 = _186;
    float _270 = in.m_53.w;
    int _272 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _274 = _272 != 0;
    int _276 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _278 = _276 != 0;
    float _280 = -_208;
    float _282 = fma(_280, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _284 = _208 < 0.5;
    float _286 = float(_284);
    float _288 = fma(_198, 0.5, 0.5);
    float _290 = in.m_44.x;
    float _292 = in.m_44.y;
    float _294 = in.m_44.z;
    bool _296 = !_274;
    int _298 = _296 ? 0 : 1;
    float _300 = _244 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _302 = -_286;
    float _304 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _306 = !_164;
    int _308 = _306 ? 0 : 1;
    float _310 = -_288;
    float _312 = fma(_310, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _314 = abs(_298);
    float _316 = fma(_268, _170, _300);
    int _318 = abs(_308);
    float _320 = _244 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _322 = !_278;
    int _324 = _322 ? 0 : 1;
    float _326 = fma(_268, _172, _320);
    bool _328 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _330 = abs(_324);
    float _332 = _244 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _334 = float(_314);
    float _336 = float(_318);
    float _338 = fma(_268, _174, _332);
    float _340 = abs(_282);
    float _342 = _334 * _340;
    float _344 = fma(_316, _270, _290);
    float _346 = float(_330);
    float _348 = fma(_336, _312, _342);
    float _350 = fma(_326, _270, _292);
    float _352 = fma(_338, _270, _294);
    float _354 = abs(_304);
    float _356 = fma(_346, _354, _348);
    bool _358 = !_328;
    float _374;
    if (!_358)
    {
        float _360 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _362 = _146 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _364 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[12].x, _126);
        float _366 = _364 * _360;
        float _368 = floor(_366);
        float _370 = -_368;
        float _372 = _366 + _370;
        _374 = _372;
        _376 = true;
    }
    else
    {
        float _378 = float(_92);
        float _380 = 1.0 / _378;
        float _382 = _126 * _380;
        _374 = _382;
    }
    _376 = false;
    float _384 = _374;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _388 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _386;
    float _390 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _392 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _394 = _384 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _396 = isnan(_384);
    bool _398 = _394 || _396;
    bool _400 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _402 = _398 || _400;
    float _404 = float(_402);
    float _406 = 1.0 / _388;
    float _408 = _390 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _410 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _414 = _384 + _412;
    float _416 = _392 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _418 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _420 = _410 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _422 = -_404;
    float _424 = _422 + 1.0;
    bool _426 = _384 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _428 = isnan(_384);
    bool _430 = _426 || _428;
    bool _432 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _434 = _430 || _432;
    float _436 = float(_434);
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _440 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _438;
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _444 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _442;
    out.m_55.x = _408;
    out.m_55.y = _420;
    out.m_55.z = _416;
    out.m_55.w = _418;
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _448 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _446;
    float _450 = _414 * _406;
    float _452 = _436 * _424;
    float _454 = in.m_53.x;
    float _456 = in.m_53.y;
    float _458 = in.m_53.z;
    bool _460 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _462 = fma(_440, _450, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _464 = fma(_444, _450, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _466 = fma(_448, _450, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _468 = -_436;
    float _470 = _468 + 1.0;
    float _472 = _462 * _452;
    float _474 = _464 * _452;
    float _476 = _466 * _452;
    float _478 = fma(_470, (*spvDescriptorSet0.vp_c9)._m0[143].x, _472);
    float _480 = fma(_470, (*spvDescriptorSet0.vp_c9)._m0[143].y, _474);
    float _482 = fma(_470, (*spvDescriptorSet0.vp_c9)._m0[143].z, _476);
    float _484 = fma(_404, (*spvDescriptorSet0.vp_c9)._m0[144].x, _478);
    float _486 = fma(_404, (*spvDescriptorSet0.vp_c9)._m0[144].y, _480);
    float _488 = fma(_404, (*spvDescriptorSet0.vp_c9)._m0[144].z, _482);
    float _490 = _484 * _454;
    float _492 = _486 * _456;
    float _494 = _488 * _458;
    bool _496 = !_460;
    bool _498 = _460;
    int _500 = as_type<int>(_458);
    float _516;
    if (!_496)
    {
        float _502 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _504 = _146 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _506 = fma(_504, (*spvDescriptorSet0.vp_c9)._m0[11].z, _126);
        float _508 = _506 * _502;
        float _510 = floor(_508);
        float _512 = -_510;
        float _514 = _508 + _512;
        _516 = _514;
        _518 = true;
    }
    else
    {
        float _520 = float(_92);
        float _522 = 1.0 / _520;
        float _524 = _126 * _522;
        _516 = _524;
    }
    _518 = false;
    float _526 = _516;
    float _528 = in.m_57.x;
    float _530 = _356 * _494;
    float _532 = _356 * _490;
    float _534 = in.m_51.w;
    int _536 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _538 = _536 != 0;
    float _540 = _356 * _492;
    int _542 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _544 = _542 != 0;
    float _546 = in.m_57.y;
    int _548 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _550 = _548 != 0;
    float _552 = _350 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _554 = in.m_51.z;
    float _556 = fma(_344, (*spvDescriptorSet0.vp_c10)._m0[6].x, _552);
    float _558 = in.m_51.y;
    float _560 = _532 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    if (_538)
    {
        bool _562 = _146 > 0.5;
        _498 = _562;
    }
    bool _564 = _498;
    float _566 = in.m_59.x;
    float _568 = in.m_59.y;
    float _570 = in.m_59.z;
    float _572 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _574 = _530 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _576 = _528;
    if (_538)
    {
        float _578 = -_528;
        float _580 = _578 + 1.0;
        _500 = as_type<int>(_580);
    }
    int _582 = _500;
    float _584 = 0.0;
    if (!_538)
    {
        _584 = _528;
    }
    float _586 = _584;
    float _588 = _540 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _590 = _534 > 0.5;
    float _592 = _586;
    if (_538)
    {
        float _594 = _564 ? as_type<float>(_582) : _528;
        _592 = _594;
    }
    float _596 = _592;
    float _598 = -_546;
    float _600 = _598 + 1.0;
    float _602 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _604 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _602;
    float _606 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _608 = _606 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _610 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _612 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _610;
    bool _614 = _554 > 0.5;
    float _616 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _618 = _616 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    int _620 = _590 ? as_type<int>(_600) : as_type<int>(_546);
    float _622 = 1.0 / _604;
    bool _624 = _558 > 0.5;
    float _626 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _628 = _614 ? as_type<int>(_600) : as_type<int>(_546);
    float _630 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _566);
    int _632 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _634 = _632 != 0;
    int _636 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _638 = _636 != 0;
    int _640 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _642 = _640 != 0;
    float _644 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _646 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _644;
    int _648 = _624 ? as_type<int>(_600) : as_type<int>(_546);
    float _650 = 1.0 / _608;
    float _652 = _550 ? as_type<float>(_628) : _546;
    float _654 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _568);
    float _656 = _638 ? as_type<float>(_620) : _546;
    float _658 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _570);
    float _660 = _634 ? as_type<float>(_648) : _546;
    float _662 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _664 = _662 + (*spvDescriptorSet0.vp_c9)._m0[129].w;
    int _666 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _668 = _666 != 0;
    float _670 = _560 * _630;
    int _672 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _674 = _672 != 0;
    float _676 = _350 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _678 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _680 = _678 != 0;
    float _682 = _350 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _684 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _686 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _684;
    float _688 = fma(_344, (*spvDescriptorSet0.vp_c10)._m0[4].x, _676);
    float _690 = _146 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _692 = fma(_344, (*spvDescriptorSet0.vp_c10)._m0[5].x, _682);
    float _694 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _696 = _694 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _698 = fma(_352, (*spvDescriptorSet0.vp_c10)._m0[4].z, _688);
    float _700 = 1.0 / _686;
    float _702 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _704 = _526 + _702;
    float _706 = -_572;
    float _708 = fma(_690, 2.0, _706);
    float _710 = _574 * _658;
    float _712 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _714 = _526 + _712;
    float _716 = _588 * _654;
    float _718 = _558 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _720 = 1.0 / _696;
    float _722 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _724 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _722;
    float _726 = _714 * _650;
    float _728 = fma(_718, -2.0, _626);
    float _730 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _732 = _730 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _734 = 1.0 / _646;
    float _736 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _738 = _526 + _736;
    float _740 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _742 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _740;
    float _744 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _746 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _744;
    float _748 = _738 * _622;
    float _750 = _642 ? as_type<float>(_628) : _546;
    float _752 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _754 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _752;
    float _756 = _704 * _720;
    float _758 = 1.0 / _664;
    float _760 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _762 = _526 + _760;
    float _764 = fma(_612, _748, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _766 = fma(_724, _748, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _768 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _770 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _768;
    float _772 = _762 * _700;
    float _774 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _776 = _526 + _774;
    float _778 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _780 = _526 + _778;
    float _782 = fma(_770, _748, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _784 = _776 * _734;
    float _786 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _788 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _790 = _788 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _792 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _794 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _792;
    float _796 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _798 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _796;
    float _800 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _802 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _800;
    float _804 = _780 * _758;
    float _806 = fma(_618, _726, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _808 = fma(_732, _726, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _810 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _812 = fma(_790, _726, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _814 = fma(_794, _772, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _816 = fma(_742, _772, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _818 = fma(_798, _772, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _820 = fma(_802, _784, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    float _822 = fma(_746, _784, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    float _824 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _826 = _824 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _828 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _830 = _828 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _832 = fma(_754, _784, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    bool _834 = _526 >= (*spvDescriptorSet0.vp_c9)._m0[129].w;
    bool _836 = isnan(_526);
    bool _838 = _834 || _836;
    bool _840 = isnan((*spvDescriptorSet0.vp_c9)._m0[129].w);
    bool _842 = _838 || _840;
    float _844 = float(_842);
    float _846 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _848 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _850 = _848 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _852 = -(*spvDescriptorSet0.vp_c9)._m0[128].x;
    float _854 = _852 + (*spvDescriptorSet0.vp_c9)._m0[129].x;
    float _856 = -(*spvDescriptorSet0.vp_c9)._m0[128].y;
    float _858 = _856 + (*spvDescriptorSet0.vp_c9)._m0[129].y;
    float _860 = fma(_352, (*spvDescriptorSet0.vp_c10)._m0[5].z, _692);
    bool _862 = _526 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _864 = isnan(_526);
    bool _866 = _862 || _864;
    bool _868 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _870 = _866 || _868;
    float _872 = float(_870);
    float _874 = -(*spvDescriptorSet0.vp_c9)._m0[128].z;
    float _876 = _874 + (*spvDescriptorSet0.vp_c9)._m0[129].z;
    float _878 = fma(_352, (*spvDescriptorSet0.vp_c10)._m0[6].z, _556);
    float _880 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _882 = fma(_826, _756, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _884 = fma(_830, _756, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _886 = fma(_850, _756, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _888 = -_844;
    float _890 = _888 + 1.0;
    float _892 = fma(_854, _804, (*spvDescriptorSet0.vp_c9)._m0[128].x);
    float _894 = fma(_858, _804, (*spvDescriptorSet0.vp_c9)._m0[128].y);
    float _896 = fma(_876, _804, (*spvDescriptorSet0.vp_c9)._m0[128].z);
    bool _898 = _526 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _900 = isnan(_526);
    bool _902 = _898 || _900;
    bool _904 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _906 = _902 || _904;
    float _908 = float(_906);
    float _910 = -_872;
    float _912 = _910 + 1.0;
    bool _914 = _526 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _916 = isnan(_526);
    bool _918 = _914 || _916;
    bool _920 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _922 = _918 || _920;
    float _924 = float(_922);
    float _926 = _872 * _890;
    float _928 = _786 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _930 = _810 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _932 = _908 * _912;
    float _934 = -_908;
    float _936 = _934 + 1.0;
    bool _938 = _526 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _940 = isnan(_526);
    bool _942 = _938 || _940;
    bool _944 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _946 = _942 || _944;
    float _948 = float(_946);
    float _950 = -_924;
    float _952 = _950 + 1.0;
    float _954 = _846 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _956 = _924 * _936;
    bool _958 = _526 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _960 = isnan(_526);
    bool _962 = _958 || _960;
    bool _964 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _966 = _962 || _964;
    float _968 = float(_966);
    float _970 = _880 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _972 = _948 * _952;
    float _974 = -_948;
    float _976 = _974 + 1.0;
    bool _978 = _526 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _980 = isnan(_526);
    bool _982 = _978 || _980;
    bool _984 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _986 = _982 || _984;
    float _988 = float(_986);
    float _990 = fma(_750, _970, -0.5);
    float _992 = _716 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _994 = _968 * _976;
    float _996 = -_968;
    float _998 = _996 + 1.0;
    float _1000 = _716 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1002 = _716 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1004 = fma(_652, _954, -0.5);
    float _1006 = _988 * _998;
    float _1008 = fma(_670, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1000);
    float _1010 = fma(_670, (*spvDescriptorSet0.vp_c8)._m0[25].x, _992);
    float _1012 = fma(_670, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1002);
    float _1014 = fma(_660, _928, -0.5);
    float _1016 = fma(_656, _930, -0.5);
    float _1018 = _764 * _1006;
    float _1020 = _782 * _1006;
    float _1022 = fma(_710, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1008);
    float _1024 = fma(_710, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1010);
    float _1026 = fma(_710, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1012);
    float _1028 = -_988;
    float _1030 = _1028 + 1.0;
    float _1032 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1034 = as_type<int>(_880);
    float _1036 = _766;
    float _1038 = _670;
    float _1040 = _1008;
    int _1042 = as_type<int>(_1020);
    float _1044 = _1006;
    float _1046 = _882;
    float _1048 = _932;
    float _1050 = _1004;
    if (_544)
    {
        float _1052 = -_528;
        float _1054 = _1052 + 1.0;
        _1034 = as_type<int>(_1054);
    }
    int _1056 = _1034;
    int _1058 = 0;
    int _1060 = _1056;
    if (_668)
    {
        float _1062 = -_528;
        float _1064 = _1062 + 1.0;
        _1058 = as_type<int>(_1064);
    }
    int _1066 = _1058;
    float _1068 = _766 * _1006;
    float _1070 = _1068;
    if (!_544)
    {
        _1036 = _528;
    }
    float _1072 = _1036;
    float _1074 = fma(_1030, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1018);
    float _1076 = _1072;
    if (!_668)
    {
        _1038 = _528;
    }
    float _1078 = _1038;
    float _1080 = fma(_1030, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1068);
    float _1082 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1084 = _1078;
    if (_544)
    {
        float _1086 = _614 ? as_type<float>(_1056) : _528;
        _1076 = _1086;
    }
    float _1088 = _1076;
    if (_674)
    {
        float _1090 = -_528;
        float _1092 = _1090 + 1.0;
        _1060 = as_type<int>(_1092);
    }
    int _1094 = _1060;
    int _1096 = _1094;
    if (_668)
    {
        float _1098 = _624 ? as_type<float>(_1066) : _528;
        _1084 = _1098;
    }
    float _1100 = _1084;
    float _1102 = fma(_1030, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1020);
    if (!_674)
    {
        _1040 = _528;
    }
    float _1104 = _1040;
    float _1106 = _1104;
    if (_674)
    {
        float _1108 = _624 ? as_type<float>(_1094) : _528;
        _1106 = _1108;
    }
    float _1110 = _1106;
    float _1112 = (*spvDescriptorSet0.vp_c9)._m0[94].z + (*spvDescriptorSet0.vp_c9)._m0[94].y;
    if (_680)
    {
        _1096 = 0;
    }
    int _1114 = _1096;
    int _1116 = _1114;
    if (_680)
    {
        _1042 = 0;
    }
    int _1118 = _1042;
    int _1120 = _1118;
    if (_680)
    {
        _1044 = _146;
    }
    float _1122 = _1044;
    float _1124 = _1122;
    if (_680)
    {
        _1070 = _558;
    }
    float _1126 = _1070;
    float _1128 = _1126;
    if (_680)
    {
        _576 = _554;
    }
    float _1130 = _576;
    float _1132 = _1130;
    if (!_680)
    {
        float _1134 = _146 * 3.1415927410125732421875;
        float _1136 = _1134 * 0.15915493667125701904296875;
        float _1138 = _558 * 3.1415927410125732421875;
        float _1140 = _1138 * 0.15915493667125701904296875;
        float _1142 = _554 * 3.1415927410125732421875;
        float _1144 = _1136 * 6.283185482025146484375;
        float _1146 = sin(_1144);
        float _1148 = _1142 * 0.15915493667125701904296875;
        float _1150 = _1140 * 6.283185482025146484375;
        float _1152 = sin(_1150);
        float _1154 = _1148 * 6.283185482025146484375;
        float _1156 = sin(_1154);
        _1116 = 1;
        _1120 = 2;
        _1132 = _1156;
        _1124 = _1146;
        _1128 = _1152;
    }
    int _1158 = _1116;
    int _1160 = _1120;
    float _1162 = _1132;
    float _1164 = _1124;
    float _1166 = _1128;
    bool _1168 = _1158 != 1;
    float _1170 = fma(_806, _994, _1074);
    bool _1172 = _1160 != 2;
    float _1174 = _1032 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1176 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _1178 = fma(_1162, (*spvDescriptorSet0.vp_c9)._m0[94].z, _1112);
    float _1180 = fma(_808, _994, _1080);
    float _1182 = fma(_1174, _596, -0.5);
    float _1184 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _1186 = _1082 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1188 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _1190 = fma(_554, (*spvDescriptorSet0.vp_c9)._m0[79].z, _1184);
    float _1192 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _1194 = fma(_1164, (*spvDescriptorSet0.vp_c9)._m0[93].z, _1188);
    float _1196 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[79].x, _1190);
    float _1198 = _1164 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _1200 = fma(_812, _994, _1102);
    float _1202 = fma(_1166, (*spvDescriptorSet0.vp_c9)._m0[93].w, _1192);
    float _1204 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1206 = _1176 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _1208 = _1166 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _1210 = _1196 * (-0.15915493667125701904296875);
    float _1212 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _1214 = fma(_1186, _1088, -0.5);
    float _1216 = fma(_1206, _1110, -0.5);
    float _1218 = _1210 * 6.283185482025146484375;
    float _1220 = sin(_1218);
    float _1222 = fma(_1208, -2.0, _1212);
    float _1224 = _1024 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1226 = fma(_814, _972, _1170);
    float _1228 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _1230 = fma(_818, _972, _1200);
    float _1232 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[94].x, _1178);
    float _1234 = _1210 * 6.283185482025146484375;
    float _1236 = cos(_1234);
    float _1238 = -_1228;
    float _1240 = fma(_1198, 2.0, _1238);
    float _1242 = _1204 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1244 = _698 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1246 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1248 = _1022 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1250 = fma(_1242, _1100, -0.5);
    float _1252 = fma(_816, _972, _1180);
    float _1254 = _1220 * _1014;
    float _1256 = fma(_882, _956, _1226);
    float _1258 = _1232 * (-0.15915493667125701904296875);
    float _1260 = fma(_886, _956, _1230);
    float _1262 = fma(_884, _956, _1252);
    float _1264 = -_126;
    float _1266 = fma(_1264, (*spvDescriptorSet0.vp_c9)._m0[76].x, _708);
    float _1268 = _1258 * 6.283185482025146484375;
    float _1270 = sin(_1268);
    float _1272 = _1236 * _1014;
    float _1274 = -_1254;
    float _1276 = fma(_1236, _1182, _1274);
    float _1278 = fma(_820, _932, _1256);
    float _1280 = fma(_1220, _1182, _1272);
    float _1282 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1284 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1246);
    float _1286 = _1258 * 6.283185482025146484375;
    float _1288 = cos(_1286);
    float _1290 = fma(_558, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1282);
    float _1292 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1284);
    float _1294 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[76].y, _728);
    float _1296 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1298 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1290);
    float _1300 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1302 = fma(_822, _932, _1262);
    float _1304 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1296);
    float _1306 = -_1294;
    float _1308 = fma(_1298, _1280, _1306);
    float _1310 = _1298;
    float _1312 = _1292;
    float _1314 = _1256;
    float _1316 = _1270;
    if (!_1168)
    {
        _1310 = _146;
    }
    float _1318 = _1310;
    float _1320 = fma(_832, _932, _1260);
    float _1322 = fma(_558, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1300);
    float _1324 = fma(_892, _926, _1278);
    float _1326 = _1318;
    float _1328 = _1320;
    if (!_1168)
    {
        _1046 = _1318;
    }
    float _1330 = _1046;
    float _1332 = fma(_894, _926, _1302);
    float _1334 = _1330;
    if (_1168)
    {
        _1326 = _146;
    }
    float _1336 = _1326;
    float _1338 = fma(_896, _926, _1320);
    if (!_1168)
    {
        _188 = _558;
    }
    float _1340 = _188;
    float _1342 = _878 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1344 = _1026 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1346 = _1340;
    if (!_1168)
    {
        _1048 = _1340;
    }
    float _1348 = _1048;
    float _1350 = _1288 * _1004;
    float _1352 = _1348;
    if (_1168)
    {
        _1346 = _558;
    }
    float _1354 = _1346;
    float _1356 = _1270 * _1004;
    float _1358 = fma(_1292, _1276, _1266);
    if (!_1168)
    {
        _1050 = _1348;
    }
    float _1360 = _1050;
    float _1362 = -_1356;
    float _1364 = fma(_1288, _1216, _1362);
    float _1366 = _1360;
    if (_1168)
    {
        _1334 = _554;
    }
    float _1368 = _1334;
    float _1370 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    float _1372 = _1368;
    if (_1168)
    {
        _1352 = _1336;
    }
    float _1374 = _1352;
    float _1376 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    if (!_1168)
    {
        _1312 = _554;
    }
    float _1378 = _1312;
    float _1380 = _1244 + _1248;
    float _1382 = _1342 + _1344;
    float _1384 = fma(_1368, (*spvDescriptorSet0.vp_c9)._m0[84].z, _1370);
    float _1386 = _1378;
    float _1388 = _1380;
    float _1390 = _1382;
    if (!_1168)
    {
        _1314 = _1378;
    }
    float _1392 = _1314;
    float _1394 = fma(_1374, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1376);
    float _1396 = _1392;
    if (_1168)
    {
        _1386 = _1354;
    }
    float _1398 = _1386;
    float _1400 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1402 = _1380 + _1400;
    float _1404 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1406 = _1382 + _1404;
    float _1408 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1410 = fma(_1270, _1216, _1350);
    if (_1172)
    {
        _1316 = _1354;
    }
    float _1412 = _1316;
    float _1414 = _1402 * _1402;
    float _1416 = _1412;
    float _1418 = _1414;
    if (_1168)
    {
        _1366 = _1336;
    }
    float _1420 = _1366;
    float _1422 = fma(_1398, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1408);
    if (!_1172)
    {
        _1416 = _1336;
    }
    float _1424 = _1416;
    float _1426 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[92].w, _1202);
    if (_1172)
    {
        _1372 = _1336;
    }
    float _1428 = _1372;
    float _1430 = _1406 * _1406;
    float _1432 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[91].y, _1222);
    float _1434 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[92].z, _1194);
    float _1436 = -_126;
    float _1438 = fma(_1436, (*spvDescriptorSet0.vp_c9)._m0[91].x, _1240);
    float _1440 = _1428;
    float _1442 = _1430;
    if (_1172)
    {
        _1328 = _554;
    }
    float _1444 = _1328;
    float _1446 = _1414 + _1430;
    float _1448 = _1444;
    if (_1168)
    {
        _1396 = _1354;
    }
    float _1450 = _1396;
    float _1452 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[84].x, _1384);
    if (!_1172)
    {
        _1448 = _1354;
    }
    float _1454 = _1448;
    float _1456 = -_1432;
    float _1458 = fma(_1426, _1410, _1456);
    if (!_1172)
    {
        _1440 = _554;
    }
    float _1460 = _1440;
    float _1462 = fma(_1434, _1364, _1438);
    float _1464 = sqrt(_1446);
    float _1466 = fma(_844, (*spvDescriptorSet0.vp_c9)._m0[129].y, _1332);
    float _1468 = fma(_844, (*spvDescriptorSet0.vp_c9)._m0[129].x, _1324);
    float _1470 = _1452 * (-0.15915493667125701904296875);
    float _1472 = (*spvDescriptorSet0.vp_c9)._m0[89].z + (*spvDescriptorSet0.vp_c9)._m0[89].y;
    float _1474 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1476 = _1420 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1478 = fma(_1454, (*spvDescriptorSet0.vp_c9)._m0[89].z, _1472);
    float _1480 = -_1474;
    float _1482 = fma(_1476, 2.0, _1480);
    float _1484 = _1450 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1486 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1488 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[89].x, _1478);
    float _1490 = _1460 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1492 = fma(_1484, -2.0, _1486);
    float _1494 = _1470 * 6.283185482025146484375;
    float _1496 = sin(_1494);
    float _1498 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1500 = _1488 * (-0.15915493667125701904296875);
    bool _1502 = _1464 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1504 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1506 = _1424 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1508 = -_1498;
    float _1510 = fma(_1490, 2.0, _1508);
    float _1512 = _860 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1514 = _1470 * 6.283185482025146484375;
    float _1516 = cos(_1514);
    float _1518 = fma(_1506, -2.0, _1504);
    float _1520 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1492);
    float _1522 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1304);
    float _1524 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1322);
    float _1526 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1394);
    float _1528 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1422);
    float _1530 = _1500 * 6.283185482025146484375;
    float _1532 = sin(_1530);
    float _1534 = -_126;
    float _1536 = fma(_1534, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1482);
    float _1538 = -_126;
    float _1540 = fma(_1538, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1510);
    float _1542 = _1496 * _1016;
    float _1544 = _1512 + _1224;
    float _1546 = fma(_844, (*spvDescriptorSet0.vp_c9)._m0[129].z, _1338);
    float _1548 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1518);
    float _1550 = _1500 * 6.283185482025146484375;
    float _1552 = cos(_1550);
    float _1554 = _1516 * _1016;
    bool _1556 = !_1502;
    float _1558 = _1544;
    float _1560 = _1462;
    if (!_1556)
    {
        float _1562 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1564 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1566 = _1464 + _1564;
        float _1568 = _1544 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1570 = rsqrt(_1446);
        float _1572 = _1566 * _1562;
        float _1574 = _1572 * 0.15915493667125701904296875;
        float _1576 = _1574 * 6.283185482025146484375;
        float _1578 = sin(_1576);
        float _1580 = _1574 * 6.283185482025146484375;
        float _1582 = cos(_1580);
        float _1584 = fma(_1578, _1568, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1586 = _1570 * _1584;
        float _1588 = _1582 + (-1.0);
        float _1590 = fma(_1402, _1586, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1592 = fma(_1406, _1586, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1594 = _1588 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1596 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1598 = _1590 + _1596;
        float _1600 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1602 = _1592 + _1600;
        float _1604 = fma(_1544, _1582, _1594);
        float _1606 = _1598 * _1598;
        float _1608 = _1602 * _1602;
        _1558 = _1604;
        _1418 = _1606;
        _1442 = _1608;
        _1388 = _1590;
        _1390 = _1592;
    }
    float _1610 = _1558;
    float _1612 = _1418;
    float _1614 = _1442;
    float _1616 = _1388;
    float _1618 = _1390;
    float _1620 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1622 = _1610 + _1620;
    float _1624 = _1532 * _990;
    float _1626 = _1552 * _990;
    float _1628 = -_1542;
    float _1630 = fma(_1516, _1214, _1628);
    float _1632 = fma(_1622, _1622, _1612);
    float _1634 = fma(_1496, _1214, _1554);
    float _1636 = fma(_1532, _1250, _1626);
    float _1638 = -_1624;
    float _1640 = fma(_1552, _1250, _1638);
    float _1642 = _1632 + _1614;
    float _1644 = fma(_1526, _1630, _1536);
    float _1646 = -_1548;
    float _1648 = fma(_1524, _1636, _1646);
    float _1650 = -_1520;
    float _1652 = fma(_1528, _1634, _1650);
    float _1654 = fma(_1522, _1640, _1540);
    float _1656 = _1468 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1658 = sqrt(_1642);
    float _1660 = _1466 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1662 = _1546 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1664 = _1358 + 0.5;
    float _1666 = _1308 + 0.5;
    float _1668 = _1462 + 0.5;
    float _1670 = _1458 + 0.5;
    float _1672 = _1656 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1674 = _1660 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1676 = _1662 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1678 = _1644 + 0.5;
    float _1680 = _1652 + 0.5;
    float _1682 = _1654 + 0.5;
    float _1684 = _1648 + 0.5;
    out.m_61.x = 1.0;
    out.m_61.y = 1.0;
    out.m_61.z = 1.0;
    bool _1686 = _1658 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1688 = isnan(_1658);
    bool _1690 = _1686 || _1688;
    bool _1692 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1694 = _1690 || _1692;
    out.m_63.x = _1668;
    out.m_63.y = _1670;
    out.m_65.x = _1672;
    out.m_65.y = _1674;
    out.m_65.z = _1676;
    out.m_67.x = _1664;
    out.m_67.y = _1666;
    out.m_67.z = _1678;
    out.m_67.w = _1680;
    float _1696 = _1648;
    float _1698 = _1680;
    if (!_1694)
    {
        _1560 = 1.0;
    }
    float _1700 = _1560;
    out.m_69.x = _1682;
    out.m_69.y = _1684;
    bool _1702 = !_1694;
    float _1704 = _1700;
    if (!_1702)
    {
        bool _1706 = _1658 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1708 = isnan(_1658);
        bool _1710 = _1706 || _1708;
        bool _1712 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1714 = _1710 || _1712;
        if (!_1714)
        {
            float _1716 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1718 = _1658 + _1716;
            float _1720 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1722 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1720;
            float _1724 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1726 = _1724 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1728 = 1.0 / _1722;
            float _1730 = _1718 * _1728;
            float _1732 = fma(_1730, _1726, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1704 = _1732;
            _1734 = true;
        }
        else
        {
            bool _1736 = _1658 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1738 = isnan(_1658);
            bool _1740 = _1736 || _1738;
            bool _1742 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1744 = _1740 || _1742;
            if (!_1744)
            {
                float _1746 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1748 = _1658 + _1746;
                float _1750 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1752 = _1750 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1754 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1756 = _1754 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1758 = 1.0 / _1752;
                float _1760 = _1748 * _1758;
                float _1762 = fma(_1760, _1756, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1704 = _1762;
                _1734 = true;
            }
            else
            {
                _1704 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1734 = false;
    float _1764 = _1704;
    float _1766 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1768 = _1610 + _1766;
    float _1770 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1772 = _1616 + _1770;
    float _1774 = fma(_1768, _1764, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1776 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1778 = _1618 + _1776;
    float _1780 = fma(_1772, _1764, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1782 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1784 = _1774 + _1782;
    float _1786 = fma(_1778, _1764, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1788 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1790 = _1780 + _1788;
    float _1792 = _1784 * _1784;
    float _1794 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1796 = _1786 + _1794;
    float _1798 = fma(_1790, _1790, _1792);
    float _1800 = fma(_1796, _1796, _1798);
    float _1802 = rsqrt(_1800);
    float _1804 = _1802 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1806 = _1790 * _1804;
    float _1808 = _1796 * _1804;
    float _1810 = _1806 * _1806;
    float _1812 = _1808 * _1808;
    float _1814 = _1810 + _1812;
    float _1816 = sqrt(_1814);
    bool _1818 = _1816 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1820 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1822 = _1816 + _1820;
    float _1824 = _1796;
    float _1826 = _1814;
    float _1828 = _1822;
    float _1830 = _1784;
    float _1832 = _1806;
    if (_1818)
    {
        float _1834 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1824 = _1834;
    }
    float _1836 = _1824;
    if (_1818)
    {
        float _1838 = rsqrt(_1814);
        _1826 = _1838;
    }
    float _1840 = _1826;
    if (_1818)
    {
        float _1842 = _1822 * _1836;
        _1828 = _1842;
    }
    float _1844 = _1828;
    if (_1818)
    {
        float _1846 = _1844 * 0.15915493667125701904296875;
        _1696 = _1846;
    }
    float _1848 = _1696;
    float _1850 = _1802;
    if (_1818)
    {
        float _1852 = _1848 * 6.283185482025146484375;
        float _1854 = sin(_1852);
        _1850 = _1854;
    }
    float _1856 = _1850;
    float _1858 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1860 = precise::max(0.0, _1858);
    float _1862 = _1674;
    float _1864 = _1860;
    float _1866 = _1858;
    if (_1818)
    {
        float _1868 = _1848 * 6.283185482025146484375;
        float _1870 = cos(_1868);
        _1862 = _1870;
    }
    float _1872 = _1862;
    float _1874 = -_1804;
    float _1876 = -_1860;
    float _1878 = fma(_1784, _1874, _1876);
    if (!_1818)
    {
        _1864 = _1808;
    }
    float _1880 = _1864;
    float _1882 = _1880;
    if (_1818)
    {
        float _1884 = _1878 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1866 = _1884;
    }
    float _1886 = _1866;
    float _1888 = _1856;
    float _1890 = _1886;
    if (_1818)
    {
        float _1892 = fma(_1856, _1886, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1888 = _1892;
    }
    float _1894 = _1888;
    float _1896 = _1894;
    if (_1818)
    {
        float _1898 = _1872 + (-1.0);
        _1890 = _1898;
    }
    float _1900 = _1890;
    float _1902 = _1900;
    if (_1818)
    {
        float _1904 = _1840 * _1894;
        _1698 = _1904;
    }
    float _1906 = _1698;
    if (!_1818)
    {
        _1896 = _1878;
    }
    float _1908 = _1896;
    float _1910 = sqrt(_1800);
    float _1912 = _1908;
    if (_1818)
    {
        float _1914 = _1900 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1830 = _1914;
    }
    float _1916 = _1830;
    float _1918 = _1916;
    if (_1818)
    {
        float _1920 = _1806 * _1906;
        _1832 = _1920;
    }
    float _1922 = _1832;
    if (!_1818)
    {
        _1902 = _1810;
    }
    float _1924 = _1902;
    float _1926 = _1924;
    if (_1818)
    {
        float _1928 = _1808 * _1906;
        _1882 = _1928;
    }
    float _1930 = _1882;
    if (_1818)
    {
        float _1932 = fma(_1878, _1872, _1916);
        _1912 = _1932;
    }
    float _1934 = _1912;
    if (_1818)
    {
        float _1936 = _1922 * _1922;
        _1926 = _1936;
    }
    float _1938 = _1926;
    if (!_1818)
    {
        _1918 = _1812;
    }
    float _1940 = _1918;
    float _1942 = _1940;
    if (_1818)
    {
        float _1944 = _1930 * _1930;
        _1942 = _1944;
    }
    float _1946 = _1942;
    float _1948 = fma(_1934, _1934, _1938);
    float _1950 = _1774 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1952 = _1948 + _1946;
    float _1954 = fma(_1780, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1950);
    float _1956 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1958 = fma(_1910, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1956);
    float _1960 = precise::clamp(_1958, 0.0, 1.0);
    float _1962 = _1774 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1964 = rsqrt(_1952);
    float _1966 = fma(_1786, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1954);
    float _1968 = -_1960;
    float _1970 = _1968 + 1.0;
    float _1972 = _1774 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1974 = fma(_1780, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1962);
    float _1976 = _1966 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1978 = _1774 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1980 = fma(_1780, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1972);
    float _1982 = abs(_1970);
    float _1984 = log2(_1982);
    float _1986 = fma(_1786, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1974);
    float _1988 = fma(_1780, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1978);
    float _1990 = fma(_1786, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1980);
    float _1992 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1994 = _1986 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1996 = fma(_1786, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1988);
    float _1998 = _1990 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2000 = _1964 * _1922;
    float _2002 = _1994 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2004 = _1964 * _1934;
    float _2006 = _1976 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2008 = _2000 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2010 = fma(_1998, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2002);
    float _2012 = _1964 * _1930;
    float _2014 = _1996 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2016 = _1984 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2018 = -_2008;
    float _2020 = fma(_2004, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2018);
    float _2022 = fma(_1976, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2010);
    float _2024 = -_2006;
    float _2026 = fma(_2024, _1992, 1.0);
    float _2028 = _1994 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2030 = -_2012;
    float _2032 = fma(_2030, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2020);
    float _2034 = exp2(_2016);
    float _2036 = fma(_2014, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2022);
    float _2038 = _1994 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2040 = fma(_2032, -0.5, 0.5);
    float _2042 = fma(_1998, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2028);
    float _2044 = fma(_2032, 0.5, 0.5);
    float _2046 = fma(_1998, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2038);
    float _2048 = _2004 + 1.0;
    float _2050 = log2(_2026);
    float _2052 = fma(_1976, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2042);
    float _2054 = fma(_1976, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2046);
    float _2056 = fma(_2044, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2058 = fma(_2044, _2056, -0.212114393711090087890625);
    float _2060 = 1.0 / _2036;
    float _2062 = -_2004;
    float _2064 = fma(_2034, _2048, _2062);
    float _2066 = fma(_2014, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2054);
    float _2068 = fma(_2014, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2052);
    float _2070 = fma(_2044, _2058, 1.570728778839111328125);
    float _2072 = fma(_2064, 0.5, 0.5);
    float _2074 = sqrt(_2040);
    float _2076 = _2050 * 0.693147182464599609375;
    float _2078 = _2066 * _2060;
    float _2080 = _2068 * _2060;
    float _2082 = _2076 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2084 = fma(_2078, 0.5, 0.5);
    float _2086 = fma(_2080, -0.5, 0.5);
    float _2088 = _2074 * 0.636619746685028076171875;
    float3 _5547 = float3(_2084, _2086, _2082);
    float _2090 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5547, float3(0.0), isnan(_5547)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5547, float3(0.0), isnan(_5547)), level(0.0)).x;
    float3 _5558 = float3(_2084, _2086, _2082);
    float4 _2093 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5558, float3(0.0), isnan(_5558)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5558, float3(0.0), isnan(_5558)), level(0.0)).xyzw;
    float _2095 = _2093.x;
    float _2097 = _2093.y;
    float _2099 = _2093.z;
    float _2101 = _2093.w;
    float _2103 = -_2070;
    float _2105 = fma(_2088, _2103, 1.0);
    float2 _5580 = float2(_2105, _2072);
    float3 _2109 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5580, float2(0.0), isnan(_5580)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5580, float2(0.0), isnan(_5580)), level(0.0)).xyz;
    float _2111 = _2109.x;
    float _2113 = _2109.y;
    float _2115 = _2109.z;
    float _2117 = _1984 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2119 = _1994 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2121 = fma(_1998, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2119);
    float _2123 = exp2(_2117);
    float _2125 = _2036 * 0.5;
    float _2127 = fma(_1976, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2121);
    float _2129 = fma(_2068, -0.5, _2125);
    float _2131 = _2066 + _2036;
    float _2133 = fma(_2014, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2127);
    float _2135 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2137 = _2131 * 0.5;
    float _2139 = _2133 + _2036;
    out.gl_Position.x = _2066;
    out.gl_Position.y = _2068;
    out.gl_Position.z = _2133;
    out.gl_Position.w = _2036;
    float _2141 = _2139 * 0.5;
    float _2143 = -_2123;
    float _2145 = _2143 + 1.0;
    out.m_47.x = _2135;
    float _2147 = _2145 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_71.x = _2137;
    out.m_71.y = _2129;
    out.m_71.z = _2141;
    out.m_71.w = _2036;
    float _2149 = -_2147;
    float _2151 = _2149 + 1.0;
    float _2153 = _2147 * _2090;
    float _2155 = _2101 * _2153;
    float _2157 = _2115 * _2153;
    float _2159 = fma(_2111, _2155, _2095);
    float _2161 = fma(_2113, _2155, _2097);
    float _2163 = _2101 * _2151;
    float _2165 = fma(_2101, _2157, _2099);
    out.m_73.x = _2159;
    out.m_73.y = _2161;
    out.m_73.z = _2165;
    out.m_73.w = _2163;
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
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1734 = false;
    bool _518 = false;
    bool _376 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _87 = in.m_44.w;
    float _89 = trunc(_87);
    int _92 = int(_89);
    bool _96 = _92 >= 1;
    float _98 = 0.0;
    if (!_96)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _100 = _98;
    float _102 = _100;
    if (!_96)
    {
        out.m_47.x = 0.0;
    }
    int _104 = 0;
    if (!_96)
    {
        float _106 = _100 * 5.0;
        _104 = as_type<int>(_106);
    }
    int _108 = _104;
    int _110 = _108;
    if (!_96)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2222 = as_type<float>(_108);
        out.gl_Position.z = _2222;
    }
    if (!_96)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _112 = in.m_49.w;
    bool _114 = _112 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _116 = isnan(_112);
    bool _118 = _114 || _116;
    bool _120 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _122 = _118 || _120;
    float _124 = -_112;
    float _126 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_122)
    {
        float _128 = float(_92);
        _102 = _128;
    }
    float _130 = _102;
    bool _132 = _126 >= _130;
    bool _134 = !_122;
    bool _136 = _132 || _134;
    float _138 = _130;
    if (_136)
    {
        _138 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _138;
    if (_136)
    {
        out.m_47.x = 0.0;
    }
    if (_136)
    {
        float _142 = _140 * 5.0;
        _110 = as_type<int>(_142);
    }
    int _144 = _110;
    if (_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2291 = as_type<float>(_144);
        out.gl_Position.z = _2291;
    }
    if (_136)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _146 = in.m_51.x;
    float _148 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _150 = _126 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    bool _152 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _154 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _156 = _152 || _154;
    bool _158 = isnan(1.0);
    bool _160 = _156 || _158;
    int _162 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _164 = _162 != 0;
    float _166 = _150 * _148;
    float _168 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[20].x, _166);
    float _170 = in.m_49.x;
    float _172 = in.m_49.y;
    float _174 = in.m_49.z;
    float _176 = _168 * 6.283185482025146484375;
    float _178 = floor(_168);
    float _180 = _176 * 0.15915493667125701904296875;
    float _182 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _184 = 0.0;
    float _186 = _182;
    float _188 = _146;
    if (!_160)
    {
        float _190 = _182 * _182;
        float _192 = _190 * 0.5;
        _184 = _192;
    }
    float _194 = _184;
    float _196 = _180 * 6.283185482025146484375;
    float _198 = cos(_196);
    float _200 = _194;
    if (!_160)
    {
        float _202 = _194 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _200 = _202;
    }
    float _204 = _200;
    float _206 = -_178;
    float _208 = _168 + _206;
    bool _210 = !_160;
    float _212 = _204;
    if (!_210)
    {
        float _214 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _216 = log2(_214);
        float _218 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _220 = _218 + 1.0;
        float _222 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _224 = _182 * _216;
        float _226 = 1.0 / _220;
        float _228 = _222 * 0.693147182464599609375;
        float _230 = exp2(_224);
        float _232 = 1.0 / _228;
        float _234 = _230 + (-1.0);
        float _236 = -_234;
        float _238 = fma(_236, _232, _182);
        float _240 = _238 * _226;
        float _242 = _240 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _212 = _242;
    }
    float _244 = _212;
    bool _246 = !_160;
    if (!_246)
    {
        float _248 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _250 = log2(_248);
        float _252 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _254 = _252 + 1.0;
        float _256 = 1.0 / _254;
        float _258 = _182 * _250;
        float _260 = exp2(_258);
        float _262 = -_260;
        float _264 = _262 + 1.0;
        float _266 = _264 * _256;
        _186 = _266;
    }
    float _268 = _186;
    float _270 = in.m_53.w;
    int _272 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _274 = _272 != 0;
    int _276 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _278 = _276 != 0;
    float _280 = -_208;
    float _282 = fma(_280, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _284 = _208 < 0.5;
    float _286 = float(_284);
    float _288 = fma(_198, 0.5, 0.5);
    float _290 = in.m_44.x;
    float _292 = in.m_44.y;
    float _294 = in.m_44.z;
    bool _296 = !_274;
    int _298 = _296 ? 0 : 1;
    float _300 = _244 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _302 = -_286;
    float _304 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _306 = !_164;
    int _308 = _306 ? 0 : 1;
    float _310 = -_288;
    float _312 = fma(_310, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _314 = abs(_298);
    float _316 = fma(_268, _170, _300);
    int _318 = abs(_308);
    float _320 = _244 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _322 = !_278;
    int _324 = _322 ? 0 : 1;
    float _326 = fma(_268, _172, _320);
    bool _328 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _330 = abs(_324);
    float _332 = _244 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _334 = float(_314);
    float _336 = float(_318);
    float _338 = fma(_268, _174, _332);
    float _340 = abs(_282);
    float _342 = _334 * _340;
    float _344 = fma(_316, _270, _290);
    float _346 = float(_330);
    float _348 = fma(_336, _312, _342);
    float _350 = fma(_326, _270, _292);
    float _352 = fma(_338, _270, _294);
    float _354 = abs(_304);
    float _356 = fma(_346, _354, _348);
    bool _358 = !_328;
    float _374;
    if (!_358)
    {
        float _360 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _362 = _146 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _364 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[12].x, _126);
        float _366 = _364 * _360;
        float _368 = floor(_366);
        float _370 = -_368;
        float _372 = _366 + _370;
        _374 = _372;
        _376 = true;
    }
    else
    {
        float _378 = float(_92);
        float _380 = 1.0 / _378;
        float _382 = _126 * _380;
        _374 = _382;
    }
    _376 = false;
    float _384 = _374;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _388 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _386;
    float _390 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _392 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _394 = _384 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _396 = isnan(_384);
    bool _398 = _394 || _396;
    bool _400 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _402 = _398 || _400;
    float _404 = float(_402);
    float _406 = 1.0 / _388;
    float _408 = _390 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _410 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _414 = _384 + _412;
    float _416 = _392 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _418 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _420 = _410 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _422 = -_404;
    float _424 = _422 + 1.0;
    bool _426 = _384 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _428 = isnan(_384);
    bool _430 = _426 || _428;
    bool _432 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _434 = _430 || _432;
    float _436 = float(_434);
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _440 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _438;
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _444 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _442;
    out.m_55.x = _408;
    out.m_55.y = _420;
    out.m_55.z = _416;
    out.m_55.w = _418;
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _448 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _446;
    float _450 = _414 * _406;
    float _452 = _436 * _424;
    float _454 = in.m_53.x;
    float _456 = in.m_53.y;
    float _458 = in.m_53.z;
    bool _460 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _462 = fma(_440, _450, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _464 = fma(_444, _450, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _466 = fma(_448, _450, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _468 = -_436;
    float _470 = _468 + 1.0;
    float _472 = _462 * _452;
    float _474 = _464 * _452;
    float _476 = _466 * _452;
    float _478 = fma(_470, (*spvDescriptorSet0.vp_c9)._m0[143].x, _472);
    float _480 = fma(_470, (*spvDescriptorSet0.vp_c9)._m0[143].y, _474);
    float _482 = fma(_470, (*spvDescriptorSet0.vp_c9)._m0[143].z, _476);
    float _484 = fma(_404, (*spvDescriptorSet0.vp_c9)._m0[144].x, _478);
    float _486 = fma(_404, (*spvDescriptorSet0.vp_c9)._m0[144].y, _480);
    float _488 = fma(_404, (*spvDescriptorSet0.vp_c9)._m0[144].z, _482);
    float _490 = _484 * _454;
    float _492 = _486 * _456;
    float _494 = _488 * _458;
    bool _496 = !_460;
    bool _498 = _460;
    int _500 = as_type<int>(_458);
    float _516;
    if (!_496)
    {
        float _502 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _504 = _146 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _506 = fma(_504, (*spvDescriptorSet0.vp_c9)._m0[11].z, _126);
        float _508 = _506 * _502;
        float _510 = floor(_508);
        float _512 = -_510;
        float _514 = _508 + _512;
        _516 = _514;
        _518 = true;
    }
    else
    {
        float _520 = float(_92);
        float _522 = 1.0 / _520;
        float _524 = _126 * _522;
        _516 = _524;
    }
    _518 = false;
    float _526 = _516;
    float _528 = in.m_57.x;
    float _530 = _356 * _494;
    float _532 = _356 * _490;
    float _534 = in.m_51.w;
    int _536 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _538 = _536 != 0;
    float _540 = _356 * _492;
    int _542 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _544 = _542 != 0;
    float _546 = in.m_57.y;
    int _548 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _550 = _548 != 0;
    float _552 = _350 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _554 = in.m_51.z;
    float _556 = fma(_344, (*spvDescriptorSet0.vp_c10)._m0[6].x, _552);
    float _558 = in.m_51.y;
    float _560 = _532 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    if (_538)
    {
        bool _562 = _146 > 0.5;
        _498 = _562;
    }
    bool _564 = _498;
    float _566 = in.m_59.x;
    float _568 = in.m_59.y;
    float _570 = in.m_59.z;
    float _572 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _574 = _530 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _576 = _528;
    if (_538)
    {
        float _578 = -_528;
        float _580 = _578 + 1.0;
        _500 = as_type<int>(_580);
    }
    int _582 = _500;
    float _584 = 0.0;
    if (!_538)
    {
        _584 = _528;
    }
    float _586 = _584;
    float _588 = _540 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _590 = _534 > 0.5;
    float _592 = _586;
    if (_538)
    {
        float _594 = _564 ? as_type<float>(_582) : _528;
        _592 = _594;
    }
    float _596 = _592;
    float _598 = -_546;
    float _600 = _598 + 1.0;
    float _602 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _604 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _602;
    float _606 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _608 = _606 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _610 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _612 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _610;
    bool _614 = _554 > 0.5;
    float _616 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _618 = _616 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    int _620 = _590 ? as_type<int>(_600) : as_type<int>(_546);
    float _622 = 1.0 / _604;
    bool _624 = _558 > 0.5;
    float _626 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _628 = _614 ? as_type<int>(_600) : as_type<int>(_546);
    float _630 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _566);
    int _632 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _634 = _632 != 0;
    int _636 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _638 = _636 != 0;
    int _640 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _642 = _640 != 0;
    float _644 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _646 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _644;
    int _648 = _624 ? as_type<int>(_600) : as_type<int>(_546);
    float _650 = 1.0 / _608;
    float _652 = _550 ? as_type<float>(_628) : _546;
    float _654 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _568);
    float _656 = _638 ? as_type<float>(_620) : _546;
    float _658 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _570);
    float _660 = _634 ? as_type<float>(_648) : _546;
    float _662 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _664 = _662 + (*spvDescriptorSet0.vp_c9)._m0[129].w;
    int _666 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _668 = _666 != 0;
    float _670 = _560 * _630;
    int _672 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _674 = _672 != 0;
    float _676 = _350 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _678 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _680 = _678 != 0;
    float _682 = _350 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _684 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _686 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _684;
    float _688 = fma(_344, (*spvDescriptorSet0.vp_c10)._m0[4].x, _676);
    float _690 = _146 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _692 = fma(_344, (*spvDescriptorSet0.vp_c10)._m0[5].x, _682);
    float _694 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _696 = _694 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _698 = fma(_352, (*spvDescriptorSet0.vp_c10)._m0[4].z, _688);
    float _700 = 1.0 / _686;
    float _702 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _704 = _526 + _702;
    float _706 = -_572;
    float _708 = fma(_690, 2.0, _706);
    float _710 = _574 * _658;
    float _712 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _714 = _526 + _712;
    float _716 = _588 * _654;
    float _718 = _558 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _720 = 1.0 / _696;
    float _722 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _724 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _722;
    float _726 = _714 * _650;
    float _728 = fma(_718, -2.0, _626);
    float _730 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _732 = _730 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _734 = 1.0 / _646;
    float _736 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _738 = _526 + _736;
    float _740 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _742 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _740;
    float _744 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _746 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _744;
    float _748 = _738 * _622;
    float _750 = _642 ? as_type<float>(_628) : _546;
    float _752 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _754 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _752;
    float _756 = _704 * _720;
    float _758 = 1.0 / _664;
    float _760 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _762 = _526 + _760;
    float _764 = fma(_612, _748, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _766 = fma(_724, _748, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _768 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _770 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _768;
    float _772 = _762 * _700;
    float _774 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _776 = _526 + _774;
    float _778 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _780 = _526 + _778;
    float _782 = fma(_770, _748, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _784 = _776 * _734;
    float _786 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _788 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _790 = _788 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _792 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _794 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _792;
    float _796 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _798 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _796;
    float _800 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _802 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _800;
    float _804 = _780 * _758;
    float _806 = fma(_618, _726, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _808 = fma(_732, _726, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _810 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _812 = fma(_790, _726, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _814 = fma(_794, _772, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _816 = fma(_742, _772, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _818 = fma(_798, _772, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _820 = fma(_802, _784, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    float _822 = fma(_746, _784, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    float _824 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _826 = _824 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _828 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _830 = _828 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _832 = fma(_754, _784, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    bool _834 = _526 >= (*spvDescriptorSet0.vp_c9)._m0[129].w;
    bool _836 = isnan(_526);
    bool _838 = _834 || _836;
    bool _840 = isnan((*spvDescriptorSet0.vp_c9)._m0[129].w);
    bool _842 = _838 || _840;
    float _844 = float(_842);
    float _846 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _848 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _850 = _848 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _852 = -(*spvDescriptorSet0.vp_c9)._m0[128].x;
    float _854 = _852 + (*spvDescriptorSet0.vp_c9)._m0[129].x;
    float _856 = -(*spvDescriptorSet0.vp_c9)._m0[128].y;
    float _858 = _856 + (*spvDescriptorSet0.vp_c9)._m0[129].y;
    float _860 = fma(_352, (*spvDescriptorSet0.vp_c10)._m0[5].z, _692);
    bool _862 = _526 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _864 = isnan(_526);
    bool _866 = _862 || _864;
    bool _868 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _870 = _866 || _868;
    float _872 = float(_870);
    float _874 = -(*spvDescriptorSet0.vp_c9)._m0[128].z;
    float _876 = _874 + (*spvDescriptorSet0.vp_c9)._m0[129].z;
    float _878 = fma(_352, (*spvDescriptorSet0.vp_c10)._m0[6].z, _556);
    float _880 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _882 = fma(_826, _756, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _884 = fma(_830, _756, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _886 = fma(_850, _756, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _888 = -_844;
    float _890 = _888 + 1.0;
    float _892 = fma(_854, _804, (*spvDescriptorSet0.vp_c9)._m0[128].x);
    float _894 = fma(_858, _804, (*spvDescriptorSet0.vp_c9)._m0[128].y);
    float _896 = fma(_876, _804, (*spvDescriptorSet0.vp_c9)._m0[128].z);
    bool _898 = _526 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _900 = isnan(_526);
    bool _902 = _898 || _900;
    bool _904 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _906 = _902 || _904;
    float _908 = float(_906);
    float _910 = -_872;
    float _912 = _910 + 1.0;
    bool _914 = _526 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _916 = isnan(_526);
    bool _918 = _914 || _916;
    bool _920 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _922 = _918 || _920;
    float _924 = float(_922);
    float _926 = _872 * _890;
    float _928 = _786 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _930 = _810 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _932 = _908 * _912;
    float _934 = -_908;
    float _936 = _934 + 1.0;
    bool _938 = _526 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _940 = isnan(_526);
    bool _942 = _938 || _940;
    bool _944 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _946 = _942 || _944;
    float _948 = float(_946);
    float _950 = -_924;
    float _952 = _950 + 1.0;
    float _954 = _846 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _956 = _924 * _936;
    bool _958 = _526 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _960 = isnan(_526);
    bool _962 = _958 || _960;
    bool _964 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _966 = _962 || _964;
    float _968 = float(_966);
    float _970 = _880 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _972 = _948 * _952;
    float _974 = -_948;
    float _976 = _974 + 1.0;
    bool _978 = _526 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _980 = isnan(_526);
    bool _982 = _978 || _980;
    bool _984 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _986 = _982 || _984;
    float _988 = float(_986);
    float _990 = fma(_750, _970, -0.5);
    float _992 = _716 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _994 = _968 * _976;
    float _996 = -_968;
    float _998 = _996 + 1.0;
    float _1000 = _716 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1002 = _716 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1004 = fma(_652, _954, -0.5);
    float _1006 = _988 * _998;
    float _1008 = fma(_670, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1000);
    float _1010 = fma(_670, (*spvDescriptorSet0.vp_c8)._m0[25].x, _992);
    float _1012 = fma(_670, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1002);
    float _1014 = fma(_660, _928, -0.5);
    float _1016 = fma(_656, _930, -0.5);
    float _1018 = _764 * _1006;
    float _1020 = _782 * _1006;
    float _1022 = fma(_710, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1008);
    float _1024 = fma(_710, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1010);
    float _1026 = fma(_710, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1012);
    float _1028 = -_988;
    float _1030 = _1028 + 1.0;
    float _1032 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1034 = as_type<int>(_880);
    float _1036 = _766;
    float _1038 = _670;
    float _1040 = _1008;
    int _1042 = as_type<int>(_1020);
    float _1044 = _1006;
    float _1046 = _882;
    float _1048 = _932;
    float _1050 = _1004;
    if (_544)
    {
        float _1052 = -_528;
        float _1054 = _1052 + 1.0;
        _1034 = as_type<int>(_1054);
    }
    int _1056 = _1034;
    int _1058 = 0;
    int _1060 = _1056;
    if (_668)
    {
        float _1062 = -_528;
        float _1064 = _1062 + 1.0;
        _1058 = as_type<int>(_1064);
    }
    int _1066 = _1058;
    float _1068 = _766 * _1006;
    float _1070 = _1068;
    if (!_544)
    {
        _1036 = _528;
    }
    float _1072 = _1036;
    float _1074 = fma(_1030, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1018);
    float _1076 = _1072;
    if (!_668)
    {
        _1038 = _528;
    }
    float _1078 = _1038;
    float _1080 = fma(_1030, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1068);
    float _1082 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1084 = _1078;
    if (_544)
    {
        float _1086 = _614 ? as_type<float>(_1056) : _528;
        _1076 = _1086;
    }
    float _1088 = _1076;
    if (_674)
    {
        float _1090 = -_528;
        float _1092 = _1090 + 1.0;
        _1060 = as_type<int>(_1092);
    }
    int _1094 = _1060;
    int _1096 = _1094;
    if (_668)
    {
        float _1098 = _624 ? as_type<float>(_1066) : _528;
        _1084 = _1098;
    }
    float _1100 = _1084;
    float _1102 = fma(_1030, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1020);
    if (!_674)
    {
        _1040 = _528;
    }
    float _1104 = _1040;
    float _1106 = _1104;
    if (_674)
    {
        float _1108 = _624 ? as_type<float>(_1094) : _528;
        _1106 = _1108;
    }
    float _1110 = _1106;
    float _1112 = (*spvDescriptorSet0.vp_c9)._m0[94].z + (*spvDescriptorSet0.vp_c9)._m0[94].y;
    if (_680)
    {
        _1096 = 0;
    }
    int _1114 = _1096;
    int _1116 = _1114;
    if (_680)
    {
        _1042 = 0;
    }
    int _1118 = _1042;
    int _1120 = _1118;
    if (_680)
    {
        _1044 = _146;
    }
    float _1122 = _1044;
    float _1124 = _1122;
    if (_680)
    {
        _1070 = _558;
    }
    float _1126 = _1070;
    float _1128 = _1126;
    if (_680)
    {
        _576 = _554;
    }
    float _1130 = _576;
    float _1132 = _1130;
    if (!_680)
    {
        float _1134 = _146 * 3.1415927410125732421875;
        float _1136 = _1134 * 0.15915493667125701904296875;
        float _1138 = _558 * 3.1415927410125732421875;
        float _1140 = _1138 * 0.15915493667125701904296875;
        float _1142 = _554 * 3.1415927410125732421875;
        float _1144 = _1136 * 6.283185482025146484375;
        float _1146 = sin(_1144);
        float _1148 = _1142 * 0.15915493667125701904296875;
        float _1150 = _1140 * 6.283185482025146484375;
        float _1152 = sin(_1150);
        float _1154 = _1148 * 6.283185482025146484375;
        float _1156 = sin(_1154);
        _1116 = 1;
        _1120 = 2;
        _1132 = _1156;
        _1124 = _1146;
        _1128 = _1152;
    }
    int _1158 = _1116;
    int _1160 = _1120;
    float _1162 = _1132;
    float _1164 = _1124;
    float _1166 = _1128;
    bool _1168 = _1158 != 1;
    float _1170 = fma(_806, _994, _1074);
    bool _1172 = _1160 != 2;
    float _1174 = _1032 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1176 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _1178 = fma(_1162, (*spvDescriptorSet0.vp_c9)._m0[94].z, _1112);
    float _1180 = fma(_808, _994, _1080);
    float _1182 = fma(_1174, _596, -0.5);
    float _1184 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _1186 = _1082 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1188 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _1190 = fma(_554, (*spvDescriptorSet0.vp_c9)._m0[79].z, _1184);
    float _1192 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _1194 = fma(_1164, (*spvDescriptorSet0.vp_c9)._m0[93].z, _1188);
    float _1196 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[79].x, _1190);
    float _1198 = _1164 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _1200 = fma(_812, _994, _1102);
    float _1202 = fma(_1166, (*spvDescriptorSet0.vp_c9)._m0[93].w, _1192);
    float _1204 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1206 = _1176 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _1208 = _1166 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _1210 = _1196 * (-0.15915493667125701904296875);
    float _1212 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _1214 = fma(_1186, _1088, -0.5);
    float _1216 = fma(_1206, _1110, -0.5);
    float _1218 = _1210 * 6.283185482025146484375;
    float _1220 = sin(_1218);
    float _1222 = fma(_1208, -2.0, _1212);
    float _1224 = _1024 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1226 = fma(_814, _972, _1170);
    float _1228 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _1230 = fma(_818, _972, _1200);
    float _1232 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[94].x, _1178);
    float _1234 = _1210 * 6.283185482025146484375;
    float _1236 = cos(_1234);
    float _1238 = -_1228;
    float _1240 = fma(_1198, 2.0, _1238);
    float _1242 = _1204 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1244 = _698 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1246 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1248 = _1022 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1250 = fma(_1242, _1100, -0.5);
    float _1252 = fma(_816, _972, _1180);
    float _1254 = _1220 * _1014;
    float _1256 = fma(_882, _956, _1226);
    float _1258 = _1232 * (-0.15915493667125701904296875);
    float _1260 = fma(_886, _956, _1230);
    float _1262 = fma(_884, _956, _1252);
    float _1264 = -_126;
    float _1266 = fma(_1264, (*spvDescriptorSet0.vp_c9)._m0[76].x, _708);
    float _1268 = _1258 * 6.283185482025146484375;
    float _1270 = sin(_1268);
    float _1272 = _1236 * _1014;
    float _1274 = -_1254;
    float _1276 = fma(_1236, _1182, _1274);
    float _1278 = fma(_820, _932, _1256);
    float _1280 = fma(_1220, _1182, _1272);
    float _1282 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1284 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1246);
    float _1286 = _1258 * 6.283185482025146484375;
    float _1288 = cos(_1286);
    float _1290 = fma(_558, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1282);
    float _1292 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1284);
    float _1294 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[76].y, _728);
    float _1296 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1298 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1290);
    float _1300 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1302 = fma(_822, _932, _1262);
    float _1304 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1296);
    float _1306 = -_1294;
    float _1308 = fma(_1298, _1280, _1306);
    float _1310 = _1298;
    float _1312 = _1292;
    float _1314 = _1256;
    float _1316 = _1270;
    if (!_1168)
    {
        _1310 = _146;
    }
    float _1318 = _1310;
    float _1320 = fma(_832, _932, _1260);
    float _1322 = fma(_558, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1300);
    float _1324 = fma(_892, _926, _1278);
    float _1326 = _1318;
    float _1328 = _1320;
    if (!_1168)
    {
        _1046 = _1318;
    }
    float _1330 = _1046;
    float _1332 = fma(_894, _926, _1302);
    float _1334 = _1330;
    if (_1168)
    {
        _1326 = _146;
    }
    float _1336 = _1326;
    float _1338 = fma(_896, _926, _1320);
    if (!_1168)
    {
        _188 = _558;
    }
    float _1340 = _188;
    float _1342 = _878 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1344 = _1026 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1346 = _1340;
    if (!_1168)
    {
        _1048 = _1340;
    }
    float _1348 = _1048;
    float _1350 = _1288 * _1004;
    float _1352 = _1348;
    if (_1168)
    {
        _1346 = _558;
    }
    float _1354 = _1346;
    float _1356 = _1270 * _1004;
    float _1358 = fma(_1292, _1276, _1266);
    if (!_1168)
    {
        _1050 = _1348;
    }
    float _1360 = _1050;
    float _1362 = -_1356;
    float _1364 = fma(_1288, _1216, _1362);
    float _1366 = _1360;
    if (_1168)
    {
        _1334 = _554;
    }
    float _1368 = _1334;
    float _1370 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    float _1372 = _1368;
    if (_1168)
    {
        _1352 = _1336;
    }
    float _1374 = _1352;
    float _1376 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    if (!_1168)
    {
        _1312 = _554;
    }
    float _1378 = _1312;
    float _1380 = _1244 + _1248;
    float _1382 = _1342 + _1344;
    float _1384 = fma(_1368, (*spvDescriptorSet0.vp_c9)._m0[84].z, _1370);
    float _1386 = _1378;
    float _1388 = _1380;
    float _1390 = _1382;
    if (!_1168)
    {
        _1314 = _1378;
    }
    float _1392 = _1314;
    float _1394 = fma(_1374, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1376);
    float _1396 = _1392;
    if (_1168)
    {
        _1386 = _1354;
    }
    float _1398 = _1386;
    float _1400 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1402 = _1380 + _1400;
    float _1404 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1406 = _1382 + _1404;
    float _1408 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1410 = fma(_1270, _1216, _1350);
    if (_1172)
    {
        _1316 = _1354;
    }
    float _1412 = _1316;
    float _1414 = _1402 * _1402;
    float _1416 = _1412;
    float _1418 = _1414;
    if (_1168)
    {
        _1366 = _1336;
    }
    float _1420 = _1366;
    float _1422 = fma(_1398, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1408);
    if (!_1172)
    {
        _1416 = _1336;
    }
    float _1424 = _1416;
    float _1426 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[92].w, _1202);
    if (_1172)
    {
        _1372 = _1336;
    }
    float _1428 = _1372;
    float _1430 = _1406 * _1406;
    float _1432 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[91].y, _1222);
    float _1434 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[92].z, _1194);
    float _1436 = -_126;
    float _1438 = fma(_1436, (*spvDescriptorSet0.vp_c9)._m0[91].x, _1240);
    float _1440 = _1428;
    float _1442 = _1430;
    if (_1172)
    {
        _1328 = _554;
    }
    float _1444 = _1328;
    float _1446 = _1414 + _1430;
    float _1448 = _1444;
    if (_1168)
    {
        _1396 = _1354;
    }
    float _1450 = _1396;
    float _1452 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[84].x, _1384);
    if (!_1172)
    {
        _1448 = _1354;
    }
    float _1454 = _1448;
    float _1456 = -_1432;
    float _1458 = fma(_1426, _1410, _1456);
    if (!_1172)
    {
        _1440 = _554;
    }
    float _1460 = _1440;
    float _1462 = fma(_1434, _1364, _1438);
    float _1464 = sqrt(_1446);
    float _1466 = fma(_844, (*spvDescriptorSet0.vp_c9)._m0[129].y, _1332);
    float _1468 = fma(_844, (*spvDescriptorSet0.vp_c9)._m0[129].x, _1324);
    float _1470 = _1452 * (-0.15915493667125701904296875);
    float _1472 = (*spvDescriptorSet0.vp_c9)._m0[89].z + (*spvDescriptorSet0.vp_c9)._m0[89].y;
    float _1474 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1476 = _1420 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1478 = fma(_1454, (*spvDescriptorSet0.vp_c9)._m0[89].z, _1472);
    float _1480 = -_1474;
    float _1482 = fma(_1476, 2.0, _1480);
    float _1484 = _1450 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1486 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1488 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[89].x, _1478);
    float _1490 = _1460 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1492 = fma(_1484, -2.0, _1486);
    float _1494 = _1470 * 6.283185482025146484375;
    float _1496 = sin(_1494);
    float _1498 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1500 = _1488 * (-0.15915493667125701904296875);
    bool _1502 = _1464 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1504 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1506 = _1424 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1508 = -_1498;
    float _1510 = fma(_1490, 2.0, _1508);
    float _1512 = _860 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1514 = _1470 * 6.283185482025146484375;
    float _1516 = cos(_1514);
    float _1518 = fma(_1506, -2.0, _1504);
    float _1520 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1492);
    float _1522 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1304);
    float _1524 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1322);
    float _1526 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1394);
    float _1528 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1422);
    float _1530 = _1500 * 6.283185482025146484375;
    float _1532 = sin(_1530);
    float _1534 = -_126;
    float _1536 = fma(_1534, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1482);
    float _1538 = -_126;
    float _1540 = fma(_1538, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1510);
    float _1542 = _1496 * _1016;
    float _1544 = _1512 + _1224;
    float _1546 = fma(_844, (*spvDescriptorSet0.vp_c9)._m0[129].z, _1338);
    float _1548 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1518);
    float _1550 = _1500 * 6.283185482025146484375;
    float _1552 = cos(_1550);
    float _1554 = _1516 * _1016;
    bool _1556 = !_1502;
    float _1558 = _1544;
    float _1560 = _1462;
    if (!_1556)
    {
        float _1562 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1564 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1566 = _1464 + _1564;
        float _1568 = _1544 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1570 = rsqrt(_1446);
        float _1572 = _1566 * _1562;
        float _1574 = _1572 * 0.15915493667125701904296875;
        float _1576 = _1574 * 6.283185482025146484375;
        float _1578 = sin(_1576);
        float _1580 = _1574 * 6.283185482025146484375;
        float _1582 = cos(_1580);
        float _1584 = fma(_1578, _1568, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1586 = _1570 * _1584;
        float _1588 = _1582 + (-1.0);
        float _1590 = fma(_1402, _1586, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1592 = fma(_1406, _1586, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1594 = _1588 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1596 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1598 = _1590 + _1596;
        float _1600 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1602 = _1592 + _1600;
        float _1604 = fma(_1544, _1582, _1594);
        float _1606 = _1598 * _1598;
        float _1608 = _1602 * _1602;
        _1558 = _1604;
        _1418 = _1606;
        _1442 = _1608;
        _1388 = _1590;
        _1390 = _1592;
    }
    float _1610 = _1558;
    float _1612 = _1418;
    float _1614 = _1442;
    float _1616 = _1388;
    float _1618 = _1390;
    float _1620 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1622 = _1610 + _1620;
    float _1624 = _1532 * _990;
    float _1626 = _1552 * _990;
    float _1628 = -_1542;
    float _1630 = fma(_1516, _1214, _1628);
    float _1632 = fma(_1622, _1622, _1612);
    float _1634 = fma(_1496, _1214, _1554);
    float _1636 = fma(_1532, _1250, _1626);
    float _1638 = -_1624;
    float _1640 = fma(_1552, _1250, _1638);
    float _1642 = _1632 + _1614;
    float _1644 = fma(_1526, _1630, _1536);
    float _1646 = -_1548;
    float _1648 = fma(_1524, _1636, _1646);
    float _1650 = -_1520;
    float _1652 = fma(_1528, _1634, _1650);
    float _1654 = fma(_1522, _1640, _1540);
    float _1656 = _1468 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1658 = sqrt(_1642);
    float _1660 = _1466 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1662 = _1546 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1664 = _1358 + 0.5;
    float _1666 = _1308 + 0.5;
    float _1668 = _1462 + 0.5;
    float _1670 = _1458 + 0.5;
    float _1672 = _1656 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1674 = _1660 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1676 = _1662 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1678 = _1644 + 0.5;
    float _1680 = _1652 + 0.5;
    float _1682 = _1654 + 0.5;
    float _1684 = _1648 + 0.5;
    out.m_61.x = 1.0;
    out.m_61.y = 1.0;
    out.m_61.z = 1.0;
    bool _1686 = _1658 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1688 = isnan(_1658);
    bool _1690 = _1686 || _1688;
    bool _1692 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1694 = _1690 || _1692;
    out.m_63.x = _1668;
    out.m_63.y = _1670;
    out.m_65.x = _1672;
    out.m_65.y = _1674;
    out.m_65.z = _1676;
    out.m_67.x = _1664;
    out.m_67.y = _1666;
    out.m_67.z = _1678;
    out.m_67.w = _1680;
    float _1696 = _1648;
    float _1698 = _1680;
    if (!_1694)
    {
        _1560 = 1.0;
    }
    float _1700 = _1560;
    out.m_69.x = _1682;
    out.m_69.y = _1684;
    bool _1702 = !_1694;
    float _1704 = _1700;
    if (!_1702)
    {
        bool _1706 = _1658 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1708 = isnan(_1658);
        bool _1710 = _1706 || _1708;
        bool _1712 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1714 = _1710 || _1712;
        if (!_1714)
        {
            float _1716 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1718 = _1658 + _1716;
            float _1720 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1722 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1720;
            float _1724 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1726 = _1724 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1728 = 1.0 / _1722;
            float _1730 = _1718 * _1728;
            float _1732 = fma(_1730, _1726, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1704 = _1732;
            _1734 = true;
        }
        else
        {
            bool _1736 = _1658 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1738 = isnan(_1658);
            bool _1740 = _1736 || _1738;
            bool _1742 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1744 = _1740 || _1742;
            if (!_1744)
            {
                float _1746 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1748 = _1658 + _1746;
                float _1750 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1752 = _1750 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1754 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1756 = _1754 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1758 = 1.0 / _1752;
                float _1760 = _1748 * _1758;
                float _1762 = fma(_1760, _1756, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1704 = _1762;
                _1734 = true;
            }
            else
            {
                _1704 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1734 = false;
    float _1764 = _1704;
    float _1766 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1768 = _1610 + _1766;
    float _1770 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1772 = _1616 + _1770;
    float _1774 = fma(_1768, _1764, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1776 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1778 = _1618 + _1776;
    float _1780 = fma(_1772, _1764, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1782 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1784 = _1774 + _1782;
    float _1786 = fma(_1778, _1764, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1788 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1790 = _1780 + _1788;
    float _1792 = _1784 * _1784;
    float _1794 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1796 = _1786 + _1794;
    float _1798 = fma(_1790, _1790, _1792);
    float _1800 = fma(_1796, _1796, _1798);
    float _1802 = rsqrt(_1800);
    float _1804 = _1802 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1806 = _1790 * _1804;
    float _1808 = _1796 * _1804;
    float _1810 = _1806 * _1806;
    float _1812 = _1808 * _1808;
    float _1814 = _1810 + _1812;
    float _1816 = sqrt(_1814);
    bool _1818 = _1816 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1820 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1822 = _1816 + _1820;
    float _1824 = _1796;
    float _1826 = _1814;
    float _1828 = _1822;
    float _1830 = _1784;
    float _1832 = _1806;
    if (_1818)
    {
        float _1834 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1824 = _1834;
    }
    float _1836 = _1824;
    if (_1818)
    {
        float _1838 = rsqrt(_1814);
        _1826 = _1838;
    }
    float _1840 = _1826;
    if (_1818)
    {
        float _1842 = _1822 * _1836;
        _1828 = _1842;
    }
    float _1844 = _1828;
    if (_1818)
    {
        float _1846 = _1844 * 0.15915493667125701904296875;
        _1696 = _1846;
    }
    float _1848 = _1696;
    float _1850 = _1802;
    if (_1818)
    {
        float _1852 = _1848 * 6.283185482025146484375;
        float _1854 = sin(_1852);
        _1850 = _1854;
    }
    float _1856 = _1850;
    float _1858 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1860 = precise::max(0.0, _1858);
    float _1862 = _1674;
    float _1864 = _1860;
    float _1866 = _1858;
    if (_1818)
    {
        float _1868 = _1848 * 6.283185482025146484375;
        float _1870 = cos(_1868);
        _1862 = _1870;
    }
    float _1872 = _1862;
    float _1874 = -_1804;
    float _1876 = -_1860;
    float _1878 = fma(_1784, _1874, _1876);
    if (!_1818)
    {
        _1864 = _1808;
    }
    float _1880 = _1864;
    float _1882 = _1880;
    if (_1818)
    {
        float _1884 = _1878 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1866 = _1884;
    }
    float _1886 = _1866;
    float _1888 = _1856;
    float _1890 = _1886;
    if (_1818)
    {
        float _1892 = fma(_1856, _1886, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1888 = _1892;
    }
    float _1894 = _1888;
    float _1896 = _1894;
    if (_1818)
    {
        float _1898 = _1872 + (-1.0);
        _1890 = _1898;
    }
    float _1900 = _1890;
    float _1902 = _1900;
    if (_1818)
    {
        float _1904 = _1840 * _1894;
        _1698 = _1904;
    }
    float _1906 = _1698;
    if (!_1818)
    {
        _1896 = _1878;
    }
    float _1908 = _1896;
    float _1910 = sqrt(_1800);
    float _1912 = _1908;
    if (_1818)
    {
        float _1914 = _1900 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1830 = _1914;
    }
    float _1916 = _1830;
    float _1918 = _1916;
    if (_1818)
    {
        float _1920 = _1806 * _1906;
        _1832 = _1920;
    }
    float _1922 = _1832;
    if (!_1818)
    {
        _1902 = _1810;
    }
    float _1924 = _1902;
    float _1926 = _1924;
    if (_1818)
    {
        float _1928 = _1808 * _1906;
        _1882 = _1928;
    }
    float _1930 = _1882;
    if (_1818)
    {
        float _1932 = fma(_1878, _1872, _1916);
        _1912 = _1932;
    }
    float _1934 = _1912;
    if (_1818)
    {
        float _1936 = _1922 * _1922;
        _1926 = _1936;
    }
    float _1938 = _1926;
    if (!_1818)
    {
        _1918 = _1812;
    }
    float _1940 = _1918;
    float _1942 = _1940;
    if (_1818)
    {
        float _1944 = _1930 * _1930;
        _1942 = _1944;
    }
    float _1946 = _1942;
    float _1948 = fma(_1934, _1934, _1938);
    float _1950 = _1774 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1952 = _1948 + _1946;
    float _1954 = fma(_1780, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1950);
    float _1956 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1958 = fma(_1910, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1956);
    float _1960 = precise::clamp(_1958, 0.0, 1.0);
    float _1962 = _1774 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1964 = rsqrt(_1952);
    float _1966 = fma(_1786, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1954);
    float _1968 = -_1960;
    float _1970 = _1968 + 1.0;
    float _1972 = _1774 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1974 = fma(_1780, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1962);
    float _1976 = _1966 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1978 = _1774 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1980 = fma(_1780, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1972);
    float _1982 = abs(_1970);
    float _1984 = log2(_1982);
    float _1986 = fma(_1786, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1974);
    float _1988 = fma(_1780, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1978);
    float _1990 = fma(_1786, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1980);
    float _1992 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1994 = _1986 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1996 = fma(_1786, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1988);
    float _1998 = _1990 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2000 = _1964 * _1922;
    float _2002 = _1994 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2004 = _1964 * _1934;
    float _2006 = _1976 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2008 = _2000 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2010 = fma(_1998, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2002);
    float _2012 = _1964 * _1930;
    float _2014 = _1996 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2016 = _1984 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2018 = -_2008;
    float _2020 = fma(_2004, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2018);
    float _2022 = fma(_1976, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2010);
    float _2024 = -_2006;
    float _2026 = fma(_2024, _1992, 1.0);
    float _2028 = _1994 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2030 = -_2012;
    float _2032 = fma(_2030, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2020);
    float _2034 = exp2(_2016);
    float _2036 = fma(_2014, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2022);
    float _2038 = _1994 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2040 = fma(_2032, -0.5, 0.5);
    float _2042 = fma(_1998, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2028);
    float _2044 = fma(_2032, 0.5, 0.5);
    float _2046 = fma(_1998, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2038);
    float _2048 = _2004 + 1.0;
    float _2050 = log2(_2026);
    float _2052 = fma(_1976, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2042);
    float _2054 = fma(_1976, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2046);
    float _2056 = fma(_2044, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2058 = fma(_2044, _2056, -0.212114393711090087890625);
    float _2060 = 1.0 / _2036;
    float _2062 = -_2004;
    float _2064 = fma(_2034, _2048, _2062);
    float _2066 = fma(_2014, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2054);
    float _2068 = fma(_2014, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2052);
    float _2070 = fma(_2044, _2058, 1.570728778839111328125);
    float _2072 = fma(_2064, 0.5, 0.5);
    float _2074 = sqrt(_2040);
    float _2076 = _2050 * 0.693147182464599609375;
    float _2078 = _2066 * _2060;
    float _2080 = _2068 * _2060;
    float _2082 = _2076 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2084 = fma(_2078, 0.5, 0.5);
    float _2086 = fma(_2080, -0.5, 0.5);
    float _2088 = _2074 * 0.636619746685028076171875;
    float3 _5547 = float3(_2084, _2086, _2082);
    float _2090 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5547, float3(0.0), isnan(_5547)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5547, float3(0.0), isnan(_5547)), level(0.0)).x;
    float3 _5558 = float3(_2084, _2086, _2082);
    float4 _2093 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5558, float3(0.0), isnan(_5558)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5558, float3(0.0), isnan(_5558)), level(0.0)).xyzw;
    float _2095 = _2093.x;
    float _2097 = _2093.y;
    float _2099 = _2093.z;
    float _2101 = _2093.w;
    float _2103 = -_2070;
    float _2105 = fma(_2088, _2103, 1.0);
    float2 _5580 = float2(_2105, _2072);
    float3 _2109 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5580, float2(0.0), isnan(_5580)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5580, float2(0.0), isnan(_5580)), level(0.0)).xyz;
    float _2111 = _2109.x;
    float _2113 = _2109.y;
    float _2115 = _2109.z;
    float _2117 = _1984 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2119 = _1994 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2121 = fma(_1998, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2119);
    float _2123 = exp2(_2117);
    float _2125 = _2036 * 0.5;
    float _2127 = fma(_1976, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2121);
    float _2129 = fma(_2068, -0.5, _2125);
    float _2131 = _2066 + _2036;
    float _2133 = fma(_2014, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2127);
    float _2135 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2137 = _2131 * 0.5;
    float _2139 = _2133 + _2036;
    out.gl_Position.x = _2066;
    out.gl_Position.y = _2068;
    out.gl_Position.z = _2133;
    out.gl_Position.w = _2036;
    float _2141 = _2139 * 0.5;
    float _2143 = -_2123;
    float _2145 = _2143 + 1.0;
    out.m_47.x = _2135;
    float _2147 = _2145 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_71.x = _2137;
    out.m_71.y = _2129;
    out.m_71.z = _2141;
    out.m_71.w = _2036;
    float _2149 = -_2147;
    float _2151 = _2149 + 1.0;
    float _2153 = _2147 * _2090;
    float _2155 = _2101 * _2153;
    float _2157 = _2115 * _2153;
    float _2159 = fma(_2111, _2155, _2095);
    float _2161 = fma(_2113, _2155, _2097);
    float _2163 = _2101 * _2151;
    float _2165 = fma(_2101, _2157, _2099);
    out.m_73.x = _2159;
    out.m_73.y = _2161;
    out.m_73.z = _2165;
    out.m_73.w = _2163;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

